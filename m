Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F5C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 14:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DA710F75D;
	Mon, 29 Jan 2024 14:59:53 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE37510F75D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 14:59:52 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so961698a12.1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 06:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706540332; x=1707145132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0hRRwRFhXV6/VNPZAde2iU0U1V9zjF583dIfMFDSvw=;
 b=O6aNaIbVpYzItZWl+fBKd1Zt+8xCgJp0794gRBpa2+Ag5ySn86bBM+asNxWX8Q0weE
 oGMkwxeFkD9ekzvS7zyOZqR5COk7Va97X0gyskBa+QIYLznvETV6pN6ALXg5MAzalFHv
 O7fhZpYUbOmdZHB6pSuTyQbW6F0Mk+aYdml+aAV+J219gwtmxjgWzs5zeBSSIkr64wum
 99XfezuH5oYpggyreuJvyyAl9P2S9Plg6oBPwYxKTkbtqRB3HInOxiNltnnIwP9f5VnY
 KCpzoLJY3a1tF6mFoYb1luwOo4rnsBGNa7bMf7QxnlKN2j5Gs1GWlsv1djzfNnmqv7hR
 btOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706540332; x=1707145132;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0hRRwRFhXV6/VNPZAde2iU0U1V9zjF583dIfMFDSvw=;
 b=vNqnxwe08S6+hri79YS3Ofho2tqF3UKSPLZPPnPrVPuNC7SrAOxazeR3zMJ7kHeK+A
 xdKniVjtES7yqZQjoSno2e/3kdt6AfJGy5UKcmY/e5rLMLc22WradYrrPb0IvWoDYJam
 IIn87tudV0Jq25NK6RsQHoa5k4hVVAyfyQMTjZd7uQW7Gc6WeYR8rmlhPIGrD1i8UctN
 e1w5EFUzRFiDMzctY8Ae/gNaLLarhrZtTxMJnkkUt7wMGBXoy9MBRXAUtaIvDinrx2BL
 3KOwGIuuB88GrEHwTcd2uphy+kPv1CcyjAWOv6TV5x1JzGhWknru2Xa3H942xeld7Cnp
 a7sA==
X-Gm-Message-State: AOJu0Yyc6mxDHvNti/Z2vgsZDsb4I+ryIiijGZaJU8B+iz2ImP5/3M5I
 auOzw4UQGxQB8Xz65elqmfVNDNthsebxn734GvOuu4zuBVHAyxCJ
X-Google-Smtp-Source: AGHT+IGWTBTOBZpp3W8KM2O3fsluhdahaENHmGqHcHIJbQPi7fW49a+nVBXNJltbYmygXoooNmvLuA==
X-Received: by 2002:a05:6a20:8b9c:b0:19c:a2bc:d1d9 with SMTP id
 m28-20020a056a208b9c00b0019ca2bcd1d9mr1506784pzh.55.1706540332115; 
 Mon, 29 Jan 2024 06:58:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b001d8fb137a57sm447760plf.12.2024.01.29.06.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 06:58:51 -0800 (PST)
Message-ID: <56b9c222-4e97-4eda-89af-3e0d0c39acb2@roeck-us.net>
Date: Mon, 29 Jan 2024 06:58:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc2
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com>
 <20240129104954.1778339-1-geert@linux-m68k.org>
 <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
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
Cc: sparclinux@vger.kernel.org, linux-hwmon@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 1/29/24 03:06, Geert Uytterhoeven wrote:
[ ... ]
> parisc-gcc1[23]/parisc-{allmod,def}config
> 
>    + /kisskb/src/drivers/hwmon/pc87360.c: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]:  => 383:51
> 

The "fix" for this problem would be similar to commit 4265eb062a73 ("hwmon: (pc87360)
Bounds check data->innr usage"). The change would be something like

-               for (i = 0; i < data->tempnr; i++) {
+               for (i = 0; i < min(data->tempnr, ARRAY_SIZE(data->temp_max)); i++) {

but that would be purely random because the loop accesses several arrays
indexed with i, and tempnr is never >= ARRAY_SIZE(data->temp_max).
I kind of resist making such changes to the code just because the compiler
is clueless.

Are we sprinkling the kernel code with code like this to make the compiler happy ?

Guenter

