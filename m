Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF58DC02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 19:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A8E10E3C2;
	Wed,  5 Feb 2025 19:53:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D547310E3C2;
 Wed,  5 Feb 2025 19:53:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Avoid_reading_inacc?=
 =?utf-8?q?essible_RING=5FTIMESTAMP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 19:53:54 -0000
Message-ID: <173878523486.1602135.6831526297606063684@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
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

Series: VF: Avoid reading inaccessible RING_TIMESTAMP (rev2)
URL   : https://patchwork.freedesktop.org/series/144335/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e85ea67250dba4f0017ccbc1e65f83389e096b51
Author: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Date:   Wed Feb 5 20:16:44 2025 +0100

    drm/xe/client: Skip show_run_ticks if unable to read timestamp
    
    RING_TIMESTAMP registers are inaccessible in VF mode.
    Without drm-total-cycles-*, other keys provide little value.
    Skip all optional "run_ticks" keys in this case.
    
    Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 5592bc56322b20198056d88dd12fc86ebb0dfcbe drm-intel
0203cdbfae3b drm/xe/vf: Return EOPNOTSUPP for DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
e85ea67250db drm/xe/client: Skip show_run_ticks if unable to read timestamp


