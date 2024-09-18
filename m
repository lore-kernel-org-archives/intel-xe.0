Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDDCCDD55D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 23:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D948D10E0C7;
	Wed, 18 Sep 2024 23:10:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFBF10E0C7;
 Wed, 18 Sep 2024 23:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_xe=5Fsyncs_f?=
 =?utf-8?q?or_OA_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 23:10:44 -0000
Message-ID: <172670104457.1027924.14696437538138700924@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918195330.3167756-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240918195330.3167756-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA (rev6)
URL   : https://patchwork.freedesktop.org/series/137058/
State : success

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
commit 493bda230421d1e0eaee7e498462d909d9e6c7c1
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Sep 18 12:53:29 2024 -0700

    drm/xe/oa: Allow only certain property changes from config
    
    Whereas all properties can be specified during OA stream open, when the OA
    stream is reconfigured only the config_id and syncs can be specified.
    
    v2: Use separate function table for reconfig case (Jonathan)
        Change bool function args to enum (Matt B)
    v3: s/xe_oa_set_property_funcs/xe_oa_set_property_funcs_open/ (Jonathan)
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 2141344f9b4f0bcd6bb20a45afaef94209743c0d drm-intel
517a543105ce drm/xe/oa: Separate batch submission from waiting for completion
cc2e3105a119 drm/xe/oa/uapi: Define and parse OA sync properties
653633a2abbb drm/xe/oa: Add input fence dependencies
e0ecdc3d6034 drm/xe/oa: Signal output fences
a966f0a7705a drm/xe/oa: Move functions up so they can be reused for config ioctl
82703f59f674 drm/xe/oa: Add syncs support to OA config ioctl
493bda230421 drm/xe/oa: Allow only certain property changes from config


