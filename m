Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E98C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 07:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BD110E11A;
	Tue,  2 Jan 2024 07:04:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059CD10E11A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704179039; x=1735715039;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=52llKghg17N1v7E92oBwPyqIfz+KLp1HMTCvz4AjVbI=;
 b=CaqYAsYkCJpphg/3qLjHGamRzM+AG7nhmFkwzheEEnNiiX3DrCwYAFxx
 UYzRIjaz9gS90g5k7btDfs/p7XoW+6EeVgItYcSeHx9p3Voqgf/r8NZ+h
 tsEKZiCq0d6x4kwvVCk6gIxMFTej10TS2bRQ3azJL8wZTbUh/aRu/XNzi
 NytQHa6RgRVGLtMA1KfnO2E+jn7sPfMR+KHjg1BKu4y6rZ/4cDC7m9eAT
 FGaDJffWTrM+ho780A85hUBKO4nIUEQkZzU80GVTtx77Fd+rgRqjSzCVT
 VbFDlqVRwxNjCWmvnftNczJYN7vq5HCt7EYwkdLR30CwKxdL4BkTvuWP9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="387295242"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="387295242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2024 23:03:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="27996267"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2024 23:03:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 23:03:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 23:03:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jan 2024 23:03:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Jan 2024 23:03:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikxbavAdN6/mSOrPKMpXk94psWVCey0qfzTFee8vSkHFzpCYXrtiFkeDyfD2qj7Ro5K4bffJq4eOEKxuucKffjeKaTgeq0xdsCXlcvdAlIr35a2S8/Gtavfo8spdrzncdf7W2f1PwhSCX3TdlhpkRJGyK+omVCNsWwV/MXdsYjn1/FqQUH1UMqtZf1bmZ8vVdHbkN3jGVw77EoRrTMeEJvrqGEQkH6E0bQkb2tq3Faf136X3L4K8G9+fI+Ow4gkLtmemY2nxH4XVyRfErVZ4NeZXyjNmnn9kONrpVs9HLJxSU+750A3Cy5g0kpQL2KveBrvQiYBxWEhwavMfV37ecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSlO14q1nHSeeJCM1GighsFNk8FwHNIP3hkUhBrp1ss=;
 b=dmpLqVpHct6Ryb5siCJZFtx0cYeukg3j6KAgxmsTbyCRKO+okHr577GM0LQEuLhL0wkJX6U8Ro3hKse25kwdY9dcsuAqZ6gFZieWbDTy0qjQ+7Qmey8VkkZnEE3qMEjyCWaG5+4B3wUnsig8opPXbsDITJOiXunHKs1qZxhgQ23i8eRs293AS0QfkNDCUDg4t7Tp1H62JZkzdeUmCSWqHN4RHYLpQXW6y+49N3rODfRF41IhPWJW6otkxxN8HjvdtXEh+s5vVIqcdY6J6DNVuwKSBfaOcapvREAcYKAIwS3aY5biSk4poaqZimBCK2UevJgUoBteGR6WBCSXw8DMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 07:03:56 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41%5]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 07:03:56 +0000
Message-ID: <5f11046a-81c1-4984-bc60-ce904ff605ca@intel.com>
Date: Tue, 2 Jan 2024 12:33:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
Content-Language: en-GB
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231231144733.568481-1-karthik.poosa@intel.com>
 <CY5PR11MB62114F7D75F8A7DBF6066A6A9562A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <CY5PR11MB62114F7D75F8A7DBF6066A6A9562A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::12) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: e09492c8-c8d9-41e4-ca9c-08dc0b60fc4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWpL92Gz2EMZc/S2ofjHUNZYmME56PBosNMXC2tzdw2TcQXVrc9APIQdcUwjzYH2rPiWFo+WRqNjZ1NKkg8+Kv1stde/k3AsMCkkyO2BpNjZlXj4fo+KUPDtVLBj9n9HyZKajPl2dxHs/0mWKrYFUfHTaW1d0LT7rQKMfK7/hAIH1jZckGzgaEMa8nBvp7SQK0g9TdbPXOKtrwP+HBwvbjkpuzOpBRmPo9Ysco6C8dQhlIgT3hLM8JZzFjjHO0Zr+BG+FQd3/MOlbBku8CxRYwSlVkbM3NTXGHxXtcUJuG89gJ8aBgYGaXx3/6iISzz3cXfpBbhCF15WT/dg3jk7dEQ0RJFU7OWZ6J2N0BU3kgTqTehp6uUtjLfz4i5+1oTc1+umZXbNJSgHrtkZhhruB7HfUKgLp8s2H3lcifT2t3EoGPQVgvLBswdcM1gR7vjPwYOzHDExOkhEWEx0y9MqLBqa5mDmgcoAERWb+9XNuhkYLDoCGsugpmk30ZbcSNwWjjf3dB8Hj8urdt7t/NmTWTHxeab1q81l0EsrDvjenH2v02kmn50/2RerOP6lN7B09Bo7SNEykpMxA9rupzaEZH6I7dwRBLTiFfRUcqBPqzgWvmnlQg6Ut4Wn+X4/ur191yyOUISwF5zWM/jyiiDVS/S/mV+El06VenGWHQ9DbSgpX+4QYI5Bbs6iqNpLwjgV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82960400001)(38100700002)(36756003)(31686004)(86362001)(31696002)(2616005)(83380400001)(107886003)(26005)(41300700001)(66476007)(66946007)(316002)(54906003)(110136005)(66556008)(478600001)(53546011)(6666004)(6506007)(6512007)(6486002)(8936002)(8676002)(5660300002)(2906002)(4326008)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ZTQy9PWTJXSndkQVFDTzNRZTRac1d2TXo4S0tnaUVXTUlKZUJOdnJKdjFB?=
 =?utf-8?B?SnoxU3RSUFRQY0g5US9jTmVUd1lReU5hUUpmT3MwUzRMLzhvamNhTCtPb3dT?=
 =?utf-8?B?ekJpS1R1aHllZzJ6L0JBTklQTXRjVFl1Yi95ZGlKWERvNDBvWVhRd1p5U3Yy?=
 =?utf-8?B?Z1hyNHhjRVByR3dmM3JtQ1Fqa1YwaEtpeFFwMENpblNaTDB3S2o1ZW95WEpT?=
 =?utf-8?B?S0YwdGR6NjVuTUVSTndKWVorQzg1eEI3T2U0V0F5VHZ1ZDZrNHJUbkp3elgr?=
 =?utf-8?B?a08wR3ZoMVljZ216ODhSS2E1bHVBNUNlSXVMUVRYSE5WWFJuV3gvYktGWGEw?=
 =?utf-8?B?cDFqVlNrV2NPSndBZjRzVFhlb09HNzVKVmYrVEdVYVpJdWRITnhUY2x4SXFz?=
 =?utf-8?B?bFcrQ0FnQUFoUmdQcmR0Z0JHUGlieHpJOERSUVl5VGJnVkd5elA1QkhGSUZ4?=
 =?utf-8?B?aC82a1I2cTFWWTJYZzZyTGlBSnMxNzJhVENycXRsUFY0SHkrNmtodWNaNWI1?=
 =?utf-8?B?d0UzK2VkLzBmUnBwS0VEQ1lKNVI0STRBVU1OVkM5YnVPcENhUlNqZGNIZTVj?=
 =?utf-8?B?RkZRcDJJUExTREFQd1lqQjFpS3EycEVnRERPTVl3MmR5RTNJaEFOemRpU0t4?=
 =?utf-8?B?czhRVkE0N1dYQk5kOVZ5Y3JRdU80SzJZSysrS0VUWHZpOUlmUlRXOEVjRzBs?=
 =?utf-8?B?UXZLS0VaVHFZcU1BRzBLc3hudWZaN3NBa1RGQ0t3VGhqMDRjTmdOUHRzRmhh?=
 =?utf-8?B?NHhmN0tWNk9SaW9ZNmVQVzlqMnlReWVIbENTU0tzQTNQVVo3b3ZvTWdzTFVN?=
 =?utf-8?B?NFdBVU9ORTFXZnQxcE9sV3FPNjR4dzEzNW9wTVNTaXpnclVPdEdxRlJDMWNl?=
 =?utf-8?B?WTNhMnlxcXlWcExWRUhnNHRtdnE1Rk5IemZLekJhVmpxaDB2Q2FEeVZFREx5?=
 =?utf-8?B?R0N3NkZKbDNSS3YwVVlDZzRadUIrN1hpNzZjQnlqRURDa3VOTGpTdGwrN1RJ?=
 =?utf-8?B?Ti9lQzY3WGU5MzdnWk10VnRPYU9nTlcwMHRoSlNuak9mWkhnUmUyUkZYRVN3?=
 =?utf-8?B?T2dFWm9CRWJvU0V2cnVENFFwSFJDWmo3Yyt2dnk1ZDBDTEN0VXJia0NuaTNF?=
 =?utf-8?B?ZTlpZytkdG43dFE4WmVma2RIcm4xSnhRdUVyTGRZajhOZWRjVXFtSVpQMkEv?=
 =?utf-8?B?dTB3S1JweW05UWQxVVFuUWJhcmhRS2MzbCtuaHF6TW40VU9nU29pNGIzSndI?=
 =?utf-8?B?a05nQ0pVdEs2eVdGdVNkNmZqdFA0QWpVS0Eza0lScEZWUVRTWjJIdEJqNDRK?=
 =?utf-8?B?NURJRXlTNWF6WVhkM0tiUWRBeWRvQkd3ZWFyUm5EVzZXT3k4c0JIeXlrL3lk?=
 =?utf-8?B?SEticm9XK0VTRENyRFV6ZzRwRElva3RWUENpamhmTnUvV0k1WG1OclozS3gz?=
 =?utf-8?B?Nk1wTWU0TmZ1dkRKbG1KUTA3NEloMVF2c1JWUHFJZDBHbVNTYVpta3EzYncx?=
 =?utf-8?B?b3dKWTFKL1N1dnVDekpuQlJMc25qQzE5RExWRG11KzhQVndNdkl6Z1FUVlMr?=
 =?utf-8?B?ZWwrWVVmT2lRRStxMVV6RjFSclNHcUVVTERKZG1WUXV6eWpORnRlcmZYalR6?=
 =?utf-8?B?VnU3SEZpSHZTTWY0NVBSMVduV3c3WG1vL25Kbk1DL2w4cVZXOVNqUFpkMW1z?=
 =?utf-8?B?c0N1emhqU1BrQllXOE1MSGdnTndPYVRpV0pxNTMyTDZRY2tiZlQxTE40djM5?=
 =?utf-8?B?YWJIKzQ5UzVsbzhFdUw5dHhSMVkrV2FOeW56KzFJTnRBK2VtOHJmREhua0J4?=
 =?utf-8?B?UDhtVHZmYXBxY0pKVVNBeDZqelNYejFTRlhyWEJ1b21PVWxnVHM0bFIvRWZM?=
 =?utf-8?B?WHhUNWZnWHdNdzQyMS8yeTBYMnk3WGZBMjJZVkFZaW10T3BDVWFuRzRIbWdS?=
 =?utf-8?B?NmU0NWFNWXhMZ0tKeEZrQ0JmaGlwOUNNaHV6blc3MHMrbjMySjQxLzJXZEVL?=
 =?utf-8?B?M2FLZURGT0xmYTdja1N6S1hOaFpNaGxYN2dXWktQQVFiV0dPZGJySGppM0l4?=
 =?utf-8?B?YnZZQU1zQmJwWTk3RHJGd2M1UUl5cVAxdE9wT3YxazA5aHJaczlnT2QxRzhm?=
 =?utf-8?B?SEZERWNKYTRuMDd1OU84TVN2ekh6NFZjRWZLMG4yVHFvZmw3NUcyS082dW5Q?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e09492c8-c8d9-41e4-ca9c-08dc0b60fc4c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 07:03:56.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYfB/aHEvj1/yTaV1om+JD0KtJ2s/dsD1MiT0MoSKxyNTX9W2C+7WwsOUdXex/f61UGucAQZp6VoOZ5b4Zt4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman,

Please find my comments inline below.

Thanks,

Karthik.

On 01-01-2024 20:07, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Sunday, December 31, 2023 8:18 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>
>> Subject: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
>>
>> This support added as igt test freq_reset_multiple fails sporadically in case
>> xe_guc_pc is not started.
>> A completion is added in force_reset for this.
>> Writing non-zero to force_reset debugfs entry does synchronous reset.
> We need IGT patch as well for this patch.
>> v2:
>> - Changed wait for completion to interruptible (Anshuman).
>> - Moved timeout to xe_gt.h (Anshuman).
>> - Created a debugfs for updating timeout (Rodrigo).
>>
>> v3:
>> - Update force_reset debugfs with write support.
>>    value 0 -> async reset, non-zero -> sync reset (Matthew Brost).
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c         |  2 +
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 72
>> ++++++++++++++++++++++++++++--  drivers/gpu/drm/xe/xe_gt_debugfs.h
>> |  3 ++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++
>>   4 files changed, 82 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 3af2adec1295..c8d2c18b0c62 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>
>>   	gt->tile = tile;
>>   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>> +	init_completion(&gt->reset.done);
>>
>>   	return gt;
>>   }
>> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	XE_WARN_ON(err);
>>
>> +	complete(&gt->reset.done);
>>   	xe_gt_info(gt, "reset done\n");
>>
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c4b67cf09f8f..3518ab89ccfc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -55,15 +55,71 @@ static int hw_engines(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>
>> -static int force_reset(struct seq_file *m, void *data)
>> +static int force_reset(struct xe_gt *gt, bool is_sync)
>>   {
>> -	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	long ret;
>>
>>   	xe_gt_reset_async(gt);
>>
>> +	if (is_sync) {
>> +		drm_info(&xe->drm, "waiting for gt reset completion");
>> +		ret = wait_for_completion_interruptible_timeout(&gt-
>>> reset.done,
>> +							msecs_to_jiffies(gt-
>>> reset.timeout_ms));
>> +		if (ret <= 0) {
>> +			drm_err(&xe->drm, "gt reset timed out/interrputed,
>> ret %ld\n", ret);
>> +			return -ETIMEDOUT;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +ssize_t force_reset_write(struct file *f, const char __user *buf,
>> +size_t len, loff_t *offset) {
>> +	struct xe_gt *gt = file_inode(f)->i_private;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	char arg_str[5];
>> +	size_t size;
>> +	unsigned long arg;
>> +	int ret;
>> +
>> +	size = min(sizeof(arg_str)-1, len);
>> +	arg = copy_from_user((void *)arg_str, buf, size);
>> +	if (arg < 0) {
>> +		drm_err(&xe->drm, "reading force_reset arg failed, ret %ld",
>> arg);
>> +		return arg;
>> +	}
>> +	arg_str[size] = '\0';
>> +
>> +	ret = kstrtoul(arg_str, 0, &arg);
>> +	if (ret) {
>> +		drm_err(&xe->drm, "force_reset arg parse failed, ret %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = force_reset(gt, (arg && 1));
> How about  !!arg
&& will use a single instruction.

but !! will happen with 2 instructions, so I think && would be better.

>   > +	if (ret != 0)  {
>> +		drm_err(&xe->drm, "force_reset failed, ret %d\n", ret);
>> +		return ret;
>> +	}
>> +	return len;
>> +}
>> +
>> +ssize_t force_reset_read(struct file *f, char __user *buf, size_t len,
>> +loff_t *offset) {
>> +	struct xe_gt *gt = file_inode(f)->i_private;
>> +
>> +	force_reset(gt, 0);
>>   	return 0;
>>   }
>>
>> +static const struct file_operations force_reset_fops = {
>> +	.owner = THIS_MODULE,
>> +	.write = force_reset_write,
>> +	.read = force_reset_read,
>> +};
>> +
>>   static int sa_info(struct seq_file *m, void *data)  {
>>   	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
>> @@ -192,7 +248,6 @@ static int vecs_default_lrc(struct seq_file *m, void
>> *data)
>>
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"hw_engines", hw_engines, 0},
>> -	{"force_reset", force_reset, 0},
>>   	{"sa_info", sa_info, 0},
>>   	{"topology", topology, 0},
>>   	{"steering", steering, 0},
>> @@ -245,5 +300,16 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   				 ARRAY_SIZE(debugfs_list),
>>   				 root, minor);
>>
>> +	gt->reset.fr_dentry = debugfs_create_file("force_reset", 0600, root,
>> xe,
>> +			    &force_reset_fops);
> Please use DEFINE_SHOW_STORE_ATTRIBUTE here to create rw debugfs entry.
> Use force_reset_show and force_reset_restore function name.
>> +	if (!gt->reset.fr_dentry)
>> +		drm_warn(&xe->drm, "force_reset debugfs file creation
>> failed");
>> +	d_inode(gt->reset.fr_dentry)->i_private = gt;
>> +
>> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
>> +					&gt->reset.timeout_ms);
>> +	/* set a default timeout value */
>> +	gt->reset.timeout_ms = 1000;
> xe_gt_debugfs_register() should only do the job of debugfs registration.
> This is odd here.

Shall I move this to xe_gt_alloc (xe_gt.c), where gt is allocated and 
initialized.

>> +
>>   	xe_uc_debugfs_register(&gt->uc, root);  } diff --git
>> a/drivers/gpu/drm/xe/xe_gt_debugfs.h
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.h
>> index 5a329f118a57..40adcf1822c6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_GT_DEBUGFS_H_
>>   #define _XE_GT_DEBUGFS_H_
>>
>> +#include <linux/fs.h>
>>   struct xe_gt;
>>
>>   void xe_gt_debugfs_register(struct xe_gt *gt);
>> +ssize_t force_reset_write(struct file *f, const char __user *buf,
>> +size_t len, loff_t *offset); ssize_t force_reset_read(struct file *f,
>> +char __user *buf, size_t len, loff_t *offset);
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index f74684660475..d6134215094b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -148,6 +148,14 @@ struct xe_gt {
>>   		 * code to safely flush all code paths
>>   		 */
>>   		struct work_struct worker;
>> +		/** @done : completion for GT reset */
>> +		struct completion done;
>> +		/** @timeout_ms : gt synchronous reset timeout in ms */
>> +		u32 timeout_ms;
>> +		/** @dentry: dentry for force_reset */
>> +		struct dentry *fr_dentry;
>> +		/** @is_sync_reset : gt reset is synchronous */
>> +		//bool is_sync_reset;
> Remove thus unused var.
>
> Thanks,
> Anshuman Gupta.
>>   	} reset;
>>
>>   	/** @tlb_invalidation: TLB invalidation state */
>> --
>> 2.25.1
