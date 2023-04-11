Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBCC76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 07:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DEA10E4C8;
	Tue, 11 Apr 2023 07:00:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2C10E4C8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681196430; x=1712732430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4k3WTWC+AUYoJDpNg8xR1ELELEZkC4uWAxlp3pU9GpY=;
 b=RQdst8lJhvtxWhvpnpQ5n9mRwNG4Ok9Oyx0LMWlzuY6359MOIfvknHvm
 pwsYLAKS1hOnCNKC2DRkf8dVdfCMPPIMkPV4CnnNQuJfQZzuMsMExf1vP
 Pr44o7sxzf6NfnZ9Et2eG5tEQvYb+MzoxU2WsfcUA8cxxC8aUtoAeluiM
 Fq6kexs0g1BK0QTtd8mrHNPcWRLO18hsj7ZsTTWuSlZ0osElCpWvurCIj
 //AF9sd9uOsefwnBiJwWUZR7lkIrWM+BlPgwFdS9onxQQZenCDMLQAaxO
 wL2K4OMdB4dfNW/KQvGtDgwuZ6s0IBaAnodvDSzQ4w08iGIoiJftXz1MU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341030634"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="341030634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 00:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018258352"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="1018258352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 00:00:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 00:00:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 00:00:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 00:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH5JFz/WtpBeo2xx+65DVKc8t9/tuvgQ/A+kRrUdUfIQHUKa6iLghWfRnw4qpKpaFp06y6Q7lWN0a/hUd0Z2Y3sUT/NPkOksiDuisdj4ab96q7hKDSNuWmhpg48gSwwLnPN5ZLViGCxKtqJznf6Y4K0TSwItwkNdgju/36hvE4Wx+3pCcaFTz3SefwSmwAZm0NCEaffRwraV7uCCnGZN+UDxtACpiyrGU4D0gsfYXip5N4iextAhDYT0TBP88uU4GiUq6KXXuJpghWjivtiG8RCxMwwhK0mrHMiIIkb/E/iZfqLbfvEC82QjmGY6JkLAPPp70L3A1DmDOANqjGQYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vbSrR1imP8f5rNZkAW+rxv0jPC5n6KnJ0wDaWuUiT0=;
 b=Y+u8Bt5a9F/MEQH1mGwmQWSFDh83899P+dEYKvUbcKs2IcIK9dIdOV9++5uGKX8yB2EGWxxWJw0wcOzaG8HPXF+OEKSx0pGMDqJK9fGj6WKCOIsSmq9d80Mt1LjC6RWPYbNsFYMaQsMFiFx3A3jsu7qu1GwnifoAWOLR42Hd/iTVdMbnYAZPBc7Y8SKG03K3kRpwO8ddxcHYCXYvc1yrYOh7uo1sXaF7yKgQXsW+GZecaOur18eJQ6ULHe+MqkkpqValgHHS4wrD+2J7S0fZWaAbgQw+sB8mn2H6I9V9l46atpZs9IqRbqOl6KxOgVHwod/fdWvP24oyR9KsC/XxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 07:00:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 07:00:26 +0000
Date: Tue, 11 Apr 2023 00:00:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230411070023.xhnokdsoybatdh23@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230410183910.2696628-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230410183910.2696628-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 125f76a9-5c03-4ee2-48d0-08db3a5a6d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mB/PngSONPfinB/sjSUOD8nTfzeRAgageHTkPn3CokYoBN2xlFD8sB4f+ALBOfAfR88h1zXhkXIuKZVCv+uqwvMEEdOrWxgNIC4mP8fRnkQTeo+oc1SDAU62YZHxDKXr0X8fzFjTFArHuT7aCFqmi0EzxEQ4ppVAacK8VVgJlbrTOazdAY8I2vlnQjcqIJK4EXHl4uzuDvFXvhmhlIusHhngovlz7YP9GkB8jEdMIuNOLfH+0TeSH/W0EzvOyIBAhA3/TmhfIZDhf0jGow+fkqJuYRjd5HE1LBLZqFoSOvnzjFCuTDl5NYGhMxF9ME5ZymK18DogQwnIj97++DeYy8X4/pPrLagRJ6WBtRHUIQzQnxQmTjiRYxr4uxtpYlNHYpc3UNxdjnWquLfw4XLVXT6aZcZfqwwSEX/GAAXJU3xmUEn47GhYGGlFwSBHPEGOrhFp+gNIcWgrdnWz5ks/hgX+aanptOQiq39YAPXFIWuYgA6RfwjjvsYoLx0GflmCLN44k4+1J4K99ErI54ico5NSM/7hIbUiotcpBiXLLF3flO47sGVvyr7eQNKm1gH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(8936002)(6862004)(86362001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(82960400001)(38100700002)(478600001)(316002)(6636002)(41300700001)(36756003)(186003)(9686003)(6512007)(2906002)(6666004)(6506007)(1076003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJ0YRpe0A4D+cvj0XxX0lTgKH/0Lx2nQlQ99q2UABSjuEFHjjqrrpmpFUq+E?=
 =?us-ascii?Q?4QBbGLzWEwj5z/Z6yVhUlfpY7yhU8jnBKbai9IaQqjhsVOE164hjMl+p3L2T?=
 =?us-ascii?Q?cNdkOfHC157hmMTDJjwj4ebU4ufNwRUoztNVw4qeyQIJnXYWxH+SIJdiKGvw?=
 =?us-ascii?Q?rWzLFYJJ/Iqyq7tF+yUQZDlYyhrfNB3er8kVvXUkuufdJECB+2Lb02/3J3zp?=
 =?us-ascii?Q?xOZ7eX6tW536mRWBthYQ/aH+EXcocdGeEvuaHhHd6SwY4lZzFL4eEhSM41Y8?=
 =?us-ascii?Q?JpHXgFKvef6BIMhd7iRSnXBLmdG2MORhfTTsWDNOdbPgIVGQbzCH+gtNTz7+?=
 =?us-ascii?Q?ARS1eAYWpQSYcqHMpCq3SuCnP0JZIn1nYioeoBaeQFjAON0JgxJzl7Y082CP?=
 =?us-ascii?Q?2zL+2aYruHn2kFXDP1S/L01XJqhx7GNM7D2+KMudVg527J6Xow9JUoot31yj?=
 =?us-ascii?Q?aXAsYi9G0fR2jgHlvHeS30n/Coukmol+8wYJJRFzAxI+10u7+vohVZN8yjHD?=
 =?us-ascii?Q?EyZ82pTvf3z3ICEqRqlNGVWadNDuUMmMASYS8QtTCKdIi1z99TFuBkzBQswX?=
 =?us-ascii?Q?VZAtGY/0ZTAK0gWl6Y8fTDwrzDXTqw8343VvGt9YwvqOGvL4VmF2tG0YjpYn?=
 =?us-ascii?Q?TP/zFxqTA2ME1I+CVJOiWdlST4uv093Fwz0+RzqvfIco82wQGhQ3gAyklmAM?=
 =?us-ascii?Q?paTmJAtGN0RX89Uf/8UVFCdYTpfZFqgEUYO9ysy0LRfAyv6uobMaQSKchBqB?=
 =?us-ascii?Q?Oge6UbrXyv7xdzM/RA4fh4ZK+jTeokogyWJ1qzTpBjU0MhBb5ldGNE4cyGhx?=
 =?us-ascii?Q?pyddVcEPGK8Qabihojw9ClIff2Ot1JNhVYPzmVTC+imslG3u4DaURA5vFgRv?=
 =?us-ascii?Q?9rgyVAJiUxJo8osVB2j6G/7AOtVAAnoTUo+pAjerP6IPpDzS84yxdKl5yWKu?=
 =?us-ascii?Q?JnfpjsZ0OVAYa2JH6qq+g0TPOVoyGI7SE7zd5SHBdCfe7wbtxp2frvUUET+V?=
 =?us-ascii?Q?HfovBiFf89VQA9rLqUSd7hkOlvhflkU0KQs2dFSpdlPL50L82ZV1DNJAhkXX?=
 =?us-ascii?Q?1LTjDCbd5YHYoiksxnvRXji7jm3CvmrZ23aKhbV/AOGdFR1stXWZST5TNqBU?=
 =?us-ascii?Q?21QgF7XNgBNqPBOkMb6+DjuUeNfyMjuGoLOWBqkpqRc9wFM3bBw32xMa0Goo?=
 =?us-ascii?Q?7JS+hXvC/81BMjwq7h9+zoMAZpGQ4y48ljIh1DWPpKyhPIcBbVfE7fiRw9Ub?=
 =?us-ascii?Q?w3UoXa2wzC8sSqCx+5BkCfwrrs1SFi048ONsPOdnyHBzno4wD8/2pFT09AJ7?=
 =?us-ascii?Q?IufY6Znzskbt1Ty9JrLN23F30i8H+CCmvhUlHd4DiHjZe6mEmYXicMIOFpco?=
 =?us-ascii?Q?TSpoGKlL8wCJRqFBCIFmbBUdyQ/g8OOgpcxgMpF5ikANYcR/miw5KE9sSAr+?=
 =?us-ascii?Q?5WTa+ZemzjglPvzIKbh4z5P8t0bs/Oy/gCMP+M6+ENkpDUx5p7X53N1NXk+b?=
 =?us-ascii?Q?ubzwCNC3um6l23N2jiMITwEQIhSPa0+q9JAhGl3mG2bODfUsF2bE0gwJbEvi?=
 =?us-ascii?Q?VykdlfBjtG0morYIrnG0c7xdRT1ij2u+0wy+yJhZuUY7UxlwI3oeYMCjn1BS?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 125f76a9-5c03-4ee2-48d0-08db3a5a6d9b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 07:00:26.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yePkT8PbVKEw0jY3qoE60OZM4M2N9qGeFIDiLoiYBFpkKdut/GOga3e9uNqZXzpYYE9aouDzaXePQs7soniJPimsGheZiZ44XKnwp7JJgiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Track whether platform has LLC
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

On Mon, Apr 10, 2023 at 11:39:09AM -0700, Matt Roper wrote:
>Some driver initialization is conditional on the presence of an LLC.
>Add an extra feature flag to support this.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
> 2 files changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9ce6e348dd29..42a82dd7631a 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -98,6 +98,8 @@ struct xe_device {
> 		u8 has_flat_ccs:1;
> 		/** @has_4tile: Whether tile-4 tiling is supported */
> 		u8 has_4tile:1;
>+		/** @has_llc: Device as a shared CPU+GPU last level cache */

				     ^has?

other than that,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		u8 has_llc:1;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> 		u8 has_range_tlb_invalidation:1;
> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index b92d8b5a391e..4b01d8c538ae 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -56,6 +56,7 @@ struct xe_device_desc {
> 	 * should eventually move entirely into the display code's own logic.
> 	 */
> 	u8 has_4tile:1;
>+	u8 has_llc:1;
> };
>
> __diag_push();
>@@ -176,6 +177,7 @@ static const struct xe_device_desc tgl_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_TIGERLAKE),
>+	.has_llc = 1,
> 	.require_force_probe = true,
> };
>
>@@ -183,6 +185,7 @@ static const struct xe_device_desc adl_s_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_S),
>+	.has_llc = 1,
> 	.require_force_probe = true,
> };
>
>@@ -192,6 +195,7 @@ static const struct xe_device_desc adl_p_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_P),
>+	.has_llc = 1,
> 	.require_force_probe = true,
> 	.subplatforms = (const struct xe_subplatform_desc[]) {
> 		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
>@@ -497,6 +501,7 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.graphics_name = graphics_desc->name;
> 	xe->info.media_name = media_desc ? media_desc->name : "none";
> 	xe->info.has_4tile = desc->has_4tile;
>+	xe->info.has_llc = desc->has_llc;
>
> 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> 	xe->info.vram_flags = graphics_desc->vram_flags;
>-- 
>2.39.2
>
