Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF33F433D0
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E18410E770;
	Wed, 15 Apr 2026 23:03:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB6E10E76C;
 Wed, 15 Apr 2026 23:03:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/eustall=3A_Fix_drm?=
 =?utf-8?q?=5Fdev=5Fput_called_before_stream_disable_in_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 23:03:03 -0000
Message-ID: <177629418395.466117.9177086080947543002@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415225428.3399934-1-shuicheng.lin@intel.com>
In-Reply-To: <20260415225428.3399934-1-shuicheng.lin@intel.com>
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

Series: drm/xe/eustall: Fix drm_dev_put called before stream disable in close
URL   : https://patchwork.freedesktop.org/series/164952/
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
commit 8e8f52879213ab3feaa82e592fea07234feb4ac3
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Apr 15 22:54:28 2026 +0000

    drm/xe/eustall: Fix drm_dev_put called before stream disable in close
    
    In xe_eu_stall_stream_close(), drm_dev_put() is called before the
    stream is disabled and its resources are freed. If this drops the
    last reference, the device structures could be freed while the
    subsequent cleanup code still accesses them, leading to a
    use-after-free.
    
    Fix this by moving drm_dev_put() after all device accesses are
    complete. This matches the ordering in xe_oa_release().
    
    Fixes: 9a0b11d4cf3b ("drm/xe/eustall: Add support to init, enable and disable EU stall sampling")
    Cc: Harish Chegondi <harish.chegondi@intel.com>
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9 drm-intel
8e8f52879213 drm/xe/eustall: Fix drm_dev_put called before stream disable in close
-:18: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#18: 
Assisted-by: Claude:claude-opus-4.6

-:18: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#18: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 16 lines checked


