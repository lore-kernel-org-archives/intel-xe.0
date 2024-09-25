Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EC6CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 18:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064E10E860;
	Wed, 25 Sep 2024 18:36:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC8610E852;
 Wed, 25 Sep 2024 18:36:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/hdmi=3A_Con?=
 =?utf-8?q?vert_comma_to_semicolon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shen Lichuan" <shenlichuan@vivo.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 18:36:07 -0000
Message-ID: <172728936717.1102457.1867753250724232657@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918032804.9269-1-shenlichuan@vivo.com>
In-Reply-To: <20240918032804.9269-1-shenlichuan@vivo.com>
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

Series: drm/i915/hdmi: Convert comma to semicolon
URL   : https://patchwork.freedesktop.org/series/138991/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d5334f14ce6c drm-tip: 2024y-09m-25d-14h-45m-08s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_hdmi.c:1310
error: drivers/gpu/drm/i915/display/intel_hdmi.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/hdmi: Convert comma to semicolon
Patch failed at 0001 drm/i915/hdmi: Convert comma to semicolon
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


