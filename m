Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C409ECE8D78
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B0410E2AD;
	Thu, 19 Sep 2024 11:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtqF3hY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945BD10E2AD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726745806; x=1758281806;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2QYDJJtU04ljUFKKyhC2ZHrEQv96+QVbbKHRhcXRm3U=;
 b=DtqF3hY1Hhp9Ez5kgw9Q/TqcF1TOS08EcCwpLvLel/z2CyQ0IKjKz7Yo
 PE9jQ9FF4GGEHo7gAhwkH2lnXLWcDB1u3wYS1+/VKJT7L2y9K7R/Nm7aN
 EDja1kLVTxKz/axrm6m2uNqyRYxw8DhSb6onsmPIb9/vfXdJZ8HqP6D75
 gF4pHcMtBwubcGyM1Vrlhb5njgMXi0ArHVcikv3ZGmqQ5IsGj023ZV02+
 GsZOSb5UAJSPdNPf09lLuaZqGq+iSkLGy7OZH/orE42LvKSXQWKBfvCx1
 MGYjKq+340jaCylk2lO95CdPyLP+JkAmkubB7stObD3KtEIkjnWWkt/M7 w==;
X-CSE-ConnectionGUID: s+ETKu4jRJm0S/yiDyXGnQ==
X-CSE-MsgGUID: iTvwo1XqT9uBX2AYi6YWMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25580120"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25580120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:36:46 -0700
X-CSE-ConnectionGUID: HNc5q7psQRGPKN2EslseOA==
X-CSE-MsgGUID: sLWEusOeQ1uMW7ouFXtbBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="100629230"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:36:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
In-Reply-To: <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com>
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
 <87v7ytbf9y.fsf@intel.com>
 <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com>
Date: Thu, 19 Sep 2024 14:36:40 +0300
Message-ID: <87a5g3an93.fsf@intel.com>
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

On Thu, 19 Sep 2024, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> On 18-09-2024 12:49, Jani Nikula wrote:
>> On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@int=
el.com> wrote:
>>> On 18-09-2024 00:20, Matthew Brost wrote:
>>>> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>>>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>>>> Agreed implementation/usage will be same, will use explicit type for
>>>>>> clarity.
>>>>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>>>>> typedef unsigned long xe_wakeref_t;
>>>>>
>>>>> I agree with this.
>>>>>
>>>>
>>>> What? Really? I thought it was pretty clear rule in kernel programing
>>>> not use typedefs [1]. Reading through conditions acceptable and I don't
>>>> use anything applies to this series, maybe a) applies but not really
>>>> convinced. The example in a) is a pte_t which can likely change based =
on
>>>> platform target whereas here we only have one target and see no reason
>>>> this needs to be opaque.
>>>>
>>>> Matt
>>>>
>>>> [1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#ty=
pedefs
>>>
>>>
>>> While running checkpatch on my changes, patchwork had also issued a
>>> WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the usage in
>>> the Linux kernel tree and found it used in many places, which led me to
>>> assume it was safe. I now realize that I should have been more careful
>>> in understanding the context of its usage and referred to the kernel
>>> coding guidelines. This was an oversight on my part.
>>>
>>> Since this doesn=E2=80=99t impact the CI or runtime, I will avoid rever=
ting to
>>> unsigned int immediately and will hold off until I receive the other
>>> review comments. I will incorporate the changes to revert it in
>>> subsequent versions while also addressing the other review comments.
>>> Thank you for bringing this to the attention.
>>=20
>> If you end up replicating intel_wakeref_t from i915, and go as deep as
>> the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
>> disguised as an unsigned long. It's a struct ref_tracker * when you have
>> certain configs enabled.
>>=20
>> You could just use struct ref_tracker * everywhere. It's an opaque type
>> to start with.
>
> The original idea of using typedef for the fw return mask was for the=20
> sake of clarity. However, Matt B pointed that the use of typedef in this=
=20
> instance is not in accordance with the Linux kernel coding standards.=20
> Additionally, I agree with Matt B that there is no need for the fw=20
> return mask to be opaque; therefore, it is preferable to maintain the=20
> use of unsigned int.

I'm not sure it's a hot idea to explicitly state that the return value
is a domain mask. The callers shouldn't need to care, should they?

For example:

 +	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 +	if (fw_ref !=3D XE_FORCEWAKE_ALL) {

Under what conditions do you expect this to happen? Shouldn't
xe_force_wake_get() flag cases where it couldn't deliver what you asked?

BR,
Jani.


--=20
Jani Nikula, Intel
