Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455FC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B197610E230;
	Thu, 30 May 2024 21:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWKwOSWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0C210E230
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 21:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717104648; x=1748640648;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=4d1RrrbSsBMCHxjD6Y3UzBSfuVZbB6eY/IaOmHBsp80=;
 b=FWKwOSWKjCHQsui5ExL4Ck21Jr3ReuKAYiZMgEUp+dyfZGjYileGldWa
 bsDbcM455SiL6x0PjDdDuFOTJ4vXFnbL/FAr31BovBpoUzFO0nuBU8k4K
 OmsxGxIJKVztGTWu1u1gBooVdbbocFamtjUulfppMkv0tT9GOuUqWytVh
 YH3lPKuY8dS9Ti2je905gGn9OL7yaH4CxO1LAyCbTQ/bVKcfEcCqBazWL
 p1VSvaOQibPbsZLU7PjPxYaJqGm3OjDjhLOhflQ+vKSGHbKjO+coCDuoy
 U3+R8Dwz58qwLM2xjgheUQkyOShxC55fKFYJmJFkeMo2mpP2GV1jPG1M1 A==;
X-CSE-ConnectionGUID: 6b7PsKkKRvGPdPe24V6b/A==
X-CSE-MsgGUID: LviuSAkITxekV0zI22go2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24186428"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208,217";a="24186428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:30:47 -0700
X-CSE-ConnectionGUID: 3RHTSwPcTXWUa3zE/61fPQ==
X-CSE-MsgGUID: L7QcqvoOTV67OfEOQp7J/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208,217";a="35882934"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.252.131])
 ([10.94.252.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:30:46 -0700
Content-Type: multipart/alternative;
 boundary="------------91oG0jb2701eGj7WdO3FVzMu"
Message-ID: <15f0b8c1-4dc5-4584-9c39-0822017509e2@linux.intel.com>
Date: Thu, 30 May 2024 23:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
 <f5171a4f-5722-45a9-884a-45f006d507c2@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <f5171a4f-5722-45a9-884a-45f006d507c2@intel.com>
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
--------------91oG0jb2701eGj7WdO3FVzMu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Himal,

On 5/30/2024 10:47 AM, Ghimiray, Himal Prasad wrote:
>
>
> On 28-05-2024 15:41, Nirmoy Das wrote:
>> xe_force_wake_get() can return error so check it's return value
>> before reading gpu_timestamp value.
>>
>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 4a19b771e3a0..0c13395ffd34 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   	struct xe_gt *gt;
>>   	struct xe_hw_engine *hwe;
>>   	struct xe_exec_queue *q;
>> -	u64 gpu_timestamp;
>> +	u64 gpu_timestamp = 0;
>>   
>>   	xe_pm_runtime_get(xe);
>>   
>> @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   		if (!hwe)
>>   			continue;
>>   
>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>
> This is becoming continuous efforts. How about introducing 
> __must_check to xe_force_wake_get ?
>
Yes, this is a good idea.
>
>
>> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>> +			break;
>> +
>>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>
> Handle any errors that may occur if xe_force_wake_put fails, possibly 
> XE_WARN_ON.
>
Will add that.


Regards,

Nirmoy

>
>>   		break;
--------------91oG0jb2701eGj7WdO3FVzMu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Himal,<br>
    </p>
    <div class="moz-cite-prefix">On 5/30/2024 10:47 AM, Ghimiray, Himal
      Prasad wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f5171a4f-5722-45a9-884a-45f006d507c2@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 28-05-2024 15:41, Nirmoy Das
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E"
        href="mailto:lucas.demarchi@intel.com" moz-do-not-send="true">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E"
        href="mailto:nirmoy.das@intel.com" moz-do-not-send="true">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..0c13395ffd34 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_gt *gt;
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
-	u64 gpu_timestamp;
+	u64 gpu_timestamp = 0;
 
 	xe_pm_runtime_get(xe);
 
@@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);</pre>
      </blockquote>
      <p>This is becoming continuous efforts. How about introducing
        __must_check to  <span style="white-space: pre-wrap">xe_force_wake_get ?</span></p>
    </blockquote>
    Yes, this is a good idea.<br>
    <blockquote type="cite"
      cite="mid:f5171a4f-5722-45a9-884a-45f006d507c2@intel.com">
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+			break;
+
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);</pre>
      </blockquote>
      <br>
      <p>Handle any errors that may occur if xe_force_wake_put fails,
        possibly XE_WARN_ON.<br>
      </p>
    </blockquote>
    <p>Will add that.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:f5171a4f-5722-45a9-884a-45f006d507c2@intel.com">
      <p> </p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap=""> 		break;
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------91oG0jb2701eGj7WdO3FVzMu--
