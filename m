Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41898C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 14:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BB310E493;
	Tue,  4 Jun 2024 14:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iX2vERvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8394C10E493
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717510889; x=1749046889;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=evNaZiq/FVAZ7IaXW8IszpiUzwxt+cm+RyOaOGFVS1w=;
 b=iX2vERvxOppawGX2J6cPhV7amDsPCcSGNtyOMZ6YJwzzJYg2VrD3Kuza
 4ntVGO9LinpCnxNfYLbFl0fsC2lF9pyv1T2YMfdSDfYxs30q0T0d2lRd5
 24EX/zjWBcPFIS2wg3mvlZCmTsFk0ChkzeAxRQLVGJpRmmSxvGVyyA/v8
 qy4gZTE9IkOCG65UuyBAG7IxgfQ8lZaGxz+HowrZA7Fj1QpwPhsuhJPy/
 uTtsVlWGy2VhO+EGEWRPK3X5rqibSph6mFu+pScL81UP0ffO0XWL9NF6a
 pYMYH3lqrLpolSZqhWpuc73BbslrQH4trdM5zo+1AC3iIrgJRBvX2uYgu Q==;
X-CSE-ConnectionGUID: bzbh6NeXSL+gRIMExF63Lg==
X-CSE-MsgGUID: gROtk7LNTjmQ9+Um3J7GWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13902266"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208,217";a="13902266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:21:28 -0700
X-CSE-ConnectionGUID: sYa1sEI2R/i3iYDWB8x/SA==
X-CSE-MsgGUID: bhtgH+ffS5eMvVSYprxBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208,217";a="37123929"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.1])
 ([10.246.50.1])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:21:27 -0700
Content-Type: multipart/alternative;
 boundary="------------SxT5E8rNDV1WItart7GIYFoq"
Message-ID: <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
Date: Tue, 4 Jun 2024 16:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
 <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
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

This is a multi-part message in MIME format.
--------------SxT5E8rNDV1WItart7GIYFoq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 6/4/2024 3:12 PM, Michal Wajdeczko wrote:
>
> On 04.06.2024 13:02, Nirmoy Das wrote:
>> xe_force_wake_get() increments the domain ref regardless of success
>> or failure so call xe_force_wake_put() even on failure to keep ref
>> count accurate.
>>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 440ac572f6e5..8fcc08658d89 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>   	xa_for_each(&sr->xa, reg, entry)
>>   		apply_one_mmio(gt, entry);
>>   
>> -	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>> -	XE_WARN_ON(err);
>> -
>> -	return;
>> -
>>   err_force_wake:
>> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>> +	if (err)
>> +		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>> +			  sr->name, err);
>> +	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
> what's the rule whether to WARN about the failed xe_force_wake_put() or
> not ? should we also WARN when xe_force_wake_get() failed ? does it make
> sense to WARN about put() if get() already failed ?
We don't have one yet.
>
> maybe simpler solution would be make function xe_force_wake_put() void
> as it almost nothing that caller can do and move WARN there if needed ?

We have code that  does "return xe_force_wake_put()" So question is what 
shall we do

if xe_force_wake_get() worked but subsequent xe_force_wake_put() fails ?

Regards,

Nirmoy

>
> what about making the flow more intuitive like this:
>
> bool xe_force_wake_get(fw, d);
> void xe_force_wake_put(fw, d);
>
> 	if (xe_force_wake_get(fw, d)) {
> 		...
> 		xe_force_wake_put(fw, d);
> 	}
>
>>   }
>>   
>>   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>> @@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>   		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>   	}
>>   
>> -	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>> -	XE_WARN_ON(err);
>> -
>> -	return;
>> -
>>   err_force_wake:
>> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>> +	if (err)
>> +		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>> +			  sr->name, err);
>> +	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>   }
>>   
>>   /**
--------------SxT5E8rNDV1WItart7GIYFoq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Michal,<br>
    </p>
    <div class="moz-cite-prefix">On 6/4/2024 3:12 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 04.06.2024 13:02, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_put() even on failure to keep ref
count accurate.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 440ac572f6e5..8fcc08658d89 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xa_for_each(&amp;sr-&gt;xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(&amp;gt-&gt;mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
-
-	return;
-
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	if (err)
+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
+			  sr-&gt;name, err);
+	XE_WARN_ON(xe_force_wake_put(&amp;gt-&gt;mmio.fw, XE_FORCEWAKE_ALL));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
what's the rule whether to WARN about the failed xe_force_wake_put() or
not ? should we also WARN when xe_force_wake_get() failed ? does it make
sense to WARN about put() if get() already failed ?</pre>
    </blockquote>
    We don't have one yet. <br>
    <blockquote type="cite"
      cite="mid:e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com">
      <pre class="moz-quote-pre" wrap="">

maybe simpler solution would be make function xe_force_wake_put() void
as it almost nothing that caller can do and move WARN there if needed ?</pre>
    </blockquote>
    <p>We have code that  does "return <span
      style="white-space: pre-wrap">xe_force_wake_put</span>()" So
      question is what shall we do <br>
    </p>
    <p>if <span style="white-space: pre-wrap">xe_force_wake_get() worked but subsequent </span><span
      style="white-space: pre-wrap">xe_force_wake_put() fails ?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite"
      cite="mid:e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com">
      <pre class="moz-quote-pre" wrap="">

what about making the flow more intuitive like this:

bool xe_force_wake_get(fw, d);
void xe_force_wake_put(fw, d);

	if (xe_force_wake_get(fw, d)) {
		...
		xe_force_wake_put(fw, d);
	}

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(&amp;gt-&gt;mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
-
-	return;
-
 err_force_wake:
-	drm_err(&amp;xe-&gt;drm, "Failed to apply, err=%d\n", err);
+	if (err)
+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
+			  sr-&gt;name, err);
+	XE_WARN_ON(xe_force_wake_put(&amp;gt-&gt;mmio.fw, XE_FORCEWAKE_ALL));
 }
 
 /**
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------SxT5E8rNDV1WItart7GIYFoq--
