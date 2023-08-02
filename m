Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79006C00528
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 23:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63DB10E084;
	Wed,  2 Aug 2023 23:11:23 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145510E084
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 23:11:21 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so241548b3a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Aug 2023 16:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691017881; x=1691622681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ixCoHM/kHUMQsK9atYFVp2+uz2n1FyQ9wPd1YxeUCw0=;
 b=hnSpV5jju3weaUXgJMwDhnLOGPT4X8LIs89dW9IkanTZLNO/Y3CucBegCA6QV5fggk
 aeIoPP6Jo2a0xIQTDPbm71CzKwCKwjSAdlNsLTcOVIZtE83hlhlLAo7+o75zSFjmhNyo
 iusxdWyKOqU5fQ7covzpofM7IO3SBNegR8/mH1xr9pttlPdr9DxJMR+wDDskh+eJ+Xcy
 CDAns2Y6laBqqK3u/Dzo6fZS1ttM78rS1WRsdSo/qmW8pYovEmvUcZkfoQYeS2+3F4tX
 7jD2im+LKOr5Hn9exe1WKwbihePocTfLgGSkyKgMprpZ1u+DztmLPkzlOmxbd7ncBLUZ
 +O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691017881; x=1691622681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixCoHM/kHUMQsK9atYFVp2+uz2n1FyQ9wPd1YxeUCw0=;
 b=Fd4QSffCG693EkAA4RVwzzbtoNbXZCmR/fdLUbhRbtbhgdsYf5WeObCo9+3mw8mci6
 jmP5ehMMU23iRY13gY5RaKpf9LjA+28o2RDbqQM7539LNcmXbO2njdy/5X4FRxwTt/Ns
 hgI/770XGWfbNf4N1pR4NCTBe2y/0wmQQBzaeD2ItEN6Yy1s3tvenjxCm/+6gIf4xZ8d
 XwtBBIGabFA6z/tdxda7lGug+VR6FIpxuGpQg4o/7B0fBOXmJqR3T8i4tF4i5h7TQ2AK
 tQSk1QAtJqarFs1wsowXZA57E05P1OlnHO9itB3m5L3mS7kF4Gp0s9ZUhSYZYYB7G8Oo
 Q2LQ==
X-Gm-Message-State: ABy/qLYAZU41VZTScPfd6oO6Q+zaNN6k11DDXt8bXSXFA+2UnkdWbS+C
 qeg1xHITvvYfQEimtWRdl+s=
X-Google-Smtp-Source: APBJJlEsZ8xwkGv8rTMatun6f/vG184pKfj7jv8jNPRivzns8At9qZXim/oEpmJ5cULFExJbtUM+vQ==
X-Received: by 2002:a05:6a21:6315:b0:13c:3d64:de33 with SMTP id
 wu21-20020a056a21631500b0013c3d64de33mr14998977pzb.13.1691017881037; 
 Wed, 02 Aug 2023 16:11:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n29-20020a638f1d000000b0055b61cd99a1sm12067516pgd.81.2023.08.02.16.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 16:11:20 -0700 (PDT)
Message-ID: <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
Date: Wed, 2 Aug 2023 16:11:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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

On 8/2/23 15:40, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>> +struct xe_hwmon_data {
>> +	struct device *hwmon_dev;
>> +	struct xe_gt *gt;
>> +	char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +	struct xe_hwmon_data ddat;
>> +	struct mutex hwmon_lock;
>> +};
> 
> why do we need two structures here? Can we merge them?
> 
>> +static const struct hwmon_channel_info *hwmon_info[] = {
>> +	NULL
>> +};
> 
> just:
> 
>    static const struct hwmon_channel_info *hwmon_info[] = { };
> 
> would do.
> 

What would be the point ? This is just a placeholder, and we need
a NULL entry at the end.

>> +static umode_t
>> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +		 u32 attr, int channel)
>> +{
>> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +	switch (type) {
>> +	default:
>> +		ret = 0;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
> 
> OK... we are forced to go through the switch and initialize ret.
> Would be nicer to initialize ret to '0'... but it's not
> important, feel free to ignore this comment if the compiler
> doesn't complain.
> 
>> +}
> 
> [...]
> 
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> +							 ddat,
>> +							 &hwmon_chip_info,
>> +							 NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
> 
> I think this is better:
> 
>     drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);
> 
>> +		xe->hwmon = NULL;
>> +		return;
>> +	}
>> +
>> +	ddat->hwmon_dev = hwmon_dev;
>> +}
>> +
>> +void xe_hwmon_unregister(struct xe_device *xe)
>> +{
>> +	xe->hwmon = NULL;
> 
> I think this is not necessary. Will xe check for hwmon at some
> point?
> 
> Andi
> 
>> +}

