Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2587DC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 16:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA92B10E69A;
	Wed, 31 Jul 2024 16:49:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D093210E69A;
 Wed, 31 Jul 2024 16:49:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Fix_PL1_d?=
 =?utf-8?q?isable_flow_in_xe=5Fhwmon=5Fpower=5Fmax=5Fwrite?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 16:49:44 -0000
Message-ID: <172244458484.468747.12839801230219001080@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731165636.1401533-1-karthik.poosa@intel.com>
In-Reply-To: <20240731165636.1401533-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
URL   : https://patchwork.freedesktop.org/series/136756/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29d0176d7fbf3034cfb3c7c10e4193069e43702c
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Jul 31 22:26:36 2024 +0530

    drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
    
    In xe_hwmon_power_max_write, for PL1 disable supported case, instead of
    returning after PL1 disable, PL1 enable was path also being run.
    Fixed it by returing after disable.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Fixes: fef6dd12b45a ("drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock")
+ /mt/dim checkpatch 91efc68883cbff0e7e453d1828c8e84d9959c458 drm-intel
29d0176d7fbf drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write


