Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80091CD129E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DF410FA69;
	Fri,  5 Apr 2024 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="4X2vm3fe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2TT/JtE+";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48710EC8A;
 Fri,  5 Apr 2024 14:27:44 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1712327261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=14ULkwgKeFspTajsZK3eHl6oUrjMDGK7QLn4YtpJCsU=;
 b=4X2vm3feMgXBL5ckuWAE85N+5vfP5qJ9QJg70jlhC5k6J4yDNAbirDKyNx9SenDRQXisnR
 PmfHoOIP4ifa1lDvz2b00/Xlod9IfPf5RTNO6YOvTM2XUcg65ip0WIuFe77XsnmphFDCX7
 7ZxbhUEcUVCBv+P4pRq2ZKIVpd6Yx8D1MA4atqO/HtB42kYBLrvmJqXqKE3ade7j8r9MWl
 fsIMGlvxdIGF3KdxBV9aiaN3bCBUJYz/bS4nhfgFJKcdQOUa6rogynKVb0EUuiKg6sI6Mk
 srTOZikKqLgYiXvAwoMUTOI3q2/YIBk6dZcQOCiTluj9CrlNOez5N+eQV/39Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1712327261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=14ULkwgKeFspTajsZK3eHl6oUrjMDGK7QLn4YtpJCsU=;
 b=2TT/JtE+zkqtoPhk3S7NdRHktSK6amFW7OMeC6BdAIqv+7g2cLfhU+R1beXMXRydQJw0HF
 lkN4EbKUifxHreBw==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 00/10] drm/i915: PREEMPT_RT related fixups.
Date: Fri,  5 Apr 2024 16:18:18 +0200
Message-ID: <20240405142737.920626-1-bigeasy@linutronix.de>
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

Hi,

The following patches are from the PREEMPT_RT queue.  It is mostly about
disabling interrupts/preemption which leads to problems. Unfortunately
DRM_I915_LOW_LEVEL_TRACEPOINTS had to be disabled because it acquires locks
from within trace points. Making the lock a raw_spinlock_t led to higher
latencies during video playback
  https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/

and I'm not sure if I hit the worse case here.
I tested it on a SandyBridge with built-in i915 by using X, OpenGL and
playing videos without noticing any warnings. However, some code paths
were not entered.
I carry them for some time now and most issues were reported by other
people and they reported that things work for them since.

Sebastian

