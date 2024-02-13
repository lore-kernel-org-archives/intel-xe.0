Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019ECC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 23:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F3910E971;
	Tue, 13 Feb 2024 23:02:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00D110E975;
 Tue, 13 Feb 2024 23:02:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Promote_GUC?=
 =?utf-8?q?=5FGGTT=5FTOP_definition_to_regs/xe=5Fguc=5Fregs=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 23:02:22 -0000
Message-ID: <170786534271.1218994.3338507194994319903@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213213634.1437-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240213213634.1437-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Promote GUC_GGTT_TOP definition to regs/xe_guc_regs.h
URL   : https://patchwork.freedesktop.org/series/129856/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5523dfa303a9d0a8a8808f1f4ad520113749558f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Feb 13 22:36:34 2024 +0100

    drm/xe/guc: Promote GUC_GGTT_TOP definition to regs/xe_guc_regs.h
    
    This is a hardware based definition and instead of multiple local
    definitions it would be better to have just one common definition.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e3e6421a490e14b441f0ace4fe3cf45f70aa5c11 drm-intel
5523dfa30 drm/xe/guc: Promote GUC_GGTT_TOP definition to regs/xe_guc_regs.h


