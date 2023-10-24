Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7AC07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3955710E4E9;
	Tue, 24 Oct 2023 22:06:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 777E210E4E9;
 Tue, 24 Oct 2023 22:06:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 75B6FAADE0;
 Tue, 24 Oct 2023 22:06:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 24 Oct 2023 22:06:38 -0000
Message-ID: <169818519847.18360.15589081838374142424@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024220412.223868-1-lucas.demarchi@intel.com>
In-Reply-To: <20231024220412.223868-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_WA_14010918519_write_to_wrong_register?=
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

Series: drm/xe: Fix WA 14010918519 write to wrong register
URL   : https://patchwork.freedesktop.org/series/125530/
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
commit 61e8aa2e51bd006e51549102ed3bf60658e0854f
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Oct 24 15:04:12 2023 -0700

    drm/xe: Fix WA 14010918519 write to wrong register
    
    FORCE_SLM_FENCE_SCOPE_TO_TILE and FORCE_UGM_FENCE_SCOPE_TO_TILE are in
    the up dword of LSC_CHICKEN_BIT_0 register. Also, the 14010918519
    workaround only applies to early steppings, A*. Eventually those should
    be dropped, like they were in commit eaeb4b361452 ("drm/i915/dg2: Drop
    pre-production GT workarounds"), so let's make sure they are annotated
    appropriately.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
61e8aa2e5 drm/xe: Fix WA 14010918519 write to wrong register
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'eaeb4b361452', maybe rebased or not pulled?
#9: 
be dropped, like they were in commit eaeb4b361452 ("drm/i915/dg2: Drop

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


