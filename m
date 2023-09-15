Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5078EE6431
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7459610E5C6;
	Fri, 15 Sep 2023 07:56:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F3C0310E16A;
 Fri, 15 Sep 2023 07:56:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1281AADE4;
 Fri, 15 Sep 2023 07:56:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 15 Sep 2023 07:56:25 -0000
Message-ID: <169476458598.32042.14243612090653010036@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915074818.903353-1-jouni.hogander@intel.com>
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Frontbuffer_tracking_and_dirtyfb?=
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

Series: Frontbuffer tracking and dirtyfb
URL   : https://patchwork.freedesktop.org/series/123751/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4a9681392 drm/xe/pmu: Enable PMU interface
=== git am output follows ===
Applying: drm/xe: Add empty def for i915_gem_object_flush_if_display
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/fbc: Clear frontbuffer busy bits on flip
Applying: drm/i915/psr: Clear frontbuffer busy bits on flip
Applying: drm/i915: Add new frontbuffer tracking interface to queue flush
Applying: drm/i915: Handle dma fences in dirtyfb callback
Applying: drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base


