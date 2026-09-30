Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4FCA5FC7
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 14:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DAF10F41F;
	Wed, 30 Sep 2026 14:02:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0E10F41F;
 Wed, 30 Sep 2026 14:02:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Sep 2026 14:02:39 -0000
Message-ID: <179077695951.223785.10693242044447388075@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930133451.667270-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260930133451.667270-5-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev8)
URL   : https://patchwork.freedesktop.org/series/161655/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1aa3d00782cd857b2d13ee295fd6a3d45653fcf8
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Wed Sep 30 06:34:54 2026 -0700

    drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
    
    Add a "mailbox" debugfs entry that allows any System Controller
    mailbox command to be issued for bring-up and debug. group and
    command are supplied by the caller as the first two tokens of every
    write, followed by optional per-command response timeout and
    response-length overrides and the payload bytes:
    
    - Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \
                 > /sys/kernel/debug/dri/0/sc/mailbox
             cat /sys/kernel/debug/dri/0/sc/mailbox
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch b7036096f753a7fe43361478bcf22c04f23387a8 drm-intel
a5b7e06f0f7e drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test interface
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 284 lines checked
6cdfc81b10fd drm/xe/sysctrl: Add RAS error injection debugfs interface
1aa3d00782cd drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
- Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \

total: 0 errors, 1 warnings, 0 checks, 210 lines checked


