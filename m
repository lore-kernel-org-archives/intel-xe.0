Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246E8E7F140
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63CB10E44B;
	Tue, 26 Sep 2023 22:17:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7810E448;
 Tue, 26 Sep 2023 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695766626; x=1727302626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TWnUbuxIyQRvPkqM/QqtzMQuXtkFTn9W01C1RzryAls=;
 b=NuBpm3OKTgGgg3HhhmhyI9UfNFhYGQcjxv6b1ylHrYUzu2mKaNn+MatL
 jUsa58KPz63Pa4i6+r++1fxK0wfrvWLvOEm/JPIl/rkAO7ilohbqLltgj
 Y0+UOcE3Q/DK/ZkH3mqQM1sYkeXADmaN1+UssCDX6NDztBYGPl1FgiC8d
 BL4lUyNna1Pw8RrlwkwIJNNQ89zEBdeu8hPnCMwmANsjYAnaQZ/OXcU2E
 zIXg3P183EWeklAfY+CCASCs6T18lk1ftGcwqbYZuE14nTlj1lm04NNsH
 +f5PKTfOB2VaW0dlgE619PYVBqmms99KKXO0k6sfzv5g32At76B+143yK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448172366"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="448172366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839182275"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="839182275"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:17:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:17:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:17:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:17:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:17:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWL5Bu819aVtRY5Mg1rnZ1bneuCr8g8od1vhSFmRsOZsN81xJiuD2mw3Vxgo3P0ldJ2xFEj1z9l7cnHEaWq53FvEOL2TARIlZ5jRp62vR1tLz1fkeODzsaaBYA5brUhmni8pOpf/1oHjiZJQq0RkKozLCERQj3VayIgFwNkIa6uNc/eUuApvcSuklYxaPg9RPcqWMOYTGeOGagnJ9MfGzccqEHBZwninlIpOZsAqriYV3VvFh2HQq6tYjySRsNGZNY3ftLq2cvvMj8pWUkGzfiwPiN3tOxP2pU04VzPk+6Crmm1i700dlRmVWEYI9plsRJz/jyevhIYMya+y9hk2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPvjHnvQmFIUojaCDTMLR9ydPCf5LQx6ttcWRbsh0oE=;
 b=jTwMX6056vuioM5okFJY0Yj+KUYWoclpTiJGpSVvLqwaO44lPFIy74yjus+yU2FooH2ta+ybcH+EGaGnwRS/lRlG1+1Ns+2Gb2SekkVja7wcjB0LCq5DkLc0QOy+Eyk8FCyINMtG5R48oA3ZN7FPc94lLTeIQvC1UBRs8Wr5Yj/JML+dM+YRjyhJ9UhT0Y2rOgmc882prPFmlkikxRxAnty58zn23lIUd45Z4IuRXRmebWDc5zp/lgbw3l7q9s1PrXp2+CayIRvN4EwsWjUKbrmdXWV1RG5444domTf/FE/yelNlJWSQ/rHWgscULOtRSetolvAbvgZCIm9kDoudYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 22:16:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:16:57 +0000
Date: Tue, 26 Sep 2023 15:16:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926221654.GM2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5aa367-8749-4134-ea63-08dbbede4c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnIc/AhFZ7KTqCsXZgiYgbWFAOiplEm8XisE8qQcUeVD8nw+NHjprxTpzCAvy1ACHv8MhLeLHwxNxT4O+O1sR24GStm0LhwszU6AtirBPoSjGe5bIF6FvAlRcAXWVNlT2YLmul3GYwWRE9NzUbSR5Cy3/CdIpv/VIV9PqizKQOntLwSfeBAZUnNsaBo+ROLgxkr5ZrrNbZZIaZP3QNi5nO31G+k4fIAb4bOECXkcp1rT8W68RZD5GYOl9bgZHWmT3z7H8TXcr8tV+WOmL2BuG9uvYxgrxKZHbNiuU33LGMmmdjp131KySO5q1EDWaMrAwVSMbotBU4N47xXAbXLeidn+6V/C/eQEOG1VDlupv0/xDD1qFFbXjy1L0p7feFSCxhBE0b7VnyNNH3fIs4EOlpsuy/vwx+gXpOpkyO4bH7SA0Pg/ARSU9ing96aUABOdf3faC6a0rZCmotS4f343tq7G8kWgaBt3fQNhajgmWEjuu+Crk4LCeZk0BrMzTJbIskDRcYGaLjWSUi8rthB+QfXtz4J4K5d7t4JHfuXhmTFvCqkweejmmOnRvNB4jZYT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(1800799009)(186009)(451199024)(82960400001)(41300700001)(6666004)(38100700002)(2906002)(478600001)(86362001)(33656002)(6506007)(6486002)(66946007)(1076003)(6512007)(66556008)(26005)(83380400001)(316002)(66476007)(6636002)(6862004)(8676002)(450100002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9F0vuQO5DJ79nS5i8017A6AdZyLFOYoQP/KwCQGG/Z60zM4XiCOXbYrGPIks?=
 =?us-ascii?Q?VmN+gY7Wq+rhixp1d9B0SOLypxLGJLO4AjyTtVlzGEwSWpLJwLGFwRJgrXT0?=
 =?us-ascii?Q?f3ZT7lFtf34rT5ZZdAUBdxVGRd7uYlPIDFvHg3fVP4V8NS4/z+XGPEa+u+pb?=
 =?us-ascii?Q?5v3EI6nb8QUURZHOiDtiqq1wYM5sVRf4atyoklhy+Yu+ooQutwWnxJDAueEh?=
 =?us-ascii?Q?drnTyXyFbvviH7beXIf5mIySX+V1mGvfss992WxCdwJglvga62dFrBdaMKhj?=
 =?us-ascii?Q?nAh41VlQhRM/bvax3RBhL9CVXWbJBpk0Lya0nTo/wFNJ6bIj4m6g4u8uxpts?=
 =?us-ascii?Q?qkOQGBDC4rG3Xw6/yaF+65+DgU7la6ENAo661TD6COd9GfS9HUEMjxMDiAAl?=
 =?us-ascii?Q?5jZEzdT/ggmeML94gmt7I8JGh2+FYSwgraScsuol7fztX894Ptdz9IFFmqCQ?=
 =?us-ascii?Q?TKCeFUvp8iCi26J4kw6cZdB7b7TviCagt6/qP1Bzq/ucA0Oc4nUAmSJhgPYU?=
 =?us-ascii?Q?K7/BYOulb7Wgalkgn0dhIaRexBVN5n9TzWbKRx3FFsdp432RtfX9BZ1NJgSt?=
 =?us-ascii?Q?ui78Wazckr+TwoGp6vgNZFAhW72in20/4CBA/z8PszxP5nwNuB1e3XxggYlg?=
 =?us-ascii?Q?A9rIrimGaICozWWWkdvo3Dnpje1rT3Skq8Qva/xjkd12T8H0LLTf2USIVJQp?=
 =?us-ascii?Q?ZpvBS5JQenvZ2aTSTUUaJ0JgUax6Iu480gOMMZ4O2cWAAJTTCkrBqjvZDV/l?=
 =?us-ascii?Q?kbn1NWZES2dC9tDaWcAsXFB6t8rQDAa1h2L9pLdTUz2Lk2uX0qTtNPF3uZMa?=
 =?us-ascii?Q?WsQzHvfCdvi3GoaY6n+X45MKsZH1k23rEXtQC78Kp83CHd9LthxhYnz2RK7e?=
 =?us-ascii?Q?U7WInp4Dk0gHyHtPA+gmrKpWkSBzPibovqcz7qEaw1mOUCYRkmr6nDK0WjRG?=
 =?us-ascii?Q?gnNvPCddoVmzKlXprVC9puw2tA95ASzItzGTkY9f7m3ysTJ024HzmrrUNtSy?=
 =?us-ascii?Q?6MSCJ/c1ywMBnNr1vGhVdOgbfrGzpvQrPMMFa4aeSPDysV3FpXkdU5r9Du0D?=
 =?us-ascii?Q?5o1G1KCwjt7xTRdaA0U2IphXVrt4nRkMil/Kd1r27z35YuO1SXRvptC2lEzD?=
 =?us-ascii?Q?GxdYgGuaBths67UpNKXI5G8N0g/IqjGGbdNDKJvn+oHeze0QT6NS3tkiG8Ck?=
 =?us-ascii?Q?jCnwI/ztUg2kY7oTMMinpLBPGKgH2u8E8/AAvm5oP973YN01qXfeOTfNAE8n?=
 =?us-ascii?Q?Vpuk4aLfqB4HiELeO4A2CioYAt9vMtcGK5med0oxtEn9VIdyS2LyCOW1v7f/?=
 =?us-ascii?Q?DFUAZ5/TwfBF98EZEj8SxVN/lHF2YVueL36G5bpEOShQtyXvjC253vYLTj+g?=
 =?us-ascii?Q?JFadIvcGx9nKiRbdknexTG0gZt7nJSqtyLt01Av2SFYvVLjlm+worbO1pfKZ?=
 =?us-ascii?Q?9qK9JfyaS0hcH5DiS2ReE8UBPjYbXKR2xA6UCsHpEq8ON5Bw7iJjL6O21l6j?=
 =?us-ascii?Q?3rfx0fOVqxGHJPy1ZanedyKNVNmQos1aiEzsItYW9bOsjmFZNJX0Ui7jmCRC?=
 =?us-ascii?Q?wRQeNVrlBtmAPkLQOfrciRHTbBuCOUdMhBZ/YqNCO96fTKi+T2MutHhuCVFL?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5aa367-8749-4134-ea63-08dbbede4c09
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:16:57.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZheMJ5Na3XpfGCLFe7aLGGgCSBYhM58YU5tknbgrOpHgiEr5QUoT/+Gn8bfoKCpNASfkoyeC2NoM3uDiiqkCe0DtIheUc7uIFn5KUcGJ9dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 06/14] lib: Fork gen9_media.h
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:38AM -0700, Lucas De Marchi wrote:
> Fork gen9_media.h from gen8_media.h with the gen9 definitions that were
> in that header and with a new struct gen9_surface_state. Although the
> surface state is the same as for gen8, the meaning of at least mocs is
> different. As a follow up the mocs definition will change for gen9 and
> above.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  docs/reference/igt-gpu-tools/meson.build |   1 +
>  lib/gen8_media.h                         |  14 ---
>  lib/gen9_media.h                         | 143 +++++++++++++++++++++++
>  lib/gpu_cmds.c                           |   4 +-
>  lib/gpu_cmds.h                           |   1 +
>  lib/intel_compute.c                      |   1 +
>  lib/media_fill.c                         |   1 +
>  7 files changed, 149 insertions(+), 16 deletions(-)
>  create mode 100644 lib/gen9_media.h
> 
> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
> index 513385b4b..d5db95e40 100644
> --- a/docs/reference/igt-gpu-tools/meson.build
> +++ b/docs/reference/igt-gpu-tools/meson.build
> @@ -6,6 +6,7 @@ ignore_headers = [
>  	'gen7_render.h',
>  	'gen8_media.h',
>  	'gen8_render.h',
> +	'gen9_media.h',
>  	'gpgpu_fill.h',
>  	'i830_reg.h',
>  	'i915_3d.h',
> diff --git a/lib/gen8_media.h b/lib/gen8_media.h
> index 07ea2ac03..c1807629e 100644
> --- a/lib/gen8_media.h
> +++ b/lib/gen8_media.h
> @@ -207,18 +207,4 @@ struct gen8_surface_state
>  	} ss15;
>  };
>  
> -
> -#define GEN9_PIPELINE_SELECTION_MASK		(3 << 8)
> -
> -/*  If enabled, it will force awake media enginee and the following instructions
> - *  will require that the media enginee is awake.
> - */
> -#define GEN9_FORCE_MEDIA_AWAKE_DISABLE		(0 << 5)
> -#define GEN9_FORCE_MEDIA_AWAKE_ENABLE		(1 << 5)
> -#define GEN9_FORCE_MEDIA_AWAKE_MASK		(1 << 13)
> -
> -#define GEN9_SAMPLER_DOP_GATE_DISABLE		(0 << 4)
> -#define GEN9_SAMPLER_DOP_GATE_ENABLE		(1 << 4)
> -#define GEN9_SAMPLER_DOP_GATE_MASK		(1 << 12)
> -
>  #endif /* GEN8_MEDIA_H */
> diff --git a/lib/gen9_media.h b/lib/gen9_media.h
> new file mode 100644
> index 000000000..414001dfd
> --- /dev/null
> +++ b/lib/gen9_media.h
> @@ -0,0 +1,143 @@
> +#ifndef GEN9_MEDIA_H
> +#define GEN9_MEDIA_H
> +
> +#include <stdint.h>
> +#include "surfaceformat.h"
> +#include "gen4_render.h"
> +
> +#define GEN9_PIPELINE_SELECTION_MASK		(3 << 8)
> +
> +/*  If enabled, it will force awake media enginee and the following instructions
> + *  will require that the media enginee is awake.
> + */
> +#define GEN9_FORCE_MEDIA_AWAKE_DISABLE		(0 << 5)
> +#define GEN9_FORCE_MEDIA_AWAKE_ENABLE		(1 << 5)
> +#define GEN9_FORCE_MEDIA_AWAKE_MASK		(1 << 13)
> +
> +#define GEN9_SAMPLER_DOP_GATE_DISABLE		(0 << 4)
> +#define GEN9_SAMPLER_DOP_GATE_ENABLE		(1 << 4)
> +#define GEN9_SAMPLER_DOP_GATE_MASK		(1 << 12)
> +
> +struct gen9_surface_state
> +{
> +	struct {
> +		uint32_t cube_pos_z:1;
> +		uint32_t cube_neg_z:1;
> +		uint32_t cube_pos_y:1;
> +		uint32_t cube_neg_y:1;
> +		uint32_t cube_pos_x:1;
> +		uint32_t cube_neg_x:1;
> +		uint32_t media_boundary_pixel_mode:2;
> +		uint32_t render_cache_read_write:1;
> +		uint32_t sampler_l2_bypass_disable:1;
> +		uint32_t vert_line_stride_ofs:1;
> +		uint32_t vert_line_stride:1;
> +		uint32_t tiled_mode:2;
> +		uint32_t horizontal_alignment:2;
> +		uint32_t vertical_alignment:2;
> +		uint32_t surface_format:9;     /**< BRW_SURFACEFORMAT_x */
> +		uint32_t pad0:1;
> +		uint32_t is_array:1;
> +		uint32_t surface_type:3;       /**< BRW_SURFACE_1D/2D/3D/CUBE */
> +	} ss0;
> +
> +	struct {
> +		uint32_t qpitch:15;
> +		uint32_t pad1:4;
> +		uint32_t base_mip_level:5;
> +		uint32_t memory_object_control:7;
> +		uint32_t pad0:1;
> +	} ss1;
> +
> +	struct {
> +		uint32_t width:14;
> +		uint32_t pad1:2;
> +		uint32_t height:14;
> +		uint32_t pad0:2;
> +	} ss2;
> +
> +	struct {
> +		uint32_t pitch:18;
> +		uint32_t pad:3;
> +		uint32_t depth:11;
> +	} ss3;
> +
> +	struct {
> +		uint32_t multisample_position_palette_index:3;
> +		uint32_t num_multisamples:3;
> +		uint32_t multisampled_surface_storage_format:1;
> +		uint32_t render_target_view_extent:11;
> +		uint32_t min_array_elt:11;
> +		uint32_t rotation:2;
> +		uint32_t force_ncmp_reduce_type:1;
> +	} ss4;
> +
> +	struct {
> +		uint32_t mip_count:4;
> +		uint32_t min_lod:4;
> +		uint32_t pad3:6;
> +		uint32_t coherency_type:1;
> +		uint32_t pad2:5;
> +		uint32_t ewa_disable_for_cube:1;
> +		uint32_t y_offset:3;
> +		uint32_t pad0:1;
> +		uint32_t x_offset:7;
> +	} ss5;
> +
> +	struct {
> +		uint32_t pad; /* Multisample Control Surface stuff */
> +	} ss6;
> +
> +	struct {
> +		uint32_t resource_min_lod:12;
> +
> +		/* Only on Haswell */
> +		uint32_t pad0:4;
> +		uint32_t shader_chanel_select_a:3;
> +		uint32_t shader_chanel_select_b:3;
> +		uint32_t shader_chanel_select_g:3;
> +		uint32_t shader_chanel_select_r:3;
> +
> +		uint32_t alpha_clear_color:1;
> +		uint32_t blue_clear_color:1;
> +		uint32_t green_clear_color:1;
> +		uint32_t red_clear_color:1;
> +	} ss7;
> +
> +	struct {
> +		uint32_t base_addr;
> +	} ss8;
> +
> +	struct {
> +		uint32_t base_addr_hi:16;
> +		uint32_t pad0:16;
> +	} ss9;
> +
> +	struct {
> +		uint32_t pad0:12;
> +		uint32_t aux_base_addr:20;
> +	} ss10;
> +
> +	struct {
> +		uint32_t aux_base_addr_hi:16;
> +		uint32_t pad:16;
> +	} ss11;
> +
> +	struct {
> +		uint32_t hiz_depth_clear_value;
> +	} ss12;
> +
> +	struct {
> +		uint32_t reserved;
> +	} ss13;
> +
> +	struct {
> +		uint32_t reserved;
> +	} ss14;
> +
> +	struct {
> +		uint32_t reserved;
> +	} ss15;
> +};
> +
> +#endif /* GEN9_MEDIA_H */
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index e53580e65..61b18d20d 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -191,7 +191,7 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  			uint32_t format,
>  			int is_dst)
>  {
> -	struct gen8_surface_state *ss;
> +	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
>  	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
> @@ -252,7 +252,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  			 uint32_t horizontal_alignment,
>  			 int is_dst)
>  {
> -	struct gen8_surface_state *ss;
> +	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
>  	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 5ac007cc4..348c6c945 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -30,6 +30,7 @@
>  #include "media_fill.h"
>  #include "gen7_media.h"
>  #include "gen8_media.h"
> +#include "gen9_media.h"
>  #include "xehp_media.h"
>  #include "intel_reg.h"
>  #include "drmtest.h"
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 4f6716d23..b79b73cc0 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -12,6 +12,7 @@
>  #include "igt.h"
>  #include "gen7_media.h"
>  #include "gen8_media.h"
> +#include "gen9_media.h"
>  #include "intel_compute.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> diff --git a/lib/media_fill.c b/lib/media_fill.c
> index 2520995d9..88d83061a 100644
> --- a/lib/media_fill.c
> +++ b/lib/media_fill.c
> @@ -27,6 +27,7 @@
>  #include "media_fill.h"
>  #include "gen7_media.h"
>  #include "gen8_media.h"
> +#include "gen9_media.h"
>  #include "intel_reg.h"
>  #include "drmtest.h"
>  #include "gpu_cmds.h"
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
