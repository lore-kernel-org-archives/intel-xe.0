Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C122CC6B3C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 12:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966310E3D2;
	Thu, 15 Oct 2026 12:15:52 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519D010E492
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 15:25:31 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5db19e2ef99so223368e0c.1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791991530; x=1792596330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ByuDN4/B1x5JlHCJPQ+ueE1qolHJj9yRQEgaRjuCRjU=;
 b=KuoyUyDqusk96FaKOHHwGZzt4fPAuh6WpvCC2d7gbd7Cdr2jdhIaClzMhiVzsHtzW8
 ryJk1mjMqbKF7/Bjsw5RJabPWRw9rsZ+pNCgYkjSkO43OLg4sBv5F5DRzud6v+aS3VWV
 5Ep1hIZJDlhGBEWqaDVIykDqKUn1K6tsneGcrkuUmhmU/xym+39VnVf8uZov9BtghOXc
 elB0HwBeqfzIgII/H5Xjhj4HiX7RwzQu0ERiz8LdU8iYw7MwhejYWXICqUOG0Adv6Wpq
 bKy5bu08HxMna/0OfxKgmQlUEx7zcGjo5D+ZnUpw41zdThDKIshQka9IL7h4BLC8wCJX
 M18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791991530; x=1792596330;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ByuDN4/B1x5JlHCJPQ+ueE1qolHJj9yRQEgaRjuCRjU=;
 b=Ew2a83B+Hw0U+FeWDTllPYKOMWfKYpZ3IsyQLBTSYJA0nbGG+swGlgpOZ70VppeNYN
 /kBMLmfhCQrWJfzc2Kr3vOvR54zvsYTo3vTPPU8Bhb8zW2fvwguQBmexs2R7kI7yYVj7
 9xm/XuqTB3w3j4LNUyS9mXs8+pAPWQIll4B9dRBVyBOG0EI01mMBMH8901JGeh2N/NtE
 MBRznuM1Q0d7cMdhD4cqxNOF8zb/TJoFHNmUBXlshiTa0/XHtKhl1xxbi0rSF8VEXct1
 8HnzRCAhRG1o84D9ykaxdjZgYayjAqptU+93cI8xnVhJOZzopVrbrufed7cxNa7YlsuS
 sSYg==
X-Gm-Message-State: AFq9FYJTvt39jeCzXsnWoyAhzUGoBEC2zfJcy2FIDkgGWgz/w1MKfgnj
 mnmWhMzazbyATB9EKWC/qJGhUOS/LGqKwQr0Wc3T+aiHv8snCzjkr+fN
X-Gm-Gg: AYBFou12930+qm14sSC+v1Xyu6iVpjNblhT8Cw0XPFDao/ohJ49Nrs/edW3BbFWWGpo
 hVOYhjeFJYAQx1VPjXS7vmBgWPSvcn5VB9L37y+RL6RlKzGIaDUIl6s6QJW92zTjP+FeB4NThyG
 hg2e8NF+xdOIt6Yu4rjwry/h4K847wRNJo6iL3nu4pqqVPV/GeuptcgP+G+bT+jB5dPbrK8TxHR
 gPJRXtyp5A4VfvfHBGLe/at+fLA/Jww8FpZ9macXpgb5QiMC42GIamIjP2ye1xLF8MXhJPbHzmj
 eVsqv8tk1ZhP+D23cwslBKJCjIgKWLrDH3k07Tkq6yaT2hZlZIvV8UQCDadEuhz954TV/lfWLYe
 VQy0OtgdcFY213DL1Y/4uh3XD96r9tF64qMz3NDF/x88Vl6/IxWtWyCl1OjdZDn2Aj8/Ld/MZvo
 TIF/k3BbkHHTmuxl2o50W5kWNPWvMpVkIF8MHQo1a6HdAna54i/QPU8m+TNeLBDdseaZfAmd1t4
 lKZRsUT5hXUIcdhyFn0eMk/3NiikHeN2Ws5meaKRZhdPsydKPBMxdwub28tcXo7RLBG/XWrpEXE
 oxRvPDjQ+sXXn2qQ1DDQRDgNslXHCsPIH8DLXVocnAsdS7Mx
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id
 71dfb90a1353d-5e9484a38e0mr2792831e0c.2.1791991529768; 
 Wed, 14 Oct 2026 08:25:29 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.ts.fuhry.app
 (235.sub-75-230-129.myvzw.com. [75.230.129.235])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b97c39482sm54744986d6.45.2026.10.14.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 08:25:29 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 "Stephen J. Fuhry" <fuhrysteve@gmail.com>
Subject: [PATCH v2] drm/i915/display: guard intel_alpm_get_error() against
 non-ALPM sinks
Date: Wed, 14 Oct 2026 11:25:26 -0400
Message-ID: <20261014152526.2523534-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Oct 2026 12:15:40 +0000
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

intel_alpm_get_error() unconditionally reads DP_RECEIVER_ALPM_STATUS via
AUX from any DP connection that receives a short-pulse interrupt.
However, alpm_dpcd is only populated by intel_edp_init_dpcd(), so it is
zero for all external (non-eDP) DP and DP-MST connections. On such
connections the AUX read fails, producing a spurious

  [drm] *ERROR* Error reading ALPM status

and setting sink_alpm_error = true, even on hardware that never enabled
ALPM.

intel_alpm_disable() already returns early on !intel_dp->alpm_dpcd;
apply the same check in intel_alpm_get_error() so it skips the AUX
transaction when the sink does not support ALPM.

Seen on a ThinkPad T14 Gen 3 (Alder Lake-P) docked through a Lenovo
ThinkPad USB-C Dock Gen2 with two DP-MST monitors: the error fired once
on the dock's upstream DP port on every DPMS wake.

Fixes: 2063174c22da ("drm/i915/lobf: Check for sink error and disable LOBF")
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Stephen J. Fuhry <fuhrysteve@gmail.com>
---
v2:
- Rebased onto drm-tip. intel_alpm_get_error() now uses
  drm_dp_dpcd_read_byte(), so v1 no longer applied; the change itself
  is the same three lines.
- Carried Jouni's Reviewed-by from v1, since the logic is unchanged.
- Corrected the hardware in the commit message: the machine is a T14
  Gen 3 (Alder Lake-P), not a Gen 1.
- The error was observed with a ThinkPad USB-C Dock Gen2 and has not been
  retested since the move to a Thunderbolt 4 dock.

v1: https://lore.kernel.org/intel-gfx/20260611125408.676626-1-fuhrysteve@gmail.com/

 drivers/gpu/drm/i915/display/intel_alpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f54b29e..059287d 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -754,6 +754,9 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
 	int ret;
 	u8 val;
 
+	if (!intel_dp->alpm_dpcd)
+		return false;
+
 	ret = drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS, &val);
 	if (ret < 0) {
 		drm_err(display->drm, "Error reading ALPM status (%pe)\n", ERR_PTR(ret));
-- 
2.47.3

