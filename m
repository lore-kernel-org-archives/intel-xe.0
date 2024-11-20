Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB20BD6395B
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 14:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC9C10E013;
	Wed, 20 Nov 2024 14:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2waxqCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2754C10E013
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732112167; x=1763648167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1gva/pvHmFZ1M+JUYYSjO1wYZb7+njPA0MG8iCv29RA=;
 b=Q2waxqCGO2leepaSBH5lkEqHn0LHcL30ubBqM0F1Dlzv1TdmPtx+tVA4
 JEiACGLZp7VMIajLbmYfwDzmRnCqXnBBIwNKOWsq0dIG7F34u+Pb0Bb3S
 iWT+Q0DxwDWkFJbqOcEs2py5j3OHXSj9/lIsqB6BpCwVfICsVvTjhi0XG
 FRpIOTSda+lttpMG2mxcNtAei50QjYzTV75aU83S/Pp7xBoMHZlH0iIvr
 xSjmRCLpGSafEaDnajqBBHAnG6wUWs3bw/ILY0ik7cMORc/HQ7sOh7nID
 fi7K5XO7DKO2V9mMAW39Yt2MLvTR/UfVfqF90YIDYEyP9LDsaQTPV6c/p Q==;
X-CSE-ConnectionGUID: qcm6JwcURSuwLkMF22vnYw==
X-CSE-MsgGUID: /nAtEpFYQ1W44ZsBofB8WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42793755"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="42793755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 06:16:06 -0800
X-CSE-ConnectionGUID: Fpe3zu0dRMCu+A8BptUBFA==
X-CSE-MsgGUID: kxZFL2ctQ+CDozHL/tkJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="113207125"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.137])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 06:16:05 -0800
Date: Wed, 20 Nov 2024 08:16:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, ryszard.knop@intel.com
Subject: Re: [PATCH] drm/xe: Sort again the info flags
Message-ID: <gh2z4erofoxvb5npgoopc7cq7b32erdfxeqztroseyqywmel5o@fc6r37gczlpk>
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
 <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
 <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
 <87wmgy14oe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87wmgy14oe.fsf@intel.com>
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

On Wed, Nov 20, 2024 at 02:16:17PM +0200, Jani Nikula wrote:
>On Tue, 19 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Nov 19, 2024 at 10:51:58AM +0000, Matthew Auld wrote:
>>>On 18/11/2024 22:33, Lucas De Marchi wrote:
>>>>Those flags are supposed to be kept sorted alphabetically. Unfortunately
>>>>it's a constant battle as new flags are added to the end or at random
>>>>places. Sort it again.
>>>>
>>>>v2: Include the other non-has_* 1-bit flags in the sort
>>>>
>>>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>>  drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
>>>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>index 8592f1b02db11..8b2b12daa49dd 100644
>>>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>@@ -294,14 +294,21 @@ struct xe_device {
>>>>  		/** @info.va_bits: Maximum bits of a virtual address */
>>>>  		u8 va_bits;
>>>
>>>Should we not document somewhere here that the below should be kept sorted?
>>
>> yes, probably. Also... we have the CI Hooks we should make better use of
>> too. First check if the patch series changed drivers/gpu/drm/xe/xe_device_types.h
>> at all and if it did, check that these flags are sorted. We should be
>> able to add some quick and dirty checks so we don't have to keep
>> changing it. Just need to make sure the output on what was
>> the error is helpful, otherwise people will just ignore it.
>>
>> Ryszard / Jani  any thought on that idea?
>
>Some random thoughts:
>
>We need more transparency on all of CI. I still have no clue of all the
>things that get run, where it's all hosted, how I could contribute

For the parts that I'm mentioning, it's all in

	http://gitlab.freedesktop.org/drm/xe/ci

1) You have the kernel config in kernel/kconfig
2) You have the hooks that run as CI.Hooks in hooks/

Changes to the config and hooks are accepted as MR to that repo.

The jenkins pipeline used to run that in the CI infra is not available,
but we can work with what is.

Do we want to document that somewhere? I can write something down.

>changes to it. I'm guessing maybe it's all out there somewhere, but I
>find it difficult to figure out. A check like this would need to be
>discoverable.

yep, agreed. That's why I said the error output needs to be improved,
otherwise people just get a wall of text and don't understand what's
going on.


>
>Something like this should be locally runnable. I know it's been hard to
>get people to run even checkpatch or sparse, but it's just dumb noise to
>get the first indication something's wrong in a CI result. And if you
>don't block further runs based on this, it just burns resources.
>
>On that last point, I think we should aim for reliable pass/fail, with
>fast fail halting further resource intensive stuff. E.g. checkpatch is
>not like this, we can't block on checkpatch failures, and due to this
>the results tend to be ignored and we merge stuff with checkpatch
>failures. Ditto with detailed checks like this, if it doesn't block
>merging, it's bound to get ignored at times. (Side note, maybe we should
>look into a limited checkpatch config that we could fail fast on?)

IMO we should turn all these "checks run on the build machine" rather
than "checks executed on the target hosts" part of the hooks infra....
because that is much more visible than scripts hidden inside the CI
pipeline. And then people can even run on their own machines.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
