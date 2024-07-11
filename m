Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3684FC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50D10EB07;
	Thu, 11 Jul 2024 17:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvhROYT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C610EB18
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717971; x=1752253971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qJE7iTft9Ao1PF1ZPVcjRrqc9oN9JuMKPJ0K5g5GzMo=;
 b=DvhROYT0EiRO3r3NwJqbDeBtgJvS0xsr5E0R7bzM9fhDvaHPAizxPpA6
 Z9/2+6x95dfq0hp1tne0uzksooQryX1Dgyk2T+OU+dHUVge347zT1sevM
 fbeOstj7SLB7hAcHLDXqFVwwZsUKwCkJStzPe0GF25h+FfybidKGBuIy5
 wN2RMTWbEYBMocNuDaK+1pImHUOFaC2ZiFNRwgNon5yo7ax9eVxHKZWs2
 S6GXkA1fGE13FqMRPut/nkj0ZVGidKxtaofK850noYHmKip2hMxHEvMIo
 GFV6PDjO0FoRsXxjILzfaCGfojrgaTcTXRH6M3pioHsvgC+MvAl1cXaBr w==;
X-CSE-ConnectionGUID: GdheInvwQ2CF6wd2+QaYzQ==
X-CSE-MsgGUID: 3QcIrl8uQ2+MYMXye1ZEjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21881799"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="21881799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:51 -0700
X-CSE-ConnectionGUID: FNVUlObkSJ6W7O0k5n1z0Q==
X-CSE-MsgGUID: ZYe0wmDsTbm+re9jOfzNUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48702391"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElULBVpqQ57xqUQGSoqQhx0KnZ2IVpMy3Fr0llkhvzWrfr5awaE4v0Pu+d413EK+O+arU2dNQUfGTTrP5sOtYMgLR6uHMSRkf6ZLV+Qe+1j/GXgy9SiTExHLbCLCdkHGAjbKhMtD27DW2HhK6xrajL7bcaDTvHHYJ+642YUeWoYSP/C9wTDWKabw4lDkew1UXjLVgs+qH9vCzPnCCAJ0YzHfvjoKKE9gKDWsTS5qRYhVKF6GEfZRO8gERX3pdVKvCUY3T5s4Fu0ubKQFrI1scCS9LmaCN+K/zjveT72DBg4U5JfPeZYW3ScUE8SHHdb5CBpkZqEDHIhRoLaVLNdTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+ad0LZ9DrGE0TAYreS7fh2Lp/zRu3jD7KBofEKV8/I=;
 b=jA/StZ2uqjpCDDrubfjNfuidP6B9Z/V6ZfpjSFNc3/AFdUU0Xhith5mavk9a68wyzb5L4dxT0aDcz/WK4+bXneFJr0UQOouQ+5fQNvbPo701PsZPipNt1PgGD9rMmDsB2boxdiahmJFBc8CL8YePr9IK36H/sgRvWS+BiJQsbJrI8aR1S+0evmy5sY6XrjloQFkbEuPwOUxysp4/Eqq/h/UidqsmKyRxeMIpIYzqznKYBN3DRkX1aXOVH1lIhOeIFifepNiCHxJ7+jr5MKsMYBj5mPDPiSz8udFF7tjDQ5B19lHFo4V13MDiSX0HnQXcIpuDLh7Z3DgRF4ngf5nZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.19; Thu, 11 Jul 2024 17:12:46 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 11/12] drm/xe: Make xe_ggtt_node struct independent
Date: Thu, 11 Jul 2024 13:11:54 -0400
Message-ID: <20240711171155.173717-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afc9249-bfa1-431b-19e3-08dca1ccaeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FkSCUUXXIUEbJ2Ifvcp1GXyh2Qz6RW++yOLf3LAjOg1r4EDadV5uCZSwWe2u?=
 =?us-ascii?Q?pRkiYAOb+HXMoCGQtk3LHBlV/3gXvSFQu62LCjGKaVfBDzhAcvtaLdCJHO1s?=
 =?us-ascii?Q?L1S5rFBxGhtL3VK3xndXHW/Dy5NyzgcGmAEp5n7L40fCP+MV3GkSMOlGCfk7?=
 =?us-ascii?Q?xis4eD28l+FRnskD746UnvN4+Y+E4Sv1u3krLelhdedX+d1Du3oLmbB5ntGE?=
 =?us-ascii?Q?v2pK5i3AMqHpsmwnYwsrkH/akfa39PzyjyrE9nSazsnooJyYckLe5KF0IR6+?=
 =?us-ascii?Q?zldXQXeG8bk8gj0oMLxziupawDQiXmSfAxReWnc4PGzVPxHZ5OkzCXSEq/EB?=
 =?us-ascii?Q?1M1P0M+86fVziksLUtcLzMbHMblst+GHVOXkipbkn/bxwuGNWvX4F9ttUlx3?=
 =?us-ascii?Q?DYRFjj7gPhec6TqxQu9+LjRTUqwf7CWg0sZ3T7joLtXwclmFwXjyLGDh6kZb?=
 =?us-ascii?Q?4Zq17q+sLZlt41ROyvilvjZJjeQWF7aDGkYumhPWqGmxoEWYDHryzVHjOAVm?=
 =?us-ascii?Q?83VEkJB1wezCk091+/FSU1pDCRFOnRyPf3M1Jt7h9B91ytPciTHwEiS/2dhN?=
 =?us-ascii?Q?z62fn0vfSuK9n3qXuSvXi2wju1fVQs9q3ZmDRmQ2TeROl7y9d3DYpN0STs0z?=
 =?us-ascii?Q?Cv/WrqiKxCjngLNHBAQAkFjQxDYpkJ06pXGVd++jRpaWB9gC3GdG6t/0XGgy?=
 =?us-ascii?Q?+KXlV88Ahg69v3QMbkgCy06IGknc/BHX1Exrrri0e4qpHGACfOw5IFKN1/3R?=
 =?us-ascii?Q?Yjc4UXMf3fF0dxpDxGkeS2zIqeXMTsYBV4hEmHz4qHGGHu2AfdvDQKucSSq5?=
 =?us-ascii?Q?wjky7miorfWSTZTng8nQ2muo8+ib5mrQD/iD0nBEbhY49OW3+1XnWh/1RlVd?=
 =?us-ascii?Q?yH1abVyUh/Y6QnJ1OUYMMzdL3RkIkrdbAilbZzKRpc32rFTFZER2rt4Piy5E?=
 =?us-ascii?Q?/7OpFYcPqyMe601f/yMvYgNo0jh1dz9J+i+YqUXgpYiouXT8Wiv8h2fhRPgq?=
 =?us-ascii?Q?BEks5q1BWYjfFzP8QlIO8qgMdOwRoSBgmSNmw9Ox4fU/i97vQs3mzN5e3+am?=
 =?us-ascii?Q?NrpYRlVafLau3NUJPy9gKFhcweWLon6evT1Bu6Xmplz2p7hVyDHRgXUA0eAA?=
 =?us-ascii?Q?7cFoDiy1XiKz18oIYR7sh6xkiMVZR6EXv/9yZ9YFAZRXaT50SwTWn9azJi7D?=
 =?us-ascii?Q?isZ/TjmmpKtsJLb9UU+iWJ8ln/gR5nuJWiL7jFFzx5VD2VSKzbMTDBBIoHlN?=
 =?us-ascii?Q?tKYfgCgdhBxhvdeRWM55XCQ5UoHxGhMpZvSWQF4AkXfAz35xnaI28ZZyrXXn?=
 =?us-ascii?Q?jYLATJgVS0Qn253IDjgXfZzLLDAugz3E+tfm5y+xI/HfgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3fgLzumK+xFo4CmAYPtqJed3htkEVZLtBIgps9xph2VaCy0e2Wm9DHzyr+Hz?=
 =?us-ascii?Q?ZrLnjRNbtXv3aBoo5av/TuP8aZIoWKUBknEdsggRG6oTRmDc71LamkRnerkH?=
 =?us-ascii?Q?dfwTw9+xZtDO7QsXpQAqae3KDUg5AhVRhqlrSmLbYykfFEdCgoyp2103dWRR?=
 =?us-ascii?Q?g0Plko9EAlKHmL/B0rz1Uh0NYgpSjqcuG0iscO/n6soWA2Jr01IGK/3eoWBR?=
 =?us-ascii?Q?6Jxi0CYPAWJX3lHCyGTtkwLy//5pUS6upL7/xLKifOeUKQIul7NmT5/SwLvL?=
 =?us-ascii?Q?gggEJnXHmQcgNJ2BK9VObdFhkMzIMpax24XDXeAZmWeYPUM85sRYknXBouPc?=
 =?us-ascii?Q?20kFf8thv6IUstwFGvWQI/V/byufPeKD9U+UgI+EmBiWdMa4qu0pvenm/Fe3?=
 =?us-ascii?Q?cD81duQtuqyWv5SMH8ugmnxcd2g1K28PHAA1RMGkPOg/SkXKytJ518UU0E+k?=
 =?us-ascii?Q?Nv316JrSWFSagFitG27Voa+7oMvA4hfOvk9TKdF89d+ZCZim1s7+sn0ynhb/?=
 =?us-ascii?Q?psVnT2glfLDYEZJFVgOZF9fWrvTgXtFD/K4+Da5FC7cmm/5rQeWUC6si454D?=
 =?us-ascii?Q?n1N8RITYigMWlbFtL/Hdj9IHLM1MqB4dS1MYOSr4vGMofwFdyVS+BtWKe2y7?=
 =?us-ascii?Q?eN+QNUzb+ubDoDzH7sZvQSpCxm70vey5oRrj2ogp2H6d34lU8WHknUlU2Gjm?=
 =?us-ascii?Q?/tr/O2kevafLnJTCbojsABzd2S1xgI/8IsklAzR+OmLYUlb6AbWHfygM5Rus?=
 =?us-ascii?Q?OWgB9N4IfXhe+K4B8/vOpoqCa7t2KcsJWLYnECLLjSbsFJsWf6enVG6n56Ou?=
 =?us-ascii?Q?fbfhl8RLPntNzihynXm4NLeEJwlthTfuWies0mAHrz6dMZNnQZmnNGC9gvzd?=
 =?us-ascii?Q?b4i/2rEeulR6W11jpIBYDpRkSNWNRcXuMLqhzIGE65gmUKZAKUWfUjRjRhal?=
 =?us-ascii?Q?kqIssZ4Bj0crzO7iwp0ZW/WpK/pLOfkGfFv1LE8GpTEA7+eQiGgkMB5FE77b?=
 =?us-ascii?Q?jTRqZd6HlhkI9lWut4DoBIyI6sVG71FbYYaA4+APYlv8NJQJQL1quXtisF9F?=
 =?us-ascii?Q?IStK30zQT7/rTiBzh0z1ADkk76ghbFxomjfRuaUAtXQgkyEJ3IMWg2eHZ29N?=
 =?us-ascii?Q?CpQjbuba4dlcPQ+D6jNSw8i034gS1EkrO5SmiYzonTLTQsF9hoINbEVFGnii?=
 =?us-ascii?Q?sJYy69USEnJoDa3Q/Z/WBaDJljz4Uciq4XDdTjG8bjK9306N+PYNFOauNo/d?=
 =?us-ascii?Q?TH6fZEiXUfAhty+rkKvwBcyPAZemhRzNP/6VkqyTEZJEawccvUg5DURcckhz?=
 =?us-ascii?Q?E3+VJpzUKxlhK8h3kPWUBI5tRzoBij7Ba7OlgjcZLQyAixe/xX/VrJRnm+vK?=
 =?us-ascii?Q?gQMcHwS2/FBQsPsqu368x1coZSsKGrxpc9XfQgdGzq2gz+Rm+dAow5OWSLwT?=
 =?us-ascii?Q?i7bIBcH9lQsu0nXNdHZNhIYiTpqs/97Dp4Qq/5igcfaSrOq0MiaGYGmdNA7r?=
 =?us-ascii?Q?We8vqA4M3iLt4SKmR74Ff9ci/wcHq8pFK+gfWFkc7EmAYGIcLKZ7U5nl8ud1?=
 =?us-ascii?Q?YFrPOJPmPqjkzKVvUFoiD+QUXkWWuVPWlTswIj2G2ytgDtGmUUjBbVLLFK+B?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afc9249-bfa1-431b-19e3-08dca1ccaeae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:45.7501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbqjkFBrvN3QFnvupbrmVBS1//MlpkvHmfIkh4GYyNBbFlle9Ur8VnVsnbRApKj0ZbyLcdE4McWf+pLPQjCzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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

In some rare cases, the drm_mm node cannot be removed synchronously
due to runtime PM conditions. In this situation, the node removal will
be delegated to a workqueue that will be able to wake up the device
before removing the node.

However, in this situation, the lifetime of the xe_ggtt_node cannot
be restricted to the lifetime of the parent object. So, this patch
introduces the infrastructure so the xe_ggtt_node struct can be
allocated in advance and freed when needed.

By having the ggtt backpointer, it also ensure that the init function
is always called before any attempt to insert or reserve the node
in the GGTT.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  36 ++++--
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 103 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_ggtt.h                  |   2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  34 +++---
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  26 ++++-
 12 files changed, 181 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 97193e660f6c..ac860414b91f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -20,7 +20,7 @@ struct xe_bo;
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
-	struct xe_ggtt_node node;
+	struct xe_ggtt_node *node;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
@@ -29,7 +29,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node.base.start;
+	return vma->node->base.start;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index de4930b67a29..e871957d7565 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -204,20 +204,28 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
 			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_force_fini(vma->node);
+			goto out_unlock;
+		}
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -226,11 +234,19 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
 			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_force_fini(vma->node);
+			goto out_unlock;
+		}
 
-		ggtt_ofs = vma->node.base.start;
+		ggtt_ofs = vma->node->base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -323,9 +339,9 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_node_remove(ggtt, &vma->node, false);
+	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node) ||
+		 vma->bo->ggtt_node->base.start != vma->node->base.start)
+		xe_ggtt_node_remove(ggtt, vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3501a5871069..7e277ac0cd8d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1090,7 +1090,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.base.size)
+	if (bo->ggtt_node)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7c95133cc32b..c8a90e5bbd6b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,12 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
-	return bo->ggtt_node.base.start;
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return -ENOENT;
+
+	XE_WARN_ON(bo->ggtt_node->base.size > bo->size);
+	XE_WARN_ON(bo->ggtt_node->base.start + bo->ggtt_node->base.size > (1ull << 32));
+	return bo->ggtt_node->base.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 3ba96a93623c..0ec6172cc8ba 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -40,7 +40,7 @@ struct xe_bo {
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
 	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct xe_ggtt_node ggtt_node;
+	struct xe_ggtt_node *ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 30f9c58932bb..706872711ebf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -203,7 +203,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node ggtt_balloon[2];
+			struct xe_ggtt_node *ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 928c01f9e212..fe0bfd8c26cd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -353,6 +353,7 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
+ * It cannot be called without first having called xe_ggtt_init().
  * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -361,6 +362,9 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
 {
 	int err;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
@@ -392,14 +396,20 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
  */
 void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(&node->base))
+	if (!node || !node->ggtt)
 		return;
 
+	if (!drm_mm_node_allocated(&node->base))
+		goto free_node;
+
 	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_remove_node(&node->base);
 	mutex_unlock(&ggtt->lock);
+
+free_node:
+	kfree(node);
 }
 
 /**
@@ -410,6 +420,7 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
  * To be used in cases where ggtt->lock is already taken.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -417,6 +428,9 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
@@ -428,6 +442,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
  * @size: size of the node
  * @align: alignment constrain of the node
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
@@ -435,6 +451,9 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 {
 	int ret;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	mutex_lock(&ggtt->lock);
 	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
 					 align, DRM_MM_INSERT_HIGH);
@@ -443,6 +462,43 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
+ * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
+ *
+ * This function will allocated the struct %xe_ggtt_node and return it's pointer.
+ * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
+ * or xe_ggtt_node_deballoon().
+ * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
+ * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * xe_ggtt_node_balloon() will ensure the node is inserted or reserved in GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ **/
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_KERNEL);
+
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->ggtt = ggtt;
+	return node;
+}
+
+/**
+ * xe_ggtt_node_force_fini - Forcebly finalize %xe_ggtt_node struct
+ * @node: the &xe_ggtt_node to be freed
+ *
+ * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * or xe_ggtt_node_balloon(); and this @node is not going to be reused, then,
+ * this function needs to be called to free the %xe_ggtt_node struct
+ **/
+void xe_ggtt_node_force_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 /**
  * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -456,6 +512,9 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	bool bound;
 	int idx;
 
+	if (!node || !node->ggtt)
+		return;
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 	if (bound)
 		xe_pm_runtime_get_noresume(xe);
@@ -468,23 +527,29 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	mutex_unlock(&ggtt->lock);
 
 	if (!bound)
-		return;
+		goto free_node;
 
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
+
+free_node:
+	kfree(node);
 }
 
 /**
- * xe_ggtt_node_allocated - Check if node is allocated
+ * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
  *
  * Return: True if allocated, False otherwise.
  */
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 {
+	if (!node || !node->ggtt)
+		return false;
+
 	return drm_mm_node_allocated(&node->base);
 }
 
@@ -497,9 +562,14 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.base.start;
+	u64 start;
 	u64 offset, pte;
 
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return;
+
+	start = bo->ggtt_node->base.start;
+
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
@@ -515,9 +585,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
+	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 		return 0;
 	}
 
@@ -526,15 +596,26 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return err;
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+
+	bo->ggtt_node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(bo->ggtt_node)) {
+		err = PTR_ERR(bo->ggtt_node);
+		goto out;
+	}
+
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
 					  alignment, 0, start, end, 0);
-	if (!err)
+	if (err)
+		xe_ggtt_node_force_fini(bo->ggtt_node);
+	else
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
+
+out:
 	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -574,13 +655,13 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.base.size))
+	if (XE_WARN_ON(!bo->ggtt_node))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 
-	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index e68cede2e6b5..9ca0a3da8903 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
+void xe_ggtt_node_force_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index f3292e6c3873..60cbce3170d1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -48,9 +48,15 @@ struct xe_ggtt {
 };
 
 /**
- * struct xe_ggtt_node - A node in GGTT
+ * struct xe_ggtt_node - A node in GGTT.
+ *
+ * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
+ * insertion, reservation, or 'ballooning'.
+ * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
  */
 struct xe_ggtt_node {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d0995680f53f..ac292351483c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -232,14 +232,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
+	if (xe_ggtt_node_allocated(config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.size);
 	}
 
 	return n;
@@ -385,13 +385,13 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 
 static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
-	pf_release_ggtt(gt_to_tile(gt), &config->ggtt_region);
+	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
 }
 
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -415,9 +415,15 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
 	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
-	if (unlikely(err))
+	if (unlikely(err)) {
+		xe_ggtt_node_force_fini(node);
 		return err;
+	}
 
 	xe_ggtt_assign(ggtt, node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -433,7 +439,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
@@ -1999,13 +2005,15 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!xe_ggtt_node_allocated(&config->ggtt_region))
+		if (!xe_ggtt_node_allocated(config->ggtt_region))
 			continue;
 
-		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
+				buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region.base.start,
-			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
+			   n, config->ggtt_region->base.start,
+			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
+			   buf);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 6d0d9299bafa..44dc0a6e90d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -19,7 +19,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct xe_ggtt_node ggtt_region;
+	struct xe_ggtt_node *ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a478e6e1b20e..5c540e20c785 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -495,6 +495,22 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
+static int vf_balloon_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				u64 start, u64 end)
+{
+	int err;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
+	err = xe_ggtt_node_balloon(ggtt, start, end, node);
+	if (err)
+		xe_ggtt_node_force_fini(node);
+
+	return err;
+}
+
 static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
@@ -528,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +552,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +560,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +571,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.45.2

