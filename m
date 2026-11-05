Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB5606A329
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD15810E02C;
	Thu,  5 Nov 2026 16:17:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514D710E02C;
 Thu,  5 Nov 2026 16:17:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/pci=3A_Allow_hiding_?=
 =?utf-8?q?BAR_ranges_from_the_VFIO_user?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 16:17:39 -0000
Message-ID: <179389545932.127439.13498085484860150140@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105153738.1938345-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261105153738.1938345-1-piotr.piorkowski@intel.com>
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

Series: vfio/pci: Allow hiding BAR ranges from the VFIO user
URL   : https://patchwork.freedesktop.org/series/177877/
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
commit fe79c0d5107aeaf7130c1a68decfa1995e9c1eb9
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Thu Nov 5 16:37:38 2026 +0100

    vfio/xe: Hide BAR ranges by default per device ID
    
    xe-vfio-pci accesses the BARs only through vfio-pci-core, so opt in to
    hidden BAR ranges.
    
    Let each entry of the PCI ID table describe the ranges to hide by
    default. The description is always looked up in the static table, so
    binding through new_id or driver_override can't skip them.
    
    No device defines any ranges yet.
    
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Alex Williamson <alex@shazbot.org>
    Cc: Jason Gunthorpe <jgg@ziepe.ca>
    Cc: Yishai Hadas <yishaih@nvidia.com>
    Cc: Shameer Kolothum <skolothumtho@nvidia.com>
    Cc: Kevin Tian <kevin.tian@intel.com>
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 drm-intel
7ae78f270ddf vfio/pci: Move the excluded range handling out of vfio_pci_core_do_io_rw()
c0c72bc85a34 vfio/pci: Allow hiding BAR ranges from the VFIO user
-:142: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#142: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 580 lines checked
a823e0e3a659 vfio/pci: Allow configuring hidden BAR ranges through configfs
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 580 lines checked
fe79c0d5107a vfio/xe: Hide BAR ranges by default per device ID


