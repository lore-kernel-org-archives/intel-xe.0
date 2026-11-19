Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE914606A330
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FE910E837;
	Thu, 19 Nov 2026 20:57:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD6010E837;
 Thu, 19 Nov 2026 20:57:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fras=3A_Skip_g?=
 =?utf-8?q?pu=5Fhealth_sysfs_commands_during_reset_or_wedged?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 20:57:27 -0000
Message-ID: <179512184717.54510.10371687600298408210@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
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

Series: drm/xe/xe_ras: Skip gpu_health sysfs commands during reset or wedged
URL   : https://patchwork.freedesktop.org/series/179104/
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
commit 209736f63742155eb19df00592ff9029e2f3347b
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Date:   Thu Nov 19 22:09:13 2026 +0530

    drm/xe/xe_ras: Skip gpu_health sysfs commands during reset or wedged
    
    Accessing gpu_health sysfs attribute sends a command to the system
    controller. Add a guard to verify and skip if the device is wedged or in
    reset. It protects against touching the fw or device when it is not in
    usable state.
    
    Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
+ /mt/dim checkpatch 859a3f2c44944276c49ab8d35f0ffd31b02b19c5 drm-intel
209736f63742 drm/xe/xe_ras: Skip gpu_health sysfs commands during reset or wedged
-:27: CHECK:LINE_SPACING: Please don't use multiple blank lines
#27: FILE: drivers/gpu/drm/xe/xe_ras.c:1142:
+
+

total: 0 errors, 0 warnings, 1 checks, 23 lines checked


