Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65923606A326
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jwa3aT1k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DCD112557;
	Thu, 19 Nov 2026 15:25:33 +0000 (UTC)
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 18 Nov 2026 19:21:29 UTC
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757E110FFB5
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 19:21:29 +0000 (UTC)
X-Envelope-To: intel-xe@lists.freedesktop.org
DKIM-Signature: a=rsa-sha256; bh=LsuxcOhvKdi13O8EO+aoLGAH07VJh+BMmeR5nHZjkL8=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795029687; v=1; x=1795634487;
 b=jwa3aT1kFUsoAXECub71N5goYBHauDDpRIQJDmg9vvqKZVyTbQXSLBxsc4R2bFD0CdtDNgh8
 jYUBzLkIZ9IJEjDucXra7iRn6ABUUrOAEsqxP4RHPeTH6gcRWiNeDFMm7LJlJqjd9QHrY8qA4BD
 fgYylc8wTUAxFu/Tpd9//2NM=
X-Envelope-To: intel-xe@lists.freedesktop.org
Received: by smtp.migadu.com with ESMTPS id d26edee295264752;
 Wed, 18 Nov 2026 19:15:23 +0000
X-Mizu-Trace-ID: d26edee295264752
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [RFC PATCH 0/2] drm/i915/color: 3D LUT fixes
Date: Wed, 18 Nov 2026 11:15:11 -0800
Message-ID: <20261118191514.2931270-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Nov 2026 15:25:28 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for the 3D LUT support that came with the plane color
pipeline. I ran into both while bringing up the pipe-bound 3D LUT on
Lunar Lake for gamescope, using out-of-tree patches that expose it
through the CRTC color pipeline proposed in [1].

Patch 1 stops planes that do not own the 3D LUT from rewriting
LUT_3D_CTL. On Lunar Lake an enable bit set by hand is cleared by the
next plane update. Reading the code, the same write from any
non-primary plane on Xe3p_LPD disables the LUT the primary plane
enabled.

Patch 2 writes the table in the order the hardware reads it. The colorop
blob has red as the fastest axis and the hardware has blue. I measured
this on Lunar Lake only, with the LUT bound to the pipe, by writing
LUT_3D_INDEX and LUT_3D_DATA from userspace and decoding the pipe CRC of
solid color frames. I have no Nova Lake hardware, so the plane-bound
case is unchecked. If the plane binding indexes the table differently
this patch is wrong for it, and I would appreciate a pointer to what
Bspec says about the entry order.

[1] https://lore.kernel.org/all/20260716160556.227556-1-mwen@igalia.com/

Matthew Schwartz (2):
  drm/i915/color: only let the owning plane program the 3D LUT
  drm/i915/color: load the 3D LUT in the order the hardware indexes it

 drivers/gpu/drm/i915/display/intel_color.c    | 28 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.h    |  5 ++++
 .../drm/i915/display/intel_color_pipeline.c   | 12 ++------
 3 files changed, 31 insertions(+), 14 deletions(-)


base-commit: fb078d17b966f7a24720b6e3a5de06d43c2e184a
-- 
2.56.1

