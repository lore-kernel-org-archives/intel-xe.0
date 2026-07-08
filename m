Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67495C44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 04:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEDB10EFCF;
	Wed,  8 Jul 2026 04:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="b7v6lEM4";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626A410E4BA;
 Wed,  8 Jul 2026 04:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=J5KYkoVlChk5FZYYk9M3NMB8dnleaZ2GYxmr408Jaic=; b=b7v6lEM4nKC6cjUM3J/T5KHT4E
 /wUBtjYn5k0byZ5dtB4jw0mGx1uuJ1v6JBvT1Pf4QPfOJawiygW26T06u1H/K966a7r0AU+/5lBhR
 +kFqMNUy8ilvAb8w0OqtFc6mYjjWIY+dyyM33ZG8Xh5t7hwSSvkciSxRovOnzAlxmAXzZpTBz58mZ
 wsKjXOLq5tNgi+IpbfzGi8exXFpKiVUFQG3fm/2tQRA4j77ZBX3ZzeEqXarpldWfmCcKUZ/Y3mo7a
 Uy33MLFnUouLFI5ffSnCViW+Lloa4u7SENAAaJe4VgtH18WfiG/NXgfZXB3Bw/aFTN29ZZ1A1iXTM
 Fsp+NxDg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1whJta-0000000GJuu-0pTr; Wed, 08 Jul 2026 04:28:26 +0000
Message-ID: <c248c4e8-0dc6-4c9e-a7e8-1c00ba0f1453@infradead.org>
Date: Tue, 7 Jul 2026 21:28:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: xe_drm: fix chars used for subsection
To: Rafael Passos <rafael@rcpassos.me>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 skhan@linuxfoundation.org, Intel-xe <intel-xe-bounces@lists.freedesktop.org>
References: <20260621030114.963405-1-rafael@rcpassos.me>
 <1a20e4bf-fd7f-453e-b7a8-c7feb0b077c6@infradead.org>
 <DJL413GMZH5Q.2S11VUVHGLLVF@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DJL413GMZH5Q.2S11VUVHGLLVF@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
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



On 6/28/26 5:34 PM, Rafael Passos wrote:
> Hi,
> 
> I just checked, and this issue is still present.
> Since the merge window just closed, I think it's a good time
> to send a ping :)
> 
> On Sun Jun 21, 2026 at 1:07 AM -03, Randy Dunlap wrote:
>> On 6/20/26 8:01 PM, Rafael Passos wrote:
>>> and the page title is defined the.
>>
>>                         defined there.
> 
> Should I send a v3 of this patch fixing this minor typo ?
> 
> I see the original email did not show up in Lore (just Randy's response).
> Should resend in cases like this ? In this case, while at it, just do a v3?
> 
>> LGTM. Thanks.
>>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Also, if I were to send a new version (changing only the commit message),
> and the previous had Review/Tested tags, should I carry them in the new version?
> Or just send it as is?

Leave the tags there.

-- 
~Randy

