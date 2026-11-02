Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C4606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CBD10E6E3;
	Mon,  2 Nov 2026 22:49:01 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20C10E6E3;
 Mon,  2 Nov 2026 22:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 22:49:00 -0000
Message-ID: <179365974083.106923.15505050463275664825@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
In-Reply-To: <20261102221314.119028-18-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev15)
URL   : https://patchwork.freedesktop.org/series/160717/
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
commit 7118464c02e38583572f0f5551d4e234b4120252
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Mon Nov 2 14:13:28 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 250a6b22eabe84f32114c55e0ad4c271bfe573b3 drm-intel
5397d7481488 drm/xe/vsec: Do not register BMG PMT for VF
1f73e8c70cbf drm/xe/vsec: Correct locking order
3297c5789cf1 drm/xe/vsec: Use correct pm state get
260ee0dcc2c8 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
ac4840e09f62 drm/xe/vsec: Support possible hotplug exit
f1b9746117f1 drm/xe/vsec: Refactor BattleMage PMT defines
2ef31832d85d drm/xe/vsec: Update VSEC probe order
cbe9eab54c34 drm/xe/vsec: Add base_offset to allow for more flexibilty
29054e6934af drm/xe/vsec: Support Crescent Island PMT
4457c042482c drm/xe/vsec: Crescent Island PMT decode
b8ed8f40df19 drm/xe/vsec: Crescent Island PMT callbacks
712e68e86fd8 drm/xe/vsec: Support late bind fw information
ad4df6a96ac1 drm/xe/vsec: Add PMT GUID internal access
3b1ea93cc9ee drm/xe/vsec: Update PMT internal access
f7d8b0feb4c3 drm/xe/vsec: Refactor platform check
7118464c02e3 drm/xe/vsec: Support survivability mode for CRI


