Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F3F433D2
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 01:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67BE10E7CA;
	Thu, 16 Apr 2026 01:01:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B0810E7BE;
 Thu, 16 Apr 2026 01:01:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_scripts/kernel-doc=3A_Det?=
 =?utf-8?q?ect_mismatched_inline_member_documentation_tags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 01:01:05 -0000
Message-ID: <177630126539.466823.9934362911319551917@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415215032.3398330-1-shuicheng.lin@intel.com>
In-Reply-To: <20260415215032.3398330-1-shuicheng.lin@intel.com>
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

Series: scripts/kernel-doc: Detect mismatched inline member documentation tags (rev2)
URL   : https://patchwork.freedesktop.org/series/164948/
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
commit ec99d4fd6f13a2807e319026dcc1f73ddf604ec4
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Apr 15 21:50:32 2026 +0000

    scripts/kernel-doc: Detect mismatched inline member documentation tags
    
    Add validation in check_sections() to verify that inline member
    documentation tags (/** @member: description */) match actual struct/union
    member names. Previously, kernel-doc only validated section headers against
    the parameter list, but inline doc tags stored in parameterdescs were never
    cross-checked, allowing stale or mistyped member names to go undetected.
    
    The new check iterates over parameterdescs keys and warns about any that
    don't appear in the parameter list, catching issues like renamed struct
    members where the documentation tag was not updated to match.
    
    This catches real issues such as:
      - xe_bo_types.h: @atomic_access (missing struct prefix, should be
        @attr.atomic_access)
      - xe_device_types.h: @usm.asid (member is actually asid_to_vm)
    
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 137513b61b4f187957d0c0f44c63c8549893f970 drm-intel
ec99d4fd6f13 scripts/kernel-doc: Detect mismatched inline member documentation tags
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#22: 
Assisted-by: Claude:claude-opus-4.6

-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#22: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 31 lines checked


