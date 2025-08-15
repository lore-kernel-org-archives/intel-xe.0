Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07BBCA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 12:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE4B10E25C;
	Fri, 15 Aug 2025 12:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LxXQgXlX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A4410E25C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C+chEl8AzIEK+DhXQRl78cNWO5bJAHG5UiZv5i1A5xk=; b=LxXQgXlXClouK3TmQqV8bhFlBd
 Ov75/w8bMw9cGa166Zu4OmThEMWu4E129yjBnH4J5PLaTk21R0j1iwsTOGf8EZUs4DzFlRWRwuwej
 EH4xOrkN2Xn3JHCHqPskL7/kbkdoacU+ROvSNKE0InHDUJVGwT0m8xZH2rzyn5dBheG01FJKB9pvT
 dqBaJgFoUUTfUntLX9yDBYxuHmQ6bpV64dYgIhW6yXfKOR1toq4Ex2VTeWhsbUdc6VtsnSIWlba4I
 h5P8PX+E3kw0s9flHYqO46jMjGaUZT+DNok+gfhnZIkJTBXQG6Cs2E97xxiX4xiF3a/YxrujVJpIN
 9L5iHAog==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1umtrO-00Edf0-UU
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 14:48:43 +0200
Message-ID: <c1099395-f591-424c-b9d9-29795289ae78@igalia.com>
Date: Fri, 15 Aug 2025 13:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers_=28rev10=29?=
To: intel-xe@lists.freedesktop.org
References: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
 <175526154857.239714.13012344318137914266@1538d3639d33>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <175526154857.239714.13012344318137914266@1538d3639d33>
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


On 15/08/2025 13:39, Patchwork wrote:
> *Patch Details*
> *Series:*	AuxCCS handling and render compression modifiers (rev10)
> *URL:*	https://patchwork.freedesktop.org/series/144186/ <https:// 
> patchwork.freedesktop.org/series/144186/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5_FULL -> xe-
>   pw-144186v10_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-144186v10_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-144186v10_FULL, please notify your bug team (I915- 
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-144186v10_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs (NEW):
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-adlp-2/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs.html> +23
>         other tests fail

Doh, it picked IGT_8494 to test with, while IGT_8495 has my vebox MOCS 
fix. Re-testing..

Regards,

Tvrtko

> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-
>     hdmi-a-1-y:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-
>         tiled@pipe-d-hdmi-a-1-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-
>         events-tiled@pipe-d-hdmi-a-1-y.html>
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-
>     hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-6/
>         igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-
>         a-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-1/igt@kms_ccs@crc-
>         primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html>
>         +7 other tests fail
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-2/
>         igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-4/igt@kms_ccs@crc-
>         sprite-planes-basic-y-tiled-gen12-mc-ccs.html> +4 other tests fail
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5_FULL and xe- 
> pw-144186v10_FULL:
> 
> 
>       New IGT tests (44)
> 
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.22] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.23] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.10] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.23] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.14] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.10] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.24] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-144186v10_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-
>     hdmi-a-1-y-rc-ccs:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-9/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         b-hdmi-a-1-y-rc-ccs.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-
>     hdmi-a-1-x:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-1/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         d-hdmi-a-1-x.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-9/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         d-hdmi-a-1-x.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-90.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_big_fb@y-tiled-
>         addfb.html> (Intel XE#2328 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2328>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@kms_big_fb@y-
>         tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/igt@kms_big_fb@yf-
>         tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_big_fb@yf-
>         tiled-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_big_fb@yf-tiled-
>         addfb-size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@kms_bw@linear-tiling-1-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@kms_bw@linear-
>         tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-1/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-bmg-ccs.html> (Intel XE#3862 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1 other test
>         incomplete
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-464/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +90 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-432/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +13 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_cdclk@plane-
>         scaling.html> (Intel XE#2724 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-432/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-2.html> (Intel XE#4416 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/
>         igt@kms_chamelium_color@ctm-green-to-red.html> (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_chamelium_edid@dp-
>         edid-change-during-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +9 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/
>         igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/
>         igt@kms_content_protection@content-type-change.html> (Intel
>         XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_cursor_crc@cursor-
>         offscreen-max-size.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@forked-bo:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_cursor_legacy@forked-bo.html> (Intel XE#5826 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5826>) +1 other test
>         abort
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#2286 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@kms_dirtyfb@fbc-
>         dirtyfb-ioctl.html> (Intel XE#5428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5428>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_dp_link_training@non-uhbr-mst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-
>         dirty-rectangle-dirtyfb-tests.html> (Intel XE#4422 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/776>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-8/
>         igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v10/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-
>         hdmi-a3.html> (Intel XE#2049 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2049> / Intel XE#2597 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +3 other
>         tests incomplete
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-2/
>         igt@kms_flip@bo-too-big-interruptible.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-bmg-4/
>         igt@kms_flip@bo-too-big-interruptible.html> (Intel XE#5826
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826>) +1
>         other test abort
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-466/
>         igt@kms_flip@bo-too-big-interruptible.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-dg2-433/
>         igt@kms_flip@bo-too-big-interruptible.html> (Intel XE#5826
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826>) +1
>         other test abort
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-lnl-7/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v10/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-8/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +2 other tests dmesg-warn
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-433/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>) +3 other tests incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-downscaling@pipe-a-default-mode.html> (Intel
>         XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +5 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +5 other
>         tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-9/
>         igt@kms_flip_tiling@flip-change-tiling.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-2/
>         igt@kms_flip_tiling@flip-change-tiling.html> (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +25 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +8 other tests skip
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/igt@kms_hdr@static-
>         swap.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_joiner@invalid-
>         modeset-force-ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/
>         igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-432/
>         igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +2 other tests fail
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_plane_lowres@tiling-yf.html> (Intel XE#2393 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2393>) +1 other test
>         skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/
>         igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +9 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_pm_backlight@fade-
>         with-suspend.html> (Intel XE#870 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_pm_lpsp@kms-
>         lpsp.html> (Intel XE#2499 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2499>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@kms_pm_rpm@modeset-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#3141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3141> / Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@kms_psr2_sf@fbc-
>         psr2-cursor-plane-move-continuous-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489> /
>         Intel XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5899>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@kms_psr2_sf@psr2-
>         overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489> / Intel
>         XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5899>) +6 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_psr2_su@page_flip-
>         nv12.html> (Intel XE#2387 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2387> / Intel XE#5899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5899>)
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@kms_psr@fbc-
>         psr2-sprite-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel
>         XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5899> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +2 other tests skip
>   *
> 
>     igt@kms_psr@psr2-sprite-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@kms_psr@psr2-sprite-
>         blt.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel
>         XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5899>) +13 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/
>         igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/igt@kms_setmode@basic-
>         clone-single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-lnl-1/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-lnl-1/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#4459 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) +1 other test
>         fail
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/igt@kms_vrr@lobf.html>
>         (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1499>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@kms_vrr@seamless-rr-
>         switch-virtual.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/
>         igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#5890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5890>) +1 other test
>         fail
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-userptr-faultable:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@xe_eudebug@basic-vm-access-userptr-faultable.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837>) +5 other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-discovery:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@xe_eudebug@basic-vm-
>         bind-discovery.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +10 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-lnl-1/igt@xe_eudebug@basic-vm-
>         bind-ufence.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>   *
> 
>     igt@xe_eudebug_sriov@deny-sriov:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@xe_eudebug_sriov@deny-
>         sriov.html> (Intel XE#5793 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5793>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-464/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-
>         mmap.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144186v10/shard-dg2-432/igt@xe_exec_basic@multigpu-many-
>         execqueues-many-vm-basic-defer-mmap.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +7 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-
>         prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) +9 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@xe_exec_system_allocator@many-large-mmap-free-race-
>         nomemset.html> (Intel XE#4915 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4915>) +52 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/
>         igt@xe_exec_system_allocator@threads-many-mmap-new-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +18 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-8/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/
>         igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-7/igt@xe_oa@oa-tlb-
>         invalidate.html> (Intel XE#2248 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_oa@syncs-userptr-wait-cfg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/igt@xe_oa@syncs-
>         userptr-wait-cfg.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2 other
>         tests skip
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-464/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/igt@xe_pm@d3cold-
>         multiple-execs.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3hot-i2c:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-6/igt@xe_pm@d3hot-i2c.html>
>         (Intel XE#5742 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5742>)
>   *
> 
>     igt@xe_pxp@display-pxp-fb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@xe_pxp@display-pxp-
>         fb.html> (Intel XE#4733 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4733>) +2 other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-bmg-1/igt@xe_query@multigpu-
>         query-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-463/
>         igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_sriov_scheduling@equal-throughput:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-dg2-466/
>         igt@xe_sriov_scheduling@equal-throughput.html> (Intel XE#4351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotrebind-lateclose:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-lnl-1/
>         igt@core_hotunplug@hotrebind-lateclose.html> (Intel XE#5826
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html>
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-
>     hdmi-a-1-y:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-
>         tiled@pipe-c-hdmi-a-1-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-
>         events-tiled@pipe-c-hdmi-a-1-y.html> +2 other tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         async-flip.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-9/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html>
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-8/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-2/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-rc-ccs-cc.html> +44 other tests pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-8/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-
>         hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-adlp-2/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         +69 other tests pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4345 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4345> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-
>         hdmi-a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-
>         ccs@pipe-c-hdmi-a-6.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4522>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html> (Intel
>         XE#5826 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5826>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v10/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-
>         flipa-legacy.html>
>   *
> 
>     igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1:
> 
>       o shard-adlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-9/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-
>         hdmi-a1.html> (Intel XE#5753 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5753>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-3/
>         igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-
>         a1.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-432/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144186v10/shard-dg2-432/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible@c-dp2.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-lnl-5/
>         igt@kms_flip@flip-vs-expired-vblank@b-edp1.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html> +1
>         other test pass
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543> / Intel XE#5208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5208>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-4/
>         igt@kms_flip@flip-vs-rmfb-interruptible.html> +1 other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> +7 other tests
>         pass
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-2/
>         igt@kms_plane@plane-panning-bottom-right-suspend.html> +9 other
>         tests pass
>   *
> 
>     igt@kms_pm_rpm@basic-rte:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-lnl-2/
>         igt@kms_pm_rpm@basic-rte.html> (Intel XE#5666 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5666>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-lnl-5/igt@kms_pm_rpm@basic-rte.html>
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue-userptr.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-
>         vm-bindexecqueue-userptr.html> +2 other tests pass
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-9/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-6/
>         igt@xe_exec_system_allocator@many-stride-mmap-file-mlock.html>
>         (Intel XE#3428 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3428>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v10/shard-bmg-6/
>         igt@xe_exec_system_allocator@many-stride-mmap-file-mlock.html>
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-
>         adlp-9/igt@xe_pm@s3-mocs.html> (Intel XE#5545 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-adlp-3/igt@xe_pm@s3-mocs.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-8/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v10/shard-adlp-2/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v10/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#5826 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5826>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v10/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-5/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-bmg-8/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v10/shard-bmg-5/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2509 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2509>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5/shard-dg2-432/
>         igt@xe_peer2peer@read.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v10/
>         shard-dg2-464/igt@xe_peer2peer@read.html> (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5 -> xe-
>     pw-144186v10
> 
> IGT_8494: 8494
> xe-3550-64e4d78f789527aa9c5cb94395c3387443ba6da5: 
> 64e4d78f789527aa9c5cb94395c3387443ba6da5
> xe-pw-144186v10: 144186v10
> 

