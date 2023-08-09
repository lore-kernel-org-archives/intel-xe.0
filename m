Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B02C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 12:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232610E42D;
	Wed,  9 Aug 2023 12:35:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D927D10E42D;
 Wed,  9 Aug 2023 12:35:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CF0F2A00E8;
 Wed,  9 Aug 2023 12:35:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Date: Wed, 09 Aug 2023 12:35:40 -0000
Message-ID: <169158454081.10294.1171317867516248164@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Different_platforms_has_different_PAT_encoding_in_PTE_and_PD?=
 =?utf-8?q?E_format=2C_add_correct_PAT_encoding_for_pre-Xe2_platforms_=28X?=
 =?utf-8?q?ELP=2C_XEHPC=2C_XELPG=29=2E?=
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

Series: Different platforms has different PAT encoding in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
URL   : https://patchwork.freedesktop.org/series/122222/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 2ef5b2cdb drm/xe: Implement HW workaround 14016763929
=== git am output follows ===
Applying: Different platforms has different PAT encoding in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).


