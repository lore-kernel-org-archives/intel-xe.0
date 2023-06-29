Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF794EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 03:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7A110E021;
	Thu, 29 Jun 2023 03:41:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849ED10E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 03:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688010072; x=1719546072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UOtSVFTWRPg+RhBOFmrIgqqD2tx/nR+BQweqx5cUOAk=;
 b=ULBWJoO7WbR6CdYUTjTAmYvk+awMZD0MF7LKz0X+YJzd7TUIZphnr6yK
 ok5fF24wrDDfMHyJQatWxy3XeT4WSN/78PJNDriVs3m0/8YY7tE+tjR1R
 zaqKR2B+OPQ7sKD8rQCkWzt6p3x9iHnxdL21qSrr2Jg8OHvVtcr94a/fA
 yZrUfqz6WBRKY4faMXykE/7K+MzjI3VffgtKLzgRDfeC19s2BJ4xyBp8X
 09kAHt7juTn422MFtrINVNdw7UAn3eCwpeqiRXCWgVguc4sKfcvhVCVkP
 WyE9+e5nBYPmdEGlpWZhIuWehRNEPk4241HFZuLFWVBrL57ZWnyh1AHJX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360864914"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="360864914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 20:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841316424"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="841316424"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Jun 2023 20:41:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 20:41:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 20:41:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 20:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiyGRNbMec+USLfhYAscH4DAwtzm9LIJheqVKYhwmjxnnrD4FN9Rj4BpFhomu440WJ68zvGJ2h01UgEy40cN7LA31z2iD+j0yAfO0uYCTLycpwAGmy2frtTgINbgwNB50UXuWq4jqmNQCXRviE7xvb1+pzDoM/8Rt7XwGJD+lv6FwxXbftEKJerqyXFvP1UprOKj8EJSbc/jDlpbJM6DvkmxlLXVLEX1jbx1iFIHfN+DearBK7KzPrWoNH4dHx+21td7Z/Lw0fKHkvEiLplJ1IVoEtBDREqreP7ArOe5jt/Bm0NMjh5NeOv0K+HF/p821TThkfpiPVfEeU45BZ6QLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRvlDudwHpbHFL3fuj8FzXiKB7ktbwhtevPWissalVM=;
 b=lpfe9LeEQcUOaYgQvm5IK0oPk87JXRoeWWQ0NZydFnPZbA6Rqi7vasAbEAEjT3lxV+JUQ0GFGX5107Bwqj5ZXJ8o8Kq6zUnLVXsWIVcK3w2/jSH2YkSRxUu3ycRIdud9rsBLEmlceme8il7AsdzXKW9AgLTaWfPrhSKDGWexBiZ3Y5yegbLU+9CKihq91algnJvHWorC7l0eMC1FQDjYpmpahpXNCHykFDkgwQfRCsgnJU8X4A1pIGA/1v1yicVmsFJS9SB6hCjFyFcJLzLUtyhsn1uBqJbW63pgnYZdc5UvWaiQis71NcSiLb6AZw0p/BCr1kd8oJApt5lrlVBObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 03:41:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 03:41:07 +0000
Date: Thu, 29 Jun 2023 00:41:00 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <4nmupodawnsnqwrnob4afpwqqtnq4qda3a5zjxairn7w6qrizp@qnmn7g2bosy3>
X-Patchwork-Hint: comment
References: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
 <20230628071527.3579428-5-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230628071527.3579428-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 404f8fd9-59ce-40c3-1ac2-08db7852ac2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0vfLVO09hKP1xHkNfXQyo88fzy53vUcfnqK9sBfY0eyzrNlyKPS2gKcLQD/MeUXDNnDIyXHUbsDyVsSrRMaxVYqUOwqokHZp5bd7wqP7zaCiGiA9UvT0E4r21QsQtnnembdwQj4zvBCG0ONt7YU3LDGUw/kLSDI7fsGUXQ/TT46IrDP6ipvtNqaiLqOOb4Ybj0Dw9kpALEa1OLUojTBIzYp+nTVM38Vvf7isCVs2RF3g+OdiOZMNqUFL+eanU6VKwF6jJjEPX7uEB0mGtUdd17KiRNJsOdc7bdOdOAVizvVgn8ESS8x/wk/P8gpj6ZiaxafAuA2MeE5ZkzsYHzS/9YUTnR4+DQYBWSYsDtCZ7rvcHYnmzxnCMK1EMr8/B/q2Qs5VsNtZ4tdEFPYwKYS4bR7Fb32JKaGqEOyOnaZpCKhKtcV6PB51m2sDae4m40W9KLV+4F/5rZEYiP+n17NjjQEhuqP9w5T0jMCSojQ5DLCrjdstp978lj2ML6sJz/PmUqxr4NmweGIB4oiVlmClzIzMkjn6Nu134oYDZ8aESeJe2Gjk2pU0Jiyu51W8QA5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(66556008)(6506007)(66476007)(6862004)(86362001)(5660300002)(316002)(4326008)(41300700001)(38100700002)(8936002)(33716001)(66946007)(82960400001)(6636002)(8676002)(6486002)(6512007)(2906002)(9686003)(478600001)(186003)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nt3OOevs0vAKkptrB168Tqwmi68wbh4OIlWeL3MaUmYaOdQmKU5FxwLsRr+Z?=
 =?us-ascii?Q?7kNLY8KUeteq9TdyaXg3Naq9f8YpJoFz9UePN0MKlBm6lFsyi8Dy/Hh2q+Jb?=
 =?us-ascii?Q?99ANHQpz0im6qDAxe6KgAqCb5zTEZ0J/g0lk1v1dffi5+PE01ebKb3ly1WJ2?=
 =?us-ascii?Q?vc9zvyfo/cooEM72MyheJW4LWulDWodto8RFL6tEmc5alGoUOzM03pvxeDCf?=
 =?us-ascii?Q?Er5aHl21TWKYQhNFIFAZ8NPlAPSEgRIqypb5PJTpALM1eXHSgGumGC59O5hY?=
 =?us-ascii?Q?Qg5MadCzOUGB3nKEunw/2J5ZoEq3q86y5ewvKw1O4duAPgt2lj4BtpS0BLqe?=
 =?us-ascii?Q?xmEJEYWlokoE32FFmg0Oefa4hnl50kIpCeIhEKTP1+DFgi/X9D86EX6ryPMz?=
 =?us-ascii?Q?ukD6MQd1OOZOpS8nhozPBsjFYYiJsPlWVcRihRnUw7ic+W9ULvv3JmbpZCod?=
 =?us-ascii?Q?F3KK8RRjyErpgSq/EKFeXu4r0E6Lx91voC3rS3qlyRzfyr28C9zbtNX+FXeC?=
 =?us-ascii?Q?IS71xy5XUOm3J8UOe9gaIQhCErCVp2/JjakWFbUuwcE2w7pEahEDBt2r58OK?=
 =?us-ascii?Q?EqA8sRZdatdUqwUQYzn0AOGW6cUtliHckQSTf4RR0/JjGt0VctjufS9Jn3pa?=
 =?us-ascii?Q?Jp1+SNFL/9d2iA8Oudk9InF4MbwB1BDClIn0KfJXVAVNh9CKRyhuqemVm31m?=
 =?us-ascii?Q?sfJeo7FVDfsj+aEZYAIhUR7wu2f3rVy3m5lPQ9/UpajsJoebl8rKKWa2W8Hv?=
 =?us-ascii?Q?jNwkw9i85AVGvAd9IPEGAPir/hvjKOM4YeIu0SA5RGv0Z0iM9vym9oMdyX+B?=
 =?us-ascii?Q?WjBu2rWh+JGqbN8fhZoa4mbKToWoVzCGID3R7efaRaj5z+K4QJhM8iSWtOiB?=
 =?us-ascii?Q?RZ14HkLt1kKKHtxs3xsDSgR8X95sl9eeLiUv4/hg3jfpnl8p4i4dlHzz18en?=
 =?us-ascii?Q?Pf9ltXjNAFlmljaCIwM9pMPp4qameJ4F7r/BQNXFVmaLk0ZUCchfcoR6cDC2?=
 =?us-ascii?Q?RHrGzDA5gmZnaBMEi0t99D/5UU7cY54XQ4qxKas4bvb7WDCZNUqxClr9EcWc?=
 =?us-ascii?Q?RsjlYhB7JZOXtF9ifYosQQRF05O3tRqUdoJOWtkD2Bp7+hYRrRoaUj9hXHyL?=
 =?us-ascii?Q?TAhuYztpg2m1+0js2HzIkkZlB/WZOCDftcYYxYPtlPj2rIRtb9CfrRePkge/?=
 =?us-ascii?Q?AKqc+aEXcE1/faTvNPAp26j9nJjCao94lAZGZOiUAb30xgBnSZyeFYEVRoym?=
 =?us-ascii?Q?SHWnd1OHfwkLwgEts8gBW9jeTLdzIuTKCDivWr/iaNACvqswtguUwsI8DNhe?=
 =?us-ascii?Q?v0He12HBVMqJ6RyarjitD671jGwv4GtTqfqHQErqRVk2sVgbZwkcgmmnchG/?=
 =?us-ascii?Q?ZVCwUPhQsPXFN3zisTk9v4XS1ItRNrlwrV/4enUCoxS/dFHNv0xPN1NzGMg9?=
 =?us-ascii?Q?95TLkEV24YeM6JTj1C86tld/W6ABp3XqC0BsnGU50IkxCazd6QISd/RwCVkC?=
 =?us-ascii?Q?cke9196p80kLjBvn+BXdrze+E14LSdeW/9WbVc7id4STOdsUhSx0F3AfuiVc?=
 =?us-ascii?Q?lxTgy/6kENRfiYFucv1A/KHqdr+K9C2JoYI/ZxsQ1ES5Y7UTAFetFTRFf56L?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 404f8fd9-59ce-40c3-1ac2-08db7852ac2e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 03:41:07.8128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpEwjHRMBap7uVTOgC6a8tKGebpkZ10asuH1zIB+26XsjuSBVD6vunrRMlgP/eFB4PMz/jkBwitsf6DbDHCcegY/HLVjdLsFgCb4u7ujLLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 4/4] drm/xe: Make usable size of VRAM
 readable
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

On Wed, Jun 28, 2023 at 12:45:27PM +0530, Tejas Upadhyay wrote:
>Current size member of vram struct does not give
>complete information as what "size" contains. Does
>it contain reserved portions or not. Name it usable
>size and accordingly describe other size members as
>well.
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
> drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h          | 13 ++++++++++---
> drivers/gpu/drm/xe/xe_mmio.c                  |  6 +++---
> drivers/gpu/drm/xe/xe_query.c                 |  2 +-
> drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  3 ++-
> 7 files changed, 19 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 99c35a4ef673..fad4c66a8226 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -83,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
> 		 * We don't currently expect this to ever be placed in the
> 		 * stolen portion.
> 		 */
>-		if (phys_base >= tile0->mem.vram.size) {
>+		if (phys_base >= tile0->mem.vram.usable_size) {
> 			drm_err(&xe->drm,
> 				"Initial plane programming using invalid range, phys_base=%pa\n",
> 				&phys_base);
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 21fca198a882..e240df6c7ae6 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -125,7 +125,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
> {
> 	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
>
>-	XE_BUG_ON(!tile->mem.vram.size);
>+	XE_BUG_ON(!tile->mem.vram.usable_size);
>
> 	places[*c] = (struct ttm_place) {
> 		.mem_type = mem_type,
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index bd3e20ce3a4b..6afe37c8704e 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -129,11 +129,18 @@ struct xe_tile {
> 			resource_size_t io_size;
> 			/** @base: offset of VRAM starting base */
> 			resource_size_t base;
>-			/** @size: size of VRAM. */
>-			resource_size_t size;
>+			/**
>+			 * @usable_size: usable size of VRAM
>+			 *
>+			 * Usable size of VRAM excluding reserved portions
>+			 * (e.g stolen mem)
>+			 */
>+			resource_size_t usable_size;
> 			/**
> 			 * @actual_physical_size: Actual VRAM size
>-			 * including stolen mem for tile
>+			 *
>+			 * Actual VRAM size including reserved portions
>+			 * (e.g stolen mem)
> 			 */
> 			resource_size_t actual_physical_size;
> 			/** @mapping: pointer to VRAM mappable space */
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7d92258cd35d..5effb21db9d4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -289,13 +289,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 		tile->mem.vram.base = tile_offset;
>
> 		/* small bar can limit the visible size.  size accordingly */
>-		tile->mem.vram.size = min_t(u64, vram_size, io_size);
>+		tile->mem.vram.usable_size = min_t(u64, vram_size, io_size);
> 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>
> 		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
>-			 &tile->mem.vram.io_start, &tile->mem.vram.size);
>+			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
>
>-		if (tile->mem.vram.io_size < tile->mem.vram.size)
>+		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> 			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
> 				 tile->id, &tile->mem.vram.io_size);
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 15e171ca7e62..9acbb27dfcab 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -188,7 +188,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> 	config->num_params = num_params;
> 	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
> 		xe->info.devid | (xe->info.revid << 16);
>-	if (xe_device_get_root_tile(xe)->mem.vram.size)
>+	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> 		config->info[XE_QUERY_CONFIG_FLAGS] =
> 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> 	if (xe->info.enable_guc)
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index ac70486d09c3..e0bc2b60ab09 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -101,7 +101,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
> 	struct xe_device *xe = tile_to_xe(tile);
> 	int err;
>
>-	if (tile->mem.vram.size) {
>+	if (tile->mem.vram.usable_size) {
> 		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
> 		if (err)
> 			return err;
>diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>index 1a84abd35fcf..a10fd0366da3 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>@@ -360,7 +360,8 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
> 	mgr->tile = tile;
>
> 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
>-				      tile->mem.vram.size, tile->mem.vram.io_size,
>+				      tile->mem.vram.usable_size,
>+				      tile->mem.vram.io_size,
> 				      PAGE_SIZE);
> }
>
>-- 
>2.25.1
>
