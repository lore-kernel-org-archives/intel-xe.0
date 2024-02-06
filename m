Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458CC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 11:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAEC10FCC7;
	Tue,  6 Feb 2024 11:10:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CD910FCC7;
 Tue,  6 Feb 2024 11:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_xe/xe=5Fbo=5Fmove=3A?=
 =?utf-8?q?_Enhance_xe=5Fbo=5Fmove_trace_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 11:10:27 -0000
Message-ID: <170721782716.1055287.10782497281757382495@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev4)
URL   : https://patchwork.freedesktop.org/series/128151/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7c79a8cb4 drm-tip: 2024y-02m-06d-10h-53m-22s UTC integration manifest
=== git am output follows ===
Applying: xe/xe_bo_move: Enhance xe_bo_move trace


