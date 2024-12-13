Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E61E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 15:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894A010F064;
	Fri, 13 Dec 2024 15:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0D/9WST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A031710F064
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734105023; x=1765641023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gpEWx6TnQhuTUHh8rurqFuRXu0dfQ1acBGZoKaeaJbk=;
 b=H0D/9WSTY8Sy+hiEZbAQVHmGQWuNEJtwQPPfZn4erev10CHvLXuhdHfe
 S72xUEIXBb8IHNPN7wgJFBxxGak21qiiboywfh1m7LB+uglonGVa6WQaf
 KNKn013K9CDYexNuNGzsaHMcEDrM+NZqOFvRIMFiTNORdk4XlGpDGRk2M
 Zsn8lSr0jI97p1AzODKFIvRzuZj63vuQryK2Le8keCw1s/IIAU9+D8fJu
 aSOVaw0wwyit8BiDegDFfdRfm07o4PQPfNOU9rtLnOK5TryzrmpMcMqU2
 Oupdln6HdFLmtoAXCrN3sygJyIEryRjZEHB0oLwT7Swgk/SZOKwz8iLTi A==;
X-CSE-ConnectionGUID: gstCFVuRR16hubK6Wjj/Rw==
X-CSE-MsgGUID: xNQ6luSxSYON/uf1K7VYkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38496675"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38496675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:50:22 -0800
X-CSE-ConnectionGUID: L4DbsmX3QVWqZ8xNcNN6SA==
X-CSE-MsgGUID: OCEYQRtYQ9i3wI6cabuFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133933108"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:50:22 -0800
Date: Fri, 13 Dec 2024 09:50:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Message-ID: <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
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

On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>> On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>> > On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>> > > We do not break userspace.
>>
>> There is other patch that also breaks Mesa parser:
>>
>> drm/xe/devcoredump: Improve section headings and add tile info
>>
>> > >
>> > > This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>> >
>> > But we have users calling this function.... the revert is not so simple.
>> > I think we need to revert the functionality rather than reverting all
>> > the patches, otherwise it will cause a lot of headaches.
>> >
>> > I propose we go with:
>> >
>> > a) drop the \n that broke mesa and merge that with cc stable.
>> >
>> > b) move back the entry to the previous section that broke mesa and cc
>> >     stable.
>> >
>> >     José, would it be ok to merge a patch in mesa and port that
>> >     to mesa stable that simply looks at 2 possible sections? Or even
>> >     drop the section checks... ?
>
>But if Xe KMD is reverting the patch that changed the hwctx section why would Mesa need to also parse the new(future to be reverted) section?

first is to undo the damage, with 0 changes in mesa. We do that first and
*then* we agree on what's possible to do to accomodate the 2 parsers we
have.

If we can get something in mesa to work that is backward compatible (i.e. the
changed parser is able to parse both before and after the kernel change),
then it could be considered to a mesa stable and the kernel side
changed.

Lucas De Marchi

>I could CC the Mesa stable but it would not be picked to all Mesa versions with the devcoredump parser.
>
>
>> >
>> > c) settle on one of the possible solutions for \n that were presented in
>> >     this discussion.  I think the sanest one is that a space in the end of a
>> >     line printing ascii85 would signify a continuation marker.  But merging
>> >     (a) means we have time to discuss and adjust if needed.
>> >
>> > After the dust settles we may think of a better way to evolve the
>> > devcoredump format so it doesn't cause breakages in future updates.
>> >
>> > Lucas De Marchi
>>
>
