Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E7C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 22:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801910E0B1;
	Mon, 15 May 2023 22:40:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFE510E0B1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684190423; x=1715726423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4ON9VYwQ9UJ4cdnsy8MRg+PJMFTVeDyTuvQrGHeGpNI=;
 b=Le6mkkfxAb7wRX+ruMHKf1Z4i/i/PSZOuQqqNo+98cFX3X8hLucJTh9/
 uZ7ZopmRTMfFDCamxPXXqGZe3JaZnmDH/WCoqFJHbm8YcVixVgLFFHXbB
 iSJw73fql+fWMQhYB4rWxApwJGN5HVmCceABWu6VHr/J0iyz6dgdlayK4
 HcHlPpQi29YcFlz51NW0d7h9wHTShMwXhl+aWXH2A1EUnXYz3pyjkoe5Z
 y4Y6QcUPOciZYAeJkTyomGY+IntCksa+bAWEon6FHsDEMcLQhVyC4PqxG
 n0O/KNuuy78hf/B94jReMM3AmyeoYlsPiL2o/SpPW3xPLA1W2Eec61TXt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437666750"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="437666750"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 15:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="770774866"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="770774866"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 15 May 2023 15:40:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 15:40:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 15:40:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 15:40:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 15:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7hrcWU+mr/IJfcKQsIWqMNgJGTdUG5OpK5/kj5ziiuqJAdF6TIgzL6FSYlZkyakhUbBdJ2miaiCOILSC7ZjYidbIzrGVKy7DiR1Mnijh+fiyhcfoBDaArWvP5qfHXV6jbLHEEA40xdIX0pLG2tkB3QAi+Vd/fyOIIFRhaiv7fzpPf27cRdtO/Y8ONLXphg5JfPoVFdgrUU9AkyUINxiQNl6INORSCqWcteKRpabaPoqHBtX49xZxuWA8BB8N19nEjgt1Yu9bRiqiRWOpzlMHX9C1jSDOdKEpY0JBRwQDHq+RyqI80Tl+ufpAt8zqE9U01XQ3cYrFsDJ/ljBD4iVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2QUGQo3V+sxzq4sHyZVziL3d1eG5sqWqmC5QbSBOXw=;
 b=J0XyCVW4xKV7S+o5xUQxKgDuL8aaZ/RMvFu9E5kDkNxafhyY0MA9/REZ4a/DlMm2sjmjKPiyHFxFoN2jH5AzwAUODkSWE+cl8edrp6mkNlxM8QhWhPfFKMMPwUYTu5GSBQ7DzONp0VFMDcsS0x/BJ4ITocihj47tWHwcS/9MKQTAKucihVautO6k9S17XbupEXI8JQhowPrHrgpmAGEqVFRpKQ4Td6AHN+w85ArWo0UqMhLNs4HqmT7/A9h3u8G2KynD9dIbFJeNWz//y/WQNPMgKO57onHA9KSC7uZfLy/PT5GO+86M+mGdraycB8C0tEJigePKKObdJ1ALr6jJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 22:40:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 22:40:18 +0000
Date: Mon, 15 May 2023 15:40:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <noyd26jaax2bwnnd3fdylbdfab7525tajig2ruk5q7as2kjqzi@b7fgp5qs2h35>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: a12c56e3-e5ac-45cd-3ef0-08db55955bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBVc3oBCrfhjZ6I11BtmDXFwq5dmspljyISaxp45UdVUfMNmUZMZFnaaRvV4s7tBmbQzfM51rYJw7QZRKP6XnzRGvMIHf27OiK19i6FyE2JuujxUT2XRXmOFhpf0Y/nXRzJlKjabozY2wtgsmsnI1YgoChLNa1/MbhD+2UIEjn1maY3kYOxCHZL4SY1qM2fr7P2bOLAVR/PW1hYS4I08Rdho2JalUQH6Frgt86QNRNh6NXKrVRIKOgTTAweFL0N+u1jYEOUY7xx8lc0tYLyzKmoAWH2p8S7EGQZZJAYwODi1dtCpKhaTyU1v/4pRTE9yQp/XOfNgyAZ3t8m1Q4gCHTuZ//SiMfCjxCnw/w0UQ8VAXpBUmexMmPKVhryyy65hzcjo/o/Bm46s5WZ8cOjHfa4BGYg1zxPjMXi0LwfPOX4sG9h2vaZSfFkXHHBjXtRd6HP0lX3OaINdrAMs/UJWq9J9jn0dcvOSIqUSVXRLDBnfvpZL2V6BlgURhjVT/kSM6pNa7SoUuOlK9PN61YV/uPrG0hG0BMIygnutRJ+v1Tm195L+qsbm1STMjXQ2L/lL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(86362001)(2906002)(33716001)(66556008)(66946007)(66476007)(316002)(4326008)(6636002)(38100700002)(478600001)(83380400001)(6862004)(26005)(186003)(8676002)(8936002)(9686003)(6506007)(6512007)(41300700001)(6486002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eUw454aFwrlNTXKptQEwW151eM0V0YfnNq/nE2K8KKCuQdGgyEDsZ1R/r+R4?=
 =?us-ascii?Q?P++iABpojLVDk5yEIeYloBo+8QXq0Ex73FJB1oAMHr84JOGLQ2hWMsPqBlkF?=
 =?us-ascii?Q?OuP/Q3oKxH7GHTxDrtebfbpxsCl0IMJcDvP+8daPMRoR1p+mgRT24WLxuxv0?=
 =?us-ascii?Q?1TqZ49ACkbOkZ6uDZALpkYoVcs/DQYbto70YrY/4/N1gPXYsVjxswi67Rmir?=
 =?us-ascii?Q?wuGPpwjxrnDbqJj0ZTrpaPRI7/+aqCnb7uZFZRI6zNh5PChCmkw+r9q+IYSQ?=
 =?us-ascii?Q?3iQJdHD6FvjVqFn9EEj4iHcQ3vounDGM4IFZub+t1TJslcXK+gPBi1gVyI1w?=
 =?us-ascii?Q?limBkK8CTT0IuxHOVCQsFPpJlbg9R9saPc2S4RpOBKEBkohXagW6M7vbqVGF?=
 =?us-ascii?Q?NPU0ak5cPpmOtZKJ+n211e5lKQKTNUVoCU5eWZxRWDOuB8uI5qkdfFsE0xeZ?=
 =?us-ascii?Q?IZneKOwo0pbEtLqrW8QHFaGFBB3uRW7tNUOgRTUIELDgksbRHPisIAGGKuMz?=
 =?us-ascii?Q?2YcDStepb9bI25wN9Itb5jx8wUMBbLbi7CZEivb9AIx60ZpUrp2G/oSY3odx?=
 =?us-ascii?Q?4hs/jfjloiilwZNg9FbSqy589SeB8St2EhkWZjfVEP4QIYpYgs0dinikMhc1?=
 =?us-ascii?Q?m5Qqqj1qtcH1rmP/HKPfuh8vb2mS+5UqOaytfZXuqQeqyR+BczUjJoZydoy0?=
 =?us-ascii?Q?iSQwFQAYHqzJH8+79isNCzK3Zaj8e7vThdbXKoKvQHvSQJf+kiuZz1ByEhFx?=
 =?us-ascii?Q?8z3lcJPYdR7vQbtPBp3UYGachrYC+EHhO4ptGdAitDTuaeXi5uJhGYw6sdrf?=
 =?us-ascii?Q?5NQqlKU/YMindyz7IKNylcejC3HREVJSsZUBb1tlAN/785kEyag3yJWff3du?=
 =?us-ascii?Q?dkv6WbiiuoJ2jZBX65ouFDfKa75gdUin4LW9QvyaaK/yyWxN+AljPKSkHYpa?=
 =?us-ascii?Q?Zjtz+pHn7EmpuEBGTNXk1cL094hZZmdzWptSU11Y2MkgFDUN3d4VYRIMirjS?=
 =?us-ascii?Q?l1jXA/m4Ec4M+r8+pNlPmO3riK65wPM7CTHJrEsx3h1A9fHpGJmhUs43gHzs?=
 =?us-ascii?Q?w4dVQVT5XuE/GhSrudrSVoJENyZU+3LG+twdYOjuO3Yw6I496xeu21/XjxPz?=
 =?us-ascii?Q?wAIEgo4pFlKZOy8CQDnIZm8VWZZJwWNghUgJzF2UyVH6ZSoO+MsWU6JsRxku?=
 =?us-ascii?Q?XGz9osC8NJtYiQ1Tho/c7ZVmAT21WvsKHGvvNiE1xOsBPqKyhiNlk+SfbTWi?=
 =?us-ascii?Q?O0RUIm4ifPc1Ia/Y1Qam7baqWKejfYC43cpir33EfgRMMjK41p/eN9V/xBiQ?=
 =?us-ascii?Q?8QZoL3emIM5oedXH+vmKvpSyZTj+VRgEHCqj9rZJFoIrz//qkiQP2Arhx1Dh?=
 =?us-ascii?Q?GAEgdhOnbT62xWdNPzQPCKdS3M4pT5dzzEdrIPfYd0eaTUFg/Yp6HijJK/vJ?=
 =?us-ascii?Q?lGKT3FT4OqZAjT0oSwhkkyYi0lq/RyyFMZiUbsCG/eFPtE72mUb3iAML4Tw5?=
 =?us-ascii?Q?tTG39fjinM3o9n8M2YuuzozkqpvuwddiDWAfB8Gaasqu6gOsMpqwky8iHoxr?=
 =?us-ascii?Q?wFprej3rh+MaR48xyO83VS8IvFb37tb2ncscssxZ3MgeuZTTBYtOr0Xo9xFD?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a12c56e3-e5ac-45cd-3ef0-08db55955bc1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 22:40:18.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC04ifxDbl2wYf/6joEE0omSS3qWOtiOv+fodX8PjpWo9LvCMguJR2Xh7wt8nmk5jszIn7s9fTyhD45K6c2HuPiytHrx41sGPi6tOYQmdhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/26] drm/xe: Move VRAM from GT to tile
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

On Wed, May 10, 2023 at 08:47:02PM -0700, Matt Roper wrote:
>On platforms with VRAM, the VRAM is associated with the tile, not the
>GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                   |  1 +
> drivers/gpu/drm/xe/display/xe_fb_pin.c        |  6 +-
> drivers/gpu/drm/xe/display/xe_plane_initial.c |  8 +-

I'm not sure the best way to handle the display. On my refactors I've
been leaving them on a separate patch, even if it breaks the build. The
reason is that when the rebase happens and display is moved up, we don't
risk losing the these hunks.

>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 2481b2045284..6b9e7847161c 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -53,6 +53,8 @@
> 		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> 		 struct xe_tile *: (tile__)->xe)
>
>+struct xe_ggtt;
>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>@@ -96,6 +98,40 @@ struct xe_tile {
> 		/** @regs: pointer to tile's MMIO space (starting with registers) */
> 		void *regs;
> 	} mmio;
>+
>+	/** @mem: memory management info for tile */
>+	struct {
>+		/**
>+		 * @vram: VRAM info for tile.
>+		 *
>+		 * Although VRAM is associated with a specific tile, it can
>+		 * still be accessed by all tiles' GTs.
>+		 */
>+		struct {
>+			/** @io_start: IO start address of this VRAM instance */
>+			resource_size_t io_start;
>+			/**
>+			 * @io_size: IO size of this VRAM instance
>+			 *
>+			 * This represents how much of this VRAM we can access
>+			 * via the CPU through the VRAM BAR. This can be smaller
>+			 * than @size, in which case only part of VRAM is CPU
>+			 * accessible (typically the first 256M). This
>+			 * configuration is known as small-bar.
>+			 */
>+			resource_size_t io_size;
>+			/** @size: size of VRAM. */
>+			resource_size_t size;
>+			/** @mapping: pointer to VRAM mappable space */
>+			void *__iomem mapping;
>+		} vram;
>+
>+		/** @vram_mgr: VRAM TTM manager */
>+		struct xe_ttm_vram_mgr *vram_mgr;
>+
>+		/** @ggtt: Global graphics translation table */
>+		struct xe_ggtt *ggtt;

I guess the ggtt should be moved on a separate patch?

other than that it seems good to me, but since it has a lot of
mechanical changes, but not CI, hard to judge for correctness.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
