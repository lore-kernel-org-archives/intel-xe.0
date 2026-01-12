Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE8ACF45C1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0AC10E2B0;
	Mon, 12 Jan 2026 18:14:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B91510E437;
 Mon, 12 Jan 2026 18:14:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E55=2E3_for_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jan 2026 18:14:10 -0000
Message-ID: <176824165037.147285.13379784570672663180@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260112180809.1474677-9-julia.filipchuk@intel.com>
In-Reply-To: <20260112180809.1474677-9-julia.filipchuk@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Recommend GuC v70.55.3 for BMG, PTL
URL   : https://patchwork.freedesktop.org/series/159975/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2dcf68aeb553d9d9eb85fa5c3fe2604ace946f61
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Mon Jan 12 10:07:42 2026 -0800

    topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
    
    Define GuC firmware, still using the mpp version that is intended to be
    merged only to help with the platform enabling in topic/for-xe-CI.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
    Link: https://lore.kernel.org/r/20260108181956.1254908-10-julia.filipchuk@intel.com
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 630dc29de423d3640e7b2ee4a7125e0433d9eb7f drm-intel
51ebd5322418 Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
57370576fcfd Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
e41701310813 Revert "drm/xe/pvc: Add GuC firmware definition"
dc1fcbbc11ce drm/xe/guc: Recommend GuC v70.55.3 for BMG,PTL
44aed82d65ce drm/xe/pvc: Add GuC firmware definition
-:17: WARNING:BAD_SIGN_OFF: Duplicate signature
#17: 
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
6ea2aa7c1f1a drm/xe/nvls: Define GuC firmware for NVL-S
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
2dcf68aeb553 topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


