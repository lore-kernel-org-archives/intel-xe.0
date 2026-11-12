Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C1606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77810E149;
	Thu, 12 Nov 2026 21:42:25 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381B810E149;
 Thu, 12 Nov 2026 21:42:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Set_up_for_debug_configfs?=
 =?utf-8?q?_group?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 21:42:24 -0000
Message-ID: <179451974422.17297.3895713957105741592@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112213508.457213-10-stuart.summers@intel.com>
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
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

Series: Set up for debug configfs group
URL   : https://patchwork.freedesktop.org/series/178440/
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
commit 5c1d4e0c3c180126d73edf78e99987c0a899cdfb
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu Nov 12 21:35:13 2026 +0000

    drm/xe: Add a new debug focused configfs group
    
    Add the skeleton code for a new debug specific configfs group.
    Just add the structure for now. Actual debug content will be
    added in a subsequent patch.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 4b7f549c713601ea1dabb0b949ab3b3d883e49ca drm-intel
6c370e434ebe drm/xe: Guard configfs attribute reads in getters
24cbe908295b drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
2d7669aebfa8 drm/xe/configfs: Copy wa_bb out under the configfs lock
398b04b3018b drm/xe: Invert vram_page_offline configfs attribute
35d0ff32c824 drm/xe: Make survivability_mode configfs attribute a bitmap
4206594c36f2 drm/xe: Sort xe_config_device fields
011fc1fa8f6b drm/xe: Split out configfs data structures
-:100: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#100: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 124 lines checked
5c1d4e0c3c18 drm/xe: Add a new debug focused configfs group
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked


