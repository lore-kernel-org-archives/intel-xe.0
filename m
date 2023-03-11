Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E681C6FD19
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D689510E04B;
	Sat, 11 Mar 2023 00:12:10 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B310E04B
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678493528; x=1710029528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=otvGkD7/L3xRN9+G55DfCvKtUjzDJN7+KZLP62kostM=;
 b=JF1dG5XfcPpSgkB8/Vwan9e7nIAepyIibmXRXwtdK7xYU1FxA1pte5on
 +U5u7LX4wxezm6pwK47xImANS9a+rRShNPHc/g1A/9CT3trW2UBjF2y2U
 B3ssoyusm4NtdbaCnN16MU+exCo0jk0DRQ6fRV36rr0wa5EQqYW/O4Snt
 MM2JCKjrMltV3kLr5VHA6TdAUf09/qvMan7bd8++Ie5HhsIPJt0KbVnsM
 ehmCOPWfqqWi/l/WLjP2mjxxZ24ffPAKQFRyvKJt5csBXkB131CKRwy2j
 TEUL2wyZBQGSNb2y2a11CFSNG9PoyuoP5qujC/xPODpaQpiVCYHBUHbid g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423123253"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423123253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708200870"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="708200870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 16:11:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:11:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:11:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:11:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVcKM9bmzZ+708Y4aYFv+hUVRBNTTuVD29NR2UHaotd9tw8EYuE/t96CsbvXDZtfyrcMiJFDhl5scZXk26xQRlOVJvekD/kBIOGhbQ/VM26t4liIy6EDKqRVlnvDw+1mBWlbtWlaKF00AG9ng4kEt2Hj9eV4ygM0dTkX7H3QddSp6tHeNkODK0zwxAFa6LBEBA9fofCH7rbl97uhqF2tcmNMP4KAVgb4g4cnqkj/cejDToQvtgLtI0F1Oax1ltdZfitRPJQ/rVaq/yWsMu0dGaoABxfRHNDGeTtdQkNFJzhlM4qedi18Fh95eM5dysdkXf8pZgZPQBbi0H2ECkLSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLiXKSRM93Cgb0WH0QSRSwzBbpvGcKooWlGLYU9homw=;
 b=JLXLtksTEq7/Qwo9/wXlHA1LVU/ZARnQgzlbosf3fQQl0Ai6ClVrc4vpaJNqNoR10VrnKKoV8sSKY91bU0+xUNthKpH5OWmE+8mSsapmuxmpyBRBxzx66IJA8bfZQVRR/y0jh3jGcyRxFW+7SjvwanppMrY8N/qrxD7J68ZBp1JrsulGXQhNaPuuHrAoXvomSL/XyiUQVGZsF39jD3hpXGH03xUcmBd+A/TZ9sKXN4PQjIF+9sy1O4epFR5NZTyhBM7ENTC0L7tW+GmypvLEYiiR1MxqDWiDZ/rYvntoigvh+Y0MV/LDwq7zP5Xd8B3yoh4ZvE33hTihEWdE+P2B5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:11:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:11:37 +0000
Date: Fri, 10 Mar 2023 16:11:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311001134.GZ1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 76971fec-45a3-4b11-a91f-08db21c52e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbtARvgZSVNOjWQXZcGRzVL9yFCoZCkYRU5IQd/XpOLwxrZygfDfOUWbBUeeZSqlKiRjYtEwd9ObV/fr/naKoqKzOFCdzsza95W6blKwVxCV9JXCfrRiuONRqdEqXF9xR0aCHzbnNdkgiQYJ/7ovtKBKOBx/vDD0D0ZZcGUVU96LIL7lSQdmJnwbv/HDKsPWL5gAiq+3B42eyTKcsy5te93JuBNjgctwlT8fNNBifUo4v0anAdBHmzyf7J3/aAVZ3mlHT9FzXTsTvh2qxsx1MVH64ZJeXtxUTkyx0r4yRZFcW/F3/MQu21WyWaR7ia79FCQVFJv/jnP8ILOWz5snh8c+pVpuo2XDDDV2jIyCxe+4Asm0liiXM4PAtNPTe1OKI5Qalc59lNOGuoWGyieNKNIz0JIFc9Mid77Rbia29aw9S/lKJfLVDvUxC3exOYiOyPXNu7JvxZG8wKxJZizjkkbKRP+ug1hU+hr3VOn5VsyrFIauhoUNjYgn1RiFjsofcJHW297qQA3tM+hVMJRdSJix7tFxbdB1VdG0AIC6Jdfl6vCPeVyfpQ6Wb1LjlkvrM2ZKqNkNLa8Bsihrbs4VNegyyBmvJeWABlZWZzCDDosiDp0KpXLkT4j+id16Tr1w6Kzxjaw2YiypzAlZH71d1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(33656002)(186003)(6636002)(6486002)(5660300002)(316002)(66476007)(41300700001)(6862004)(66946007)(8676002)(66556008)(8936002)(4326008)(6506007)(38100700002)(26005)(1076003)(86362001)(6666004)(82960400001)(6512007)(83380400001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zreqvgaIMZBrirUNjdOA5JcPqatftfeMef+wGoTMPhltzFAe5LSS1a5eJWLJ?=
 =?us-ascii?Q?z+Bue6z5FS+FgVbPzwqzQBbwO4P9QnifZ2kXIdxxO2OuY8I1mjcXD3qslUEv?=
 =?us-ascii?Q?FHrwYIEPClHFKjXiGyNJF1y91UROHXLFMtKomk4Ngs7ftn/BKj2arsQqdyXH?=
 =?us-ascii?Q?N7klgUgDpT8dJBYgVFjzn7JDV6Uy3W4C+lvQ1xPHJKOtRltbGu3IVl2LDio+?=
 =?us-ascii?Q?9k5hoxDxrwtM9UMq2XfrBEU5D2TC63rMpq9od0uljg6uNZ2LZSG/Is5VOLAJ?=
 =?us-ascii?Q?kyWA71wAc0al84N4EugLeYRGmAqJoeNmoaposjBPm7nPfe0QHvqm/zoOMJLD?=
 =?us-ascii?Q?5fU+lXgMh1JFaxNJ/xeiaOlQ4MeZlSUe77E7fTtKpuAULTQskIUNsPvbRN1K?=
 =?us-ascii?Q?VKfSYADdeBAzP6uh8VIoHCfb3NEvFqukhaAXX+axvIAwyoa8NHoDcMFShCfY?=
 =?us-ascii?Q?6T8kx06tvw/iUgdMBDkQLOoxHWX7aQmVFAHX4Sz8vmBT7yxk7/gEBlndovPU?=
 =?us-ascii?Q?Zm5xHLxbnbKaGtXwTNJEPeQvk14F/cnuEmyiZWigIXg5nQ8/0bnIjAy1SHZ9?=
 =?us-ascii?Q?RMcJ00Mp57pWEd5Xy7DQJak842oRj7IXu9QsXcRQuz8LzPs/kZSVAjDAbYpC?=
 =?us-ascii?Q?v3im1bsSzP3u3SoNWOrBk5EPXnoHcTlcPq8UkhOu4sribLiWzSBLqtDC0VHK?=
 =?us-ascii?Q?q5w54rdu0kQ+JPkBvYNOrzg+4cEDBEj6R99c9qbTjTPUR0I9q+D9UJUeDWRA?=
 =?us-ascii?Q?i03f4RzQ4OY+nOww0cJ06jr1xvUEhT/BBEvBx7toOyBxEwfoxNcNRXzCnT9I?=
 =?us-ascii?Q?jmlyvj7AWUr8pZf9bcgbM4DEHtZEWWB/dRbipfO0xdEy7hq8Ug2oMc/hGVyJ?=
 =?us-ascii?Q?HtJu1ryRqs2jukxwwmShwF25FR347W1Js5ja+EnktTgTduZsne073B926W52?=
 =?us-ascii?Q?IyEictFZkGRUZfMj9OSh+ubadjJkGcAXA1FuRJpDruRxza7UOHlIoUSxhd9R?=
 =?us-ascii?Q?5Y8dJhC1TVWXxuG82blc1Qxa0mErL/Z/1izjYKIatOpZws54t5AUdGwxfFHN?=
 =?us-ascii?Q?G7pi706r+u+KZnCuwnBnNAH5+hgWqgt1h9pdYBTjESyItzZsZB08PUm+X9DS?=
 =?us-ascii?Q?Df/EK7ZwpVFN5poulHagmTSrsRSNQzOiC/HgT9GgYIKPBU1txMPTZHh2oy9Z?=
 =?us-ascii?Q?QVLS1it2Q09IHEYhAiWlCBAdb6QyhcI+eCurQbqM1rA0EUHYMZh50KLQ4Rme?=
 =?us-ascii?Q?BQOA2WlfhytLHyLp/lfUxgpiHHHgebJy9yWdpsnmGZjnVQBQ4a+w+EJ1r60r?=
 =?us-ascii?Q?yzRCyrLP0beDTbSy5G/QmOBvxPUkURZuTPIbBl1hiE4mJbOUrgcDxBMGrl2/?=
 =?us-ascii?Q?NQX1QqKTfR45gMMnsxc9RAiVdef35Ft9/GZDNd35ELR3SdIAulSS9eATWQcj?=
 =?us-ascii?Q?US2lOs6yO9PvhohmvDfHOcKIZXCYjvL6G5GSSgjagfJdWr9yAE3FGkQJVJJA?=
 =?us-ascii?Q?GRHKN1o+9BW1UU+HkpIvUCKXGgXxyg2XyqoBTXHTz3zTwtDzSQ2XOG8TQBhZ?=
 =?us-ascii?Q?sdW4s0eQ30/HzEPKq/wHwxfPGvllkYZkPAzWNSN/BlRh8001LeoQu1rYwGtV?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76971fec-45a3-4b11-a91f-08db21c52e28
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:11:37.1154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlKp2sq5Nreb2wRdYKEyV6n6izOs6U2aq0rTwoeTuCsbdxmrVMtiHyUE4YgKATt6vWaOsv5v8cF2f46CrmZ/bpClL6Ykx3NfqQKeUfA3KJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/12] drm/xe: Reorder WAs to consider the
 platform
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

On Fri, Mar 10, 2023 at 02:15:43PM -0800, Lucas De Marchi wrote:
> Now that number of platforms is growing, it's getting hard to know the
> workarounds for each platform. Split the entries inside the same table
> so the workarounds checking IP version are listed first, followed by
> each platform. Next step when it grows too much is to split in smaller
> tables.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 85 ++++++++++++++++++++++----------------
>  1 file changed, 50 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 76c603dfc030..26b94d580e56 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -99,6 +99,24 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("14011059788"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> +	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
> +	},
> +
> +	/* DG1 */
> +
> +	{ XE_RTP_NAME("1409420604"),
> +	  XE_RTP_RULES(PLATFORM(DG1)),
> +	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
> +	},
> +	{ XE_RTP_NAME("1408615072"),
> +	  XE_RTP_RULES(PLATFORM(DG1)),
> +	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
> +	},
> +
> +	/* DG2 */
> +
>  	{ XE_RTP_NAME("16010515920"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>  		       STEP(A0, B0),
> @@ -162,47 +180,15 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> -	{ XE_RTP_NAME("14011059788"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
> -	},
> -	{ XE_RTP_NAME("1409420604"),
> -	  XE_RTP_RULES(PLATFORM(DG1)),
> -	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
> -	},
> -	{ XE_RTP_NAME("1408615072"),
> -	  XE_RTP_RULES(PLATFORM(DG1)),
> -	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
> -	},
>  	{}
>  };
>  
>  static const struct xe_rtp_entry engine_was[] = {
> -	{ XE_RTP_NAME("14015227452"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
> -	{ XE_RTP_NAME("1606931601"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(GEN7_FF_THREAD_MODE,
>  			     GEN12_FF_TESSELATION_DOP_GATE_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
> -	{ XE_RTP_NAME("18019627453"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  	{ XE_RTP_NAME("1409804808"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
> @@ -217,6 +203,24 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("1606931601"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("1406941453"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +
> +	/* TGL */
> +
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> @@ -224,6 +228,9 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +
> +	/* RKL */
> +
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> @@ -231,9 +238,17 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("1406941453"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
> +
> +	/* DG2 */
> +
> +	{ XE_RTP_NAME("14015227452"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("18019627453"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{}
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
