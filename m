Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B8C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC1310E0BC;
	Wed, 22 Nov 2023 18:27:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A36810E0BC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700677665; x=1732213665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fEWXScIFW4E81i9onDvqEe5uHeL7Ufhbuy6lMZbsYwM=;
 b=lPBQlB1tF0wPc1ZCFIdSNSQdhSvP0rd8Lmhk7g8ysiwMk+E4iS9I3abT
 Wo11Z2tBcirS4Vn0GRakTnzXzVrsV+8pbjsOfU+8uS1kDAYd8l21YwcJy
 6NCJiwnABjIXi/AYw1z9TEbYx0ALMwsQPLUZ7lRvMfKCO27gOnsrIMC7M
 YAuLNLP4yRCoaPPIUWculBYoT/N+KkQBYBgWhAdGdbPiqm1tuDBTDezUS
 CGVrqsE9iP9KiO/okgrTwY+opJO1VVMEMEnVB9imBJzIWQVKcVEjXcoxv
 NrrQZYVCKO7/CxSt0WtIjMan7fYfnUOopKPfIz+8DXnI4X5WGEDSq1eNj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391890130"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="391890130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8593310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:27:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:27:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:27:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:27:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:27:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUXmHNI0JtqOts0rlIHKa0E2LbD5RIGS0dIX7bE/hzaNkKBSFR5LAT8Gr5Eb400WAuxiTG75jpdSfyKMKQEtmraB/KtqJK72+bI54iyzrFXsoz+DU660fPJREn3WUBsuB3j6qiJBmH+oCy3ZCx0J8XZlPQxvhuzItPdY4GB8S+ju4RNkDYIcCziwgSNXpoh/GHEue9CQYC/2zZGEspkaxxsBHmHYtw1rHZ2zr+KZCVllWF+6y7aR7hdfLYVsTqhpQreIwNypZKP+X3Z0CFo/THKatfkwBeMpPcHZgeCebvBANtCiA9YTRM/MqIR06z3YlvNMCyRkiGaZoKF3jVzSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6NBETCkRhdk48hGcywiFQLWWk2j2tTyWeUQbCKEWaE=;
 b=mqevEapXJ5ePJlctARdigt3yyCRt3VPqbciVJKcKtbyRUtJPKLTIofngFV3JHfs1/csX/hXw5Jlc2Ma++9ZvL2hFzzD62LO+CCIXyAnnGLQnK22wcBoKYK5nLU/zNMFYtVf9Pt2oy4/xbP4EpIZNSoSkHCmyxGxR5H+kVInT6ZjtkFKYHSIXrP+K5/EGAfg1a38vCXRa7ORIJ/woOcaA7rThR+bZwTOWtWXCfc3o7LL2/AxdZmc0Mhf2p5jrEJhRs6M8aMgG/ZOuJp1ljtdSbGqMVGMmkFhqaDfuyBpD2+w06ZQh2rOXYZPKknpUT+JvKrNhICDYdcSIJpRqzoMniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 18:27:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:27:38 +0000
Date: Wed, 22 Nov 2023 10:27:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231122182736.GL1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231121113320.3735446-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231121113320.3735446-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 264b206c-e94a-4af2-87e8-08dbeb88b4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXDMF4LlQUutfKHju4Etp+/kxx/6KLerpMyCUEA94MioeY9n+Kk+B7W7mA+iEiuBekdrAniV3vdc+QN24zFvJi87IxozBdTg1KhRnRhXfMksqnLQo11wf2YS967QNBS370rAwqy+Zq8Fsl21jAEMFSSCvDpG1MLyJTIcGXYpwh1or4dBhXehAR6E/axoNUwtRYlKzH5Y6rI2WcxOV/MksuCxtum4gqQoAAKRGeu+kW+1tyVwNX+KTR78O22kHFoA6tfDGDcM0GQkW3F85cp0u3+LzOwCsPiiOk/RMnoNXvY1mk6Bp/F8EFcd7+T20NRYt1S1vY0Dl3FP+dindNU2XnvMsawn758f/sbb9F9lSJ+rDNNPrKTOs3BZAZlXmINLEvcHEpQh7iZ/HFE49t6mrywQPqaePH8LLhgM7IHg+iPMkrSB70dZSIM3VIvI9lShgNHGFkeuPFgmdeypxgOSngS7wb3dJZTTOOxI+80Djp05kGqREul6gN9dQk4ZmJf+QgSBfSdIHeGtC6fItnNrWC9Q+GXt1oQrLu0MFuTgyleCz21S35j+P6bVlA8zzrmC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(26005)(8936002)(8676002)(5660300002)(6506007)(6862004)(4326008)(41300700001)(33656002)(2906002)(86362001)(66946007)(66556008)(6512007)(6636002)(66476007)(38100700002)(83380400001)(478600001)(6486002)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?veIIDGNj5h1M4B3ejovhgAK4DW1axjjaO5vzjLBAnHQyEkVtTAb8kQHXasM6?=
 =?us-ascii?Q?EAAqSouuU+/TtgONQQuAn/97ltCRaR5N/NTqyAglvFesxQuHvpD7fvnob4Ry?=
 =?us-ascii?Q?+e3xad/ExIpNKli4v1fP6KNdCQGLRUPyFQ2oPTlqEcjacLgkh3zE5i+sirR1?=
 =?us-ascii?Q?RH/9VlZc+SibJNDTN4js1oZTVMiXqc7OddLa4XuDpSiFXsBbOR3OcWBwyJRk?=
 =?us-ascii?Q?zqMVh7W8ln2HI2AvnEQuFOOwqTdqPE0AvYmpdePkt77jGwVbJHxWE2mW6q1z?=
 =?us-ascii?Q?4/aDXjOimLdNkIPA+AHFwySbmsnOxN957w4+fofHopns629kTPop9/ejJ1Su?=
 =?us-ascii?Q?j4sbQ7Q1UUG6gwSYFhdWMTvisWrT+P463N0u43/kUY6VshvLwu1q4TWi3QUq?=
 =?us-ascii?Q?fhFaCHbZWbqQTHWT5BgWlIPmfikfu2ceL1SLqXzK/n9oGNmI2JQfDDoCgDxV?=
 =?us-ascii?Q?A/Reiqcns0FMmwnPDGk5MsM/0CRnXXH7Rn/wOiJWx3nsIPwNByoaHQXJ2nD2?=
 =?us-ascii?Q?NwPuoEK5yfvkNSsQy3U/stkg2ivlmIOLhu5QjtqOq2NXtXzt3v/GXXfSGpyd?=
 =?us-ascii?Q?x5Ap7GaoG/yohNxifnK8ev/Dutxf/XMh0YHdYHFWllisglz8eJPsvBlPb/m+?=
 =?us-ascii?Q?Kui3pO0vLPl9pBuTy4L5bYc8cBFkvBQjonRNB3AZe567cmLuuxurCD+YGrFY?=
 =?us-ascii?Q?2uLPEhLZE68ZzyJqNEIUwGHp5shM+rK9UinZFXhn4KUvUF/fi3nS7VU3Apgm?=
 =?us-ascii?Q?hT9pebv8p/w+YXXhSer6pDlbuBgmxLAobOa+H164KMPp1Y3XTuTa6IPrmhKp?=
 =?us-ascii?Q?p3t4bVxNJY8rlFSOgk1+mMUdTzhBNtEajed5w9qm0FX3XV8HnQ5/NxdHAAVS?=
 =?us-ascii?Q?G/gfrgUD2Vp+pP0gfD3ZzlW7JUzjpdxFl7q1U0GTDfrwv5wpeA3XHgS+T0Vd?=
 =?us-ascii?Q?gMKS5Qs2BYlGaV0PxGE+pLjuE7agclzCfhw+iflthoYdB7d/QcitgzhbaGip?=
 =?us-ascii?Q?lkND7iJF5zD0ljgl8G/WXldXr6Op+6rLVbGjHfpcVsV8dDGZrje5cycZXLxZ?=
 =?us-ascii?Q?LeakX1fV08+tHIEbqSbB/B/VRBZiCeEBc4zoN37/Cg7gpUH2xUgavZ+KLAQH?=
 =?us-ascii?Q?akOsH+0zROaeP3CF2AcxWUu43cj4zEMN6+Gz/P2E7vzhQV4XLSIeu/o/8Ced?=
 =?us-ascii?Q?ShypEQWoUH42hdGmpaNyjLMMti50CDZjiCWS1iwvWLum81N1YCNugaeUuTL2?=
 =?us-ascii?Q?6BflxaRLr/JDmtnP8F63ZzMpqSSuaHa6sjtjnxKXWgxUC1aio7fWA3XeNWFy?=
 =?us-ascii?Q?YXjeIB+7fHLiYTdHt9flIxImosrqQvdXaTKqWcHmURr/U9V1DGA3p7CGyhXd?=
 =?us-ascii?Q?QYZ6mr4k4eB5nOIrGR/LSieMQJKVMYeWGJpuq+6OVQ0LNQHMqMAHf6JQ3ttF?=
 =?us-ascii?Q?hZDVQxsVa2YjAYhdhNujM3s1LTNIcQQJH3fDp9EfOpinzbxKPtvD+pdjDawO?=
 =?us-ascii?Q?GppupkHEs0w/7jYFUsyI95IdQAQTj/Xd9WHogEyJlzcL2re615NewJONQaZl?=
 =?us-ascii?Q?6LIT72/fVONSFbYUqTu/ZELCoNyqvDp8ea3fjXAKi7S6HuR6uvM54KcMeuSv?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264b206c-e94a-4af2-87e8-08dbeb88b4dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:27:38.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsfUYiWdelIkXHnWFQC459Hu2uAaPnt8od7x4WBMAN4cMf6xO5wEDU1ljWhfudFj0PbsTdvCmeObHacGuzK+IMxAUmi97rpxMjcxSZzDFWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 14019449301
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

On Tue, Nov 21, 2023 at 05:03:20PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPM
> 
> V3(MattR):
>   - Reorder reg and wa placement
>   - Add base parameter to reg macro for better definition
> V2(MattR):
>   - Change name of register
>   - Loop for all engines
>   - Driver permanent WA, applies to all steps
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index b57dec17eb2d..0035cfb89cf2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -112,6 +112,9 @@
>  #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
>  #define	  EL_CTRL_LOAD				REG_BIT(0)
>  
> +#define VDBOX_CGCTL3F08(base)			XE_REG((base) + 0x3f08)
> +#define   CG3DDISHRS_CLKGATE_DIS		REG_BIT(5)
> +
>  #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d03e6674519f..aea03a56c797 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -273,6 +273,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  			 SET(XEHPC_L3CLOS_MASK(3), ~0))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("14019449301"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
