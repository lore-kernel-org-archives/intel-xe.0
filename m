Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E573C624DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 13:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AA710F5F8;
	Thu,  3 Sep 2026 13:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rA+zS1D3";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1476D10F5E2
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:44:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so1336732f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788443051; x=1789047851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tZmxOqMZSbeiSR0GbmGkaC/SGeiqRevrAyyYwxpdgiU=;
 b=rA+zS1D3Cw6VzQUneegQ+dzWKnma6J9hA1aX7fy3tU1GEoF7aqIt2QQnrJVT1WnNa7
 PtISCV6cJ4nsZ5N6PaxuAbaWDZRWCb/Xw5Br8U43gJcGYRrhsquq26bXDusITnWOFJJV
 5xOehGlOkfLs/oy6PHr6Wo1FR8g1WDpvqBGSbi6lVY4gkNf0XrI/YycKEdnNn5KQqdSr
 t+i4V1i+mMAhee7nyeLfyd8+IlHDWpBf9wtfeydhEge+bJFLMXER03h90jdgebxMsjbz
 B7pftE7Ns70cLNAAX/nUqiV3GR9sESW+1DzF6rD4mb+V8Uoss4mP1YyrvA3TjLKCaSL5
 8Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443051; x=1789047851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=tZmxOqMZSbeiSR0GbmGkaC/SGeiqRevrAyyYwxpdgiU=;
 b=jksUv6+8yN+jCwfxzpMZ1ahbbS096RT7Cdt4bTBlAS7O/oPDsbsvMZ1Rk7QrgMKZ0b
 XFZHTLpqAjPC44j3F3nZwkPosMvetdMpX9J7IJOsSvSeij/HY095TPWcvvmVZMz1kuZX
 oOzrr+hfeK+wfsfwt+bDFeF6ROtYuVO4C6Ov/6TLzOFRspFy/yRjlSfPwF9/EUkBMAZ3
 e4p/S4XsoYE+qhXkUqkJMQezvCi0GvkO9HD6NhBlXwJdFAunQbrrKs8OnYIPrGIRjNcZ
 uk/Rsghz0P5/dR2A+eaZ5aE4IVzQggP3Yx2C8oNI1sHAQeG567seiqQEaQBxgEidcjPv
 GtGw==
X-Forwarded-Encrypted: i=1;
 AKwUvByvdMVy+CXrn44WkrpTUtS4YgO4g8ctWH8+RoP68kdFmJ2syV7CZQsOYdMfft/IoAaOGay7HcbPJQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++n+OiOnTGHNrWJpm6LEzyZJmvi1AtHZBJ4JH6K4irAkE2ybcEIZ
 cegDN4rqz12H7NcghJHdQKwM97DQ6CxVJqFwTHnKqOvNoUKMzAP/suJa
X-Gm-Gg: AYBFou19/SM+kimVpbvlh8OyS95/W07jYWnkZGzhkMdjOlrT1QcL4i4nnvmQFyoEpaD
 8Khcn0YApsKEfsFOzYprD/jGk3/2GNYLpHC4f5jNLip7JRQHL22eMiMKyTmKiYE884a6RvxXFJ/
 Qutyu3KzOVf2jbPHrKH8DvmUU54mO09SzRsPMonNxLkDcyHM9lSR5fL16qUcbD42bx8SUOspsL4
 FznaYHV9eZAFg8Yo9R++eU8C1YW73Adq1OnbGmccrw3AmpQNI5zFNbGr80l1D0k2hOi9fI1xQ2f
 6R5nqQmPyAakB4LkrKl5QPaolXnzyFMNQoknefPy+4FHZLvRVRdwOiEFYPc68OcvYPBBfBspxDK
 xDEfuSJtrZqEqDvyBoSBeSyHnw30BCB67q4aWEDGpvFhfxDuJpGg2lbN3jMrtUpOfRVbK8oN3U4
 /hkWCmWkQlxXBB4CUjp1EhtEK4993omfnO+w4nQgtVplQvtHdGZ7eS4/DXfwQnu+gre3FaZqMvd
 w==
X-Received: by 2002:a05:6000:196f:b0:481:98d:b24 with SMTP id
 ffacd0b85a97d-484913b9a8dmr18125062f8f.19.1788443051084; 
 Thu, 03 Sep 2026 06:44:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d9:4700:e712:9f38:603a:54e4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm13597080f8f.5.2026.09.03.06.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:44:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Refcounting dma_resv v3
Date: Thu,  3 Sep 2026 15:27:55 +0200
Message-ID: <20260903134408.105317-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi everybody,

The idea of ref-counting dma_resv or ww_mutex came up multiple times from
different people, but so far at least I have abandoned that as to
complicated to implement considering how widely used that object is.

Thanks to AI I gave the task to refcount dma_resv to Claude Sonet 4 just
to check how horrible it would look like.

Well turns out that this is actually a cleanup we should most likely aim
for and I'm really wondering why we haven't done it like this in the
first place.

Not only resolves it a bunch of issues with dma_resv instances shared by
multiple GEM objects (we just recently had a bunch of patches for that on
the mailing list), but also allows TTM to implement it's delayed delete
handling without any zombie resurrection or similar hacks and DMA-buf to
have better contention handling on map/pin in the future.

v2:

This patch set here is now the idea full flashed out. I smoke tested it
with amdgpu, self tests and checked everything with kmemleak and of hand
it seems to work.

Patch #1 introduces an interim allocated flag to allow switching users
over to the new interface one by one. Patch #10 then removes that flag
again after everything is done.

v3:

Well distrusting Sonet proved to be correct. It turned out that the AI
missed tons of issues. Most of them are hopefully fixed in this
iteration of the patch set now.

Sashiko-bot on the other hand proved to be extremely useful. It not only
pointed out tons of stuff Sonet missed but also a complicated pre-existing
bug in i915.

The first patch in this series is now fixing this i915 bug, I've send
this to the relevant mainatiners separately and only include it here for
completeness.

Please review and comment.

Cheers,
Christian.



