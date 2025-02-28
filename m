Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD078C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1A410EC11;
	Fri, 28 Feb 2025 07:30:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0253A10EC11;
 Fri, 28 Feb 2025 07:30:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_the_hotunpl?=
 =?utf-8?q?ug_NULL_ptr_dereference?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 07:30:59 -0000
Message-ID: <174072785900.3106763.17541340596326038719@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250228065224.320811-1-aradhya.bhatia@intel.com>
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

Series: drm/xe: Fix the hotunplug NULL ptr dereference
URL   : https://patchwork.freedesktop.org/series/145615/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ebe392042cb2cfa5456c932a9cd118f6795c723f
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Fri Feb 28 06:52:24 2025 +0000

    drm/xe_device: Evict all the VRAM objects during device remove
    
    Now that xe's migrate subsystem is dev managed, instead of drm managed,
    evict all the VRAM objects during the xe device remove.
    
    The VRAM and TTM resource manager are drm managed, and so they are
    destroyed when all the references to DRM are put. When that happens, the
    VRAM and TTM resource managers evict all the BOs before their
    destruction. Since the migrate subsystem will already be finished by
    that point, the resource managers won't be able to evict the BOs
    successfully.
    Change that by preemptively evicting all the VRAM BOs during xe device
    remove.
    
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 873b1a50bb4394e95332cfa611aa6463de6b7cb0 drm-intel
1abe55b00d66 drm/xe_migrate: Switch from drm to dev managed actions
ebe392042cb2 drm/xe_device: Evict all the VRAM objects during device remove


