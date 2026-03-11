Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC82E104951A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 10:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAFB10E0BA;
	Wed, 11 Mar 2026 10:04:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028210E0BA;
 Wed, 11 Mar 2026 10:04:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_clear_cou?=
 =?utf-8?q?nter_and_error_event_in_DRM_RAS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 10:04:09 -0000
Message-ID: <177322344917.343654.7364210108874795708@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311102913.3387468-6-riana.tauro@intel.com>
In-Reply-To: <20260311102913.3387468-6-riana.tauro@intel.com>
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

Series: Add support for clear counter and error event in DRM RAS
URL   : https://patchwork.freedesktop.org/series/163019/
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
commit 067e2bc41e77793d2ee002505da87a0a35e47e82
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Mar 11 15:59:18 2026 +0530

    drm/xe/xe_drm_ras: Add error-event support in XE DRM RAS
    
    Add error-event support in XE DRM RAS to notify userspace
    whenever a GT or SoC error occurs.
    
    $ sudo ynl --family drm_ras --subscribe error-notify
    {'msg': {'error-id': 1, 'node-id': 1}, 'name': 'error-event'}
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 9a6bac4a4a289d3ac043f885758d208ccf07f149 drm-intel
b6cbf1e2d654 drm/drm_ras: Add clear-error-counter netlink command to drm_ras
-:163: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#163: FILE: drivers/gpu/drm/drm_ras_nl.c:26:
+static const struct nla_policy drm_ras_clear_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
eada54315c38 drm/xe/xe_drm_ras: Add support for clear-error-counter in XE DRM RAS
b302fa1fb4f2 drm/drm_ras: Add DRM RAS netlink error event notification
067e2bc41e77 drm/xe/xe_drm_ras: Add error-event support in XE DRM RAS


