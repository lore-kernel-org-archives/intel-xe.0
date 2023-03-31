Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4B9C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 14:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC6010F26A;
	Fri, 31 Mar 2023 14:44:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19F810F279
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680273851; x=1711809851;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N/4+VA2RD+hFMivRbL4nREhDadFQFwq2Gs/hPODdxX0=;
 b=hdxjSCO6Z1PGSzJkL7W5gE/e9evhiKKV3gYvKwM6cuY+C/EtHzymU+Cr
 x2F2LfaSz94rXpHoQYrBS3vUQP9MrRZnFUQ9UYOplz8OdTv1J1D72hUMT
 zJSxOhohkQow6iZXw9aU9vFhLgF71Ro9J/wir7pr3iTfHbwdk2FvvQ9UX
 tLZCcmHYMvSE7OOD0nz4S0CtnD18D06UFenGMIkmz70a+IfAeZOC4mDmq
 98vpo/9+7Zw5ptWZQUzejaEy24MuTI2lzKiljp7vh5mUPGtt2hc6xaGpT
 8qVrmVQsrT4yetW1rDG//qtuTMizJXhRkLoBYYOtWqgdl9byUcU3Rq2kh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406481867"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="406481867"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="749671130"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="749671130"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2023 07:44:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 07:44:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 07:44:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 07:44:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 07:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OalJKdqo0lRi2x2p5xJsBSlaL2MZs630hcMkLNxWYywEFDXb+NmCrHBqVyj0Wr+PrdrKDj9hurxwRv9Chrapa4UDev7JCg+mW4V5PirMWTRUVbY+yH9HE/FcJ0QvBiayQunUW50+4464aG+Q1mGFh7/zAq3SIEr0VGv1kR8hjK9SnBCoJBm5qwULSeGAUv1B5AMQO5LFSxyVSwM5d4bTF5B6jReBpsHxMkYdF1WCfc+2WNf6AoFRpK+W8DneWHV/w+WwvMNhl/cNuQA5skiJy3E3R2/4OiFdSAUT1S2L1M5EKIqk5gNZgqVCDXdrEovLW4sp1cSQeP+VkZ0MS7he8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFfLGCRvWtL9wl5P+KpILnU4gDOsClrKMrvX/MV6M6E=;
 b=DiCZpDY484GyCXFCmhzwCNKs+NVw4hRKxHKclJyCTmeNkjHXj2MpIsOFM7dvwEseyngoIfGg3fVlkt0X5KdoNw4gBJbMXYAClnW/xGvgBsGK1c10m8qr08Z5pf7meQkG6PQ55AkqnITpg2YeLsHYddRb4LDL7fLUvMbII1exEBO+qwOgQwtWZ0qHT6nKyikdP1Nb0oua4tGziMJrWXZr+V5Cv1CyZ1wylROYv93yV/NdgCzJccgCTEVHJMX1tOvPYdGH3TBzmwpsoECGniyA8a8AaqT3kBIebBwbG8cnsNv+FbzgZDdkD6YNK+yzyCDjSYDlQ9Pp2TfrV29dg5yIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 14:44:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 14:44:06 +0000
Date: Fri, 31 Mar 2023 08:43:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230331144338.wwbyvmbpyww6sk22@ldmartin-desk2>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-7-lucas.demarchi@intel.com>
 <ffly6znbfrvbv53fyzxqwfy3ljvdljq7ie63i325xjajtt454y@7vqf2ht4otqv>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffly6znbfrvbv53fyzxqwfy3ljvdljq7ie63i325xjajtt454y@7vqf2ht4otqv>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d8c929-7105-4cb8-3327-08db31f65f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6F2yU4xWbgkHzlMwZDa9Xs2NpV1XuE7ucGaFkBtGfDaCdmZdfZmpZtdiTpsr0zv6SC2dfBr8CAeyNtb4UAzzJ+/1LDJlaN6BsvLbV81jJcLxe9PRm++sTfcULKWE+7dctDqTqCkAYKz8FJkzT4gEfLHEvv3vpkg6W+IZlm2zzSLaqJEmYiluKmAgOefm/hrvPop9WFSPehezzWZppo6w6Xqf2XyYraGAvQop7FhlfHZfhG9qGmXILjIRUMRxbko1Ydkkm9pg/DsTzHCum7cR3Z29fFb8/TgsTG+BHhdWGCS9UlCTr2JePWl//luG5uTjLxVUNAtJrvrNx58KUfB8xPHJjFI8DNtixdr6mYaAeakkBahrm6RlgLFWbQgvgKfld4oOvqTEnyoMdjj0po7kqr0TU7VLR9milfVa99vGyCOqgAtQCCnCU5a+XHrnv3E/+rt6DAAWa96/l0g5LQDnyeXs/umCEtnld4/MduqTCucrI/J8W6dP8q2+ZmeMioA5HjFTCTI+EshdfGAIwoXmYrgVn+qwNsARd/USNqMN+cpITwwWusZtf0Sayb88ljW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(33716001)(186003)(1076003)(9686003)(26005)(6506007)(6512007)(41300700001)(6486002)(8936002)(82960400001)(66476007)(38100700002)(5660300002)(4326008)(478600001)(316002)(66946007)(107886003)(8676002)(66556008)(6916009)(86362001)(6666004)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZvdTNaUG9KRmZobXhVSEdtM3pxay9MOUZPY1FUSmpQblZLdkE4RE9jZlR6?=
 =?utf-8?B?OTk4M0RXaGh0MklQa1N3Y0R4U3BrTktyNmpRWnFKMk5zalN1dDVXUGQyN29D?=
 =?utf-8?B?TnZtQlh3Y2o5MHM4QTFLS1BrMkpzLzFPb1V5SEZaMEdhcit0cWxpSUZjWmVm?=
 =?utf-8?B?aFh0S1gzUHRDajlLbVVqUkFmUzdSUEhqRi9mTmkyTHBwT3VXV29sSnE4YVZR?=
 =?utf-8?B?bC9nSlpJUmVmWTcvbWJZbDVZWHdZSFI0cmJobnZ6WUcyWTRyMlhQRmU1U3Nw?=
 =?utf-8?B?RXdCdG10NEpCZTlwTktqK3FFK0xVaklmR3dsOGxBaWRUNm50MVkxYkVVYnhG?=
 =?utf-8?B?UHY1WjhhT3pBUG9hZzc4azByU0pLcVN3blVhMnpXd0VES01nSVhZRm85Y04z?=
 =?utf-8?B?RGhucGozaldlN0VzaWN5bzhLWDlXVjdMTFZwUExWdUdOUlBOZGgvV01jb1A1?=
 =?utf-8?B?Qm9QQVZqcGNmcWVmcUNjYWNrTlYyMTVBVEM0QSs5NXNXckVVYlRhaTA3V0t2?=
 =?utf-8?B?R1pyalU1RXZPSnZqQVhjS1g0ZkY0QmZPTTZiWVRjdmlKVXYwRU5CL0JLblpX?=
 =?utf-8?B?Szl6NHhFcGhFUjFrTXVoOTNWblhkV3hOUU1SeEIxTDk0a1IwRUVMeCtoKzFp?=
 =?utf-8?B?Y1JtYW5qSnBlTVJQeG1tQlllUkRGSEtKYTNKTkNDazhHTVRTNFFuOStKcW56?=
 =?utf-8?B?NXYrbEVsdjBwdE9qdjVIeTlRbC9jelFNbGhoekVvRlFpc2VEV29MbjhRV29L?=
 =?utf-8?B?OXpTY3lwbjZyWFZFSW84QURUc1MxUTA4MnJNREUvRFluWkhmZStxTTNOZ05l?=
 =?utf-8?B?cVdhRjJ1OTZCOWZBTXMvL2xSTm9yUng5M2tuNXZ5Uk4vN0QzTkVaRnB0WUJa?=
 =?utf-8?B?OTY2aDcvRjFjVGdieTloK2ppWHVVYXNJNGFqdzRlSm1WNXRJUmhtaEFpZ0E2?=
 =?utf-8?B?SStHcWFVYlFva2dvT2JZNGdSN1RjZjVLRzRON2Rja0FwZXBieFlnWFZMUkVT?=
 =?utf-8?B?YVZ5Y01Hd05nRW9RY2J4Um1TYnljTFJEQWY4eVdFQWFPN2tDcjgvV2FQUHhK?=
 =?utf-8?B?Y05adk9BdVBqZ0djYnVGck55OThjSWFrSW5seGpBUUFLNzAwZ1pBS2YvUm44?=
 =?utf-8?B?aDRUNHFYd2M3cXNWTXgyeVc3VHE3dzBRTStGd1JHY3VkdDBqL3ljQUlOMG9H?=
 =?utf-8?B?Q1J3Y21oSzVrWnZBS1V1Q3JidlZUSkJiYVVCei9oRTVVakRQL1dsUk8wejFs?=
 =?utf-8?B?SC9jMFpIMEgwY3IwWGw5T2dZcXZad2J4RW1WcllEbVFHUXBoWE5BSlpkMDZx?=
 =?utf-8?B?eUhraEFHbCtUZjRzKy9Od2JiNHpwcmZKNW9JVFZuMUhRY3RQYTlLZzVwRFUr?=
 =?utf-8?B?Q21VZC8rQXBHZ2FQY0hhMzN1Kzl3bjZ0UXJUWmJwZnhBclNNejMrblpmd2hJ?=
 =?utf-8?B?dldUZFVVL21JY2dNWk56M0tBcnVORkVSRDVSbmJKcHVWbE1IVlcyVmdZMFB3?=
 =?utf-8?B?MkNydWVKY1hBSXlORUFXV1BVZ0ZteFJMcUdTajlBNmF4Skw4Q25nZmRsY0R5?=
 =?utf-8?B?T0ZkN2pMYzVNalcwUHFQbGQvTlAydUZ6ODE5cHRMcjhxL3k5SWUyNGpEK3po?=
 =?utf-8?B?VTQ1TERJUTBIdmJGdDd0YnRmOUZxcnRnUmRwK1EzVEdBQk5TOU1GZWtvdWpR?=
 =?utf-8?B?ekJacnZScGM4cm1NZUVCa2xYcEM3QmVYVUFtVlFWelcxc0pxZFhhTXpUKzZO?=
 =?utf-8?B?TmZUWjhJaHhjQkFPSGtwNGRaUXpRZHdiV2l3WUJLTnJTSEZJTlU0MEtIaHFF?=
 =?utf-8?B?d3U0TS9kZ2ZLS2xFUnFvbzMvWVMyV1Bta1VjcnUyUldxbEVBb2pWTnlOc1E4?=
 =?utf-8?B?Y091WDJPMUw3UWkydXU3N2FzTlQvWjA3N1JJTkRIQ3h6S0M1V2p0L1hxemx2?=
 =?utf-8?B?SlJGRUFjUzRuZmhYYUMvVGpoL1lubHNTLzN4dzVLYlIyU3ZNR2dsSit0b1Jw?=
 =?utf-8?B?VjVVYThpMlZMWG5XbmVpZTlrdU5pWk1kNHY5RUJDL0t6QU0yM21iRlMzNEJ2?=
 =?utf-8?B?a1QyOGlrYlpKRDlWVU4yeUtuWDhJMFFQaU9NWDZVVUg4UWdnME83V3ZhN3FL?=
 =?utf-8?B?S05HMVhCOGFrNm10SlhMYmpIT2VLVXJTTkVMTUhnNENhRWRpd3Nnblo1SHlM?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d8c929-7105-4cb8-3327-08db31f65f62
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 14:44:06.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAD8VVv6UWGd14RlVCZGJwnI9qClGsyI3CkphTShHMUHlxB5Dg1hi5i6gbig9EhxWgUFB4kxSH9N+JqDufPjn2XXRbao9I3LTktSRuYvgac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe/reg_sr: Save errors for kunit
 integration
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 08:29:41PM +0200, Michał Winiarski wrote:
>On Tue, Mar 21, 2023 at 03:05:26PM -0700, Lucas De Marchi wrote:
>> When there's an entry that is dropped when xe_reg_sr_add(), there's
>> not much we can do other than reporting the error - it's for certain a
>> driver issue or conflicting workarounds/tunings. Save the number of
>> errors to be used later by kunit to report where it happens.
>
>Why there's not much we can do?
>We can propagate the error to the upper layers and fail the probe.
>Fail-fast?

I thought about adding a patch to propagate the errors, but it looked
like the wrong thing to do. Note that the following test is for the WAs.
Completely failing the probe() because we have a duplicate or incompatible
entries would be the equivalent of spreading BUG_ON() in the driver so
we can "fail fast".  Duplicate entries for example are completly
harmless (but undesired).  Even for incompatible entries, I don't
think it justifies blocking the module probe.

Lucas De Marchi

>
>The following test still makes sense (and LGTM), since it's still a good
>idea to be able to validate everything without having to probe() on
>actual platform. I would expect it to check return values rather than
>sr->errors though.
>
>-Michał
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c       | 8 ++++++++
>>  drivers/gpu/drm/xe/xe_reg_sr_types.h | 4 ++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 9eaf1be27886..83f29aeb9250 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -84,6 +84,13 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
>>  	return true;
>>  }
>>
>> +static void reg_sr_inc_error(struct xe_reg_sr *sr)
>> +{
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +	sr->errors++;
>> +#endif
>> +}
>> +
>>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>>  		  const struct xe_reg_sr_entry *e)
>>  {
>> @@ -121,6 +128,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>>  	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
>>  		  idx, e->clr_bits, e->set_bits,
>>  		  str_yes_no(e->masked_reg), ret);
>> +	reg_sr_inc_error(sr);
>>
>>  	return ret;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
>> index 3d2257891005..91469784fd90 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
>> @@ -32,6 +32,10 @@ struct xe_reg_sr {
>>  	} pool;
>>  	struct xarray xa;
>>  	const char *name;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +	unsigned int errors;
>> +#endif
>>  };
>>
>>  #endif
>> --
>> 2.39.0
>>
