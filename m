Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A46C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 17:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00B10E239;
	Tue,  4 Jun 2024 17:33:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3219910E239;
 Tue,  4 Jun 2024 17:33:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_validate_client?=
 =?utf-8?q?_of_BO_inside_lock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 17:33:02 -0000
Message-ID: <171752238219.2264328.12847766332866218872@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603142823.720213-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240603142823.720213-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: validate client of BO inside lock
URL   : https://patchwork.freedesktop.org/series/134385/
State : warning

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
commit 6d81f44a197b41bd0c909547aa107b4b4d724b91
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Jun 3 19:58:23 2024 +0530

    drm/xe: validate client of BO inside lock
    
    As client of BO getting referenced inside lock of BOs
    list, its good practice to move these WARN_ONs also
    under same lock to validate existance of bo->client.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 77588a3e3e58917a9b1d992aeef6f02a6b85ded5 drm-intel
6d81f44a197b drm/xe: validate client of BO inside lock
-:8: WARNING:TYPO_SPELLING: 'existance' may be misspelled - perhaps 'existence'?
#8: 
under same lock to validate existance of bo->client.
                            ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


