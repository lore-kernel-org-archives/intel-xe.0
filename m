Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EEEE77184
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 01:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584A10E41B;
	Wed, 18 Dec 2024 01:06:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CA510E41B;
 Wed, 18 Dec 2024 01:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Reject_BO_evict?=
 =?utf-8?q?ion_if_BO_is_bound_to_current_VM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 01:06:57 -0000
Message-ID: <173448401787.4066315.11612101518086742649@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217231358.2361242-1-oak.zeng@intel.com>
In-Reply-To: <20241217231358.2361242-1-oak.zeng@intel.com>
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

Series: drm/xe: Reject BO eviction if BO is bound to current VM
URL   : https://patchwork.freedesktop.org/series/142755/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 92267cfa676b3f14a13acf51ebd4d038f91d31b9
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Tue Dec 17 18:13:58 2024 -0500

    drm/xe: Reject BO eviction if BO is bound to current VM
    
    This is a follow up fix for https://patchwork.freedesktop.org/patch/msgid/20241203021929.1919730-1-oak.zeng@intel.com
    The overall goal is to fail vm_bind when there is memory pressure. See more
    details in the commit message of above patch. Abbove patch fixes the issue
    when user pass in a vm_id parameter during gem_create. If user doesn't pass
    in a vm_id during gem_create, above patch doesn't help.
    
    This patch further reject BO eviction (which could be triggered by bo validation)
    if BO is bound to the current VM. vm_bind could fail due to the eviction failure.
    The BO to VM reverse mapping structure is used to determine whether BO is bound
    to VM.
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 69607bbcaccc29ae254d974a5e547d873e7c0ac0 drm-intel
92267cfa676b drm/xe: Reject BO eviction if BO is bound to current VM
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
This is a follow up fix for https://patchwork.freedesktop.org/patch/msgid/20241203021929.1919730-1-oak.zeng@intel.com

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


