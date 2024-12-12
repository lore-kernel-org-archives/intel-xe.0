Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E17E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 14:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C1410EE03;
	Thu, 12 Dec 2024 14:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQDnR/Ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A80410EE03
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734014280; x=1765550280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aA8FiGWm4RfgFSCSq3v+TVDqQJk1IwAKYdhBOfB82Fc=;
 b=bQDnR/YmBbKLB6gXUpCtQR2hw0dcC93n08KNTYY+fPStvNFX1ldeskrw
 DBJ1zQK1m9o58/MwDV6kMBDffKBlsz82hiiD09uU4dmYlZAVuDD3ciEjt
 RA3Oo1XgiW1MkqtM+fmggGDEX2dQQSzjLzwmlXczUYdoOZRNggRHdeIWB
 ybAfu+YfutXOQTZ9hprEUi0x2rksw2jXWtJYfsRMNP8+t9tHFaO6IVKJW
 UW3799t4q33pDeb+c0xvBMeuD9s39Pr1tH5rJuNWGgbefJhR7h9w2QfXb
 Vp8z5pGFw/OGhtWIm660qMu1aX8sRSXHr2ryBMRMDdHT5L4Q0AjNl9sty A==;
X-CSE-ConnectionGUID: DLibhqhuSqynmcsb+f4+6g==
X-CSE-MsgGUID: Km/2btnCRwSioOAi7Ft/RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34159823"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34159823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:37:57 -0800
X-CSE-ConnectionGUID: rTnWb1pKTWOxTM6qHVi+gw==
X-CSE-MsgGUID: y947O0uMSWitGhYgd2RPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96085730"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.80])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:36:54 -0800
Date: Thu, 12 Dec 2024 08:36:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org, 
 piotr.piorkowski@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: Re: [PATCH] drm/xe: Make irq enabled flag atomic
Message-ID: <zejhizfwkwwr3cub536dh7tfnsjxfpyo2kfxycfwjw4v6bhxbg@2sufpdgnzzz7>
References: <20241210173506.202150-1-ilia.levi@intel.com>
 <Z1nWXdfn_azp1KLK@intel.com>
 <b6x4mamnsw2ljm7n7tl7amqmdwqnihjdnufiowudm2i4fxowun@wa2y7s2t2kke>
 <Z1ogPhzM1eD6VtlR@intel.com>
 <5d86e98d-c015-431e-a07c-8a8c02a0400e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d86e98d-c015-431e-a07c-8a8c02a0400e@intel.com>
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

On Thu, Dec 12, 2024 at 02:45:12PM +0200, Levi, Ilia wrote:
>On 12/12/2024 1:29, Rodrigo Vivi wrote:
>> On Wed, Dec 11, 2024 at 01:58:08PM -0600, Lucas De Marchi wrote:
>>> On Wed, Dec 11, 2024 at 01:13:49PM -0500, Rodrigo Vivi wrote:
>>>> On Tue, Dec 10, 2024 at 07:35:06PM +0200, Ilia Levi wrote:
>>>>> The irq.enabled flag was protected by a spin lock (irq.lock).
>>>>> By making it atomic we no longer need to wait for the spin lock in
>>>>> irq handlers. This will become especially useful for MSI-X irq
>>>>> handlers to prevent lock contention between different interrupts.
>>>>>
>>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>>> pushing soon to drm-xe-next. Thanks for the patch
>>>>
>>> I just saw the commit in the tree and was wondering... why exactly do we
>>> need that flag checked in the irq handlers?  why can't we simply do
>>> a) turn off irq
>>> b) synchronize_irq()
>>>
>>> kind of like xe_irq_suspend() is doing, but in the opposite order. It
>>> seems this was just copy-pasted over and over or am I missing a
>>> synchronization here?
>> A very good question. We likely don't need that check there.
>> Ilia, perhaps you could give it a try along with your upcoming MSX IRQ
>> series?
>I think turning the irqs off while a handler is running is problematic.
>
>Specifically, the thread that does suspend will disable interrupts and the handler will re-enable them:
>Thread: xe_irq_suspend -> xe_irq_reset -> dg1_irq_reset -> dg1_intr_disable
>IRQ handler: dg1_irq_handler -> dg1_intr_enable
>
>What do you think?

the synchronize_irq() is to ensure all current users are gone, but I
forgot about the dg1_irq_handler -> dg1_intr_enable part. It doesn't
seem we can easily remove that, so ignore me :)

thanks
Lucas De Marchi

>>> Lucas De Marchi
>
>
