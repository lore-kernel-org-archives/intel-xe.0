Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5193DD6CFAB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 23:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5F10EB98;
	Thu, 22 Jan 2026 23:29:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E3410EB98;
 Thu, 22 Jan 2026 23:29:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Separate_out_Gu?=
 =?utf-8?q?C_RC_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jan 2026 23:29:54 -0000
Message-ID: <176912459487.185549.2978866851209710079@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122232057.150725-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260122232057.150725-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Separate out GuC RC code (rev2)
URL   : https://patchwork.freedesktop.org/series/158581/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a6bff75192f1decf6e41f7c2958dbcde6bcd7e9
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Jan 22 15:20:57 2026 -0800

    drm/xe: Add a wrapper for set/unset params
    
    Also, extract out the GuC RC related set/unset param functions
    into xe_guc_rc file. GuC still allows us to override GuC RC mode
    using an SLPC H2G interface. Continue to use that interface, but
    move the related code to the newly created xe_guc_rc file.
    
    v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
    v3: Assert if runtime pm ref is not held (Michal W)
    v4: Review comments (Riana)
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50 drm-intel
6811a0950b0d drm/xe: Decouple GuC RC code from xe_guc_pc
-:220: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#220: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 320 lines checked
5a6bff75192f drm/xe: Add a wrapper for set/unset params


