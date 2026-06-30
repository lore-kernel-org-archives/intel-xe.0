Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A26C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 06:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79D10E176;
	Tue, 30 Jun 2026 06:18:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483B010E176;
 Tue, 30 Jun 2026 06:18:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=3A_fix_IOVA/DM?=
 =?utf-8?q?A_unmap_leaks_in_=5F=5Fdrm=5Fgpusvm=5Funmap=5Fpages=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huang, Honglei" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 06:18:11 -0000
Message-ID: <178280029128.131622.13235841848002193155@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630034021.362571-1-honghuan@amd.com>
In-Reply-To: <20260630034021.362571-1-honghuan@amd.com>
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

Series: drm/gpusvm: fix IOVA/DMA unmap leaks in __drm_gpusvm_unmap_pages()
URL   : https://patchwork.freedesktop.org/series/169467/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad89294a9147d7150cc39cfae8cb805768c2d4f1
Author: Honglei Huang <honghuan@amd.com>
Date:   Tue Jun 30 11:40:21 2026 +0800

    drm/gpusvm: publish dpagemap early to avoid device mapping leak on error
    
    drm_gpusvm_get_pages() only stored the local dpagemap into
    svm_pages->dpagemap on the success path. If a later page failed (e.g.
    -EOPNOTSUPP when ctx->allow_mixed is false) and jumped to err_unmap,
    svm_pages->dpagemap was still NULL, so __drm_gpusvm_unmap_pages() skipped
    device_unmap() and leaked the device mappings already created.
    
    Assign svm_pages->dpagemap when the first device page is mapped so the
    err_unmap path can device_unmap() those mappings.
    
    Reported-by: Sashiko AI review
    Signed-off-by: Honglei Huang <honghuan@amd.com>
+ /mt/dim checkpatch 03288b34f48c3fe60055353c30da4aacab572cdc drm-intel
a26411fffd0b drm/gpusvm: free the whole IOVA reservation on unmap
-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko AI review'
#20: 
Reported-by: Sashiko AI review

-:20: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#20: 
Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>

-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#22: 
Reported-by: sashiko <sashiko@sashiko.dev>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

total: 1 errors, 2 warnings, 0 checks, 31 lines checked
c8a38d3a9911 drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
When use_iova is true the first condition is false for system pages, so they

-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko AI review'
#23: 
Reported-by: Sashiko AI review

-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#23: 
Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>

total: 1 errors, 2 warnings, 0 checks, 24 lines checked
ad89294a9147 drm/gpusvm: publish dpagemap early to avoid device mapping leak on error
-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko AI review'
#16: 
Reported-by: Sashiko AI review

-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#16: 
Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>

total: 1 errors, 1 warnings, 0 checks, 29 lines checked


