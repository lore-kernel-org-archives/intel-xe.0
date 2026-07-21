Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB6C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 18:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278E710E3AC;
	Tue, 21 Jul 2026 18:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="veLuYuu9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7B10E3AC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:11:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 93969600D8;
 Tue, 21 Jul 2026 18:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BED1F000E9;
 Tue, 21 Jul 2026 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1784657502;
 bh=yxXbOYyefm4tMQGpip/RBQtGHxsqErYuQpaM7QICW7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=veLuYuu9dEt8vJv67AEV1afrB4/DdaMEdq3TsiVPs0qerUeRcIBef9tJIs8vLAAM8
 N1fRtQiEbg1om5zV0GpV5copR/EnVgHbG/rIBE9dyJ0b1aNdNoisehBrwbhCZKXClR
 DhlnzK7obEeBfIV2npw64T1vXjdJ1ocndc20W2Cg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.18 0787/1611] drm/xe: Fix wa_oob codegen recipe for external
 module builds
Date: Tue, 21 Jul 2026 17:15:03 +0200
Message-ID: <20260721152533.090304322@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152514.750365251@linuxfoundation.org>
References: <20260721152514.750365251@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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

6.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

[ Upstream commit 92dc59ab2a09097cdf249e0288ff9b69261761c6 ]

When building with 'make M=drivers/gpu/drm/xe modules', kbuild invokes
scripts/Makefile.build with obj=., causing $(obj) to expand to '.'.
Make normalizes './xe_gen_wa_oob' to 'xe_gen_wa_oob' when constructing
the $^ automatic variable (target name normalization), so the recipe
command becomes just 'xe_gen_wa_oob ...' without any path prefix, and
the shell cannot find the tool.

Fix by replacing $^ with explicit $(obj)/xe_gen_wa_oob and
$(src)/<rules-file> references in both wa_oob recipe commands.
In recipe strings, make does not apply target name normalization, so
$(obj)/xe_gen_wa_oob correctly expands to './xe_gen_wa_oob' and the
shell can execute it. This matches the pattern already used by other
DRM drivers (e.g. radeon's mkregtable).

Fixes: f037e0b78e6d ("drm/xe: add xe_device_wa infrastructure")
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patch.msgid.link/20260604074501.172129-1-thomas.hellstrom@linux.intel.com
(cherry picked from commit 3a11a63cc16660d514ff584e7551589655337e87)
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d9c6cf0f189efb..ee52b751623f0c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -16,14 +16,14 @@ subdir-ccflags-y += -I$(obj) -I$(src)
 hostprogs := xe_gen_wa_oob
 generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
-      cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
+      cmd_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_wa_oob.rules $(generated_oob)
 $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
 quiet_cmd_device_wa_oob = GEN	$(notdir $(generated_device_oob))
-      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
+      cmd_device_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_device_wa_oob.rules $(generated_device_oob)
 $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_device_wa_oob.rules
 	$(call cmd,device_wa_oob)
-- 
2.53.0



