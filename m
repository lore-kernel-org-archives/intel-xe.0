Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED0BE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 15:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E910F04F;
	Fri, 13 Dec 2024 15:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1jLgk8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCBB10F04F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734103097; x=1765639097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y+B5gdsCIGuLQu/R97rpWIRP4xBBLcS8fRDafv5i5WQ=;
 b=n1jLgk8D00vegwOLs7Kl6AMGcWlGUZeFzh/kBTZJzmHp7MaoUqGAQj4J
 ksB+mp6scat5ap1GL4BJWOVtmWWGZJbpcATmTZHkVwHNF8mxnwMbsR/0o
 tGMQ1DCvHe6ulPcvt+AZ64hI/XFtpb13mRE3EKc8nhAaEvijjsnSBkTMW
 r48jAb2DDIdle4SeW1t9jf/pp7a9nwjaqc7K1lcOGDg6AAdGKpsfFEk1G
 cbGml0m9kw3JtdKtoCV3x+Fp0aiSzYQY0mAgW2NpcQOKf+M7W5le0XVI3
 roRZUuhMUJbk7m/u9TX7cG1nYAPPowtGTe2aE7xz59BWetM4PjUvJMqxI A==;
X-CSE-ConnectionGUID: ed40Xw0eRjCnqteb3h6fpg==
X-CSE-MsgGUID: 0c+N3AOHT2yvLu422Vop7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38337359"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38337359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:18:17 -0800
X-CSE-ConnectionGUID: ZLpoQ4bDS+iiLzd+LN0ynQ==
X-CSE-MsgGUID: zP2ZyfkATGKjOskWUn6F8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133928743"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:18:16 -0800
Date: Fri, 13 Dec 2024 09:18:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Message-ID: <uambvgq2zlb45lunxip42hj62vzz5hppujfoyawmwipsck262z@ddmr5lyl5gdu>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
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

On Fri, Dec 13, 2024 at 09:10:05AM -0600, Jose Souza wrote:
>On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>> On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>> > We do not break userspace.
>
>There is other patch that also breaks Mesa parser:
>
>drm/xe/devcoredump: Improve section headings and add tile info

isn't that the item (b) below? At least it what I meant it to be looking
at the regression discussion in
https://lore.kernel.org/all/ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com/

Lucas De Marchi

>
>> >
>> > This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>
>> But we have users calling this function.... the revert is not so simple.
>> I think we need to revert the functionality rather than reverting all
>> the patches, otherwise it will cause a lot of headaches.
>>
>> I propose we go with:
>>
>> a) drop the \n that broke mesa and merge that with cc stable.
>>
>> b) move back the entry to the previous section that broke mesa and cc
>>     stable.
>>
>>     José, would it be ok to merge a patch in mesa and port that
>>     to mesa stable that simply looks at 2 possible sections? Or even
>>     drop the section checks... ?
>>
>> c) settle on one of the possible solutions for \n that were presented in
>>     this discussion.  I think the sanest one is that a space in the end of a
>>     line printing ascii85 would signify a continuation marker.  But merging
>>     (a) means we have time to discuss and adjust if needed.
>>
>> After the dust settles we may think of a better way to evolve the
>> devcoredump format so it doesn't cause breakages in future updates.
>>
>> Lucas De Marchi
>
