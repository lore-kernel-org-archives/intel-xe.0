Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E18CCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 16:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22D610E29E;
	Sat, 25 Oct 2025 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DPStTKk3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162410E29E
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 16:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5506144E72;
 Sat, 25 Oct 2025 16:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4E2C4CEFB;
 Sat, 25 Oct 2025 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408830;
 bh=CaneOkXDJT6KOXWLrhAjOi9tQ11poenGyRk3xfDJWbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DPStTKk3rxzTKkIFB5unlq5fkYkoIuCnvij8K3o8KQ/HyT+5Qd+K82L75smoF7Djk
 2M1VXPDVrEXNtsxjkdzh3FVtyOl+zE4hqJQ+MZlt1tltU+WDOjwehS2LDD3RSDP0r+
 aSsRz7FQAeJDwKLizuUOWsPSJx64fZKYsmzzlPh/Tcyvm9yavijhxGI7dO5cp75mxI
 jsQzW/UHFGgvtQeJJsCeeLA9fxo/FGIWvWYkEe8TkapX5KR+IJORa+N6fguGg2IRn0
 77w0VFTUK7lK7aPzIVK4jJPdWNYsQVySM3cbesrZsV+N82lNVJ3XvLRrwb5tE1Is9r
 BS6Uc/AkVO94w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Raag Jadav <raag.jadav@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/xe/i2c: Enable bus mastering
Date: Sat, 25 Oct 2025 11:55:22 -0400
Message-ID: <20251025160905.3857885-91-sashal@kernel.org>
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

From: Raag Jadav <raag.jadav@intel.com>

[ Upstream commit fce99326c9cf5a0e57c4283a61c6b622ef5b0de8 ]

Enable bus mastering for I2C controller to support device initiated
in-band transactions.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Link: https://lore.kernel.org/r/20250908055320.2549722-1-raag.jadav@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

- What changed: In `xe_i2c_pm_resume()` the code now sets the PCI bus
  master enable bit for the Xe I2C controller when resuming from D3cold:
  - `drivers/gpu/drm/xe/xe_i2c.c:262` sets `PCI_COMMAND_MEMORY |
    PCI_COMMAND_MASTER` into the I2C controller’s pseudo PCI command
    register (`I2C_CONFIG_CMD`) instead of only `PCI_COMMAND_MEMORY`.
  - The target register is defined as the controller’s PCI Command
    aperture: `drivers/gpu/drm/xe/regs/xe_i2c_regs.h:17` (`#define
    I2C_CONFIG_CMD ... + PCI_COMMAND`), confirming this is the correct
    place to enable bus mastering.

- Why it matters: The commit message states the purpose clearly:
  enabling bus mastering is required “to support device initiated in-
  band transactions.” For DMA-capable controllers, PCI bus mastering
  must be enabled for the device to perform DMA. Without this bit set
  after D3cold, device-initiated I2C transactions that rely on DMA can
  fail or be unreliable. This is a functional bug for platforms using
  this path (e.g., Battlemage), not a feature add.

- Scope and containment:
  - Change is a single-line modification in one function, gated on
    `d3cold` and only executed when the controller is present
    (`xe_i2c_present()` guards the PM functions).
    - Presence check path: `drivers/gpu/drm/xe/xe_i2c.c:243` (suspend)
      and `drivers/gpu/drm/xe/xe_i2c.c:254` (resume) both early-return
      if the I2C endpoint isn’t valid.
  - The resume path is called from both probe and system resume:
    - Probe explicitly brings the controller up via
      `xe_i2c_pm_resume(xe, true);` so the bus master bit needs to be
      set there as well: `drivers/gpu/drm/xe/xe_i2c.c:318`.
    - System resume calls `xe_i2c_pm_resume(xe, xe->d3cold.allowed);`,
      so the bit is set only when returning from D3cold, which is when
      the bit would be lost: `drivers/gpu/drm/xe/xe_pm.c:204`.

- Risk and side effects:
  - Enabling `PCI_COMMAND_MASTER` is standard practice for DMA-capable
    devices and is required for correct operation of DMA paths. The
    change does not alter architecture or interfaces and is limited to
    the Xe I2C controller’s PM resume path after D3cold.
  - The write only happens if the controller is present and only on
    D3cold resume, minimizing exposure. There are no ABI or UAPI
    changes, and no wider subsystem impact.

- Stable backport criteria:
  - Fixes a real functional issue affecting users (device-initiated in-
    band I2C transactions fail without bus mastering).
  - Small, contained, and low risk (one line, single driver file, gated
    by presence and D3cold state).
  - No architectural changes or new features; this corrects an
    initialization oversight.
  - Touches DRM/xe I2C code only; no cross-subsystem churn.

Given the above, this is a clear, minimal bugfix that restores intended
functionality and is appropriate for stable backporting.

 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index bc7dc2099470c..983e8e08e4739 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -245,7 +245,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
 		return;
 
 	if (d3cold)
-		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
+		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
 	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
-- 
2.51.0

