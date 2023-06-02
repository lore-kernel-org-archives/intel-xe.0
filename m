Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A18C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E822110E209;
	Fri,  2 Jun 2023 17:18:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B6C10E209
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685726297; x=1717262297;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=tg/XlTLqeelkEK6iJCgXa9q0+fci0GrSWx9lHkUhhTI=;
 b=bE1j8uLK5CZtJuFgE1feOq0Lqqlm5omq+0ZhEdS+GfVMA0DOY2sotELl
 w+9mIpqjpQRJMWwztn5wli9Bne54Dtd9cN1cTPFm1QIyqjOhJ0yyV5VOz
 sYJFKBDeu24Z26hR3yRH5eHpeeY29RdjINMQAFVrOj8wXnqotJD1lZ7WS
 fRo+wJ3DEUpaU5P6sk17nbbzCgrdFNT6dhMlqFru1EYKefA6ksLggCkP5
 kqCRukn3cMnfPkgmElhMwKweE+6nEm+tDwR32DPrDohV6AHAlqVXUUtVZ
 OKGDI+6eGt3dICB1K/BucDQ+mACPvUEO8uYrrS0xw2JI9U+5uoMEdZgsN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358351727"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="358351727"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882146530"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="882146530"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:18:15 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <222d12cd-affe-1085-ebe9-85befd2dd683@linux.intel.com>
References: <20230602152149.998293-1-mika.kuoppala@linux.intel.com>
 <222d12cd-affe-1085-ebe9-85befd2dd683@linux.intel.com>
Date: Fri, 02 Jun 2023 20:18:06 +0300
Message-ID: <875y853hrl.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Get the engine ref while holding a
 lock
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

Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> writes:

> Hi, Mika,
>
> There is a reviewed patch on the list that fixes half of this already,
>
> "Fix engine lookup refcount race", but I'm holding off commiting because=
=20
> we need to sort out where to
> push fixes in response to Oded's review.
>
> But since your patch is more complete, we can use that instead.

Oh did not notice. I bumped into uaf on engine teardown
when running eudebug tests and while hunting that noticed
that the lookup might let unreffed pointer escape.

>
> One comment below, though. Otherwise LGTM.
>
> /Thomas
>
>
> On 6/2/23 17:21, Mika Kuoppala wrote:
>> The engine xarray holds a ref to engine, guarded by the lock.
>> While we do lookup for engine, we need to take the ref inside
>> the lock to prevent potential use-after-free during
>> ioctls.
>>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_engine.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engi=
ne.c
>> index b3036c4a8ec3..ec5a79c9f2a3 100644
>> --- a/drivers/gpu/drm/xe/xe_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>> @@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *=
xef, u32 id)
>>=20=20=20
>>   	mutex_lock(&xef->engine.lock);
>>   	e =3D xa_load(&xef->engine.xa, id);
>> -	mutex_unlock(&xef->engine.lock);
>> -
>> -	if (e)
>> +	if (likely(e))
>>   		xe_engine_get(e);
>
> Old rule is the branch prediction hints shouldn't be used in drivers,=20
> but exceptions might be
> in place where a code path is hit so often it might actually make a=20
> difference. Not sure this is such a path though?
>

I peeked that submission path does lookup engine and added this
as in addition to ioctls. But that path seems to be once per submission
so cant argue that it is often enough. Will remove.

-Mika

>> +	mutex_unlock(&xef->engine.lock);
>>=20=20=20
>>   	return e;
>>   }
>> @@ -641,26 +640,27 @@ int xe_engine_get_property_ioctl(struct drm_device=
 *dev, void *data,
>>   	struct xe_file *xef =3D to_xe_file(file);
>>   	struct drm_xe_engine_get_property *args =3D data;
>>   	struct xe_engine *e;
>> +	int ret;
>>=20=20=20
>>   	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>=20=20=20
>> -	mutex_lock(&xef->engine.lock);
>> -	e =3D xa_load(&xef->engine.xa, args->engine_id);
>> -	mutex_unlock(&xef->engine.lock);
>> -
>> +	e =3D xe_engine_lookup(xef, args->engine_id);
>>   	if (XE_IOCTL_ERR(xe, !e))
>>   		return -ENOENT;
>>=20=20=20
>>   	switch (args->property) {
>>   	case XE_ENGINE_GET_PROPERTY_BAN:
>>   		args->value =3D !!(e->flags & ENGINE_FLAG_BANNED);
>> +		ret =3D 0;
>>   		break;
>>   	default:
>> -		return -EINVAL;
>> +		ret =3D -EINVAL;
>>   	}
>>=20=20=20
>> -	return 0;
>> +	xe_engine_put(e);
>> +
>> +	return ret;
>>   }
>>=20=20=20
>>   static void engine_kill_compute(struct xe_engine *e)
