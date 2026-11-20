Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9448606A69C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FCD10E151;
	Fri, 20 Nov 2026 21:04:22 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4510E151;
 Fri, 20 Nov 2026 21:04:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev22=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 21:04:21 -0000
Message-ID: <179520866156.62267.7288430854551723323@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev22)
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
commit bc5f887b0b6dff63d7cc274bbc46c500f5b7c54c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri Nov 20 12:55:59 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch d706b8b5a4276d637251224ed2d5ff30a982fa0a drm-intel
ae0e85201e9d platform/x86/intel/pmt: Introduce a callback for discovery data
c1a8863683fc platform/x86/intel/pmt: Use the pre-populated header info for crashlog
8dff2e58938a drm/xe/vsec: VSEC requires soc-remapper
7493fc8d3f18 drm/xe/vsec: Do not register BMG PMT for VF
e2b63989a29a drm/xe/vsec: Correct locking order
46a8ea4db271 drm/xe/vsec: Use correct pm state get
2472332d4f0a drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
fd3d3522c88e drm/xe/vsec: Support possible hotplug exit
f54803c8b3fb drm/xe/vsec: Refactor BattleMage PMT defines
a86e5542fe5f drm/xe/vsec: Update VSEC probe order
3c9892d3906b drm/xe/vsec: Add base_offset to allow for more flexibilty
731344c36c05 drm/xe/vsec: Support Crescent Island PMT
d4c6bc54f639 drm/xe/vsec: Crescent Island PMT decode
33e4a140d825 drm/xe/vsec: Crescent Island PMT callbacks
4101c88fbbc8 drm/xe/vsec: Support late bind fw information
ca970ab63976 drm/xe/vsec: Add PMT GUID internal access
d7a5e3356f55 drm/xe/vsec: Update PMT internal access
935a70e33968 drm/xe/vsec: Refactor platform check
bc5f887b0b6d drm/xe/vsec: Support survivability mode for CRI


