Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922B606F351
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A301E10E23D;
	Mon, 16 Nov 2026 11:17:52 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA510E23D;
 Mon, 16 Nov 2026 11:17:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_purpose-specifi?=
 =?utf-8?q?c_VRAM_pools_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 11:17:51 -0000
Message-ID: <179482787152.30636.5380332032493388009@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
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

Series: Introduce purpose-specific VRAM pools (rev4)
URL   : https://patchwork.freedesktop.org/series/175411/
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
commit 2b008ab8e7620d2d7219f84f2830ec94ce0a7276
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Mon Nov 16 10:45:23 2026 +0100

    drm/xe/kunit: Test VRAM pool allocation
    
    Exercise default pool setup, pool splitting and partition limits, and
    TTM placement range narrowing.
    
    v2:
     - Guard the test include with IS_BUILTIN() instead of IS_ENABLED(), so
       that the suite is not built into xe.ko when the KUnit tests are
       modular, as reported by Sashiko for the partitioned VRAM manager test.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 69ace29b145bdfb810085668b0dd90817665577c drm-intel
ca74fd548d7a drm/xe: Define partitioned VRAM manager types
0de0678a937d drm/xe: Define VRAM regions and pools
f2c2a439b0fa drm/xe/vram: Make VRAM pools the allocation handle
1fe96dfddabf drm/xe/ttm: Back each VRAM pool with its own buddy allocator
38ba53de2321 drm/xe/vram: Allow splitting a region into pools
7c9027857041 drm/xe/kunit: Test partitioned VRAM manager
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
2b008ab8e762 drm/xe/kunit: Test VRAM pool allocation
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 187 lines checked


