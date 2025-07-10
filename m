Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3507EC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE06F10E211;
	Thu, 10 Jul 2025 10:47:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534210E211;
 Thu, 10 Jul 2025 10:47:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_SR-IOV_support_for_BM?=
 =?utf-8?q?G_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 10:47:03 -0000
Message-ID: <175214442386.150203.755830720200090008@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

Series: Add SR-IOV support for BMG (rev2)
URL   : https://patchwork.freedesktop.org/series/151433/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ed4253b0bb57753e8aca9aa7dd1256b7c58dbf85
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 10 10:30:40 2025 +0000

    drm/xe/sriov: Mark BMG as SR-IOV capable
    
    Enable SRIOV support for BMG platforms.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com <mailto:satyanarayana.k.v.p@intel.com>>
+ /mt/dim checkpatch fe737942dfd4a1451f169f4fc781b685ff624e2c drm-intel
488369a8b0a5 drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Satyanarayana K V P <satyanarayana.k.v.p@intel.com'
#11: 
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com

total: 1 errors, 0 warnings, 0 checks, 12 lines checked
ed4253b0bb57 drm/xe/sriov: Mark BMG as SR-IOV capable


