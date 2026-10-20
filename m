Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDF606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC410E596;
	Tue, 20 Oct 2026 08:49:55 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120C610E596;
 Tue, 20 Oct 2026 08:49:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_purpose-specifi?=
 =?utf-8?q?c_VRAM_pools_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 08:49:55 -0000
Message-ID: <179248619506.45112.10245796819093002292@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
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

Series: Introduce purpose-specific VRAM pools (rev3)
URL   : https://patchwork.freedesktop.org/series/175411/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26996a1473078f95686196747b93c87eb343f377
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Tue Oct 20 10:42:58 2026 +0200

    drm/xe/kunit: Test VRAM pool allocation
    
    Exercise default pool setup, pool splitting and partition limits, and
    TTM placement range narrowing.
    
    Assisted-by: Claude Opus 5.5
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 24d867f5e671c78760ab39087a57c25ad98e1f42 drm-intel
a48f18025bfc drm/xe: Define partitioned VRAM manager types
221f1de55b3f drm/xe: Define VRAM regions and pools
72800c75e55b drm/xe/vram: Make VRAM pools the allocation handle
aff9ab76caea drm/xe/ttm: Back each VRAM pool with its own buddy allocator
c213b365a84f drm/xe/vram: Allow splitting a region into pools
c5310b28abcb drm/xe/kunit: Test partitioned VRAM manager
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
26996a147307 drm/xe/kunit: Test VRAM pool allocation
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 187 lines checked


