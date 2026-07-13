Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7723C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 04:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290E10E53C;
	Mon, 13 Jul 2026 04:56:00 +0000 (UTC)
X-Greylist: delayed 581 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jul 2026 04:55:58 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAE010E53C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 04:55:58 +0000 (UTC)
Received: from [192.168.10.87] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id DE9E63F123
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 06:46:14 +0200 (CEST)
Message-ID: <bafcfff1-162f-4abf-b996-c4aafd293324@hogyros.de>
Date: Mon, 13 Jul 2026 13:46:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/xe:add page size allocation mode control and
 coverage
To: intel-xe@lists.freedesktop.org
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Hi,

On 7/12/26 8:15 PM, Nareshkumar Gollakoti wrote:

> Some platforms support multiple page sizes for user BO allocations,
> including 4K, 64K, 2M, and 1G.

aarch64 also has 16k -- and these also become the minimum page size for 
CPU accessible allocations.

There is also 256k, but that is probably not in actual use anywhere near 
an Intel GPU.

I can give this a test on a kernel with PAGE_SIZE 64k next weekend.

The biggest annoyance on machines with large page size are the BOs that 
are allocated for device page tables, because these are always 4k in 
size, but must be CPU accessible, so their size and alignment must fit 
CPU requirements.

The original series[1] from Mincong Bai solved that by forcing alignment 
for all BOs, which wastes a bit of memory, but works. Obviously we don't 
want to use a 2M or 1G BO for a page table, so presumably we want to 
special-case those, but at the same time they cannot be so special that 
they ignore the constraints from the CPU.

    Simon
