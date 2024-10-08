Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE87CEF16C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A894B10E522;
	Tue,  8 Oct 2024 13:03:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544E410E520;
 Tue,  8 Oct 2024 13:03:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_treewide=3A_Remove_I?=
 =?utf-8?q?/O_port_accessors_for_HAS=5FIOPORT=3Dn_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 13:03:09 -0000
Message-ID: <172839258933.1203913.5000877720620997928@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008-b4-has_ioport-v8-0-793e68aeadda@linux.ibm.com>
In-Reply-To: <20241008-b4-has_ioport-v8-0-793e68aeadda@linux.ibm.com>
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

Series: treewide: Remove I/O port accessors for HAS_IOPORT=n (rev3)
URL   : https://patchwork.freedesktop.org/series/139641/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c2c031e80da1 drm-tip: 2024y-10m-08d-12h-26m-30s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/gma500/Kconfig:1
error: drivers/gpu/drm/gma500/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/qxl/Kconfig:2
error: drivers/gpu/drm/qxl/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/tiny/bochs.c:2
error: drivers/gpu/drm/tiny/bochs.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: hexagon: Don't select GENERIC_IOMAP without HAS_IOPORT support
Applying: Bluetooth: add HAS_IOPORT dependencies
Applying: drm: handle HAS_IOPORT dependencies
Patch failed at 0003 drm: handle HAS_IOPORT dependencies
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


