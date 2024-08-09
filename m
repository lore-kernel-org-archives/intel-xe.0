Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949A9C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 11:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261C10E8C0;
	Fri,  9 Aug 2024 11:09:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33C10E8BC;
 Fri,  9 Aug 2024 11:09:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Expose_wmtp_status_as_eng?=
 =?utf-8?q?ine_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 11:09:11 -0000
Message-ID: <172320175163.552097.13199756864365189993@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809104736.10423-1-nirmoy.das@intel.com>
In-Reply-To: <20240809104736.10423-1-nirmoy.das@intel.com>
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

Series: Expose wmtp status as engine capability
URL   : https://patchwork.freedesktop.org/series/137079/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c728d5d13a748fe5944c9d0db50e1bf8da026193
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Aug 9 12:47:36 2024 +0200

    drm/xe/uapi: Expose wmtp as engine capability
    
    Add capabilities to engine struct which can be used to
    expose various capabilities of each engine.
    
    Add wmtp as engine capability which is retrieve from
    GT info.
    
    Take a field from the reserved for that purpose.
    
    v2: Use 32 bit for capabilities(Lucas).
        Only Expose Compute engine till there is user-case
        for Render engine(Joonas).
        Don't use BIT() for uAPI (Francois)
    
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 8d0f83b389ec64b9f7f9b2ee241fc352346868f1 drm-intel
cc9c6ea61f7e drm/xe: Add has_wmtp GT info
c728d5d13a74 drm/xe/uapi: Expose wmtp as engine capability


