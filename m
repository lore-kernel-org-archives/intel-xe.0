Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A4E83056
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 06:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3810E54F;
	Tue,  3 Feb 2026 06:15:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3F510E54D;
 Tue,  3 Feb 2026 06:15:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Small_GPUSVM_fixes_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Feb 2026 06:15:09 -0000
Message-ID: <177009930902.219349.545526864422728668@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130194928.3255613-1-matthew.brost@intel.com>
In-Reply-To: <20260130194928.3255613-1-matthew.brost@intel.com>
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

Series: Small GPUSVM fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/160939/
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
commit 04422cfa40413de498f85780299a0f99a9009b89
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jan 30 11:49:28 2026 -0800

    drm/gpusvm: Allow device pages to be mapped in mixed mappings after system pages
    
    The current code rejects device mappings whenever system pages have
    already been encountered. This is not the intended behavior when
    allow_mixed is set.
    
    Relax the restriction by permitting a single pagemap to be selected when
    allow_mixed is enabled, even if system pages were found earlier.
    
    Fixed: bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 6e53f6296065672f8a0c7f98b4b6c409dac382b4 drm-intel
5a47791fe31c drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
04422cfa4041 drm/gpusvm: Allow device pages to be mapped in mixed mappings after system pages
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
Fixed: bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")

-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")'
#14: 
Fixed: bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")

total: 1 errors, 1 warnings, 0 checks, 8 lines checked


