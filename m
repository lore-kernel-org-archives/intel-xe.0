Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E42C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 01:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF4410E0B8;
	Wed, 10 Jul 2024 01:23:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70AC10E0B8;
 Wed, 10 Jul 2024 01:23:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa/uapi=3A_Allow_O?=
 =?utf-8?q?A_config=27s_to_have_arbitrary_names/id=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jul 2024 01:23:20 -0000
Message-ID: <172057460080.88085.12196212708934852071@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa/uapi: Allow OA config's to have arbitrary names/id's
URL   : https://patchwork.freedesktop.org/series/135922/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ad7956a465c164d3884878f99e74becefb5d625
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Jul 9 18:17:41 2024 -0700

    drm/xe/oa/uapi: Allow OA config's to have arbitrary names/id's
    
    Added OA configs were previously identified by means of a uuid. Rather than
    forcing userspace to use uuid, here we generalize this scheme to allow
    userspace the flexibility to use whatever naming scheme (including uuid)
    they may wish to use to identify and track OA config's. Names must still be
    unique or will be rejected.
    
    Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 1c05c3d64de33058a86fa2c4ebb54d7c8bda573a drm-intel
4ad7956a465c drm/xe/oa/uapi: Allow OA config's to have arbitrary names/id's


