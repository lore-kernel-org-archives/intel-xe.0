Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53772C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 20:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE9710E004;
	Tue, 11 Jun 2024 20:26:09 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E3E10E004;
 Tue, 11 Jun 2024 20:26:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_GuC_ABI_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 20:26:08 -0000
Message-ID: <171813756827.67160.12851382649014876951@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240611180735.1988-1-michal.wajdeczko@intel.com>
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

Series: More GuC ABI fixes
URL   : https://patchwork.freedesktop.org/series/134734/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62962c3f9fa9aac56b0caa7c54a7d75f7638a0f1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 11 20:07:35 2024 +0200

    drm/xe/guc: Avoid named enum types in GuC KLV ABI
    
    The xe_guc_klv_ids name just for workaround keys is too generic,
    as workaround keys are not the only keys used by the GuC firmware.
    Other KLVs keys are defined as plain defines or anonymous enums.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch a72dd4fc5dc05b35221d7e220a85e6fce7e414dd drm-intel
ac55c81582d8 drm/xe/guc: Fixup GuC KLV ABI kernel-doc annotations
63bdc0a8b1e5 drm/xe/guc: Update GuC CTB Descriptor ABI
b9ba772e54e6 drm/xe/guc: Fixup HXG Fast Request description
-:8: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#8: 
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
62962c3f9fa9 drm/xe/guc: Avoid named enum types in GuC KLV ABI


