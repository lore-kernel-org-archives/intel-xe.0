Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83659606A330
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4285B10E95A;
	Tue, 10 Nov 2026 18:42:32 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A961410E95A;
 Tue, 10 Nov 2026 18:42:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 18:42:31 -0000
Message-ID: <179433615168.4939.16752273898181102740@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
In-Reply-To: <20261110183505.694124-19-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev16)
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
commit 213cba3f46b62cfd67208a03aa00db9ee52273b4
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Nov 10 10:35:22 2026 -0800

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch c8d0fb6110b86aa64eb59502df08b529e221f232 drm-intel
4df1ca654981 drm/xe/vsec: VSEC requires soc-remapper
c269ceaeceaf drm/xe/vsec: Do not register BMG PMT for VF
3ab77a9b4a4a drm/xe/vsec: Correct locking order
b2c810a9f9b5 drm/xe/vsec: Use correct pm state get
120740bc10d7 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
6092bc0a6475 drm/xe/vsec: Support possible hotplug exit
e0790beba2ff drm/xe/vsec: Refactor BattleMage PMT defines
ffb3846803bc drm/xe/vsec: Update VSEC probe order
412af1e7c621 drm/xe/vsec: Add base_offset to allow for more flexibilty
55beb172b1aa drm/xe/vsec: Support Crescent Island PMT
1a2da489816a drm/xe/vsec: Crescent Island PMT decode
5d18868be5f9 drm/xe/vsec: Crescent Island PMT callbacks
868c5e7a8498 drm/xe/vsec: Support late bind fw information
-:277: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#277: FILE: drivers/gpu/drm/xe/xe_vsec.c:624:
+			queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));

total: 0 errors, 0 warnings, 1 checks, 269 lines checked
d6c2e5a8ec71 drm/xe/vsec: Add PMT GUID internal access
106f7d7665c7 drm/xe/vsec: Update PMT internal access
519881245800 drm/xe/vsec: Refactor platform check
213cba3f46b6 drm/xe/vsec: Support survivability mode for CRI


