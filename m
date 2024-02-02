Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E042C48286
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 03:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109FE10E792;
	Fri,  2 Feb 2024 03:37:14 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A3210E792;
 Fri,  2 Feb 2024 03:37:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Map_both_mem=2E?=
 =?utf-8?q?kernel=5Fbb=5Fpool_and_usm=2Ebb=5Fpool?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 03:37:13 -0000
Message-ID: <170684503367.897305.3775036447663600141@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202033440.2351862-1-matthew.brost@intel.com>
In-Reply-To: <20240202033440.2351862-1-matthew.brost@intel.com>
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

Series: drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
URL   : https://patchwork.freedesktop.org/series/129450/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d32c66c4f991fc435dcb466ddc589f99966c46bd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 1 19:34:40 2024 -0800

    drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
    
    For integrated devices we need to map both mem.kernel_bb_pool and
    usm.bb_pool to be able to run batches from both pools.
    
    Fixes: a682b6a42d4d ("drm/xe: Support device page faults on integrated platforms")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 18a9fefd9e05291cbe792d358bbdc04dc6d21adb drm-intel
d32c66c4f drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a682b6a42d4d', maybe rebased or not pulled?
#9: 
Fixes: a682b6a42d4d ("drm/xe: Support device page faults on integrated platforms")

total: 0 errors, 1 warnings, 0 checks, 46 lines checked


