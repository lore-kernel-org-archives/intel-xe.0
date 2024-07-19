Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FD3C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523C10E023;
	Fri, 19 Jul 2024 19:20:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636DE10E023;
 Fri, 19 Jul 2024 19:20:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_warning_on_?=
 =?utf-8?q?unreachable_statement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 19:20:43 -0000
Message-ID: <172141684340.291659.10830790685914045703@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
In-Reply-To: <20240719191534.3845469-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix warning on unreachable statement
URL   : https://patchwork.freedesktop.org/series/136300/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit beca55580ad2404a7fc936b4336ffeb260c47798
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jul 19 12:15:34 2024 -0700

    drm/xe: Fix warning on unreachable statement
    
    eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
    it handles all enum values. However it's perfectly legal to pass an int
    to that function so in the end that function may happen to return
    nothing. A smart compiler could notice eu_type is never assigned to
    anything other than those values.
    
    Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
    triggered for me, but this was reported in a different system with
    gcc-10:
    
            drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()
    
    Since that is not really possible, just take the simple approach and
    return NULL.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch eb6045a759ea13e8d159bdaea423e904b9e3717b drm-intel
beca55580ad2 drm/xe: Fix warning on unreachable statement


