Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A7C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 09:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92F10E251;
	Tue, 21 Nov 2023 09:37:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0710E254;
 Tue, 21 Nov 2023 09:37:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6A6A6A3ECB;
 Tue, 21 Nov 2023 09:37:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Tue, 21 Nov 2023 09:37:25 -0000
Message-ID: <170055944543.30160.4525253181325757825@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231121084731.2588879-1-riana.tauro@intel.com>
In-Reply-To: <20231121084731.2588879-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/pmu=3A_Drop_interrupt_pmu_event_=28rev3=29?=
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

Series: fixup! drm/xe/pmu: Drop interrupt pmu event (rev3)
URL   : https://patchwork.freedesktop.org/series/126643/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ccd179c09ec385af3a6362ddfeaf0295c3035a90
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Nov 21 14:17:31 2023 +0530

    fixup! drm/xe/pmu: Drop interrupt pmu event
    
    Interrupt pmu event was dropped in a previous patch
    and the configs for the rest of the events were changed
    in uapi header.
    
    Change the configs in pmu file too.
    
    v2: change to fixup patch
    v3: rebase
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 723ff01a3dd919ece2542a522b5c6caf13a56daf drm-intel
ccd179c09 fixup! drm/xe/pmu: Drop interrupt pmu event


