Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5DC54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 07:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85CE96CDB;
	Thu, 22 May 2025 07:20:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6E299854;
 Thu, 22 May 2025 07:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/9=5D_iosys-map=3A_add_new_accessor_interfaces_and_use_them_inter?=
 =?utf-8?q?nally=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 07:20:33 -0000
Message-ID: <174789843383.12503.16269321370448576823@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522065519.318013-1-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
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

Series: series starting with [1/9] iosys-map: add new accessor interfaces and use them internally.
URL   : https://patchwork.freedesktop.org/series/149367/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8bc1c198eb5eb298ab50bcc4a30101489a29ea33
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu May 22 16:52:18 2025 +1000

    iosys_map: embed the is_iomem bit into the pointer.
    
    This reduces this struct from 16 to 8 bytes, and it gets embedded
    into a lot of things.
    
    Signed-off-by: Dave Airlie <airlied@redhat.com>
+ /mt/dim checkpatch 09130f929f7c79440cc8890bcce976843f439f01 drm-intel
93ca1ec74532 iosys-map: add new accessor interfaces and use them internally.
-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: include/linux/iosys-map.h:129:
+       return map->vaddr;$

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
646df55e4311 udmabuf: use new iosys_map accessors.
b856280fd799 firmware/tegra: avoid accessing iosys_map internals.
9dd7637632f3 drm/xe: avoid accessing internals of iosys_map
9bcf92ad70ef drm/qxl: avoid accessing iosys_map internals.
ae5ba27c421b drm/ttm: avoid accessing iosys_map internals.
e379757ce5a7 drm: avoid accessing iosys_map internals.
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
This avoids directly accessing the iosys_map internals using new interfaces.

-:98: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#98: FILE: drivers/gpu/drm/drm_format_helper.c:241:
+					  iosys_map_ptr(&src[0]), fb, clip, vaddr_cached_hint, state,

total: 0 errors, 2 warnings, 0 checks, 211 lines checked
0c3dba69aea2 iosys: hide internal details of implementation.
-:43: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#43: FILE: include/linux/iosys-map.h:129:
+       return map->_vaddr;$

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
8bc1c198eb5e iosys_map: embed the is_iomem bit into the pointer.
-:62: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#62: FILE: include/linux/iosys-map.h:145:
+		._vaddr_iomem = (void __iomem *)(((unsigned long)(vaddr_iomem_) | _IOSYS_MAP_IS_IOMEM)), \

total: 0 errors, 1 warnings, 0 checks, 91 lines checked


