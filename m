Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2674C47422
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 04:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE6910EB3B;
	Wed, 24 Jan 2024 04:58:44 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E355710EB3B;
 Wed, 24 Jan 2024 04:58:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_Add_status_?=
 =?utf-8?q?check_during_gsc_header_readout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Wed, 24 Jan 2024 04:58:42 -0000
Message-ID: <170607232292.695948.629123630656173741@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124045248.687023-1-suraj.kandpal@intel.com>
In-Reply-To: <20240124045248.687023-1-suraj.kandpal@intel.com>
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

Series: drm/xe/gsc: Add status check during gsc header readout
URL   : https://patchwork.freedesktop.org/series/129114/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f179f5d416ca968a6c05b798570938db9fea16d3
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Jan 24 10:22:48 2024 +0530

    drm/xe/gsc: Add status check during gsc header readout
    
    Before checking if data is present in the message reply check the
    status in header and see if it indicates any error.
    
    --v2
    - Use drm_err() instead of drm_dbg_kms() [Daniele]
    
    --v3
    - Use &xe->drm in drm_err to make it more cleaner [Daniele]
    
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 233dc02b51d147857bb2f70547fd5e79bf598b4b drm-intel
f179f5d41 drm/xe/gsc: Add status check during gsc header readout


