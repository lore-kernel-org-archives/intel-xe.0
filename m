Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB95CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 14:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5289A10EF51;
	Thu, 11 Jun 2026 14:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxSJe8K7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466F10EF51
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187566; x=1812723566;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/NSLRXBLx4zIn/yQpyo43myaNhMj9g/G4okiEWI4K0Q=;
 b=mxSJe8K7Eih5SPCyua9RYTRe2nur5gQcdmizav4NJpHf0lXo3tcFKTV1
 xxsFeJDQ7JpodkST1j0NAesxHxhnlaiMDaJNpGEi37P6jmJBNy6nOlkFp
 UstrmlkGEVUyIMaqLwNcbNal5K3Q0pLKt4NvZ74KX4XRU9CQuBM39Oqy6
 ZWFoGL8JrjkiHiyB69QRlGt//Y4IEtKPF9NA8YUUspXtx+NQbFcGqpMoT
 6ACGpv5MmXErHPPS9u/9pVnAv+hbgvqJohoPq97y/YFvaryf3SBZJ5JfY
 cp9p8//gRq+nT1wM4N7uDnyqvWfFjHSN+CHYom+ttxPYjgDmQ44GPMJOl g==;
X-CSE-ConnectionGUID: rMdR70zKTL6ioRJ53jBmjg==
X-CSE-MsgGUID: c7EWtZA5QYeah2mlgr8jJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82006633"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="82006633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:19:26 -0700
X-CSE-ConnectionGUID: UETzCOsiQkqvDPTCg/JDJg==
X-CSE-MsgGUID: JWln3S1hR/SSDGH4zACNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="242352684"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:19:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:19:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 07:19:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaqWOUtmCaNU3db7N+uRq+lmG8lMgdKYZAgWJKtAOW48EUC9dXScBr4U+b0B6SsHENqF03dtHtFrLDf0qGzd4ERmqqPR26dWMyvmZMOOpk1ybhdVFvDq/CPnEUOff0gx+tsAEiK25OHV4zjRtlLcLCkeaRpIDpbHNvo/6h7H0T9+Ow6euRvi0lt4c7RmHmO1MVVglLzv0w1uZJaxhI4u7KphVHVv6iKF5TU6FTXcl2qX8s6ck3waXPLRhgI/NTqXYvWnM67Ipxvnxss5yU4LtJRoTjCSXLjpfOBSgsFHc6DDKPNax3E3IoFqNK06jB9vKpjjQmVAMYquXDktAg89ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAQTSXjcEIisayDlWxtQzDZjfNI6p4/igV+yWtOIpqo=;
 b=tShkMSOIDsdZsL+rrK5zA4icMIZdxvOrelxXX2etGvOKo0LwH92UrHUVVJ1l6/DFH9uDO8FM2hYqgNFICX1xgtJuWSmU1qGH6ZTsTBjpS6ThKDwUh8mYpGTtJU39IZYpt9rAH7pzk00Z58fl6TcE4LhGqhyhA+yvh+nCAU2vSGntw6j1PhQxu5kLYohKkuuTtene7UgBLxIBLGgMBqF/OaSQ4vwMueePkt/4ux6qcepeBqCVR1pB8BUxDfQ3TYEr92dBt9nqL8E3r+vbsui/3K7pK2CBNaI8OPy2x3M16FQ3YG+4Y+ci1p0gdFWIp5qEEDu6IIDbU3pGFPulAPH9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DSVPR11MB909287.namprd11.prod.outlook.com (2603:10b6:8:37b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:19:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:19:22 +0000
Date: Thu, 11 Jun 2026 07:19:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI v3 1/2] drm/xe: Convert job preparation in 2 stages
Message-ID: <airD6PtMyW+MXnsS@gsse-cloud1.jf.intel.com>
References: <20260611103613.191719-1-dev@lankhorst.se>
 <20260611103613.191719-2-dev@lankhorst.se>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611103613.191719-2-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DSVPR11MB909287:EE_
X-MS-Office365-Filtering-Correlation-Id: 894bda95-3e18-4591-ce93-08dec7c46f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|3023799007|56012099006|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: QwRPpRvK2QqDE8BAo9vJ40Ufj2RoC+XcmBIU/9Hoc2Z+hvRPBEAV9i1BWCYaXS3LZwmQbBOQsg41v9/BX70AIAGZp5jECL8DOi6r5h4T+nhxjg9cN1Ib2dAE+vetzHdtK0gCbsu+/gJhKtnPqKll5z1i17ljWyl4WD711yTX2Cfq9oZVE/ASBezNBt4ulZGmqVM8a6tHX0EGiBdkgnLvyKIMmywRIFdhG+RiPhC5y11B3snvl3zH+GQR+37Kda1J+rxzszolC5jl0C8LYJ6EEf00Ssgcd4TCmZX6LPxgESqy8nAvf7S/xSkPK6e/Nz5CxKeHM/xIpMGACnpDyQf5bFCezHPTlBPEVruxt80m3nI95b91eGYVTTwPf7E2NaM1rbZo2cL4MJPgsNuC3wiSzrW2ykwNXypIWs7R9QvWEmQucVzM5S5oc36UFeWG3TSn71rT+TWI4H8eog9ykUE1E9yQzz/m9Ptg0QOR8XpbQiK1oL8dgKNWO5D0KOJOOyuNpwKw9kLlXKNlhfEKQWoF/hJN3CvR6pYKGxbSz/LkLPNp4EcpF5dHHWMX5rziVncjQBXsd0TLp4tlIYNQAPjLG4LdNlDeT85Hm2+k4SAIX3Pezwn2ld7y9W/OGd5PrrbunLNrr8al6Ci0Tj843bc3K1hryvsVfH0aI/OExwA4S5pPvxgjvl1CPfvAStyfvJfy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(3023799007)(56012099006)(11063799006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVpMnltblJ1WENYdEQ5K0pveEhYN01yelIramVyK0I5ZEJxMlNsbmxKam5s?=
 =?utf-8?B?ZUs2aWxiUzh1MlR5Sk11RW9RWmtJSE9IUTQvamNubEdBZ2xKZGxOVzZscFRr?=
 =?utf-8?B?eS9VZ2dZSGtMV2FPOXFDbXl3c2VRRjRKWlc4Y05Dektwc2RQUG5yeUx5Q1Fs?=
 =?utf-8?B?d2pGRjc4OUxUWmRzai96a1F0dVE5bFRSQysxMGdVNWZyMkVlMzdoL1dtSk50?=
 =?utf-8?B?SktCTjRtVkdoYktMcjdIanJhMVN4SS82bnQ0N1oxYTM3cXMybWV3UFJwL0Mv?=
 =?utf-8?B?blJtSnAyQ2JBc3c2a3Jmc0xaWUU5VWRXOFdWL3JXdkNMMjdEeDhOUThSeGdD?=
 =?utf-8?B?MituZWJYZW1Kd24xaU5DQU9MZjY5c1RmaVVLcTJWK1hjL2NUYUIydXZHNVNx?=
 =?utf-8?B?U05EbnNFa1dhVE9ES1hjbXdkTW9ZNUp0dTlycGF0aTA5NkNyYlJsbld0ZWph?=
 =?utf-8?B?YTE1MmU5UmN1a0VuOGhDRjByNXEvMFZIeUVpN3RIRDU2cDFYZGhkSlA5cmNq?=
 =?utf-8?B?MEtpRHVzVGo2TUkwcnVMU2kvTkozZDEwMTB6dzFKODk5NDVlZUUvNkFzUE52?=
 =?utf-8?B?bUM0Wi9qaWZhVnBIV3hoRENtbTZENG0vdXczZmlLd3JmMVdrV2cyTEpDTDZn?=
 =?utf-8?B?aFNHaUtUWU1UTWhQcy9hVFJuZXpKdHRFVzV3Um1ST002TUw2WnBuYTU5dCt3?=
 =?utf-8?B?UklHUjNUMTVUSkZFaFpwS293cStsbE12SnlmZWVVdklnRDBjMFZQZ2ZDb1Zq?=
 =?utf-8?B?U1A0VldGa2pnUjk3ckxmNjNvY2pOV0FHQVNLRVZmaHA5VTE1dG5aZ29iMTEv?=
 =?utf-8?B?L3BwSGtIZVo1NnpaN1ZvT0pocU1RWktGQ2djb1dKZlhhM0xsZUZ6dklkMVhX?=
 =?utf-8?B?bmFjK09veEZxT0JBTUM4MmdEV1oyM2JnbTBrYVhES25FaFplbFpSdTdwLzdT?=
 =?utf-8?B?SnlFTGpxVXl3QkJGVXY4YVFrdy9SdmdBMzMvUmI5d0JPZEI0MnE3VnluRGJE?=
 =?utf-8?B?MGlVcTlHb29sbURYaFM3elBzZVFpYUtVaWUrWUE2WmRoN2hjMGxjei8yOWVH?=
 =?utf-8?B?NVNRUFA4TmcvcXhTemN1SWROcS9YK0lSZVR1b1FLNVJDOE1WQWVKNVhkai9z?=
 =?utf-8?B?d0puR3dzL29HMnhYTGI2ZXVlL2IrclJIWDVQNXNBVSt0blpvcHlpeUZiaG5B?=
 =?utf-8?B?YnRiT1ZxVWdncWhBbkFnaVJTYzUrcEN6VDNKd2M3RE5CQ2NnTGRnODIvVWox?=
 =?utf-8?B?ZEwvSnJwakVPRzNhK3g3YTBjMGFTNnJmK0dLZU52RncwS2lRNml6MnB1ckpD?=
 =?utf-8?B?elQ3d2VPaVdBU3JnU0Q3djBBVDg0ODZLemdWTnVVTzVpRktoWmY4TTcrOE9M?=
 =?utf-8?B?KzR0T2I4SE54VWthQmNnaUVlWW5VMEJteFNkSmFFU3ZseDM0anNUQzRKRUlG?=
 =?utf-8?B?UkE2TE9pNTFTMEUwMFBPWldybnAzb3dKMGxJdDRCc2dvZ3FQNVJKTHdBVzBw?=
 =?utf-8?B?ZzRlMG9sdm81ZDhtSVJJc3BpVi9HNUNaS0VnaW8xN2J1Vy93UVVwdFcrY3ZT?=
 =?utf-8?B?K3pJaTdsK1BZeWFjSU1raU9jbWVLeGgzVTVYYnBYSjROYngxOWhNWFBrNkk2?=
 =?utf-8?B?K0RmV2xKSGhJMmFWdTFpdHU4dnRZVDNMbWdodjZXaEVZQSt1RlNYSlRkNDYv?=
 =?utf-8?B?cEZ0aUVYVkxncEJlUXhNdnZXdGtCL3JxNlRlUjgrZXNvUXNLV2EyMkNBVEMr?=
 =?utf-8?B?cTZ6anVMMGJFNFAyV29URTQrNUNnMWd1UVRFRUF3OExIUFBSUkFlbjdOSUE1?=
 =?utf-8?B?YWpVc3pnT1JBaHNDcGhTLytYVnZ2S3JVYThSTmtucVZmMTBLLzhWQ0s3WTla?=
 =?utf-8?B?WFFsM2dCL1RRMkw5VTNYS3hhZnlwSFVQY0VHNDNkWjU5OENNU1pIbzkrODY5?=
 =?utf-8?B?cTQzYzl5TkJyb0g1UUFvWGdJQ2ZVMS9vMUkxQzhWMytjdHZEcjdNb2NBTzQv?=
 =?utf-8?B?am16VXhBaGViOWRKeDdSbVBVSFJJWmhqY1BjNUhKZnU3VE1meVVUNVVYWTJ0?=
 =?utf-8?B?MzBEL21jNnRtYzJRK055dmlyY0xFZEZsQVFzZ1hnT2NId0JZUUxXOWZFS1Z3?=
 =?utf-8?B?aXBkemd2Rk0yY1BYZlBKOCtNVWtaQlVISUljNWo4dksyQ1orMi8reEdNU29O?=
 =?utf-8?B?YU5nY0NzWjFUaVAycDBQRks0SFlKZmMraFpiTlhVOHB6ZmM0Y0xvTkF5VXlB?=
 =?utf-8?B?T1I0QklQbjV0Q3lLK3RTMjRQRjQwZVFLMEN2bVMyRDRCaE15RmNxZ0x3RWpt?=
 =?utf-8?B?NmRWbU5pcm1KRXJKbVV3MmJCRnAzNnRpUVM3blc0QXpHRWUra1VDejhZYnpO?=
 =?utf-8?Q?ozuHXenFfcT5QqEM=3D?=
X-Exchange-RoutingPolicyChecked: P/A7JuxbcSAuof1rZu12Lidxw9wtYdraBhGZF0WVYZyr2+REj8+H2JWqUst33TgfQ62Jb5nP40Td7UVTECH42cZSFArkvL8BFqf+nKp9+x8cNMqF8hlCoCKiG0100DPUNXzNAnlG4A5pqrVsFwatL0T9diBQ2URobTqdZ1xXOFI7ecFIg6GmPTf0qhfEDSCnjQiFU+3NV+kxgaLtFGKt61DiGYwZUUVfgY0GfzS6jLDOz0uCtOOOEExk5sdua2hK4R1yzYYVopwiqwZGwqI5FUbbSfLbB7ODb89MfNoC30WPXXIWJld8Dx87+iyDDZrJO36sP73Y1n9WbxN6FXgxzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 894bda95-3e18-4591-ce93-08dec7c46f0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:19:22.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /k+ofZA/+TzCtVbQ3MvtKRB5b8hBO3zLfhkgHV+vqoCrNfQQMqz/WYUBDXyVy+IRcfSgd+ANVBm2aHF4BGlBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB909287
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

On Thu, Jun 11, 2026 at 12:36:12PM +0200, Maarten Lankhorst wrote:
> Instead of writing the entire job at the time of emission, prepare it in
> advance.
> 
> This allows us to calculate the size before we submit, in preparation of
> allowing more jobs to run simultaneously.
> 

Does this provide a real benefit? For example, if 32 jobs (random max)
are queued, by the time the first job signals, the KMD may be fast
enough to program another job before the last job signals, effectively
pipelining the latency and feeding the GPU at line rate.

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
>  drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
>  drivers/gpu/drm/xe/xe_sched_job.c       |   4 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
>  4 files changed, 97 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 39a670e91ba72..9f1b0ac30d1aa 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -320,15 +320,12 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
>  }
>  
>  /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> -static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				    u64 batch_addr, u32 *head, u32 seqno)
> +static u32 __prepare_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> +				      u32 *dw, u64 batch_addr, u32 seqno)
>  {
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -	u32 ppgtt_flag = get_ppgtt_flag(job);
> +	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  
> -	*head = lrc->ring.tail;
> -
>  	if (job->ring_ops_force_reset)
>  		i = emit_fake_watchdog(lrc, dw, i);
>  
> @@ -362,7 +359,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> +	return i * sizeof(*dw);
>  }
>  
>  static bool has_aux_ccs(struct xe_device *xe)
> @@ -379,16 +376,13 @@ static bool has_aux_ccs(struct xe_device *xe)
>  	return !xe->info.has_flat_ccs;
>  }
>  
> -static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				   u64 batch_addr, u32 *head, u32 seqno)
> +static u32 __prepare_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> +				   u32 *dw, u64 batch_addr, u32 seqno)
>  {
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -	u32 ppgtt_flag = get_ppgtt_flag(job);
> +	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	*head = lrc->ring.tail;
> -
>  	if (job->ring_ops_force_reset)
>  		i = emit_fake_watchdog(lrc, dw, i);
>  
> @@ -427,23 +421,20 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> +	return i * sizeof(*dw);
>  }
>  
> -static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> -					    struct xe_lrc *lrc,
> -					    u64 batch_addr, u32 *head,
> -					    u32 seqno)
> +static u32 __prepare_job_gen12_render_compute(struct xe_sched_job *job,
> +					      struct xe_lrc *lrc,
> +					      u32 *dw, u64 batch_addr,
> +					      u32 seqno)
>  {
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -	u32 ppgtt_flag = get_ppgtt_flag(job);
> +	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>  	u32 mask_flags = 0;
>  
> -	*head = lrc->ring.tail;
> -
>  	if (job->ring_ops_force_reset)
>  		i = emit_fake_watchdog(lrc, dw, i);
>  
> @@ -491,19 +482,17 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> +	return i * sizeof(*dw);
>  }
>  
> -static void emit_migration_job_gen12(struct xe_sched_job *job,
> -				     struct xe_lrc *lrc, u32 *head,
> -				     u32 seqno)
> +static u32 prepare_migration_job_gen12(struct xe_sched_job *job,
> +				       struct xe_lrc *lrc, u32 *dw,
> +				       u32 seqno)
>  {
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -
> -	*head = lrc->ring.tail;
> +	u32 i = 0;
>  
>  	xe_gt_assert(gt, !job->ring_ops_force_reset);
>  
> @@ -529,94 +518,125 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
>  
> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> +	return i * sizeof(*dw);
>  }
>  
> -static void emit_job_gen12_gsc(struct xe_sched_job *job)
> +static void prepare_job_gen12_gsc(struct xe_sched_job *job)
>  {
>  	struct xe_gt *gt = job->q->gt;
>  
> -	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
> +	xe_gt_assert(gt, job->q->width == 1); /* no parallel submission for GSCCS */
>  
> -	__emit_job_gen12_simple(job, job->q->lrc[0],
> -				job->ptrs[0].batch_addr,
> -				&job->ptrs[0].head,
> -				xe_sched_job_lrc_seqno(job));
> +	job->ptrs[0].job_size =
> +		__prepare_job_gen12_simple(job, job->q->lrc[0],
> +					   job->ptrs[0].dw,
> +					   job->ptrs[0].batch_addr,
> +					   xe_sched_job_lrc_seqno(job));
>  }
>  
> -static void emit_job_gen12_copy(struct xe_sched_job *job)
> +static void prepare_job_gen12_copy(struct xe_sched_job *job)
>  {
>  	int i;
>  
>  	if (xe_sched_job_is_migration(job->q)) {
> -		emit_migration_job_gen12(job, job->q->lrc[0],
> -					 &job->ptrs[0].head,
> -					 xe_sched_job_lrc_seqno(job));
> +		xe_gt_assert(job->q->gt, job->q->width == 1);
> +
> +		job->ptrs[0].job_size =
> +			prepare_migration_job_gen12(job, job->q->lrc[0],
> +						    job->ptrs[0].dw,
> +						    xe_sched_job_lrc_seqno(job));
>  		return;
>  	}
>  
> -	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_simple(job, job->q->lrc[i],
> -					job->ptrs[i].batch_addr,
> -					&job->ptrs[i].head,
> -					xe_sched_job_lrc_seqno(job));
> +	for (i = 0; i < job->q->width; ++i) {
> +		job->ptrs[i].job_size =
> +			__prepare_job_gen12_simple(job, job->q->lrc[i],
> +						   job->ptrs[i].dw,
> +						   job->ptrs[i].batch_addr,
> +						   xe_sched_job_lrc_seqno(job));
> +		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
> +	}
>  }
>  
> -static void emit_job_gen12_video(struct xe_sched_job *job)
> +static void prepare_job_gen12_video(struct xe_sched_job *job)
>  {
>  	int i;
>  
>  	/* FIXME: Not doing parallel handshake for now */
> -	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_video(job, job->q->lrc[i],
> -				       job->ptrs[i].batch_addr,
> -				       &job->ptrs[i].head,
> -				       xe_sched_job_lrc_seqno(job));
> +	for (i = 0; i < job->q->width; ++i) {
> +		job->ptrs[i].job_size =
> +			__prepare_job_gen12_video(job, job->q->lrc[i],
> +						  job->ptrs[i].dw,
> +						  job->ptrs[i].batch_addr,
> +						  xe_sched_job_lrc_seqno(job));
> +		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
> +	}
>  }
>  
> -static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> +static void prepare_job_gen12_render_compute(struct xe_sched_job *job)
>  {
>  	int i;
>  
> -	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_render_compute(job, job->q->lrc[i],
> -						job->ptrs[i].batch_addr,
> -						&job->ptrs[i].head,
> -						xe_sched_job_lrc_seqno(job));
> +	for (i = 0; i < job->q->width; ++i) {
> +		job->ptrs[i].job_size =
> +			__prepare_job_gen12_render_compute(job, job->q->lrc[i],
> +							   job->ptrs[i].dw,
> +							   job->ptrs[i].batch_addr,
> +							   xe_sched_job_lrc_seqno(job));
> +		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
> +	}
> +}
> +
> +static void emit_prepared_job(struct xe_sched_job *job)
> +{
> +	for (u32 i = 0; i < job->q->width; ++i) {
> +		struct xe_lrc *lrc = job->q->lrc[i];
> +
> +		job->ptrs[i].head = lrc->ring.tail;
> +		xe_lrc_write_ring(lrc, job->ptrs[i].dw, job->ptrs[i].job_size);
> +	}
>  }
>  
>  static const struct xe_ring_ops ring_ops_gen12_gsc = {
> -	.emit_job = emit_job_gen12_gsc,
> +	.prepare_job = prepare_job_gen12_gsc,
> +	.emit_job = emit_prepared_job,
>  };
>  
>  static const struct xe_ring_ops ring_ops_gen12_copy = {
> -	.emit_job = emit_job_gen12_copy,
> +	.prepare_job = prepare_job_gen12_copy,
> +	.emit_job = emit_prepared_job,
>  };
>  
>  static const struct xe_ring_ops ring_ops_gen12_video_decode = {
> -	.emit_job = emit_job_gen12_video,
> +	.prepare_job = prepare_job_gen12_video,
> +	.emit_job = emit_prepared_job,
>  };
>  
>  static const struct xe_ring_ops ring_ops_gen12_video_enhance = {
> -	.emit_job = emit_job_gen12_video,
> +	.prepare_job = prepare_job_gen12_video,
> +	.emit_job = emit_prepared_job,
>  };
>  
>  static const struct xe_ring_ops ring_ops_gen12_render_compute = {
> -	.emit_job = emit_job_gen12_render_compute,
> +	.prepare_job = prepare_job_gen12_render_compute,
> +	.emit_job = emit_prepared_job,
>  };
>  
>  static const struct xe_ring_ops auxccs_ring_ops_gen12_video_decode = {
> -	.emit_job = emit_job_gen12_video,
> +	.prepare_job = prepare_job_gen12_video,
> +	.emit_job = emit_prepared_job,
>  	.emit_aux_table_inv = emit_aux_table_inv_video_decode,
>  };
>  
>  static const struct xe_ring_ops auxccs_ring_ops_gen12_video_enhance = {
> -	.emit_job = emit_job_gen12_video,
> +	.prepare_job = prepare_job_gen12_video,
> +	.emit_job = emit_prepared_job,
>  	.emit_aux_table_inv = emit_aux_table_inv_video_enhance,
>  };
>  
>  static const struct xe_ring_ops auxccs_ring_ops_gen12_render_compute = {
> -	.emit_job = emit_job_gen12_render_compute,
> +	.prepare_job = prepare_job_gen12_render_compute,
> +	.emit_job = emit_prepared_job,
>  	.emit_aux_table_inv = emit_aux_table_inv_render_compute,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 52ff96bc41004..5774ef6f3a265 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -18,6 +18,9 @@ struct xe_sched_job;
>   * struct xe_ring_ops - Ring operations
>   */
>  struct xe_ring_ops {
> +	/** @prepare_job: Write job to @job struct */
> +	void (*prepare_job)(struct xe_sched_job *job);
> +
>  	/** @emit_job: Write job to ring */
>  	void (*emit_job)(struct xe_sched_job *job);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index ae5b38b2a884a..9943e1ffe5798 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -294,6 +294,10 @@ void xe_sched_job_push(struct xe_sched_job *job)
>  {
>  	xe_sched_job_get(job);
>  	trace_xe_sched_job_exec(job);
> +
> +	if (!job->restore_replay)
> +		job->q->ring_ops->prepare_job(job);

This doesn’t look correct. job->restore_replay is a backend mechanism
for VF migration—i.e., a job is only pushed once, but the backend
internally replays jobs during migration.

So here we could instead do:
xe_assert(xe, !job->restore_replay);

Additionally, this patch as written breaks VF migration. Part of the VF
migration replay process involves rewriting the ring instructions with
new GGTT addresses. prepare_job now writes the ring instructions into a
local buffer, and emit_job simply copies them. As a result, I think we
need to call q->ring_ops->prepare_job(job) before emit_job in
guc_exec_queue_unpause_prepare.

Unfortunately, VF migration isn’t covered in CI, so before this series
is merged, we would need a manual VF migration CI run to validate it.

Matt

> +
>  	drm_sched_entity_push_job(&job->drm);
>  	xe_sched_job_put(job);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 0490b1247a6e9..5d4ea9dd09912 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/kref.h>
>  
>  #include <drm/gpu_scheduler.h>
> +#include "xe_ring_ops_types.h"
>  
>  struct xe_exec_queue;
>  struct dma_fence;
> @@ -29,6 +30,10 @@ struct xe_job_ptrs {
>  	 * job was submitted
>  	 */
>  	u32 head;
> +	/** @job_size: size of job in bytes */
> +	u32 job_size;
> +	/** @dw: the raw bytes to be added to lrc */
> +	u32 dw[MAX_JOB_SIZE_DW];
>  };
>  
>  /**
> -- 
> 2.53.0
> 
