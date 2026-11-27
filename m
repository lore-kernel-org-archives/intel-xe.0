Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB3606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46D10E40B;
	Fri, 27 Nov 2026 06:58:44 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F010E40B;
 Fri, 27 Nov 2026 06:58:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Process_AMC_alert?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 06:58:41 -0000
Message-ID: <179576272137.97449.1625797902547923208@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
In-Reply-To: <20261127061333.1019047-7-badal.nilawar@intel.com>
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

Series: Process AMC alert
URL   : https://patchwork.freedesktop.org/series/179823/
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
commit ae85be9d754030f3468ba62aa5088f5a55136f23
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Nov 27 11:43:39 2026 +0530

    drm/xe: Request vendor recovery for AMC firmware download alert
    
    AMC reports a firmware download alert when a device firmware update is
    in progress. Request vendor-specific recovery so userspace can identify
    the alert reason and perform the documented recovery.
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 17f7eb2368b0eed1dfda22b10966fa181d9b2c83 drm-intel
0b5e769ecc57 drm/xe: Request cold-reset recovery on AMC thermal trip alert
2eda2fed21f2 drm/xe: Request cold-reset recovery on AMC OOB request alert
92dbb7ad2851 drm/xe: Request cold-reset recovery on AMC CATERR alert
1cd2a9f181b5 drm/xe/i2c: Expose AMC alert reason through sysfs
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
ae85be9d7540 drm/xe: Request vendor recovery for AMC firmware download alert


