Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C0C76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 00:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAB10E452;
	Tue, 11 Apr 2023 00:33:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B64410E452;
 Tue, 11 Apr 2023 00:33:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 838D0AA3D8;
 Tue, 11 Apr 2023 00:33:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 11 Apr 2023 00:33:23 -0000
Message-ID: <168117320349.13170.4165834927433415755@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230411002800.2779322-1-matthew.d.roper@intel.com>
In-Reply-To: <20230411002800.2779322-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Invalidate_media_GT_TLB_for_objects_mapped_by_medi?=
 =?utf-8?q?a_GT?=
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

Series: drm/xe: Invalidate media GT TLB for objects mapped by media GT
URL   : https://patchwork.freedesktop.org/series/116292/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 9e9d9c1c2444672951809702f96f8257c367771a
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Mon Apr 10 14:26:58 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Mon Apr 10 15:04:50 2023 -0700

    drm/xe: Don't grab runtime PM ref in engine create IOCTL
    
    A VM had a runtime PM ref, a engine can't be created without a VM, and
    the engine holds a ref to the VM thus this is unnecessary. Beyond that
    taking a ref in the engine create IOCTL and dropping it in the destroy
    IOCTL is wrong as a user doesn't have to call the destroy IOCTL (e.g.
    they can just kill the process or close the driver FD). If a user does
    this PM refs are leaked.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
Applying: drm/xe: Invalidate media GT TLB for objects mapped by media GT


