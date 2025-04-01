Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC6C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683F10E5F5;
	Tue,  1 Apr 2025 15:42:01 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90310E5F5;
 Tue,  1 Apr 2025 15:42:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_VRAM_Self_Refresh_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 15:42:00 -0000
Message-ID: <174352212088.23501.15161698376585631147@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401153225.96379-1-anshuman.gupta@intel.com>
In-Reply-To: <20250401153225.96379-1-anshuman.gupta@intel.com>
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

Series: VRAM Self Refresh (rev2)
URL   : https://patchwork.freedesktop.org/series/145342/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 075a54ae8869 drm-tip: 2025y-04m-01d-14h-58m-16s UTC integration manifest
=== git am output follows ===
Applying: PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Applying: PCI/ACPI: Add PERST# Assertion Delay _DSM method
Applying: PCI/ACPI: Add aux power grant notifier
Applying: drm/xe/vrsr: Introduce flag has_vrsr
Applying: drm/xe/vrsr: Detect VRSR Capability
Applying: drm/xe/vrsr: Initialize VRSR feature
Applying: drm/xe/vrsr: Enable VRSR on default VGA boot device
Applying: drm/xe: Add PCIe ACPI Aux Power notifier
Applying: drm/xe/vrsr: Refactor d3cold.allowed to a enum
Applying: drm/xe/pm: D3Cold target state
Applying: drm/xe/vrsr: Enable VRSR
Applying: drm/xe/vrsr: Introduce a debugfs node named vrsr_capable


