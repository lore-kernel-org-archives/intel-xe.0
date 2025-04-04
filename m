Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F9C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 05:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591CE10E309;
	Fri,  4 Apr 2025 05:54:56 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674E310E309;
 Fri,  4 Apr 2025 05:54:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_taking_inva?=
 =?utf-8?q?lid_lock_on_wedge?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 05:54:55 -0000
Message-ID: <174374609541.37371.16660988018592520542@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402-warn-after-wedge-v1-1-93e971511fa5@intel.com>
In-Reply-To: <20250402-warn-after-wedge-v1-1-93e971511fa5@intel.com>
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

Series: drm/xe: Fix taking invalid lock on wedge
URL   : https://patchwork.freedesktop.org/series/147177/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab542df1a8e5ab551e0b741bc6675dd2b2496d29
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Apr 2 22:38:05 2025 -0700

    drm/xe: Fix taking invalid lock on wedge
    
    If device wedges on e.g. GuC upload, the submission is not yet enabled
    and the state is not even initialized. Protect the wedge call so it does
    nothing in this case. It fixes the following splat:
    
            [] xe 0000:bf:00.0: [drm] device wedged, needs recovery
            [] ------------[ cut here ]------------
            [] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
            [] WARNING: CPU: 48 PID: 312 at kernel/locking/mutex.c:564 __mutex_lock+0x8a1/0xe60
            ...
            [] RIP: 0010:__mutex_lock+0x8a1/0xe60
            []  mutex_lock_nested+0x1b/0x30
            []  xe_guc_submit_wedge+0x80/0x2b0 [xe]
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
ab542df1a8e5 drm/xe: Fix taking invalid lock on wedge
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
	[] WARNING: CPU: 48 PID: 312 at kernel/locking/mutex.c:564 __mutex_lock+0x8a1/0xe60

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


