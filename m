Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE75CD129B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BED113C46;
	Fri,  5 Apr 2024 14:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="tvsu+T2a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yi4IgBhW";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C51113941;
 Fri,  5 Apr 2024 14:27:56 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1712327263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXKjzO0E7tXKUJsBT95KLVEAqzlmIOZy5XrZZRf+f/A=;
 b=tvsu+T2a/lgcGdjinlQGDEe3p+QsCBKevdsGRpzK1WHLgUl3Zs7vNX5vFl4pf6ZZ9U3fxI
 LftJDyNkK7afWhK0G7/nPiZXKgpTAszdAYJ4TJzf+OJe7w1Rg3KtqRdLQtRZPTbLqAjYVv
 uBjLb1qnQAsHQQGm+z4GFv1Gl9nKprUXmbwatVm2BgRZe63ET0fid+TVOyDfek7Nq819hj
 MLF02UCEAxrlhN5G/fEdZilF5HVlctjOoVLNEj1jGqVmPwe7dvjrDHnstenn7kzmkuP9lN
 7zI0MMiwrifMaL1uh3VDQJX0OGLRZ0DEzJzVkRQwTVWGV9dbm8Y3e38mgMHZ/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1712327263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXKjzO0E7tXKUJsBT95KLVEAqzlmIOZy5XrZZRf+f/A=;
 b=Yi4IgBhWaSNaA3nVizPILZCB2PVk14e9Ho3abJACReZw95JcaiImE0UdMx6qiN3RvII7od
 fIGMjWgWJ6yaVnCA==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 05/10] drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with
 NOTRACE
Date: Fri,  5 Apr 2024 16:18:23 +0200
Message-ID: <20240405142737.920626-6-bigeasy@linutronix.de>
In-Reply-To: <20240405142737.920626-1-bigeasy@linutronix.de>
References: <20240405142737.920626-1-bigeasy@linutronix.de>
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

The order of the header files is important. If this header file is
included after tracepoint.h was included then the NOTRACE here becomes a
nop. Currently this happens for two .c files which use the tracepoitns
behind DRM_I915_LOW_LEVEL_TRACEPOINTS.

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpu/drm/i915/i915_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_=
trace.h
index c54653cf72c95..3c51620d011b1 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -326,7 +326,7 @@ DEFINE_EVENT(i915_request, i915_request_add,
 	     TP_ARGS(rq)
 );
=20
-#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS) && !defined(NOTRACE)
 DEFINE_EVENT(i915_request, i915_request_guc_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
--=20
2.43.0

