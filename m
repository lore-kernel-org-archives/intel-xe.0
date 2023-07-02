Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEE1EB64DD
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 20:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4B10E00C;
	Sun,  2 Jul 2023 20:51:46 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72710E00C
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Jul 2023 20:51:44 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b89600a37fso1800175ad.2
 for <intel-xe@lists.freedesktop.org>; Sun, 02 Jul 2023 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688331102; x=1690923102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=GNQ7MCU0vFQALsRwU6Qk+wtv/uz0hK2eGYJI5C64+Mc=;
 b=iB1xxEuaDfR9jwFh1VUCMJb6A4gHq9fWcLuQPvrmXjGWdDfNjVrL6LzQUlDL43L9TD
 KhfKfqr7RFwwRIWI+4MiKRz7Fxp/KozJfZbvsMhlSxHU2lIKqEepDWZu/ZfLFvD96p1d
 8IoRBPLVKqirYqjtspeeSsUv9aiEi7rh7P5Y1V6bVGK3eU+ZqpFDOHlwMRPglEwN4SVk
 OQHrv2fHXLqGW8iP9TuryOO7GHLfbMcpCgl/9WMVVXHkpbJo9isY9xxgH/biOQKL3OoI
 zIEU+pn6PgNMcsrtoJGG1yHqTvJMGeS3x+LAmEVsm/OGvzDiRCcKUa69CyOZd1kyHDO6
 5CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688331102; x=1690923102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNQ7MCU0vFQALsRwU6Qk+wtv/uz0hK2eGYJI5C64+Mc=;
 b=EbsnTiXcu3I0xfXJPNDdQWhyhtSElJ1flM95jVmEXqBimPpP3PliWaX3vsijpGuLwD
 hSe+7If1hsoplVBupi2MCE0LIERFTBtm81pc3LZ/+l6z4B2V1sk0SwR1bmzoIqnDaExq
 DaSuLGzq9VBBcvI+b+RCKmbB+Kf+efI6amvrKG2NuJpH7D6veegAiwpq18t+/K2NTDb1
 aT7H4fZGcXiSBKYCbT8cFxhv45EJE+xtGXXuwTqz2zkOkMMdJXoNedSt2Nbr/uQIcaBb
 91L5xZJlpGsXss0Hd+9SgdI+ao34u3MYrsxBTKutmmlWcZdDWQJ1DgyK6TLM7DLbqQQC
 CKEw==
X-Gm-Message-State: ABy/qLaR47qbUv2H3sHGPGcTDWcj/aXbGwv1onu2Kk48DURZ4GeHKPOg
 iVe3lpvF+skqYQfipVRoTGMNA7PnTkc=
X-Google-Smtp-Source: APBJJlF4OXSrfI76rKfx9UR12l626wyyHZoSLHdtd8sAf0dFkhpcSZPIEvVjGOQKRQ+IFwfHbFqIsg==
X-Received: by 2002:a17:902:b209:b0:1ac:63ac:10a7 with SMTP id
 t9-20020a170902b20900b001ac63ac10a7mr5439520plr.68.1688331102607; 
 Sun, 02 Jul 2023 13:51:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a004800b00262af345953sm16463236pjb.4.2023.07.02.13.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 13:51:41 -0700 (PDT)
Message-ID: <4b71ba43-4cbb-0840-a46a-3fe4518254d0@roeck-us.net>
Date: Sun, 2 Jul 2023 13:51:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <873526dpl3.wl-ashutosh.dixit@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <873526dpl3.wl-ashutosh.dixit@intel.com>
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

On 7/2/23 13:29, Dixit, Ashutosh wrote:

> Of course people might have been abusing the deprecated API's (or NULL chip
> parameter) but to me it seems there is also some legitimate use for them.
> 

You still neglect to explain what you think that legitimate use would be.

Guenter

