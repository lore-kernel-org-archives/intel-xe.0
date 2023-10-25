Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEAFC07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 12:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BA610E3D3;
	Wed, 25 Oct 2023 12:27:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2AA10E643
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698236840; x=1729772840;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DcViQ7/6mdtlbtgGsheQjTNTRlol1rwLO1Zv7pKSD4Q=;
 b=FzCbEYeZPL0+11LIksu7Ocm19ixryYlKgCx/+ZqACimpjeO4ZL0cxHb5
 E41GwbdBipEjtdBnaHPHJDJhVNbZ0iOcuAbglacrED3p1KzWA656FejDE
 z8yubLzECHsBCzf3k+y8TCzjVioeyYT9YXxYes9j9AmPV9eBWA8N+caEF
 BS5Sz3MZYofnD6JYhRWZtnBgcnGYRXqOe5L7AMacjM2KfBOfIYagW0ggJ
 esb/p+5TpQaUMP0BJWSgnPLPwsjVkkZPl/bzgj7QOs3P6hilxdZbAYWb2
 dQaoFu0mB5UWx5FQbiKuN7Qw/3qHSMdhzH6Hg7bbSsaLpLDv6+qF8gQgP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473531226"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="473531226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005994296"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1005994296"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 05:27:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 05:27:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 05:27:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 05:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuMSgJ7elnquKW5lkOK1zunxJcVZwl7jAk7Z8ZDegnwTChrt7Yk+O/MaLX6xg9pwKErCgnyFyHWYGoKR9hpYvg/71UY0V2CN+PCESe1szMZyz02pUA2EjtHoutOZ70wPrjcYsOOoWkbR6QqLQTFZwmdatIyNZOr0gAiZk2TS+VhrOLRLmk8AWZSsks1qr/N7jlXj0QnukjvFWFZ+198ISQRf3qz4h9VpHljpy0VIB30UzZTps1fPHqAtOlK39+PMvrvHSJkUdAXvSHnq9FB7YXtDLo/xvaTLRMT/W8pu4zBH263jlg1LkvY1xooTrbnuqn349ZiP4mjzJSZucBc3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAusDccYure23L+oZKdOZ/gyRQvwBjzzY8iNkdC88Yc=;
 b=NkIfwQfmXblP2f/lPenkpmoyu78/ZZbRvfMy9uFfCzROCVykDlNtOyrqMR/VQ6bIpdNSjdgTqq7l1o7W5KV/rZ0vscDJL2vwCM+rozHaPmuhxi7jxPMGtOZbvGR2S4cPT0UENf8SpLToS890tA6Nmq8YZF2hXTP3E1LCmFVvj25cEA/WQUq1K8pC4YUMyM3613y/ScVj4HXXsuaTXkO//uQLrn1jtJjtK2tQnMo/Z1SdycqBV9hO4fWy4VoNy9fD4HULl5C4VxgoeRAG/VbxLZPdy3AwM7PrI9FIlIa4dq3feqBzfh6id9kWdHS7xScDr/iAmvs5KdpPp2xnEif6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Wed, 25 Oct 2023 12:27:14 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1%7]) with mapi id 15.20.6907.022; Wed, 25 Oct 2023
 12:27:14 +0000
Message-ID: <f665b210-831a-7b64-7d0a-427acbda9c2b@intel.com>
Date: Wed, 25 Oct 2023 17:57:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
 <20231016101720.1657746-2-balasubramani.vivekanandan@intel.com>
 <20fd16ee-c8cb-49aa-c223-2b511d158827@intel.com>
 <ZTDenBGkzBl57jEW@bvivekan-mobl>
Content-Language: en-US
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <ZTDenBGkzBl57jEW@bvivekan-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::20) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: 163285ae-35c9-4363-5be0-08dbd555b7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yi7yMS2YXvsK0iNuLQLuI3ONfH22tNLZioGsuJviL3ONw35Bx0zvLf/63fih+B6fJes9Wt1RJ32vz7lvRnCG5NiFk3xEmy5BRotphIsHKic8j7SFaLDASrbvDZ0rY4Q5nysUGmtvIjMlXw6lCkMYbEvai+0sVNKqDa4LO4PuckFCOAKnCi6lnll+q3bZLgxjqpnaqrLZHm73tnBd7clguO25111QXSDdfdd7LJItD7YSR5CRi5j8SZlR30myK2OkkilA6oZQA47Or9khtjg2KBw1hK54afdYr+ozTfKW4I2d6PN4aAKRujlj2qnS84DxT8tvE/yOpe2F/UZiMmWBHF7U0w+M7II5QKiZb3nThbX7giDfoW0K3C9Vj6JLij5TsuRscOV/zaunqe7RKQECn13thBySDOt6RXen2iiCuIlPRHRjLzsrPOsGuXFHfgPwPyEr+XlZS0l0VIH7lE8MvglYkDR2XwzFIo1HaC7Wwf/TIUEi3TQxJVFws1az17k3kWAyRzHDICHGtgkw+5vXwZ7n7klXWjyH344PG/I2u9B1odckBPvH4FQIBEpbdG8xa997v1fZn5Vj9oQt1o366+7om+Nt0tO1tn4XTVwpleVC7LHCIAMN+iB6to2TAupvpqCLrI66BVwNGpML+oK70A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(83380400001)(4326008)(8936002)(2906002)(8676002)(38100700002)(82960400001)(53546011)(26005)(6862004)(36756003)(2616005)(6666004)(6506007)(478600001)(31696002)(86362001)(316002)(6486002)(6636002)(5660300002)(6512007)(66556008)(66946007)(41300700001)(37006003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andNNVlxdm1TbkpsaERaamF6bkFxZWFDSXZCTHc0dWtFS2F6MkU4UWozcXNS?=
 =?utf-8?B?elpJUko1YitBd2FWOGRPdTE1dnp3cGo2Q0tRWEFvTlc5UWlVQkpsVGo5WGZo?=
 =?utf-8?B?dUxNeUw5bDRvMWVESnZ0ZUdKcVpFc051bGVKeTBCSlhFVk9uSnpyZnFLY0Nl?=
 =?utf-8?B?SVF4dlB2aDYwNHhEbnR1cHd4b0MwZDVqcmVlak50dDdxQmhYajhkOGdoWk5n?=
 =?utf-8?B?ZUpQcklheHVIcGN0ZWJQM09NQjdCZDJuOWJ3alJKNGFIeDFIQ0Y4dk5URWtN?=
 =?utf-8?B?SGxHVk5hQVpiRFVGSFZHU3FscEJYNUNHT2NySFdIbTlZeWhOVEo4QUd5clRZ?=
 =?utf-8?B?QWpyWExTblc0UElKa3c2YTNCSHMxWWJzd1MyMW1MeFllWnVhNzZwMzdmYWZB?=
 =?utf-8?B?N25welpFTDhxYjJrYXpXMldPbDVjR2NNVm9XQlpsK2RkaFNDbmNXNy9SYVpZ?=
 =?utf-8?B?N20rS0s0SFVFS0F6Rk1KbldDMEtiazhDOFFMOVlBS3VDUVlxZ1M5aS9TK3FC?=
 =?utf-8?B?Z1hjYzg2NjBPM09QUFlPdnhrVDgvR2tYTGRaZmtMZERGZ2pSQzY3eFNLdm9C?=
 =?utf-8?B?aDZTMXZONW9yemIrNVZNZGZCQmt1SmFjMTNraElKL3pMSHBIOUZ0VkRJekZF?=
 =?utf-8?B?Y0Q1bFZNaEtYT1ZvdzQ2cWtMbm9kMmF1Vkh4NzNBbkJ6RlNXenEvTjNwVDl2?=
 =?utf-8?B?WDFVSUxCTi9nOVdSLzJoMEc3YUJsclhXZmtPT2g4VEFmZzd0M3ZMOTZCK0xH?=
 =?utf-8?B?QzdEVlJyZlIzVHhYWjFnSGY4OUZhK0FGZDBBSERJV3E0RWJMcVA2Y2txbTBS?=
 =?utf-8?B?bStOQXZuMUtudjF1cnE2RzJCSGdWTTlPL0pINFlsaWRrcldDSmIxdlhNWlNz?=
 =?utf-8?B?OExwU2lKMDYzTGdHNnJLcU5LN0czQWhhTmx6aGZsaHZvQXZBc0dBTW05dkEw?=
 =?utf-8?B?c2k2aFltcG5CK21YTWZWV2xpY2hQY2ZIU0VUaWdNblJXODVEbkRmQ3AwYWNJ?=
 =?utf-8?B?Si9hT1RPZytiUTBaU21ZOTBOS2tnbVRFdkZhZXRXVEFmM3RoaTJHQ3pPUjdo?=
 =?utf-8?B?djIyMXUyUmY2UTNGc3VzZHIzVm1lbzltUnU5d2dEcEdXUk51aVpZUlVlbVJo?=
 =?utf-8?B?V24vNWZ5SDJQWUlqanVldm5pcWc1cnNzbk91eTRkSDIyZnZQOVVQQzArUkhN?=
 =?utf-8?B?akx0RTVMTHNkaVp2TFpYWGZScm1mdUxtcVVKOWdncHVDQVk0bGpmYzEyM0JK?=
 =?utf-8?B?ZUtjaDJyU2prZ2N3S040N2pQbUhYbEprdGNEV3RKcjBYQVRlb0pjSXB2aGY0?=
 =?utf-8?B?V0RLUVN6L09MaTZaTktCZkhVUlRRWUNQbnl2MkwxcitXanRlV01LWS9ZbE94?=
 =?utf-8?B?K0FRcWdJQ0RQK0ZhWVFOWTV1dkxmNDlhN0VvdHdpTGpBMitFYVhpZjVoSG1S?=
 =?utf-8?B?WkVGMUpjQ1JPNENINVlGZzlqNEI4OElNM0RBL0RaL0dmTDZ0L0dlNndwc1Bk?=
 =?utf-8?B?cHhPMGZKQWxBUDcvemtSWWRXZGZGQWRLaTl3LzE1aE1tQWw2SWNBQ2xpUzhH?=
 =?utf-8?B?ZXljcGRvM1I2aDd4WGJQNkVLVklGQ0crMVVMcG9LVlFvNGh2R3VxR2I3eWhH?=
 =?utf-8?B?QmlScjNqTVNPcjRVNGNhbU80S25xVUh6eEI2QkM3QVVoRkxxREVidmVmeVVj?=
 =?utf-8?B?TDlJeVRhRFlGLys2ZUxRUEk5T1pzaVU1Qm5lN0kwa09jS09rLzNsQlRPc0Ix?=
 =?utf-8?B?U2E5bVU1VEI2WnMvbEZHTlJTQW1zSVJqenU4QTRlTlFNQ0lPNytGbXFqMjBF?=
 =?utf-8?B?Ti91V1QxZG16MU5Xcmo5RGtEaG9POHNMNC9aeDNJbmxQOWgweTNOT1g1NzZv?=
 =?utf-8?B?QlZ3MDNGZE1kc1pTV0hPbVdYMisxdVVHak9xYjFwTDdsSVhBNHU4NXNjZVJK?=
 =?utf-8?B?VmJuc3hSK3RLTnVtV2x5NjNnenJsYWduOE43Q0NVZS9zMlp0VkpBOXdtTUVt?=
 =?utf-8?B?eGx4RFV6NzBweU9Gb2MrSDJxdGVMVUdNMSt3amZGS25JdC9lVmtHdmtFeFYr?=
 =?utf-8?B?czBWdFZ0dkRXdkRFNmlzaE4xQmhtWHBSbHlqb0hRdDZTV0tKR2FOeWN4NHpp?=
 =?utf-8?B?SmNWTDErUC9mNUR4d1luYnJObXdrR01Dby9PWlJ5ZWxtc1ZLalo2UHZzMWI4?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 163285ae-35c9-4363-5be0-08dbd555b7fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 12:27:14.0292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk1g0ghL1rQVnGmYJ9M2vPs+hTO4Zvw7bbS86FN0taEoukB5gtqb7xQU/HdLcTNy7R/+W4UZdcM7/Tg+murw8MrhsRUPw0Wi0X8suB8yA5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add event tracing for CTB
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


On 10/19/2023 1:15 PM, Balasubramani Vivekanandan wrote:
> On 18.10.2023 13:19, Kalvala, Haridhar wrote:
>> On 10/16/2023 3:47 PM, Balasubramani Vivekanandan wrote:
>>> Event tracing enabled for CTB submissions.
>>>
>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Looks good to me

Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++++--
>>>    drivers/gpu/drm/xe/xe_trace.h  | 43 ++++++++++++++++++++++++++++++++++
>>>    2 files changed, 54 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 8b686c8b3339..a84e111bb36a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -460,7 +460,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>    	/* Write H2G ensuring visable before descriptor update */
>>>    	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>>>    	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
>>> -	xe_device_wmb(ct_to_xe(ct));
>>> +	xe_device_wmb(xe);
>> Hi Bala, I think its better to describe this change in commit message
>> (ct_to_xe(ct)  -> xe).
> Done
>
>>>    	/* Update local copies */
>>>    	h2g->info.tail = (tail + full_len) % h2g->info.size;
>>> @@ -469,6 +469,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>    	/* Update descriptor */
>>>    	desc_write(xe, h2g, tail, h2g->info.tail);
>>> +	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
>>> +			     desc_read(xe, h2g, head), h2g->info.tail);
>>> +
>>>    	return 0;
>>>    }
>>> @@ -934,6 +937,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>    	struct guc_ctb *g2h = &ct->ctbs.g2h;
>>>    	u32 tail, head, len;
>>>    	s32 avail;
>>> +	u32 action;
>>>    	lockdep_assert_held(&ct->fast_lock);
>>> @@ -984,11 +988,13 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>    				   avail * sizeof(u32));
>>>    	}
>>> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>>> +
>>>    	if (fast_path) {
>>>    		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
>>>    			return 0;
>>> -		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
>> action can be assigned here instead before condition to return.
> action is also used outside the fast_path condition check. So if it is
> assigned inside the condition block, it would remain unassigned outside
> the condition block if fast_path is not true.
>
>>> +		switch (action) {
>>>    		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>>>    		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>>>    			break;	/* Process these in fast-path */
>>> @@ -1001,6 +1007,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>    	g2h->info.head = (head + avail) % g2h->info.size;
>>>    	desc_write(xe, g2h, head, g2h->info.head);
>>> +	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
>>> +			     g2h->info.head, tail);
>>> +
>>>    	return len;
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>>> index e32f1cad51d9..456c776f4be1 100644
>>> --- a/drivers/gpu/drm/xe/xe_trace.h
>>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>>> @@ -520,6 +520,7 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>>>    TRACE_EVENT(xe_guc_ct_h2g_flow_control,
>>>    	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
>>>    	    TP_ARGS(_head, _tail, size, space, len),
>>> +/* GUC */
>>>    	    TP_STRUCT__entry(
>>>    		     __field(u32, _head)
>>> @@ -567,6 +568,48 @@ TRACE_EVENT(xe_guc_ct_g2h_flow_control,
>>>    		      __entry->space, __entry->len)
>>>    );
>>> +DECLARE_EVENT_CLASS(xe_guc_ctb,
>>> +		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
>>> +		    TP_ARGS(gt_id, action, len, _head, tail),
>>> +
>>> +		    TP_STRUCT__entry(
>>> +				__field(u8, gt_id)
>>> +				__field(u32, action)
>>> +				__field(u32, len)
>>> +				__field(u32, tail)
>>> +				__field(u32, _head)
>>> +		    ),
>>> +
>>> +		    TP_fast_assign(
>>> +			    __entry->gt_id = gt_id;
>>> +			    __entry->action = action;
>>> +			    __entry->len = len;
>>> +			    __entry->tail = tail;
>>> +			    __entry->_head = _head;
>>> +		    ),
>>> +
>>> +		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
>>> +			      __entry->gt_id, __entry->action, __entry->len,
>>> +			      __entry->tail, __entry->_head)
>>> +);
>>> +
>>> +DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
>>> +	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
>>> +	     TP_ARGS(gt_id, action, len, _head, tail)
>>> +);
>>> +
>>> +DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>>> +		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
>>> +		   TP_ARGS(gt_id, action, len, _head, tail),
>>> +
>>> +		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
>>> +			     __entry->gt_id, __entry->action, __entry->len,
>>> +			     __entry->tail, __entry->_head)
>>> +
>>> +);
>>> +
>>> +/* GuC */
>> I think this comment not required at end.
> Done
>
> Regards,
> Bala
>
>>> +
>>>    #endif
>>>    /* This part must be outside protection */
>> -- 
>> Regards,
>> Haridhar Kalvala
>>
-- 
Regards,
Haridhar Kalvala

