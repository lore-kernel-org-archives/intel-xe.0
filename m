Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5914EC6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 10:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144C10E8E6;
	Wed, 22 Mar 2023 10:38:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E61E110E8E6;
 Wed, 22 Mar 2023 10:38:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DD775AA917;
 Wed, 22 Mar 2023 10:38:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 22 Mar 2023 10:38:40 -0000
Message-ID: <167948152090.13422.3537717944181535070@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230322103545.272048-1-matthew.auld@intel.com>
In-Reply-To: <20230322103545.272048-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe/gt=3A_some_error_handling_fixes?=
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

Series: drm/xe/gt: some error handling fixes
URL   : https://patchwork.freedesktop.org/series/115507/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit a2ed856be77000c19b22c859bb34e85c64e37ef9
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Mon Mar 20 10:46:24 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Tue Mar 21 18:14:54 2023 -0700

    drm/xe: Drop zero length arrays
    
    Zero-length arrays as fake flexible arrays are deprecated and we are
    moving towards adopting C99 flexible-array members instead.
    
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
Applying: drm/xe/gt: some error handling fixes


