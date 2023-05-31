Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE90C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C793E10E4F4;
	Wed, 31 May 2023 15:18:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23110E4EE
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:18:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:18:02 +0200
Message-Id: <20230531151804.2017924-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Small cleanups to DPT code.
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

Remove the dependency on intel_dpt, and implement xe_dpt instead.

Should cleanup the ifdefs around DPT.

Maarten Lankhorst (2):
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Implement xe DPT slightly differently.

 .../gpu/drm/i915/display/intel_atomic_plane.c |  4 --
 .../drm/i915/display/intel_display_types.h    |  7 ---
 drivers/gpu/drm/i915/display/intel_dpt.c      | 14 ++----
 drivers/gpu/drm/i915/display/intel_fb.c       |  7 ++-
 .../drm/i915/display/skl_universal_plane.c    |  7 +--
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/display/xe_dpt.c           | 46 +++++++++++++++++++
 7 files changed, 57 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/xe_dpt.c

-- 
2.34.1

