Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED3C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B544A10E4B1;
	Tue,  9 Jan 2024 18:08:39 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6232510E4B1;
 Tue,  9 Jan 2024 18:08:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_allmodconfig_build_e?=
 =?utf-8?q?rror_in_next-20240108?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 09 Jan 2024 18:08:38 -0000
Message-ID: <170482371840.216457.16419623092962971161@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
In-Reply-To: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
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

Series: allmodconfig build error in next-20240108
URL   : https://patchwork.freedesktop.org/series/128381/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6524dc91b drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/Makefile:17
error: drivers/gpu/drm/xe/Makefile: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: allmodconfig build error in next-20240108
Patch failed at 0001 allmodconfig build error in next-20240108
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


