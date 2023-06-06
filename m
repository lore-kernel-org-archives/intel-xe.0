Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83FDC7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 09:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A58010E31A;
	Tue,  6 Jun 2023 09:53:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D207A10E31A;
 Tue,  6 Jun 2023 09:53:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CFA42A73C7;
 Tue,  6 Jun 2023 09:53:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 06 Jun 2023 09:53:17 -0000
Message-ID: <168604519784.22671.7713603830653045251@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/1=5D_drm/xe=3A_Report_tile_count_from_d?=
 =?utf-8?q?evice_query_api=2E?=
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

Series: series starting with [1/1] drm/xe: Report tile count from device query api.
URL   : https://patchwork.freedesktop.org/series/118918/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eafc6669c6da3e0d23a3f7e9709f548502ebfe3a
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jun 6 15:19:29 2023 +0530

    drm/xe: Report tile count from device query api.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch ee454cf4046170833f005c9591fb80a67df81f07 drm-intel
eafc6669c drm/xe: Report tile count from device query api.
-:33: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#33: FILE: include/uapi/drm/xe_drm.h:189:
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_TILE_COUNT + 1

total: 1 errors, 0 warnings, 0 checks, 16 lines checked


