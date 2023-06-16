Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F24EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 07:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968F210E5BA;
	Fri, 16 Jun 2023 07:32:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A58310E5BA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686900777; x=1718436777;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K4VZ0NDLa/kSD1L3Ybb6KFfPkpuqqRVSGTpeuQxRGFQ=;
 b=A2XCPGzgULYruJOM1uWitSdBwgWZl3dagS1/Zzcmj/eLI1CMRZR1PfIr
 jXC1Ty1ZiAKtU81YJbneNcW+Eml5hhjZGY3hpF9lqCEE4VeV5DrVe4y9m
 /r7QR5l1TSmafNX9wx8RQNJVRdF6z7KTLJq5AZ/vm9zj54cPecPrmYznf
 N9Jkxi/L+jVtuVV6xYa2fxD09QhdpPolC8UE6xrIHl6x80dy8V8D3Z+FB
 cRKwXIh7nNyDDeq9uHMF7Fz0eRKQnpmZHaSObx6RZ7GbDAKf/hlt37eJB
 yaVe4td7IKL1S/fm+xORxUhZuHUtR4ZBVg2//nfjdlq+K3DCuTY2tiQSd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348861912"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="348861912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 00:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782803117"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="782803117"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 00:32:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 00:32:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 00:32:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 00:32:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 00:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyPMA411bZBA3sWCxGekjdUmHOqZvHaNZ/U4/joqq17wdbmQ/xP+dpyHlNPOhh5fuloMmV8fJi8AaIHVomSVePrWMvAfHkCjDnFj7xUOx+7B3cPGJhilgnNd28ZUG/nL+u4V1Oplk/QLewWfnfj42NR7RpAf54VRR8EkelW0uKKXHklNf9IgYPXuGfg4XgwoIzYSYemlAe0P3jpDu8BXJO8g4SM+c89Ll95irgvBRxLAaJyuyDdOlXKpfkRS1YhV1iajgkJl9ZAl1AvIRkNwvEt3TN8ZBB1RsPHliWCF60sArS8sIyTFFF+Vc6B5UfxXCGMXAEEFK+ESnRQ/LSdW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg1cGPfWIJlXM4egxTYwpV/1Dj7mxHHj/4uYjnr0QGs=;
 b=L+DgGUxRRRMdxKlzKq+f7SzBrHCBflXprbmRl/zgqRkxYcP5tk+LVP+BvuoJFHlffwNNqjs54Hti5xrxfWoaAQDzaYw09LPdAp5Z21UIauVxonxIQJIVzyH/60tzSWFTnNQZCQsA5QBx1uTzIa7XbzeZFpkysKcsbgLyx/KR5IVr+9w7p7Ka9NG579KHH9yqoHCkocdowqlRRMYBMENkmxmzfH9/ubvv3PuviFfG7hqdcaaj3aNOHhOqsweQHi/Dv2ZMCCb0IZu/2E3HMl+OO7dqXfLb4lAd1mq7qI3OjxcROw23GeRL38yMqyI9MRj7CEknKmLrGfM2/p677k/c0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 07:32:52 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 07:32:51 +0000
Message-ID: <3b6c5e11-1d06-0f4a-3b8f-6195cf4ca162@intel.com>
Date: Fri, 16 Jun 2023 13:02:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-2-riana.tauro@intel.com>
 <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
 <9d8057a5-09a9-1a04-bae6-4465b9186917@intel.com>
 <ZIrempN9Bxf4l86u@ashyti-mobl2.lan>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZIrempN9Bxf4l86u@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a6bc1a-23a0-4a0e-5a67-08db6e3be426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYwLia4375XmzwZWMvvqMsOUrEvr6mf7BgvQvUByAm9GN1ZtmVMPkoFbt9bOq2VaBLEq/u9sF9hTiEfDsuz99HPBPhlkLbkm3nYDpb/miS7yZUTmv8uIsEIX27srSibcDaeaNDa2snM/sq+oix/mS/0X8HDIHPHsGI8w/aKPHQs4KXwsdHEQsM//ttbtO7zcAFbvXhmtQwgmH27t7rPUWxdoinbrJKNFGuYMYzNRghcMuNkiCsZB4TOo1urSacNTLHpkgpDgu+y6RsjsXn1rOb2Jm12sTwb0Oci9RI4bfv/H6IlV67pbdmXPeR9Q5zsgdSn6y3DxA4DPoUR6HGCrP9ILEbzXb4tXuPQZlpVnu/F3D/AjRmMgyFap/A0Z9+iP5NHJ+h++sj1nDsnro1XDWVtOS12KnXsYT0QAV5WmJteZAC1/uSLuqKZPqVd7I2aenaQlLg9+w7ejqrykFNfrFIrO1QjdjEHkI4eADpo9x9iBVnBL08pyRPgokqWGV2oXLg9V+p14At0r8NJzBq2ON97xRoKKzUxkv/htiHd7/j4ELXctRg7jxKgdPGUAwixT3QV12XEPpaK0CwJ6ry82Cj0AoQpP1mnfpjiAXNBBK4R5i0hbvWWhjmCgWzRF7QylyUe8kM0IXL0nAoFkBVri5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(6916009)(44832011)(6486002)(5660300002)(66556008)(66476007)(66946007)(8936002)(6666004)(966005)(4326008)(83380400001)(316002)(31686004)(82960400001)(8676002)(41300700001)(36756003)(6506007)(6512007)(186003)(26005)(2616005)(38100700002)(2906002)(53546011)(478600001)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVQ1cFFqVmhGMkFUZm0vQWRYLzlyUFM5TVBxNC96WThlc3lTWjk5YmYxcjYy?=
 =?utf-8?B?Zm8xeDRSekJnN1lXV0hqU3hsamc1QTJrU1R0S0x3L3o4TkIrU3o2M0pocFFH?=
 =?utf-8?B?VHpuWXpMZTZNOUlZTWo5RmVsY0x0aU9YcEdtcUZndzdmNUNOUE9Bek9rWTR1?=
 =?utf-8?B?WTRORGtRVlVoM2V1Wnk3S2QxVDJiK2cxTlBINmtaZWhGd2w5K2FzUVo4R2Zi?=
 =?utf-8?B?OXMwWWdvL3d2RzlGeFhrYWp1Q0xDZjUrWFVmZi9jbEhpamxwaTUyNVljdmRO?=
 =?utf-8?B?TFk1TitSTGx5VHNvaHF3NXI4aVY4NHdidVFhS1ROajd2eGhSUnlOZkt6bjEr?=
 =?utf-8?B?MjFPOE1YTEdNMERPeFJNOXpvM0R0VUNuNE9sWWJPdGRkdmJsYXJlT1RIQzBY?=
 =?utf-8?B?U2xLQTA5Q085aVl4UVg2bVJsUU8yREFtUlRMdFBIKy9aVXlWUGYrQzYzQ1FH?=
 =?utf-8?B?WWp3bXVGRTNZc2tNK0pQUzFBQnpOeUJzZll0SllnMVdzWFBpY2kyQ0p1ME5Y?=
 =?utf-8?B?dHUrYXplbG1Xb3UrMXptc3FqSXQzR1Zhb25DVWRaWm83YzJHV0xCTjV2L1ds?=
 =?utf-8?B?Z0JTdktFNFhORnNDZndJU0lyYi9jQ3Q2QTJhTzRSdERXemJldW15VUpkYXor?=
 =?utf-8?B?T2ZUZHZqb0RhK1FjWUI0a1NZVTlRQVVLc0dLM2dQVG1DT3pBejdQOVlQZ0Ja?=
 =?utf-8?B?dnI0SHRNMk4zOGxhSkhPMzN5SVFCUmJVK0k5N25JNXZEV0l5OXN3SngzQnBv?=
 =?utf-8?B?VmRaWklrcndzRXBRcUMvTnRsMERJWi80OUFUZWxqU0pkYkMyKzdZQjVPZDVI?=
 =?utf-8?B?VThyeVlEZU9ib2pBVHh4TmhiNisyVDk1MDVEbGhZdUkvQTVZK0QrNThidG9C?=
 =?utf-8?B?b0FwbjcrSmxBeGJTL1Q0K0drS1VrZzZ3NGQ0eldLUjUrc2Z3WmU2U0plNGJ1?=
 =?utf-8?B?djdEWDlXTHhFckxLTkp1ZEtvaEhyRTNySHI2SEhLbUFtN0xyZEZiRnpyNWNY?=
 =?utf-8?B?eVZWNDJoTGZCUTRSOEJVSnB2SlBaZlVVUkl5cTBTYUxVWm1Dc0FxcG1CMGQ5?=
 =?utf-8?B?SE16YzR0OWIvczB4NGJ0UmFtQ2syektOdEZUUGcxNXIyNm43L2s5SSs3UVpZ?=
 =?utf-8?B?V08yUG8vMWIrV08zWFpiZXllSDE5eFFHcTRDQ2thNlhGd0U1YzlhdWJsMUJT?=
 =?utf-8?B?RlBMSHdyNW1Xa042YTJBYkVXeWtEYWczNjdLTEs3Zjh2Y2Yzc1l1Q29vTVZM?=
 =?utf-8?B?WXRRVEp0dUlLNXl1SWw0ellMaDFFcjNacUUwQiszQnZqRzNQaTNaTE5kZzZu?=
 =?utf-8?B?MFFMVzd3ZW5STzN2TWNTRmZrWGNzODREZzZEYXhndG9qc2prTGZkU3RIWnJB?=
 =?utf-8?B?U1VpVEpuaWF1M0d4djNpTnN6bnZYeDNKK3pteGZIa24xRVdQMWFER3M2d0pz?=
 =?utf-8?B?OFpkbDFmVlZIeE1Xb0dwYytGSmdUeFN0bXlzR21BczNkaWtnWDlKbEVLcXk1?=
 =?utf-8?B?TDBjdmVnd0xnb1ZrSVJrWDhESXRJMUdUWFJDd1FYeTYzQlNEbXRPSkxCYlRj?=
 =?utf-8?B?TVRUTTEyM0xMWDQ2SEVUcHdqQTZnTnZ0TDBnZ29rU0IzK0JkWVJ1d0RVRXpO?=
 =?utf-8?B?WjBibmNra0VBbFpaTklOVWRXZ1NDN1YzTEI3eXI0cEJqb2pxQ1FsYW9QV3lC?=
 =?utf-8?B?cUlJR2hheWc3L2pwbmY0WHJ5TW5tOTNRTlZ2alN5czNubGUrYnUzNWhLaDVm?=
 =?utf-8?B?ZzMwWjY2eWVlTzJhNGZuMXEzQlhJdEhuVCsyRnc4QWhiUk91K1B3d0ZDK2Iy?=
 =?utf-8?B?aTZ0OUoraU1xY1lYbW93Vm03NEo2L3h4VTZSWm13WGZHSmJVSnBjSG1xUTdY?=
 =?utf-8?B?TDk0dEhlZGFsMDZaOWxNc21SRlZlSHRKRDh2TW5LcXJ6SENadXp0NWtDNUlT?=
 =?utf-8?B?R0ZIbkxNNTFIbnpmSEV2NVRtV2lubXNqRTErZEpXQnpSREhDSVVFcWJ2VXQ1?=
 =?utf-8?B?azlnOFYxajZ0dyt0M2lBUHhQdTZlR2g0NTI5U3JGQnVWVDlpcUhieDFkV2NI?=
 =?utf-8?B?aG9BWTBheDF0TFgvR0FoUHdSRjlkc2RweTFrWVhnVnNPSk41cjhSTkhzOXNS?=
 =?utf-8?Q?OHTRk7f/DdLAPuNAngMI1Hq4w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a6bc1a-23a0-4a0e-5a67-08db6e3be426
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 07:32:51.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD6OmhXO+I4nywhJeL6NA6Xbg05Jjw0p2og0DWn/tH98YMmjtP3RLgx2X4GUxoJvf9LC+pF+sotpAn94/OQlgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 6/15/2023 3:19 PM, Andi Shyti wrote:
> Hi Riana,
> 
>>>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>>>> +{
>>>> +	u64 delta, overflow_residency, prev_residency;
>>>> +
>>>> +	overflow_residency = BIT_ULL(32);
>>>> +
>>>> +	/*
>>>> +	 * Counter wrap handling
>>>> +	 * Store previous hw counter values for counter wrap-around handling
>>>> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
>>>> +	 */
>>>> +	prev_residency = gtidle->prev_residency;
>>>> +	gtidle->prev_residency = cur_residency;
>>>> +
>>>> +	/* delta */
>>>> +	if (cur_residency >= prev_residency)
>>>> +		delta = cur_residency - prev_residency;
>>>> +	else
>>>> +		delta = cur_residency + (overflow_residency - prev_residency);
>>>> +
>>>> +	/* Add delta to extended raw driver copy of idle residency */
>>>> +	cur_residency = gtidle->cur_residency + delta;
>>>> +	gtidle->cur_residency = cur_residency;
>>>> +
>>>> +	/* residency multiplier in ns, convert to ms */
>>>> +	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
>>>
>>> do we need to lock something here? Looks a bit racy to me.
> 
>> seq_read_iter takes a lock while calling sysfs_show
>> https://elixir.bootlin.com/linux/latest/source/fs/seq_file.c#L171
>>
>> This function is used only by idle_residency_show. So didn't add the lock
> 
> I was just thinking a lock around gtidle. the m->lock from
> seq_read_iter is loking on the seq_file m so that consecutive
> reads/writes cannot be made.
> 
> If gtidle is not used anywhere else, then I guess locking is
> safe and for now "struct xe_gt_idle" is in sysfs (but still in
> the xe_gt).

Hi Andi

All gt idle properties are used only in sysfs. If it gets used anywhere 
else will add a lock

Thanks
Riana

> 
> Andi
> 
>>>> +	return cur_residency;
>>>> +}
