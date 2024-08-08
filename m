Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0B0C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B8610E7C2;
	Thu,  8 Aug 2024 18:09:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ADD10E7C2;
 Thu,  8 Aug 2024 18:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Fix_xe=5F?=
 =?utf-8?q?hwmon=5Fpcode=5Fwrite=5Fi1_param_from_u32_to_u16?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 18:09:08 -0000
Message-ID: <172314054822.550660.3308457606346123539@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808172734.2233594-1-karthik.poosa@intel.com>
In-Reply-To: <20240808172734.2233594-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to u16
URL   : https://patchwork.freedesktop.org/series/137054/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74f036ee8aa4ff580c3b407dbe76500b2e9a408d
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Aug 8 22:57:34 2024 +0530

    drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to u16
    
    WRITE_I1 sub command of pcode takes param of u16 compared to u32 for
    READ_I1, so corrected it. Without this pcode shall return illegal
    sub command errors.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
+ /mt/dim checkpatch 3594b16e8499e1bef046abc4814c26183b603086 drm-intel
74f036ee8aa4 drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to u16


