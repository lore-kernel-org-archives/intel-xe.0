Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD4EEB562
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 19:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A243110E0FD;
	Fri,  8 Sep 2023 19:11:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21CDF10E0FB;
 Fri,  8 Sep 2023 19:11:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 217F8AADE0;
 Fri,  8 Sep 2023 19:11:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Fri, 08 Sep 2023 19:11:03 -0000
Message-ID: <169420026313.14898.11150999976565859370@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908184928.65815-1-gustavo.sousa@intel.com>
In-Reply-To: <20230908184928.65815-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?move_redundant_call_to_intel=5Finit=5Fdisplay=5Fhooks=28=29?=
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

Series: Remove redundant call to intel_init_display_hooks()
URL   : https://patchwork.freedesktop.org/series/123456/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6bb23effcbe04a23feb120ffd7136ef18acfd56f
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Sep 8 15:49:28 2023 -0300

    fixup! drm/xe/display: Implement display support
    
    In Xe initialization path, the function intel_init_display_hooks() is
    being called twice, which is redundant. To remove redundancy, let's
    remove one of the calls.
    
    That function sets up hooks that are called from: (i) later in the
    initialization path (i.e. intel_display_driver_probe_nogem()), (ii)
    resume, or (iii) mode set commits.
    
    In both call sites, none of the scenarios above are reached yet, so it
    would be safe to remove the redundant call from either of the two.
    However, since intel_display_driver_early_probe() is shared by both i915
    and Xe, prefer to remove the call done from xe_display_init_nommio().
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 92bbb05964b2237a76a8a68020896bdbe0cab459 drm-intel
6bb23effc fixup! drm/xe/display: Implement display support


