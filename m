Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC441CCD1BF
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 16:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFF210E2E4;
	Sat, 25 Oct 2025 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kKJxoybF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12DD10E2AD
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 16:15:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4DCB16059F;
 Sat, 25 Oct 2025 16:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D8BC4CEFB;
 Sat, 25 Oct 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408935;
 bh=GAaRdhjLbKcn9UBDw2uagmBAExBiN/VBCRLC1HffS5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kKJxoybFQY6v+nX/LgX8aVlemaaI3R0bTQsX2DYYG8ZGCZTfEIKGuCVnnx6shbmGp
 3/mOS7ByHmkjeG3i3H8lrf44lWN7Jx4PPVx8fOQNo8A1TRrBSCWjLflROfji7QO9LA
 oV1zn4k/4jjdCAoi2j9tOivPyMW4U3JJUhfK84BPJa2tKiLyWHAOPHc2tpAEec5tKv
 wyGr/T2OxnjOf1apTtIfRenvvlIbTSZLMSNfYPLiAbVa6V0nH/6IcNvdSVZE6kINGN
 3skYUm3tymnc5GxjVbAmvOBVATr8d3wGSO7/M+iH3mUqF6OzKJQrCW5hENftzeX9ja
 goGdz8HLdFt5w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/xe: Extend Wa_22021007897 to Xe3 platforms
Date: Sat, 25 Oct 2025 11:56:10 -0400
Message-ID: <20251025160905.3857885-139-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

[ Upstream commit 8d6f16f1f082881aa50ea7ae537b604dec647ed6 ]

WA 22021007897 should also be applied to Graphics Versions 30.00, 30.01
and 30.03. To make it simple, simply use the range [3000, 3003] that
should be ok as there isn't a 3002 and if it's added, the WA list would
need to be revisited anyway.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Link: https://lore.kernel.org/r/20250827-wa-22021007897-v1-1-96922eb52af4@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- The change extends an existing hardware workaround (WA 22021007897) to
  Xe3 platforms by adding a single, gated entry to the LRC workaround
  table. Specifically, it adds a new rule to set
  `COMMON_SLICE_CHICKEN4:SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE` for render
  engines on graphics versions 30.00–30.03:
  - New entry: `drivers/gpu/drm/xe/xe_wa.c:915` (name "22021007897")
  - Rule gating: `drivers/gpu/drm/xe/xe_wa.c:916` uses
    `GRAPHICS_VERSION_RANGE(3000, 3003)` with `ENGINE_CLASS(RENDER)`
  - Action: `drivers/gpu/drm/xe/xe_wa.c:917` sets
    `SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE` in `COMMON_SLICE_CHICKEN4`
- This mirrors the already-present use of the same WA on Xe2 (graphics
  versions 2001–2002), demonstrating consistency across generations:
  - Existing Xe2 entry: `drivers/gpu/drm/xe/xe_wa.c:895` (name
    "22021007897")
  - Rule gating: `drivers/gpu/drm/xe/xe_wa.c:896` with
    `GRAPHICS_VERSION_RANGE(2001, 2002)` and `ENGINE_CLASS(RENDER)`
  - Action: `drivers/gpu/drm/xe/xe_wa.c:897` sets the same bit
- The register and bit are well-defined in-tree, ensuring build safety
  and clarity of intent:
  - `drivers/gpu/drm/xe/regs/xe_gt_regs.h:158` defines
    `COMMON_SLICE_CHICKEN4`
  - `drivers/gpu/drm/xe/regs/xe_gt_regs.h:159` defines
    `SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE` (bit 12)
- The WA is applied at context-restore time via the LRC path, which is
  the correct, minimal-impact location for such state programming:
  - LRC table processing call site: `drivers/gpu/drm/xe/xe_gt.c:329`
    calls `xe_wa_process_lrc(hwe)`
- Scope and risk assessment:
  - Minimal and contained: a single new table entry; no API or
    architectural change; no behavior change outside Xe3 render engines.
  - Gated by hardware version and engine class, so it has no effect on
    other platforms.
  - Safe even with the version range approach: there is no 3002 today,
    and if a new graphics version appears, WA lists are regularly
    revisited as noted in the commit message.
- User impact:
  - Workarounds address known hardware issues; enabling this WA on Xe3
    likely prevents rendering corruption or instability on affected
    hardware. Without it, Xe3 users may encounter functional bugs.
- While the commit message does not include an explicit “Cc: stable”,
  the change aligns with stable policy:
  - It is a small, targeted fix to ensure correct operation on supported
    hardware.
  - It carries low regression risk and is confined to the DRM xe
    driver’s WA tables.

Given the above, this is a good, low-risk bugfix candidate for
backporting to stable trees that support the Xe driver and Xe3 hardware.

 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 535067e7fb0c9..f14bdaac674bb 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -879,6 +879,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
+	{ XE_RTP_NAME("22021007897"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.51.0

