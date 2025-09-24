Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AF1CAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5648A10E6CE;
	Wed, 24 Sep 2025 11:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EqBrLxzS";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A9A10E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=qcgI/tmbrIW728HmneBVpQDN55CCc8+XNctkJzw98gw=; b=EqBrLxzS1k+hVuE7ouDoJ99bpM
 InaSw78IAACbl0K+zek8THIGczD1Y3D2ZQJ8rgOBiRc6nqsVuY2qQm7NkITdJP1XaASfcnf+zP2r/
 ik2Hs2RRXeI38xj4kVnZbsu7YKXeqPYq8P5ikNb+BGsSi2zmUOin83TAZAM2qn1E74ZJdi9c9QBpH
 HeAtrTn8EQJg3Vv/LQeKbSOMh9l+qQln+6mB1G7uF7eXPMYRV9BKDjpcEwxdz4j0psKVThIkMPRQW
 1Csofj6m1IjboHj43yppPfa+9N7alG339CUFvzJP2Dw1Hy1IOunhMPvvr8BmM4GH2gAX64JptLp5o
 rqtxwIKg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v1Ndn-00Gqz1-Mq; Wed, 24 Sep 2025 13:26:31 +0200
Message-ID: <90ac93f9-90c4-4283-9dd7-f274cda34615@igalia.com>
Date: Wed, 24 Sep 2025 12:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_star?=
 =?UTF-8?Q?ting_with_=5B1/2=5D_drm/xe=3A_Fix_ggtt_fb_alignment?=
To: intel-xe@lists.freedesktop.org
References: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
 <175871229206.361551.6945179096330158702@1538d3639d33>
Content-Language: en-GB
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <175871229206.361551.6945179096330158702@1538d3639d33>
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



On 24/09/2025 12:11, Patchwork wrote:

[snip]

>         Possible regressions
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-
>     atomic@pipe-d-dp-2-4:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-154941v1/shard-bmg-1/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled-
>         atomic@pipe-d-dp-2-4.html> +8 other tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-
>     hdmi-a-3-4:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/shard-bmg-5/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         c-hdmi-a-3-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-154941v1/shard-bmg-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         c-hdmi-a-3-4.html> +18 other tests dmesg-warn

Mysterious page faults. Looks like the BMG failures due DPT alignment / 
512 were real after all. Does it provide any hint to you Ville?

Regards,

Tvrtko

