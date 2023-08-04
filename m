Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0106C04A6A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 03:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F120610E236;
	Fri,  4 Aug 2023 03:59:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1D710E236
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 03:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691121576; x=1722657576;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l3aRaCSu+BP9UBD3mn7BNm9B0hm5UlBNyE+D26xeZXk=;
 b=cAVCxlVcwtp1GDuroAMKuKOCs/hzz1YzUSJtyqFfwdjgSviysR/j6RLm
 w/nC+tLPp/jr+Q5+hdnmiiRmFtxPdDEuooCasMKSTZWSl7j7HTGjvuiBg
 hr3/DrPo5ZSsvFWONGAQUuZDma3nRCyReZkRhMI/4PId74WuQ64nO03od
 79c+9eG61ZvivNVqq7oFAUj/YOnjT+FCgjo1Sfg7H2IxB4Cd8mb45QcM1
 1dE7AUtS2sXoCyneK2Qme9cOge3qZt4L3q54gz/hMYqp87Ou121dGuPnx
 DZ8RnOxO1EK2BxJRT+gZLqfo3FCJnzacF1Vote8CIkd10wLAozCBS+eWL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350362191"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="350362191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 20:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843885885"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="843885885"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 20:59:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 20:59:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 20:59:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 20:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNJFOqhR7Z1NOgzFaqmHM1WUyePXChahGoaaS/l3/QdCoq0qpkvvG1qW2mD1mWhEAwCy3a8yCYFE3zxmaoLVlLaMo9PU8MkwzCiSUGfW7eavEySozVGpm2yOgoo0OwkVAXHRXh0SMehSOCI61FLb07DJBQ8fO1sgSlL3jUy9FOqo0la16onISOVp3ECietMyQVW5/XTM6WVT2+LGsQHhcf8iwanezNHYUVDPbQtfySZ3JYlnROQ7Gauu6FrD5HmiEwuZNl3hE2SoIyegxfwU/iwmtyxx8+uuqWOy4oj2BJAV7kqjfuqVSmCAWBbiZsgGO3dmaGt1GFju7G1OzkR+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKROf3mRl75tpn+IXVe7z/6Zsx/yHPGbMX3K/TC78wA=;
 b=NPB6K7uUBie2jkoCQ+kAYtet6BiGVSb8ol0RszSxuPUf7Zw7iRU3QKLDiBhiraYvmGH1uETlwf5QYI6iGU8Sa5oZkejRZyB2I9ZkckNAMLcDkQZ0mL+hrbBAj1yKzzEmadScla8a4MlTTpGItGUHgT57pPBpxzzyMaKgf89WLbDbfjSfnkUktFl9cyuqRC9zpVDgdA+JDpkxTQbAJzZqo2RwFWnOYuQYdnlvE9X6fA5UMTEYU0+gXdflcrm35S4h9BUuJeA8GFi898Tvo0cuKM8tp7n6S4Dvsr6tH5xpzWbd2kzD/ZEO2JxHNKXi/iZ6/bXqnTgu1NVe+DmDJwCa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 03:59:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 03:59:18 +0000
Date: Fri, 4 Aug 2023 03:58:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZMx3Yn1vBFzjRZiU@DUT025-TGLU.fm.intel.com>
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230728192518.1951-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a71f9fa-fc74-4b6f-dffc-08db949f2d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWgHIeK+1V+zGOqCK4SwTvVvXJB45GAPLEA/ibCi9NRjfdcPsTcTRT+t/kvnPl6suod3nMMjiMkW3Q7yceSwbL8sFfPbD6PAsk4MqvgPvNFaYVohiqFpgCKLZw41FMjDyasjSDJXb9dDDy1ydSKdKw8lxonV4LL9Z31QpSmcqdu4i7wZ1kmRhkL3Z/g3cgAAqnN11KYjReNtbFf6kIGXshFAUO4L2ajvdadrvyyIScVQvQbl7c/UxlcRvklN005hvKMC4WEOnuW1XyYWmaaq4xS9xHzGPc7IVsN5duP+72vWeYQ6a6vBYG8ELMCdtvtZDjn31C9YwTlMciL321ofr2jo25+/z02fm/+xCClu6faAVrL2t02ZnSYI/hMv8IhllKXPAn70JrzANBJZ0kPrIOtMZ8WplMsxWokt9kTHHaC0XcTDS1lJ5Hm8QIDj2iviZjaDn1dpTeAcfTzcNT/G231v0U+WtVM2RlGn+gESs2AXWKjy7bKJ24lK5UemHLB8p8cDYnFcq6y9tTA2K3XiK6pIRXradE4MnU2PRoYL/XA/wnQbVnAl0U1kS2NFGaD6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(1800799003)(186006)(66556008)(41300700001)(316002)(2906002)(66946007)(4326008)(6636002)(66476007)(44832011)(6862004)(8936002)(8676002)(5660300002)(82960400001)(26005)(6506007)(83380400001)(86362001)(38100700002)(478600001)(6512007)(54906003)(6486002)(6666004)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Kc5fiDDf42g+NNcO1Iq87rvy54qcdR/bGZAnbHr1TKARXgWIX+DNFEw2WE?=
 =?iso-8859-1?Q?VGT57j+bttt0quEQN7fCmL3RQYM4WoWTjUR6YQuKNZGtlUZKmZFhP+tOih?=
 =?iso-8859-1?Q?ZhUnJk+/4qs+AHCbiS0UyG/IW3UuFKzd9FCs7Uy7q2rk1D8j0LVpovzfU1?=
 =?iso-8859-1?Q?EKYzSZrWY5HwhngbCOFV6DxKhl+7JgemjvAup2ZD+HKy9PqvqxGfZGKZn9?=
 =?iso-8859-1?Q?QaQ5Ms4QYup57alWMIoHg9BgY/WCa9SivKR/xkTZdvgPmV0G5qOqN6VkuP?=
 =?iso-8859-1?Q?tcVlRxPTMrm0oQwRMgo6Za3clV3KezxNHGtjZ5mFQMj/DojuJdmO+oRgHz?=
 =?iso-8859-1?Q?QoLT1F5yv9AwnOYnsGeoRlqpvRKreDZ5Ly0LrHt0DvCvKS92GbBvOGsgK/?=
 =?iso-8859-1?Q?iFAQi8/Gc/kprUy/YV4N75T05HwTqssYzatQLMaRfaz2tPgz6ylPQkmP14?=
 =?iso-8859-1?Q?kR5QLtOP312TyeoVunXEkTLIRlKQnGI6OAWvFUyqWEckuyBaT9mCBuyHE9?=
 =?iso-8859-1?Q?nMTO0L3GtZnZop/U8c0ClgnULSwvVh2nWHPK0OQNzpg2jDPG3m6+l9SPqQ?=
 =?iso-8859-1?Q?rFGRQwdjq4Bn/LW+BsAa4SRV1ZGnzmu6+KmzOmV1Uxf5H5Vs2VEd0vfQ43?=
 =?iso-8859-1?Q?LEYtq6iBahQnvFurIrFVRhRfYzYDNQcP4HVDQD70rqV3e/Db1Yf3QI66tg?=
 =?iso-8859-1?Q?VdDq3HkKXPiRDSnL1MA/bnUWplIepbVX1IfYz7sR97rNiUIrrjgJcF6PSP?=
 =?iso-8859-1?Q?Z4bMpfFkwXu0HjFNkrxlI0hddqdCZcdHX4hPELj7tlmn0B+wy0PRz3VCwb?=
 =?iso-8859-1?Q?7FxOsr05FnE7s8zHSCOWq1XNu98nAn3BMLVKxyFC+wEWnr1WOJvl242g67?=
 =?iso-8859-1?Q?6fVeAgNtbgljVvSLsx60UPrTt82qNkPXiYid2rOQDmIcRW7C7U81SgmMVH?=
 =?iso-8859-1?Q?/uOJigMqDRHQ4bK3HYKlam5MJnm733m9GC2iA+gm5cLudQIwz32COEFYQ5?=
 =?iso-8859-1?Q?YIxM8X3mwgs2QfFjtlRKgOk76FzQ+/UmNK3TR0xDLHQ4sTKUXxZH53nuEo?=
 =?iso-8859-1?Q?9t2gNJdK3/ErxZ2M+ooqwcQs2qlnlKpweLtFN4BcuXk4Gzs7qs8rnTBJrJ?=
 =?iso-8859-1?Q?3/sMoMhmLyCbONTHDtAkRVSd51xA2MPquJ3zC7JP05l0Nx73fPL4sNOQnR?=
 =?iso-8859-1?Q?sh/gp6dmWcwb2L/7nUhKv4i4TJg0KnafFh1I5EwIgEPmauWkLdWRl66qLH?=
 =?iso-8859-1?Q?vVuPQD5TmiU+/Xt2O4TdPeEv2mu+AY3LlnLoA/UivvMQRYttc49N+zB/BM?=
 =?iso-8859-1?Q?SfcbdtHlUyRBC/7ilNsMJRnCEZi2O5JlcA7aA+Dn+Gr0qYE8cwiZ61Hney?=
 =?iso-8859-1?Q?JHmZT+uw8w+5S0ukCm5OtEBRV2TiFXbkq2THsZpOzOjBlCyBUFvUXzYPXt?=
 =?iso-8859-1?Q?OaAtKweZFknFsBdu7uBBNcoYYhtr3zHgsCiuMHUebZ3DWZNl+RxgDW+Uca?=
 =?iso-8859-1?Q?e0qXNGjiK0bOD7UM10JfBAClBNxf8+gQrodtL2q5fp61KlMLf3yQbM2Ksr?=
 =?iso-8859-1?Q?6MVLvYoK8fwoqHDXyRoPSYMszkno2vuZvNlmE9n11S5fPjipWSt9fU7aci?=
 =?iso-8859-1?Q?2sEdRxGrL0fXHypNEw/53TYGrMunR3d8Aaiz9lJwdaQMEK6pObmDtKhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a71f9fa-fc74-4b6f-dffc-08db949f2d43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 03:59:18.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olD2V/R+nHpYxEDv7G/WVClaSf7ttHI0CDSXjsxg25CR0GJo944LcJvmCO4gM6fgvYKYD/sfKlQ7CkRFGrKtOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:25:18PM +0200, Michal Wajdeczko wrote:
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
> 
> Introduce family of xe_ASSERT macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.
> 
> Macros are based on drm_WARN, but unlikely to origin, disallow
> use in expressions since we will compile that code out.
> 
> As we are operating on the xe pointers, we can print additional
> information about the device, like tile or GT identifier, that
> is not available from generic WARN report:
> 
> [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
>     graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
> [ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280 xe_device_probe+0x2f5/0x4a0 [xe]
> [ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]
> 

So we get the entire stack trace?

Agree with idea, my vote is introduce these and audit the code replacing
a of the WARN_ON with these.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h | 47 ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> new file mode 100644
> index 000000000000..65306768d637
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_ASSERT_H__
> +#define __XE_ASSERT_H__
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +
> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...) ({						\
> +	struct xe_device *__xe = (xe);								\
> +	int __passed = !!(condition);								\
> +	drm_WARN(&__xe->drm, !__passed, "[" DRM_NAME "] Assertion `%s` failed!\n"		\
> +		 "graphics: %s %u.%u media: %s %u.%u " fmt,					\
> +		 __stringify(condition),							\
> +		 __xe->info.graphics_name,							\
> +		 __xe->info.graphics_verx100 / 100, __xe->info.graphics_verx100 % 100,		\
> +		 __xe->info.media_name,								\
> +		 __xe->info.media_verx100 / 100, __xe->info.media_verx100 % 100,		\
> +		 ## arg);									\
> +	(void)(__passed);									\
> +})
> +
> +#else
> +
> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +
> +#endif
> +
> +#define xe_ASSERT(xe, condition) \
> +	xe_ASSERT_MSG((xe), condition, "")
> +
> +#define xe_tile_ASSERT(tile, condition) ({							\
> +	struct xe_tile *__tile = (tile);							\
> +	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile%u ", __tile->id);			\
> +})
> +
> +#define xe_gt_ASSERT(gt, condition) ({								\
> +	struct xe_gt *__gt = (gt);								\
> +	xe_ASSERT_MSG(gt_to_xe(__gt), condition, "GT%u ", __gt->info.id);			\
> +})
> +
> +#endif /* __XE_ASSERT_H__ */
> -- 
> 2.25.1
> 
