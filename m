Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62237C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 17:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2218B10E675;
	Thu, 20 Mar 2025 17:37:59 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83D10E675;
 Thu, 20 Mar 2025 17:37:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_xe=5Fhmm_with_gpu?=
 =?utf-8?q?svm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 17:37:57 -0000
Message-ID: <174249227796.59401.6980607798530360183@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320172956.168358-9-matthew.auld@intel.com>
In-Reply-To: <20250320172956.168358-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm
URL   : https://patchwork.freedesktop.org/series/146553/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f2612d8c694f0ef54f51ce2f65c06d1c5e0a637
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Mar 20 17:30:04 2025 +0000

    drm/xe/userptr: replace xe_hmm with gpusvm
    
    Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
    common code. The core facilities we need are get_pages(), unmap_pages()
    and free_pages() for a given useptr range, plus a vm level notifier
    lock, which is now provided by gpusvm.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1f934e6cad9aa2378895190f52f2f363e3323945 drm-intel
936707e01055 drm/gpusvm: fix hmm_pfn_to_map_order() usage
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
16ef137c4e3a drm/gpusvm: use more selective dma dir in get_pages()
f56441bea99a drm/gpusvm: mark pages as dirty
1fa4fa6a4101 drm/gpusvm: pull out drm_gpusvm_pages substructure
89ea2f8b7e98 drm/gpusvm: lower get/unmap pages
90ad125c0327 drm/gpusvm: support basic_range
6f2612d8c694 drm/xe/userptr: replace xe_hmm with gpusvm
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 406 lines checked


