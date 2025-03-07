Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2172AC28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A6910E108;
	Fri,  7 Mar 2025 11:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PqneQjEA";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E487910E31F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kUf1t0S9QzcTI5UklE4Y8242EYcny4dzuTpf5aC2FMw=; b=PqneQjEAFDrcPe4dCCKKbIRux4
 dK7A+7MehrETWvSVoQYwuHyE/R2RMg6eRK5+LTagpC6OgvWyrFq1U9wxu2naGc90kEQHiceWQRWZ4
 zo82vfgvdRJQ4MtItj/UlxgJsmXYm8pwbEP2uYvozxyinSjBLOlBSZTmRd+GNLUEvYr1moVDgf2U5
 BspMy8+L8SgfCnYEGpO9YtS+TuRnnhFw1iYAoLUb6Hj9XfW7S5yzyXjXrxJib53AML1CjOeQj73IR
 lBBSc4/qNzEYqCgdx26Q/hgR7FiY15V9b6Pdq7JfOG/qO2AxblgGL4K7C7tshIOLN4MXeBw80LdlN
 RF1sw3yg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqVeR-005Ji2-6q; Fri, 07 Mar 2025 12:14:05 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [CI 0/4] Misc reviewed patches for CI
Date: Fri,  7 Mar 2025 11:13:58 +0000
Message-ID: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Four already reviewed patches extracted from my ADL-P AuxCCS series, but not
really about that feature, just general cleanups.

Tvrtko Ursulin (4):
  drm/xe: Fix MOCS debugfs LNCF readout
  drm/xe: Fix ring flush invalidation
  drm/xe: Pass flags directly to emit_flush_imm_ggtt
  drm/xe: Use correct type width for alignment in fb pinning code

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 +++++++++---------
 drivers/gpu/drm/xe/xe_mocs.c           |  4 +++-
 drivers/gpu/drm/xe/xe_ring_ops.c       | 28 +++++++++++---------------
 3 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.48.0

