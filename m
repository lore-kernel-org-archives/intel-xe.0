Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8A7D3DEA2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200DC10E964;
	Fri, 18 Oct 2024 17:28:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1810E37F;
 Fri, 18 Oct 2024 17:28:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_enable_lite_res?=
 =?utf-8?q?tore_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 17:28:33 -0000
Message-ID: <172927251303.1282643.18341516950613759108@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017162710.942553-1-fei.yang@intel.com>
In-Reply-To: <20241017162710.942553-1-fei.yang@intel.com>
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

Series: drm/xe: enable lite restore (rev2)
URL   : https://patchwork.freedesktop.org/series/140129/
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
commit 16f80b6dd346c9b4fc70131d27ae41f52ba320cc
Author: Fei Yang <fei.yang@intel.com>
Date:   Thu Oct 17 09:27:10 2024 -0700

    drm/xe: enable lite restore
    
    The lite restore is a performance improvement feature which avoids
    unnecessary context switch (flush, save and rstore) if the incoming
    context has a ContextID matching that of the outgoing context. The
    scheduling is done by the Guc firmware, so on the driver side it's
    just a matter of setting corresponding GuC_CTL_FEATURE flag.
    This is supposed to be enabled by default, thus the flag is set
    unconditionally.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch cebb76fe419dd92609fb86e59c9671387c5325a3 drm-intel
16f80b6dd346 drm/xe: enable lite restore


