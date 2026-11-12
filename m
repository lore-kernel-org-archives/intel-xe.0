Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22F606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BDF10E28E;
	Thu, 12 Nov 2026 14:57:59 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BB010E28E;
 Thu, 12 Nov 2026 14:57:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 14:57:58 -0000
Message-ID: <179449547807.16318.10118744910210701542@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112140126.1861005-1-raag.jadav@intel.com>
In-Reply-To: <20261112140126.1861005-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev16)
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
commit 5c211c6cdd7e9ce01b8dd951ab329364f500c5e6
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Nov 12 19:30:08 2026 +0530

    drm/xe/doc: Wire up PCI Error Handling
    
    Wire up PCI Error Handling documentation.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 8182671511e86bff6780533bce20c209a13dc8bb drm-intel
e8a1d7d8f13f drm/xe/uc_fw: Allow re-initializing firmware
f0d2200827c6 drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
dd1945be3a42 drm/xe/gt: Introduce FLR helpers
22a6b22c361e drm/xe/bo_evict: Introduce xe_bo_restore_map()
d1a9bbe3ff4a drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
f541df29a803 drm/xe/migrate: Introduce xe_migrate_reinit() and xe_cpu_bind_reinit()
49c99142c066 drm/xe/pm: Introduce xe_device_suspend/resume()
0220153ba78a drm/xe: Introduce temporary device wedging
bc7ae31c8121 drm/xe/pci: Introduce PCIe Function Level Reset
5c211c6cdd7e drm/xe/doc: Wire up PCI Error Handling
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


