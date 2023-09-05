Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF2EC83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 16:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892C10E0A2;
	Tue,  5 Sep 2023 16:16:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765010E089
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693930594; x=1725466594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nAYZH/YFKsx9Z0Y0mOM4gRarb5aYBM0iEe8F2w4F68c=;
 b=lywI/yup4a+vXoADzlNaCvrLo/ZbKDPQPbpeZzV7qdhN56ivgWef+CaS
 NwFRhLrkBGp+cmjqx2OuQWXXgTkabFWrRWGE9VHL1O+OdJkZBUZfygVC3
 If3Q4zHFJCfkThvtq1L6mN1VAvsBlIdM1TW/Xj6KexOHh6a0DxH0kqLuc
 XCPjkqQyK2dHQBzyx+wpbPbp5NYrS2PmbbY6o9nrRV5zQGyYBbATtLGKV
 qgPbGTJsu5CXDDN9ay2PF9zRQz5LbpcOgVN2YqS1TOT23CyE9iGste4oB
 +drBHMPGnkjaIK8YcKBawA/kxwc1XyJ8LzZE3yP5iUFCWOf3H2gaZp61A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357145835"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="357145835"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 09:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770367501"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="770367501"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 09:14:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 09:14:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 09:14:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 09:14:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 09:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StS+kEQfxgjtYsbeNs0gI/qEmJHavCvUj8ENxIEoDfhq3h+QcpiqD9EaFXK4SgAMjo0kwrLaYL0J3aLDuUCtrJ1IM1dYXePdbFTXhKJSXcQpyx4UtJV1iBIP9G5oCl54Zw5EnXWrSy8cZ8wB6UJ5Mw/v8Vvx3wWZ59NvE8iorMZZXk6fLAl6MCJHqPC/4aatHqjY+nKX8zZHwEGtrg45wnpXQ85Y+/kU0HPZyRMT033NwGO/TArzdEvYxnAQlaRz9ygKc2ScbMYIGka55r9CBQeqeH+6ixJXclp2C/4Be1bWNiBsG4Q1OudgSIaBcTdlNogz8h3qYGazBEK+G4AG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBaMiJ6jnUtBErhmaveBhQILG1gMhlJMqyfirh7Oqvw=;
 b=V0HiJShrRVHAfV3kLT5THqe/6jdmltCyBuRwage4BtXAdEM4VFEWGEyxk9A47gyEj0CD9s7xafp6WH4MqiHaPp6jplZ0v6JaD4+8dycyXSGxVxkDg+3G/wb4uh2mIT9UgKSuF0jmAzsIQB2jV0xk6bgAiuUZexQktjNgxb6yYXo3Mx4ALD55aItn6DQyO6vpJhR722CteMjV7Nf880p1HKSrKDq0I+Ok10SHENdOkR5zPvv3+NzApnG+AJ3217L+nAt0Dkl7a9spI5Vsp4gIlvfVEajEaBTIq+s/OvWKEF1sVXjdGySLqED8TZK8yy7aJEmZiLog5XgLdpeJzXg8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 16:14:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 16:14:31 +0000
Date: Tue, 5 Sep 2023 09:14:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <pjmqi553bq3szdu7xqyawbijqqhdc6zd74fq5qjo6lmcgoh672@7o5b6xjltwkp>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-2-lucas.demarchi@intel.com>
 <87a5u0d3yk.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5u0d3yk.fsf@mkuoppal-desk>
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: a5805fc0-5852-452e-8d6d-08dbae2b2fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAKJHKo5aagBDMq0c7WZKAx3ih8+XOf6yi2mt04UQcH/a5RbDfynTUcYZbdlbXKw4AaZc22n5V8b+cDj/M726vZZitRH4JuONLpCQMw/bT/mcylqQxt2tfnonkbV7bm0xnJagVzfJ4RWOgORixNREMOYSxHhzPqgxt2xh3JXOoKtJfG+D44oCLPylcCvJEl44OS9QvOVTQj39oo+kNTf/ssQYnSiZT/VN9d/BNZVTMgrZ665XNFxJJZ9Y984izndxe0aPXsyucaA8Z3vYnc/K0dTsW6KizVEEeNMi6tdOpKBkL0cfZM3yRjs7HOwWQdzcqnZNZgH/1nPuWHd3BPeWLNFqHlYOa/O5ojRiO/8AbvBSZsHu0EXgSYDlLxhH/SBiEsE5+0hK2Rdazo8SVdxQVjMWFW4DTlOrFB31Q7zxxXNKEZumAo+a6dqWhI3y98eDQoICjZfD5Uwp3lc88YY8jOTXEuVBqIFG6Vbb14PXMYDJdelYxUqK5UYg/yHiLFa9xvKDLY4lYNoNOWE4c1uOITrQc+MWF07B6E8wVjbHZow9BN3swq8VJ/0UtrXIkEG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199024)(1800799009)(186009)(478600001)(66476007)(66556008)(86362001)(316002)(66946007)(2906002)(6916009)(8936002)(5660300002)(8676002)(4326008)(41300700001)(9686003)(6512007)(38100700002)(83380400001)(26005)(6486002)(33716001)(82960400001)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QVwKPuMNXyUwaXBVkjjhf++TgMRxT0ecqbp5KjWthr3s9JtJr8KLBAGRQVCo?=
 =?us-ascii?Q?oksUYkgt051xM1mCvR77S+DWiKq8Wg/ZFF7Kr3tkZA0KWhVeVjb51vTVHgWd?=
 =?us-ascii?Q?Fhm54e0xsbiS90J/Avyvj+pr+et8GESztOideyZhH3AHovRcsjKlvsxc0sWm?=
 =?us-ascii?Q?mUqlO3mJJlNwSWaS/kVP7uKqfdobRcSHKwqCkbjx9aKzXYPnycJBLvH19BA/?=
 =?us-ascii?Q?0uMTWly5RyiEyLa+OKnqSMENpxzV79tXTdz6WLnCSE7q2S0a7AYf20DbO3Vx?=
 =?us-ascii?Q?g8SC2J3rTGDbJykkdJaSouA74BOxE45Tz1CeL1F7mUE+SkSQbRzk4n9W18Ci?=
 =?us-ascii?Q?UK5MtaS1aABPR1n03yofCtQ60wC838GzedKLLC4HOjkBU/6IedcVf74R8zwJ?=
 =?us-ascii?Q?/jzXBK2tfD7ocA9EU5mjBmF+nhvqC1hb/RAWx6IxX2AV2uYt3slysvYMpB8a?=
 =?us-ascii?Q?/LujdIyJz+ecCcFW0zBMq9isb07KBPZsFEBT+hUUJCGI3B9a+DrLNxgNmAnW?=
 =?us-ascii?Q?KU/JRxAPlBFKJaGD/6WqOgLGTCNQ5BTzKMLptaihBdTswq5tPz+kK/zkNfcS?=
 =?us-ascii?Q?gHdnk4M3o3TJH3kUV/WUmLwtGuoOHXQlDlCO9FivHeKQR9TlzT3UDGxoxSaE?=
 =?us-ascii?Q?XMsVWAZRaUwifOd45nRkx1ieJgrCpLzLYDTYba4cAjmdimT6fCQ5lVpMv49m?=
 =?us-ascii?Q?PKNWXZqQl8a/PxRnOG3ty+BfCvXWCqk1y4PzJrfj8G2CRN2XjQ7By8tJX/yQ?=
 =?us-ascii?Q?zC3ag1He3zT/ZZiVMmjF1OVycqeYSf89phOW1t5nCB0h/Aqc7qDykzz2ZumG?=
 =?us-ascii?Q?KEiGGzNJy33X/BRMe1W9riILYblA9/ZMGIcOQmhyJc51aOvbGQLDQ0ktBrKj?=
 =?us-ascii?Q?U4D3FbPwIS57GDyEpczDtqidbdKg14/FPM8khF2dzJN5IVK5WDWwZSvD3q9C?=
 =?us-ascii?Q?yLGb5a9+kwt7+cDBLd/6fgWFCxraT8yR8IwJrovusid3NgiUp2R5lzsF6nN0?=
 =?us-ascii?Q?gHCzBjkmQJ/ejx+bnWy+DFW3uo7x/BCklHZN0wRY1fXqdIhLQK1BZDpeGf5Y?=
 =?us-ascii?Q?Ec8c7VUlroFYbYfEEyDHJfkvPdJRQElfGGWGl4lGLkhR1MIBOHSiAJhewSUy?=
 =?us-ascii?Q?VS6uZ1NBkcT6brInucfot3wJFCbbT4uLWr2+Suh807y83N1dgPkihr1d7C3Y?=
 =?us-ascii?Q?h22Po7cNgKODeHf/hfr+IvGK8U2YU4AQoKSBJ2yD5JhLvL48GFiOycR8Ot+7?=
 =?us-ascii?Q?s8+CG9eb89dFzMCGI0rzYUZmN0kqwiI5Y2p3fKjx8WQ51fV7utrGNuI0zn9d?=
 =?us-ascii?Q?iohfYyzjc8qCdCYu8InH6RM0EsR8bgKZk+rXcLc75M3iNVJ2hzI9x6zuGuv0?=
 =?us-ascii?Q?tCba5GoFk2ZhTwYg1wi/qh73o2JW7KelTIMy6YyQIZF1/wSgJZVLULNXeU/2?=
 =?us-ascii?Q?0NtCfA8GRADaoBfPuzXymWGpF4kDhyg1E7d4YASY6B8N67ISoYdZFmxLWs/n?=
 =?us-ascii?Q?ATpRnlar97DKKT0vuPVrNrA1wM3UZ6Pbc82FhmHS5G3zkgDsf64t/I8Yzs+z?=
 =?us-ascii?Q?Q2GVprXdNXIhMP4Vsroft2gCsaQ+FsKLhmWTpYzYud7dVPZd5pDknb8Whw+l?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5805fc0-5852-452e-8d6d-08dbae2b2fa1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 16:14:31.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV4C/V0hBsBjfP/xZqR1JPsdopPmX3UEKM0eAFyrwEYM2320z9qPiETqgSw2qqEzYImJHZJ54c1qhanl3GHo5iwG33XXE1JTOK/p9lwcMfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/reg_sr: Simplify check for masked
 registers
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 06:39:31PM +0300, Mika Kuoppala wrote:
>Lucas De Marchi <lucas.demarchi@intel.com> writes:
>
>> For all RTP actions, clr_bits is a superset of the bits being modified.
>> That's also why the check for "changing all bits" can be done with
>> `clr_bits + 1`. So always use clr_bits for setting the upper bits of a
>> masked register.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c    | 8 ++++----
>>  drivers/gpu/drm/xe/xe_rtp_types.h | 5 ++++-
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 7c88352636d2..264520015861 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -153,15 +153,15 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>>  	u32 val;
>>
>>  	/*
>> -	 * If this is a masked register, need to figure what goes on the upper
>> -	 * 16 bits: it's either the clr_bits (when using FIELD_SET and WR) or
>> -	 * the set_bits, when using SET.
>> +	 * If this is a masked register, need to set the upper 16 bits.
>> +	 * Set them to clr_bits since that is always a superset of the bits
>> +	 * being modified.
>>  	 *
>>  	 * When it's not masked, we have to read it from hardware, unless we are
>>  	 * supposed to set all bits.
>>  	 */
>>  	if (reg.masked)
>> -		val = (entry->clr_bits ?: entry->set_bits) << 16;
>> +		val = entry->clr_bits << 16;
>
>Makes sense but should we consider also making sure in the
>setup side that the set_bits stays withing low if masked is set.
>So that we dont accidantally trample the upper parts.
>
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -80,6 +80,9 @@ static bool compatible_entries(const struct
>xe_reg_sr_entry *e1,
>        if (e1->reg.raw != e2->reg.raw)
>                        return false;
>
>+       if (e1->reg.masked != e2->reg.masked)
>+               return false;

this is covered by the check above. The raw member is a union that
covers the entire register - address, masked, mcr.

>+
>        return true;
>         }
>
>@@ -104,6 +107,14 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>                        goto fail;
>                                        }
>
>+               if (XE_WARN_ON(e->reg.masked &&
>+                              upper_32_bits(e->clr_bits |
>+                                            e->set_bits |
>+                                            e->read_mask))) {
>+                       ret = -EINVAL;
>+                       goto fail;
>+               }

yeah, we can add something like that in a separate patch. I'm also
thinking on renaming s/clr_bits/mod_bits/ to make sure it's captured
that those bits are always a superset of set_bits.

Lucas De Marchi

>+
>                pentry->clr_bits |= e->clr_bits;
>
>Something like this?
>
>-Mika
>
>
>>  	else if (entry->clr_bits + 1)
>>  		val = (reg.mcr ?
>>  		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index d170532a98a5..637acc7626a4 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -22,7 +22,10 @@ struct xe_gt;
>>  struct xe_rtp_action {
>>  	/** @reg: Register */
>>  	struct xe_reg		reg;
>> -	/** @clr_bits: bits to clear when updating register */
>> +	/**
>> +	 * @clr_bits: bits to clear when updating register. It's always a
>> +	 * superset of bits being modified
>> +	 */
>>  	u32			clr_bits;
>>  	/** @set_bits: bits to set when updating register */
>>  	u32			set_bits;
>> --
>> 2.40.1
