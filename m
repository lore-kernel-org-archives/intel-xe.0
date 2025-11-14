Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CC6CE7AF9
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 12:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3539C10EA4F;
	Fri, 14 Nov 2025 12:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="wSlYsOCl";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92610EA4F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 12:11:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso10121575e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763122268; x=1763727068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHozkaU7uC3xHMmicM5D9X4jkYvfAFDnnUvRm+IwdY8=;
 b=wSlYsOClBII3vnmoiAiQPl/BEL1nR4/GJFwnvLFXT5aBHwOmlYB8lgd02WhUb7YMmB
 P7ZVCGeI4xWHTh3HVa3cwnm9i6P0awnOPVygdbJ1KF79OxAzeHPZ9SOuKALmeuEBhvOm
 QCVkrGrKQ1kCSbBb9mISXh4ogVKrObGbMZidYC0hla7wo/6E9vyQDcuKY4CKKP7aFcR2
 RRGx/+fmBc5OAIT29u6MSJKA5TkqOrOJ5fdo65x2a+0cGZvXrf8PU3O7ESXzMkIJYmrE
 iJrFP8MZM8ytQY6/pOHDQ6mc+Lja4wzdqjZH2OtENTlIuRXjAdpghVBMQCTAD0kL+BX1
 XphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763122268; x=1763727068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHozkaU7uC3xHMmicM5D9X4jkYvfAFDnnUvRm+IwdY8=;
 b=v35lsrc1XzZlguAEHrnspA/2DNUwPmcdmomos/ci6ImF3M4APMSqSLEK/1V63sey8K
 mAen9vaJ+DTy0m6tFWpOC9uNGpxa3oA67+f+ZpMjKgvST201Vzl5gWbv7hvDRxj86hEm
 ssdccUdJg6trWfphg1oMlOApW3ewlcyx/1fUwyCqFpnJ64HtV0Cq1SeKid1FpgW+MB0+
 yBoE8DmXtDnQKcvFhTYzu5keC1xp4weNqtBxgRhBiZGvYNFuv062HYYARXj2Xv1qPQva
 NKqa4/t+NuPsRMDK2ZZKjtPI7iyQxYH0cUC9bUrJJ1JyG2IIsj/1KcEx+C//CSo5JkcY
 CP6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9PwQjXYgICGvuvQVPxrgC7mzaDPXHWiPagmU0VAPomFwRuTOY2BnY+UZ/pfIL8za/WHkuYG8VAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Xbl3/6HSsq7PFls9lz9OT1/xX4CY94rxJ5msIfCSlohAWYqM
 dXsl+GGx7GT5Eb43rokTy71ZABSrZGeGKx9dNGLoHXb2XTveuvXoUQwfnXR9y4OLUNM=
X-Gm-Gg: ASbGncv2NSQHDDBcXGXN/MbD7SU/KYwK/nwYvGjThAaWAz+XlZTHb7HYdxnqIVitdco
 e/0NyXDr7Y9j0emJS1jx2yAH89bKULVUd0+7agmAH4arR7/lhzsAd51JkoZM4gCrjGpWxukl4rq
 n8VwBKJFiszItZZLwYISUmhFOy5m4TlC6m+pfSDBEvrWn7bREYJdBk9nnsWnXTvBaXwmRfY64Un
 ySaMJdnZB8g8Uc29AV9DkxC7CNLbjTKNdqfphj43b+vGJmaHZuv5oJttQeYPjQwScGKT4OKZ8cX
 x52NRARLmiPiOi/vDYN3rVD4pmNtwsHHoOtTXj/kyTVimVvaHI+GlVowkB1QFZZ2ahPdlsryY7v
 xU3MMRq7pI809ztuf7yFCST9HGgs7k1SgAdPseXeHuKf9NvaLHhro5GZPEfvFyptGL10wgWUnqf
 p3Ma9O+hGNNX93T5kiiv3BzLIK4hUpGOzd
X-Google-Smtp-Source: AGHT+IFKgnOpAgwm/TdkD1QJDwAz2uK9fLeUXvi9FCd++aipQsmXgTyVyfaNcpWwPo6WByf4FYRbOg==
X-Received: by 2002:a05:600c:4f93:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-4778fea6decmr31496655e9.28.1763122268364; 
 Fri, 14 Nov 2025 04:11:08 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47795262358sm3642495e9.4.2025.11.14.04.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 04:11:07 -0800 (PST)
Message-ID: <b2f3b7ea-f848-4da4-868f-07742c31e6c1@ursulin.net>
Date: Fri, 14 Nov 2025 12:11:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache coherency issues when reading from intel Xe buffer.
To: Jakub Prussak <Jakub.Prussak@synaptics.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: PPD-Penguins <ppdpenguins@synaptics.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
References: <PH0PR03MB6299572C46068849DBDD3A88E9C2A@PH0PR03MB6299.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <PH0PR03MB6299572C46068849DBDD3A88E9C2A@PH0PR03MB6299.namprd03.prod.outlook.com>
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


On 06/11/2025 08:24, Jakub Prussak wrote:
> Hello,
> 
> For some time, users of DisplayLink USB-3 docking stations face 
> corruptions Ubuntu 24.04 on machines with Intel i915+Xe driver (LENOVO 
> IdeaPad Pro 5 16IMH9 in our case)
> Machines using only i915 driver are fine.
> 
> DisplayLink driver is using evdi kernel module(https://github.com/ 
> DisplayLink/evdi/blob/main/module <https://github.com/DisplayLink/evdi/ 
> blob/main/module>) that works as drm output slave. It is using drm_prime 
> exported buffers from i915 driver.
> 
> We had checked a way evdi access dma-buf exported buffer, e.g. if it is 
> reading it within dma_buf_begin_cpu_access/dma_buf_end_cpu_access.
> Also, we ruled out access to the buffer before all dma_fence's on 
> drm_plane are signaled.
> Another approach was to wait on dma_resv resv object from 
> drm_gem_object's dma_buf_attachment, again with no luck.
> The issue is reproducible with evdi's evdi_gem_object and generic 
> drm_gem_shmem_object implementations of drm_gem_object. Corruptions are 
> visible with all compositors - XServer, Gnome/mutter, weston.
> Other kernel module facing this issue is udl.
> Nothing was helpful and we suspect some cache coherency issues.
> 
> The problem can be reproduced on the latest kernel on computers with new 
> Intel devices, and a lot of our users face this problem (https:// 
> github.com/DisplayLink/evdi/issues/524 <https://github.com/DisplayLink/ 
> evdi/issues/524>). The way to reproduce it requires installing EVDI 
> module (https://github.com/DisplayLink/evdi <https://github.com/ 
> DisplayLink/evdi>), loading it and creating a virtual screen (this can 
> be achieved with this sample app: https://github.com/jakub-prussak- 
> synaptics/evdipp <https://github.com/jakub-prussak-synaptics/evdipp>). 
> Once a virtual screen is created, the artifacts should be visible while 
> moving the window around on that screen (see the attached picture or 
> user reports mentioned earlier). Similar issue appears with devices 
> using UDL driver on Intel platform. Attached are device information 
> files and a dmesg output when reproducing this issue.

If the exported buffer is from i915 then it sounds the same as the AST 
driver issue. See the whole thread at 
https://lore.kernel.org/dri-devel/20251024110432.1313391-1-jfalempe@redhat.com/.

Special 1-way Meteorlake coherency, which I cannot remember which way is 
that 1-way, and exported buffers may be broken. Especially since the 
internally driver pretends things are fully cache coherent which makes 
the begin_cpu_access on the importer side is a no-op (more or less).

Anyway, someone who remembers how was Metorlake supposed to be handled 
will be required here. Ie. is it "as designed" ie. userspace needs to 
manage it, or the i915 side of things was added incomplete.

Regards,

Tvrtko

