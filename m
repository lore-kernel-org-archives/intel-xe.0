Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11C3F9D0F6
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 00:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBDC10E091;
	Wed, 15 Apr 2026 00:06:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89D10E091;
 Wed, 15 Apr 2026 00:06:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_kernel-doc_fix_for_header?=
 =?utf-8?q?s_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 00:06:49 -0000
Message-ID: <177621160987.462768.4123894600825802539@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260414225457.3687449-1-shuicheng.lin@intel.com>
In-Reply-To: <20260414225457.3687449-1-shuicheng.lin@intel.com>
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

Series: kernel-doc fix for headers (rev3)
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
commit 2e9067b85afeb35a72cec212a7399962f8fc47a9
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Apr 14 22:54:33 2026 +0000

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
    Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a drm-intel
403253736723 drm/xe: Fix stale and mismatched kernel-doc member tags in header files
-:32: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:32: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 134 lines checked
9a58a3ca1d9a drm/xe: Add missing '@' prefix to kernel-doc member tags
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#15: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 27 lines checked
a2bf062fae1a drm/xe: Fix kernel-doc comment syntax issues in header files
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#19: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 42 lines checked
2e9067b85afe drm/xe: Fix type and parameter name mismatches in kernel-doc references
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#17: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 40 lines checked


