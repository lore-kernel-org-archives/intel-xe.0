Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC271C3065C
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 13:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D84010EC51;
	Fri, 28 Jun 2024 13:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="qhMxQlk+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jhZjdyq2";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF29310EC48;
 Fri, 28 Jun 2024 13:06:09 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1719579968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGsGwym1/3E6Eo02B1P43v8CIhCKh8E4WzxEDKWbJAQ=;
 b=qhMxQlk+bxQ1lfF9UlJnkt1Ohk4hRU8tenGI+8HNKXYVz0pWu9iOCE/PXUatP1+7CcyWts
 S7YgkMVZrxTdZD/lBcdaNf6fEbSM9eViwzPIWyM7DX7HO6UDWJs9yyIc0LI5LslF4kyGeS
 q9gZTTmSydTiI5I2VHKpexPb+m8969Sq05btPQuVBXan6x/pzFX3+MuanNrXkkf/mJzJxZ
 BM7WTbCCx3OARus8/lXx3YOFTHk/CqRYazCBLvUXRRMrzdI/CqS9cLnIrlzywjI0Tut8/A
 IEg878s3aNg4WsWbNrjAmiPGLWNRwWVEhLfEgigaHSj+A2S62KRJMNAcQq9p0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1719579968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGsGwym1/3E6Eo02B1P43v8CIhCKh8E4WzxEDKWbJAQ=;
 b=jhZjdyq2sXqoYAPfJLYkPcgbvVaN5j4SzyV2HU8+BXPwRXvW3hYq0ExtfDcqvZAfBTIzCu
 BXEqngK1Mg1ikjDA==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 8/8] Revert "drm/i915: Depend on !PREEMPT_RT."
Date: Fri, 28 Jun 2024 14:58:07 +0200
Message-ID: <20240628130601.1772849-9-bigeasy@linutronix.de>
In-Reply-To: <20240628130601.1772849-1-bigeasy@linutronix.de>
References: <20240628130601.1772849-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Once the known issues are addressed, it should be safe to enable the
driver.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5932024f8f954..a02162d6b710e 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,7 +3,6 @@ config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on X86 && PCI
-	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
--=20
2.45.2

