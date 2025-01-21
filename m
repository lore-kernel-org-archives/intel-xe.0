Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA6C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 12:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B317810E0F6;
	Tue, 21 Jan 2025 12:53:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7236010E0F6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 12:53:04 +0000 (UTC)
Message-ID: <c5b5eb9f-794a-42aa-abde-aa3016e071c8@lankhorst.se>
Date: Tue, 21 Jan 2025 13:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] GuC changes for flicker-free boot.
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20241210083111.230484-1-dev@lankhorst.se>
 <87ikq8pdt9.fsf@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <87ikq8pdt9.fsf@intel.com>
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

Hey,

On 2025-01-21 13:10, Jani Nikula wrote:
> On Tue, 10 Dec 2024, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> Ignore the first 5 patches in this series, it's sent as a separate series.
>> https://patchwork.freedesktop.org/series/142241/
> 
> For them I've replied in [1] that they need more explanations in the
> commit messages.
> 
Thanks, I'll try to clarify and reword those commits, then send a new 
version.

Xe init sequence has to support memirq's, but obviously memirq's require 
memory allocations. Right now this happens before FB handover. Similarly 
GuC also performs some initialisations that happen before FB handover. 
Lastly we are also doing loading the other UC too early.

Any of these will cause the initial FB to be garbled. The solution is to 
change the µC load ordering to be the minimal required to support VF,
delay any GT and µC initialisation until after FB handover, and only 
then enable memirqs and all interrupts.

This obviously means that FB handover has to run on Xe without 
interrupts enabled. It cannot be enabled because of memirq's.

I chose to deviate here from i915, because it supports platforms that 
don't have a strict distinction between display and graphics.

Cheers,
~Maarten
