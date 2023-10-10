Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136DCD8CB5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 19:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18410E3D6;
	Tue, 10 Oct 2023 19:11:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAC6C10E3D8;
 Tue, 10 Oct 2023 19:11:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E64C3A47E9;
 Tue, 10 Oct 2023 19:11:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 10 Oct 2023 19:11:20 -0000
Message-ID: <169696508093.28098.2125899546325278297@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010141743.19474-1-jose.souza@intel.com>
In-Reply-To: <20231010141743.19474-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Make_DRM=5FXE=5FDEVICE=5FQUERY=5FENGINES_future_proof?=
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

Series: drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
URL   : https://patchwork.freedesktop.org/series/124912/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4df0ac8b83d576c1d9bb97f993601d88a4d04ba
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Oct 10 07:17:43 2023 -0700

    drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
    
    We have at least 2 future features(OA and future media engines capabilities)
    that will require Xe to provide more information about engines to UMDs.
    
    But this information should not just be added to
    drm_xe_engine_class_instance for a couple of reasons:
    - drm_xe_engine_class_instance is used as input to other structs/uAPIs
    and those uAPIs don't care about any of these future new engine fields
    - those new fields are useless information after initialization for
    some UMDs, so it should not need to carry that around
    
    So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
    array of drm_xe_query_engine_info that contain
    drm_xe_engine_class_instance and 3 u64s to be used for future features.
    
    Reference OA: https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 37b2d042c23ae6a10055ea92101a15083d64c718 drm-intel
a4df0ac8b drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
We have at least 2 future features(OA and future media engines capabilities)

total: 0 errors, 1 warnings, 0 checks, 96 lines checked


