Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63710CAC5B2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 07:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2289128;
	Wed, 24 Sep 2025 07:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="P97v0fQm";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E4489128
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hGvJ+Bzm6FJcABlI+C6l+xyBUUGGbw5Y21WJANdzDtw=; b=P97v0fQmYsXmXFpnRH8cGxmnRo
 Mk+y0AzGKL2ynZN2YU7HIPFk3kiaJCxrgQGkM4VC5T3xHQLJPKyfIxDZ53xwsP8aW8RaS9t5Mg+BN
 zewMVM8nsasjvywIcgqCKpIZ5Vj2g4C4cpgll11JRS9gW6UParsxqXgSdFjI1KlW+DTxetkgllQBd
 cvNq1OXzSORotxKKf9CcqXdFCyuhMFFaBbLW5eZth+/xvvsemQtqBLs6zE60B75lviTe9VSlBwi4J
 mHoJu6vlXx+IKjNEoZK/22v8kwt33nS4ES5YqilcrrQrysYdFlXIkikPCWD35MfsmQAtjJeCF6ntE
 dmllYFYg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v1KPl-00GlR5-En; Wed, 24 Sep 2025 09:59:49 +0200
Message-ID: <9a2f035d-cd68-41e5-b23a-e887f328335b@igalia.com>
Date: Wed, 24 Sep 2025 08:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/13] AuxCCS handling and render compression modifiers
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <aNL_RgLy13fXJbYx@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aNL_RgLy13fXJbYx@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 23/09/2025 21:12, Ville Syrjälä wrote:
> On Tue, Sep 23, 2025 at 11:07:53AM +0100, Tvrtko Ursulin wrote:
>> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>>
>> Currently the auxiliary buffer data isn't mapped into the page tables at all so
>> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>> had to disable the support.
>>
>> On top of that there are missing flushes, invalidations and similar.
>>
>> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>>
>>    [PLANE:32:plane 1A]: type=PRI
>>            uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>            hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>
>> Display working fine - no artefacts, no DMAR/PIPE faults.
>>
>> All IGTs pass for me locally.
>>
>> v2:
>>   * More patches added to fix kms_flip_tiling.
>>
>> v3:
>>   * Rebased after some cleanup patches from v2 were merged.
>>   * Added people to Cc as suggested by Rodrigo.
>>   * Adjusted last patch title. (Rodrigo)
>>   * Apply GGTT flushing only to iomapped system memory buffers.
>>
>> v4:
>>   * Added patch for potentially misplaced Wa_14016712196.
>>   * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
>>
>> v5:
>>   * Split out ring emission changes to smaller patches.
>>   * Fixed MAX_JOB_SIZE_DW even more.
>>   * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.
>>
>>   v6:
>>   * Added AuxCCS invalidation to indirect context workarounds.
>>   * Also added the indirect context handling and some other workarounds. They are
>>     unrelated but the series depends on it.
>>   * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
>>     some reason.
> 
> I was wondering where that went. Someone should actually debug
> that instead of leaving the bogus alignemnt in place.

I do not exactly remember what the failures were but I *think* they were 
sporadic and I definitely fixed some other details since. So I think it 
is possible I incorrectly blamed that patch at the time.  I'll re-send 
it to see what CI will say.

> We do have some unknown alignment issues on i915 as well,
> with async flips specifically. On ADL we've papered over it
> for now. But at least MTL is suffering from somewhat similar
> issues that I failed to immediately understand. We really
> should find someone who has a bit of time to dig into these...
> 
> BTW intel_fb_pin_to_ggtt() also passes the wrong alignment to
> __xe_pin_fb_vma(). I suppose it won't help with DPT alignment
> woes, but it's yet another xe issue that needs fixing.

The last part looks obviously wrong indeed. I can send a fix for that.

Regards,

Tvrtko



