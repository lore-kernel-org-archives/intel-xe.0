Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3EECD1288
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 23:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA84610E6C2;
	Thu, 28 Mar 2024 23:54:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4DB10E508;
 Thu, 28 Mar 2024 23:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_ASoC=3A_SOF=3A_Core?=
 =?utf-8?q?=3A_Add_remove=5Flate=28=29_to_sof=5Finit=5Fenvironment_failure_p?=
 =?utf-8?q?ath_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 23:54:22 -0000
Message-ID: <171167006296.1064396.6903429354346951199@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328135233.1204694-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240328135233.1204694-1-rodrigo.vivi@intel.com>
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

Series: ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path (rev2)
URL   : https://patchwork.freedesktop.org/series/131766/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d80d79a49622 drm-tip: 2024y-03m-28d-20h-29m-38s UTC integration manifest
=== git am output follows ===
error: patch failed: sound/soc/sof/core.c:339
error: sound/soc/sof/core.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
Patch failed at 0001 ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


