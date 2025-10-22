Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E2CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 07:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4810E70A;
	Wed, 22 Oct 2025 07:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bJEWi8jm";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CC210E70A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Dv2ilzP4nbddt6ohHIQdp6W+FwBHWd24OhbMHqsi4E=; b=bJEWi8jmvqdjUA/1YTAJFQ3zUi
 RWp33aR0EYPv/hc5e78jIbG8IQ0lQadrOQW51nq6c8o2vd1NNpi6TC2GfL4Yvy8hnmZtNgOl/IDX6
 jfz71Z4xCkyhO9nPODYbrpTZNtaObS6wwC4AYwFiHRKAyOchuvD0SBasZ5Qv+TEao/vSrAouHkft5
 8zpo/KQ9bTSh0EJKw9EleTsk00k+Vm8Qyq19g226qt6sTI7WvvVJdj3OmuuajILsXUipF+Vkf1d8q
 ZqQzEf2idc5Ju4cd2D4GL3/DSLGmLiMZqz10Yvm+nENT+xUJkbieOlkYWvCuKfxMWoSFQ9yC9eHJi
 tQkpVzQw==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBTOJ-00Ct73-6s; Wed, 22 Oct 2025 09:36:15 +0200
Message-ID: <026c65a3-f634-4731-85ee-c12bab73fcf7@igalia.com>
Date: Wed, 22 Oct 2025 08:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers_=28rev3=29?=
To: intel-xe@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <176107557828.37900.10286789424054330329@97596180aaec>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <176107557828.37900.10286789424054330329@97596180aaec>
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


On 21/10/2025 20:39, Patchwork wrote:

8><

> Here are the unknown changes that may have been introduced in xe- 
> pw-156189v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-x:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156189v3/shard-adlp-4/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-x.html> +1 other
>         test fail
So MOCS 61 did not fully fix it. It remains to be a stuborn one. :(

I sent some CI runs with stolen avoidance and also extra clflush on top. 
The last one was the only combination which ever got multiple clean 
shard runs.

Have you received any clarifications from the hardware people in the 
meantime?

Regards,

Tvrtko

