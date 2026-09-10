Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD74C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B1B10E0CA;
	Thu, 10 Sep 2026 18:06:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B39610E0CA;
 Thu, 10 Sep 2026 18:06:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 18:06:07 -0000
Message-ID: <178906356756.147924.15419483334260408843@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev5)
URL   : https://patchwork.freedesktop.org/series/161655/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6880782d36953d90d301ae6973552293d15cbafc
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Thu Sep 10 10:56:22 2026 -0700

    drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
    
    Add a "mailbox" debugfs entry that allows any System Controller
    mailbox command to be issued for bring-up and debug. group and
    command are supplied by the caller as the first two tokens of every
    write:
    
    - Usage: echo "<group> <command> [byte0 byte1 ...]" \
                 > /sys/kernel/debug/dri/0/sc/mailbox
             cat /sys/kernel/debug/dri/0/sc/mailbox
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch aeaac9b539af202c51c1d8419fa36261d864b390 drm-intel
09f9d0b37f73 drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test interface
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 267 lines checked
90720b023d6a drm/xe/sysctrl: Add RAS error injection debugfs interface
6880782d3695 drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry


