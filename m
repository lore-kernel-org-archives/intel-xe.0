Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43ADEB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 18:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD1910E0CA;
	Thu,  6 Jul 2023 18:43:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15F0D10E0CA;
 Thu,  6 Jul 2023 18:43:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 126E3AADFA;
 Thu,  6 Jul 2023 18:43:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 06 Jul 2023 18:43:52 -0000
Message-ID: <168866903207.18977.9243478559786966039@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230706162003.427026-12-matthew.auld@intel.com>
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tr?=
 =?utf-8?q?y_to_handle_TLB_invalidations_from_CT_fast-path_=28rev3=29?=
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

Series: Try to handle TLB invalidations from CT fast-path (rev3)
URL   : https://patchwork.freedesktop.org/series/120174/
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
commit acf7079ed87bae407c14c047401f2eab92c7681f
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jul 6 17:20:14 2023 +0100

    drm/xe/tlb: print seqno_recv on fence TLB timeout
    
    To help debugging, sample the current seqno_recv and dump it out if we
    encounter a TLB timeout for the fences path.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch abcb88850f885254cf7477e1f7a5956136fb547c drm-intel
506d38469 drm/xe/tlb: drop unnecessary smp_wmb()
48c1fe486 drm/xe/tlb: ensure we access seqno_recv once
f79cf87dc drm/xe: hold mem_access.ref for CT fast-path
0905214a5 drm/xe/ct: hold fast_lock when reserving space for g2h
bf675b585 drm/xe/tlb: increment next seqno after successful CT send
fd34513ed drm/xe/ct: serialise fast_lock during CT disable
7216e6fb2 drm/xe/gt: tweak placement for signalling TLB fences after GT reset
9054a087b drm/xe/tlb: also update seqno_recv during reset
1b74b633d drm/xe: handle TLB invalidations from CT fast-path
-:30: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#30: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297

-:31: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#31: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320

-:32: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#32: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449

-:169: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#169: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:182:
+
+		}

total: 0 errors, 3 warnings, 1 checks, 266 lines checked
acf7079ed drm/xe/tlb: print seqno_recv on fence TLB timeout


