Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A62C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 10:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFDC10E0B4;
	Fri, 19 Jan 2024 10:05:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FA310E0B4;
 Fri, 19 Jan 2024 10:05:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/exec=2C_drm/gpuv?=
 =?utf-8?q?m=3A_Prefer_u32_over_uint32=5Ft?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 19 Jan 2024 10:05:05 -0000
Message-ID: <170565870569.576590.13261087844344955187@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/exec, drm/gpuvm: Prefer u32 over uint32_t
URL   : https://patchwork.freedesktop.org/series/128973/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ad8fc2d4a drm-tip: 2024y-01m-19d-08h-36m-49s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/drm_exec.c:72
error: drivers/gpu/drm/drm_exec.c: patch does not apply
error: patch failed: include/drm/drm_exec.h:135
error: include/drm/drm_exec.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/exec, drm/gpuvm: Prefer u32 over uint32_t
Patch failed at 0001 drm/exec, drm/gpuvm: Prefer u32 over uint32_t
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


