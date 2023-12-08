Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA2DC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 16:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1CF10E095;
	Fri,  8 Dec 2023 16:38:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 374DA10E095;
 Fri,  8 Dec 2023 16:38:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3427BAA3D8;
 Fri,  8 Dec 2023 16:38:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_uAPI_to_que?=
 =?utf-8?q?ry_micro-controler_firmware_version_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 08 Dec 2023 16:38:22 -0000
Message-ID: <170205350221.7326.18262616495768441550@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208095353.7-1-francois.dugast@intel.com>
In-Reply-To: <20231208095353.7-1-francois.dugast@intel.com>
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

Series: drm/xe: Add uAPI to query micro-controler firmware version (rev3)
URL   : https://patchwork.freedesktop.org/series/123779/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9b4bdef2d34304ffe322c0f262ee1ed20e40c2cc
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Dec 8 09:53:53 2023 +0000

    drm/xe: Add uAPI to query micro-controler firmware version
    
    Due to a bug in GuC firmware, Mesa can't enable by default the usage of
    compute engines in DG2 and newer.
    
    A new GuC firmware fixed the issue but until now there was no way
    for Mesa to know if KMD was running with the fixed GuC version or not,
    so this uAPI is required.
    
    It may be expanded in future to query other firmware versions too.
    
    More information:
    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
    Mesa usage:
    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
    
    v2:
    - changed to submission version
    - added branch version to be future proof
    - checking if pads and reserved are zero
    
    v3:
    - add braces around case XE_QUERY_UC_TYPE_GUC to make CI happy
    
    v4:
    - squashed commits
    - make it very clear and documented that it is about the submission
      version, and also what that actually means.
    
    v5:
    - rebase on top of uC version tracking rework
    - order define, doc, member in struct
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 4571c8c1bb64c926d82f792918da760d8af8ebd8 drm-intel
9b4bdef2d drm/xe: Add uAPI to query micro-controler firmware version


