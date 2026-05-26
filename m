Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BF1CD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 04:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D28010E064;
	Tue, 26 May 2026 04:47:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF210E064;
 Tue, 26 May 2026 04:47:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 04:47:57 -0000
Message-ID: <177977087764.8063.10520744487110569206@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260520113351.171119-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260520113351.171119-7-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev6)
URL   : https://patchwork.freedesktop.org/series/163428/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 054fc887a3bbabf3a46e5807ccc295a59f892a62
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Wed May 20 17:03:57 2026 +0530

    drm/xe: Suppress Surprise Link Down on non-hotplug device
    
    A PUNIT (power management unit) error recovery on GPUs
    triggers a power cycle (cold reset). On platforms where
    the upstream port is not hotplug capable, the brief link drop
    caused by powering the device off and back on is reported
    by hardware as a Surprise Link Down (SLD), which AER then
    escalates as an Uncorrectable Fatal Error. That error fires
    before the device finishes coming back up and defeats the
    very recovery we are attempting.
    
    To keep the expected, recovery-induced link drop from being raised as
    a fatal AER event, mask the Surprise Link Down bit
    (PCI_ERR_UNC_SURPDN) in the upstream port's AER Uncorrectable Error
    Mask register before punit_error_handler() requests the cold reset.
    The mask is only applied when the slot is not hotplug capable.
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 6b6931ea69504481efd3df1cc99765141feb178c drm-intel
66a6540f6eb0 Introduce Xe Uncorrectable Error Handling
-:251: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#251: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1175 lines checked
0efe7e779ca4 drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
3ed33c9e19a5 drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
2085b3071695 drm/xe: Handle PUNIT errors by requesting cold-reset recovery
054fc887a3bb drm/xe: Suppress Surprise Link Down on non-hotplug device


