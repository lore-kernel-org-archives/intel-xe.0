Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442BBC369D3
	for <intel-xe@archiver.kernel.org>; Sun, 27 Apr 2025 09:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2010E187;
	Sun, 27 Apr 2025 09:48:37 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B74510E187;
 Sun, 27 Apr 2025 09:48:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/gpusvm=3A_set_ha?=
 =?utf-8?q?s=5Fdma=5Fmapping_inside_mapping_loop?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Apr 2025 09:48:37 -0000
Message-ID: <174574731718.15585.12864119154849378739@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
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

Series: drm/gpusvm: set has_dma_mapping inside mapping loop
URL   : https://patchwork.freedesktop.org/series/148313/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4548c64c3d42 drm-tip: 2025y-04m-26d-18h-47m-20s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: set has_dma_mapping inside mapping loop


