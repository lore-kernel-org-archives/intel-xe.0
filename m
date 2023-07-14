Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF10EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 22:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB16E10E156;
	Fri, 14 Jul 2023 22:26:54 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E4910E156
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 22:26:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b9cd6a0051so15700505ad.1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689373612; x=1691965612;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYf7+074zKU5JSmP74Q6cWtarjvwh/yFsj3NY8+swho=;
 b=GlfuH2pnPClvJZ+ZVQbNZm9+IK/TNPFVgYT6nDbkM+NKAdfDTlNF4zZIsMH7quYBJg
 45yPsZm3ZaXl8p4T04lrXOlElNM3n2Ii8CRWVx3izr4SUUU21KUuVs8gXlUQQMZG9kuN
 pz1IDcmREE3LsPN6EVNoxAHi0MX/uzK0WxTfjL0Umw87Ongs5N+qd5db7F6Szg2ABLBJ
 9ZyGcbtXb5dACedNIfmZ/WcIpF9MNWpGybns1YKvUCN9gk5k/TBAcBmqLfKNbaG/Q5B+
 hGFTGvxlp6LMI8gOh4U+q7ceEL5oZkXkIZq+ZqlbyvZkM682sJh1pCUv3q3BTJTBfa6+
 Wkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689373612; x=1691965612;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYf7+074zKU5JSmP74Q6cWtarjvwh/yFsj3NY8+swho=;
 b=NjlF6+4ZeQB+jJDZ2JCwDsC4J47QtY7gAH0dkaG6VJB2YmjOt9001p9j9R4dmtRmFv
 YlaopR7xGFP+m8gOoHfwxFlz6ZNg2J3MU8vx8VPK0G3Q0FQlyjeU/+g7gs8Ur0qlBZvC
 6q7acJKVLgCwV6pt6yT5HLWytHbW16Re1GkTZ1HApFfB5O5JPDdKAGWgO/eiuKdON+Qv
 18yv9vmBp14jn9CvUVQ3TlrkmdZlJZs/xBBPj4TFmuC3WMsZXnkADgzZ/nia2TAlsJrg
 HrL4LVszG8aerMWIM2GfrfBnOLQRMkd4jKXRih/ZYBX4w5q4jrHVIWF34SZaswxLN0C4
 7Tuw==
X-Gm-Message-State: ABy/qLbrMQbfmk8M6hauU9QrVOYmefMTsbwN/YQ1Sgttztwmhi8ulc5s
 XF05BSrsEKS0oWumnbnzHuF78mBvffs=
X-Google-Smtp-Source: APBJJlHJPgZPBAGwgojnBGrY6ozAteVJOJbTSk8fahjqh0WnybX602qlvHcsDiEVaWmhWQhPnNHc+Q==
X-Received: by 2002:a17:90a:a089:b0:263:f590:f231 with SMTP id
 r9-20020a17090aa08900b00263f590f231mr4235721pjp.26.1689373612376; 
 Fri, 14 Jul 2023 15:26:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a63ab01000000b005348af1b84csm8043257pgf.74.2023.07.14.15.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 15:26:51 -0700 (PDT)
Message-ID: <168c418f-4805-4e89-c88c-f08d4157172b@roeck-us.net>
Date: Fri, 14 Jul 2023 15:26:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
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

On 7/14/23 13:21, Rodrigo Vivi wrote:
[ ... ]

> Hi Guenter,
> 
> First of all sorry for jumping late here. I'm totally with you here and we should
> definitely only use the new API. For standard entries that will definitely
> reduce the code size.
> 
> So, since we are talking about reducing code here, and looking to other DRM
> drivers, and thinking about the needs on this new Xe driver, I'm wondering
> if you would consider accepting 'frequency' as a standard hwmon attribute.
> 
> We would need it to be RW so we could use to put freq requests as well,
> and possibly different types/domains and even throttle reasons on top.
> 
> So we could then try to unify all the drm drivers in a common drm-hwmon
> layer putting an end in all abuses and deprecated users.
> 
> But before moving fwd with any proposal I'd like to hear your thoughts on
> this 'frequency' block as standard attribute.
> 

I really don't see how this would fit under "hardware monitoring".
Making it writable would be even worse - this is most definitely not a limit but
an actual value. The notion of limit actually shows that it is not a good fit as
a monitoring attribute: I can not conceive the notion of a "maximum" or "minimum"
frequency limit, or an "under" or "over" frequency.

If this is about thermal control/management, you might want to consider registering
with devfreq and the thermal subsystem (see devfreq_cooling_register() and
friends for reference).

Thanks,
Guenter

