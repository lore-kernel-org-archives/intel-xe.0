Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A15C46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9933710E19E;
	Tue, 19 Dec 2023 16:29:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E032810E19E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703003386; x=1734539386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WsJZMTPMAdDrq+X0AEiHF4HzPnFNLjbkTPcvQ1rD2ZU=;
 b=N40nlqonAhV84cDT/ajAez+IAB7Oehvaf6kAc/ft6dT2d/oorqE4uATd
 UzKMUw24ZBDFPXxIWZAQ9U9RQrtQVYpqOehe2uYOBM+jLhYxkR+nsR1qd
 nhQZLshPZ936E9G7TVjAws6+oBJAdaSzTyZtHzK39zcTHuG6H3WfhhXUR
 teDVyjoJPcagghcc5R9QmliYt3Hq9OkasCamy245EfkDuZWN4ZrKci2dH
 jQHD4XZWfugCMMQqR73u7R6XKcJLXCD5bv+z+Xp1nRCUkYub7s2hsgiw5
 9Y0T/Aa9g9u0zKBM5kw95KZ8zBiU0w4YN/4dNli/nmSPW+FkBNyr4c3SA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="392853237"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="392853237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919670073"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="919670073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 08:29:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:29:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 08:29:45 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 08:29:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ES0UYuDGSPWPk6wOh1QKXjDpTgr2hN5MuPD/TovYja81CD6TM17TVwD3zfFqTDw3Pb4AOytrWQVTd3IeM/sMp8EncCzhNXqOSvyOTaFgglsE9DpxMNVGonldj3BidndMLZfZp3t96434xtevp482nXA6NFp1rx59OoEuJWbYAUw/d9WEV5gS5KLKD+/8Bk2Xo4kWuZkozFDa28j7/4HzCKIFYJGlYuyjDpCLFMWrTSna+eftvwkoA8efnexU2J3xfW4Yd77HwxWeAfGxGiZBuIPMuUD48jIrjQm51HMzPdzJh1nIB0vX1UYXnDxtHkY28nSDKze5UlUdemK0Ay2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2biCpgSBvnkvpjpHbFbNZYDZrjLN93su+vc2f14N4jk=;
 b=kxU0YU9JLkDXvvE7KREKSjvN4LOkb5Q3KtoLQCATMbrtjjIQdTxlR1cwRWAZ3A07djEhVhCqFHND7r1xCvqtEPtMgEjYdgKuA2lSUPvukkE/yu3ni8aKV/18wRkVDngKBqxcc+aI+85uWpD09WiF/WD7jZpgIqQOqaiZNp8nvX31Ei+wiZP/XaRiKMK3edGr43+urFJAwwXk9xJlRuc7IgYjDf12btB758HqQKNrBik28Tu8upn0jltP+6Ml27OoCKCORscBozhf+sdJn9MnXlM8VcX3pzv2gKf94A4kbbdKrrPlwNWxJg3TKuU9s3gALxYnBxFApAjZPY7JLbDm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB5455.namprd11.prod.outlook.com (2603:10b6:5:39b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:29:35 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::d6ae:df23:ffab:5dc9]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::d6ae:df23:ffab:5dc9%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:29:35 +0000
Message-ID: <5b03cfb7-42c6-488a-8923-5a0b039e2049@intel.com>
Date: Tue, 19 Dec 2023 18:29:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream
 properties
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-8-ashutosh.dixit@intel.com>
 <875y0uvqvm.wl-ashutosh.dixit@intel.com> <ZYHEHDMRyNW9et5o@unerlige-ril>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <ZYHEHDMRyNW9et5o@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::11) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7399e33f-40b0-43fa-c27e-08dc00afafc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqp4B2xSAUdrMzG7mulhhdzMpcrJFuOV5GhrFd47UIcpLaJ1lOoCInLtEcTt6oELtlteU3nqgTxApvzznEzV55/Y5bROW/3YWqIobubVHHXqbdLhBhuN9MW7OQrc6QadoTxWV1u9EhjjsghsJYXYEg2QLIqj00010DkE0/b5Rpc5E97k7JDf+HOgftSx7gqsuMf2ruPEMVGox3mBs5MRdNPL4biGJIxvtWheSzNJAsgAmSBTZO4td00y/dEHZovirdztEEIfE4u3utlf4ym0akZ8Ocj0/RLT2NJdtksQoXoFzUs8giMNLqMkAW7UeqH5lHoiFonQFOZg3Rhw7LGVs02f9PavQ5u0z1Js73SK6xM7V29Lj5THYi/IL9v4pSdKKJ99YieMHf24h2ltL6d2S4BZSrQKEcFGzllpZIIxMMK9XyHz/LfdNIJIlBR1LMoQtDKi1775sHncJN6E4P4gcx264bieO0ersOKDrwOOMsw+/sIb8nUOdAbReEcds4zil8uD5FvRNfgyjPvUyqNJI0L4XtWMEBW1uhdB5dCA1/eXEgRmDtgYMdDLfntC2TLiVSya2ciPqTbjAygtw3xmY8akyNQEDiPhR3kOt6P7RBS9Do98dF5cWL0EPRUmX6CmpzrwN2mYlUyhlhq0OVk4Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6636002)(6512007)(5660300002)(31696002)(6506007)(53546011)(26005)(41300700001)(38100700002)(82960400001)(36756003)(86362001)(83380400001)(2616005)(2906002)(6486002)(478600001)(316002)(4326008)(8676002)(8936002)(54906003)(66556008)(66946007)(66476007)(110136005)(31686004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VuRFhCNWZwS2MyaFRmRXppL0lrOVpoVzBiTndKNk1CVU5NTUQwdGdINkpm?=
 =?utf-8?B?dmdKK2xkWlkwamJxMTRKMmhkaUlSZ0VlS0RJMjFjUkVJMkN4YXpKMTR6VlhR?=
 =?utf-8?B?TFo2cjVrN0ZnNUZ4VW1BQ2V5M3Y0S3cvVldXWTBPTkpGNEordjU1dnlURk1w?=
 =?utf-8?B?SE1NaWorWkNBTmRaMmVBZFh4anNTUTFjZk1TcXduMXBDQllObndEblR5TWlo?=
 =?utf-8?B?QjhkRVoxdi9tekFZdG5yd3lHeGpXZjlRMElSTnhVZU1xcnNrdEpFMDVvWm11?=
 =?utf-8?B?OXZIaGljN0FhRkU0ZWoyaGJiWThEVS9nZ0FIdldTelkwTUQ0UFR0b2UvVE14?=
 =?utf-8?B?ZnVGdXlzL3NSLzYxK2Nhc2lXeFgxeTF5dTRYRnNLQTUzeDh0NXV4TURxR0Zz?=
 =?utf-8?B?K09GcVlCb3YxYlFEL0kyeERDV3o2WmNKVy9jREp4MkhHSjZ1SGhaSUlKSGVO?=
 =?utf-8?B?MG1WekM5ZHp5bm1Tc1V5VVBGNTRCdWVLVnA4a3owd1o3b1o3cFkxM0lrOU8x?=
 =?utf-8?B?R1REMDlkWnp1MGxYQnVydmtkUVIwMmc3Tit5a1F4UW5TZisva3M4SkpxMys3?=
 =?utf-8?B?Q0hQckF0bmxTVEIxZC9QbWhiZldJWkpieHlvTnVscVBqUmdqakQwS1RGQTAv?=
 =?utf-8?B?OG9MaklkdWhxRTJHN3Bob2h2MGtPdVg5ZkJTOUQ3bnFQS0gvZmptNndEb1Yv?=
 =?utf-8?B?RUxoUlpuOGh0aXNvZC9PNmx3MGdYQVoxNnlrbTdST3pRcnJ3YzAvZVVuMmlX?=
 =?utf-8?B?WVQ0Nk5pNklzT2g1WXlUTjhkbFh0OUg5NHQ1QWZnc1dKYzRlTWlXa0RuYllH?=
 =?utf-8?B?NTFSMWhnWHErR2pFZDJIVWpHT200azlEZ1p6RVcyN0Y0M054T3VGR1NDbVQx?=
 =?utf-8?B?czZGRS9aTm9QS3pxOW8vL3FGbU1WTHJ4U2hrWWxQeFZuOXJtcXI0eFhqZDNp?=
 =?utf-8?B?ZkNYeEpBSG00ZU9qY2UxcGRHejlRejFLRTc4SFBaSmYwVXJiU2E0SlJodjVL?=
 =?utf-8?B?UWtDbTlCWXhkU3NCZDRqTGVzTXVsWFZJMFVYaVhxbkxJZzlZVGYvTDlZS2dE?=
 =?utf-8?B?bWNDRU4wQ3A0bmN0LzJOWWM1QW9TUno2d2pIY1Zoa0VBeDE3dkNuQWs3ekk3?=
 =?utf-8?B?aTRzNjljdHcveUFHU1F1ckU0UXVITFlMbFdQbDJ1aTBNbFdTYTZOdU9pT1Rh?=
 =?utf-8?B?UzhZTXljbU9aR1lUNDJnQitwWHZBTFFzM1k3Qnd6akI2Z0VJeFUrMG53Q3FL?=
 =?utf-8?B?aThUalRxZU9PNFBiK290S1U5Mm9VQ2dEUWlkLzlQdXppKzZvZGZmTGsxMUJO?=
 =?utf-8?B?R1BGOUg3S1doQm1sRUZKSTE5Q0NMaU5mZ1o1bGI1VFBja3p0MURPaWFsd3BI?=
 =?utf-8?B?bGRJd29LRUdjZ0E5NHdEUVlNWUwxRDZlK2M0RXVKRUo5bTRVeERFd3hDYi92?=
 =?utf-8?B?NzRVbGQxTTlDQUs5RWxjRUhEc2M1R0NKSE9UR0RMVytsVGpCalV1SmhNazhB?=
 =?utf-8?B?SGlJRkg2MHRNc0tjOVU4STZNa2RkZmpTRlppNkQ0OWczUTRpTnd1QjNmaGpB?=
 =?utf-8?B?cndFVGo2Q050QStIYisxZ0YzNWM0WUhXTk9PZlBrUjV2UWw4U2RLTERIT0wz?=
 =?utf-8?B?ZXNNQkJVeXRkbmZ0eGhtK1Jha2E2cnZJOHlGSWRyWjVRMzlvQUIyNVZZRkxC?=
 =?utf-8?B?OVVLdmNvbmd5VXc2dVlzRndtcml2bUwvWUczdmVjM0hsNVZTNy9zZkNYb0cx?=
 =?utf-8?B?RDVBSytHNFNuSjFWL0VFZ1hhM3FhNERiRTJBK3NEUHZvdmo3czN4WHBYSk5B?=
 =?utf-8?B?NUdNUi9VeS81YURDNmFraDM1UXk3UVFYd2Rid2xEaXdSeUVWbFZvcjlvV3dJ?=
 =?utf-8?B?M0xBUVc0c25zNm9Ib2JrL0s2aGM1b1dYbHN4a0xMK1Y0SHFKTFdMKy9VQWdl?=
 =?utf-8?B?YTVHQnZsdmx6TUxaVU81QVNSaFdJUG1HZnYyRTRjem1Fc3VsYy85Wm01ZVNx?=
 =?utf-8?B?YitRaEUxd3VucnpaL0lHY0RvZi8zQzZlQUNKWGRTR1RrUGExK0Y2eDZIdGdP?=
 =?utf-8?B?dGdQOGY5dkg2SDJYbWVEMEkrZHVObEVuZlJ4eFlqT2poQWRIUjBzUElHK0JU?=
 =?utf-8?B?ZUVPSmw2VTRlOWlJQXpBOW9PTUlOTzU3YWJSS0NydTlPL2hhbkVvZ0FDZjBq?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7399e33f-40b0-43fa-c27e-08dc00afafc2
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:29:34.9711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mro/DIdpijOeJoeZbw04rsJWLN3h37sS7DUaTJAxWZy8uC6mD82A8zBnW5ht/+F3tp35hbMguSTMimhoyrG6VTfMi8CIhBFYH79GeEGo5JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5455
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, intel-xe@lists.freedesktop.org,
 gzadicario@habana.ai, Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 19/12/2023 18:26, Umesh Nerlige Ramappa wrote:
> On Mon, Dec 18, 2023 at 06:59:57PM -0800, Dixit, Ashutosh wrote:
>> On Thu, 07 Dec 2023 22:43:19 -0800, Ashutosh Dixit wrote:
>>>
>>> +    /**
>>> +     * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
>>> +     * directly applied to returned OA fd. DISABLED opens the OA 
>>> stream in a
>>> +     * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>>> +     */
>>> +    DRM_XE_OA_PROPERTY_OPEN_FLAGS,
>>> +#define DRM_XE_OA_FLAG_FD_CLOEXEC    (1 << 0)
>>> +#define DRM_XE_OA_FLAG_FD_NONBLOCK    (1 << 1)
>>> +#define DRM_XE_OA_FLAG_DISABLED        (1 << 2)
>>
>> I am wondering why these flags should be part of this uapi:
>>
>> * O_CLOEXEC and O_NONBLOCK can be set on the returned stream fd using 
>> fcntl
>>  (see man 2 fcntl)
>
> I think the O_CLOEXEC was used so that a fork doesn't carry over the 
> fd to the child. For the OA use case, we want to prevent that.  
> However, these flags don't really need to be passed separately. They 
> can be flags in the stream open property.
>
> Umesh
>

You know that the application can set those flags by using the fcntl() 
syscall?

It doesn't look like it's a useful feature to add in the driver.


-Lionel


>> * DRM_XE_OA_FLAG_DISABLED can just be a stream open property, doesn't 
>> need
>>  to be a fd flag.
>>
>> Comments?
>
>
>>
>> Thanks.
>> -- 
>> Ashutosh


