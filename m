Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E97C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 11:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F166710E0CD;
	Thu, 23 Mar 2023 11:24:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286310E0CD
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679570657; x=1711106657;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Lad3p5j9ybEUn5mESY8uPTTEq9n3v+G9+vu4Yu/F77A=;
 b=D0j9LMS+t8pZWX5qO6vZLFBuzPBKG26qNppDHmIdv1D2Xd3IXXwQRyyn
 eU3RClaDeiKi0V/V3+iQrce3N1QHIOhgTjjhNjD5GxQ3qU9IsdbV4TeV9
 RIhvTqo5M48Zr0C7k62Ek13qmR7B6R9M8N2tCCkdhtk1EvDjf6B+9gknS
 U1G6Yc43rdUzHIODys/0ziSSAphQQPaFoOYjjZX0/jXOQSwWT9JFtgfTo
 OnY7QxDAnk7UtOBZ97AufOHmRM+MWZpjKPYXZK2mFk+Brb6n9ZofzZXOE
 C4bijBUv7DpWV85XZGK2jT627Flnj1vjk95Nz8NlIkNNYOHaSYINScIBj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="425738212"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="425738212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746682656"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="746682656"
Received: from rkiss-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.51])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:24:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ceeb7002-b48b-b95e-8bef-7ad072f3dfc0@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
 <875yar7n01.fsf@intel.com>
 <ceeb7002-b48b-b95e-8bef-7ad072f3dfc0@linux.intel.com>
Date: Thu, 23 Mar 2023 13:24:11 +0200
Message-ID: <87zg83678k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename intel_de.h to xe_de.h
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

On Thu, 23 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> On 2023-03-23 11:58, Jani Nikula wrote:
>> On Thu, 23 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>>> Rename intel_de.h to xe_de.h in order to remove #include_next,
>>> and change the ifdef guard to be the same as the rest of xe headers.
>>>
>>> This is consistent with the other files that are inside xe/display,
>>> and implement xe specific behavior.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_de.h            | 2 +-
>>>   drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} | 8 ++++----
>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>   rename drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} (97%)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
>>> index 5c223ff6b3ec..267b1108abbb 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_de.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_de.h
>>> @@ -4,7 +4,7 @@
>>>    */
>>>   
>>>   #ifdef BUILD_FOR_XE
>> I wonder why this isn't just
>>
>> #ifndef I915
>>
>> and why do we need the separate
>>
>> 	-DBUILD_FOR_XE=1 \
>>
>> in xe Makefile?
> If you give the ack, I will remove the BUILD_FOR_XE too when committing.

Ack, FWIW. All this needs to be squashed to something else,
eventually...

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
