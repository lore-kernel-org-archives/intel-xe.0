Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32F5C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DD410E249;
	Wed,  7 May 2025 20:33:08 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADA010E88D;
 Wed,  7 May 2025 20:33:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vsec=3A_Allow_for_?=
 =?utf-8?q?kernel_context_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 20:33:06 -0000
Message-ID: <174664998695.57599.4445253229905374919@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250507193811.268719-1-michael.j.ruhl@intel.com>
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

Series: drm/xe/vsec: Allow for kernel context access (rev2)
URL   : https://patchwork.freedesktop.org/series/148726/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b628870fe228d9656fcc1c28dcfd2c00ab19f8ad
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Wed May 7 15:37:40 2025 -0400

    drm/xe/vsec: Allow for kernel context access
    
    The PMT driver API allows kernel level access to device
    data.  Because of this, the mutex lock use by the Xe copy
    callback function turns out to be a poor choice.
    
    Change the mutex to a spinlock to avoid sleeping when it
    isn't allowed.
    
    Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch ca0305cadc2d34c8887b891b96226af17571b2a3 drm-intel
b628870fe228 drm/xe/vsec: Allow for kernel context access
-:48: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#48: FILE: drivers/gpu/drm/xe/xe_device_types.h:530:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 41 lines checked


