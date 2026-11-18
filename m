Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF6606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 00:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043CE89261;
	Wed, 18 Nov 2026 00:02:07 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484E89261;
 Wed, 18 Nov 2026 00:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/gsc=3A_Define_GSC_firmware_for_NVL-P_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 00:02:05 -0000
Message-ID: <179496012540.40341.13962674673443568558@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
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

Series: series starting with [1/2] drm/xe/gsc: Define GSC firmware for NVL-P (rev2)
URL   : https://patchwork.freedesktop.org/series/178746/
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
commit 6746e761b9228ec8562e3539c433f6d3eb91a947
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Nov 17 00:25:31 2026 +0000

    drm/xe/pxp: Enable PXP for NVL-P
    
    Now that GSC is in place, we can enable PXP for NVL-P. No changes
    required compared to previous platforms.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 6faeea4d5058d20e3a6e7edba8c13e4918636cd9 drm-intel
61939abee48e drm/xe/gsc: Define GSC firmware for NVL-P
-:39: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#39: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:791:
+			err = -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
6746e761b922 drm/xe/pxp: Enable PXP for NVL-P


