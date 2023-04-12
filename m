Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73983C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 20:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E7C10E974;
	Wed, 12 Apr 2023 20:37:40 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E318810E974
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681331858; x=1712867858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bBzeQtJDFh7FAOUupTHgmham5D+psLnqeNX3Vhet3Yw=;
 b=mtkm1Don2RT5UtGOGO12TiY5y1bbr6Hphtig+TW8/z8yJksFKtr74Yww
 AF+TP0fxGcs4J2T4C2OXqPa4R9YN7oMFYl9bkLN4Cgh7wi7vhpoV1ZgzA
 Ynt50Q5kScOoDpcpTGo1FwhUH269lsqkrC4Jj4VhNLKLzD2UaAXbLddIo
 x6OQ/mKcKjOw2v8mw6zLmxY8lYtgQ+fItEzm5OL9WtITNTqL4SWLEjPJu
 MpH3ZSkNXU/v0gBRdAAfK59QbTLCwI8stIQVcHtsAXUaKaGB9ppItJ36B
 eqDiFL9KVQU6sC4xqkJfTBQgvDxDUXO3sS5/l30dL9D2JGEnV/YFdbr0r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406848638"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406848638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 13:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="682615585"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="682615585"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 13:37:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 13:37:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 13:37:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 13:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8tVRvXvh+QbFSlZMpdsubnB3vrBazGcdAAXLv2qghRKuaPeiCAjvuI7C5P2D1IrOeV1+50rObo1ps0uPzZwkv3lAZxgvJSQ+HgJpFs9Fn038+t7lBuP3T7qYGH2BZG99lvE3I89gnrjZaEJmcIIJWvvV/ThpRSW3wkCwOu0RKkQO3TpXH3Q0N/9NlEEjHjpIycb4auu7+IRpJZ7KmhNUzsr8tfvZPS2AFNhMMrM/c5sk4hdopO6txwQq6+6HgiJyucvRk5jXyYM2yqahGncDX6BB4r+EdN6fJVkXW4HNNF4kIzIfFyHVd26/OHgALRHyt6Oy5jy/rw7SEEhzmVnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNW+LIEWPIqiST5owmzru6hfmNGaRI1gDt5TMybyQIM=;
 b=A08nZJutE8zECEDCHIyRsxfiN6SxM3m1K6Hd11gGDSTyPT2A7TGXtQgqx0ZCa2iBd/LAItjz4k0JrdyRYvxwatzX1QQ3P4RdYmBkWaJceyyrBG8Cb1u4pKD2JK2gaaz1urUDWVgPQuNpJHLlAFpthaWzterR2rniU8mhzR6zvYmXuv74eTYxwpor6kAQPeOYtqzB80R6aSp6XAXaqiQXskur3YiaSruKvFC4lZ+NUnbO305eajJGZ5N0JI/GtgVMaMXxFOWPTZJvYaF9EAKQUhG1KqaXoN6bF9a0xNF0H5LcRHj0k0oP/Tqh7mZLEg5z06qID72iq5o0qORtlg+gWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 12 Apr
 2023 20:37:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 20:37:35 +0000
Date: Wed, 12 Apr 2023 13:37:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230412203732.l6fbwsnf2qfmohel@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230412142006.877109-1-jani.nikula@intel.com>
 <20230412142006.877109-22-jani.nikula@intel.com>
 <20230412180911.i5xoctni5mr2r24n@ldmartin-desk2.lan>
 <87bkjsdhsz.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87bkjsdhsz.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d67603-3cf6-4fb3-2de9-08db3b95bf50
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmjjaG2BRqVjMfCtlteOAoyW5R4fVv3bTBOo6O/VlY0FpQSRj75uct3fWqkSG6TKQokB6yctm2+h1MhQLsP4Xau3L+LNkm/R48c8xctMsrvUHdab7TanMe2IwqenfucDz8rxjN34NI//mLUmwu7iV7FUss8Nb1SY+MQCKjmJnsX+jpqnulsOgP3CeCVEfxr15PR6pxOezyzQT6i/bEtoF1eFN3ZbY2C0/aKp5yjZ9YRx0EYM/cn4s+nPyBXOpHZHDQL2ekWoHA5EeyEkttZBNprMEvbV1+d57Ld27Nm5bJRIM2L0Br7mpSfGGeTzdTSPms8AXXE6zidvwr7lsOCkChHlpWAWGRG8uItKOktHLxC3khZXuQQVga/DgL8ozxqhIBO1TFtHitvUrH3LDZ2SyC1vZVyXVK6ggpZ2ap/YtV3/vEcMa39o4s6f1CjItlqyYKv/Z3Mih2RWKdBi3x+LwZscrUC3ME55yrMsVCDr6rqd6V46Y+7TVASzBjfxQgrR6OezPYzEY4XLNRJdGRfPx7ZeeF7DgK3EDzyZEDpalmxR/4etxNonCNygKzKxUQTG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(6486002)(66476007)(4326008)(6636002)(66946007)(66556008)(8676002)(478600001)(41300700001)(316002)(36756003)(86362001)(26005)(6506007)(1076003)(6512007)(6666004)(9686003)(107886003)(2906002)(5660300002)(8936002)(6862004)(38100700002)(82960400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C8sGjfX6kX4DXfLH3FJkMWo4hK/ADgiz1I8hlO8Wc04LgOzoUg19+NZalVYE?=
 =?us-ascii?Q?0DJ9VStrHqd7rvZxWZJqO3QzDYDd/S8GrEH1l3ZUeX8exONnPALr6yaV2/pj?=
 =?us-ascii?Q?07Dieb5ifJg5WnyzO3c3A/RLtSVa7+8D9ULBc/cBwmJ0X7Yf0T6kc9THf2BQ?=
 =?us-ascii?Q?eWL7DBP4hHc37tOxKs77iizUEIzi+8oxPj73jh+lHe3v7t1h4WIzAir8KIme?=
 =?us-ascii?Q?R1qtfQGJknvEEEV81wJTFsobVZZp4q40yb3jxZPn7umPfnKgqvKtjqoxq2SL?=
 =?us-ascii?Q?eh9JnJoYNU6S3hAgPUqeyTPFzIdY0Tpo7roTfNJouELZnyptdT3uMyOjsbKf?=
 =?us-ascii?Q?SNtaomPS5Y/jmNNe7Q3TP9Ef29/QMz9O8lGtmHoXCFHdAj8NJmafXw91Sk4J?=
 =?us-ascii?Q?LDsxRFXcajl+U+bxkYUcxzT+V2KId7Or3ER9Szil9t1siGdrdCIPnpoUkiXG?=
 =?us-ascii?Q?+AYGQHvFnrtbwQu0XoR2F4KJ2bYycxdESUVB6t+qN0wuoxN3p+10TAjQK199?=
 =?us-ascii?Q?kcZYX9dMfij1gpUTuITFba88ibH9MQbD7V9cdiiGLb3h/3GJtPtZ+51CSw0x?=
 =?us-ascii?Q?B0g/SrfVnbKPQHGZMrU9cmN/MycauZ+cpO8dorhkFtR/TFJDhi1qqghElml4?=
 =?us-ascii?Q?aFb4kokwewdKCG5+xe5VF96R4b5+zJ++/fVaJ4rqRW8iRbEDJZzPsIjueRAH?=
 =?us-ascii?Q?piOwFMUnZf7fsxVfM2KiF+Vf8e5leAe5slkTZ4OByjWabVOoS4rA5o2EvQRY?=
 =?us-ascii?Q?VnVBot+WXcKg4Y/wacNFseNWve66MBzMS7Vo9FkuLY8o9HjnF74cN9gqAvRn?=
 =?us-ascii?Q?qTVw5wy0wZE/aXTtB4USrdZeSYo/clRwjTJlLjJvojTlUiKC+JnIN7Y2AGBF?=
 =?us-ascii?Q?LTAKf97o0JdHBYFw9pMEv5yKmwD9wZ+lT0oWCYKIcZkGm5j9h4lIWC0mjN/G?=
 =?us-ascii?Q?/5OECROz/8jbgBdwHnD7+S7SB6VkkP+j74kqt2mZBR+MKGbDsVybUGauSiYg?=
 =?us-ascii?Q?9HWMDkJ24msJpc+Ehkyt8nFm/thwGOmvYkdAtItGGKP8vYaBEttRpSt/V3LJ?=
 =?us-ascii?Q?t48lnQKET/2bmZSL700cv+2bcpynQ4bbzLZV8gCwGPLZuwsC9bJtcLT5Yi5B?=
 =?us-ascii?Q?zNuHn8BuK67vB5GhYV7/gIyI4rWhBTxPUBxueFWGPaOEfCmTXSjBC7eSkmrN?=
 =?us-ascii?Q?s83KGF9FOl9rbu6LqW0zWtqf9jQNN43t40cJxcSRhKG3+OCHukEG0W8+wXYx?=
 =?us-ascii?Q?tWFII6ljFfL4U1CHj5gXhQ6loDurMyKExHX4t+L7htR/Klq7zqQgJGS8uAK0?=
 =?us-ascii?Q?dy18q+ghVtfz/fXtnU+wg+IFRPjLIRK8Swap/wV8Hhhqo+sQz1npvqYGS+kH?=
 =?us-ascii?Q?0vKGQ4H7Gxi9zsNNUVrr2PPGIZLiRKtZtCoN1c0DjnLLxgY5MUS1f9D4ATJT?=
 =?us-ascii?Q?w08B6QrfqFhNDfApvUVQB/8gvwIHmo9/q20sp4hclDeDggCqw0RnHqbHmIP0?=
 =?us-ascii?Q?1htnjA9vgRe9pSlp1M8g9gvM1FoAoe2rMXkXtM1yX6JrsQEAmaqv+m6nxQU9?=
 =?us-ascii?Q?RIFMtxBVpzdOcYP2j1L8h37X1VPg8xt3zcxsOVWHGMdUix+91XTYUey2+k1K?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d67603-3cf6-4fb3-2de9-08db3b95bf50
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 20:37:35.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+K6nKmdxiEnSSVCvRdi0Gx40DgiaknBzUk8PS8lQHi/vyj67lMqJMIp0PLWTJm9YSdX/amjXvYEDRVfHeEBxbGi3/KzEYO13QKbav+ORYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 21/41] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 10:25:16PM +0300, Jani Nikula wrote:
>On Wed, 12 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Wed, Apr 12, 2023 at 05:19:46PM +0300, Jani Nikula wrote:
>>>It's okay to include uapi/drm/i915_drm.h. It provides us with structs to
>>>make stuff compile, even if we don't use them in xe.
>>>
>>>The placement is perhaps a bit random, though.
>>>
>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>---
>>> drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>>index 133c60cb3a09..c40bb27ac72a 100644
>>>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>>@@ -1,6 +1,7 @@
>>> #ifndef I915_VMA_H
>>> #define I915_VMA_H
>>>
>>>+#include <uapi/drm/i915_drm.h>
>>
>> my worry is that this creates an implicit dependency that ends up using
>> where it shouldn't, particularly when included in a header. Where
>> exactly this is needed? Can the include be moved to a .c?
>
>struct drm_intel_sprite_colorkey ckey member in struct
>intel_plane_state, in intel_display_types.h, and elsewhere. Can't be
>moved to a .c file.
>
>Without this, the member needs to be conditionally compiled, as well as
>all the code referencing it all over the place. Though in most places
>the code will just go away because it'll be unreferenced. But it needs
>to compile before being optimized away.

ok, it seems the alternative is worse.  LGTM

thanks
Lucas De Marchi

>
>BR,
>Jani.
>
>
>
>>
>> Lucas De Marchi
>>
>>> #include <drm/drm_mm.h>
>>>
>>> struct xe_bo;
>>>--
>>>2.39.2
>>>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
