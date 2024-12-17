Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F9E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9816510E2FE;
	Tue, 17 Dec 2024 23:04:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8E10E2FE;
 Tue, 17 Dec 2024 23:04:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Check_if_is_vblank_t?=
 =?utf-8?q?oo_short?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 23:04:15 -0000
Message-ID: <173447665581.4012497.9735512153463376453@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Check if is vblank too short
URL   : https://patchwork.freedesktop.org/series/142746/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 69607bbcaccc drm-tip: 2024y-12m-17d-21h-13m-30s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/scaler: Add and compute scaling factors
Applying: drm/i915/scaler: Add member to track scaler user
Applying: drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
Applying: drm/i915/scaler: Compute scling factors for pipe scaler
Applying: drm/i915/scaler: Check if vblank is sufficient for scaler
Applying: drm/i915/dsc: Check if dsc prefill sufficient for vblank


