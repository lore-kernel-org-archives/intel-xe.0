Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12142606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF53110E1B3;
	Fri, 20 Nov 2026 05:31:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9B10E1B3;
 Fri, 20 Nov 2026 05:31:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev21=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 05:31:02 -0000
Message-ID: <179515266277.56845.11568882600427253557@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev21)
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
commit b0a196e88d443b8838169bbae210da0f0f1f1745
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Thu Nov 19 18:19:49 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 9bf864cd53c8e7651a038b9be01b2b0dfc67b420 drm-intel
da3c16c0c884 platform/x86/intel/pmt: Introduce a callback for discovery data
c5d8a566d15b platform/x86/intel/pmt: Use the pre-populated header info for crashlog
4614781c3d56 drm/xe/vsec: VSEC requires soc-remapper
d2430e9c276d drm/xe/vsec: Do not register BMG PMT for VF
cae3d78f18b5 drm/xe/vsec: Correct locking order
948dd4872588 drm/xe/vsec: Use correct pm state get
e702dd260929 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
9b3e42c871cb drm/xe/vsec: Support possible hotplug exit
8a1c1d214f41 drm/xe/vsec: Refactor BattleMage PMT defines
95ef50907283 drm/xe/vsec: Update VSEC probe order
1fcb071c0baf drm/xe/vsec: Add base_offset to allow for more flexibilty
d83ead31a676 drm/xe/vsec: Support Crescent Island PMT
37a6531c1d87 drm/xe/vsec: Crescent Island PMT decode
73207f2bdb0b drm/xe/vsec: Crescent Island PMT callbacks
d82c6e972bf7 drm/xe/vsec: Support late bind fw information
7fc063261a6d drm/xe/vsec: Add PMT GUID internal access
b67aa4887dec drm/xe/vsec: Update PMT internal access
797060645947 drm/xe/vsec: Refactor platform check
b0a196e88d44 drm/xe/vsec: Support survivability mode for CRI


