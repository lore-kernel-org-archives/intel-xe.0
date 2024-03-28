Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A6DCD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 17:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC511250C;
	Thu, 28 Mar 2024 17:51:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCC5112509;
 Thu, 28 Mar 2024 17:51:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Define_top?=
 =?utf-8?q?ology_types_as_indexes_rather_than_masks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 17:51:02 -0000
Message-ID: <171164826296.1064396.13372299352277049349@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328140243.7-1-francois.dugast@intel.com>
In-Reply-To: <20240328140243.7-1-francois.dugast@intel.com>
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

Series: drm/xe/uapi: Define topology types as indexes rather than masks
URL   : https://patchwork.freedesktop.org/series/131768/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bfe85baba4e30ab83c1e182368beed005796fc60
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Mar 28 14:02:43 2024 +0000

    drm/xe/uapi: Define topology types as indexes rather than masks
    
    The topology type is an index (not a mask) so define the values
    like other indexes instead of using powers of 2. This is also
    to make clear that the next type can use value 3. This commit
    does not change the existing values so it does not break
    compatibility.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Link: https://lore.kernel.org/intel-xe/20240327232317.GI718896@mdroper-desk1.amr.corp.intel.com/
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c185a0400ae0be7c5565e9eae63d5b81f5c242ff drm-intel
bfe85baba4e3 drm/xe/uapi: Define topology types as indexes rather than masks


