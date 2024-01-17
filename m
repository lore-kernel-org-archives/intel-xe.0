Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4E6C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AF710E691;
	Wed, 17 Jan 2024 12:41:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2109B10E688;
 Wed, 17 Jan 2024 12:41:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Remove_obsolete?=
 =?utf-8?q?_async=5Fops_from_struct_xe=5Fvm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Wed, 17 Jan 2024 12:41:12 -0000
Message-ID: <170549527213.536878.6377784964351893359@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117110908.2362615-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240117110908.2362615-1-mika.kuoppala@linux.intel.com>
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

Series: drm/xe: Remove obsolete async_ops from struct xe_vm (rev2)
URL   : https://patchwork.freedesktop.org/series/128782/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ed4bd49890e7dd4cb38815aaeecfc3599a3fb38
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Wed Jan 17 13:09:08 2024 +0200

    drm/xe: Remove obsolete async_ops from struct xe_vm
    
    When sync binds were reworked and worker removed, async_ops became
    obsolete. Remove it.
    
    Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch b42f47ca5fff1d04fb8eb02d64520b3f338a495d drm-intel
5ed4bd498 drm/xe: Remove obsolete async_ops from struct xe_vm
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f3e9b1f43458', maybe rebased or not pulled?
#9: 
Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")

total: 0 errors, 1 warnings, 0 checks, 30 lines checked


