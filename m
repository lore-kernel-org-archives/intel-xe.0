Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B770C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EE010E135;
	Thu,  7 Dec 2023 16:49:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDF910E135
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701967791; x=1733503791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zSC3Hyw4sHxFSLTvOp7TYz+jaX5+XxYGr8qHQZBxc6M=;
 b=lEboO0L4En6WzKhpVDjPVLReGG8tdGlvOLE9jQXrTX7WdPHTC7waHW2m
 lafy7rp//3aOqCkNOq7rzGcf4J9nkCCi3SpZ2ZiNhnuDaXClc0tPpcIl6
 AYU0hWwU3VgxIWl/lFOIYwkJAwDXgffp9nFd1Nri0dwRYO7pY1e+arBaL
 HHgQhnMomWv4k/2d3Lce13W/5f7QnAOmKk4z1DS1RQFsc3iqSEGLLxyRj
 s97+TUongmmAcHlGwVjmv10viuI6iJqh3FGdFo3jQOY3HaGipysKOedxP
 zzxZpT+rujkCHqDwM1zqmqcKErSqqrO/THLnONecXogMziGWft4gnJPP1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1132143"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1132143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800785403"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="800785403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:49:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:49:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:49:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:49:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8N3Jk9/sz3s4a9UUTvLIva+wQS3jEsWhbkaTVLMh39ZzJ+1ME0YvdEsUxYoUJ39PQXeSl3w97lVujsQz0GM8GFZXa7yQPAgP1w9XHZ9ukEU4A/VUy1geMo+g6JzLAN2EzO/DpIzIaDk7UOkFh6S3HK/9X3vzUNaDDz1btqkRELhLDd/cG24rhTNSIlx9T7wOA2VOMmDciOMoX0tMsDA9nFV4qoVrlUGJPiZqFDyJ77idccJ+A6Jqy614m7uUGV0sQ835mk0YJtAXpZveW7FPgIFMgSbrCUb/agq20U/PT7FiWT7iJ8Ouer5UxDMbUuea1Pqoz9Ib0huOGgKBpdzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAOyD5Tyx9LvMepafz11S0HRNVNu1g4ilAU+1Px7Tsw=;
 b=UrvMY6eHy+LN2/Sk/ouf23o9DEun8RLk+0S2gZYIGcMHWS0wpU2imREakNPCybD2nwDMqr3KfM7kitJV73ubCLT3b9nLyO6JhG8yLlGe1f8HnJX/MV/qyYxUKxmsPg0Ez8HekNRFcIIBvNaxLlvoFSH0QepZlZavphsD/dlxrL0tYbICSNrF1CyrHxFkdjrzT1UEg9ArqvDxEPPC4UUNDo+BUw25b2E9FPBzP3BvN6ANVk19TV3YZfXjNU1gLfvqxk6sr/zZBxEubhpvNz0aBKikwrkaxKy/TJuni1AliIi79OlPJcRvQC1bIKUq39xQw6iRf4YaK+bZBxGFMo21oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 16:49:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 16:49:42 +0000
Date: Thu, 7 Dec 2023 10:49:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Add IP version and stepping
 to GT list query
Message-ID: <vmiwrrk7nhwkaq5katncyrd75shronarb6k6zlz55ezpakryxd@5kcrysp27kvy>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231206205034.1105637-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 185198ef-80bc-4c74-c235-08dbf74482a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: poVnPI58jU/zCkuv+lRrP04TJq50TeI0ZarALPOeGzCkwhheiv2b5RHKrCZ7pw1MtBc/VZLpsuoFzFxUNBgM6aAER6Zgkxs/yMXEYkQfMyZGL3pwaWcIqh3MpULHj9CLXlWJ5rd6lj5QIVlWRmhZIRdAqDdRA5jBNT2WsjgEqcdNVU83KLjRgUpQfiHy7xKZ7ccHent8MI8pLGeZlWZ6YV/fvycCvJ9TNVGWCoX/Gbjx2d85WKfuFcuLSrqh7xt/P0ErM9xu0VJpEWMC+SsoOo4zz0cOqwX/0ThZJIDGds607MNJRBUKp6ISiDkJ2bMFKtK+8VQe+4BvOrdqpZiHfB1x0QYFas+iqsJwOZQst0HI33mtdkbfNm5xXsvCWMfCbxt9PY8Mx1mZ7NZ/A0ozAkpruyWTdbWXfu1uCztGYct+/WOEjNFdYmF7mErHYLagr3+mEilml7j8PMOoeiY3yPsT3IU283Qs/yfYtzrSSZlXoQIGGO8prKq0hz3Hvolj6cl+oKtpDIJBJqp+hjK9phNgwnNBA7pN6cGpyBKCrCwzTbTyG5GnwNu71iK4eW1Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(9686003)(478600001)(107886003)(6512007)(8676002)(8936002)(6486002)(26005)(6636002)(66946007)(6862004)(66476007)(4326008)(83380400001)(66556008)(316002)(38100700002)(33716001)(82960400001)(41300700001)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XpzH8SLuIqMn3qnQDitG2bkZVEunN6JMPTXmDFZATIZ/6b8Y8Zi3aJyzr9Qj?=
 =?us-ascii?Q?UxMcpuPZlyGUpp0O7kR6DS+oBPuRwNTglv6G6bbNAwz1R+pmhPuGa6sHfv7i?=
 =?us-ascii?Q?28SzRRRaCyy85hI6T3egvb8PTBQT6eKhOWQfvgSgzN9xaecCJ1lnE+RQ0Gws?=
 =?us-ascii?Q?tuEqBkRh481Z0N1wLINXG5slMY56zPk/9OXEYzXRCLQO2O+uc7dsYsHh1S3Q?=
 =?us-ascii?Q?LnW4RVVxIQF1x43cLqQSabC6lss1HMN2LYuhJfoQWQhEhhSnulFzf0FnMGgM?=
 =?us-ascii?Q?gYC4+r9KtTDEIrySV4sQ8bP6qUgRVJxvgT8lg8bmEkNXznjqOzgKJk+dSE4P?=
 =?us-ascii?Q?kZWIbL+prHFXL39Nj9Kj0TfZdcPuYgI68pcUDtdo0/C0MQuEncipyNTwKpsz?=
 =?us-ascii?Q?M33eE4nRxin33kZLfRBY/fPG+kbYfXsdRiI1oGTlraaFZV/sCb4DdxFRfzqV?=
 =?us-ascii?Q?ayRfFFJ0/BImEBntF7NrYQpo53bfH2npBO9VL9WmIMCKD1R2GGVKBqP24InM?=
 =?us-ascii?Q?/80r+3ESE5NSfeQ/qbz+0RDhldq5zUkn9x3DKReoKQJzwWLlwIXkspe0W0dQ?=
 =?us-ascii?Q?zdCbuVjIP4a++wiNqDgdU7sMoMB0mzzcn6aZOrUmAdpRuToZ4rbbt7eaYzGf?=
 =?us-ascii?Q?1428JY1+1tlOtbT5H/RjurKFAhvKFMsUAoLqk7op2BCP1IA4x663gapFl4wY?=
 =?us-ascii?Q?KmFz6YlJZmeH4fShJmEm5bp3lJ4wwk073murCnGcMtB2R71aUmf4JkEcZhde?=
 =?us-ascii?Q?LSk0dP0+LkpHdQruPKX5wCdUzhX3NpJ3sfebHDiLgyVaOKiQxAED/XUfImzU?=
 =?us-ascii?Q?V92D1zvwY83RRSL7GhoXRw+OGR7asTgu43mCi2SZ7uOBN9A8BMjYtEmaz6Q3?=
 =?us-ascii?Q?7sKxV9Eg8R2KjdSR1wfaqpNtduYDKJyJYGF+YajyBPo2k+DdoV0C3yEwljf8?=
 =?us-ascii?Q?na+LjXbUQbH3hnlweOxj7aTQNnqtly3wRAigHoAQ4ZBxoU5UdBv4zTx8oR0Z?=
 =?us-ascii?Q?sW9O8cqvqKsx5l/QZtOLvUz7/ePdGG2QEP04PYzcKNDg92Ndq4xEsVWWJcSj?=
 =?us-ascii?Q?o3TUK3TNvpEQXqd+oGRUQ/Olen/c6whnbYXZX6a9fYoiUofB/k1XiSQtwbRg?=
 =?us-ascii?Q?whW3zZj8IxonhDdmdGUMQFIySYhgGYLd8m+yIo8hCoia6leTFs6jS8BeFbiu?=
 =?us-ascii?Q?t1KzTubMHj1EBb+qg3VyKhPN0Sl2m4tLStcWZ4tCarUtklKa8w+3L5+qZhY1?=
 =?us-ascii?Q?q1hvkGFseQuVMRg2OsUXDYNYE4UY7F9Z12K/ZSvfYUalR4+ip0Ur5wMOBSti?=
 =?us-ascii?Q?8kLWdlMkNz9KM5Y3QESL6iWo0GmjYr7EKazoM/xWeiSHbWEd9wxCVeIbBqWp?=
 =?us-ascii?Q?j+nMF2/PcNUvgWzVk8Nuqy3sLrHvtdNHsF1rYCwtuSdNu/TY3umpkPRYKVzQ?=
 =?us-ascii?Q?ofpxg4p+5qBY76jR3zU472wPdwn3L2VSGtc0WNIraR/bIK/FufjKKX7e//PE?=
 =?us-ascii?Q?wEotCwH70XGC0M8oOdiEVwBuuMpFHS2fgRl1S0kL1Br9QlJfOMhwy9hsfIA6?=
 =?us-ascii?Q?RckTVWLuK9V85ZuNQ92S68Bj0JTwMMpz6yX5BnSOdmTLfIxcWHjxd1+U12+w?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 185198ef-80bc-4c74-c235-08dbf74482a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:49:42.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yCmA55VtkiNP36LK2wxo0kECgafZ6+Y0A1ed/wPA8rkzQ9baQuQf5mB8Ce21rOx2t1VqAR9LpcjzGKihTE0/ZhIHBSTQVHGQyQuKuMtaHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 12:50:37PM -0800, Matt Roper wrote:
>For modern platforms (MTL and later), both kernel and userspace drivers
>are expected to apply GT programming and workarounds based on the IP
>version and stepping self-reported by the GT hardware via the the GMD_ID
>registers.  Since userspace drivers can't access these registers
>directly, pass along the version and stepping information via the GT
>list query.  Note that the new query fields will remain 0's when running
>on pre-GMD_ID platforms.  Userspace is expected to continue using PCI
>devid / revid on those older platforms.
>
>Although the hardware also has a GMD_ID register for display
>version/stepping, that value is intentionally *not* included anywhere in
>the Xe uapi.  Display userspace should be using platform-agnostic APIs
>and auto-detecting platform capabilities rather than matching specific
>IP versions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c |  8 ++++++++
> include/uapi/drm/xe_drm.h     | 10 +++++++++-
> 2 files changed, 17 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 56d61bf596b2..c3e5163d40da 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -12,6 +12,7 @@
> #include <drm/xe_drm.h>
>
> #include "regs/xe_engine_regs.h"
>+#include "regs/xe_gt_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>@@ -388,6 +389,13 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> 				BIT(gt_to_tile(gt)->id) << 1;
> 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> 			gt_list->gt_list[id].near_mem_regions;
>+
>+		gt_list->gt_list[id].ip_ver_major =
>+			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
>+		gt_list->gt_list[id].ip_ver_minor =
>+			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
>+		gt_list->gt_list[id].ip_ver_revid =
>+			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
> 	}
>
> 	if (copy_to_user(query_ptr, gt_list, size)) {
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 0895e4d2a981..d84622f54e4b 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -397,8 +397,16 @@ struct drm_xe_gt {
> 	 * memory and memory living in a different tile.
> 	 */
> 	__u64 far_mem_regions;
>+	/** @ip_ver_major: Graphics/media IP major version on GMD_ID platforms */
>+	__u16 ip_ver_major;
>+	/** @ip_ver_major: Graphics/media IP minor version on GMD_ID platforms */
>+	__u16 ip_ver_minor;
>+	/** @ip_ver_major: Graphics/media IP revision ID on GMD_ID platforms */
>+	__u16 ip_ver_revid;

major, minor, rev? why only the last has ID on it?

earlier versions of GMDID from hardware had major/minor/revision naming,
but later started using arch/rel/rev. Not sure why, and it seems to
have similar semantic.  +Rodrigo

IMO it's fine to go with major/minor/rev as it's a more common name to
expose to userspace.

with s/revid/rev/, s/revision ID/revision version/,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+	/** @pad2: MBZ */
>+	__u16 pad2;
> 	/** @reserved: Reserved */
>-	__u64 reserved[8];
>+	__u64 reserved[7];
> };
>
> /**
>-- 
>2.43.0
>
