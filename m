Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E711C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 13:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735F310E85E;
	Wed,  3 Jul 2024 13:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="li0kz0Er";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288AE10E860
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720014847; x=1751550847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ptJSNAcgowRBfpJ97iVFrJb8iRBw9opZJtW8GZIdVbw=;
 b=li0kz0ErA9pzdDZclYZ1ji2AQD4x6MGo4JeDOEb4f4EwX60Otq2Iy0PT
 xHPztCBpV0uCCLJ/tnxyVDA65l3KibQhNW0I5TqBmIhjOzb6qHDChFyx9
 eD7GtKPNclgJVFeOCZ74+dHhKk32y5NobxO4RhebADIYzg6wjM7ib0rBS
 maa0KCdkt1P5EYy9WQAnaJlFrqTab1HFTqoY+lj1JQvtW+tloaTn/5m0d
 l4v3r7DkB0FS+RXGMUsOUGcHtCAyGPGxlLLIdcHu839L5lXlwpS/JN/M2
 1Q9yzhWZG4JGDAyEku4DAE1NBiJSBycoxOyaz5NOCjpPca3TgNfKuWi6p w==;
X-CSE-ConnectionGUID: Pr4k3eNSSU2sbowq3PaMXg==
X-CSE-MsgGUID: CDR/TndOSvasuqfbN/rt4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16968253"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="16968253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 06:54:07 -0700
X-CSE-ConnectionGUID: VCqVUPUYR6qUgda+OcIleA==
X-CSE-MsgGUID: CmyQbotKRfiPMMYaBmz8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46233927"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 06:54:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 06:54:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 06:54:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 06:54:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTniBn8E3398W7tNQ5K2tWU7fQnl5+p2j/zF3baIxSCGp3r7eJxgVhRDAT/XuGGef2dkQWq+Ui+NVqWy46bes8D1LfUOmZLFhedF+2Kr8mqMECCB05fx8hVGLjZ2JXfVvSoW2qDhdmC0cFFsnDauB4GU3ZS/ZkoPaKCRNr9eSOcv+pBj/WC4uTOxtqiIcQbvZH8ax+d2IrtOB81MsEum/C3MY9rn/llZ/k+wkZ8yOQLRCAKQn5c/g140jtqZM74cN/8JXwMvO+ARbmbJ9iUsziykFWYB4g8Q6Yo6/QUb9i33EZkYjaBQKfw7vR0EBSWFKKvLasL4RHLeW+bZcSsJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9cAppmuoa6SrzvzpHVMog5aIi1jdGqPsMChAbZfO6E=;
 b=arYcbZ9qDdUEt1Hyz/eNxH9WMncuf5GW6uJyZRa88xy5lxgITKTyCRjOTJgxv9hC5EM4JX+rNPFnpASozlQTd0Ijt53Hj1ZlP6KjjEVhextxZZfhVnDc2MW+NHVC6DMHFlK05WHwMiCa4zqhg++qvXGj7/MEhuYpSpg/SxBB0KEnlw/T8EWyQ6Gri9v6rdmyz9JUj0vBOSbrtNZYW5aSZMeo8dfXrieerC9dCuTiFc0hhaFWdX0ZP5sdzr4poxlCxZpl0XbcIq9rDpYIY4mXtUzQiIX6r+hAvye6fEXnyMIcHIDBOHE1b959EW5qMnO+33G98oASuOJwBpLHnhLWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 13:54:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 13:54:03 +0000
Date: Wed, 3 Jul 2024 06:54:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend workaround 14021402888
Message-ID: <20240703135400.GA2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e69df36-eab6-4a44-a442-08dc9b679931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bR+y4ZvYdmqQ+9GNjlcfb8k3FbpQfQQRWaxpTWGhe36gMkkJBISNzbivrXYW?=
 =?us-ascii?Q?6GEjVgeeguB2lMNB7vSeRMDYx7SHKD8cOFYiJ4/74NKh8+w8fRCs2D63D1Hn?=
 =?us-ascii?Q?JKU+MOb8b9JgLdfQYfsQkB8XlYrHqSJYHGndQ5mXhv6CQ0usj3ADj/1FRjz/?=
 =?us-ascii?Q?Q7TFVRnboIcIFsafiLntNwwURsXGmosYEgqQ2wpebgiFFHH2RpNtaavuCJAn?=
 =?us-ascii?Q?skCWOSL3B08w+w5wEAftmR0BXflf2H9yORkPbLIlixlWQAj9YgWzfK3IGn1E?=
 =?us-ascii?Q?l5e4PxW0IWtv/1q0ZFzneca4fYzEmUTTuGfnM9Y8iIU9EgXo5MizH0c7dRN0?=
 =?us-ascii?Q?9F4nRuGJI9aCICouIV8x7RmXnKelPTS+c+Z95NU3m08epQIAbXJ8h5cW8/SD?=
 =?us-ascii?Q?twoYfk1HkN2aUxRwAQxTxYJRWjuH2+p5O4E17gwpSdI8ddWMv2GtFYkh5gxM?=
 =?us-ascii?Q?wTwqAVOErpRUFs1RIrl32Co2r7KlBSTH/OjhZWEB9qSPAqg1E+CD5qSM1mVr?=
 =?us-ascii?Q?emg3OMpF3lN/BdZs8Dq0m03CCxWeD8NndIlNRcS4jmx6c676JS7p5PSya4S+?=
 =?us-ascii?Q?zQbJmXINQs01qDLkthdHO8RtztEr+nKD1fHMQIdQmTVoxtDd4oNdAakpY668?=
 =?us-ascii?Q?rKxDQVpxcjhX2aX3ai6AhQjO9IzUrQhbgDQ9iVvBPDGxJEN8UeyJXxPu+clT?=
 =?us-ascii?Q?dcTUwwA3DghF9u4+sYhq4GTB2FlKe/P0yHetmKIO0Rhr0PlBcjKhQ6/yF5fX?=
 =?us-ascii?Q?NE2/lWH99zPSmxmcAWY6iwF/m2xpJjlKjodNJWJa0duQEMc02pDVcXLdiPjB?=
 =?us-ascii?Q?w2V3SfWCUReXBhoAWA1wN3axOFzUjsPPcYnN0mlpR9fPdnfwJJzTeMJec6C/?=
 =?us-ascii?Q?qaBOGbKjbhfcD9eoHmY5GTsxHfBgYk1QTXYnawDRhIQeQDGW2GJWhJwnmVGU?=
 =?us-ascii?Q?s06xyOcl1JPAIaPp2MIzCneByTud/Ftj5Rp40ofqx2Tfta2RxYOVIJdUONkm?=
 =?us-ascii?Q?MJfZoKdVaRKuuL7cgN8dKNimpuZc2XdDiQJTUuh8czOWLmVpwVLFDupCoDPi?=
 =?us-ascii?Q?f2J83AEMzwynwucHXW9NgnzgOUh/l9aaCX13Znlf0e2+WDxHNleJkcRBg+3O?=
 =?us-ascii?Q?WZTxjNOnyEfLmW3FDEAUcyXTL8tvAIXIE2cyCfVgRVrIl+4m5T2o32CfPeBb?=
 =?us-ascii?Q?9EG+k/ZBYctWLkpEmFggpDfirf0KYpFSw6DyECt2R/LeTL96xopW2b6OpBlz?=
 =?us-ascii?Q?h0echUDD4whYYI85ROt83IsHmjjpo8w0WQ3KM63PRkMDiRhG5/havOJ1NlWN?=
 =?us-ascii?Q?UAIcXqS3mPQspLJxBC8ibWPTVV5TT9esGq5+aInUH9i9vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?swtzV3ixC1tUBKMlmFrQRGz/lmtAxkRJZf89R7Cmp96uqv2OuknbfJt17aYD?=
 =?us-ascii?Q?2YhlRTVziWaonH/PaKtjZkMHVFDGwT5K2unBUTNtVFWKMaS78LVhU1Wh0LhR?=
 =?us-ascii?Q?ztMXGrt9OxZs0GbeOvF7YNwzwrgmhRiU2k6I/E3Wg0L0NGcFb2yJCYsg0WdK?=
 =?us-ascii?Q?4JoqGYPcXP/sAuZNNXJ1WijRCRhpRS7r3FKb9JnMnwGONaEI0OYCmQiRSdG6?=
 =?us-ascii?Q?2IJXZ1fevx7ZYDm9LtxEP6LnvJLsnyHNyP6f+SqtEsJee47/djyAucQ0H7rO?=
 =?us-ascii?Q?MvP8tIRFpL5xA2Q+lTzYWO87q98t0m8qbvXEUil6y+ZoGM/RxlDzE9UmwNzl?=
 =?us-ascii?Q?opetJcaS50lvsDpgEeJEPlRhar0/ms41WI15zABZgVWtwtW4OuMYKEm8lKvH?=
 =?us-ascii?Q?ivL+8snPN9ya3vdBnw2wyF/JbtJjmjUwFFm7lAS2pOUBIfnIVcX7oQnrBdam?=
 =?us-ascii?Q?YUY1vMegI16lUPP5szs7ySCfBnFWWRRBgyWu/zlYp0WfNbhl16B/fOFsP8c+?=
 =?us-ascii?Q?4z9XnhqzXDBaJYUn4SbrtT/Qz5+nCkafobnGS9AX5mTP46qIRpZOhGkz6TUQ?=
 =?us-ascii?Q?Yio5g/AFr9S6aqyZAwjQ0Y/cxJjy9BxNFhWlJDZ9tXJDdruDfuLlFo5/BMm7?=
 =?us-ascii?Q?KQLzZ6/0gnqgxpqZSaYB+ky7VK5nuKxxl7h4d5JULKIaMEzEdL5w7pUxt2Ag?=
 =?us-ascii?Q?b0J4QwjGQw3qer/r2Kd8kk2MkhmH/WrXQuf+YoPagWhIsmkRNq2O2xUOG9vN?=
 =?us-ascii?Q?E7T/EuslAuLoCFkIBp5b/AvqvYlrj/u5fUxgQ/hFxr9I16GVvJgGEtkMFoiI?=
 =?us-ascii?Q?3qYGnWHgoz2N82shvWIDZZ77pHQSBpGfVKOsa+g5hcM6Ki+NLe7hbddvoDAV?=
 =?us-ascii?Q?sBbxm4CzE6grMCQoq59Vqo9LuFcSxUAuMdL+BjKXXLJ+E2lTDLZNPh+wKcy4?=
 =?us-ascii?Q?SNJdR9yJBOs7HD3A732Gldf6ndKHvjuolKjUEV1iGLPhZkV0kT6GW3SzpT36?=
 =?us-ascii?Q?XmkpqKGnFKGhH7aC6ORLejFxxuNyNaN82jOdI8UAVJ1iZQGGgex/4Mz5z5Dz?=
 =?us-ascii?Q?JTgZxHn2r9TrH+gQnnotVWQG+ZfKdcSGkPYUzw8P/YJgZR6Bg43uT4iNLxqf?=
 =?us-ascii?Q?R7y09N2MwwRS+Rrmk9NE/QWPzWFRGWjtbn1tI96AZcauTQnXRKFmV+fVKuGi?=
 =?us-ascii?Q?1AI1aZKQUEy0nEbZnxxWummyAfksjQ3ZtIlPY0uFGDvC1VawSyAg7UzpPDtK?=
 =?us-ascii?Q?83y9UEdncjLUPzaQiSu4blMCx9MgAHPUOaIjQtJaz31na9mybPx3J4ckkIYc?=
 =?us-ascii?Q?Le1eAm4SDP/7ZEw9zKdJJUcZN8xeNnvgkGbcN+iZaQtU0ZJeGXMiBcmM+Tha?=
 =?us-ascii?Q?+7vDrRAmeaBK7eXy+dS8ssIfAtApAGmiW/YG663C16JfkoQTX3GBBetzuwkZ?=
 =?us-ascii?Q?zrRZC01Peg18iFXy1i/1v98JOQacP75B0cCy3U38pD4TY0i6xgj5vEMUEUO9?=
 =?us-ascii?Q?iwHffddkPiRoRDdzXDntMTe7xxpOaczm6ot5b+6kd8qRvNw9zpgkvqtnYJcQ?=
 =?us-ascii?Q?7Dtft/VK2XKPCJXiSzhtb/0ahlJLbhsYxu8LEk+YnB6bVqBh9NKgRj7G/Aj3?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e69df36-eab6-4a44-a442-08dc9b679931
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 13:54:03.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFZ6YEBNZAzysiFkaKwYObP99nrWZl9W8syBQdPFSZq6zMA1b+e5ZyGO4nS2uuVrlSuHHeLqvOExx4LfauRKlEMtqfNWcuFapNz2lgHHGeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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

On Wed, Jul 03, 2024 at 02:37:54PM +0530, Bommu Krishnaiah wrote:
> workaround 14021402888 also applies to Xe2_LPG.
> Replicate the existing entry to one specific for Xe2_LPG.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c7bf0862b231..91737d7a483d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -486,6 +486,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
>  	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
>  
>  	/* Xe2_HPG */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
