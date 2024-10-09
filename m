Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C1CEE343
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475310E7D7;
	Wed,  9 Oct 2024 19:12:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B704E10E7D7;
 Wed,  9 Oct 2024 19:12:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GuC_Buffer_Cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 19:12:13 -0000
Message-ID: <172850113374.1211789.17310922088689991917@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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

Series: GuC Buffer Cache
URL   : https://patchwork.freedesktop.org/series/139801/
State : warning

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
commit b515e9b6797c4df6bdc70ca7db829e6efe5fd9d7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Oct 9 19:21:25 2024 +0200

    drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
    
    Start using GuC buffer cache for the VF's configuration actions.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5ac8672cc80fd6228fbdcee22771f9f86b811eef drm-intel
7a76149864f8 drm/xe/guc: Introduce the GuC Buffer Cache
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 482 lines checked
64dd7a38d7af drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
ffa47a34f6b5 drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 457 lines checked
bb5ddc8cbc23 drm/xe/pf: Prepare GuC Buffer Cache for PF-only actions
b515e9b6797c drm/xe/pf: Use GuC Buffer Cache during VFs provisioning


