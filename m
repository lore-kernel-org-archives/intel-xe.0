Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685DFC04E69
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 14:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173EF10E59E;
	Fri,  7 Jul 2023 14:09:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4281D10E59F;
 Fri,  7 Jul 2023 14:09:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3FA80AA01E;
 Fri,  7 Jul 2023 14:09:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Fri, 07 Jul 2023 14:09:16 -0000
Message-ID: <168873895625.14757.12774316845084888747@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230707135419.14241-1-jose.souza@intel.com>
In-Reply-To: <20230707135419.14241-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Make_explicit_that_exec_uAPI_expects_canonical_addresse?=
 =?utf-8?q?s_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Make explicit that exec uAPI expects canonical addresses (rev3)
URL   : https://patchwork.freedesktop.org/series/120143/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65cadcc070c375823242cad070d0472e452db6ce
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Jul 7 06:54:19 2023 -0700

    drm/xe: Make explicit that exec uAPI expects canonical addresses
    
    The batch buffer address in exec uAPI is used when emitting
    MI_BATCH_BUFFER_START that expect canonical addresses in future
    platforms, for current ones the bits above 57 for PVC and 47 for
    other platforms are ignored.
    
    So the safest approach is to require canonical address for all
    platforms supported by Xe to avoid uAPI breaks.
    
    v2:
    - fix check for non parallel engines
    
    v3:
    - fix style
    
    BSpec: 60223 59475 45718
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch abcb88850f885254cf7477e1f7a5956136fb547c drm-intel
65cadcc07 drm/xe: Make explicit that exec uAPI expects canonical addresses


