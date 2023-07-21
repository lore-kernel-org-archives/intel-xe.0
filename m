Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F60EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 17:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A15A10E07B;
	Fri, 21 Jul 2023 17:45:41 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048A10E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689961539; x=1721497539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m/UvHfpeFyCQHYV9GvPk5H/PUyHm7GFMuN/1llrgRfA=;
 b=d+h/QBADhjQLsgjoR0iRBbsJpUx09+ZcH781BQyjcTyPsUj4R5kNJpHx
 jHPMq6B51G+Za1GCjNjuAsiH8fUy41ASmrfWUHXcwdXxb7HFhW2TZF2IT
 +ovso1dWW4SWlRtVG6jC7fPBAUeya3uwEAN7sNgFVnZLhwjRhQ+OFFiAs
 84nM4V+HqNyXUR4XruPyuSBX2eZYS1uWVZjpPs+gNbVhTY+BwehNmSpmu
 EoBbqqIOEOmdw8oTqvMHfMY28jsSSszRFlb7JRvjeCi2gYtIfMUR5SIM7
 IPsqjRUKaeTevqXKF5/B5ghgjjwoFbT5yytE9rwCBPTsKemSiPcENdh2T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347372901"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347372901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 10:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754563760"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="754563760"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 10:45:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 10:45:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 10:45:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 10:45:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 10:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEiS7/mYHLOZlV6pVezWLTqpqcCmlm1t4ATLmVMwZCDwicb6qUtaBR58RSbl9o9nmo84a8RPCu7UxtmcNTfv3hFjIT6cud4zI9SzMhhAMa/EllB1OTRJ2KQ8rlpEKOdpk2hTssyJFBVncDm9+x9xECU5aO1+fNuowln+bYdMPbyjyVCRf149b9lWD/y5kq1Bz994HcFdEEkI0QSejlES9aDlyy5ZM6PiDHT2dGzD7fROnxbUCftNFmsyIDSrVVkDI8ZzeX8K8AILW9SzcCI1whC0JjGpTcW8BPJGUewJN8ynvhLIGGzo/zWpMpAsGJqmSo1CW39iXbtVasXxkn4b6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3z32asdHHv5GqVkfvyXiT+BwH087eZ4HeZtPxyJWTk=;
 b=Kl+ZvqWSSRW1Dpz9x0LdCtmjbguI9BlvBLBQYD6TgfcrhWuYCko1li0JLVb9gfSd+a3m42HyYLCzrgX8HgmBdh72jVhINSktGSmITeelmfMYX785AneAQqM/znwwAzhBXpiI+u6dGOVJK82jaY2NmbCPmsrTtJFai2FUieIUhVHCVN8UIVRG3ydz8mA8FqKeV2BCDf2nN7pDj5VWrg7gpr/+w9q0g0QUI8cPrPXbHp3CRs1N6uoWliKrFCWg6FquGhQB3NJ0CrFswwIzazCaT5ydOWnINfXmx0d/+CVkMCRupK6DzV37Afdgs10BrOld8f46O/AHPmh++lbSGabOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Fri, 21 Jul 2023 17:45:36 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 17:45:36 +0000
Date: Fri, 21 Jul 2023 10:45:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230721174532.GA138014@mdroper-desk1.amr.corp.intel.com>
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
 <20230720081038.24822-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720081038.24822-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: a5002f11-4a7f-4e97-64f0-08db8a124a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzysTE2yoyv2begegU2NiuNAupLDYYQv+SpmvCR43V7KxZt+4KUBcYh8Yq2IEPGAWN0T47tLpHT06woJaMJdqWCquKzBI7oVwgHxcPRCeXMvrdC6gwZ7AdhZPUV1+QGXFrCS+8mOicBoJ5TFSfTvtfyqraT0AdY/Q0SZaNv3mlK6HnuQ+av0VVEemqY3rxf1IY1sBw29pKfGmDu81V9wlQaGWaTOv9n7ocNiGghpIq3O5lzIzGHxtpQfTeutTW9EeGMn/hNdnp15RfuQyNfGu1eAOpCbFgaym7ZAu7PD9AY7XLp2N6cVwmuErnUgf5fSXpjvhwE2bPujwI/LoWVVjwCNG1uiPc78WJ3kv6///HIrf7916bTQTdIJLcrEMauw+fVQQ2F+IxBSWPhMDTqOnavB4Nggr/0wB/zT3J5yFKNpldBEUBG4Q5gE5owMVvp4BYo6HkgsMEuMYx7/lHPSQZLw4v7qdgoYRzRQFQlmWE1BEdkSG7QGpDIm/aw9OTlepq99GbFS3abLATgPkLoC1EdSEyuGT994M3ViIkYNeKHMU/BXsy+tVJzM/N2Lzbqi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(6506007)(26005)(38100700002)(82960400001)(1076003)(478600001)(33656002)(5660300002)(66946007)(8676002)(6862004)(66556008)(4326008)(66476007)(6636002)(8936002)(6486002)(86362001)(316002)(41300700001)(6666004)(186003)(2906002)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eeJZ58LZugJRnDTIVUUfmsU+uUlFpqigO8r3cb//0KFqAZXqAAwFL8RJjrVm?=
 =?us-ascii?Q?FX1xweCPzzrlSaHYbdup89C+tiojzL6mpAWM48V81IsX9kLo6iB/oifQSg6J?=
 =?us-ascii?Q?CdhP/GWRZ61pEQo69mnD2H/xTPoktkvr6xI4/D0d3O0vmYgEVYQ3yqOZWjKA?=
 =?us-ascii?Q?Z8mhj6bI9sahgXBDiK2o0CCAGn2M8unSD6eXO9SVR2kpOCJfDNXjxcQMrYQE?=
 =?us-ascii?Q?lfbpC+Mfu/hfMn4eiEfPMMlJKnql5yXiduAQAyOQjbzSz4/NKlGKboPMFygW?=
 =?us-ascii?Q?YBVZKGkigSocE1YXtKXZFA6ZGUR0NrkQGJQeRAYKgDGF/RNyZBgqVCmhnxGL?=
 =?us-ascii?Q?z8ATG0gdKyR/SL0YwXeAJCOBiUtC+TaUsY66ZGifHSX5UCMF19OMaMYt9CBI?=
 =?us-ascii?Q?EpX3Lz3n1xnyKJpOFbyb/mmuEZffagaUdwGmVUzfRIZCEGrrEFS8pclSnG/X?=
 =?us-ascii?Q?2HdN8X88WUMKyDoQci5ffgdrSX3mo/2Spb8XfplEEALjczs9pu31RiRjbfqx?=
 =?us-ascii?Q?MFmnPs3FmgLdjPj/NjBjUBT3j4HGfTLO1Gsj3O/Nnl6RM06+CvBcQh4W88Bf?=
 =?us-ascii?Q?ELr8ap3p4byitHP16U5gUujsK8x6JMb10mu+8EU0OqSYe49chbqZxTFTF3YO?=
 =?us-ascii?Q?4MurHnIat9iNJMPk0UJkc9iWXmZpsCiQz2aU4Dqz8ZK6YzttNzRfLUtOyq3N?=
 =?us-ascii?Q?GOcuq5bHPe+71SEhKzuuf+BN6WPXyUhyJnWPCWI4mo7xJjKO3MAKZ9f09BHY?=
 =?us-ascii?Q?UCUozyJm+E2yDVCsQjxEMGWRNEKrbIhOP9fApqiv5jP4N76hxOgkorFVQPYM?=
 =?us-ascii?Q?3f8P7NlA+Tutw4o8fCgvW4UxIyEpIMkn02poUGXLBwyyQnBOGKI9nzONtWuj?=
 =?us-ascii?Q?z7WidE0gIXoAHnUPpTHanKmq1TwXwLnuduQ7PEq2Gr3bQTal9yuAVGWPrXBR?=
 =?us-ascii?Q?11PEPlMAA8seYBOo9GhF0RTM0MXqtc/vylkvMWDUbfFzFH64A4W5c57XtFH1?=
 =?us-ascii?Q?ssvspC0nvziEbylIhXgVDlaEH0WWrqx0DqkYXEItls1+Ee6AI3igRzSlO9iN?=
 =?us-ascii?Q?4DP0//t2DeM6iCCFFjiYbNJLir35ESOUinhUdASvDH5eo0uFu64byLcniI49?=
 =?us-ascii?Q?YIrwyQ6A/nbUSOD9HT+B8rmX1zuPe3vVWeRwKEbGt8+h+RkJxKiSgwbRo1mR?=
 =?us-ascii?Q?VkSa29ttM5vRpKj1o80laPGtijjo+Rz6sJv6gSbw4lZiOTP/cNWeGWD2jvQK?=
 =?us-ascii?Q?Rz2HfNw6YJ75jofPllKjjixmQmd3RSW84y23d1h1ZDGyWW1wXVxSjXg7bCx2?=
 =?us-ascii?Q?p1nW0y7cbCXN7oplvaN0iPM3/Gp0j3BsitzIryq+tSHZFV3UBLtyM49DcKfW?=
 =?us-ascii?Q?O4yXwIs8RYq/2Q3CkKyusch0Pe8e5V3bH3Ef0Wvfj7KF9DhGEh3ACQi5hAyh?=
 =?us-ascii?Q?Pgk45a4wpojPwpbmpjOanX+Ghkc7WTf0Pm9/UidP7Ay0CBhROJ3bTdy9fEzR?=
 =?us-ascii?Q?EpXfm4/pNV09SoZlVk/9gBzw35jtdkx7sr+jv8H1uwxSsVSLKDvMgkJNbMBV?=
 =?us-ascii?Q?GWjT43PMsU7TfeNob7twehDkmgbM8UgSlqYmpNsJ/KZPLa7u0AnuvUb0h1gl?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5002f11-4a7f-4e97-64f0-08db8a124a03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 17:45:36.0384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSUCSdDjncSbqvngwyzUmZBC96hm+L+Ex/l+Sf0hh0n14nIYOXH7Q6U1xKEy+jF0dKS9MU2RgXwnD25gWEGwW0c7l7GmT2yl2VwJdS+BsgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pvc: Force even num engines to
 use 64B
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

On Thu, Jul 20, 2023 at 01:10:37AM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires that we update BCS_SWCTRL
> (via indirect context batch buffer) to set 64B
> transfers when running on an even-numbered BCS
> engine and 256B on an odd-numbered BCS engine.

The workaround description says that we need to either use odd engines
for copies into system memory, or that we need to set 64B mode on even
engines if they might be used with SMEM destinations.  From the kernel
we don't really know what userspace will decide to do with these
engines, so it looks like the implementation here is setting 64B to
cover all bases, even though that unnecessarily lowers the performance
of those engines if they wind up being used for LMEM only.

However BCS_SWCTRL is listed on bspec 45546 which means that this access
can be updated by userspace from non-privileged batchbuffers.  Given
that, it seems like this workaround can and should probably be
implemented fully on the UMD side.  They can either choose option 1 (use
the odd engines for operations targetting SMEM) or option 2 (update the
BCS_SWCTRL context register if they want to use even engines with SMEM
destinations).  And since BCS_SWCTRL is part of the engine context, the
setting chosen by one userspace client will not impact the behavior for
other clients.

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Nitpick:  The first s-o-b line should generally match the author of the
patch.  It looks like you're the author here, but Tejas is listed first.

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 79873bf64e8d..8e488cbe332b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -59,6 +59,9 @@
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define BCS_ENGINE_SWCTL(base)                 XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> +#define BCS_ENGINE_SWCTL_DISABLE_256B          REG_BIT(2)
> +
>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 21087f7a4609..b90f64ad301c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -518,6 +518,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
> +		       FUNC(xe_rtp_match_even_instance)),
> +	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),

According to bspec 53978, BCS_SWCTRL is part of the context image for
the blitter engine.  If we do wind up implementing this workaround in
the kernel, it should be in lrc_was[] so that it becomes part of the
golden context image.


Matt

> +			     BCS_ENGINE_SWCTL_DISABLE_256B,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
> +	},
>  
>  	/* Xe_LPG */
>  	{ XE_RTP_NAME("14017856879"),
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
