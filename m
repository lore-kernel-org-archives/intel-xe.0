Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA0C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 20:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EF010E942;
	Wed, 18 Jun 2025 20:30:29 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9A710E942
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 20:30:27 +0000 (UTC)
Message-ID: <54da7017-79c1-465f-967c-c649d3afb4c1@lankhorst.se>
Date: Wed, 18 Jun 2025 22:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] drm/xe/gt: Inline gt_fw_domain_init
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250617180132.7059-11-dev@lankhorst.se>
 <20250617180132.7059-17-dev@lankhorst.se>
 <dt4on4rh7lx5bb3nqsjvhbbtau56w7az4fvwwo2rmfn7afrj7w@oajeptn6izes>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <dt4on4rh7lx5bb3nqsjvhbbtau56w7az4fvwwo2rmfn7afrj7w@oajeptn6izes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 2025-06-18 21:38, Lucas De Marchi wrote:
> On Tue, Jun 17, 2025 at 08:01:39PM +0200, Maarten Lankhorst wrote:
>> Have only a single init function for whole of GT to keep things
>> readable.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c | 100 +++++++++++++++++--------------------
>> 1 file changed, 45 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 98360986df7db..1b239d185fc93 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -440,59 +440,6 @@ static void dump_pat_on_error(struct xe_gt *gt)
>>     xe_pat_dump(gt, &p);
>> }
>>
>> -static int gt_fw_domain_init(struct xe_gt *gt)
> 
> I think the main issue with this function is actually the name. It seems
> to be "initializing the fw domain" when it's actually "doing the
> initialization part that depends on GT forcewake".
> 
> s/gt_fw_domain_init/gt_init_with_gt_forcewake()/
> s/all_fw_domain_init/gt_init_with_all_forcewake()/
> 
> Lucas De Marchi
Yeah, but the nice thing about having a single function for gt_init() is that it became more clearer what was happening during init, with a linear flow. I think there is still a benefit in readability for having a single gt_init function.

Oh well, I'll rename those functions instead, that should work too!

Kind regards,
Maarten
