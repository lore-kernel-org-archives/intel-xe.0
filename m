Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39064C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034C910E0F7;
	Mon, 13 May 2024 08:03:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABD310E0F7;
 Mon, 13 May 2024 08:03:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_raw_access_to_GuC_?=
 =?utf-8?q?log_over_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 08:03:44 -0000
Message-ID: <171558742489.2094263.4405595267962305375@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240512153606.1996-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240512153606.1996-1-michal.wajdeczko@intel.com>
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

Series: Expose raw access to GuC log over debugfs
URL   : https://patchwork.freedesktop.org/series/133507/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 960772e41b97b843a9c751d554d726b4e3fdaa95
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun May 12 17:36:06 2024 +0200

    drm/xe/guc: Expose raw access to GuC log over debugfs
    
    We already provide the content of the GuC log in debugsfs, but it
    is in a text format where each log dword is printed as hexadecimal
    number, which does not scale well with large GuC log buffers.
    
    To allow more efficient access to the GuC log, which could benefit
    our CI systems, expose raw binary log data.  In addition to less
    overhead in preparing text based GuC log file, the new GuC log file
    in binary format is also almost 3x smaller.
    
    Any existing script that expects the GuC log buffer in text format
    can use command like below to convert from new binary format:
    
            hexdump -e '4/4 "0x%08x " "\n"'
    
    but this shouldn't be the case as most decoders expect GuC log data
    in binary format.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch b5f09c51c3bb7cf14cac3e484880efdb405c098c drm-intel
21d464d2341c libfs: add simple_read_from_iomem()
-:43: WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#43: FILE: fs/libfs.c:1060:
+			       const volatile void __iomem *from, size_t available)

-:88: WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#88: FILE: include/linux/fs.h:3335:
+			       const volatile void __iomem *from, size_t available);

total: 0 errors, 2 warnings, 0 checks, 71 lines checked
eabc3808f97d iosys-map: add iosys_map_read_from() helper
959390d79169 drm/xe: Add wrapper for iosys_map_read_from
960772e41b97 drm/xe/guc: Expose raw access to GuC log over debugfs


