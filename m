Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D1C61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 14:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2010E4B5;
	Tue, 21 Nov 2023 14:12:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 260E310E4B5;
 Tue, 21 Nov 2023 14:12:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1F372AADE1;
 Tue, 21 Nov 2023 14:12:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 21 Nov 2023 14:12:53 -0000
Message-ID: <170057597312.30157.6969507452178405871@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_GSC_FW_loading_=28rev5=29?=
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

Series: GSC FW loading (rev5)
URL   : https://patchwork.freedesktop.org/series/125717/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c9574aef8 fixup! drm/xe/pmu: Drop interrupt pmu event
=== git am output follows ===
.git/rebase-apply/patch:85: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: fixup! drm/xe/guc: Report submission version of GuC firmware
Applying: drm/xe/uc: Rework uC version tracking
Applying: drm/xe/gsc: Introduce GSC FW
Applying: drm/xe/gsc: Parse GSC FW header
Applying: drm/xe/gsc: GSC FW load
Applying: drm/xe/gsc: Implement WA 14015076503
Applying: drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
Applying: drm/xe/gsc: Query GSC compatibility version
Applying: drm/xe/gsc: Define GSCCS for MTL
Applying: drm/xe/gsc: Define GSC FW for MTL


