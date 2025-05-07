Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F21C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 17:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795B10E869;
	Wed,  7 May 2025 17:04:58 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B712F10E869;
 Wed,  7 May 2025 17:04:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/=7Bi915=2C_xe=7D?=
 =?utf-8?q?=3A_convert_i915-=3Edisplay_and_xe-=3Edisplay_into_pointers_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 17:04:57 -0000
Message-ID: <174663749774.56619.6033703443405297439@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746610601.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746610601.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}: convert i915->display and xe->display into pointers (rev2)
URL   : https://patchwork.freedesktop.org/series/148684/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c3be982edfd7 drm-tip: 2025y-05m-07d-16h-52m-15s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/rpm: use to_xe_device() instead of container_of
Applying: drm/xe/display: do not reference xe->display inline
Applying: drm/i915: do not reference i915->display inline
Applying: drm/{i915, xe}: convert i915 and xe display members into pointers


