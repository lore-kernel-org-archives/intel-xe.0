Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E4FC47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 08:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986010F68E;
	Mon, 29 Jan 2024 08:47:20 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5E10F626;
 Mon, 29 Jan 2024 08:47:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_ccs_compresse?=
 =?utf-8?q?d_framebuffers_on_Xe2_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Mon, 29 Jan 2024 08:47:19 -0000
Message-ID: <170651803907.789298.17987569050262504873@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126210807.320671-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240126210807.320671-1-juhapekka.heikkila@gmail.com>
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

Series: Enable ccs compressed framebuffers on Xe2 (rev4)
URL   : https://patchwork.freedesktop.org/series/128946/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a288279d3 drm-tip: 2024y-01m-29d-08h-00m-08s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pat: annotate pat index table with compression information
Applying: drm/xe: add bind time pat index to xe_bo structure
Applying: drm/xe: store bind time pat index to xe_bo
Applying: drm/xe/xe2: Limit ccs framebuffers to tile4 only
Applying: drm/i915/display: On Xe2 always enable decompression with tile4


