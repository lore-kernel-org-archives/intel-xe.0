Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A8FC3ABAA
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 19:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E004F10E435;
	Mon,  5 May 2025 19:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFzC+3ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA4010E435
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746472360; x=1778008360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mW3Euws2EME80TgkMkRYZMOLB47/pvwcgPZo6f3kTw4=;
 b=GFzC+3ij8X4tOcIZQN/gPFwCjJpqGfgrrSS4KaC71WNJdDnCTkhttEoG
 mbz2HxQF1KlZrvBVryvwjox49qMmnkWsV9FDMVvSgJlIoMaDLT5tnWpUs
 9YEtC4p18sJwdMytRW31KahUqXDekWYL95WJ6rORXwcF5IsMHmXjhFnVc
 QJ43qTXfFN4ZEqm/F6MPN3uPuVJ0VByXhISuClJx767KP1V9zLzAOx5h1
 J0bG7oC8KSAQ9dNxP5LoNp6TkpeiH26FBbWCaBm7gK3pqTNMMa+SN++sY
 hRC3AQG3tpUtg4aBL2cVwvS6UhV9Lc5N/PVFgWX4bHg3yJzGls7SFoM92 Q==;
X-CSE-ConnectionGUID: W/DGSsBMQ8WgCjMoTNayUg==
X-CSE-MsgGUID: yWLCCOCoTy2vaVU/COtg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48001105"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="48001105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:12:39 -0700
X-CSE-ConnectionGUID: K/R/Lvf3RWCLZNSCP3ab0A==
X-CSE-MsgGUID: 7l11W17FSgm+9WlVLCfucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="136302650"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:12:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 12:12:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 12:12:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 12:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIXGeU3NChxLubx3yeN8+D8ctIMQBM0+ejNrwvE5GQ3evS+4R6+92K+9VqcAIDS9n32Xs9Z7ZAjTfGG9d59BmdjScim3fIHvTs6hcxCvNx4CWlMLrmpXQ2XhbwFeWyesy6Ae5CUVOQLfypZDbL8EqK/uED9ZSrGG+R/JFOTtNN7KVk4cXSXzOM4VtyloLGs3GhyNHPvMmnum6y8XhrOl40EB3xes154g+PPQlvN61M2RFG67dBzIsB2cBUdaukTVUbr4zinzXG5s1sXrRj2O1XBBRPAagFxmG9NrkildleW371X0G7cRCna3Ablw+oQ0B/OSj8CsMKfaRU5c/W8SCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2r1vKdqHpbnhmhnHcPlXYy4xgk3LZaElTghc2aI980=;
 b=hiQjSfTlEDIh4wk2tB3/96SMHyBKDPsvPTy84XoDoXbJUqfDZ4gB9xk6d1gmnX7z8w9/NUfSrzA2E02mDHRf3D4SxSlHdPhzPHlz98XuEASpB+imboWEvKDkHd/p0abP9n3AXl41m9N2xqWY68JdNoCFFGSBsN5iRwePhOM3e5RH5Ho+L8jC3qSTTv/hjpfdT2TipgaQ00nxOJQAaiebJxvp+ZWEDoC9Q2s4uMipu8HDeXRJoT+DLdHSGJf4uUuWRd8kJ8oBXeuQ9C0gtep8IuhOEv67Ap5mabVsTlw/pzt7RU40LxzjhhxaYZ1C3XejlPpzfxRW+sTkc2WdUgTIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 19:12:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 19:12:20 +0000
Date: Mon, 5 May 2025 15:12:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
Message-ID: <aBkNker9u--HP1v8@intel.com>
References: <20250502183739.3308069-1-raag.jadav@intel.com>
 <20250502183739.3308069-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502183739.3308069-2-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: aad654a9-fdc8-4379-f8b8-08dd8c08c218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uHP8kR85yP/Vrujy/uTmQcUVNu1IjV6WIBGbF54VLUq92jJKjtFf7O9PydOT?=
 =?us-ascii?Q?csFQE9Q6g7Fa5MJYGS8b19i3aTLeT+W3xrVzhM1b0SxjmATxATvVgRdvn3xT?=
 =?us-ascii?Q?PD8TZH/4SnwVbBZ8U+qqm0KCo62R4qtHUbtO3Vu4XirBVwo6VnTRHkDzi/z5?=
 =?us-ascii?Q?3tQbruIzmPbFHRamD62pBei92L11ZAluw91/o5as1mi24zRys/ZCCrSmDGK4?=
 =?us-ascii?Q?mcviLdd1zuHUjX7HQjKzWnqc0y46n19WCjVqtHop/dO/zWKaih1UgJgvTAPp?=
 =?us-ascii?Q?34ZdtcKbOVY0dSRl1ah6MLfy5PbGOryRLLuCC+IxDY57lw5BqTfEA/gMDtYk?=
 =?us-ascii?Q?aiWsNW5vzuiTkWpi44yq+AkWzJwa+VnvmM962/gvWSWPJOgqDNFyXMSb32E4?=
 =?us-ascii?Q?XQigdB+YRTdn2+Wxegg8ckub3sSGiTO7NLP1+k/YoDL2m9GNG3UqPXG/JnAx?=
 =?us-ascii?Q?ASvWoiFjI/KH7Fqgm9YleLbm3io51fL7nkTZ0e3duHjDwPN/07A6+zyvBwuY?=
 =?us-ascii?Q?8OFoXARL2+WkHSMtYLDm+BfR7KTQ/LMPMcTt25LE6TAUQ1BmAsbf6U4bknvu?=
 =?us-ascii?Q?ZK/wOdkEPhNIIF7ZZOGdk3FdAPTsv0w9IOhYm4FteP2vt2xnG4le3DIOy/X3?=
 =?us-ascii?Q?dP4Eh19a/whFnkvW7bP1yj98bnnyeawaatHmlR5gXEg0VzdNGV/Izo/6CBRc?=
 =?us-ascii?Q?5FfHaw1XR/wwxmuvYLCqH1h7cw02RWeTSS66SOIJ6xtFbl6X5OD3qjmATQaa?=
 =?us-ascii?Q?elApb+uz4i/A5zSHQi+pHD/XXe+beu6kt/jpzb0s/8tslZ+WrCBuNY4ZobvF?=
 =?us-ascii?Q?VXWnVgN+qZSiF/J1Bh+JKELongYprrRh+2lCt4wIYcCWo3uPf+PnAAFsUbki?=
 =?us-ascii?Q?i2HGLrmGeQZk70l2hL2n78W2DEp7OYaWwq/8NI+4XBqoUkW0aDKcUQde5OU2?=
 =?us-ascii?Q?BvuBYmZeDhf7t2d6bYW/1Izy6qAKeR8qngYv4F7b0p/JgaLLWC48AjwuwbQg?=
 =?us-ascii?Q?zJKI99pAHvgp+0mglSqmmXNYPJEEwgO1Nw1shme/vtz0vQcnjRupwyy6PtDv?=
 =?us-ascii?Q?wIqNvoTv4JE3qBY4KBUSYOyvAVcSBmv/GDXoIY/GO+ABIc4gRjejOO4J276n?=
 =?us-ascii?Q?yRvLt4u5U63ch0/VAI9D5ANdQbwSkdct4CCKueePnZjcFRb4XI1CMsVW8D9u?=
 =?us-ascii?Q?ihCUW5vb8oKFeSjVHXX9xDojgSECA6qHd3GBl1EwiQoDQ/K23sIv3oB07IzM?=
 =?us-ascii?Q?e6GS4EfPpfzw1/+ST2G9v8taxYCg1ios2l///ot7ZTT5jhGwitQMw2kGFzAX?=
 =?us-ascii?Q?HTuSguAtLMt6afEgAu51BCtLI/cYTFTFHqngvvcn9nc4odxq8H4iYzhgg7Y/?=
 =?us-ascii?Q?1G91zsm7NxfmaMJGz1YTwpkKbu+XWAzOTXM8mLzXDCoWNjYCWVeOwelMzzaC?=
 =?us-ascii?Q?7hCL2TYmboI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rs41wroa/CkuaOM7FO9Dgi0wjmd4RnTV65N3P2K0symiZVbhJwTywwQ2ncz5?=
 =?us-ascii?Q?o0H8KCVsh6kXoGL4C+OWLCpQJdG2s6zjuI+ORWSKeArUYexVfhCQOsgOAT22?=
 =?us-ascii?Q?fIXb6flWFp3NuUm3FgEOhjHo0OeIj6OFmf9o64XnpGqTZJT1zyy277nDzkSz?=
 =?us-ascii?Q?sjrDzKg93Y7ar8b3142X3W5KEuatI7VEZf+7+LRCq+yy3+RZOT6M4dLfzswh?=
 =?us-ascii?Q?ColXb48xrT2aHO+vVbrZvXa6ZcmcZZrAKmD2qikhujWWG5mPi5ST4vXZwOPx?=
 =?us-ascii?Q?GbPN7cLwWBXuJdmaeiTVoDXsrDPSeh1PeGPVDlg/FdCYReS3vEYn257AmUPS?=
 =?us-ascii?Q?awgJq5+8OGk9H0i1Fu6BxCts07XYOrwkIV48vcFgbWxz8r4k7fY2dtQsZoqO?=
 =?us-ascii?Q?jc/qW3oMoPP8A2c5CPx5LYDNedJBgqmEnpF8CMoYcv5TaliE5qaYMNuzk8z2?=
 =?us-ascii?Q?0PnMSwAiRDs4xCpeEy/F3cKJizfWTWhZVZEvTdHHiO8veLl+O5slc7mrNLv1?=
 =?us-ascii?Q?skyQwFMKbQ5RlQHZhc04gi22+p9BMi6ef/a+qcWUoNMVVwXY7I0UwFVEXY/z?=
 =?us-ascii?Q?TCdpem5pUWe7FoJ/ceLJ0IGrikjFe1FEwbGDKox3EnrT0ZXkq82NeDm3/YJO?=
 =?us-ascii?Q?FhyuPzHFMUUuUi6CavifbQ3YzPmhJLnv7E6kMqqc2HubhaLFvMr5APgliuhk?=
 =?us-ascii?Q?/mbO6lmzpZc/VX7lXqKWniltdcAg8D5rp+rGkmQPD/+EUJ+XblYIWTrELxof?=
 =?us-ascii?Q?Me6GN27qHCQaxUrhjOfLRPBcWb74L3CD31Csrq8TI2Kam2l3RwF1lt34N8H2?=
 =?us-ascii?Q?DslmCS2SdOOu0LsKNNv/T2SHTTaViLEH9/VBNtlr0kovlVNmlxGmRkOMuCEk?=
 =?us-ascii?Q?tjH6D2z/NeO19vnYAJfp7y1fnE8L6PMoz6GxkQkUMjsu3puwTiPT8bU2BDUu?=
 =?us-ascii?Q?m2TUBAQMHS8q5w3ZtyjyicNrHcrw4HbZoHVGqnlYvne0opn0B/fJs9i5sCla?=
 =?us-ascii?Q?3CPEHPl/JnlEBZC0NvCPM4gasM9uZFrVY/mmmhRDhqYgJNpjffa3biXl1EuL?=
 =?us-ascii?Q?i98VrJtp59BLA1fWEnLFjajnoYTduMvVl0x/l7SMp3t48x8pp+ZKl1cq6mDG?=
 =?us-ascii?Q?K3bQqr2GCEHy3JMgcLEX17bBqXWomNZ+A2QczZpv8Ij3zt//HuwTiGd/ilaF?=
 =?us-ascii?Q?7ANl0b1gVfzYIMAEK6zrrm+1nyuhJkEz+0KzvOXT3/XUX9mwOlH1dxTCAAnD?=
 =?us-ascii?Q?iGr5c92YkOZii4l5CN1TtH83uEkLfSARnqCtnHa1zut/guzF17Moe8mu/ysa?=
 =?us-ascii?Q?R/qQ1RM+yWQ7ppY9VBe5ykRpnMeXNrQvk33dlJbJcDGmBRRqjkhvrdDk+NIc?=
 =?us-ascii?Q?faNFRfusIJNvn2ZEw0dc2/EmuPR2VQ/5gsoEfy3clfPHTu0jDIXrm3vmBld/?=
 =?us-ascii?Q?e/mKMoL1S2/ZZG3j3qV86vSxG9ua8P465ulv3Ig+mA3vkr7LJfvrIuLggxWb?=
 =?us-ascii?Q?jfnb/UkfQDR7s7L5M6t0lZWEojxVG32iJbEcz/uBvZixqvNcUIeCGYcNlnA1?=
 =?us-ascii?Q?lVHPSsgex+RCkQ05vhnHZbWEfdi6O68Ky4uChfK8DITlX7brwN/hOwVsRORM?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aad654a9-fdc8-4379-f8b8-08dd8c08c218
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 19:12:20.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZYa9kJMEjHM5i8k8TVJsZmAHtrJ8Xq+SeYEdwgl18ml0EqCf1kV2LeD7E13gLvwdeE8AcYfKkDY9467x0jEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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

On Sat, May 03, 2025 at 12:07:37AM +0530, Raag Jadav wrote:
> Attributes being exposed in xe_pm_init() are PM specific and should
> follow its naming.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 6 +++---
>  drivers/gpu/drm/xe/xe_device_sysfs.h | 2 +-
>  drivers/gpu/drm/xe/xe_pm.c           | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 7efbd4c52791..2d25e5b5d4bf 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -63,14 +63,14 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>  
>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>  
> -static void xe_device_sysfs_fini(void *arg)
> +static void xe_pm_sysfs_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
>  	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>  }
>  
> -int xe_device_sysfs_init(struct xe_device *xe)
> +int xe_pm_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  	int ret;
> @@ -79,5 +79,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  	if (ret)
>  		return ret;
>  
> -	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> +	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> index f9e83d8bd2c7..2c1fabdba9e4 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -8,6 +8,6 @@
>  
>  struct xe_device;
>  
> -int xe_device_sysfs_init(struct xe_device *xe);
> +int xe_pm_sysfs_init(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 38514cef817e..183813e43b29 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -347,7 +347,7 @@ int xe_pm_init(struct xe_device *xe)
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  
>  	if (xe->d3cold.capable) {
> -		err = xe_device_sysfs_init(xe);
> +		err = xe_pm_sysfs_init(xe);

Ah, this patch is the one that is wrong. We should not change the name of this function.
Perpahs we could move the xe_device_sysfs_init to a better place and then have the d3cold capable
check there and ensuring that it is set before...  But this rename here is wrong and we should
not merge it.

Thanks,
Rodrigo.

>  		if (err)
>  			goto err_unregister;
>  
> -- 
> 2.34.1
> 
