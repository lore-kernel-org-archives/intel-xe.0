Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC4FB5E87
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 22:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2710E40D;
	Mon, 16 Mar 2026 22:51:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5B10E40D;
 Mon, 16 Mar 2026 22:51:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_kernel-doc_fix_for_header?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 22:51:54 -0000
Message-ID: <177370151409.364316.14770951119215054609@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
In-Reply-To: <20260316180322.1721237-6-shuicheng.lin@intel.com>
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

Series: kernel-doc fix for headers
URL   : https://patchwork.freedesktop.org/series/163307/
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
commit 55c1e5b4b7587f0fa5d495a8b8651dfddc0cb7a7
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Mon Mar 16 18:03:19 2026 +0000

    drm/xe: Fix type and parameter name mismatches in kernel-doc references
    
    Fix kernel-doc references that point to wrong type or parameter names:
    
    - xe_guc_capture_types.h: register_data_type ->
      capture_register_data_type to match actual enum name
    - xe_oa_types.h: enum @drm_xe_oa_format_type ->
      enum drm_xe_oa_format_type (spurious '@' before type name)
    - xe_pt_walk.h: @sizes -> @shifts to match actual struct member,
      @start -> @addr to match actual parameter name,
      page.table. -> page table. (typo)
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch a25d8c583e1e52bde77d371081a7c3fcd0a2e820 drm-intel
d66c838bd832 drm/xe: Fix stale and mismatched kernel-doc member tags in header files
-:24: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#24: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:24: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#24: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 79 lines checked
6cccf32f781d drm/xe: Add missing '@' prefix to kernel-doc member tags
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#15: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 27 lines checked
cacf17fc2e90 drm/xe: Fix kernel-doc comment syntax issues in header files
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 26 lines checked
55c1e5b4b758 drm/xe: Fix type and parameter name mismatches in kernel-doc references
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#17: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 40 lines checked


