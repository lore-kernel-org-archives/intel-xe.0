Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B3E77173
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 09:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B9110E69C;
	Mon,  9 Dec 2024 09:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXciMCEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400410E69C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733737488; x=1765273488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9slz7nEOGvKD7tQ2gASJ7/A/cgw378zMefKEjlaY7fk=;
 b=kXciMCEvMNva2W1CzTlxuAF8MTHioERtiHxku5u20f9j6nTu/NomGz2N
 gA/JUY42DRGEAc95mqGRuslo6NqaTj+9WrIRa/UrWZxwJxHX4ywaSV1vP
 uS1hJmVxNbUPVCeeF0oaO70FTisI11po1eeKIJNLEUT2u7v/NRLDkP5xw
 wqSGXv7NpwefHB9tfd3scWWrS0BBBw9EdkNgm0admswBHR9jNeZf25InU
 ofQIpmwFbD3S895cqWOFcE47TlODhMLZAOCSyjlFImq5nzAHp9u5geF/F
 wclHLObUgLX+/owLn98TKdHsXZCbcYaVP/JVThzivPwUUozYh1vDYjgnr A==;
X-CSE-ConnectionGUID: a7m7p50vSMqaPcA1QzKRZQ==
X-CSE-MsgGUID: xufg237OSsSodlt8GeA20g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33368866"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33368866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 01:44:48 -0800
X-CSE-ConnectionGUID: c4ViaBIATOaPgfV/Nl5KJQ==
X-CSE-MsgGUID: cg2srym5Tt6Bs0tuFiG75w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="125868343"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.23])
 ([10.246.0.23])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 01:44:45 -0800
Message-ID: <d083b661-04ee-4201-8962-480a093924a2@linux.intel.com>
Date: Mon, 9 Dec 2024 10:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't apply Wa_22019338487 for VF
To: Matt Roper <matthew.d.roper@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
 <20241205181814.1484975-3-jakub1.kolakowski@intel.com>
 <20241205210436.GH3224633@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241205210436.GH3224633@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 12/5/2024 10:04 PM, Matt Roper wrote:
> On Thu, Dec 05, 2024 at 06:18:14PM +0000, Jakub Kolakowski wrote:
>> Don't use Wa_22019338487 for VF.
> 
> Would it make sense to add some kind of "PFONLY" RTP action that can be
> applied to workaround definitions that should only apply when running on
> the PF and not on the VF?  Then we could just add that flag to this
> workaround in xe_wa_oob.rules and we wouldn't need to change the
> callsite(s) where XE_WA is invoked.
> 
> I'm not sure how common PF-only (or VF-only for that matter) workarounds
> are going to be going forward.
> 
> 
> Matt
> 

As first step I would add something like NOT VF,
that should better handle the case SR-IOV is disabled.

So adding a helper to xe_rtp.c:

bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
                               const struct xe_hw_engine *hwe)
{
        return !IS_SRIOV_VF(gt_to_xe(gt));
}

and updating rules:

  22019338487    MEDIA_VERSION(2000)
                 GRAPHICS_VERSION(2001)
-               MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+               MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), 
FUNC(match_not_sriov_vf)

It looks the rules on each line are ORed, so here the generated output is:

{ XE_RTP_NAME("22019338487"),
   XE_RTP_RULES(MEDIA_VERSION(2000), OR,
         GRAPHICS_VERSION(2001), OR,
         MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), 
FUNC(match_not_sriov_vf)) }

--
marcin

>>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com>
>> Cc: Narasimha C V <narasimha.c.v@intel.com>
>> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 05154f9de1a6..11aba2437818 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -238,7 +238,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>   	if (ggtt->size > GUC_GGTT_TOP)
>>   		ggtt->size = GUC_GGTT_TOP;
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270)
>> +	if (GRAPHICS_VERx100(xe) >= 1270 && !IS_SRIOV_VF(xe))
>>   		ggtt->pt_ops = (ggtt->tile->media_gt &&
>>   			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
>>   			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
>> -- 
>> 2.25.1
>>
> 

