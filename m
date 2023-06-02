Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC43C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5D10E5F0;
	Fri,  2 Jun 2023 17:29:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A21110E5F0;
 Fri,  2 Jun 2023 17:29:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 55C16AADE1;
 Fri,  2 Jun 2023 17:29:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Fri, 02 Jun 2023 17:29:52 -0000
Message-ID: <168572699234.15699.9401278538589349566@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602172732.1001057-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20230602172732.1001057-1-mika.kuoppala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_unreffed_ptr_leak_on_engine_lookup?=
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

Series: drm/xe: Fix unreffed ptr leak on engine lookup
URL   : https://patchwork.freedesktop.org/series/118793/
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
commit 71f2ba074b69124ead53f8ee22c02c5caa75ad12
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Fri Jun 2 20:27:32 2023 +0300

    drm/xe: Fix unreffed ptr leak on engine lookup
    
    The engine xarray holds a ref to engine, guarded by the lock.
    While we do lookup for engine, we need to take the ref inside
    the lock to prevent unreffed pointer escaping and
    causing potential use-after-free after.
    
    v2: remove branch prediction hint (Thomas)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 241c03cc415b25000bdf0031349ea79f9b556297 drm-intel
71f2ba074 drm/xe: Fix unreffed ptr leak on engine lookup


