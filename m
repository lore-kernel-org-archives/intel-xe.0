Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6E606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 08:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6522F10E385;
	Fri,  6 Nov 2026 08:13:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06B10E385;
 Fri,  6 Nov 2026 08:13:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 08:13:34 -0000
Message-ID: <179395281424.130592.15923563333103331636@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106073921.1512530-1-raag.jadav@intel.com>
In-Reply-To: <20261106073921.1512530-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev14)
URL   : https://patchwork.freedesktop.org/series/162055/
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
commit 5e7335a85babe2b068e772e7bd0fdb412d7ed07a
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Nov 6 13:08:51 2026 +0530

    drm/xe/doc: Wire up PCI Error Handling
    
    Wire up PCI Error Handling documentation.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch a3e19d73c21539b24a45ced208247913ae622bab drm-intel
37a4fcaff70a drm/xe/uc_fw: Allow re-initializing firmware
ac04f8f3cebb drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
f25d0df4958e drm/xe/gt: Introduce FLR helpers
dee0cab8a4cf drm/xe/bo_evict: Introduce xe_bo_restore_map()
72ddf02a5318 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
ac06c0c10bf9 drm/xe/migrate: Introduce xe_migrate_reinit() and xe_cpu_bind_reinit()
46bc251b7f70 drm/xe/pm: Introduce xe_device_suspend/resume()
24ed8d2d7120 drm/xe: Introduce temporary device wedging
efe4c8ad4c3d drm/xe/pci: Introduce PCIe Function Level Reset
5e7335a85bab drm/xe/doc: Wire up PCI Error Handling
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


