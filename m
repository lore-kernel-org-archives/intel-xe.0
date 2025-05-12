Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E346C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 19:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79DD10E49E;
	Mon, 12 May 2025 19:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsDSwA7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001210E49E
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747079607; x=1778615607;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6DsLq5X/BPivRNuYixkfB8HHcTAjw6PyvoAms5ppUT0=;
 b=DsDSwA7U3zNuWKJfcC0eK94lF7hDH6tSov2fI0Or4Tpx9SnDEEx0Awmv
 mAdFMT+/mmXL1VLNrlbaPiEYo0SW7ThfnhTLQBTr1P6TqGlkSFtbNWClH
 yJDHvP5WtNDXWc08ACdvnebct18/CUmePl4W0McJjnXFHFXq7PTDq6PEV
 z5F86Eg6b3Hhk/dSIlpMNyULISeeZq7cLrObzWS44mEXs1fU+nwVWIQdb
 FP62dLCDzQmgPy7SdI4Y7PcyxIB6Ive/fLlaMLEdxo3kzPwnxVcO0truq
 R9ia4TG1Jn3gtzFG8j/EsG3R7EzGvIMUiZlithbV4kXQpAQjsMbhd6RdH Q==;
X-CSE-ConnectionGUID: iR3KMcJaQ/WjI5GEn0iQ4g==
X-CSE-MsgGUID: dPpEzXmiTvmyepRnlj0pWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48146666"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48146666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 12:53:25 -0700
X-CSE-ConnectionGUID: lawGry2tQP+fSUoBL5HCmw==
X-CSE-MsgGUID: juC3Ad0YT1WGNLXR9LO4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142661696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 12:53:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 12:53:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 12:53:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 12:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKBIlzBL0KljF0RokEew082WHwrLGXGBGEiawhtCL2ME2q0KPBaWVNDCGSaBilwARGeVScoAo0mjoHUoG7UTfZ5TktBpdKdJxEJIPsEXlOivWCcH+fwR9fmqrw3niBvXcMd65F13uebqUOGFrctCImqEHEo3Dxu78dRLVZDun3bXLLclcB7NuMYhm9WHNffOaY/e4xO/f+an5ACeWF6lGmCeALjH/UL/OrwgqqAdVFuqwtT9EUoTEdfPsPWE2pb5KLayQCgOs1++NGPzQ3/q6wqkfJnvzaj4cflj629OnJkGYtLtYkl+P0Z/AZBpdvILozykIr9dqrQw5vrLi8vNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw45c+rqtK/Rybm24MXpygYBLMY87/E4Jzo28v2Hk3w=;
 b=UD5ySF7HFFncmIgX08zptJMI6tk2RmbpYdXaTZh9gzE+RSL62+P8JMtvRJKihr4MRIfv2zkBc3/Rq5CzhqIKBkxIBTVujjmgJaS4AQirA1+eKA35W0MSnUtLTBVWCBItgXayxRYicVQ/gnG/NJuRBqwJHzmcymSqdJjvR/e4hLOGcXv/MyInhrWf2adGPx+qynEz8fOHxk75y0R/I5fPcMp332+aqlkBJIXqRKUfHlMupuIcfAhY7wl0MP04roLkCLyk8n/m/gNHo7+HqkvlM5x3cR2/eJm5OyGdNs5KUULYoG26UBRH6+UiKg4T/+xmCXf7xoUfBeq/HVbjShpUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 19:52:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:52:50 +0000
Message-ID: <5c7bacb4-d1ba-4980-92df-085c4f405762@intel.com>
Date: Mon, 12 May 2025 12:52:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/guc: Track FAST_REQ H2Gs to report where
 errors came from
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
 <20250508013437.652982-5-John.C.Harrison@Intel.com>
 <9c82c88b-9d17-4954-ae84-a89e73773038@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9c82c88b-9d17-4954-ae84-a89e73773038@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: b08cddb8-66f2-4e8a-f056-08dd918e9362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cERsUm5id2VQbWJHRlozTlc1SUEyNXplbEFzcngvTHRJdjhzTjczNk5FTmtR?=
 =?utf-8?B?MVhsTGpLenZDcGYzclFmRnJkTHNaajVsdDdCa0JiSFoxT1M4eHkvbmJPbzMx?=
 =?utf-8?B?SDVUNEVLK2RpUXhxQ3M4RGptZ3RhcmZROU14MHptT3dtbDlkTnVRMzlFdnFE?=
 =?utf-8?B?Wjh0V1lBVGxOVEZONDJTbW1xMmhCSm9oSVkwdjlKdUxWR3lXbGM4alVwQVMr?=
 =?utf-8?B?K0htVEdKVmxjZm90c1phU25lTkp4cjk1QTBxY0pPQVgyWDVQMDdBYWFvT3dV?=
 =?utf-8?B?eEpGTTl3T0VDaU5ST2tuZjN4QWFiclRkbVhYUityc2R5MitkdHczbEZCOXg4?=
 =?utf-8?B?WmdPbC9vU2lrSkVoR2wydWYrVzhyeWtSSkc1cmRGcnZndnZuNXhtMXYyd0x4?=
 =?utf-8?B?VndwbS9kc1YwY2NSNENHekUwNk9QNlZpc2h2NGNaNlAxd21UWGVtMW1NdndY?=
 =?utf-8?B?M0ZhUkRMaHZ4VGRVWEdKNEpoMWVzZmp5QTNjWnA2a2xyRDRBMFB4UExVcTRX?=
 =?utf-8?B?ZzQwUmxjcHNxNE9tSS9QaG9PeUJ6VFl3LzZBYjAxNzV3Z0VBQVpRTTNuRWQ3?=
 =?utf-8?B?WjJQaGdreE9objdSSjlqUHBnamVIcUZKdWhkT2tWeHJXSFNlNHdwRCt5TVl4?=
 =?utf-8?B?a1VUVlN5M0ZHQ0RvMG83ZzEzVW9jTG54QWpDb25jUjd0ZVVXbjAvTzN6UUJK?=
 =?utf-8?B?bDVYeFQ5OTFCUkFHNjZQamR0WWxxY2M0OFJjSVYvZURGa0RZRTBncXNNT3FX?=
 =?utf-8?B?NHo0ZjVMMnFyby9UMnduR3dMVkNjYzZoWVVDMTBtSUtpb2wwam5GdnBKajdi?=
 =?utf-8?B?YUpXTEZDcC9QKzJzeHU1OHVHREJENTdCb3N6OFRFa0NpSjlkT1RWL2MxVUQv?=
 =?utf-8?B?UnBNN2E3MGZ1Rld5elVhT1Q3U3FlUW9WOFgxbkNQVmJtOVAyanlBV3RDSXRr?=
 =?utf-8?B?bFFPdU9tMmpHdnVWb0kwTUpuVCs1ZmRVNnpxWWJnT1RzNmJLSkp6OFNmeFZr?=
 =?utf-8?B?OHd1b2Zaclh6VHpibGpYQVJmQno3OFlUZGFCdStxcUZoV1VLVlBRTG1CdE9r?=
 =?utf-8?B?MW1FMENvK2ZyeW1ySmZRRjVpVjJEN0QxVzNoNGVnRjVOMTBFaDBiUFR1ZWRY?=
 =?utf-8?B?K0hTWEdBU1NUZCtMMjFwS0tkald4STIrZCs2OXV1ZGpwQ2Y2b2x0TGZLRjN6?=
 =?utf-8?B?MWNheGtqUVphYlRreEVwcDZXVkswYzFFclNNWlMzS3B6bXo1SVB6MkJIdW5E?=
 =?utf-8?B?c1h2MmM1c2FlREFzUkpqd0J5SzZBYlhPd2YwRXEwL1dySmZmUWU0cGZtc1F2?=
 =?utf-8?B?WEJxRlFaVnUydWt6K1ZjdUVYdmtZZWFEc0NOaVRRZVRtZVViVDFCMmZoZGd2?=
 =?utf-8?B?RU45WFNzV2lXSHN1U1dZR0d1dXFrRDVuU0FaZHljVUhuRXI5NWFEeXR6V0pv?=
 =?utf-8?B?K3ZzSVhZZUdrazU3NmNYbE1kall1eW9IVGNLMGJVeStWUnhPKytUbEw5dzBt?=
 =?utf-8?B?SG83eTV5VEpIaDlwRXZGR2MwRTI5VmRLTEEwRitQK3l1NVNFaUFZMFpaaHZW?=
 =?utf-8?B?MmEzaE1OYXpDeDl3ckdqTlFlWEUxL2ovaDF1TWU1VHRFbXc1OHpkL29GbjFE?=
 =?utf-8?B?dWZmVGRSRzlZQ3I5NmRObHlNdC95c0llRElQTE5TdHlOSjY0U3Y1Um9rdjYx?=
 =?utf-8?B?ZVhNeTVYczNnODArV2gvdmEwSVRmdlVhR25nU25lMzcyYW80b1E5VW5WUUNa?=
 =?utf-8?B?TnZ5amFQK0w5ZCtqd1FqK2p4Sy9rRkg3QXAxOHlCYXFyUWlHa2ZMTEtvckM4?=
 =?utf-8?B?WHBZMm56NnNoMDlIempDTzg4TVZlaWR2ZjhneTlVa3FWc3Y4MG9IeWdwR2pC?=
 =?utf-8?B?UU1NQ1FuQXVtSjh6RktwaE5ZV3NEM1J2NnlVOWluNVdjcDFmTFhCdkVoUWF4?=
 =?utf-8?Q?TjyuQCiZf+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEhwVmFwbVFEcFBrbCtyVXN0WUtraEZTU3hrQzllakcwZXZ2d2cwY0VKb2hV?=
 =?utf-8?B?WDBNeGFEU2ZjZWNISU5PQjRXMjBnZHdnSFo0dllCMWVFYlpOSHFUT0NrMUsy?=
 =?utf-8?B?QWVpNHgyZ1JvbG9DQ0tJUDcxUWV0MUtsb3dZemRyaXZlZXRTY21WTURYcG8v?=
 =?utf-8?B?Ri9nQTFKVmtCV3hTWTVNNWVrMlFCTHlYdEZYZ093TW8wK3V3SVZUcWViSlNl?=
 =?utf-8?B?d2J3WXlvOUZXTzlMUC9JUXNSWGtKeTRxY0FIeHBVa01TMzB2UUY2LzUzd2o0?=
 =?utf-8?B?U1VqY0RWWmRnUFM2bVJ5NDU1ZTMwVTNqeUhSUXpqc0xKQmhsZ1UyblRyN0w3?=
 =?utf-8?B?TnE0SlZOTStKVGVvdDZqMUxJdmZsOThQdm9BQVJlUjhCL0w5S3BOaDkrWmNi?=
 =?utf-8?B?ZGRxV2VMR2pZS1hpR2RKdUhsbFRGOE4xcUh2WmF5cUlwSzhnempjQTZFRTJr?=
 =?utf-8?B?a3RZaDFKbnFuR1NXOGQzWTVPLzdmZmI3SGZZMFpuTDdyUlFoVVAvblVTZjZU?=
 =?utf-8?B?SWtHOEJwN1RiWm9xSjVkYVFrMjdzM2lDNTk1NTJ4QmtxYTBsNW15aGluMkM2?=
 =?utf-8?B?aXMrb0lpcmtERkx2LytJMGYzSGZRSHVCOWl3VWdrWnBmUkl2eklsVXI5UGJs?=
 =?utf-8?B?WGlXSDM4Nk93UFc5aUg3Y05Hd0ZFMnNhSEhTdmRvOTc3d0U1L24rL0xuaDN6?=
 =?utf-8?B?SEduNHVVenRuWTNoc050a0pmOVcrUjZQTTNFY3dSeTVqWW15Tys2aWRSVkI5?=
 =?utf-8?B?MnJHLy8wVEorSDlTR013QmFkWmx4OEVFNEU5Z1VpSU5PTDIyZEtGMHdVK2dW?=
 =?utf-8?B?N214RTA5cTZ1T0xrU1VOMGVDWUtMRGRNVTliZFJjamIvbC9MSXppeGIyVXcr?=
 =?utf-8?B?TGUxWUNLWjVmb25HV25ueGVoM3NNMkEzMlByUjY0MmtiS2xsL1g0NHVpZE5y?=
 =?utf-8?B?cGpsZU9kbUtHL1JyUmw3T0IwdW5CcEVhSVJYSWowbktuMkZGbE13OGlYelZx?=
 =?utf-8?B?T2xOOWNTemp5U3E3blpiMC9wT1BCQlVORm50TXN6M3NleElNblJ1cnArdTlw?=
 =?utf-8?B?c0JCc0R6ZU5Ta2Erc1Z5QnVZRzI1bmphaFlHWFJCSjUzUlpaUEVuK1lMRVVN?=
 =?utf-8?B?dDlHeEgxMFQ5ZktGUGRBa3Fxb3I0U3MwbkxCL3B4Y1RlRnlLaW1DeWVVVk1G?=
 =?utf-8?B?YitPbzc1eVpVcFR0c2RobFhPNjRBMlFRLzk3TUlxcEFsQmo1NzhMRWVqcUpr?=
 =?utf-8?B?QXVQeFFrUE5pU0VvMXg1L1hGaGowbHFFaU5jeUw2WlRZakhneUxicUZabUJU?=
 =?utf-8?B?Q1k2aFFNQ2RsWmtzdnlFbFFncHhKNzNHVkt6Y2UyVHQvMHFMdWNKQVRjOHpr?=
 =?utf-8?B?TTREM0hiT3lnREZlcXhZSlgxbDEweWg0LzloNzA1R21uQTIwUTNFZDMvSVpS?=
 =?utf-8?B?c09tL3RmZXo4SCtxcGZmeDlqRlNNYkR1NG5XVllqN2xxYWwvQTN0dlpUTTJh?=
 =?utf-8?B?L1IxYjIvbUc3emUwTUwxVko3WllxeEduYU9jRVd4OUtKL2cvcVF0WWUvaVFr?=
 =?utf-8?B?dGxFcXlkZkhXOHlGUUVvS0t1TzNQaTUzMjZwd3E1WmMyTWR1MG5mUDRIM09Z?=
 =?utf-8?B?NjVYK240TTFJTUd5K1RScFV1cnd6SHVla21RSDJVU0dMUEtpNGxSNUQ0dFpv?=
 =?utf-8?B?UUpSZEhpQU1jOVRIbENJaUZDZk1LVXlyYmVwc0FuZkZUNVVOVGZnR2hSN2RD?=
 =?utf-8?B?TFkwQ3ozd2tBMEpYdzdYNUcvekR2ditJZWkwSjlFVWVDTUtybnorOW50WVo1?=
 =?utf-8?B?OTFiQmJESjVWMk9NRnl2Q3k4VnFtVFZCZ1h0RGM3TWNteVEzL29GKyttM05E?=
 =?utf-8?B?ZnFFdHJSeUNycnlKeGVFMG9lZW53am9ZTWtXU3RJRmszQXJYQ3EyT3BZblNm?=
 =?utf-8?B?UDRzSGtDcmEzRmUzWTNuQjMxK1kwdzYwR3lSWlM2UFphYWorTVNlVmVYZ2k5?=
 =?utf-8?B?dGwwb3hnM3BMVjUvSVdwQzA5d2FwQkVRNUdmL2FwVitDVWVEbzhGMEpnZm1j?=
 =?utf-8?B?UDQ2UVptTDUvUUt0Z2ZFRkU5STUxWmw5YzB1R0o3TmxvZmZ6bWVDMTNoRjdQ?=
 =?utf-8?B?Zi9FV0NQQVJGMm9DVVFTd1RCaGNzU1NUOFRZMEhCSjRsSWg2Q2ZsN2QrZkwr?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b08cddb8-66f2-4e8a-f056-08dd918e9362
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:52:50.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8dRgAXwEXGakG1KmXGPpKflZKpORyi0MYpvI2r7cPm78CCGAJbDRrCw37WcVek5ZILm1HwzLXfnGAjrgEJRsRAUmdz41Kys2T8ME/hfKvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
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

On 5/8/2025 1:11 PM, Michal Wajdeczko wrote:
> On 08.05.2025 03:34, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Most H2G messages are FAST_REQ which means no synchronous response is
>> expected. The messages are sent as fire-and-forget with no tracking.
>> However, errors can still be returned when something goes unexpectedly
>> wrong. That leads to confusion due to not being able to match up the
>> error response to the originating H2G.
>>
>> So add support for tracking the FAST_REQ H2Gs and matching up an error
>> response to its originator. This is only enabled in XE_DEBUG builds
>> given that such errors should never happen in a working system and
>> there is an overhead for the tracking.
>>
>> Further, if XE_DEBUG_GUC is enabled then even more memory and time is
>> used to record the call stack of each H2G and report that with the
>> error. That makes it much easier to work out where a specific H2G came
>> from if there are multiple code paths that can send it.
>>
>> v2: Some re-wording of comments and prints, more consistent use of #if
>> vs stub functions - review feedback from Daniele & Michal).
>> v3: Split config change to separate patch, improve a debug print
>> (review feedback from Michal).
>>
>> Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> with few nits below
>
>> ---
>>   drivers/gpu/drm/xe/Kconfig.debug     |   5 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c       | 116 ++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h |  15 ++++
>>   3 files changed, 116 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> index db063a513b1e..01735c6ece8b 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -90,10 +90,13 @@ config DRM_XE_DEBUG_GUC
>>           bool "Enable extra GuC related debug options"
>>           depends on DRM_XE_DEBUG
>>           default n
>> +        select STACKDEPOT
>>           help
>>             Choose this option when debugging guc issues.
>>             The GuC log buffer is increased to the maximum allowed, which should
>> -          be large enough for complex issues.
>> +          be large enough for complex issues. The tracking of FAST_REQ messages
>> +          is extended to include a record of the calling stack, which is then
>> +          dumped on a FAST_REQ error notification.
>>   
>>             Recommended for driver developers only.
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 9213fdc25950..2d38aea9c0a2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -625,6 +625,47 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>   	spin_unlock_irq(&ct->fast_lock);
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>> +{
>> +	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +	unsigned long entries[SZ_32];
>> +	unsigned int n;
>> +
>> +	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>> +
>> +	/* May be called under spinlock, so avoid sleeping */
>> +	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
>> +#endif
>> +	ct->fast_req[slot].fence = fence;
>> +	ct->fast_req[slot].action = action;
>> +}
>> +#else
>> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>> +{
>> +}
>> +#endif
>> +
>> +/*
>> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
>> + * driver, the GuC will just copy it to the reply message. Since we need to
>> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
>> + * we use one bit of the seqno as an indicator for that and a rolling counter
>> + * for the remaining 15 bits.
>> + */
>> +#define CT_SEQNO_MASK GENMASK(14, 0)
>> +#define CT_SEQNO_UNTRACKED BIT(15)
>> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>> +{
>> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>> +
>> +	if (!is_g2h_fence)
>> +		seqno |= CT_SEQNO_UNTRACKED;
>> +
>> +	return seqno;
>> +}
>> +
>>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>>   
>>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>> @@ -716,6 +757,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
>>   	xe_device_wmb(xe);
>>   
>> +	if (ct_fence_value & CT_SEQNO_UNTRACKED)
> shouldn't we use "want_response" instead?
>
> it will be then consistent with the code below which selects whether the
> request will be send as GUC_HXG_TYPE_REQUEST or FAST_REQUEST
You mean the code above? Yeah, I guess. The two are basically derived 
from the same source but it makes sense to use the locally cached 
version and be consistent with the earlier test.

>
>> +		fast_req_track(ct, ct_fence_value,
>> +			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>> +
>>   	/* Update local copies */
>>   	h2g->info.tail = (tail + full_len) % h2g->info.size;
>>   	h2g_reserve_space(ct, full_len);
>> @@ -733,25 +778,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	return -EPIPE;
>>   }
>>   
>> -/*
>> - * The CT protocol accepts a 16 bits fence. This field is fully owned by the
>> - * driver, the GuC will just copy it to the reply message. Since we need to
>> - * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
>> - * we use one bit of the seqno as an indicator for that and a rolling counter
>> - * for the remaining 15 bits.
>> - */
>> -#define CT_SEQNO_MASK GENMASK(14, 0)
>> -#define CT_SEQNO_UNTRACKED BIT(15)
>> -static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>> -{
>> -	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>> -
>> -	if (!is_g2h_fence)
>> -		seqno |= CT_SEQNO_UNTRACKED;
>> -
>> -	return seqno;
>> -}
>> -
>>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   				u32 len, u32 g2h_len, u32 num_g2h,
>>   				struct g2h_fence *g2h_fence)
>> @@ -1143,6 +1169,55 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>   	return 0;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>> +{
>> +	u16 fence_min = (u16)~0U, fence_max = 0;
> fence_min = U16_MAX
Doh!

>
>> +	struct xe_gt *gt = ct_to_gt(ct);
>> +	bool found = false;
>> +	unsigned int n;
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +	char *buf;
>> +#endif
>> +
>> +	lockdep_assert_held(&ct->lock);
>> +
>> +	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
>> +		if (ct->fast_req[n].fence < fence_min)
>> +			fence_min = ct->fast_req[n].fence;
>> +		if (ct->fast_req[n].fence > fence_max)
>> +			fence_max = ct->fast_req[n].fence;
>> +
>> +		if (ct->fast_req[n].fence != fence)
>> +			continue;
>> +		found = true;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +		buf = kmalloc(SZ_4K, GFP_NOWAIT);
>> +		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
>> +			xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s",
>> +				  fence, ct->fast_req[n].action, buf);
>> +		else
>> +			xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
>> +				  fence, ct->fast_req[n].action);
>> +		kfree(buf);
>> +#else
>> +		xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
>> +			  fence, ct->fast_req[n].action);
>> +#endif
>> +		break;
>> +	}
>> +
>> +	if (!found)
>> +		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x]\n",
>> +			   fence, fence_min, fence_max);
> maybe we should also print current ct->fence_seqno to rule out
> completely broken received fence?
Not sure I follow. The only completely broken value would be one that is 
 >16 bits. Including the next value to be sent will give you an idea of 
how far backed up the queue is. So yeah, I can certainly add it in. But 
it won't tell you whether something is broken or not.


>
>> +}
>> +#else
>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>> +{
>> +}
>> +#endif
>> +
>>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   {
>>   	struct xe_gt *gt =  ct_to_gt(ct);
>> @@ -1171,6 +1246,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   		else
>>   			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>   				  type, fence);
>> +
>> +		fast_req_report(ct, fence);
>> +
>>   		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>>   
>>   		return -EPROTO;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> index 8e1b9d981d61..f58cea36c3c5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/iosys-map.h>
>>   #include <linux/spinlock_types.h>
>> +#include <linux/stackdepot.h>
>>   #include <linux/wait.h>
>>   #include <linux/xarray.h>
>>   
>> @@ -104,6 +105,18 @@ struct xe_dead_ct {
>>   	/** snapshot_log: copy of GuC log at point of error */
>>   	struct xe_guc_log_snapshot *snapshot_log;
>>   };
>> +
>> +/** struct xe_fast_req_fence - Used to track FAST_REQ messages by fence to match error responses */
>> +struct xe_fast_req_fence {
>> +	/** @fence: sequence number sent in H2G and return in G2H error */
>> +	u16 fence;
>> +	/** @action: H2G action code */
>> +	u16 action;
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +	/** @stack: call stack from when the H2G was sent */
>> +	depot_stack_handle_t stack;
>> +#endif
>> +};
>>   #endif
>>   
>>   /**
>> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>   	/** @dead: information for debugging dead CTs */
>>   	struct xe_dead_ct dead;
>> +	/** @fast_req: history of FAST_REQ messages for matching with G2H error responses*/
> no trailing space before */
I'm surprised checkpatch doesn't check for that.

John.

>
>> +	struct xe_fast_req_fence fast_req[SZ_32];
>>   #endif
>>   };
>>   

