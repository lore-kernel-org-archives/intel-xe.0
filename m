Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8329C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941C910F642;
	Thu,  3 Sep 2026 14:10:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72610F642;
 Thu,  3 Sep 2026 14:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 14:10:44 -0000
Message-ID: <178844464491.119026.14042787805015716114@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
In-Reply-To: <20260903140340.83500-6-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev4)
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
commit fe7df74b75d39b0525b32e478064358f2e023079
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Thu Sep 3 07:03:44 2026 -0700

    drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
    
    Add a "mailbox" debugfs entry that allows any System Controller
    mailbox command to be issued for bring-up and debug.
    
    group and command are supplied by the caller as the
    first two tokens of every write, e.g.:
    
      echo "<group> <command> [byte0 byte1 ...]" > mailbox
      cat mailbox
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 76a34199970d93cfb3ed5dbbd745c23b6f0cff34 drm-intel
78e81dd80ee7 drm/xe/sysctrl: Add System Controller get application status
f8d57d9171f7 drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test interface
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 254 lines checked
1159d63bd4a4 drm/xe/sysctrl: Add RAS error injection debugfs interface
fe7df74b75d3 drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry


