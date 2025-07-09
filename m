Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8338C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBB610E78C;
	Wed,  9 Jul 2025 10:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WaewALf1";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9210E78C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itn6tJnfe5I2zTiAlbJRbhbWkfdCS/Kkv2oSC6/ma1k=; b=WaewALf1S/vBNu6YArIZHX9yAD
 DIS7NOr0rmhBfyS5Erj+5SY1eQEH6/DE3RZIdywOEmmB5AhrWngt+KYgBHFsyI1bsyK4xTciIUJhq
 eULNFYmE0Be2jpGbIin2qZYsoihnOVe9o7f3P3w4WpuiNti5bG6HKBHKbrUE/vDpAp1mtUrmE6yTl
 wbisY8dpYBZc4UqlaNDqExqQEvOhDzRoNDTJmhPPvBXwd7CzYh+Nu3IGt0dblfi6gZ0HP/tlEI8bo
 waP/G846+h/tlLFSiInc44MnwdPlj0+Wa8ikFi4njAlLXlT9ACDeG8fPGsvJrQIf7IFpqiM+vD3HL
 hxayXkhA==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZRhk-00EPq8-2e; Wed, 09 Jul 2025 12:07:08 +0200
Message-ID: <c69fb4cd-914e-4304-95df-6c2e0642d1be@igalia.com>
Date: Wed, 9 Jul 2025 11:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] drm/xe/xelp: Implement Wa_16010904313
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-7-tvrtko.ursulin@igalia.com>
 <nsjsykie3vxairexo4emiyu4ntma76krzknerwenbzzvzcyblj@3lnuuhfdbuux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <nsjsykie3vxairexo4emiyu4ntma76krzknerwenbzzvzcyblj@3lnuuhfdbuux>
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


On 09/07/2025 00:21, Lucas De Marchi wrote:
> On Thu, Jul 03, 2025 at 09:20:58AM +0100, Tvrtko Ursulin wrote:
>> Add XeLP workaround 16010904313.
>>
>> The description calls for it to be emitted as the indirect context buffer
>> workaround for render and compute, and from the workaround batch buffer
>> for the other engines. Therefore we plug into the previously added
>> respective top level emission functions.
>>
>> The actual command streamer programming sequence differs from what is
>> described in the PRM, in that it assumes the listed LRCA offset was
>> supposed to actually refer to the location of the CTX_TIMESTAMP register
>> instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>> more sense under the assumption that multiple writes are helping with
>> restoring the CTX_TIMESTAMP register content from the saved context 
>> state.
> 
> I'm requesting a clarification about that to hw/validation. Because this
> doesn't match neither the i915 implementation nor the PRM.

Yep it differs, as discussed before.

Could you also ask about the programming note for INDIRECT_CTX and 
INDIRECT_CTX_OFFSET from the public Tigerlake PRM (Alderlake is not 
available), which says:

"BlitterCS/VideoCS/VideoCS2/VideoEnhancementCS/PositionCS: This register 
functionality is not supported and must not be programmed for these 
command streamers."

I915 does use it, hence I copied it from there, but only now noticed 
this. Maybe that is the reason Wa_16010904313 descriptions calls for the 
wa_bb to be used on !rcs.

Regards,

Tvrtko

