Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8AE10A88E5
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 16:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5CB10E25B;
	Thu, 26 Mar 2026 16:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4RfYUjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15010E25B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774543019; x=1806079019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Vk4wPjkhM8Cpnzuf+F6aO9hHZcFZNcnFjIb/VK/JSk=;
 b=B4RfYUjg2ArAlYmFnT1U5Uu26zsraR9f63TyKe7ETewF0IWY9mJAwRdW
 jyZhvae+nEKE91PhDKvo3aTUCY7+RXOJ7+ARdEVVmmg7XqHN8o4wn6sik
 uNf+kb1buO7YNr6/BDStOOKPGSeojVA8N07xokIWXX9CozjSXjuN3hYAZ
 a5lxjHGWpx1zRTLhr78l7G+zL8HHfjy035SKB7H9g4ixWha0WFx1ZbzRs
 33uHi4uyRBM3XC/YNSG/rX4I9FrfOfSCnEVAM2mFK55lfgtlaewo5vTHA
 oG8GFxTXS/BhtXFaati+CxHuMA0KcnX7EeUm+sxrBcXtzVOWEleYHm52N A==;
X-CSE-ConnectionGUID: UM9tFRj2T8mQsDb8DnPWxQ==
X-CSE-MsgGUID: yxgWjAB2Tv6azRdlJkXDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74790809"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74790809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:36:59 -0700
X-CSE-ConnectionGUID: mbItiXEURmyIHNxu6G2jbw==
X-CSE-MsgGUID: dAYTtijyTLCxvargAFA8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224234610"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:37:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 09:36:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 09:36:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 09:36:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiADNwsjcouIqfJ4b5SDvadcSm3meDtEebR7h/m42C0dZzdDzcQ1IWDqFG555xEF1aD0Sv2efLRWTk3hPy1/iUNprbPM9qDi//QOrytrTkaKuuh+ZMSMWtDBfZMWxoCtAAz/qxOCSrEXwRCRvrFzOSBLIKHVrhOz4fhTNV/kJpTr6m7zJgKVse1disVKqjPmCVptU7X2urRlPcKDGItdv2fK0U/9M8jW5EpIyAorfog/Tf7teyXfvR7l9nwGfS3+tKXUmAgU8GglGp0z/66/rZDhPOvj+OSRoZgjohk321TCPm1tjVcWjTvHCXw9ddCHoSwivmxBRNqTJYcUD+eAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4thY/eoqW+xcu1DzEQg8pvKA8C7axSEktfLBe54c24=;
 b=XMO1+df69/HeOiEqoz1MTa4TQmq3oygPKa6aoz9aNKVnw0/c1LxaUNC7eHvAIV94VIispGYR3a3h+upD8V9Xa04AT+IxeLDob2Hnob/g7WFM9tSBaQQtAnWF4e0FTPogQG5hfzSMVxsYJUCpLJ0y8HMABjagGwcRWjBZVWWVPfAuVYN+ZaNx/KrKDW8QOBXstJSOblCw88voj4yo7zGcyD3S8kORoqFyNx7hYBGwKfY5Jugtg31asItEC0D8RTczEDPpximhl66DbPbomXlnCskSqF48uAI4nViLA0KDrqTAsWJq9NH8sv7jgh7XbbFATWIvkwzs7dkDe6mbLz48Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DSWPR11MB9690.namprd11.prod.outlook.com (2603:10b6:8:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 16:36:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 16:36:56 +0000
Date: Thu, 26 Mar 2026 09:36:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe: Apply WA_14026999295 to engine
Message-ID: <20260326163654.GB183713@mdroper-desk1.amr.corp.intel.com>
References: <20260325055116.509115-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260325055116.509115-2-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DSWPR11MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 164e8d3b-fd6d-47ec-3fc6-08de8b55e532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: uDM7fDFaohqy5ldBxuDPIJebt5EKJtCE9um5UcnEfW+ew7wFsOonk3gfI38gWHFuomjo/T01RgJsagBc/YPdmtNemZOpUz8sAVjWxxkGJ9v4nf/9qziC6Qm53AMrgSajThJxq1AscOAiP9QQoE96VwtRwtXJ7hIFYldGekcQ8cgTHXwO4DYGbWgGLShmP9BvKNEOxlIjWEMgHeTcdUiWj8D1Rnwx1sXD6r5yQYFeuv8bVL2N3MJVmf1nlsSImNZU4ZnhHzQ/Jfe2O7C0/EvhkZ4e9/SZwCVwGltj8iDtjoubYCD+zSknjJ8vSY9+v+AfD+VBgLPSFhPNaJMyDvSHijBciKbVo5+2EPnKhHMxMZF1z/MH+sydYxt2Rfom32oyw04b0QG0f5TQ7ooodke+/J/us+iSDnY4CONtMEqe6HqsiIMnWPvbXLMClhvpiTmG4wzQ/NtNDAUoq7MQE8YOAvd7oAH1uBg1jKmgmNOd1natB1PNmksjLsvPkXhVywXrHgpmclcOStNkH5OsMP4AdKZhAws9Z1eah706h3quajgrPHmehG8olbETzDUhed+PCLmyBuvFjCu+37ufEXXjkxbf/QRw61cmQpVqXZ03MP3fXZGkqO4vZbib43tMFQZAE0vKXMLQ3uZP+pF+e/yTgzh65FSUjNQpBfBF2OeLQp7mXUTw6vYW/nOTVNdyxq2t6zdOhNkYOe8cfocSlgA/QsJi1Hl7n8LsGoShigXIiOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gI+LIAoNBsXpSJxGbcIdyKmU0Vs1URR3k+gSZGZ/qjo2gP0aW5QW0dlURNj?=
 =?us-ascii?Q?jeJjOqc5nTR43wB3T5B/7ozQe1Lo0HAjPCIqffYNLFcUx5T7j4sf2OjCcfO2?=
 =?us-ascii?Q?EWSwncabSTaexfA+CcyYoqJZChzqKAETRLosnPT5JaCQgcPf2cJ2RywYttGd?=
 =?us-ascii?Q?siHP5TRKI2314nUg1RtzRtIpgSQ24eGGeZyUFt2yOXprDamdIEgSQA3vrMp4?=
 =?us-ascii?Q?mvqUwCLw6E2I410Ty8GHYkdLkU2MaafKU2BKa9MERvUABS1cTjL1vQbl/Ldk?=
 =?us-ascii?Q?Qc6ZouG7Cn9mj/hCC1oQ1AIMxyhUYWosUu18B2O99qepCOB11Yz7cinQTzPw?=
 =?us-ascii?Q?qYFfQOD8xl54SbMhz+gisLxMI2kNMcVPH5MH1VXup1ubjEfa20GW3Arr1aX6?=
 =?us-ascii?Q?Z6WEiDfDHx/uyoXNM2b/IZCfoM8YYV4cxyxtBXTMWvw3A/nKBHD81Zvuller?=
 =?us-ascii?Q?s83lhyOIwvAAVUdrUEM3lZMTQQ6A3SGvM4REYK6jpKMFw8pxCHdgThsVFVTO?=
 =?us-ascii?Q?aoa60jFc5PfteE4Zu6BKcFsZNr0qf7YYK56iiCp/T0U28UA+ZFttyuYWQHlF?=
 =?us-ascii?Q?XNwtp1PE1wVdXg0I35mSIweFENbA704EXNbB69I7tQ++TX8yS3YHlPN4c+ca?=
 =?us-ascii?Q?r5Y4RZvg4rJNXCeRNnFvc3yjNe4UhKU/zjQ301A2M7IvH6IoOh4kDbbP0o7w?=
 =?us-ascii?Q?5tzkqxjFBnmdSSM/oBTLBjI/122EgW8T+ydlwO86G+d1CmRpG5bs2YHPx/Vl?=
 =?us-ascii?Q?F+8VGwUNRaKQcBBAqY+FVCJs2Qu0VQDf3GxveVr90hWhtGwiGmX5sgb+7C30?=
 =?us-ascii?Q?ltVsj/qf9RqfUPvQNI5/h++/9Y16RLSFKsK9KsHpUxlAu0qKQsCpzvzT8KLn?=
 =?us-ascii?Q?3xoehtUy1m1FEjNA7XARG1rssZjvz+yGO/9Bbep7CRAECHSr1ynOcM6hm0Ed?=
 =?us-ascii?Q?WyAM06JOSI+JTsGHjyg2xUh3hS4bPZ8pNKf98Bbo3KrPJxEVdwihkD9K+ul3?=
 =?us-ascii?Q?VNK7P/IpUBVbZtmEE1AJqU81fTNXIIj3B9VSoysdbOXkOjMuRez0fung/GKi?=
 =?us-ascii?Q?G+gxkUDW8pQl6NXi1NMpU2+QJXlgzyRGK0Ej0/t2Az5DnbExrnAy3pkIx0iz?=
 =?us-ascii?Q?Ku6r/aTOBhtkdhdd12OBps2A9VJNlgQzQgpUS8WNu/0XJfGtWQvrhz5j9VsX?=
 =?us-ascii?Q?Q32PcP5VwM3jvnGyG/l8uqLEp5J05JiqAJT1aHRiYxJM/x4cZp3T8XjtxUUI?=
 =?us-ascii?Q?hYNdnI3RS5hVxEgDLJvisvZyv0HNer8F4RiPmPFXRH8N/AFuymam2IjxISUz?=
 =?us-ascii?Q?9f8CLUhL54SHglJmgg857NwPfFJSnCxTsTL6W+kRwIXYtYTZe4qCWaY84XN4?=
 =?us-ascii?Q?R4gx7bXku2N1L74VT1CJoI6Lgz0et7GFyQOjPuCtdcFo3pqQsC9S3Ab1Ov5a?=
 =?us-ascii?Q?QRMgwcnNxl+D7It0lcx0DcpZDofJqD5LxmGcBYuyqkpSP2v0VValb157xPlZ?=
 =?us-ascii?Q?RS3NQCoJ9praRP5gmpUo9hAY0ItBDG9q8EIKLRQetiveyADf97FFxV0V+MAC?=
 =?us-ascii?Q?oz2zknJblcZZqUh/z/m5SWpbmLQLX5zUC8XYAQpltlpfN+g46qx3kY8VU38v?=
 =?us-ascii?Q?Pr5YsiuXPek5blxYkqizsU4lFcgzCRCNJes6qiWjNVSeQ7XCNaPxdek31kiy?=
 =?us-ascii?Q?IVn6Yp+RYXupkOWCXF7nArRy+Ur46ujuU89K0U/INklDU2+t/2wo4WMoOtWj?=
 =?us-ascii?Q?QA1Pt6EyHrKAAHaNrIXLpt0UaAB0A/w=3D?=
X-Exchange-RoutingPolicyChecked: IX0oHv18VO3FaRNHIRTrV2S9jC3toJ3zldTXDKmPuxIgHI02pR4CSzFh2ZLs/WTKiBlTkrTzjxFYjq6RRNicWj1qOaDW9cFPNg7e6Itf3Ia2a71HuaO87ibijcG5xYXgi2QYVaNY0QRPJmcktY/Dkjamn73MdrgEuIuZZ6zArxrN+OO3j+oEOYRcyNdAxRsxFZO+IlKasVYaz48wqpYNB+P0cHZFCcHfJwT6EGYJNcE9PEMgcepS2ATJP3ckBqN7qD/kF4uYd5ngHJj7l3IAXgx+QWjZm7slu29PsowBIQA1nomlGqXXVJiJ/DLRO/Lz9YdkftM4sRXeHmtYbKHq2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 164e8d3b-fd6d-47ec-3fc6-08de8b55e532
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 16:36:56.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZIkWEWlnDcqKZ9J1/IvPTiUuNy7yswYDPrijoELtNvTEM/w7Ok7/fn4ePSqS0KRWq3sb9wXzLel46yZRL5KJ+1dlHJLbPBRMnJazau2lFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9690
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

On Wed, Mar 25, 2026 at 11:21:17AM +0530, Mallesh Koujalagi wrote:
> Apply WA_14026999295 to following IPs:
> Xe3p_XPC
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 84b80e83ac46..1e3f3ce491ac 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -528,6 +528,7 @@
>  
>  #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
>  #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
> +#define   DIS_EU_GRF_POISON_TO_LSC		REG_BIT(13)
>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>  
>  #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 8c55cd187a0c..13853fc67381 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -360,6 +360,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
> +	{ XE_RTP_NAME("14026999295"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3511),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_EU_GRF_POISON_TO_LSC))
> +	},

Since this workaround only applies to a single IP (at least for now),
I'd put this down near the bottom of the table in an Xe3p_XPC-specific
section, rather than mixing it into the middle of the section for
workarounds that apply across several IPs.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  	{ XE_RTP_NAME("14018471104"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
