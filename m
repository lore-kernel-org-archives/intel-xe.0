Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10509CD13D1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 09:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2710E250;
	Mon, 18 Sep 2023 09:54:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDB610E250
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695030892; x=1726566892;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XLwEhEQX6LKUo3EmoaSBctTC28i4dSBO8md74X4DWmI=;
 b=FvNafgqAA4rA7Fbrh/6Ly9A0qwt302Pj4rgY0yykP2Yb2oujcH2jh/xq
 7/DGoC2qMEhifrb7grI2/surydvf9DM3REicDpMuafLQoLFLnATll/nJo
 RXciEcmxq2NUR9+R/CaMyJY8fXhroWaAQiuP9OtqubjYPkqXLYblEPc7G
 WRJiE8N8L8jjHf2k+ENVo91ysZpMLw06TBk3fqvJqIDPY/10P5lrQ3Os9
 b7c0AUQx0Oi/kQ63syARSehZL1DMPyTn8gC5syYZIlcXcnowR/tXMiwMe
 b9GOP+KQ4DILsOJ82mZ7VAZuoGF9et0bzRcni3JOc4rpNN+4ceYcV5xTS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359030072"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359030072"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 02:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="919389536"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="919389536"
Received: from mkhokhlx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 02:54:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>
In-Reply-To: <bf33b2c3-5111-e4ed-0a3d-5616ce0fc9f6@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
 <87v8cfd4t7.fsf@intel.com>
 <d763fd15-0732-8cd2-a24f-055a5855544a@habana.ai>
 <87h6nxw3rl.fsf@intel.com>
 <0d208249-a467-9c35-4c38-2bd9dd56f611@habana.ai>
 <CAKMK7uETpBgGGBesKZjBB+aYbfN3UA29OSksADY8FVvFKL=wtw@mail.gmail.com>
 <bf33b2c3-5111-e4ed-0a3d-5616ce0fc9f6@habana.ai>
Date: Mon, 18 Sep 2023 12:54:47 +0300
Message-ID: <874jjrvmag.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 18 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
> On 14/09/2023 23:47, Daniel Vetter wrote:
>> On Thu, 14 Sept 2023 at 16:21, Ofir Bitton <obitton@habana.ai> wrote:
>>>
>>> On 14/09/2023 11:35, Jani Nikula wrote:
>>>> On Tue, 12 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
>>>>> On 12/09/2023 14:11, Jani Nikula wrote:
>>>>>> On Tue, 12 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
>>>>>>> On 12/09/2023 3:25, Matt Roper wrote:
>>>>>>> Hey Matt, I totally undesrstand your concern, I might have another
>>>>>>> suggestion. We can create another FD in debugfs and move this ioctl
>>>>>>> there (I can take ownership on this), This way ABI is not an issue.
>>>>>>
>>>>>> FD or ioctl in debugfs? Or do you just mean adding a debugfs file for
>>>>>> register access?
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>>
>>>>> Add a new file in debugfs to which we will send debug ioctls such as the
>>>>> mmio ioctl.
>>>>
>>>> It's so rare to do ioctl on debugfs files that I first had to check it's
>>>> possible, and then try to find examples in the kernel. I found one so
>>>> far, though there are probably more.
>>>>
>>>> If it's that rare, usually the question is, does it make sense?
>>>>
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>
>>> I actually got this idea from Daniel few months back during a different
>>> discussion. Daniel any thoughts on this?
>>
>> So the backstory is that some simulation interface for gaudi used a
>> chardev node, for the efficiency/flexibilty of ioctl. Which for
>> upstream is a no-go, we really don't want to make val/sim stuff stable
>> uapi. But in general I'm very much welcome to upstreaming
>> debug/sim/val infrastructure, anything that's reasonable and reduces
>> the delta against internal/downstream trees is good, and the ioctl
>> interface seems like the right fit, and the stable uapi issue can be
>> avoided by moving it all into debugfs.
>>
>> That's how the debugfs-with-ioctl idea was born.
>>
>> Now since it's debugfs I really don't care much (but maybe
>> double-check with Dave Airlie), as long as we don't go overboard and
>> use ioctl for absolutely everything just because we can. Because in
>> general I think debugfs should be human readable and useable with just
>> commandline, very often that's really the most convenient interface.
>> But if we need something where ioctl is just the better fit, then yeah
>> ioctl in debugfs is imo ok.
>>
>> Cheers!
>>
>
> Thanks Daniel for the detailed input! I think in our case we can use
> a debugfs ioctl ONLY for the mmio case, as indeed here it is the best
> fit. Jani, any objection?

Ack on the plan.

And since it's debugfs, we can actually change it afterwards. :)

BR,
Jani.


>
>>> If you are uncomfortable with the ioctl approach we can go with a
>>> different approach, for example what we did in the habanalabs driver:
>>>
>>> setting read/write address:
>>> https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/accel/habanalabs/common/debugfs.c#L1630
>>>
>>> read32:
>>> https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/accel/habanalabs/common/debugfs.c#L844
>>>
>>> I liked the ioctl approach so much because it requires a single system
>>> call instead of 2 and the implementation is much cleaner.
>>>
>>> Ofir.
>>>
>>>
>>
>>
>

-- 
Jani Nikula, Intel
