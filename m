Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF2C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 21:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBD010E055;
	Mon, 14 Apr 2025 21:46:36 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC6D10E00A;
 Mon, 14 Apr 2025 21:46:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/xe=5Fvm=3A_Im?=
 =?utf-8?q?plement_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev19=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 21:46:35 -0000
Message-ID: <174466719576.3583.5733768078470364286@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414214059.30657-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250414214059.30657-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev19)
URL   : https://patchwork.freedesktop.org/series/145529/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ee6ca91bfc76 drm-tip: 2025y-04m-14d-18h-46m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
Applying: drm/xe/xe_gt_pagefault: Move pagefault struct to header
Applying: drm/xe/uapi: Define drm_xe_vm_get_property
Applying: drm/xe/xe_vm: Add per VM fault info
Applying: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl


