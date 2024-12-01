Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA07D7361B
	for <intel-xe@archiver.kernel.org>; Sun,  1 Dec 2024 00:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C610E188;
	Sun,  1 Dec 2024 00:01:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04E10E188;
 Sun,  1 Dec 2024 00:01:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/connector=3A_add?=
 =?utf-8?q?_eld=5Fmutex_to_protect_connector-=3Eeld?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 01 Dec 2024 00:01:33 -0000
Message-ID: <173301129338.1055928.666105571488829785@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
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

Series: drm/connector: add eld_mutex to protect connector->eld
URL   : https://patchwork.freedesktop.org/series/141955/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 108f610005f8 drm-tip: 2024y-11m-29d-13h-08m-56s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/msm/dp/dp_audio.c:414
error: drivers/gpu/drm/msm/dp/dp_audio.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/connector: add mutex to protect ELD from concurrent access
Applying: drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
Applying: drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
Applying: drm/amd/display: use eld_mutex to protect access to connector->eld
Applying: drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
Applying: drm/i915/audio: use eld_mutex to protect access to connector->eld
Applying: drm/msm/dp: use eld_mutex to protect access to connector->eld
Patch failed at 0007 drm/msm/dp: use eld_mutex to protect access to connector->eld
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


