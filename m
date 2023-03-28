Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFA5C76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A2410E082;
	Tue, 28 Mar 2023 16:11:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFB210E082
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680019861; x=1711555861;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=MuMUzOfYuaboDy7kHfPUCP5+Sh0ci+h7Zm6m1zSt4Tg=;
 b=Cpv5qtgeDKPPgrImO1w39yJTVYhG1aV4YVgHsnwE8+puUusjdCsob+IT
 /LKTWDOaZ5TwigxLXmYRQZP8ybZ+fl5AdfzEpRAOln5tzYZWUIPpQub5f
 lYGASrkqYgkIH1mQKtHK74bnPcQLLBXtao/rZVjhQ6dnIRZpTYuHTM9uL
 /Jp3O1XxhwC7r7DSBnIEiw2iWItVvvJsPqotPcDwl3r5E8Mh7s7BE3s0R
 4UO7hSqTNep8Hle/eVXRdEwgLwMR71joAcI29lD5ky+WzzCfib0+fpctA
 AqcrjnIQc/svcdvhrDCdwCK7UrJ8DNuk1T8515UG1XK0Di9/634l//ldb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338115884"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338115884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807896444"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807896444"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 09:10:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+xdyMcAX+LHuRV28FIkJ/NuUu7VtLRevjw84m2BYdSK9B1D3TtAFSV0lm7q9cMjs8rDpeRUEJDB7wcqopB/ZeiBQ2e/ditTNTO6KPXgOWK5P85cAhx4hbGjAM351EguQpKpJ3sPOVoLR7bU3UTUd1vXDyIsaOrbLXfTEA98ARoRy3zKEJvqfEpM84Y+6WCS0OoecuVk3u+i/Xs7dXBS/21u7Y3wdU2V8JulH3wSdEgJfvDpkAfWA39bjY4XbY/5Ax1G2PwzLy2XcuE9lMc5kh58YZcucWf4CTkpbwRrrPh8kOcsLvZsZwdPklTONy2QnnxSzSFIJIb1c9Zzfs6jVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6/jsJyxeK6eWCs6dH/YRTcAsscz2HaproG4sBxqYj0=;
 b=VEmFm+Aw8AIqonDyUpS5WN4iQCRUwTJRXiNwFvIEYJpVWp9wUZqe0ENN+bJ7uBbA4Nqq7fC6Yi8MMZ4STXR+ePCQP+zt5qRu9DKUgaiZxc4w2mblFzHrHs6BtxRh1gwMjWaCqEinmLN3SK91qWTRRhC8HtFQvxCZJPa0pXmm62zD/eN3rlVSfGBC4IiFUTxAM2Y6dRh8GpIPBjNGbLUDkca0CxgMtDhdHEKGujxM5VmKDXqSgyF+H2GPqLEGwpa5zOmcGJKKSTKu+Q/gq5PcVZGhgTWofpr/gqB7n7LC+lQVgG2NyApy2bRHLY9KSSGZmZGWzNL9DUnf4wHuVU1FqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 16:10:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:16 -0400
Message-ID: <20230328161021.669017-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f14eab-2391-43ab-4373-08db2fa6f21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EG5kTALWopNKaI3Nvqy/YRT+Wf9+uLK7TGvo2LijJO2iO7AOTRLqmEKJssO5anBtN9YoIHUGuW+NHjwjqFyBSnTX/Jqj6wgO1lcVLsEn+UzsmVWJPYe2EWLXdRjN/9JeVIyWoyQWQ+vVWf6z7tnpn+etTfMM1O7kV2D4+q2HGK9OQxxMRnJaD6KrsnfH0EA0z8sMuOxoJmqLw6v5KLq2y0gh4DB89skW926hTegsJr0JpbfW75tccw3minCjlgi48cm14jebjNsMdRsI/i4oSrOEGyyt+ckl4B1gBaRFVOEZlje+dNY+9VPsSmzRnVgk4yOnz+g3S+6UU2yf3zK6GJv6SkN4QBI+TEsqCHpo0K2SJtc6s5igBTOzAXotPobjCzoTmKzh+4zBp+sKe/Lo/pERpUxy/O8Y2CvYjGJAIJ8z0jxqNa+5Gq1vHnD8TAU3rb3JP4ARgo6aKzm+bssAeiVOhfoTn16kB7A+M0pq3CmGhq0SJRU8Im5GOvVz37kinN8vLEjkiK32tE/gy9+i3fcQnICHQ4cyTydq7kxO84kMdBGc2MUItbmDUe5Vu8jY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(2906002)(41300700001)(44832011)(5660300002)(8936002)(66556008)(6916009)(4326008)(66476007)(8676002)(66946007)(316002)(83380400001)(6486002)(478600001)(6666004)(107886003)(6512007)(186003)(2616005)(6506007)(26005)(82960400001)(38100700002)(1076003)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0bloEK/3kW6tklgPBBh3k3Sdxh+/y8dPvdPVr1nsTdDWvBYtHXhPtjqEA1fE?=
 =?us-ascii?Q?9RW86tRE/NPj2h41MR2dOBtPF83TVV0XrNT2ay8jJv2HssGu/HNI3d8mE3Mx?=
 =?us-ascii?Q?A5ma3Z/zMTGNavhtZ9U0KKb/KYSSt3VfB7Jls3b1sVe21xH+Thh+HsYv/o6h?=
 =?us-ascii?Q?4PkxhT9IgI//Et0yoRNl48GyZV/6vKObmoDRU2Gpdl+BdZu4Rhrw3elI6dey?=
 =?us-ascii?Q?V0ey5GwKEaMP4IZEZXHfD4MlYUohLskg837IH7KDoIY7jnrktfqsN5Edg8XC?=
 =?us-ascii?Q?bDkrcfi4lhbkEuz35T8LC0FSDCxRo1njFqB2kFgfd6m+aADQeJMGyHFYTpcU?=
 =?us-ascii?Q?lZA1FCqsrHlaObDWxReLPHDBosFH442LQRvXjI1OEnBaapLQbuxumBn40938?=
 =?us-ascii?Q?LxILayw0nTQv0RebswH1pLUZDpVF5tGL4FbxJ52gRJ36jzUdFn8DiOdSWSfL?=
 =?us-ascii?Q?B0FszRRqaY5fqnVdBQVTeTBJi/QkQIKTME/mUsDjqa5N6H8Xb2G9uf5fdhgx?=
 =?us-ascii?Q?ALkqcr84zy5no611a+JijHUfGE9lu4bReOk4hzXnIn55c/l8GOcpe3mdAsHR?=
 =?us-ascii?Q?p0Aim4cKosabK7Jgg62/L5jVBzAmd4sPisnojdkZRoLW99D2HQDqRSU/63fI?=
 =?us-ascii?Q?QrzC2g9KKqqXkcpFGnZ81/T7txu72VoDcRKcDTvvyjZwMdkhyG1ukaC6LGxQ?=
 =?us-ascii?Q?X6ZDbcsPE2fLxEPx9wZ6uy1lehlPjckSjflXIIL+nf+Rd1ynFaK39M8Azs/b?=
 =?us-ascii?Q?ZCN61/AcnC/tbwZa1SfgzZe0Xbnz59xeMSpSxp9amVgZ9arln5sW0MwBDIkV?=
 =?us-ascii?Q?5EhovmeRc0++iS2cSOe3pKzRBu/vKp9JEGPaZCd4FS5Fykq//WBBNHGtzb7Z?=
 =?us-ascii?Q?lQZngM48dv5DmziwRGgTZZiB2xTzMOA77+NpMnbSTFhj+Q/8gUXuILmvGEsb?=
 =?us-ascii?Q?dgRkfwxlbUFsQscmKmbDMTKzsI/VkI7P4gdW0EgToPPapxIzBNxaZJvOgyec?=
 =?us-ascii?Q?1WJa9CZiEpnP/rv8z8brs9jWHO+5aA1NgyhmLbPNiAYPFipIwLd7Fh8S8u2Y?=
 =?us-ascii?Q?v3ekh/i7aerrlJq1oyIFxrd7zIIc3DuRw8G3by1NWDtyFRpQDiRK1DpQG8Oi?=
 =?us-ascii?Q?n0J6k1oV+hOHCrgCXUBkOo7CMaGyPwmCPVi8ELIpgGE9QnprZ9ixkbcCgtBk?=
 =?us-ascii?Q?3/2QApNEdEL1ZMGhOgoBHWnOna2d6uho2KmgCYZvMBbHGcx3t6XDyYvcE90i?=
 =?us-ascii?Q?lF42dG5jybNk8r5qj2iFi8mltlkB0vMZKK+emYP02u1GTglfVrMnSTsjkdVX?=
 =?us-ascii?Q?vGxIxrHUXcsumnjempxbusgN9vvhtOFlnu0nhfyvwdQL9xn/PV2yJXLnsG2u?=
 =?us-ascii?Q?743rgLcra6V/SqmiyMPIkl8FsaGJAHbkl/oNdMnzYtSlY98RiHYkpY2jOXfP?=
 =?us-ascii?Q?NwEhZnjKmcyX5h1w0V8PCc8KS4rIEp3eYI7ptRkdxqU/4lWUqtquVxqdbauo?=
 =?us-ascii?Q?ER4O3ZskDDFfRhZul5cu35BHmVNOctsV71rmoBeOOHz6f64qhHNsFJW9q4U2?=
 =?us-ascii?Q?OjYscLv/fKaHuTMGKGpgUxWx8JfRyTwjK10A7IsP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f14eab-2391-43ab-4373-08db2fa6f21d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:28.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH9UZvDyRctYpf6PppktSvQ4WWmA+7KMHxRa7blMG7H4uG5pKqe4ILxxlVlOD93ZtHu/tUJZ/bW1Abq2AUDZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 0/5] Start killing xe_macros.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't want another i915_utils.h. At least not without any good reason.

Even for the remaining case of the XE_IOCTL_ERR I believe it would be
much cleaner to have that opened up in the code with better messages
in case of failure, rather than just the line and condition.

But let's at least start some conversation around this...

Thanks,
Rodrigo.

Rodrigo Vivi (5):
  !fixup: drm/i915/display: Remaining changes to make xe compile
  !fixup: drm/xe: Allow fbdev to allocate stolen memory
  drm/xe: Remove useless XE_WARN_ON.
  drm/xe: Remove useless XE_BUG_ON.
  drm/xe/xe_macro: Remove unused stuff.

 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  2 +-
 drivers/gpu/drm/xe/display/xe_de.h           |  2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c       |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                   |  4 +-
 drivers/gpu/drm/xe/xe_bo.c                   | 64 +++++++--------
 drivers/gpu/drm/xe/xe_bo.h                   |  8 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c              |  4 +-
 drivers/gpu/drm/xe/xe_device.c               |  4 +-
 drivers/gpu/drm/xe/xe_device.h               |  8 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |  2 +-
 drivers/gpu/drm/xe/xe_engine.c               |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c             | 16 ++--
 drivers/gpu/drm/xe/xe_force_wake.c           |  4 +-
 drivers/gpu/drm/xe/xe_force_wake.h           |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 | 16 ++--
 drivers/gpu/drm/xe/xe_gt.c                   | 30 +++----
 drivers/gpu/drm/xe/xe_gt_clock.c             |  4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c           |  6 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  | 14 ++--
 drivers/gpu/drm/xe/xe_guc.c                  | 26 +++---
 drivers/gpu/drm/xe/xe_guc.h                  |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c              | 16 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++----
 drivers/gpu/drm/xe/xe_guc_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c              |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c               | 18 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c           | 54 ++++++------
 drivers/gpu/drm/xe/xe_huc.c                  |  2 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            | 10 +--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  8 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  8 +-
 drivers/gpu/drm/xe/xe_macros.h               |  4 -
 drivers/gpu/drm/xe/xe_migrate.c              | 34 ++++----
 drivers/gpu/drm/xe/xe_mmio.c                 |  2 +-
 drivers/gpu/drm/xe/xe_mocs.c                 |  4 +-
 drivers/gpu/drm/xe/xe_pt.c                   | 42 +++++-----
 drivers/gpu/drm/xe/xe_reg_sr.c               |  4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h           | 12 +--
 drivers/gpu/drm/xe/xe_ring_ops.c             |  8 +-
 drivers/gpu/drm/xe/xe_rtp.c                  |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |  4 +-
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c          |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  4 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c         |  2 +-
 drivers/gpu/drm/xe/xe_uc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_uc_debugfs.c           |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                | 18 ++--
 drivers/gpu/drm/xe/xe_uc_fw.h                |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 86 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c      |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                | 18 ++--
 58 files changed, 320 insertions(+), 324 deletions(-)

-- 
2.39.2

