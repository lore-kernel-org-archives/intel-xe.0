Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8B2E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 21:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF7B10E46C;
	Fri, 13 Dec 2024 21:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFinfufO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADB10E46C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734125977; x=1765661977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0rBvgBHSdz0JH78zfWM6sjSf5ThZuO6wj5dSa6ZcT1E=;
 b=mFinfufO1Z0OXKojUpUoil7ntOwZDKg+EPIZr94Wj8zmRUdIzJgm3aEb
 W7g3mHWNRCUwCeY75QKZIEfYLSKCo3yhSNcosesqF3DGQ13sMFBK5hb2h
 j6fowzqcP2XyVgJ358vYWC0YIAuV5obzYJx+URXXxZBsqBAIwx7NTXZG1
 8/CqdA8Iinpm/e70WR1w1vJj7MA70yopHnCnxn9M5TTlMJXHUEvW6fipZ
 AWUPTla+7jRZimYoHYCX3XkM+asoNk6ZfZj4d2vauNNtjxkDmbjSXbYY7
 YRY3peIwRHlaceqOiW9+Z505hf3YAHbHXeVBnoHPBwOfKqXV6vQ6mpUho A==;
X-CSE-ConnectionGUID: 7MUClv2dTkOCzNoLbP+ixA==
X-CSE-MsgGUID: 8viBLJGQRmytjNOfP2TywA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34498591"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34498591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 13:39:37 -0800
X-CSE-ConnectionGUID: OMS4zL4gQmGeHLij572Fpg==
X-CSE-MsgGUID: TSCNGVz2T9G1uQV6yxWEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100795075"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 13:39:36 -0800
Date: Fri, 13 Dec 2024 15:39:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: "Souza, Jose" <jose.souza@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Message-ID: <5yhoe4sp5zesqsgtxqcbraopjw5l6nk5gmbr7njmgtzyr5lkxi@ujg7vhnomecm>
References: <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
 <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
 <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
 <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
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

On Fri, Dec 13, 2024 at 12:26:23PM -0800, John Harrison wrote:
>On 12/13/2024 11:43, Souza, Jose wrote:
>>On Fri, 2024-12-13 at 09:38 -0800, John Harrison wrote:
>>>On 12/13/2024 09:25, Souza, Jose wrote:
>>>>On Fri, 2024-12-13 at 08:56 -0800, John Harrison wrote:
>>>>>On 12/13/2024 08:48, Lucas De Marchi wrote:
>>>>>>On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>>>>>>>On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>>>>>>>>On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>>>>>>>>>On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>>>>>>>>>>On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>>>>>>>>>>>On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>>>>>>>>>>>>We do not break userspace.
>>>>>>>>>>There is other patch that also breaks Mesa parser:
>>>>>>>>>>
>>>>>>>>>>drm/xe/devcoredump: Improve section headings and add tile info
>>>>>>>>>>
>>>>>>>>>>>>This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>>>>>>>>>>But we have users calling this function.... the revert is not
>>>>>>>>so simple.
>>>>>>>>>>>I think we need to revert the functionality rather than
>>>>>>>>reverting all
>>>>>>>>>>>the patches, otherwise it will cause a lot of headaches.
>>>>>>>>>>>
>>>>>>>>>>>I propose we go with:
>>>>>>>>>>>
>>>>>>>>>>>a) drop the \n that broke mesa and merge that with cc stable.
>>>>>>>>>>>
>>>>>>>>>>>b) move back the entry to the previous section that broke mesa
>>>>>>>>and cc
>>>>>>>>>>>       stable.
>>>>>>>>>>>
>>>>>>>>>>>       José, would it be ok to merge a patch in mesa and port that
>>>>>>>>>>>       to mesa stable that simply looks at 2 possible sections?
>>>>>>>>Or even
>>>>>>>>>>>       drop the section checks... ?
>>>>>>>>>But if Xe KMD is reverting the patch that changed the hwctx
>>>>>>>>section why would Mesa need to also parse the new(future to be
>>>>>>>>reverted) section?
>>>>>>>>
>>>>>>>>first is to undo the damage, with 0 changes in mesa. We do that
>>>>>>>>first and
>>>>>>>>*then* we agree on what's possible to do to accomodate the 2 parsers we
>>>>>>>>have.
>>>>>>>>
>>>>>>>>If we can get something in mesa to work that is backward compatible
>>>>>>>>(i.e. the
>>>>>>>>changed parser is able to parse both before and after the kernel
>>>>>>>>change),
>>>>>>>>then it could be considered to a mesa stable and the kernel side
>>>>>>>>changed.
>>>>>>>Okay, reasonable plan. But the ascii85 encoder with \n will not be
>>>>>>>brought back right?
>>>>>>maybe let's agree on how to possibly bring it back? I suggested using a
>>>>>>space as continuation line char. This way you can just check the last
>>>>>>char
>>>>>>returned by getline() you are calling and see if you can go ahead and
>>>>>>proceed or if you still need to get more data. Neither space nor newline
>>>>>>are part of the ascii85 character set, so it's safe and you can handle
>>>>>>continuation in one place in your loop.
>>>>>>
>>>>>>if you are just ignoring any ascii85, then I believe it's even simpler:
>>>>>>you check sections and keys with a space since both keys and section
>>>>>>titles contain space, which is not part of the ascii85 char set.
>>>>>>
>>>>>>Lucas De Marchi
>>>>>Yes, I would strongly prefer to use line wrapped ASCII85 data for all
>>>>>blobs in the devcoredump. Including things like batch buffers and other
>>>>>VM entries that the mesa tool is presumably wanting to decode.
>>>>>
>>>>>If adding a <space> character to the end of each line is an acceptable
>>>>>fix then I have no problems with that. But not line wrapping at all
>>>>>means having to carry that change as a non-upstream patch in either the
>>>>>internal tree or in individual developer's local trees. Either that or
>>>>>we just cannot debug a lot of hard to repro problems.
>>>>Can't Xe KMD use the line wrapped version of ASCII85 when printing to dmesg and keep the regular encoder when devcoredump file is read?
>>>Apparently not. Even when not deliberately line wrapping the output, I
>>>am still seeing it being wrapped when dumping very large buffers such as
>>>the GuC log. It looks like something in a lower layer is also forcing
>>>line wrapping of super long lines. So either we can't add full size GuC
>>>logs to the devcoredump or we need to support line wrapped data in the
>>>mesa tool.
>>It is probably some implementation detail of __drm_printfn_coredump(). That could be replaced to something like i915 error dump write functions to not

it doesn't look like it as there's nothing there looping through chunks.
And particularly nothing that would really add a '\n', corrupting
the output.

>>have any limit at least when the target is a file descriptor, for dmesg you are free to add any line wrapping.
>Rather than re-writing the entire drm printer infrastructure, could we 
>not just update the mesa decoder tool?

I think it would be great to add line continuation there and document
so it's more future proof and we don't break it again because of this.

>
>Note that the existing VM dumps are using the same drm_puts printer 

would be good to know where that is coming from. I don't see anything in
drm_puts() that would add newlines.... it looks more like how we are
calling xe_print_blob_ascii85() in a loop, but that's strange since we
are actually passing 2M chunks. What did you use to test?

Lucas De Marchi

>function. So if a very large user buffer was included in the dump, it 
>seems like that would also break the mesa parser. And that is not 
>something under the control of the KMD.
>
>John.
>
>>
>>>John.
>>>
>>>>>John.
>>>>>
>
