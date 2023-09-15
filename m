Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F99DEED60B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 15:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D31710E64B;
	Fri, 15 Sep 2023 15:49:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20DB010E64B;
 Fri, 15 Sep 2023 15:49:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D64CAADD5;
 Fri, 15 Sep 2023 15:49:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Fri, 15 Sep 2023 15:49:15 -0000
Message-ID: <169479295511.32039.6361520214923944488@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915154639.48045-1-jose.souza@intel.com>
In-Reply-To: <20230915154639.48045-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_uAPI_to_query_micro-controler_firmware_version_=28r?=
 =?utf-8?q?ev2=29?=
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

Series: drm/xe: Add uAPI to query micro-controler firmware version (rev2)
URL   : https://patchwork.freedesktop.org/series/123779/
State : warning

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
commit 2296c8cdc584003b12cbadcb6d7ad53fd2b17608
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Sep 15 08:46:39 2023 -0700

    drm/xe: Add uAPI to query micro-controler firmware version
    
    Due to a bug in GuC firmware, Mesa can't enable by default the usage of
    compute engines in DG2 and newer.
    
    A new GuC firmware fixed the issue but until now there was no way
    for Mesa to know if KMD was running with the fixed GuC version or not,
    so this uAPI is required.
    
    It may be expanded in future to query other firmware versions too.
    
    More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
    Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
    
    v2:
    - changed to submission version
    - added branch version to be future proof
    - checking if pads and reserved are zero
    
    v3:
    - add braces around case XE_QUERY_UC_TYPE_GUC to make CI happy
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 4a9681392cecd56a372d06b648f7b3a37fdd5c63 drm-intel
2296c8cdc drm/xe: Add uAPI to query micro-controler firmware version
-:18: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#18: 
More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

total: 0 errors, 1 warnings, 0 checks, 108 lines checked


