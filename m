Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C34C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899210E2AC;
	Wed, 19 Jun 2024 23:01:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71210E2AC;
 Wed, 19 Jun 2024 23:01:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Remove_WARN?=
 =?utf-8?q?=5FON=27s_for_unsupported_configurations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 23:01:21 -0000
Message-ID: <171883808176.125140.16259554731700087900@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619225617.3465899-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240619225617.3465899-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Remove WARN_ON's for unsupported configurations
URL   : https://patchwork.freedesktop.org/series/135081/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 165e4bc176a938abca96dbe9b96916999ce0dfb0
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Jun 19 15:56:17 2024 -0700

    drm/xe/oa: Remove WARN_ON's for unsupported configurations
    
    The OA ioctl's already have drm_dbg's which are sufficient to tell the user
    that OA is not supported on unsupported configurations (execlist mode and
    platform gen < 12). Having additional WARN_ON's for these during driver
    probe create unnecessary noise. Just remove these WARN_ON's.
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 drm-intel
165e4bc176a9 drm/xe/oa: Remove WARN_ON's for unsupported configurations


