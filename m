Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B41C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 16:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3810E4F8;
	Tue, 29 Apr 2025 16:13:43 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8B10E207;
 Tue, 29 Apr 2025 16:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introducing_firmware?=
 =?utf-8?q?_late_binding_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 16:13:43 -0000
Message-ID: <174594322310.25057.8214256601570226919@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Series: Introducing firmware late binding (rev2)
URL   : https://patchwork.freedesktop.org/series/148394/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7b083a8df148 drm-tip: 2025y-04m-29d-15h-29m-58s UTC integration manifest
=== git am output follows ===
Applying: mei: bus: add mei_cldev_mtu interface
Applying: mei: late_bind: add late binding component driver
Applying: drm/xe/late_bind_fw: Introducing late_bind_fw
Applying: drm/xe/xe_late_bind_fw: Initialize late binding firmware
Applying: drm/xe/xe_late_bind_fw: Load late binding firmware
Applying: drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
Applying: drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
Applying: drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
Applying: {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl


