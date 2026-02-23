Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34132EEC28C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65F410E314;
	Mon, 23 Feb 2026 22:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/JtiAF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7F910E314
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771884257; x=1803420257;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DC1kmh/q38JojtWur/mCiqjI7uyMUpdgVGXOOXbBj0w=;
 b=k/JtiAF6SnVA63XFPseHqvAmVOJCwQujBML/fTXln+L+UBCK/rYjTJfM
 o/3vq08SG7imhQTKi+g6iT2E6gn2cDKtHVkFIk06/EqPKjDSFGCsIvzvP
 AyWSynBceMTVNijn2rT8Jtaq54zoJX0g0LYQpu00UWtFogRF+ED2Ohl9Q
 adpbVLi8bQejmI5mpyYUkf8efb5CxaK0Vp74ZtyHD3QSJC1eveZV/e2rA
 NK/GUoa40NgnDU15AR1BmEwEXzZbd4W53NgLDu2QV37hXlTYLfUmFNvXY
 +khkRsalCHQice/+6Q2Y6/5A4FylCUlYDG+9n68gqli/SG8SZ3zL1Ao79 A==;
X-CSE-ConnectionGUID: uay2YM+ATWybQUeZd1E5ig==
X-CSE-MsgGUID: io9uloLbSjO3c/mJ6W3vhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83601718"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83601718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:04:16 -0800
X-CSE-ConnectionGUID: PNrcCgyoS4qY4s7u89dgJQ==
X-CSE-MsgGUID: 6L1hZMGWRL2OFeK3vjF07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214926641"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:04:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:04:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:04:15 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:04:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCnFibhvKr27+Jf73peIw6HnsVg14bswxqgnRBufVuJ8hcARzkMIuNr9hiV0BuzgsS8M6qR6c/s2dF9ikQSQkrPgC+zyoAP4fotKobF//WM2dlAjojTEpeMWIfNUYPpO7dUKY0bHlerGziNz5+9WQoma2F/Vqg8oVKejUkS4YzRJxV2m/ChuoLRx4uc2ICMC+KHFzXx6AeMeX36dVF6+AuTwjBDL0fDGN0md7Kff9nVOIRXNU8WsmxDCJm+EDyEk9lAexeqPdPL0ozm0TIJF4McSZJ+dARLbNHh3Qh1XtNxqZD+xdMoL78jEWKlcFlhEse2vmBuDv5iqVEHxZ467sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQrLAKg4dnaZmbakiKuKPKyJgP/gpwCvqQUVAeNa9mY=;
 b=P68jcAL9RNSMA0qD2Kg5dCvRcKeegBhzbC2kIw2imYoINtOo+Yppe36JB9ugDaq4AGyVXFZSeyLTEGuHqEwoMqIBM+yOS7kKzbY9+UPyTj5ov86MOj3P0JtGR5coW14KVKMYR67Qr1QUcS9WBdA9ZR3vonixOZl4bjpYekdSAbexT6QBWi2VtQ1kbKBWuOHcbSdj5GiS/7ahWpdhX9p85ylHQ2eSIkxtbs9IIpl7mCAe0ll4XBa6D84yTzmm6jPUE8tLQ8MaOOg3tE0KEKtUivTnjqgE0ZIFeoYWeTGhgLiSZNnA2pQGBc9Fzn+nVaHYvrW3JNAdKIzbbycUAvkpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:04:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:04:12 +0000
Date: Mon, 23 Feb 2026 14:04:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Charles, Daniel"
 <daniel.charles@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Mrozek,
 Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Document exec queue priority rules
Message-ID: <aZzO2tI/ifdv37Ul@lstrano-desk.jf.intel.com>
References: <20260223212442.8923-1-stuart.summers@intel.com>
 <aZzJJiWLHYn59O1G@lstrano-desk.jf.intel.com>
 <73fc07785ffc41b2ca598178aa1601c9ba867ee8.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73fc07785ffc41b2ca598178aa1601c9ba867ee8.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e3a846-029f-4a47-90ab-08de73277a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T01IUXNIbm5ZN09lMXhTOW1xdTJMS3h6RlptcDlTcnVvS3dxb3VkVmM0cWlZ?=
 =?utf-8?B?SEYzaDlHeUFha3VPZkVQaXVNeUQ5Zy9iY3p4aUxIenRNZEJFZjBtRGM2NHVl?=
 =?utf-8?B?a0MrQU5xbGtuL0lodms1K0cyeWN5ZFR3TlJhdmNLMlhnQjA5UFpHZkhzZUs3?=
 =?utf-8?B?SGJqTG9aUjNzVDFZNDFQU2QxMnJRVWpuOXNNOWZPWCtGRTZtYUZjZ3YzRlNz?=
 =?utf-8?B?NFVtZ2FTK0ttcEFrUVRwdEsyVm1nVjE4eDR4ZmpwNHNnNUhxWllMbjljNnN3?=
 =?utf-8?B?K2JjTXYvWHl5Ymg4UmJFblNSN1QrYVNwNHJValdpWlRoMTRQenc2MTRnYVh3?=
 =?utf-8?B?UVV2Wk1NOGg3ZFBxbTVqZ0didkRpN0JVMjZNT2dsWTc4NGNoYkUxY1NIQVhP?=
 =?utf-8?B?U0FyYnNMM2NTZk9rRmlhTEdVTDRGRW5GZ2RYSE1VUUdVb1VjbUJYaVBIemZi?=
 =?utf-8?B?MjlwZzY3TU9xb3NzTENVWjVwOXl2OStud256bkJQSWJoSFhIWW5WbFRza0Mw?=
 =?utf-8?B?aVlvQ2tvZUZnSVl5aXdWd2pzWFlMVnI2ZnZoSXFTVEczQXFWYVBKdVFMdmVs?=
 =?utf-8?B?azRCQjMxbEcxYUZnMGlkeTdkd3dEdTN1d3pzRVlpOU51NXhBWmdFeUJZMnZZ?=
 =?utf-8?B?dlIyVXJmVUYyUFZSbG14RkgwMlBqNkxaSXREYmtKRkh4N056QUJRditLSStV?=
 =?utf-8?B?WjNaR0xnM1VRRVZNc3N1U1RsU0p3ODRpTzJ1NStkOUhtUFh0QlNoMnB1dEVj?=
 =?utf-8?B?RUZKNm1XcGtYaFpBc3VFU01OT2lyVHhZcTBENjBqYk9xU2Z6Zzh6T05WdmJ1?=
 =?utf-8?B?OG1EQmVMY0w0OThmTjFZL2hpeFBLTWhxVEhuWW1wN2FDQlFsd091T0V4UjdO?=
 =?utf-8?B?ZHhDR0RTUUx3VlQ4VUR0dXRqd0lGK1dkaVdMelJCZFdEOHJpUmhtMGlEaDRl?=
 =?utf-8?B?djRtSGt4ODBld0NEOUpZVUZXWitmTkVWQVFXQk84ZDdXV1VkYWRYekhSYTFW?=
 =?utf-8?B?a1VzNkFDRHNxamlrbTFwazR6d2JuV0I5cXZ2MWsraFJHL29uUlpWT2gwa1ly?=
 =?utf-8?B?SEJCQkhEZFhCcGpMeTE3VWZ0MmdJZmF2d1FvaHo1dHBjZmhlOWt4a1c2UHlD?=
 =?utf-8?B?ZHpBVFM4N1FZM3RteGVyNmYxWU9CL3ZVdHAzTmcrU0QzY1RxbUM3YU1EL3VB?=
 =?utf-8?B?c2Z5YmdjNTkxaXVMc0tRTWVMckhDbEtpd3BLenlRa1NnRGlDem5QcVZENmdP?=
 =?utf-8?B?L1NFZndWbEMzY0orbUVwaFZLeS9ZVHpMZHU5YlRjeWVsRGdCaVNZZzJFaVd4?=
 =?utf-8?B?b3ZwMDRSQUN5Rys1L2hibkNaZEYrK1FYUzBqN0sxbjF2U2FPY3JWQjMzOVpL?=
 =?utf-8?B?d0VZZ1hEb2RhTFpaaTNvU3VrUHBEbDBGaGVTRk4xVUN3ZkN4Zmx6WUl3YW16?=
 =?utf-8?B?UWsyTnFnWlV2Y21qTnphY3VLQlRwWjYvMjRSbnlCaGdzcGNwL3hYSE5XVGJu?=
 =?utf-8?B?TFZCUCs5aElyZ1pmcFIwVzRsTEVuaWxwdXdRdTlpSzU3ZW9MNkhCQkFsOC8z?=
 =?utf-8?B?SWZhRHhROEx6OEd2ZjZSWXh1eHh5bENHVkJPd0JDLy9BclpXUUtCVUtNOTF1?=
 =?utf-8?B?STVQRjRsc1dNMGg1Qi9FWnBvc2VpVEl6SmkwcmlNTlZuUE01R3A0Qmc2ME9M?=
 =?utf-8?B?QmtaMGtPdndMZngyNVoxM2hoVTVXOVpjUDdLdVJ0MEFpK3hHdXdHRG5mOGFP?=
 =?utf-8?B?RDUzazRBMmNiYkZ6VXBpdUczZ24yOEZDQXJuWmtWYjRTd0tSSHpSQlg0UGxE?=
 =?utf-8?B?K0JRUUVYckFrRXJnS2ovQWlxOEsvNzF5b0hZZkxaVi9KRXJvZC9HNEl2cmw3?=
 =?utf-8?B?aHJzbjdqSE1iSWlRNzZkaW9UeFlDVnpxVzJVamY2VHlUM2k3bERwb3NKTjNl?=
 =?utf-8?B?Zmd3Si9xUncwZ3FWYS9idTAra3o0bmNkTFo4Wi9pcHlXWlNRNFBlTHBsTUdL?=
 =?utf-8?B?cCszRkNpbERRaWNncjk2cEpWeDg1Qk9jbUo4VGNmMUJsY0w5YTJuYU1mRzJh?=
 =?utf-8?B?YzFxMHc2NVlzNkNXUWJjUjRCbDk3Y1BvWmJGblVJOHd0RlUxY1pPTG1IQ0p0?=
 =?utf-8?Q?KyRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFlyWmZwN2l6b2pWZ2tZbUFaekJDVEpVVHdrRkFlZExXSWVZNHJ2S2pTWWxR?=
 =?utf-8?B?U0dneWc1bUxRTzZGU1BPdHZEY04zdVBDem1ZcU9UMlNta0xkb1lGUEhWZjRF?=
 =?utf-8?B?S1hVbDVqckNoeHdxWG13Wm5PUzJQMEFUVWkxOXhwcGF5RDBUQmpIbENHSzJ2?=
 =?utf-8?B?Q0VzZDdNb3pPZFNJRThHTEtvaUREYWpwWmxqeGVjN0lMM2JBQmltdVU5YVVj?=
 =?utf-8?B?VUQwVXR3eUY2WHh3dXlyOTdiemR1RktHNUNlNUM1MDBjMHRHTlZmZDBVRDhJ?=
 =?utf-8?B?YVh6V3dXZy9uSXJ2M2RxejVYdndTMnpuVUlMTjZleEVNcENSVzhreWwrdWdy?=
 =?utf-8?B?ejMrcmxDenVVT05aYlVZMVVRdEE5bHRHTHZ0enNybWZucmdnYVlnaTA4Ukd5?=
 =?utf-8?B?UGZ1WWJCMVUrZTVDSXUvd3laNUVLY01uN0taK09PYk1MZWw0NGUxZEhDZEtM?=
 =?utf-8?B?cWFaam0vQUh4c3c5aWNxMGNqR3lkVXVEYlF3dG9WQVI3M3U5ck1INFphdFds?=
 =?utf-8?B?SFArL205S3kvTUR4OHBpV2t6Y3JFL2taNlpqdEpRcEJjUnMzQjVvVW1FbFFx?=
 =?utf-8?B?bHVKZmhROFdGaTFHdDFtNFFIUkNvbzFyWUh5UWJHMldOaDZMdVh3MEZkcU1n?=
 =?utf-8?B?YWZKZDRTR1VHS0szaktjeTF2MkF2WDYwNnJrNS83WnEvOTh1ZUV6ekFPaENB?=
 =?utf-8?B?THNXQ25qZ2pCTEkxbXdIVXdoYmdjUlJ4RXNnaDNEUVdFUFpiWTB6ZU1zbXRu?=
 =?utf-8?B?T2dCVXRZY2hidndWc1J3dTl5VVpYdSs2d1RjUlczbVlUYjZic1lzcVZ6MDhh?=
 =?utf-8?B?TklXMXJhZEpOSWZKYWJISGpUUmZxMmZFNDZkM0lpcURMVzVFU2xSVWg3dG1q?=
 =?utf-8?B?ZElQWHNJMEx1QXpudVd1Wi8wUnlFdk1zK01nYks1QlRxUnkzUG9YYmJMUi9k?=
 =?utf-8?B?UXVTMVdZSHJ0NmhrUS9FV29RSnRtZjE4STNTUzhJVG1OSnBTSmZjeUFZRkZr?=
 =?utf-8?B?cXp3b2lvNzFjRVlUeXRnRUNOV3UyK2tjMi9KM3FZS0J1cVozU09nOGcrR1h6?=
 =?utf-8?B?V1A1TVd5ZEttNXpNYlJHSmZ3TTdHc1YwNDY5WnBudjFNMHVFSWlJNVpPWFpt?=
 =?utf-8?B?K0w5VFl4Ulpoa29lUTJwYU54WGdnYzFrNlFGczBoUjRDVnJsTDQ2d3NPcmg3?=
 =?utf-8?B?czhKbld2S0M5Vm1aTEo0MnpNZUFOTzVYcFpkVmk5Ti9lcW9PQm80VzVVeWtF?=
 =?utf-8?B?MUhEekxxS1NSc0YreW9PZ1NmcXZVLzAzNllLem8wTnBSZFVNUVgwNktkQXd5?=
 =?utf-8?B?UVJGY3UyS3BaeVRzWnp1MmswRkhvL2RGa1NVVUIySWxSRzFvVW4xUExyLzF2?=
 =?utf-8?B?YXkrc1IrUHg4VHMzT2lpTGdTY3I1Y2F6UkhZQTlWZmxkZksvdzkwTFFEeHNy?=
 =?utf-8?B?UGMzUHVGMkYyUXU4bU81SHFWTVdkZjg3Q3cxU0tqZHgzTnhBcFlYZzdEZkdQ?=
 =?utf-8?B?eVJHMlkrV25RVERERTkrc0piN2RvMUJ1WjZyRWVyRUtwOHBGN29GRHI2TXlZ?=
 =?utf-8?B?TjU1MElOeWtwSWd1MitYSk0vVXBsbzVsSlVQTDdzK2pSQUlpSGNqWlNUTTJQ?=
 =?utf-8?B?NzNZcmVwdmJwTm1MOU12L3hBOHoyNDBtQkNMQWFDMzMxZ2hEaUJxZ2RrNnJC?=
 =?utf-8?B?dXpuUTJLRzRRZm9WWWRGUTV4YTdQTFVCMXoyZ0Y5d3QrVGtTbi9zR01JUjlk?=
 =?utf-8?B?SUlZYTgwSXYwRVN1RlV2ZThTVDErMWpVVVpzNnZlTDlaSldIdjcyZXZJbFZO?=
 =?utf-8?B?dVlZcFRjZVoyem90UG1pd1JzcmUwVXdIUWJWbFhnTDhSMkF6NlprZjlUUW5i?=
 =?utf-8?B?bnRPQTBVSjNhczBzZVBjQnVXUTVTYXhUQ1M5enJTSzNranhvYW1yVTAwVlVL?=
 =?utf-8?B?OFVqS0NuTmgvWGJOMi9lMGNTQjFLMzJXb3VvOEVWcnlCWUhnMUNuSnZxaVQ2?=
 =?utf-8?B?dmcxKzArWGVOaXpCdmlCbHhpZ1hvYlNCOHdqQVBLb1JHYnZmWUxlYzZ2TUkv?=
 =?utf-8?B?byswMnB6cFVNSUM1ellqb0VJcERaRCtLRzZFa3ZuTk9TaUdLWnN4a3lRZUFN?=
 =?utf-8?B?STJKL3B2VWIwVktpZklMT1hpZm5yb3V2eHdVVWhVcGJjcGVqQktIWVBNUkxz?=
 =?utf-8?B?OXk2Y1MxT3ZBdTZKSTV4dmw2SmE5ZVhrY24reVBzcDcvZFM1UHJERW5kVXJH?=
 =?utf-8?B?MC96SWRkUFNhM09NNlpmYk02VlM0dFpnYUtqUVNMdjlUWkF3eWUxWHJadTJa?=
 =?utf-8?B?Uzliand5aGxrUjRIU3FHZ1A1WmVIYzJ6RVM2UVNOVHVkNXl6YVZ0ZnZSaldk?=
 =?utf-8?Q?awVdYRbUWJuB6NlU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e3a846-029f-4a47-90ab-08de73277a36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:04:12.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfmuSogtmzj/j0NxksUw+WNKj2IeM3EmjmwTPYrtbdXgSmJU9duEFbRVSaylZ28xqs5IeIGUWdj1EMh0gQI+mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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

On Mon, Feb 23, 2026 at 02:56:53PM -0700, Summers, Stuart wrote:
> On Mon, 2026-02-23 at 13:39 -0800, Matthew Brost wrote:
> > On Mon, Feb 23, 2026 at 09:24:42PM +0000, Stuart Summers wrote:
> > > Add some documentation around how the GuC will employ
> > > the xe_exec_queue priorities provided by userspace
> > > application.
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 24
> > > ++++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 3791fed34ffa..aefebfc6996e 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -22,6 +22,30 @@ struct xe_guc_exec_queue;
> > >  struct xe_hw_engine;
> > >  struct xe_vm;
> > >  
> > > +/**
> > > + * enum xe_exec_queue_priority - Exec Queue priority values
> > > + *
> > > + * XeKMD uses GuC as the primary submission vehicle to HW.
> > > + * GuC has 4 priority levels that roughly map to the 4 levels
> > > + * shown here but in reverse order. GuC scheduler uses time
> > > + * slicing to determine how long a queue should remain on the
> > > + * command streamer before issuing a preemption request to
> > > + * allow execution of another queue.
> > > + *
> > > + * The following rules should be considered by applications
> > > + * employing these queue priorities:
> > 
> > I don’t think this is correct, but Daniele or someone on the GuC team
> > can correct me if I’m wrong.
> > 
> > My understanding is:
> > 
> > - Queues at the same priority are timesliced. The timeslice quantum
> > controls how long each queue gets to run before a preempt is
> > attempted.
> > 
> > - Queues with a higher priority than the one currently running
> > immediately preempt the lower priority ones. The preemption quantum
> > controls how long we wait before the lower priority queue is reset if
> > it doesn’t respond to a preempt.
> > 
> > - If a queue is running at a higher priority, those with lower
> > priority
> > never get scheduled.
> > 
> > This is why setting HIGH is dangerous — it can completely starve out
> > other queues, which is why we don’t let unprivileged userspace set
> > it.
> 
> So this is the observed behavior and what we had been told is the
> intent from the architects. But you're right I don't see any explicit
> documentation on the GuC side about this. Let me dig and get back here
> before we make any changes here...
> 

I would double check as I'm near positive what I wrote above was correct
at least when the new GuC interface (v69 major version) was implemented.
Ofc this could have changed in the last 5 years though.

Matt 

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > + *  - A HIGH priority request will preempt a NORMAL and LOW
> > > + *    priority request when submitted and based on the time
> > > + *    slice quantum.
> > > + *  - A NORMAL priority request will preempt a LOW priority
> > > + *    request when submitted and based on that time slice
> > > + *    quantum but will not preempt a HIGH priority request
> > > + *    until that time slice quantum has been reached.
> > > + *  - A LOW priority request will never preempt either a
> > > + *    MEDIUM or HIGH priority context.
> > > + *  - Currently KERNEL level priority is reserved, as the name
> > > + *    suggests, for kernel-submitted queues only.
> > > + */
> > >  enum xe_exec_queue_priority {
> > >         XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage
> > > only */
> > >         XE_EXEC_QUEUE_PRIORITY_LOW = 0,
> > > -- 
> > > 2.34.1
> > > 
> 
