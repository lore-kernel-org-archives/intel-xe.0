Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE5AC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 08:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A1B10E0BF;
	Thu, 20 Mar 2025 08:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z8meEYhI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681E10E0BF
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jNPZPOgz+rPrknMqFd0hv9JEoDZ+ZotakbimcL4mXf4=; b=Z8meEYhIIULdQhfrPKewPK4rFI
 ddc9OLmdUuoUtfsIDKosgqb+uOk5J+cQtSbu3N7uWH/oCUfMdpFYlCLvCc7joV15USfV2RS2yx4Ee
 4cT61kqhgAI+mconLgNjBKebYLpZpaY4RTM1rJUrmrMtoFIDN5YBBdQEwZSEH7nPqEqZyXbttwqcq
 xDRJG2+B/YYtQFAbB4wbhmLERxDFmegKM8t1xD48Jk+a/tomYs0NlLTf51EXGDSeBI3WdPKZmNXlV
 a6qLh6fxjYV+f2kRaTM53IrZXPOSN5tfH9yei83e1VGS8aHEYHSd+FFEo5kG+JlYyVo5M5o8fZwfY
 p8q63zmA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tvBD9-003e1c-0d; Thu, 20 Mar 2025 09:25:07 +0100
Message-ID: <6be0c617-49b7-44d5-9b75-e0a21703ac9c@igalia.com>
Date: Thu, 20 Mar 2025 08:25:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] AuxCCS handling and render compression modifiers
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
 <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
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


Hi,

On 19/03/2025 13:41, Juha-Pekka Heikkilä wrote:
> Hi Tvrtko,
> 
> I did quick run with these patches. With these changes on top of
> today's drm-tip I got a complete system freeze on mtl and its variants
> when do modprobe. I had kgdb enabled but I wasn't even thrown there,
> the machine went completely unresponsive. On 3/3 tries modprobe xe
> always completely froze the box.

I don't have MTL to try and neither apparently does CI, which otherwise 
seems happy, as is my ADL-P laptop.

Would you have time to bisect? Or maybe netconsole to see what explodes?

Not much comes to mind looking at the patches.. Maybe something runs to 
early before something else is initialised. Guessing only.

Regards,

Tvrtko

> On Tue, Mar 18, 2025 at 6:22 PM Tvrtko Ursulin
> <tvrtko.ursulin@igalia.com> wrote:
>>
>> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>>
>> Currently the auxiliary buffer data isn't mapped into the page tables at all so
>> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>> had to disable the support.
>>
>> On top of that there are missing flushes and invalidations both from the ring
>> buffer side and from the CPU side.
>>
>> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>>
>>    [PLANE:32:plane 1A]: type=PRI
>>            uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>            hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>
>> Display seems working fine - no artefacts, no DMAR/PIPE faults. CI also appears
>> to be happy with v2.
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
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>
>> Tvrtko Ursulin (8):
>>    drm/xe: Add ring buffer handling for AuxCCS
>>    drm/xe: Use fb cached min alignment
>>    drm/xe: Reduce DPT table alignment as in i915
>>    drm/xe: Flush GGTT writes after populating DPT
>>    drm/xe: Handle DPT in system memory
>>    drm/xe: Force flush system memory AuxCCS framebuffers before scan out
>>    drm/xe/display: Add support for AuxCCS
>>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>>
>>   .../drm/i915/display/skl_universal_plane.c    |   6 -
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++----
>>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>>   drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>>   drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++--------
>>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>>   8 files changed, 261 insertions(+), 123 deletions(-)
>>
>> --
>> 2.48.0
>>

