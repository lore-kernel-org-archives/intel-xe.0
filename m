Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FC2C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 22:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A7D10E209;
	Mon, 24 Apr 2023 22:59:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2110E209
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682377194; x=1713913194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4MwsSvGCzYyYhWtMPPHXaowgIb3o478q8sf6c1OQbv8=;
 b=h3aCxPigRoKsG1+7fb4GtJR7DUTiP5WbEiqrjqq/ON/vbLaAE7sADzIx
 reqceeGsEZ5UF1x7FkL7UzY6eYg6AQ5IzU4miDzcQBsPEELmUy21NWaJg
 4pSQ9sAxb4afY6TlqxQZBfVUUMdNeuulX3dUW/PRXNCorJlJK3yqQZf7D
 bx0BK+8oHyKkTVrOUkLjfymjkGdaEVCrF6LRvbMKgF84jCaFuDn1KLaH9
 xzHcWkvQlYP9X9LAOaUUL6T9dasn5ktO2HXjzzmVvK1lUC/sx/OTJ1y1t
 gauIOLTauhBIMQxJlbBzMEQPKXe71gNOenc5BxlkgBDnlXediIHmnRwEo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345336906"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="345336906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867655161"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="867655161"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Apr 2023 15:59:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 15:59:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 15:59:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 15:59:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 15:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnVldQBNoD/uqKGYIR2vz8wrIUTcQzFsDhf6oJmG6RUu30Oyi831aAWZmS9A8WXcGJKyan0kPy/278ayq/jBpZ5f5ZGhIDFOCiT7f81b6qlCTervvIrsQ8loqM49DdQ1JkZAk45U10jZ2rKw00QrUWrHu4i6v8j6uuBaCdwuVEc2xIj3Q+ymXKKwI6qKHuxrvyKn+LYtXwKt02RBjUtYyx7edTTH17J7iYGiwobugi/qlaV9+G/0kBAHFKzGjV6dwaFw4Nd3cY3+VgBMM0rLsvFrtIDEGFYCCGWKFjxVXfsVxN/oRFg+vhMocJ5fh9qMr1Asv2UBK+yode3I1N/vNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+pHeFvC/7I6VF2y9sYQewuL7MeqMpTs+S24+qgBrYQ=;
 b=hJUXbS1xH7FvWBns1KFq3rAHvZCa39RU2q0fVD9MtsoYi18sq+/ZKqD+aKwjtac8Rrj6DFY8Ikcb3/yJ2zQngb18uKgYatZcILXA16q10H6TpFpEBrzcQBdycKTAXsJsI65GTOnFhQH9UFidBknZabvx8DNZLAVk0v5OUpMo8uvcNbWWrHligRtUGwJRrmF758Qp0uXggKBx/Y7QqR65tvcv1WHiRsHLC3p3wXGezwcyYVd+VkD0wJ6jyEg9l1PzGBdLTcn5s71c8mmPyYGRTVDe9OsGxR6iidMAsrpdgMqum7C/sge1DUtGbQYXxizYo5AslixJgwmN7KdQTafrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Mon, 24 Apr 2023 22:59:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 22:59:51 +0000
Date: Mon, 24 Apr 2023 15:59:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230424225947.GH10045@mdroper-desk1.amr.corp.intel.com>
References: <20230415040906.13230-1-jose.souza@intel.com>
 <20230415040906.13230-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230415040906.13230-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 456b5a19-5781-4f87-08bd-08db45179bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6v6UKL7aa0MNbb6P0HrEmxtT3mu41h1G0gkrofNJ7bozx2jha8xhvjiDuAtMZeqhdUkDhCTR7caIKMsjqroyQ1dEUpzypsKP4y2b8b25h6IUHZNxmmp6tLrWowQKRuZtIxPdAp3PDdXNhOjQLH9PUdb+KfT36Kn5Pi8rlaOcTMADgH9b7xvXd9sLMe+S/8oKvFxBXJGb+OG5e8kVrnMj/qYc01CEw9CqlR1/lKj3pVEmINICsOsTcS92Qv4y4sJnLNhSkprooklux0BG0VHQxXv8Z7fQPrKQiq+QrjsSXVEXHMYDe1KmVxP8tlAQZEiTLBRR016aVPH5RI54njuba7c3GBKzFqqXsFJf9/MdTmIgYQWF2TbxLiYwunXjJfXaB48x4JhKhH1l0XO2mMZMy9Zzi2ZN0vPdbwr/C8gCKdFfV4JEUaC/PjJ1msRJmVL2gdTByacdDWHwra4BtWvLeKc5GQOJmAjfeWwmbCj1wFfM2+OvwyV88fvPX3fg2L+j+gadIfhya1WROfS/khsPdkKV6ETscPlRuSCgkVy55NP+Ys+TJMVcLnu5cceAO6h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(6636002)(478600001)(6486002)(6506007)(6512007)(1076003)(26005)(6666004)(316002)(82960400001)(4326008)(66476007)(66556008)(66946007)(186003)(5660300002)(38100700002)(6862004)(8676002)(8936002)(2906002)(41300700001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eJ3v+uBq6l7KwDPbTQAwO1/B3Lhi3JfgKFJsacN+lQV0Z64JdJ4TLIXcLA?=
 =?iso-8859-1?Q?5sTKvJZnsqLZrfVjOm3Th24/QZeDEGt/OoGx9wYKHp9n45BRT8qzBqxNVV?=
 =?iso-8859-1?Q?5nbSWc17hFZsTKmO3EmC3yfTBdAZjLDVi99QOlFpvvqCNp44as27f0kLBx?=
 =?iso-8859-1?Q?BJrt3jXlI5qT9EzWBy7vTaisUyPHN+K/QEhPeSpajkJkQ8S1zj1AJvHlJT?=
 =?iso-8859-1?Q?HGRx79UnotAx89FbO/vUettHMhJJCZu6U5dh2tPx+RHVSZef8n3gc/Tqc/?=
 =?iso-8859-1?Q?NEmiDIq90yMUAWpM0asX5szzaf3ZMencNzTIpqCATyLRkeEPsRI+KMsjI0?=
 =?iso-8859-1?Q?ZoUj6JhhhlIRg07+sJSzdm4tzfwE5H0o7KoGMj2nIosM9itRYdksTXtrA4?=
 =?iso-8859-1?Q?fD2RPOPetgG7Pje1/R04ciz53vFnE+2mSdyqZPAwi1VbbzNxGwtKTaRsio?=
 =?iso-8859-1?Q?ln95yUczj3Y7J9MsxXdbDE7HssUXvNmSSUX76//5DfwQdGbb6OibIMbeHl?=
 =?iso-8859-1?Q?QqAYtsda1GUhnpJakjK0IR+kKIhUVbD9oMrDk1JL9lb2cYnNKCMjN77B3E?=
 =?iso-8859-1?Q?5GZCzTfKjeCa/dJRnkNFQI7Q+yHmYf2FG0Y8OmceN6FSxEd0oPWYVPJttS?=
 =?iso-8859-1?Q?HuS4bKyfPuNFVSOwKEJS/917xo2L0C/1Yz8xwIFL957ttr2mF/Od9DCgs4?=
 =?iso-8859-1?Q?w0GL3tS4282rD8672ILLPADauBYZug3XPkXPDUUzD+vEbAO5v8ffcsS2nD?=
 =?iso-8859-1?Q?GKefuKADVsSN4iJkDMr9iQOWigCZmrXRTT5yznTJi/5HtaMsmO4kv/i8Bc?=
 =?iso-8859-1?Q?9fWuJWjnOCeLfJuvfQgaxQKHMJBN6mRLi+rZ0loKzKs/7z2uNMnQlUmhdW?=
 =?iso-8859-1?Q?Mn3IzQVynxkWdnV/huiIHVl3h7xEn/q4pKYafFJe9u1FKgQigSB9HEk7Vy?=
 =?iso-8859-1?Q?AApX5CV7BoTspHT7ZdhcG6pXqHqfV2dBjHj+npP9OXFGpdkaCx0+EXZcfT?=
 =?iso-8859-1?Q?CXJg1bDLt4itBOyl4O/ON0qbYD8ZcVRTKjcCddDttk4WZBUEAn9RRiWFPy?=
 =?iso-8859-1?Q?5wtbCdHp+B/4/iSl75+68O3Onp5o0OdbUNQj4gwSKEusfPtYUDSJGHK/sH?=
 =?iso-8859-1?Q?TuI4lMrgvrIcsgGyUZP330qXbA7WPeaV6fAR7aN1RscfjCI/qasFjb40Q2?=
 =?iso-8859-1?Q?FuBKSKCAEtXMVDf/gJFwUFcm4RmDnRoXDC8nBiERelRoXSjx7KDpM15zfd?=
 =?iso-8859-1?Q?dZLvTiBwO7IauMpakessohP+1X/ZZhfMQJkg1kCX17GNMuklM08UcdiAyP?=
 =?iso-8859-1?Q?hymWQyqtItRS/BPaNgHL0X2T2BIkhm3iTdjqblfxSHUGzd4bOGX9JiMA85?=
 =?iso-8859-1?Q?L1+F/QiKCod7JK1IKd6vNzc4X1/z0wuVGN9P8Xe4Fl2goiABEaOTslU5qi?=
 =?iso-8859-1?Q?3gg1YOBSm6aHUFD8mMbOr6nFgD84FB/oPUQP01N/VS3S7Opj/1mkTOLQi+?=
 =?iso-8859-1?Q?OR/zK3QnS0CR9YcEckUa5FbcVzgoW62e6lwqLai7VDlnCnrpSY1eoPPE/d?=
 =?iso-8859-1?Q?Wu7mRXMjh7c4yCxhi4p6Y0p0FV6sNDletYXTukzdhr84taMMzeaG4gC+gu?=
 =?iso-8859-1?Q?zTzgom9ammw84KyzLaXD89trcjhSRYTVYklqbfpXHiZmDV7w/lDPqeuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 456b5a19-5781-4f87-08bd-08db45179bc1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:59:50.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZE6DQJ2u0wGMX0jfym5m6YbTyfu6mj2/eHnxTPbXtj3L1+dB8fxXCCsqC4TNUXfxEb+t82gJVE9uAIiouLf+ZKfiDR6YMrqtpaVlv6sJWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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

On Fri, Apr 14, 2023 at 09:09:06PM -0700, José Roberto de Souza wrote:
> copy cs instructions that dont have a explict MOCS field will use this
> default MOCS value.
> 
> This was mainly copied from i915 source code.
> 
> BSpec: 45807
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c               | 13 +++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index cc874348f76bc..dbc4b9f15b4e8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -105,6 +105,15 @@
>  		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
>  		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
>  
> +#define BLIT_CCTL(base)				_MMIO((base) + 0x204)
> +#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 8)
> +#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 0)
> +#define   BLIT_CCTL_MASK (BLIT_CCTL_DST_MOCS_MASK | \
> +			  BLIT_CCTL_SRC_MOCS_MASK)
> +#define   BLIT_CCTL_MOCS(dst, src)				       \
> +		(REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, (dst) << 1) | \
> +		 REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, (src) << 1))

Same general comments from last patch about file position, mask
definition, and potentially dropping last two macros apply to this patch
as well.

> +
>  #define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5ef3561101466..0c12700bedde5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -660,6 +660,19 @@ xe_wa_process_runtime_was_engine(struct xe_reg_sr *sr,
>  					   CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r),
>  					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE))),
>  		},
> +		/*
> +		 * Some blitter commands do not have a field for MOCS, those
> +		 * commands will use MOCS index pointed by BLIT_CCTL.
> +		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> +		 */
> +		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> +			       ENGINE_CLASS(COPY)),
> +		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> +				 BLIT_CCTL_MASK,
> +				 BLIT_CCTL_MOCS(mocs_w, mocs_r),
> +				 XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE)))

Even though BLIT_CCTL looks a lot like CMD_CCTL on the surface, there
are some important differences between the two that need to be noted
here:

 - BLIT_CCTL is not a masked register.
 - BLIT_CCTL is part of an engine context (e.g., bspec 45585), so it
   would need to eventually wind up on an LRC list, not a HWE list.

The inconsistency in hardware design here is frustrating...

Also note that BLIT_CCTL is directly writable by userspace (bspec 45546)
so I question whether it's even our responsibility to do this in Xe.
It's too late to fix i915 now (at least for current platforms), but I'd
suggest just dropping this second patch for Xe and leaving it to
userspace to program whatever value they wish for their own context.


Matt

> +		},
>  		{}
>  	};
>  
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
