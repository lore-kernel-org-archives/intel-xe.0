Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB8BECE599
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D1410E55F;
	Mon,  9 Sep 2024 12:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hendrik.org.uk header.i=@hendrik.org.uk header.b="OY7+Y62Q";
	dkim-atps=neutral
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 02:13:03 UTC
Received: from dormouse.ash.relay.mailchannels.net
 (dormouse.ash.relay.mailchannels.net [23.83.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072D10E1D5
 for <Intel-Xe@lists.freedesktop.org>; Sat,  7 Sep 2024 02:13:03 +0000 (UTC)
X-Sender-Id: 9wt3zsp42r|x-authuser|hendriko@frieza-lon.krystal.uk
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id E0711841BB7;
 Sat,  7 Sep 2024 02:06:13 +0000 (UTC)
Received: from frieza-lon.krystal.uk
 (100-96-74-102.trex-nlb.outbound.svc.cluster.local [100.96.74.102])
 (Authenticated sender: 9wt3zsp42r)
 by relay.mailchannels.net (Postfix) with ESMTPA id 92B9E841955;
 Sat,  7 Sep 2024 02:06:12 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1725674773; a=rsa-sha256;
 cv=none;
 b=gyi1fysQgKLcNzfwsGx9lOLzhnHFX0HiZABg9XuyDGGh3YYg5bWiVz4dcBuK+3H7tO9+Kf
 i4Wv14ztoum/Th7sqysraEj662yCKyAptY8OjgxJu3U37ObebN237sQTo0i5LKVXg08hhb
 c7jGxmzCw/j6MXYfLa0rL3U/A0381xrmn1UDdTS86Yiu/dwkoFXtffRSEWvP5ke5IvGIp7
 +LqdXgxJPniTEfrsRRvB4AaAxcZ1wfDNAt1gOP61xkWfiogZGw1FVsNAEamZphwiPZ21CS
 avh21B7zllHCXSVfLMpjyAUfsDtEMyqSe+LkCf2LTxuiK38r5mViF/8ZWUkTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1725674773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=m19MevNHze6Nq50mEKtxdtA9QvnVhh9Yw9uVDKP4dPk=;
 b=t4ztdh2ssUtFLWroS669rg9FWwLPRXRss5EkUKEVaSEGKEx2m207ovs6Y3bo2g8cTeoXUH
 2cTtAWktY/sY3HaGdSNXSxhrYp2YoCUO/zJdDNuQlfMcn9QJJARNa3+twGL4x7bdgDJFA6
 M/wblDmblgOF8RRv+v+RdBqQckXLSYyl1m0tkCX93OBiPHZzZWDXYLiJ41OkYgjSUL9ysJ
 zzflqVnoriAr59Mfyq/WZaX6NRH/wF/lMVPMfLoeqQ/uAWgo5ArkQZrs1RfMOKnvSTv42v
 TjmEn8xj7ISyJXOmrEeKsDREQ3PhAVNdHYHUaEutkPu2NMr5/WaxsjGZl+clJA==
ARC-Authentication-Results: i=1; rspamd-77766c4bb8-ltk5m;
 auth=pass smtp.auth=9wt3zsp42r smtp.mailfrom=John@Hendrik.org.uk
X-Sender-Id: 9wt3zsp42r|x-authuser|hendriko@frieza-lon.krystal.uk
X-MC-Relay: Neutral
X-MailChannels-SenderId: 9wt3zsp42r|x-authuser|hendriko@frieza-lon.krystal.uk
X-MailChannels-Auth-Id: 9wt3zsp42r
X-Occur-Callous: 6c8521513d916acc_1725674773418_2770594003
X-MC-Loop-Signature: 1725674773418:3129381248
X-MC-Ingress-Time: 1725674773418
Received: from frieza-lon.krystal.uk (frieza-lon.krystal.uk [185.194.90.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.96.74.102 (trex/7.0.2); Sat, 07 Sep 2024 02:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=hendrik.org.uk; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m19MevNHze6Nq50mEKtxdtA9QvnVhh9Yw9uVDKP4dPk=; b=OY7+Y62QvVQzqmiRHAZBXIJKeS
 1QT/mRXdLwkLFHLxyr2x7ZQpzBpFw6DlKVYExLjlRxD2Y+Y4B0dCpsv/au4yh219mq2SR1BQNHFLy
 +YC5HIoHT2jJArjC5FbOZprmYNsm+PezDKPmKWyeYNmEXhQ2Hvb8gRg501KmfM9uzJPyO2SrsGiXN
 4kZZg/01I8JDM21fN40Pj99XPiuHY0h1X9iAAZOJS4gfrekaq7grfoFnuEOc4a8EcujUAysaidn8j
 XwYoV+q1+unbR7jzjGrrFFx8j+0Xdx5FwB68oBvkRy0uiRFXtir8AMvoyROn+5uRH7gWOT9218XhL
 VflIRBdA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]:51216
 helo=[127.0.0.1])
 by frieza-lon.krystal.uk with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.96.2) (envelope-from <John@Hendrik.org.uk>)
 id 1smkq5-00GISF-2q; Sat, 07 Sep 2024 03:06:10 +0100
Message-ID: <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
Date: Fri, 6 Sep 2024 19:06:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Intel-Xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
Content-Language: en-GB
From: John Harrison <John@Hendrik.org.uk>
In-Reply-To: <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AuthUser: hendriko@frieza-lon.krystal.uk
X-Mailman-Approved-At: Mon, 09 Sep 2024 12:37:17 +0000
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

On 9/5/2024 20:04, Lucas De Marchi wrote:
> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com 
>>> wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> There is a need to include the GuC log and other large binary objects
>>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>>> function via conversion to ASCII85 encoding.
>>>
>>> why are we not dumping the binary data directly to devcoredump?
>> As per earlier comments, there is a WiFi driver or some such that 
>> does exactly that. But all they are dumping is a binary blob.
>
> In your v5 I see you mentioned
> drivers/net/wireless/ath/ath10k/coredump.c, but that is a precedence for
> including it as is from the device rather converting it to ASCII85 or
> something else. It seems odd to do that type of conversion in kernel
> space when it could be perfectly done in userspace.
It really can't. An end user could maybe be expected to zip or tar a 
coredump file before attaching it to a bug report but they are certainly 
not going to try to ASCII85 encode random bits of it. Whereas, putting 
that in the kernel means it is just there. It is done. And it is pretty 
trivial - just call a helper function and it does everything for you. 
Also, I very much doubt you can spew raw binary data via dmesg. Even if 
the kernel would print it for you (which I doubt), the user tools like 
syslogd and dmesg itself are going to filter it to make it ASCII safe.

The i915 error dumps have been ASCII85 encoded using the kernel's 
ASCII85 encoding helper function since forever. This patch is just a 
wrapper around the kernel's existing implementation in order to make it 
more compatible with printing to dmesg. This is not creating a new 
precedent. It already exists.

>
> $ git grep ascii85.h
> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
And the list of drivers which dump raw binary data in a coredump file 
is... ath10k. ASCII85 wins 3 to 1.


>
>>
>> We want the devcoredump file to still be human readable. That won't 
>> be the case if you stuff binary data in the middle of it. Most 
>> obvious problem - the zeros in the data will terminate your text file 
>> at that point. Potentially bigger problem for end users - random fake 
>> ANSI codes will destroy your terminal window if you try to cat the 
>> file to read it.
>
> Users don't get a coredump and cat it to the terminal.
> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8 
>
>
> Lucas De Marchi
They might. Either intentionally or accidentally. I've certainly done it 
myself. And people will certainly want to look at it in any random 
choice of text editor, pager, etc. 'cos you know, it is meant to be read 
by humans. If it is full of binary data then that becomes even more 
difficult than simply being full of ASCII gibberish. No matter what you 
are doing, the ASCII version is safer and easier to look at the rest of 
the file around it.

I don't understand why you are so desperate to have raw binary data in 
the middle of a text file. The disadvantages are multiple but the only 
advantage is a slightly smaller file. And the true route to smaller 
files is to add compression like we have in i915.

John.

