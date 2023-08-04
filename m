Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3DBC00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409E910E124;
	Fri,  4 Aug 2023 20:38:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5618510E124;
 Fri,  4 Aug 2023 20:38:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 488D9AADD7;
 Fri,  4 Aug 2023 20:38:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Fri, 04 Aug 2023 20:38:26 -0000
Message-ID: <169118150629.2854.218442413979207365@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230804204422.2656586-1-oak.zeng@intel.com>
In-Reply-To: <20230804204422.2656586-1-oak.zeng@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Implement_HW_workaround_14016763929_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Implement HW workaround 14016763929 (rev2)
URL   : https://patchwork.freedesktop.org/series/121977/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a8b5e3ad57ac3ae6dd4171409d4485f97ee7a8b7
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Fri Aug 4 16:44:22 2023 -0400

    drm/xe: Implement HW workaround 14016763929
    
    To workaround a HW bug on DG2, driver is required to map the whole
    ppgtt virtual address space before GPU workload submission. Thus
    set the XE_VM_FLAG_SCRATCH_PAGE flag during vm create so the whole
    address space is mapped to point to scratch page.
    
    v1:
      - Move the workaround implementation from xe_vm_create to
        xe_vm_create_ioctl - Brian
      - Reorder error checking in xe_vm_create_ioctl - Jose
      - Implement WA only for DG2-G10 and DG2-G12
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch ccafbcc61fa532335db355b1bf8c2653c5938ced drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


