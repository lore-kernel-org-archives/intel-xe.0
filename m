Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD33C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 11:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F17F10EB84;
	Tue,  8 Sep 2026 11:46:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92310EB84;
 Tue,  8 Sep 2026 11:46:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Separate_GGTT_pools_for_s?=
 =?utf-8?q?ubmissions_and_VFs_provisioning_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 11:46:30 -0000
Message-ID: <178886799064.134370.17217204510617989101@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
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

Series: Separate GGTT pools for submissions and VFs provisioning (rev5)
URL   : https://patchwork.freedesktop.org/series/171735/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1935b0459b1dec6e39f9e006a7a58c0059a9797
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Tue Sep 8 12:06:02 2026 +0200

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
    
    Assisted-by: Claude:claude-5-sonnet
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch f8843c7786617d315975cb2a3d4d123e6c8f8a04 drm-intel
235899136f26 drm/xe/ggtt: Introduce full GGTT range size
3f18efca7691 drm/xe/ggtt: Split GGTT into usable and shareable pools
f29e85c66b39 drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
f1935b0459b1 drm/xe/ggtt: Add KUnit tests for usable and shareable pools
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 334 lines checked


