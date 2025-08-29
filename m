Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F8BCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 13:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C91310EBB3;
	Fri, 29 Aug 2025 13:18:22 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5783010EBB2;
 Fri, 29 Aug 2025 13:18:21 +0000 (UTC)
Message-ID: <74efac9a-722b-40a5-b5b3-8c1ae31b8779@lankhorst.se>
Date: Fri, 29 Aug 2025 15:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/display: Make tracepoints work correctly on
 xe with PREEMPT_RT
To: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20250828090944.101069-1-dev@lankhorst.se>
 <20250828090944.101069-2-dev@lankhorst.se>
 <7ba38466ab2295059820d3d540b6324769ba5485@intel.com>
 <8c28c641-958c-4966-a631-effc00c31633@lankhorst.se>
 <5c6aef6949d5a39445783f06f6f1c4e6a5e61636@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <5c6aef6949d5a39445783f06f6f1c4e6a5e61636@intel.com>
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

Seems I only disabled on !PREEMPT_RT too.

Working version:
https://patchwork.freedesktop.org/series/153716/

Den 2025-08-29 kl. 14:32, skrev Jani Nikula:
> On Fri, 29 Aug 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> I want to repropose my original patch, where drm_crtc_vblank_count() is used on preempt-rt.
> 
> Link?
> 
> BR,
> Jani.
> 

