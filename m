Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9991EC7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D3710E28A;
	Thu, 26 Jun 2025 20:22:25 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6F10E28A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:22:24 +0000 (UTC)
Message-ID: <f49ae78e-55f9-433e-a180-3cdcc38af98f@lankhorst.se>
Date: Thu, 26 Jun 2025 22:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] drm/xe: Make it possible to read instance0 MCR
 registers after xe_gt_mcr_init_early
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-17-dev@lankhorst.se>
 <ilqhmnv6a2p2s5l2ge6anhiv4rx2rszcewfuhskf73xs5qlmbl@u43bwjn6pwdu>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <ilqhmnv6a2p2s5l2ge6anhiv4rx2rszcewfuhskf73xs5qlmbl@u43bwjn6pwdu>
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

Hey,

On 2025-06-25 21:07, Lucas De Marchi wrote:
> On Thu, Jun 19, 2025 at 12:49:03PM +0200, Maarten Lankhorst wrote:
>> After mcr_init_early, we need to be able to do VRAM and CCS probing
>> without hwconfig probe. Fortunately the relevant registers are all
>> instance 0, which fortunately means no dependencies on further initialization
>> is required.
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> [mlankhorst: Fix british spelling]
> 
> ^ not sure what you mean here, but should probably be gone from commit
> message.
> 
> 
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> 
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Hey, I typically add those to indicate changes after a r-b. In this case initialisation (british spelling) vs initialization (american spelling).
The latter being preferred in the kernel.

Thanks for the reviews! I've pushed the patches, hopefully all flickering during boot will be gone now.

Kind regards,
~Maarten Lankhorst
