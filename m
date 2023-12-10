Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F8DC4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CE710E036;
	Sun, 10 Dec 2023 18:53:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7AC410E036;
 Sun, 10 Dec 2023 18:52:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AFAF5AADD6;
 Sun, 10 Dec 2023 18:52:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_GuC_Doorbe?=
 =?utf-8?q?lls_Manager?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Sun, 10 Dec 2023 18:52:59 -0000
Message-ID: <170223437968.19110.12242576380156917969@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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

Series: Introduce GuC Doorbells Manager
URL   : https://patchwork.freedesktop.org/series/127608/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 1fc141d1f drm/xe: Add frequency throttle reasons sysfs attributes
=== git am output follows ===
.git/rebase-apply/patch:108: trailing whitespace.
 * 
.git/rebase-apply/patch:211: trailing whitespace.
 * @dbm: the &xe_guc_db_mgr 
.git/rebase-apply/patch:236: trailing whitespace.
 * @dbm: the &xe_guc_db_mgr 
warning: 3 lines add whitespace errors.
Applying: drm/xe: Add GT oriented drm_printers
Applying: drm/xe: Use GT oriented functions to report TLB timeout
Applying: drm/xe: Introduce GuC Doorbells Manager
Applying: drm/xe/kunit: Set SR-IOV mode of the fake device
Applying: drm/xe/kunit: Define helper functions to allocate mock device
Applying: drm/xe/kunit: Use xe kunit helpers in RTP test
Applying: drm/xe/kunit: Use xe kunit helpers in WA test
Applying: drm/xe/kunit: Add GuC Doorbell Manager tests


