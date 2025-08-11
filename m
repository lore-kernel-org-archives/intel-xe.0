Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1A7C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 14:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9FA10E505;
	Mon, 11 Aug 2025 14:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW3d1KxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3D10E4F1
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754922739; x=1786458739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0I3ONKzNwYLCbOQoQaZJARt/uWdUOhMUePxMBHnL2YU=;
 b=cW3d1KxK2SwbC2h2sOCYpsw2kmutdrhavRZyD7PkD8JbT5G/iiTRlZWU
 Mhw/KI8uY8mkcgxutwjAKSict76/Y8eG8tYm1unq4NHXV3iq13tEGi242
 Bym1/jmTZpKkDxKs+EXMOg4unfM+Jbo/vp9Oq0E3Aiu7BMiGoBOeTy11q
 vlqEP0RWbtE8b6B2//3O4SpYBTimV2uHJnMMF35wNSkDlUIhda0U0HTYP
 I5ObGqgDJb8z3R6PGnbLWP+0/EMkvfG+8GE1U/LWzFYC1j2qeMvz01DAw
 jMIb19C7MrEA0aUDlsaSyOuYE1TC9lUHdEtg/RRXNQ6ubnzepdQWVstGg w==;
X-CSE-ConnectionGUID: 7AzmGIvlT+6kTvGO6qYQ1Q==
X-CSE-MsgGUID: +YkJ2lqfRVS/9dc45H0WSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="44759986"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="44759986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:32:06 -0700
X-CSE-ConnectionGUID: iOr//MOGTq+0r6J9HneJ+Q==
X-CSE-MsgGUID: uObd+R3zRxqT955gO70mVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165177125"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:32:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:32:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 07:32:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAsFnKzmzdIBdOsRPO1FIfSaA/e42fFvHPPInwAFKGI48WvB+TohCR8eBT39oyHTr7j5+RsNevpq3tojAInx+VjfEJ7tWyh6CgUrex1QiYFBycxjL/cIyeGQjYnACpbQHzR86Yd/czh43gqEgH4+A27TdsVzim1/4fNwIn0YwY9aCAM0K5trtWIauf75HjFI0sERsJ35WIcQzgiR6oekXEsfkkizSx5HRwWv+KrrlQ75wNbbtIh+dDCDPxPIW/8tSM5VXlGcKfsHYmBxFlaIdICEPb0crwklvJl37k7vEQwparjpUMoCupI21QjpUhSBmyfsvrTJpp86p2wOg+kQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/CZGYDFM4caBP0M1LL0lE+VLL5z1e/oz67/zdPszF0=;
 b=qkDp8KWlkhyLmsp+BLc7SXAxU5ljMvnaBqZVqJLLtgJzaWR0NKuZNHImYbIzmAovg6qGW76zp+RXWDBz3UHR+oVdzJcSamrr39RfHMIIvMvX6ONZd2uP3x0gpU1IahQmY+zsX2emJ8GQ8iwWgiDPmcVAEjElaesGpoEmokdnNSPZWqx0fPj1+XI27MJTf+Y6UHYsvpwhU/C4SCj/Dqz3uekYSIPHimngmsv1HZHWREkeorvoHLx1V5XKm/u0gFKu+Y/07GdevS0qk1/IvXuVLD+jA7g7l0IEx5otVoScQzwDGurOYL0nvpVj+mGiQxGAfpLO7Jkz3pduEd+NZx4eiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 14:32:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 14:32:00 +0000
Date: Mon, 11 Aug 2025 10:31:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v4] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
Message-ID: <aJn-2-XyoKnu2TPL@intel.com>
References: <20250805121058.7103-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805121058.7103-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF4990C6B9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbcf543-d260-4403-8ed4-08ddd8e3d4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG4zRjlVZ0dHRlVHOXBQcWExUE1GTmpxd2tvdGExWG9ZS2pkVUNvbVJkL2VE?=
 =?utf-8?B?QS80MFQyYjVhTXlTUjYwWXlndHQxbVA2UlpvQXdjY3h4UEhtRjM1c0VlUWN4?=
 =?utf-8?B?cjZZWUdTaFpNUEl3TjJydklKZFBSa3NncDF4VXBKZy9lajVEekVVNVB0Z2pv?=
 =?utf-8?B?K3U4a3dVdXJoZXdGV0o4NTlKU3hmeEVoRmxhZDZhWkZIYmtMdmROamtscjRn?=
 =?utf-8?B?bS9TYTVyTU45MzFqZFBxa2oxWnVxR28xeDNteUhYNGkxbTZadXZqVEwya01G?=
 =?utf-8?B?eGlUdktISWNlTy9CejZzSWYybEkzK1ozWE5JZzJONTFDRzUxbnlvOTNhbmtE?=
 =?utf-8?B?ZGM5bW50Q041QkRSNjV4QUlHVHlEK3dZY2tTUlh3cWt4SXB6SHU0RGZVa1d1?=
 =?utf-8?B?YjNRb2liaXJJb2VIUGM5dkxiL3Rqd05KWC95T0taSmtmaG1rS0Y1NlQ3Rjcy?=
 =?utf-8?B?NGgzQVNLWmx4cFJzYXJoS3hHbE9uZHIvNzI1U21TVXBoUjBxcGhNZVM0RzhF?=
 =?utf-8?B?alRxWjVBWkdLUndYcHFEcm9UTUlEcFIwNlJKNjkwTnpoY0pkN1V2Ym1qNENn?=
 =?utf-8?B?QWxaY3dmdVgrZXdxQ1NqUnRhOStnOVJqc1I1OFhjaUF4KzBnWEdiWTA3SUNS?=
 =?utf-8?B?cDNCRVZnYlc2SkJtZVVSQnpSZWVvV2FlSXdmQWVZQnMyWktWMDlvZ0NTLzhI?=
 =?utf-8?B?aWV2MkVPZ2ZKbE9PbnBPaVg1NmphR3JKS1YrY09ZMTBKRjRrTjZkdFpvdFU3?=
 =?utf-8?B?YWhheXlHM1UvTmNnS2hrRmVPMDFyZGtsOGh5WUZJUGRHQ1RZanVTV0NmQUUx?=
 =?utf-8?B?Y2JObmN3ZCt3ZEV2dmgycFFpWUFVNUtJeEFKZ1k4NmlpL3J1TGxMVTI3MWZu?=
 =?utf-8?B?b2VUVlF4SWxEY3p5VFFFam14a1V6R3V2YXJkWjUyTStWTHZ6UVk0NGYrT25F?=
 =?utf-8?B?Um1OZ0hZeEVWRXl5eW1Sa2tYR0NiWFh2cDM0ZjFKQ1Q0b0txU2E1Rm9RSzN0?=
 =?utf-8?B?dWg5KzRKN1ZsZTJrWW9icjMvcXJWVm4vU2o2MmNqRG84UldrS0JZQnhoc245?=
 =?utf-8?B?T25HL2IrMVgwblZVTHFDOEl2L1VCQUpQTXpZT2ZGR2UvNEcrTWFKTGl4a3l2?=
 =?utf-8?B?eHZOOE5JSGxRRlJ0LzdIOVZ6ell3Wm9jL0Q0cWlGU0EwMzA5ZmNYQWJpbHR0?=
 =?utf-8?B?UGtuK0dqY2lXeVUrSitsVStHOHZnQ3NCTlZYcFF1VDU1OU1JcDNTZGhYOGti?=
 =?utf-8?B?RXJ2Tk5tVnhpY1g2b1VpQVpkYWtkb2NDait4bEorSlduU0wwaVkyUC81ZFA0?=
 =?utf-8?B?Skc1VjFrZTgvUFBHbldWMDkrS0hTOEV4UklDNjhIejEvaitHR1d4dHAvbzcy?=
 =?utf-8?B?Y3JaZnhPd0hPODM2b3gxUVhqMFg5NE5YM0M3Z3lzV2pRVkxXQnY3L0RtM1Z3?=
 =?utf-8?B?WkoxWXY1cjdTQWNzeDdOeFhCWExEeDZTa2REenczcEYvSWFkOUhiZzNvaUFl?=
 =?utf-8?B?Q1B5V2VqTDREUk5tYU1VSmtnckxUM05hTGdTRXhkM1RPYW5xYjJrd0doZ0Vp?=
 =?utf-8?B?b1YxM3BxZG5odDBDYjBaQmh4TVU3cFFaM1lVeXpWa1ZQWkNhUU0zMERIa0Rw?=
 =?utf-8?B?SXFMdTVTRnA2TkgrdFNOU0F2cTZZeWtPTEN2dlBQZFZqKzIzYVFiSXpmTVIv?=
 =?utf-8?B?bW1weEFuK0FsMkNZZlJ4YVgwVkUrVE9PYmx1RU0zdUI5RWt5VWJ1alBacEYy?=
 =?utf-8?B?MVY5RFBCbXBzVDZEWTlpb2NudlZBck92TmhMMFRDWDc0RjVIRVpFL1BSR0hK?=
 =?utf-8?B?KzBzZWNqMnNRWGlTK2JPSWlWa0lLcml4ZTNYR0xiQXdUUUMyQ3Jib05yRmxy?=
 =?utf-8?B?eTF1OVg2UzVqeGVOaGg1L2ZKSm1hOG1VdWRoYWJmeEF2VkFUSDdFVnpKN1N3?=
 =?utf-8?Q?sQXnJpmXGTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZXMU9jV1NscXZkUUNZemdLT0tvT29SeFRwYTZRWWFnZ0hpd1dqZlBlVnkz?=
 =?utf-8?B?b3Y4MTk1R0kvYmlDWVEyWVBQb2RERVIwTk1xcjBrMXErek5SZjdQN2NUVjJW?=
 =?utf-8?B?N1lRb2tYR2s0T3hBMWxuYWJ1ZlBSRFJOSmthNEJhd2dwc3RzWUROb3U0ZUNS?=
 =?utf-8?B?TGc4YnlySUdIYXg5aWNMRzNGSFVwUldXdlh4dmlQYW9FOUxLUVpHV1h1Z1g1?=
 =?utf-8?B?Ujgva2FjUVNXenUzbWtMMzYyWFkvQmVBQWEvSDIrYU9SWEtHK0JDMjVkUmlV?=
 =?utf-8?B?Wm9pQTh0SzJjS0hQaEZ6cEZwL095ZGF2VTZ5RlIwSkVMWXdYNkZWdGNaRHlh?=
 =?utf-8?B?aDg4MW56Qml0N2REcXRnekgvQkkwYTBEb2s4b0phRlVISFEyRFkwYVA1MFhl?=
 =?utf-8?B?WEVRSlg5K3RZNkIzc2JIbFFuZVVuOHlSY242S29wU2VtU0MxK1R5aksrS2Zr?=
 =?utf-8?B?Z2RvczNiU2gwVFV0NUdJN3ZiU2Y2RjlhalJ0cVdvbW9tZUZ2UklqT1FORVV0?=
 =?utf-8?B?L0hwekZRQ2N4Zkk4SnVwYUwyY3RuamRtSUIzMjJwOG4xclNqSDBZK2doQUlP?=
 =?utf-8?B?aVprcGFCLzJvbHArQ1I0MEZWZHkwajVtNkF1SWJpOHlyc2I2TFpzVUd5K3lM?=
 =?utf-8?B?RVFCNzhaTXNiamU3RkcvZ2puaGVLUzVxM3pFT29aQjlJRzRWc3ZocEJ5QjJp?=
 =?utf-8?B?ZUVtN3paSU1IYjhRMm5tcnQvaGFrMHdxQ1h2dldxeGJaT01yTEdycDJBWFFu?=
 =?utf-8?B?L2prRGI5YXRqZGFLY0gzMlpUSzMxOG9FWkdGSDdXQzVadkh4ZUJiYWhsK3Mz?=
 =?utf-8?B?LzhUTXQrRFNJUTlPUWZMcDJFWGg0MS9keGs2b3VvbHA4WlowRjkxYmQ0c0kr?=
 =?utf-8?B?bjdtY2ZvVDB5SHZpa252cmRQQlVKei9xV3EvSytEenpxVTRlY0pVRmZXSVNF?=
 =?utf-8?B?NmlFTVo4azI2YllrTlFWbWFIc3AxZVZ1UU54Y1AwQWQwZFBHWGFhNmtpakNl?=
 =?utf-8?B?RFJEbW12eDJHV0luT29zbmU0cW56YzBrY21mbnR3ZWVHZTR5cmdiTnZUd2FT?=
 =?utf-8?B?dGRNVyt0WU5ZMWhpS0JxZVc3b2N4VXdibko2UEpURmovMm1LVmwzM2Exc2FV?=
 =?utf-8?B?eU9FM2FmYW1lbXhFbDFrMmhFdjFrcTI0S0tnUzNKS3JUSGlSRGRsSkFFdEsw?=
 =?utf-8?B?N05xN01xdDNtY0dTc0hCSysyeHdqek5oVnlWb0xxUXlqV3UwbjhJb0F2TTlh?=
 =?utf-8?B?K2dsZm92WStvNkZBbnVDVmZiWWh6ZGIrZmxsamJTZW9rV1ZFZXNEbTZnY1Bz?=
 =?utf-8?B?endJcTZiMVgwZ3l4ZCtXU3VTQ2ZGVVdMRVpmMG1kbmpRdC95eUVkV1JFczM1?=
 =?utf-8?B?dW9NMUc5dWg4K3VKWUliUUR4SmVDVFRuWlBkbmxJS1g2NWIxTzNkekZuMlhS?=
 =?utf-8?B?c1BDL1I4MXJTODdRVWJKNFY4d1N2OENqUURNV0Y5M3dLbWwxY1pKTlArVjhL?=
 =?utf-8?B?Z0ozMnlvN0FxOEdBMHpWSkVlZGJGQk0xcFo3NUVlRi96N2FhSWU0U1VQazNH?=
 =?utf-8?B?MHFuQ1ZZTjQ1d2VMQ2Z0VFl5SzlITGJTMFJ4aXFia29UcnpBSWcrS2Y2OXAz?=
 =?utf-8?B?Q1oyQU5NcFQzeEdrWlZQckZxeWJrQlJkbTkyOW5Bbk5tS2lrRU1KcnJKcUpL?=
 =?utf-8?B?V2lXM1NGdXdlb0lxYVptN3pFSFFGei9qdWFsQzJ0a1VMS2FWbnN5Ymp1bHNx?=
 =?utf-8?B?M3I1elJXRDZQOEk2c2xYZGFiUVFPdmdnQWRGblM3YVh4djFSY0d5LzlWc3dy?=
 =?utf-8?B?RHBkakNSczF6K2JwRGczQlV6QUVjZUtoQkFBS0RiOS9yS0dnOXN6V3ZXQVgr?=
 =?utf-8?B?NnJVNWhUTmFIY3B4WmJUWk4wRnJKenBjOG9PNzJ2S2s0cHlVc2czNGVUWkxL?=
 =?utf-8?B?TjhvQ3FXM0RUNm15T2lLSHJTTFV6R0x3UXZ5TFR4cHQrNTAvYk00QTRERERG?=
 =?utf-8?B?TFd1ZnlyMURvYXEzVW9ZYUwvNVpnMXF6T1pjWUk2blE2NWpiV1NHZk0rNVZS?=
 =?utf-8?B?dUhqUFRrSHFZQnlNNW1RYitOM3ZBNWRnYmdDeDg3Q3dRT1dTMGkxNTZsQ0FB?=
 =?utf-8?Q?a8e04+KwSFZvAlDq/jWP2mtIk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbcf543-d260-4403-8ed4-08ddd8e3d4e4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 14:31:59.9731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4uA6S61F7WLIKIbI0nf9tMTCedejxj4JSntRn9i/uZVZRqgtoIVmC46yXW0vxxeW3qI40D+M/KRl6oCJ9eBEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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

On Tue, Aug 05, 2025 at 05:40:58PM +0530, Satyanarayana K V P wrote:
> VFs without native PCIe Power Management (PM) capabilities inherit their
> PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
> Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
> driver suspend/resume operations that ultimately perform no PCI-level power
> transition.
> 
> Since VFs without PM capabilities cannot independently enter low-power
> states, the existing RPM workflow becomes redundant:
> 1. Driver executes full suspend/resume sequence
> 2. PCI PM transition step becomes no-op
> 3. VF power state remains tied to PF's status
> 
> Disabling RPM for PM-incapable VFs eliminates this redundant processing
> while maintaining proper power management through PF dependency. This
> optimization ensures VFs follow their PF's power state without superfluous
> runtime handling.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
> V3 -> V4:
> - Fixed review comments (Rodrigo & Maarten)
> 
> V2 -> V3:
> - Fixed review comments (Michal Wajdeczko).
> 
> V1 -> V2:
> - Disable RPM only for VF devices when PM cap is not implemented.
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 5e8126ca8e27..9d62d3f99ed9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -245,8 +245,13 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
>  
>  static void xe_pm_runtime_init(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	/* For VF that doesn't implement pm_caps, the rpm functions are no-op */
> +	if (IS_SRIOV_VF(xe) && !pdev->pm_cap)

I still dislike the fact that the driver is checking !pdev->pm_cap this should be
done at the pci-subsystem/runtime_pm level... not at driver level...

> +		return;
> +
>  	/*
>  	 * Disable the system suspend direct complete optimization.
>  	 * We need to ensure that the regular device suspend/resume functions
> @@ -365,8 +370,13 @@ int xe_pm_init(struct xe_device *xe)
>  
>  static void xe_pm_runtime_fini(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	/* For VF that doesn't implement pm_caps, the rpm functions are no-op */
> +	if (IS_SRIOV_VF(xe) && !pdev->pm_cap)
> +		return;

and it is even worse that we are checking that twice...

> +
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_forbid(dev);
>  }
> -- 
> 2.43.0
> 
