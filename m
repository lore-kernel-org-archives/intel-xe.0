Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FBC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8A110EDBC;
	Thu,  8 Feb 2024 21:12:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4CC10EDB1;
 Thu,  8 Feb 2024 21:12:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_Add_uAPI_to_query_GuC_firmware_submission_ve?=
 =?utf-8?q?rsion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 21:12:50 -0000
Message-ID: <170742677058.1109599.16297713452906999362@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208183539.185095-1-jose.souza@intel.com>
In-Reply-To: <20240208183539.185095-1-jose.souza@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: Add uAPI to query GuC firmware submission version
URL   : https://patchwork.freedesktop.org/series/129689/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d948e6b665f868f364f38cde051948c240ab7d9d
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Feb 8 10:35:39 2024 -0800

    drm/xe: Extend uAPI to query HuC micro-controler firmware version
    
    The infrastructure to query GuC firmware version is already in place. It
    is extended with a new micro-controller type to query the HuC firmware
    version. It can be used from user space to know if HuC is running.
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 22d626404cb81d7818ab55e5b14885e31a998dfd drm-intel
53522af38 drm/xe: Add uAPI to query GuC firmware submission version
d948e6b66 drm/xe: Extend uAPI to query HuC micro-controler firmware version


