Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418BEB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 15:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237B10E177;
	Wed,  5 Jul 2023 15:39:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8176F10E397
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688571582; x=1720107582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3GoQMZ+DNrf23Bcw3QOz7twgjS4c93oMmydDRQFtjBo=;
 b=eJkw6+HFgWidIn+QIHhsHbOuMdwDx/KWUF0WbX/7Tzzfgy4ME/XkRul9
 0ysvSoSpe1UJ9jr5vOdxIb27KdCdMtHV6jgWSTAE57qtWvdHOPkep7NUc
 sZdj9+/gQxJxkj6/lPBtTEhASa85CK2Ewpa3GgmVskqUBOmUJRUY5nI1c
 NsRbrmXG/uguo7v+OJUpkgS3G21EFLu3RP7IVh75UAQgeAs7mArFr1RW0
 /b6q0MVkHChdUbGzYAanjU/5copcaY4WeDvEUCh3RUru0ZACnGWHieLdu
 UEgiLppcF2ykLzaeTgqGH1jB/Fxa0Y7xvxqiAVEnwoG1tj9zJzms2UPAo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449739328"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="449739328"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 08:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754403757"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="754403757"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.33.133])
 ([10.249.33.133])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 08:39:22 -0700
Message-ID: <eb6aed9e-ef31-98d6-7bec-d2ac8042792c@linux.intel.com>
Date: Wed, 5 Jul 2023 17:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20230705084403.3922130-1-tejas.upadhyay@intel.com>
 <87y1jucv1g.wl-ashutosh.dixit@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <87y1jucv1g.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
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
Cc: Andi Shyti <andi.shyti@intel.com>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Ashutosh,

On 7/5/2023 4:06 PM, Dixit, Ashutosh wrote:
> On Wed, 05 Jul 2023 01:44:03 -0700, Tejas Upadhyay wrote:
>> Currently return from xe_gt_sysfs_init() is ignored
>> and also a failure in xe_gt_sysfs_init() isn't fatal
>> so make it return void.
> But why is the failure not fatal? I really don't understand the concept of
> these non-fatal failures. Do we really want to say the device is up if
> sysfs initialization has failed for some reason and people are unable to
> see card freq's e.g.? This was done in i915 but do we really want to repeat
> this for xe? IMO the simplest thing to do would be to fail the probe unless
> ALL required/intended functionality is clearly up.


I agree with the concern but the situation is different with a graphics 
driver.

If we return error on probe, (if I am not wrong) a user will have no way 
to interact

with the system other than ssh. We should ignore non-fatal error and let 
the driver load

so a user can have something to work with(may be report a bug :) )


Regards,

Nirmoy

>
> Instead of ignoring the return, fail the probe?
>
> Thanks.
> --
> Ashutosh
