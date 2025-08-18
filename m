Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2835FCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 05:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B3810E1A9;
	Mon, 18 Aug 2025 05:24:28 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7047A10E1A9
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 05:24:27 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 94D5A3F104;
 Mon, 18 Aug 2025 07:24:22 +0200 (CEST)
Message-ID: <bb3e148e-f760-418a-a3b0-1f016dccc339@hogyros.de>
Date: Mon, 18 Aug 2025 14:24:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [05/15] drm/xe: Introduce an xe_validation wrapper around drm_exec
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <20250817140518.GA2581807@psionic12.psi5.com>
 <aKKNlAaWwUpdxJDU@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <aKKNlAaWwUpdxJDU@lstrano-desk.jf.intel.com>
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

On 8/18/25 11:19 AM, Matthew Brost wrote:

>> ... causes a NULL pointer to be recorded for the scoped guard here, which
>> is then passed to xe_validation_ctx_fini on scope exit, causing

> Yep. Thomas and I agree [1] this is a bug.

Ah, excellent.

It is also really easy to trigger this, happened after a few seconds in 
during a Piglit run for me, on a single GPU as a normal user, just a lot 
of clients starting and stopping in parallel.

    Simon
