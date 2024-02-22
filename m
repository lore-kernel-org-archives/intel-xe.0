Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C680CC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 20:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CE310E97B;
	Thu, 22 Feb 2024 20:59:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210BD10E97B;
 Thu, 22 Feb 2024 20:59:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/dg2=3A_Fix_number_?=
 =?utf-8?q?of_mocs_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 20:59:55 -0000
Message-ID: <170863559513.216122.16325294249249244401@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222204203.3007498-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222204203.3007498-1-lucas.demarchi@intel.com>
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

Series: drm/xe/dg2: Fix number of mocs entries
URL   : https://patchwork.freedesktop.org/series/130286/
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
commit c029dd8dcb5b34ae50fdcf1163200c13d21ddaa1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 22 12:42:03 2024 -0800

    drm/xe/dg2: Fix number of mocs entries
    
    While investigating why xe_mocs kunit was failing for DG2, Matt Roper
    noticed that LNCFCMOCS[31] is actually RO for DG2. It would be a spec
    bug to document a register to be programmed that is actually RO. However
    upon further inspection, it seems like we should not be programming the
    other values. Early DG2 SKUs documented that the entire set of
    LNCFCMOCS registers needed to be programmed, but this is not true
    anymore.
    
    Do like is done in MTL: the additional registers are there, but we are
    not supposed to program them, not even with the unused_index value.
    
    While at it, fix MTL define to follow the same alignment as others, with
    tabs.
    
    Bspec: 44988, 55267
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 164222e11030db989ad66c48f764b5ce4b896181 drm-intel
c029dd8dcb5b drm/xe/dg2: Fix number of mocs entries


