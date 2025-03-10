Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28236C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2D810E4A6;
	Mon, 10 Mar 2025 17:45:14 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3685910E4A1;
 Mon, 10 Mar 2025 17:45:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/xe=5Fvm=3A_Im?=
 =?utf-8?q?plement_xe=5Fvm=5Fget=5Ffaults=5Fioctl_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 17:45:14 -0000
Message-ID: <174162871422.15306.3303857097951087783@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250310171834.78299-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/146024/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 939e7a162757 drm-tip: 2025y-03m-10d-17h-32m-42s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
Applying: drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
Applying: drm/xe/xe_vm: Add per VM pagefault info
Applying: drm/xe/uapi: Define drm_xe_vm_get_faults
Applying: drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
Applying: drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl


