Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D629606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Q60Rts0E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E8810FC62;
	Wed, 18 Nov 2026 13:11:22 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C02A10FC60;
 Wed, 18 Nov 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1795007475;
 bh=BJKgK4rnjMBUoIE65yC9O6WlmPrGKQogGNbO+GnFuNs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q60Rts0EIyZFurnJmHItqUf8vsoZAm/ZpmJsZeZKEsarpaKhLAu3Sj1M09cPN8nQm
 pbOOYB9uyG/YPTrXwzRc/JgrE2l04bWuhdarnTnrZl0UzaI5cIyu3Ik80GzVm3dLur
 765xwgaRdy8T7GGxyPoz/zkEYqGkMCddKHVB+LO+PlTnTVjrrAH2Xbmt7LY8l+CyXb
 EywVQi5EpBFu/pRjW/HpnJ3egYf/0ayf96sY5pVPrg+eIl7i0j0tTYpExJRp7giRuN
 my6vWdjaroCbQ8zwWeH9qZ8NXx5azug2aEfJD9GJMiIstxb2VN8Q4CkvDncWs5o6Wf
 AbEPoNbtxhIcw==
Message-ID: <b3eb291e-be9c-4b61-bbba-441037272aca@lankhorst.se>
Date: Wed, 18 Nov 2026 14:12:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm/xe/migrate: Support copying between sysmem and
 stolen
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20261117143038.479557-7-dev@lankhorst.se>
 <20261117143038.479557-9-dev@lankhorst.se>
 <57c81b2e-61fd-4c48-81f4-095a80a3b1e5@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <57c81b2e-61fd-4c48-81f4-095a80a3b1e5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 11/18/26 10:18, Matthew Auld wrote:
> On 17/11/2026 14:30, Maarten Lankhorst wrote:
>> In order to copy out the stolen BO, we have to add some support to
>> xe_migrate_copy, since otherwise it tries to use the VRAM identity
>> mapping on integrated, which obviously doesn't do the right thing.
>>
>> For debugging and completeness, allow clears in stolen memory as well.
>> This makes it silghtly easier to test that the copy is correctly done.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Thank you for reviewing this.

Seems to be adding stolen support in a clean way was non-trivial,
fortunately CI flushed out all issues.

Pushed now, with a slight rewording of the last commit message
and adding co-authored-by for Ville.
Sashiko was confused about what bios_fb_ok was referred to.
