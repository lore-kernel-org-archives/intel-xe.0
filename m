Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811D9C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED5E10E867;
	Fri, 23 May 2025 19:00:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4976A10E867;
 Fri, 23 May 2025 19:00:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_user_comman?=
 =?utf-8?q?ds_to_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 19:00:57 -0000
Message-ID: <174802685729.18215.11549339098173802965@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
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

Series: drm/xe: Add user commands to WA BB via configfs
URL   : https://patchwork.freedesktop.org/series/149447/
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
commit ed5c0db3748c369fe0cb023e4dc22b2992881cf5
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri May 23 11:54:39 2025 -0700

    drm/xe/configfs: Add interface to wa_bb commands
    
    During validation it's useful to ensure additional commands are executed
    on every context switch. Add the interface to configfs to allow commands
    to be inserted in the WA batch buffer.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5ed61f4a36b342006a85c561ce0d1ccdd035f9c7 drm-intel
7a9d264dd4e3 FOR-CI: Add-configfs-to-load-with-fewer-engines
ddb0f8bf007f drm/xe/lrc: Extract post context restore function
fb09c0979b32 drm/xe/lrc: Sanity check bb space
2f6fbfb660ca drm/xe/lrc: Allow to add user commands on context switch
ed5c0db3748c drm/xe/configfs: Add interface to wa_bb commands


