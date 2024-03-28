Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E693C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 09:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34161123A1;
	Thu, 28 Mar 2024 09:27:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8EF11239E;
 Thu, 28 Mar 2024 09:27:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/ttm=2C_drm/xe=3A?=
 =?utf-8?q?_Shrinker_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 09:27:06 -0000
Message-ID: <171161802624.1061727.9476681039383981752@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328084728.262874-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240328084728.262874-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm, drm/xe: Shrinker support (rev2)
URL   : https://patchwork.freedesktop.org/series/131695/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8d398ffc40ac drm-tip: 2024y-03m-28d-08h-07m-15s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:1593
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/ttm: Allow TTM LRU list nodes of different types
Applying: drm/ttm: Use LRU hitches
Applying: drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
Patch failed at 0003 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


