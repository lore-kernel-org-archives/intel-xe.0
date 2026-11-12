Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E8606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63C10E555;
	Thu, 12 Nov 2026 09:18:39 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DA110E552;
 Thu, 12 Nov 2026 09:18:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 09:18:37 -0000
Message-ID: <179447511794.14516.8925605847297432292@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112091033.1813803-1-raag.jadav@intel.com>
In-Reply-To: <20261112091033.1813803-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev15)
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
commit 5929f8a6b29f81e86b2174720daca8970b0aa6b4
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Nov 12 14:39:49 2026 +0530

    drm/xe/doc: Wire up PCI Error Handling
    
    Wire up PCI Error Handling documentation.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 020bf044c3c299e9b0961753bf5f8b92c3b505ce drm-intel
5d00eba71997 drm/xe/uc_fw: Allow re-initializing firmware
c195d86a155a drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
66cb5cca4c22 drm/xe/gt: Introduce FLR helpers
32528d12441f drm/xe/bo_evict: Introduce xe_bo_restore_map()
91a225e06c32 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
ce08ff5f9847 drm/xe/migrate: Introduce xe_migrate_reinit() and xe_cpu_bind_reinit()
e8f1958df4f9 drm/xe/pm: Introduce xe_device_suspend/resume()
79f6ae3c34b7 drm/xe: Introduce temporary device wedging
131983f4b92c drm/xe/pci: Introduce PCIe Function Level Reset
5929f8a6b29f drm/xe/doc: Wire up PCI Error Handling
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


