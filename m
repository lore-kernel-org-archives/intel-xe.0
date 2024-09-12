Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88CEEED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7818810EC17;
	Thu, 12 Sep 2024 18:48:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ED210EC17;
 Thu, 12 Sep 2024 18:48:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_PMT_features_in_X?=
 =?utf-8?q?e_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 18:48:04 -0000
Message-ID: <172616688441.993165.14781545159177233243@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912184210.914612-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240912184210.914612-1-michael.j.ruhl@intel.com>
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

Series: Support PMT features in Xe (rev12)
URL   : https://patchwork.freedesktop.org/series/133472/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a62d5ca1f3b030ef53f291aa67f34c5cf9571075
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Thu Sep 12 14:42:09 2024 -0400

    drm/xe/vsec: Support BMG devices
    
    The Battlemage (BMG) discrete graphics card supports
    the Platform, Monitoring Technology (PMT) feature
    directly on the primary PCI device.
    
    Utilize the PMT callback API to add support for the BMG
    devices.
    
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 9fd27ed0883cff53777b8db0b7c6db327132dcdc drm-intel
7af8f163957d platform/x86/intel/vsec.h: Move to include/linux
-:198: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#198: 
rename from drivers/platform/x86/intel/vsec.h

total: 0 errors, 1 warnings, 0 checks, 184 lines checked
7cbfd5ec281d platform/x86/intel/vsec: Add PMT read callbacks
1b7dc24f3bd9 platform/x86/intel/pmt: Use PMT callbacks
a62d5ca1f3b0 drm/xe/vsec: Support BMG devices
-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 278 lines checked


