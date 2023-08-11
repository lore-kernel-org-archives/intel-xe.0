Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC44C41513
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 12:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B710E0EF;
	Fri, 11 Aug 2023 12:58:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58ED410E69D;
 Fri, 11 Aug 2023 12:58:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50BDDA73C7;
 Fri, 11 Aug 2023 12:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Fri, 11 Aug 2023 12:58:05 -0000
Message-ID: <169175868530.3116.14966431484624229906@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230811093559.2304457-1-jani.nikula@intel.com>
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_i915_irq_backports_+_display_cleanups_=28rev2=29?=
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

Series: drm/xe: i915 irq backports + display cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/122339/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc4e9b6f0 fixup! drm/i915/display: Remaining changes to make xe compile
=== git am output follows ===
Applying: drm/i915/irq: add dedicated intel_display_irq_init()
Applying: drm/i915/irq: add dg1_de_irq_postinstall()
Applying: drm/i915/irq: add ilk_de_irq_postinstall()
Applying: drm/i915/irq: move all PCH irq postinstall calls to display code
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support


