Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D9FC27C7A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293110E1C6;
	Thu, 17 Aug 2023 08:27:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A467610E1C6;
 Thu, 17 Aug 2023 08:27:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D678AADFD;
 Thu, 17 Aug 2023 08:27:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Thu, 17 Aug 2023 08:27:35 -0000
Message-ID: <169226085561.12431.4660951935488025045@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230817082437.3116208-1-jani.nikula@intel.com>
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_i915_irq_backports_+_display_cleanups_=28rev3=29?=
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

Series: drm/xe: i915 irq backports + display cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/122339/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c605cfb9a fixup! drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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


