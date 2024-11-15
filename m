Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D397D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 17:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF6A10E3CA;
	Fri, 15 Nov 2024 17:33:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAEC10E065;
 Fri, 15 Nov 2024 17:33:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/xe=5Fguc=5Fad?=
 =?utf-8?q?s=3A_Add_nonpriv_registers_to_write_list_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 17:33:37 -0000
Message-ID: <173169201711.338972.42375803412913858@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241101222350.108367-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: Add nonpriv registers to write list (rev2)
URL   : https://patchwork.freedesktop.org/series/140833/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c43ac257e8f2 drm-tip: 2024y-11m-15d-13h-20m-05s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_hw_engine.c:573
error: drivers/gpu/drm/xe/xe_hw_engine.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_reg_sr.c:234
error: drivers/gpu/drm/xe/xe_reg_sr.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/xe_guc_ads: Add nonpriv registers to write list
Patch failed at 0001 drm/xe/xe_guc_ads: Add nonpriv registers to write list
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


