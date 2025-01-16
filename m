Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C94E77188
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 06:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467BD10E19F;
	Thu, 16 Jan 2025 06:41:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7C510E141;
 Thu, 16 Jan 2025 06:41:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Suppress_p?=
 =?utf-8?q?rinting_of_mode_when_running_in_non-sriov_mode=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jan 2025 06:41:15 -0000
Message-ID: <173700967562.168752.14776024970364538307@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe: Suppress printing of mode when running in non-sriov mode.
URL   : https://patchwork.freedesktop.org/series/143584/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4cea1f900289 drm-tip: 2025y-01m-16d-00h-44m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Suppress printing of mode when running in non-sriov mode.


