Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25665CA0EFD
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 16:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56CA10E4AD;
	Fri, 30 Aug 2024 16:35:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217AD10E3B3;
 Fri, 30 Aug 2024 16:35:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Apply_workaroun?=
 =?utf-8?q?d_14016747170_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan-Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 16:35:18 -0000
Message-ID: <172503571813.855157.18269787604433628689@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830161118.2055939-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240830161118.2055939-1-jonathan.cavitt@intel.com>
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

Series: drm/xe: Apply workaround 14016747170 (rev2)
URL   : https://patchwork.freedesktop.org/series/137977/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4a9615eee04d191f586aa85ccf49d42608f8a938
Author: Jonathan-Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Aug 30 09:11:18 2024 -0700

    drm/xe: Apply workaround 14016747170
    
    Some revisions of MTL do not properly report the correct value from the
    FUSE3_MBC_MEDIA register.  This results in the wrong value being
    reported for the l3 mask.
    
    Use the recommended replacement register in this case.
    
    Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
    CC: Matt Roper <matthew.d.roper@intel.com>
    CC: Jani Nikula <jani.nikula@linux.intel.com>
+ /mt/dim checkpatch 1836028c756d6d0c6f741b9a31b2549f06dc3e79 drm-intel
4a9615eee04d drm/xe: Apply workaround 14016747170


