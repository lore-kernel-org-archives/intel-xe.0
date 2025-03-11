Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3858C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 15:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8803D10E5B8;
	Tue, 11 Mar 2025 15:20:41 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3456410E5B8;
 Tue, 11 Mar 2025 15:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Catch_all_unexpecte?=
 =?utf-8?q?d_registers_accesses?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 15:20:40 -0000
Message-ID: <174170644021.19088.6517254165573523740@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250311135726.1998-1-michal.wajdeczko@intel.com>
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

Series: VF: Catch all unexpected registers accesses
URL   : https://patchwork.freedesktop.org/series/146140/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb99c7a5697af68c963c396fe9cc6a2addd3b645
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Mar 11 14:57:26 2025 +0100

    drm/xe/vf: Catch all unexpected register reads
    
    While we can only mimic read32 for a few GT registers for which
    the PF shared the values, we shouldn't avoid calling helper code
    if we try to access non-GT register, as then we miss to trigger
    a debug warning. For cases where sriov_vf_gt was not set, just
    use primary_gt instead.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f8df428b3850ed87a1e2f3b12b6025328d8a6373 drm-intel
25bf0c483f78 drm/xe/vf: Don't try Driver-FLR if VF
eb99c7a5697a drm/xe/vf: Catch all unexpected register reads


