Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC16E81BD2
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 08:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6D10E041;
	Wed, 11 Feb 2026 08:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="o/2hLvzQ";
	dkim-atps=neutral
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D5510E041;
 Wed, 11 Feb 2026 08:57:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f9skq5tS3z9v0d;
 Wed, 11 Feb 2026 09:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770800243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15VZocCgwdjn49FZsMGxj4CaQnU6ps1DJMCpIxkgtEQ=;
 b=o/2hLvzQkkbJLyAmUCD+elzcf/EPDgR1tPXHGtBEaBCVAyvjlqd/cfgLUX+AsOsGepp1M8
 2nGeiQe6pOoNsNU/M2qE1K8m9m269HmsKggRUkKVRevEU3xU+UYu/w/9wDE2umCvbcQk2A
 dHerVPOJSUZcnzPpwmQh26pKTA5423kb1I+BVXc4Zeyxv47UMPPN+HQCb9cT+5OoKRdxbL
 A6m6F+ZQI7/KmYgsVn3RaM9MEe3abaObNFZ/QtbdtlqTvmsqyEX+qELFpLYHnqddBNkp7H
 iyXm/BDR+NHvGP8WB5R6N0xeGbaVYxM3CHQi9LYgTMF7ViU1kvapQymaA50C3w==
Message-ID: <7c83329b-a730-4e3f-b6d1-c41db4df3bd9@mailbox.org>
Date: Wed, 11 Feb 2026 09:57:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
 <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
 <IA0PR11MB73070E28F07D2BA29C5D5473BA63A@IA0PR11MB7307.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <IA0PR11MB73070E28F07D2BA29C5D5473BA63A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 56e1625dfeba34b3318
X-MBO-RS-META: jwhgyzkegkkpdqzrbgk44eqfbtpqt4rt
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

On 2/11/26 06:48, Murthy, Arun R wrote:
>> On 1/12/26 09:23, Murthy, Arun R wrote:
>>> On 09-01-2026 16:52, Michel Dänzer wrote:
>>>> On 1/9/26 12:07, Murthy, Arun R wrote:
>>>>>> From: Michel Dänzer <michel.daenzer@mailbox.org> On 1/8/26 10:43,
>>>>>> Arun R Murthy wrote:
>>>>>>> struct drm_crtc_state {
>>>>>>>          /**
>>>>>>>           * @async_flip:
>>>>>>>           *
>>>>>>>           * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the
>> legacy
>>>>>>>           * PAGE_FLIP IOCTL. It's not wired up for the atomic
>>>>>>> IOCTL itself yet.
>>>>>>>           */
>>>>>>>          bool async_flip;
>>>>>>>
>>>>>>> In the existing code the flag async_flip was intended for the
>>>>>>> legacy PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>>>>> As per the hardware feature is concerned, async flip is a plane
>>>>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>>>>> For a given hardware pipe, among the multiple hardware planes, one
>>>>>>> can go with sync flip and other 2/3 can go with async flip.
>>>>>> FWIW, this kind of mix'n'match doesn't seem useful with current
>>>>>> UAPI, since no new commit can be made for the async plane(s) before
>>>>>> the previous commit for the sync plane(s) has completed, so the
>>>>>> async plane(s) can't actually have higher update rate than the sync one(s).
>>>>> That’s right, such mix and match flips will still consume vblank time for
>> flipping.
>>>> Does a plane property really make sense for this then?
>>>
>>> As per the hardware this async flip is per plane basis and not per crtc.
>>
>> That's not really relevant.
>>
>>
>>> Not that I am trying to clean up this. Recently AMD added async support on
>> overlays as well for which  few other hacks were added. The checks that we do
>> for async flip were all done in place of copy the objs/properties, but it actually is
>> supposed to be done in the check_only() part of the drm core code. This was
>> the limitation with the existing implementation.
>>
>> Those implementation details can be changed without changing UAPI.
>>
>>
>>> As per hardware the async flip is associated with the plane, hence changing it
>> to a plane property.
>>
>> A plane property would only really be needed for mixing async & sync plane
>> updates in a single commit. Since that's currently not usefully possible due to
>> other restrictions of the UAPI, the DRM_MODE_PAGE_FLIP_ASYNC flag which
>> affects the commit as a whole is fine at this point.
>>
> Sorry for getting back late on this, took some time to collaborate all the feedbacks.
> 
> We can depict the below 3 scenarios based on the discussions so far.
> 1. KMD can allow a mix of sync and async only if there is a disable plane req on sync and no plane update on sync flips along with async flips(maybe on multiple planes).  KMD will send the flipdone after sync plane disable is done. (Basically flipdone will send at vblank)

What would be the point of allowing that? The compositor can't do the next commit before the sync plane has turned off anyway, so it can just as well do that in a sync commit and the async plane updates in separate commits later.


> 3. With multiple plane async flips, KMD send flip done per plane basis to the user. (async flag per plane from user)
> 4. With supporting a mix of sync and async flips, should KMD allow them and send one flipdone for async flips and one flipdone for sync flips.

Again not sure what would be the point of 3 or 4, since the compositor can't do the next commit before all planes have updated anyway.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
