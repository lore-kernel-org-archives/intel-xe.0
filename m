Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FFDC54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587F410E03E;
	Fri, 15 Mar 2024 14:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="K5Izuvtg";
	dkim-atps=neutral
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5721010E03E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:14:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-41400332525so6252825e9.0
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1710512075; x=1711116875;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bl9nxTAczeLZdDRByyfyGIUpLb8JNZSN8xP4iVGKi/c=;
 b=K5Izuvtg42FcZ7iTVSZjKltcSobFtojylCxYaRrXsnZ7kJjYFsMHFnIVmDTJIjTZ1H
 UFuwRYVEOxBQnnDNHEDLA8GTkDtEFlXaA5P8MfX6a+kk1RsrEdZwsXw6cdKyphvpUw3G
 WkkFcyxqm7BVxT0rB7JC/NRZsAfcxB/UBkW3gJebFvODhPJ1qf/cN1ZI7CoV1HdBe4bd
 AztkPpHpwnRXaIXyB7NUJ3A+3fAXIFadVq8QPTpeuj6P1o0PMLSF+POIM2/F87iOrSwE
 wZ30jkX/omlGrGqz8G6tSzkczayHJ5FaMGVR6yW6kKLK1F6ZONXTLcLnjsdTRXkXN1vo
 oIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710512075; x=1711116875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bl9nxTAczeLZdDRByyfyGIUpLb8JNZSN8xP4iVGKi/c=;
 b=B7imtnWbXyJKXznMg/r7oBDHvHTx9yUom4g6Cf+4bagL5na+ISg1fInRUHY0CmbDgQ
 Bzoj7hg2ZX9WGScAfE6jzXY/Bsa6hLQOBC0JOs1OJllq9qTTuqjMFO04h41l8fBPgeil
 3Rg8dao8WXrAkrtipMyCZGfCEOZcA3SRL2GbU46z2Tl0VdwhJMzTSG/ejCxn/4vTzc6t
 d9VtMx87mZn6w4k27JQtkATWbTv+AzhamyrVFSalm+uNLbjXcqBEIMvYb03U4OLw9hBu
 7yVHVhgb74TQ+Fkc4UwxxJ2PM/5WegIlWRBEfsAZ5xErchUBTbhy98rfNE5cjaLktIHK
 be3Q==
X-Gm-Message-State: AOJu0Yx1an9/XLi7YG4d9NNrt2EaSJfc5HQD0GRYZYC9ui2p0uIUgY96
 lKzf2aXOh670dgJkF8m8pleipu07Bb8CScwk3KxyIDB/xwmpp7ZjFwS/GXSipg8=
X-Google-Smtp-Source: AGHT+IE1ov5eOpCeKxyRwedldXCXKI/d9yWJoCyrApHBZVFJ5k5+j5d85xiP+TE0FAolDeaE/8EglA==
X-Received: by 2002:a05:600c:3b1d:b0:412:b0cc:1c62 with SMTP id
 m29-20020a05600c3b1d00b00412b0cc1c62mr2225051wms.32.1710512075254; 
 Fri, 15 Mar 2024 07:14:35 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0033e79eca6dfsm3250524wrm.50.2024.03.15.07.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 07:14:34 -0700 (PDT)
Message-ID: <89074e2d-9b23-40af-87f5-61017173d33c@ursulin.net>
Date: Fri, 15 Mar 2024 14:14:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <85sf0s5lvr.wl-ashutosh.dixit@intel.com> <ZfO8BzWmVJ98T0Eg@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ZfO8BzWmVJ98T0Eg@intel.com>
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


On 15/03/2024 03:09, Rodrigo Vivi wrote:
> On Thu, Mar 14, 2024 at 06:23:04PM -0700, Dixit, Ashutosh wrote:
>> On Thu, 14 Mar 2024 18:03:15 -0700, Rodrigo Vivi wrote:
>>>
>>> Introduce a very simple 'busted' state where any attempt
>>> to access the GPU is entirely blocked.
>>
>> Busted?
>>
>> busted. / (ˈbʌstəd) / adjective. informal caught out doing something wrong
>> and therefore in trouble: you are so busted.
> 
> that's why ;)
> 
> also:
> https://www.dictionary.com/browse/busted
> "broken, fractured, or seriously damaged"
> 
>>
>> Why not wedged
> 
> https://www.merriam-webster.com/dictionary/wedged : "shaped like a wedge" ? :)
> 
> or perhaps this: https://dictionary.cambridge.org/us/dictionary/english/wedged
> 
> "to make something stay in a particular position by using a wedge"
> 
> "to put something into a very small or narrow space, so that it cannot move easily"
> 
> that's the i915 terminology and meaning that I'm trying to avoid here...
> 
> i.e. wedged can be a temporary state like in i915 where we 'wedge' and 'unwedge'
> the gpu in so many cases. That flow doesn't fit well with xe scheduler and it is
> a complication that is not desired.
> 
> So I want a stronger word that makes it really clear that something went wrong
> and won't easily transition back.
> 
>>   or lost
> 
> but not that strong...
> 
> it is not entirely lost... we can still open the client, otherwise we would lose
> display and also get the guc logs.
> 
> If we really want to go lost and avoid the client connection then we could
> simply deregister the drm card device for instance...
> 
>> or down
> 
> looks like 'off' without power...
> 
>> or dead?
> 
> too strong... like lost.

Busted feels maybe not fully professional in the logs? So if wedged 
really cannot be re-used for reduced congitive load then Merriam Webster 
lists 'jammed' as a synonym which has a pretty neat definitions.

a
: to become blocked, wedged, or stuck fast
The line jammed and the boat hung useless.

b
: to become unworkable when a movable part becomes blocked or stuck
the gun jammed

Or 'off-lined' and maybe truly unregister the client as you say above. 
There is some benefit to avoiding funny words in kernel logs I think.

Regards,

Tvrtko

> 
>>
>> :-)
>>
>> Ashutosh
