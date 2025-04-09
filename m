Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E047EC369A1
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 14:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBD610E8DB;
	Wed,  9 Apr 2025 14:17:20 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5A210E8DC;
 Wed,  9 Apr 2025 14:17:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_to_drop_v?=
 =?utf-8?q?ram_resizing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 14:17:19 -0000
Message-ID: <174420823931.52672.15435829192181579534@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409-bar-resize-param-v1-1-75bf4df38aa0@intel.com>
In-Reply-To: <20250409-bar-resize-param-v1-1-75bf4df38aa0@intel.com>
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

Series: drm/xe: Allow to drop vram resizing
URL   : https://patchwork.freedesktop.org/series/147472/
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
commit 45b9e139900dd99c23f0ea4ddc92fdd7df43ffc2
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Apr 9 07:09:56 2025 -0700

    drm/xe: Allow to drop vram resizing
    
    The default behavior if the LMEMBAR doesn't match the maximum possible
    size is to try to resize it. However the user might want to keep, even
    for testing the behavior with small BAR, whatever size was set via
    sysfs. Change the module parameter to int and check for negative value.
    
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch a4fa94e2a40459883139bc058d8c7b47514bb713 drm-intel
45b9e139900d drm/xe: Allow to drop vram resizing


