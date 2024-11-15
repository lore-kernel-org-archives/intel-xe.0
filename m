Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C440D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 16:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBEF10E162;
	Fri, 15 Nov 2024 16:40:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B618710E042;
 Fri, 15 Nov 2024 16:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/hw=5Fengine?=
 =?utf-8?q?=5Fgroup=3A_Fix_bad_free_in_xe=5Fhw=5Fengine=5Fsetup=5Fgroups=28?=
 =?utf-8?q?=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Su Hui" <suhui@nfschina.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 16:40:47 -0000
Message-ID: <173168884774.285105.3702802482101022284@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115024941.3737042-1-suhui@nfschina.com>
In-Reply-To: <20241115024941.3737042-1-suhui@nfschina.com>
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

Series: drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups() (rev2)
URL   : https://patchwork.freedesktop.org/series/141417/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c43ac257e8f2 drm-tip: 2024y-11m-15d-13h-20m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups()


