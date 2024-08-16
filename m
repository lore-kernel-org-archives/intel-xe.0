Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E33C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 14:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3E10E7A5;
	Fri, 16 Aug 2024 14:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0r5M/ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2553D10E7A5
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723817572; x=1755353572;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=7FRMh5+/rMOU7A0yLfxjW26RdVaOlhvNAygy3LptfFI=;
 b=n0r5M/ffLvsxg7qUtVfbknyRjtDZWEIIMrAYkK5LgKmPrwQ4A5tYbiTF
 NKIxxJIrb7l5HSeYkbF9GEK232NyLY1D48Mgs8sgWo8WN2DxQ862XKleT
 Mz1cxfzdfIPdmIjJ/k89OWz6lw7s/LwehJ7VUCm9lsc1v5DwPfTYqnemn
 zPScrtSaW/1+shpumpCSmPxyAa1bbAiCxdj+lk/vqXw7TX29/gHyGbNyQ
 AnOcQJOToYP5XpmrICSJ8g3XnKE88vhmZrpA+2QBgOTe1qiOnVJqPlhO6
 HsnpOeWvvx03/8RToSptXQ9TGNFdZPDR6ONfdrRPcfcAoiqbYk2a6EncQ g==;
X-CSE-ConnectionGUID: RgulUwpQRraEcEBu/2NGOQ==
X-CSE-MsgGUID: Jbpla0E+Ru6E8rGZ+AkGKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39626977"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208,217";a="39626977"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:12:52 -0700
X-CSE-ConnectionGUID: 2Nuc8imLRJKegcLFNhILsQ==
X-CSE-MsgGUID: W+C9PHVxQw+vCDfYMN9wlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208,217";a="90414855"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.109])
 ([10.245.146.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:12:51 -0700
Content-Type: multipart/alternative;
 boundary="------------fOJ0R00DEZEQgqfpJsKj0lvY"
Message-ID: <42f3736c-8611-4b8f-b24e-b803474cfaf7@linux.intel.com>
Date: Fri, 16 Aug 2024 16:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
References: <20240816080355.897256-1-apoorva.singh@intel.com>
 <Zr9bjsY8zcnciW0M@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zr9bjsY8zcnciW0M@intel.com>
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
--------------fOJ0R00DEZEQgqfpJsKj0lvY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/2024 4:00 PM, Rodrigo Vivi wrote:
> On Fri, Aug 16, 2024 at 01:33:55PM +0530,apoorva.singh@intel.com wrote:
>> From: Apoorva Singh<apoorva.singh@intel.com>
>>
>> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>>    its already been taken care of in xe_lrc_init().
> I'm afraid this is not a good reason.
> This snapshot capture is coming from other places and apparently
> with risks of paths where bo was already freed?!


I didn't think about it while suggesting this while reviewing 
https://patchwork.freedesktop.org/patch/608210/?series=137289&rev=1

If the bo is null then we will hit NPD while doing xe_lrc_ggtt_addr() in 
the next like. so I guess it should be then

if (lrc->bo) {

snapshot->context_desc = xe_lrc_ggtt_addr(lrc);

snapshot->lrc_bo = xe_bo_get(lrc->bo);

....

}


Regards,

Nirmoy

>
> why is this check bothering you so much?
>
>> Signed-off-by: Apoorva Singh<apoorva.singh@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 974a9cd8c379..aec7db39c061 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>   	if (!snapshot)
>>   		return NULL;
>>   
>> -	if (lrc->bo && lrc->bo->vm)
>> +	if (lrc->bo->vm)
>>   		xe_vm_get(lrc->bo->vm);
>>   
>>   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>> -- 
>> 2.34.1
>>
--------------fOJ0R00DEZEQgqfpJsKj0lvY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/16/2024 4:00 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Zr9bjsY8zcnciW0M@intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Aug 16, 2024 at 01:33:55PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:apoorva.singh@intel.com">apoorva.singh@intel.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Apoorva Singh <a class="moz-txt-link-rfc2396E" href="mailto:apoorva.singh@intel.com">&lt;apoorva.singh@intel.com&gt;</a>

- lrc-&gt;bo NULL check is not needed in xe_lrc_snapshot_capture() as
  its already been taken care of in xe_lrc_init().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm afraid this is not a good reason.
This snapshot capture is coming from other places and apparently
with risks of paths where bo was already freed?!</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I didn't think about it while suggesting this while reviewing
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/608210/?series=137289&amp;rev=1">https://patchwork.freedesktop.org/patch/608210/?series=137289&amp;rev=1</a></p>
    <p>If the bo is null then we will hit NPD while doing <span
      style="white-space: pre-wrap">xe_lrc_ggtt_addr() in the next like. so I guess it should be then</span></p>
    <p><span style="white-space: pre-wrap">if (lrc-&gt;bo) {</span></p>
    <p><span style="white-space: pre-wrap">	snapshot-&gt;context_desc = xe_lrc_ggtt_addr(lrc);
</span></p>
    <p><span style="white-space: pre-wrap">	snapshot-&gt;lrc_bo = xe_bo_get(lrc-&gt;bo);</span></p>
    <p><span style="white-space: pre-wrap">....
</span></p>
    <p><span style="white-space: pre-wrap">}
</span></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:Zr9bjsY8zcnciW0M@intel.com">
      <pre wrap="" class="moz-quote-pre">

why is this check bothering you so much?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Apoorva Singh <a class="moz-txt-link-rfc2396E" href="mailto:apoorva.singh@intel.com">&lt;apoorva.singh@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..aec7db39c061 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc-&gt;bo &amp;&amp; lrc-&gt;bo-&gt;vm)
+	if (lrc-&gt;bo-&gt;vm)
 		xe_vm_get(lrc-&gt;bo-&gt;vm);
 
 	snapshot-&gt;context_desc = xe_lrc_ggtt_addr(lrc);
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------fOJ0R00DEZEQgqfpJsKj0lvY--
