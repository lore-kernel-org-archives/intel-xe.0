Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA3C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A710E576;
	Thu,  8 Jun 2023 05:06:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A910C10E576;
 Thu,  8 Jun 2023 05:06:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5C81A0BA8;
 Thu,  8 Jun 2023 05:06:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 08 Jun 2023 05:06:04 -0000
Message-ID: <168620076467.18384.7207069877546786253@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608050333.37581-1-matthew.brost@intel.com>
In-Reply-To: <20230608050333.37581-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_NU?=
 =?utf-8?q?LL_bindings_aka_sparse_bindings?=
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

Series: NULL bindings aka sparse bindings
URL   : https://patchwork.freedesktop.org/series/119048/
State : warning

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
commit 0822e4e1bcfc4c2f212e900fa6e0cf12bc2f3a5c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jun 7 22:03:33 2023 -0700

    drm/xe: NULL binding implementation
    
    Add uAPI and implementation for NULL bindings. A NULL binding is defined
    as writes dropped and read zero. A single bit in the uAPI has been added
    which results in a single bit in the PTEs being set.
    
    NULL bindings are indended to be used to implement VK sparse bindings,
    in particular residencyNonResidentStrict property.
    
    Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f093641a9cd6fa9a5a8dd6577746904fb9ac9e12 drm-intel
b5b2038ee drm/xe: s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
4fc275977 drm/xe: Move XE_PTE_FLAG_READ_ONLY to xe_vm_types.h
-:35: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 15 lines checked
0822e4e1b drm/xe: NULL binding implementation
-:10: WARNING:TYPO_SPELLING: 'indended' may be misspelled - perhaps 'intended'?
#10: 
NULL bindings are indended to be used to implement VK sparse bindings,
                  ^^^^^^^^

-:75: WARNING:TYPO_SPELLING: 'adresses' may be misspelled - perhaps 'addresses'?
#75: FILE: drivers/gpu/drm/xe/xe_pt.c:564:
+	/* null VMA's do not have dma adresses */
 	                              ^^^^^^^^

-:86: WARNING:TYPO_SPELLING: 'adresses' may be misspelled - perhaps 'addresses'?
#86: FILE: drivers/gpu/drm/xe/xe_pt.c:584:
+	/* null VMA's do not have dma adresses */
 	                              ^^^^^^^^

total: 0 errors, 3 warnings, 0 checks, 448 lines checked


