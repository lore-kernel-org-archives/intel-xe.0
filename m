Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57459EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 07:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C710E2D7;
	Tue, 18 Jul 2023 07:18:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A333310E2D9;
 Tue, 18 Jul 2023 07:18:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9E60DA7DFB;
 Tue, 18 Jul 2023 07:18:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 18 Jul 2023 07:18:35 -0000
Message-ID: <168966471564.22205.9087934918334421688@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718071612.15929-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230718071612.15929-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Disable_FPU_Residue_=28rev3=29?=
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

Series: drm/xe/pvc: Disable FPU Residue (rev3)
URL   : https://patchwork.freedesktop.org/series/119778/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d4fd90f3f7cf265e85a782db2b6b7f16f885e929
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Jul 18 00:16:12 2023 -0700

    drm/xe/pvc: Disable FPU Residue
    
    To reduce the power consumption disable FPU residue on some specific
    devices if total EUs are 1024.
    
    v2: Minor cleanups (Matt)
    
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch a43fd52b7ab2009631518ead5ca0afe9bc44515a drm-intel
d4fd90f3f drm/xe/pvc: Disable FPU Residue


