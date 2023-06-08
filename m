Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF525C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 13:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27C110E5B5;
	Thu,  8 Jun 2023 13:22:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1E10E5B7;
 Thu,  8 Jun 2023 13:22:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4DC62AADE4;
 Thu,  8 Jun 2023 13:22:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 08 Jun 2023 13:22:56 -0000
Message-ID: <168623057631.18384.11721387401991323096@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608131634.7-1-francois.dugast@intel.com>
In-Reply-To: <20230608131634.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_uAPI_cleanup_=28rev3=29?=
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

Series: drm/xe: uAPI cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/118447/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ff33f74421f41c73067de6e5aea69e2c9399710
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Jun 8 13:16:34 2023 +0000

    drm/xe: Move defines before relevant fields
    
    Align on same rule in the whole file: defines then doc then relevant
    field, with an empty line to separate fields.
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
d9a064009 drm/xe: Document structures for device query
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#10: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>

-:126: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#126: FILE: include/uapi/drm/xe_drm.h:262:
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":

-:127: WARNING:LONG_LINE_COMMENT: line length of 106 exceeds 100 columns
#127: FILE: include/uapi/drm/xe_drm.h:263:
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":

total: 0 errors, 3 warnings, 0 checks, 121 lines checked
7ff33f744 drm/xe: Move defines before relevant fields
-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#9: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>

total: 0 errors, 1 warnings, 0 checks, 287 lines checked


