Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AC8C7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 18:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305F610E60C;
	Tue, 11 Apr 2023 18:31:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8A510E60C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681237905; x=1712773905;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XFcPUYkLSAu5iyf8GzPrRI+7jmYTg2pixRSRRZ7Qg/E=;
 b=ciVmCPXcfiQYuYonCI27mvPGdKs9oB0ExUXT21HxTGC+xyS5aZvnci5l
 PslgEvnl9mk88LQbCT9cPNIdBzQGI9vpqixYnJvy/Tcp6JDpA1cif3q1f
 L2q/kHW9yhxSzaDNAPDeCkSRWoYYpvzKRO2d9yOFY4rk+afvUMU4loIr5
 w9Fq+itZtvoirXXdUUKNWmzPqViHGRJFoat1+hmwBMGfSTK1He85C7t3K
 EcLut1OpEDeQAWR5Gcp2e5uQsRj2gpftAmuRlI3HNZ+pGXhE/AGcDgCfe
 z1u/h2vak6DYIFhRxm15TIMMjmhu7vU0L/uoJSQq+Jiggz7OvCQBQDY/N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345491595"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="345491595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 11:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666062574"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="666062574"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 11:31:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 11:31:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 11:31:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 11:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5IIcUHtkDe471+PrRUIIjRJfdtlYKyazmccHZye7fyHcLUpP0hbgPeNNRvFvZXi+N12r7MBmGpIswEWAo/G/z5i/a7BuiAKXI2EL8iP/7gRIyEq7qgcHejsKZ7+aPlrMAYnHl5262qhWL2bwRnviN5szxyuyAZfsaiXAa5U2E/+Kq7WIHJ+Nne+mJoeTGqXQbNor7qZi9x/BytDWA/1K+wcYN7OeRVxgXbUWPVUCvN6cHan+a9U17vmGwxHh+mrZQ2m/C8XXoMfn0eNSomPYb/y53KMb6k+wSjDJKEOdKhk0t0zjLJz3y7wRBKrWmLy/Ba7nR8w8XrWUOjkcmkt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTRU64AzbcxupWuUhalw6Afwc6e0aYWxzRSggLRML7s=;
 b=LPm3ziTuxO7VQMkTkB/55xt8JTEPaM3ov3kjLMUCXM0JZxh+MxtQ0FSnUs/7ByozFbZU5OQs96PRzILyTT6qU9DAf7xv4dUYRo9qPLhvytFblwkzgau/BBt9M+Flg8QvHMSVVYiO1XK4IrrKY9VUenQZlUluqprVOVlg0D2yBo6moylxLHbSFz8qt3+h8Z6/TsGEwjcbGbq8+4CeKWsMqncwhrPWowgrWAyz8N1Xz8wmPSbWP4/4b2QPO7I3slz8nyiHVX4S1XoW0jIo1/Yqcx1kMOShq+2Ae38wknG55nQsLqlULQQOkUkuroky4e0RdGLE7HScRl88kmyPBZ/uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:31:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 18:31:36 +0000
Date: Tue, 11 Apr 2023 11:31:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230411183134.vbq4if6lh72fc2xv@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230411100458.24314-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411100458.24314-1-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d79eaf-41ad-4fd4-87a8-08db3abafbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BWVjPvZYsysoPiI9cZ8Ld+rawv+wmqvdE8bEz5xUOAx/5GY4Aunp+ZFSH1ssgtxs42+sTOdP7S4W0IgocXiY3vXYlkZNj0/Vrauk6qWyHpOuV+ZWoL02PAqdKrgkFsnaLJ1EKFNq5U91L36yTIJVmAZWpeJlYWmWd7G9SIC2a0Iy/c5zOKyTYNQoej0eni0pRL6KnTvJ6vs0uXpzKvjFSpewAWoD7toghEEot6bdKLZXZsYz3WAnXV6RQ4dIi1OXoDCxh+ECPZuHHAGg7PZpFH1vDbq6PapZHuNRKaqrdiX3RyETD5y1BMns7N4w1jkHhcYe6Js83JS/5MuJ1Izm4pKCkNoU8kXOdtTcuNLHEsG4m8SRh7Y2o8Kn94CPzAQDvw+1Gc4ciWbvPj7Ab2lRu7Gb8hRc3WHmEoFYbcKBmTRxXE64tUKO86nw28h7CqKqXbTbhev/KaOc62WIcSFiphMe+z9vFLQAPnaFul8hdNvju/8OUnBZqD6Qj8K2MmpMqhnCSugkYqqLh+0qxjE8iS/jCdBNuRnD3dY8NG3fAd/1sZHF1+FOi6I+8ZU9iA/n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(66556008)(8676002)(6862004)(38100700002)(8936002)(316002)(82960400001)(41300700001)(66946007)(4326008)(66476007)(478600001)(6636002)(186003)(36756003)(2906002)(6512007)(1076003)(9686003)(26005)(6506007)(83380400001)(5660300002)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/HfHHrbD93bUn8oUOaCLpMD+ymM6ektQfGsR3c7BpFjRYd20dAn+Ggb5q7?=
 =?iso-8859-1?Q?40DrFWcJoLgLnOvva/1I8PBQXlI9iXnyhvx+38u4aaP0GVWJm3pAXne8Zz?=
 =?iso-8859-1?Q?S+R9cTlMowsQmjh7r0qNWBbyP5+OZH+Mpvj2C9jVDUGtn5+546LKzwmGXN?=
 =?iso-8859-1?Q?J86p1wR+X2NBlHutEmIknUprGRWnwrHF1kACKN3qPquo+9h8O5mu6E69o2?=
 =?iso-8859-1?Q?cmT+B2dCi1p9ELSkTgF9A8fySyxqavFqsOwaPWSfkdSS06kQVDSGlYIOOg?=
 =?iso-8859-1?Q?eicQVLpCOq+/lNyIuFJi+2Ln1jOR84biPhXZ9HKzYDdl7PTZLW6gNsssue?=
 =?iso-8859-1?Q?t6Z78Uu9aDmL6g9ss1g3kX2kOb1/891nLIMDdtHiOawP8MdWBpoFkeM3uq?=
 =?iso-8859-1?Q?UO2wyzNmcNrJUqSVcWs/lHZwNjc/qzMPLhXJC32jrVA3AOCILunuUK+Qd+?=
 =?iso-8859-1?Q?mPaEdCRKXifg7q3uhdV2HCmkl5AnWER3ggVwFJ64TEkL2vXtgdmwWcs70i?=
 =?iso-8859-1?Q?tuttoFMv2cJGUN51WJMbQKGzsHDbXXZk3mHXnsEvSQqE2PHVOL1pBW9Cvp?=
 =?iso-8859-1?Q?mIR6LyI3t4MjIwkyduWU86fmO9Q2PdNkC8xDbH1XxeS8M0dY4BjWFStfor?=
 =?iso-8859-1?Q?4SCRAbWex0TCF9fAaDNFnDBKcwySRk2/aqsJshgQEVFZ/Ov0vHpZ5EqoBd?=
 =?iso-8859-1?Q?c2tsNqBQ+TCgOLO1wsg32QxsVPUOkCrbq3rKR+d7N3C9ecuP7qVRAtiOE8?=
 =?iso-8859-1?Q?x29Mng9Oj9xHY375xwvRrfGXxiwXGEX7IzLmAERFIzv/5B5hlVdAbCL+F3?=
 =?iso-8859-1?Q?rSke0KxriMB4pNhEexTlyG2srNdU17+Y/xAcQCnKsTVY9IWT1ikPxUTzSN?=
 =?iso-8859-1?Q?aWhSHnzI1KI5oyj5dTSyaHbGqZw6gdmbumszXOrS43N+T2PHLB6g9/lQsy?=
 =?iso-8859-1?Q?obKtZ7scJl/VJwkMA2u3heuo812Aa3Hfsvo71exzLAmAcqZGkEz/V4DyS6?=
 =?iso-8859-1?Q?43tLy5GLdMDcdjEP9qCi0Ejd6rGmQoNewLS7o5Zbo/enGK1tV3TKLB4uCD?=
 =?iso-8859-1?Q?vir6nXQnPVWI4Wyz31tXfmhbVtS+mrxkhCkE4RAjr3y0tQ9rpTFIDiD95s?=
 =?iso-8859-1?Q?TVpcBqLf46SqiMwqBubr8HgDZHZNfOAbmOX1hCxETnArN8cTbWPs3ZPGab?=
 =?iso-8859-1?Q?0JVuQK+J+2Ne5wx4roCsSl7mTdl/+yoTsCDPitGypRt69s/rakPlgLLqyX?=
 =?iso-8859-1?Q?KbxiK4z+cfVygCqj1g+3G5zwMt+BnHa70W4F2twPEsBVz5s66tOnkuvetI?=
 =?iso-8859-1?Q?qkgx++yOifWQIuM4xfp7g1oU/9X6M2cGeuzEcmIzbnwQzmWzKDC4YVUC7U?=
 =?iso-8859-1?Q?V69lblGkjJEWr4QXi/PJAEwwUqCJjG5tJPxbDCsz1ZAI4FQhDkGcPsPEc+?=
 =?iso-8859-1?Q?pStwpfAlt8AkJ6/93heAS/d443MyeUq2FoA08EizllWea7Qdff1ZQ8yRH5?=
 =?iso-8859-1?Q?CB8xl5t5c9R43hwiYmRwttHOqhqyjkkhFX0YK7LA25qBHkrXPe11Z3gpDZ?=
 =?iso-8859-1?Q?gqfw5Op0sg+//SC5GkGb0qEat7nFf/M5kWu6OWGqIIVfRr9uA+RWqbu0Ix?=
 =?iso-8859-1?Q?ABBqv6BM66Bh/r0imecudEfIyGQxsUE1nId++HlFJ5qFzqNpuTd68psQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d79eaf-41ad-4fd4-87a8-08db3abafbb7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:31:36.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zSt+X6z3HWqGeJk/Zd9ZowY8WlJcq+NJ72ysgXBAims8a1hSd2DaPIjYH59Mfhlu3igjtmJlrsAChgYewFN4ake4qAfeYuTXsULy47ao9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: stop incorrectly triggering
 drm_warn
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

On Tue, Apr 11, 2023 at 11:04:58AM +0100, Matthew Auld wrote:
>CI keeps triggering:
>
>xe 0000:03:00.0: [drm] Restricting VRAM size to PCI resource size
>(0x400000000->0x3fa000000)
>
>Due to usable_size vs vram_size differences. However, we only want to
>trigger the drm_warn() to let developers know that the system they are
>using is going clamp the VRAM size to match the IO size, where they can
>likely only use 256M of VRAM. Once we properly support small-bar we can
>drop this.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 5cacaa05759a..7d62fae25bb4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -228,9 +228,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
> 		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
> 			 (u64)xe->mem.vram.size >> 20);
>-	if (xe->mem.vram.size < vram_size)
>+	if (usable_size > xe->mem.vram.io_size) /* TODO: remove once we properly support small-bar */

The fix looks good,  but I don´t think the TODO makes sense as it has
perf and uapi implications. Maybe we could downgrade to a info/notice
when small-bar is fully supported, but not dropping.

For now, I'd merge this without this comment:
	
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>-			 vram_size, (u64)xe->mem.vram.size);
>+			 usable_size, xe->mem.vram.io_size);
>
> 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> 	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>-- 
>2.39.2
>
