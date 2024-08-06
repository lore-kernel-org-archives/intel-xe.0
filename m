Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1562C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 20:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6C510E3FD;
	Tue,  6 Aug 2024 20:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAZ/Cl7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8D10E3FD
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722976837; x=1754512837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TBS+qTY7keNQs7ePVi1f2R9zgX6SFj20YeH3BN4m5pA=;
 b=cAZ/Cl7wFLDrPiJ6om2xroffl0HVsu3otMgqWWZmz58eUtYHp/RrWcKe
 dIdVYgvsbF7wi6+5CXdfOFYBoPKjs91cs5Mft1NMrb1b59uExcBFU3FJr
 P2mbxdbPQM2PlGCiayAWVISSeSMBx0wsKJXE02YzzpSe/dIuxVvRoDNF1
 N8uHiU/+LBNVGEi9vLtXG4b9J9mYTt7aa1Qixu+MGi4yHH+G6LZgM0QsJ
 Pkv4qD0KSBQ9nqtT5+ezZ7/0XMTi5Pmkr45TZxGyXNmzO5m4N0kMhZkgy
 pRGA3vvQ7w7QCa8HC3L8tgfjfpvikDMLfPQB92T9pzDOcPWaG0c3TcBu4 Q==;
X-CSE-ConnectionGUID: QCdzGt5xRZmIgucSyah6Fw==
X-CSE-MsgGUID: PPKgpmu7Tz2N4sqkcPTEiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20989437"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20989437"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 13:40:36 -0700
X-CSE-ConnectionGUID: hRcWDkBASF+BY84kMX7Jyg==
X-CSE-MsgGUID: K89HrMz1Rr2pv1yDMPKZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="57183867"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 13:40:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 13:40:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 13:40:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 13:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGdMoCiS/IniO7g3eYkH7NgvqgJq6dcnJLuBu34Xthr6e6lSGn6dXlmlmGhJWf7SmNPCe5nz5kFsgmdHXW4Z/Mtsuiy7L975hfSyt8HIXBm2TxbZo1EAFk8LTfJXXom2HOGe1oBFM6YPXrZezOxrkoTHp+qdjj0I7/bacpms5yBMYRtxA4NrTD1Yfoay5ITqiM2KXZYSnhOfJjyt1x74pDRnwJmr2ZL0UjNZ11AAAfgbETMnmvThmVIYUYSlER1agAd1EkccgSmbM5SVnRhVJcoNX6b1noE+WiQtVOndN3xZzdfciZenNbyoOC/S4yVElXClhPdjpSIMcN7tdwEDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a16MZEhQfdDpeoxVOhexp/34nHboZi3DCna8xtlQYBc=;
 b=ZT/zGwaB2aUaUG8u/zWTmg3QpuWGcT3jrNmlxJXLVB5dwgglBsUG8mdNcCKXlI2oIIKfybRho69/xtR9stXDcSOlWWq3Nbl+waUeJSZhi6a8EgSGnPmGdN87m4DzuEw86Pj8Fl32ngVtWOo0nAvZrE+TRsLNJWM1Ocni431YN0BqMGK8Zx8rbM0YKtQI22Hrsj2+IfWAM/tgp87u1w6jzZQTUlLsikyRVgAKuNgOyqxo9AKhVvpuWfrZY0AdoPdCa1WUCy6MIii1QPl8ZvwaEjjbrpiyE7sUq3ZHDCxmNqEDeL0m/NUpc1Q7pfdFEkFT+ql0FNRWZNMvG8JX7YXtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5229.namprd11.prod.outlook.com (2603:10b6:5:39f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 20:40:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 20:40:33 +0000
Date: Tue, 6 Aug 2024 20:39:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <ZrKJ9wvhLTq/Eu7x@DUT025-TGLU.fm.intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240806194510.13044-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: 02403f4b-1ea0-4a54-0d0c-08dcb6580482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PxGEHdupM7dW73CuyUO0AObDPU9rVlVO0qokfq5kxtfqehvAPLPVQjl0hY?=
 =?iso-8859-1?Q?25V5zSZiH86JpiY2soonQxh/7CfXd8LxF5Z34mqomfa73EggwEaSQ2iQ3L?=
 =?iso-8859-1?Q?2jU17nQ7SgCKUrmk4z6esHVnMlVtWq3nNecQo4eJei/YwhaCEHubEm/+B2?=
 =?iso-8859-1?Q?0iq9C5i8wkPAIw3ON7yvKONcYfkMKb3d7eYhv3P+zwsw/QU8IZAxzNNghR?=
 =?iso-8859-1?Q?pbdSvVxhELL4hwNgXfX5I8mWpqmDNNLXERjSL3oFphqbgXLuq43GXeYUQs?=
 =?iso-8859-1?Q?T4ND7AIZmRmJ8Aw596nLD1+55+1UuA0Vxfl8SrSV9/4mi27Z7w/MXg2w4B?=
 =?iso-8859-1?Q?Qhm4M8Har2CEqnQWa0DS1V1jUYaXmin958KJBPYhOfctYzdrG/kDYP8A0b?=
 =?iso-8859-1?Q?ecBAA5Y5M6TjCxHqq4M8TyIWwrIJzwu3jY5k7qwiTRNss/UDZ48FIwduKM?=
 =?iso-8859-1?Q?pxFKcB1WSRvc27d13wc72BKRYSbg8Q3qsDIsOxnqSJRntzw1Yo55XPFVUo?=
 =?iso-8859-1?Q?y2VasvoFIljLExejTTRKwYvOhKUxMW4rla7IEOD/tFU32VtSfksuz5dos8?=
 =?iso-8859-1?Q?xmO5dVznnAVJjpUn8/mKHo106pQBAWWcq4fpZJe/GOlM9QM/E/K/457hMs?=
 =?iso-8859-1?Q?6KE4wcLnJc9UlDWpz8m5zYZ/heyx33ACR4t8zeAKA4pYVMG0TzxIkur6On?=
 =?iso-8859-1?Q?h5OOCCuS1cg8jnTmvYzlAKaPG8SwVGXA42vrBnzyidBXSN7ge+fV6VNCna?=
 =?iso-8859-1?Q?5aZ9MSepE0lKf3qFfM+hCd39xSObINo1yAyhntaAlq40bq/kaMTMRaUvpX?=
 =?iso-8859-1?Q?m4HdNiXyOEbUhkbKyun3OjeyKFn02HLWNx2+/RweSUg0vWPDbKEBK5DqBW?=
 =?iso-8859-1?Q?C3YJzHKeTyYXVEkYAVr6D1cq/uYtDj7RgKiV/waodx8/I1nF5iBxPQCTJ2?=
 =?iso-8859-1?Q?WUOM2+yLc8ewre3IuOr9BMT3Iope72TluV1m5v3zckWjM6DOoGzVJVzPAk?=
 =?iso-8859-1?Q?l9UTcHKUVJM1Qq3XK14AUNZD3Jfdp0YOMeXgVn4d2vYcxJSdcrx8JBwvOU?=
 =?iso-8859-1?Q?P6URxJ/5x2cqAUkQCXvtS5MLjIxXcdYOBjNtPHNe4kMnfmD1ESvtW82G81?=
 =?iso-8859-1?Q?tHt/SD9Ksvk1QgUtp+wQNKqCp0o3XzEpMIJtCRNkqogDPLrGEFptxgynOe?=
 =?iso-8859-1?Q?X316Xm24v8SI/YDtDUyahyvVWQCnMTwwO8802LAh41cq1G1Zps5dW8JKh0?=
 =?iso-8859-1?Q?2P/YuJPDQvCpEmJx+Q/O0Gng2Tr3SGMe0SV83Vu8FOJ4tr9vPE/3ZuHkK2?=
 =?iso-8859-1?Q?PE6vPp8GCd0/NVxjmQ47KYPJHU/fbvAUjad56JugWh6hxsiCLvTaDW7J5o?=
 =?iso-8859-1?Q?L50+agfZSewpZlbwkptykKH3vCPCvrzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e0LXYi4EZo2eQivN68m/izFf/iE3s1m77NvddlayhIfNtmPTNHniaISRzT?=
 =?iso-8859-1?Q?xG6+O+0VEqVB409cpEBuEChrNAqcER8ORk8JrkPtqBD0Wmpyvkh2KCJ8om?=
 =?iso-8859-1?Q?21fCd6iEJMBFCxkVrNv/2OiaQsdDL9XR2xu6ou31Z7j8AoEU7Rz+390BCI?=
 =?iso-8859-1?Q?Gpf76DkLbMIa+lTxW9mvugpd8NqD1AIte0RXsMXUkitosrHGdjIbGTnZU6?=
 =?iso-8859-1?Q?NEPuKGyg7LXssbBTjtYp3Wim3HW249ffVyQ7xxv4pMbCYzE+njHmR/ALJr?=
 =?iso-8859-1?Q?S+YPdRzy/wvLmSmKH5JY1OjC4Q8vcqw8hR3MR21JNAPV4Np7qfj0NKDAHO?=
 =?iso-8859-1?Q?TvYQJgxJ5jykgOKOvhFBXk9Ee+XeQPPKKLOLSns/BoClxmp4h42LJWUUxu?=
 =?iso-8859-1?Q?h8NnbxZQS1YbUinjKhcB4lSJMxhmyMUdSp2EEXBhrkLZ1wQ/EYe26FxRAd?=
 =?iso-8859-1?Q?KwHmUxIs6qPDfGnf5WlLj4QPti4y58EZmxnot73QtyMUhddCroErOOtjt2?=
 =?iso-8859-1?Q?8VFUud4sA28d6Bu6NRvDiqmmKrULyACO0qWgYWen1dH3/gMj+u05Umwkht?=
 =?iso-8859-1?Q?btUIF/OuduhnFVrbliX8eLsJ/zksx6h+F8uecPfMgPCUKLydak0NPKtrPb?=
 =?iso-8859-1?Q?mkpsuZ69CEr61Ec6aXkEgwmYks9JhIf2tx2na+1XUgZf0GVD/22+aw8ec0?=
 =?iso-8859-1?Q?GxlovozNYP4SAKSZM42DDOZqRkXr1Jsz+1rAKC18IPEmT2rlVcLT/7Baao?=
 =?iso-8859-1?Q?NSlbSAzWR+T1GlLcJAGuKvotL7pLeJQRtDZtWl5ZC1dXhzkvXJv/R+qj73?=
 =?iso-8859-1?Q?fcL3qDceUFMR/IJWHry3YxbfYQxzIGcQwpGq30jy7PaAHYXZDL7yxUk4QH?=
 =?iso-8859-1?Q?N+UEmUasTjkBJlrGtwkBBXftdO7ruHf/+9RQik0AoED7Lm86fU7Ue9EOXq?=
 =?iso-8859-1?Q?UJXqHpViTcs+6QVRPWAzI8TbBbL+ZRHxqHCa5A4VJM44ha3NsYlKb7Hgpb?=
 =?iso-8859-1?Q?dVtVGkUz5MiXccfBEC6G4z4DpCPnPG1RIvDXDPNq2uoQQm3HiVEleo0anu?=
 =?iso-8859-1?Q?ttlyxfH+7tbXWobZX0+GF23KbHIVkCb/xtANdCvIRtPY012gv6sRihWjul?=
 =?iso-8859-1?Q?LCxH3qRooO63xR3VraF2TUEkHsju2KTUIXiEDx+kHbB4l0MCgLBfy7NfUm?=
 =?iso-8859-1?Q?nX4BVqAMZSPuDGNQihJQHjAxjHETUSjtixGqViqZYKETeSsWZDGFSujSYf?=
 =?iso-8859-1?Q?wggo7LV+ygcPj8d0tOrIj0QWoThiNTyREE5NMke9hN74joiczmrVASDFZb?=
 =?iso-8859-1?Q?9lCKUFFAknEuxo4I6u6hk8ny7Z1X8cRBTS8h60K8AescZDmsAf5s5MiNCp?=
 =?iso-8859-1?Q?7TpQt6dsyUCHKDgZDZtvZyVMHzOWA3E4MWfQcariTqN2COyzuGuubvJf/u?=
 =?iso-8859-1?Q?JmFwUydufC+BN9s3QOsI8HCEb7SnBFvkvV6pUDay5nc8C/gXSb5ifEJX6i?=
 =?iso-8859-1?Q?86OF+gkjhCezssJ5lw4SHtf8lVOnTcJ4kJI+ByR++/1WKXun7QZKWrZ9Nx?=
 =?iso-8859-1?Q?ZZBuaHa4ommm34F5Cejx9+3SuTLAcUNiyNFuNw7HUOsLxCco4Lma2EAJjO?=
 =?iso-8859-1?Q?AY25YAMwFDl9cyW3tEynLPP1DdUC0jrBhJ8JKfc9MtWChafkb32f1osw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02403f4b-1ea0-4a54-0d0c-08dcb6580482
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 20:40:32.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTWkulZBxldfFczdGQ2S/pIbsGWz3y807xdn1mwRPMXARVn234EqIn9WvBchdg43iByQf2QQ9NwwLptYQGtA3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5229
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

On Tue, Aug 06, 2024 at 09:45:03PM +0200, Nirmoy Das wrote:
> Add skeleton APIs for recording and printing various stats over
> debugfs. This currently only added counter types stats which is backed
> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
> on production system.
> 

Yes, kernel doc which you pointed out.

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
>  drivers/gpu/drm/xe/Makefile        |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
>  drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
>  6 files changed, 85 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..4db6d707c1af 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>  
>  	 Recomended for driver developers only.
>  	 If in doubt, say "N".
> +
> +config DRM_XE_STATS
> +	bool "Enable XE statistics"
> +	default n
> +	help
> +	  Choose this option to enable support for collecting and
> +	  displaying XE statistics as debugfs.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b0bbb248f644 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_pci_sriov.o \
>  	xe_sriov_pf.o
>  
> +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..3765c04919dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
> +#include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> +#endif
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> new file mode 100644
> index 000000000000..cc69d748e8f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/atomic.h>
> +
> +#include "xe_gt.h"
> +#include "xe_gt_stats.h"
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id, int incr)
> +{
> +	atomic_add(incr, &gt->stats.counters[id]);
> +}
> +
> +static const char *const stat_description[] = {
> +};
> +
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	enum xe_gt_counter_stats id;
> +
> +	for (id = 0; id < XE_GT_COUNTER_STATS_NUM; ++id)
> +		drm_printf(p, "%s: %d\n", stat_description[id],
> +			   atomic_read(&gt->stats.counters[id]));
> +
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> new file mode 100644
> index 000000000000..e83155ab1fdb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_STATS_H_
> +#define _XE_GT_STATS_H_
> +
> +#include <drm/drm_print.h>
> +
> +struct xe_gt;
> +//struct drm_printer;
> +
> +enum xe_gt_counter_stats {
> +	XE_GT_COUNTER_STATS_NUM,
> +};
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr);
> +#else
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)

static inline int xe_gt_stats_print_info(...

This will fix CI too.

But overall LGTM and pretty much what I had in mind. We can device level
stats too with this series being a template.

Matt
 
> +{
> +}
> +
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
> +{
> +}
> +
> +#endif /* CONFIG_DRM_XE_STATS */
> +#endif /* _XE_GT_STATS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 631928258d71..0ded57b56628 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -10,6 +10,7 @@
>  #include "xe_gt_idle_types.h"
>  #include "xe_gt_sriov_pf_types.h"
>  #include "xe_gt_sriov_vf_types.h"
> +#include "xe_gt_stats.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_oa.h"
> @@ -133,6 +134,12 @@ struct xe_gt {
>  		u8 has_indirect_ring_state:1;
>  	} info;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> +	struct {
> +		atomic_t counters[XE_GT_COUNTER_STATS_NUM];
> +	} stats;
> +#endif
> +
>  	/**
>  	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>  	 * register space, but have their own copy of GSI registers at a
> -- 
> 2.42.0
> 
