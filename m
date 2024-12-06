Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD2E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 09:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB25B10F08A;
	Fri,  6 Dec 2024 09:49:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C8B10F08A;
 Fri,  6 Dec 2024 09:49:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/connector=3A_add?=
 =?utf-8?q?_eld=5Fmutex_to_protect_connector-=3Eeld_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 09:49:56 -0000
Message-ID: <173347859668.3297687.15492189609109643312@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
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

Series: drm/connector: add eld_mutex to protect connector->eld (rev2)
URL   : https://patchwork.freedesktop.org/series/141955/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2e90353f058f drm-tip: 2024y-12m-06d-07h-49m-15s UTC integration manifest
=== git am output follows ===
Applying: drm/connector: add mutex to protect ELD from concurrent access
Applying: drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
Applying: drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
Applying: drm/amd/display: use eld_mutex to protect access to connector->eld
Applying: drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
Applying: drm/i915/audio: use eld_mutex to protect access to connector->eld
Applying: drm/msm/dp: use eld_mutex to protect access to connector->eld
Applying: drm/radeon: use eld_mutex to protect access to connector->eld
Applying: drm/sti: hdmi: use eld_mutex to protect access to connector->eld
Applying: drm/vc4: hdmi: use eld_mutex to protect access to connector->eld


