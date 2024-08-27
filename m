Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380BCC54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 15:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0010E35F;
	Tue, 27 Aug 2024 15:45:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3776810E35F;
 Tue, 27 Aug 2024 15:45:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Fix_WRITE?=
 =?utf-8?q?=5FI1_param_from_u32_to_u16_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 15:45:13 -0000
Message-ID: <172477351322.806846.13881835514690679720@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827155301.183383-1-karthik.poosa@intel.com>
In-Reply-To: <20240827155301.183383-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16 (rev2)
URL   : https://patchwork.freedesktop.org/series/137796/
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
commit a3aa4d1e9198e61d60fd570ab62f9a30baac71bb
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Tue Aug 27 21:23:01 2024 +0530

    drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
    
    WRITE_I1 sub-command of the POWER_SETUP pcode command accepts a u16
    parameter instead of u32. This change prevents potential illegal
    sub-command errors.
    
    v2: Mask uval instead of changing the prototype. (Badal)
    
    v3: Rephrase commit message. (Badal)
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
+ /mt/dim checkpatch 2c3fbd94c8b2eda2275211dfa8ead639a4e3e161 drm-intel
a3aa4d1e9198 drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16


