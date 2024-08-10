Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995EFC52D7D
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 00:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B5410EA41;
	Sat, 10 Aug 2024 00:06:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25310EA41;
 Sat, 10 Aug 2024 00:06:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_uC-related_drmm_vs_devm_f?=
 =?utf-8?q?ixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 10 Aug 2024 00:06:45 -0000
Message-ID: <172324840516.558655.3063493810626079305@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
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

Series: uC-related drmm vs devm fixes
URL   : https://patchwork.freedesktop.org/series/137112/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f50c203bc8b17a0ab1efbbd046f5c1a0427e97d1
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Aug 9 16:12:37 2024 -0700

    drm/xe/uc: Use devm to register cleanup that includes exec_queues
    
    Exec_queue cleanup requires HW access, so we need to use devm instead of
    drmm for it.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 99ad64bdf35cabb4af86749665508067895eb1d6 drm-intel
1adc8c01550d drm/xe: use devm instead of drmm for managed bo
e546e6f8ec20 drm/xe/uc: Use managed bo for HuC and GSC objects
f50c203bc8b1 drm/xe/uc: Use devm to register cleanup that includes exec_queues


