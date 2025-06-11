Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD16DC71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9278A10E73D;
	Wed, 11 Jun 2025 22:28:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F1110E73D;
 Wed, 11 Jun 2025 22:28:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_early_wedge?=
 =?utf-8?q?_on_GuC_load_failure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 22:28:28 -0000
Message-ID: <174968090879.69215.2720195148434998289@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611214453.1159846-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250611214453.1159846-2-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Fix early wedge on GuC load failure (rev3)
URL   : https://patchwork.freedesktop.org/series/149906/
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
commit bd4f209ab871d22c7e8515c46322c59cfffca68e
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jun 11 14:44:54 2025 -0700

    drm/xe: Fix early wedge on GuC load failure
    
    When the GuC fails to load we declare the device wedged. However, the
    very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
    before the GT1 GuC objects are initialized, so things go bad when the
    wedge code attempts to cleanup GT1. To fix this, check the initialization
    status in the functions called during wedge.
    
    Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Cc: <stable@vger.kernel.org> # v6.12+: 1e1981b16bb1: drm/xe: Fix taking invalid lock on wedge
    Cc: <stable@vger.kernel.org> # v6.12+
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b drm-intel
bd4f209ab871 drm/xe: Fix early wedge on GuC load failure


