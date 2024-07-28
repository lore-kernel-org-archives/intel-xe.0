Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0360DC3DA64
	for <intel-xe@archiver.kernel.org>; Sun, 28 Jul 2024 13:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E1510E1C5;
	Sun, 28 Jul 2024 13:21:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7BA10E1C3;
 Sun, 28 Jul 2024 13:21:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_spi=3A_add_driver_fo?=
 =?utf-8?q?r_Intel_discrete_graphics_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Jul 2024 13:21:45 -0000
Message-ID: <172217290523.404945.2762002481890610994@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240728130638.1930463-1-alexander.usyskin@intel.com>
In-Reply-To: <20240728130638.1930463-1-alexander.usyskin@intel.com>
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

Series: spi: add driver for Intel discrete graphics (rev3)
URL   : https://patchwork.freedesktop.org/series/136430/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e948842a6cba drm-tip: 2024y-07m-27d-01h-51m-11s UTC integration manifest
=== git am output follows ===
Applying: spi: add driver for intel graphics on-die spi device
Applying: spi: intel-dg: implement region enumeration
Applying: spi: intel-dg: implement spi access functions
Applying: spi: intel-dg: spi register with mtd
Applying: spi: intel-dg: implement mtd access handlers
Applying: spi: intel-dg: align 64bit read and write
Applying: spi: intel-dg: wake card on operations
Applying: drm/i915/spi: add spi device for discrete graphics
Applying: drm/i915/spi: add intel_spi_region map
Applying: drm/i915/spi: add support for access mode
Applying: drm/xe/spi: add on-die spi device
Applying: drm/xe/spi: add support for access mode


