Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3739C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115210E058;
	Fri, 23 May 2025 17:48:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21C10E0BD;
 Fri, 23 May 2025 17:48:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_configfs_to?=
 =?utf-8?q?_load_with_fewer_engines_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 17:48:54 -0000
Message-ID: <174802253490.18049.8337083341838250326@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
In-Reply-To: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
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

Series: drm/xe: Add configfs to load with fewer engines (rev3)
URL   : https://patchwork.freedesktop.org/series/149259/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 99f1d7f76bad28e19b10e7e9872c5678f4bd1827
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri May 23 10:42:33 2025 -0700

    drm/xe/configfs: Add attribute to disable engines
    
    Add the userspace interface to load the driver with fewer engines.
    The syntax is to just echo the engine names to a file in configfs, like
    below:
    
            echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
    
    With that engines other than rcs0 and bcs0 will not be enabled. To
    enable all instances from a class, a '*' can be used.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5ed61f4a36b342006a85c561ce0d1ccdd035f9c7 drm-intel
06f69261ece6 drm/xe/configfs: Drop trailing semicolons
45af333afe08 drm/xe: Allow to disable engines
99f1d7f76bad drm/xe/configfs: Add attribute to disable engines


