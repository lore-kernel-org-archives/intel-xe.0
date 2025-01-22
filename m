Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA438C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 04:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8A010E194;
	Wed, 22 Jan 2025 04:12:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94E10E656;
 Wed, 22 Jan 2025 04:12:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_stream-=3Epollin_fixes_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 04:12:01 -0000
Message-ID: <173751912125.2895277.2589170617888333736@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
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

Series: stream->pollin fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/143808/
State : success

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
commit 133d180704014264bb74de975d18503f84a24913
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Jan 21 20:02:04 2025 -0800

    drm/xe/oa: Fix locking for stream->pollin
    
    Previously locking was skipped for stream->pollin. This "mostly" worked
    because pollin is u32/bool, even when stream->pollin is accessed
    concurrently in multiple threads. However, with stream->pollin moving under
    stream->oa_buffer.ptr_lock in this series, implement the correct way to
    access stream->pollin, which is to access it under
    stream->oa_buffer.ptr_lock.
    
    v2: Update commit message to explain the "why" of this change (Rodrigo)
        Document the change in scope for stream->oa_buffer.ptr_lock (Rodrigo)
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch a5efe95724accce6ccd3e0c840fdd3bf5d6f369b drm-intel
04b9b43c0b65 drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
133d18070401 drm/xe/oa: Fix locking for stream->pollin


