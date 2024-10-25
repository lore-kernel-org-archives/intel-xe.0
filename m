Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB9D116E7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 04:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0530610E9F0;
	Fri, 25 Oct 2024 04:22:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEDB10E07F;
 Fri, 25 Oct 2024 04:22:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_treewide=3A_Remove_I?=
 =?utf-8?q?/O_port_accessors_for_HAS=5FIOPORT=3Dn_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 04:22:33 -0000
Message-ID: <172983015369.1330678.10064819816831995468@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024-b4-has_ioport-v9-0-6a6668593f71@linux.ibm.com>
In-Reply-To: <20241024-b4-has_ioport-v9-0-6a6668593f71@linux.ibm.com>
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

Series: treewide: Remove I/O port accessors for HAS_IOPORT=n (rev4)
URL   : https://patchwork.freedesktop.org/series/139641/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 75eab7b9ee32 drm-tip: 2024y-10m-25d-01h-19m-09s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/gma500/Kconfig:1
error: drivers/gpu/drm/gma500/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/qxl/Kconfig:1
error: drivers/gpu/drm/qxl/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/tiny/bochs.c:1
error: drivers/gpu/drm/tiny/bochs.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: hexagon: Don't select GENERIC_IOMAP without HAS_IOPORT support
Applying: Bluetooth: add HAS_IOPORT dependencies
Applying: drm: handle HAS_IOPORT dependencies
Patch failed at 0003 drm: handle HAS_IOPORT dependencies
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


