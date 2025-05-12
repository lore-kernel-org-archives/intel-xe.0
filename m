Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A5C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 14:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D0B10E087;
	Mon, 12 May 2025 14:50:19 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B210E087;
 Mon, 12 May 2025 14:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_SVM_atomics_i?=
 =?utf-8?q?n_Xe_/_GPU_SVM_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 14:50:18 -0000
Message-ID: <174706141811.69697.11141598579041538211@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512135500.1405019-1-matthew.brost@intel.com>
In-Reply-To: <20250512135500.1405019-1-matthew.brost@intel.com>
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

Series: Enable SVM atomics in Xe / GPU SVM (rev8)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f3767db51c5d drm-tip: 2025y-05m-12d-14h-06m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: Introduce devmem_only flag for allocation
Applying: drm/xe: Strict migration policy for atomic SVM faults
Applying: drm/gpusvm: Add timeslicing support to GPU SVM
Applying: drm/xe: Timeslice GPU on atomic SVM fault
Applying: drm/xe: Add atomic_svm_timeslice_ms debugfs entry


