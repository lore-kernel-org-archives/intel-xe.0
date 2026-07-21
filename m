Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48EC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03C10EDAD;
	Wed, 22 Jul 2026 13:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmwvOmp7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOHv/R6Q";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E935110E3B9
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:19:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2UmM3439782
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H1XLAHNmi4PKg3tS4nCNk7w1LOMeXlf2zi8DO7odQyg=; b=FmwvOmp7nb/Q0sqx
 fmZslrcmuAGn6+e/NCBfFKHfLEw1PtAZmzngYA95eJP9LTENRCB5FlIR4fkO+G1t
 CbsFf/2Lcb2d+gWegiG2mJ/Vt0Quqamvu3SwYTMomuwRerq8ZHVh2g2zS+RUcNxt
 436mWzVp/82EgzCzKwDPTwtbiY3fXsTUmeSPGY8iHT7aw8Kpo1r6CTULw0+jt3pp
 DwsPmCoipr4eJyvdSU9Fs9Rk+wiKjX5008DyP2fAwklV+wVXkdgosz8FXlL7EHpM
 wzFlheRPqedrQGSP3ZoXomfRM/KqEz8Akk/q7RrbXWKRcEbSRla/jn+0whLpV891
 JQI4XQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstdjr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:19:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c19493ac2so15190861cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784657975; x=1785262775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H1XLAHNmi4PKg3tS4nCNk7w1LOMeXlf2zi8DO7odQyg=;
 b=NOHv/R6Qn45dsce0+yTrhdKzRhkawZMA5b8SrpBOdvppm9LnPRGJUQmK1CtaD8k0Yw
 QBL1EJc2YKJX4MMgMIGGcwGxJBbKAI6zqiPpMUzGaihi8dX+ESNvrHACCiF3FcAjdBsp
 /72YSGxYuUvFu92P5GhCJr95h0lMTnSVL5KLlAkee9G3Se72jSwalNhwQ0mSf/738mhd
 DI2eK91XN+3iqfBcNbqxxi4wSkibOO3I2RCa0g8hxd6s5oZw4ShCf5rmCLrG2HpJ9jYj
 offIwPz0dLF5nh8LK3dMp87YUwU7MDSu1SWomOvfikrua0TbUM29O+AO8uP47EqcaUb6
 jpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784657975; x=1785262775;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H1XLAHNmi4PKg3tS4nCNk7w1LOMeXlf2zi8DO7odQyg=;
 b=our1OI5j84Q/1QVHbXQDH8GeVQAn4/Dy9cbvBr9cxafz1jX6CuJzLgePrwUkFFitev
 4EU6PjcTf0QOJeThj/UotptlF682/RyZafHy7ZH4+5MjHZfX1St1kv6eOz5YIr/D2IZg
 tX0qlvScP1ByullT69yKkmVJVCziDzxb+AOaWrhIB54COgq6G1G9rphsPF+xR3B85UPp
 8faIyijyqrr74mKVY1azrcV4AXYjEoGcW6yOW56WXOdOy9Z95JJY62N3lpzrewKYoufe
 uzbD0RCO+tQIyDDpEl2Fn7BwhtKtGbfMp6J2ZbP7Jh2PDCMSQNJs5iNLtwUnY9Z1U51b
 P4VQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrU43AIGr78mK8dwRmM/NfxnfKZQuSQN47qcs+oADb/BC4giL8wajU36sBcf411iS9pc4TpbYAjkg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFvGsLzuJWtPidn3SELP4ZqmwzzbLwtINA8cCrzzMgfc6A+Rhl
 3EPDA4Jj6eDutSCSnNH2evVQN5iqgOnkBfYy8GsPSBu217aWX4gNG1G/o9dTONv4mFp1j9jIfMp
 xVMTFjApfwscDVNHpuHkdgfxBXuCXiABLeYnDzZTk56VuDER2YjPkZssu97ksj9Vtt1BMJg==
X-Gm-Gg: AfdE7cloJYpwanP5A4wHx3dC1SmAkaW9DJqWt4sFobw6psy8t/5e1MY4cxM2qgxM/KC
 F9+JwO1GwJwwtpNnRzauLWbWXa6BvdiNHg5oUH+0dU0xBX2gJnuoWsaj9J1Lw/R47r9QKEb/nTJ
 Owjjv/auU5k/cRgnkunNvo0qBNVGHgnEB3KNPDgRU2lQ9M2Se0xle/BBP9u8LugLkdxpUes6ROf
 zskWTcIMhs1mPFAW91/SvIgeRg/7cSMtoCGafcgE6bRfE8sxYoGRI4dFv8pYa+Z/25GtNbqYajd
 d8GmEDPjOn9g3C/YXq5gcGnNnLRtg1g9whV9FM1t7Rv66TEt1xUH3XvTl1l7gdt/CCYOkhLUlc9
 sezzOuLT9NmT6I16a79JgNTSoIrlHNS3cfSJBauKhXH64wQQ5vnWuNT+hQZK4Ub2xfrqWF9A4WY
 RGWXP+36wUBjygMELmmG4oZH2wiBz43ZEoXrcDtQMneC0MKp/bwbq1XPqz0jjUIPkAV68=
X-Received: by 2002:a05:622a:344:b0:51c:7b11:41b9 with SMTP id
 d75a77b69052e-5213f377a56mr182774611cf.85.1784657974977; 
 Tue, 21 Jul 2026 11:19:34 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:51c:7b11:41b9 with SMTP id
 d75a77b69052e-5213f377a56mr182774081cf.85.1784657974402; 
 Tue, 21 Jul 2026 11:19:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32f12994sm6191766b.60.2026.07.21.11.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 11:19:33 -0700 (PDT)
Message-ID: <cd0d9260-77f4-4383-b03b-cfb35e206221@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 20:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Add support for a DRM backlight capability
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Mario Limonciello <superm1@kernel.org>
References: <20260624165751.2014759-1-mario.limonciello@amd.com>
 <3566a1c5-c273-4928-9a07-56064c0936f0@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3566a1c5-c273-4928-9a07-56064c0936f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Tr49XzVlX_fi3_d8DTRMGF9ygREIsMK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXziqmAbaICmhk
 hzlQPUxELmx6EpiGomGl8pIfESw41texJ9XAwE96liKMFhTU+4D7mgc8iTS2xT5DVodMfR7+nUZ
 y+pORtn4Kiw1wdimLJ+L6LgfgVnWzkM=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fb838 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=n9G7CmtyAAAA:8
 a=3fyaaF4VAAAA:8 a=_nvYoSmVAAAA:20 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=Jv7xSkspbfX1RPl47OQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=QLbfUV9tqJ42EE2IvXC8:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 4Tr49XzVlX_fi3_d8DTRMGF9ygREIsMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX777ubqwzv+gB
 pVLs9B+M+ArITm1gJpXuaXF0cGjLZv/XPF7rmT1Sp7wnjITlDCn41Um2Rjr8tmZHIYAYYpbBmkf
 XT3JjOdar3RMyZP+UIqxYpkFUt9VKG+XtuBEPKdgw7Q7JW4+y4+v2OtMreCsmfpRI3ADanXPXGF
 C1DgddeOex3QHq8MUZzqi2W3sw3fgccIY854/qSVDV0LmuFqE8Fbenmcxca9KMq0V00lYg6lWqV
 6jDfM9iMj/1IvH8ao1viLbt1ULPMn/QG/YPyJFkEXAVRGPkAEECmx3SYus8bfQqMygc3gnOjrNg
 6s03bM2dMteoLFU8wEwuGm5PFIRZAW+gESGvntS8LTbUckz/ScZnxOEpvZ7/d5R7Gcbosry/uz2
 lc/ykN0ALdJ14ooggvPG4a9zOWxnfpNovYSoe2PMVeOknf1hM/B/zZY+ybwICx+oGpiHRl3wuLq
 ggCZU3wcCKCnPV0QIDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192
X-Mailman-Approved-At: Wed, 22 Jul 2026 13:42:23 +0000
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

On 21-Jul-26 19:50, Hans de Goede wrote:
> Hi Mario,
> 
> On 24-Jun-26 18:57, Mario Limonciello wrote:
>> From: Mario Limonciello (AMD) <superm1@kernel.org>
>>
>> At Display Next Hackfest 2026 we reviewed progress moving brightness
>> control into the DRM connector properties.
>>
>> There is a range LUMINANCE property that will default to 0->0.
>> Once a driver attaches a backlight it will be updated to 1->max.
>> If the panel supports the minimum backlight turning off the display
>> the range can later be updated to 0->max instead of 1->max.
>>
>> The legacy sysfs interface is synchronized with the DRM connector.
>> When a compositor using this feature is loaded, sysfs writes are disabled
>> to prevent legacy tools from going out of sync with the compositor.
>>
>> This has an implementation initially for amdgpu, i915, and Xe with eDP
>> connectors.  It can be extended to other connectors like DP for displays
>> that can be controlled via DDC as well later.
> 
> First of all thank you very much for working on this.
> 
> I'm a bit late to the party, since I only became aware of this
> patch-set recently through:
> https://blog.sebastianwick.net/posts/display-next-hackfest-2026/
> 
> Overall this looks pretty good to me.
> 
> My main remark is related to non acpi_backlight=native backlight
> control.
> 
> When I first started working on implementing backlight control
> as a DRM connector property I never got further than a whole
> bunch of prep working making sure that all backlight drivers
> (and all drm/kms driver backlight code) were using / honoring
> acpi_video_get_backlight_type() resp. its special
> acpi_video_backlight_use_native() variant.
> 
> This prep work was meant to allow the drm connector prop code
> to deal with the case where e.g. the backlight code from
> drivers/acpi/acpi_video.c (acpi_backlight=video) should be used as
> is the case on many older laptops.
> 
> The prep work basically made sure that all backlight hw/fw
> interface selection handling (on x86) goes through
> drivers/acpi/video_detect.c . To have a single source of
> truth of which backlight control method should be used.
> 
> Looking at e.g. "[PATCH v6 07/10] drm/amd/display: use drm
> backlight" then this is partly honored since 
> amdgpu_dm_register_backlight_device() starts with:
> 
>         if (!acpi_video_backlight_use_native()) {
>                 drm_info(drm, "Skipping amdgpu DM backlight registration\n");
>                 /* Try registering an ACPI video backlight device instead. */
>                 acpi_video_register_backlight();
>                 return;
>         }
> 
> and the added drm_backlight_link() call happens later and thus
> gets skipped if the acpi_video_backlight_use_native() check fails,
> but any non native backlight devices never get linked.
> 
> What IMHO needs to happen (perhaps in a follow-up series) is:
> 
> If the acpi_video_backlight_use_native() call returns false then
> replace the acpi_video_register_backlight() call with a new:
> 
> drm_backlight_handle_non_native_bl(internal_panel_drm_connector, pci_dev);
> 
> function which does the following:
> 
> 1. Call acpi_video_get_backlight_type() and cache the type it returns
> and on acpi_backlight_none bail from the function.
> 
> 2. Add a new acpi_video_register_single_backlight(), which takes
> a pci_dev pointer as argument and then only registers the acpi_video
> backlight matching that PCI device, see the parent handling in
> acpi_video_dev_register_backlight().
> 
> This new function then returns the registered backlight on success
> or NULL (or maybe an ERR_PTR()?).
> 
> 3. If the type is acpi_backlight_video call
> acpi_video_register_single_backlight() and link the returned
> backlight instead of the native one.
> 
> 4. For other types register a backlight notifier which listens for
> new backlight drivers to show up and then checks those against
> the cached type. And on a successful match, link the new
> backlight device to the connector.
> 
> This is for drivers/platform/x86 backlight drivers, like
> dell-laptop on old Dell Latitudes which will typically not
> be in the initramfs, while the GPU driver will be in
> the initramfs.
> 
> 5. After registering the notifier, check if a backlight device
> of the expected type has not already been registered beforehand
> and if yes, link it and remove the notifier.
> 
> Stating the obvious: 5. needs to be done last to avoid a race
> between checking for the backlight device already being there
> and a new backlight getting registered.
> 
> I specifically have retained a bunch of old laptops which use
> the acpi_backlight_vendor and acpi_backlight_native methods to
> test this. I even have one with 2 GPUs which IIRC both
> work with acpi_backlight=video and I can switch which one
> drivers the panel in the BIOS.
> 
> Regards,
> 
> Hans

p.s.

i. For non native backlights set-brightness calls should
probably be deferred to a workqueue because these often
fw calls can be quite slow.

ii. For the next version of this series please Cc me.



> 
> 
> 
> 
> 
> 
>>
>> The following compositors have implemented matching support:
>>  * Kwin: https://invent.kde.org/plasma/kwin/-/merge_requests/9298
>>  * Mutter: https://gitlab.gnome.org/swick/mutter/-/commits/wip/kms-luminance-prop
>>  * Wlroots: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/5384
>>
>> ---
>> v5->v6:
>>  * Rebase on drm-next
>>  * Drop patch 7/11 (Move backlight tracing out of the dc lock)
>>
>> Mario Limonciello (AMD) (10):
>>   Revert "backlight: Remove notifier"
>>   backlight: add kernel-internal backlight API
>>   drm: link connectors to backlight devices
>>   DRM: Add support for client indicating support for luminance
>>   drm/amd/display: Pass up errors reading actual brightness
>>   drm/amd/display: Allow backlight registration to fail
>>   drm/amd/display: use drm backlight
>>   drm/amd/display: Drop brightness caching in amdgpu_dm
>>   drm/bridge: auto-link panel backlight in bridge connector
>>   drm/i915/display: use drm backlight
>>
>>  drivers/gpu/drm/Kconfig                       |   1 +
>>  drivers/gpu/drm/Makefile                      |   1 +
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 111 ++---
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  13 -
>>  drivers/gpu/drm/bridge/panel.c                |  15 +
>>  .../gpu/drm/display/drm_bridge_connector.c    |  15 +-
>>  drivers/gpu/drm/drm_atomic_helper.c           |   7 +
>>  drivers/gpu/drm/drm_atomic_uapi.c             |  59 ++-
>>  drivers/gpu/drm/drm_backlight.c               | 445 ++++++++++++++++++
>>  drivers/gpu/drm/drm_connector.c               |  63 +++
>>  drivers/gpu/drm/drm_drv.c                     |   8 +
>>  drivers/gpu/drm/drm_file.c                    |   5 +
>>  drivers/gpu/drm/drm_ioctl.c                   |  15 +
>>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>>  drivers/gpu/drm/drm_mode_object.c             |  66 ++-
>>  drivers/gpu/drm/drm_property.c                |   6 +
>>  drivers/gpu/drm/drm_sysfs.c                   |  28 +-
>>  .../gpu/drm/i915/display/intel_backlight.c    |   4 +
>>  drivers/gpu/drm/i915/display/intel_dp.c       |   8 +
>>  drivers/video/backlight/backlight.c           |  97 ++++
>>  include/drm/drm_backlight.h                   |  51 ++
>>  include/drm/drm_bridge.h                      |   1 +
>>  include/drm/drm_connector.h                   |   8 +
>>  include/drm/drm_file.h                        |   8 +
>>  include/drm/drm_mode_config.h                 |   5 +
>>  include/linux/backlight.h                     |  63 +++
>>  include/uapi/drm/drm.h                        |  22 +
>>  27 files changed, 1046 insertions(+), 86 deletions(-)
>>  create mode 100644 drivers/gpu/drm/drm_backlight.c
>>  create mode 100644 include/drm/drm_backlight.h
>>
>>
>> base-commit: 0e8233409d4f6def051dd42a432c6815bb780d78
> 

