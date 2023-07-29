Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52FC0015E
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jul 2023 04:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B0210E0AD;
	Sat, 29 Jul 2023 04:07:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78E1410E0C8;
 Sat, 29 Jul 2023 04:07:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 75D95A47E9;
 Sat, 29 Jul 2023 04:07:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Date: Sat, 29 Jul 2023 04:07:32 -0000
Message-ID: <169060365247.15696.6287819372868695177@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230729033059.2120121-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20230729033059.2120121-1-paulo.r.zanoni@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_don=27t_skip_rebinds_if_there=27s_a_NULL_binding_involv?=
 =?utf-8?q?ed?=
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

Series: drm/xe: don't skip rebinds if there's a NULL binding involved
URL   : https://patchwork.freedesktop.org/series/121564/
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
commit 0925d360feaa92ef7065d24edcec65df9df9a7a8
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Fri Jul 28 20:30:59 2023 -0700

    drm/xe: don't skip rebinds if there's a NULL binding involved
    
    Commit a042bb4ca894 ("drm/xe: Avoid doing rebinds") causes
    regressions in numerous Vulkan dEQP sparse-related tests. The errors
    happen in tests that:
    
      - check residencyNonResidentStrict=true behavior (use NULL bindings
        and check that they read/write zero)
      - and use buffers bigger than 2MB
      - and write through sparse buffers using compute shaders with ssbos
    
    So for example, the test:
      - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
    
    fails only if residencyNonResidentStrict is true, otherwise it passes
    (becasue otherwise it doesn't check the values of the ranges that were
    supposed to be bound through NULL bindings).
    
    But the test:
      - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_20
    
    always passes because it uses a smaller buffer, despite doing
    everything else equally. By maninpulating the sizes of the buffers we
    can see that 2MB is the range where the test starts failing.
    
    On the other hand, some other 2_24 tests were passing, despite having
    4MB buffers and checking the contents of NULL binding buffers.
    
    I can't claim I have a deep understanding of the code invovled here,
    but this patch seems to be the minimal 'revert' that fixes the issue
    and should be a good point to start the conversation on the mailing
    list.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
    Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
    Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch bec0c6a5312399c7ec5f8248701ba2ed265d51bf drm-intel
0925d360f drm/xe: don't skip rebinds if there's a NULL binding involved
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a042bb4ca894', maybe rebased or not pulled?
#6: 
Commit a042bb4ca894 ("drm/xe: Avoid doing rebinds") causes

-:19: WARNING:TYPO_SPELLING: 'becasue' may be misspelled - perhaps 'because'?
#19: 
(becasue otherwise it doesn't check the values of the ranges that were
 ^^^^^^^

-:39: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#39: 
Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24

-:40: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a042bb4ca894', maybe rebased or not pulled?
#40: 
Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")

-:41: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Reference:', use 'Link:' or 'Closes:' instead
#41: 
Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045

total: 0 errors, 5 warnings, 0 checks, 18 lines checked


