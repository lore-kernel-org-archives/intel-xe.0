Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED99CF6497
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 00:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5DC10E6BF;
	Thu, 20 Nov 2025 00:48:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E45110E286;
 Thu, 20 Nov 2025 00:48:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_bind_queue_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 00:48:05 -0000
Message-ID: <176359968557.11451.14477854979372812651@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119203031.267625-4-matthew.auld@intel.com>
In-Reply-To: <20251119203031.267625-4-matthew.auld@intel.com>
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

Series: Some bind queue fixes
URL   : https://patchwork.freedesktop.org/series/157801/
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
commit 9bdaa08c6e8c083edeed9e46199efd73d4b9fbb3
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Nov 19 20:30:34 2025 +0000

    drm/xe/migrate: fix job lock assert
    
    We are meant to be checking the user vm for the bind queue, but actually
    we are checking the migrate vm. For various reasons this is not
    currently firing but this will likely change in the future.
    
    Now that we have the user_vm attached to the bind queue, we can fix this
    by directly checking that here.
    
    Fixes: dba89840a920 ("drm/xe: Add GT TLB invalidation jobs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a95032b2166b5ae428c065917b843a1caf1e82b8 drm-intel
6f020cafe192 drm/xe/uapi: disallow bind queue sharing
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#22: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

-:30: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'José Roberto de Souza <jose.souza@intel.com'
#30: 
Acked-by: José Roberto de Souza <jose.souza@intel.com

total: 1 errors, 1 warnings, 0 checks, 115 lines checked
9bdaa08c6e8c drm/xe/migrate: fix job lock assert


