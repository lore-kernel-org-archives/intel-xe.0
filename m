Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF6EB64DC
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 03:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A4010E11E;
	Sun,  2 Jul 2023 03:02:56 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917ED10E11E
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Jul 2023 03:02:54 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-39eab4bbe8aso2383895b6e.1
 for <intel-xe@lists.freedesktop.org>; Sat, 01 Jul 2023 20:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688266973; x=1690858973;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jxt1poSw1xsAMEjQwYi4y8vj1jFVOIQeA7/G61u7qY4=;
 b=OT1iacORdRruCMyX5z+cl3qiJPE24m+uSbQUt4QLn0S61T4/I1s4flfbDzZSAgnNLK
 9LS8QVfLNw2EQj4Gww4xR47gIyJehRvTfElaW0i7EcwYj5hadSlzElvx+NS9dqbnUEkP
 RRiXkP05uOdMIfvbnxwK/ColaQr4sNnLfBdrE89abQfVx0BkccF3h4OGaM7j0Rqv75eo
 5j+JYHhJFsL0AGocaUsZIHG0Qa+jsxp7p5sASnQWXuG7NZ4q9Sm7vYd0dGaVbwD3qGrh
 oJ/KqjoaIJXclfpcxpoQBKK05NKho0dNWG1voXUPy0x5TPAMnNQSP8j8gLsZMpQZrbtC
 56uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688266973; x=1690858973;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxt1poSw1xsAMEjQwYi4y8vj1jFVOIQeA7/G61u7qY4=;
 b=gE5H/CztXoVb9fDM0n8bC2p8xpXjfpYc1QPaxGyINnoWU2kjbVRoR4AmkIpt5ajQFX
 GTadRDXnTyB8ES/L5Fmit4X4kLmsaElmzLzN1x5Hru3VK7akxFk3rFFbDCrpgsTp4bYt
 IEeorpqwH4RL1ll1hMBF+3sOpV3fesV7kGQcEkT9fUH25k8zO+BGhSoI/tNXlmZTbBSV
 WuPPNLthFdxi8vOET8WL3wEtodSGdd5wc2VQx65V96dVL66vkVc1E8NjLgYrnTwtUfTz
 nUUQrt6/f9OKx5fodskYcV9S9I+6Ea8C7xevbocpBnTITXgjN7cv2DQnP71Pj3K4F8QE
 U3Tw==
X-Gm-Message-State: AC+VfDwB/dvNbhrNb5mrTZMBzyXW4iQfracNV7DrqrcfYmWSA2VZkFxe
 Dh90cQ23RdinQIEnloeU3Ao=
X-Google-Smtp-Source: ACHHUZ4s5zzrgJbaFm/5Dvz9332FStRXTLPFiLBdL9wNMwECP7puAAmmp0AzJjL7Ljt/Z5T69rFeWg==
X-Received: by 2002:a05:6808:6192:b0:3a1:f2fc:7e13 with SMTP id
 dn18-20020a056808619200b003a1f2fc7e13mr7079126oib.57.1688266973405; 
 Sat, 01 Jul 2023 20:02:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001aaed55aff3sm12897959pls.137.2023.07.01.20.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 20:02:52 -0700 (PDT)
Message-ID: <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
Date: Sat, 1 Jul 2023 20:02:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <87ilb385fv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 7/1/23 18:31, Dixit, Ashutosh wrote:
> On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
>>
> 
> Hi Badal,
> 
>> This series adds the hwmon support on xe driver for DGFX
> 
> Needs some discussion but I have a general comment on this series
> first. The implementation here follow what was done for i915. But how
> "hwmon attributes are defined" I think we should look at how this was done
> in other drm drivers, namely amdgpu and radeon. Look here (search for
> "hwmon_attributes"):
> 
> drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
> drivers/gpu/drm/radeon/radeon_pm.c
> 
> Here the hwmon attribute definition is very similar to how general sysfs
> attributes are defined (they will just appear in hwmon directories) and
> does not carry baggage of the hwmon infrastructure (what i915 has). So my
> preference is to shift to this amd/radeon way for xe.
> 

You mean your preference is to use a deprecated hardware monitoring
registration function and to explicitly violate the following statement
from Documentation/hwmon/hwmon-kernel-api.rst ?

   All other hardware monitoring device registration functions are deprecated
   and must not be used in new drivers.

That is quite interesting. Please elaborate and explain your rationale.

Thanks,
Guenter

