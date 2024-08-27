Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B35C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 09:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ED110E2C0;
	Tue, 27 Aug 2024 09:22:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C59410E2C0;
 Tue, 27 Aug 2024 09:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_replace_=23incl?=
 =?utf-8?q?ude_=3Cdrm/xe=5Fdrm=2Eh=3E_with_=3Cuapi/drm/xe=5Fdrm=2Eh=3E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 09:22:09 -0000
Message-ID: <172475052943.804865.1778181545199063126@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827091539.4136838-1-jani.nikula@intel.com>
In-Reply-To: <20240827091539.4136838-1-jani.nikula@intel.com>
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

Series: drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>
URL   : https://patchwork.freedesktop.org/series/137833/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56f7332755a72eeafe28056591b4855d4ec557b0
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Aug 27 12:15:39 2024 +0300

    drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>
    
    include/drm/xe_drm.h does not exist. Prefer the explicit uapi include.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5141d5ae1dead73bd1d029f8310609720bca06b3 drm-intel
56f7332755a7 drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>


