Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE02C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C842010E27F;
	Wed, 19 Jun 2024 21:51:09 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456610E27F;
 Wed, 19 Jun 2024 21:51:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Adapt_the_driver_to_?=
 =?utf-8?q?boot_on_the_VF_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 21:51:08 -0000
Message-ID: <171883386847.124989.16180645048494568824@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

Series: Adapt the driver to boot on the VF device
URL   : https://patchwork.freedesktop.org/series/135080/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 66d8ec4c6e7d drm-tip: 2024y-06m-19d-17h-22m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/vf: Disable features that do not apply to VFs
Applying: drm/xe/vf: Don't run any save-restore RTP actions if VF
Applying: drm/xe/vf: Don't apply tile workarounds if VF
Applying: drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
Applying: drm/xe/vf: Don't initialize OA if VF
Applying: drm/xe/vf: Don't support gtidle if VF
Applying: drm/xe/vf: Don't use register based TLB invalidation if VF
Applying: drm/xe/vf: Skip engine ring enabling if VF
Applying: drm/xe/vf: Custom HuC initialization if VF


