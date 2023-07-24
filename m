Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80641C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 10:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5747610E2CC;
	Mon, 24 Jul 2023 10:50:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA77F10E2CC;
 Mon, 24 Jul 2023 10:50:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C736AAADED;
 Mon, 24 Jul 2023 10:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 24 Jul 2023 10:50:30 -0000
Message-ID: <169019583081.30103.14828538620312432768@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230724104743.27471-2-matthew.auld@intel.com>
In-Reply-To: <20230724104743.27471-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_add_lockdep_annotation_for_xe=5Fdevice=5Fmem=5Faccess?=
 =?utf-8?b?X3B1dCgpIChyZXYyKQ==?=
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

Series: drm/xe: add lockdep annotation for xe_device_mem_access_put() (rev2)
URL   : https://patchwork.freedesktop.org/series/121119/
State : success

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
commit d28161b375947964370145533d6d6546860fbf8d
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jul 24 11:47:44 2023 +0100

    drm/xe: add lockdep annotation for xe_device_mem_access_put()
    
    The main motivation is with d3cold which will make the suspend and
    resume callbacks even more scary, but is useful regardless. We already
    have the needed annotation on the acquire side with
    xe_device_mem_access_get(), and by adding the annotation on the release
    side we should have a lot more confidence that our locking hierarchy is
    correct.
    
    v2:
      - Move the annotation into both callbacks for better symmetry. Also
        don't hold over the entire mem_access_get(); we only need to lockep
        to understand what is being held upon entering mem_access_get(), and
        how that matches up with locks in the callbacks.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f7e68e5db4417dde38c45cc8aedd7cb2b18fa678 drm-intel
d28161b37 drm/xe: add lockdep annotation for xe_device_mem_access_put()


