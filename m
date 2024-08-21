Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45510C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 11:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D43010E8DB;
	Wed, 21 Aug 2024 11:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEUxLpgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701B510E8DB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724241353; x=1755777353;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=f/5bX56EhzgvWout04r6FXqPZYUMs5QFFg2yu5eyJR0=;
 b=dEUxLpgR5UHEij5G4ugx9VMWloTgKYRNd/WH9Y2tKMIG+nrQzY0GhYCu
 RLxChenQenhUkL9B24YlpWgZr3X3bkSU6+yYU8/iob9tXZs2+9OcjCO/X
 h+aPMBylkmYoh1K1xxgYyaDVvf2iFPTZHdZvibYgPNI1j+CnIJDDdepHX
 iTK6cLI6Cmgg/DBhdfwRdxg65HQnYYF6qsqKcZatpe4v0R1XYXmGPr61e
 nFXJqhtZIt9SRNR9av28zIU1hij5Al6G/aYJJydqD4JwU/a4dFvFvuhbQ
 LEaoaX4awxnpJwi4WPojVcsYGsivZuR8mqnTsIFwgWns0+nAHQnthrmvl A==;
X-CSE-ConnectionGUID: EO5xyGoIReiLm8yzH0JfRA==
X-CSE-MsgGUID: BP4siYS7Q6SOM9mrm2GDmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26463272"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26463272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:55:53 -0700
X-CSE-ConnectionGUID: TigsFby1QB6h/fi9U5EwEA==
X-CSE-MsgGUID: MngrXeH3TPWWWE0vyYQTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65758978"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:55:51 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 04/21] kernel: export ptrace_may_access
In-Reply-To: <ZrSpkNEuKNx9sK4s@ashyti-mobl2.lan>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
 <ZrSpkNEuKNx9sK4s@ashyti-mobl2.lan>
Date: Wed, 21 Aug 2024 14:46:32 +0300
Message-ID: <8734my6quf.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Andi Shyti <andi.shyti@linux.intel.com> writes:

> Hi Mika,
>
> On Fri, Jul 26, 2024 at 05:08:01PM +0300, Mika Kuoppala wrote:
>> We need to export ptrace_may_access to be able to
>> allow debugger connection to check for debuggee access and
>> at the same time allow xe.ko module build.
>> 
>> CC: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> CC: Andi Shyti <andi.shyti@intel.com>
>> CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
> Just one note here: the tag order matters a little, the signature
> of from the sender should take the last place.

I will ping Jonathan to remove the sob as this might be residue
of splitting patches. He is credited on the actual application
of ptrace_may_access and the original EXPORT parts are mine.

>
>> ---
>>  kernel/ptrace.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/kernel/ptrace.c b/kernel/ptrace.c
>> index d5f89f9ef29f..86be1805ebd8 100644
>> --- a/kernel/ptrace.c
>> +++ b/kernel/ptrace.c
>> @@ -354,6 +354,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
>>  	task_unlock(task);
>>  	return !err;
>>  }
>> +EXPORT_SYMBOL_GPL(ptrace_may_access);
>
> I also believe, as suggested, that we should seek an ack from the
> maintainers here. Maybe we could have CC'ed just for this single
> patch. (You can add people in CC even after the '---' section not
> to pollute the commit log. This way you let git-send-email handle
> it).

I will move this patch to be first in series with ptrace author
and lkml included in cc.

>
> Nevertheless, same as I agreed earlier:
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Thanks,
-Mika

>
> Thanks,
> Andi
>
>>  static int check_ptrace_options(unsigned long data)
>>  {
>> -- 
>> 2.34.1
