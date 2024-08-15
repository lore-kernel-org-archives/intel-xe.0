Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBBEC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4950510E47D;
	Thu, 15 Aug 2024 16:33:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF9810E47C;
 Thu, 15 Aug 2024 16:33:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/oa=3A_Replace_per_GT_oa_mutex_per_a_global_one?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 16:33:50 -0000
Message-ID: <172373963010.651910.836541314323119095@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815162758.36495-1-jose.souza@intel.com>
In-Reply-To: <20240815162758.36495-1-jose.souza@intel.com>
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

Series: series starting with [1/3] drm/xe/oa: Replace per GT oa mutex per a global one
URL   : https://patchwork.freedesktop.org/series/137346/
State : warning

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
commit 02e84b8d1f33bd413c5c1091a908b77e261ad675
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Aug 15 09:27:58 2024 -0700

    drm/xe/oa: Destroy dangling oa streams when xe_file is removed
    
    If an application opens an oa stream and for whatever reason it don't
    close the stream the oa unit associeted with it will never be release,
    so no other application can use it.
    The only workaround was to unload the driver or reboot.
    
    So here adding a list of oa stream and and when a xe_file is closed
    it will also destroy all oa stream with the same xe_file.
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 605ddd8291e28723254dccbc74fc93c32c274def drm-intel
a6bf60eb43a7 drm/xe/oa: Replace per GT oa mutex per a global one
-:89: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#89: FILE: drivers/gpu/drm/xe/xe_oa_types.h:150:
+	struct mutex streams_lock;

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
15122bb248c4 drm/xe/oa: Remove the drm device reference of oa_stream in xe_oa_destroy_locked()
02e84b8d1f33 drm/xe/oa: Destroy dangling oa streams when xe_file is removed
-:15: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#15: 
So here adding a list of oa stream and and when a xe_file is closed

total: 0 errors, 1 warnings, 0 checks, 104 lines checked


