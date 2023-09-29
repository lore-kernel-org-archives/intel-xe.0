Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595D3E728CF
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 18:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190AB10E1AA;
	Fri, 29 Sep 2023 18:21:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99BCE10E1A6;
 Fri, 29 Sep 2023 18:21:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 93067AADF2;
 Fri, 29 Sep 2023 18:21:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Date: Fri, 29 Sep 2023 18:21:06 -0000
Message-ID: <169601166659.19496.8687558314564461100@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/3=5D_drm/xe/vm=3A_print_the_correc?=
 =?utf-8?q?t_=27keep=27_when_printing_gpuva_ops?=
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

Series: series starting with [1/3] drm/xe/vm: print the correct 'keep' when printing gpuva ops
URL   : https://patchwork.freedesktop.org/series/124465/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ce84294f7 drm/xe: timeout needs to be a signed value
=== git am output follows ===
Applying: drm/xe/vm: print the correct 'keep' when printing gpuva ops
Applying: drm/xe/vm: use list_last_entry() to fetch last_op
Applying: drm/xe: fix range printing for debug messages


