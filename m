Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE0FD12D60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 14:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F3210E77A;
	Wed,  3 Dec 2025 14:18:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDEA10E77A;
 Wed,  3 Dec 2025 14:18:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fs=3A_PM=3A_Fix_reverse_c?=
 =?utf-8?q?heck_in_filesystems=5Ffreeze=5Fcallback=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Dec 2025 14:18:07 -0000
Message-ID: <176477148712.53828.11014531337871002363@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251203135551.2629298-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251203135551.2629298-1-chaitanya.kumar.borah@intel.com>
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

Series: fs: PM: Fix reverse check in filesystems_freeze_callback()
URL   : https://patchwork.freedesktop.org/series/158444/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 48cf4bf5955cbb28c974cecec447384e91c59a90
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Date:   Wed Dec 3 19:25:51 2025 +0530

    fs: PM: Fix reverse check in filesystems_freeze_callback()
    
    The freeze_all_ptr check in filesystems_freeze_callback() introduced by
    commit a3f8f8662771 ("power: always freeze efivarfs") is reverse which
    quite confusingly causes all file systems to be frozen when
    filesystem_freeze_enabled is false.
    
    On my systems it causes the WARN_ON_ONCE() in __set_task_frozen() to
    trigger, most likely due to an attempt to freeze a file system that is
    not ready for that.
    
    Add a logical negation to the check in question to reverse it as
    appropriate.
    
    Fixes: a3f8f8662771 ("power: always freeze efivarfs")
    Cc: 6.18+ <stable@vger.kernel.org> # 6.18+
    Link: https://lore.kernel.org/linux-pm/12788397.O9o76ZdvQC@rafael.j.wysocki/
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15341
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Reviewed-by: Jan Kara <jack@suse.cz>
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 6ef847703ac6da2deaaf735ce95369ba25c2c432 drm-intel
48cf4bf5955c fs: PM: Fix reverse check in filesystems_freeze_callback()
-:19: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: '6.18+ <stable@vger.kernel.org> # 6.18+', prefer 'stable@vger.kernel.org # 6.18+'
#19: 
Cc: 6.18+ <stable@vger.kernel.org> # 6.18+

-:21: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#21: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15341

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


