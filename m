Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323DECAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 10:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B3710E6EF;
	Wed, 24 Sep 2025 10:53:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBD110E6EF;
 Wed, 24 Sep 2025 10:53:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Flate=5Fbind?=
 =?utf-8?q?=5Ffw=3A_Fix_missing_initialization_of_variable_offset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 10:53:39 -0000
Message-ID: <175871121936.361551.4121343084589176837@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924102208.9216-1-colin.i.king@gmail.com>
In-Reply-To: <20250924102208.9216-1-colin.i.king@gmail.com>
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

Series: drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset (rev2)
URL   : https://patchwork.freedesktop.org/series/154952/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b562d182b985253537264f51c477870b5dd16828
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Wed Sep 24 11:22:08 2025 +0100

    drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset
    
    The variable offset is not being initialized, and it is only set inside
    a for-loop if entry->name is the same as manifest_entry. In the case
    where it is not initialized a non-zero check on offset is potentialy checking
    a bogus uninitalized value. Fix this by initializing offset to zero.
    
    Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+ /mt/dim checkpatch 53ee7e373ce454dc86b39ac27aa84d95c536b670 drm-intel
b562d182b985 drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
where it is not initialized a non-zero check on offset is potentialy checking

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


