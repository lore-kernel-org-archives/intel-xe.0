Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A418C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A001126B6;
	Tue,  7 May 2024 22:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awESgdtF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98A710F800
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715119845; x=1746655845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lxLMyw5+y+d0JhZMbyUxPDVrztmQmFrvSQ8K2lRww8s=;
 b=awESgdtFAyGWRNI289wJrTEWjv1CfnASHKyj2FR75dYD+A1Ow9njH70x
 D4GnyhzLUCPrOCWEZer5PBciIBcotasy3e+h7Zr5Towx9UOlziVfoZv8I
 MYjeS4inghOWiMDvZUOG+D5je1U1HYBMaqx/HSQ4c2458/+XyNcmdY3Ab
 TdmVZ4KDWkVTBVz7q3RlSz3Q0fdPhADp740z5+FcBFmDSBQMIwZWSUXat
 /JoXS7zVaHAxbdaK/sJAabFn/34od1rHpIly4obsgetCaBCuN8gAPpkfT
 lnQCXnF8vlP1To+ljWbog3mXxIPrIc7alh8vc9rANCU4I7F+wKarfb+bY A==;
X-CSE-ConnectionGUID: SDMLEHuFRjqiYdRoJyG+Ug==
X-CSE-MsgGUID: LC3UPImrQ3S8vIGuairP+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11103362"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11103362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:10:45 -0700
X-CSE-ConnectionGUID: cXzaVYK6S22e1nRSaZWAbQ==
X-CSE-MsgGUID: q0Wu3JnfRB6wiGEDJNUHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33225350"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 15:10:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:10:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:10:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 15:10:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 15:10:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT7KQB7YeqPEHUqUBkRq3e07AaWMyXCQAazx4Fv/K8yiofRR5dhtGky1NgiD79M7pvkVTYiTxkH2WXhNi7eQtutEM51A/GDjBZM4Yfj2TcpfsNh57ztTTJoB4uRJOzo19oHpXBiIO8maDVAKXUt/4boAt1V3eXXtMYyik8kfPfWRVC2yZN0wc0BVqrkI7LBiHzLQJYxLr095OTuEW6+oF7ALXjcsEJ89xv1/i0/SQDuSGk3dVGyq3rGS1PW/na6QAsgunuFi0oHRz6eVDvSPAnaxGZkylww3RlWHo0gr8mtKAsi3OEqiZ5ZRoCoKtVdEvx7K19No/qc4bpUqX7rtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeItEBgMEG1VkS0+h9wzRf8ibEv1WUxVyECb+DokE8=;
 b=O+HHDavDWFfFnsQHJzou9zDSpWHFIiGiXVjjMhg1OPwinmqUZb+kBvIw93J1NGHqJiyVwr61HGIxZjXnhLVlQo/3smd8Xcaz05itu2vlPthcu+3QkAYqYXO2ZWi+8mfzOyA1814xxoTlZZE91l07yWOuLcJP6T6/d5TJRLm4mujj7z8K6gsoMyryOsTyNPbYKvG4vqVCkYJzoePJRxY2Y2tAX+dgeAjl7Scql+BT5REsJLhJso/svDecARsg9AhjDQ9CBrq/wneFeOYApWaMeRaegHV9o8r2QIl0qcI1bemKi1CiAv+8uIdwXa34PoXpQtRhfrjEsTPx0sJmCrso1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 22:10:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.036; Tue, 7 May 2024
 22:10:39 +0000
Date: Tue, 7 May 2024 15:10:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe: Add Indirect Ring State support
Message-ID: <20240507221037.GE5615@mdroper-desk1.amr.corp.intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
 <20240506171111.16280-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506171111.16280-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: ba092460-4a9d-4434-5345-08dc6ee2878b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NXkGpRPpb5GjAKyxWX1/KRwu0lf26vFEWwixPC+/I+9mp8hCQIS7GAsQv7/I?=
 =?us-ascii?Q?+349PsqMCBYxDJdQ4IL7dj+xOW41TcpMD26fj584EJCbapdeDWk0jrQ2c2dS?=
 =?us-ascii?Q?9TjUrNUzNGdVsmdyZNBZ7bQ/BY7TPUQPHmszJjHOdYQgaL+1APNSoHaeSyLM?=
 =?us-ascii?Q?JthoL79M8h0dYfB3jradk+/Bw0X1GH1P70aMM8xNVRQGxBS/zeQN9v/0e++F?=
 =?us-ascii?Q?H5K/BB6dNLirQUS4p/pmwIw3qIej4igcL38gz5I7yWDfhVjeo5IaV2/C44Cl?=
 =?us-ascii?Q?Q8E1/G3ci7TaDeMcUILix3ggSsOtvzOMJI9oZcA9WHCHwvNl85QCQEypQhGy?=
 =?us-ascii?Q?t4HR+aaVfGJdxdMe94whMGcrdhPNbCQyo+iOM1H8EuykYY+Qj6/hHlucoGVY?=
 =?us-ascii?Q?aN9alSHrX0bDeAFREVeukhajgld2xP28+cI5Md9pkiBUgOLjPy0bj56ezIYP?=
 =?us-ascii?Q?4fhNBH+OlqQ0uxTcK8k0QQq9ibXQ8opQvjJfEEG3beqe5x+qhAos5uMhHuW+?=
 =?us-ascii?Q?VJ6FgGmT/yZL714YMiNn+GbUDTE6b+pNfWWxrIBUnnAtotZhjGhHmCn/E+Mg?=
 =?us-ascii?Q?qyZaSczVaUeWyjWZAqca2tG9DkJX5ppoyd2fm5wuvJqFin4m+7aGD6oKM7F6?=
 =?us-ascii?Q?YrfEVGYRiCdD6045X1LYAiVc3WvY01MJj0U14hVMadwvJmqxcbqeiDukBBE6?=
 =?us-ascii?Q?wXwvQQRhFTIjWGF+RhuWcAuQJoX5PBBUZB3pYF0lj69IZ+hE4oADLjoyzyAw?=
 =?us-ascii?Q?TCShNenQbfc083Mrt4xCqQycSaaaNBheMN7MbDZmNGPZU7yq+lyJBYSZ1DDW?=
 =?us-ascii?Q?/zrlzqVnFGCsb4Iw6BnEhQF57ZxkD7DFiUmy5dbXl6fm431bKwHowge85T87?=
 =?us-ascii?Q?5sqz+63vSQ1IPkJEOCa4bRJCdyXaDJYJkcMzfGXI3TS1uZbCta88Jkzr9b6G?=
 =?us-ascii?Q?Ru9rA2Y3ESD040aL/QGakL8cG4eZewlzTt+DauUrgNzso5+m7y8Hma/CgdvJ?=
 =?us-ascii?Q?/Rjth0p8ng/yczsiZaH8tr4m9TMolPZXSEGDJjaAD57+bmLbkVg1URLrfhwx?=
 =?us-ascii?Q?NhWVXCpmgH1ongA7GfOC6vSdfPeIzemrp/gkRXDAuKHSrGtJKDgqkGjefWEq?=
 =?us-ascii?Q?SdBQueKxWjz0Sf4FbCE4t1/maNof/xt5L1PNoDcz7AI8PGab6rabZ2hWG9mR?=
 =?us-ascii?Q?qsz/z3kEvgf9ec02q1xaHzmfLFfUKrEfD13t3fMaYpuf8dH0wRqDkG2mjhIS?=
 =?us-ascii?Q?yQcC8G+a04PHrt6Yggrps0WEAhcA7bNCQ6/d22+ZKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SaNXxpHMtQ6vpyAFit9yFb+cfU7KYRI1JL4TQF50ZyLwbE7Vszzwk2rr6gOL?=
 =?us-ascii?Q?3l1f5/FpEL18t2hfVTY+vATv7BdkrFhi5AFbcWq9HMZIcZ9WnF2YtPOVhLG4?=
 =?us-ascii?Q?D7aGIvYaOqE/9Bt9Qixbt6AErskWBNBG+f6Jfznq1fsYyQVb/UnHZtr/Ei3s?=
 =?us-ascii?Q?spkzSqs+VhC+gc9lGUvAoQ3lo4mABpb4Qh/ocTQQ/5PvWsDNjUwEtSY6URya?=
 =?us-ascii?Q?+TcNkRq5xfaJmzAnwEDDF2taOghJyx1uTXyBUB0255/JmH6HCfMCmfi/z0ct?=
 =?us-ascii?Q?4OPItlH2XboHfO1ne1qPCEBtkqo914kKknKEraI9nTX/QsqYbL3Lk/UrRCHc?=
 =?us-ascii?Q?5AG34Wb3GMOeQVltxVKJTlXGd+w+xMFdmehKpQUkj9G9eB8GumDn/A3DTuBv?=
 =?us-ascii?Q?Wnps04xHbo2irEjX4i6TF9MvUBdbSVrtIZusoBFVGFoWCQ9htRtDNSPTxMFv?=
 =?us-ascii?Q?NRDpPiXbjSaVL/wcrxBvN4YT6hvRBNWh9bX+i8Ad2MD4NyuNxwJ9Htf9hfK+?=
 =?us-ascii?Q?gh2fi4iuFadFsiF99R4hnamKJmwaGKYdDq2nlcqW9EOq6sI3llVGfkJf+uPO?=
 =?us-ascii?Q?/qOgkXuJEELCJXBVVm1iTm+IZEfr4hcCH3b1+XjjxauNpNzl2E/mmJ702GWC?=
 =?us-ascii?Q?ahg+g5MK1UHgVfiqC9YFd4+DX4/U20gJgsIaRVdOeJ96EZbrh7Yx2j56WW82?=
 =?us-ascii?Q?UqTZs4Ruvt7/FT2gyOm2iFwMhnGM+jwk2ER/1ysUjUs1r3oq7UH3jx3YZzxT?=
 =?us-ascii?Q?/VYlZLm36ms6Zd/p5guCa1EzdYJjsEAcJNhdN8g+Re3WA6z8Y+AXvfXwIWOU?=
 =?us-ascii?Q?ksJQApRjZmH+PkhSlHxjyJCUBW2+UhgFfdhVempMJvQjaIIP2DO02Q2DCL56?=
 =?us-ascii?Q?9J/V/VaNqNl2DtBhxmtHK8Kce4Vt9HG7AibNnXMDS6oHe3AoAs2lZD5OQQsS?=
 =?us-ascii?Q?1zLwBEPwm3wvWtBirmAs2oX+sca7J6UyTt5hCYYFe3emfavbW/uTfluv9z96?=
 =?us-ascii?Q?AKNyw74U+Qod0oK1CeYMZXW5kCmq+bybW7H1USMXuwoffWe1UdKnQU3NxSKM?=
 =?us-ascii?Q?sPOhcanSC+sPQS1YCBYI0nD835DXmz9YkjhbKeVImpn9cbp3BHnjwFkoDoGU?=
 =?us-ascii?Q?kgz4a+omLEQjnBFZCRXyNQKKoFQizMc6qosKFoa5KVd+L+1cSDoNRHZSiIF1?=
 =?us-ascii?Q?7qScK2PezFd5kJY0H0uUx1mKhMmBL4OmNVaQ11zKtIuiOQMM7bED2E6uU5M/?=
 =?us-ascii?Q?y3J+AzDnMmnINyuGisN9fDp/s1PCRJ9kne/9gAiw2FsSLGY8sRhdMXlNGfkW?=
 =?us-ascii?Q?zibXazp1kcWdiqIIpnI26iBi569/hBCbRDNRii7dUSjfenrutS8xXraYXIlE?=
 =?us-ascii?Q?eqvReNC15u/71DEgeR3k+nN7KTIjb7gtPvgw+yRuYZ6YeGKcWWDckWP8f2CR?=
 =?us-ascii?Q?5Z7qg6BlB7Gmv969rXHtoZMY1KhLSgrtdIHAiXju9RpUW2vAhskhwXDUKlIF?=
 =?us-ascii?Q?J6hovzkwmSL6LB4d7/O+VZT+5/llLixuhImPt8fJjsKxBOCF7QC7A5UrBy/Q?=
 =?us-ascii?Q?BMFLvgjU16Vv82mMJlFI9bnmLdtnIZ9LF7ejrPpjikU8a6vPLDz54AS/Rqv4?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba092460-4a9d-4434-5345-08dc6ee2878b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 22:10:39.8746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axVXUt8ygXxK97XXkkUDtwJCL90qfviuvWEUotdoteF+iZFRPUeexBSX40PkoqYmd3Mg600vxIps4MchuEPHrWIrwiCIZNSaoQP26Kiwgrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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

On Mon, May 06, 2024 at 10:11:03AM -0700, Niranjana Vishwanathapura wrote:
> When Indirect Ring State is enabled, the Ring Buffer state and
> Batch Buffer state are context save/restored to/form Indirect

s/form/from/

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> Ring State instead of the LRC. The Indirect Ring State is a 4K
> page mapped in global GTT at a 4K aligned address. This address
> is programmed in the INDIRECT_RING_STATE register of the
> corresponding context's LRC.
> 
> v2: Fix kernel-doc, add bspec reference
> 
> Bspec: 67296, 67139
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 +
>  drivers/gpu/drm/xe/xe_gt.c               |   6 +-
>  drivers/gpu/drm/xe/xe_gt.h               |   7 +
>  drivers/gpu/drm/xe/xe_gt_types.h         |   6 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c          |   5 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c       |   2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 185 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_lrc.h              |   5 +-
>  drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_pci.c              |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h        |   3 +
>  12 files changed, 197 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 7e1b0fd68275..260a44f46f7e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -125,6 +125,7 @@
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
> +#define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 1825d8f79db6..e6ca8bbda8f4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
>  #define CTX_PDP0_LDW			(0x32 + 1)
>  
> @@ -23,4 +24,10 @@
>  #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
>  #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>  
> +#define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> +#define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> +#define INDIRECT_CTX_RING_START		(0x06 + 1)
> +#define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> +#define INDIRECT_CTX_RING_CTL		(0x0a + 1)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0528d599c3fe..36c7b1631fa6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -160,7 +160,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>  		/* Big enough to emit all of the context's 3DSTATE */
> -		bb = xe_bb_new(gt, xe_lrc_size(gt_to_xe(gt), q->hwe->class), false);
> +		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>  	else
>  		/* Just pick a large BB size */
>  		bb = xe_bb_new(gt, SZ_4K, false);
> @@ -244,7 +244,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		xe_tuning_process_lrc(hwe);
>  
>  		default_lrc = drmm_kzalloc(&xe->drm,
> -					   xe_lrc_size(xe, hwe->class),
> +					   xe_gt_lrc_size(gt, hwe->class),
>  					   GFP_KERNEL);
>  		if (!default_lrc)
>  			return -ENOMEM;
> @@ -294,7 +294,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		xe_map_memcpy_from(xe, default_lrc,
>  				   &q->lrc[0].bo->vmap,
>  				   xe_lrc_pphwsp_offset(&q->lrc[0]),
> -				   xe_lrc_size(xe, hwe->class));
> +				   xe_gt_lrc_size(gt, hwe->class));
>  
>  		gt->default_lrc[hwe->class] = default_lrc;
>  put_nop_q:
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index ed6ea8057e35..8474c50b1b30 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_util.h>
>  
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_hw_engine.h"
>  
> @@ -58,6 +59,12 @@ struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     u16 instance,
>  				     bool logical);
>  
> +static inline bool xe_gt_has_indirect_ring_state(struct xe_gt *gt)
> +{
> +	return gt->info.has_indirect_ring_state &&
> +	       xe_device_uc_enabled(gt_to_xe(gt));
> +}
> +
>  static inline bool xe_gt_is_media_type(struct xe_gt *gt)
>  {
>  	return gt->info.type == XE_GT_TYPE_MEDIA;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index cfdc761ff7f4..8dc203413a27 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -110,8 +110,6 @@ struct xe_gt {
>  	struct {
>  		/** @info.type: type of GT */
>  		enum xe_gt_type type;
> -		/** @info.id: Unique ID of this GT within the PCI Device */
> -		u8 id;
>  		/** @info.reference_clock: clock frequency */
>  		u32 reference_clock;
>  		/** @info.engine_mask: mask of engines present on GT */
> @@ -124,6 +122,10 @@ struct xe_gt {
>  		u64 __engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> +		/** @info.id: Unique ID of this GT within the PCI Device */
> +		u8 id;
> +		/** @info.has_indirect_ring_state: GT has indirect ring state support */
> +		u8 has_indirect_ring_state:1;
>  	} info;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6a5eb21748b1..8b011acd8f6c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -267,7 +267,6 @@ static u32 engine_enable_mask(struct xe_gt *gt, enum xe_engine_class class)
>  
>  static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  {
> -	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	size_t total_size = 0, alloc_size, real_size;
>  	int class;
> @@ -276,7 +275,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  		if (!engine_enable_mask(gt, class))
>  			continue;
>  
> -		real_size = xe_lrc_size(xe, class);
> +		real_size = xe_gt_lrc_size(gt, class);
>  		alloc_size = PAGE_ALIGN(real_size);
>  		total_size += alloc_size;
>  	}
> @@ -774,7 +773,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  
>  		xe_gt_assert(gt, gt->default_lrc[class]);
>  
> -		real_size = xe_lrc_size(xe, class);
> +		real_size = xe_gt_lrc_size(gt, class);
>  		alloc_size = PAGE_ALIGN(real_size);
>  		total_size += alloc_size;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d274a139010b..34b19f0a6ad1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -677,7 +677,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
>  	if (xe_exec_queue_is_parallel(q))
>  		wq_item_append(q);
>  	else
> -		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>  
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f759f4c10914..ef954cd5cd68 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -34,12 +34,15 @@
>  #define LRC_ENGINE_CLASS			GENMASK_ULL(63, 61)
>  #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>  
> +#define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> +
>  struct xe_lrc_snapshot {
>  	struct xe_bo *lrc_bo;
>  	void *lrc_snapshot;
>  	unsigned long lrc_size, lrc_offset;
>  
>  	u32 context_desc;
> +	u32 indirect_context_desc;
>  	u32 head;
>  	struct {
>  		u32 internal;
> @@ -55,20 +58,25 @@ lrc_to_xe(struct xe_lrc *lrc)
>  	return gt_to_xe(lrc->fence_ctx.gt);
>  }
>  
> -size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
> +size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	size_t size;
> +
>  	switch (class) {
>  	case XE_ENGINE_CLASS_RENDER:
>  		if (GRAPHICS_VER(xe) >= 20)
> -			return 4 * SZ_4K;
> +			size = 4 * SZ_4K;
>  		else
> -			return 14 * SZ_4K;
> +			size = 14 * SZ_4K;
> +		break;
>  	case XE_ENGINE_CLASS_COMPUTE:
>  		/* 14 pages since graphics_ver == 11 */
>  		if (GRAPHICS_VER(xe) >= 20)
> -			return 3 * SZ_4K;
> +			size = 3 * SZ_4K;
>  		else
> -			return 14 * SZ_4K;
> +			size = 14 * SZ_4K;
> +		break;
>  	default:
>  		WARN(1, "Unknown engine class: %d", class);
>  		fallthrough;
> @@ -76,8 +84,14 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>  	case XE_ENGINE_CLASS_OTHER:
> -		return 2 * SZ_4K;
> +		size = 2 * SZ_4K;
>  	}
> +
> +	/* Add indirect ring state page */
> +	if (xe_gt_has_indirect_ring_state(gt))
> +		size += LRC_INDIRECT_RING_STATE_SIZE;
> +
> +	return size;
>  }
>  
>  /*
> @@ -508,6 +522,32 @@ static const u8 xe2_xcs_offsets[] = {
>  	0
>  };
>  
> +static const u8 xe2_indirect_ring_state_offsets[] = {
> +	NOP(1),                 /* [0x00] */
> +	LRI(5, POSTED),         /* [0x01] */
> +	REG(0x034),             /* [0x02] RING_BUFFER_HEAD */
> +	REG(0x030),             /* [0x04] RING_BUFFER_TAIL */
> +	REG(0x038),             /* [0x06] RING_BUFFER_START */
> +	REG(0x048),             /* [0x08] RING_BUFFER_START_UDW */
> +	REG(0x03c),             /* [0x0a] RING_BUFFER_CONTROL */
> +
> +	NOP(5),                 /* [0x0c] */
> +	LRI(9, POSTED),         /* [0x11] */
> +	REG(0x168),             /* [0x12] BB_ADDR_UDW */
> +	REG(0x140),             /* [0x14] BB_ADDR */
> +	REG(0x110),             /* [0x16] BB_STATE */
> +	REG16(0x588),           /* [0x18] BB_STACK_WRITE_PORT */
> +	REG16(0x588),           /* [0x20] BB_STACK_WRITE_PORT */
> +	REG16(0x588),           /* [0x22] BB_STACK_WRITE_PORT */
> +	REG16(0x588),           /* [0x24] BB_STACK_WRITE_PORT */
> +	REG16(0x588),           /* [0x26] BB_STACK_WRITE_PORT */
> +	REG16(0x588),           /* [0x28] BB_STACK_WRITE_PORT */
> +
> +	NOP(12),                 /* [0x00] */
> +
> +	0
> +};
> +
>  #undef REG16
>  #undef REG
>  #undef LRI
> @@ -546,6 +586,10 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>  	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH |
>  						       CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
>  
> +	if (xe_gt_has_indirect_ring_state(hwe->gt))
> +		regs[CTX_CONTEXT_CONTROL] |=
> +			_MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STATE_ENABLE);
> +
>  	/* TODO: Timestamp */
>  }
>  
> @@ -589,6 +633,11 @@ static void reset_stop_ring(u32 *regs, struct xe_hw_engine *hwe)
>  	regs[x + 1] |= STOP_RING << 16;
>  }
>  
> +static inline bool xe_lrc_has_indirect_ring_state(struct xe_lrc *lrc)
> +{
> +	return lrc->flags & XE_LRC_FLAG_INDIRECT_RING_STATE;
> +}
> +
>  static inline u32 __xe_lrc_ring_offset(struct xe_lrc *lrc)
>  {
>  	return 0;
> @@ -643,6 +692,12 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
>  }
>  
> +static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> +{
> +	/* Indirect ring state page is at the very end of LRC */
> +	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
> +}
> +
>  #define DECL_MAP_ADDR_HELPERS(elem) \
>  static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
>  { \
> @@ -663,6 +718,7 @@ DECL_MAP_ADDR_HELPERS(seqno)
>  DECL_MAP_ADDR_HELPERS(regs)
>  DECL_MAP_ADDR_HELPERS(start_seqno)
>  DECL_MAP_ADDR_HELPERS(parallel)
> +DECL_MAP_ADDR_HELPERS(indirect_ring)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -671,6 +727,35 @@ u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
>  	return __xe_lrc_pphwsp_ggtt_addr(lrc);
>  }
>  
> +u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	if (!xe_lrc_has_indirect_ring_state(lrc))
> +		return 0;
> +
> +	return __xe_lrc_indirect_ring_ggtt_addr(lrc);
> +}
> +
> +static u32 xe_lrc_read_indirect_ctx_reg(struct xe_lrc *lrc, int reg_nr)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_indirect_ring_map(lrc);
> +	iosys_map_incr(&map, reg_nr * sizeof(u32));
> +	return xe_map_read32(xe, &map);
> +}
> +
> +static void xe_lrc_write_indirect_ctx_reg(struct xe_lrc *lrc,
> +					  int reg_nr, u32 val)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_indirect_ring_map(lrc);
> +	iosys_map_incr(&map, reg_nr * sizeof(u32));
> +	xe_map_write32(xe, &map, val);
> +}
> +
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr)
>  {
>  	struct xe_device *xe = lrc_to_xe(lrc);
> @@ -693,20 +778,25 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val)
>  
>  static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  {
> -	struct xe_device *xe = gt_to_xe(hwe->gt);
> +	struct xe_gt *gt = hwe->gt;
>  	void *data;
>  	u32 *regs;
>  
> -	data = kzalloc(xe_lrc_size(xe, hwe->class), GFP_KERNEL);
> +	data = kzalloc(xe_gt_lrc_size(gt, hwe->class), GFP_KERNEL);
>  	if (!data)
>  		return NULL;
>  
>  	/* 1st page: Per-Process of HW status Page */
>  	regs = data + LRC_PPHWSP_SIZE;
> -	set_offsets(regs, reg_offsets(xe, hwe->class), hwe);
> +	set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
>  	set_context_control(regs, hwe);
>  	set_memory_based_intr(regs, hwe);
>  	reset_stop_ring(regs, hwe);
> +	if (xe_gt_has_indirect_ring_state(gt)) {
> +		regs = data + xe_gt_lrc_size(gt, hwe->class) -
> +		       LRC_INDIRECT_RING_STATE_SIZE;
> +		set_offsets(regs, xe2_indirect_ring_state_offsets, hwe);
> +	}
>  
>  	return data;
>  }
> @@ -731,23 +821,27 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct iosys_map map;
>  	void *init_data = NULL;
>  	u32 arb_enable;
> +	u32 lrc_size;
>  	int err;
>  
>  	lrc->flags = 0;
> +	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
> +	if (xe_gt_has_indirect_ring_state(gt))
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>  
>  	/*
>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>  	 * via VM bind calls.
>  	 */
> -	lrc->bo = xe_bo_create_pin_map(xe, tile, vm,
> -				      ring_size + xe_lrc_size(xe, hwe->class),
> -				      ttm_bo_type_kernel,
> -				      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				      XE_BO_FLAG_GGTT |
> -				      XE_BO_FLAG_GGTT_INVALIDATE);
> +	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_GGTT |
> +				       XE_BO_FLAG_GGTT_INVALIDATE);
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	lrc->size = lrc_size;
>  	lrc->tile = gt_to_tile(hwe->gt);
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
> @@ -772,10 +866,10 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> -				 xe_lrc_size(xe, hwe->class) - LRC_PPHWSP_SIZE);
> +				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
>  	} else {
>  		xe_map_memcpy_to(xe, &map, 0, init_data,
> -				 xe_lrc_size(xe, hwe->class));
> +				 xe_gt_lrc_size(gt, hwe->class));
>  		kfree(init_data);
>  	}
>  
> @@ -786,11 +880,25 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
>  	}
>  
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
> -			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
> +	if (xe_gt_has_indirect_ring_state(gt)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> +
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
> +					      __xe_lrc_ring_ggtt_addr(lrc));
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START_UDW, 0);
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, 0);
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL, lrc->ring.tail);
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_CTL,
> +					      RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
> +	} else {
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
> +				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
> +	}
> +
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>  
> @@ -834,14 +942,36 @@ void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_put(lrc->bo);
>  }
>  
> +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL, tail);
> +	else
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
> +}
> +
> +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		return xe_lrc_read_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL) & TAIL_ADDR;
> +	else
> +		return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
> +}
> +
>  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
>  {
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, head);
> +	else
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
>  }
>  
>  u32 xe_lrc_ring_head(struct xe_lrc *lrc)
>  {
> -	return xe_lrc_read_ctx_reg(lrc, CTX_RING_HEAD) & HEAD_ADDR;
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		return xe_lrc_read_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD) & HEAD_ADDR;
> +	else
> +		return xe_lrc_read_ctx_reg(lrc, CTX_RING_HEAD) & HEAD_ADDR;
>  }
>  
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc)
> @@ -1214,7 +1344,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  	 * hardware status page.
>  	 */
>  	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
> -	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
> +	remaining_dw = (xe_gt_lrc_size(gt, hwe_class) - LRC_PPHWSP_SIZE) / 4;
>  
>  	while (remaining_dw > 0) {
>  		if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_MI) {
> @@ -1355,9 +1485,10 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  		return NULL;
>  
>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> +	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
> -	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> +	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
>  	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
>  	snapshot->seqno = xe_lrc_seqno(lrc);
>  	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> @@ -1405,6 +1536,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  		return;
>  
>  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> +		   snapshot->indirect_context_desc);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index d32fa31faa2c..06a95a598736 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -21,14 +21,17 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size);
>  void xe_lrc_finish(struct xe_lrc *lrc);
>  
> -size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
> +size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>  
> +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
>  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
>  u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
>  void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size);
>  
> +u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index b716df0dfb4e..cdbf03faef15 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -20,10 +20,14 @@ struct xe_lrc {
>  	 */
>  	struct xe_bo *bo;
>  
> +	/** @size: size of lrc including any indirect ring state page */
> +	u32 size;
> +
>  	/** @tile: tile which this LRC belongs to */
>  	struct xe_tile *tile;
>  
>  	/** @flags: LRC flags */
> +#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>  	u32 flags;
>  
>  	/** @ring: submission ring state */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 912b59fe9567..8f3e4c563105 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -663,6 +663,7 @@ static int xe_info_init(struct xe_device *xe,
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> +		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>  		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>  		if (MEDIA_VER(xe) < 13 && media_desc)
>  			gt->info.__engine_mask |= media_desc->hw_engine_mask;
> @@ -680,6 +681,7 @@ static int xe_info_init(struct xe_device *xe,
>  
>  		gt = tile->media_gt;
>  		gt->info.type = XE_GT_TYPE_MEDIA;
> +		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>  		gt->info.__engine_mask = media_desc->hw_engine_mask;
>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index e1f2b4879fc2..79b0f80376a4 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -27,6 +27,7 @@ struct xe_graphics_desc {
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
> +	u8 has_indirect_ring_state:1;
>  	u8 has_range_tlb_invalidation:1;
>  	u8 has_usm:1;
>  };
> @@ -37,6 +38,8 @@ struct xe_media_desc {
>  	u8 rel;
>  
>  	u64 hw_engine_mask;	/* hardware engines provided by media IP */
> +
> +	u8 has_indirect_ring_state:1;
>  };
>  
>  struct gmdid_map {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
