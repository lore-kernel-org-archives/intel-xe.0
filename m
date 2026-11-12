Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C9606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB27F112074;
	Thu, 12 Nov 2026 12:03:59 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D5D112074;
 Thu, 12 Nov 2026 12:03:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Separate_GGTT_pools_for_s?=
 =?utf-8?q?ubmissions_and_VFs_provisioning_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 12:03:58 -0000
Message-ID: <179448503821.15193.10002985549727419427@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
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

Series: Separate GGTT pools for submissions and VFs provisioning (rev8)
URL   : https://patchwork.freedesktop.org/series/171735/
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
commit 63a25509200397c2254a08b22a8dc7c50c54ac65
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Thu Nov 12 12:51:47 2026 +0100

    drm/xe/ggtt: Add KUnit tests for usable and shareable pools
    
    Add GGTT KUnit tests focused on the newly introduced usable and
    shareable pools.
    
    Cover range initialization for native and PF modes, including partially
    overlapping pools. Exercise allocation direction and conflicts between
    the pools, as well as the unavailable shareable pool and requests
    exceeding pool capacity.
    
    v2:
     - Init ggtt.lock with mutex_init() in each test.
    v3:
     - Rename the test file to use the _kunit.c suffix.
     - Use shared GGTT setup and cleanup helpers.
     - Split PCI IOV coverage into a separate KUnit suite.
    v4:
     - Release allocated nodes through KUnit deferred actions, so that an
       aborted test does not leak them into drm_mm_takedown() (Sashiko).
    v5:
     - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
       the !CONFIG_PCI_IOV build (Sashiko).
    v6:
     - Use the root tile's GGTT allocated by the fake device instead of
       a locally allocated one (Lukasz).
     - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
       instead of open-coding them in the tests.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 5eba64bd2f0a88e164db4c98f101fba936da41c7 drm-intel
e057d2a60277 drm/xe/ggtt: Assert lower bound of GGTT PTE address
f909f9871491 drm/xe/ggtt: Introduce full GGTT range size
1856e38911a8 drm/xe/ggtt: Split GGTT into usable and shareable pools
92b5dbff6c73 drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
63a255092003 drm/xe/ggtt: Add KUnit tests for usable and shareable pools
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 342 lines checked


