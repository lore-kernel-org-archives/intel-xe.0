Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5471FE77358
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF65610E1BC;
	Sat, 30 Sep 2023 05:29:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5910E1BC
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696051788; x=1727587788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pJMVAWjmBGdhjs7JTWg/XL/KvhPlzParFUNNaxcHUPE=;
 b=ahD2LJYEvJUxccOomIDKsrGNfFkGaMOdOQxwA9Pzl1Uuk2h7YrOtxxUt
 tiZYgoodNouj08LFjxror6IjLu+pemZiy8cK9KBVjEHqOtpJduxRiABPp
 ag3RlVU6Ap+fdu9TA3SdEc/hjxtGOBfx7jUJ11YhWiOAKBcGbuepVGu0o
 rHqzfZJgg5DrpJVeTt6PIvsYyCDwbMUkOXcOzGq7Jgx4slQFI5QC/MOQv
 48gL8GwS8JKQnv9Jwv1HD6cd5K7JGqFE6rdAtlZxJqfHpIEp+TEl5au08
 ZB6SwhPDstMdbZtwfNpQLgwxFcdxL2YlMwkJhFyU7f5eeDUrhYRV/C9nl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386292808"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="386292808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="1060787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:29:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:29:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:29:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8/U28mYjU5xBjkeBvbe0nP3HITGvEoXpYYUfp6JHDTmLs5+JPimJ4zbiqiYbCjLRNB4c7P6rszFqhOKlMHzWxvj4bs4+cYWcKZzep0e9s3wHhsy2nEs/dOsa4+vtUeETltA45SJEGmMgbfrJX3nsdHHdP0yNe6brKCPz8+WjjNgRM91t3RuUzXf04G4gC1DwrIkWO3Ny9aLsab+ZaARaoAX8VCVkZt4+j5BVlqKauWCdkREVeDrfxIiHqxeWn1NwBQnbjjLwFH9o32Am02XH5ZezyDlZRrCEOVxS2UsBXfAbyqJrioCSMmpu0bBcyCCXqXVjEVZZJVSGfabqWOXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/sB19NQF34/Y2OMlwEMUC01fm4pLAeW5mVMFZHIGz4=;
 b=GXrNatEuv+JLaIIHm9pdTpFmxeQ4jgIGSbJ3MftiNL/RyExYtWy61Vmpy2SmQH4+JQNw7BormSxwwg8WmLkF7iQo88VO5vJp7xYkE7zRsKzcvBcvC66x1iFNI93obKyPV3YJ4LG51Rm3ieIw6tD2lwS/JD3cbOqZ27rM2LaE1czdfr+8dzxWzd0OBxHK2vCaleTVnWyEdSIN5xIE2KOZ5tdvylYFfbV5/GVdaM1QtZmePyfQzsGdc0QXbdQ+An+URP+pIWgJseZVyUPpTgiGGyLMCd2RTTDHuZ8dyGTIY9lpZp1Wcg/4fsInLVNnpHaek9Cj4LAfQdJZWxmSYiR+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Sat, 30 Sep
 2023 05:29:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Sat, 30 Sep 2023
 05:29:45 +0000
Date: Sat, 30 Sep 2023 00:29:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ena7wufewvqvvfm5w726ew5d7wv77o3eclri6446b7qoemniiw@6his34oexibb>
References: <20230929230332.3348841-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929230332.3348841-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfa3b6b-cbe6-401f-0d0a-08dbc176410d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoqgSeui/LwTAyMF53U1zDDTyXnopGeh7cDjJ5Wc0xGuGxcO6X+B326d/s0gD1FRugjiJUGtrick8zM0+7hkrx+nWWNiy0+d+ZjPcoajwNIppk+s+atlHK3Ozqn3lSFFwjGH1fOyLvwIOZwfFRATbndWf2rEorkHxrs2/7lGGCvLFE92DSZJ8yUsm9gQ0r7/KN/wg6oRZ9x3lmcOt7ixsL59MiIKXFJ6QJuJQ+dRDiNcmMvhcJPaJKnnM8MaAzFCGWWzSiRwtCu+J6MjSq5foE4PCIvUYQ/p/SAx4QTnH/6CYI7kKcYm+1oWU52O7OPsZv93Jh/n8+Qqogg9v05xoa3I9HtDUwSWXCsomoog/tBFjOkwMbgzhziKo22GIwNX7+JoiOfg58Ml+uBXQE2tp93UPRyyptvlBZq0oD4xuGFIeXt7+0wYO3TXKb3pX1W7jIrxseIOJx1wMwMN30C4nba8q5bGpIJ6jE5GnifvkDj6lgqsk3hauqWSsaxA5azoZQMKl11MNcMLSXXQL7iW4T29FhQ8XKsvqWp7Up/3tPOj/d4ZbYJDwAtplb6ox5O/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6636002)(66946007)(66476007)(4326008)(8676002)(316002)(41300700001)(6862004)(66556008)(5660300002)(33716001)(6666004)(6486002)(6506007)(83380400001)(478600001)(26005)(9686003)(6512007)(8936002)(82960400001)(38100700002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIosJevzfNyPjzp+wCfikvIaPfudrFmgASWkFel7wdOxYY1OD/CcOd8Rnsua?=
 =?us-ascii?Q?76sHju8Dz4rxABqetQNoCMlKrOEZRkj438NxA8HSzXH9L4+bKKauZPSgVI8K?=
 =?us-ascii?Q?tdTqNAzIQc+wxpyM3TEDDt8BeNI0kT+CYNwYNVtGwwl1ZTFV1JES+Wb1A1aa?=
 =?us-ascii?Q?6PoQymmN8VzFRD/6puUO4Wjjzi4MVKDuDYQxGzF2Lu2hbgWksAFSZypITseh?=
 =?us-ascii?Q?96cCZ+YtvYMWDjEWead8UhpKnjUZUFvSlerbelAEDBcscYUyvl4NT9cqGHAO?=
 =?us-ascii?Q?lG7R+qfkSCFns/DqDoca4diI/uJaXv+nvWCv4HuyjrKumJNzGwVuM2blXMeP?=
 =?us-ascii?Q?UHO1ZshHoAIiZiEQ84hvo9lsyUiZl2gDVXZblyADRH07Q8vfQppo5qJwNr3/?=
 =?us-ascii?Q?2bnYhAM2GN6ucAL30Bj6BLxCegjbHEFUuEupYGd7sQY5Ko+NQJHtPcoWzdAD?=
 =?us-ascii?Q?jza+X8sKgHx/L6YcA7eoJT0xbBTQXFTpEc215lJzOjXCkFqp1Orx1yalM/It?=
 =?us-ascii?Q?SuttIWPhu+c65wMf3VZrfP6GFyWUEPsCY97fgXWqkT9bDZ8TtKYfAiTZkz5s?=
 =?us-ascii?Q?JhEcEaocGWb07M6akDLrh0l7O4AZXbgjlbd6daxSF40DDSV7OR0KuQsCYfyR?=
 =?us-ascii?Q?JQCgo6QF59Jk7R2p5ts3Sji9W15M6oib7hEtjz11iWLMZNdpt6i5pj+wJiCx?=
 =?us-ascii?Q?Vp1TTf2VmAc47wJmU6YCcm7K2yB34YHpqiRu0/dJGjxERISJwjbhjoZ67oCv?=
 =?us-ascii?Q?ymS+4FD4v2K0NZZWmoJAXPqEhADxCNjgxs0fLyRixbWxZVO1S+Dc6gN/s/fX?=
 =?us-ascii?Q?FrlEskSrlO19oTNgktV5148hhradaOXEu3fWZ5cqdqcUXsBX1U4U/+W9diHJ?=
 =?us-ascii?Q?IIupltQwnAl9iVWtDTIXngMXa3s+EP1W+CdLVIeHiZ/DO64Iy2qmne0tMYVi?=
 =?us-ascii?Q?APcgF7cdNVV1LylYiXLmq/P7zInkB0e2rBuJV+9XHHq4RBlor7yPGH2FlnzV?=
 =?us-ascii?Q?jINe5fD2ZzeXy3MD10AuW01djIhB8+jACBSV9RaTn63xBOBFHaSUE3xribt1?=
 =?us-ascii?Q?i/N8SgyrW44R7OLe/vxP9cAslqOfYQGqyNnHO3zI31sfqIQPNj8ko8Uh3qiN?=
 =?us-ascii?Q?hpkj1xR2LVCYLiPqf99DtTY7QbcSh8LgBFcDZMiXGqls3p90idoO+j0zBFsn?=
 =?us-ascii?Q?Y0yPVNztQsV7S9LfeUZsqnV7C7utXQ1LCvY2j4jF+2ATcvrSOzywFoiAR+v0?=
 =?us-ascii?Q?BWLQSNmfL4/Iyn2QyxqEpQv/8w8CwK+6ZxoPK/jvXYJP2w4K8SBwTRgkMGFX?=
 =?us-ascii?Q?zUE8ER903iBCsn4mBXYDd2+92WbTM65S9pJzropTLW2XgS2e3EwAe814Zs0w?=
 =?us-ascii?Q?TxhivhkUbbsYcULbDHEtD/tixdq390m2vF3ao1SECg669FpthnSihIUJ6CfR?=
 =?us-ascii?Q?NMalhJGPvX1jwGuWGl8OgBgHXTV7D2AUO9z0SZp5TUSEDV8GzNl1SnvfebEL?=
 =?us-ascii?Q?aXV0ss5U2xHD4s4RxgUYi/BsjYmDfgxDOQvAMF2Oh71slYoS2qgcoI3cpLAU?=
 =?us-ascii?Q?o/50wDNlXh8GH+nbGNsklH3T5uPXoIjkZAIN/6WkHK2S2v5Y9Wml0FKZmqYM?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfa3b6b-cbe6-401f-0d0a-08dbc176410d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:29:45.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqfOyxSzEpDDzOdlEJeRUoCEs/S1VgTH++SY6bH+zD38oOHT41G4w7H3oLyQzBIRD7XobdpRzFpRl8RGCIosUexz+iqPgEdsB2i3oJAdy/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/tuning: Add missing engine class
 rules for LRC tuning
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

On Fri, Sep 29, 2023 at 04:03:33PM -0700, Matt Roper wrote:
>The LRC tuning settings we have today are modifying registers that are
>part of the RCS engine's context; they're not part of the general CSFE
>context that would apply to all engines.  Add ENGINE_CLASS(RENDER) to
>the RTP rules to properly restrict these to the RCS.
>
>Bspec: 46255, 46261
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_tuning.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 412e59de9842..08174dda9bc7 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -29,7 +29,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>
> static const struct xe_rtp_entry_sr lrc_tunings[] = {
> 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> 	  /* read verification is ignored due to 1608008084. */
> 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
> 						FF_MODE2_GS_TIMER_MASK,
>@@ -39,19 +39,19 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> 	/* DG2 */
>
> 	{ XE_RTP_NAME("Tuning: L3 cache"),
>-	  XE_RTP_RULES(PLATFORM(DG2)),
>+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> 	},
> 	{ XE_RTP_NAME("Tuning: TDS gang timer"),
>-	  XE_RTP_RULES(PLATFORM(DG2)),
>+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> 	  /* read verification is ignored as in i915 - need to check enabling */
> 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
> 						FF_MODE2_TDS_TIMER_MASK,
> 						FF_MODE2_TDS_TIMER_128))
> 	},
> 	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
>-	  XE_RTP_RULES(PLATFORM(DG2)),
>+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> 	},
> 	{}
>-- 
>2.41.0
>
