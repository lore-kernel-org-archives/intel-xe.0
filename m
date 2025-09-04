Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBB2CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590110E35C;
	Thu,  4 Sep 2025 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDyY4AXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE8310E35C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757013955; x=1788549955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WXNeKZELEL+KTx/GjsW2rbBlUM2kngqvSv36UVIbRuw=;
 b=SDyY4AXzUMAofiUiUtNk9XloG/EFEwI+dkGT18BJqayvveKc94OH2PxV
 pP58M7oYwvRLL0EoQrXN7J7+cQuq56TXsBAGKVdCi86GoGr6ZIzlIpiUs
 NYhf3TMhOm1SmWmMdzPckF25WbNOjuJDL+6Kj8B/qTdF9UKbqRaKYpn0M
 BrFRq5Z9MXK4oOCDHNf5YCUxchJyXz9tN65IARgHZ5NOThPCeoC1GRbjY
 U1dFFq2dQW1Mlqqpi5eDhU+d/zUkSvqIPuwk555luMZlMA5vxtHh2i6PE
 TLcZ7KQlXIV255+sNDjsNN5i00nWFyMWICn5JqB/SVDDWMeBca8Gea4vf Q==;
X-CSE-ConnectionGUID: 3ZHERO+kTTWAVGCBtZICuQ==
X-CSE-MsgGUID: INWaSfyUSg2etrsJHcT1FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76820626"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="76820626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:25:55 -0700
X-CSE-ConnectionGUID: Q+HPUG3jTqm7QofYS+Tw5g==
X-CSE-MsgGUID: qdesSn7NQZSlGOCjWZLzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="176323383"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:25:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:25:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 12:25:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.75)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT7Pf1MrBZh6d8OBR77C4K2qeG0vjdeKFlq9I3Y1ZNCkpbdnweEKLaBmINd0iGOoWrZSzTEIQaeWmkfZ0LX63PD0/u+9spQfA20SXu6lN0ZNRP2/n+Kks5qR4151yGG3rHgNYb0V92eVFZK+bSUMK4ZYkXEDTOdJMidRU2vmhTEtQfXSzNFe7KSgDm11xVWvHejVN+bU5v5IgjZWalBk4kt16dEudsQFM/B/z/kKOtW+RqqiuG1SXOtPG0Jvew07zzDNpX7gqK7OJWqXEN917rEtu6Y1AYa4wzxULx1pMcX/bQpjArLjrWM47bxCcA7cKw34wArmza9SPN9skgaJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AZaSuYmwzNRslUdqTjQ0/LqVODYPXsTkKrZgkKo5qc=;
 b=I4nmiVydOkb3Yf5vK1RdTvjg4w6m0/o+8BZk/5PPiUkO45kxfUuqjhDtC0LuFgFW80erGfZp886x+0N46/ZGg7LLXhMUwJBP2brSW77ADurfSo3Xn1M530jSBDszJWAHe0NI+Rc+dRccl2K6i1BHCwMgTRwIJB+wBk9UwmaT7lH+XMhajls3p6xkVjx5IfhRPGak0MImMkY4mIJNxK0NvpYeinxv7/RglpnXSmYxUKzudXM0TIt78YeEIKNA4awdlq6R6ZjUmP8zirYaPZ9mMGDQy8Vz937ORfeaYr5jmaXmuraxjfBJj28MAd7Yj4fcpjbchew4zYS2FnOQGA8ThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 19:25:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 19:25:50 +0000
Date: Thu, 4 Sep 2025 14:25:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <michal.wajdeczko@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
Message-ID: <fo5kov3iphyud4rs65gj36qnf7ofnpak2c35fsjglx2pmjbtyc@it77uc5auxic>
References: <20250731220143.72942-2-jonathan.cavitt@intel.com>
 <20250904185919.GB5752@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250904185919.GB5752@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5e4490-788b-47d2-246b-08ddebe8db92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kxzp5GHHP0WPPf/iBckE5RXReQEKAUiVVZQ10c9Uo2H1YrfjaLBrEzSAHC78?=
 =?us-ascii?Q?9fZxTu08NbktdbFF19X8qIgiEzPW8QH2XtNKdser8mXnZtCY6OMrfnbxg5Mq?=
 =?us-ascii?Q?yJxsSJsZ8SncAU9yghad+amNDBQjECZVakDUsGuhi0VpxD+kuVoOytwydsmL?=
 =?us-ascii?Q?0atczGTK2khAwKSuauQNQ9ROO7Skv5IvFsjjEOGcrvJlDNS0F9fUhZG4zBNO?=
 =?us-ascii?Q?5G/YeAsxcOzxPRD47VWQRqf8rWz0lgG1oTlIOiZwbg8PlBpuiOnaRisnRX3U?=
 =?us-ascii?Q?TFQBb6GLLvtRESY7HAoyOEf686f/xw0Te0EaCKGfHuSZcu6XVnenXReb9neL?=
 =?us-ascii?Q?ssjmQUbRduMWb8Vyxkx47rmAnXz0R5eQaDNItRCRlKjvZfpJn2I5gIgUW4SM?=
 =?us-ascii?Q?Xfw86hrExHS0H5PXJBPCeA2KE9gyWezFDx/jVBjNtK3erJPC9841cYvWONLF?=
 =?us-ascii?Q?MeB25TFpzwXJMyHH4FbwzHFd5gCr3zLUbMtvWplxr9G1QhfWUTh4X2ck4by1?=
 =?us-ascii?Q?jmCJyUJa7dCSdAY7G1vwj1Hqz8jH9bjNCYh1Rx9a30BJStbIhy2nU1lIDKGN?=
 =?us-ascii?Q?Vo4Y8K+wZBQK+3focl3ig+nCzIm520ErOFZ5ucTE+LFh3nfHE116+T64Gckv?=
 =?us-ascii?Q?Guqw54x7N63eOFo8rGxNZVxIaUN8ybJdJe4bSTpGqBtdPUlI97uqoF/zaWUW?=
 =?us-ascii?Q?plmw2vAxBVOb2XDCtWJLY6PqAE7fVBBTpoNyjzRisqbGQtS+vBrSO+7L+b/J?=
 =?us-ascii?Q?GISM1o9aM0gXV7Hoal3c5gcPgSeFfieMPkICtbDJPXsEo3iZ0HrhoTC4DNh2?=
 =?us-ascii?Q?st/AgKIe3XPsvc4X2fOQEQL768xAX85Wn6AYsgy6XXF8kCI43oXiQje9aHmU?=
 =?us-ascii?Q?3rQ+SYuga8+R8A+Hwp+3I/5gIcuswYW/5ae1fu03jQzAy+/AweaCdMVt8M8h?=
 =?us-ascii?Q?WdzKP0HfH4wDVuGae7Ai0L18PvGtDE4L9mcwoz+6azl844MW6uVe0YzwWNQP?=
 =?us-ascii?Q?ysO3fHaN6a5wsDhGNLDHjaUVvE/jxmgcnT+ib/HCz3CX7VWpUdN5OQfRVPhM?=
 =?us-ascii?Q?QlneQyYJ/NVm6ootrhjA8viMATM49pjXZgtfsHu0cQFlFbG9I02sj4eXNg6G?=
 =?us-ascii?Q?duDuP+HWODQAStFjFY9g+lIP9eQbym3TFGzq+Yv9MGRgSwvWuDhKm98rpd57?=
 =?us-ascii?Q?LxUt1rwgXN+RHBiQl9+Bc9f3ng//zonK6dwm6vF/fDh8nXrbQOIsMh+htgdK?=
 =?us-ascii?Q?6nntHDk31xUrduZe4ScdSRVLCRPJdEVzcAU5qGkB6nmf074MWuNxMUIOxJP8?=
 =?us-ascii?Q?2MDkjDie3ycDG0jYsJUvz/WR+pNE8B7m43NCIHLNJMr4h4f9ruzkllJ9dnFU?=
 =?us-ascii?Q?3DJNa/gifu1vpRZg7XiZYioNWUke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmLtHL+E1NbyRpLnRVDYuDg79mY+cXAffJWkISad8pHX7nEmSChyqB839Ecg?=
 =?us-ascii?Q?e3u+mcjCSXeqyc7OKJHI0GLpty/bRacijIuCXcH+5hgrMKBo8SC9kyMNY1b+?=
 =?us-ascii?Q?voMFgyL4lsLHp2xIKN8MGQfOzoKuAMpqCIVDOcRhkD56i9RYQ+5zzYp3ki9s?=
 =?us-ascii?Q?EcoG/KlzaQX84AHuaouaNg8OZqiQAkwgASJn5/YRyt+MEUy2rU5BDeeN4J1X?=
 =?us-ascii?Q?d5Ku+iB2s+kh8eWw4B2c+nu/mlpXHFKYf0s77sKsOlSBh32vTYTClU5IXHcj?=
 =?us-ascii?Q?PmzLPUwl3gOPSzfJVM9GL3gTOcPVhR6RMS/AAfUmgct02Wod1r1MZZe9dTqO?=
 =?us-ascii?Q?CP3QKJJMh47XXeGhHy6p74Y6X34odtyIJ2c/pAv7VrEL+DFWnjJkuPA+t0Bv?=
 =?us-ascii?Q?d5itHapeZc6HYZmWv2qYCi39pYifJ1fXCuoQ1h8VRv1DP925FBnE5my4TrhK?=
 =?us-ascii?Q?AcLCrIJlELRHtC9OllA4g8sMjYvM80m7eicE8FSve+YsmS5JwcxiklfF2Svt?=
 =?us-ascii?Q?O6CopppP8Dp/QKxIKekxhfvTVovdXTW2UET867xCaEVg+l31Z3+5/IPzSoAi?=
 =?us-ascii?Q?dgfRk+DEYNKuMsRddIXSYC7Db4deiC7G5jeUai9iUNRK7uTAhaX7e2el6uCg?=
 =?us-ascii?Q?JWoTN5agiJK/wknTfa7vKQPxYFI+7vyBvXyFXc4Jp869r3m3jCjw1XkPFlP0?=
 =?us-ascii?Q?yntoOOgJuaymQk9gPlM4q0KUaJEzlNBVT2KmH/feugQDyv07r9jeKKeWNa94?=
 =?us-ascii?Q?f+gD/Hh30QopEWk10lN8Gu4avZqQ+7DE+DgxQYL2W6bg8AU32FhZHvu0P1LN?=
 =?us-ascii?Q?CIpzV+axLDbi6pzQmj5EnOA8rEl4eJDurcX0J7kJ/jAmcohYm9spCwoVol00?=
 =?us-ascii?Q?WIfEs1u6XJnx8roJ+27GIIGNIYz7xRYKCV7PFudOPNyH3iaAreOZ8hQislho?=
 =?us-ascii?Q?FUHIeCw8Idxrc44zZ5jkhf7R1iK6YVGw2r0LcRIuyMfkgT4fu5g/B883do+T?=
 =?us-ascii?Q?CEnuciM2vkLKJp8Up54mXHmv7BmyousLQN2ef13IbSW5LcHTJxF3gwic4REa?=
 =?us-ascii?Q?nH3v7YYg0ALfW0EWoqFzabFDx/Iq++3pWPHdddDMe+GxFlcOlZSKOLKsRqWh?=
 =?us-ascii?Q?eJAn0rgnAYks0f9KtZKODfMH0XCelOxVG4SoS9iANkkGK7Q6tXyRsz1kLNoR?=
 =?us-ascii?Q?7UbTEPVaRyt7jrvzp/FRM4vq631T/7T+Y84JD2qmFTci1j1bobn9a3owq9G1?=
 =?us-ascii?Q?Z9akzMRNBz5GI5/ENGeHSQlkqLTRNl1UBWO1mbdNSSKDNvNdmQqWz1PgjgLu?=
 =?us-ascii?Q?oDwXSelCsLEDjNDyB4SwX8nHybkJc+8I934YeNcrG02B5bJXOH0rhCINhx13?=
 =?us-ascii?Q?LQ2rQsit92BdMbieq/DFyNTBWAfnmjrsej6sfpikk9e7YQCxHpYBQT2iAWuP?=
 =?us-ascii?Q?4DfifwR6sAImAYf6iez1XtDdOM2uuUyr1Ks2B7t8H8NsOkaJCzo6u1nV/1SV?=
 =?us-ascii?Q?Wb03F3Nw5dTTalnF2O9YodNU82o/Uh1NJ2Vnntnb9WBgkUViPDxhsBCaNEvm?=
 =?us-ascii?Q?D6/6yRXasCe8HM485fo7VtDEnM1vi4MkXMNMs25/7RNwA4DH+uRfO0/1JzST?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e4490-788b-47d2-246b-08ddebe8db92
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:25:50.6921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egMOOuVMAy43PSQcAvDUFb+DbBMIye+az2kBgHvxm7d8D57iyqWVBK+4I5hqJmoWsHpsXSPmwBAuNUUsRpa5ERHVIQEIXxz7hI5izKFDTFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
X-OriginatorOrg: intel.com
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

On Thu, Sep 04, 2025 at 11:59:19AM -0700, Matt Roper wrote:
>On Thu, Jul 31, 2025 at 10:01:44PM +0000, Jonathan Cavitt wrote:
>> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>>
>> Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
>> and 30.03.
>>
>> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 22a98600fd8f..535067e7fb0c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>>  	},
>> +	{ XE_RTP_NAME("13012615864"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
>> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>> +	},
>>
>>  	/* Xe2_HPG */
>>
>> @@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>>  	},
>> +	{ XE_RTP_NAME("13012615864"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>> +	},
>>
>>  	/* Xe2_LPM */
>>
>> @@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>>  	},
>>  	{ XE_RTP_NAME("13012615864"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
>> +		       GRAPHICS_VERSION(3003),
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>
>I don't think this works.  If the graphics version matches
>(30.00/30.01), then as soon as the parser in rule_matches() hits 'OR' we
>consider the rule to evaluate to true and apply the action, even though
>you haven't checked the engine yet.
>
>I.e., what you've written here gets treated as
>
>  ( 30.00/30.01 ) OR ( 30.03 AND first_render_compute )
>
>when the proper logic for this workaround should have been
>
>  ( 30.00/30.01 OR 30.03 ) AND first_render_compute
>
>So at the moment we're probably accidentally applying this to a bunch of
>engines that we didn't intend to on 30.00/30.01 platforms.

yes. We had another similar mistake in a pending patch that I fixed and
submitted:

	8d6f16f1f082 ("drm/xe: Extend Wa_22021007897 to Xe3 platforms")

>
>
>Since the new version is non-contiguous you can just create another
>table entry for the new 30.03 version.  At some point farther down the

or do this:

	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute), OR
		       GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),


>road if it turns out no platform ever shows up to use the 30.02 version
>number then we consolidate the two entries into a single entry that
>spans 30.00 - 30.03, but we're not far enough past Xe3 (or even Xe2) to
>do those kinds of consolidation yet.

In that commit I mentioned I decided differently and just extended the
range for these reasons:

1) if there is a 3002 in future it's much more likely the WA will also
apply since it's spanning several revs.

2) if there is a 3002, we will need to revisit the WAs for that IP
anyway. Checking for already matching WAs would be a sane thing.
I started wip patch for that[1]

3) if there isn't such IP, then we don't have to do anything


[1] I tweaked the xe_wa kunit to dump all the WAs in the driver
     in toml format that is later converted to json. I was then applying
     checks by parsing the json with jq and friends. That proved cumbersome
     though as the check could be differently from what the driver is
     deciding and we'd basically need to keep implementing it in 2 places.

     https://lore.kernel.org/intel-xe/23b32a25-e157-435e-8b23-ccacb59be55f@intel.com/T/#u
     when that lands, my intention is then to dump the WAs that match a
     certain mock platform.

Lucas De Marchi

>
>
>Matt
>
>>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>>  	},
>> --
>> 2.43.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
