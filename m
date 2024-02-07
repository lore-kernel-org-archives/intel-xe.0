Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF788C48297
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 00:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AA7112F84;
	Wed,  7 Feb 2024 00:15:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40C1112F96;
 Wed,  7 Feb 2024 00:15:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Don=27t_sup?=
 =?utf-8?q?port_GuC_older_GuC_70=2Ex_releases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Feb 2024 00:15:26 -0000
Message-ID: <170726492687.1057473.760660335538401152@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/guc: Don't support GuC older GuC 70.x releases
URL   : https://patchwork.freedesktop.org/series/129609/
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
commit acefb4f814e64e2be173424ef5486630fcce0674
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Feb 6 15:41:03 2024 -0800

    drm/xe/guc: Don't support GuC older GuC 70.x releases
    
    Supporting older GuC versions comes with baggage, both on the coding
    side (due to interfaces only being available from a certain version
    onwards) and on the testing side (due to having to make sure the driver
    works as expected with older GuCs).
    Since all of our Xe platform are still under force probe, we haven't
    committed to support any specific GuC version and we therefore don't
    need to support the older once, which means that we can force a bottom
    limit to what GuC we accept. This allows us to remove any conditional
    statements based on older GuC versions and also to approach newer
    additions knowing that we'll never attempt to load something older
    than our minimum requirement.
    
    RFC: this patch sets the minimum to the current GuC version (70.19),
    but that can be moved one way or the other. The main aim here is
    agreeing to stop supporting very old GuC releases on the newer driver.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c4d5cb00f50289a4fbe3fe0fb32002bd1ed5428b drm-intel
acefb4f81 drm/xe/guc: Don't support GuC older GuC 70.x releases


