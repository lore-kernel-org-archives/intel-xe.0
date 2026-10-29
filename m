Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F90606A320
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A110E806;
	Thu, 29 Oct 2026 12:55:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8510E7C0;
 Thu, 29 Oct 2026 12:55:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/migrate=3A_Keep_access=5Fmemory_chunks_within_the_tr?=
 =?utf-8?q?ansfer_limit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 12:55:13 -0000
Message-ID: <179327851338.88070.9137007007996271002@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
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

Series: series starting with [1/3] drm/xe/migrate: Keep access_memory chunks within the transfer limit
URL   : https://patchwork.freedesktop.org/series/177152/
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
commit 79e80f3df933426d1b5574a806ca25d5b8db2190
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Thu Oct 29 14:21:30 2026 +0200

    drm/xe/tests: Keep bounce buffered accesses short in access_memory test
    
    Without MEM_COPY, the unaligned accesses go through a cacheline sized
    bounce buffer, one job per 64 bytes. On ATS-M each of the unaligned
    reads over the 512K bo takes 10-15s and the case 75s, tripping the hung
    task detector.
    
    The bounce loop only differs in its first and last iteration, so cap
    those accesses to 16K on platforms without MEM_COPY. Platforms with
    MEM_COPY keep the full length.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9663
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 drm-intel
e337d79e0810 drm/xe/migrate: Keep access_memory chunks within the transfer limit
-:34: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#34: 
  xe 0000:03:00.0: [drm] Assertion `npages * ((1UL) << 12) <= 0x00800000` failed!

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
d7c70f3bdd58 drm/xe/tests: Cover a large write to an unaligned bo offset
79e80f3df933 drm/xe/tests: Keep bounce buffered accesses short in access_memory test


