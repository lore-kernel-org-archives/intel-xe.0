Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88897606A333
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 01:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1910E75C;
	Tue,  3 Nov 2026 01:37:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DACF10E75C;
 Tue,  3 Nov 2026 01:37:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_topic/xe-for-CI=3A_update?=
 =?utf-8?q?_GuC_for_CRI_and_NVL-P_to_70=2E83=2E0_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 01:37:53 -0000
Message-ID: <179366987350.107880.7207566919923928667@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
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

Series: topic/xe-for-CI: update GuC for CRI and NVL-P to 70.83.0 (rev2)
URL   : https://patchwork.freedesktop.org/series/177482/
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
commit 83ee4e85017ecb74ab11e658e683fd3f9f76fd5c
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Nov 2 16:38:45 2026 +0000

    topic/xe-for-CI: Define GuC firmware for NVL-P
    
    Novalake P has different IP on each GT and requires a different GuC
    for each. So add separate graphics and media GT entries or NVL-P.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7235
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Link: https://patch.msgid.link/20260202-nvl-p-upstreaming-v1-16-653e4ff105dc@intel.com
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Link: https://patch.msgid.link/20260529193558.185436-14-daniele.ceraolospurio@intel.com
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Link: https://patch.msgid.link/20260618222536.3351750-14-julia.filipchuk@intel.com
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Acked-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 0f5e7199aaceed05aa49dad4c97df2677e32f779 drm-intel
9a67b4c73ca0 Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
-:21: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 8 lines checked
bcdddda33c1d Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:21: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 7 lines checked
4eb32b61d61c topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
-:21: WARNING:BAD_SIGN_OFF: Duplicate signature
#21: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
83ee4e85017e topic/xe-for-CI: Define GuC firmware for NVL-P
-:22: WARNING:BAD_SIGN_OFF: Duplicate signature
#22: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:24: WARNING:BAD_SIGN_OFF: Duplicate signature
#24: 
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


