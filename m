Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499ADEB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 22:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6ED10E37D;
	Thu, 22 Jun 2023 22:46:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1C5A10E37D;
 Thu, 22 Jun 2023 22:46:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CE9D7A73C7;
 Thu, 22 Jun 2023 22:46:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Date: Thu, 22 Jun 2023 22:46:47 -0000
Message-ID: <168747400784.4871.14833577670740340370@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_check_for_negative_=27le?=
 =?utf-8?q?n=27_in_xe=5Fengine=5Fcreate=5Fioctl?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/xe: check for negative 'len' in xe_engine_create_ioctl
URL   : https://patchwork.freedesktop.org/series/119772/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit efef77ee7c11f5523b306826eb64bb8678c78dce
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Thu Jun 22 15:42:55 2023 -0700

    drm/xe: properly check bounds for xe_wait_user_fence_ioctl()
    
    If !no_engines, then we use copy_from_user to copy to the 'eci' array,
    which has XE_HW_ENGINE_MAX_INSTANCE members. The amount of members
    copied is given by the user in args->num_engines, so add code to check
    that args->num_engines does not exceed XE_HW_ENGINE_MAX_INSTANCE. It's
    an unsigned value so there's no need to check for negative values.
    
    Fixes error messages such as:
    
        Buffer overflow detected (54 < 18446744073709551520)!
    
    Very simple reproducer:
    
        https://people.freedesktop.org/~pzanoni/wait-user-fence-bug/
    
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch 4287d7a61a8f6b40e4f99055870b1239d8439050 drm-intel
7119d70c0 drm/xe: check for negative 'len' in xe_engine_create_ioctl
-:9: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9: 
    usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
efef77ee7 drm/xe: properly check bounds for xe_wait_user_fence_ioctl()


