Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80F60A3801
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527D10F67C;
	Tue, 27 Oct 2026 15:38:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E51A10F67D;
 Tue, 27 Oct 2026 15:37:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/migrate=3A_Keep_access=5Fmemory_chunks_within_the_tr?=
 =?utf-8?q?ansfer_limit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 15:37:58 -0000
Message-ID: <179311547825.77490.14925706993374233230@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [1/2] drm/xe/migrate: Keep access_memory chunks within the transfer limit
URL   : https://patchwork.freedesktop.org/series/176960/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a32501fcf07e6bfcbfcf9df5f592cab5e039b90
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Tue Oct 27 16:52:37 2026 +0200

    drm/xe/tests: Cover a large write to an unaligned bo offset
    
    Write a contiguous 16M bo from offset 4 with xe_migrate_access_memory()
    and read it back. Aligning the vram side leaves buf mid page, so the
    following full chunk has to stay within MAX_PREEMPTDISABLE_TRANSFER.
    
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 drm-intel
c489d20b5666 drm/xe/migrate: Keep access_memory chunks within the transfer limit
-:34: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#34: 
  xe 0000:03:00.0: [drm] Assertion `npages * ((1UL) << 12) <= 0x00800000` failed!

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
1a32501fcf07 drm/xe/tests: Cover a large write to an unaligned bo offset


