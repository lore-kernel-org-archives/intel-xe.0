Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E132C00528
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 23:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA6810E084;
	Wed,  2 Aug 2023 23:12:48 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9841410E084
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 23:12:45 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-686fc0d3c92so261281b3a.0
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Aug 2023 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691017965; x=1691622765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=mKJfqQgRJkxddAOTwTgjFxX69bQ3MIVmkhWBoK/wchU=;
 b=hrREnZvPM4ySZQzzJU6kkVHw4Z9vWYdcv9VBVCF+Ts39KXOssUgi+7IQ/Gynz0UqO5
 a5mUkyp87k9w/0r9aWo1BoLBvs7KQQZUvTn9N9kqD82S0mxI079HSi+EjtENkkdq7FIM
 jsT/VNzHdyBJkCoRoyH7Ql5TcrfFHm+mI03WRdwaxQh2fHYjRwaYTQwYAT6shNURtSCq
 GivZh2dUqfmmDHzZhXEWiY+foLPfEyC3gW7HAtYl35qYLvzizET4nBvJTrdb8JBZDuWp
 6nij69FC1yXqRrX2/f/LUD3Woxof6J22Kc6OVx4HahL0gfJfEjygB/4Ucqw1cFqhJ/OG
 iiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691017965; x=1691622765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mKJfqQgRJkxddAOTwTgjFxX69bQ3MIVmkhWBoK/wchU=;
 b=Va58KpD777VVvz0W7HgnjBMmJR1obXUj2zHNankW96yMylyoL7YLmtNH4C+wW1Z3rL
 pjSZfLrJhON5btfF5EpHM/S+q8WSAgo9WsUYBZwnmuzWAhfwJgmDvv4rJeacOIuSgjtT
 QVV9+f5vOHQbAs6+SRPJOnnplE2xyFw1JKU973k/x5KQ1Ne85sclXcka8s3ft1SnuB1B
 nL5lIBYvLr5lKNQCfGggD5g4VE7fEIIXY7VY1XmKh5frlC26pUYviv+3P8ukc0JrZ66Y
 sLQ1JWTrerYzbaqaA/t6nkwB/KudJ53JeId8khCPs9ZhGTGBmuQr9Ydn/LH5HMruDeKb
 IzHQ==
X-Gm-Message-State: ABy/qLa1nc5NcIfTagHiBd/qsHpLTM02yTWGm2XG/to/PtmKtje4/Mue
 NoB7RzC0eFe2SXge/TULTGg=
X-Google-Smtp-Source: APBJJlFwHTZI8tRK/ryK2H+mE9Jia7AotnNxSCegQCx1Vsx68nyIoTSPlUO+KmEFMfpFLrD9Z5hwtQ==
X-Received: by 2002:a05:6a00:2d07:b0:686:5e0d:bd4f with SMTP id
 fa7-20020a056a002d0700b006865e0dbd4fmr19449977pfb.0.1691017965072; 
 Wed, 02 Aug 2023 16:12:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i1-20020aa787c1000000b0063d24fcc2b7sm11544239pfo.1.2023.08.02.16.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 16:12:44 -0700 (PDT)
Message-ID: <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
Date: Wed, 2 Aug 2023 16:12:43 -0700
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

A later patch adds multiple hwmon devices which makes use of it.
I think that is flawed, and I am not inclined to accept it.

Guenter

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

