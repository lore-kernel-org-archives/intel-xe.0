Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8DFC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 20:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40510E9DF;
	Fri,  5 Apr 2024 20:47:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA310E9DF;
 Fri,  5 Apr 2024 20:47:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_hmm=5Frange=5Ffault_t?=
 =?utf-8?q?o_populate_user_page?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 20:47:28 -0000
Message-ID: <171235004810.1239329.9725379777487003388@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
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

Series: Use hmm_range_fault to populate user page
URL   : https://patchwork.freedesktop.org/series/132096/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 45951dd401b907fe23c99a662b9527534734ce1a
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Sat Apr 6 00:35:08 2024 +0530

    drm/xe: Use hmm_range_fault to populate user pages
    
    This is an effort to unify hmmptr (aka system allocator)
    and userptr code. hmm_range_fault is used to populate
    a virtual address range for both hmmptr and userptr,
    instead of hmmptr using hmm_range_fault and userptr
    using get_user_pages_fast.
    
    This also aligns with AMD gpu driver's behavior. In
    long term, we plan to put some common helpers in this
    area to drm layer so it can be re-used by different
    vendors.
    
    -v1
    use the function with parameter to confirm whether lock is
    acquired by the caller or needs to be acquired in hmm_range_fault.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 11155f150a41d028c6ac7a141924fd4c8798721d drm-intel
a407da323b91 drm/xe: Introduce helper to populate userptr
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 279 lines checked
45951dd401b9 drm/xe: Use hmm_range_fault to populate user pages


