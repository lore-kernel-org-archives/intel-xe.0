Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CEAC87FC5
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 07:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882CB10E76D;
	Wed, 23 Jul 2025 07:46:03 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7210E76A
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 07:46:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id B89573F108;
 Wed, 23 Jul 2025 09:45:50 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Cc: jeffbai@aosc.io,
	Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v3 0/5] drm/xe: enable driver usage on non-4KiB kernels
Date: Wed, 23 Jul 2025 16:45:12 +0900
Message-ID: <20250723074540.2660-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,

since this needed a rebase for the disappearance of bo->size, I've gone
ahead and done that (one line removed from Mingcong Bai's original patch
series).

There is only one thing that might need looking into: this will still fail
if kernel pages are larger than 64k. I'm not aware of any platform where
that is the case though.

   Simon

Mingcong Bai (5):
  drm/xe/bo: fix alignment with non-4KiB kernel page sizes
  drm/xe/guc: use GUC_SIZE (SZ_4K) for alignment
  drm/xe/regs: fix RING_CTL_SIZE(size) calculation
  drm/xe: use 4KiB alignment for cursor jumps
  drm/xe/query: use PAGE_SIZE as the minimum page alignment

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c               |  6 ++---
 drivers/gpu/drm/xe/xe_guc.c              |  4 +--
 drivers/gpu/drm/xe/xe_guc.h              |  3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c          | 32 ++++++++++++------------
 drivers/gpu/drm/xe/xe_guc_capture.c      |  8 +++---
 drivers/gpu/drm/xe/xe_guc_ct.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c          |  5 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c           |  4 +--
 drivers/gpu/drm/xe/xe_migrate.c          |  4 +--
 drivers/gpu/drm/xe/xe_query.c            |  2 +-
 include/uapi/drm/xe_drm.h                |  7 ++++--
 12 files changed, 43 insertions(+), 36 deletions(-)

-- 
2.47.2

