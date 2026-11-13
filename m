Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5C606B460
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 17:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C5410E533;
	Fri, 13 Nov 2026 17:53:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3410E533;
 Fri, 13 Nov 2026 17:53:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev17=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 17:53:20 -0000
Message-ID: <179459240044.21881.13112724903166327147@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113165127.1989471-19-michael.j.ruhl@intel.com>
In-Reply-To: <20261113165127.1989471-19-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev17)
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
commit ce5473821d9c9ed732099019e015eaf03b55d75d
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri Nov 13 08:51:43 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch eab65769b90f4957759eac53d9e22b9fa4312f60 drm-intel
9aeec7b93342 drm/xe/vsec: VSEC requires soc-remapper
990311e6421b drm/xe/vsec: Do not register BMG PMT for VF
d7a60ece6f37 drm/xe/vsec: Correct locking order
f953e805269f drm/xe/vsec: Use correct pm state get
982e7472ae3d drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
feea628e389b drm/xe/vsec: Support possible hotplug exit
864e8bd39840 drm/xe/vsec: Refactor BattleMage PMT defines
5cca428d53e7 drm/xe/vsec: Update VSEC probe order
796888295c62 drm/xe/vsec: Add base_offset to allow for more flexibilty
0bb2586ef01c drm/xe/vsec: Support Crescent Island PMT
6b9c850cfe05 drm/xe/vsec: Crescent Island PMT decode
35d24f7acff4 drm/xe/vsec: Crescent Island PMT callbacks
0c51260e5237 drm/xe/vsec: Support late bind fw information
a3c9c4c18adb drm/xe/vsec: Add PMT GUID internal access
0c2727f27be8 drm/xe/vsec: Update PMT internal access
3d3ef8507167 drm/xe/vsec: Refactor platform check
ce5473821d9c drm/xe/vsec: Support survivability mode for CRI


