Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B2C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 03:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16D910E065;
	Wed, 29 Nov 2023 03:28:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D26110E065;
 Wed, 29 Nov 2023 03:28:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04715A0169;
 Wed, 29 Nov 2023 03:28:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 29 Nov 2023 03:28:08 -0000
Message-ID: <170122848801.12090.3980940134100335400@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Hu?=
 =?utf-8?q?C_authentication_via_GSC?=
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

Series: HuC authentication via GSC
URL   : https://patchwork.freedesktop.org/series/127016/
State : warning

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
commit a3151e78c0619c5d309e1582e2fd3703123a2024
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Nov 28 17:17:19 2023 -0800

    drm/xe/huc: HuC authentication via GSC
    
    HuC authentication via GSC is performed by submitting the appropriate
    PXP packet to the GSC FW. This packet can trigger a "pending" reply from
    the FW, so we need to handle that and resubmit. Note that the auth via
    GSC can only be performed if the HuC has already been authenticated by
    the GuC.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
+ /mt/dim checkpatch 1b020536e1c9147006cfe4e771396e89afdb14f3 drm-intel
49f2b4578 drm/xe/huc: Prepare for 2-step HuC authentication
a3151e78c drm/xe/huc: HuC authentication via GSC
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

-:241: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#241: FILE: drivers/gpu/drm/xe/xe_huc.c:163:
+	wr_offset = huc_emit_pxp_auth_msg(xe, &pkt->vmap, wr_offset,
+					 xe_bo_ggtt_addr(huc->fw.bo),

total: 0 errors, 1 warnings, 1 checks, 321 lines checked


