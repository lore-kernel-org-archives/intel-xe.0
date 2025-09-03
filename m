Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A2CA0FF2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 18:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434B10E1C0;
	Wed,  3 Sep 2025 18:23:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A196910E1C0;
 Wed,  3 Sep 2025 18:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expand_workarou?=
 =?utf-8?q?nd_13011645652_to_PTL=2C_WCL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 18:23:04 -0000
Message-ID: <175692378466.300424.10123851401984422331@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903181552.1021977-2-julia.filipchuk@intel.com>
In-Reply-To: <20250903181552.1021977-2-julia.filipchuk@intel.com>
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

Series: drm/xe: Expand workaround 13011645652 to PTL, WCL
URL   : https://patchwork.freedesktop.org/series/153975/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ff39308c3c3e52615819c22005d7ff898e0047cf
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Wed Sep 3 11:15:53 2025 -0700

    drm/xe: Expand workaround 13011645652 to PTL, WCL
    
    Expand workaround to additional graphics architectures.
    
    Fixes: f336d7b274b9 ("drm/xe: Expand workaround 13011645652 to PTL, WCL")
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 09933716bb37eda75f5b3562a76e58a17c447647 drm-intel
ff39308c3c3e drm/xe: Expand workaround 13011645652 to PTL, WCL
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f336d7b274b9', maybe rebased or not pulled?
#11: 
Fixes: f336d7b274b9 ("drm/xe: Expand workaround 13011645652 to PTL, WCL")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


