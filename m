Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8060A2611
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228610E705;
	Thu, 19 Nov 2026 20:11:43 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8328510E705;
 Thu, 19 Nov 2026 20:11:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 20:11:42 -0000
Message-ID: <179511910253.54226.5765969450535662275@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev20)
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
commit 6f10fca7526c173c56e99dbfb6c683959ace3967
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Thu Nov 19 07:54:57 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 859a3f2c44944276c49ab8d35f0ffd31b02b19c5 drm-intel
b266346ed64e platform/x86/intel/pmt: Introduce a callback for discovery data
38f3f9953099 platform/x86/intel/pmt: Use the pre-populated header info for crashlog
6c052382b859 drm/xe/vsec: VSEC requires soc-remapper
8618f558cf00 drm/xe/vsec: Do not register BMG PMT for VF
7015bcdfc2be drm/xe/vsec: Correct locking order
73f756e825b3 drm/xe/vsec: Use correct pm state get
df11c2fb7277 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
5a2ecaaf58eb drm/xe/vsec: Support possible hotplug exit
0a86c366a623 drm/xe/vsec: Refactor BattleMage PMT defines
831e2615816e drm/xe/vsec: Update VSEC probe order
a28d729cb407 drm/xe/vsec: Add base_offset to allow for more flexibilty
c426f80de81b drm/xe/vsec: Support Crescent Island PMT
d0de1183e4c6 drm/xe/vsec: Crescent Island PMT decode
85364f3ae82b drm/xe/vsec: Crescent Island PMT callbacks
a1ea785791c4 drm/xe/vsec: Support late bind fw information
941e25ce3c0d drm/xe/vsec: Add PMT GUID internal access
8d0cbb664242 drm/xe/vsec: Update PMT internal access
900ba243bed3 drm/xe/vsec: Refactor platform check
6f10fca7526c drm/xe/vsec: Support survivability mode for CRI


