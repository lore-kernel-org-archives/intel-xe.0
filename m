Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02517D3ABEF
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 07:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4A910E3AD;
	Mon,  8 Dec 2025 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f7f+qr1a";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D25C10E3AD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cCBTo4KpfmWD7ZUmC3w+rnDmmVZnXuGzV3LqxXQIHb0=; b=f7f+qr1aHkIlnnDmsgfL2jpt4h
 r2jUOfeumQBQTWYjYkLmcodmDXgV/n8Uh1nImhn8q1dmA6zIV8KfPHZs5C2xfP3gChCE+AC6qDaj6
 mx8G4mDT+lLT9MnVDiOm1F+Cy0rbKgWUWqbdnO/pnKPqn3mv8r7K1um+EVBZq0XHDLL/+btXuHQwY
 DrQhWA5VPC8Ijbhpgayau46Rc59s1VR607n5wWkksaLrG0XfVbCIEyo8K9ugUA+xT5oXL4pZ5nwBl
 OsgiuSlthu9yy+UBKWpcSyGkrRWMzM8JhkEDdRnZrUUL9PXj03JI7DtlyxAZrWURkuzgjDoiu4Q4e
 DrsjSwLw==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSVpy-009y8S-6Y; Mon, 08 Dec 2025 08:39:14 +0100
Message-ID: <294b2a28-c4bb-4e41-8fb7-def60c9c3e1a@igalia.com>
Date: Mon, 8 Dec 2025 08:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/syncobj?=
 =?UTF-8?Q?=3A_Convert_syncobj_idr_to_xarray?=
To: intel-xe@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Matthew Brost <matthew.brost@intel.com>
References: <20251205150910.92913-1-tvrtko.ursulin@igalia.com>
 <176499867633.62145.13880797867373965426@a3b018990fe9>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <176499867633.62145.13880797867373965426@a3b018990fe9>
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


On 06/12/2025 06:24, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/syncobj: Convert syncobj idr to xarray
> *URL:* 	https://patchwork.freedesktop.org/series/158582/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead_FULL ->
>   xe-pw-158582v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-158582v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-158582v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-158582v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +1 other test dmesg-warn
>

Looks like a false positive to me. How confident are we xe CI has enough 
syncobj interactions to declare this good?

Tvrtko

>  *
>
>
>     New tests
>
> New tests have been introduced between 
> xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead_FULL and 
> xe-pw-158582v1_FULL:
>
>
>       New IGT tests (20)
>
>  *
>
>     igt@kms_psr@fbc-psr-basic@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.76] s
>  *
>
>     igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.92] s
>  *
>
>     igt@kms_psr@fbc-psr-dpms@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.18] s
>  *
>
>     igt@kms_psr@fbc-psr-primary-render@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.96] s
>  *
>
>     igt@kms_psr@fbc-psr-sprite-blt@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.93] s
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@fbc-psr2-dpms@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render@edp-1:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr@psr-basic@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.84] s
>  *
>
>     igt@kms_psr@psr-cursor-plane-move@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.94] s
>  *
>
>     igt@kms_psr@psr-primary-page-flip@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.97] s
>  *
>
>     igt@kms_psr@psr-sprite-blt@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.96] s
>  *
>
>     igt@kms_psr@psr-sprite-render@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.96] s
>  *
>
>     igt@kms_psr@psr-suspend@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.77] s
>  *
>
>     igt@kms_psr@psr2-basic@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.80] s
>  *
>
>     igt@kms_psr@psr2-no-drrs@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.82] s
>  *
>
>     igt@kms_psr@psr2-primary-blt@edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.00] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-158582v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html>
>         (Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>) +2
>         other tests fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#1477
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +10 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +12
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +69
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-read:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-read.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>) +5
>         other tests skip
>  *
>
>     igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>) +6
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>) +2
>         other tests skip
>  *
>
>     igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@suspend-resume:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_content_protection@suspend-resume.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +2
>         other tests fail
>  *
>
>     igt@kms_content_protection@suspend-resume@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_content_protection@suspend-resume@pipe-a-dp-4.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#4494
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +6
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +12
>         other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@kms_hdr@bpc-switch.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +1
>         other test abort
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +1
>         other test abort
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (Intel XE#5624
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (Intel XE#5624
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>  *
>
>     igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-9/igt@kms_plane_multiple@tiling-y.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-3/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         (Intel XE#5825
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#5825
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +8
>         other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@kms_psr@pr-sprite-blt.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@kms_psr@psr2-cursor-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_sharpness_filter@filter-strength:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@kms_sharpness_filter@filter-strength.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7
>         other tests skip
>  *
>
>     igt@kms_sharpness_filter@filter-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         (Intel XE#6360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eudebug@discovery-race-vmbind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_eudebug@discovery-race-vmbind.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_eudebug@discovery-race-vmbind.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug_online@set-breakpoint:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@invalid-va:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288> /
>         Intel XE#5561
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +14
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-close-fd:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-4/igt@xe_exec_reset@cm-close-fd.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html>
>         (Intel XE#3868
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868>)
>  *
>
>     igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>  *
>
>     igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:
>
>       o shard-lnl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_exec_system_allocator@many-malloc-prefetch-madvise.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +166 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +38 other tests skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_module_load@force-load.html>
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-2/igt@xe_module_load@load.html>)
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>  *
>
>     igt@xe_oa@create-destroy-userspace-config:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@xe_oa@create-destroy-userspace-config.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1
>         other test skip
>  *
>
>     igt@xe_oa@non-privileged-map-oa-buffer:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +4
>         other tests skip
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@xe_peer2peer@read.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#6566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566>)
>  *
>
>     igt@xe_pmu@all-fn-engine-activity-load:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>) +1
>         other test skip
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +3
>         other tests fail
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_render_copy@render-stress-1-copies:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_render_copy@render-stress-1-copies.html>
>         (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>  *
>
>     igt@xe_sriov_vram@vf-access-after-resize-up:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-1/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html>
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html>
>         +8 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html>
>         (Intel XE#5338
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338> /
>         Intel XE#5416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html>
>         +1 other test pass
>  *
>
>     igt@kms_vblank@query-busy-hang:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-adlp-1/igt@kms_vblank@query-busy-hang.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-adlp-2/igt@kms_vblank@query-busy-hang.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_configfs@ctx-restore-post-bb-invalid:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-433/igt@xe_configfs@ctx-restore-post-bb-invalid.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-463/igt@xe_configfs@ctx-restore-post-bb-invalid.html>
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-1/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-5/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html>
>  *
>
>     igt@xe_gt_freq@freq_range_idle:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-dg2-435/igt@xe_gt_freq@freq_range_idle.html>
>         (Intel XE#6407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-dg2-434/igt@xe_gt_freq@freq_range_idle.html>
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html>
>         +2 other tests pass
>  *
>
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158582v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead ->
>     xe-pw-158582v1
>
> IGT_8657: 71c70567a9a965cb2942f01832e0b23aca4672f0 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead: 
> abc20a831a03dc608256340159c23e01ee6b6ead
> xe-pw-158582v1: 158582v1
>

