Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B0606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8510E342;
	Wed, 18 Nov 2026 06:33:10 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40DA10E342;
 Wed, 18 Nov 2026 06:33:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/pcode=3A_Add_MEMORY=5FCONFIG_mailbox_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 06:33:09 -0000
Message-ID: <179498358979.41174.1545854445933106090@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
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

Series: series starting with [1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
URL   : https://patchwork.freedesktop.org/series/178849/
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
commit 61b2a7f38bf94aa400ab700cce31c8bfa43de604
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Nov 18 11:52:58 2026 +0530

    drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs
    
    Expose the maximum achievable memory frequency and bandwidth reported
    by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
    tile#/memory/max_bw_Mbps (Mbps) on Crescent Island.
    
    These are capability limits, not the current memory frequency or
    bandwidth usage. The existing PVC memory/freq0 entries are unchanged.
    
    Document both attributes in the Xe sysfs ABI.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 0249d68f50c265a0f17c06fc21906fda945fe2cf drm-intel
4fa041c2923a drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
3b319e654586 drm/xe: Rename xe_vram_freq to xe_vram_config
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
rename from drivers/gpu/drm/xe/xe_vram_freq.c

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
61b2a7f38bf9 drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs


