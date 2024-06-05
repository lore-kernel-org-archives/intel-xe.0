Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB6FC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 05:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EF710E4E1;
	Wed,  5 Jun 2024 05:02:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8087C10E4E1;
 Wed,  5 Jun 2024 05:02:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Custom_init_and_res?=
 =?utf-8?q?et_steps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 05:02:51 -0000
Message-ID: <171756377152.2266944.4180316056632595825@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

Series: VF: Custom init and reset steps
URL   : https://patchwork.freedesktop.org/series/134469/
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
commit 926b069d35bea29b945275c4baf8af5907c4bf5f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 4 23:22:31 2024 +0200

    drm/xe/vf: Custom GT restart
    
    Only few steps from the GT restart phase are applicable for the
    VF drivers, as initialization of PAT, WOPCM, MOCS or CCS mode can
    be done only by the native or PF drivers. Use custom GT restart
    function if running in VF mode.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
6ef92fba0944 drm/xe/vf: Support only GuC/HuC firmwares
547d076994a3 drm/xe/vf: Custom uC initialization
445f4b5661b5 drm/xe/vf: Custom GuC reset
926b069d35be drm/xe/vf: Custom GT restart


