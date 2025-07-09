Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D288BC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 05:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6210E717;
	Wed,  9 Jul 2025 05:33:55 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCAC10E717
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 05:33:54 +0000 (UTC)
Received: from [192.168.10.90] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 4CD2A3F116;
 Wed,  9 Jul 2025 07:33:50 +0200 (CEST)
Message-ID: <8e1c1fad-297a-4229-9ec5-6ee9cb45d6d0@hogyros.de>
Date: Wed, 9 Jul 2025 14:33:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
To: Matthew Brost <matthew.brost@intel.com>
Cc: jeffbai@aosc.io, intel-xe@lists.freedesktop.org
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
 <ffe4cf3f-7f4c-4d24-85cb-b1d80266797f@hogyros.de>
 <aG3xidZTkbopob1d@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <aG3xidZTkbopob1d@lstrano-desk.jf.intel.com>
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

On 7/9/25 13:35, Matthew Brost wrote:

> Did this series set bo->size to a different value than the size argument
> to drm_gem_private_object_init? If it did, that could be an issue. If
> not, s/bo->size/xe_bo_size(bo)

Patch 1/5 changes both bo->size and the argument to 
drm_gem_private_object_init from "size" to "aligned_size", which is 
"size" rounded up to the kernel page size, so I think the assignment to 
bo->size can just be dropped.

That said, I think the logic in ___xe_bo_create_locked is correct only 
up to 64k kernel pages. I'm not aware of any architecture using larger 
pages, though.

    Simon
