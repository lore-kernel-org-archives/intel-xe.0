Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EAACAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 08:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B673110E06F;
	Mon,  6 Oct 2025 08:57:22 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D25B10E06F;
 Mon,  6 Oct 2025 08:57:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/=3A_Mutual_Exclusi?=
 =?utf-8?q?vity_b/w_Multi_CCS_Mode_=26_SRIOV_VF_Provisioning_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 08:57:21 -0000
Message-ID: <175974104137.7007.669792404921297284@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006084542.1302116-2-naresh.kumar.g@intel.com>
In-Reply-To: <20251006084542.1302116-2-naresh.kumar.g@intel.com>
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

Series: drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF Provisioning (rev4)
URL   : https://patchwork.freedesktop.org/series/154538/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9f1e15b7984ecd9c1c9a4410349a7c1e07b5aa3d
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Mon Oct 6 14:15:43 2025 +0530

    drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF Provisioning
    
    Due to SLA agreement between PF and VFs, multi CCS mode can't
    be enabled when VFs are already enabled.
    Similarly, enabling VFs is disabled when multi CCS mode enabled.
+ /mt/dim checkpatch 8ad3832e11cc44823fc35aa6d36f7e76d69e4791 drm-intel
9f1e15b7984e drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF Provisioning
-:109: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 76 lines checked


