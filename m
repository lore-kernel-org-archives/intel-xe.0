Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9188FC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 06:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F910EAEE;
	Fri, 11 Apr 2025 06:10:15 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DC910EAEE;
 Fri, 11 Apr 2025 06:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Register_bit_definition_f?=
 =?utf-8?q?or_EDP=5FGENERAL=5FCAP2_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 06:10:13 -0000
Message-ID: <174435181380.2979.9678170683754429193@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411060235.2732060-1-suraj.kandpal@intel.com>
In-Reply-To: <20250411060235.2732060-1-suraj.kandpal@intel.com>
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

Series: Register bit definition for EDP_GENERAL_CAP2 (rev2)
URL   : https://patchwork.freedesktop.org/series/147365/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57d1767784a9145245859ae813ca5b6d1e7bccb8
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Apr 11 11:32:36 2025 +0530

    drm/i915/backlight: Modify condition to use panel luminance
    
    According to our internal spec we need to now check if both
    panel luminance and smooth brightness are available in panel for
    us to be able to change brightness using luminance value.
    
    --v2
    -Add Fixes tag [Ankit]
    
    Fixes: 64481497924d ("drm/i915/backlight: Check Luminance based brightness control for VESA")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 9337ad48531f5eff1b8eff235f667db490ac8c91 drm-intel
2196df07ad9d drm/dp: Add smooth brightness register bit definition
57d1767784a9 drm/i915/backlight: Modify condition to use panel luminance


