Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A8C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046A10E787;
	Thu, 25 May 2023 23:29:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69410E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057383; x=1716593383;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qQ2b2MLAdnj09DkqSHSHjcwcjBEh6RX7zbhB69sQXOk=;
 b=aHo6RdZuP9N4+tQIdhCRBy9/FOa/Gk74z4atsD0ZgbfWscYYdWPJ5H/V
 nob+19UOKiZSZApjgV9V+7Xci2zlrrQB6YtOnLfJ6XkE5ttfxjtXhl1xu
 96cuqxqwgKe5fb1KDK6KUKsgky73sel5lSidIcgW5Fmf+KOkqEBT27JZF
 Os9jb0ZWxMSH3hIl0BAwsnfSGrIadQMEeOyncUNdIrnndqKvjzAigazo3
 cadq670s2UuLRMmo0irRE/m6gAXyekatO/hMWLRAbZvKLsUhyIuqJrMOj
 ts4VsbuepYDFxwMr+ZvGNiq/ZMiJe3lYb6ZpWoWZGnJ+0vwRwMz4u9eb1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="338653813"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="338653813"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="655428772"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="655428772"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 25 May 2023 16:29:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:29:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:29:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:29:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuXlQTvoZ7Z3fpbd3OrBHS1gpW6YNS6gSgO4vGxvPKeCFcpsw5XKuvjRhpGd2Fh4t/I9L3aqsA0zr/A72yFM+UYm+Hteqkl0ncJv1YOSMxjVG7PqmAyrBMieqN3TrmC6KQvnT0Yl2Kxmo9CnnTlYMLjRY3MRe0SzSO3KumaK15SiNgF26sHAV0pI5HYYbCu8vEdj6ZpOs7yAT0C/zrGfis1wsAeQ/rVtMTzHWZahVyd+8qMwDOIKN1JO2Y0Yq/W6kw0F8mdtyrtKeu1tB+LmpjwwCbjgtmYealsFYYdRs6s7x1DsWh0UZly5zkZEDTxc2QP9Qq7FAFkU9B5vxnutEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsQ8EaQlfnWNs1+gb2elsmnfg/v4jvU6S6dXPzkbej8=;
 b=TR96ticUJMk+JP8T2iVvFQSkGHOEBFe5dHkCpOsXJeE8SW52fMepM6QUrHk7JqxLXOWS67KpMLhTxWw7hIZDprgYZVmggG1r5T6sXJN2/PeocM4i0C6y8qYLZ3SwWU4+AF4pLmNcww81qzrKBHHWlWRzA53BCDp9NPu6cqf0YS9UScAxC0dCW8JnQE6pH5Udt/arhOnJcOHyxrx/wTQTCXiZHsM1auUlu5u+txcxdOotAUftAo0J7dbQUudPowg+RfS5K5BJWaVrCkMRqlm5aojRi1r3TPn4kAkWcORAslIbJ+0a3y15QkTUleb4bWbmp9UcaiceDMHwzL4CoVIb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 23:29:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 23:29:38 +0000
Date: Thu, 25 May 2023 16:29:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <3mbramsehvwfr2btfcpgiafnldravc6akorkkzo3lpvrrgqs3b@bflkypy4mbqv>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519231827.3572452-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ec4fd0-06d9-46e7-e18b-08db5d77e874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqE08ktals5tRM6wcFYrPOxywqdk9px6mOnHVXQhvWc0VShPXSSKU+aj7qCK8F89NbghMZ4HXLEn4jAKi5g1A7RfKp7Rbzt8AGVJQt4US8eDbJLXysNOr+/m6B1jh8ei0aaUjjawjCSKJ2Nn+YYa74/LPpph/4ORRuC+4cDN6tP3RWAfELDlGeNoZZ7SqPFLrkP7sjybCZ10mXS8upA/fZSPBA8NeX1Q0Q0xjlZ2xPjSM/ebEnMzc9mAeCzicdFLOoqPRBE2v/mLgnAanpYQzi54hl1T+ATp6vJgmGGie4ycCGn26+rzSETgNYJY3h2EiqAgt1hIZ3t82I0owvBYExFm5MtHlCL5SV7mDTXduUpc0xwgUv0nhMzcFH3HnKtjlReeZVzgTHhHnc5Qm004pPXxwmG7+SupJUguqIYiPQfZlPFGk0S4caswdWcJFxwTv7vHh4rM+2D/y5E56s4PY8Ptn/PR92uZ/N9qlNVXAEMF7zlGEwnabRmuN3PmNS4iJKxLy4H1l6MhtvLWF+JhOiCMk1NGOtR5Bbt1eZA3jiw6pxbBok05lO5h2M0qLnOh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(82960400001)(6666004)(6636002)(4326008)(66556008)(66946007)(38100700002)(478600001)(66476007)(33716001)(316002)(41300700001)(6486002)(86362001)(6862004)(8936002)(5660300002)(8676002)(26005)(30864003)(6512007)(9686003)(6506007)(2906002)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Eu0APw6FFKZ/iKMCWISFP7GqUsjl3DX1B+oyXeSGsMaY6zB0bmpkxeXEnR?=
 =?iso-8859-1?Q?Dz8lLp3VolJXyDjtOcXsdvBeOhHrh3TKeUvkwg3N48WRQaVOwToIdBnaf3?=
 =?iso-8859-1?Q?BIMNPCG1fwiAYfoi6xv7T8A8Mmu2Pf0mnLiyFasu07w7ANRlLaIu8yZMjC?=
 =?iso-8859-1?Q?CBmYeYRQcw3pF3MOQCrDGqpLqa4go4ok7PVXlarKjq8I1cM+5iqi3LVGTQ?=
 =?iso-8859-1?Q?P9W5FT9vBMh8UyrzQD80eT9LO8FWFdC5DxtDsC0w3FwuiKTWYK4Gr5QkA+?=
 =?iso-8859-1?Q?xlGy748fU2ppQmqqYRxQGyVcR6bYKMlTWr9PZ9E0gkoXDNDGjCjtyQjcP9?=
 =?iso-8859-1?Q?OXlneTGO+9OHJad7OPSuNT9iocgJ7Czv/JoeNxy2RVp6sMebfLkR7qkYkv?=
 =?iso-8859-1?Q?kLaB7v4ELmZ1tUeb6DqgP1axF9ctR8TNylpvxZR2zan4PRZtKnCULBjZL5?=
 =?iso-8859-1?Q?5bLvGeAQrDOQ+hcdiTcjCwR3nclrf1vVuXB24xqS0SzUdFHz6Q9WRnG0jn?=
 =?iso-8859-1?Q?MRT6mS/DvacDUcWqB/RShMvzqaRnGUIHJIyJ7gr8wp95aS2UIAjt4xZbZD?=
 =?iso-8859-1?Q?1D0IQpWs3WshUAp2R2WAQ0UO5RoPZrkblwAzo9tCP7PuMhF9MBHn1ESeY3?=
 =?iso-8859-1?Q?84QsNL/83xlaP/ew1+prN7nX8cNiEMMKxM1Pw0dAvIBsZDmj0XpxSW8qDD?=
 =?iso-8859-1?Q?JILZxf+R9iP/whaG5eATPkpSHjXxd9ehP+4cVeo36cWRBL99cKtaX1gQRS?=
 =?iso-8859-1?Q?Jb+ZJjd0eVoRFEJyEOZSclJGBkMeIAbEL0D+9gFMW2kj6AsR1Xk0HMKu4s?=
 =?iso-8859-1?Q?QlwHSU9KbrLav6j1W7bt+JunPVcuPX1YN4lY/sCvkkVckEEbqYTEauTGnW?=
 =?iso-8859-1?Q?fwnEC6HB7I2WRni/dNZAO0htgdu9lcS+ppYay+YxRNxOFcVn8kLyVb+GSb?=
 =?iso-8859-1?Q?xiKrc4jNUmV2vGy6g28bI8sMiqSEtfZXhj26n71gRgxKaMAuY8sT+JxVvS?=
 =?iso-8859-1?Q?a137FR+7pNQlxghjjwHN6QZ9z669y4d9rGLaUVUzwgMTYNK5gaYrdg2w8A?=
 =?iso-8859-1?Q?Y7+uIfV5Tm41dwwptcPFb8Dp6ohTelBmjrAHV/uslYvuvHgH5RDSQY+vsI?=
 =?iso-8859-1?Q?C+eqQqIp80eu7L0v9Xr6Wnv9Yrju9osXEiNP24rD3jM0IjMam4baJoIIF0?=
 =?iso-8859-1?Q?XgxxOq6lp2uqx4Fo69/4KIgEmYAqii4dddpYYGU4NVN/Oxd2SD+MMVnk7m?=
 =?iso-8859-1?Q?5vkBVOF6/v1d+jyjrPdv2aaKYmjThgZFBqhx4WDlq5fmirr7/vOY6K7OwD?=
 =?iso-8859-1?Q?+XOgGnGzVTD57Muk+and/VWOScq+pqZGxfQWIy5oVfiJxnqUsSDe9sCQgR?=
 =?iso-8859-1?Q?jfPMEc9qgQWRNMTl53MQp4NPWzJY/X2kzW0vwlXlA6zsEJ/9862jS4MnxS?=
 =?iso-8859-1?Q?cq6o9eckOmCjdxNV8RLemIt1effUBJRiC/GFKYBVVibCh/8w62u1HrkxqE?=
 =?iso-8859-1?Q?kmk7leVTlaLQ72nixpltWk0wM6jryWAFFGJhuqx9YJ6xUNjFUirang6Lnt?=
 =?iso-8859-1?Q?mN8xPaysI9W5P9O83Mfy9qrsDDjhtdJra9QkooZ42Xb/4XNIONwZtjth6j?=
 =?iso-8859-1?Q?G3d9GHihnbkG+ljS6DYYcG9EELHWX+BP8sBMuCRbJlBVCwazTQ7H2hyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ec4fd0-06d9-46e7-e18b-08db5d77e874
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:29:38.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyZD8oKEKkTINoDSj8+1R4uFJNVWwiAaQ86ZRLXIlLIDPyoF8tJc5DAbKhUbNSHWpgXbuxs/170D2nbMwP94WuxBSh1KMgwD7+ZAiJl4kE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/30] drm/xe: Move GGTT from GT to tile
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

On Fri, May 19, 2023 at 04:18:04PM -0700, Matt Roper wrote:
>The GGTT exists at the tile level.  When a tile contains multiple GTs,
>they share the same GGTT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           |  6 ++--
> drivers/gpu/drm/xe/xe_bo_evict.c     |  8 +++--
> drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
> drivers/gpu/drm/xe/xe_ggtt.c         | 30 ++++++++--------
> drivers/gpu/drm/xe/xe_ggtt.h         |  6 ++--
> drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +-
> drivers/gpu/drm/xe/xe_gt.c           | 10 +-----
> drivers/gpu/drm/xe/xe_gt_debugfs.c   |  2 +-
> drivers/gpu/drm/xe/xe_gt_types.h     |  3 --
> drivers/gpu/drm/xe/xe_tile.c         | 52 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tile.h         | 14 ++++++++
> 11 files changed, 104 insertions(+), 37 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_tile.c
> create mode 100644 drivers/gpu/drm/xe/xe_tile.h
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index c82e995df779..ecc82fefdf4c 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -958,7 +958,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> 	WARN_ON(!list_empty(&bo->vmas));
>
> 	if (bo->ggtt_node.size)
>-		xe_ggtt_remove_bo(bo->gt->mem.ggtt, bo);
>+		xe_ggtt_remove_bo(gt_to_tile(bo->gt)->mem.ggtt, bo);
>
> 	if (bo->vm && xe_bo_is_user(bo))
> 		xe_vm_put(bo->vm);
>@@ -1235,10 +1235,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> 		XE_BUG_ON(!gt);
>
> 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
>-			err = xe_ggtt_insert_bo_at(gt->mem.ggtt, bo,
>+			err = xe_ggtt_insert_bo_at(gt_to_tile(gt)->mem.ggtt, bo,
> 						   start + bo->size, U64_MAX);
> 		} else {
>-			err = xe_ggtt_insert_bo(gt->mem.ggtt, bo);
>+			err = xe_ggtt_insert_bo(gt_to_tile(gt)->mem.ggtt, bo);
> 		}
> 		if (err)
> 			goto err_unlock_put_bo;
>diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>index 6642c5f52009..a72963c54bf3 100644
>--- a/drivers/gpu/drm/xe/xe_bo_evict.c
>+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>@@ -149,9 +149,11 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> 		}
>
> 		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
>-			mutex_lock(&bo->gt->mem.ggtt->lock);
>-			xe_ggtt_map_bo(bo->gt->mem.ggtt, bo);
>-			mutex_unlock(&bo->gt->mem.ggtt->lock);
>+			struct xe_tile *tile = gt_to_tile(bo->gt);
>+
>+			mutex_lock(&tile->mem.ggtt->lock);
>+			xe_ggtt_map_bo(tile->mem.ggtt, bo);
>+			mutex_unlock(&tile->mem.ggtt->lock);
> 		}
>
> 		/*
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index ea7143c04db9..cb4d0c2ea184 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -54,6 +54,8 @@
> 		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> 		 struct xe_tile *: (tile__)->xe)
>
>+struct xe_ggtt;

I think all fwd declarations should be at the top.

>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>@@ -97,6 +99,12 @@ struct xe_tile {
> 		/** @regs: pointer to tile's MMIO space (starting with registers) */
> 		void *regs;
> 	} mmio;
>+
>+	/** @mem: memory management info for tile */
>+	struct {
>+		/** @ggtt: Global graphics translation table */
>+		struct xe_ggtt *ggtt;
>+	} mem;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 200976da3dc1..52d293d61cc0 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -90,24 +90,19 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
> 	xe_bo_unpin_map_no_vm(ggtt->scratch);
> }
>
>-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
> {
>-	struct xe_device *xe = gt_to_xe(gt);
>-	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_device *xe = tile_to_xe(ggtt->tile);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	unsigned int gsm_size;
>
>-	XE_BUG_ON(xe_gt_is_media_type(gt));
>-
>-	ggtt->gt = gt;
>-
> 	gsm_size = probe_gsm_size(pdev);
> 	if (gsm_size == 0) {
> 		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
> 		return -ENOMEM;
> 	}
>
>-	ggtt->gsm = tile->mmio.regs + SZ_8M;
>+	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> 	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>
> 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>@@ -147,13 +142,14 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> 		xe_ggtt_clear(ggtt, start, end - start);
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	xe_ggtt_invalidate(ggtt);
> 	mutex_unlock(&ggtt->lock);
> }
>
>-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>+int xe_ggtt_init(struct xe_ggtt *ggtt)
> {
>-	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_device *xe = tile_to_xe(ggtt->tile);
>+	struct xe_gt *gt = &ggtt->tile->primary_gt;
> 	unsigned int flags;
> 	int err;
>
>@@ -193,8 +189,14 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
> #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
> #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
>
>-void xe_ggtt_invalidate(struct xe_gt *gt)
>+void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> {
>+	/*
>+	 * TODO: Loop over each GT in tile once media GT support is
>+	 * re-added
>+	 */
>+	struct xe_gt *gt = &ggtt->tile->primary_gt;
>+
> 	/* TODO: vfunc for GuC vs. non-GuC */
>
> 	if (gt->uc.guc.submission_state.enabled) {
>@@ -267,7 +269,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> 		xe_ggtt_set_pte(ggtt, start + offset, pte);
> 	}
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	xe_ggtt_invalidate(ggtt);
> }
>
> static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>@@ -318,7 +320,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> 	drm_mm_remove_node(node);
> 	node->size = 0;
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	xe_ggtt_invalidate(ggtt);
>
> 	mutex_unlock(&ggtt->lock);
> }
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 333947100504..205a6d058bbd 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -12,9 +12,9 @@ struct drm_printer;
>
> u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
> void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>-void xe_ggtt_invalidate(struct xe_gt *gt);
>-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt);
>-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt);
>+void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
>+int xe_ggtt_init(struct xe_ggtt *ggtt);
> void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>
> int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>index ea70aaef4b31..d34b3e733945 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -12,7 +12,7 @@ struct xe_bo;
> struct xe_gt;
>
> struct xe_ggtt {
>-	struct xe_gt *gt;
>+	struct xe_tile *tile;
>
> 	u64 size;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 80d42c7c7cfa..1c58a9aff2cb 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -67,11 +67,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>
> 	if (!xe_gt_is_media_type(gt)) {
>-		gt->mem.ggtt = drmm_kzalloc(drm, sizeof(*gt->mem.ggtt),
>-					    GFP_KERNEL);
>-		if (!gt->mem.ggtt)
>-			return -ENOMEM;
>-
> 		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
> 						GFP_KERNEL);
> 		if (!gt->mem.vram_mgr)
>@@ -80,7 +75,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> 	} else {
> 		struct xe_gt *full_gt = xe_find_full_gt(gt);
>
>-		gt->mem.ggtt = full_gt->mem.ggtt;
> 		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
> 	}
>
>@@ -348,8 +342,6 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>-	err = xe_ggtt_init_noalloc(gt, gt->mem.ggtt);
>-
> err_force_wake:
> 	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 	XE_WARN_ON(err2);
>@@ -370,7 +362,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	xe_pat_init(gt);
>
> 	if (!xe_gt_is_media_type(gt)) {
>-		err = xe_ggtt_init(gt, gt->mem.ggtt);
>+		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> 		if (err)
> 			goto err_force_wake;
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 8bf441e850a0..a0f633109124 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -97,7 +97,7 @@ static int ggtt(struct seq_file *m, void *data)
> 	struct xe_gt *gt = node_to_gt(m->private);
> 	struct drm_printer p = drm_seq_file_printer(m);
>
>-	return xe_ggtt_dump(gt->mem.ggtt, &p);
>+	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> }
>
> static int register_save_restore(struct seq_file *m, void *data)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 6f4243443d04..e910ec1b8dd3 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -14,7 +14,6 @@
> #include "xe_uc_types.h"
>
> struct xe_engine_ops;
>-struct xe_ggtt;
> struct xe_migrate;
> struct xe_ring_ops;
> struct xe_ttm_gtt_mgr;
>@@ -174,8 +173,6 @@ struct xe_gt {
> 		} vram;
> 		/** @vram_mgr: VRAM TTM manager */
> 		struct xe_ttm_vram_mgr *vram_mgr;
>-		/** @ggtt: Global graphics translation table */
>-		struct xe_ggtt *ggtt;
> 	} mem;
>
> 	/** @reset: state for GT resets */
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>new file mode 100644
>index 000000000000..7ef594f301ca
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -0,0 +1,52 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+
>+#include "xe_device.h"
>+#include "xe_ggtt.h"
>+#include "xe_tile.h"
>+#include "xe_ttm_vram_mgr.h"
>+
>+/**
>+ * xe_tile_alloc - Perform per-tile memory allocation
>+ * @tile: Tile to perform allocations for
>+ *
>+ * Allocates various per-tile data structures using DRM-managed allocations.
>+ * Does not touch the hardware.
>+ *
>+ * Returns -ENOMEM if allocations fail, otherwise 0.
>+ */
>+int xe_tile_alloc(struct xe_tile *tile)
>+{
>+	struct drm_device *drm = &tile_to_xe(tile)->drm;
>+
>+	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
>+				      GFP_KERNEL);
>+	if (!tile->mem.ggtt)
>+		return -ENOMEM;
>+	tile->mem.ggtt->tile = tile;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
>+ * @tile: The tile to initialize.
>+ *
>+ * This function prepares the tile to allow memory allocations to VRAM, but is
>+ * not allowed to allocate memory itself. This state is useful for display
>+ * readout, because the inherited display framebuffer will otherwise be
>+ * overwritten as it is usually put at the start of VRAM.
>+ *
>+ * Note that since this is tile initialization, it should not perform any
>+ * GT-specific operations, and thus does not need to hold GT forcewake.
>+ *
>+ * Returns: 0 on success, negative error code on error.
>+ */
>+int xe_tile_init_noalloc(struct xe_tile *tile)
>+{
>+	return xe_ggtt_init_noalloc(tile->mem.ggtt);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>new file mode 100644
>index 000000000000..49b64d83ce91
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -0,0 +1,14 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_TILE_H__
>+#define __XE_TILE_H__

we use 1 _ only

jus cosmetic issues, otherwise LGTM

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
>+struct xe_tile;
>+
>+int xe_tile_alloc(struct xe_tile *tile);
>+int xe_tile_init_noalloc(struct xe_tile *tile);
>+
>+#endif
>-- 
>2.40.0
>
