Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B298FE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 13:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848510E22C;
	Thu, 12 Dec 2024 13:18:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018D910E22C;
 Thu, 12 Dec 2024 13:18:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/dp=3A_Rework_LTT?=
 =?utf-8?q?PR_transparent_mode_handling_and_add_support_to_msm_driver_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abel Vesa" <abel.vesa@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 13:18:28 -0000
Message-ID: <173400950800.1589450.15469749220757822857@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
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

Series: drm/dp: Rework LTTPR transparent mode handling and add support to msm driver (rev2)
URL   : https://patchwork.freedesktop.org/series/140802/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7b441ab54824 drm-tip: 2024y-12m-12d-10h-23m-45s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add helper to set LTTPRs in transparent mode
Applying: drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
Applying: drm/i915/dp: Use the generic helper to control LTTPR transparent mode
Applying: drm/msm/dp: Add support for LTTPR handling


