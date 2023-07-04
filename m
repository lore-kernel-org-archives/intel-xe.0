Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F87C001B1
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E9B10E1B8;
	Tue,  4 Jul 2023 15:04:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D730D10E1B8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688483040; x=1720019040;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cDcO+caB1RyJkpsJAOssqD6VdXh7jPfW7IQx4GKh2rk=;
 b=jVSwzzuijDC/vWCqFvHQY5dD6DDAdXD/XgnKnC38J4EbgNVwSAuevYvm
 gKT5FmlswGkpIQjqpgvME+E2NA/vq8ijR78OhsOEjT/hsZhiJNn+l/FQO
 8/U2vGWiEP10UzDbUr0VI+yJP7o+wR1Nfg51FTnQvJpZukXPzEIjdnBcd
 rgSIcXdue8clm6DvRuVCBvLvbpULSoeOSoPw4GHpTUtJNCf4d/z0LEuU9
 cv9tjIVhb+DAVPa4lolq7xqbtkdOWz1M4Ndl7A0smUM7/vA+OZosi4GLp
 4q9/d9DUCBZnF4eUAGVbRMfLFgwAe1tDYhYCTYC9vIgsWOcXLMkHVWu48 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342730978"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="342730978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788884290"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="788884290"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 08:03:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 08:03:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 08:03:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 08:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6TwLNd9eA/gfYeLCGPx1JApoaMW1oYsRMuBid/4A7bAXwUdf8DOcFwacthqobfSgwGyxGdd9KJ1WoVrBZxb3C3UFyIRJqVxgcJqETFJTBggOSeCty/R6i6CVQlEyLVE/+LvzqEDDX//mj0gBFgduZd+Yyu82MMbDSDS69e85BkAPb0j7JMmFfIIJnEvmaES05XFHGENq/RDx9qDq925VuTXgugPlsRe02kGUNyYaLLSfAxCEySbvyIb4WoTrituKhlJ+LlBf8YICw0UjHPwjZZAcD+URbTctIwzBa3YhugF4pKENG4cyFd+f7P3tk1QHNKfuzrXmHfXADRrdDARVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGybDTNePmZnbz23sp2DBts2ypr53AihtdABT8yWvkw=;
 b=WbSsEoz+KuTdBlq3d9rj4et1KnAix6LaqhfZwE3VDkhhe/L3/cr9Lk2k1KIHUI3nsHq3hm4Z8wv0HtnPvFuYqTe/xEjC2ps4BCUwI8l8LdJa/i8FMLhwE/BPCkUymaHYAtoTwbAYgq6orNthO1oPPVgxrZdGPlbBOTWew4MbvEhmTt2clWUHV+34v9HfDDqYhy+9b8XV0UTlVCAWPXAJfHwJgT/mgIQPLQGoIoh7QnsOJZMpfKu/ulUCeTHNZE4M748pS6juVTc5Kk8sCYcA3t/o5iwNqfgDx2t9wgthaX6b6vCY8AHNCZfr75ClfesWGbITuybVhFXqXPPf9B1ybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 15:03:56 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:03:55 +0000
Date: Tue, 4 Jul 2023 17:03:47 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZKQ00zJhzj9X1Y19@fdugast-desk.home>
References: <20230704145907.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230704145907.7-1-francois.dugast@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b9221b-9a91-445d-a5fc-08db7c9fe2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBfolesdKFeUgHEKkBZj7ulDfvYh98NH2HqDx5UGq4OeeDzpSqFEhTQtLzX+Dbuq82qE3wOfUjxkpeaJhZGlHiLhQfN70/TOSVhv09cRp1g0eMkBPvgd+Sc9c9d2lHH/pjx5nCw12JpGgNYnd+sLNLOvbcFp/+zKLbhMHs7GYFP5XrQ7mgWOyZ6m7oc6yE+/4nCScSjMhjdaH4TT2bomHrambFfczJ36ZOnISKTLFxI+M7F8mTZ7FBUknAA7WVbgPwwgk7wVVY0ZH/Wt5A9FeR0ayPlGs7vzDwGDLYHwrgmOPuT8Cjq0g+fxlFg9rxbUdsBGIwEPRlhErIuBGFD48pIGfmEJwEHP5aiDZbIZCk8Ape8SgxKBwm8H0bmVJQM8qzuEIVdOiwr2cZmcwPjgEr76/J+sc8n4REO8WnRwmIpsEiO5oRkLbtkAXhDh8Zcte4eoxhhMPYWL8pTpF1XO1HeV5sni7uvrn48p9/BBGzKmne+Sck46GsLUVTMuddK9K49UxPNE26X42ecHv+FcTejV1jUH3M+QyG0WIoxcV6EgiLcqlX1OowOmwo7Zz7fc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(186003)(82960400001)(38100700002)(6666004)(66946007)(6512007)(2906002)(6486002)(86362001)(36916002)(36756003)(66476007)(66556008)(316002)(4326008)(6916009)(478600001)(9686003)(26005)(6506007)(83380400001)(41300700001)(5660300002)(8936002)(8676002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1pbV6rrcvES+zaX6AMKnYVKcKy6e8OfWtA7qxxFpRnDn+6PJI8uzGBluSz?=
 =?iso-8859-1?Q?idEjYPu+bF7ws1DL5/K/Nxg7ASszD7xqdLln4zG1rpUPrKW0B8EPpyTtzE?=
 =?iso-8859-1?Q?uNGHWBRX1AbTmxa96LIEtR9LnVbYXqUhgkVS3P7fE3/Z3v/Wz2g1FeJPyT?=
 =?iso-8859-1?Q?2MR/OIU4Euo2PuN10k95+mLt1xa6cVzxFFv2Ty2uMBbfaSlZXKF4Z94Cbz?=
 =?iso-8859-1?Q?8t/5tAyFlKv0pN+EB6B31P7c+1JDIS3XSHvj4rYype8wx3mjB5ZPkeafaE?=
 =?iso-8859-1?Q?JcGEOuftqzjYZL8uwXzYWyxtFhrJ/YE/KngSDj/h5kUYeaL5A4b3pSPRy0?=
 =?iso-8859-1?Q?kRtQxwbG+DVNIHp6BnYXqd2rLJYV841KpyjJfeJ6ObpK8yPyzFaXs8uDAl?=
 =?iso-8859-1?Q?zXR1wSHN/xXdTTdPJmeRJv1V2c+1/in2NMEE3DQ37nwvriw1740wb4cvCu?=
 =?iso-8859-1?Q?Y820JmHNVqprOOwgxx/F3EkMCrxyGFIV13gLAnWLgWfex+uE1cfWFu5wnG?=
 =?iso-8859-1?Q?0tYT1rVcDYPG6cPUROiLA7ivsr8QalvzrooHlNFSHJ5A0/gxlIi4lHIXxw?=
 =?iso-8859-1?Q?jl+s7GYSjXHg4JEiT0KzLyq6LhqkpIfI1bDC3KKWlv9qr1/J7ISLtRfi/V?=
 =?iso-8859-1?Q?legLhCbsZyh+bgv0daauA3reFH8hxjXSx7JZvbTZMqsj3dfv+Us9Zmvi7+?=
 =?iso-8859-1?Q?PApNQ8/Os3aywUB/TbccGBgcws06smnyDLkRDV1bXVWeOqoPzZuVfBstJA?=
 =?iso-8859-1?Q?oq4Is8ZeJrYxG+OUpDsvLIrth75xDlShmrlWs+uRDZz1fxarZLU89ZK88J?=
 =?iso-8859-1?Q?54Ysg3uZHzyWHqkxItfkMc5hQ1c/YgBxfTo91rUn8eBErk0Pnvyvpwsb97?=
 =?iso-8859-1?Q?+LtX4iL19cBVLxcf1Zw6xXY2gpaKJcMmu93b1oC89fcVaAUtMm71+u8Q+k?=
 =?iso-8859-1?Q?o04WzdnaGPHiscHqEOq3HaArqss5LgPozNJwQ3BctylEp5J/c5hTQeXfDk?=
 =?iso-8859-1?Q?yaDZOxGYrllz3ZVVGOuI0KtzqgmgFPtvOs4gkG0dLiPDTJIRsxR8pQqYu1?=
 =?iso-8859-1?Q?OUS89ojV0JD2yw+dx2jmvfMC82a5ob2mbIpSH2noKfRyVk2Sfl+bazOB3b?=
 =?iso-8859-1?Q?L1hizOMprAKgSfhPQFkcCi8NJtnVQ/FxzLXcycK42zt5F+E9QES7qUPSKE?=
 =?iso-8859-1?Q?0hButB7R+Axl3VTLZ4B8DLpI6u5VHopnOSpQxUQMNSdb2OtQFzjFDszcrI?=
 =?iso-8859-1?Q?CUqZu6ELtC3QoBkXNimyrY9uq8Qfqv6gHTYbXN3pFi29fXnHt83t5sTFoc?=
 =?iso-8859-1?Q?y3HHiYQddq8P3G8zJlGNotsb9h/3fhblV2WU5/H0Ql6ZLFHDSG6homBXRj?=
 =?iso-8859-1?Q?q4ECwDjtXJO2IDzD4QbC17hn5GKjOU4CJlrqNZ0X1ppT6nLXUoN4QcfFLm?=
 =?iso-8859-1?Q?D+JAqBXX990UDdz0g6pH0I+rchZgQvv8e3V1c8HAwCqqBtRPup1n71wUCX?=
 =?iso-8859-1?Q?gywKeH1GR2GBwIs5opIYz6WcbMj0cUoLoFlrFiTSoZ3aHe2ep3nEPL62PO?=
 =?iso-8859-1?Q?OyE2UAxUUeYuvrWLe45v3xyH29pSaQQoYEe5HtjI4u6OKOFVDMPRRoipBK?=
 =?iso-8859-1?Q?CaXSnpzEEayAErCrTMQGfGVWoMan7rKhXgPH46d55vQXg/rci3DRBD0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b9221b-9a91-445d-a5fc-08db7c9fe2bb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:03:55.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEF1If+qzYvjCBwy7Wbt1cD0gHrTBX3Bz3j1+rLeBpicpn4fhkE7Aub5ULWF6axGCvJULeVLcy2NfhEBb3hZrZ3OIi66VhsV6mJnzyAUUPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add license identifier to compat
 headers
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Please ignore.

On Tue, Jul 04, 2023 at 02:59:07PM +0000, Francois Dugast wrote:
> Ensure the license is correctly identified using SPDX license
> identifiers in compat header files.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h         | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h           | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h      | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h         | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h           | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h     | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h  | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h   | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h   | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h      | 5 +++++
>  drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h   | 5 +++++
>  12 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
> index e55fed3cbe9e..45e4f129eba5 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/i915_fixed.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> index 36d863f4848b..a15d1fd7b1a0 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/i915_reg.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
> index 128a9a330c13..bc6332171df6 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/i915_reg_defs.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
> index a88a5196c79d..e54b1a5ddd8b 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/i915_utils.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index c40bb27ac72a..973422c4cce1 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -1,3 +1,8 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #ifndef I915_VMA_H
>  #define I915_VMA_H
>  
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
> index 99e7a2142a37..0ba42ed6912e 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
> @@ -1,3 +1,8 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include <linux/types.h>
>  #include <linux/build_bug.h>
>  
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
> index 6e35e0bace9e..fec266fbd5e5 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/intel_clock_gating.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
> index f7c0585f277b..306d30e5744d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/intel_mchbar_regs.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
> index 741ef99dc0e4..9049a1ce1799 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/intel_pci_config.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> index 1a7a1224a750..a6e1e4f8b3f4 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> @@ -1,3 +1,8 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "intel_wakeref.h"
>  
>  enum i915_drm_suspend_mode {
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
> index 678f22c36d42..d7f78aed8c69 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
> @@ -1,3 +1,8 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include <linux/types.h>
>  
>  typedef bool intel_wakeref_t;
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
> index 83166479ffb5..0bebf958c5cd 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
> @@ -1 +1,6 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../i915/vlv_sideband_reg.h"
> -- 
> 2.34.1
> 
