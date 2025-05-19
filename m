Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A2C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 07:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55F10E3DB;
	Mon, 19 May 2025 07:57:42 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4F10E39E;
 Mon, 19 May 2025 07:57:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/psr=3A_Unde?=
 =?utf-8?q?rrun_on_idle_PSR_wa_only_when_pkgc_latency_=3E_delayed_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 07:57:41 -0000
Message-ID: <174764146172.92858.7881884324147865156@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250519075223.443266-1-jouni.hogander@intel.com>
In-Reply-To: <20250519075223.443266-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank
URL   : https://patchwork.freedesktop.org/series/149170/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ac591277cad3 drm-tip: 2025y-05m-19d-07h-42m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank


