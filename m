Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9A7C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AD910E1F7;
	Fri, 26 May 2023 21:13:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064F10E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135591; x=1716671591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j8ADX6QK6Ddk2+Kk1xdL8FR54B8z6iowhKZb11cJQ78=;
 b=Y2Z1wcIDnJRK2NKqSCFO8o/qloZddlYpC/zRFrWRvbZRDNZoIl6RRs3x
 wputVRqokyX2Hjq6Y4pZUOxHvFzlzp+9+SylpeE6yXJPQiI/gxjRMclnM
 sZ5IU6Kip7B1346WmVQmgk1IBzLkYPX2/UwAGV4hY14uU8hPMmXGyOTwq
 4ilHIPPTtZL9S38q07iudMn8xzrX4XjoxmkzgDFlv/2LoBExs4o0vA9H3
 5dzh38Puyna1tT56af1OgmWuLomDuzqGQxzu+YNntTUJNtyxYixOXq92R
 k0rmxQnTG78MRSDrc4qJV0XoekNMzvCTFD3AcK25FpiGxIzUr20RnusRD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343802503"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="343802503"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775208900"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="775208900"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 14:12:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:12:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:12:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 14:12:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 14:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj60Od4gPnaRr7C9U0E4xsKs0jxhMwYh+MWMNTimo+SfRx7Lw+OLFOn7EPrUBKTSFGOVR06ftyVoMmsaWv1p2u7rbDDAwdDEGFbx0IzINGgTepC6jxcZdMJ8bmC5YdGq35Zq3YsM4h9T3d6ix3wlrTB+Lrs90E/R+6R+iy6BBcO9VgNtQ/zhNuMVP6HEE8Q2vV3J3ZR/GAfSjU/vnGTYB4ohiPrRdc4GYnSufPXsSKUlomyFdcYAmJCDD74+CX8j6xPix6sJSg4Yu98JOUYBvg6lLA/ptv5CFxgYgBEofzjnTeQeqWeZ7iBlSnZNMxYGEeiVwgsEnCi9/nPbzJIu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmTrK5O++ptmh60XZbQ/N3ASCd5kApiCDw3LGyglGlI=;
 b=fDn/UXvEFImpqF684tVuUVf0sRVSKhJASS2zNI346E3SeVOKmXj95cGKEFRUNFWTCg9f0Fgx429hw3UxstdEld1X88xS2WL/e0EUU3HBR+jYtEaygvsaAXkSKYYWJP4NVw7srM6B0weETPXPfvrOJ5Nu2ZzrZLqphjFrjdZBKszEEwpLQIJxIg2FV7k9NdkUVcZqrlwq30+kbamDYNInUzHMxrz5wHwKNIXs2Se160Whvo67PTlF5Z+kcH5zkMomPqO6ay/YbhljgTM41vtHkZSLKVmU1mzl2tciy/kiA4Vlk/pSs+26r4LKWCAWas47uInqy70oIOkES0K09+Ufpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Fri, 26 May
 2023 21:12:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 21:12:41 +0000
Date: Fri, 26 May 2023 14:12:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <hdf526qtmjb354byej2xmjaufytd423yvckbbpkhavciejix56@r2bt45uqln5q>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 800c41c5-9186-46d3-131f-08db5e2df09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaSfw3sy373zsWjiv1LjEvAyTTksgIGxHuGZvM5XPXqklNjtEpM71ORAH1GReCvqX/UO1pqrB6czRzmeWYwkY897/3kTlkY9yC4MqGeQk5xZuq0cmSbIdfhDxdAYZjJkWyCPuhPK7VW7/BklzFoZa1SRHvvajyNMQaeWQl7D7hSHoZ5HnEgHIxEZOAh/pnYOFyLAVQmS/WGg1YD40eubBkNRYjkGKW47NHi9a2Or7Ck8F4kPc2d7cFyUKqhXWGCy/NGShSLEm0B+1Ej/tGMB2EhMt6Ug83ogdUnVHpthPEko9fla6L/ap57t51yl0UIfIGYoCHie1GagloUsyDtxXhGrY45WTMvaGA9WfnNLIh9L7xV7COtTDlfa/b4TxzCvhnClHC1+0JcXnLjiIVKzcBAiTaFhvWefscYuUh+/Svul66zOKi2hdHQH5p58NALPEMbUb5Q2COZgAA7PnUjAsNT/wSiRDav8jvt4OQo/bxEBl9lABHtOhNV/fvtryDsv1qvXRwHQ9t2mr6SQNC4tJVb6qUayPnLM1lbvjJIfFHaZJyvl6PZRsaYIHigkyBNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(6636002)(38100700002)(4326008)(66556008)(82960400001)(26005)(9686003)(6512007)(6506007)(66946007)(316002)(66476007)(41300700001)(8936002)(6862004)(8676002)(5660300002)(6666004)(6486002)(33716001)(83380400001)(86362001)(478600001)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hGnchO6HZt2ejC9pjD1pHdmA0N6CAc4FBZ+7LAuhSbq6bjrXqs+SeIZYAQ+?=
 =?us-ascii?Q?PrlbmaygAGRILp+UkzvxDzvjkphjHyw57QGFZQJwBNM/TLUigHk1kSYf3Zom?=
 =?us-ascii?Q?SBPhKPOOU4prUZylz/bXA88aEWL7OqwEwsGNUQ6vgQxgsMKuhhfbnzrSUS4Y?=
 =?us-ascii?Q?/ye3uZLvHjC3vYANBQ0Bf3+YLfCWPxoDvbbYLlDKm4w2MJ7Rbh3Bh2mo3zBf?=
 =?us-ascii?Q?LawFxn9nslP43WEcBm5p3JJYyrX8f42+AiSnfSuz4r8Ne0xH8v9g0+ORWuZv?=
 =?us-ascii?Q?dZsnKyucJ+0H4kDlrIokoP5tbTov8zaZwpWYjWyYG3ERrbEiIteg20+3bsHe?=
 =?us-ascii?Q?Re4G0w7dSvjZI+KS0fKDQhKHbuPSvZj7liua0AmIl7uhbsQQm859AKS60jaF?=
 =?us-ascii?Q?+Zig/7SC6y+1EIzO0WQji0wXLb43J1QKz384zlSJfJ93yQN1B+MTHd3ZKNPE?=
 =?us-ascii?Q?QAygV3N+XmqAZQdPLh7BRiDxPFoZGgNak5u1dbroEBr6KBWO2vzH/jTHfMbk?=
 =?us-ascii?Q?hp3iK1RSdrkFcbeKJElVTYyxJMWk+AJgxMdoF0tUmTM/YKT1FYdRcCs7Z+d4?=
 =?us-ascii?Q?73+LJRFFjSVKc6I/XrE9k/maG8Wqu6JIMh4xSuPx+DSkBHEI3yL/svofMUrv?=
 =?us-ascii?Q?CB87ktZkK7gYAd/1DRqFitedViaui/GPs77D+nmWo/0CWeDGW/QCXis3b8GG?=
 =?us-ascii?Q?ybY3Gq6Fc1y6DA4zAOAujIi1I/7aYcA8gQEuvzooLD5LGenq+NLvrmGme3BY?=
 =?us-ascii?Q?If2yTz8bj3VrJOt1VC1hagt9SMNtx71/TIdUxwC6hvobZo2kD5/C7UG7Ty3B?=
 =?us-ascii?Q?coyAPtKh6QwZ4CfI4QrHGd3vm7bXzKbQc8YAski920OaVmuSLZAH1j+RyPko?=
 =?us-ascii?Q?a5wIHNFztlf7pKw/FTrrAVxl382mhb9dBrBVt1kDM+w8Jply/qbmgeTZ8pu4?=
 =?us-ascii?Q?1SXk6gNwcFHg0t7oRz4XRXdZ2QP/IZ8GAOl29u0Ego91dS2C/PqzBvNLYK22?=
 =?us-ascii?Q?+17yociPl8yLZ9krsP0rCee3YcdQcILqAwjvbtMLt1CGAw4FM6fsK/NWn6rB?=
 =?us-ascii?Q?mvjsxEGwmG3z/a0wA2FAxQhXzq1m5uOfeJsx5FSxFES6igVGeqXvELELaFT1?=
 =?us-ascii?Q?hePp2c5RhAcZDS1AeLBbYdjoRunjLN8amQz/lYKzAGBCzBAS4JUtjSBTgniw?=
 =?us-ascii?Q?/kayZkjnTJLkTNIcszfIjAPIAKcOVuuy+BOJ2ERfReBnruL1KcAd5jZJ74ue?=
 =?us-ascii?Q?z6NxiXw6dmtXhcMpHVnh1P56uV/glm8hr39rRKasDgGYsWewLuqjs2ZyURgP?=
 =?us-ascii?Q?vZ4IRxGgfVgl9mbCWIo/zH1ckr5TMUzz3o2NULRHo0dbfjyNl/863D+rYTPC?=
 =?us-ascii?Q?IP43zaXYGtwabr1+4Co4yBGKJL6vm4mQz9OOPzAsORY9raX2K0EbwJLh4cs7?=
 =?us-ascii?Q?G0VnIwK9ZXPFzyfhXWwczminAbjV+pBZofseM/eGs4jOrO6oy6Mg2kOb6uI9?=
 =?us-ascii?Q?2CvtJkyU23hC3uszPqzMe4k2YzwHQrXYTzC4Lo9l1SNZw/U8j2j+XARSznLB?=
 =?us-ascii?Q?D8UQZ9xeGbKUSCD0q1lwVBPMFg6fE2tJz8W4ADKzyb12tdpX4PqJ/Y1hi/sf?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800c41c5-9186-46d3-131f-08db5e2df09e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 21:12:41.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJi5t8tx21Zi1J6tS58IEtnr1pRNABNQpKKxsvdN5CmUoGdSBta44eIPUWjhjlyQRpBAdqgIACWVTv3dul6e8Ff6j+XhA8QfvB8+73kIBek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/30] fixup! drm/xe/display: Implement
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

On Fri, May 19, 2023 at 04:18:07PM -0700, Matt Roper wrote:
>---
> drivers/gpu/drm/xe/display/xe_plane_initial.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 41540b27775c..39dd97acae08 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -51,7 +51,6 @@ static struct xe_bo *
> initial_plane_bo(struct xe_device *xe,
> 		 struct intel_initial_plane_config *plane_config)
> {
>-	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
> 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> 	struct xe_bo *bo;
> 	resource_size_t phys_base;
>@@ -84,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
> 		 * We don't currently expect this to ever be placed in the
> 		 * stolen portion.
> 		 */
>-		if (phys_base >= gt0->mem.vram.size) {
>+		if (phys_base >= tile0->mem.vram.size) {
> 			drm_err(&xe->drm,
> 				"Initial plane programming using invalid range, phys_base=%pa\n",
> 				&phys_base);
>-- 
>2.40.0
>
