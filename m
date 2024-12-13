Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E04E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 16:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1610F09F;
	Fri, 13 Dec 2024 16:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEsZGxrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960B10F09E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734108533; x=1765644533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fw6EXbf18j+LNRKCFdbGCwqthChsIIoMQ46m2df6DF8=;
 b=hEsZGxrZXFOJ0+iK04cTXk1UQrdTGZRuR2XBuro81BLIaE3rwDTtOsua
 apWUF3UxTRTuFxH11lAZQ1XV1txli2I9gT65kwYjfNebeNXZ+VJqasFSd
 pFHRTj/1nL0MvPeiuR7bAPVFie+1fBSIVzFRNyt1dSkOD/z2zdFz7tIw7
 lJLWxVGJe9ttrPfRpAJku2D9YmG9Ji/eP4HJk8xAphQ6vwQBsyBENza9s
 qqTB0lZVbrBHGT96q86YJVyp+NWyAbaiUsPNHJlpFzXQS8WYpyKHht7I+
 Wu0kKb41p8dMaoTgPdWnlFBxyb5rPhFNWQ2wTy+YSidbF8y0FpanHRr7a g==;
X-CSE-ConnectionGUID: 7X1T8cm5S56ZtMk69F9Lmw==
X-CSE-MsgGUID: JnsGs7gxQC6zp3l/JQDFxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34710664"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34710664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:48:52 -0800
X-CSE-ConnectionGUID: y9YcyhnMSpCt7SLq6RJj1A==
X-CSE-MsgGUID: agFkGNegSNSu+9NYj1wmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119842614"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.218])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:48:51 -0800
Date: Fri, 13 Dec 2024 10:48:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Message-ID: <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
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

On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>> On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>> > On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>> > > On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>> > > > On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>> > > > > We do not break userspace.
>> > >
>> > > There is other patch that also breaks Mesa parser:
>> > >
>> > > drm/xe/devcoredump: Improve section headings and add tile info
>> > >
>> > > > >
>> > > > > This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>> > > >
>> > > > But we have users calling this function.... the revert is not so simple.
>> > > > I think we need to revert the functionality rather than reverting all
>> > > > the patches, otherwise it will cause a lot of headaches.
>> > > >
>> > > > I propose we go with:
>> > > >
>> > > > a) drop the \n that broke mesa and merge that with cc stable.
>> > > >
>> > > > b) move back the entry to the previous section that broke mesa and cc
>> > > >     stable.
>> > > >
>> > > >     José, would it be ok to merge a patch in mesa and port that
>> > > >     to mesa stable that simply looks at 2 possible sections? Or even
>> > > >     drop the section checks... ?
>> >
>> > But if Xe KMD is reverting the patch that changed the hwctx section why would Mesa need to also parse the new(future to be reverted) section?
>>
>> first is to undo the damage, with 0 changes in mesa. We do that first and
>> *then* we agree on what's possible to do to accomodate the 2 parsers we
>> have.
>>
>> If we can get something in mesa to work that is backward compatible (i.e. the
>> changed parser is able to parse both before and after the kernel change),
>> then it could be considered to a mesa stable and the kernel side
>> changed.
>
>Okay, reasonable plan. But the ascii85 encoder with \n will not be brought back right?

maybe let's agree on how to possibly bring it back? I suggested using a
space as continuation line char. This way you can just check the last char
returned by getline() you are calling and see if you can go ahead and
proceed or if you still need to get more data. Neither space nor newline
are part of the ascii85 character set, so it's safe and you can handle
continuation in one place in your loop.

if you are just ignoring any ascii85, then I believe it's even simpler:
you check sections and keys with a space since both keys and section
titles contain space, which is not part of the ascii85 char set.

Lucas De Marchi
