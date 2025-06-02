Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5709C54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 07:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9015010E1C9;
	Mon,  2 Jun 2025 07:14:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724DA10E1C9;
 Mon,  2 Jun 2025 07:14:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/pm=3A_Wire_up?=
 =?utf-8?q?_suspend/resume_for_I2C_controller?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 07:14:51 -0000
Message-ID: <174884849146.39982.15052580134438427391@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602070818.701834-1-raag.jadav@intel.com>
In-Reply-To: <20250602070818.701834-1-raag.jadav@intel.com>
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

Series: drm/xe/pm: Wire up suspend/resume for I2C controller
URL   : https://patchwork.freedesktop.org/series/149725/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 574ad1700b18 drm-tip: 2025y-06m-02d-03h-16m-54s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/regs/xe_i2c_regs.h: does not exist in index
error: drivers/gpu/drm/xe/xe_i2c.c: does not exist in index
error: drivers/gpu/drm/xe/xe_i2c.h: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/pm: Wire up suspend/resume for I2C controller
Patch failed at 0001 drm/xe/pm: Wire up suspend/resume for I2C controller
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


