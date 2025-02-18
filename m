Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1191C021AD
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 20:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565AC10E451;
	Tue, 18 Feb 2025 20:49:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677B410E451;
 Tue, 18 Feb 2025 20:49:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Drop_unnecessar?=
 =?utf-8?q?y_GT_lookup_in_xe=5Fexec=5Fqueue=5Fcreate=5Fioctl=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 20:49:45 -0000
Message-ID: <173991178541.3666645.6477691364960467842@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218200511.4050060-2-matthew.d.roper@intel.com>
In-Reply-To: <20250218200511.4050060-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()
URL   : https://patchwork.freedesktop.org/series/145039/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4733041211a97e0455bac92cfb58f9de54b461fb
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Feb 18 12:05:12 2025 -0800

    drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()
    
    xe_exec_queue_create_ioctl() performs a lookup of the xe_gt for the GT
    ID passed from userspace, but the result is never actually used.  Since
    there's already a separate (and earlier) check that the ID passed from
    userspace is valid, the unnecessary lookup can be removed.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 88f261625e1d94c7eba789712b060b368989aea1 drm-intel
4733041211a9 drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()


