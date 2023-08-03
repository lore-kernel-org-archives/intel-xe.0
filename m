Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F1EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 14:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9110E60C;
	Thu,  3 Aug 2023 14:42:57 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355F10E60C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 14:42:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b8ad8383faso9253635ad.0
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Aug 2023 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691073776; x=1691678576;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/iXV4w46hA0Jqf1gWu4mX128k+v2+T1g85VgxHyXF9w=;
 b=LYECZnQLIDitoml1p/1SH/RqAt5ZH3eipgabaYtbili1lk3SlL8CiheI79U8SvKtGB
 p4cMD7tTKCK69O8g/L5vPzxX0zRvYykq6rN5DeGrrVfcwudK/wjnfwMRrcc04M4IWV+9
 RvbOJwc9weW9o0xOLJsOf4w7N/hEEhwuMjdZobogBhPDGe5qXs9fKadmgj7jVcEbhm1B
 CcLSIDiJT2XTpc+dXulpmRpWYhRWjGkISKGjVYd/8SDoqLoVKsNGKTNWkUkImgh3kNNx
 DswvzMZhz7z380O1mQj7dNXWu0aYIqAPT5djDrj5mfrMlT6Ca6XE4YavtEr6N70oqqxk
 rR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691073776; x=1691678576;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/iXV4w46hA0Jqf1gWu4mX128k+v2+T1g85VgxHyXF9w=;
 b=hAwgzzm1blsmortVpDGrJyvXvPc4LtRPc24kGVHmK15PAaRPXRtMvBh/1I8s+v2Jdr
 QwrWy5e3m5ev/gWujj/uijSNlUetifB+CJsH42RAntHjvS8/51O8dRHwGY3PaQLX1fG7
 x23zCpUmBam3CwWBUpqLzQM5bc95qJh76CEIh8WRaYQTQGPf/YFJyoiNITPiLCKxpAPb
 S7+PEF+PqitgriF9HAbA8Jlt2eCQDYXry8UGRDVZFrzkG4FotzDO28DvtRz9tDwIv0Ie
 H1ZiAw26Sj2I/oQLDOghCJmR9Lmt6lO8b+N2Rb/hMwKessgY84OR5MHwpw0UtAzH1x4x
 STRA==
X-Gm-Message-State: ABy/qLb4noHFOJHHk0Sow9OGfZ7WcWYHr6JeNFogCgaFnDeoZvUHQH4Q
 b27gA5bWFq7CESvNzIgzmuM=
X-Google-Smtp-Source: APBJJlEPFg8KhLAhwoi/HLdYK5NW4PQVM83gFimq4/PuNWuSljNelKfblDaq00MVTgpmlfsJON8MEA==
X-Received: by 2002:a17:902:ba8d:b0:1bc:2d43:c741 with SMTP id
 k13-20020a170902ba8d00b001bc2d43c741mr6310345pls.66.1691073776143; 
 Thu, 03 Aug 2023 07:42:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 jn15-20020a170903050f00b001aadd0d7364sm14438680plb.83.2023.08.03.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 07:42:55 -0700 (PDT)
Message-ID: <6644e516-f401-fd2a-8007-85e23cf69aee@roeck-us.net>
Date: Thu, 3 Aug 2023 07:42:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-6-badal.nilawar@intel.com>
 <fb6ed7c9-1a1e-bd0d-0954-7ebd8d38a3f4@roeck-us.net>
 <7e4da467-e4f6-1a1b-1fbe-dd97d54a337a@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <7e4da467-e4f6-1a1b-1fbe-dd97d54a337a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 5/6] drm/xe/hwmon: Expose hwmon energy
 attribute
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

On 8/2/23 23:34, Nilawar, Badal wrote:

>>
>> There should be just one hardware monitoring device. Just use energyN
>> and reference the input with an appropriate sensor label.
> Idea was to expose energy attributes under saperate hwmon folder with device names xe_gtN. But with channel/label approach it will look like energyN_input (energy1_input - device, energy_2,3input - gt0/gt1) with appropriate energyN_label (energy1_label = "energy device", energy_2,3 = "energy gt0/gt1". With this approach we can avoid using 2 structures xe_hwmon and xe_hwmon_data.
> 

There is really no such thing as "energy device". I'd suggest to find a better name,
such as "Package energy" or just "Package".

Anyway, your code is flawed: It claims to handle energy overflows, but it doesn't
really do that reliably. The returned numbers are only reliable if read at least
once within an overflow interval. Making it reliable would require introducing
a worker or kernel thread which reads the data from the chip in regular intervals
and accumulates independently of attribute reads.

Guenter

