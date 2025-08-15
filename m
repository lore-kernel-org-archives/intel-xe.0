Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2BCA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 16:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6E410E25A;
	Fri, 15 Aug 2025 16:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XVylbufn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98210E25A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1uDvpIa80NM8Xn774yj9DCz80Nyq62nAy90MDgvRb0=; b=XVylbufn72zpheVkLsCMHUBElJ
 ZiSKzsF4F/TPhXBUIb+8TlvsAaL/Om4jYf+bcL1gOmrbINoYgSB2+zF8kpupsGZwZ7l6KNgwqrugh
 I0nzMeN3bJTr7u9vrmJUjcG2bx/MGHABXOHM/DdBD+wFsNr6YjFrPFXFpXUhN+vvUTebgsmAIdoVg
 RsbJpSaGp62OUpAHetPGFRgN6zwL3i68QrtIACTydo72RShjrSNUSgNkExSouBzQl9W3kG321S5di
 Ohe7daP9FXbzD6MHOG+SYdzn56C679v7wBMuexuAZANdK2UsE6GQRAubqJQOGujbTAHx8m1CK99Wv
 QFZVnRNA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1umxan-00EjP5-FS
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 18:47:49 +0200
Message-ID: <07ec750c-2fe7-4257-abf9-883888715797@igalia.com>
Date: Fri, 15 Aug 2025 17:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers_=28rev11=29?=
To: intel-xe@lists.freedesktop.org
References: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
 <175527461449.240597.15643360090210875927@1538d3639d33>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <175527461449.240597.15643360090210875927@1538d3639d33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


Out of "New IGT tests (44)" only one failed:

igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:

In "Possible regressions" there was:

igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-rc-ccs:

     shard-adlp: NOTRUN -> FAIL +1 other test fail

Although I am not sure why is that one not under new tests too and which 
one it counted as +1. I guess the one from "New IGT tests".

Then there are "Possible fixes":

igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:

     shard-adlp: SKIP (Intel XE#787) -> PASS +77 other tests pass

igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:

     shard-adlp: SKIP (Intel XE#455 / Intel XE#787) -> PASS +51 other 
tests pass

igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:

     shard-adlp: SKIP (Intel XE#455) -> PASS +5 other tests pass

I summary a huge amount of new passes but the 2 failures seem to have a 
commonality of either pipe D or render compression. Could be that the 
flushing for RC CCS is still insufficient.

I've pressed re-test one more time to see if the commonality with 
failure stays the same.

Regards,

Tvrtko

