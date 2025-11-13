Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23091CD98FD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 22:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D637110E1FA;
	Thu, 13 Nov 2025 22:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEmQMErC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532110E1FA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763074746; x=1794610746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jhCmF6CVc0A3HdEyJUA/cTXu8OWr8DpK8kVy0Xnm0L4=;
 b=CEmQMErCje/cBSVvVdtZFNMfsdKopMOurc2xu3o4guZVhQB1ffyac7mk
 p97cd0M9MxEGQ8kEDdkufZsRgwyXWDRVtc1SxGMqo7IbeszS/nJORSI1/
 +w0RBBZcv2CL9b+7DGw3vjD5BxnLllMFOJrFZz0BjwoS3FqA5NiTZtadi
 dD51+7A24LzZ1uvZSOr5IF30742JU/kzOV9VUhlEzxUCqISFuxqdcftwj
 P8JAx0b9CiZlGE5kAgNK4/KXy0uYbsOSuotziuMOG6MMG5OnEb9y0R9Jn
 u5qCRtH7feV58hEPOILi0NNWYSEm9t8ybNst3mwC789Sd5mZBL7w87rVp w==;
X-CSE-ConnectionGUID: O0CGUGbkRFeV9hclQL9fyg==
X-CSE-MsgGUID: kpb3rNXEQmq6F6gLzth/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65327542"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="65327542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:59:05 -0800
X-CSE-ConnectionGUID: MApmMFfCQkS5j9BtUXm0rw==
X-CSE-MsgGUID: c4T7lJRrQ7eA8gqiqDdIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="188873943"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:59:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:59:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 14:59:04 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:59:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhCljomoKH1qzA6BD6uRFik6qQggF+kNCR8QFQe+7ieeuWjGFio4ksFNryOMl9YB6zVXrmd62HxVbd8Ykr6iSsulZJjf4BiEQkUzVIwJMQfejgz3ECvzDMpIiPWUbzufzVPwpAtcM6HhaZQj6g4ocvjbM5pYj3FukffBHyY5PeHMjJOhkNL5CvlMLNWe1cZoJU3WOS20BYMZlQuBHmDCSuVngGiIYTM0tGVTiXVYbFmGDDk9VhE/yHc3214Nnrsun1WBfUIdkvSoNsEyTmDjy/WASzmG1ZhSnwQ8Z9DbcYmnpxWkT3rxw/nvA0QhBLBANd+dpA+Irnq7gbQAQGANTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bDk0q2S1kEPmvdwCoxuXclfhvsel/Rbem8ZBsnR0QM=;
 b=ZEMGCEcxdJ5lgKXIBDwN54lXnP33RgUXlJuv9bcT3mKlJ8Nb8o3uc8rV1DeJBqKi4F5PNieAqT3ld/yce8IBT42YVeSYHCRm+q6HajlgHfAkVq8ftHqdqySMr4OtEgziXq3CrmXRp+wEo8+hwZetxxOvOlcH6OxP8jCuPBD4GQr7JM2/JRqy9x4ecPGkhqwdFLHw5Vgi/7w9YZL+bGsiVFZ+ne+DLvU3YP+J40DGi/D+qm71pvWq6ATlBOvuz8I5TWkx7yuvwMx6+9+DfKqUDxe/J9TDv6p8VElXlRw18gVVrcIayeALZDsPagVNvOwAazROvRE60krYeB9Wt2IZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 22:59:02 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 22:58:59 +0000
Date: Thu, 13 Nov 2025 14:58:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 06/30] drm/xe/gt: Use scope-based cleanup
Message-ID: <20251113225857.GP3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-38-matthew.d.roper@intel.com>
 <176303680786.3698.2888966281466967422@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176303680786.3698.2888966281466967422@intel.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 437160f4-2baf-43e3-0f29-08de23083b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hoFViobd19DJy8WC+MdMwzJzMY7Rkj1FFVhOVXX8+O2RdPXIlt92T0j1/3sU?=
 =?us-ascii?Q?Vl+7kCVnM5WDm3dRzZUqzKR84vVN4ynBIvq6MX0itF3dLilyiJzc86JI5KRK?=
 =?us-ascii?Q?7ehWUwS1KrLpmajq7w3PDuzJG8Em6v6ZHGtuc8HanRSy9eqFqs0Pl6pUMi7r?=
 =?us-ascii?Q?QzqUI8j0+3oHsyR/b4AVN522rTm8VwBlHdR2xkTjuWtuLN7LqaLKuqy+9ma0?=
 =?us-ascii?Q?lpUyDnvanJACvvL3lQlY6REfVIMks+AfymT9tYeksJDqP7aeUActYlFMGrwV?=
 =?us-ascii?Q?pit7VA70ukSG66IHOomV1uoQVOqdITqtiOyXtkKxmh6A3wria0SfF9H7dWhi?=
 =?us-ascii?Q?pmXapzZFnGf/n41CAD4/Qo/YRtLU0oRYdo/RZtb0LRzlTYN6Aa20LCeLc5TZ?=
 =?us-ascii?Q?rJPOzN3FEnPjB3j/0V4hV+5kfOl8sV9vDCpd23b7ogq0ckdIWoO5FqZLlfs9?=
 =?us-ascii?Q?tw7uPJV6WfEqDMS/CTH9xqh7sqmkxXfJRoCprxbOlJz2teCSC3+/bfBGa4iA?=
 =?us-ascii?Q?36L6a/RnbTJKlhICW/2uzMREyjXJWoJfdWXyDVA4bswvhdt1WrXW+jnL93mV?=
 =?us-ascii?Q?9ypJzU6xUu6yms+PMNcuMfl3BMm9J0id9d6lpoKOmkRdS+dyWyB69YyJpuWI?=
 =?us-ascii?Q?42Wdx82Q9oJ+4h800HpfpzoDf9yezoSodIZl6++UiKILHdz5i4wZbQ4RNAzG?=
 =?us-ascii?Q?ws5Jf2KR3SWKfzZJGE1IlnGjYA2vADY8ickdH5EQknUzCiRVDlbztwR0ZRNd?=
 =?us-ascii?Q?Si76+2N0jDGzpyw/OXC1//FgCFbmqjri0zVGsccNwEsOcM2Cg8ApcIQ6Vy+o?=
 =?us-ascii?Q?P2dqJtMFndhq7Gxg8bjI/Hu7GyTQE5vg/V2tAZl1HMeijbTCwxXQ8UjWdCfc?=
 =?us-ascii?Q?p+VLrkwZOCqCxrytY0AEijn02OrDCszMethvp3CG2owvs/F+/EHxY007jpoR?=
 =?us-ascii?Q?z7jtinXtOrmniYSbktHhuu5nbKEq1d2JAX/BwLZDj6kSxFMlskSoKSV2oUfQ?=
 =?us-ascii?Q?EbFvnHSR2gJJhsIcM2OLPBe+5QFGmaOUVkIBfvDbFZ8eMSoMke+Wqy5eka81?=
 =?us-ascii?Q?e9p56Xl419rl4BzHA7/6q4Khtvm8RxjXAERcY5hi48jlWZu1sQx7eSwCQQgE?=
 =?us-ascii?Q?hvQDz04LQE9lbwFSP/4Q4hEtVtxwQusH6kbUeyMTwwmW5M03PwgDPlmTVqd5?=
 =?us-ascii?Q?+xkg532W3famDXz2YzKwfH6FacRuMRwB5L6AeKYPo3is5hDjilnszLJ++Dhs?=
 =?us-ascii?Q?fvRkmVYlN81winTjDhsUTgLbK0ouLVEMke6atsr/LCAJcvYuHPyacAiQ+0fl?=
 =?us-ascii?Q?Lfy6b+sDS5B2dDkybhxEQqN9OmrA/KZ/VL33+9g+raX33EBCHg/YXlvtyF59?=
 =?us-ascii?Q?D44J6OoEvestpxkkuqQYN4mRSLNyP0OT8qHucrMr2OKWxULVXSC7UPMmBfCo?=
 =?us-ascii?Q?vLDpQWb9p8Aa++oFzjaqFyWU5rS0zSs9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzjuA0BK28UZxw+gJekx9bdoiF+thopTut20+epvPf2Ul/5a67HtUZxvaS9q?=
 =?us-ascii?Q?BT6odDUyfJDncJltbFv0hUaUZC/WNcKYiRhek774YhhcNUHOTfKGmkf0Mzge?=
 =?us-ascii?Q?QQZ4+Vjsm8/KAqpPqHUmq/UcW3RH9JSjUSadcEr75DsZ2HhiVRIa6K8raRoA?=
 =?us-ascii?Q?UGpsTaVtkOv2xd3iAwh0u+IRoZ4UeJI9JJW4Zb1Y+8jINzvBdi/nuCir1Ji2?=
 =?us-ascii?Q?GtzvLH7/5hPwoBWm7SyslsagR8vwJqav3IgiFZZa+n8um/+vXlc2STnnql9j?=
 =?us-ascii?Q?sJBn7ZC88TkfmEO9ZUoPHnH+TudlNrBgFdWlE8YggRqdH44LJQnzP50qFdU4?=
 =?us-ascii?Q?WfszspCCOfZRDJxDwCxzcC3pli30YYTabiMOf6qnuc9pO8TcZNr4wctd9hVg?=
 =?us-ascii?Q?3U6/3dyWW648guyR8ah4e1rq2zDxrEpUrXajs+gcczByJoaV7zBLu6uOMVaJ?=
 =?us-ascii?Q?kyZaKIoRlCK6P/ivLMLXGCkOAi5taVCAtkcj4y8gCzza4Wy6YMIz4BA/r8S4?=
 =?us-ascii?Q?MYha6eIZuUDc1gtXtjNeMQohOLglTQdbvyqbYXob3kog02/U0IqrX7+WNlAT?=
 =?us-ascii?Q?6FMqCblojs6QBec/N0UQLCVpS+p7z5RCHkX06PVz6Y8j5r462gyRdYeU1G9f?=
 =?us-ascii?Q?AB9V5QvkhQNXlCyBo6zACmpIMY2yTIRsLcCx7xwCmYaSUp+y+ZYeSm/RtoyC?=
 =?us-ascii?Q?JRJm5XGDmnYTtQ5kYAVJGF+xcM1AVhQZG00hlDBxi6xedq4may++8xDILyYe?=
 =?us-ascii?Q?UEODc9KK1ZTwkmyOGZszltqzGy7JAJPnjHGdQ+lw4MlCY3RL0gNJBWRvrCNh?=
 =?us-ascii?Q?gysbslL5cJzBoF2QFdku7MeM6iKhdInMyuTjuK+YE1YP1R2umLNpyap7+w17?=
 =?us-ascii?Q?RTc5nQ3tehOLJWof1JJ297eZIRtWQWDuaiqo2XSxQwaloCUYlhsm0s2UXqjY?=
 =?us-ascii?Q?/KBPcGcaON7hqu+YMphM56wKCkO27zWME/gGVat4QV7RAceJTeGgsQi29IEm?=
 =?us-ascii?Q?j9t1HWDhkaSizElmfSddJlmmN2A7pnpvh+jlrLTzYrk3DB7c9DhsOpZkBr7V?=
 =?us-ascii?Q?7OHpWBHnqTm8D5UZFYmkdw5qHhO5ThOoOZNV67mWN0mj6Z4ftkjgp8SqCyx3?=
 =?us-ascii?Q?J9YeCb69rQISHBXWWjOqvQI6/+ZBac2z7X4HnfQ8NHdiNqF86a40yf91Tg7G?=
 =?us-ascii?Q?UmxZUaKGWIaSJw8GBp9AvEubxvyI0I0FYmyY2vmPZnU5tWFPGEg1JBjlu8ez?=
 =?us-ascii?Q?/l3bFI7Ynw5rYW7sy80fCESoHX+X025hME/pSh+Td3Ro4sgivpcC5rPgUq8b?=
 =?us-ascii?Q?adDJX+0tIb0XmfdrE2pDP/gqPub+UBLxr/q7XT3JAUa3+xwrhee7jFimq6dC?=
 =?us-ascii?Q?ilc6fGfYSMV7W2+DxxDozl/c3aZ2X8qW4mxTeQGcpRxJVMR+NLPYRXBRbgFQ?=
 =?us-ascii?Q?ZDVpbBC8tPq7HMIUuarQyZtak5qkxrlQ7n3FAyNF6idbafBOEJ1EuuPbWUvf?=
 =?us-ascii?Q?I9tiaUJYFL08/xx5hwZcjV0Vej+QCTKulJeI6z4TUGn0hPZxmozuy0KNYU22?=
 =?us-ascii?Q?QwzQ2ct44n8fCFqxljepz7ijHAArtciPnlODHTZIA+Ha7mw3pyDa/MBMHbs8?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437160f4-2baf-43e3-0f29-08de23083b44
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:58:59.6584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9fwdu/EMXeQi/wn5ujCDeDVnhKA3dS4Q20tQ5TcX89ZkY7ZrmNjwrV9MFbMbJY112iUzP2gss+QxWnltncGobzCKIOif7DdoYVszxgxSsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On Thu, Nov 13, 2025 at 09:26:47AM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2025-11-10 20:20:24-03:00)
> >Using scope-based cleanup for forcewake and runtime PM allows us to
> >reduce or eliminate some of the goto-based error handling and simplify
> >several functions.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> I provided some suggestions below.  With or without them,
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> >---
> > drivers/gpu/drm/xe/xe_gt.c | 151 ++++++++++++-------------------------
> > 1 file changed, 48 insertions(+), 103 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index 6d479948bf21..e81674c40e57 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -103,14 +103,13 @@ void xe_gt_sanitize(struct xe_gt *gt)
> > 
> > static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         u32 reg;
> > 
> >         if (!XE_GT_WA(gt, 16023588340))
> >                 return;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >-        if (!fw_ref)
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >+        if (!fw_ref.domains)
> >                 return;
> > 
> >         if (xe_gt_is_main_type(gt)) {
> >@@ -120,12 +119,10 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> >         }
> > 
> >         xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         u32 reg;
> > 
> >         if (!XE_GT_WA(gt, 16023588340))
> >@@ -134,15 +131,13 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> >         if (xe_gt_is_media_type(gt))
> >                 return;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >-        if (!fw_ref)
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >+        if (!fw_ref.domains)
> >                 return;
> > 
> >         reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> >         reg &= ~CG_DIS_CNTLBUS;
> >         xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> >-
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > static void gt_reset_worker(struct work_struct *w);
> >@@ -389,7 +384,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > 
> > int xe_gt_init_early(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >         if (IS_SRIOV_PF(gt_to_xe(gt))) {
> >@@ -436,13 +430,12 @@ int xe_gt_init_early(struct xe_gt *gt)
> >         if (err)
> >                 return err;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >-        if (!fw_ref)
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >+        if (!fw_ref.domains)
> >                 return -ETIMEDOUT;
> > 
> >         xe_gt_mcr_init_early(gt);
> >         xe_pat_init(gt);
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > 
> >         return 0;
> > }
> >@@ -460,16 +453,15 @@ static void dump_pat_on_error(struct xe_gt *gt)
> > 
> > static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >-        if (!fw_ref)
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >+        if (!fw_ref.domains)
> >                 return -ETIMEDOUT;
> > 
> >         err = xe_uc_init(&gt->uc);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         xe_gt_topology_init(gt);
> >         xe_gt_mcr_init(gt);
> >@@ -478,7 +470,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >         if (xe_gt_is_main_type(gt)) {
> >                 err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> >                 if (err)
> >-                        goto err_force_wake;
> >+                        return err;
> >                 if (IS_SRIOV_PF(gt_to_xe(gt)))
> >                         xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
> >         }
> >@@ -492,17 +484,17 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >         err = xe_hw_engines_init_early(gt);
> >         if (err) {
> >                 dump_pat_on_error(gt);
> >-                goto err_force_wake;
> >+                return err;
> >         }
> > 
> >         err = xe_hw_engine_class_sysfs_init(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         /* Initialize CCS mode sysfs after early initialization of HW engines */
> >         err = xe_gt_ccs_mode_sysfs_init(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         /*
> >          * Stash hardware-reported version.  Since this register does not exist
> >@@ -510,25 +502,16 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >          */
> >         gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> > 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >         return 0;
> >-
> >-err_force_wake:
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-
> >-        return err;
> > }
> > 
> > static int gt_init_with_all_forcewake(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> >-                err = -ETIMEDOUT;
> >-                goto err_force_wake;
> >-        }
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
> >+                return -ETIMEDOUT;
> > 
> >         xe_gt_mcr_set_implicit_defaults(gt);
> >         xe_wa_process_gt(gt);
> >@@ -537,20 +520,20 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> > 
> >         err = xe_gt_clock_init(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         xe_mocs_init(gt);
> >         err = xe_execlist_init(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         err = xe_hw_engines_init(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         err = xe_uc_init_post_hwconfig(&gt->uc);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         if (xe_gt_is_main_type(gt)) {
> >                 /*
> >@@ -561,10 +544,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> > 
> >                         gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
> >                                                                 IS_DGFX(xe) ? SZ_1M : SZ_512K, 16);
> >-                        if (IS_ERR(gt->usm.bb_pool)) {
> >-                                err = PTR_ERR(gt->usm.bb_pool);
> >-                                goto err_force_wake;
> >-                        }
> >+                        if (IS_ERR(gt->usm.bb_pool))
> >+                                return PTR_ERR(gt->usm.bb_pool);
> >                 }
> >         }
> > 
> >@@ -573,12 +554,12 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> > 
> >                 err = xe_migrate_init(tile->migrate);
> >                 if (err)
> >-                        goto err_force_wake;
> >+                        return err;
> >         }
> > 
> >         err = xe_uc_load_hw(&gt->uc);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         /* Configure default CCS mode of 1 engine with all resources */
> >         if (xe_gt_ccs_mode_enabled(gt)) {
> >@@ -592,14 +573,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> >         if (IS_SRIOV_PF(gt_to_xe(gt)))
> >                 xe_gt_sriov_pf_init_hw(gt);
> > 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-
> >         return 0;
> >-
> >-err_force_wake:
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-
> >-        return err;
> > }
> > 
> > static void xe_gt_fini(void *arg)
> >@@ -819,15 +793,17 @@ static int do_gt_restart(struct xe_gt *gt)
> > static void gt_reset_worker(struct work_struct *w)
> > {
> >         struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >+        /* Drop the existing runtime PM reference when exiting this function */
> 
> I believe the comment above is kind of already implied. I think I would
> prefer to keep the previous comment, i.e.:
> 
>     /* Pair with get while enqueueing the work in xe_gt_reset_async() */
> 
> , which adds info about where the ref came from.  Hmm, maybe that's
> implied as well? Not sure...
> 
> >+        guard(xe_pm_runtime_release_only)(gt_to_xe(gt));
> >+
> >         if (xe_device_wedged(gt_to_xe(gt)))
> >-                goto err_pm_put;
> >+                return;
> > 
> >         /* We only support GT resets with GuC submission */
> >         if (!xe_device_uc_enabled(gt_to_xe(gt)))
> >-                goto err_pm_put;
> >+                return;
> > 
> >         xe_gt_info(gt, "reset started\n");
> > 
> >@@ -838,8 +814,8 @@ static void gt_reset_worker(struct work_struct *w)
> > 
> >         xe_gt_sanitize(gt);
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> >                 err = -ETIMEDOUT;
> >                 goto err_out;
> >         }
> >@@ -863,25 +839,16 @@ static void gt_reset_worker(struct work_struct *w)
> >         if (err)
> >                 goto err_out;
> > 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-
> >-        /* Pair with get while enqueueing the work in xe_gt_reset_async() */
> >-        xe_pm_runtime_put(gt_to_xe(gt));
> >-
> >         xe_gt_info(gt, "reset done\n");
> > 
> >         return;
> > 
> > err_out:
> 
> Aren't we are violating one of the expectations of cleanup.h here? Quoting
> below:
> 
>      * Lastly, given that the benefit of cleanup helpers is removal of
>      * "goto", and that the "goto" statement can jump between scopes, the
>      * expectation is that usage of "goto" and cleanup helpers is never
>      * mixed in the same function. I.e. for a given routine, convert all
>      * resources that need a "goto" cleanup to scope-based cleanup, or
>      * convert none of them.
> 
> That said, I do believe this is a bit too restrictive. In simple cases,
> like this one, I believe the mix is okay.

It's probably safe, but you're right that we're still breaking that
rule, which isn't good.  I initially intended to make other changes to
eliminate the goto's, but decided to hold off on those since they go a
bit beyond the intention of this series.  I'll just drop the changes to
this function for now; once other restructuring happens I can revisit it
with a different patch series.


Matt

> 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >         XE_WARN_ON(xe_uc_start(&gt->uc));
> > 
> > err_fail:
> >         xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >         xe_device_declare_wedged(gt_to_xe(gt));
> >-
> >-err_pm_put:
> >-        xe_pm_runtime_put(gt_to_xe(gt));
> > }
> > 
> > void xe_gt_reset_async(struct xe_gt *gt)
> >@@ -902,56 +869,42 @@ void xe_gt_reset_async(struct xe_gt *gt)
> > 
> > void xe_gt_suspend_prepare(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >-
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >         xe_uc_suspend_prepare(&gt->uc);
> >-
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > int xe_gt_suspend(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >         xe_gt_dbg(gt, "suspending\n");
> >         xe_gt_sanitize(gt);
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> >-                goto err_msg;
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> >+                xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> 
> Since we are touching this part, we could add a more specific message
> here. Something like "suspend failed due to force wake error: (%pe)\n".
> 
> The same suggestion also applies to xe_gt_resume().
> 
> >+                return -ETIMEDOUT;
> >+        }
> > 
> >         err = xe_uc_suspend(&gt->uc);
> >-        if (err)
> >-                goto err_force_wake;
> >+        if (err) {
> >+                xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> >+                return err;
> >+        }
> > 
> >         xe_gt_idle_disable_pg(gt);
> > 
> >         xe_gt_disable_host_l2_vram(gt);
> > 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >         xe_gt_dbg(gt, "suspended\n");
> > 
> >         return 0;
> >-
> >-err_msg:
> >-        err = -ETIMEDOUT;
> >-err_force_wake:
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-        xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> >-
> >-        return err;
> > }
> > 
> > void xe_gt_shutdown(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >-
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >         do_gt_reset(gt);
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > /**
> >@@ -976,32 +929,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> > 
> > int xe_gt_resume(struct xe_gt *gt)
> > {
> >-        unsigned int fw_ref;
> >         int err;
> > 
> >         xe_gt_dbg(gt, "resuming\n");
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> >-                goto err_msg;
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> >+                xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> >+                return -ETIMEDOUT;
> >+        }
> > 
> >         err = do_gt_restart(gt);
> >         if (err)
> >-                goto err_force_wake;
> >+                return err;
> > 
> >         xe_gt_idle_enable_pg(gt);
> > 
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >         xe_gt_dbg(gt, "resumed\n");
> > 
> >         return 0;
> >-
> >-err_msg:
> >-        err = -ETIMEDOUT;
> >-err_force_wake:
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-        xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> >-
> >-        return err;
> > }
> > 
> > struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> >-- 
> >2.51.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
