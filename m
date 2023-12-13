Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD13CC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 05:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977810E6D0;
	Wed, 13 Dec 2023 05:15:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B302D10E6D6;
 Wed, 13 Dec 2023 05:15:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AF35BAADD5;
 Wed, 13 Dec 2023 05:15:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Uniform_as?=
 =?utf-8?q?ync_vs_sync_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Dec 2023 05:15:55 -0000
Message-ID: <170244455571.10260.12147018526315315846@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213043517.609363-1-matthew.brost@intel.com>
In-Reply-To: <20231213043517.609363-1-matthew.brost@intel.com>
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

Series: drm/xe/uapi: Uniform async vs sync handling (rev2)
URL   : https://patchwork.freedesktop.org/series/127442/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0a4ce6ecb72ab32f5650b1c4bff2e803ce6684a6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 12 20:35:17 2023 -0800

    drm/xe/uapi: Uniform async vs sync handling
    
    Remove concept of async vs sync VM bind queues, rather make async vs
    sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
    a singular flag IOCTL rather than per VM bind op flag too. Add
    DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
    this. Support this new flag for both the VM bind IOCTL only with a path
    to support this for execs too.
    
    v2: Add cookie, move sync wait outside of any locks.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c8b4e5a39054ba271775aa47e40ba43bbbc173ed drm-intel
0a4ce6ecb drm/xe/uapi: Uniform async vs sync handling


