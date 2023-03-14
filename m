Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F18C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 23:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F0110E0D5;
	Tue, 14 Mar 2023 23:39:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B503210E0D5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 23:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678837173; x=1710373173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P3yXuL59y9LWDXtycXAcZ1cvBn49QgSpJTOLU/mZ3q0=;
 b=WF6ev86JpBeAASyuuV2VXrZZ2UMgNw65DIodiPDzwPRLEpb66xtmV7U6
 G+tmCEWvGUWvwTaYST4Px0e6VkDbiAEwr2l6BZDxTVF2kjDz3TZ3ONK4A
 ZkbhAtCAC5kA8bsK1GYfHzqNC2f8Nue/W/cjSohsjDBztVhHOKBoTS44A
 Zrwsd3mH1ThLf46Y7afCB3kNNvqWtus9Kp7pukiJfxJmKilfxmYohRwAD
 555vanx3q9tSIBaxrwjeFYl8UPR2MhYusUd55XMKN634NVuDfezxfw75/
 AAoDy5xOTFlMJvAtdD00ysoEJufiHwmJE643uVQ8m5FO+ijzpU7C53quQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423842531"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="423842531"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 16:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681621626"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="681621626"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2023 16:39:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 16:39:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 16:39:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 16:39:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 16:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWNTR7l8TTMPHryc8MM35M4Zz1/e48BU2eRk59s15d5LjWOZrfv5t9HAz4wdoOqI6kRZdLb3rAdsXoTuIFp99gf1DLEhRVIzpX/pE4T5FJP1i+i1YWs8lABqnF+OOdHD9pQxydXzixglmwUSTR7RT9RlzA/TZB+kjfsguUDUa2IZRqgP/EvpWjY3Ya49FGjggY7jpdk7L0zbcS72Aco5XegioGyXv1LTC+c3S/GBBHlpAJRJ5m1VfCZMRrbGY/Rt1gKuxhbuJVg9Hj1vGY8o9G7mgi4Kq1vy/QALLB9Y/jNohbMZrBz2WXtuXHtwmsXROGFq+53YxFfiHfEv94lIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xe1uG/WX9q3KRtSn5kor2QbmgUBV3o5MWOYIOgwBcrQ=;
 b=TKtU3PAyWwNZoYnW0w8i0bWp8xrLcOVW62ot7BoH6pciLKzFsiuREITfUdQET7nJLG2uEcm0O9JGi4XHFrhe21ZlT4WEcW+WXymMhEypLnX9Tvl+gX3NCmg0GPtzZf/OV3LPsEez8sK1qGjxwwHAYd6g8Va4j3BGPvTBbCvwRqjdqfYE8dnU46hONuhd20vp/4LME8w2HDQo2aLX/SYF9hnu/MV7qmAYVeLlx+7pcotfBS5/1BZxjh0xLQUlvrNQw9YV9T9g+16zYB8m0w/HDJwv0mVSkAbAy7mVBfnue36Rp+Q6SZB8vEGTR11WIi3rWuSeIQ4WruwqufVszONBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 23:39:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 23:39:29 +0000
Date: Tue, 14 Mar 2023 16:39:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230314233926.GB4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
 <20230314003012.2600353-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314003012.2600353-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d502dd-2a35-4d9e-bb4c-08db24e55adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmPrB3zFVP8CJftuzeFsf3QHGzxSestEQMPUM5Vzx3wZ1Nn0ZP4An9gcpHaRCmtQNWjVjDIx4dB2+6voRPV2BB3WEv5Os5sNh4FoMybNMBNa6Xr6AL1DAFeqpm400IBRhYzEi0x9YPaVqzq47W11jskSa6mzzR0hoyhaCKBthX68iyu0hhOsmhUS52UlGJYExniOLA+tj3UFUJapEsm/YnLrpdjdDU0fjC8LTMyVZt3cesc7XOW2JcOaw4X4KOpP4IttU3e/HiVMEhtZHeQoQ17OJa17FXuNSZMkyzmNfavbKBfFTGCTQL3sGBbU3E90bnYS1DdLPnX4NEOahO1IjK3iYVKFZrA3xLgpW/2i5E5Jk9SK/WxOc3WF1R6R6R6GCCrlBnr30kixnqw4TzXOGuzMNBBS6Fi+PpXuANNnAX9ftEeNiGD6Fyf8M4FhAjbTejCIet3igIlZ+IbW78Nue/QlzJKApJwCJoAXwG/FBGedplFfW7AwOgNFErG47U/97VsNn7y46olKFUx1J23GctBjvidOmJNUpbMuitx15TqPWm9KbavK4f1pPVgxYeM9Lyr2huRfiI9sGkJrpjTqlDErMSSyiugSsU8u8JRTIKkrBGHIxKRKWQ25BUJhe7Ux//oCH0diG8T0/p5EyZUHFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199018)(5660300002)(66946007)(6506007)(26005)(478600001)(186003)(6486002)(6512007)(1076003)(6666004)(66476007)(33656002)(86362001)(38100700002)(8676002)(4326008)(66556008)(6636002)(8936002)(6862004)(316002)(82960400001)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IF38Tz3br88iCmHE4QMyygJ5i85bThvPksozyGOb7mfxWq3/SU+UHQDyfaCG?=
 =?us-ascii?Q?rrwOTIKMU6UFlgom0mGvRkXMly9BqNzOtf4boCmHaQpM766XtYl996nOVKPq?=
 =?us-ascii?Q?cAMffjlY0FiOD3xoXkfX0O/G/uIwGWHo39cS7Q8S8nNU8mjSX4zxzjvVPFk5?=
 =?us-ascii?Q?OFT8evumt9gSk/dobyb5RZZ75DSgA7V89+dj6qqoIH5Kk2qk4Pd1kiVOPruC?=
 =?us-ascii?Q?XrzcKJnLYVfK1tw8BguvWg6qxDP1AXEoPyYzYrAmgyVEv5KgQmTG86FtJaAO?=
 =?us-ascii?Q?cpskOeqSrImxNaqNKgFTXlzZt4W16bL7mYvTq3JQWkpzHJgF47rTVtlQyvAI?=
 =?us-ascii?Q?HcMozKtblX56LTR0ei7MVItDaUZ9l3Pb1E22+IETxiVxwOXEg3qtUirJzgUd?=
 =?us-ascii?Q?Tncg4jy/Hz1B71OyXXAxAW9AILi602a8aXqanOcKy93zGPsNqJ61CaQLZpOV?=
 =?us-ascii?Q?awyehdd0MSWKhqQEXcg+KUW2NG+OIvClkSe3QOantxru+9weUn0NjT05o8Jl?=
 =?us-ascii?Q?JQksCxbo3UpCQWw+OsDBP2En6AackA50f+t6WdL0H3wg5GdOYanJXGpUWCtv?=
 =?us-ascii?Q?PtASnwpu/+gnP3wiYCi6mgCBVXcpJ0PBbuTCMYQ8k+VD8Y9Tc+w42zO8r/Yn?=
 =?us-ascii?Q?qO9uz4BGP4d3ykS8J5PsSBLEJD6kKS8ZThyyayaYzLULKErls1KIYkRHAS79?=
 =?us-ascii?Q?XRoZRcJlv5yQtLoWKFqH77VhfaWHZPZq8WtPrXfTBIUkC0VLF6/lFwvPSjzy?=
 =?us-ascii?Q?yt/Uass3EptfZnAABfG9E02TXWvt2keycBHMZS3baIarZHtaGsF8tWualBUp?=
 =?us-ascii?Q?/pYNNuPu912tFI1bw9pxunV9dIa9dEsx+DlZ38TN+2L8T7e86dPJtRam0mNH?=
 =?us-ascii?Q?s7SNhU6H6VGOO6rzT4jPHc3w7RSDknezZGeJT9vlzs8PWAeySq+ksECXWY6k?=
 =?us-ascii?Q?F5xmAMFQAQD5Ohag0HvTUtNlataIGHN4X2m5CiAiYEZMGYiEluph5Epmuanw?=
 =?us-ascii?Q?vnFNRY68M97wsn/PWkR11My4RLk7zDvu1TXjp4+hSCfpmQMPsZlKdwao349q?=
 =?us-ascii?Q?xmB/Au7OUrm4Sw+Hlx+x3y74BMopyUIGC5g4vkoguvLTy6XaZLbmuQeNo4BT?=
 =?us-ascii?Q?OzUtVKQk38VcPdPbrrJisIT4U4W7zFBHROgjP3fBRzrP+LJ8e2nT/A0QZ5OX?=
 =?us-ascii?Q?AJrZaUkh8UP1vuwXhdP189kt5o+SIU0INnWz6PxafSJR44zX5PewQcaa9ufb?=
 =?us-ascii?Q?C96veAy31VrlU0exhG4GQUqlZZenctBt6TopUhNPAFIIpGCq90b82J17z4dv?=
 =?us-ascii?Q?+GiKfo6dp/20NvC2ieV/mGJ1YXhWvr7OFLCjT/QYM/jd8oupytgHx7dt3B4Y?=
 =?us-ascii?Q?irHPNxyCKrdNfTk7G8VaOubLe8t19N8Ww1XUlKBH6KhQjA+JGLg96gzhPvTR?=
 =?us-ascii?Q?zSA6n69t3NI6SEgJrM5Os7rV9lSl14Ml25cOexEjysvzOmppFXxy7K8PLJO5?=
 =?us-ascii?Q?Yqiby/KRBmRCcqBw3eQ6HNqNF+K69gA38GwQCpKGA45AyQ/eKacdKOaJWGle?=
 =?us-ascii?Q?G6+gfsxxfrDf18Nr+zt8DrX0YM8QpRb3CNbvVhOYKFcpZclZ/cw/HD3lwW61?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d502dd-2a35-4d9e-bb4c-08db24e55adf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 23:39:29.5029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4iWH/6fmvpiaiIgfsfILnlEDLc1NBJehJ95H3dT/isfffPUjFvLkM4Kkdx26X2S1yMnRr68Oa4rP367b6o5hupSs04Lf9OGgvLi1q6k8qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 13/14] drm/xe: Add missing LRC workarounds
 for graphics 1200
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

On Mon, Mar 13, 2023 at 05:30:11PM -0700, Lucas De Marchi wrote:
> Synchronize LRC workarounds for graphics version 1200 with i915 up to
> commit 7cdae9e9ee5e ("drm/i915: Move DG2 tuning to the right function").
> These were probably missed for TGL/RKL before because in i915 it uses a
> !IS_DG1() condition.  Avoid a similar issue by just checking the
> graphics version 1200 since DG1 is 1210.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for the changes here.  However on the topic of LRC workarounds, it looks
like commit 6d4750630a27b ("drm/xe: Fix duplicated setting for register
0x6604") was incorrect and should probably be reverted.  That patch
moved a real workaround (handling of GS_TIMER) into the tuning function,
but dropped the tuning setting (handling of TDS timer).  The workaround
and tuning setting are updating disjoint bitfields of the register;
they're not equivalent.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_wa.c           | 10 ++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4a7ce09d6b60..4ab7860db9f2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -98,10 +98,14 @@
>  
>  #define HIZ_CHICKEN				_MMIO(0x7018)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> +#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
>  
>  /* GEN7 chicken */
>  #define GEN7_COMMON_SLICE_CHICKEN1		_MMIO(0x7010)
>  
> +#define COMMON_SLICE_CHICKEN4			_MMIO(0x7300)
> +#define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> +
>  #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
>  #define XEHP_COMMON_SLICE_CHICKEN3		MCR_REG(0x7304)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index e21c7ec53b2f..59d2daab5929 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -536,6 +536,16 @@ static const struct xe_rtp_entry lrc_was[] = {
>  				   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
>  				   XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("1806527549"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> +	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("1606376872"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>  
>  	/* DG1 */
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
