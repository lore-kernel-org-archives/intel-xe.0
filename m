Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581FEF9B5E2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 08:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E67310E96C;
	Wed, 22 Apr 2026 08:27:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9810E96C;
 Wed, 22 Apr 2026 08:27:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_joiner_cursor_fast?=
 =?utf-8?q?_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Apr 2026 08:27:39 -0000
Message-ID: <177684645991.484983.1856496078079493930@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260422073722.1861494-1-nemesa.garg@intel.com>
In-Reply-To: <20260422073722.1861494-1-nemesa.garg@intel.com>
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

Series: Enable joiner cursor fast updates
URL   : https://patchwork.freedesktop.org/series/165272/
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
commit dc8801101474ca7a3c2e5cb143c64de23e8d68a5
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Apr 22 13:07:22 2026 +0530

    drm/i915/cursor: Allow joiner cursor fast path update
    
    The legacy cursor path forced all joiner updates to the
    slow path by checking joiner_pipes.
    Drop the condition so that joiner cursor updates can use
    the fast path.
    
    Assisted-by: Claude:claude-sonnet-4.6
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 84de0c4efa971d100d339d4b4aef24676b86c58e drm-intel
30887eb0d8cc drm/i915/cursor: Check joiner cursor commit status
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#11: 
Assisted-by: Claude:claude-sonnet-4.6

-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#11: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 47 lines checked
b85665ec9ad0 drm/i915/cursor: Add helper to update cursor plane
-:9: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#9: 
Assisted-by: Claude:claude-sonnet-4.6

-:9: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#9: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 53 lines checked
6bb30090afd3 drm/i915/cursor: Handle secondary cursor state
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#11: 
Assisted-by: Claude:claude-sonnet-4.6

-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#11: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 103 lines checked
82ccb7bdab1c drm/i915/cursor: Sync joiner secondary cursor state
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#11: 
Assisted-by: Claude:claude-sonnet-4.6

-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#11: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 19 lines checked
a347cb47d532 drm/i915/cursor: Program secondary cursor planes
-:10: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#10: 
Assisted-by: Claude:claude-sonnet-4.6

-:10: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#10: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 24 lines checked
dc8801101474 drm/i915/cursor: Allow joiner cursor fast path update
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#11: 
Assisted-by: Claude:claude-sonnet-4.6

-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-sonnet-4.6'
#11: 
Assisted-by: Claude:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 9 lines checked


