Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A2CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 14:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B4112691;
	Mon,  8 Apr 2024 14:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dev-mail.net header.i=@dev-mail.net header.b="YyDUoKFi";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xijw+Hg1";
	dkim-atps=neutral
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Mon, 08 Apr 2024 14:36:18 UTC
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501811269C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 14:36:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id 810D81800144
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 10:27:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Apr 2024 10:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev-mail.net; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1712586428; x=1712672828; bh=DNl0tuuK+P0e0IqFZ10d7cYw+n9stgOKnmt
 SDBpb1aY=; b=YyDUoKFis3DyeIf4MjLzvZlVvTMQGZpxCaW9OEAlxhbnfFFOGhz
 7FZgi/O3bewch/+51kZgzo94LLMaaTjRVk42JKk0vDrr3/a8wZpdnId0mROYa95f
 GvJ7lXAqXuMncmYDfix8Gs97SDKkpnUekBS2L7/NbSUJDboMmpkfNNaCP9XRGrQc
 p2qudUiQKICd64mE+JmHPQt6LIo7oyuusIjV1di+FLTpF+nlLqSG4R8DMvW4I3W2
 lE+ufEgStWvVEkXHDXvLnAaUCO/37Qgj5Bjy2R3KU5+KOWctHsdR6cPlsUG7F2Dq
 MsK2Z49wTEM/oOH6YpNaJ5sQ9LgilynuTNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712586428; x=
 1712672828; bh=DNl0tuuK+P0e0IqFZ10d7cYw+n9stgOKnmtSDBpb1aY=; b=X
 ijw+Hg1hcKlT5MZt4uVWiJRoKmYiJuemNW+/r/B04OORkGN1RdNT8ngQ0VYNLjP3
 meXJlJo09RoH7AFIXBAR8tINZYL5/SgDGPFSO17mIdyhq0qjaQpuGdZ+8/yMKb2B
 9TNvhKZsmWcYcS8s6inCxEI/KkxocxurEKT6gPFoLwkD2+hM56Fd/KkC8YgWlfy0
 t+gYjHOvMOjZYUyH56Xt2oKWGpEgO3nuL+AvKqW2um5kuFrzxEnt6lRveapyHWpL
 uPv/wuZmtsn/a5o8ia1kkN5q6bRgpu7PYg6u2U8pPhkrlZSVgSGznOJN4i7lSPuZ
 KepBk6cUBaH6Xa/u2wPlw==
X-ME-Sender: <xms:u_4TZml1CNwgrMrO9IIu7mN_rfAmYUlMW6G8XJW85UL-q7xT8VYKEQ>
 <xme:u_4TZt1v2NvsZV2JZ4aGyO_QvxQ5yxOl-z36nHfxFlUvzxbrIhsNE4JwUrh88-HG5
 WdP0IBgQFTKbtb->
X-ME-Received: <xmr:u_4TZkqHxMyUJGbWZ2rg2bixtRGXTgqFKp3DV_qQ1CI_25cGCf4EshL8UHVRbxvZyiAiCGSRR1jQjExOuxYuYJ_bVM3wWOYXF7vhbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfghruffvfhfhjggtgfesth
 ejredttddvjeenucfhrhhomhepphhgnhguuceophhgnhguseguvghvqdhmrghilhdrnhgv
 theqnecuggftrfgrthhtvghrnhepgfektedtteevleffheetgeeguedtheeiledvvdefhf
 eliedvteehjefhhfettefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhgnh
 guseguvghvqdhmrghilhdrnhgvth
X-ME-Proxy: <xmx:u_4TZqmCVeoENrCy1D5mGi-8w6kfn8_q2BhH2BHRfHSeK5yHdwGeyw>
 <xmx:u_4TZk083NfBfUf0J-uXN1-xg8g_u8ipeHHFt1ig5gz3Wcl84bIFpg>
 <xmx:u_4TZht31aSBPgk1iXm95WHjzdh58VYpMML5bLto2cILkeLhdo4jbg>
 <xmx:u_4TZgWKZ6G5QEjvE8xDglk9dLj8fu6L-Ba2jhA_M1-s5yXaOH1Mdw>
 <xmx:vP4TZnR0vH8Jz7uKJi9sY8yl8amSieDoSdkPaO3NXWv1naweZ8pjb-mZ>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <intel-xe@lists.freedesktop.org>; Mon, 8 Apr 2024 10:27:07 -0400 (EDT)
Message-ID: <74d56830-c3b4-4051-b14e-917373c5439f@dev-mail.net>
Date: Mon, 8 Apr 2024 10:27:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel 6.8.4 + intel Xe driver boot errors: "xe 0000:09:00.0:
 [drm] *ERROR* Fault errors on pipe A: 0x00000800" ?
Content-Language: en-US, fr, de-DE, pl, es-ES
To: intel-xe@lists.freedesktop.org
References: <e32c71e6-5370-4691-a9f9-82c07dab3c1c@dev-mail.net>
 <30ebffd1bdad998d9e25146f34f25a27ef233f99.camel@intel.com>
From: pgnd <pgnd@dev-mail.net>
In-Reply-To: <30ebffd1bdad998d9e25146f34f25a27ef233f99.camel@intel.com>
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
Reply-To: pgnd@dev-mail.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> It is a Xe KMD know issue,https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/282

subscribed.

thx o/

