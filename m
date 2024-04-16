Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F322CC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 08:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE3B10EB05;
	Tue, 16 Apr 2024 08:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="0MjjWTJh";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3010EB05
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 08:37:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso2808699f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713256665; x=1713861465;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dC1V4WAYbz38t8BdaOHfJMYSg1wW7j+2LhDAsQbSIzc=;
 b=0MjjWTJhP94KCtB+4eXNIri8epA4g0MS9ULAgy1ypptyM6sMpvMpLFWnVPbKTgjyPS
 /0uHml1e67VoLLEYRcj6L/1JrLPgWDRHefBVgpnsgW/OXQC+JlV8eeKEADUlWHFd5ynq
 sXIf+lJId7ncMgb7V6+Volyvy9+/PKOwgW/9egqGcCdZHU9yNigzFs78MMEC9sDC/jCD
 4hMmp3iuvvJ7G9wx11wqAwKiANnySwnLJXTD6T60hZlGaYhbnosEiw+w3WAJaMJHbnmz
 5DzguK4ktqiN8I6ox+z1FSpUQTRCpc9G4uXouLhJa04Y38EBpJ9bRlqchFz7WWxIhYe4
 ACmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713256665; x=1713861465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dC1V4WAYbz38t8BdaOHfJMYSg1wW7j+2LhDAsQbSIzc=;
 b=Lxi2f23dqs233AQ81jPk3zmZCsaQlSabhHPTZ18HiT2Ncbeo/h+dq4G8Y4D+vw7SF/
 NDoSgnLPeY7s6YRvH5BaDj7UvAIVrCOHrYApLcvV9gX72yorVJZg/vLmijNLvyp7r8G+
 wm1SfGsBue9919hyIFIQ93DjHOMrK7qeF+OjzkzbvfdUTCtfNK4nGuyLAPNqV5bbAMQs
 aoKFc9AqNCY/JDYsyQmkAIOftGhLzDBschvlN/Njg6dyoOyBKib3ixelMj+4lcZzA+vH
 +sYb6tGpAxVb6RuBJRBkYhQTDN1vD+H9Er0v2o9LWtZ1y5qCyBN09/oPOu/PugHDcSH2
 WTtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy5ADMll1IXvxfs71x6ITECBO6C1+TIst+QBWRuEdFP76hpPBhFJWZYRzv+GQT95uy87AbEf0G26I/ACYWZlCzCm3PnLx3YH0gA0DqOoE=
X-Gm-Message-State: AOJu0YyZsXJ4LcjotIYifYkiH1gNqeSgfyHa8f41eXxlPADyOIvhU/aw
 siltivJ7/bZi9UPSS64fm65uZAFvO5VsI06nNrpyefH4pkD+iXkpmgdTttfTMAc=
X-Google-Smtp-Source: AGHT+IEgIuyKrMkJKHFrNPqexREBh+KVsVvev8Ej4SoM5XxmCjfsip/BPacGylGgZfJtZzd0aljbiA==
X-Received: by 2002:a5d:63c7:0:b0:346:b6c1:1374 with SMTP id
 c7-20020a5d63c7000000b00346b6c11374mr8313329wrw.65.1713256665328; 
 Tue, 16 Apr 2024 01:37:45 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b003479bec98cesm6797701wrr.115.2024.04.16.01.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 01:37:45 -0700 (PDT)
Message-ID: <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
Date: Tue, 16 Apr 2024 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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


On 16/04/2024 04:04, Lucas De Marchi wrote:
> Add per-client usage statistics to xe. This ports xe to use the common
> method in drm to export the usage to userspace per client (where 1
> client == 1 drm fd open).
> 
> However insted of using the current format, this creates a new one with
> the unit "ticks". The intention here is not to mix the GPU clock domain
> with the CPU clock. It allows to cover a few more use cases without
> extra complications.
> 
> Last patch was a quick implemenation of a gputop-like tool in python.
> I ended doing it to cross check the gputop implementation. I's not
> really meant to be applied here.
> 
> I tested this on DG2 and TGL with kmscube (console-only) and vkcube
> (in a gnome session), but it would be good to soak this under more
> tests. The biggest goal for this patch series right now is to get
> consensus on the new UAPI.
> 
> TODO: Add documentation on top with the new interface.

Yeah a drm-usage-stats.rst patch would be nice to have in the RFC so one 
does not have to look into the driver implementation to discuss the 
proposed uapi.

Nevertheless I understand the proposal is to add this:

  drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks

That's two values per key. I guess "one key value pair for per one line 
of text" does not get strictly broken and that you propose a heuristics 
in parsing to detect that the <RUNTIME> cannot be mis-interpreted as the 
unit?

Not sure it is a good idea though. If you instead added a new key for 
the gpu time what would be the downside in your view? Like:

drm-engine-<class>: <uint> ticks
drm-ticks-<class>: <uint>

Or maybe even obsfuscate/generalise as:

drm-engine-<class>: <uint> gpu-time
drm-gpu-time-<class>: <uint>

Potentially could also add a key saying how much wall time is one unit 
of GPU time.

Or.. would even the existing drm-cycles, plus abuse of drm-maxfreq, 
work? Ticks == cycles, maxfreq == ticks per wall second.

Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
definitely breaks the format spec and in my view should be worked around 
in the driver:

"""
Values are not required to be constantly monotonic if it makes the driver
implementation easier, but are required to catch up with the previously 
reported
larger value within a reasonable period. Upon observing a value lower 
than what
was previously read, userspace is expected to stay with that larger previous
value until a monotonic update is seen.
"""

Regards,

Tvrtko

> 
> Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
> 
> Lucas De Marchi (5):
>    drm/xe: Promote xe_hw_engine_class_to_str()
>    drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
>    drm/xe: Add helper to capture engine timestamp
>    drm/xe/client: Print runtime to fdinfo
>    HACK: simple gputop-like impl in python
> 
> Umesh Nerlige Ramappa (2):
>    drm/xe/lrc: Add helper to capture context timestamp
>    drm/xe: Add helper to capture context runtime
> 
>   drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
>   drivers/gpu/drm/xe/xe_drm_client.c            |  81 ++++++++++++-
>   drivers/gpu/drm/xe/xe_exec_queue.c            |  37 ++++++
>   drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
>   drivers/gpu/drm/xe/xe_hw_engine.c             |  29 +++++
>   drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
>   drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
>   drivers/gpu/drm/xe/xe_lrc.h                   |   2 +
>   drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
>   drivers/gpu/drm/xe/xe_sched_job.c             |   2 +
>   pyfdinfo                                      | 113 ++++++++++++++++++
>   13 files changed, 292 insertions(+), 19 deletions(-)
>   create mode 100755 pyfdinfo
> 
