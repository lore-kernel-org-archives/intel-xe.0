Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0CFCA0EED
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 03:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534A10E10B;
	Mon, 25 Aug 2025 03:50:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C66B10E0E6;
 Mon, 25 Aug 2025 03:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_trigger?=
 =?utf-8?q?_rebind_on_initial_dma-buf_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 03:50:55 -0000
Message-ID: <175609385504.264476.17179183120546121275@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825034516.3793098-1-matthew.brost@intel.com>
In-Reply-To: <20250825034516.3793098-1-matthew.brost@intel.com>
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

Series: drm/xe: Don't trigger rebind on initial dma-buf validation
URL   : https://patchwork.freedesktop.org/series/153420/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c4a9d6b1eed84879ef5d43ac54dc946b76a28139
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Aug 24 20:45:16 2025 -0700

    drm/xe: Don't trigger rebind on initial dma-buf validation
    
    On the first validate of an imported dma-buf (initial bind), the device
    has no GPU mappings, so a rebind is unnecessary. Rebinding here is
    harmful in multi-GPU setups and for VMs using preempt-fence mode, as it
    would evict in-flight GPU work.
    
    Signed-off-by: Matthee Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 917d1207e648aa4f8f8fd3fb6fb97fcfe35590e8 drm-intel
c4a9d6b1eed8 drm/xe: Don't trigger rebind on initial dma-buf validation
-:43: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthee Brost <matthew.brost@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


