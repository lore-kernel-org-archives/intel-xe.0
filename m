Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA145C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 23:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D0410E55B;
	Thu, 15 Aug 2024 23:12:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1028610E55B;
 Thu, 15 Aug 2024 23:12:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/xe/uc=3A_Use_managed_bo_for_HuC_and_GSC_objects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 23:12:22 -0000
Message-ID: <172376354206.652113.10505092520931199223@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815230541.3828206-1-lucas.demarchi@intel.com>
In-Reply-To: <20240815230541.3828206-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,1/3] drm/xe/uc: Use managed bo for HuC and GSC objects
URL   : https://patchwork.freedesktop.org/series/137362/
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
commit 8956522e6ac792f52dddfada1d7c601cb0e70057
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 15 16:05:41 2024 -0700

    drm/xe: Fix tile fini sequence
    
    Only set tile->mmio.regs to NULL if not the root tile in tile_fini. The
    root tile mmio regs is setup ealier in MMIO init thus it should be set
    to NULL in mmio_fini.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167 drm-intel
64ca08ee9ec3 drm/xe/uc: Use managed bo for HuC and GSC objects
9d5b037d3c6f drm/xe/uc: Use devm to register cleanup that includes exec_queues
8956522e6ac7 drm/xe: Fix tile fini sequence


