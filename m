Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F55ECCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 02:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C519110E04A;
	Tue, 14 Oct 2025 02:18:06 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0A10E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 02:18:05 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id D2A763F116;
 Tue, 14 Oct 2025 04:18:02 +0200 (CEST)
Message-ID: <7b89fed3-3b8f-4787-8ef4-17f24477d829@hogyros.de>
Date: Tue, 14 Oct 2025 11:17:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
 <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
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

On 10/14/25 2:22 AM, Summers, Stuart wrote:

> So according to https://docs.kernel.org/admin-guide/mm/hugetlbpage.html
> we can potentially get 4M-256M pages on some architectures.

These exist but will not be the finest granularity on those 
architectures, so these should never appear as PAGE_SIZE.

The kernel is unable to load executables that have a smaller alignment 
than PAGE_SIZE for their loadable segments, so that gives a nice upper 
bound for what we need to expect.

There might be places that make the assumption that if there is a 
hugetlb size that the host supports, it will be 2M, but the worst thing 
that can happen there is a fallback to PAGE_SIZE and slightly degraded 
performance.

    Simon
