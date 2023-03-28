Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF90FC6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2510E475;
	Tue, 28 Mar 2023 16:11:12 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD010E477
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680019870; x=1711555870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WDfPwKPmpudLBjFO3PhWt0gUuigXH+bmGsjpinEWB7M=;
 b=ldRo1qFNDdPD6ArCG7i/DqKYTPMkxc1tIfaEheCqBkvk7HtiDSgf0nQ8
 s5uQpavaZ4ehv9xXLKsoqkDU4vQ5ACG8qv5BmCuqdFbXCTmmTznaSPi0o
 zS4IKw0flAi4iB9V1ssUwwAxKpR0TlsjPIAQ7Ul6nQ9W4iglY+q/owXvD
 TIotO/an1P4gn7ric9HaY8wahPcVjQcqh2geRGIyuN17QQ1FZ5vWxYnQl
 QvuMa9A0/IrJXgkFj/S6lJxgU+eCzcWGVZCtgUScFH8DsOJE3xnBcsW/d
 RP+TAJzkSBy0dhlRnQBouAQxldQbatPZs+kz6ZQDWc7S/8BbsylXNtKmv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338115973"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338115973"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807896509"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807896509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 09:10:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dcnp4yVB+3WrYD+grORFYt4Tw4yvKv5G2Or7gTy/ne7nkLfwQYVKi029OucP2kaD7urcycw2Yk5XmMF9GYOyxDBi0RBkDh52mM+yVJ4k9cHZ9XmeXCH9ajSX61SSvic48HSS7ONfm9BkJEONdvjBXuWFwOHrN5WmEybt/JoY8pStg2dbDTSn9VPfBqVwwYJOlxUsCHUV442VViZUgVHHqQzpoqUQDjdEps0VC4Ee6vkYihR3StjZ+oGMZeTRMWoWgkxXwBPWTW/1iblK3J+rpF+5/cnj1ZQgHqqVPwD06+5s8OYvonb/JxkiLrxlmjkN95rehQNUOZww57RsYi6NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShpoOTYn0Yyou4P32KUgC4HcXm+Co8hkIyr1YkMnqyw=;
 b=HcrogaCtMGoqiFYw8bAgK7gVZ7YqKa/BG4dj5+5U9GQxwRwRIDd7fiWeuBOQTbhmT7mvK610zqkLELpTpd3K5bjZ0OqCQTAwYn1rRF4Gl0JCfwi194mOLPuxRup9EFUbMm37dO6I8u6ynowBcL6ISfvytf66BJIwlVzUzoSNX2ljbze6hbFiWHGqpfKI6shUpjaYwGQzHrsQ3F8CkJM5MzSsAeGzjBMgGH+sYVCT5HPl0o8ztxMoREaUveGc9c4um6OdOA8yIUN6KNIFITQ5qbztJJi7Pu/6UrbN17gLcw2YhKPKFogvzU6c68t/P6dEEItftx7x/wS5lDyvgZGB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:10:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:20 -0400
Message-ID: <20230328161021.669017-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 473c9796-fd7e-405b-a4ac-08db2fa6fbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tczbBviHUhEH6bBiecGtDMW3jrDXRP5BR56XMUhYdzxdqo5nHJNVLij7PQj45CwLxNCdhbWgrRI8PLPnGUDbEertri8o7hqcZ5v0k5u1inXx8jqPx9yQJ8p8U75vGsytzV+fOvaHtMuT7IePqJBktGZ9XI3CK8QoUutC6wCzHjrPlMo9z0bsurAGT0TymJXKqzEExj1c5KDfX37A5CuM0+oniWGWzYPvqcMhUNu8aiTQ1SX3NlQyWO+t8yll6cCM2Fv2qaGajd80Evf+KvVU1SOOWrfLaLWxhVgi80Q0BZYvO9+PlZ8bx1+GpX2yqKfYcKOO4UsRnpE9T7++3AnUxd5ZyfEJyC/pWjwXW7FuScM3TVkfnwectB7hFBeqvvJ+wSgHK989MIWreJJiQ5kt4/mymScw3xwDYh84SRWllAz6bzv8ifBauKdfwT5Tbxmo43Tmx5PiLTjuA/rcgehOEbuuPaNQB/RljLX8eSNX+QcZoyX2AvAlHMgIKYv+nGM7N3pzIYdraLS4YB97j26WgMRRoJYd3kPtxESTBEF5wN2SBu+b/U6kwBhmtrbcRcOwdGKC59s1yMyI7rZymlORc7uXI98PYmoFPsqM42Neb7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(4326008)(66476007)(6916009)(8676002)(66946007)(66556008)(41300700001)(82960400001)(36756003)(2906002)(86362001)(30864003)(5660300002)(8936002)(44832011)(38100700002)(478600001)(6486002)(316002)(6506007)(1076003)(6512007)(26005)(186003)(107886003)(6666004)(2616005)(83380400001)(66899021)(21314003)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYkUrQJ+kBJoTBaJSijHSgGIV559DYsvN3QKMBL39CCpTydNQCzRSCbkfrFe?=
 =?us-ascii?Q?dsmO6dPnP09SWt0SQRyUix6wXl1WhvOoXod1OIShnwjcAhHrCcNFLbr2e+rp?=
 =?us-ascii?Q?nR1o7rvNTNdtpjynXOdGCDWNO8czodyuI6NOM69smLHLHEuwYtVSjln108K4?=
 =?us-ascii?Q?xNf9POwa6OyqJ5oAAhRQIqM1y5jOOPDSJT7eUi2orIqKmjYDE4fshegVfVjw?=
 =?us-ascii?Q?EQPokSuIIUcbpH6U7BdYPCX834vHB77KgqPfmL19fFSxYNgSKqkPKk3aiOSe?=
 =?us-ascii?Q?WunyMJVbziB9exF5B1uDbG+Gwk9gEIyxEgI/USStvz5/M+yIEBbvGn4THe5a?=
 =?us-ascii?Q?yd+EuD+1Y884aEbgOSnnQZ4Ttf7p+/BVdpDr5qyTWojI3rP9yRqH2gYzz9gw?=
 =?us-ascii?Q?Ak4f94ahBUyoMpUlaarWTU/ZGFWn1eFUfEkoiKrCJbsDyIB0gc3nLxSMTW37?=
 =?us-ascii?Q?FrP842iPSQIwSMUgoCDF3QDisB4Pc1M/ytbgznucI9M90WuCkhh24Tdwqyjp?=
 =?us-ascii?Q?mrkxOk1XV96EtJ6oEX+mZTwt9ONFnO4/AvVWN5tr91dZhI8sIGZYsLTSX03D?=
 =?us-ascii?Q?MZs5NzTCg5/ZMy+O1XJCTErP3u8g67UfAwg6T0wUtiCkx1Eb2xJxSuv54DK+?=
 =?us-ascii?Q?gHX5+jM/gnx+mD/qbiMaNwqyrabC+SUhpVb/ZF2dseyG1DYE2JcOyueSAxm2?=
 =?us-ascii?Q?fvIbucsf8WaF0P6Ma85SSChX+qDSwPISkrwcf1oab88QHdJ3BKSSl7LwzI5H?=
 =?us-ascii?Q?zlJaNmzRFV44mRpeXeg4aqCSfaJ1S79cG/AK8/WRsyUXhNVJ0SJbfJirOPAQ?=
 =?us-ascii?Q?Bqylv/DxxebivMEVvO6hIiex8AKaH4oibUlWz0THqeP+jn9OXonXPehuTXBa?=
 =?us-ascii?Q?IHjE3cnRnBtoNT9RL0eh2sIWvbfGAOBJwjl1qhg5mgIenMhPCuclPARhziW0?=
 =?us-ascii?Q?YSC4EYAdetjCb/YwEWwGsPk66bvaE67j0m7aB802nxnXib5yzMsA8eKgBLnq?=
 =?us-ascii?Q?95J7Au3HwcfZUUZGDmjRbuDQIe7zFbOFCjd4b4WiFVnHQrZgfDaH7grY3SZI?=
 =?us-ascii?Q?FHHSvWkYAYVp3l3HiqUiOsOGQhILGnMGh9VEDaRjTS4CAqQ7FVqO3aXEBPOY?=
 =?us-ascii?Q?yeVx5P7Lzy4q3OYeikARddMP+9HtPlzeit5sPUhsmiq0JPXFe1wBRBe/ka2H?=
 =?us-ascii?Q?VrTIRj3Z4Tl/7jhOyzmuczvDzWDDhd8bqrl6izD9Zqr069Hk7v7jEocM9WuO?=
 =?us-ascii?Q?phZizt1d7weCD4BXJ9RovqRoDp78Trsy5tT9a40cgopmgZjBkKZOT9UZYO3z?=
 =?us-ascii?Q?ppnZI1CE+GjfRaUP2GmwhTAyUhr3HvhhEMiRawahvxSI7criD/RYnRj5LSxp?=
 =?us-ascii?Q?n3wOB3Wm71ZD1dLgaOQ3D3sHzpJU2uBvzDu9gsBgV14u4tfwZX5lA8A04g6W?=
 =?us-ascii?Q?kOxS6zE6SKWN15nXvZOXfN0cj9phfENxlQAH3+Zq34dvZl7BLOpCAtpGzAaT?=
 =?us-ascii?Q?x0HGWeHZKScGO7maJh4d1o77g8DqVAQhYTO5P6cJ9r1OGoNy4dAEVeHinJ4z?=
 =?us-ascii?Q?6J4eqhmYv8k+/aPuLB45n+dXhLbM44bWwF5/FXhf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 473c9796-fd7e-405b-a4ac-08db2fa6fbff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:44.9658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3Mx3KpswQS/vYVvZmuMKKEFdEZT3zoYq15UnapgLBMmp53qUqlcOCq4pQdwwMNlTeOocmqP5+KbNTsUA9H9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 4/5] drm/xe: Remove useless XE_BUG_ON.
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

If that becomes needed for some reason we bring it
back with some written reasoning.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_de.h          |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                  |  4 +-
 drivers/gpu/drm/xe/xe_bo.c                  | 52 +++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                  |  8 +--
 drivers/gpu/drm/xe/xe_bo_evict.c            |  4 +-
 drivers/gpu/drm/xe/xe_device.h              |  6 +--
 drivers/gpu/drm/xe/xe_execlist.c            | 14 ++---
 drivers/gpu/drm/xe/xe_force_wake.c          |  4 +-
 drivers/gpu/drm/xe/xe_force_wake.h          |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 10 ++--
 drivers/gpu/drm/xe/xe_gt.c                  |  6 +--
 drivers/gpu/drm/xe/xe_gt_clock.c            |  4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++---
 drivers/gpu/drm/xe/xe_guc.c                 | 22 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c             | 14 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 22 ++++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c             |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 44 +++++++--------
 drivers/gpu/drm/xe/xe_huc.c                 |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           | 10 ++--
 drivers/gpu/drm/xe/xe_hw_fence.c            |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |  8 +--
 drivers/gpu/drm/xe/xe_macros.h              |  1 -
 drivers/gpu/drm/xe/xe_migrate.c             | 32 +++++------
 drivers/gpu/drm/xe/xe_mmio.c                |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                  | 32 +++++------
 drivers/gpu/drm/xe/xe_res_cursor.h          | 10 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c            |  8 +--
 drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c         |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  4 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               | 16 +++---
 drivers/gpu/drm/xe/xe_uc_fw.h               |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 60 ++++++++++-----------
 drivers/gpu/drm/xe/xe_wait_user_fence.c     |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c               | 18 +++----
 39 files changed, 227 insertions(+), 228 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 9f92fdb4159a..c4ed0e7d9997 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -115,7 +115,7 @@ intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
 	 * Not implemented, requires lock on all reads/writes.
 	 * only required for really old FBC. Not ever going to be needed.
 	 */
-	XE_BUG_ON(1);
+	BUG_ON(1);
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 5b24018e2a80..5caefc03a431 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -42,7 +42,7 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
 {
 	u32 size = drm_suballoc_size(bb->bo);
 
-	XE_BUG_ON((bb->len * 4 + 1) > size);
+	BUG_ON((bb->len * 4 + 1) > size);
 
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
@@ -56,7 +56,7 @@ struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
 {
 	u64 addr = batch_base_ofs + drm_suballoc_soffset(bb->bo);
 
-	XE_BUG_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
+	BUG_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
 
 	return __xe_bb_create_job(wa_eng, bb, &addr);
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index eb00b0a67abe..db360c4e0382 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -74,7 +74,7 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_gt *
 mem_type_to_gt(struct xe_device *xe, u32 mem_type)
 {
-	XE_BUG_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
+	BUG_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
 
 	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
 }
@@ -111,7 +111,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
 
-	XE_BUG_ON(!gt->mem.vram.size);
+	BUG_ON(!gt->mem.vram.size);
 
 	places[*c] = (struct ttm_place) {
 		.mem_type = mem_type,
@@ -246,7 +246,7 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_BUG_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	BUG_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
 
 	if (xe_tt->sg)
 		return 0;
@@ -481,8 +481,8 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 					       ttm);
 	struct sg_table *sg;
 
-	XE_BUG_ON(!attach);
-	XE_BUG_ON(!ttm_bo->ttm);
+	BUG_ON(!attach);
+	BUG_ON(!ttm_bo->ttm);
 
 	if (new_res->mem_type == XE_PL_SYSTEM)
 		goto out;
@@ -636,8 +636,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	else if (resource_is_vram(old_mem))
 		gt = mem_type_to_gt(xe, old_mem->mem_type);
 
-	XE_BUG_ON(!gt);
-	XE_BUG_ON(!gt->migrate);
+	BUG_ON(!gt);
+	BUG_ON(!gt->migrate);
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -667,7 +667,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 					goto out;
 				}
 
-				XE_BUG_ON(new_mem->start !=
+				BUG_ON(new_mem->start !=
 					  bo->placements->fpfn);
 
 				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
@@ -964,7 +964,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
+	BUG_ON(gt && type != ttm_bo_type_kernel);
 
 	if (WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
@@ -1104,7 +1104,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		if (!gt && flags & XE_BO_CREATE_STOLEN_BIT)
 			gt = xe_device_get_gt(xe, 0);
 
-		XE_BUG_ON(!gt);
+		BUG_ON(!gt);
 
 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
 			err = xe_ggtt_insert_bo_at(gt->mem.ggtt, bo,
@@ -1233,8 +1233,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
-	XE_BUG_ON(bo->vm);
-	XE_BUG_ON(!xe_bo_is_user(bo));
+	BUG_ON(bo->vm);
+	BUG_ON(!xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
 		err = xe_bo_validate(bo, NULL, false);
@@ -1266,20 +1266,20 @@ int xe_bo_pin(struct xe_bo *bo)
 	int err;
 
 	/* We currently don't expect user BO to be pinned */
-	XE_BUG_ON(xe_bo_is_user(bo));
+	BUG_ON(xe_bo_is_user(bo));
 
 	/* Pinned object must be in GGTT or have pinned flag */
-	XE_BUG_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
+	BUG_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
 				 XE_BO_CREATE_GGTT_BIT)));
 
 	/*
 	 * No reason we can't support pinning imported dma-bufs we just don't
 	 * expect to pin an imported dma-buf.
 	 */
-	XE_BUG_ON(bo->ttm.base.import_attach);
+	BUG_ON(bo->ttm.base.import_attach);
 
 	/* We only expect at most 1 pin */
-	XE_BUG_ON(xe_bo_is_pinned(bo));
+	BUG_ON(xe_bo_is_pinned(bo));
 
 	err = xe_bo_validate(bo, NULL, false);
 	if (err)
@@ -1296,7 +1296,7 @@ int xe_bo_pin(struct xe_bo *bo)
 		bool vram;
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
+			BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
 				       vram_region_io_offset(bo)) >> PAGE_SHIFT;
@@ -1333,9 +1333,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_BUG_ON(bo->vm);
-	XE_BUG_ON(!xe_bo_is_pinned(bo));
-	XE_BUG_ON(!xe_bo_is_user(bo));
+	BUG_ON(bo->vm);
+	BUG_ON(!xe_bo_is_pinned(bo));
+	BUG_ON(!xe_bo_is_user(bo));
 
 	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
 		spin_lock(&xe->pinned.lock);
@@ -1356,15 +1356,15 @@ void xe_bo_unpin(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_BUG_ON(bo->ttm.base.import_attach);
-	XE_BUG_ON(!xe_bo_is_pinned(bo));
+	BUG_ON(bo->ttm.base.import_attach);
+	BUG_ON(!xe_bo_is_pinned(bo));
 
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_BUG_ON(list_empty(&bo->pinned_link));
+			BUG_ON(list_empty(&bo->pinned_link));
 
 			spin_lock(&xe->pinned.lock);
 			list_del_init(&bo->pinned_link);
@@ -1426,14 +1426,14 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 	if (!READ_ONCE(bo->ttm.pin_count))
 		xe_bo_assert_held(bo);
 
-	XE_BUG_ON(page_size > PAGE_SIZE);
+	BUG_ON(page_size > PAGE_SIZE);
 	page = offset >> PAGE_SHIFT;
 	offset &= (PAGE_SIZE - 1);
 
 	*is_vram = xe_bo_is_vram(bo);
 
 	if (!*is_vram && !xe_bo_is_stolen(bo)) {
-		XE_BUG_ON(!bo->ttm.ttm);
+		BUG_ON(!bo->ttm.ttm);
 
 		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
 				page_size, &cur);
@@ -1599,7 +1599,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 
-	XE_BUG_ON(!ww);
+	BUG_ON(!ww);
 
 	tv_bo.num_shared = num_resv;
 	tv_bo.bo = &bo->ttm;;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9b26049521de..169c80996b26 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -149,7 +149,7 @@ void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_BUG_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		BUG_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
@@ -161,7 +161,7 @@ static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
 				    struct ww_acquire_ctx *ctx)
 {
 	if (bo) {
-		XE_BUG_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
+		BUG_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
 				     bo->ttm.base.resv != &bo->ttm.base._resv));
 		dma_resv_lock(bo->ttm.base.resv, ctx);
 	}
@@ -170,7 +170,7 @@ static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
 static inline void xe_bo_unlock_no_vm(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_BUG_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
+		BUG_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
 				     bo->ttm.base.resv != &bo->ttm.base._resv));
 		dma_resv_unlock(bo->ttm.base.resv);
 	}
@@ -213,7 +213,7 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_BUG_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
+	BUG_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
 	return bo->ggtt_node.start;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index bbf89a58cdf5..b305d16a67ac 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -158,8 +158,8 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		 * We expect validate to trigger a move VRAM and our move code
 		 * should setup the iosys map.
 		 */
-		XE_BUG_ON(iosys_map_is_null(&bo->vmap));
-		XE_BUG_ON(!xe_bo_is_vram(bo));
+		BUG_ON(iosys_map_is_null(&bo->vmap));
+		BUG_ON(!xe_bo_is_vram(bo));
 
 		xe_bo_put(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 5f725ed2ca6b..518ce3f0bc36 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -52,10 +52,10 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
 	struct xe_gt *gt;
 
-	XE_BUG_ON(gt_id > XE_MAX_GT);
+	BUG_ON(gt_id > XE_MAX_GT);
 	gt = xe->gt + gt_id;
-	XE_BUG_ON(gt->info.id != gt_id);
-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+	BUG_ON(gt->info.id != gt_id);
+	BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
 	return gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 127ca8c6e279..a1e49e858531 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -52,10 +52,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	lrc_desc = xe_lrc_descriptor(lrc);
 
 	if (GRAPHICS_VERx100(xe) >= 1250) {
-		XE_BUG_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
+		BUG_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
 		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
 	} else {
-		XE_BUG_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
+		BUG_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
 		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
 	}
 
@@ -221,9 +221,9 @@ static void xe_execlist_make_active(struct xe_execlist_engine *exl)
 	struct xe_execlist_port *port = exl->port;
 	enum drm_sched_priority priority = exl->entity.priority;
 
-	XE_BUG_ON(priority == DRM_SCHED_PRIORITY_UNSET);
-	XE_BUG_ON(priority < 0);
-	XE_BUG_ON(priority >= ARRAY_SIZE(exl->port->active));
+	BUG_ON(priority == DRM_SCHED_PRIORITY_UNSET);
+	BUG_ON(priority < 0);
+	BUG_ON(priority >= ARRAY_SIZE(exl->port->active));
 
 	spin_lock_irq(&port->lock);
 
@@ -328,7 +328,7 @@ static int execlist_engine_init(struct xe_engine *e)
 	struct xe_execlist_engine *exl;
 	int err;
 
-	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
+	BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
 
 	exl = kzalloc(sizeof(*exl), GFP_KERNEL);
 	if (!exl)
@@ -393,7 +393,7 @@ static void execlist_engine_fini_async(struct work_struct *w)
 	struct xe_execlist_engine *exl = e->execlist;
 	unsigned long flags;
 
-	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
+	BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
 
 	spin_lock_irqsave(&exl->port->lock, flags);
 	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 77a210acfac3..7a3f477bd9a0 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -44,7 +44,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	mutex_init(&fw->lock);
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
@@ -66,7 +66,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	int i, j;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if (!xe_gt_is_media_type(gt))
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 7c534cdd5fe9..2f176e491daf 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -24,7 +24,7 @@ static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
 {
-	XE_BUG_ON(!domain);
+	BUG_ON(!domain);
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
@@ -32,7 +32,7 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	XE_BUG_ON(!(fw->awake_domains & domain));
+	BUG_ON(!(fw->awake_domains & domain));
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index bd079e823661..b52ad009c74e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -56,8 +56,8 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
-	XE_BUG_ON(addr & GEN8_PTE_MASK);
-	XE_BUG_ON(addr >= ggtt->size);
+	BUG_ON(addr & GEN8_PTE_MASK);
+	BUG_ON(addr >= ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> GEN8_PTE_SHIFT]);
 }
@@ -67,7 +67,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	u64 end = start + size - 1;
 	u64 scratch_pte;
 
-	XE_BUG_ON(start >= end);
+	BUG_ON(start >= end);
 
 	if (ggtt->scratch)
 		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
@@ -96,7 +96,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	ggtt->gt = gt;
 
@@ -232,7 +232,7 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 	for (addr = 0; addr < ggtt->size; addr += GEN8_PAGE_SIZE) {
 		unsigned int i = addr / GEN8_PAGE_SIZE;
 
-		XE_BUG_ON(addr > U32_MAX);
+		BUG_ON(addr > U32_MAX);
 		if (ggtt->gsm[i] == scratch_pte)
 			continue;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7d8b4cffcc2d..7771008b4fee 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -48,14 +48,14 @@ struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
 	struct xe_gt *search;
 	u8 id;
 
-	XE_BUG_ON(!xe_gt_is_media_type(gt));
+	BUG_ON(!xe_gt_is_media_type(gt));
 
 	for_each_gt(search, gt_to_xe(gt), id) {
 		if (search->info.vram_id == gt->info.vram_id)
 			return search;
 	}
 
-	XE_BUG_ON("NOT POSSIBLE");
+	BUG_ON("NOT POSSIBLE");
 	return NULL;
 }
 
@@ -63,7 +63,7 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 {
 	struct drm_device *drm = &xe->drm;
 
-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+	BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
 	if (!xe_gt_is_media_type(gt)) {
 		gt->mem.ggtt = drmm_kzalloc(drm, sizeof(*gt->mem.ggtt),
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 60a2966bc1fd..92686359b315 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -49,7 +49,7 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
 		return f25_mhz;
 	default:
-		XE_BUG_ON("NOT_POSSIBLE");
+		BUG_ON("NOT_POSSIBLE");
 		return 0;
 	}
 }
@@ -60,7 +60,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 639b2486803b..aed49547622c 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -145,7 +145,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	char name[8];
 	int i;
 
-	XE_BUG_ON(!minor->debugfs_root);
+	BUG_ON(!minor->debugfs_root);
 
 	sprintf(name, "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 6c9a96cf3d5f..ef4a5fc66793 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -194,7 +194,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
-	XE_BUG_ON(!vma);
+	BUG_ON(!vma);
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
@@ -232,10 +232,10 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			start = ALIGN_DOWN(vma->start, length);
 		}
 
-		XE_BUG_ON(length < SZ_4K);
-		XE_BUG_ON(!is_power_of_2(length));
-		XE_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
-		XE_BUG_ON(!IS_ALIGNED(start, length));
+		BUG_ON(length < SZ_4K);
+		BUG_ON(!is_power_of_2(length));
+		BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
+		BUG_ON(!IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = vma->vm->usm.asid;
@@ -244,7 +244,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
 	}
 
-	XE_BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
+	BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
 
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bccdfb914f08..5c29e1c2de91 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -41,9 +41,9 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 {
 	u32 addr = xe_bo_ggtt_addr(bo);
 
-	XE_BUG_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
-	XE_BUG_ON(addr >= GUC_GGTT_TOP);
-	XE_BUG_ON(bo->size > GUC_GGTT_TOP - addr);
+	BUG_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
+	BUG_ON(addr >= GUC_GGTT_TOP);
+	BUG_ON(bo->size > GUC_GGTT_TOP - addr);
 
 	return addr;
 }
@@ -637,13 +637,13 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	int i;
 
 	BUILD_BUG_ON(GEN11_SOFT_SCRATCH_COUNT != MEDIA_SOFT_SCRATCH_COUNT);
-	XE_BUG_ON(guc->ct.enabled);
-	XE_BUG_ON(!len);
-	XE_BUG_ON(len > GEN11_SOFT_SCRATCH_COUNT);
-	XE_BUG_ON(len > MEDIA_SOFT_SCRATCH_COUNT);
-	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
+	BUG_ON(guc->ct.enabled);
+	BUG_ON(!len);
+	BUG_ON(len > GEN11_SOFT_SCRATCH_COUNT);
+	BUG_ON(len > MEDIA_SOFT_SCRATCH_COUNT);
+	BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
 		  GUC_HXG_ORIGIN_HOST);
-	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
+	BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
 		  GUC_HXG_TYPE_REQUEST);
 
 retry:
@@ -754,8 +754,8 @@ static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
 	};
 	int ret;
 
-	XE_BUG_ON(len > 2);
-	XE_BUG_ON(len == 1 && upper_32_bits(val));
+	BUG_ON(len > 2);
+	BUG_ON(len == 1 && upper_32_bits(val));
 
 	/* Self config must go over MMIO */
 	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d5a089694f80..cd8de752e660 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -118,7 +118,7 @@ struct __guc_ads_blob {
 
 static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 {
-	XE_BUG_ON(!ads->regset_size);
+	BUG_ON(!ads->regset_size);
 
 	return ads->regset_size;
 }
@@ -308,7 +308,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	u32 prev_regset_size = ads->regset_size;
 
-	XE_BUG_ON(!ads->bo);
+	BUG_ON(!ads->bo);
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
@@ -521,7 +521,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 		regset_used += count * sizeof(struct guc_mmio_reg);
 	}
 
-	XE_BUG_ON(regset_used > ads->regset_size);
+	BUG_ON(regset_used > ads->regset_size);
 }
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
@@ -577,7 +577,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_BUG_ON(!ads->bo);
+	BUG_ON(!ads->bo);
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -601,7 +601,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_BUG_ON(!ads->bo);
+	BUG_ON(!ads->bo);
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -651,7 +651,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 				   engine_enabled_masks[guc_class]))
 			continue;
 
-		XE_BUG_ON(!gt->default_lrc[class]);
+		BUG_ON(!gt->default_lrc[class]);
 
 		real_size = xe_lrc_size(xe, class);
 		alloc_size = PAGE_ALIGN(real_size);
@@ -680,7 +680,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 		offset += alloc_size;
 	}
 
-	XE_BUG_ON(total_size != ads->golden_lrc_size);
+	BUG_ON(total_size != ads->golden_lrc_size);
 }
 
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index fec09ba412a8..70edffe1e377 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -134,7 +134,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
-	XE_BUG_ON(guc_ct_size() % PAGE_SIZE);
+	BUG_ON(guc_ct_size() % PAGE_SIZE);
 
 	mutex_init(&ct->lock);
 	spin_lock_init(&ct->fast_lock);
@@ -280,7 +280,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int err;
 
-	XE_BUG_ON(ct->enabled);
+	BUG_ON(ct->enabled);
 
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
@@ -365,7 +365,7 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 
 static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
-	XE_BUG_ON(g2h_len > ct->ctbs.g2h.space);
+	BUG_ON(g2h_len > ct->ctbs.g2h.space);
 
 	if (g2h_len) {
 		spin_lock_irq(&ct->fast_lock);
@@ -405,8 +405,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 							 tail * sizeof(u32));
 
 	lockdep_assert_held(&ct->lock);
-	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
-	XE_BUG_ON(tail > h2g->size);
+	BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
+	BUG_ON(tail > h2g->size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
 	if (tail + cmd_len > h2g->size) {
@@ -460,10 +460,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 {
 	int ret;
 
-	XE_BUG_ON(g2h_len && g2h_fence);
-	XE_BUG_ON(num_g2h && g2h_fence);
-	XE_BUG_ON(g2h_len && !num_g2h);
-	XE_BUG_ON(!g2h_len && num_g2h);
+	BUG_ON(g2h_len && g2h_fence);
+	BUG_ON(num_g2h && g2h_fence);
+	BUG_ON(g2h_len && !num_g2h);
+	BUG_ON(!g2h_len && num_g2h);
 	lockdep_assert_held(&ct->lock);
 
 	if (unlikely(ct->ctbs.h2g.broken)) {
@@ -534,7 +534,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
-	XE_BUG_ON(g2h_len && g2h_fence);
+	BUG_ON(g2h_len && g2h_fence);
 	lockdep_assert_held(&ct->lock);
 
 try_again:
@@ -601,7 +601,7 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	int ret;
 
-	XE_BUG_ON(g2h_len && g2h_fence);
+	BUG_ON(g2h_len && g2h_fence);
 
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index a6982f323ed1..bcd8f4e9e393 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -119,7 +119,7 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	XE_BUG_ON(!guc->hwconfig.bo);
+	BUG_ON(!guc->hwconfig.bo);
 
 	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
 			   guc->hwconfig.size);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 9a7b5d5906c1..fbd74c27f352 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -55,12 +55,12 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	size_t size;
 	int i, j;
 
-	XE_BUG_ON(!log->bo);
+	BUG_ON(!log->bo);
 
 	size = log->bo->size;
 
 #define DW_PER_READ		128
-	XE_BUG_ON(size % (DW_PER_READ * sizeof(u32)));
+	BUG_ON(size % (DW_PER_READ * sizeof(u32)));
 	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
 		u32 read[DW_PER_READ];
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8df5513796f1..5a8659e99c8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -326,7 +326,7 @@ static void __guc_engine_policy_start_klv(struct engine_policy *policy,
 static void __guc_engine_policy_add_##func(struct engine_policy *policy, \
 					   u32 data) \
 { \
-	XE_BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
+	BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
  \
 	policy->h2g.klv[policy->count].kl = \
 		FIELD_PREP(GUC_KLV_0_KEY, \
@@ -355,7 +355,7 @@ static void init_policies(struct xe_guc *guc, struct xe_engine *e)
 	u32 timeslice_us = e->sched_props.timeslice_us;
 	u32 preempt_timeout_us = e->sched_props.preempt_timeout_us;
 
-	XE_BUG_ON(!engine_registered(e));
+	BUG_ON(!engine_registered(e));
 
         __guc_engine_policy_start_klv(&policy, e->guc->id);
         __guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
@@ -413,7 +413,7 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	int len = 0;
 	int i;
 
-	XE_BUG_ON(!xe_engine_is_parallel(e));
+	BUG_ON(!xe_engine_is_parallel(e));
 
 	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
 	action[len++] = info->flags;
@@ -436,7 +436,7 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
-	XE_BUG_ON(len > MAX_MLRC_REG_SIZE);
+	BUG_ON(len > MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
@@ -470,7 +470,7 @@ static void register_engine(struct xe_engine *e)
 	struct xe_lrc *lrc = e->lrc;
 	struct guc_ctxt_registration_info info;
 
-	XE_BUG_ON(engine_registered(e));
+	BUG_ON(engine_registered(e));
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = e->guc->id;
@@ -552,7 +552,7 @@ static int wq_noop_append(struct xe_engine *e)
 	if (wq_wait_for_space(e, wq_space_until_wrap(e)))
 		return -ENODEV;
 
-	XE_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
+	BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
 
 	parallel_write(xe, map, wq[e->guc->wqi_tail / sizeof(u32)],
 		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
@@ -591,13 +591,13 @@ static void wq_item_append(struct xe_engine *e)
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
 	}
 
-	XE_BUG_ON(i != wqi_size / sizeof(u32));
+	BUG_ON(i != wqi_size / sizeof(u32));
 
 	iosys_map_incr(&map, offsetof(struct parallel_scratch,
 					wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
-	XE_BUG_ON(e->guc->wqi_tail > WQ_SIZE);
+	BUG_ON(e->guc->wqi_tail > WQ_SIZE);
 
 	xe_device_wmb(xe);
 
@@ -616,7 +616,7 @@ static void submit_engine(struct xe_engine *e)
 	int len = 0;
 	bool extra_submit = false;
 
-	XE_BUG_ON(!engine_registered(e));
+	BUG_ON(!engine_registered(e));
 
 	if (xe_engine_is_parallel(e))
 		wq_item_append(e);
@@ -663,7 +663,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_engine *e = job->engine;
 
-	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
+	BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
 		  !engine_banned(e) && !engine_suspended(e));
 
 	trace_xe_sched_job_run(job);
@@ -935,7 +935,7 @@ static void __guc_engine_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_engine *e = msg->private_data;
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_BUG_ON(e->flags & ENGINE_FLAG_KERNEL);
+	BUG_ON(e->flags & ENGINE_FLAG_KERNEL);
 	trace_xe_engine_cleanup_entity(e);
 
 	if (engine_registered(e))
@@ -963,9 +963,9 @@ static void suspend_fence_signal(struct xe_engine *e)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_BUG_ON(!engine_suspended(e) && !engine_killed(e) &&
+	BUG_ON(!engine_suspended(e) && !engine_killed(e) &&
 		  !guc_read_stopped(guc));
-	XE_BUG_ON(!e->guc->suspend_pending);
+	BUG_ON(!e->guc->suspend_pending);
 
 	e->guc->suspend_pending = false;
 	smp_wmb();
@@ -1051,7 +1051,7 @@ static void guc_engine_process_msg(struct drm_sched_msg *msg)
 		__guc_engine_process_msg_resume(msg);
 		break;
 	default:
-		XE_BUG_ON("Unknown message type");
+		BUG_ON("Unknown message type");
 	}
 }
 
@@ -1070,7 +1070,7 @@ static int guc_engine_init(struct xe_engine *e)
 	long timeout;
 	int err;
 
-	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
+	BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
 
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
@@ -1231,9 +1231,9 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
 {
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 
-	XE_BUG_ON(engine_registered(e));
-	XE_BUG_ON(engine_banned(e));
-	XE_BUG_ON(engine_killed(e));
+	BUG_ON(engine_registered(e));
+	BUG_ON(engine_banned(e));
+	BUG_ON(engine_killed(e));
 
 	sched->timeout = job_timeout_ms;
 
@@ -1265,7 +1265,7 @@ static void guc_engine_resume(struct xe_engine *e)
 {
 	struct drm_sched_msg *msg = e->guc->static_msgs + STATIC_MSG_RESUME;
 
-	XE_BUG_ON(e->guc->suspend_pending);
+	BUG_ON(e->guc->suspend_pending);
 
 	guc_engine_add_msg(e, msg, RESUME);
 }
@@ -1364,7 +1364,7 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 	struct xe_engine *e;
 	unsigned long index;
 
-	XE_BUG_ON(guc_read_stopped(guc) != 1);
+	BUG_ON(guc_read_stopped(guc) != 1);
 
 	mutex_lock(&guc->submission_state.lock);
 
@@ -1403,7 +1403,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	struct xe_engine *e;
 	unsigned long index;
 
-	XE_BUG_ON(guc_read_stopped(guc) != 1);
+	BUG_ON(guc_read_stopped(guc) != 1);
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
@@ -1433,7 +1433,7 @@ g2h_engine_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	XE_BUG_ON(e->guc->id != guc_id);
+	BUG_ON(e->guc->id != guc_id);
 
 	return e;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index a9448c6f6418..6b742fe01e1b 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -71,7 +71,7 @@ int xe_huc_auth(struct xe_huc *huc)
 	if (xe_uc_fw_is_disabled(&huc->fw))
 		return 0;
 
-	XE_BUG_ON(xe_uc_fw_is_running(&huc->fw));
+	BUG_ON(xe_uc_fw_is_running(&huc->fw));
 
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 63a4efd5edcc..e3f967b8579f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -234,7 +234,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 
 static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, u32 reg, u32 val)
 {
-	XE_BUG_ON(reg & hwe->mmio_base);
+	BUG_ON(reg & hwe->mmio_base);
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	xe_mmio_write32(hwe->gt, reg + hwe->mmio_base, val);
@@ -242,7 +242,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, u32 reg, u32 val)
 
 static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, u32 reg)
 {
-	XE_BUG_ON(reg & hwe->mmio_base);
+	BUG_ON(reg & hwe->mmio_base);
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	return xe_mmio_read32(hwe->gt, reg + hwe->mmio_base);
@@ -280,7 +280,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	info = &engine_infos[id];
 
-	XE_BUG_ON(hwe->gt);
+	BUG_ON(hwe->gt);
 
 	hwe->gt = gt;
 	hwe->class = info->class;
@@ -304,8 +304,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	XE_BUG_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
-	XE_BUG_ON(!(gt->info.engine_mask & BIT(id)));
+	BUG_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
+	BUG_ON(!(gt->info.engine_mask & BIT(id)));
 
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(&hwe->reg_whitelist, hwe->mmio_base, gt);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index bbfce9f58cd6..2a082104137d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -188,7 +188,7 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 
 	trace_xe_hw_fence_free(fence);
-	XE_BUG_ON(!list_empty(&fence->irq_link));
+	BUG_ON(!list_empty(&fence->irq_link));
 	call_rcu(&dma_fence->rcu, fence_free);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fb8c6f7d6528..7ae4a0b93249 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -108,7 +108,7 @@ static void set_offsets(u32 *regs,
 		*regs |= MI_LRI_LRM_CS_MMIO;
 		regs++;
 
-		XE_BUG_ON(!count);
+		BUG_ON(!count);
 		do {
 			u32 offset = 0;
 			u8 v;
@@ -528,7 +528,7 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 { \
 	struct iosys_map map = lrc->bo->vmap; \
 \
-	XE_BUG_ON(iosys_map_is_null(&map)); \
+	BUG_ON(iosys_map_is_null(&map)); \
 	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
 	return map; \
 } \
@@ -759,12 +759,12 @@ void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size)
 	u32 rhs;
 	size_t aligned_size;
 
-	XE_BUG_ON(!IS_ALIGNED(size, 4));
+	BUG_ON(!IS_ALIGNED(size, 4));
 	aligned_size = ALIGN(size, 8);
 
 	ring = __xe_lrc_ring_map(lrc);
 
-	XE_BUG_ON(lrc->ring.tail >= lrc->ring.size);
+	BUG_ON(lrc->ring.tail >= lrc->ring.size);
 	rhs = lrc->ring.size - lrc->ring.tail;
 	if (size > rhs) {
 		__xe_lrc_write_ring(lrc, ring, data, rhs);
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 0a42112eb247..826759d0fcab 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -9,7 +9,6 @@
 #include <linux/bug.h>
 
 #define XE_EXTRA_DEBUG 1
-#define XE_BUG_ON BUG_ON
 
 #define XE_IOCTL_ERR(xe, cond) \
 	((cond) && (drm_info(&(xe)->drm, \
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a98e4bad39bf..83014991fdde 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -106,7 +106,7 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 {
-	XE_BUG_ON(slot >= NUM_PT_SLOTS);
+	BUG_ON(slot >= NUM_PT_SLOTS);
 
 	/* First slot is reserved for mapping of PT bo and bb, start from 1 */
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
@@ -148,7 +148,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, GEN8_PAGE_SIZE, &is_vram);
-	XE_BUG_ON(!is_vram);
+	BUG_ON(!is_vram);
 	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
 
 	return 0;
@@ -173,7 +173,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
-	XE_BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
+	BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
 
 	bo = xe_bo_create_pin_map(vm->xe, m->gt, vm,
 				  num_entries * GEN8_PAGE_SIZE,
@@ -208,7 +208,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	}
 
 	if (!IS_DGFX(xe)) {
-		XE_BUG_ON(xe->info.supports_usm);
+		BUG_ON(xe->info.supports_usm);
 
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * GEN8_PAGE_SIZE;
@@ -318,7 +318,7 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 	struct ww_acquire_ctx ww;
 	int err;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
 	if (!m)
@@ -491,7 +491,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 
 	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
 				    NUM_CCS_BYTES_PER_BLOCK);
-	XE_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
+	BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
@@ -511,9 +511,9 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
 		      unsigned pitch)
 {
-	XE_BUG_ON(size / pitch > S16_MAX);
-	XE_BUG_ON(pitch / 4 > S16_MAX);
-	XE_BUG_ON(pitch > U16_MAX);
+	BUG_ON(size / pitch > S16_MAX);
+	BUG_ON(pitch / 4 > S16_MAX);
+	BUG_ON(pitch > U16_MAX);
 
 	bb->cs[bb->len++] = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
 	bb->cs[bb->len++] = BLT_DEPTH_32 | pitch;
@@ -565,7 +565,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * At the moment, we don't support copying CCS metadata from
 		 * system to system.
 		 */
-		XE_BUG_ON(!src_is_vram && !dst_is_vram);
+		BUG_ON(!src_is_vram && !dst_is_vram);
 
 		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
 			      src_is_vram, dst_size);
@@ -764,7 +764,7 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	*cs++ = upper_32_bits(src_ofs);
 	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
 
-	XE_BUG_ON(cs - bb->cs != len + bb->len);
+	BUG_ON(cs - bb->cs != len + bb->len);
 
 	bb->len += len;
 }
@@ -802,7 +802,7 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 		*cs++ = 0;
 	}
 
-	XE_BUG_ON(cs - bb->cs != len + bb->len);
+	BUG_ON(cs - bb->cs != len + bb->len);
 
 	bb->len += len;
 }
@@ -977,14 +977,14 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * This shouldn't be possible in practice.. might change when 16K
 	 * pages are used. Hence the BUG_ON.
 	 */
-	XE_BUG_ON(update->qwords > 0x1ff);
+	BUG_ON(update->qwords > 0x1ff);
 	if (!ppgtt_ofs) {
 		bool is_vram;
 
 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
 							   GEN8_PAGE_SIZE,
 							   &is_vram));
-		XE_BUG_ON(!is_vram);
+		BUG_ON(!is_vram);
 	}
 
 	do {
@@ -1166,7 +1166,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
 	 * Should be reasonably bound..
 	 */
-	XE_BUG_ON(batch_size >= SZ_128K);
+	BUG_ON(batch_size >= SZ_128K);
 
 	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
 	if (IS_ERR(bb))
@@ -1176,7 +1176,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
 		if (eng) {
-			XE_BUG_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
+			BUG_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
 
 			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
 						 GFP_KERNEL, true);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5cacaa05759a..ef3dd0ffb001 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -246,7 +246,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 			if (xe_gt_is_media_type(gt))
 				--adj_tile_count;
 
-		XE_BUG_ON(!adj_tile_count);
+		BUG_ON(!adj_tile_count);
 
 		size = xe->mem.vram.size / adj_tile_count;
 		io_start = xe->mem.vram.io_start;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffb0e6d8f9f7..4bde3684fe82 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -126,7 +126,7 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
 		pte |= GEN8_PDPE_PS_1G;
 
 	/* XXX: Does hw support 1 GiB pages? */
-	XE_BUG_ON(pt_level > 2);
+	BUG_ON(pt_level > 2);
 
 	return pte;
 }
@@ -171,7 +171,7 @@ static u64 __xe_pt_empty_pte(struct xe_gt *gt, struct xe_vm *vm,
 {
 	u8 id = gt->info.id;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	if (!vm->scratch_bo[id])
 		return 0;
@@ -229,7 +229,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	pt->level = level;
 	pt->drm.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
-	XE_BUG_ON(level > XE_VM_MAX_LEVEL);
+	BUG_ON(level > XE_VM_MAX_LEVEL);
 
 	return pt;
 
@@ -255,7 +255,7 @@ void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
 	u64 empty;
 	int i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	if (!vm->scratch_bo[gt->info.id]) {
 		/*
@@ -300,7 +300,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	if (!pt)
 		return;
 
-	XE_BUG_ON(!list_empty(&pt->bo->vmas));
+	BUG_ON(!list_empty(&pt->bo->vmas));
 	xe_bo_unpin(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
@@ -874,8 +874,8 @@ static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
 	pgoff_t end_offset;
 
-	XE_BUG_ON(!*child);
-	XE_BUG_ON(!level && xe_child->is_compact);
+	BUG_ON(!*child);
+	BUG_ON(!level && xe_child->is_compact);
 
 	/*
 	 * Note that we're called from an entry callback, and we're dealing
@@ -944,7 +944,7 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_gt *gt,
 	u64 *ptr = data;
 	u32 i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	for (i = 0; i < num_qwords; i++) {
 		if (map)
@@ -1053,7 +1053,7 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 		u64 end;
 		u64 start;
 
-		XE_BUG_ON(entry->pt->is_compact);
+		BUG_ON(entry->pt->is_compact);
 		start = entry->ofs * page_size;
 		end = start + page_size * entry->qwords;
 		vm_dbg(&xe->drm,
@@ -1297,7 +1297,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	bind_pt_update.locked = false;
 	xe_bo_assert_held(vma->bo);
 	xe_vm_assert_held(vm);
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	vm_dbg(&vma->vm->xe->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
@@ -1306,7 +1306,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	err = xe_pt_prepare_bind(gt, vma, entries, &num_entries, rebind);
 	if (err)
 		goto err;
-	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
+	BUG_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
 
@@ -1436,8 +1436,8 @@ static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
 {
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
 
-	XE_BUG_ON(!*child);
-	XE_BUG_ON(!level && xe_child->is_compact);
+	BUG_ON(!*child);
+	BUG_ON(!level && xe_child->is_compact);
 
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
 
@@ -1528,7 +1528,7 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 	u64 empty = __xe_pt_empty_pte(gt, vma->vm, update->pt->level);
 	int i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	if (map && map->is_iomem)
 		for (i = 0; i < num_qwords; ++i)
@@ -1620,14 +1620,14 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_bo_assert_held(vma->bo);
 	xe_vm_assert_held(vm);
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	vm_dbg(&vma->vm->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
 	       vma->start, vma->end, e);
 
 	num_entries = xe_pt_stage_unbind(gt, vma, entries);
-	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
+	BUG_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
 
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index b34eb906dbb0..3b5bf90ff655 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -80,7 +80,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	if (!res)
 		goto fallback;
 
-	XE_BUG_ON(start + size > res->size);
+	BUG_ON(start + size > res->size);
 
 	cur->mem_type = res->mem_type;
 
@@ -141,7 +141,7 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 	while (start >= sg_dma_len(sgl)) {
 		start -= sg_dma_len(sgl);
 		sgl = sg_next(sgl);
-		XE_BUG_ON(!sgl);
+		BUG_ON(!sgl);
 	}
 
 	cur->start = start;
@@ -163,8 +163,8 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   u64 start, u64 size,
 				   struct xe_res_cursor *cur)
 {
-	XE_BUG_ON(!sg);
-	XE_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+	BUG_ON(!sg);
+	BUG_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
 		  !IS_ALIGNED(size, PAGE_SIZE));
 	cur->node = NULL;
 	cur->start = start;
@@ -189,7 +189,7 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 	struct list_head *next;
 	u64 start;
 
-	XE_BUG_ON(size > cur->remaining);
+	BUG_ON(size > cur->remaining);
 
 	cur->remaining -= size;
 	if (!cur->remaining)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 918e819e7c91..b610a4f0dfa4 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -184,7 +184,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_BUG_ON(i > MAX_JOB_SIZE_DW);
+	BUG_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -222,7 +222,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_BUG_ON(i > MAX_JOB_SIZE_DW);
+	BUG_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -263,7 +263,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_BUG_ON(i > MAX_JOB_SIZE_DW);
+	BUG_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -293,7 +293,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_BUG_ON(i > MAX_JOB_SIZE_DW);
+	BUG_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 2985caa6097b..87854f3473db 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -142,7 +142,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 
 		/* Sanity check */
 		for (j = 0; j < e->width; ++j)
-			XE_BUG_ON(cf->base.seqno != fences[j]->seqno);
+			BUG_ON(cf->base.seqno != fences[j]->seqno);
 
 		job->fence = &cf->base;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
index 8075781070f2..c61d2fa658b5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
@@ -111,7 +111,7 @@ int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
 	struct ttm_resource_manager *man = &mgr->manager;
 	int err;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	mgr->gt = gt;
 	man->use_tt = true;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 31887fec1073..1343b3a862ce 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -184,7 +184,7 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
 	struct xe_res_cursor cur;
 
-	XE_BUG_ON(!mgr->io_base);
+	BUG_ON(!mgr->io_base);
 
 	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
@@ -224,7 +224,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 #ifdef CONFIG_X86
 	struct xe_bo *bo = ttm_to_xe_bo(mem->bo);
 
-	XE_BUG_ON(IS_DGFX(xe));
+	BUG_ON(IS_DGFX(xe));
 
 	/* XXX: Require BO to be mapped to GGTT? */
 	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 73836b9b7fed..aa50964214f8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -357,7 +357,7 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	BUG_ON(xe_gt_is_media_type(gt));
 
 	mgr->gt = gt;
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3ebe651b9a1b..bbe9239e8145 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -23,7 +23,7 @@ __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
 	if (type == XE_UC_FW_TYPE_GUC)
 		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
 
-	XE_BUG_ON(type != XE_UC_FW_TYPE_HUC);
+	BUG_ON(type != XE_UC_FW_TYPE_HUC);
 	return container_of(uc_fw, struct xe_gt, uc.huc.fw);
 }
 
@@ -146,7 +146,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	u8 rev = xe->info.revid;
 	int i;
 
-	XE_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
+	BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
 	fw_blobs = blobs_all[uc_fw->type].blobs;
 	fw_count = blobs_all[uc_fw->type].count;
 
@@ -176,8 +176,8 @@ size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len)
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
 
-	XE_BUG_ON(size % 4);
-	XE_BUG_ON(!xe_uc_fw_is_available(uc_fw));
+	BUG_ON(size % 4);
+	BUG_ON(!xe_uc_fw_is_available(uc_fw));
 
 	xe_map_memcpy_from(xe, dst, &uc_fw->bo->vmap,
 			   xe_uc_fw_rsa_offset(uc_fw), size);
@@ -201,7 +201,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_guc *guc = &gt->uc.guc;
 
-	XE_BUG_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
+	BUG_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
 	WARN_ON(uc_fw->major_ver_found < 70);
 
 	if (uc_fw->minor_ver_found >= 6) {
@@ -246,8 +246,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	 * before we're looked at the HW caps to see if we have uc support
 	 */
 	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	XE_BUG_ON(uc_fw->status);
-	XE_BUG_ON(uc_fw->path);
+	BUG_ON(uc_fw->status);
+	BUG_ON(uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
 	xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
@@ -418,7 +418,7 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	int err;
 
 	/* make sure the status was cleared the last time we reset the uc */
-	XE_BUG_ON(xe_uc_fw_is_loaded(uc_fw));
+	BUG_ON(xe_uc_fw_is_loaded(uc_fw));
 
 	if (!xe_uc_fw_is_loadable(uc_fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index bf31c3bb0e0f..2221f5fd3f54 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -104,7 +104,7 @@ static inline enum xe_uc_fw_status
 __xe_uc_fw_status(struct xe_uc_fw *uc_fw)
 {
 	/* shouldn't call this before checking hw/blob availability */
-	XE_BUG_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
+	BUG_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
 	return uc_fw->status;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fb6b563378ea..c7247348b5d6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -62,7 +62,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	bool read_only = vma->pte_flags & PTE_READ_ONLY;
 
 	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!xe_vma_is_userptr(vma));
+	BUG_ON(!xe_vma_is_userptr(vma));
 retry:
 	if (vma->destroyed)
 		return 0;
@@ -248,7 +248,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 		struct dma_fence *fence;
 
 		link = list->next;
-		XE_BUG_ON(link == list);
+		BUG_ON(link == list);
 
 		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
 					     e, e->compute.context,
@@ -325,7 +325,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 	int err;
 	bool wait;
 
-	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
+	BUG_ON(!xe_vm_in_compute_mode(vm));
 
 	down_write(&vm->lock);
 
@@ -523,7 +523,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
+	BUG_ON(!xe_vm_in_compute_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	if (xe_vm_is_closed(vm)) {
@@ -660,7 +660,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	struct dma_fence *fence;
 	long err;
 
-	XE_BUG_ON(!xe_vma_is_userptr(vma));
+	BUG_ON(!xe_vma_is_userptr(vma));
 	trace_xe_vma_userptr_invalidate(vma);
 
 	if (!mmu_notifier_range_blockable(range))
@@ -824,8 +824,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	struct xe_gt *gt;
 	u8 id;
 
-	XE_BUG_ON(start >= end);
-	XE_BUG_ON(end >= vm->size);
+	BUG_ON(start >= end);
+	BUG_ON(end >= vm->size);
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma) {
@@ -945,7 +945,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	struct xe_vm *vm = vma->vm;
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->unbind_link));
+	BUG_ON(!list_empty(&vma->unbind_link));
 
 	if (xe_vma_is_userptr(vma)) {
 		WARN_ON(!vma->destroyed);
@@ -1048,7 +1048,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
 	if (xe_vm_is_closed(vm))
 		return NULL;
 
-	XE_BUG_ON(vma->end >= vm->size);
+	BUG_ON(vma->end >= vm->size);
 	lockdep_assert_held(&vm->lock);
 
 	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
@@ -1058,7 +1058,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
 
 static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(vma->vm != vm);
+	BUG_ON(vma->vm != vm);
 	lockdep_assert_held(&vm->lock);
 
 	rb_add(&vma->vm_node, &vm->vmas, xe_vma_less_cb);
@@ -1066,7 +1066,7 @@ static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 
 static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(vma->vm != vm);
+	BUG_ON(vma->vm != vm);
 	lockdep_assert_held(&vm->lock);
 
 	rb_erase(&vma->vm_node, &vm->vmas);
@@ -1290,7 +1290,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct xe_gt *gt;
 	u8 id;
 
-	XE_BUG_ON(vm->preempt.num_engines);
+	BUG_ON(vm->preempt.num_engines);
 
 	vm->size = 0;
 	smp_mb();
@@ -1448,7 +1448,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt)
 {
-	XE_BUG_ON(xe_gt_is_media_type(full_gt));
+	BUG_ON(xe_gt_is_media_type(full_gt));
 
 	return gen8_pde_encode(vm->pt_root[full_gt->info.id]->bo, 0,
 			       XE_CACHE_WB);
@@ -1481,7 +1481,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 		if (!(vma->gt_present & BIT(id)))
 			goto next;
 
-		XE_BUG_ON(xe_gt_is_media_type(gt));
+		BUG_ON(xe_gt_is_media_type(gt));
 
 		fence = __xe_pt_unbind_vma(gt, vma, e, syncs, num_syncs);
 		if (IS_ERR(fence)) {
@@ -1553,7 +1553,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 		if (!(vma->gt_mask & BIT(id)))
 			goto next;
 
-		XE_BUG_ON(xe_gt_is_media_type(gt));
+		BUG_ON(xe_gt_is_media_type(gt));
 		fence = __xe_pt_bind_vma(gt, vma, e, syncs, num_syncs,
 					 vma->gt_present & BIT(id));
 		if (IS_ERR(fence)) {
@@ -1669,7 +1669,7 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
 		struct async_op_fence *afence =
 			container_of(fence, struct async_op_fence, fence);
 
-		XE_BUG_ON(xe_vm_no_dma_fences(afence->vm));
+		BUG_ON(xe_vm_no_dma_fences(afence->vm));
 
 		smp_rmb();
 		return wait_event_interruptible(afence->wq, afence->started);
@@ -1950,7 +1950,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 {
 	int err;
 
-	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
+	BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_is_userptr(vma)) {
 		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
@@ -1994,7 +1994,7 @@ static int __vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 				      afence);
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		BUG_ON("NOT POSSIBLE");
 		return -EINVAL;
 	}
 }
@@ -2040,7 +2040,7 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 	int err, i;
 
 	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->unbind_link));
+	BUG_ON(!list_empty(&vma->unbind_link));
 
 	/* Binds deferred to faults, signal fences now */
 	if (xe_vm_in_fault_mode(vm) && is_map_op(bind_op->op) &&
@@ -2190,7 +2190,7 @@ static void async_op_work_func(struct work_struct *w)
 
 					spin_lock_irq(&vm->async_ops.lock);
 					op = next_async_op(vm);
-					XE_BUG_ON(!op);
+					BUG_ON(!op);
 					list_del_init(&op->link);
 					spin_unlock_irq(&vm->async_ops.lock);
 
@@ -2332,7 +2332,7 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
 	 * ref count on each rebind.
 	 */
 
-	XE_BUG_ON(VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP &&
+	BUG_ON(VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP &&
 		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP_ALL &&
 		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_PREFETCH);
 
@@ -2511,7 +2511,7 @@ static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		BUG_ON("NOT POSSIBLE");
 		return -EINVAL;
 	}
 
@@ -2557,7 +2557,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 	bool first_munmap_rebind = false;
 
 	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!vma);
+	BUG_ON(!vma);
 
 	node = &vma->vm_node;
 	while ((node = rb_next(node))) {
@@ -2774,7 +2774,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 
 	switch (VM_BIND_OP(op)) {
 	case XE_VM_BIND_OP_MAP:
-		XE_BUG_ON(!bo);
+		BUG_ON(!bo);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -2806,7 +2806,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		vma = vm_prefetch_lookup_vmas(vm, &lookup, region);
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
-		XE_BUG_ON(!bo);
+		BUG_ON(!bo);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -2817,7 +2817,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		xe_bo_unlock(bo, &ww);
 		break;
 	case XE_VM_BIND_OP_MAP_USERPTR:
-		XE_BUG_ON(bo);
+		BUG_ON(bo);
 
 		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
 				    addr + range - 1,
@@ -2837,7 +2837,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		}
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		BUG_ON("NOT POSSIBLE");
 		vma = ERR_PTR(-EINVAL);
 	}
 
@@ -3213,7 +3213,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			if (err)
 				break;
 		} else {
-			XE_BUG_ON(j != 0);	/* Not supported */
+			BUG_ON(j != 0);	/* Not supported */
 			err = vm_bind_ioctl(vm, vmas[j], e, bos[j],
 					    bind_ops + j, __syncs,
 					    __num_syncs, NULL);
@@ -3295,7 +3295,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 
-	XE_BUG_ON(!ww);
+	BUG_ON(!ww);
 
 	tv_vm.num_shared = num_resv;
 	tv_vm.bo = xe_vm_ttm_bo(vm);;
@@ -3329,7 +3329,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	u8 id;
 	int ret;
 
-	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
+	BUG_ON(!xe_vm_in_fault_mode(vma->vm));
 	trace_xe_vma_usm_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..f85debe599df 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -44,7 +44,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 		passed = (rvalue & mask) <= (value & mask);
 		break;
 	default:
-		XE_BUG_ON("Not possible");
+		BUG_ON("Not possible");
 	}
 
 	return passed ? 0 : 1;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index c8cc3f5e6154..53be0c9fc374 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -146,10 +146,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	u32 mask;
 	int err;
 
-	XE_BUG_ON(!(base & GUC_WOPCM_OFFSET_MASK));
-	XE_BUG_ON(base & ~GUC_WOPCM_OFFSET_MASK);
-	XE_BUG_ON(!(size & GUC_WOPCM_SIZE_MASK));
-	XE_BUG_ON(size & ~GUC_WOPCM_SIZE_MASK);
+	BUG_ON(!(base & GUC_WOPCM_OFFSET_MASK));
+	BUG_ON(base & ~GUC_WOPCM_OFFSET_MASK);
+	BUG_ON(!(size & GUC_WOPCM_SIZE_MASK));
+	BUG_ON(size & ~GUC_WOPCM_SIZE_MASK);
 
 	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
 	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE.reg, size, mask,
@@ -215,9 +215,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-	XE_BUG_ON(guc_fw_size >= wopcm->size);
-	XE_BUG_ON(huc_fw_size >= wopcm->size);
-	XE_BUG_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
+	BUG_ON(guc_fw_size >= wopcm->size);
+	BUG_ON(huc_fw_size >= wopcm->size);
+	BUG_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
 
 	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
 	if (locked) {
@@ -258,8 +258,8 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 			   guc_fw_size, huc_fw_size)) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
-		XE_BUG_ON(!wopcm->guc.base);
-		XE_BUG_ON(!wopcm->guc.size);
+		BUG_ON(!wopcm->guc.base);
+		BUG_ON(!wopcm->guc.size);
 	} else {
 		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
 		return -E2BIG;
-- 
2.39.2

