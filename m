Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ACCC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CB010E1DD;
	Fri, 26 May 2023 17:34:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83A0E10E1DD;
 Fri, 26 May 2023 17:34:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6ED08AADD6;
 Fri, 26 May 2023 17:34:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 26 May 2023 17:34:45 -0000
Message-ID: <168512248542.32383.18161331047718389804@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_RPLS_and_other_minor_support?=
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

Series: RPLS and other minor support
URL   : https://patchwork.freedesktop.org/series/118442/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4b72ead33 drm/xe/pvc: Don't try to invalidate AuxCCS TLB
=== git am output follows ===
Applying: drm/xe/adlp: s/ADLP/ALDERLAKE_P
Applying: drm/i915/adlp: s/ADLP/ALDERLAKE_P
Applying: drm/xe/adlp: Add missing ADL-P entry in xw_test_wa
Applying: drm/xe/rpls: Add RPLS Support
Applying: drm/xe/rpls: Add Stepping info for RPLS
Applying: drm/xe/rpl: Add missing RPLP and RPLS entry in xe_wa_test


