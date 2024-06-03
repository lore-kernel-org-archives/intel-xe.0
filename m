Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D235C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA310E3D0;
	Mon,  3 Jun 2024 19:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HspuFefI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814BA10E3D0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717444288; x=1748980288;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=QLL0gKy4EaEBNV9QSi3RudDC8bO1Vv1tVmCl8O92+ew=;
 b=HspuFefIIJDIJSnJBVrjGgkMJcjMpL+0bh90PfmnsP9yMKIRmDYqCBc4
 2xoi0/6dp964vjuQWss7zCDDMvppEGpL1+NR9HKO+ar4NSkKJqANMug6a
 0YYNtkv/uOW0T5Y+O+MP4jlgs6hZnVyFqVG9ml/1ZCoTvV797kyRdU7Bs
 CbGSzZOFdD2gms1z+PKGoodZqRfUxyjelWwrbfqFLnfcgp4ZhpCo5Dmfg
 eXEN4MPkJtVcd/Yn1HtLJW2o866U0+WaGo5MF9NxSQhHrsVr9UfticlaY
 5LSa8Z26eZ5gOevMiHahIMJdUJLNsOM4CdMOcKKQXMs8kK93UmkTSKfZn w==;
X-CSE-ConnectionGUID: RE0JrWoCTq6Q+C9sQL4Cgw==
X-CSE-MsgGUID: 8IeACocOQdegIiCNnn7yUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="36477713"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208,217";a="36477713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:51:23 -0700
X-CSE-ConnectionGUID: 504pFcE8Sq+1GukiVyBnrw==
X-CSE-MsgGUID: RYKUmlpETLOsWYSvkhIfjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208,217";a="41409028"
Received: from tsessler-mobl.ger.corp.intel.com (HELO [10.246.51.46])
 ([10.246.51.46])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:51:22 -0700
Content-Type: multipart/alternative;
 boundary="------------MNy0HV0g3lroVfz0B7Ifo62q"
Message-ID: <c79480d4-7576-4b88-b5e1-e73db34d3c1c@linux.intel.com>
Date: Mon, 3 Jun 2024 21:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use missing lock in relay_needs_worker
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240603081723.18775-1-nirmoy.das@intel.com>
 <452de901-f35e-49df-8e5f-c4ce676ece0b@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <452de901-f35e-49df-8e5f-c4ce676ece0b@intel.com>
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
--------------MNy0HV0g3lroVfz0B7Ifo62q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 6/3/2024 4:19 PM, Michal Wajdeczko wrote:
>
> On 03.06.2024 10:17, Nirmoy Das wrote:
>> Add missing lock that is protecting relay->incoming_actions.
> good catch!
>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_relay.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
>> index c3bbaf474f9a..ade6162dc259 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
>> @@ -761,7 +761,14 @@ static void relay_process_incoming_action(struct xe_guc_relay *relay)
>>   
>>   static bool relay_needs_worker(struct xe_guc_relay *relay)
>>   {
>> -	return !list_empty(&relay->incoming_actions);
>> +	bool is_empty;
>> +
>> +	spin_lock(&relay->lock);
>> +	is_empty = list_empty(&relay->incoming_actions);
>> +	spin_unlock(&relay->lock);
>> +
>> +	return !is_empty;
>> +
>>   }
> alternate solution could be to just rely on the new return value from
> relay_process_incoming_action() that could tell us if there was nothing
> to dequeue so then we wont start new worker (at potential cost of one
> extra worker cycle to see that), but this LGTM too, so
>
> Reviewed-by: Michal Wajdeczko<michal.wajdeczko@intel.com>

I did spent some time modifying relay_process_incoming_action() to 
return a bool but I am not sure which one is better.

I will for now pick this one :)


Thanks,

Nirmoy

--------------MNy0HV0g3lroVfz0B7Ifo62q
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
    <div class="moz-cite-prefix">On 6/3/2024 4:19 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:452de901-f35e-49df-8e5f-c4ce676ece0b@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 03.06.2024 10:17, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add missing lock that is protecting relay-&gt;incoming_actions.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
good catch!

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index c3bbaf474f9a..ade6162dc259 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -761,7 +761,14 @@ static void relay_process_incoming_action(struct xe_guc_relay *relay)
 
 static bool relay_needs_worker(struct xe_guc_relay *relay)
 {
-	return !list_empty(&amp;relay-&gt;incoming_actions);
+	bool is_empty;
+
+	spin_lock(&amp;relay-&gt;lock);
+	is_empty = list_empty(&amp;relay-&gt;incoming_actions);
+	spin_unlock(&amp;relay-&gt;lock);
+
+	return !is_empty;
+
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
alternate solution could be to just rely on the new return value from
relay_process_incoming_action() that could tell us if there was nothing
to dequeue so then we wont start new worker (at potential cost of one
extra worker cycle to see that), but this LGTM too, so

Reviewed-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a></pre>
    </blockquote>
    <p>I did spent some time modifying <span
      style="white-space: pre-wrap">relay_process_incoming_action</span>()
      to return a bool but I am not sure which one is better.</p>
    <p>I will for now pick this one :) <br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:452de901-f35e-49df-8e5f-c4ce676ece0b@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------MNy0HV0g3lroVfz0B7Ifo62q--
