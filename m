Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7065CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 17:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891BF10E4FD;
	Tue, 26 May 2026 17:20:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367BD10E49C;
 Tue, 26 May 2026 17:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_don=27t_allow_changes_to_?=
 =?utf-8?q?inactive_colorops?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 17:20:00 -0000
Message-ID: <177981600021.11680.14657813601965095955@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526142940.504911-1-mwen@igalia.com>
In-Reply-To: <20260526142940.504911-1-mwen@igalia.com>
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

Series: don't allow changes to inactive colorops
URL   : https://patchwork.freedesktop.org/series/167294/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f68814bbc854dd194a814e39e5ce0ff37e8dd12d
Author: Melissa Wen <mwen@igalia.com>
Date:   Tue May 26 16:17:10 2026 +0200

    drm/atomic: reject colorop update from inactive color pipeline
    
    Only allow updates on colorops that are part of an active pipeline, i.e.
    check if a colorop belongs to the color pipeline of a plane in its
    current, new or old state. If not, reject the state change of this
    inactive colorop. Performing this check later in drm_atomic_check_only()
    to remove the ordering dependency that would exist if done at the time
    of colorop property setting. Userspace is allowed to change colorops of
    an active color pipeline, or when activating or deactivating its
    pipeline in the same commit. However, changes in inactive color pipeline
    is not allowed.
    
    Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Melissa Wen <mwen@igalia.com>
+ /mt/dim checkpatch 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c drm-intel
5967254000dd drm/atomic: only add states of active or transient active colorops
7149ee2807e4 drm/atomic: duplicate state of all colorops
f68814bbc854 drm/atomic: reject colorop update from inactive color pipeline
-:56: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#56: FILE: drivers/gpu/drm/drm_atomic.c:896:
+	if (WARN_ON(!old_plane_state)) return -EINVAL;

total: 1 errors, 0 warnings, 0 checks, 77 lines checked


