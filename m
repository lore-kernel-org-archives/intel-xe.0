Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E066AC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57C110E00A;
	Thu, 16 Nov 2023 19:43:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2E9B10E00A;
 Thu, 16 Nov 2023 19:43:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CCA5DAADF1;
 Thu, 16 Nov 2023 19:43:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 16 Nov 2023 19:43:19 -0000
Message-ID: <170016379980.3092.2345569926976756106@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116194047.214330-1-matthew.brost@intel.com>
In-Reply-To: <20231116194047.214330-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Allow_num=5Fbinds/num=5Fbatch=5Fbuffer_to_be_zero_IOCTLs?=
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

Series: Allow num_binds/num_batch_buffer to be zero IOCTLs
URL   : https://patchwork.freedesktop.org/series/126546/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6253cfa4c drm/xe/pmu: Drop interrupt pmu event
=== git am output follows ===
Applying: drm/xe: Allow num_binds == 0 in VM bind IOCTL
Applying: drm/xe: Use a flags field instead of bools for VMA create
Applying: drm/xe: Use a flags field instead of bools for sync parse
Applying: rm/xe: Allow num_batch_buffer == 0 in exec IOCTL
Applying: drm/xe: Take in-syncs into account when num_execs or num_binds == 0


