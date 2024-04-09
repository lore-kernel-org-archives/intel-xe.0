Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28735C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 10:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40110E211;
	Tue,  9 Apr 2024 10:58:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7371127B7;
 Tue,  9 Apr 2024 10:57:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Assert_pat=2Eops_function_pointers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 10:57:59 -0000
Message-ID: <171266027964.1300822.2885828156050792936@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240409105106.1067-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe: Assert pat.ops function pointers
URL   : https://patchwork.freedesktop.org/series/132205/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1abc4b2caf37faf09ebd323c0f8a7a992f27a231
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Apr 9 12:51:06 2024 +0200

    drm/xe: Check pat.ops before dumping PAT settings
    
    We may leave pat.ops unset when running on brand new platform or
    when running as a VF.  While the former is unlikely, the latter
    is valid (future) use case and will cause NPD when someone will
    try to dump PAT settings by debugfs.
    
    It's better to check pointer to pat.ops instead of specific .dump
    hook, as we have this hook always defined for every .ops variant.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch eea58bf00b72f3fd0abdf5fb144f988c23056b8d drm-intel
f84ff5ded976 drm/xe: Assert pat.ops function pointers
1abc4b2caf37 drm/xe: Check pat.ops before dumping PAT settings


