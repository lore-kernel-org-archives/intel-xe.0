Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1506AC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 20:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3810E6F3;
	Fri, 11 Aug 2023 20:07:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BF9F10E6F3;
 Fri, 11 Aug 2023 20:07:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 587A1AADEC;
 Fri, 11 Aug 2023 20:07:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Fri, 11 Aug 2023 20:07:46 -0000
Message-ID: <169178446635.3117.8240724952651735544@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230811193923.132091-1-oak.zeng@intel.com>
In-Reply-To: <20230811193923.132091-1-oak.zeng@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Make_xe=5Fmem=5Fregion_s?=
 =?utf-8?q?truct?=
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

Series: series starting with [1/2] drm/xe: Make xe_mem_region struct
URL   : https://patchwork.freedesktop.org/series/122363/
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
commit ebefcfcfc6e469a2fe76289a3187e2f90cc47faf
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Fri Aug 11 15:39:23 2023 -0400

    drm/xe: Improve vram info debug printing
    
    Print both device physical address range and CPU io range
    of vram. Also print vram's actual size, usable size excluding
    stolen memory, and CPU io accessible size.
    V1:
      - Add back small BAR device info (Matt)
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
    Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 77329b232e1acc6eeb079a67720b6f837516cb07 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


