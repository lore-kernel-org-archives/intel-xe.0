Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE0BE6B240
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 10:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549D10E99F;
	Fri,  1 Nov 2024 10:56:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396510E99F;
 Fri,  1 Nov 2024 10:56:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/dp=3A_Rework_LTT?=
 =?utf-8?q?PR_transparent_mode_handling_and_add_support_to_msm_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abel Vesa" <abel.vesa@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 10:56:29 -0000
Message-ID: <173045858973.1387499.11948234829328131077@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
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

Series: drm/dp: Rework LTTPR transparent mode handling and add support to msm driver
URL   : https://patchwork.freedesktop.org/series/140802/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 73837e0500d4 drm-tip: 2024y-11m-01d-05h-17m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add helper to set LTTPRs in transparent mode
Applying: drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
Applying: drm/i915/dp: Use the generic helper to control LTTPR transparent mode
Applying: drm/msm/dp: Add support for LTTPR handling


