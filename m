Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3906C98324
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 14:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDF510FAF6;
	Fri, 25 Sep 2026 14:24:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0CD10FAF6;
 Fri, 25 Sep 2026 14:24:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 14:24:12 -0000
Message-ID: <179034625204.208193.2488466254579277166@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev7)
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
commit 9fbf5801e4875449c18a343c2d01d28ac0fd81e0
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Sep 25 06:55:23 2026 -0700

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
+ /mt/dim checkpatch 12ece6156cc2418f12a209fab92e357d2b5f8685 drm-intel
7d4231760cee drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test interface
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 284 lines checked
b84923ce3e89 drm/xe/sysctrl: Add RAS error injection debugfs interface
9fbf5801e487 drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
- Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \

total: 0 errors, 1 warnings, 0 checks, 210 lines checked


