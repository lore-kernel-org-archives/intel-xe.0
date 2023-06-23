Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB8AEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 02:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096EB10E5D0;
	Fri, 23 Jun 2023 02:58:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3826B10E5D2;
 Fri, 23 Jun 2023 02:58:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 02144A3ECB;
 Fri, 23 Jun 2023 02:58:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Fri, 23 Jun 2023 02:58:36 -0000
Message-ID: <168748911600.31833.1986840174195273776@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230623025547.31281-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230623025547.31281-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Disable_FPU_Residue?=
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

Series: drm/xe/pvc: Disable FPU Residue
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
commit f59afb13fce7ee6ff16e915e4ff96405e559825a
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu Jun 22 19:55:47 2023 -0700

    drm/xe/pvc: Disable FPU Residue
    
    To reduce the power consumption disable FPU residue on some specific
    devices if total EUs are 1024.
    
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 4287d7a61a8f6b40e4f99055870b1239d8439050 drm-intel
f59afb13f drm/xe/pvc: Disable FPU Residue


