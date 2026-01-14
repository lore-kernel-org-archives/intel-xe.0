Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690A9D38FEA
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 17:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B96810E61A;
	Wed, 14 Jan 2026 17:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="AGOcnolR";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEA10E61A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768410233;
 bh=q5E7fc4oHm+uFdm8Nm1u9Sa95ikR0asoUK9uAOxneEQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGOcnolR7jcPEFWE+DVEMWy1eAqeFZ55nDgWRxgQFCAui9NOVF9ZKIHKN4WqojSxT
 OMgRfjP0W92pQhwS7jCN5kLpN5TGdPFFEAKnEjWfNNiWFpBA32/eicDwV0UrqCFnIZ
 EH1lMwuGZvk3UxIGYzFb3PLzsdoBcHhic//H88X1V+5LC3kHwlwMKTYpMCyLt8Or3X
 nnmIKK1xtmUs3RnJJixhcM1VbXY0maueUHkDQOC2oxXPXkB+/WWU9mQuNT9Up0BMru
 XFDbvSb6lHN7UJiPUQj/THvAWRSrj3wj3S1ZoExfzrcB1lGRFrPeJ0DUC6xt59p4vi
 YDG8Vx3p4YzBw==
Message-ID: <af128db3-623a-4002-be6e-1c1b50616a27@lankhorst.se>
Date: Wed, 14 Jan 2026 18:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe: Rewrite GGTT VF initialisation
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-3-dev@lankhorst.se>
 <988183a2-318a-4a11-ab06-40173b23acba@intel.com>
 <93f45e1e-0893-48ed-8d41-caf3a7114603@lankhorst.se>
 <20260114161557.4xormlap6mu457wg@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260114161557.4xormlap6mu457wg@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2026-01-14 kl. 17:15, skrev Piotr Piórkowski:
> Maarten Lankhorst <dev@lankhorst.se> wrote on śro [2026-sty-14 10:55:02 +0100]:
>> Hey,
>>
>> Den 2026-01-13 kl. 23:53, skrev Michal Wajdeczko:
>>>
>>>
>>> On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:
> 
> <snip>
> 
>>>> -}
>>>> -
>>>> -/**
>>>> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
>>>> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>>>
>>> nit: add () after function name
>> Seems to be about 50/50 whether () is used? Both ways are used extensively in xe, often within the same file.
>>>
> 
> 
> Based on https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> we should use ()

It doesn't look like anyone else is really caring though.

~/nfs/linux$ git grep '* [a-zA-Z_()]* -' | wc -l
71222

~/nfs/linux$ git grep '* [a-zA-Z_()]* -' | grep '() -' | wc -l
15087

So using the () for annotating function is a minority.
