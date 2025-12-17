Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4310D64071
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 03:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F910E27E;
	Wed, 17 Dec 2025 03:55:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AC310E27E;
 Wed, 17 Dec 2025 03:55:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_drm/xe=3A_Separ?=
 =?utf-8?q?ate_out_GuC_RC_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 03:55:31 -0000
Message-ID: <176594373155.95861.6116573448248886992@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: drm/xe: Separate out GuC RC code
URL   : https://patchwork.freedesktop.org/series/159128/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c1d3ffe9f86f9d742cbcc21e6d96a8dcec052791
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Dec 16 17:37:02 2025 -0800

    drm/xe: Add a wrapper for set/unset params
    
    Also, extract out the GuC RC related set/unset param functions
    into xe_guc_rc file. GuC still allows us to override GuC RC mode
    using an SLPC H2G interface. Continue to use that interface, but
    move the related code to the newly created xe_guc_rc file.
    
    v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 2eb2f8746a879f1c0e4c56b715c179424dafd8e0 drm-intel
a4599c7bcdfe drm/xe: Decouple GuC RC code from xe_guc_pc
-:168: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#168: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 304 lines checked
c1d3ffe9f86f drm/xe: Add a wrapper for set/unset params


