Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC59FC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 19:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909A110E193;
	Fri, 17 Jan 2025 19:48:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E9310E193;
 Fri, 17 Jan 2025 19:48:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Fix_docume?=
 =?utf-8?q?ntation_indentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 19:48:05 -0000
Message-ID: <173714328516.820769.8079656860733124475@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117193827.91779-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250117193827.91779-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/uapi: Fix documentation indentation
URL   : https://patchwork.freedesktop.org/series/143689/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5b91350cf3cbe3c71dac077f16f1d0a9d8b92b3f
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Jan 17 14:38:27 2025 -0500

    drm/xe/uapi: Fix documentation indentation
    
    Fix these issues:
    
    Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817: WARNING:
    +Bullet list ends without a blank line; unexpected unindent.
    Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835: WARNING:
    +Definition list ends without a blank line; unexpected unindent.
    
    Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory
    barrier")
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Closes: https://lore.kernel.org/intel-xe/20250117164023.3fdc00b9@canb.auug.org.au/
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch db09bf4e722f65089b91798e6d490d21b8dd8143 drm-intel
5b91350cf3cb drm/xe/uapi: Fix documentation indentation
-:13: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory barrier")'
#13: 
Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory

total: 0 errors, 1 warnings, 0 checks, 47 lines checked


