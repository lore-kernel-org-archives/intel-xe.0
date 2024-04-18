Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B602C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567F113BD6;
	Thu, 18 Apr 2024 14:15:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A63A10FCC3;
 Thu, 18 Apr 2024 14:15:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_allow_unal?=
 =?utf-8?q?igned_start_and_size_xe=5Fres=5Fcursor_parameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 14:15:19 -0000
Message-ID: <171344971956.1501117.12325021561589916295@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
In-Reply-To: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
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

Series: drm/xe: allow unaligned start and size xe_res_cursor parameters
URL   : https://patchwork.freedesktop.org/series/132605/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4eddedf2b31b drm-tip: 2024y-04m-18d-12h-32m-54s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: allow unaligned start and size xe_res_cursor parameters


