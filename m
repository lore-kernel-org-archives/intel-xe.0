Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3185E6F093
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7734410E03C;
	Fri,  1 Nov 2024 22:28:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6927410E058;
 Fri,  1 Nov 2024 22:28:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fguc=5Fads=3A_?=
 =?utf-8?q?Add_nonpriv_registers_to_write_list?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 22:28:55 -0000
Message-ID: <173050013542.1388976.1023530659524022668@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241101222350.108367-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: Add nonpriv registers to write list
URL   : https://patchwork.freedesktop.org/series/140833/
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
commit fe4ec521fbe9ed3cd221344341ececafa57eae7c
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Nov 1 22:23:50 2024 +0000

    drm/xe/xe_guc_ads: Add nonpriv registers to write list
    
    When performing a guc_mmio_regset_write, we add all the registers in the
    reg_sr list to the save/restore list, but do not do the same for the
    nonpriv registers.  Add them in.
    
    v2:
    - Add all NONPRIV registers to avoid undefined behavior (Harrison)
    - s/whitelist/nonpriv
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Lucas de Marchi <lucas.demarchi@intel.com>
    CC: Matt Roper <matthew.d.roper@intel.com>
    CC: John Harrison <john.c.harrison@intel.com>
    CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 2a0d989e396396f20ee5cfc4fad5b9dbbb2307d5 drm-intel
fe4ec521fbe9 drm/xe/xe_guc_ads: Add nonpriv registers to write list


