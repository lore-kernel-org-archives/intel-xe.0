Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9430D21699
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 12:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D14710E0B1;
	Tue, 15 Oct 2024 12:47:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC1210E0B1;
 Tue, 15 Oct 2024 12:46:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_ufence_addr_valid?=
 =?utf-8?q?ation_and_error_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Oct 2024 12:46:59 -0000
Message-ID: <172899641956.1268958.7409851178349759294@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015090546.3082719-1-nirmoy.das@intel.com>
In-Reply-To: <20241015090546.3082719-1-nirmoy.das@intel.com>
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

Series: Improve ufence addr validation and error handling
URL   : https://patchwork.freedesktop.org/series/139991/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 97ffd24419090050d410126f2c670c977c114564
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Oct 15 11:05:46 2024 +0200

    drm/xe/ufence: Warn if mmget_not_zero() fails
    
    This shouldn't happen but seen this while debugging ufence timeout
    issue time to time so log it to isolate this particular case.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch f98f4e573392b882c0ca5aa1c025e20dbe4aa7e8 drm-intel
fcf0c274a1b6 drm/xe/ufence: Prefetch ufence addr to catch bogus address
97ffd2441909 drm/xe/ufence: Warn if mmget_not_zero() fails


