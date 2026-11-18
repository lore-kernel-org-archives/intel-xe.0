Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485D606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 23:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA03710ECF3;
	Wed, 18 Nov 2026 23:19:50 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096C210E2EB;
 Wed, 18 Nov 2026 23:19:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expose_CRI_memo?=
 =?utf-8?q?ry_capability_limits_via_sysfs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 23:19:49 -0000
Message-ID: <179504398903.46520.2823732982518585621@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261118172458.316603-1-naresh.kumar.g@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Expose CRI memory capability limits via sysfs (rev4)
URL   : https://patchwork.freedesktop.org/series/178852/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c282fb15e0e54f7be5ec9cec46eb1f1aa36a6f49
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Nov 18 22:54:54 2026 +0530

    drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs
    
    Expose the maximum achievable memory frequency and bandwidth reported
    by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
    tile#/memory/max_bw on Crescent Island.
    
    These are capability limits, not the current memory frequency or
    bandwidth usage. The existing PVC memory/freq0 entries are unchanged.
    
    Document both attributes in the Xe sysfs ABI.
    
    v2:(Sashiko)
    1. Fixed CFI violation by updating attribute types and callback signatures
    2. Added a check for xe->info.skip_pcode in memory_groups() to prevent
       exposing these attributes on Virtual Functions,
       where PCODE access is disabled.
    3. Changed kernel version in documentation from 7.4 to 7.5(Badal)
    
    v3:
    1. The device_uid version was reverted to the previous value
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 48995c76e90141a4e72ceafeb3762d4a3580eeef drm-intel
a9bfcd1a99c4 drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
7281a004e887 drm/xe: Rename xe_vram_freq to xe_vram_config
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
rename from drivers/gpu/drm/xe/xe_vram_freq.c

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
c282fb15e0e5 drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs


