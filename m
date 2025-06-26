Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C34C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 15:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEC010E29A;
	Thu, 26 Jun 2025 15:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bykq4Tcq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5280410E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O5ZclBSGuBG3aRQN8QKAA9dGYXMdaiyJ9V3FhwZPgpw=; b=bykq4TcqfHNJzyB7x5/nuNegJR
 u0y4HGY+9M3NAONwXi55xbxzuA4CHlwlD1JnNvuyHDZMtbewWoLyZc5/ygt4tjGJjPxdlRNdA0Tgd
 5lIeHh57XV5ixXLYFkwl8otsAbY4v4hTFqRea9jQ+7U6qnbFUZKSfR8sMA86w8/7FogILvwPaZpMk
 SUCPiZDsBsOVfCATntes1mtmf0pfKfz0Eqodm9xHWi1pTIos9qLAPB88oUpKKeZ37F4hWzyrcEvc+
 Rx3H9tMy1IaPEkRTbJ7YKpgEuQaRIHkvXQrIB2HfzzkNuW8pQf9jSz7u+sZAYhotN5XD5Ql2hDSg0
 7AT8u1OQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uUoIv-0091n7-FJ; Thu, 26 Jun 2025 17:14:21 +0200
Message-ID: <e6529f8b-74fd-4216-9a7e-60b52d5848ee@igalia.com>
Date: Thu, 26 Jun 2025 16:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/xe/xelp: Implement Wa_16010904313
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
 <20250625153632.21220-7-tvrtko.ursulin@igalia.com>
 <o6dw26fxwlpnj7dxpbdt2r62662rbyamjb24dcnvzysf3jh2yi@rnragrribl6k>
 <856c8bb5-c702-4079-b581-da40b743d0b4@igalia.com>
 <qx4lesckygv7f2i65234ctv6o2kw76gsjgaxdrmdas2ejmmovt@n2fclpinszcp>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <qx4lesckygv7f2i65234ctv6o2kw76gsjgaxdrmdas2ejmmovt@n2fclpinszcp>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 26/06/2025 16:01, Lucas De Marchi wrote:
> On Thu, Jun 26, 2025 at 09:57:05AM +0100, Tvrtko Ursulin wrote:
>>
>> On 25/06/2025 22:47, Lucas De Marchi wrote:
>>> On Wed, Jun 25, 2025 at 04:36:31PM +0100, Tvrtko Ursulin wrote:
>>>> Add XeLP workaround 16010904313.
>>>>
>>>> The description calls for it to be emitted as the indirect context 
>>>> buffer
>>>> workaround for render and compute, and from the workaround batch buffer
>>>> for the other engines. Therefore we plug into the previously added
>>>> respective top level emission functions.
>>>>
>>>> The actual command streamer programming sequence differs from what is
>>>> described in the PRM, in that it assumes the listed LRCA offset was
>>>> supposed to actually refer to the location of the CTX_TIMESTAMP 
>>>> register
>>>> instead of LRCA + 0x180c (which is in GPR space). Latter appears to 
>>>> make
>>>> more sense under the assumption that multiple writes are helping with
>>>> restoring the CTX_TIMESTAMP register content from the saved context 
>>>> state.
>>>
>>> humn... but i915, which is supposedly doing the right thing,
>>> diverges from the PRM by using LRM + LRR + LRR. Here you are doing
>>
>> Matt reported i915 was doing the wrong thing actually, compared to 
>> what was documented in the WA database at least. Not that the latter 
>> was completely clear, but we had a brief guessing game and I 
>> understood the conclusion was 3x LRM to forcefully restore 
>> CTX_TIMESTAMP is what made most sense.
>>
>> See https://lore.kernel.org/intel-xe/20250523174135.GS5080@mdroper- 
>> desk1.amr.corp.intel.com/.
>>
>>> something different from both. Does gputop show saner values after this?
>>
>> Gputop looks okay to me. Are you saying this WA is fixing something is 
>> regularly goes wrong so could be easily observed? I thought it was 
>> about a rare failure to restore CTX_TIMESTAMP but that was just a 
>> guess to be fair.
> 
> yes, it doesn't really work in TGL.... it just keeps reporting ~0% or
> 100%, rather than something sane like it does in DG2 and later.

Hmm.. TGL, with i915, so execlists? I don't think gputop depends on the 
CTX_TIMESTMAP register there.

Are you sure 16010904313 was created for this?

> We could go the other way around for testing: do the way you have it
> here in i915 and then check gputop if we start seeing the same thing.
> Then at least we will know if this is really the case instead of
> debugging the addition of indirect ctx.

I also need the indirect context for the AuxCCS invalidations. That's in 
a separate series which is waiting for this one to get sorted first.

So something trivial must be wrong in this one, but annoyingly it only 
effects LNL and BMG in the shards and haven't spotted the problem yet.

Regards,

Tvrtko

