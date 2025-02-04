Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D19CC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 11:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0973310E09A;
	Tue,  4 Feb 2025 11:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p2yBA8aM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060810E09A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=x5xqKSQ9es1oZK7YmAArs5yMcOsV13E44+/9ajpHwj8=; b=p2yBA8aMEAen9agj7TJSlRj1Pt
 Q7izxEm/BNjRhCmP/3VlIrT1elDLNsI1Bfs3DEOtHPVnpZ8jwa0p3FLjFdmfhzLVaso2QryIp/GCV
 j/l5KASJ8r2Do+hzyUeNLl+qoYW1T+JfBkIr+1P24R2xaiOs9/c4JzUUQ3E51K31N8lBcCVFWaSnU
 wfBVEpINamNo0xjB9KX19nzc65eW9PDDJQag9/e2dN94m+Hc3VYO3yv8KHTEzXX9Kkh4erDQ+94jI
 gDuaHgnUUL2lWtE/euIwluGEsqti276Xt81zwJSFvqXA+Y/of8OcfYLM22AjfYDg8CCf71P7I6jhG
 TOFH2cfA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tfGrA-003OjB-Bf; Tue, 04 Feb 2025 12:12:46 +0100
Message-ID: <eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@igalia.com>
Date: Tue, 4 Feb 2025 11:12:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers?=
To: intel-xe@lists.freedesktop.org
References: <20250131142045.47785-1-tvrtko.ursulin@igalia.com>
 <173835518689.3314806.6980040255427143980@b555e5b46a47>
Content-Language: en-GB
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <173835518689.3314806.6980040255427143980@b555e5b46a47>
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


+ Rodrigo and Jani for possible CI/display insights or adding correct Cc 
please.

On 31/01/2025 20:26, Patchwork wrote:
> igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs (NEW):
> 
>   * shard-adlp: NOTRUN -> FAIL
>     <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs.html> +66 other tests fail

Two things here.

First it seems to be some sort of a race condition in crc collection 
and/or vblank counter handling. Tests work individually but fail one run 
in sequence. Bad CRC also varies run to run, while visually things look 
fine to me on screen. Also a delay before collecting the crc seems to 
improve things.

I instrumented things a bit but I don't really understand it. For 
example collecting the reference CRC appears to have some "collect it at 
the next vblank logic", but I am not sure that works correctly. Ie.

Working case:
==========================================

Getting the reference CRC:
------------------------------------------
(kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703868, 
target 703869; crc[0]=b82b36e4
(kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703869, 
target 703869; crc[0]=b82b36e4

reference_crc[0]=b82b36e4

Compare after flip:

(kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703870, 
target 703872; crc[0]=b82b36e4
(kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703871, 
target 703872; crc[0]=2aa66f1d
(kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703872, 
target 703872; crc[0]=b82b36e4

reference_crc[0]=b82b36e4 crc[0]=b82b36e4


Failing case:
==========================================

Getting the reference CRC:
------------------------------------------
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698273, 
target 698278; crc[0]=b82b36e4
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698274, 
target 698278; crc[0]=b82b36e4
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698275, 
target 698278; crc[0]=b82b36e4
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698276, 
target 698278; crc[0]=b82b36e4
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698277, 
target 698278; crc[0]=b82b36e4
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698278, 
target 698278; crc[0]=7b978b62

reference_crc[0]=7b978b62

Compare after flip:
------------------------------------------
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698279, 
target 698281; crc[0]=dbec96bd
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698280, 
target 698281; crc[0]=da444d0a
(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698281, 
target 698281; crc[0]=b82b36e4

reference_crc[0]=7b978b62 crc[0]=b82b36e4

(kms_flip_tiling:14145) igt_pipe_crc-DEBUG: CRC mismatch at index 0: 
0x7b978b62 != 0xb82b36e4

Second thing - how come xe shards have ADL-P when xe does not support 
it, while i915 shards don't, when it does? :))

Regards,

Tvrtko
