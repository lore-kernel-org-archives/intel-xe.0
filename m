Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F44CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 15:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041E710E0A4;
	Wed,  1 Oct 2025 15:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2Jg0pTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFFE10E09F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759333979; x=1790869979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=avBr53LzbsiBe/IAFvD/cu74E/NtQHgotvkf7tur0eE=;
 b=F2Jg0pToXj4AB7hesTLGM3Oy+ooz4Qi8kFTwiyh9CLUXqTcw1130ZSfw
 zk3ZIccGhUe1sH9tgJv8UGFBQlUSYJHgs0J5u04VzXjw1C4agN0Je4cPH
 UKydBQU+Gv99xqfop+GNdMI3PRSBxSWv2GxH0fA0Fz2d6dmOF3s4YfRN3
 N2+0Wl33expvmTNsh4mzkcXHlb5pDHeNDgCTK7ImsjkdudYnZjRZhQ27e
 sVa5M0+5Y/h0vRwMeKe/DvymoQWY2TcsZ36N60lD9+l/XvRDYL3VZAhuf
 dNIu6s++tQOnSdoiIJyrSQfA87tJGPP0Gjym25XwnNyisWTt/Nd/Lgtel g==;
X-CSE-ConnectionGUID: kMsE/lkCT7Sdu+TiJdw0Ig==
X-CSE-MsgGUID: lrL7rXV8SNaPnPXvm0I6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61524822"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61524822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:52:58 -0700
X-CSE-ConnectionGUID: JYTQfQlNQC6sCO5t6FOfWw==
X-CSE-MsgGUID: a8vC/LLZQ7mhD1XlieDTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="179253163"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:52:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:52:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 08:52:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DciFad+To//WhjP2RGIU5u7Y/S+ImJnRj9amQuP7x69jN5VRJIbVthsFTnhsEGHhFLAld2YEznGVeZErCRwLAVBnQeGt15/e9vkikw0Oh5hBg+FYdnACQ4/CRvYyvik1iOceacBm3x3icRy9P/EUkpjSA37Wv1mT+d1bC+aac+gUJJ77d9MDzGLBh+OCZFisUZywBXp6NGSw5ESk6hCTpNUqRDBAMnaWhOvpSDZEhSFnY1J2nMUTlc9PaUxUFn5hJCXxmm/6INCGDjKjwxYEDD5ocCwgPwmBH2ckxFu50eqrLm5EO5Rk7LyhTF+D/5VVQkfDF3leZ8ta5oIZZUgSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed6cNT1JPla6pu6UiMQW+Bq2u0bcJ8Qk7lE3XZxv100=;
 b=NqYaTtNacZwBtVPmTVRwQ8A5XONuyhZlBkxAoSpaFeSyf1DMfpgMHWqV+hEi1CrN12iIi49cpviqJxIU21RqUxTMLpjSsX8W5VUVysOCSyACyBLnZfZCLUERTWQwTF/yZkNQoRS7RNY1o0kXJ1ssEiT1ODOcMi6pMRPo3Lmn08bF35SG1aS6gfMgvSLQxN8G7kZ6V5+jV6uZfgNHYR7Jtm9n0xoo+IaKlW2B2ekMVmbgPdN16Y++e7MVes/UfasVUwVyQp+x6hri/dT++3uuWFFHzqmDl05TUTSqq5e1F8oJmarL+toOsJVtEl5hnNlxMlUVG/yU0EDhFG1wlYaQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:52:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 15:52:53 +0000
Date: Wed, 1 Oct 2025 08:52:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Detect GT workqueue allocation failure
Message-ID: <aN1OUtBx7kk4nt/e@lstrano-desk.jf.intel.com>
References: <20251001144051.202040-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251001144051.202040-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc566c4-595c-4381-0c85-08de010294d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ky99s2sQZNQQiSiQeUb07jHJMfiVg6c5riBXwrYxe/0yw4hRcDqI5F8T9wGt?=
 =?us-ascii?Q?uyMRBrNGvEuawBV0f+d39qeuP5r5de0ZUyBhJl4LFeu8bkJzUWKRRe1J2qnq?=
 =?us-ascii?Q?yQICoQTV2A4lc2IbxXr5DhCwgkpFJT01xG+sTeom8vRG9FhjeLqtSuX6k2gf?=
 =?us-ascii?Q?F/4x1k96hj1Sb9f7u7gQpVRi+zTWZUPskPb3W2rwwG5vAT6vSiELOrmfvnoj?=
 =?us-ascii?Q?19A1usQelTP7n+ba9lellY7o5DrpFGL07Hmpp8GSasY5941VdG8/AHWey0rk?=
 =?us-ascii?Q?xxIaUVsmYrzytGnsibH3l6YpDaxrC1KAqAzMm84SVFDFA8aEgZOXc+ITT+lf?=
 =?us-ascii?Q?0bsVjoD0ukvq2W1gwZK6A5Zq8lJiPq3an3qaQdKVtMWXpHGe1RcIC+RQZJPb?=
 =?us-ascii?Q?mwc+qzehMKhRwYHXYqzJpxwJhZhrQMedIpdldn6s7gNPxWyotL4+blKZcurF?=
 =?us-ascii?Q?l+7b0I8n8a1OBd6Z/b7Kmg7++y2YNoa1aeqMsntl/fssOsXg5WGHXnrYYuch?=
 =?us-ascii?Q?wf5RVfFlhrf2WsKIM76UTgZ56TAFs8RtbcQyHD61ixAZGZYgAR6xsOxO8/Dz?=
 =?us-ascii?Q?GCYIwikrUqDuilqswRypaeN7oCarsfLW2KUOO2dhmngtH2iocVa9WZvAmRCZ?=
 =?us-ascii?Q?GLLbC6AnS11jsbrDR2pu4ksVYrrwfmEj8A7Vt9G9e/0oTxzlaCbhE7HZYEhp?=
 =?us-ascii?Q?Pldr+vgPCH1ZRr4zz64s4BrdQYYn5pDFF8VmpZXL3RenMRARNoBSLwE/DRmi?=
 =?us-ascii?Q?HRXVwpKkmzTEZC/zMFUK3lxXKtZbjqMTwM8TRcS6U2kf72eIE9/tGOBV1X3m?=
 =?us-ascii?Q?PyAQXHPbDKDdKDqWIu+WWQnD9uwuW6CWi4TtzMVemZURdCMcgY8byvoEuiBf?=
 =?us-ascii?Q?FLloxS7I9z9FCWzPipce9UeeSENsBXFKsr85cOvexPtyCoo11ERSCgviORDz?=
 =?us-ascii?Q?iilI/bJJEoPBW2/3JPTBdihAbnoR/iXslefvcs3xOWHzX5GkdZMBDO6BUdKE?=
 =?us-ascii?Q?Y4Xhy08SBtmXqrbwUvb60qa46UrLhNK7FbIxR/BhV69LhJksaednmEXWVRr9?=
 =?us-ascii?Q?ilbnk7eaBf5C45jti0LqS0Z0rX+lCIYrKkPGftOlNAXAvK+2WcIqtLomHvj7?=
 =?us-ascii?Q?PsL6t1Te7mAqCac+i59CrKq3DYkBEetdY3Su+FJSq3jIndAHZlOOR/KvlYo1?=
 =?us-ascii?Q?NjZrTgq4LMjpnBpWOTdzBtUgiTmSJRcjwxUzfK/2raPXtR7nEPD3FyC2VMEt?=
 =?us-ascii?Q?vb4Obj1TDsNvUtW5jWuh1kWDJcbnNSS//TmdvlZmA7dPH8Qs1RUFtn3jqp/6?=
 =?us-ascii?Q?YINTSnh982N4g1RrGRd4x8PG1ytRGcyK2af7teO6spQSJQAqCulEGZULQ+My?=
 =?us-ascii?Q?xqY8lT9J+/rYyCq57337yOMj8jV9f+dlvqlfx1voyT7oK+hLt7pkemdAww2x?=
 =?us-ascii?Q?+qra4iQEFHBUhlJnamW6dRxD6zCEPvXO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJqeBFyUUG6GXnGPHd/RDZTL1yzZRsC0kuLmlG8bitSY9uPUlNAvbeoNB1Nm?=
 =?us-ascii?Q?B1gOXmCGuc9y5mHXgCJRBWBXuGmZzWA9ttZk7+4kUe5s/Cr/GgJ+LpixUADP?=
 =?us-ascii?Q?nrIw7y/COBR5RDbmGJkVsYaRQsMoHHiU//DC4XoqlkORo1cMBHUz67qmpHl4?=
 =?us-ascii?Q?Rnh9Ms25lYJv33n8nWEZs/0fWv8LrQCxkrFM/NmtWJcrqYVL/JuepbCrxHUR?=
 =?us-ascii?Q?qQHwNDbJziuJxS1bF0yeljM/T51Bmqz+DgMn9Afrm4TNCx1iv6Dvx6W5PDI9?=
 =?us-ascii?Q?V4Oto9B4hJxfXDJF9LU5szleimGhdOCMBdhlfTQjTMqPE7KAkHI9t9SVE8+E?=
 =?us-ascii?Q?X7KSCfrQ1nzBF7sOPNMu0X3BrTfA17UDh3MrkRdwDHirP/96lUOgLNPpw+tf?=
 =?us-ascii?Q?kW03WeqcQOPa3hmyTXfdUMIWydykQK2/CPgsGrzrlxwOCxeHkT0q5wl2W1uf?=
 =?us-ascii?Q?/OSTRAGr1t27X8mLGx19ZtPJZwY3WnHmGSZwVV4cX78Y5wKAMQJKbrQmX7Vo?=
 =?us-ascii?Q?uYoZT6jrUq0x5l2PqAqS98hXnna2b+OkwqFxZqEZlhzkaRyzL0oxt62WU8gj?=
 =?us-ascii?Q?0HAeVxVy94L0YCU7z6QZx3MpYX2Fl2z1k7fGcQ2TT5fk0G/ZdBcq8yjAqZLa?=
 =?us-ascii?Q?KZ1GakS0IWUp5OC+7gsJMfmE+oboOTrnIKQrF7kZ1yEpjSzJ86eNXAsPs42c?=
 =?us-ascii?Q?ryoHOX4K6811W5kV21nNxGTC4+IqrJnNgNV5BQuJVNSdcbBqY/UqTTiMqgZc?=
 =?us-ascii?Q?UvujwRae2+XxIy92C9YorRdCVRarpySgnAIkLOWejX5nnfsFs4zOR6iuP7Cz?=
 =?us-ascii?Q?Ggrys5zFDR6EHmBQLYHF4HukR98uin8GFBBX8MvSCz9x4WCK8BvvSwPA7IaU?=
 =?us-ascii?Q?+Xjy2JqjPx/aFK37ikhQJW+q4IUTbc6R2MUuKyndr554RdAaoUdUfRYju8qN?=
 =?us-ascii?Q?PwfzpHD77hb0yBB9Y0XzixR7pPXKGNodr12DgR6DK5xIOXHjrn31QYOtn2IP?=
 =?us-ascii?Q?3oFTrI+pEbP55KY5WSv+O9qW6GRnKlS2kGRIu8pBe/IZRBicYq3Ngkz4fGJZ?=
 =?us-ascii?Q?iqvkDg+Or/Yam0nNRtrNBItwfxZPDs6za0BVIgKf600WWBHPoEt3lyHMFqCj?=
 =?us-ascii?Q?LYM4QzG4oFnjRmTKjxOv3p0Lm++X4u3TNW9wjHIoXj7Y1CT8Qh8AmsHY25nL?=
 =?us-ascii?Q?DC26ihbYzud/9e+LV6pHka7astJWB2Uat5jYquteSZSehM0xPnEdoQCmOqey?=
 =?us-ascii?Q?9Y/ujx8wN0zSQ+H9V1P5nCFZnGPphwr8W2nanuCr2jp0/nel1c2dOdIFUsIE?=
 =?us-ascii?Q?s/b0/tb4kWT36HNX+Tt6R6+NJtrzhQuIuYBX+XUM/iaYCAPCBvTkwmjwz0CC?=
 =?us-ascii?Q?BpNgypGKF6QvEdst6tdWMX28gYn35HXOVYTYWaefW2KH6mEbINO0hkMB/JRD?=
 =?us-ascii?Q?qNbkgVwWhue3cO+DmtrPBNIY76171zHaLleeR2NkvmWoWOiLd4D37tHJ6Dtm?=
 =?us-ascii?Q?NbBajBZnGCgsObA82k66QBXu7FT0VrhoDZZgtAtpHUBd6BT0pJVam9MxK9KJ?=
 =?us-ascii?Q?lpsBPXEvnvXp6aj77GI8rPi7ZKUEioaXA3/Cpm95ekqmiTJio10b54+ggvrI?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc566c4-595c-4381-0c85-08de010294d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:52:53.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DFEERhCPnGUmsosgEplMdXmM58cSZnEX+81zpot5a1wkX2Nm2GP4BSihyq0CaO5Peb2HRAaDHqVdvx52wGjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
X-OriginatorOrg: intel.com
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

On Wed, Oct 01, 2025 at 04:40:51PM +0200, Michal Wajdeczko wrote:
> The allocation of the per-GT workqueue may fail and we shouldn't
> ignore that.  While around use drm managed allocation function
> to drop our custom fini action.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> It looks that besides many changes in the surrounding code, we
> were ignoring that failure from the very beginning, but maybe
> it still deserves
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

This won't backport cleanly as drmm_alloc_ordered_workqueue was added
recently but patch looks right.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e0ad7e5b5df..b77572a19548 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,29 +65,19 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -static void gt_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_gt *gt = arg;
> -
> -	destroy_workqueue(gt->ordered_wq);
> -}
> -
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
> +	struct drm_device *drm = &tile_to_xe(tile)->drm;
>  	struct xe_gt *gt;
> -	int err;
>  
> -	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
> +	gt = drmm_kzalloc(drm, sizeof(*gt), GFP_KERNEL);
>  	if (!gt)
>  		return ERR_PTR(-ENOMEM);
>  
>  	gt->tile = tile;
> -	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> -						 WQ_MEM_RECLAIM);
> -
> -	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> -	if (err)
> -		return ERR_PTR(err);
> +	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> +	if (IS_ERR(gt->ordered_wq))
> +		return ERR_CAST(gt->ordered_wq);
>  
>  	return gt;
>  }
> -- 
> 2.47.1
> 
