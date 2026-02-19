Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC168E9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 12:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7E910E690;
	Thu, 19 Feb 2026 12:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jDkwHJV5";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63C10E328;
 Thu, 19 Feb 2026 12:56:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B54460054;
 Thu, 19 Feb 2026 12:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345B6C4CEF7;
 Thu, 19 Feb 2026 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771505811;
 bh=5w2c3T5N/HslvSJikxs9VWj3ooLYEAp+jjvU7rSe13c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=jDkwHJV5/UY8VAqxHTP/uFSgsHO7NRL33Ui/Hrky7XR4Ly875E65h9HQfMnx77u9G
 wvOhklM9jt0sj7qEZ6NYLL3ZRIkJAq7caYujGAsdyc7+XFjYLljpYrpn1oyni8pyu6
 hlSDy2jgO2V1wd/SOikdXl7XP1S1W3xayAW75rzCF009yfOClo4mUGAVfnECfejV+M
 NoNyDXDVK+VIsbj56gs20r4lu+cqGnp1c+fEatM2XH57ZL8BgbQt18oM25zJIKYEUK
 OUS0fc7mIDolKx3SCC0ifSsoAn33mpI3QgocVL9XVIo9Yv1rTuAZyNcXSUcY2e7j+K
 ZaRspZP2wrZqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 13:56:48 +0100
Message-Id: <DGIYEDHZTNJL.VJVC0MLJWRN9@kernel.org>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Cc: "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
 <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
 <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
In-Reply-To: <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
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

On Thu Feb 19, 2026 at 1:44 PM CET, Matthew Auld wrote:
> On 19/02/2026 11:14, Danilo Krummrich wrote:
>> On Thu Feb 19, 2026 at 11:38 AM CET, Matthew Auld wrote:
>>> On 19/02/2026 10:16, Danilo Krummrich wrote:
>>>> On Mon Feb 16, 2026 at 12:19 PM CET, Koen Koning wrote:
>>>>> Use subsys_initcall instead of module_init for the GPU buddy allocato=
r,
>>>>> so its initialization code runs before any gpu drivers.
>>>>> Otherwise, a built-in driver that tries to use the buddy allocator wi=
ll
>>>>> run into a kernel NULL pointer dereference because slab_blocks is
>>>>> uninitialized.
>>>>>
>>>>> Specifically, this fixes drm/xe (as built-in) running into a kernel
>>>>> panic during boot, because it uses buddy during device probe.
>>>>
>>>> I just noticed that this patch was sent twice, and I posted my feedbac=
k on [1]
>>>> -- pasting it here as well.
>>>>
>>>>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (par=
t two)")
>>>>
>>>> This Fixes: tag seems wrong. How is this code move related to this pro=
blem?
>>>
>>> This popped up as a very recent regression for us internally. It looks
>>> like it worked before since link order ensured drm_buddy came before al=
l
>>> the driver code. With above commit the link order changed and became
>>> drm/ and then buddy. See [1] also, which is maybe clearer to see this.
>>=20
>> I see, I think this would be a good hint for the commit message. :)
>>=20
>> However, I think it was never meant to rely on a build system implementa=
tion
>> detail, nor would this be correct. So, I think this should add both Fixe=
s: tags.
>
> Yeah, I'm really not sure tbh. From a quick grep there do seem to be=20
> other users relying on this:
>
> drm/drm_drv.c:1274:module_init(drm_core_init);
> drm/scheduler/sched_fence.c:238:module_init(drm_sched_fence_slab_init);
>
> The sched one looks identical with the slab thing. Do these need to be=20
> fixed also?

Yes, those should be fixed as well.

Also note that module_init() compiles down to device_initcall() when built-=
in,
i.e. the initcall stage that is mainly for drivers, not for subsystem code.

Do you want to send a fix for thise as well?

>>=20
>> Whether it should be backported is a different question though, as it se=
ems to
>> work by accident in previous versions, i.e. it is only a "potential bug"=
.
>>=20
>> My personal opinion is that it should be backported either way, however =
that's
>> ultimately up to the stable team.
>>=20
>> - Danilo
>>=20
>>>
>>> [1]
>>> https://lore.kernel.org/intel-xe/20260213152047.179628-1-koen.koning@li=
nux.intel.com/
>>>
>>>>
>>>> This should rather be:
>>>>
>>>> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into com=
mon drm")
>>>>
>>>> Also, please add:
>>>>
>>>> Cc: stable@vger.kernel.org
>>>>
>>>>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>> Cc: intel-xe@lists.freedesktop.org
>>>>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
>>>>
>>>> [1] https://lore.kernel.org/all/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/
>>=20

