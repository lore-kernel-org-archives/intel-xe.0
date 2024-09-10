Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5111CECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 09:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F710E755;
	Tue, 10 Sep 2024 09:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9ykiW6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C9810E761
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 09:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725961581; x=1757497581;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rbLTjFuvEJo/89WgJ73TGJMhE4H2qanFgTkMW5VKWJ4=;
 b=S9ykiW6IBC0GJYmrKLzJJ8EBoWBJveqWExEdKy9l8Wqphfm67KjIJ1uZ
 Soc+TO+JgEnRDrgyd2NsthIMjhtQMCUVvIC1J8ZONj8fA7ZPceuJR2dAI
 twcbIbo4wSbpTD8RWMgedQZTuzTJkZ7udeUoX9p//tp7kUXxYl7LNUJtt
 ZP2aMuJc5iB9+/QHugw3IjoN7HSEUh5yzT5wLk4/4pceoyeb5mz6U8y8Z
 8URSAkMByIH0uJ/ay3xPiY38gLFrtaMLvJAYD3hlLbX9J065qIj2FAqjY
 lFMqpotN7uI7ebo64XSr4+vJRr3isEptquikSscxTLwsUt/aDJecRBF+Q Q==;
X-CSE-ConnectionGUID: KcZltr25S+KFH0D9kf5iQA==
X-CSE-MsgGUID: xrBVuTnSQdGNu1JVk0KWsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42171117"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="42171117"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:46:21 -0700
X-CSE-ConnectionGUID: duWPLGOrS/yE9XV6vDrQQQ==
X-CSE-MsgGUID: 14FsfOq7RM+nmxZkl/Gc6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="90260772"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:46:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
In-Reply-To: <ec0e5117-edd7-4c9b-a154-fa8c760fc293@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com> <874j6pm3wk.fsf@intel.com>
 <3371ff33-b300-4aa3-bce0-516c36f3e3c9@intel.com>
 <f9c11e5f-8ee9-4cd9-9b3c-9f95c146021c@intel.com>
 <ec0e5117-edd7-4c9b-a154-fa8c760fc293@intel.com>
Date: Tue, 10 Sep 2024 12:46:15 +0300
Message-ID: <8734m7lu3c.fsf@intel.com>
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

On Tue, 10 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
> Hi Michal
>
> On 9/9/2024 6:42 PM, Michal Wajdeczko wrote:
>>=20
>>=20
>> On 09.09.2024 14:38, Riana Tauro wrote:
>>> Hi Jani
>>>
>>> On 9/9/2024 5:32 PM, Jani Nikula wrote:
>>>> On Fri, 06 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
>>>>> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] =
=3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"topology", .show =3D xe_gt_debugfs_=
simple_show, .data =3D topology},
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"steering", .show =3D xe_gt_debugfs_=
simple_show, .data =3D steering},
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"ggtt", .show =3D xe_gt_debugfs_simp=
le_show, .data =3D ggtt},
>>>>> +=C2=A0=C2=A0=C2=A0 {"powergate_info", .show =3D xe_gt_debugfs_simple=
_show, .data =3D
>>>>> powergate_info},
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"register-save-restore", .show =3D x=
e_gt_debugfs_simple_show,
>>>>> .data =3D register_save_restore},
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"workarounds", .show =3D xe_gt_debug=
fs_simple_show, .data =3D
>>>>> workarounds},
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {"pat", .show =3D xe_gt_debugfs_simpl=
e_show, .data =3D pat},
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> index 3924f9f3d0a5..85a35ed153a3 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gt_to_xe(gt);
>>>>>  =C2=A0 }
>>>>>  =C2=A0 +static inline const char *str_up_down(bool v)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 return v ? "up" : "down";
>>>>> +}
>>>>
>>>> Please don't add functions with names that are obviously going to have
>>>> name collisions with core kernel headers. This now conflicts in
>>>> linux-next [1]. Please rename until we can merge the real str_up_down()
>>>> from upstream to drm-xe-next.
>>>>
>>>> Also, please don't use static inline in .c files. Just let the compiler
>>>> do its thing.
>>> This was suggested in a review comment to have a local copy till the
>>> function lands in the tree
>>>
>>> https://patchwork.freedesktop.org/patch/605708/?series=3D136477&rev=3D1
>>=20
>> and there was heads-up [2] for potential conflict that was likely missed
>>=20
>> [2]
>> https://lore.kernel.org/intel-xe/7b0a9a05-3a98-4ec7-9c21-f9743602b16a@in=
tel.com/
> Sorry, i thought this was regarding cherry-picking the commit to=20
> drm-xe-next.

Side note, cherry-picking stuff from other trees is also not something
we generally do.

BR,
Jani.


>
> Will remove this for now
>>>
>>> Will remove this and use the function once its merged to drm-xe-next.
>>>
>>> Thanks
>>> Riana
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>> [1] https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
>>>>
>>>>

--=20
Jani Nikula, Intel
