Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB9FC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 14:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20210E2A7;
	Fri,  8 Dec 2023 14:15:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57AA010E28C;
 Fri,  8 Dec 2023 14:15:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 53987A0169;
 Fri,  8 Dec 2023 14:15:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Handle_remaining_ifd?=
 =?utf-8?q?efs_in_hack_patch_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 08 Dec 2023 14:15:44 -0000
Message-ID: <170204494433.7326.13222671588914827854@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
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

Series: Handle remaining ifdefs in hack patch (rev3)
URL   : https://patchwork.freedesktop.org/series/127488/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4571c8c1b drm/xe: Add frequency throttle reasons sysfs attributes
=== git am output follows ===
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: Use i915_gem_object_get_dma_address to get dma address
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile


