Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FBE6BF00
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 11:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E39A10E179;
	Fri, 30 Jan 2026 11:31:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE4910E179;
 Fri, 30 Jan 2026 11:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_update_use?=
 =?utf-8?q?d_tracking_kernel-doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 11:31:29 -0000
Message-ID: <176977268983.209935.17627285140167077888@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130110100.439832-2-matthew.auld@intel.com>
In-Reply-To: <20260130110100.439832-2-matthew.auld@intel.com>
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

Series: drm/xe/uapi: update used tracking kernel-doc
URL   : https://patchwork.freedesktop.org/series/160909/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f5835c4b8db5be8068cd29a8c371b03c99c5ce6
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Jan 30 11:01:01 2026 +0000

    drm/xe/uapi: update used tracking kernel-doc
    
    In commit 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
    we dropped the CAP_PERMON restriction but missed updating the
    corresponding kernel-doc. Fix that.
    
    Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
    Fixes: 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
+ /mt/dim checkpatch feea7da320aa6950f02d3c4633ab678e6e61f7e9 drm-intel
0f5835c4b8db drm/xe/uapi: update used tracking kernel-doc
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#10: 
Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
Fixes: 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


