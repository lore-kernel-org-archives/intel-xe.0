Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C7E9B258
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 12:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036B10E571;
	Tue, 24 Feb 2026 12:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAL0CPZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897DF10E571
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771937186; x=1803473186;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L1ZD5tfp/ZtfM63lQt0z1phEnPZr8IHJZeNeFlLXs5A=;
 b=jAL0CPZU2TtY3tZnTbxPbUuyJeY/68XCXi7HwVxa5/E/Fj57iitMhjrP
 gpc1MyFNctEHqNjbFClLApNwDgfxb/TlCE/iZvsc0+WIQYsVM6bUFGMo0
 87BaPHO3d7yBAJOvF59w3Nvw22M60j5OzPzaEMsaqPjP3H3SZaAYICRIs
 tbEtCdJY07Jo0wVG3efTcuBW1n9y4rm2etlDuyPImmRIahfrCD7U0Ap9d
 GUIvD3rIfnDDeyo2ghmju1qYfOviUFmGKDvievFt1fr1/BJd6XhKXBKCJ
 73u5gv2EzHoxHYR3qyTsFDn95AXz1f1CDacJG9gmFvUqDbzysuYYub8FW w==;
X-CSE-ConnectionGUID: rAVoVPyZTiGouU+oXkrrLQ==
X-CSE-MsgGUID: +EANFbwnQsiUfDiEfnu+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90530671"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90530671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:46:26 -0800
X-CSE-ConnectionGUID: c+fFgtYIScGpZpFV9LKgoA==
X-CSE-MsgGUID: 2bHKSKmYR4SoWvF79yH+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220479205"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:46:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:46:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 04:46:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:46:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN/pxkoQy6W1/EHPV4ZEU4qTUceKdaoq8VDI4T1DmdvagwbjtoOza+eX1QOE/FA5JbyeYn6kV/cEzBU3OxotCOKTfd0Gmk/CoWKxHt082kOQfTgNVkg2yfoA8X4+5S1qXc8cV52Q/v0VBnaMwilJPbNVGtHleJKxr6fV8sw+cyLXL9/BDaSodYqqv/spnTNDl5g1KClcNvZ03hcvcDTIlx5ceH3R/80uNr1n3Nv3NKtj2YX3DGxvfti2/Rzdskl2YCVeMwnvXV8DftBjuqxb9g2Cc6Lf0VEAH5QnNb2QHyX0rvwp7j8onLdQ1UedI4gr6SWF+u/Nj+RbafSU73VR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cXoS9RBtQMbjwQDQqtbjFrw3XVHdb3Jay7m7ilb7dE=;
 b=hjttEYPYf0jDVvn8tlTFtm5+UMXPgKB3pWLwDJq0VEt5kZi+S9U9q1LbENzRIe68ZYz/9tT2USuVylUvB7hCfOfcMraplKrKhTRFcyirpT34Y/ieiHp0VfZIRuhG9cHS8/thaXNUjugoV0+rJVhCFb2Ogq2IvrQsNmtGkfNZDqsQqSP0v9+6sGhIASnthvZPK/mlfyycK1cXAznn5hGCJdOLrkcANDt06Y8TP2hty+i14W/KOFVMsCrO29oGmOprlvKAEtQumrjpgGuHdsVF5iGjbIGmNZIlmctJsgT8rw4DpMPz+lhsrgEYHeim7GQXrOFEhnIMnJEfqtJWUz8L2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 12:46:18 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 12:46:17 +0000
Message-ID: <3448fde1-27d5-43ad-b994-b64e9f060a13@intel.com>
Date: Tue, 24 Feb 2026 18:16:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/xe/xe_pci_error: Process errors in mmio_enabled
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-18-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-18-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0225.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::14) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: fb96c970-428d-4c95-5ba8-08de73a2b3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUI0S3VoQyszLy9jME1wZ2EvNkx1NFBPem9HUXJMN0Yxbm1iMXFyVjJmdGcr?=
 =?utf-8?B?Q3N1bmg2MlRiY2ltbTNMNEtpQ1Q2YUhPL1krMDVlQ1RIUTVoemJKT2doMjhT?=
 =?utf-8?B?UmVna0RMNkZDb0RERmxRL3YyQnNsblZOSkRSeml0L3JEVGdEelJDWjd5RFJy?=
 =?utf-8?B?UnpMNjZkbWwzN1FRaVo4YUhIa1o3MENaQzg4eURyMms3d3o0MnFvV2JLN3JQ?=
 =?utf-8?B?U2VGN3hUVHhWWUpoLzlaTUFNdXdhS3Q3S1pPVUhKQ1BFOFh1NWhhWjVlZVQr?=
 =?utf-8?B?WDFoMC8vWnlJdExyaTd1TFdxTXZNQlVuUnhWSWJ6U1ZWY3ozQlQ4RzliQkhv?=
 =?utf-8?B?QXAwUGdlaHREMTVZUG9TRktFZ0JTU3RETjdLSnZMSG5WeVBKWSs1N3pRSFkv?=
 =?utf-8?B?UGhGUGxReVg0RWMwMFl0aWh2K29JTjN0Zkx6RFJCcmJvZHgzK0w0c2ZrQndC?=
 =?utf-8?B?aDdMWGF5T3ZkWFJUaFpuVHpYYVZxTEgxM1RvcUVPbGIzcDVZNDNQWmhNbEx3?=
 =?utf-8?B?WHV4dXcvbDhPcklTMHRac3huZnV6Q1VORnhQcHhaYjJLVW5oTUtMb1A0Qm04?=
 =?utf-8?B?UVN0UmV6K295VU56eDBqUW4wdEVsNkJMY1BVdGliZDArTHpIRnhxa01zZHNl?=
 =?utf-8?B?NE9jdWE1cDhtSVFYMlgzYUZyNEtkcFlaQjMzYXg1V2pkKzFPbTY5dU01cnY3?=
 =?utf-8?B?bFVWNnVMVXI3NkNEYjJBS0piTGFNWkhxRUs4MFU4OVJ3Uk9EOTQxVmhXN1FG?=
 =?utf-8?B?YnhvazdHSzRIaDVxZXZaVkdyMW52UDFWZGV0cEZDV2NFK0UvSlVvQVR1NEtS?=
 =?utf-8?B?THY4MTBTSHcxOGJUMm5yVzJoYThXVkJJeDFuaUVVVzNNc1pDNkI3L3M4VjdG?=
 =?utf-8?B?WnVrWi95NWdKQWJJbjF0QngyendRcUdzNXVBUzg1Y0tkSkVZUlZpL29sQ0hL?=
 =?utf-8?B?dm5kSTZPK2x0bXZhaGh0dm5lMTZZR0dnQWt5NXVOK3BCL1VUYmlwaXdjdG1W?=
 =?utf-8?B?VHpZTVlQcW1NM1R6YnJqb1l2Z0VWUDZEcmxiV1ZFUWxjQlorWFNiQlQwT05S?=
 =?utf-8?B?UGN5bVNuRmZyTmhMcFoySUh0dkw0QXEvQUx6cDFxYUVOVGtBRmZ6NXRFZmtT?=
 =?utf-8?B?UU9iWE9UUzdmdml6bWJhQkpQcnZkNE1GT2pzRU9OdTQ4WWhvcXpvR2NEZ0ht?=
 =?utf-8?B?SmFhVEpaaVk5M0lRUjJYWTFCQXdBUTRiVjYwMjdmeStnR2lxSXJxUjRieFVE?=
 =?utf-8?B?VUQ5bUo2VzExMXl5eEFtekNQQ1NtemN4NGgzWmRNWWhGbWRMMWJHLzB3clFw?=
 =?utf-8?B?cXlWdXgxcE1ha1VtZzRwN1lwNVB0NkQwNUNvNU5hd3M2d09aaSt0dGd6Z2Jh?=
 =?utf-8?B?RFdob3I2WUVaeVFaTzR4V3IzV3k5Y2Zid0lSZXFMbUN3L3NobWFCelBpcE0w?=
 =?utf-8?B?bW1sOGd6UzhEVWxsUVpXRXB6TTNGSno5MHFjWldjWEdWcGFDQmhGemg1WmdT?=
 =?utf-8?B?bVdNQjBWZmtSanVqckZ4QTdpaERUdVdlbDF1b2drT3BFQmJVM29xRFg1OC9C?=
 =?utf-8?B?dVZHSU1MdlNpU3VHbjlodFNIdmhsSCtOS0FVWEQvaDZBZ1FMQ2JsT21Yc0I2?=
 =?utf-8?B?elZwVjhwS2FXdlJ0dWltVE02WUpyeVpKQzJMdjdOK3pGRUFkeVd5SHhvQmhu?=
 =?utf-8?B?Uno0UzA2enhEdFU5WGVObUxVM01hWVFQTFBSdjVaOW1JQmFDUys5WVg4Ri9X?=
 =?utf-8?B?WUJsVVJWY2g2N0hNL3dsN2RGYkcvNVpvZ0c3dERRdDA0a1l1QmJSMjl3Wkxq?=
 =?utf-8?B?MHZlV2N0MFQ5aUJsMlk5WXNGL3VWTmxPYkhoaHJuVkhXeStNK2hnYWJKU2ZZ?=
 =?utf-8?B?WXZteEdMaW8wL3h3bjB1cjFuaktJY1pIUWI3S0VLUGxzd0dhVG9HbURocURE?=
 =?utf-8?B?WnFFc2tHbkdBRzFDd0xBbVB3U1graGVsbkRkQzJ3eVJJWSt6d0ErdVcvY2xO?=
 =?utf-8?B?SnA2OHpBLzcrTDJLcmFmNkkrMUpZYnUyd0RlSVJ0VitvcjVzRFQ4OW1RVkl0?=
 =?utf-8?B?bUdndFBLaGs1bFVPejJNQ3JtenE3UmsreDZrbjNmNlUvUVFmcnNDN1MzZlky?=
 =?utf-8?Q?qyMY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlkxUklHazlqMWF0K1NUNVFMV2ZpNERzZmhMYW55bG5VOFRTQWhpWCtMU3JO?=
 =?utf-8?B?TWxkdys1R3ZCYVJmWXY1NThlZ0RtcVN4Vi93UlpIN0JLOUptR0FXSDhuWmhS?=
 =?utf-8?B?Y0JJbXBTSUhKdkd3UHVsNk82ckZaamNJS3BDL3ZXRzMvdXJ1WFJhSkNLLzRL?=
 =?utf-8?B?NDIxa2xjL2IwZmhOZE1sTFlhdjRHTldONEVOL0VUVG00b2x3MFhvQUJ5cjgx?=
 =?utf-8?B?VmdVSTU0Yi9abVdpeDdCYlNHWGNEbWMzUnFRckVaOVhsQ1pNcTZuWDNnaytR?=
 =?utf-8?B?YzRHbUJpM1dVYTlvek9KbTJ2dUpkVWxLOHJQcDA2UkN4Vm53MVBJN2tKR3Zi?=
 =?utf-8?B?bXlHcmVDMUhHK2l2VGl1dVgzMUxjT0VIcVNOb0xWbjFRUWVVdHNadFd4RnFv?=
 =?utf-8?B?cmFHSEpzNzY5cUxvZ2liOThSWW5OMW5ZOTdDTlE2cDB5bnlaWS9mNE9yMXpD?=
 =?utf-8?B?aXhhQUlvbDNHaHJXNXkwZmgzbk9uUVFHOTNpbkkzbEZ5cW9qVTFFY1BsSnVn?=
 =?utf-8?B?QUQ2QlZXalNBblhVVGoyeFV3NEk5RitIK2ZsSUFtMFlYWWFuVVFnTWVFMDls?=
 =?utf-8?B?NUlpeWxtV2JhQnhOWkhuQUNaMTg0MG93Q2ZMcmpTaUd5ckNYbURoZVV2N2Rs?=
 =?utf-8?B?dDJLWUtFYlNuczEreGF2TTdMTEZBS0xmQ0EwMEluRHB5N2lOYm95TmMyVTlU?=
 =?utf-8?B?QkI5OVdwL21FOG1yQ0RNckVqb2ZlNTdkRElNa1hXdlJaTEYyTEtKRkZCV1hu?=
 =?utf-8?B?bU50NlJSeGN4T2tPRjd1dXUwcW5jbGRyOGpUSDFrVGE0Sm1pZkRHTGtlelBJ?=
 =?utf-8?B?c3htM09FVmdVdlRuMkQ3ZG45ZDVlWDJaNG9BU0YxNE8vbjNoSlJWT01Va1NB?=
 =?utf-8?B?SXYwOWFwdnU0RlVtU3l5bERIU2lxTUFLSGhhT0ttZlliZ1E3Y0hVTlpaZEdl?=
 =?utf-8?B?RDBDc3RyU0tBQWU1Y2ZKQ0l5VisyYmtLaUJrNFBhUG84TDJoVVNyS1hXVHp1?=
 =?utf-8?B?dkpoZDVIWTlRS0dhenhGWUlIZ2k1aUhrMS9ESEc2NDRVVENiTFpYS25CTGE5?=
 =?utf-8?B?Qkg3VmM4cytSYTQ5bDZrMVhNdmxyOUE2NUtiUXI4VTRkVEUxcm5scHJZQ0xH?=
 =?utf-8?B?QzRVL3RNN0lEdTBCT0RZeFg0T3IxY1Z1ZWdUbFowOUxpNmhqazVaeDcvY3Nu?=
 =?utf-8?B?UVFsVmJ0SjdpZGk3cWp0YmhZNktNSUFKaWp4a1ZQZTA0V1pidk5LZWdPUjdo?=
 =?utf-8?B?T1JITk1YUnFQMS9XMGdyelVTc2pxRXVqVDJzem9vTDhOa0pBcnQwWWxBcWYx?=
 =?utf-8?B?bHlqQnNUMkJHWlZrd1VWdklJM2pyS2ozalh5bnRRQ1VwWk0zUzhTTGxjWG5Q?=
 =?utf-8?B?Qm54WS85aFc2MFJCaWtZcVZQb1RvaDRHYnlXdVR4djl4Tk9jN3BrRUVRTjF1?=
 =?utf-8?B?ZkdqQkJxQmxXVmJUS0tuYXNIaUJOWXVleHdENHF4UDN0b2JTbDYxMnBSVmhL?=
 =?utf-8?B?VmY4ZWpabk0xS0pnZExXaXkzOFllUHlrM3UyQ05JR3E1QWdGTXgxcjB4ZTdo?=
 =?utf-8?B?NzYyTDNUekl3TnRqWGljUGJrdTFNK05DaGZmWUtsRm5iRjNYRkJ2WTR0cUtz?=
 =?utf-8?B?UU9xcjhnS3lwVGk4QUNMUDdlTVZ2c2czUVdyWWdVQi9TZFNYUXRiNHdwenVT?=
 =?utf-8?B?VE1COE1wVkoxNUlnOGl1bjN3WXJwOE5xVExLZnAzc0U3QmFDWFR6UEhmS2Ux?=
 =?utf-8?B?S2ptZE1KWE5IMXpJNEQ2YUhYcVpKeHBucGRzVllkdHI3T1UwWXhMY28zZWhR?=
 =?utf-8?B?ejlqRGRLdHRzTGNDNWJTY0tyTFRaWklvU3JKSDVTNnBJSjNCZEJpTDZCRTg5?=
 =?utf-8?B?QkpWWWZOb3hFR0ptWmI1VDhKSnFwQncxdmJiZGgyNlNDQ0RzSDVTdFk3U2xE?=
 =?utf-8?B?U2s2RHdzd0g5RTdLMW9IYXNpbmd0RzlKVlV0cHBUQ2xKZFJqUDVzeHFWZnJq?=
 =?utf-8?B?N3prV2VPUEdlb0Qwdm52OEE2eGxLNFIzN0JENERlMVl1dXpZODVTeURIRW04?=
 =?utf-8?B?bm5RSEFDcWRTQVNqVGlWUk1BbHVyVWhkMmw0SE9CQnU1QnZNWEJabER3ZU1w?=
 =?utf-8?B?MzRqb2lLQWp6K3BPU2N5R1NaSFY5K3prUWJHczRSU282K1FySUJvcUdkdU1G?=
 =?utf-8?B?K0I4TWVYd2gxckRFcnR5V0hLZThZL3lyZWdiaTd6UTJKT1RUZjNXeHJ0QTl4?=
 =?utf-8?B?Nm40MDF3V2lyTWlXT3JWNjNUNDFteW5URnlMYTJ6eDRhN2xIZ01jMUxFRmFK?=
 =?utf-8?B?ZzNHYUNyRVBOZDBTcWhKZzIxYVpHdk9hN3c1ajF6MU5FbEZPWlhzKzNibXlo?=
 =?utf-8?Q?A+33KQkZLAA1j/yQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb96c970-428d-4c95-5ba8-08de73a2b3c1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:46:17.6684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7htGCzIftB08EZepsySyJ2wZjAPIEUVXxCacN7dFqeSWwybdkm7/nhjnq+cCFybzXceiJSymGTswNDhqo54kZ29/9d/TF0TBv8d0L82sPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Query system controller when any non fatal error occurs to check
> the type of the error, contain and recover.
>
> The system controller is queried in the mmio_enabled callback.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 0960aa5861bc..2af6c1f45c44 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -8,6 +8,7 @@
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_pci.h"
> +#include "xe_ras.h"
>   #include "xe_uc.h"
>   
>   static void xe_pci_error_handling(struct pci_dev *pdev)
> @@ -39,9 +40,15 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   
>   static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   {
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
Type mismatch, ret should be pci_ers_result_t
>   	dev_err(&pdev->dev, "PCI mmio enabled\n");
mmio_enabled being called normal part of recovery, so we need to use 
dev_info() right.
> +	ret = xe_ras_process_errors(xe);

Need to handle local (PCI_ERS_RESULT_RECOVERED), global and unexpected 
errors  in switch.

Thanks

-/Mallesh

> +	if (ret == PCI_ERS_RESULT_NEED_RESET)
> +		xe_pci_error_handling(pdev);
>   
> -	return PCI_ERS_RESULT_NEED_RESET;
> +	return ret;
>   }
>   
>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
