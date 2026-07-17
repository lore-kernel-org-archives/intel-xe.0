Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4A7C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 08:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F810E428;
	Fri, 17 Jul 2026 08:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1PLUpnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEDF10E428
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784276823; x=1815812823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=swfLCK/hJAfqrx1sqUP2cy0ueQn4VOBUFcFzs1DjBMY=;
 b=O1PLUpnjfLCcDIKS+ZSTB85OW6xuFgLE6W8QsyDVo8dMGfqKM0Z7Z5Bb
 t1VeZqMUKEmCe9WK4EfwwhIv9irJBkSL+8+HcStW10OMHH17r9HrusFMM
 xKHVANfVeZpk+nJbxjSEoE1wVEWNs21JmcjlMr5AS1fx/mgHn6mwlS0Mw
 Wx73zdyh3mdnj00FDIsTz7lQJcfd7AoxpNeS2GVeC461cvn/OInMM07Wu
 zDlBFJGCdvdNPLczHGy5khIFdsbV7nALBk3Wl9MVBsOxsDFFL7yfj+hWd
 i23svXLoP5nc5ezVWV58tGBpdT3G4imuZETxVT3XxJCwuWoXBbW2e8CiH g==;
X-CSE-ConnectionGUID: +QjcI4doRTepFMwiyV9j6w==
X-CSE-MsgGUID: +h8455dBQMGuGn3LXeQ62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84066988"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84066988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:27:03 -0700
X-CSE-ConnectionGUID: PfdEfWMXRHu9ruQZ2SfkKw==
X-CSE-MsgGUID: tkzeZlWGQ+SOCf8G9e3U3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="260549635"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:27:00 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v1] drm/xe/sysctrl: Detect oversized sysctrl mailbox responses
Date: Fri, 17 Jul 2026 01:26:58 -0700
Message-ID: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

sysctrl_receive_frames() currently returns success once the caller's
buffer is filled, even if the firmware has additional response frames
pending. This can silently truncate firmware responses larger than the
requested response buffer.

Add a check to detect this condition and return -EMSGSIZE.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index e13eebaac1d0..37ed05ac0236 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -244,6 +244,11 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 		out += frame_size;
 	}
 
+	if (!done) {
+		xe_err(xe, "sysctrl: Firmware response exceeds expected size\n");
+		return -EMSGSIZE;
+	}
+
 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
 
 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
-- 
2.43.0

