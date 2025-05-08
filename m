Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF7CC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 11:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E3910E1F7;
	Thu,  8 May 2025 11:34:42 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514810E1F7;
 Thu,  8 May 2025 11:34:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_the_gem_shr?=
 =?utf-8?q?inker_name?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 11:34:40 -0000
Message-ID: <174670408093.58975.10521221293400023524@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix the gem shrinker name
URL   : https://patchwork.freedesktop.org/series/148756/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4a3f1173801cccc8bfc1ee61c217e4c45b94893
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu May 8 13:29:31 2025 +0200

    drm/xe: Fix the gem shrinker name
    
    The xe buffer object shrinker name is visible in the
    <debugfs>/shrinker directory and most if not all other shinkers
    follow a naming convention that looks like
    <subsystem>-<driver>_<objects>:<unique>
    Follow the same convention for xe, changing the name to
    drm-xe_gem:<unique>.
    
    Other shrinkers typically use the device node for <unique> but
    since drm drivers typically don't have a single unique device-
    node, instead use the unique name in the drm device.
    
    Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2862c51f227a36e59ee4a9bb90b690c9855a6246 drm-intel
e4a3f1173801 drm/xe: Fix the gem shrinker name


