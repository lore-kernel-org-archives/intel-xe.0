Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F3CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85C310EAA9;
	Thu, 26 Sep 2024 11:27:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2210EAA9;
 Thu, 26 Sep 2024 11:27:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_memirq_repo?=
 =?utf-8?q?rt_page_address_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 11:27:47 -0000
Message-ID: <172735006795.1106623.2094635097846755436@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925084445.1495-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240925084445.1495-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add memirq report page address helpers
URL   : https://patchwork.freedesktop.org/series/139084/
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
commit 5b237066d92db1b2fa9f7592ce3a537a1f9e61c3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Sep 25 10:44:45 2024 +0200

    drm/xe: Add memirq report page address helpers
    
    Both xe_memirq_{source,status}_ptr functions are now strictly for
    obtaining an address of the memory based interrupt report pages
    used by the HW engines. When initializing the GuC that does not
    require special per instance page preparation, we don't need to
    abuse these public functions and pass a NULL instead of valid hwe
    pointer. Also, without further fixes, this actually may lead to
    NPD crash once the hw_reports_to_instance_zero() will be true.
    
    Add internal helpers that will provide report page addresses based
    solely on the instance number, which will be always 0 for both GuCs.
    
    Fixes: ef6103d20f97 ("drm/xe: memirq infra changes for MSI-X")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Ilia Levi <ilia.levi@intel.com>
    Reviewed-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da drm-intel
5b237066d92d drm/xe: Add memirq report page address helpers


