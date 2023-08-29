Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F23CA0C1C
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 21:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14210E497;
	Tue, 29 Aug 2023 21:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7601010E4A0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693343328; x=1724879328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rhkog92BLruGzDzZ/zzfIFQIjGmfd8g/imEwT+fj1tE=;
 b=nmCybMpoSiMtSb21eLX4e7lk+aK2C159D/m6PvFZIEcxv2UfXLzzBp0m
 wPQAcH+owiOTC+6keycxLr2SVNL3EPDis292EfrfdfzXSYbyX8WDoEAmk
 Od7qVMZFAlGWthKDJuIc2zv6ZFQzGK0OaAtJgMhJXt50jPOBwu+rX9IeN
 e7a1lC80hrLoUPr8nfhxUSKOH14oRQ9BEDv4Vywk/P3RH9GKvZEpvWnJ4
 h1hPxkPCys6BqO6w1oFnXUGzHdbYyng4S+KvnNF8dG7uBNhEw10bsTTKU
 qUfUv4dwMoaihnKPep+ZceAGesDxtAI6gIDiGqrXcGRkw3Si+2v6farDy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360475902"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="360475902"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 14:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="828977456"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="828977456"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 14:08:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 14:08:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 14:08:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 14:08:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 14:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRvMJr87YNR33kv6RmpR4trq3TVSAqxvb7YjFNDkOAM98665vJUIa7gwgNiVld+aZ59hmZ5y5Ur8TTsxsQEjs3SoD7K6RnMLSXCx6hxKBSKQaqcklcVK8U1RrFiqLE4Iw/5R4vPodh3uy3rlHUneoJoQTsNLN5fAkvtdKV/C1wbqeyjFNkLO+ECb/PVkYo2zO+3SxhqsdND6pKNzeJ7+StPsC/2rejuyXd4E3W+mxfhaQNxje2TNLIocLrq5e0hXVmqCQ2jVv7DXgfASayqX+ti0lF9ocp9Lgrk/LyoQ/P+FT2VMTETl8pe+Mu/lz71E4JMVwfVUb8veliiFWgirXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9mj9ZJlWlMMdqpQJ/tRivI3O348FkQSmrC6Mk7u8jQ=;
 b=UZ4gc/q8qtPa65uiouFeL9/b/yerpprwajHHNHLlwJCQ89APkEYLPau6gnqxFIeUBu5GdaJ9bm0VRE3gdaShiitE6WNh/cG38VgmV2MFNccbuejR+ubiCEfQ+S1bQzKC2/UVv60bCFvCRnWiiJ/G0HmDXqu4MCdx81wSiKABd80aDdR3whP7qfgZImeekYBef/OJsXDNCnWYOkT4enuzmokVu5V3ceOGRRywsZHm+wlxJbt9I10v1JWeRnWYkkNtQ4B+RWbMgVyaVnNftZOXOtZr/3oGKjjslGecMBuEYWbzxu2Jfy7Y8m4MUr13MNgWMyZr/8HazDm1IQwjmYos8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 21:08:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 21:08:43 +0000
Date: Tue, 29 Aug 2023 14:08:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230829210839.GM1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829162840.73444-11-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f4167a-1f59-43ce-0ec2-08dba8d42005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jim6leACrIhtuA8UCblAlAJj7//h/IaTyF5DVyBLIOjazaRP5FRGboBNnwW8lZUu2k4bzb3g5QLVn2zwyaniOw8nXs0LriXrdDRjJuWYEg5o3lacIhmjaqCHLCIlA05sT1BtKLkI8OJC+zPLKKFyn96JBxAM+zgbO7D30NcggeiiT5lVHwcQHQbcWNTD1ZLNVD3XP7SsCU/XjrB7XU/0zjY+84tdm2GkxHD3sUZ3JI+/E9vTYH55FURf+zXLi4tQr9iN5U7bHpTcwhcUzuRwATYoMCq1MtSoM0pPu+i4hjOI/OYbQDBgWp+tenCMmIcNOuDpvxJRV3bZOniDaliPGknuG1X96IxRqg8ukt87109zTUkifCJKTQKWbKMOxC49AZpqmj3/FtL63Nzxs14MAgdqvI1Q0sHf/Qunk7lelJmvEsaUUo+9qZ13uR2VGxBYy68ANV+z73l27Pn1lxLJh8kPOwOhu5vhB++pB3Zod7pO6DyXYbJ15N4q/t4QL+su+8C6KgiZNYMnOI/fWKdFKskg/7NJCFFer0xRnzhAB+Gly5gy5+SzIRtC0GPpZ8JX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(6666004)(6486002)(6512007)(6506007)(478600001)(83380400001)(26005)(1076003)(66476007)(54906003)(316002)(6636002)(66946007)(4326008)(8936002)(6862004)(66556008)(41300700001)(8676002)(5660300002)(86362001)(33656002)(38100700002)(2906002)(66574015)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1As3cLrxryLiamaisohyV/WSJehYzFaPOkUGmMaAdK1LNX1oSosOVa04K1?=
 =?iso-8859-1?Q?VFukqay7cxxtNux0ckiXRyRNhV7YyQ10qpmlBVC6YgdfO9/gPt+wcAWBjS?=
 =?iso-8859-1?Q?edRTfU3Twy67cmN0gmeTxE/6fpoIRELN43enNWsOsPsm7dxZiWB7VHscaP?=
 =?iso-8859-1?Q?blpRrAvKb6/9x2yxwdF3QHjFr73DGTko2R42iqcf062Q9+dBawa9uNu7kA?=
 =?iso-8859-1?Q?UK7lYzBiFvuJRtkaoa9CBcVfkB++EMVRSD5jk24rbgEbqMz8EpIvLKa9M9?=
 =?iso-8859-1?Q?64+UkQTumew0umZDAYMDIFjoo+uCkw/2oHSMFxMbCfyRLUgYu7p5omHSc6?=
 =?iso-8859-1?Q?PBu6rhd19NL0bPGMUvVgoS8rM+QCB/UCnKbpbeCR1HrW1nsYw5vVLC/tOk?=
 =?iso-8859-1?Q?OWeFvdPYj/E5OcWGZPK+LdjclbBzv5TJgemGKd3g2E+NB4G2W8jpbXGeLV?=
 =?iso-8859-1?Q?2yNV0llj7j6QUz9ZDTio85FlS+SHXcaHQkQG154w1BZWR3rwuuH1J1okch?=
 =?iso-8859-1?Q?WF1v57FjQjk3C1F9o3we9RRGVkqusoznRPkRskYqCnvzcgCK4mI6A1Nk4k?=
 =?iso-8859-1?Q?p25MVzq6yN9qnUHQh/6Z0fcCLetQpYGiNMda8N0g7O0eoZw8Tz9lGZJYcI?=
 =?iso-8859-1?Q?SpadiuZ0w/HrmM5hhH31Vlc0wYit99K+aW7OrwZrxCTsP0gQAA3oTVL2Wq?=
 =?iso-8859-1?Q?2DOvk+/zPnhwPHr/0VlIeXJyRl5cuiUAIG3D6XgDbic2z4V6SUn8Hvb42h?=
 =?iso-8859-1?Q?ASx3Uml7W4CfSKWEOYrqZ4kXQuynuzK8NemZtEuA2gfenxAwAuwsgKVGcn?=
 =?iso-8859-1?Q?A5ri47nw0rzWryb1A5qwoT8V0KvuWoNAdL62pWVbkYB5R2ZHXiy5Z1pCQu?=
 =?iso-8859-1?Q?uMKcHGEmuBowKSJiHrvKzN1f9ZaQfVoxKSQE8rAbNXnBHq8E4Ic4SxwUjr?=
 =?iso-8859-1?Q?yeFX/BIUFjKLvqMCc0Pt8Et5VUaRFdlLShkQMF20+ZAJkOiGCxFyhypWPd?=
 =?iso-8859-1?Q?Bz/lLCyamkiZtoAAUTIjnuc9pG8wMVa/S6J3JnI1/3xYBWY3BfBC05a6Iu?=
 =?iso-8859-1?Q?Xh3UFDyOnQMQetXFcgiAt/ul+VIXpozOSVDVhgoXK4vBypVMovq/Lwm/FM?=
 =?iso-8859-1?Q?DDWorc1byp+bhp2Jm4Makp5GqrXfZCQF9sy0gdGHa4DGnY7aWe4bKXpzfI?=
 =?iso-8859-1?Q?MSYupRJZqzbXB3dOkuQWCf7PipbCJh9jSPrw1+AfVe3ySVxeWC1DedyCyy?=
 =?iso-8859-1?Q?tVyOltNhAU+TIzq66WXI4Y5lJSvjHxmlJlGgNqk4MwmxpSe8c4PqGRNXus?=
 =?iso-8859-1?Q?ClPy6EUzadFX7AT4iIFf93x7yS/HOYvlAE12DeuXkwoIQHoeszWo//G/wv?=
 =?iso-8859-1?Q?P2hn7aVqz3otFnH30JCQ0QBDPnN7tZUgc0ku4FUZcgcj/fQDBUmUenkAcl?=
 =?iso-8859-1?Q?sKn8h/s4FHz9nxVHJF+ueu1y4vji8tHkleOjQM5s0POqEoRprOpuprWhwO?=
 =?iso-8859-1?Q?+qtK36onuJwpD5RJkvG29GD0XuifxnmwSRYMU/KZVLuALcsOJ+OamwESzO?=
 =?iso-8859-1?Q?YLDqgUP6hDAZ9gXmBHk0DtPgdfGgmCVasjpkD7WgvnCaR16Sd9bggZrxOT?=
 =?iso-8859-1?Q?uKKWA3AN11tk9psSaXjj8Mg9TtmjRRVgQnKf2AHzjUjt155yPkuL1Evg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f4167a-1f59-43ce-0ec2-08dba8d42005
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 21:08:43.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMz9Tx4ggIARVP4gec+mWN6rs/RtNk50C8i8tal0VmM0t5o/fG7W95py4dECtTXWSZnEahKJvjjBeo5Z3jr7sUKXqgIcCUFiidJ9V6eorXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:45PM +0100, Matthew Auld wrote:
> Future uapi needs to give userspace the ability to select the pat_index
> for a given vm_bind. However we need to be able to extract the coherency
> mode from the provided pat_index to ensure it matches the coherency mode
> set at object creation. There are various security reasons for why this
> matters.  However the pat_index itself is very platform specific, so
> seems reasonable to annotate each platform definition of the pat table.
> On some older platforms there is no explicit coherency mode, so we just
> pick whatever makes sense.
> 
> Bspec: 45101, 44235 #xe
> Bspec: 70552, 71582, 59400 #xe2
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_pat.c          | 67 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_pat.h          |  6 +++
>  3 files changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 06235da647bb..53520ae30b33 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -238,7 +238,7 @@ struct xe_device {
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  
> -		const u32 *pat_table;
> +		const struct xe_pat_table_entry *pat_table;
>  		int pat_table_n_entries;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index f19f5d8dcd94..9e72c1b4b41f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -4,6 +4,8 @@
>   */
>  
>  
> +#include <drm/xe_drm.h>
> +
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -33,34 +35,34 @@
>  #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>  #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>  
> -static const u32 tgl_pat_table[] = {
> -	[0] = TGL_PAT_WB,
> -	[1] = TGL_PAT_WC,
> -	[2] = TGL_PAT_WT,
> -	[3] = TGL_PAT_UC,
> -	[4] = TGL_PAT_WB,
> -	[5] = TGL_PAT_WB,
> -	[6] = TGL_PAT_WB,
> -	[7] = TGL_PAT_WB,
> +static const struct xe_pat_table_entry tgl_pat_table[] = {
> +	[0] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
> +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> +	[3] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
> +	[4] = { TGL_PAT_WB }, /* zero coh_mode to indicate invalid from userspace */
> +	[5] = { TGL_PAT_WB },
> +	[6] = { TGL_PAT_WB },
> +	[7] = { TGL_PAT_WB },

Should we just not even include 4-7?  That's basically the approach
we've taken with MTL (which has 32 entries in hardware, but we only
provide a table of the first 5).

>  };
>  
> -static const u32 pvc_pat_table[] = {
> -	[0] = TGL_PAT_UC,
> -	[1] = TGL_PAT_WC,
> -	[2] = TGL_PAT_WT,
> -	[3] = TGL_PAT_WB,
> -	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
> -	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
> -	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
> -	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
> +static const struct xe_pat_table_entry pvc_pat_table[] = {
> +	[0] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
> +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
> +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> +	[3] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },

Is 2-way correct here?  Although GPU reads snoop the CPU cache and GPU
writes invalidate the CPU cache, I don't think the reverse is true (CPU
operations don't automatically snoop/invalidate the GPU cache).  So
wouldn't this be just 1-way coherent?

By the same logic, once we add in coherency the TGL table above probably
isn't correct anymore for DG1/DG2 where we only have PCI snooping
instead of a truly shared LLC cache.

> +	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> +	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> +	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
> +	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>  };
>  
> -static const u32 mtl_pat_table[] = {
> -	[0] = MTL_PAT_0_WB,
> -	[1] = MTL_PAT_1_WT,
> -	[2] = MTL_PAT_3_UC,
> -	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
> -	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> +static const struct xe_pat_table_entry mtl_pat_table[] = {
> +	[0] = { MTL_PAT_0_WB, XE_GEM_COHERENCY_NONE },
> +	[1] = { MTL_PAT_1_WT, XE_GEM_COHERENCY_NONE },
> +	[2] = { MTL_PAT_3_UC, XE_GEM_COHERENCY_NONE },
> +	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COHERENCY_1WAY },
> +	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COHERENCY_2WAY },

Although this is labelled "2 way" in the bspec, the reality is that it's
a bit of a lie.  From bspec 63884:

        "2-way Coherent (GPU <-> CPU Snooping) honored only for atomics,
        else 1-way coh"

and also:

        "Except for system atomics, setting Coherency Mode to 10 or 11
        results in this same one-way coherenct behavior.  Full CPU-GPU
        coherency is maintained for system atomics with Coherency Mode =
        11, with no caching."


Matt

>  };
>  
>  static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
> @@ -82,27 +84,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
>  	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
>  };
>  
> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->info.pat_table_n_entries);
> +	return xe->info.pat_table[pat_index].coh_mode;
> +}
> +
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
>  {
>  	WARN_ON(cache >= XE_CACHE_LAST);
>  	return (xe->pat_table).pte_pat_table[cache];
>  }
>  
> -static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> +static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> +			int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
>  
> -		xe_mmio_write32(gt, reg, table[i]);
> +		xe_mmio_write32(gt, reg, table[i].value);
>  	}
>  }
>  
> -static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
> +static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> +			    int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>  
> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>  	}
>  }
>  
> @@ -115,6 +125,7 @@ int xe_pat_fill_info(struct xe_device *xe)
>  		xe->info.pat_table = pvc_pat_table;
>  		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> +		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
>  		xe->info.pat_table = tgl_pat_table;
>  		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 9ab059758ad1..e2fabde2c730 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -28,9 +28,15 @@
>  struct xe_gt;
>  struct xe_device;
>  
> +struct xe_pat_table_entry {
> +	u32 value;
> +	u16 coh_mode;
> +};
> +
>  int xe_pat_fill_info(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  void xe_pte_pat_init(struct xe_device *xe);
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index);
>  
>  #endif
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
