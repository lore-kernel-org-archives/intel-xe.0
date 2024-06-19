Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A80FC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 20:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6D10E146;
	Wed, 19 Jun 2024 20:12:52 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470710E160;
 Wed, 19 Jun 2024 20:12:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Call_xe=5Foa?=
 =?utf-8?q?=5Femit=5Foa=5Fconfig=28=29_with_new_config_when_updating_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 20:12:51 -0000
Message-ID: <171882797127.124989.476758478514755556@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619192854.199289-1-jose.souza@intel.com>
In-Reply-To: <20240619192854.199289-1-jose.souza@intel.com>
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

Series: drm/xe/oa: Call xe_oa_emit_oa_config() with new config when updating config
URL   : https://patchwork.freedesktop.org/series/135076/
State : warning

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
commit d321f281b86a81fcfc5eb2dfbd12f17930a19310
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed Jun 19 12:28:54 2024 -0700

    drm/xe/oa: Call xe_oa_emit_oa_config() with new config when updating config
    
    When UMD ask config to be updated, xe_oa_config_locked() was calling
    xe_oa_emit_oa_config() that would use stream->oa_config but that is
    only changed to the next oa_config after xe_oa_emit_oa_config() finish.
    So it was setting the same config for all DRM_XE_PERF_IOCTL_CONFIG
    calls.
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 drm-intel
d321f281b86a drm/xe/oa: Call xe_oa_emit_oa_config() with new config when updating config
-:28: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#28: FILE: drivers/gpu/drm/xe/xe_oa.c:890:
+static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)

total: 0 errors, 1 warnings, 0 checks, 41 lines checked


