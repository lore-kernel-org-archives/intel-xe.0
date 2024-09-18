Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FFECCD181
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 07:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6B10E54D;
	Wed, 18 Sep 2024 07:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjmJPxd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F267410E557
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726643953; x=1758179953;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=iYuOLtSOd24GOWmghfsqsV8hmMaxNnrbFS4NV+HdYfQ=;
 b=FjmJPxd9w5mK5Zguo19ZOapwFCZ/HLcpk4EyXzh2GgsFp4cwklCbYRcq
 rzdtLc3nlVC977nOjyc6jmFcBGK71a1d45XakylYL3JiCA+3XhY/atAvO
 BIu8ghicOxZ6GMBuIwqDxdf53t+4KVwfdT/CEeo4Zd3IsHviXUB+aKjv3
 oQUYHDPJpn2tqclTKvz0X29/0VapiksvNdzpSuB3Q/fC2JjaBpMlN0Qlr
 ixi6NRInsjSClxjlSh4eC3gfOQpPDjU3LkOIRLy0vY04fUxmb+LqPi9qq
 XhVMn3Mu8Qn8+UlYnqn2u79FLnHb2DE1ZAL3t6tZ3eiSeshcvbg06sA+J w==;
X-CSE-ConnectionGUID: nKivRZGCQ2WiQ0RS3vrSIw==
X-CSE-MsgGUID: EtEnr0FRTZGFfOf4fqPchA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="48051500"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="48051500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:19:12 -0700
X-CSE-ConnectionGUID: j0tLOJ7sT4GMQdOp4Q+vHg==
X-CSE-MsgGUID: 6JDrS3mdTj+WaM0+3Bku5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69455005"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:19:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
In-Reply-To: <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com>
Date: Wed, 18 Sep 2024 10:19:05 +0300
Message-ID: <87v7ytbf9y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.=
com> wrote:
> On 18-09-2024 00:20, Matthew Brost wrote:
>> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>>
>>>
>>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 13-09-2024 16:56, Michal Wajdeczko wrote:
>>>>>
>>>>>
>>>>> On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
>>>>>>
>>>>>>
>>>>>> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>>>>>>> If an acknowledgment timeout occurs for a domain awake request, do=
 not
>>>>>>>> increment the reference count for the domain. This ensures that
>>>>>>>> subsequent _get calls do not incorrectly assume the
>>>>>>>> domain is awake. The
>>>>>>>> return value is a mask of domains whose reference counts were
>>>>>>>> incremented, and these domains need to be released using
>>>>>>>> xe_force_wake_put.
>>>>>>>>
>>>>>>>> The caller needs to compare the return value with the input domain=
s to
>>>>>>>> determine the success or failure of the operation and
>>>>>>>> decide whether to
>>>>>>>> continue or return accordingly.
>>>>>>>>
>>>>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>>>>
>>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.=
com>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_force_wake.c | 35
>>>>>>>> ++++++++++++++++++++++++ +-----
>>>>>>>>  =C2=A0=C2=A0 1 file changed, 29 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>> index a64c14757c84..fa42d652d23f 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *g=
t,
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (ffs(tmp__) - 1))) && \
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 domain__->reg_ctl.addr)
>>>>>>>>  =C2=A0=C2=A0 +/**
>>>>>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>>>>>>> initially, wake the domain
>>>>>>>
>>>>>>> while likely this is still recognized by the kernel-doc tool, this =
is
>>>>>>> not correct notation for the function() documentation
>>>>>>
>>>>>>
>>>>>> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
>>>>>> will fix it.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> [1]
>>>>>>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-
>>>>>>> documentation
>>>>>>>
>>>>>>>> + * @fw: struct xe_force_wake
>>>>>>>> + * @domains: forcewake domains to get refcount on
>>>>>>>> + *
>>>>>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>>>>>> + * asleep, awaken it and wait for acknowledgment within the speci=
fied
>>>>>>>> + * timeout. If a timeout occurs, decrement the refcount.
>>>>>>>
>>>>>>> not sure if doc shall be 1:1 of low level implementation details
>>>>>>
>>>>>> Does this sound okay ?
>>>>>> This function takes references for the input @domains and wakes them=
 if
>>>>>> they are asleep.
>>>>>>
>>>>>>>
>>>>>>>> + * The caller should compare the return value with the @domains to
>>>>>>>> + * determine the success or failure of the operation.
>>>>>>>> + *
>>>>>>>> + * Return: mask of refcount increased domains.
>>>>>>>
>>>>>>> if we return a 'mask' then maybe it should be of 'unsigned int' typ=
e?
>>>>>>
>>>>>> Agreed. Will fix in next version.
>>>>>>
>>>>>>>
>>>>>>>> If the return value is
>>>>>>>> + * equal to the input parameter @domains, the operation is consid=
ered
>>>>>>>> + * successful. Otherwise, the operation is considered a failure, =
and
>>>>>>>> + * the caller should handle the failure case, potentially returni=
ng
>>>>>>>> + * -ETIMEDOUT.
>>>>>>>
>>>>>>> it looks that all problems with the nice API is due to the
>>>>>>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra =
care
>>>>>>>
>>>>>>> maybe there should be different pair of functions:
>>>>>>
>>>>>> I am not convinced with different pair of functions:
>>>>>>
>>>>>> In current implementation:
>>>>>>
>>>>>> int mask =3D xe_force_wake_get(fw, domains)
>>>>>> if (mask !=3D domains) {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Non critical path continue with warni=
ng;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0critical path:
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_force_wake_put(=
fw, mask);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;
>>>>>> }
>>>>>>
>>>>>> do_ops;
>>>>>> xe_force_wake_put(fw, mask);
>>>>>> return err;
>>>>>>
>>>>>> Above flow remains intact irrespective of individual domains or
>>>>>> FORCEWAKE_ALL.
>>>>>>
>>>>>> In case of individual domains if (mask !=3D domains) can be replaced=
 with
>>>>>> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure pa=
th
>>>>>> since mask is 0;
>>>>>
>>>>> so maybe we should have (by reinventing i915?):
>>>>>
>>>>> // opaque, but zero means failure/no domains are awake
>>>>> typedef unsigned long xe_wakeref_t;
>>>>>
>>>>>
>>>>> // caller should test for ref !=3D 0
>>>>> // but shall call put if ref !=3D 0
>>>>> xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
>>>>>
>>>>> // safe to call with ref =3D=3D 0
>>>>> void xe_force_wake_put(fw, xe_wakeref_t ref)
>>>>>
>>>>>
>>>>> // helpers for critical work that must be sure about domain
>>>>>
>>>>> // compares opaque ref with explicit domain !=3D ALL
>>>>> // can be used by the code that obtained the ref
>>>>> bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
>>>>>
>>>>> // compares fw with explicit domain !=3D ALL
>>>>> // can be used by the code that does not have direct access to the ref
>>>>> bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
>>>>>
>>>>>
>>>>> // helpers for checking correctness
>>>>> void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
>>>>>
>>>>>
>>>>> then usage would be:
>>>>>
>>>>> xe_wakeref_t ref;
>>>>>
>>>>> ref =3D xe_force_wake_get(fw, d);
>>>>> if (ref) {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0// ...
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0xe_force_wake_put(fw, ref);
>>>>> }
>>>>>
>>>>> or:
>>>>>
>>>>> xe_wakeref_t ref;
>>>>>
>>>>> ref =3D xe_force_wake_get(fw, ALL);
>>>>> if (xe_wakeref_has_domain(ref, d1))
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0// ... critical work1
>>>>> if (xe_wakeref_has_domain(ref, d2))
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0// ... critical work2
>>>>> xe_force_wake_put(fw, ref);
>>>>>
>>>>>
>>>>> so above will be very similar to what you have but by having explicit
>>>>> types IMO it will help connect all functions into proper use-case flow
>>>>
>>>>
>>>> Agreed implementation/usage will be same, will use explicit type for
>>>> clarity.
>>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>>> typedef unsigned long xe_wakeref_t;
>>>
>>> I agree with this.
>>>
>>=20
>> What? Really? I thought it was pretty clear rule in kernel programing
>> not use typedefs [1]. Reading through conditions acceptable and I don't
>> use anything applies to this series, maybe a) applies but not really
>> convinced. The example in a) is a pte_t which can likely change based on
>> platform target whereas here we only have one target and see no reason
>> this needs to be opaque.
>>=20
>> Matt
>>=20
>> [1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#type=
defs
>
>
> While running checkpatch on my changes, patchwork had also issued a=20
> WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the usage in=20
> the Linux kernel tree and found it used in many places, which led me to=20
> assume it was safe. I now realize that I should have been more careful=20
> in understanding the context of its usage and referred to the kernel=20
> coding guidelines. This was an oversight on my part.
>
> Since this doesn=E2=80=99t impact the CI or runtime, I will avoid reverti=
ng to=20
> unsigned int immediately and will hold off until I receive the other=20
> review comments. I will incorporate the changes to revert it in=20
> subsequent versions while also addressing the other review comments.
> Thank you for bringing this to the attention.

If you end up replicating intel_wakeref_t from i915, and go as deep as
the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
disguised as an unsigned long. It's a struct ref_tracker * when you have
certain configs enabled.

You could just use struct ref_tracker * everywhere. It's an opaque type
to start with.

BR,
Jani.


>
> BR
> Himal
>
>>=20
>>> Regards,
>>> Badal
>>>>
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> // for single domain where ret=3D0 is success, ret<0 is error
>>>>>>
>>>>>> This leads to caller only calling xe_force_wake_put incase of get
>>>>>> success. so in case of caller continuing with failure, he will need =
to
>>>>>> ensure the put is not called.
>>>>>>
>>>>>> for example:
>>>>>> int ret;
>>>>>>
>>>>>> ret =3D xe_force_wake_get(fw, DOMAIN_GT);
>>>>>> XE_WARN_ON(ret)
>>>>>> if(!ret)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_force_wake_put(fw, DOMAIN_GT);
>>>>>>
>>>>>>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>>>>>>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>>>>>>
>>>>>>> and
>>>>>>>
>>>>>>> // for all domain where ret=3D0 is success, ret<0 is error
>>>>>>> int int xe_force_wake_get_all(fw);
>>>>>>> void xe_force_wake_put_all(fw);
>>>>>>
>>>>>> In case of xe_force_wake_get_all(fw) failure, how the caller will kn=
ow
>>>>>> which domains got awake and which failed ?
>>>>>>
>>>>>> ret =3D xe_force_wake_get_all(fw);
>>>>>> if(!ret)
>>>>>>  =C2=A0=C2=A0=C2=A0 No way to put awake domains to sleep
>>>>>
>>>>> in case of failure, it would be the responsibility of the
>>>>> xe_force_wake_get_all() to put all partial awakes immediately, since =
it
>>>>> failed to awake all requested domains (same as in single domain case)
>>>>>
>>>>> but let's drop this idea
>>>>>
>>>>>>
>>>>>>>
>>>>>>> and
>>>>>>>
>>>>>>> // input: mask of domains, return: mask of domain
>>>>>>> unsigned int xe_force_wake_get_mask(fw, mask);
>>>>>>> void xe_force_wake_put_mask(fw, mask);
>>>>>>>
>>>>>>> this last one can be just main implementation (static or public if =
we
>>>>>>> really want to continue with random set of enabled domains)
>>>>>>>
>>>>>>>> + */
>>>>>>>>  =C2=A0=C2=A0 int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xe_force_wake_domains domains)
>>>>>>>>  =C2=A0=C2=A0 {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_gt *gt =3D fw->gt;
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_force_wake_domain =
*domain;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 enum xe_force_wake_domains tmp, woken =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 enum xe_force_wake_domains tmp, awake_rqst =3D=
 0, awake_ack =3D 0;
>>>>>>>
>>>>>>> it looks that you're abusing even more all enum variables by treati=
ng
>>>>>>> them as plain integers
>>>>>>
>>>>>> Miss at my end. Will address them in next version.
>>>>>>
>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
>>>>>>>> -=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret =3D domains;
>>>>>>>>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&fw=
->lock, flags);
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_fw_domain_masked(do=
main, domains, fw, tmp) {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
!domain->ref++) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 woken |=3D BIT(domain->id);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 awake_rqst |=3D BIT(domain->id);
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 domain_wake(gt, domain);
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> -=C2=A0=C2=A0=C2=A0 for_each_fw_domain_masked(domain, woken, fw, t=
mp) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret |=3D domain_wake_w=
ait(gt, domain);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for_each_fw_domain_masked(domain, awake_rqst, =
fw, tmp) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (domain_wake_wait(g=
t, domain) =3D=3D 0) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 awake_ack |=3D BIT(domain->id);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret &=3D ~BIT(domain->id);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 --domain->ref;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> -=C2=A0=C2=A0=C2=A0 fw->awake_domains |=3D woken;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 fw->awake_domains |=3D awake_ack;
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&fw->=
lock, flags);
>>>>>>>>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>

--=20
Jani Nikula, Intel
