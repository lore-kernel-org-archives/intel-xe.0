Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C895606A335
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 03:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5334910E68C;
	Thu, 19 Nov 2026 03:55:29 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9659810E68C;
 Thu, 19 Nov 2026 03:55:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev19=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 03:55:28 -0000
Message-ID: <179506052860.48287.10418053803092705053@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118222127.3550266-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261118222127.3550266-21-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev19)
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
commit 8214e743f6028e6f86add9fe868a76c767043e66
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Wed Nov 18 14:21:46 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch ce3179725e3c265703bc49afce4b70ee8a08c0cf drm-intel
99c073600735 platform/x86/intel/pmt: Introduce a callback for discovery data
ae8428ad2ff7 platform/x86/intel/pmt: Use the pre-populated header info for crashlog
5e20eb7bed10 drm/xe/vsec: VSEC requires soc-remapper
33684ebd1441 drm/xe/vsec: Do not register BMG PMT for VF
795ac2238741 drm/xe/vsec: Correct locking order
0167760f9946 drm/xe/vsec: Use correct pm state get
d81a99887502 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
478fafce1c34 drm/xe/vsec: Support possible hotplug exit
1df97b581bda drm/xe/vsec: Refactor BattleMage PMT defines
df027b749992 drm/xe/vsec: Update VSEC probe order
144140ab445d drm/xe/vsec: Add base_offset to allow for more flexibilty
77f492dab362 drm/xe/vsec: Support Crescent Island PMT
ebab8b04410e drm/xe/vsec: Crescent Island PMT decode
e7ba7fc4579f drm/xe/vsec: Crescent Island PMT callbacks
fb8b0099381a drm/xe/vsec: Support late bind fw information
-:273: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#273: FILE: drivers/gpu/drm/xe/xe_vsec.c:696:
+
+}

total: 0 errors, 0 warnings, 1 checks, 239 lines checked
23403016a860 drm/xe/vsec: Add PMT GUID internal access
b7cd30d47784 drm/xe/vsec: Update PMT internal access
ec8bb4624790 drm/xe/vsec: Refactor platform check
8214e743f602 drm/xe/vsec: Support survivability mode for CRI


