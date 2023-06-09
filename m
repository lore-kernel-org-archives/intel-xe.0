Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A2C7EE37
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C02810E0AE;
	Fri,  9 Jun 2023 18:28:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECADE10E0AE;
 Fri,  9 Jun 2023 18:28:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E935CAADF2;
 Fri,  9 Jun 2023 18:28:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 09 Jun 2023 18:28:56 -0000
Message-ID: <168633533695.15970.16823495643927320789@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609182627.143150-1-matthew.brost@intel.com>
In-Reply-To: <20230609182627.143150-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_A_?=
 =?utf-8?q?rebind_fixes?=
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

Series: A rebind fixes
URL   : https://patchwork.freedesktop.org/series/119159/
State : warning

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
commit 7e8642bb832f127fa589773c3df17c35c6cf5909
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jun 9 11:26:27 2023 -0700

    drm/xe: Use Xe ordered workqueue for rebind worker
    
    A mix of the system unbound wq and Xe ordered wq was used for the
    rebind, only use the Xe ordered wq. This will ensure only 1 rebind is
    occuring at a time providing a somewhat clunky work around for short
    comings in TTM wrt to memory contention. Once the TTM memory contention
    is resolved we should be able to use a dedicated non-ordered workqueue.
    
    Also add helper to queue rebind worker to avoid using wrong workqueue
    going forward.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e24e730ad5d4c3af599fa4e1e05527120adca322 drm-intel
0ea023594 drm/xe: Handle unmapped userptr in analyze VM
aa3d746e3 drm/xe: Ban a VM if rebind worker hits an error
7e8642bb8 drm/xe: Use Xe ordered workqueue for rebind worker
-:8: WARNING:TYPO_SPELLING: 'occuring' may be misspelled - perhaps 'occurring'?
#8: 
occuring at a time providing a somewhat clunky work around for short
^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


