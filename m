Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CE606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 11:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306510EB95;
	Tue, 20 Oct 2026 11:23:45 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4D110EB95;
 Tue, 20 Oct 2026 11:23:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Separate_GGTT_pools_for_s?=
 =?utf-8?q?ubmissions_and_VFs_provisioning_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 11:23:44 -0000
Message-ID: <179249542417.46182.2881926324880557643@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261020095532.473609-1-piotr.piorkowski@intel.com>
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

Series: Separate GGTT pools for submissions and VFs provisioning (rev6)
URL   : https://patchwork.freedesktop.org/series/171735/
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
commit b7a87e68402393cf4376e0a8142487963a1db7e0
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Tue Oct 20 11:55:32 2026 +0200

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
    
    Assisted-by: Claude:claude-5-sonnet
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 24d867f5e671c78760ab39087a57c25ad98e1f42 drm-intel
8658619927bb drm/xe/ggtt: Introduce full GGTT range size
ee182678772b drm/xe/ggtt: Split GGTT into usable and shareable pools
26ae5ebc06a2 drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
b7a87e684023 drm/xe/ggtt: Add KUnit tests for usable and shareable pools
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 348 lines checked


