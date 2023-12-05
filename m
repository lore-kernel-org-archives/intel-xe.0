Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2D1C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 23:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D072910E622;
	Tue,  5 Dec 2023 23:07:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB110E622;
 Tue,  5 Dec 2023 23:07:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 80C3AAADDD;
 Tue,  5 Dec 2023 23:07:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Dec 2023 23:07:38 -0000
Message-ID: <170181765849.24284.17862974157011389770@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205174349.2169863-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205174349.2169863-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_fixup!_drm/xe=3A_Make_DRM=5FXE=5FDEVICE=5FQUERY=5FENGINES_fu?=
 =?utf-8?q?ture_proof?=
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

Series: fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
URL   : https://patchwork.freedesktop.org/series/127373/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6ac758520 drm/xe/kunit: Test WAs for MTL and LNL
=== git am output follows ===
error: patch failed: include/uapi/drm/xe_drm.h:129
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
Patch failed at 0001 fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


