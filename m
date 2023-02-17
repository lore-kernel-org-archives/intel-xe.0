Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACB4C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0713F10F0C5;
	Fri, 17 Feb 2023 20:18:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EF710F0C5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676665092; x=1708201092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lL48kY6URfZMlJxmSPVRjJAM2/hvMvFyG3mmk0nr+mY=;
 b=O5v++tpkHs+1dGWo65J6GOT7h4vOvLbwkBwWgrT++wO4HRP0fRFMGGN8
 RD5CdRntMuCGtLlTRu01EidjQ9vogDs4vRVTSlfxoekSgN/bOEGfzFDqU
 OQh+zOsrgyEtyXPxIr/A38QImjAtY3lu1+j1o+Ph7HYGEZ//SsD4Nnr9A
 /85SsTypQ0cjTgG8qHKN47geyjQcNrehfe86cgebDzk5qEYD0zYRg4Hvs
 xODZfgJ/kFhhdF4frkaGQS/t6xXDMX1vw+bbT8Vs2TTSN8QUQGmEX7MQK
 hGwXJ1h+oz9Ymg3DMblEH5GbQ6/1jiQ7FxdSWpbiImGXSrdoy0e+2R30Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332087346"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332087346"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="670667243"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="670667243"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2023 12:18:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:18:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:18:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYjE5OFNHHQbd1n39TKLFDp47xQCOr9d2eSsq3qOoj31EojlKfT3JnZuOyW/yRo5MfCyebuMzsJwAgnr/t1Q2vG0O+xUvbyNNIxoubagQwdq+HhAkUT07IA7js9XRNsfmHqEsHv2JaCywqAw/OJOHJf+9ZkAQR6M0Zq3JqrSs5pj74HOItVL0qFzusJhSwDuHr3MgcFCdcebDk6b6jIH8Q3+tyXC3bdI2apXss2LK/QCpK5D8Le7eMmCkBgt/FgvG6PCe3w+qh5Li72lHi5Ddzos0VmOMIt3wQnH38Y30x9rzgje3YD9uxQUSUiXFE0F9OfgjKe1u5OYR7lKQbP6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+B8JXJPz6Wx2hKfnHwQlHocI2dBs5Si8nyQv3vG0go=;
 b=mb8IRWqy5sKnpBBzBIL83Ou7rmvHq9kuyB6alb9StEV/3RHSU+8xqX7x5xt4Xeoolm55gZ3GAzySzb+HEzB8n1fibbUXfTCcnKdWhv3ZwZVITrB6cMG4Ggzhqfm1FsALcHCm7lmcI5+vOWSJ9MP6CnMXL9mH6qs5IuaotTTtBUJmYcCkusCm1cUGn5X5vbfIMoDOXfFriIc47D5S1/Y3vJq8qh6+kCF/7G5XDpmqY9fp45GRdMhZ4fTn4rdktfVoIZBVDqQWpPCyD8cZI59s4Ha/HPyqxMizKAhgA3dsp9fNeoxEcf4byogqHjd6DsbK1/MBAiMD+qotJ58xAk7DVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 20:18:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:18:09 +0000
Date: Fri, 17 Feb 2023 15:18:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/g/ZyYEXnCfATv@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7a3d55-3197-4fc2-6f86-08db11241615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jojni+1asR5OCrW/W7MIlppVCpw3gxU5KSP4fM/U9Z69Op5wp5uc7yhlxvNvvhlZSbwXtgKch/Cqq3Zs0/wMJlodhF+Vhge0DsZBusLn41Ljnv+jMYG+O07pcBs195emBXyvz/Ivaz5p6jBy9e0sS2Gv5RpoQz2KGaipoM1L62xc0aA3+6nv7HaRdXSurr/wBfllNTTo53Zpy28vltwKA8U+l8MSvcipifo/lR4xFiMUh9W0xCWaOjf0VVE1weBHPfmZMxwN8YLjlMo4j46OHQ4dts7yY+xKX4tjXVXnwiGAUkklJrwZpcHnzmuQeQIDdscjk+R94G8y8qeLY7mEqHCNpZGMcKoQ2SjKRBuUMDkks0U5r0IJFqhXzidOGQvbMKfsTKaFuE0ZVVHCLy0pZeMWpt95YoZ7Rfe71NqjyD3raja6Bw71IkqelbQSv15M/8kr1nrPdAf6u/xp7KVvcqstavtob6/TZ4FTnRvl4FE8s5M0HZcNildErcMNm+pkiqg+bU5VB0LDpmYnuuOgfJbDFn9pnEJikvcxjrXXHUHHUZJKRTWx49sychHz01csmbnCpWiRIE8kdKZ+TTZ6kus7UzzBI4c7oxtxxY6+R0lrj6J1vynmeoMCGAMvCCtbXJiAzQo+Eg8fmURv5+4asA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(86362001)(82960400001)(44832011)(2906002)(38100700002)(6486002)(6506007)(54906003)(6636002)(26005)(186003)(6512007)(478600001)(36756003)(83380400001)(316002)(66476007)(66556008)(8676002)(37006003)(66946007)(41300700001)(107886003)(6666004)(2616005)(6862004)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrozylc78rxL7lJ8mAtBhoVfhHPior/07+WrgzxXG8Yyl6JI2cQcWvj2/ojR?=
 =?us-ascii?Q?Jw5lVZv3gkN3n8k1S2FkgyefaScL0IL5ux87jke5UVJMD0hz4eRc5km6ZJco?=
 =?us-ascii?Q?tfxoixY02SEu9xG1tWU+NFb4yEDhUxMhwFt5rLah+wEPv8+/LSDIRP3B2/ta?=
 =?us-ascii?Q?fS5esvu6PEjtGyqEBLuCb7gJ7KKl6ZertDJWdzYfplaVPwGmzJM0vL4SfLfX?=
 =?us-ascii?Q?6fhX60Udwl7HtJhTxQVUi/GJQcu915xcOYHVwRTZBX3A1h66/82YamtU8cfD?=
 =?us-ascii?Q?AD8ZQuoFJE9W6wTBYM1idtiiJGiyVSJmC6ase1my3PV/dsBJUoUvYsudcH/I?=
 =?us-ascii?Q?L8xbQrpZY5IfcEcSwmulxjibaa6O0kFWMu7ae8KuZ8Dv719lj2IGyn+1F9ri?=
 =?us-ascii?Q?8927C4N1G68/qIirrwFc8AvWSzd70CKWYKq6bx8Rb4OhIimQK96asPI2TKPe?=
 =?us-ascii?Q?xt36i1edCyGca0WQZ+vgGDdxZN5VxiIxLrPqz7+aRPlEx0S8x7jnMyjkt326?=
 =?us-ascii?Q?zhULQGOwXN1rjshc5YyB5e9/vpAYZz96CBUlA99+bh25Wh3P1gZa1DhafR0x?=
 =?us-ascii?Q?yXBOERlk/ggGXcMSEgHSPMuZvumT8r2QPdEYarcf526M6TPu1wTWpcG5y7KK?=
 =?us-ascii?Q?OD4ll7T8/+fstvXVX1LX3KINFV5KdrXon7ilS3BjYvzVAHkINeeyXZw4T3wM?=
 =?us-ascii?Q?Rmr38G3RbG26B4XLN8zrzwhLfy4CneVfq3F7oA8WBH4WZnaJJUn7vQwdc+p0?=
 =?us-ascii?Q?s1B8aJLKsdJB5wnFaL3gmAhSxigqufxTZ4lYGHyZF1b+Fm2S1yQFh+MMNeRN?=
 =?us-ascii?Q?5Zcfd/Dlndn1Rzoi0gA4Ze1MdThQd2njUBOg3dTvWRbr0CN3X5DU4o6S7l+5?=
 =?us-ascii?Q?Zm+0MRdc17osmZNnZT/ZvFe95wzBtGxxSJTQ9Kor4OKymPOzLgDLjQ46LOHs?=
 =?us-ascii?Q?cV9UD+BazTOYP7NalLATEf1PhFnbot3+DKMa/dz7rA86L8BSOI3916uWT44H?=
 =?us-ascii?Q?uGQdOMB6AccSXUb6kAjGSPa+Fqd5jDxyKo6Hj+A1oHCq5QIe6n3/M5TNOzUz?=
 =?us-ascii?Q?GZkYoO0X+rZo1jfQeAZz9f+cnYg95MYMt1DjFYvI0DZTGilYuNEV/Lz1P1O9?=
 =?us-ascii?Q?NX0/vjvyneloBAgLGZGJUd98AWZKvrNM1SMCkH7dYtGRu08b5yEB8yBYoqAN?=
 =?us-ascii?Q?Jia+XrEwYdIIr21LC9yp0boDlem5lujyYZ2TF+D9GmVN8evSwiqcj5yQKSao?=
 =?us-ascii?Q?VadjvQ2BRVw8yaFCGrG2mdtkWS/gOzNLQ3/anDGK3RhmLsk1gc08fpg7BR3r?=
 =?us-ascii?Q?YxFk5AtxqutTQvQ5eof2zuRdswX86DRJuVhKlpJKA7kuDIgV69ShTdA7zJpJ?=
 =?us-ascii?Q?P38YPBEVJOQm3JdwIc1vLNa++BRVYcOnqfJ9CGPTjwfaG1fbDkZgsbqtuAV2?=
 =?us-ascii?Q?extCaA4S0EVE5bTMDWuCw6AfsYFe/AUx+wYk3p7Ktm772KL4gnGgdMODJ4LW?=
 =?us-ascii?Q?n3l/z1EmKRjAyAQ6rQ2roBGlKigilbtg0ipG5gjRh9JcfmYL1OULCfF56Wvz?=
 =?us-ascii?Q?pN+G6vpL+XEVUamo5Z4Zf1rDe23pT4zg38H7Ly5Wvx6R9UAz/wTg7RHV7WZR?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7a3d55-3197-4fc2-6f86-08db11241615
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:18:09.3179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDtsws2dFykkKiwZ/L30CicwBHbZT674+VVOmxYoTZeXBVWg0AAFl4dHKGq1gWbTBls7Ss5Uxy8JrYUMe+iJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/11] drm/xe: Remove dependency on
 intel_mchbar_regs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:25PM -0800, Lucas De Marchi wrote:
> The only thing really needed is the base offset, MCHBAR_MIRROR_BASE_SNB.
> Remove the include and just define it inplace.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3465236b0b49..cc7d1007d942 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -20,12 +20,12 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  
> -#include "intel_mchbar_regs.h"
> +#define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> -/* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
> -#define   RP0_MASK	REG_GENMASK(7, 0)
> -#define   RP1_MASK	REG_GENMASK(15, 8)
> -#define   RPN_MASK	REG_GENMASK(23, 16)
> +#define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> +#define   RP0_MASK				REG_GENMASK(7, 0)
> +#define   RP1_MASK				REG_GENMASK(15, 8)
> +#define   RPN_MASK				REG_GENMASK(23, 16)


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  
>  #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
> -- 
> 2.39.0
> 
