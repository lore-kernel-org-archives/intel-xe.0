Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BFDC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963D410E06E;
	Tue, 28 Nov 2023 21:34:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25710E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207266; x=1732743266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RMpFk0TquE4AVhN+AbA0wp+0amNFeCJBjx6BLUZllMo=;
 b=eGNGQEpzDTdal4eOWhh18QlNWYLRL9w+6Qiqhcplz7sjwwwbFB4zsLu8
 CpQdMXO0QCal1IBeiLvUPPaqkTvW9atwmAwKo1cMxb2IXK29EZm9Aa19I
 k8k7FZopDOTC+0rb/WpD88VT6bQ72xENv9c1WZ2hy2kzoyrq5Km2WGzh3
 OdD0/04Ca+S4l5DOnoitCsxX/eePt3sFiIokh93Mrlra3dNclbsu3zaWu
 QGZtTVmUdidynIjw1gxGZ8+/uAGFDx2pJlY1tEYL7FvWNgP4pUuqwKB4I
 CR/+BayelAr55dVNkUkelWQiaOpODntmKzfr1jAMqSKzd8CESSJa2n/nL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457367089"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="457367089"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839202099"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="839202099"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 13:32:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:32:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 13:32:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 13:32:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXC2A8/swVVMqjTwHab6i6Vx2f1FS/h2yt6g47rmox1zSEoyFr49fUcCmvMs0BMaHRmQURHUuz0tNg8YbLBzkP6Xrozb+HCwbqLuB6IfwRj/fQJERSh6UY51feAZOfGKve77SpoSOqZK2qoCX7lzOYYqPWuswYsUw9tSZsjd2P7lSNxuUpdcHTaYmlYtjXPEvmScCRGMCOV5NkiJH/Ne9D2srxMRBfI7oX2/5Mj0ORJnuJ6YXHCBPzH2CmgbtfmKdHF01Y0BoeCWqSKjMWAi7GyIKzo2fMBvvt2w5JbCClEoW+wIxkec2sMLYlImMg//Kw3zl5KaDZw4474OjtZagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJDdsvlPb1VgkED0rVpCuEY6dGMKuTvDJeJP+nnJs5g=;
 b=iyBAUjDxNOYVwVqJ4KDvns0dM5T3DYEZqyxKoGa04835CugGP67uRTMg+Mpw/I/rX1V4Z/liqx3QwW7URyfOasfQoT2TSbSFpwu65XWWPDclX2l6+QisJQKJpD0cv5JUXh74hDEPu8PHb9UBby1vJEHEblXuIPvh0Yu4uOM1MBFaL/fo8+zI/55H3+CAqhMgjNJdbrybAD01BmS5SB1yR3JUKvryQjXowu46AJN7kha+kqTxZIoAeY+KO3ygNMKJ6wwcrSXaL183j8B1VRXi5EbbJeTR+lPFLrqC9C/ygv6Ks/YFsvoPxtRK+gcTp6uQtTWuKDPdmnf7UVway/mlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 21:32:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 21:32:28 +0000
Date: Tue, 28 Nov 2023 16:32:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZWZcaYDi0eChrZmU@intel.com>
References: <20231127222236.68999-1-vinay.belgaumkar@intel.com>
 <20231127222236.68999-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127222236.68999-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f802c01-86ff-4750-72a6-08dbf0598513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwZxbvM1i2uhEDyKrmmli+ENY76mOXEYYRn4tALqU/O7gp69bMALU8XQAcLN3Xjblr07WFP/iYK7Vy9tzinJ9oOdhJjUoojtH0sAMyASwKKYmChdcDaVTYguRJ7gbHYSuRa0xOnJZv12Aids26TMI2F9x/iQjwxL4pK34Y2qfgdWcFU7onP/hBMtpibLCrNRPFknPr9zgjl4Ztm9zvm8b+cydkt28U3rSRw2ooSc+roqhVSZpj/3gZ3NxFkQg2rkecgHrejAcKXTzrO2FWcrmcvaMFioqwg3fhYB23rfLUZIJGUUo9gQOTJKRy8IjJUIcTI8HbzgkJfVOLV26zNdSK3s+rB0UDDf6wLrmE9ZBU3BOPkBCMEi4GQap/utAqHmJkn8ZpB5a97jZybqq71S22lWQJVewvR6yWJc1AbyyTCxknjL5WDKo8VF5l+Ja2V4TrTA8IwdKy39cjOF1L+kTK83pNZgxf6wInYEpLV6qj6GRm2XxXUUQw/wsOBEBlDuDG4vbz2d+Mx290ObrFV0ZrpMX7J7TfR8LybkWMVQgLhpniJhZ54kvvW04itLSUiT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(36756003)(86362001)(82960400001)(6636002)(41300700001)(8936002)(6862004)(8676002)(4326008)(37006003)(316002)(66556008)(66946007)(6512007)(6666004)(66476007)(6506007)(478600001)(6486002)(5660300002)(2906002)(44832011)(2616005)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMljpgtVO0XjaH/izKaDWQzf/t+husSP0NP/Mk8VoI9MRJWo6NKO5uaF9kxD?=
 =?us-ascii?Q?OAs/dLuZRf/X4+B8VjTnS1/AbyZVC4XzSbpc5Zw/BXKEdMSpKovwOECQMxDZ?=
 =?us-ascii?Q?/vH2Ep+fq9XPckazPdL3HCXZaN5TvBMCtHbghNDukgarTJ26vj9uueo0tT4v?=
 =?us-ascii?Q?IRUNns8Bd5LgYjgBe+IsCbIT0KTsLVl5A+ha27UIvE/LVyofjEIJSh7zVtrw?=
 =?us-ascii?Q?bOdkqlhiSLOr3VPwKiOvLSrA4j01MAsbU/MT/v0VlgnPv8RX/igka+f4drqv?=
 =?us-ascii?Q?Ed+R1+1tsW2f1u1ul2Z+mTXsfRKJGppSjNygnTswJz0NJXjVGTj2nT+mrC3x?=
 =?us-ascii?Q?74IRABiQQrpV4gAcrdhOA1A6ttiParfVOzSzn1re6Dt1g7s6f4ikR06tKrND?=
 =?us-ascii?Q?hNshvpzYireKk2U9CdOJMBOD3bpgOGF4c6fKR9oXViE5pjycjNjPOgimJ7KC?=
 =?us-ascii?Q?EczC5ZsDlotZbD8AoueFsQTIEPOx2SSOQnJWKFS0abDLLfrkDP6N1mbcdOCR?=
 =?us-ascii?Q?r5IYTl96tKDmohfoUGpmRVX3v0MyUbdXtjLqw1sEmplKA6ga1c7pZX6of78G?=
 =?us-ascii?Q?dCeC3b9AlnBa9qtZ83VBZJ9QXRkYMG0nKH4jIDnl5qAjWN/qifP+nerX3bhW?=
 =?us-ascii?Q?XtQBNp5k8C2wqEt987MOAnW/xRMGcW+fg5alHLOAvogZ4jpxBHS6v3q1n1q7?=
 =?us-ascii?Q?l2R7lgX7/02TN3NtX8ZEiACPQyF+N6OdJsFit9l5PlTjI04uDpq5XNNRZ8qG?=
 =?us-ascii?Q?LcAn4mqvNXW+CzriS94qzsk2LMDiy03l1SZ6xdOXKwmLlSbVClBbej13Ewcs?=
 =?us-ascii?Q?hiry7Q58iEzJDHkRzvgkjXk9OlyWmBr4K7bAi+5eb5JwHPOghaLJuskEc3SZ?=
 =?us-ascii?Q?nHA5I5vIjuVUisr2WeZsnR+7YrYJzkxSqlGWuIGI5oQ5GLtFqWSy6MiY+SEJ?=
 =?us-ascii?Q?LSDCEuYUv4yFJmY2HR1O2F+vDQtqESyfRL1rEDtluH+6RGDa2CRPxnzynvBL?=
 =?us-ascii?Q?NIbbt80ydo/FEoEIP/64E24g5cMBhRwO7X1eQ78+pAASfROxSA6XjBzvZnb7?=
 =?us-ascii?Q?HbOnipy4mAYtQW4IJKUuH+91V0ECB/QfnNiZLDGhRpwfVCS1R9qx86Y2Ky18?=
 =?us-ascii?Q?40Fs4oE0FU7YY7awtoXxYHyiAee28+U211OyyudJCizC7jsTAmQgefrx0vM6?=
 =?us-ascii?Q?Y7LXg3+FEtnit9mvkpdhvso8vgkWk4yaG51QDyT77iwWZGQS0drLlV9N6VQV?=
 =?us-ascii?Q?GVGJzjAq9K5Ru03aF6HzH19IuwyjOhNSAv4mrMnsFVdTBD1lOgvUm+5A9WMl?=
 =?us-ascii?Q?d704ZkDUoMJP26eqnNDiyLmDwGA7unrEhWx/VUsBTSZPn8PFDEkZaZSFUYbP?=
 =?us-ascii?Q?16MoLwlPgH44wEumCkZGTJlmQFy+MtadCpNWC0Xph4saCbWrODKcfvIqPnDc?=
 =?us-ascii?Q?xOhRminyv1xglflwhnF3nAxPjNhdvcgRrEnpRkbb0LY/iIJdfATq5TPE+XNt?=
 =?us-ascii?Q?37fbEeHMuxddFu+hJ8aTW2AUKDnwLlJ29rFxgWi7ea0XaGSvAz5UlKdMlTS8?=
 =?us-ascii?Q?pC7mJNbwwRxC5buMpgwMwrrrK3Qxg4dFMbOJTrtj0IP9Ln4aSEzskOflfudO?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f802c01-86ff-4750-72a6-08dbf0598513
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 21:32:28.1494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cx9lpeDGse5TTKp7o6HG3uNsg3T1/nYOg9CtcOz7tYeK1UaTP0XPfyrq8XI36siG4abTCeVt6VUzEuAjS53mOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add skip_guc_pc flag
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 02:22:35PM -0800, Vinay Belgaumkar wrote:
> This flag can be used to disable GuC based power management. This
> could be used for debug or comparison to host based C6.
> 
> v2: Fix missing definition
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2712905c7a91..b1877270960a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -264,6 +264,8 @@ struct xe_device {
>  		u8 supports_mmio_ext:1;
>  		/** @has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @skip_guc_pc: Skip GuC based PM feature init */
> +		u8 skip_guc_pc:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index cb762c11dd0f..d54cae326e1a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -64,6 +64,7 @@ struct xe_device_desc {
>  	u8 has_sriov:1;
>  	u8 bypass_mtcfg:1;
>  	u8 supports_mmio_ext:1;
> +	u8 skip_guc_pc:1;
>  };
>  
>  __diag_push();
> @@ -592,6 +593,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> +	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
> -- 
> 2.38.1
> 
