Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C4BC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332FF10E5D2;
	Wed, 10 Jul 2024 06:20:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A4810E5DA;
 Wed, 10 Jul 2024 06:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Expose_EU_?=
 =?utf-8?q?width_via_topology_query?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jul 2024 06:20:05 -0000
Message-ID: <172059240521.88085.12359796727368890829@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710055440.1985620-1-lucas.demarchi@intel.com>
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

Series: drm/xe/uapi: Expose EU width via topology query
URL   : https://patchwork.freedesktop.org/series/135926/
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
commit 0a546f345160fbab444a37d9ba666b865f7cf341
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jul 9 22:53:54 2024 -0700

    drm/xe/uapi: Expose EU width via topology query
    
    PVC, Xe2 and later platforms have a 16 wide EU. We were implicitly
    reporting for PVC the number of 16-wide EUs without giving userspace any
    hint that they were different than for other platforms. Xe2 and later
    also have 16-wide, but in those case the reported number would
    correspond to the 8-wide count.
    
    Add a new item to the topology that aims to clarify what the EU_PER_DSS
    mask means. This new item uses mask[] as a single u8 value. Xe2 and
    later platforms start returning the number of SIMD16 EUs.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1c05c3d64de33058a86fa2c4ebb54d7c8bda573a drm-intel
0a546f345160 drm/xe/uapi: Expose EU width via topology query


