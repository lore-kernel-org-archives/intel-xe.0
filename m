Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B1C47073
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 21:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250110E2E6;
	Mon,  8 Jan 2024 21:50:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B3810E339
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 21:33:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B29D1B81879;
 Mon,  8 Jan 2024 21:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEB0C433F1;
 Mon,  8 Jan 2024 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704749617;
 bh=lmwJ4TYsfZDUfDxWWmBpM5usHBUnDUnWhMnytg9qbfw=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=CCIZZa+PTCgih80p2a6lysWTn0GEWXIsYpz5GgrSUu+UWo80BFZTmNY7zOQoLb3++
 /ZMY0aE76dEbmada0x3aRrNhEKb4BKAFGk13QTCMCJBR9m3+tspthOaH9wZSJMKCs2
 LQpfUhOE2Un0F+kCr84TEBBLnU9v+K3n8UiQfom4SvXfoRFTjvovxr9vIvN1am/UzA
 eg6vrIZPjcTGWeJpubTmfEnaFao5q1MwWYJdKt3QVKgDxbZoMOuOjw6Acl4n4XMBWW
 m2g50UiCbiT3Sav6YrEFHoT6xnqRJ10FJa8jyJMxXL70S+f2kfAhPMh+ajuoCms543
 i4tvKHSj43WPA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 95715CE1FD6; Mon,  8 Jan 2024 13:33:36 -0800 (PST)
Date: Mon, 8 Jan 2024 13:33:36 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: lucas.dimarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com
Subject: [BUG] allmodconfig build error in next-20240108
Message-ID: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jan 2024 21:50:02 +0000
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
Reply-To: paulmck@kernel.org
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hello!

Recent -next trees get the following build error for allmodconfig builds:

------------------------------------------------------------------------

drivers/gpu/drm/xe/xe_gt_pagefault.c: In function ‘xe_guc_pagefault_handler’:
./include/linux/fortify-string.h:57:33: error: writing 16 bytes into a region of  size 0 [-Werror=stringop-overflow=]
   57 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
./include/linux/fortify-string.h:644:9: note: in expansion of macro ‘__underlying_memcpy’
  644 |         __underlying_##op(p, q, __fortify_size); \
      |         ^~~~~~~~~~~~~
./include/linux/fortify-string.h:689:26: note: in expansion of macro ‘__fortify_memcpy_chk’
  689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s, \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/xe/xe_gt_pagefault.c:340:17: note: in expansion of macro ‘memcpy’
  340 |                 memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
      |                 ^~~~~~
In file included from drivers/gpu/drm/xe/xe_device_types.h:17,
                 from drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from drivers/gpu/drm/xe/xe_bo.h:13,
                 from drivers/gpu/drm/xe/xe_gt_pagefault.c:16:
drivers/gpu/drm/xe/xe_gt_types.h:102:25: note: at offset [1144, 265324] into destination object ‘tile’ of size 8
  102 |         struct xe_tile *tile;
      |

------------------------------------------------------------------------

							Thanx, Paul
