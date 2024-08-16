Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CC0C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 09:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6763310E57C;
	Fri, 16 Aug 2024 09:16:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3910E57C;
 Fri, 16 Aug 2024 09:16:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Remove_a_r?=
 =?utf-8?q?edundant_NULL_lrc-=3Ebo_check_as_a_lrc_will_always_have_a_bo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Singh, Apoorva" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 09:16:25 -0000
Message-ID: <172379978563.652113.12468623551411403387@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816082820.897326-1-apoorva.singh@intel.com>
In-Reply-To: <20240816082820.897326-1-apoorva.singh@intel.com>
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

Series: drm/xe: Remove a redundant NULL lrc->bo check as a lrc will always have a bo
URL   : https://patchwork.freedesktop.org/series/137378/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 70d6d55dea57 drm-tip: 2024y-08m-16d-08h-43m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove a redundant NULL lrc->bo check as a lrc will always have a bo


