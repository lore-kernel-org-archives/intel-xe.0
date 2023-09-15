Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6224EE6432
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEA710E16A;
	Fri, 15 Sep 2023 07:56:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 412CC10E16A;
 Fri, 15 Sep 2023 07:56:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3E7CFAADE4;
 Fri, 15 Sep 2023 07:56:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 15 Sep 2023 07:56:40 -0000
Message-ID: <169476460025.32039.14551560468035549074@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915074818.903353-1-jouni.hogander@intel.com>
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fr?=
 =?utf-8?q?ontbuffer_tracking_and_dirtyfb?=
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

Series: Frontbuffer tracking and dirtyfb
URL   : https://patchwork.freedesktop.org/series/123751/
State : success

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
commit 4ff5e8a8eed60f43ef483cbbfab13c6098f0803f
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Sep 15 10:48:18 2023 +0300

    drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
    
    Xe and i915 objects have differing implementation. Use intel_bo_to_drm_bo
    instead of obj->base as xe_bo doesn't have base pointer.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 4a9681392cecd56a372d06b648f7b3a37fdd5c63 drm-intel
a08bf70f0 drm/xe: Add empty def for i915_gem_object_flush_if_display
8fc73ad9c fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
148ec8691 drm/i915/fbc: Clear frontbuffer busy bits on flip
e46588808 drm/i915/psr: Clear frontbuffer busy bits on flip
75c836177 drm/i915: Add new frontbuffer tracking interface to queue flush
20b297c9d drm/i915: Handle dma fences in dirtyfb callback
4ff5e8a8e drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base


