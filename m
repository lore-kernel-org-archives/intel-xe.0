Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C809C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 05:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6210E4E6;
	Tue, 22 Apr 2025 05:11:52 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB1B10E4E6;
 Tue, 22 Apr 2025 05:11:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_xe=5Fsvm?=
 =?utf-8?q?=5Frange=5Falloc_should_return_NULL_upon_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 05:11:51 -0000
Message-ID: <174529871163.23907.5165381008067932206@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
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

Series: drm/xe: xe_svm_range_alloc should return NULL upon error
URL   : https://patchwork.freedesktop.org/series/148047/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7453e9c769c0 drm-tip: 2025y-04m-21d-17h-32m-12s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: xe_svm_range_alloc should return NULL upon error


