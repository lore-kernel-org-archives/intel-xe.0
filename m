Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EEAEDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361DF10E43B;
	Tue, 10 Sep 2024 15:21:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B37210E43B;
 Tue, 10 Sep 2024 15:21:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/bios=3A_Ref?=
 =?utf-8?q?actor_ROM_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 15:21:27 -0000
Message-ID: <172598168763.981347.5028775333556525865@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/bios: Refactor ROM access
URL   : https://patchwork.freedesktop.org/series/138478/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f25ffe1514b2 drm-tip: 2024y-09m-10d-15h-14m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/bios: Add some size checks to SPI VBT read
Applying: drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
Applying: drm/i915/bios: Extract intel_spi_read16()
Applying: drm/i915/bios: Extract vbt_signature[]
Applying: drm/i915/bios: Extract soc/intel_rom.c


