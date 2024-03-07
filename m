Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E9C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 06:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D085F10F0D3;
	Thu,  7 Mar 2024 06:43:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BF210F0D5;
 Thu,  7 Mar 2024 06:43:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm_=3A_Remove_dupl?=
 =?utf-8?q?icate_assignment_of_XE=5FVM=5FFLAG=5FLR=5FMODE_flag=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 06:43:47 -0000
Message-ID: <170979382720.580282.18284369544715331793@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag.
URL   : https://patchwork.freedesktop.org/series/130853/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b73dba9fb0a0b5a84195ffdb8424ef64d10c9e3
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Mar 7 12:22:13 2024 +0530

    drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag.
    
    vm->flags are already assigned with passed flags. Remove the redundant
    assignment.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch c9b9b8d4449209d2451127f98cdfe2b99bec3da7 drm-intel
6b73dba9fb0a drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag.


