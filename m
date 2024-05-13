Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD16C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58510E24C;
	Mon, 13 May 2024 15:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYFrEwCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F410E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615147; x=1747151147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WIkoMztNb/AHnW6IGObtCL8uC3Ou+U5aUyF4UNog50s=;
 b=bYFrEwCylr5Djw/u3ninHht2BD4N7HM8vfLmi5DPanVP6vg4G8DVthaw
 qj2u9br8pIl53Q1paQ9E1C4rjpDJW7cs3/0IjKM6WuB/wHUMrIeZNAIh+
 AGia8bteuTpWl3lrPksSUx5cFc0StXMbnSW7U+9vqHSeTZGFNXJFJSIdz
 r2EXIdmBVeFZ4UJ3T1GGy8vW56MBF2xvmKFzrNUJ4FwHLkTw80Iiq84dW
 IiIByux+kB294bHvIu+pHMSczomqH6gtPoNc+SyANBFyui8A5lDgF24Zz
 ZDQGCPQ94xoB7GlOJBfVOWezHCxDd4ywd97dDJhS2qg/qkBu6hEfrrCvL w==;
X-CSE-ConnectionGUID: YJGgSdDeQReIv9TMJoFUpw==
X-CSE-MsgGUID: B9qGJEjARz2cWLUm6Za7lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34070021"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34070021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:45:47 -0700
X-CSE-ConnectionGUID: 0wDoo9FHToKGaF+06N8rnw==
X-CSE-MsgGUID: F5lhuRovTAGrRUTQsThvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30493886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:45:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:45:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:45:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:45:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZl+//yVNC2zomTvtk849AJCNVOzp5KmJUfa1wjSz6B2pvfKUbTVcKn+JCCgdb7KvhUhzM1dFbWzv7uCgxNqmrfIAMO29oMMFzCKz1sN0w3/hi2JuuXu5dwc8YKZA+7TpBbw9g1H9Xkgofg1pS3s8/piv7kP1PUgKCzNKnQK7pO43R3QCf3lXi/6P5Q3wm+4yiCYRAikMPAwPO9FLjSjxn4oEo58cgjS1mlQ3jvKW20MjLQuKqfzcUro64WZYSowxd1/7ZfSnh6KlTxOqkxPnQf9Pc3fdHiAWWvlFG+H028VMUIgZSmWeg80biXWXcGcmlQfG37kalZqeLsKzjjrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9COUam/dD9gCGWTYViFy5iAYAO5RQOEpCW1b9NabDA=;
 b=AoMsbYYAlz5ckDaq8gJQuEn3btbfjCQihKjDV6RvQmct5Dbs6479R9zecO3eJ2UN7zcGVSW/z++HQBac3WCPMDoqtVTiOXDt45bMYDvCevlzCUqfumnhjYBISuDj9fFQsTxvkR03TKOZ61naiUMVuctsoJNKfnCE44MyDbL79JLy2iEEE/oCKADYccVHH+zLefxCvVRJDGH4/cDMY44WCyxqeCa1ICpketTRnsypSxIW3um1iTqRxVzwUZwYmEaDLfuxYVGwv+S+EaSVd6H19sB8DdFONE8UrvtFMQ7vuqlLyyejo3RFOojidOxBk0V1okDqy05exA4LZn2ch4SLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:45:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:45:43 +0000
Date: Mon, 13 May 2024 11:45:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_gt_idle: use GT forcewake domain assertion
Message-ID: <ZkI1o3TuEaRDRfsm@intel.com>
References: <20240513070546.3754640-1-riana.tauro@intel.com>
 <20240513070546.3754640-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513070546.3754640-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecb58eb-da89-4971-3232-08dc7363bf7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pbt6Wxmho5LQS9fN5tnW78MNUPhtOlwf9bjVM2i575e4/ZCKQuduYq9Z88qq?=
 =?us-ascii?Q?xdVhcU37UP9y3gZLoRdgl7Z6/BeXN9HsjZ3YtW46fGvHKVxLVZne1uR5rcg1?=
 =?us-ascii?Q?PmZeykZV08ka0pPXy9v7kn8hHKiry+CcKGtfPpvYD+eIkvR/EsJgR7Ig2aSD?=
 =?us-ascii?Q?XLpRkCapy/K1g5JGKbm3lfttzm7UaTRiTewydE2HTB1QopSUxxwa2gagoz1Z?=
 =?us-ascii?Q?7xRlVar78sOJZ3R4pr+dEyCAooXRuThN6jMYPvwF7QRsWQyMONLgiTslGahs?=
 =?us-ascii?Q?qO5zOWQzxY9u1OlMnSSe/1NrBbjZmsqq7H/T4XHYCZughQpfpLv9kr7f3g9Y?=
 =?us-ascii?Q?gyhhW7vbGRSt6g1tl/qL8NgR/6raOOdx/kAYFrHVi+YvL6yWjRLGspQZYQFm?=
 =?us-ascii?Q?bNQEtAJTiGBHRgsfk6sEfw2LNzcbPogF29CfJYe7EnXt3rE5MR/07AGfaCH4?=
 =?us-ascii?Q?pPoA5NrRR9EKSSXh3Quyu2kBSvAyUVVknzzvzdv3q70zFAy58Fmg2DI1Y3DV?=
 =?us-ascii?Q?kl6NxAaV0oucXR6eRaEWx+S8nJz013FnKLomrjq9QPYfJkzjtUwGWhJd287x?=
 =?us-ascii?Q?eBgmZDOn5G44kFyH0Cw9DGzbkp4dPw9Sd62W/NxM6rpE8nGC+2ml5xZiR50G?=
 =?us-ascii?Q?nzOtKrFrHi98mkIAqDLXXNI9mKO/028y/DZFiVqjgsXWb+NDIdS3R8i+bkNy?=
 =?us-ascii?Q?yveWwbnJjDmlcD5PoFLtylHJ0lo4Og3t3LIHWhzRFAXCBVViC/M8s/AV+CtO?=
 =?us-ascii?Q?x0LzmMWdWRo40JFyrO9oApEmEKAZBw/obx2Sspo4USpmtJr0chJpq49brpkx?=
 =?us-ascii?Q?cH26nvWOl20Y14kenszStyR3aM4t2DpTqq43WeD5YpK/3KTalunizUQToxLN?=
 =?us-ascii?Q?KuJYduU6it9Z0DVc6u9IJk38JE6ceijFsD/qPSStg9KQohPG5xaP/pW+WGOb?=
 =?us-ascii?Q?Hn6In8MbLdSL+6LdhloZm8K7Ii7ljf0GsuEmfrtBmSgzM729CsfZSjGsbRkZ?=
 =?us-ascii?Q?EP1xbQrcpTuxFadwDaMXLDHeJ9QQluifi350gi4e97c6Xz94Mm6+vLm2At9Y?=
 =?us-ascii?Q?n5Q9WI6l0wrzGBEqB8HPAT91yZRaB468xTFVobnShgX+otPML/LUrltKRfG2?=
 =?us-ascii?Q?3CAnbRXvFJvbYwrC0cEmDswm2ot2QuJZeqA61JpfBfPC8N0Y8tlpgLq1lXeb?=
 =?us-ascii?Q?rXzpelJqVtx/d/NM8etGqOcDusEtcvBogl20Ftdi8W8X7h6b+xj+09izxeLm?=
 =?us-ascii?Q?mDpX1NchSDRlrdwKWoxPjqK3Er9JhI4+Z0s5Zg69Qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4MBNr1XriSgn7XZHHmQY9KucQIGLuzr5IxCfRhaAbUWjEFdEC55SRTqEhJGA?=
 =?us-ascii?Q?jl4BOvJRas/QFTlg4WWJzV3lDUX24IoAhvEilpwHdROsTqPxhVZV3gCz0kpi?=
 =?us-ascii?Q?DMoaO8REvutUoonc30NWwtX8kC6d1XAPWTJguG+6pzlkQhQQHH0LZZBXIoIX?=
 =?us-ascii?Q?C9c+RiMsqOyx8DDoLJkrBafj7R/rwE2NaL+bY1mA3UzsixjXPMnZG9iJNhJ+?=
 =?us-ascii?Q?/3XQv2S/4SOj2IpA8MKscotVXvf3fgAt+ATeUJxtoiaqM7xShfUwbeb3So0d?=
 =?us-ascii?Q?YwF/Wzmc2gZR3XteDvKF4KsAaUrF8gv/MWgLzi2cCxNEQvExCKwS68WPSQlK?=
 =?us-ascii?Q?Oa/JYq2LMmdPS+cZONx4Iquthhe52d3UmSTcIzFYR4vRQM8Sy/heUhpnNS9f?=
 =?us-ascii?Q?2+pkQkTOxHlsCwFUGLhMHCQ9s0MWNVpDCUC0ErHTGs7H3VpT1PCgbYBLmTKV?=
 =?us-ascii?Q?U8WS2avhe7J89GkBKS1vUb4y0AS6oHtkRdU6WXII8v54V1B8OMoX9StM+nUO?=
 =?us-ascii?Q?TiG+EpkgfiJUs/z0DSR+S7Tp7kJlN/7XxLIz+RT6JZ3MvMJfxdSjypKQ5thK?=
 =?us-ascii?Q?ZNDGhXlDIYD0P4idAB1C51ZzZ1sE047OGEP8P8MVG4JmcYp/eFM0PXHCnuuO?=
 =?us-ascii?Q?x/0XK4vQ1XOpF7pDCTOYK9g6dy2/HVc9Uqu/hbMqCNBiZuNAoQMjO6k19MGp?=
 =?us-ascii?Q?OWlo8K1cGdEYO8jQdT0xkIrXOp0SbT/28eQOwcVkEhyw5qbJ3bEga9cXV1GS?=
 =?us-ascii?Q?KonM9nd/HUtwwI1ckSi80GWEPaciaA+PH8zsqLSC9+b4NICsmnuqnzv+JMVK?=
 =?us-ascii?Q?5xmoOcIvLVxG2WqL44Or+UsCchMWtxualm14mkR2/lHRMXWEVB986pfSfB23?=
 =?us-ascii?Q?d37kq5gUq6M6SvRxpiYTyUfkwbziq619AKNLV5WeGPFJA6bdbUi8AMFxTBXf?=
 =?us-ascii?Q?QSWsMwAAPkgciTrl8/gpYzWNsSxawf7gvwPc4gS7n7QYoUzXUv4+8lZ7heNH?=
 =?us-ascii?Q?wGP00Z8YYwOQjw3TxMoxhpLD5rCD0rV8tPrPyFoUBaFyT4yATfKig/l2MnNw?=
 =?us-ascii?Q?+/1L3ptvMX5Sl39BZ9iYS//YSI6jmIOP8/eK5N4krmuRRgcBrj1LUqGU7xfp?=
 =?us-ascii?Q?EwDTzkVoWnczMdNljVPVt7AzWY5opxwtMM+pzZofz3DX113MOu82apqn8On7?=
 =?us-ascii?Q?VmgrCPXZS/6U5/1dR1/bvHAkSNINLxHJ+VX4P9IlO3faLyJ7jPa43k4+EheC?=
 =?us-ascii?Q?1WEKzNFgv0yAPG8yRCeW9TsOnk9E5AJMDwtEOrZWyK7HDAsq8zRkxbg/k+8S?=
 =?us-ascii?Q?Z+gQCb7ovaNo6mrZLkemkdOherF5s4pVxPcZHQAuC/afOS+Q/lw8Ekr11GBA?=
 =?us-ascii?Q?UmAr9DILYTDeK4s3Z8GwCC5qi5n1I5qlD3THEPOBowg5Ok8LIQTbl6JQnjt7?=
 =?us-ascii?Q?ypCewIKP3Nth5eyaAOCmUN5p5ec6oznxjWLcOzPEVEPt2v2QCCaEDTatcNKA?=
 =?us-ascii?Q?2yCeZiH6cqoL6PNGcIsC4MGnPyre4b9Ii5et4s20oYUzMh6+2C+49crRqXx2?=
 =?us-ascii?Q?lSLqPjITNljTpdr3PHbRYUIMNABBKPvClons+g7/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecb58eb-da89-4971-3232-08dc7363bf7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:45:43.4171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBPYW09LLzGsN7s8hFuSKuWZaOh3suujNajaS4E7XOLJ8SdhsfZ+IE8iY2UpfRwQbA8lxScUygCUSFlyhjJ7pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, May 13, 2024 at 12:35:45PM +0530, Riana Tauro wrote:
> The rc6 registers used in disable_c6 function belong
> to the GT forcewake domain. Hence change the forcewake
> assertion to check GT forcewake domain.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index a4f6f0a96d05..2f247cb910d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -200,7 +200,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
>  	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
>  	xe_mmio_write32(gt, PG_ENABLE, 0);
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
> -- 
> 2.40.0
> 
