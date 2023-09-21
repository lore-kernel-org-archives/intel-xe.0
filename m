Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D983E71076
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 14:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0462110E035;
	Thu, 21 Sep 2023 14:08:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE03F10E035
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695305278; x=1726841278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAGAJ5dlAW7zGBLeFtWQSDqtpcFb9fKVUFv82cIHX3c=;
 b=GqNShZddFr779pw8sIiM7+3R0Lre7RNKrxLgwdlxEP/hhXpQ/QJehDb0
 Rwt8VGff+UOdMzMtgWe0WVc9PSTK+OpxPnwtbF6qHLNtVqK1TzhDW9BA+
 cfSoDFs4+s8VJ5+zQ+RpHoYkVr13T+/UOc3QQZ9J1COOy7IYdqlrwqQRo
 9sN1o4BFvEb0QaBHjXYZOcd+jkl2ElBhKLIIfFckG3hu02u+9cRYHlJHf
 g4DKoAfs0tUPdr9ApmZ5PlICEieVIJrYNiFHq7NL2mxRbovbTczL+agWJ
 39LQNWpRJo7XoHNSBp2NHYdZwJdcDhjBLjdT3forpeV+1TwdHzD6ILUFW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="466837248"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="466837248"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 07:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782188894"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="782188894"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 07:04:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 07:04:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 07:04:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 07:04:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 07:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbxGmAa5+9iKKsHnr7/r0vCKbKobL2fcjDQ+yMXNRk2rkp8ujHBmB5Jjs8HdAFs/PTcWFdY0aSBCJ10xscKO4RVyCmh8iQr0VQIA5fP3RAPLTBxdZ5jjwFIMEc5XVxlFvnBTK6h5w/fBMMvNPBrPrYBaZm9ibvDnfBPRFyCt2LjASgY1T4zf01lWo3pzdtXAK4n4jfY60nQfvydq38b68cCPS04VF34N90YdhJWZixbejmDNLHCXb5bvOgSE2QTuslN4AHEfLFL7IiCbaBrETGRSIXJ03NWNEepYjZRly1r08Q8pkS3i6hu/OsfIXsg28LdzhHe9uNrtlj+YFdzAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBsyYZweAoufQgxrvJUBznWF7qZhlep23Sfa7npxN9o=;
 b=OQq8cnMN8aiaNKHjv+gedshjuaKBMAw4zw15mNYej49SeNN4EagL/T6coBJSCy0uSCsMJAMhjBNFyr7F/gv1NqoVzuryAo8bkbRUMwvn1fB3etYQAwjdJBFSP3yanRKaz0QcwfT4y6+2JwqM/fIrF+FloC7+guxz7KaTPKwUGQkNKQuS6r/RRG4rHDWno0OxYTb+zdw67KaFNvUzXVbL1CMXwg5K8Mh4nevV9km1CtF8/N8zNrO2aOW6GgEh9vdTxfEQV/j0uKAFcExTW9dhbrA7JpGoadc3R9LY6COUXtCa+VNLYLj2aIb4U+CCkl0+oi3fulTZsPyaToljSJqKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5481.namprd11.prod.outlook.com (2603:10b6:408:102::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 14:04:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 14:04:16 +0000
Date: Thu, 21 Sep 2023 09:04:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <o5lq32qytodqbz4nowp2xjkb2knxnrvhg43vdnadipnlnhav7l@xfuuxd7eioqf>
References: <20230920212103.2145677-1-lucas.demarchi@intel.com>
 <20230920212103.2145677-2-lucas.demarchi@intel.com>
 <20230920215055.GK233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230920215055.GK233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b740ad-28e0-4a0e-d407-08dbbaaba417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQ0K7sLnBPH6kfOmkouc9+Fv/7lcaGFv6909FziXza+yf6qzw0DxXu+wX3AizPKebrxnL0Hyaq023BHnPNaDk5THda+/fPaDRBi8F8x3aPYrhoi4VqOuD0pekm99t1ArCqVJ819Y2a1kQb0KqRVCt+8aCLZKagM9xtx7uX6yF9MDW3YlJRRPsZ84XVNAHQ4e193TXoLkKR+oLbNRu1fpY3qWjH7mwmbxxhU/XdGLZwa5OpHBcxyape29jXSVALJcb5CZeOsmLQc+5dsk5gZmWIGNysTs4pyGsYUWhWAqUWqkYbvlAkE3ZmfltGPC0nDaZxnovi8pz/Oel/YuZlGjmeZjkhV1SLF48yHs2bOUo88rYF9LSgPXo5InZPKHGwAT71+U/Wi7wSNjbJk2OG1w1K2SNQmeffHd4bl3eK8HCmWOUd29/6YqMx4/ZRFWEyy/mnkvKZ3dxxG20UqExgKwWGqo7IXTRthLZ/jzFnp5QRFKQVBz0aocjqv/8XiplVfs4EoSTFCC19upVi2ahugV/rJLXlMGo1CLCN2DUmfF9A/cwoGZIYTYluaOgvDONNx1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(186009)(1800799009)(451199024)(6506007)(6666004)(6486002)(4326008)(478600001)(82960400001)(38100700002)(86362001)(6862004)(8676002)(2906002)(6512007)(9686003)(83380400001)(26005)(8936002)(41300700001)(5660300002)(33716001)(66476007)(66556008)(6636002)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lBxpVNBzJCwV8xUbpre2/g2QjeZN5bLDdjPUYZNyHb1Bl07aQH1KHlpskfPI?=
 =?us-ascii?Q?x6gMeCUJWi1sfHdsytW9KGIc2JQMVg0SwlBAhjerM0EN1zJvz/PIMMHNjnB/?=
 =?us-ascii?Q?i4g+Caxpg3A6n0bbz/N6YOjO8yKbTGDbq8EqwDIFcwtwgLOTdqrKMFmGPZO/?=
 =?us-ascii?Q?TkrrbN2rznuFPH7BChqRz+ss1tQ2yMjAg+DwYQJeAqqD5DgRvxaqwlsRvsD4?=
 =?us-ascii?Q?tnAFaZ5abnDMBWBeWvDWXUTbTw0QOYsJGbHW1fHHwiftKL6M605uR840u6RJ?=
 =?us-ascii?Q?Rzq9/Hw29P6whtBKMaSYxx12B1qNSDbgPmy9xBqMkqNrPyHG36xjIUr9VVpl?=
 =?us-ascii?Q?K4otKSWsYmh6oq11D9zHy6IyyXLXtF63FZFmULQEQE25EKTzWFENdslC/jmt?=
 =?us-ascii?Q?yFn6otQ425g6SW0eWCQtpQ5VanTNlB/hS888q/ce7yfUX+Jg6c5NizZPBrAX?=
 =?us-ascii?Q?diS2RuA3FQO67DAyLvj7bciWQ2RO/oiJock/ZUt+4T6QS156XBIv+D5pZh6X?=
 =?us-ascii?Q?ZMqQ11ydRxww/vOpfySFIuG4ehy/eFNYOsuvvlbT5H52dB3NBb+e4dXmdPEv?=
 =?us-ascii?Q?nzHiGh49zqWTvg9vciDXtBaxXM2JOLTtA8ZIx+RHcZL2OydI7IM9LoDqou31?=
 =?us-ascii?Q?nyNxaZDt9KD/ozr2P3+KU2qcEAS00WvXF2PNvr3QxfidhmlqXEac102qTMdc?=
 =?us-ascii?Q?fJ2yjUBtlhTifDad2XKS3ymLJYFJDiZv3yx46tXaDnV4vAeW/tzu55T5K8/r?=
 =?us-ascii?Q?oLmTjMa5+8F67zP3S96L2eQvD3FDdQYsfaCK77YNW+UvoXVhspuPfFkVDaTx?=
 =?us-ascii?Q?yW1m2TCcyjU+7d4nPBkGoZOX850EfPoXUc6X6IvEeTNEeoYXXvBc9hMVAxx5?=
 =?us-ascii?Q?uWTqhLRNRrtjKuYtaBHc6fBVdeiF/SKlExWrKN6FMaJxhuN2hQMu8EhXfSvS?=
 =?us-ascii?Q?dM5sU0Yzl/tNF6Sia1/v7dE4zIdVY8e2s7FQnE0VuvI8h9P9jBzw+yPN9VHF?=
 =?us-ascii?Q?pE5Vb7mGf2THX8gE3W6Dvw27rLT65WlUNCWBud/8lHrAOye1iAEPqIM7vOv2?=
 =?us-ascii?Q?fvgBGMdbDGgyIPWthbP25c2S1sego6ACfeo0/XrV92Cs40NPo2QiP3KROxHN?=
 =?us-ascii?Q?OQo5Ah0OlPwLneWq/NgMVG0l3FVLspH7nUe3ciUmJfLHPMe+jSwKU07JklJe?=
 =?us-ascii?Q?yOuWN8V0DF6M+XmaBWpj2NBVO5tA+FjAECKzP7jqqkUr18LyNeS3uO8vpZt6?=
 =?us-ascii?Q?WB/q2s10zEDnW0UAvkWib1yuqy0D103bcG6CtIALBdUg+k4jzR12QvD/bZR0?=
 =?us-ascii?Q?EgBnQBpjErRvgBfq5as9UU3VowTxnkDbhFkX3cmGAUqPNYK6TKDVj+z5NjPS?=
 =?us-ascii?Q?M8ACFPpV1VG6i9mOaXSL0mn4pe0RKaHm6NzCOuh5exgxnLLmeaJ5TEaqjifV?=
 =?us-ascii?Q?K32eo7cXawLQ0elJIIx+t7h/93NJPEx5WTjw/Qddr6JaymAXKQOSkt+vguMx?=
 =?us-ascii?Q?fWex/6O6Ip5ulJmaMOSZz7R8VeQAgrBJNVyz+8Tg2cpDjOYK9JbxPeBZMJDw?=
 =?us-ascii?Q?ay3zCrSdL5nS5yFdCy7cKJyzF2sCLUDqSzDMMr9uB9rByVhdOw0hKmI8MSPS?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b740ad-28e0-4a0e-d407-08dbbaaba417
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 14:04:15.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QUAzRLLAghuT+pNxOZA9+CKt+m5pyciIhcleHFHorOUbC6+ryX7XwsEyES8irDZdaLsKZpPgbPFceF15oROnVs8trk2bK1dC5kEBo+JloE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5481
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Report number of Xe2 EUs
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

On Wed, Sep 20, 2023 at 02:50:55PM -0700, Matt Roper wrote:
>On Wed, Sep 20, 2023 at 02:21:03PM -0700, Lucas De Marchi wrote:
>> With Xe2, one bit in the fuse enables one Xe2 EU.  Note that although
>> Bspec 62564 still refers to 1 bit == a pair of EUs, this is about the
>> legacy number according to Bspec 70820.
>
>+Cc Jose.
>
>Looking at the bspec history it doesn't appear there's any true hardware
>change here; this is just a terminology change that someone thought
>would make the bspec more clear (so they added "legacy" to the true
>hardware count to distinguish it from the fuse register, and then later
>came back and added a separate "Num EU" column that matches fuse

it's being called "Xe2 EU" now

>register).  And it seems that this attempted terminology change wasn't
>even handled consistently across various platforms.  The equivalent
>bspec pages for most other platforms are still giving only the "legacy"
>numbers, either with or without the "legacy" label in the text.

like any rename change in doc or bspec?

>
>But regardless of which terminology is actually more/less confusing on
>that bspec page, what really matters is what our userspace partners
>want.  If we want to change the uapi from reporting the true hardware
>value to reporting the fusing number, we should coordinate that

it's not just about reporting the fuse, it's about reporting the Xe2 EU
count... I don't think it's really an UAPI change - this is being done
to Xe2, we can't really change older platforms (not that it really
matters for the Xe driver, but I think it's best to keep the older
platforms as is).

>behavioral change with them.  And if they're trying to access
>hardware-level ("legacy") EUs independently anywhere and can't just
>operate on pairs, then such a change may not be possible.

I pinged all the UMDs as if this was a UAPI change and pointed to this
thread for them to chime in.

Lucas De Marchi

>
>
>Matt
>
>>
>> Bspec: 70820, 70821, 62564
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 011ad7f2325c..878f3ed7bc26 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -49,8 +49,8 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>>  	if (GRAPHICS_VERx100(xe) < 1250)
>>  		reg_val = ~reg_val & XELP_EU_MASK;
>>
>> -	/* On PVC, one bit = one EU */
>> -	if (GRAPHICS_VERx100(xe) == 1260) {
>> +	if (GRAPHICS_VERx100(xe) >= 2000 || GRAPHICS_VERx100(xe) == 1260) {
>> +		/* One bit == one EU */
>>  		val = reg_val;
>>  	} else {
>>  		/* All other platforms, one bit = 2 EU */
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
