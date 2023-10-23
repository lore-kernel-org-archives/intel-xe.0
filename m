Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB5BC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 16:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB42110E15B;
	Mon, 23 Oct 2023 16:44:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2910E132
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698079462; x=1729615462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Z94p7ZH1zOJVA4j05FjAsbocoa8Crv2QxKO28BNbsM=;
 b=IEl+Zyinro1oEoUa4uEJ7xAmwCnTqabMdrJdmTT+6oMonxOYsQ8O67PL
 NHb/qk1XzblQwoCMpN4Y4ngxVv77yD7WSskaBrrRzxHZtGgU3tpZaXku7
 v9SE+VSuuXfyxwKuiMThdlUvEaJ5jDInMX7t9poOMTfAP5AM4R36i1QrI
 dwP0HV44TtYkPm2TNKXUnCEdDOScy7uhxb6KWq3nj8XtSIKEdrT+4jvPM
 DDRoQo6L6kYhzXEFKjSWWbV6a112hl4AhsF4dwl6e5s/0ablwwOYyzbZB
 6TdqSz0qPJorYD98Z1a4u2daC0oeoTOxW6F8IVFtaY1m4qhHxpTIkGykI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="418010653"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="418010653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 09:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="6150376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 09:44:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 09:44:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 09:44:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 09:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4i7Ja//gqMjmEclX4votiXETln63WY5HRXRTx1FO4b9r2UVVAdnFUPKXGhZqPZk1s/HfBdEpqCBPTTdTfP/N7eGatn4rMq9aLaq33sr+/Gt8Mey7QDPdUHgzVXBNTTXTl+NYuuDcHNgFqZexDEwira5VuYY92kh1+UuuxK5KbEtCzrVEAxmH2WVvLRNWaQI8M/gYKN3/ZFgXJWN0ZTIruyhGF0SCY3PW0I/3LntRz/S4uGwTkoqpYSBMHjyJE6c8D7hZf95R8DY9AZvmatSwXU7luKX1CG+v1J/96k54XG7CkyQcPfs26ALvcVNzoDBCCiDiJA2crmZI0AyufG6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSob96w8S0UHFtzCrvzpaS38ybD7Me+W8S1d8dNBf9I=;
 b=kF+P50WKYmR3NS8fGv//rCaWDEkgZtk1t/Rbdw4qMNZPjm22Lk6LCuZ0/DTTOzeRGHMGB3x7GPCC+iFgqwQCnZBYLQkNRmEYJAmEJXQ3UbPizQC1OLoU5+CsACnwYI5SY2RKzYNHXQnvi4UYeoGOV4LzjrFGzop30y1EIg5/dJr6L8RrD7ufLtIGl0i7DK+az1wcAm/aWkNsVlfuN7TK/mDsqf0vSnlupPqSmy3HGPklrCMZT7dZ5aWHl7ji6lygRNIBjY4bsEvAB4PKyRER8eg5f0OyNML+QkCr97uyAHubm1mPZMbzx5yl7q4UzEN1jL/wXD5d5JGSzPxjOGJqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Mon, 23 Oct 2023 16:44:19 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 16:44:19 +0000
Date: Mon, 23 Oct 2023 09:44:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231023164416.GS5757@mdroper-desk1.amr.corp.intel.com>
References: <20231023152138.132614-1-lucas.demarchi@intel.com>
 <20231023152138.132614-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023152138.132614-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: f0300a6a-29f7-4dbb-1b93-08dbd3e74d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5yy9AD3Hsi+DNtRkKc5C+l2700np1cWCQJ9A+J3NtIwnL+vXqff97HTqrXnsxmyQBJTEy2WVJheyZhGM78GSmYQNkUfyQNAGp6+MDIkH8/X/NS7IoFrPrRZLNTOmz0EMQL8u9aFsLvThhw/XTBc7GfAlS6E1+sVZX5Loaq6W0KkiPJ3gWfB9yyiDF6f6BTHqig406vlCiBf9G5aiUX5bcUJ8PyqyjbJU3266+bOcPPKoeqY2JB0SvkxPcpQv1tmLJIn5422PkYKJUt+1S5hKjqFlyfsoV6RUU5EzgmdHLabvhiVYIimMmyvpw/2oFzyLYKOV0AX1XzTDpL+8U4O3mt+pjtBh6obTSZlHLXvk3HloRR1KKE2JIrQrSSNEusFVbseZb4EZF7mdotd7bayFRTlcaxUjvRfNQEoIVirZf6No0eiaWAaYpd59RNP+rHU1CUBu+SQMgUhngeS0nxvDHNJVqCg8ILDX9BBKkL5+rEwxe3SDfjGM7u6eRO/uhuNJHVTFONmn7hzxE5hIL0cwUaOzQEXdLOvifLaNOm6sGnuQujDTFfTUZXvBv3wP+HL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(38100700002)(66476007)(316002)(6636002)(66556008)(66946007)(82960400001)(1076003)(6506007)(6666004)(478600001)(6486002)(6512007)(83380400001)(4326008)(86362001)(5660300002)(33656002)(8936002)(8676002)(6862004)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JU0SHI6Y6WZsr1hETsyemGyLPzTBx/w8LqqlVgUiQmzCPMe98bHL/KXF47IM?=
 =?us-ascii?Q?ybrl0qGUiHu/sx5wZrKICM1S+SXD+Rg4iaNMuTTyy4E/930IJyHAPyS4MQCL?=
 =?us-ascii?Q?q7sDDHTg/Kh4OaI2cs8D4sA7GxBizHoNjE4iWqCV6Bx2ikx0RZ0uJ9oeFq11?=
 =?us-ascii?Q?uNMpCh99v6QDO7fyp7duzXXuzasR3ocpUvkiTMOBiIwKeXEC2qgzoHgh5S+S?=
 =?us-ascii?Q?pvDXPEgXGN/jNO89lE3ollJGUg9B5E4GKXMqj2Pn+upMJpnJpJaVE+Z5aBDk?=
 =?us-ascii?Q?bMztOxOCz+x632hYOQCdnHvBwzm7u1X1dvPgvGtRIZAx5FxGUEmD1rnLI3i+?=
 =?us-ascii?Q?h1t3SRjjwNkrh+eds0Ix9p00Ar2rJ/ttm0raWE8hWGpX/o/OuzFIVsCIa7kp?=
 =?us-ascii?Q?dRUG7zRYHI9l0MlQkLAcPbBMCLMF5KhrPzjeU4fVyaMZBCU3qMG9TB7Qngug?=
 =?us-ascii?Q?ScOpREl4LC67dLGqZpsGxQ08t73NL/dFdIByW3DpFHO3N6AG2Wrv9kf7p3so?=
 =?us-ascii?Q?aZ/DYN9p7rShPJPZKVjjgw4zIgLnJi6LYd0NfjSJ2scq1KSuP1n8S1MiOF52?=
 =?us-ascii?Q?DENmP0sPKM2hu6tj5SZqYI3X3iOGzXU0cj6gmUn547p5T0UKBh9s47Q4JF94?=
 =?us-ascii?Q?SkTUEqhcH3ZnwJRLk+0di3X0XRL1NnGaYd3w870MnnOB36jaCrdOI+7Vz+Wa?=
 =?us-ascii?Q?duy1dkXUrOG/QwhSvEcXVX5u6UTPNDpdHNnDI9o4Vuxq49p15Raq/0nN3UeY?=
 =?us-ascii?Q?wbhz///3UFRplzzvQcY76VlCUImF2lOXZorPRN/c4RCP5Gt85luWGkez+HmO?=
 =?us-ascii?Q?42L8XPjUtqJucSzzdkLS2r+oUipXOozVxfFH5pVaAONt63FySOp8MYUTOSlb?=
 =?us-ascii?Q?SLGwfxushuzDs7bgYne6kyDqMbiFdcphSzaNkmYJPeCih9ouYHdwy2Ibv2AV?=
 =?us-ascii?Q?SesNY3Pb7POz15WXc0MMcPp2Lv1JIvAGdtAo8GdxnMWmF1OgP2KZgusR3pQi?=
 =?us-ascii?Q?a20i/BpyTIav+6bnnTIGqZEWlDFVoxEZ8PfaPoHm5YgnR0pQM1n8RltueXD1?=
 =?us-ascii?Q?9df5peCge5qe6kwmZ71f1A+YSS7oBvwbXJYavjMXn/mM9iHRkC0nsjzUA0KU?=
 =?us-ascii?Q?04OAyjB5rPxdaDzZLNcilX50RcdtqPbFDxSCNWydrPiGn3NohP17t2oMrKLP?=
 =?us-ascii?Q?rft5nIKkQgYGi1XNYFGXL3V8ikTt/3u/9DdX4M8OHVEF81RNNctG+/jJFUda?=
 =?us-ascii?Q?dynczE+2eGjZASu/O+VYombFHS9wD9UCXYaj5j0YEJ79wQd0u6lbSUBpUWzt?=
 =?us-ascii?Q?BjMYH7XWK96jAf+cqnCI9H62rsVdDMF2GEgKNxnsry8xp9PzNvufTP2O1hL7?=
 =?us-ascii?Q?5uCfkig3VnILWbzY1VGI7TaFtH4bIx1L6eQcFDVFsd3aRDBLqbQ/V1ImTzai?=
 =?us-ascii?Q?DKciK98swyIQuPYcb6Ml07S1Vv+lLDgG04g4jdNcsHp7icwLL2UNd9/ejcAr?=
 =?us-ascii?Q?zQrZTgBH9b7p1mjbnfM5al3qx9ASqIgTLvwGiFrNH7jATd/H4scW0VsK4WAX?=
 =?us-ascii?Q?lDswU+cQRN1Lm3b6HCgY3VOK8BQLJuChbVWnU4MwlSSBsawHoDGaNEQbpqUH?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0300a6a-29f7-4dbb-1b93-08dbd3e74d23
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:44:18.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFHeo9BxDzOSTLFe0uLtXdXzcT/ASZ4Il+nT5TgR/s3p5vGN/yhrbf8ilYOQlx4wn2qAzSfJ6WMo6d3n3avoS1bzI3ZwzTCT4NfG1wM9ynQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add performance tuning settings
 for MTL and Xe2
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

On Mon, Oct 23, 2023 at 08:21:37AM -0700, Lucas De Marchi wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Adding L3SQCREG5 as part of HW recommended settings.
> Note: Programming exactly the values requested in the BSpec,
> even though the upper bits of the L3SQCREG5 register no longer
> exist on Xe2's primary GT, so the hardware will ignore them.

This description is slightly confusing; we're not actually writing the
high bits in the tuning setting below.  The bspec just gives a literal
value for the register tuning:

        L3SQCREG5:  00e0007f

On the primary GT's copy of the register bits 21-23 no longer exist in
Xe2_LPG, so the suggestion to set them is non-sense (Shekhar confirmed
offline with the hardware people that the recommendation is just a
copy/paste from MTL where those bits do exist, and setting them on Xe2
won't actually do anything).  The bits do still exist on the media GT,
but the hardware defaults are already set, so we don't need to set them
explicitly as a tuning setting.  The only bits that we need to adjust
from their default settings are 9:0 (hardware default is 0x1FF, the
suggested tuning setting is 0x7f).

There are a few other quirks to this tuning setting that might be worth
noting in the commit message as well:
 * On MTL, this register only existed on the primary GT, so the Xe_LPG
   version of the tuning doesn't have a media equivalent.
 * On MTL, the register was part of the RCS engine's context, which is
   why it's an LRC setting there.  It is no longer part of the context
   on Xe2, which is why it switches to a GT tuning.
 * Unlike most registers, which have the same relative offset on both
   the primary and media GT, this register has a different base offset
   on the media GT.


The actual implementation here looks correct, but you might want to
incorporate some/all of the information above into the commit message
for clarity.  Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Bspec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_tuning.c       | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8e01ae49ef21..ec9d11b57bef 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -292,6 +292,8 @@
>  
>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>  
> +#define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
> +
>  #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>  #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>  #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index d70519816522..53ccd338fd8c 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -24,6 +24,20 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>  	},
> +
> +	/* Xe2 */
> +
> +	{ XE_RTP_NAME("Tuning: L3 cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> +	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> +	},
> +	{ XE_RTP_NAME("Tuning: L3 cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> +	},
> +
>  	{}
>  };
>  
> @@ -63,6 +77,15 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
>  	},
> +
> +	/* Xe_LPG */
> +
> +	{ XE_RTP_NAME("Tuning: L3 cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
