Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427EC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 17:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630BF10E2BA;
	Tue, 14 May 2024 17:00:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4610E2BA;
 Tue, 14 May 2024 17:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Don=27t_adve?=
 =?utf-8?q?rtise_support_to_enable_VFs_if_not_ready_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 May 2024 17:00:46 -0000
Message-ID: <171570604646.2115685.2626766485043455729@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240507165757.2835-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Don't advertise support to enable VFs if not ready (rev2)
URL   : https://patchwork.freedesktop.org/series/133289/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a01c20a0f5a2c573a5e305f69f74e3e5006b193
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 7 18:57:57 2024 +0200

    drm/xe/pf: Don't advertise support to enable VFs if not ready
    
    Even if we have not enabled SR-IOV support using the platform
    specific has_sriov flag, the hardware may still report SR-IOV
    capability and the PCI layer may wrongly advertise driver support
    to enable VFs.  Explicitly reset the number of supported VFs to
    zero to avoid confusion.
    
    Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
    prior to enabling VFs using the sriov_numvfs to check if such an
    operation is possible.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch a0c161037de0a89c0a9ea744f60099a4f94cc123 drm-intel
5a01c20a0f5a drm/xe/pf: Don't advertise support to enable VFs if not ready


