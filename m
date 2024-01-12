Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B2C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 19:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693EA10E0C9;
	Fri, 12 Jan 2024 19:46:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F2D10E0C9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705088786; x=1736624786;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ArDFWdel/UNGXVdhSoCHHQCLAiST0H43EeoU6xVgndo=;
 b=h90Bdlnx382gVBYNvF/WRvYcNNehJxCnSEs9Ing2yMPWpj2nTnCrYE1K
 IEb8CKdyRMCj1tu6egWf1XIrFo1Avm1SGVZBoQhYgpCWQdKhf3hYvbKT1
 hKwMsdalHa/CQFx4Na3GmFYX35i/NLmX6uB5NJjGEccEzU85WOu+vXcXH
 Opv7tdDUbw3u9ceBxH5dOAyjdoUtAFkCO1b5uo3oQm8hjm5lqt6OrkYlM
 fmIh6lj9IERlb3h4krHMZE1ymtjWUlI8HxbYk+B4tnoPIRbyopOTyJ53G
 z3lzQ9EtPf0PmX8hq0xiByhOv8Yk/fbkTanV/A5niF4e2L85KKpd8sivE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430441839"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="430441839"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 11:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902072624"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="902072624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 11:46:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 11:46:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 11:46:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 11:46:24 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 11:46:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKoQkKvmx30kySxSru544w8rkJPjAXJqMQ2IDe9cG9Q0dy4oLuhWYadm4iD3NgY6qsSWJ45ja5PMOm1nP6Jmf6Hi5S7CBIhKTMWGNsGyYFwsze9eBOGFz/wa+LgnQQQF14KiSsBsocWv+tYtg9AXBf6TMKtHlAVnQCQUWhaMCdoB8YEzQoakWuzMfbpr3MEr9c+tHJ40D0eSC4i0WQz48XBtpsFaj2L+s7PDgUN8JyB9UlSBuh8njv6c+vdVIiBHMApAZyNJuLu+2EJtf5tcoQtW8UQ2NEpaqZ7zMoelk89NdfTXTeiNukXvA1LXupPSIO1QcSwuNxeOWszqFXQKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XU0QiaFl3wythP68n0pAY0ytnFXJGTCrB+a59XY98E=;
 b=RMJK4UWLoBvBl0v/X9TESPEs0nWjQIK0zh1yGrYSh7jMUmjVpUKLgAPmy9I+yJqY1adsGXJXWOuje0euA4J9r+JKiYNbqbK2y9qAP9W4jTvlw7LX11xZoGxeapwI3jEFFJqmwzAHScreFrU+58lJYknu/qgC+2uFQm/voCmZ99RwTHk71Y3GOnBquheGbYe3B2th+g4gg7AMtz/3wzF+nSmOUd2PGFRN/Khj1yVNNIOZ477WN32QhhX4aicNlII2s7HGSmfcOwQOHVhEvYpd2jg5Ro9E7XUfULXmwnJFCNvgjS+LhwrSn9BKX46PKvQD5kdvb/hKqiPdDPGeRxMAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 19:46:22 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 19:46:22 +0000
Message-ID: <ac008966-e03c-49f5-9948-336c7bf6095f@intel.com>
Date: Fri, 12 Jan 2024 11:46:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Add CLOS specific initializations
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
 <20240109235758.1432987-4-pallavi.mishra@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240109235758.1432987-4-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b9029b-7a72-432c-166d-08dc13a727a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVaZ+m7E6jC54J3h58lGPXuww1+vW5xL2Ae+C4r2cVqSfyOAqtA5EPl0foZ50mFRtGQxRaZGPP3gz/N+W/e5VOOjRC/lJ/XzNi4OrB9RenOcDcU0iRD48iA/oTjTGS5GmMMBA/0/r2jLina6eMEfIDYNkh3WYdcuQtCxhYlW0QWU9acRYNzpz1wZhxAk8TXoQkLl8xK3DV/reVRt/WrjC8LZphZgfk8a4X5I45WetGuVQA1Pbqcvn3q8tt7p56ZI6NP6NtUozWFjTudn3PcuqRztn/gL7XpTZXEqQKkqRGnuvvRdPXNkAyHwA9hRtNbkDxsP6G1AihPJ1kKfxsxkN7toMnxRBI6QLsEj5it6RHs2mFrFi18FvN2TQ9Ahg8naPfepb0e/4smz1VWg7xSg/D/JdgKpFlnAx1UpGw3FP1+xmeRn3vKiq52MUDyzZXUqX8DZcYCPEynyDtCEpNiJeANKerxKmd38FCHEg+rLibOzxMiLgITu4pGbJvB3fvKoFmet4cVGtBUYWpYzu/kBhZVZ7gGtsMQ2tB/31fDYHyHPq2ccbShjiANtARSoMYn6lbrCs96SfvD9U4G7KX3h0LrVwQT6vHCfqpQjFAZZD7B14vcmPgZBWXHz+XLE1ynnXKG9a7L2AJp8UbV4OCPU7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(39860400002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(86362001)(83380400001)(41300700001)(53546011)(6506007)(478600001)(31696002)(26005)(107886003)(2616005)(6486002)(6512007)(38100700002)(4326008)(36756003)(66476007)(66556008)(66946007)(8676002)(8936002)(316002)(2906002)(31686004)(5660300002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVJ1SUhHcktGTGh4MFJIUmZmKytxUGdZQnhTUVJwdXNUUXFVZjhYSUFWdUxV?=
 =?utf-8?B?Wm5jOUpoenBCaVYzUDc5Zi8xOGo2YXdOOGd2UEV2dzhUTmtmUG5NSFBJbGVL?=
 =?utf-8?B?aEZrU1hUYXYzQmRCOXRTNk5OYVdIc3M1TEl2UURiZDk1WCtnR0Vsa0dmV2Vw?=
 =?utf-8?B?QldVWmtLNkxHVndML3VrWmN0RHRTa0JLaXZwckcwVm1Qck03RGt6aW1wWlRJ?=
 =?utf-8?B?R2J4MTJjam0rdGRiVlNhNEFhc3l2Ukx2cEVreTRLVVByQSt4T09rL1pDMFQ5?=
 =?utf-8?B?cVpsTzltT2Rpd3c2UFppSW83Q1B4bFYzVlhBR1QwWkgxcitjc3RxeG1pbCtD?=
 =?utf-8?B?aUFyWGJHT0ZLTFJSb1JocHR2RktMR2thZEZUTW13ZUx3UHhOVW9rbHJkTy91?=
 =?utf-8?B?MHJzNGNOQkNnVUwxRk1Ra096RU9YZ3UyRkphV0ZvbmpXRkdRRkp0Ujlqb1pN?=
 =?utf-8?B?RVhSemVBaW9EZ2hLOGViaDhJTi81Z0dPdVlSa1ZnaTdVZjBOeGU2L2l5aHRS?=
 =?utf-8?B?NUpmNGJ6aGwxV0ZsM2NNdWVNY0U2UEtyRDZ5WnJRWVlyZzFkUkFGckd1bGZS?=
 =?utf-8?B?VFl2UTdSRkE0cnBlRi9COHNjd0MyMTFGZ01pN2h1dDFQYWlUUzdGbVNzQzFB?=
 =?utf-8?B?VEphWUhQSlFYNWVoZlVNQUpQQ1k2QUVFVWdRQ1B4bnl4WkJiNUp2Mk5ZdXhH?=
 =?utf-8?B?QkNxbTdRcmRGZG91ZThUVGEwekthWVlHMjQzMUFySjM2Mmw2ak9GZUc0OE1z?=
 =?utf-8?B?SUNhcWdXSWQvVWc4RFMydVJQOGkrNkx3WXRFWWNpOVA4UDR6RU9pQjBhOE4z?=
 =?utf-8?B?WmdudEt2ZGxZYWJueHZ0UmhnOXhmTEc2QlVONGxnSnRzeFkxeXoyckp5cE5m?=
 =?utf-8?B?NTJ6RlZzSWQ5OTdvcGdQWW12bERiQ045T2Iwc3Rad0I2MndNWXRPSC9KOHcz?=
 =?utf-8?B?Y3RLRm01eEloc0dQM200WDNpaFAraGZMcXQ4WU5ZbENlejNzN3hXZlA1SU9o?=
 =?utf-8?B?bEE3NUxwbG9CVG1seENZdzFrSGtIRG5xQ1ZnUm1zSStUSjJXaWFQYit2aTZJ?=
 =?utf-8?B?cUtrMTI2TDAyeTd1Slk0ek1MQVRKVVZPWmI4TTV4ZTgyNVlxbm5pcFU4WUxW?=
 =?utf-8?B?SDhtYi9rMHBqYWM2dlh1cFV1bXExUzNQeFlEYXVXb2c0cWQxc0xEOWxWMFB3?=
 =?utf-8?B?RmZlbE5WV3RjTlcraDk3aDJEcHdDdmlLZ0ovQVowVnVXcHdJWnEwRW9YNEhk?=
 =?utf-8?B?Qzh4Y2phd0ZjaGxYMVd4Z3BIRzVlYnZRTTV5YlNJRTlqeG1sRThvcW1QdDF5?=
 =?utf-8?B?MDNkdVlnc3psWlZ1Y05NdnMrWjdkV0pzRGRGMEtNNWVZaU45NmoyTHphMzlp?=
 =?utf-8?B?TWxNUFNaNGFGVCtDbGtIRU9IUDU0b2NUVUVZL3N3b2pqVkx1cmk2S0tVNzhE?=
 =?utf-8?B?VWxjcTJZbVY0TktFNzBuRWtGYzVOSlcvSmQzOUFsWlZMTzNGa1htbEo1VENw?=
 =?utf-8?B?YXN3WjFmbkl3eVhOVmxIcmRRdjZMMklQWHFqa1hyeEdsZ2pPYWp5cGkxMk5P?=
 =?utf-8?B?Ujh2UFpSaXZVYnhlNWFrTU83QjlWZGZ0aUFpeHcxMzhuZXh2RGUxd3NqNHA3?=
 =?utf-8?B?KzNoWnYzOTBLd01PajlkOW5OR0dPL21xNXlBMklXdkliVnEwTlV6MEgyT0FR?=
 =?utf-8?B?WTdtVDJZOWNtMGVrSDhRZ2tPd0VnT1NZTEtsZ1crY2ZPdEtqOTAvYTRKOXlx?=
 =?utf-8?B?WUdFdUF1ZHMrRWVNYmFleU0xb01JSjBJVjhIL0xJZjJUV0Z4YUdpa0dmRG10?=
 =?utf-8?B?N21jYU1pN3NOUy9sSzEwbE9aNW56UnRNK3MwZ2VxcVdxazFuRVJvTlVaUCtH?=
 =?utf-8?B?YkhVOGVsN1UvR052U0dUaW5PdThOa3IzMkVYK3RHam52Nno1TzZ3ajNxWEVO?=
 =?utf-8?B?eFRUK0V0Q2gybXlrV3ByRC9hazFoY0lnM09DUTFIZ3RvRXBQQmxGNFRTU1Jh?=
 =?utf-8?B?V0F5RXAvY2FLejRUeUlIdlhndUU1Zk8yZlJhOGZ4ZzJZdmZYamt3Z2FoSngy?=
 =?utf-8?B?M09MRzZxT2cxdE1wRzJyeVFoR2JIUWlXR0diSk5aNGdnQVZObGxlVlhpMEJ6?=
 =?utf-8?Q?xz4FEZGGckqXIS74QC+/+8Ryq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b9029b-7a72-432c-166d-08dc13a727a4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 19:46:22.6497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twyDw1dnFD3V0JGonssQlgNpCIbC8FUK7itRORK+LNMUcK7tuZfn9MwK3tWka3EHsUWWLPd378dP3PRMZ7w16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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



On 1/9/2024 3:57 PM, Pallavi Mishra wrote:
> Handle CLOS specific initializations and PAT
> CLOS compatibility check.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 15 ++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.c    | 36 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.h    |  9 +++++++++
>   drivers/gpu/drm/xe/xe_vm.c     | 12 ++++++++++++
>   4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 004e65544e8d..4e3d4f2c0f9b 100644
[snip]
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1ff6bc79e7d4..ccdefba0f2f3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -45,6 +45,14 @@
>   #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>   #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>   
> +#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
> +#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
> +#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
> +
> +#define XEPVC_PAT_CLOS1                                ((1 << 4)|(1 << 5))
> +#define XEPVC_PAT_CLOS2                                ((1 << 6)|(1 << 7))
> +
> +
>   static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
>   
>   struct xe_pat_ops {
> @@ -148,6 +156,34 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   	return xe->pat.table[pat_index].coh_mode;
>   }
>   
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	int err = 0;
> +
> +	switch (clos_index) {
> +	case 1:
> +		if (!(((1 << pat_index) & XE2_PAT_CLOS1)
> +			|| (1 << pat_index & XEPVC_PAT_CLOS1)))
> +			err = -EINVAL;
> +		break;
> +	case 2:
> +		if (!(((1 << pat_index) & XE2_PAT_CLOS2)
> +			|| (1 << pat_index & XEPVC_PAT_CLOS2)))
> +			err = -EINVAL;
> +		break;
> +	case 3:
> +		if (!((1 << pat_index) & XE2_PAT_CLOS3))
> +			err = -EINVAL;
> +		break;
> +	default:
> +		drm_err(&xe->drm, "Unsupported CLOS value\n");
> +			err = -EINVAL;
> +	}
> +	return err;
> +}
> +
>   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>   			int n_entries)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..afac06bc425f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,13 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_clos_check - check whether clos has been reserved for
> + * chosen pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + * @clos_index: clos index to compare
> + */
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ca917b8315c..8e8c0302c8a0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2800,6 +2800,18 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   			err = -EINVAL;
>   			goto free_bind_ops;
>   		}
> +
> +		/* check whether Clos has been reserved for chosen pat */
> +		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {
> +			mutex_lock(&xe->cache_resv.clos_mutex);
> +			err = xe_pat_index_clos_check(xe, pat_index, xe->cache_resv.clos_index);

Thanks for pointing out that xe->cache_resv.clos_index is used here.....
But this doesn't seem correct.  That is simply the most recently 
reserved clos_index.  It might have been reserved by some other user.

I believe you need to test using the set of CLOS indexes reserved to 
this user.   So you need something like:

     struct xe_file *xef = to_xe_file(file);

     for each clos_index in xef->clos_resv.clos_mask
         xe_pat_index_clos_check(xe, pat_index, clos_index);
     confirm pat_index is valid for one of the reserved clos indexes

Right?


> +			if (err) {
> +				mutex_unlock(&xe->cache_resv.clos_mutex);
> +				goto free_bind_ops;
> +			}
> +			mutex_unlock(&xe->cache_resv.clos_mutex);
> +		}
> +
>   	}
>   
>   	return 0;
