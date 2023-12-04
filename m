Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E0C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 21:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAFD10E40C;
	Mon,  4 Dec 2023 21:06:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8168310E415
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701723961; x=1733259961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bCKRQ0g1YglMbQ2jSs2XY9YPI1e/RC4yB8PF51xsN2c=;
 b=R8M0GUEzYhO9LRwBPRjEXc5QZkEHnnDoI40VL8d+wtNejx3PwJMaURxV
 G849MwXY3JD42maJfK6jbF7YktKrCRalm4IuRZGVxYqQ/ut/YW2IzmvCX
 UK8ZnYC764xn/QPyMwg3VTssy74ig1j2uZSVXVL00aup/gPx3C9b8tUGW
 CyoMPPZFFP1KzlP6mM7CIXAPNPFYcwuoyFy7+bsGPs8+ccwlN3gfVHdwo
 BEIaj74m4qgLbTQXi663/6gIIKVhKQ5sXmFWt61B25R/rscZppRfm0Huk
 mF9NcUMDc8iyBcYoWbka9s+lWZFWUxRcKdHmbfy/sgB6sszSezH9Ueak+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="668182"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="668182"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 13:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746965607"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="746965607"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 13:05:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 13:05:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 13:05:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 13:05:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUmplZHAdcuNuo/+ZW5oAjLDbicjyFqhP7lkUGuAA0TFXyVmTXmVvDjx69hnD/YRL+rx9m+GKxkiBx0+tXErORm2juH9KNxPM84ZkHpD+wSJ0UZ/tYssKDqS2+76GZa0jCzPFl3jUxjOrp851UNrbvnCssN5rt479LHa9b2evVcOGmqLDfWH8Ea8a47BP74H0jtoyluvVU00nSPkrDh0A+qqxBB/Of2xuAXRkSggU9Q9SUYLJ5uBrk/6D3AwkL6q3P2DfaThlMC3GZW24Qv+TZV1SvcK8HyAmGcIuH/YX+MEM50KpQFdUg79JL8GXcpd33dGAeSUMMJeAwyVR85ySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWUx3mySiyl598MbTigsmRCKyXCak0pvjD/3XoaHvpw=;
 b=ET0afo3DqAvxSX42yXsN7bS7o66DRy7XOqLTwy9vOiifDbE7WDTwLFlHSrE6PhFdI0rh26pTxOg/6Ya98vIJmP0BIGAXbaOA9pmAsKGVpkkiF5wu2A9qHRMONs/4WGMO600HlAluAaRFALzk5t8XxyrUZSxow+MmTOt4ThQtwn601uzdqS2eXH3p2ExUtTwpemSoqatG71w4aqq/B3D7L5xjtTxMDirmkMbpNspwDERjCBSccnBqpKEBA89mYS7PzDwttY9tmgHtqgYtzYF9qY+Wr6dmKRjJrYzhlYKhI3U+XkZMxG1KhThiak7tNamjtltnM8pEnHNuqAu7HoWoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 21:05:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 21:05:36 +0000
Date: Mon, 4 Dec 2023 13:05:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231204210533.GI1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231204142738.794980-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231204142738.794980-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: f56f6657-c143-4d17-9084-08dbf50cc2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Qy6uk7q45niNXVf3ytmxWbOn3h4RdXix93QBEXsbNvKB9jZhLM/eaC+YY2F3xIGRmCbYZepq46rOjiZcJzirw6fR9KmcJmx8PeSQAhtUjW1esqy1dZvfXuHMfyC5pMm0mOfIzuFsNCBlXJdmv8ACAddOkiHy7Ip3uzm+yrHdiy16iQv6897GDZZMIo0EXmqAA+VGClj+7uP+OQ8RdcihYnT5PiV1jl+aAAVclhedlBO0AU+cWkC5/gAya6Sz7qTtmq1Vy9Nh7hsIiMSbOC7IpCNXGwVZ/Khg6r7DyVtSHlGZf7GQ1tAbjuYI7S4yLKcywFELQ9szKmpX1joXfH4PnDSGoE+lujkKhDoH/hjvPxhUP1L6u+YPF9/2boMDzYFUz+KrD5qbZNAdmGob8v7g85tR9QiFNhhY1CTx1jcmNbgYgAuqO9mfBZmJ3oH7TG8mYYn6ZyyA4M+av2OiVQASI8cxGIPClCvR/swzPS17Laz5WoGBfTmb6GmLW2fYIrrrA3I1uQWDmhm4rYi+Rc+uUc+ZTQ5Qx9kMN2/q4ro/DoeBizyUXpJGl8Akz82OeYK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6486002)(6506007)(6512007)(26005)(33656002)(1076003)(41300700001)(82960400001)(38100700002)(86362001)(83380400001)(6666004)(2906002)(478600001)(6636002)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qLje8ConfRFXmP79UcI7jNkPJKnwWsr3z5NEsjQmoWDEIVrPSyP4H1oRZOBo?=
 =?us-ascii?Q?80zougbS6mKDZdwymEW199YQeQo6PnJnrbjhrZX79fxVUf4CAFmqRgajJ6WN?=
 =?us-ascii?Q?+ZLE5KHGR8VS5jLIfasHM6QYQDgazF5iRpq1211x1h25uHYw89v5S6FwZVes?=
 =?us-ascii?Q?L+JU4r3beo4/ULxjBJpCiw+h1JK9z91yYhE9exy96XcqXhiwgrU+6RojRT5r?=
 =?us-ascii?Q?OnX8IlIusV5jaLD07CLW68N/geFgGKWDSFLoZ/vAGW869VFB7oshF2+rAGxE?=
 =?us-ascii?Q?iVXE7gsR/RpLrEM/8dnAs2Gt5DOmfWjVkzQN6c5Bi1+pMgY4E4OVfw3mUM6g?=
 =?us-ascii?Q?1n46Ty4FxhyisNFUKMQW+lT3dGlOAf1YJxiHcEoFFPpAHbml7KgVziebv1ff?=
 =?us-ascii?Q?lqzYuHgY5QV63T/59dBpOvMwHZZgVSSEA/tx5nZiO3ajEwMfXsbquLIl646J?=
 =?us-ascii?Q?1+OMe/WEWQTfvf4aot54AxDz9yrAOejxcitgf4dzbtyLFdpZq8KlRCvWR03H?=
 =?us-ascii?Q?7QkNkS/RTULfRQwddB12bpJK2WdeB5LYK85z7VigZb7DVBw6AVbItc+HGrhJ?=
 =?us-ascii?Q?DKpPkuhOnTLDdvfkajzMnSakEQHfK2RatVFgZqB/Ii/+uR69M2McXvqkYBZq?=
 =?us-ascii?Q?Jv4z0U9n9S9f/o1qZpCvhwMMkJsbAHh8Ekw3K9Bp+Lcm5/2nFfAv5mlaveLM?=
 =?us-ascii?Q?JIukaVCgxSP0H+CdSb1dKxSTPDsxd9e0QKmAlikCscYF58vTiXKLhj+ZKYHv?=
 =?us-ascii?Q?5aX0MvZcbPNn8wXcyZX7EccyXX50NosTpeumvWS/PDLO7x5aYFrcHwybpUU5?=
 =?us-ascii?Q?kV8jZDQt/zMyHGj5CShQlAtKn3/f12hvL7fh9/z2BMhhCTBQMtFgQzazMj4F?=
 =?us-ascii?Q?63UY0ZO0HjA7y8yAOZf6pmjhlhiCN8xJRlI9Z+zN+vkLzTIT+MZzMujGNI1+?=
 =?us-ascii?Q?zmAvDyKrZ7Ub08N0nKmUU8auOXru29WvRVcuqs42Z72Q+C3XBlBFFa752gLr?=
 =?us-ascii?Q?KRYigNeEB6udkAOTebbQD+DMeEeLlLahmS4+xDBkEdwVb184m66tsckcpQIZ?=
 =?us-ascii?Q?jjvYHupWB1RabSkximvTy3km1a0xv99VF93+xlXPeLcodrJSziItcehCfXb1?=
 =?us-ascii?Q?k9Z8Z8/OsMgtVNNNmpPfsp9B0RMIkbgAo7ZTQxuxzjAghXtyUir+juvFX1Xp?=
 =?us-ascii?Q?ZM0GGYnXZSBPFlH6Cenjgen9wwENOj8qu8G00VYta5ZZsqfooeucCGNh5qXt?=
 =?us-ascii?Q?Bj4KUt7lwpiW8G2uSu916OoD/8dORTV2O6aIqjfGiorunxndIVjdilqo9EA3?=
 =?us-ascii?Q?QcNud1Ea46TpO2/16F7Y4qMMMFqFuxCz2R0rkwJ5/13q5IE7NDoiJ7aO3Ma4?=
 =?us-ascii?Q?Ftp/mOtiefv5IlZ+rV1ATsno1Rk3Fj6OLYY7zGdyHNP7hZhOMQQG/skFI1/g?=
 =?us-ascii?Q?lLdA0Hzeu3XsJD2h7yF2gKuEkr4YPF7jmSr738fRmL7ZXpbzgBIf/6gFlt/S?=
 =?us-ascii?Q?xSgXWwAoXPgHjHTXOHqO8AqwKp4lDgN3eIMe+O+ryPdWY7jP9rLWsyVJgOUA?=
 =?us-ascii?Q?EMNq1fpGgsxCK13Hp2/cZEK/1uGleJ8qQNsc8g0z2siQ+Q0lpgudFYJFOqie?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56f6657-c143-4d17-9084-08dbf50cc2d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 21:05:36.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHax8ae419z/UU4tVL3z0jMssnExy0cK6meFmfRwbK/Ex+n+ttN9ztlNHwWmZE4vJHsajlA/u1X9jmYdCc2MqiYCMFk8V2hSK7pmXX+fqoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 18032095049
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

On Mon, Dec 04, 2023 at 07:57:38PM +0530, Tejas Upadhyay wrote:
> This workaround applies to graphics 20.04 A0 step and on
> render engine

There are three parts to this workaround:
 * Post-sync operations vs MI_ATOMIC --- This part isn't relevant to Xe
   (at least not right now) since we don't use MI_ATOMIC anywhere in the
   kernel mode driver.  It's probably still worth mentioning in the
   commit message here in case the situation changes in the future.

 * Memory-based interrupt masking.  I don't think this one is actually
   relevant either for a few reasons:
     - Memory-based interrupt processing isn't supported on physical
       functions, only virtual functions, according to bspec 60352.  So
       this is probably only relevant once SRIOV support lands in the
       driver.
     - Using RTP for this programming isn't going to work since this
       will apply the setting once at init and then whenever the engine
       gets reset.  However the RCS engine context (bspec 65182) contains
       a special MI_LOAD_REGISTER_MEM instruction which will re-loads a
       value for this register from memory whenever a context switch
       happens; that will overwrite whatever you try to program here.
     - In general, the only types of engine interrupts we enable/unmask
       on GuC-based platforms (i.e., all platforms) are USER_INTERRUPT
       and PIPECTL_NOTIFY_INTERRUPT, which are the two exceptions given
       in the workaround text.  See xe_irq_enable_hwe().

 * Disabling CSB/timestamp updates to the ghwsp and pphwsp.

So I think only the third bullet there is necessary, but we should still
mention the others in the commit message (and why we don't need to do
anything for them right now) in case the situation changes in the future
(e.g., as we implement additional features like SRIOV).

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 444ff9b83bb1..5f70eb62db70 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -40,6 +40,10 @@
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
>  
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
> +#define   RENDER_INTR_VEC			REG_GENMASK(15, 0)
> +#define   RENDER_INTR_VEC_PIPE_CONTROL_NOTIFY	REG_BIT(4)
> +#define   RENDER_INTR_VEC_MI_USER_INTERRUPT	REG_BIT(0)

As noted above, I don't think we actually need to mess with the
interrupt vector, but if we did we already have some definitions we can
use; they just got copy/pasted to a strange place in the xe_reg.h
header:

  #define   GT_WAIT_SEMAPHORE_INTERRUPT           REG_BIT(11)                                                    
  #define   GT_CONTEXT_SWITCH_INTERRUPT           REG_BIT(8)                                                     
  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT    REG_BIT(4)                                                     
  #define   GT_CS_MASTER_ERROR_INTERRUPT          REG_BIT(3)                                                     
  #define   GT_RENDER_USER_INTERRUPT              REG_BIT(0)


> +
>  #define   RING_MAX_NONPRIV_SLOTS  12
>  
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
> @@ -47,6 +51,11 @@
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>  
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +
> +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> +#define   GHWSP_CSB_REPORT_DISABLE		REG_BIT(15)

Nitpick:  We usually order register bits in descending order.  Also,
it's a bit strange to use "_DIS" for one and "_DISABLE" for the other.
I'd just make them both end with "_DIS" for consistency.


Matt

> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encryption.
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 63bd4bb1af03..c5c640dcb427 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -596,6 +596,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> +	{ XE_RTP_NAME("18032095049"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(FIELD_SET(RING_IMR(0),
> +				   RENDER_INTR_VEC,
> +				   RENDER_INTR_VEC_PIPE_CONTROL_NOTIFY |
> +				   RENDER_INTR_VEC_MI_USER_INTERRUPT,
> +				   XE_RTP_ACTION_FLAG(ENGINE_BASE)),
> +			 SET(CSFE_CHICKEN1_REG(0), PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS |
> +			     GHWSP_CSB_REPORT_DISABLE))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
