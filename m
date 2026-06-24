Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1747BCDB471
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD77510EE9A;
	Wed, 24 Jun 2026 11:24:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECFC10E06A;
 Wed, 24 Jun 2026 11:24:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Fix_memory_leak_in_exec=5Fqueue=5Fset=5Fhang=5Fre?=
 =?utf-8?q?play=5Fstate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 11:24:16 -0000
Message-ID: <178230025644.110949.3386322509507591745@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624111421.1258364-1-michal.winiarski@intel.com>
In-Reply-To: <20260624111421.1258364-1-michal.winiarski@intel.com>
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

Series: series starting with [1/2] drm/xe: Fix memory leak in exec_queue_set_hang_replay_state()
URL   : https://patchwork.freedesktop.org/series/169093/
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
commit 9f69636ac703bf8f8a1b9bb71f013ff12b6c843a
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Jun 24 13:14:21 2026 +0200

    drm/xe: Reject duplicated properties for EXEC_QUEUE_SET_PROPERTY
    
    All of the properties are idempotent - setting them multiple times on
    the same exec_queue within a single IOCTL doesn't make sense.
    Return an error when duplicated property is found.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch c8f7b414dbe437343710668aba2d40603befca5d drm-intel
9d7fdf2a9d1c drm/xe: Fix memory leak in exec_queue_set_hang_replay_state()
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 1026c1a73a96 ("drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
9f69636ac703 drm/xe: Reject duplicated properties for EXEC_QUEUE_SET_PROPERTY


