Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E64EC47077
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 20:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1348F10E52B;
	Thu,  4 Jan 2024 20:35:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D671010E52B;
 Thu,  4 Jan 2024 20:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_synchronise?=
 =?utf-8?q?_CS=5FCHICKEN1_with_WMTP_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 04 Jan 2024 20:35:09 -0000
Message-ID: <170440050987.22406.6490065742602120542@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240104182615.21327-1-nirmoy.das@intel.com>
In-Reply-To: <20240104182615.21327-1-nirmoy.das@intel.com>
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

Series: drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support (rev4)
URL   : https://patchwork.freedesktop.org/series/128040/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4930aea03d3b9d63da981f59afd35bb9d3c722a
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Jan 4 19:26:15 2024 +0100

    drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
    
    Recommendation is to read FUSE4 register to check if WMTP has been
    enabled/disabled by HW. If enabled we don't need to do anything special,
    however if disabled recommendation is to also disable the WMTP mode in
    the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
    mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
    is how userspace controls pre-emption, so instead use the default lrc to
    disable WMTP using CS_CHICKEN1, if disabled by HW. Userspace is still
    free to set CS_CHICKEN1 to whatever they want later.
    
    v2: remove redundant version check and also add descriptive name(Matt)
    v3: remove usage of REG_FIELD_GET(Matt)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Co-developed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
e4930aea0 drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support


