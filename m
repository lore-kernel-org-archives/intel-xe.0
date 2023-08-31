Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85738C83F29
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 04:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D1910E036;
	Thu, 31 Aug 2023 04:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803B510E036
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 04:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693454736; x=1724990736;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=0Z2zujOfg2w0yxEJwf6sID0oYCls/xA6wzrb3tHl99o=;
 b=Bq24KyTPlsy+C86xQH83yPy0ZkAJD0aYuq+b8U3uu9oqGyLc5GIIPEjm
 NWPjjYG43tFkzMxvIEHkkDOtBhXo/eV+97cuk7MKdyfYhdhtTuZEj9SUT
 HB6vInOGaCDmMKBDvtfYKmQEP9llVyd8zYnSwb7LQGVMzRWwpToy5hrA4
 aJwf4EChi5FtdmWQ8ohAR8hUMrXBv4oZiX2gpAT7SOA6akQ+R+C2achix
 m1oDvmdW6vUtLylEui8HxRLK/5fo5kYHwrMgsxLhaljFXSQriRafGP3lc
 1vpEUMHQB62dGg+gIqRNj2tiiOWSQyhb6JHmci1HFXV0Z6WJU2pZMq32/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442166030"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
 d="scan'208,217";a="442166030"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 21:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862866403"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
 d="scan'208,217";a="862866403"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 21:05:34 -0700
Content-Type: multipart/alternative;
 boundary="------------czFrZRS0JHIMuGWZL0V6lDej"
Message-ID: <a805ff93-2a30-7f5a-de95-fdc2eea23027@linux.intel.com>
Date: Thu, 31 Aug 2023 09:43:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-3-aravind.iddamsetty@linux.intel.com>
 <87cyz514dt.wl-ashutosh.dixit@intel.com> <ZO+tGbmexPz6sI30@intel.com>
 <87bkeo18df.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87bkeo18df.wl-ashutosh.dixit@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Use spinlock in forcewake
 instead of mutex
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------czFrZRS0JHIMuGWZL0V6lDej
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 31/08/23 03:49, Dixit, Ashutosh wrote:

> On Wed, 30 Aug 2023 13:56:57 -0700, Rodrigo Vivi wrote:
>> On Tue, Aug 29, 2023 at 10:33:02PM -0700, Dixit, Ashutosh wrote:
>>> On Tue, 29 Aug 2023 22:15:43 -0700, Aravind Iddamsetty wrote:
>>> Hi Aravind,
>>>
>>>> @@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>>> 				   domain->id, ret);
>>>> 	}
>>>> 	fw->awake_domains |= woken;
>>>> -	mutex_unlock(&fw->lock);
>>>> +	spin_unlock(&fw->lock);
>>> No need to change anything yet, but let's get some more opinion on this: is
>>> it ok to (a) just replace the mutex with a spinlock in these force_wake
>>> functions, or, (b) should we have a second set of functions to be called in
>>> atomic context, say: xe_force_wake_get/put_atomic? So we should use (b) in
>>> atomic contexts and everywhere else we just continue to use the previous
>>> set of non-atomic functions? Or just converting the default set of
>>> functions to use spin lock (as is done in this patch) is ok?
>> It looks okay to me,
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Still thinking about this, maybe some time (not part of this series) we
> should do a power measurement comparison between mutex and spinlock and see
> if there's an appreciable difference (unless we already know?). But till we
> do that, this is fine, so this is also:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks Rodrigo and Ashutosh for your r-b.

Regards,

Aravind.

--------------czFrZRS0JHIMuGWZL0V6lDej
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 31/08/23 03:49, Dixit, Ashutosh wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:87bkeo18df.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 30 Aug 2023 13:56:57 -0700, Rodrigo Vivi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Tue, Aug 29, 2023 at 10:33:02PM -0700, Dixit, Ashutosh wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, 29 Aug 2023 22:15:43 -0700, Aravind Iddamsetty wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Hi Aravind,

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">@@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
				   domain-&gt;id, ret);
	}
	fw-&gt;awake_domains |= woken;
-	mutex_unlock(&amp;fw-&gt;lock);
+	spin_unlock(&amp;fw-&gt;lock);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
No need to change anything yet, but let's get some more opinion on this: is
it ok to (a) just replace the mutex with a spinlock in these force_wake
functions, or, (b) should we have a second set of functions to be called in
atomic context, say: xe_force_wake_get/put_atomic? So we should use (b) in
atomic contexts and everywhere else we just continue to use the previous
set of non-atomic functions? Or just converting the default set of
functions to use spin lock (as is done in this patch) is ok?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
It looks okay to me,
Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Still thinking about this, maybe some time (not part of this series) we
should do a power measurement comparison between mutex and spinlock and see
if there's an appreciable difference (unless we already know?). But till we
do that, this is fine, so this is also:

Reviewed-by: Ashutosh Dixit <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks Rodrigo and Ashutosh for your r-b.</pre>
    <pre>Regards,</pre>
    <pre>Aravind.
</pre>
    <blockquote type="cite"
      cite="mid:87bkeo18df.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------czFrZRS0JHIMuGWZL0V6lDej--
