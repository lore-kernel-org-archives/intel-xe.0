Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3789CE8D61
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04510E6B6;
	Thu, 19 Sep 2024 09:16:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D828710E6B6;
 Thu, 19 Sep 2024 09:16:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_dma-buf/dma-fence=3A?=
 =?utf-8?q?_Use_a_successful_read=5Ftrylock=28=29_annotation_for_dma=5Ffence?=
 =?utf-8?q?=5Fbegin=5Fsignalling=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 09:16:50 -0000
Message-ID: <172673741087.1034094.1068442875519583531@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
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

Series: dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling() (rev2)
URL   : https://patchwork.freedesktop.org/series/117113/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2a472f4478e3 drm-tip: 2024y-09m-19d-08h-28m-59s UTC integration manifest
=== git am output follows ===
Applying: dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling()


