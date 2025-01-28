Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29CAC02190
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00110E68B;
	Tue, 28 Jan 2025 15:29:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86710E688;
 Tue, 28 Jan 2025 15:29:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Use_struct_f?=
 =?utf-8?q?or_drm=5Fsched=5Finit=28=29_params_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 15:29:56 -0000
Message-ID: <173807819663.1979623.6779360245685372089@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128142927.103290-2-phasta@kernel.org>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
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

Series: drm/sched: Use struct for drm_sched_init() params (rev2)
URL   : https://patchwork.freedesktop.org/series/143883/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 43c2e80ddcb72dae79a1e5e48613ab53a5b8f362
Author: Philipp Stanner <phasta@kernel.org>
Date:   Tue Jan 28 15:29:27 2025 +0100

    drm/sched: Use struct for drm_sched_init() params
    
    drm_sched_init() has a great many parameters and upcoming new
    functionality for the scheduler might add even more. Generally, the
    great number of parameters reduces readability and has already caused
    one missnaming in:
    
    commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").
    
    Introduce a new struct for the scheduler init parameters and port all
    users.
    
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch f85f4e698972bc6021185ccba59e6e3638a8e060 drm-intel
43c2e80ddcb7 drm/sched: Use struct for drm_sched_init() params
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").

-:354: CHECK:LINE_SPACING: Please don't use multiple blank lines
#354: FILE: drivers/gpu/drm/panthor/panthor_sched.c:3373:
 
+

-:580: CHECK:LINE_SPACING: Please don't use multiple blank lines
#580: FILE: drivers/gpu/drm/xe/xe_execlist.c:362:
 
+

total: 0 errors, 1 warnings, 2 checks, 566 lines checked


