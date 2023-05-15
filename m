Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67206C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233C110E1D1;
	Mon, 15 May 2023 13:15:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E210E1D1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156524; x=1715692524;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V1AXdO5DSfdJCzLmUoat/v5+w+LTdzTOoLSY9LHEH9o=;
 b=EDkU72NF3iWJHVU/jktrHHViC/RbBcq8HYg6PQKXszNrywbDa6GlyOQE
 SSu//IOSc1sR0SSqZAeGQcy2BZtpNi8GjQFJRmhWmfDqXaeoxaqp8L8c6
 iDSt8Aw/g/uV+Uv2EeFYVr0ote83Yq5Wq4OWy25yifKfCQwJrTBmU8biJ
 8rKgbPfa/z5zivnVbWBfvjWG5wIdv06ejdE9e40tawBmQFu0ELBzhcA5D
 +FzwboWVAxsEAE6NGPiVxv1+YQmcsjVGb20bRz9OzxXJVkU4auMFaTRra
 ueFdEECYzlfa5rCaflJWjohU6EwBevIBjkyWpiEWO5iJZFC7lmajv6Euw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354353732"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="354353732"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="770615235"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="770615235"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 15 May 2023 06:15:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:15:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:15:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:15:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlagffiTmLq7QyYGAK04LFFJuat2V481wGlc7iasCMWmKLQINel1UQ9xlmGfzYkEugIxfpDCod8pa++M2Bl1GrPI12cjkILQ+KwzwGJeIec6PyguNQG2LZrOgV+naO4HsI5/3T3gmkTEyd2v1oEVuiQvBHpmF6ZnnkZrF3t1Nv26eNc91nvrwyvUI6TvGgQrD2vAH825GY4n+PRT1p9V1r4fxJtLDUEz+igDvrKOuU4FCDYPPFFP5Kdu1tNdEVAQX6yS9dO0SGssDe74DLhYdP2xcc/AW+Axv0NAJMtUrIJxRQfa8ehrFBM+AMCNWvnxeL+3Y3V68Vo4TCtqM7n4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FMtZZcgrAKZMfkiZebbMd+v259ztvTkyFgUwc+Ic3M=;
 b=BSnzHQUtY8VY1NH//e50wjn5tchuoGD0EUNT5wxKDTBvZJfyiI7a/vax+LUwCOoVXEm/hsh4anMzZTYkF4SHo5SWOcAlU0/eKl3Rv7rWT4vTnDDWaNxKefDnPtBrsMqHFlZ9tbQv8vLHMvE6Nc/Dq21g4jVHmWXmAGLiVTJMakm8uZbNfuuUg0TbPX+Hjw0D8/GcKCxqPSYtNmyToXyTygQjiHhe85LvSEgfdt85oR92c1grIM6H52CDJe58qV2aYy9d2PqrVhYXdBLxzQKgO4XDcle6g9nIL8SxSqfrMSQYMxrYsB7x1x25C8L4C4Q9HfNh7A3IyrBuhiBMukb1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:15:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:15:20 +0000
Date: Mon, 15 May 2023 06:15:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <w6o7d5izmljw5xgtamc2lbfcvzc5ypckq5oep3zrtc6tc42ees@jlhgnr2ykn4y>
X-Patchwork-Hint: comment
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512180313.1765011-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:303:16d::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 878be124-1aa3-4a71-6638-08db55466f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbfir21Q8h016qqSahQrihGb9Utc76G0s0iR8wsW5mSaVi5Mj0mzb/yfPgoG/gp/BoDECmpfk4sC71unRNeoiviEMHLDpFNhtwRP4KufdRJ/wwATX6lJSFqicjUdT/C2nKj8gqB5EzrxJ21qT39i/8VAe3vTG/DEZzmAURJ0JC8c7HBhfGo2FIoKKo18fxDnxHEyHzMQHGMU5s0xFRilvVu3U1If9ryX67XvvMW4YTE+sj8DqAcFEXp3bNGkyzXhSRAvVhAk0vyVGj8rScKnFF4Hmw14AmJ0TIKK5B8KrK1LwV4cNxqKw3VcTS5uOEEDYkZJ2tW1TH8/IIq2gw5+p+U/KnBFDFHwHUXd4d2SPcOMDqswG+SoKSE7B3iFq7Q97fv8S4Ko1WsPEMNKxPodmIuykWyB48rM+3jZBQM0ZZjoWAcicYjxKLyDzs/AnpKMOwSumFQK4hQ8miF5w7sShaYkBltSiu9GdfniDTqDsH/R+eRrSkuwBWYabri+OwXBxv05YkvQ+/g7XO7WVKwVYz7BfoU83dZRne7eov5FtlvlQ6tR7n7AOGWrgNz8F00u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(33716001)(83380400001)(66476007)(66556008)(9686003)(66946007)(6486002)(26005)(6506007)(6512007)(478600001)(186003)(5660300002)(86362001)(6862004)(8676002)(8936002)(2906002)(316002)(6636002)(4326008)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVNTS84ZU16UXNDYVBjakhPcmJPVmdacnM5K2lTanhzUytLa0hMaFgyQW1h?=
 =?utf-8?B?VnVudnZFVjRQdzBTT0o1cVJYSDg2K1BkUUNjNnAvUFovVEVlQUo2eGJoNHRR?=
 =?utf-8?B?VTVIOHAvNXpCTHR4OE9oU3VZczJIeG9CZndmdU1pbEJ1SGR0bWs3ckZzQ1Ba?=
 =?utf-8?B?emsvVGcydkM4ZEtxSmxOWVUxOGFHT2ltNmMzS1Z4VFRHSFlIYUoxWGFZRENS?=
 =?utf-8?B?TG1LNnVabHhXT1pwbndBZVRYQzMzSThWVGF2TnhtT2RQcmNzVWFIVXV6a1Rh?=
 =?utf-8?B?U0t5UGVyS0J2ZjlueGg1WEYrczc4UFJmYnVGb2wxb21sNC9RakEyNUdBN05a?=
 =?utf-8?B?K1I1RGc2OFlEcCtZVU9RZWVRRndrWFplUDlZNGhLOC91Q05LTitUR2JBY2N4?=
 =?utf-8?B?Z0VWTDg4bFBiY2R2MzBmYW5xMTFyQ1JrbkNLdmZBTXRiT2RyanJyQlFxYzFN?=
 =?utf-8?B?SXFZTkZRaUJLUFdrYW56NmhQc2RtdEdCeElTOHQ1L0lkZU8rTlgzRWM2ZlEw?=
 =?utf-8?B?b0Q4SUpSemwxSy93TUluSlhZaWZvTE5BUm5ORFo2NjhVR3V5S0NvNUYwMTUr?=
 =?utf-8?B?WjZmWnd5bjhKZXcyZytscFlTaEQ0akM2M2JqcmxmZWt6STlkNiszanBKZkll?=
 =?utf-8?B?c1hTZmhBcmUzejl4dDBsUVRmUjRqVmxrMDZDNjdHTWI1Wi9nQUIyQjlIak1J?=
 =?utf-8?B?b2liU1E2a3N6YW5FRk5JZ0FHNHdDRG5CMklzU3hpcDdMaElDMEc0Yy9ZMUFB?=
 =?utf-8?B?TU9ZYTEwYnltRGRhZklRRXFkUEQ3Ky9vN05YbTYwOERGT2liVTlCemhLVzd2?=
 =?utf-8?B?TGJQZmtLMVFuR2ZjOUp0OEhSeXF3YzN2WVNUUDI3NC92MHRtNktvNVBNN29x?=
 =?utf-8?B?Njc4MXpGSFRuek1pM0pkOEhyKzJCcVlGRzlMSXpNTTRWRnpNbzBTU01IbXQv?=
 =?utf-8?B?MkpaUWRwZWhockw2dFk3cnBaOFhSNVhENzVsY0ViNGtmeWdoTnZiQXFlNTNK?=
 =?utf-8?B?dEcxM3htY3FOOHkxY0dkcmlvaS9ZOFVIRWNKVThoTGdPbVl2NTJQMEZmeXRY?=
 =?utf-8?B?R2tsampjdXRXd0FuSFZNOUxHRGJBVkNJa0xxM3dHb3kreVl6azcwdWFCcXdE?=
 =?utf-8?B?blZzcE9uSjBmYVd1WXFhSjhEd3FLNlYvMnhqTFVJd3NiV2R2TzhSWnBkQm9V?=
 =?utf-8?B?ZEF4VEtPakhKV1N2dnU1aDdOM0w5T2VSbk1pSDF2cFM3bGg4em5mcC9RTVND?=
 =?utf-8?B?R21veTFqNkM4NTd0eXVUNWtZUkhVSlk3cDFhYllkbnQzS1ptS2VHVkpvd2Ev?=
 =?utf-8?B?QlBIZFZNMHhmWkhWY0hzWVFHMzB4dE1CaTRNN3JJZkhsRGdSN1p3dzN0ZldJ?=
 =?utf-8?B?RE14dW1jMS9zZnZFZHpjM1lRQm9hRUtjQk1yTHVBNmE5aktDNXlaRWk1T0NC?=
 =?utf-8?B?K2VEZSt3d3pEQURyOTZadXZPcENZY21LQXA2OElURWV0Q0JwbUtlMGRqVWRS?=
 =?utf-8?B?anM5NjNvalJpT1dSdWNEYWd1ZmQrZUNwK1N3UHBpOUQzR1REZS90anhsem40?=
 =?utf-8?B?SVkrRXJ0Skl2eEl2YkNiM3FCaFJROUlTWjkwdDNVUDBpY2VUREQrb2NMbWRV?=
 =?utf-8?B?c0UrNmtKS3pwYWs4eFRtYW41WERSSU5RTVdRYldtQ1VDajBGempuZHV4NUpJ?=
 =?utf-8?B?MWZXNU1Ya01YWmlsa0hsR0NuOHoyUGdQOUpzb3pwSW1LUncyeStEbjQxUXZu?=
 =?utf-8?B?WDhGaTBIZy92Wi9iY0N0VzJRVGx5bC95R0VYNDNLWHhETGlkU215bWt6Zjkz?=
 =?utf-8?B?MmdBZGpCQnFUZWJLZmh5Ti8vTDBnbDdIVC92eGVWTjVRVUw2clk3TnBFaFlX?=
 =?utf-8?B?RUw3Wm5Nb2RQTDl5OFlLQU16QWxSMk1NNkI3cHVEZFVPMXFQcGZNUmRPQ3d1?=
 =?utf-8?B?WDk1RkRuN3ZXVzU1bjdaU3o0NUJHSEpnTCtnRmErdGlkWHdhQlpjODQxSG5M?=
 =?utf-8?B?a1dBUkFHb3BuQjQvS0JRVDZXQktneEUrZ25Mc3NNaU1NV3VnTEJsZHB6Tldu?=
 =?utf-8?B?S0ZYNzlmUGN2dzdJSkR1OFlTOEEwWmRpRW9GanlZR2ppVnlIUnFrd2d6TXhm?=
 =?utf-8?B?QUNKQW9JV0FhMlo1dlR5TFBaSGJ2RWhNL0I1K2JmTkN1L3doRmk1dzVyU3Ey?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 878be124-1aa3-4a71-6638-08db55466f05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:15:20.3803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHunm43sKMWMrd4Gl6Jz7gl6d/kd8K8z6A4UIkhLfrLIgDYhFlIWzFbodoA9k07+FvvCwScZRsQRVhrhrmBF1gEv/wtm8KyNkVHdGCoTD0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] fixup! drm/i915: Remove gem and overlay
 frontbuffer tracking
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

On Fri, May 12, 2023 at 02:03:12PM -0400, Rodrigo Vivi wrote:
>drivers/gpu/drm/i915/display/intel_sprite.c: In function ‘intel_sprite_plane_create’:
>drivers/gpu/drm/i915/display/intel_sprite.c:1630:34: error: implicit declaration of function ‘INTEL_FRONTBUFFER’; did you mean ‘SNB_FBC_FRONT_BUFFER’? [-Werror=implicit-function-declaration]
> 1630 |         plane->frontbuffer_bit = INTEL_FRONTBUFFER(pipe, plane->id);
>      |                                  ^~~~~~~~~~~~~~~~~
>      |                                  SNB_FBC_FRONT_BUFFER
>cc1: some warnings being treated as errors
>make[1]: *** [scripts/Makefile.build:252: drivers/gpu/drm/i915/display/intel_sprite.o] Error 1
>make[1]: *** Waiting for unfinished jobs....
>make: *** [Makefile:2025: drivers/gpu/drm/i915] Error 2
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_sprite.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
>index d9713094735b..718fe026c5f7 100644
>--- a/drivers/gpu/drm/i915/display/intel_sprite.c
>+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
>@@ -46,6 +46,7 @@
> #include "intel_de.h"
> #include "intel_display_types.h"
> #include "intel_fb.h"
>+#include "intel_frontbuffer.h"
> #include "intel_sprite.h"
>
> static void i9xx_plane_linear_gamma(u16 gamma[8])
>-- 
>2.39.2
>
