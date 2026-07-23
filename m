Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF15C531CF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 13:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F50C10E586;
	Thu, 23 Jul 2026 13:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="FzprHaSK";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834A710E586;
 Thu, 23 Jul 2026 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784813760;
 bh=FW/au77XZS9cP0DFyXyqdPup/8yYKVmtXAQa/osTvYs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FzprHaSKtTINhezQNliqvgXZPwffaq/EtGTHqAt85rc/6pT7m9WaQQT9l+19+UA98
 tlKQPwCZxGwTOM9x/YKRhV6VXAecE/5og9D+TXW5wK06t5DlInFTeBwrOpuSeBSGh5
 h5JGQbgMTyDbAajbxaJ4tyFRXOkm5/idKC0a/mLFIbYsVqZo2fvaIqm1uHB2FVX5E2
 gLG2LIXEra/V9nzWbCajr7/tQlBFonWbR9YVxGWDhwmBF825mk9qI5kk53PBCeEG7p
 HRH58tozBAJGvbtAquEKRuXhPYhmNAG1oe538fJAR6h4W1bpCqU/ME2rwlIDCVE32O
 WMncA/vqglmug==
Message-ID: <685c2bb8-613c-4cae-ad11-514661bd86be@lankhorst.se>
Date: Thu, 23 Jul 2026 15:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "B S, Karthik" <karthik.b.s@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260721142610.93804-7-dev@lankhorst.se>
 <20260721142610.93804-12-dev@lankhorst.se>
 <DM4PR11MB6360D8AB81342D5F9AA7DA27F4C02@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <DM4PR11MB6360D8AB81342D5F9AA7DA27F4C02@DM4PR11MB6360.namprd11.prod.outlook.com>
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

On 7/23/26 11:06, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maarten
>> Lankhorst
>> Sent: Tuesday, July 21, 2026 7:56 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: intel-gfx@lists.freedesktop.org; Maarten Lankhorst <dev@lankhorst.se>; Ville
>> Syrjälä <ville.syrjala@linux.intel.com>
>> Subject: [PATCH v2 5/5] drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
>>
>> Pull the "do we want to use stolen for the BIOS FB?" checks into a new
>> intel_bo_fbdev_bios_fb_takeover() helper, and defer that decision until we're ready
>> to reallocate the fbdev FB. This way even if we don't want to ultimately use the
>> BIOS FB we'll keep the plane enabled until the replacement FB is ready. Should
>> hopefully result in fewer display blinks during boot.
>>
>> Additionally, on some platforms this allows us to re-create the framebuffer when
>> stolen memory is not suitable, using the blitter engine to copy the contents to
>> system memory without causing any flickering by not preserving the stolen
>> memory allocation.
>>
>> Based on a similar patch by Ville, that introduced intel_bo_fbdev_bios_fb_ok().
> 
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
> Please get an ack from someone from Core KMD as well.
> 
> @B S, Karthik Can we ask someone to check and give a Tested-by from validation
> side for this series.

I've been testing a bit locally, but I see a small flicker while transitioning
from stolen to system memory.

I need to figure out why that happens, as that should have been prevented by
the call to drm_gem_plane_helper_prepare_fb() in prepare_plane_fb()
before the atomic flip.

