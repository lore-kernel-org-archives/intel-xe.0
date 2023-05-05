Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A752C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 07:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4EC10E57F;
	Fri,  5 May 2023 07:24:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F5B10E57F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683271482; x=1714807482;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=72K5Ezq/l0Fklw9LMl2bARrL8J0UhJDxgbd/jLSPZgQ=;
 b=M9dj+JMj7rWKYabBtGUZLlLEWB13LwqM10SF2YMjyogdiE8lglr67uZu
 Kt+PBRXPfkiJpWbfk8s7H7+f/5qxdkPoNURzUADVmZjE5gSKa2muVFdlo
 rZ9fbale1YLZl/8TPjh0uf3MQyzODeL8bUu0cCem9LffIEjYpngpKNzxT
 IixXBMJmNSPoXDpjdBgCQPT8mc1EwqNR8+zM1oT0u/PpF7K08S3K6o+lv
 9tXQf/0PZ6JcHqWLsza0QR2m2rG8LlZbH81VXeZYvUwcXY1maayvcKYGS
 oYrNBZpBKWsG71CSR0Cpk77VfQkXp7MJLB/VX3ZVHL2sUUtjaaezMdk4n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414683781"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="414683781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="821555909"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="821555909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2023 00:24:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:24:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 00:24:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 00:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/b4asCJ2Q02+9mW+tEEUSaRJDOGAukGRX+y1DiHioiC1nbzUOEivRbY75LuminHfmHvNgWNwFiUsqIN0AB46Jd6Ay33i2Koxti5pRMskAQGK1PPMYsbGTd/HSLS4CAZ2p8YroCccA9d3Y1VZFh1NYuMb7CAep6maDWwwM20TKQHCdC1BA8X33cHxs+ZNiIRsGjfBXypBm6fMiBqQqkK2LCJoZfcny23RCbSvWf0PJyJwGeqecL5HMXNdYv7yiwhXebAEnlPbAuioi45ph5AOl13C2T3jAyX4SY9CVHZSBDgzfk0AxRBb2MjX24e0DrBBiHcisANUn0nuljm3BGt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0sOpBNXSadAKRiIwEZgIqkuXEP7bYb9RI06Y782WZs=;
 b=YgQNKqkALip2fyxvpVlgT/VpOJFJ7BxP3BIaAo9H5GpmdEcW4kzysFHKak5CWJQTQBC8f0Qg8Le1KlchIDJiRU3YsJc77zKDi29jcoIVSk8rbXRuGJ8DMHDiZyCehbU3WuFz+sCmDbnwPYJVkohFxP7Oywlgo6Nt7YTT1Elj77sA6FH7fTAi881XTd3AQKcrhjFy/xcyN7c2X9fwvPYL218G/tK0wcr1SfLwVRn9UGZTkNICY6KW9BsHM9rZHP+/fKfl0aTM2C/eaMTG5pB33OzAntLzYReiaYW2xK9bQ7oRxolYwkhMbsZIhcU+d0IfSpTFY4Kv3b9+flkLfKSK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 07:24:31 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 07:24:30 +0000
Message-ID: <1075c790-86bd-bc5a-3b3b-6b823ff7b205@intel.com>
Date: Fri, 5 May 2023 12:54:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
 <20230425002256.GK10045@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB7056F4BB0BE08B3A9772A8C1B36B9@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20230504000253.GN10045@mdroper-desk1.amr.corp.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230504000253.GN10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2d6224-23ae-4e4c-6513-08db4d39c3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVHwRyscLprPgVoWrPqZw+GK6WhRIaiKgK+3LRes0tBNMI8gVr4Dt1mms+M46GNe5qObIpnxXb+aty1s1xD/eqdBDZQpxYGQNVOoa13SjkYlzihPIR1t3x65E6MFKWkY9nLbPyytKbyAhlivXnI3T3dXtAdVnVt6NRntmsxzZh49Gn/yYyh+JLQLnGqYf8ndUbBGscjl2M7ZSqHLk7JqAZfE2yAjdQwj285S+ftYCPks8PmH6UgoS0ountXSNIXPrQPwbzossTNqlKKpdaKd/EanWXFtk9LcglLqS28JW1zdTiOLSSdJeE/RTkUMJFiumM0v6nNSaJz47XIFZTfU4eJhyFfaEF7PoRI4ic2hqb5jx97ldfg3YK02LMdV8MYgooyzW/a+nXLwgk5zix5hAGcVB34Ko/BlVr8vqTiV0hNN6IJp+pb+BXP/29EEl29Njv3nEu6ueakFAsuIR8NU/TFxkQI9GDL9IenKQXTfeQgRkRBUcDjwxO41TEjb8ghOXGrPVQzJrDPkRhEjEDrDAVHKTN2SglV0Aqcw8nRnJ32zkERuorMJMgQG5Gng/lWFATpnBs4CVu0GBrJLW2t2SgYxSJnZtg2WTeHL25+HWew0wBVlT24MQth7Me/i1cUUQDHIh+xdpEgKthjXbLDsi52Cw4AGLLHRMhNShO1aQAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(83380400001)(2616005)(186003)(2906002)(30864003)(38100700002)(36756003)(31696002)(86362001)(82960400001)(8936002)(8676002)(5660300002)(966005)(4326008)(6636002)(66556008)(66476007)(66946007)(41300700001)(6486002)(6666004)(478600001)(316002)(31686004)(53546011)(26005)(6506007)(6512007)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtiT1krdnhTdE1aOXNCMjBGYTVJdVllMlNHL09MOVZSSXZHdGlLSVpvMjcy?=
 =?utf-8?B?SktiZkJnUFl3d2c5TnlRWnlLL0ZiTC9VK0YyUC9FY0c4K2U0LzB1WHFja1Rp?=
 =?utf-8?B?dDl2YWk1bXhzblpMMzBPWG1mNlgzRW45bFJRRitNbjVIdFZDd2YzbVdMN3pi?=
 =?utf-8?B?WVRnMWE1OEJOdkd0Q1d3aEErZ1pnd1JQdHlnSitLZmY4Nmlzc2hVT0tDdWo0?=
 =?utf-8?B?K1ZSWU5wMUF2LytONHpQZCtNN3F4Mm5nSDJJTzVhODJtWTRmeFcrRVV2RzBq?=
 =?utf-8?B?YWVJMHByMnRnSGplR1lxZHZ1ZFkreVVYVHJoeGtudkJaa25ndUFQbFVtd1BS?=
 =?utf-8?B?MlFzRWVjT3BYejdrVVRFbzMwMkN2SlR1eGRvVldiU3pzaTlwOENxdmlkUW5R?=
 =?utf-8?B?R2E3ZUF5L2NMS2dBRG5oL2I2aHdtemE1NWdpa3N2WXo4MlBHcm5aZE5pS3Bj?=
 =?utf-8?B?ZEdYUU82ejMxbFkxNTVmMXEwRWhtZkg3R2ExUzFnQW1NZXk5RXJBM2ZvaXBQ?=
 =?utf-8?B?cDdiQWhzZmVhdENWcmFlWm9ySVVXS2IxYnRaa2xmMlB2RXdRZFllUWtNSmR5?=
 =?utf-8?B?cG9OWmt3MmtmZW0yZGo4V1hhQ0h4RVJpZVJ2eWhySVBtWG4rMGIyd2ZMYW91?=
 =?utf-8?B?Uy9KU3hXT282Vjh4UzBXaHNhVVU3bmJJRUJrRnFrUGdQNW4xOXlMZHJucjZV?=
 =?utf-8?B?V3VlNzdYZFUzbkxXMkFqcDA3M1JPVWN1OVQ2UVJqSU1PU0Y2WTdKME9OSEQ4?=
 =?utf-8?B?Y0h1TkZITVd0NjY4NkNXYnVVRThJb1ZmK0VLcUFOSER3YzY1a0l2K1ZUZktN?=
 =?utf-8?B?dGtoTy95ZmlOUG5zbGZsSXNKVmsyTTFKMTlyazJYNm1vOUlSazhibDZwNWNl?=
 =?utf-8?B?QmFzV2haRzFuTnI4WTVLOG9FeG0zSjBURDFkRXhMU0RvVEdRN3hJVlNvQmd1?=
 =?utf-8?B?OG5mblF1WE56YmtZSW9Tb1lpeUd4Uk11eWQxUXg0SVhJYzdoSmtmNkdoZjJh?=
 =?utf-8?B?eGFoMzVOZkpVbDNQVVZwZnl0cTltNnViWnUrN3hOYUU4RzVKMHhJTGkxak9x?=
 =?utf-8?B?aDBUOFBGQzVoZkM1eEFOTHZiLzZkNHRiWDExMVBpSTE4YjhwK1V3aEN2OEJw?=
 =?utf-8?B?aDlJTTdIcGVmOXdoanQzY0psMFAxK0NKa3JLWXBUVEZ6YUt5MmFnU0NHMk9a?=
 =?utf-8?B?dVpvV01tdUZnZU5NQzl4NHZPRkFIOGdnc3ZXK0NIYTRROXZCWFpQSWVRb3ZC?=
 =?utf-8?B?bitKclU5R2xmWEtxdTQzQm1ZK0s5VkFNYXFrRDFLY2JRc2J6Y2tTUStFQjZl?=
 =?utf-8?B?UkxucWNXa0FTWFVLc0tTc1RzZ1dBbm51VWxVWk5xSnVDWVh3eStzSGRsNTJE?=
 =?utf-8?B?SVAvVTg2cFpZMmc2M1Q2d1ZUYWJ2SkN3cDRLWVB5TkJjbG1HZlpQMmpjaGtY?=
 =?utf-8?B?aWdrcExXaEkvc2huK2ZKelpSWjJ3a25EQy8waTBjV3Z0RTZTWXZsRnc0ZTMr?=
 =?utf-8?B?VmdGdzlwUTNJR1hiVVo2TktTcEJrRW0zVVlweWVWcnZkSDg4UVBQZlJqcHJo?=
 =?utf-8?B?QUdseGgwL3hDbHQxZmVYN1BMR2RQd2pTNC9WSkZqc3Yxd0hGVzZXVFJwOWQr?=
 =?utf-8?B?bVlhM2VzYmxXSUJoQVR2SGhuWGdLSTZHcTFFUmhybTZORmFsVk5oWnEwVGph?=
 =?utf-8?B?UmphVy9DNFJ2MGMvK0ZXMVkwOVUvSDNVbDVXd1NCVFBncUlSaW5GejQwZmhV?=
 =?utf-8?B?RXFhSE5lZjZTNTArRks3N0ZoVldzZ2VXWjZXT0tzS1RLUEhLYmU1S0hMMlB1?=
 =?utf-8?B?Ny9aeWMzQlpCdXExMUZrQTVSbVBuUnVPb29MZXZpUlY2dFhrZEZad0Zyd1da?=
 =?utf-8?B?WENkSkp6TVJHdldoUGtVcmtLd1VsT21YVjljemJxUmNVVExwUlFOQXliMGx5?=
 =?utf-8?B?UzdQakZOMXl3V0ZCN2dVRWxCeGFJWTB1Qkt2NGZoL21jM0FIOW91K2lQcWlm?=
 =?utf-8?B?bWZqUkVBUkZuT1prdGkzRWI1RGUrT05PUm5uNlBhZHdxdFZrWnU3UElabVpo?=
 =?utf-8?B?MXVpNS9JcmRRUDAyUjMvc25mUFEwVE5WczE2c0ZILzZFRnJrQzVtaUkzb2pJ?=
 =?utf-8?B?ditXZ21iQXhQa0NlcWtaQlI4d1BVQWF2a2h4ckM5TEE2NFdseUI5Mmo3Q25K?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2d6224-23ae-4e4c-6513-08db4d39c3b1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:24:29.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCa9RNoROTrgqIFiIWAqsF4Ow9J3M6rYJ0mDUigcEFy2aqq5c0hsd6vh9U9zgrhrire54LblvFm1044mUcDzitYTFa0lt2AYvvlNsAV3dNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 04-05-2023 05:32, Matt Roper wrote:
> On Fri, Apr 28, 2023 at 01:00:04AM -0700, Ghimiray, Himal Prasad wrote:
> ...
>>> All of this new infrastructure seems pretty questionable at the moment.
>>> We're doing extra work to count up errors, but then never doing anything
>>> with the counts.  You mention in the cover letter that these will be exposed
>>> to userspace eventually, but what's the benefit of that?  Which userspace
>>> component is going to actually use this information?  What do you expect
>>> userspace to do if it finds out there's been a fatal or correctable error in
>>> some low-level hardware unit?  Generally userspace shouldn't even need to
>>> care about the really low-level hardware details; if something has truly gone
>>> fatally wrong, it's game over for userspace and it probably doesn't matter
>>> exactly where in the hardware things are actually busted.
>>>
>>> Without some extra justification from the userspace point of view, it feels
>>> like we're just adding a bunch of code that doesn't have a real-world
>>> purpose.
>> The error counters  exposed by KMD will be used by sysman 
>> They will be categorized to specific category of error in sysman:
>>  https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras
> 
> L0 sysman looks sort of like a complicated libdrm replacement.  I.e.,
> it's just a wrapper library over various uapi interfaces, but isn't
> really a "consumer" of that uapi itself.  We need to understand the
> whole top-to-bottom stack to make sure that whatever interfaces and
> representation are selected (both at the Xe and Sysman levels) actually
> makes sense and satisfies the full stack needs.
> 
> Is the actual reporting of these errors going to be done via the
> standard Linux RAS/EDAC interfaces?  I.e., what's documented at
> https://www.kernel.org/doc/html/v6.3/admin-guide/ras.html ?  If so, then
> there's already a bunch of real userspace tools that work with that, so
> that would probably help justify the work here, and make it clear that
> we're not just reinventing the wheel.  If we're not tying into that,
> then we probably need to justify clearly why it can't be used.

I don't think we can use EDAC, IIUC it expects errors to be reported via
MCA(Machine Check Architecute)/MCE and our HW doesn't do that. the
correctable and non fatal errors are reported via MSI and fatal as a
PCI_ERR message.

Thanks,
Aravind.
> 
>>>
>>>> +			    const enum xe_gt_driver_errors error,
>>>> +			    const char *fmt, ...)
>>>> +{
>>>> +	struct va_format vaf;
>>>> +	va_list args;
>>>> +
>>>> +	va_start(args, fmt);
>>>> +	vaf.fmt = fmt;
>>>> +	vaf.va = &args;
>>>> +
>>>> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
>>>> +		     INTEL_GT_DRIVER_ERROR_COUNT);
>>>> +
>>>> +	WARN_ON_ONCE(error >= INTEL_GT_DRIVER_ERROR_COUNT);
>>>> +
>>>> +	gt->errors.driver[error]++;
>>>> +
>>>> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
>>>> +			    gt->info.id,
>>>> +			    xe_gt_driver_errors_to_str[error],
>>>> +			    &vaf);
>>>> +	va_end(args);
>>>> +}
>>>> +
>>>>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)  {
>>>>  	struct xe_gt *search;
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> index 8f29aba455e0..9580a40c0142 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> @@ -33,6 +33,43 @@ enum xe_gt_type {
>>>>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 *
>>>> XE_MAX_DSS_FUSE_REGS)];  typedef unsigned long
>>>> xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>>>>
>>>> +/* Count of GT Correctable and FATAL HW ERRORS */ enum
>>>> +intel_gt_hw_errors {
>>>> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
>>>> +	INTEL_GT_HW_ERROR_COR_L3BANK,
>>>> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
>>>> +	INTEL_GT_HW_ERROR_COR_GUC,
>>>> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
>>>> +	INTEL_GT_HW_ERROR_COR_SLM,
>>>> +	INTEL_GT_HW_ERROR_COR_EU_IC,
>>>> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
>>>> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
>>>> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
>>>> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
>>>> +	INTEL_GT_HW_ERROR_FAT_FPU,
>>>> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
>>>> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
>>>> +	INTEL_GT_HW_ERROR_FAT_GUC,
>>>> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
>>>> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
>>>> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
>>>> +	INTEL_GT_HW_ERROR_FAT_SLM,
>>>> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
>>>> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
>>>> +	INTEL_GT_HW_ERROR_FAT_TLB,
>>>> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
>>>> +	INTEL_GT_HW_ERROR_COUNT
>>>> +};
>>>> +
>>>> +enum xe_gt_driver_errors {
>>>> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
>>>> +	INTEL_GT_DRIVER_ERROR_COUNT
>>>> +};
>>>> +
>>>> +void xe_gt_log_driver_error(struct xe_gt *gt,
>>>> +			    const enum xe_gt_driver_errors error,
>>>> +			    const char *fmt, ...);
>>>> +
>>>>  struct xe_mmio_range {
>>>>  	u32 start;
>>>>  	u32 end;
>>>> @@ -357,6 +394,12 @@ struct xe_gt {
>>>>  	 *    of a steered operation
>>>>  	 */
>>>>  	spinlock_t mcr_lock;
>>>> +
>>>> +	struct intel_hw_errors {
>>>> +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
>>>> +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
>>>> +	} errors;
>>>> +
>>>>  };
>>>>
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>> index 6b922332bff1..4626f7280aaf 100644
>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>> @@ -19,6 +19,7 @@
>>>>  #include "xe_hw_engine.h"
>>>>  #include "xe_mmio.h"
>>>>
>>>> +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
>>>>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>>>> {
>>>>  	u32 val = xe_mmio_read32(gt, reg.reg); @@ -359,44 +360,281 @@
>>>> hardware_error_type_to_str(const enum hardware_error hw_err)
>>>>  	}
>>>>  }
>>>>
>>>> +#define xe_gt_hw_err(gt, fmt, ...) \
>>>> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected "
>>> fmt, \
>>>> +			(gt)->info.id, ##__VA_ARGS__)
>>>
>>> As on the previous patch, it looks like we're printing error-level kernel
>>> messages for correctable errors (i.e., things the hardware caught and fixed
>>> internally like ECC).  Generally those kind of things shouldn't be putting
>>> errors in the kernel log because there's no actual problem from the end user
>>> perspective.
>> Agreed. Should we use warning for correctable errors ?
> 
> Presumably we shouldn't be reporting them in dmesg at all by default.
> It looks like the EDAC subsystem has its own ways of controlling if/when 
> stuff shows up in dmesg.
> 
>>>
>>>> +
>>>>  static void
>>>> -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
>>>> hw_err)
>>>> +xe_gt_correctable_hw_error_stats_update(struct xe_gt  *gt, unsigned
>>>> +long errstat)
>>>>  {
>>>> -	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>>>> -	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
>>>> -	u32 errstat;
>>>> +	u32 errbit, cnt;
>>>>
>>>> -	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>>>> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>>>> +		return;
>>>>
>>>> -	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
>>>> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
>>>> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) &
>>> PVC_COR_ERR_MASK)) {
>>>> +			xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +					       "UNKNOWN CORRECTABLE
>>> error\n");
>>>> +			continue;
>>>> +		}
>>>>
>>>> -	if (unlikely(!errstat)) {
>>>> -		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n",
>>> hw_err_str);
>>>> -		return;
>>>> +	switch (errbit) {
>>>> +	case L3_SNG_COR_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
>>>> +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
>>>> +		break;
>>>> +	case GUC_COR_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
>>>> +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE
>>> error\n");
>>>> +		break;
>>>> +	case SAMPLER_COR_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
>>>> +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE
>>> error\n");
>>>> +		break;
>>>> +	case SLM_COR_ERR:
>>>> +		cnt = xe_mmio_read32(gt,
>>> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
>>>> +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE
>>> error\n", cnt);
>>>> +		break;
>>>> +	case EU_IC_COR_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
>>>> +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
>>>> +		break;
>>>> +	case EU_GRF_COR_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
>>>> +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE
>>> error\n");
>>>> +		break;
>>>> +	default:
>>>> +		xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
>>>> +		break;
>>>> +	}
>>>>  	}
>>>> +}
>>>>
>>>> -	/*
>>>> -	 * TODO: The GT Non Fatal Error Status Register
>>>> -	 * only has reserved bitfields defined.
>>>> -	 * Remove once there is something to service.
>>>> -	 */
>>>> -	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>>>> -		DRM_ERROR("detected Non-Fatal error\n");
>>>> -		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
>>> errstat);
>>>> +static void xe_gt_fatal_hw_error_stats_update(struct xe_gt *gt,
>>>> +unsigned long errstat) {
>>>> +	u32 errbit, cnt;
>>>> +
>>>> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>>>>  		return;
>>>> +
>>>> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
>>>> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) &
>>> PVC_FAT_ERR_MASK)) {
>>>> +			xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +					       "UNKNOWN FATAL error\n");
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +	switch (errbit) {
>>>> +	case ARRAY_BIST_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
>>>> +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
>>>> +		break;
>>>> +	case FPU_UNCORR_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
>>>> +		xe_gt_hw_err(gt, "FPU FATAL error\n");
>>>> +		break;
>>>> +	case L3_DOUBLE_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
>>>> +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
>>>> +		break;
>>>> +	case L3_ECC_CHK_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
>>>> +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
>>>> +		break;
>>>> +	case GUC_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
>>>> +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
>>>> +		break;
>>>> +	case IDI_PAR_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
>>>> +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
>>>> +		break;
>>>> +	case SQIDI_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
>>>> +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
>>>> +		break;
>>>> +	case SAMPLER_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
>>>> +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
>>>> +		break;
>>>> +	case SLM_FAT_ERR:
>>>> +		cnt = xe_mmio_read32(gt,
>>> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
>>>> +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
>>>> +		break;
>>>> +	case EU_IC_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
>>>> +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
>>>> +		break;
>>>> +	case EU_GRF_FAT_ERR:
>>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
>>>> +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
>>>> +		break;
>>>> +	default:
>>>> +		xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +				       "UNKNOWN FATAL error\n");
>>>> +		break;
>>>> +	}
>>>>  	}
>>>> +}
>>>>
>>>> -	/*
>>>> -	 * TODO: The remaining GT errors don't have a
>>>> -	 * need for targeted logging at the moment. We
>>>> -	 * still want to log detection of these errors, but
>>>> -	 * let's aggregate them until someone has a need for them.
>>>> -	 */
>>>> -	if (errstat & other_errors)
>>>> -		DRM_ERROR("detected hardware error(s) in
>>> ERR_STAT_GT_REG_%s: 0x%08x\n",
>>>> -			  hw_err_str, errstat & other_errors);
>>>> +static void
>>>> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
>>>> +hw_err) {
>>>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>>>> +	unsigned long errstat;
>>>> +
>>>> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>>>>
>>>> -	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
>>>> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>>>> +		errstat = xe_mmio_read32(gt,
>>> ERR_STAT_GT_REG(hw_err).reg);
>>>> +		if (unlikely(!errstat)) {
>>>> +			xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +					       "ERR_STAT_GT_REG_%s
>>> blank!\n", hw_err_str);
>>>> +			return;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	switch (hw_err) {
>>>> +	case HARDWARE_ERROR_CORRECTABLE:
>>>> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>>>> +			bool error = false;
>>>> +			int i;
>>>> +
>>>> +			errstat = 0;
>>>> +			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
>>>> +				u32 err_type =
>>> ERR_STAT_GT_COR_VCTR_LEN;
>>>> +				unsigned long vctr;
>>>> +				const char *name;
>>>> +
>>>> +				vctr = xe_mmio_read32(gt,
>>> ERR_STAT_GT_COR_VCTR_REG(i).reg);
>>>> +				if (!vctr)
>>>> +					continue;
>>>> +
>>>> +				switch (i) {
>>>> +				case ERR_STAT_GT_VCTR0:
>>>> +				case ERR_STAT_GT_VCTR1:
>>>> +					err_type =
>>> INTEL_GT_HW_ERROR_COR_SUBSLICE;
>>>> +					gt->errors.hw[err_type] +=
>>> hweight32(vctr);
>>>> +					name = "SUBSLICE";
>>>> +
>>>> +					/* Avoid second read/write to error
>>> status register*/
>>>> +					if (errstat)
>>>> +						break;
>>>> +
>>>> +					errstat = xe_mmio_read32(gt,
>>> ERR_STAT_GT_REG(hw_err).reg);
>>>> +					xe_gt_hw_err(gt,
>>> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
>>>> +						     errstat);
>>>> +
>>> 	xe_gt_correctable_hw_error_stats_update(gt, errstat);
>>>> +					if (errstat)
>>>> +						xe_mmio_write32(gt,
>>> ERR_STAT_GT_REG(hw_err).reg,
>>>> +								errstat);
>>>> +					break;
>>>> +
>>>> +				case ERR_STAT_GT_VCTR2:
>>>> +				case ERR_STAT_GT_VCTR3:
>>>> +					err_type =
>>> INTEL_GT_HW_ERROR_COR_L3BANK;
>>>> +					gt->errors.hw[err_type] +=
>>> hweight32(vctr);
>>>> +					name = "L3 BANK";
>>>> +					break;
>>>> +				default:
>>>> +					name = "UNKNOWN";
>>>> +					break;
>>>> +				}
>>>> +				xe_mmio_write32(gt,
>>> ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
>>>> +				xe_gt_hw_err(gt, "%s CORRECTABLE error,
>>> ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
>>>> +					     name, i, vctr);
>>>> +				error = true;
>>>> +			}
>>>> +
>>>> +			if (!error)
>>>> +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE
>>> error\n");
>>>> +		} else {
>>>> +			xe_gt_correctable_hw_error_stats_update(gt,
>>> errstat);
>>>> +			xe_gt_hw_err(gt,
>>> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
>>>> +		}
>>>> +		break;
>>>> +	case HARDWARE_ERROR_NONFATAL:
>>>> +	      /*
>>>> +	       * TODO: The GT Non Fatal Error Status Register
>>>> +	       * only has reserved bitfields defined.
>>>> +	       * Remove once there is something to service.
>>>> +	       */
>>>> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected
>>> Non-Fatal error\n");
>>>> +		break;
>>>> +	case HARDWARE_ERROR_FATAL:
>>>> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>>>> +			bool error = false;
>>>> +			int i;
>>>> +
>>>> +			errstat = 0;
>>>> +			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
>>>> +				u32 err_type =
>>> ERR_STAT_GT_FATAL_VCTR_LEN;
>>>> +				unsigned long vctr;
>>>> +				const char *name;
>>>> +
>>>> +				vctr = xe_mmio_read32(gt,
>>> ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
>>>> +				if (!vctr)
>>>> +					continue;
>>>> +
>>>> +				/* i represents the vector register index */
>>>> +				switch (i) {
>>>> +				case ERR_STAT_GT_VCTR0:
>>>> +				case ERR_STAT_GT_VCTR1:
>>>> +					err_type =
>>> INTEL_GT_HW_ERROR_FAT_SUBSLICE;
>>>> +					gt->errors.hw[err_type] +=
>>> hweight32(vctr);
>>>> +					name = "SUBSLICE";
>>>> +
>>>> +					/*Avoid second read/write to error
>>> status register.*/
>>>> +					if (errstat)
>>>> +						break;
>>>> +
>>>> +					errstat = xe_mmio_read32(gt,
>>> ERR_STAT_GT_REG(hw_err).reg);
>>>> +					xe_gt_hw_err(gt,
>>> "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
>>>> +
>>> 	xe_gt_fatal_hw_error_stats_update(gt, errstat);
>>>> +					if (errstat)
>>>> +						xe_mmio_write32(gt,
>>> ERR_STAT_GT_REG(hw_err).reg,
>>>> +								errstat);
>>>> +					break;
>>>> +
>>>> +				case ERR_STAT_GT_VCTR2:
>>>> +				case ERR_STAT_GT_VCTR3:
>>>> +					err_type =
>>> INTEL_GT_HW_ERROR_FAT_L3BANK;
>>>> +					gt->errors.hw[err_type] +=
>>> hweight32(vctr);
>>>> +					name = "L3 BANK";
>>>> +					break;
>>>> +				case ERR_STAT_GT_VCTR6:
>>>> +					gt-
>>>> errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
>>>> +					name = "TLB";
>>>> +					break;
>>>> +				case ERR_STAT_GT_VCTR7:
>>>> +					gt-
>>>> errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
>>>> +					name = "L3 FABRIC";
>>>> +					break;
>>>> +				default:
>>>> +					name = "UNKNOWN";
>>>> +					break;
>>>> +				}
>>>> +				xe_mmio_write32(gt,
>>> ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
>>>> +				xe_gt_hw_err(gt, "%s FATAL error,
>>> ERR_VECT_GT_FATAL_%d:0x%08lx\n",
>>>> +					     name, i, vctr);
>>>> +				error = true;
>>>> +			}
>>>> +			if (!error)
>>>> +				xe_gt_hw_err(gt, "UNKNOWN FATAL
>>> error\n");
>>>> +		} else {
>>>> +			xe_gt_fatal_hw_error_stats_update(gt, errstat);
>>>> +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n",
>>> errstat);
>>>> +		}
>>>> +		break;
>>>> +	default:
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>>>> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
>>> errstat);
>>>>  }
>>>>
>>>>  static void
>>>> @@ -409,7 +647,8 @@ xe_hw_error_source_handler(struct xe_gt *gt,
>>> const enum hardware_error hw_err)
>>>>  	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
>>>>  	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
>>>>  	if (unlikely(!errsrc)) {
>>>> -		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n",
>>> hw_err_str);
>>>> +		xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +				       "DEV_ERR_STAT_REG_%s blank!\n",
>>> hw_err_str);
>>>>  		goto out_unlock;
>>>>  	}
>>>>
>>>> @@ -417,8 +656,9 @@ xe_hw_error_source_handler(struct xe_gt *gt,
>>> const enum hardware_error hw_err)
>>>>  		xe_gt_hw_error_handler(gt, hw_err);
>>>>
>>>>  	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
>>>> -		DRM_ERROR("non-GT hardware error(s) in
>>> DEV_ERR_STAT_REG_%s: 0x%08x\n",
>>>> -			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
>>>> +		xe_gt_log_driver_error(gt,
>>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
>>>> +				       "non-GT hardware error(s) in
>>> DEV_ERR_STAT_REG_%s: 0x%08x\n",
>>>> +				       hw_err_str, errsrc &
>>> ~DEV_ERR_STAT_GT_ERROR);
>>>>
>>>>  	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
>>>>
>>>> @@ -634,12 +874,44 @@ static void irq_uninstall(struct drm_device *drm,
>>> void *arg)
>>>>  		pci_disable_msi(pdev);
>>>>  }
>>>>
>>>> +/**
>>>> + * process_hw_errors - checks for the occurrence of HW errors
>>>> + *
>>>> + * This checks for the HW Errors including FATAL error that might
>>>> + * have occurred in the previous boot of the driver which will
>>>> + * initiate PCIe FLR reset of the device and cause the
>>>> + * driver to reload.
>>>
>>> Is this saying that there's already been a PCIe FLR and you're trying to read
>>> the registers after that reset has happened?  The bspec indicates that these
>>> registers have 'DEV' style reset, so they wouldn't be able to preserve their
>>> values across a reset.
>> Registers preserve the value across reset.
>> BSPEC: 50875
>>>
>>>> + */
>>>> +static void process_hw_errors(struct xe_device *xe) {
>>>> +	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
>>>> +	u32 dev_pcieerr_status, master_ctl;
>>>> +	struct xe_gt *gt;
>>>> +	int i;
>>>> +
>>>> +	dev_pcieerr_status = xe_mmio_read32(gt0,
>>> DEV_PCIEERR_STATUS.reg);
>>>> +
>>>> +	for_each_gt(gt, xe, i) {
>>>> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
>>>> +			xe_hw_error_source_handler(gt,
>>> HARDWARE_ERROR_FATAL);
>>>> +
>>>> +		master_ctl = xe_mmio_read32(gt,
>>> GEN11_GFX_MSTR_IRQ.reg);
>>>> +		xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg,
>>> master_ctl);
>>>> +		xe_hw_error_irq_handler(gt, master_ctl);
>>>> +	}
>>>> +	if (dev_pcieerr_status)
>>>> +		xe_mmio_write32(gt, DEV_PCIEERR_STATUS.reg,
>>> dev_pcieerr_status); }
>>>> +
>>>>  int xe_irq_install(struct xe_device *xe)  {
>>>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>>>>  	irq_handler_t irq_handler;
>>>>  	int err;
>>>>
>>>> +	if (IS_DGFX(xe))
>>>> +		process_hw_errors(xe);
>>>
>>> Why is this conditional on DGFX?  From what I can see this also applies to
>>> integrated platforms like MTL too.
>> From RAS perspective report of error is required on DGFX only.
>> sysman don't use these counters from IGFX
> 
> I don't think we should add artificial limitations to the kernel driver
> just because one wrapper library (which probably won't even get used by
> most users) has them.  If the hardware can report errors, and if users
> can bypass sysman and just use EDAC stuff, then I don't see a reason to
> hide the errors on integrated platforms?
> 
> 
> Matt
> 
>>>
>>>
>>> Matt
>>>
>>>> +
>>>>  	irq_handler = xe_irq_handler(xe);
>>>>  	if (!irq_handler) {
>>>>  		drm_err(&xe->drm, "No supported interrupt handler"); diff --
>>> git
>>>> a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
>>>> 1844cff8fba8..69098194cef8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -73,6 +73,7 @@ struct xe_device_desc {
>>>>  	bool has_range_tlb_invalidation;
>>>>  	bool has_asid;
>>>>  	bool has_link_copy_engine;
>>>> +	bool has_gt_error_vectors;
>>>>  };
>>>>
>>>>  __diag_push();
>>>> @@ -232,6 +233,7 @@ static const struct xe_device_desc pvc_desc = {
>>>>  	.supports_usm = true,
>>>>  	.has_asid = true,
>>>>  	.has_link_copy_engine = true,
>>>> +	.has_gt_error_vectors = true,
>>>>  };
>>>>
>>>>  #define MTL_MEDIA_ENGINES \
>>>> @@ -418,6 +420,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const
>>> struct pci_device_id *ent)
>>>>  	xe->info.vm_max_level = desc->vm_max_level;
>>>>  	xe->info.supports_usm = desc->supports_usm;
>>>>  	xe->info.has_asid = desc->has_asid;
>>>> +	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
>>>>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>>>  	xe->info.has_4tile = desc->has_4tile;
>>>>  	xe->info.has_range_tlb_invalidation =
>>>> desc->has_range_tlb_invalidation;
>>>> --
>>>> 2.25.1
>>>>
>>>
>>> --
>>> Matt Roper
>>> Graphics Software Engineer
>>> Linux GPU Platform Enablement
>>> Intel Corporation
> 
