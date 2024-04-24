Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A255C04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4510FC99;
	Wed, 24 Apr 2024 03:39:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025EC10FB00;
 Wed, 24 Apr 2024 03:39:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_the_helpers_for_locki?=
 =?utf-8?q?ng/unlocking_resv_object?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 03:39:39 -0000
Message-ID: <171392997901.1610961.785846003895136112@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
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

Series: Use the helpers for locking/unlocking resv object
URL   : https://patchwork.freedesktop.org/series/132815/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1d99d6f383da0800bda455dd3f2fd6c96fbebd08
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Apr 24 09:15:15 2024 +0530

    drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
    
    There is no change in functionality. Using the helper function
    defined within the driver for locking/unlocking the reservation
    object.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch b489bf6605759a57c37295c2025e5ee392b88ff3 drm-intel
42c7df8123be drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
1d99d6f383da drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers


