Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F5CCCD1B3
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 14:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FA510E26C;
	Wed, 18 Sep 2024 14:19:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28A610E5AE;
 Wed, 18 Sep 2024 14:19:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_wakeref_?=
 =?utf-8?q?fixes_and_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 14:19:45 -0000
Message-ID: <172666918598.1026556.13640826110724969450@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726658138.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726658138.git.jani.nikula@intel.com>
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

Series: drm/i915: wakeref fixes and improvements
URL   : https://patchwork.freedesktop.org/series/138811/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3abb1f2faac1 drm-tip: 2024y-09m-18d-14h-10m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/gem: fix bitwise and logical AND mixup
Applying: drm/i915: use INTEL_WAKEREF_DEF instead of magic -1 for intel_wakeref_t
Applying: drm/i915/gt: add a macro for mock gt wakeref special value and use it
Applying: drm/i915/audio: be explicit about intel_wakeref_t conversions
Applying: drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *


