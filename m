Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D8606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 18:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B0910F3B9;
	Mon, 16 Nov 2026 18:36:22 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D263210F3AA;
 Mon, 16 Nov 2026 18:36:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev18=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 18:36:20 -0000
Message-ID: <179485418085.33881.3541717894726846470@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
In-Reply-To: <20261116150649.368686-19-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev18)
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
commit 45bb60ebf891132c9963cc7045b6bdbcbba6da9b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Mon Nov 16 07:07:06 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch d5a6e2921e68b0cc42812376ca6c8095b6c941a2 drm-intel
a229062fa416 drm/xe/vsec: VSEC requires soc-remapper
d989a23c7106 drm/xe/vsec: Do not register BMG PMT for VF
bb948214c559 drm/xe/vsec: Correct locking order
858c97e95b32 drm/xe/vsec: Use correct pm state get
b07c3bd6b7ce drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
e0bfec79bafb drm/xe/vsec: Support possible hotplug exit
b16cf6170359 drm/xe/vsec: Refactor BattleMage PMT defines
983f6599bac6 drm/xe/vsec: Update VSEC probe order
c15e73ab1ec5 drm/xe/vsec: Add base_offset to allow for more flexibilty
ab51d05068f7 drm/xe/vsec: Support Crescent Island PMT
c18f2fff883e drm/xe/vsec: Crescent Island PMT decode
983f99b469a0 drm/xe/vsec: Crescent Island PMT callbacks
3794cb888c6e drm/xe/vsec: Support late bind fw information
65ccd1ebf65a drm/xe/vsec: Add PMT GUID internal access
26a2a026af06 drm/xe/vsec: Update PMT internal access
bd00bc2622f0 drm/xe/vsec: Refactor platform check
45bb60ebf891 drm/xe/vsec: Support survivability mode for CRI


