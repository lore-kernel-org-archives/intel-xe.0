Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B24C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E910E379;
	Tue, 30 May 2023 10:37:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F9F210E379;
 Tue, 30 May 2023 10:37:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 86276AADD8;
 Tue, 30 May 2023 10:37:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 May 2023 10:37:47 -0000
Message-ID: <168544306751.18935.9013350435641316361@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Clean-up_Xe_FBC_additions?=
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

Series: Clean-up Xe FBC additions
URL   : https://patchwork.freedesktop.org/series/118560/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: d57bb4c83 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
=== git am output follows ===
Applying: fixup! drm/i915/display: Implement FBC support
Applying: drivers/xe: Add new type for compressed fb
Applying: drm/i915/fbc: Add common type for compressed fb to avoid ifdefs
Applying: drm/xe: Add i915_gem.h compatibility header
Applying: drivers/xe: Move Xe stolen memory handling away form fbc code
Applying: drm/i915: Move stolen memory handling into i915_gem_stolen
Applying: drm/i915/fbc: Stolen initialize can be checked in plane check for i915 as well
Applying: drm/i915/fbc: Add function to get number of fences for gt
Applying: Add new fence_id and fence count functions


