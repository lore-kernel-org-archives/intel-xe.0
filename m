Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE43C30659
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3210E835;
	Wed, 26 Jun 2024 10:39:17 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C9A10E09B;
 Wed, 26 Jun 2024 10:39:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_MSIX_functionali?=
 =?utf-8?q?ty_to_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 10:39:16 -0000
Message-ID: <171939835659.160231.12739688347833715240@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626103345.2801735-1-dliberman@habana.ai>
In-Reply-To: <20240626103345.2801735-1-dliberman@habana.ai>
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

Series: Add MSIX functionality to XE
URL   : https://patchwork.freedesktop.org/series/135422/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4d42f54537 drm-tip: 2024y-06m-26d-09h-12m-00s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/irq: refactor irq flows to support also msix
Applying: drm/xe/irq: add msix allocator
Applying: drm/xe/irq: add hw engine irq handler
Applying: drm/xe/exec: adding msix infra to exec queue
Applying: drm/xe: move the kernel lrc from hwe to execlist port
Applying: drm/xe: move memirq out of vf
Applying: drm/xe: msix support preparations - enable memirq
Applying: drm/xe: msix support for hw engines


