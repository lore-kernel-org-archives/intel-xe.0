Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F62BC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 18:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6B10F9AD;
	Fri,  3 May 2024 18:20:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCE7112928;
 Fri,  3 May 2024 18:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Make_I2C_terminology?=
 =?utf-8?q?_more_inclusive_for_I2C_Algobit_and_consumers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 18:20:29 -0000
Message-ID: <171476042931.1888398.7844069126058117349@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
In-Reply-To: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
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

Series: Make I2C terminology more inclusive for I2C Algobit and consumers (rev3)
URL   : https://patchwork.freedesktop.org/series/131888/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e9ea5061461b drm-tip: 2024y-05m-03d-17h-58m-38s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:280
error: drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
Patch failed at 0001 drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


