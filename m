Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D25C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 23:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A410E788;
	Fri,  3 Mar 2023 23:28:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E4A910E788;
 Fri,  3 Mar 2023 23:28:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6764FAADE8;
 Fri,  3 Mar 2023 23:28:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 03 Mar 2023 23:28:44 -0000
Message-ID: <167788612439.9998.11427980077701623407@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Assorted_MOCS_updates_=28rev3=29?=
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

Series: Assorted MOCS updates (rev3)
URL   : https://patchwork.freedesktop.org/series/114121/
State : failure

== Summary ==

error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:247
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:381
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:23
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:352
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:62
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_ads.c:224
error: drivers/gpu/drm/xe/xe_guc_ads.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mocs.c:25
error: drivers/gpu/drm/xe/xe_mocs.c: patch does not apply


