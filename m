Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDACE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 21:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB8910E332;
	Mon, 25 Sep 2023 21:56:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F6710E332
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 21:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679003; x=1727215003;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2+YDmCcKzQ8W9NlikDBI/6wO72FM8cfaLaH63EQTCME=;
 b=D3YNd23SIiVyRlGVjO2aeQqI7inHJuuEP6Y4GRVJx7k0KWF42YChR078
 FZq1G2Rc1EQjSrOC0n1lJBnxSBcIkokpZvg7G1JJFRnYc7/+xTlubiouu
 L+KK5zl8b8zGhap6MFu7YYI9kG3/LtbMQrO42bVXy0bD2+dadJ2o7sFoy
 aM5dkeKqHTwCqPUkEMsGN7xhIfP5JaCj1jXdh0DK7Qn6yBjZ/GbYJmcEz
 1wkwBdHSKinWroBRhOoMNdKOSg4SAtnj4ng4oyWFvkKn13iH3upnILSK4
 6CsqGsgGr+7wIvtpY2+5zMMa6WHcIOAcUyRmkC+7pyyOuhWH1lPk+UOt8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412327250"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412327250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 14:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814181987"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="814181987"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 14:56:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 14:56:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 14:56:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 14:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OISLP397ofRTENAz7qfxNRr9npFi6sVqI2a945Jy7tw7cEotXckCxAjv2i8xRtOlNoHCOjIsZh0yt4I3v+0O3sE0HGxRoKflqplCBn9JyrvakoqyjbkYUpNSCdfA0cdoqafRuldemubtn9mVeSNXp7SvlBABujETzDVtLNWrQcKRjIFI2qzlzAbAIqEBpn/OHoQZflRX+IDaadQmHBwGxO0RKDP+Q6yfsql452AcCyhZ73r4MakYAcOZ/g3I3o5MQHGH4+NND6UGBqjYfey75xpU9U8HMz1trBqtYv9wlbzqXpPo84z4oUh+k1ODqhK1ZhSACp2NVEy1+tff1nwQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGuxw3lmdDWMBVE11gE1V6HpjeejiL8kyuWCuGFQD9k=;
 b=ZIx6rwx4mwwxe22jOF0JQFm+m0hCAFcp6kBl0zUHAPJFT8i+s7UUFSLGgvbLM9y9HnRiPDLpMsWZWr89h89ZFmrDAL0ZYXgHe9hPz5dbfTxpPa+ckdz00T6PoDlnyukpf2KinpmFRDNq7eONs5c1dyNXMTGmbBGFHQOwOVk9FmkDRx3XsIrwSYJQY0+qT76O0Shng4dz5lii4jWgz2EDCGH0BZrblVzCk8JjZeKObcQ6f/mhywU7R353vEEtGRZYRhonoJVEArSzwtRAFRnJnEerB/ZgxF02ae6jXaPkfWPKdUwM3L3kDRhYIfaLshG3ebMi/C1/CLSji0QqlsoI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 21:56:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 21:56:24 +0000
Date: Mon, 25 Sep 2023 17:56:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZRICA0f+00c6GGzY@intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914153112.455547-14-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f9facc-711b-4c86-4953-08dbbe124299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4HCnUAeGvBrZu+QaZaGQ+h4RwHsk5mb8WsjeWEvjAGPunUZvcdts1zS7a/CODNpMqzeHOmdtepZI8mIrGPQSdRfNguC5WPRmCTI1sLfuGPibEc3jsZ2Fz45/HP3VGp7ksPdygjanM8vkDxQD5/cuMcjTSYU/sg0PrEK9hPKzmdP9WQiBsMiW/Uaei7gZGxJB1nwhfN+Z3FgXrhAqlJo3dRIyhIG8dh6jUDAnRyvorv9og08YgSnmGub0wAQjqFJzSXeMJv9Nflka0e5KtXoSyY/+gxznUPHUce0hzn6sTb6PnBoEPhVvcL/A72RzMoKZTgbPAXVDGJosVQhAf5IgwfxM72V62N12o1ifRWL+y3OJM/tg7pxy+foO+2yxAwWs0mzhMJzaaA9VmGi2TK+1nZA9S3wK6QVNqTsCT8wPwlJJy+2ZHrCWUP4lTFmGg2ZZg+A8oFzEMDZ9q3+DkHNrALxbdYOTkFcTxYHEr7hEaiiajZJZCkJwgEvIA/cWk+WN8xibq8ycDPMyitBIEVqPAmiUSebC2i93yXK14owpuSGgd3YZQuGoDniylFkyjAOFr2JcUgO0nDpW9Oyq2ygruXhMt1R/NKZrQzXYp8D98TaaAgbtomO1ojSL9mGDEW5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(30864003)(2906002)(5660300002)(66476007)(44832011)(66946007)(54906003)(66556008)(478600001)(6666004)(6512007)(2616005)(107886003)(6486002)(26005)(6506007)(66574015)(8676002)(8936002)(4326008)(316002)(6636002)(6862004)(37006003)(41300700001)(83380400001)(82960400001)(36756003)(86362001)(38100700002)(21314003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5fkiyrN8zGOAL+g7vBPpXpfiKb07ohWkisglpHovmq1VVdnvr6wF2EeKl/?=
 =?iso-8859-1?Q?sjWRzwtN51XZdak15+3f9uqnE8uQ2e7aKYnJtuemVynntOQu6lJIw2mzBz?=
 =?iso-8859-1?Q?V9KAB63C8hMOdo0ufLjr5nuJP/l/stRm1P7sXs0IKF0Pj1pf+3r2s7Ml4m?=
 =?iso-8859-1?Q?88VP9OtLNrELV8YnhWlae6w+rwI4iYF7jTgKz61/KiHK7B1+zjDiKDiiHk?=
 =?iso-8859-1?Q?DL4wOijW1x6y6MMvD8zN0XVuE5MgvjfhAT0hoEdn3ou06DbWo90Fi6qenU?=
 =?iso-8859-1?Q?wA/PSBp6PKJo2tnV/uj/0YragHB0rx48DXXNyQ4AK9l/2s3/a0Uzh4cGDD?=
 =?iso-8859-1?Q?juqOo+2SVl8HLXuRMfshDp45RsHqSVxNk917Y9qP4Dqwk83aZ0+RvAzsI3?=
 =?iso-8859-1?Q?qd/zDkIdr9Yah0FYUcFpAzAlxTgeSKQhwJP0A4Lq/lIS2pO52/Llvq1r0w?=
 =?iso-8859-1?Q?xOZRbrUShAJmBHKrqqd2Yqr6vz5/q7g8dxiwV4TNxHNRpxVwWkWodFBGXM?=
 =?iso-8859-1?Q?XO9fgG/tk4imfD62AsiAzucE95J6aJKyTzB4eYrwAAwpqTefPz/t4gdd4t?=
 =?iso-8859-1?Q?HzW4IJGmTlAgYyDX8qtFDtBYziCvsUuNOgK0zON4663DTQSRMzIksY7lLc?=
 =?iso-8859-1?Q?5c0cEZh7sObvsYlm3nJOgw5nB4Ul7jT598Td8tkiUKYcfAs93FUKR4GhBy?=
 =?iso-8859-1?Q?zHjXKifLqSina6Aqpiql5LBo0yv6R5euZ9WMZvzca5zR5bDH8zxWFNl2fN?=
 =?iso-8859-1?Q?7U7ZhG/xfi5jyHuShGIJ7cywRocJ6QnftT8uNF2w7+B9TftFLA1mW148d8?=
 =?iso-8859-1?Q?ZfHtN7KHeD1S7qgcDHhHHmdxsoAHmOmbj6irlV4ZMuO9zSE7tUXLhHxzFC?=
 =?iso-8859-1?Q?WZ/8Dop0Qhu4eD94KXXWM34P0Gudsvd3UR2nQL109G0Zs1cvHQQWmHpEwB?=
 =?iso-8859-1?Q?kxwhKsxYa3JfpU5+ArZhFcFfxdRy9gJZ+5LBUE3UF5lOHQpTYTX4PbT9AH?=
 =?iso-8859-1?Q?s+7o8QqzHIeHG/w9SjAGxlAKjvf7DSFu7PzfdX5Q7GRC2CB3UQRIWna5n8?=
 =?iso-8859-1?Q?W/xTMvy29wT6SNONyxXVQUT5XUz2KDDKCl9rLri5TfmDcRO7nemqUd+Kyc?=
 =?iso-8859-1?Q?6t3ZU9pNajEtq8sFv/d9TAYK9X94IU8RDAPeLuc8OrlNoNkOeNye5OBfZ0?=
 =?iso-8859-1?Q?sBnRxKxrCCebHCAuQvMzKgt5yR2uzfciyqxWTxuT5E4tP7lrCU8S2Uji2I?=
 =?iso-8859-1?Q?dhxsU/TYKAlPtPtkMl1fxh/uuobc56qhGA3Oipvk7ZXuZzULs02o1REAE1?=
 =?iso-8859-1?Q?cx0Zsr9g4wKoC03N3xisczAdAOxlsnaoFNz1A9jOmTdExZfgVjAuDCLxfe?=
 =?iso-8859-1?Q?3/R5W+KmNP7qdtsSRh+JbVZaVXf25VS2dMyFg5vYJZ4Z8tL5poJjgzItJg?=
 =?iso-8859-1?Q?u2dsKyXyLL7rSQ3/CKOYf0v2+rpoj4kaBtRb10v3EKlRgBRTGQu2edJByL?=
 =?iso-8859-1?Q?iJWfRiOn1SDfoeDcpfbBgmVDmAhXeS1GUvxCj9dOMxbzUGvodZmH8Wjn/5?=
 =?iso-8859-1?Q?XY+t4C/kVn31uDYSoQvbud3QC423RlI8wGBN53uz9sCtEHFGNZSmPyKNdU?=
 =?iso-8859-1?Q?IZbiAHV1L+Yzchgzo/4rAEyKo4K43joK8D3XyR+Pc1K3skCA0cwp2PdA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f9facc-711b-4c86-4953-08dbbe124299
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 21:56:24.6823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iv5PogkJFBeNIGZt4XUZo0t+raMs2Piammxm12dCslGE9QhbCcpc/x9Yuc0M6S1720pXfwwu3LXK54EdJLgN6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/uapi: support pat_index
 selection with vm_bind
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl
 Zhang <carl.zhang@intel.com>, Effie Yu <effie.yu@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:19PM +0100, Matthew Auld wrote:
> Allow userspace to directly control the pat_index for a given vm
> binding. This should allow directly controlling the coherency, caching
> and potentially other stuff in the future for the ppGTT binding.
> 
> The exact meaning behind the pat_index is very platform specific (see
> BSpec or PRMs) but effectively maps to some predefined memory
> attributes. From the KMD pov we only care about the coherency that is
> provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
> The vm_bind coherency mode for the given pat_index needs to be at least
> as coherent as the coh_mode that was set at object creation. For
> platforms that lack the explicit coherency mode, we treat UC/WT/WC as
> NONE and WB as AT_LEAST_1WAY.
> 
> For userptr mappings we lack a corresponding gem object, so the expected
> coherency mode is instead implicit and must fall into either 1WAY or
> 2WAY. Trying to use NONE will be rejected by the kernel. For imported
> dma-buf (from a different device) the coherency mode is also implicit
> and must also be either 1WAY or 2WAY i.e AT_LEAST_1WAY.
> 
> As part of adding pat_index support with vm_bind we also need stop using
> xe_cache_level and instead use the pat_index in various places. We still
> make use of xe_cache_level, but only as a convenience for kernel
> internal objectsi (internally it maps to some reasonable pat_index). For
> now this is just a 1:1 conversion of the existing code, however for
> platforms like MTL+ we might need to give more control through bo_create
> or stop using WB on the CPU side if we need CPU access.
> 
> v2:
>   - Undefined coh_mode(pat_index) can now be treated as programmer error. (Matt Roper)
>   - We now allow gem_create.coh_mode <= coh_mode(pat_index), rather than
>     having to match exactly. This ensures imported dma-buf can always
>     just use 1way (or even 2way), now that we also bundle 1way/2way into
>     at_least_1way. We still require 1way/2way for external dma-buf, but
>     the policy can now be the same for self-import, if desired.
>   - Use u16 for pat_index in uapi. u32 is massive overkill. (José)
>   - Move as much of the pat_index validation as we can into
>     vm_bind_ioctl_check_args. (José)
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
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c          |  7 ++-
>  drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 13 +++--
>  drivers/gpu/drm/xe/xe_pt.c            | 22 ++++-----
>  drivers/gpu/drm/xe/xe_pt.h            |  4 +-
>  drivers/gpu/drm/xe/xe_vm.c            | 69 +++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm_types.h      | 10 +++-
>  include/uapi/drm/xe_drm.h             | 43 ++++++++++++++++-
>  9 files changed, 128 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 6b4388bfbb31..d3bf4751a2d7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(m->q->vm, pt, 0, XE_CACHE_WB, 0);
> +	expected = xe_pte_encode(m->q->vm, pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>  	if (m->q->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index aea26afd4668..7e4da16389af 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  		pte |= XE_GGTT_PTE_DM;
>  
>  	if ((ggtt->pat_encode).pte_encode)
> -		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
> +		pte = (ggtt->pat_encode).pte_encode(xe, pte,
> +						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));
>  
>  	return pte;
>  }
> @@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  }
>  
>  static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				     u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
>  
>  	if (pat_index & BIT(0))
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 7e55fac1a8a9..7981075bb228 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -31,7 +31,7 @@ struct xe_ggtt {
>  
>  	struct {
>  		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache);
> +				  u16 pat_index);
>  	} pat_encode;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 26cbc9107501..89d9e33a07e7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -25,6 +25,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sched_job.h"
> @@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> +	u16 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
>  	u64 entry;
>  	int ret;
>  
> @@ -196,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> +		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, pat_index, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -			entry = xe_pte_encode(vm, batch, i, XE_CACHE_WB, 0);
> +			entry = xe_pte_encode(vm, batch, i, pat_index, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -259,7 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>  
>  		flags = XE_PPGTT_PTE_DM;
> -		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, 2);
> +		flags = __xe_pte_encode(flags, pat_index, vm, NULL, 2);
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -454,6 +456,7 @@ static void emit_pte(struct xe_migrate *m,
>  		     struct xe_res_cursor *cur,
>  		     u32 size, struct xe_bo *bo)
>  {
> +	u16 pat_index = xe_pat_get_index(m->tile->xe, XE_CACHE_WB);
>  	u32 ptes;
>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
> @@ -494,7 +497,7 @@ static void emit_pte(struct xe_migrate *m,
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>  				addr |= XE_PPGTT_PTE_DM;
>  			}
> -			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
> +			addr = __xe_pte_encode(addr, pat_index, m->q->vm, NULL, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> @@ -1254,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>  
> -			addr = xe_pte_encode(vm, pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = xe_pte_encode(vm, pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a1b164cf8bce..7dd93cbff704 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
> +#include "xe_pat.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> @@ -67,7 +68,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
>  	return pde;
>  }
>  
> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
>  {
>  	struct xe_device *xe = vm->xe;
> @@ -85,7 +86,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>  	else if (pt_level == 2)
>  		pte |= XE_PDPE_PS_1G;
>  
> -	pte = vm->pat_encode.pte_encode(xe, pte, cache);
> +	pte = vm->pat_encode.pte_encode(xe, pte, pat_index);
>  
>  	/* XXX: Does hw support 1 GiB pages? */
>  	XE_WARN_ON(pt_level > 2);
> @@ -103,7 +104,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>   *
>   * Return: An encoded page-table entry. No errors.
>   */
> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>  		  u32 pt_level)
>  {
>  	u64 pte;
> @@ -112,7 +113,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
> -	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
> +	return __xe_pte_encode(pte, pat_index, vm, NULL, pt_level);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -125,7 +126,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  
>  	if (level == 0) {
>  		u64 empty = xe_pte_encode(vm, vm->scratch_bo[id], 0,
> -					  XE_CACHE_WB, 0);
> +					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
>  
>  		return empty;
>  	} else {
> @@ -358,8 +359,6 @@ struct xe_pt_stage_bind_walk {
>  	struct xe_vm *vm;
>  	/** @tile: The tile we're building for. */
>  	struct xe_tile *tile;
> -	/** @cache: Desired cache level for the ptes */
> -	enum xe_cache_level cache;
>  	/** @default_pte: PTE flag only template. No address is associated */
>  	u64 default_pte;
>  	/** @dma_offset: DMA offset to add to the PTE. */
> @@ -594,7 +593,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		pte = __xe_pte_encode(is_null ? 0 :
>  				      xe_res_dma(curs) + xe_walk->dma_offset,
> -				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
> +				      xe_walk->vma->pat_index, xe_walk->vm, xe_walk->vma, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> @@ -720,13 +719,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>  			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> -		xe_walk.cache = XE_CACHE_WB;
> -	} else {
> -		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> -			xe_walk.cache = XE_CACHE_WT;
> -		else
> -			xe_walk.cache = XE_CACHE_WB;
>  	}
> +
>  	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
>  		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 0e66436d707d..6d10823fca9b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -47,9 +47,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  
>  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
>  
> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>  		  u32 pt_level);
> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ba612a5ee2d8..98db7a298139 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -6,6 +6,7 @@
>  #include "xe_vm.h"
>  
>  #include <linux/dma-fence-array.h>
> +#include <linux/nospec.h>
>  
>  #include <drm/drm_exec.h>
>  #include <drm/drm_print.h>
> @@ -858,7 +859,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    u64 start, u64 end,
>  				    bool read_only,
>  				    bool is_null,
> -				    u8 tile_mask)
> +				    u8 tile_mask,
> +				    u16 pat_index)
>  {
>  	struct xe_vma *vma;
>  	struct xe_tile *tile;
> @@ -897,6 +899,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			vma->tile_mask |= 0x1 << id;
>  	}
>  
> +	vma->pat_index = pat_index;
> +
>  	if (vm->xe->info.platform == XE_PVC)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> @@ -1195,10 +1199,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
>  static void vm_destroy_work_func(struct work_struct *w);
>  
>  static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				    u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	if (pat_index & BIT(0))
>  		pte_pat |= BIT(3);
>  
> @@ -1216,10 +1218,8 @@ static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>  }
>  
>  static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				     u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	if (pat_index & BIT(0))
>  		pte_pat |= BIT(3);
>  
> @@ -2300,7 +2300,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u8 tile_mask, u32 region)
> +			 u32 operation, u8 tile_mask, u32 region, u16 pat_index)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct drm_gpuva_ops *ops;
> @@ -2327,6 +2327,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
>  			op->tile_mask = tile_mask;
> +			op->pat_index = pat_index;
>  			op->map.immediate =
>  				operation & XE_VM_BIND_FLAG_IMMEDIATE;
>  			op->map.read_only =
> @@ -2354,6 +2355,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
>  			op->tile_mask = tile_mask;
> +			op->pat_index = pat_index;
>  			op->prefetch.region = region;
>  		}
>  		break;
> @@ -2396,7 +2398,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u8 tile_mask, bool read_only, bool is_null)
> +			      u8 tile_mask, bool read_only, bool is_null,
> +			      u16 pat_index)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -2412,7 +2415,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
>  			    op->va.range - 1, read_only, is_null,
> -			    tile_mask);
> +			    tile_mask, pat_index);
>  	if (bo)
>  		xe_bo_unlock(bo);
>  
> @@ -2569,7 +2572,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  
>  			vma = new_vma(vm, &op->base.map,
>  				      op->tile_mask, op->map.read_only,
> -				      op->map.is_null);
> +				      op->map.is_null, op->pat_index);
>  			if (IS_ERR(vma)) {
>  				err = PTR_ERR(vma);
>  				goto free_fence;
> @@ -2597,7 +2600,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  
>  				vma = new_vma(vm, op->base.remap.prev,
>  					      op->tile_mask, read_only,
> -					      is_null);
> +					      is_null, op->pat_index);
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
> @@ -2633,7 +2636,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  
>  				vma = new_vma(vm, op->base.remap.next,
>  					      op->tile_mask, read_only,
> -					      is_null);
> +					      is_null, op->pat_index);
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
> @@ -3146,7 +3149,23 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u32 obj = (*bind_ops)[i].obj;
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
>  		u32 region = (*bind_ops)[i].region;
> +		u16 pat_index = (*bind_ops)[i].pat_index;
>  		bool is_null = op & XE_VM_BIND_FLAG_NULL;
> +		u16 coh_mode;
> +
> +		if (XE_IOCTL_DBG(xe, pat_index >= xe->info.pat.n_entries)) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
> +		pat_index = array_index_nospec(pat_index,
> +					       xe->info.pat.n_entries);
> +		(*bind_ops)[i].pat_index = pat_index;
> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +		if (XE_WARN_ON(!coh_mode || coh_mode > XE_GEM_COH_AT_LEAST_1WAY)) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
>  
>  		if (i == 0) {
>  			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> @@ -3188,6 +3207,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
> +		    XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COH_NONE &&
> +				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, region &&
> @@ -3336,6 +3357,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 addr = bind_ops[i].addr;
>  		u32 obj = bind_ops[i].obj;
>  		u64 obj_offset = bind_ops[i].obj_offset;
> +		u16 pat_index = bind_ops[i].pat_index;
> +		u16 coh_mode;
>  
>  		if (!obj)
>  			continue;
> @@ -3363,6 +3386,23 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  				goto put_obj;
>  			}
>  		}
> +
> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +		if (bos[i]->coh_mode) {
> +			if (XE_IOCTL_DBG(xe, coh_mode < bos[i]->coh_mode)) {
> +				err = -EINVAL;
> +				goto put_obj;
> +			}
> +		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COH_NONE)) {
> +			/*
> +			 * Imported dma-buf from a different device should
> +			 * require 1way or 2way coherency since we don't know
> +			 * how it was mapped on the CPU. Just assume is it
> +			 * potentially cached on CPU side.
> +			 */
> +			err = -EINVAL;
> +			goto put_obj;
> +		}
>  	}
>  
>  	if (args->num_syncs) {
> @@ -3400,10 +3440,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u8 tile_mask = bind_ops[i].tile_mask;
>  		u32 region = bind_ops[i].region;
> +		u16 pat_index = bind_ops[i].pat_index;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, tile_mask,
> -						  region);
> +						  region, pat_index);
>  		if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index dc583f00919f..54658f400174 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -111,6 +111,11 @@ struct xe_vma {
>  	 */
>  	u8 tile_present;
>  
> +	/**
> +	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> +	 */
> +	u16 pat_index;
> +
>  	struct {
>  		struct list_head rebind_link;
>  	} notifier;
> @@ -338,8 +343,7 @@ struct xe_vm {
>  	bool batch_invalidate_tlb;
>  
>  	struct {
> -		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> -				  enum xe_cache_level cache);
> +		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u16 pat_index);
>  	} pat_encode;
>  };
>  
> @@ -419,6 +423,8 @@ struct xe_vma_op {
>  	struct async_op_fence *fence;
>  	/** @tile_mask: gt mask for this operation */
>  	u8 tile_mask;
> +	/** @pat_index: The pat index to use for this operation. */
> +	u16 pat_index;
>  	/** @flags: operation flags */
>  	enum xe_vma_op_flags flags;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 737bb1d4c6f7..75b42c1116f2 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -605,8 +605,49 @@ struct drm_xe_vm_bind_op {
>  	 */
>  	__u32 obj;
>  
> +	/**
> +	 * @pat_index: The platform defined @pat_index to use for this mapping.
> +	 * The index basically maps to some predefined memory attributes,
> +	 * including things like caching, coherency, compression etc.  The exact
> +	 * meaning of the pat_index is platform specific and defined in the
> +	 * Bspec and PRMs.  When the KMD sets up the binding the index here is
> +	 * encoded into the ppGTT PTE.
> +	 *
> +	 * For coherency the @pat_index needs to be least as coherent as
> +	 * drm_xe_gem_create.coh_mode. i.e coh_mode(pat_index) >=
> +	 * drm_xe_gem_create.coh_mode. The KMD will extract the coherency mode
> +	 * from the @pat_index and reject if there is a mismatch (see note below
> +	 * for pre-MTL platforms).
> +	 *
> +	 * Note: On pre-MTL platforms there is only a caching mode and no
> +	 * explicit coherency mode, but on such hardware there is always a
> +	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent with
> +	 * CPU caches even with the caching mode set as uncached.  It's only the
> +	 * display engine that is incoherent (on dgpu it must be in VRAM which
> +	 * is always mapped as WC on the CPU). However to keep the uapi somewhat
> +	 * consistent with newer platforms the KMD groups the different cache
> +	 * levels into the following coherency buckets on all pre-MTL platforms:
> +	 *
> +	 *	ppGTT UC -> XE_GEM_COH_NONE
> +	 *	ppGTT WC -> XE_GEM_COH_NONE
> +	 *	ppGTT WT -> XE_GEM_COH_NONE
> +	 *	ppGTT WB -> XE_GEM_COH_AT_LEAST_1WAY
> +	 *
> +	 * In practice UC/WC/WT should only ever used for scanout surfaces on
> +	 * such platforms (or perhaps in general for dma-buf if shared with
> +	 * another device) since it is only the display engine that is actually
> +	 * incoherent.  Everything else should typically use WB given that we
> +	 * have a shared-LLC.  On MTL+ this completely changes and the HW
> +	 * defines the coherency mode as part of the @pat_index, where
> +	 * incoherent GT access is possible.

with this in mind I noticed that on i915 the scanout is just a pat param to
the uapi, while in Xe we have a buffer flag:
XE_GEM_CREATE_FLAG_SCANOUT

should we continue with this flag, or should we do the same pat.param that
i915 is doing?

> +	 *
> +	 * Note: For userptr and externally imported dma-buf the kernel expects
> +	 * either 1WAY or 2WAY for the @pat_index.
> +	 */
> +	__u16 pat_index;
> +
>  	/** @pad: MBZ */
> -	__u32 pad;
> +	__u16 pad;
>  
>  	union {
>  		/**
> -- 
> 2.41.0
> 
