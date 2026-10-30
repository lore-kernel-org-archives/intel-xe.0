Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422E606A321
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Pq8+Vuzk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9174C112828;
	Fri, 30 Oct 2026 13:46:18 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29343112828
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-823b938464fso596157a34.2
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1793367971; x=1793972771; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
 b=Pq8+VuzkL0ngvNVFy4TeQnUrAbJIuova2axhhfcb98FHFcG5mtivIAHn/VVklVs3Sz
 GLQpJor6tC80AyNRVpTXwohGz77XWbu8YsoKBuzCQoxrW/2u0BwYsaeF5XcXB56cYIf6
 v/Uax5Ou4au83KofCOmtd4AvxK5cEy+h8KfXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793367971; x=1793972771;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
 b=QMlaQjPH6GhZlShNW7p6c2maS+Dz/belsk4X+Lm9z0FeRydgGF6SOUlv4au9F8rtrC
 5SSlBoBq52kS3NU86zByyz3FNY+/ly/uEyf5WeDB76gqKkIqpib/E5BnYvv78a5kaiDH
 CHId1n+UaXZVW4fIjcYKnxuOlH2coNo+1e7mYXWEI1YefCtUNwsLAPoHmloeNB/8boY7
 v9Gp5JP7miIxwAtoXlVPqygNFKqbkyzBf9JSZAHxUyEZWqXA3XggKljTH8HPcOryQl6D
 j3pVcXGMLMgbcuXhGSDhhpY+pv2mj3htB1rW259gop0Eitgv+a2vAx4oPlntOnRkAo4R
 r8ug==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgLRfBvohzG1oGFuk+IzbhY6fxiD8Saq30ubi4NgE2N0dMMWUvXKBQumlgsFZFbEmD6855xT/5dA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKc6Nd60cby+DRX2YFjH9M3aMqrt4pMOorxd0rATSaamIayvxU9
 fp8HR2wpsiWKHNMPJZB/iv4Is8mLl+/9+iRHt07dlvAgsEDTvpPzUhHYp7+yXWtw8g==
X-Gm-Gg: AYBFou0AJ0NLTvYIhBVrOjhZg03ftMiMQUbbrOWX2Ub2WvAfQ84Z1OV03kexKZ9RahC
 4AXshZ7VlP/HgND7UXgekWp9qmIBvenzNfBIxd8rSxX4Si9ihgwciyqba+zQotXO46j9Ga2hMsY
 AjcRVss92pp7Ipecoxta0RmEJJGPmNpwFXw1xwRiG8EGYs0mdDMCYyDZ0d2xvkLmZkK8a+eCp3S
 lW97UHyicWPH2qDnkOZtgV/EHaPeQU0o4pg2dUbFD/ESxyfDrwAY5PIV5rP0RCtSkjiyRdZtYdI
 Wc3lE+UAMAOirEUX5ZgvWdndaEycHH5fRjzksiQiLYB5LQRdeING8Rc0Pn5ufgILTImdLdN3Sxo
 H9pDo1pQwC4qOjC7No3gqFwU5uJRxnsc8U659lE5Y3LyJ6eBheMxmjauxXCqLRzoSItsjxE+QjL
 SkZ3FdKxEEe/ZqnYrNloRk3mc7vOxhFTt7EqNa/61w956aBXtla6uzBb8BUN26+sI1o2oTsj+Xr
 0MwpTeJuYvUlFyNuR5UD61a7OUN/5/urEeTJGe2g4W651p6mLtFUMJR0yPLs2f8A0KL32dA13oO
 9+smIQuVFEC6Ka30LNZKY2Ru
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id
 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178; 
 Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
