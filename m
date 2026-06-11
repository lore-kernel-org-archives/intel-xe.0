Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B07CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 13:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8E210EA1C;
	Fri, 12 Jun 2026 13:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TQvUZiLt";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D4E10EF0C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 12:54:12 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-91575ba2b22so66457585a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781182451; x=1781787251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pApUitxnpFLRw4B63hSdHQtKPDI/sltH6G53COwClfE=;
 b=TQvUZiLt93n3vxBfF/J+7PdBQoPZWevztBgcDIgUsm1Hu0gc7l8jUsOTAAKNQ89O7c
 jtGBdwnaz7kGnKYRJ+Vkpszwh6PqqneWtmF8QMIiwBtjT3l8zIZN8cvZwsNZDLigLrYj
 XFs21Drp1BoIkctyPn0JyldGSo9hadUcF3AVIpj3hibH04/jB6Q05yGNUCeMgAckUvQe
 RoEqz4vWH9PatWETIWitqRagWhTxSjUWwTp5udrzKjUjMMVPSF+HXCkO8J36L9N0tnWr
 isU+rPAu9YDQPDD7hJ9m1miwd5f6LC99UZxEyqJop4B5tS1XuVmzrt3SrsrJYc368P8q
 j+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781182451; x=1781787251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pApUitxnpFLRw4B63hSdHQtKPDI/sltH6G53COwClfE=;
 b=fY22WhKzSIrtohJnd7JmrRqmCWySEq3M8JCeO6qvZ+7VecsscGYO7fVRaLsIvjNpLv
 RYsDGf+COgEkAit6zijFRsQxzRr3kw/XQmnP2+W6KWRzvnohv9qr5oxrbuCcOULvU4m8
 epuBO4EC1TiTaowDrHFU/F/QiSqle0a0k/RrLGjOm5UN2OItiUIIv1IMHNtycW6jFe9n
 ReDaehatm02KbUs6BPip5SZ+3ruISn9uvnvxLWn6Lser1re0O/dMeT7qMboPSznrJii5
 uuI1xfIZoNymTIQVu+uF7Wjb6jmG/Rftn802hTSt6NPS6Tl0vYabmWTrTdYF+hPvyBr2
 5fRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YYemPCxKiStrAR5nRp0s5wsmQXBNXOAZBPYlHdFAHPP57CVXe6vVNkI0L7CJfn0hsviQBRS2kGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb5NB1v9ksydLMGRNysSwJEq2IJ2Kpw0lE+YZcTj0HmSqp6GkT
 +i/xs1zTGcDyL6IwKc2x7WKfumUxPNnaiVkJyGuHQuvFJRf/Z2aBGoKP
X-Gm-Gg: Acq92OEvN5lMW0r8Ag8WArqTVo+DlFauh9U47pNICuHnfzI8ZyhEzITWFzgMVcCFG3b
 mkWyfAkO6IXOVhrG0kbfRu5hQkMHdISI4DaNcAL2YIBWa/IHRq3ge6NrRSs3zTcSS9rjt5OwxtU
 ngHOWaOD+z2Js05DSrCzVk4Mz8jnWP2soBIetPACmbet0KMmdZc2ybBqZkbWUiBGewCDkqaBP+E
 HXF38MNhZ1SiptFr7/99FicgfAsv8lYlnq+v/vXK7ksE5HPNKs8MGch/3fBxXtoheW9+w4qjaUS
 m0W18u0LNeyFiVRSEr2LtO6QVJsbVuh4yiVy+Th+X9R8wx9X5024Xzxy/TLz/mqSZUvJdtAFa6E
 A1wF4kXjuKdZZvXE6xjmAxOU8xAYl2bXMF7BzKoNjYIzYXLqm5reTjECdSbLXQgCrdGbmzE13Sh
 kYpu/5WN/dF4be/dwfO8SPTQ+x4G5qdHaCul0R6ntd+lULca9BHCZ1QfTV174x7ki94/1NhR78u
 GkRGHE6e/b9pwBkYZAHUaum0tFHxtPol0qhNcdwVxP1qivP0Q9kB0LFI4TvtWa5n8dfA74vkC5t
 Lg==
X-Received: by 2002:a05:620a:6486:b0:914:ea37:6f14 with SMTP id
 af79cd13be357-9160ab058bdmr226309185a.1.1781182451197; 
 Thu, 11 Jun 2026 05:54:11 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.fuhry.app
 (6.sub-75-230-138.myvzw.com. [75.230.138.6])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160accaf7asm176311485a.19.2026.06.11.05.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:54:10 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Stephen J . Fuhry" <fuhrysteve@gmail.com>
Subject: [PATCH] drm/i915/display: guard intel_alpm_get_error() against
 non-ALPM sinks
Date: Thu, 11 Jun 2026 08:54:08 -0400
Message-ID: <20260611125408.676626-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jun 2026 13:05:53 +0000
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
AUX from any DP connection that receives a short-pulse interrupt.  However,
alpm_dpcd is only populated by intel_edp_init_dpcd(), so it is zero for
all external (non-eDP) DP and DP-MST connections.  On such connections the
AUX read fails, producing a spurious

  [drm] *ERROR* Error reading ALPM status

and setting sink_alpm_error = true, which is then visible in the ALPM
debug output even on hardware that never enabled ALPM.

intel_alpm_disable() already has the same guard (DISPLAY_VER check plus
!intel_dp->alpm_dpcd); extend the same logic to intel_alpm_get_error() so
it returns early without attempting the AUX transaction when ALPM is not
supported by the sink.

Reproducer: ThinkPad T14 Gen1 (Alder Lake-P / i915 DISPLAY_VER 12) docked
via Lenovo ThinkPad USB-C Dock Gen2 with external DP-MST monitors.  On
every DPMS wake the error fires once on the dock's upstream DP port.

Fixes: 2063174c22da ("drm/i915/lobf: Check for sink error and disable LOBF")
Signed-off-by: Stephen J. Fuhry <fuhrysteve@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index a7350ce8e716..4bb0c00741c4 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -611,6 +611,9 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
 	u8 val;
 	int r;

+	if (!intel_dp->alpm_dpcd)
+		return false;
+
 	r = drm_dp_dpcd_readb(aux, DP_RECEIVER_ALPM_STATUS, &val);
 	if (r != 1) {
 		drm_err(display->drm, "Error reading ALPM status\n");
--
2.39.5
