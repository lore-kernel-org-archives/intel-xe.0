Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6C5C88E64
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 00:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D510EA9A;
	Mon, 14 Sep 2026 00:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="newOX2Qt";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA510E667
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Sep 2026 07:29:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49e6e69d528so2090625e9.2
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Sep 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789198188; x=1789802988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
 b=newOX2Qt0GWvn8kt16iHhxAAJ22kU2F9R+Ylfpy5KIsh15j6pFtejwS4R3BRaco+T3
 ZpLZ46OOWruGH9tfxoMKl4DfZBaQrAP/UgHng8LOcfK57DGiMDlUFtwe9EI6OQvBeWvZ
 wgFUqcDFQP4dK1115YUgy+dDYbheEbJwxPPJem+bKNbCHdTIQoopIGXwCBU65K8grkKn
 WC7tuGQgZl5X8WnkY3YW53qRXc68ff49skKwqGkuAwxZXGPKiQDV0O1vYAyTjIwnon5/
 A7RySWmwAovKus2zuqMVOb513NhUYl/ZmNSog98o21sL4GKhJrev49ZdT6N3zOR0vrpz
 FZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789198188; x=1789802988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
 b=HxDyuypKWx7+VjHmKE8JswQoekFpMssL7iHd7QadXvHCtpYmgFdLGwsRUtaEF/S5Ub
 HpGn6brEhUv2xrrvJ4njJ8rdRaw+byfCDNsJbHxZa35dil6MdY63t7Raf12qEdKJg/BG
 sHbWSQrDU68zchrL3wkGMbRokN8ZJ/VQky/khHFyf2FGjIQ0UfoYjxjHjgJk48c5667g
 H/GGPWy+EACegTPrzPmyYp0upZ7N+U830gQzcuS8IT9oH6swZfWJFWxaBb6gw9KuCnmx
 xrrPWM8StH3yRr7OuDDFRBPBOFYuviGiMlDUKZz9eV9VMarLAzPzVBeURFL0YcS9FyhN
 uLSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzUHAbpWoOhcHRA4L2pJDz6hAugOp+Bt/3SnhGR/cqRrerQhS0saqcRyZWF4NT7/DHsXrhypCX75Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mAkO//lGKlcpCfBzyEk3taiWINQm3yTloy2oNi4117DVyYj3mS
 OBIp6j0w9mP6aRB+L/lQBt0bIGlmPQYTHveXnm/VXrDYO0Bd00KOe2/E
X-Gm-Gg: AYBFou18zM3xh1LKxGi2ls636URbG21AffKvtIsed+ZoZ4o6SZzTEkgvIeXZq1pqttV
 UdWHnNjn7Z932Mf3zgYPjfdEVif2iW8POoEvMyM9jgzRAYj2xt0mYz5WcysHLqno9gf2mndSc2d
 hepeQDxDvtECLTJmL8WH+92BVSiWmlcSOdy8QjxeCMHlq9+z2eem537+9y10yyG8nMejvBcW8Qo
 102D3gRpkb3zZqrP7n5pmaxW8wYMvCpniTS7MO+eGU041gGDC7qMVjHGglC3rhK49tT3ujT0Jnx
 SRHUlxTTU8EbirJvUXsAh6VbZ4pkK4w6+mkYFWG2WVFFODa48yHVgPKzsLg8iOdElRx5dW4Lnp2
 bfZ5UNIIS2YQUy2byQ0sLidDRK8+FLayuhPwai85VY3GKnMP6TpFSg9k6JXhHzyDQTmkBTtylow
 P3Rt6rFQDWja49iyKLJSK+XD0Yqm9KOr0CB2sZ4h7FdmsGN6niHlVXtPHatFdx4HcVOZFwE+ZNw
 820U6yucPV/Y+edWptEurqJBmbCGhVCawRjl47nwoFHa2teHV4nJlLSficl8+Z406he1Ti/Zssy
 RGUM7nMfqd+6S4ieSvJ3fAuNyYWZN6XUeQVlkPqaqCIJha1kuwe+tGdgRs0q0F3N/crXxYepsFr
 0ccjyBy0=
X-Received: by 2002:a05:600c:4714:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-49e61988b9emr84737275e9.10.1789198188447; 
 Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de.
 [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e6499d57bsm171373105e9.3.2026.09.12.00.29.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Fix DPLL reserve and release references in
 kernel-doc
Date: Sat, 12 Sep 2026 09:29:46 +0200
Message-Id: <20260912072946.50769-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Sep 2026 00:33:22 +0000
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

The intel_dpll_state documentation still uses the former reservation and
release helper names. Update the references to intel_dpll_reserve() and
intel_dpll_release().

Fixes: 2b3b9a8faf56 ("drm/i915/dpll: Move away from using shared dpll")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index d408ccf6f9025667177e411e5c2cef72cc30aae9..cec6208fa7535ba77c203999bc75b3c077a94a5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -302,7 +302,7 @@ struct intel_dpll_hw_state {
  * future state which would be applied by an atomic mode set (stored in
  * a struct &intel_atomic_state).
  *
- * See also intel_reserve_shared_dplls() and intel_release_shared_dplls().
+ * See also intel_dpll_reserve() and intel_dpll_release().
  */
 struct intel_dpll_state {
 	/**
-- 
2.39.5 (Apple Git-154)

