Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF80C7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D810E9F8;
	Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8BE10E9F7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:34 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 00/11] drm/xe: Init changes for flicker-free boot.
Date: Thu, 19 Jun 2025 12:48:59 +0200
Message-ID: <20250619104858.418440-13-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes since last time (v3.1):
- Fix the incorrect squashes.
- Rename instead of inline the gt_init sub-functions.
- Remove xe_uc_init_hwconfig and xe_uc_fini_hw.
- Rename xe_uc_init_hw to xe_uc_load_hw to clarify UC load flow.
  Only 3 init calls left.

Maarten Lankhorst (11):
  drm/xe: Defer memirq init until needed
  drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
  drm/xe: Simplify GuC early initialization
  drm/xe: Make it possible to read instance0 MCR registers after
    xe_gt_mcr_init_early
  drm/xe: Only dump PAT when xe_hw_engines_init_early fails
  drm/xe: Rename gt_init sub-functions
  drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
  drm/xe: Move xe_ttm_sys_mgr_init() downwards.
  drm/xe: Remove xe_uc_init_hwconfig()
  drm/xe: Remove xe_uc_fini_hw
  drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw

 drivers/gpu/drm/xe/xe_device.c      | 39 +++-----------
 drivers/gpu/drm/xe/xe_gt.c          | 80 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_gt.h          |  1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 47 +++++++++--------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  1 -
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 +
 drivers/gpu/drm/xe/xe_guc.c         | 50 +++++++++++++-----
 drivers/gpu/drm/xe/xe_guc.h         |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c      | 28 ++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 drivers/gpu/drm/xe/xe_tile.c        |  7 +++
 drivers/gpu/drm/xe/xe_uc.c          | 58 +++++++++------------
 drivers/gpu/drm/xe/xe_uc.h          |  5 +-
 13 files changed, 165 insertions(+), 155 deletions(-)

-- 
2.45.2

