Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD6C7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86E10E5EE;
	Wed, 28 Aug 2024 21:15:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111E10E5EE;
 Wed, 28 Aug 2024 21:15:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/4=5D_drm/xe/pf=3A_Add_function_to_sanitize_VF_resources?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 21:15:15 -0000
Message-ID: <172487971552.829259.477115819823840963@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828210809.1528-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240828210809.1528-1-michal.wajdeczko@intel.com>
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

Series: series starting with [v2,1/4] drm/xe/pf: Add function to sanitize VF resources
URL   : https://patchwork.freedesktop.org/series/137928/
State : warning

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
commit a937ba350ccbdf61bf22c93964811c6d3b2c7567
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Aug 28 23:08:09 2024 +0200

    drm/xe/pf: Improve VF control
    
    Our initial VF control implementation was focused on providing
    a very minimal support for the VF_STATE_NOTIFY events just to
    meet GuC requirements, without tracking a VF state or doing any
    expected actions (like cleanup in case of the FLR notification).
    
    Try to improve this by defining set of VF state machines, each
    responsible for processing one activity (PAUSE, RESUME, STOP or
    FLR). All required steps defined by the VF state machine are then
    executed by the PF worker from the dedicated workqueue.
    
    Any external requests or notifications simply try to transition
    between the states to trigger a work and then wait for that work
    to finish. Some predefined default timeouts are used to avoid
    changing existing API calls, but it should be easy to extend the
    control API to also accept specific timeout values.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 6b66ec881f7ae385f90fe6ad8c6ebef112873a17 drm-intel
451ff5ea65fb drm/xe/pf: Add function to sanitize VF resources
bf3e3b71f8a9 drm/xe/pf: Fix documentation formatting
d6d913dbf83a drm/xe/pf: Drop GuC notifications for non-existing VF
a937ba350ccb drm/xe/pf: Improve VF control
-:1363: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1363: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1444 lines checked


