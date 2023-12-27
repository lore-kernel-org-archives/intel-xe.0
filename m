Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51906C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 10:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA4510E032;
	Wed, 27 Dec 2023 10:17:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E83310E032
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703672237; x=1735208237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9T6jjIkFV8VEAwrEEz2HAxBauClC4b5fo3QETyZMpEQ=;
 b=DqMyYBzw3w32oUYXuFvF8o+wCGjox2KHnMpZzlgX2e8S+XULbbwVAS/m
 2+YWbqiVR62MIJPkmmOQ470vLiNp1ZfhocCXs3UdqGJcOMQe6/JXnb8nx
 mwqasIa6e9E5fa6eJimFIqKzVwQChojr9dAM57dMLEfku+v1qUS1HXJyR
 aA4/Syzz7ULEO0Uhj5qXOD+jeWnB4RRwIebpWMABT2LFO8/HOhUnigDPJ
 edUSw4deMkBLXKr3Ek2gzgF09LEOVT/TqHAXbh00sH5nmy4z8bnrxRZwu
 ueVnapmqB+JqUzpwfMcpCa/F1T0PDl+Wej4gaiO99h+BMYbvo0irMHvXe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="376578317"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="376578317"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 02:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="812487239"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="812487239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 02:17:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 02:17:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 02:17:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 02:17:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 02:17:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B21UP99cXtwCvlfKTrDgiGMq8R4bCsxKPZ1mx9hpfN7D3AQIUSY0kYcGd02o6aftmwB/zG4iDOvC4XZvgjCqIMVNaLpiGocBFNkMaCqt+iWV+xtIUpdjCTbJNmhr3TvJFTu/IaLSh+wTA8RJhhTssoHRZy9nE/wG34mD+isqJZnKuHQBrgSefgD+7qmkKhyIMh4bmD7aIvJZR/ZsFijnQDYESSKvUaVUzoC5aDHHGJF78xyx+eg/vwgLc6qfGR2OQh3VJKgHI+WJdrH9HanIpoII1Si2wX2Vfarxk/oqHzxu3QJjSQFVwYblf69f8KOTPRC957L4eHdIiKQENPKrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1bmxiVJwDHCldVhytb0H4vpSGnX33cePnCVin8hU1Q=;
 b=NzNfI395Aj/Ojz80Ic7pQS70/WTsOEO2DkvevUJo+Qd/Awlr73eWAoVHD15YiwH/pp/LyETnIrG/gdRRbRzMeyo540c4sgmy5BFuEOGPBnflUoChtph0eaLI3FgvNdhH5ozhXJRWBG1ZYRwBK25fl6yGa4EFO9a2EA7P7ZolCS7JkFlrMy5dgmhed30Ip+bMI2bcF2XP2OtvtTqdp/ZRWmRwK7/+Q/GXdcEZ8X7GmFObRI4O1wnUlpgtdN8lytYQEA1OdnXximU496fijsNZE6D0sW75DXGF4MwGOdGZz83M8L5jZoTuuzyeJ14gYqLNzBAfm72Sis9R5FRMBN0n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 10:17:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 10:17:13 +0000
Message-ID: <f829f1c9-ccc4-4328-aba9-b13b12268b4c@intel.com>
Date: Wed, 27 Dec 2023 15:47:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20231227083204.3982491-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: f671a59c-c90e-46d7-4dd9-08dc06c4fe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uU/7YcUwHTTflH6mdSUVQxQGxhUP8nzC2Nxg3MBnh9mSPHYj/zaZbB3pEhbnX6Cs0n2gYo5uuK2GJ1RbdCsDCn/K4qr10o+a482bhqgPWcJ55AC01Yd0rKR+CTQVO8XCXkGQ4o65ub9m+KSiHE7JDDEEq3UlBPK9cSJYTMOxWW/K6lrJhSpMNak8aycGLgP3bLst9ZVI+LKV0HYRQBIyR9QvN0eLRd/+EB6MdnKLB0B6S/JRJ3jwKkCM1zat7f6F043Vn/jZ175J0vYA+VtfZOtbBjHFuYj1gp/10nVRaP1ZLeMvVq2Z6Fy6eQQVnNDMXDt8fXr/beGDq6RfsbFxDHo99cFQxhMt6oPDfpOTWS9vtE3ljdZtbAqmL0tUZMOGbDcHMpwv3ultHp2UBmhSDtmDmfZ8HpGDGHQG7+66C1ddm4gtohee47ctgCu3nPtf5pdPedYFzTIMc7mIDhFMTmmZpPY3lfz01iErB5ynl8PeeeHdD5oo0hLje6mp7hw2qzfaLJEXQLFi4nUt2RBg1DN+rPF56MtcJAdyqbDsauliJFOmddI4HMWzKs0zsB4XSPvwVph10gl+kdmxautPYH0sCCyHkW73OcnmiyM1JodVfTlEJBkG8iyfWRnB5lKyVAXZKOjTIhvaFnj8aHaMNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31686004)(6506007)(2616005)(26005)(107886003)(86362001)(31696002)(36756003)(38100700002)(82960400001)(83380400001)(4326008)(8676002)(5660300002)(6512007)(53546011)(6666004)(478600001)(316002)(66946007)(66556008)(66476007)(41300700001)(6486002)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BZV2hpNFhvUlhzWXZlU2VEUEdXS0o0d2gwZllPaUYyamEwRSt0eDYxT2c5?=
 =?utf-8?B?U25vczlUbmU5Z3RRc0dPMWVYYzNoY1duT0tpQ2hucE5KSERVdXRac0VIS3hx?=
 =?utf-8?B?bGhOZm1MeGRSRkhzNHM0aEJkTytGWHFQN0lRQ2dLSDZBTm9PRHlmbE5xMkJX?=
 =?utf-8?B?ZWQzM1JWUjk1eThlSXk3TU5PSmVLeTNZN1M2ck9SWTRVRzBuN3NtRk4vK0RE?=
 =?utf-8?B?a3V0bjVhUG1GTGhvbW1nSVlUb3ovL2FmMnJ5UWtscWpPNzZZNXpTQ1ZGRkZ4?=
 =?utf-8?B?RzkrK1luNzR5cERzRjNHVUdYeGxkSGxOZktTTFZmQkd0ZFVFQVNSOFk1anln?=
 =?utf-8?B?Q1dpdGtOQytSeGZMaTFNQng5aTdXQllJMWxDQXNVSFBibjBrTHAvTmVQSXMv?=
 =?utf-8?B?WERQQnZ4WDhrejlLd05hY2VmdkdLVWtaRk1RZHAyRXV5U2hRTVQ0eGdUb3I3?=
 =?utf-8?B?TG1RTXFJSDVleXVSckI4RHE2ZytzeFZmbGhYL0JLUVFhbmRCbmZIN1VQUGJU?=
 =?utf-8?B?VU9yYWRZYWExR3Z1aGhrUU5INVNFK0Q5YmkzMHBLWG9YZkFmZ015NHBqa05t?=
 =?utf-8?B?RS8wWGdsT2xzRHpLQlVPZTRHRVpLMVNsODg3NTJvSVFvem5SN2pQc25EUzAy?=
 =?utf-8?B?Sm4xZVR0eStocEZ4MXg1RkZrbWNSaFpOUkZ3SS9pOGZReHpaTk9ndUhjcmRt?=
 =?utf-8?B?MXhFQ3pBTzRBOWpzUkJXOFRJRU9OdnJMczJEejJkK0pQclY5T1l6dDQvQm5T?=
 =?utf-8?B?Mngrd24wRWM1NDUyUEU4aDJBdDFwMWF3QWd6bng5dTJFeExKOG12eHZ6UWZs?=
 =?utf-8?B?ZFVhYm55OFhFM3VTZk1ZbjRNV3hhamI0V1ZQeW5ZekM2eWRWWUNYcy93SFJo?=
 =?utf-8?B?a2wwaStGTHQ0aERLaDA0dDljZjJUVUswenVmTEc4bUd0Vm54bngyT1RUSFpI?=
 =?utf-8?B?cWI2SEIrMHZRM1Q0M1I3ZVJOVVdqTUY3Yld5bUYyK1BrOWdMZ0JVaVNzc2g3?=
 =?utf-8?B?bjNsanc1d2gzSTJZR0cvemg0OU1KaHdDcjRVeU5MQWV0MTA4VkF1NDF0NFZO?=
 =?utf-8?B?VExWRXJTMUhVSDNEai9nMk1LYUduUTgycWlGWDBFdDhvNllVR1NmVDl5RTVk?=
 =?utf-8?B?czhzRlJ4Q0ZqakN3OUwzaXk1V3U5dWdKaktYdE91K29DSHl4bld4RERhTVN0?=
 =?utf-8?B?TzlGVFVsZHYzUUk3cFlDZlpLenY5OFBWeWphaktGVFhiWlBYdkpoWTBsY1pS?=
 =?utf-8?B?Vmp6ZlVPd3VsSHFULzVTMTVsMDZQcTR3VG1XS2hEbGM1VEx6QXZuK2dyaXFj?=
 =?utf-8?B?anZ6aVp1REpvZk1oM3hDdnBjNEFVRGtzV0FKUnhIQjlGTEMzQXJFYXNpV2Ux?=
 =?utf-8?B?ZENDcWZlUytHdFZqSmpWb0dySUltWWxhekhVVG1kcmMwdGVvakFqZVFnbWhZ?=
 =?utf-8?B?eUdiVnByeUVqSFJJaHdLRzl6VCtLNHJrSmVuWk9mSEdmTUljWlNBNEFPVXA0?=
 =?utf-8?B?RGUvN3FBNmZLYXJXeWdmL1BvWm1tWmNIcXZVUXF5SEF1NEZLcDJXaFN6ZWdw?=
 =?utf-8?B?cmg3b1FvYWJpWklsVytYaXF6cE5GczhjT0h5cEhsWE9xNE9aYWJIS1NjT3pY?=
 =?utf-8?B?Zy9pcjdxd0o0RkZQSkNtSkhQT0h4OUFVdFRTN1pBN21XU3RKQnEwckZhazZI?=
 =?utf-8?B?UXl3c3o1bEtDM1Rqc2oySkRaWEJ2SzdrU1YzZFJETzdjenVTeWhiZ29Rc2x6?=
 =?utf-8?B?Y050bUZSYldiR1FNU3J3THV6THAyQ1hTSmF5d0xnendHTENxa0VrcjlaWlk1?=
 =?utf-8?B?b2dlbngyb0QwT3NaZG9wZTFuY2pIY21WcnhlK0srWm5tMlN4dGVQN1ZCUUNp?=
 =?utf-8?B?Mi9qcDJIL0RpRTVBdWM4a3NYdnRjU1FFTmczVlA3eFJiTjJUZi93MDhyay9H?=
 =?utf-8?B?MjFFTUZJRy9TTDBkdFZBWGx0azN2cXZNdklIVC95eGwvWWdFWXZyb2ttcFBW?=
 =?utf-8?B?SCtSYW9pbXVNVEErenZUNW5TVVFodUdNVlNSY0xEVTFaWGE0TzB1bDAvbnVD?=
 =?utf-8?B?TjhmaXI0WGpNV1YxanllV3dQbzlNWjh5dWpvOGJJZi9tV0trUldFdDU5WHlZ?=
 =?utf-8?Q?1ol9FTt9vDSjA+ETrBp8PF/9p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f671a59c-c90e-46d7-4dd9-08dc06c4fe47
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 10:17:13.2122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOMdUS1w2yn4vIwfxi5NBpO9AD4Ccr1ABy3OGmmw5hNPI1FMttdJMryE/TY6458OWeTwaeTbSFJm5OTXfxwHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 27-12-2023 14:02, Karthik Poosa wrote:
> Wait for gt reset to complete before returning from force_reset
> sysfs call. Without this igt test freq_reset_multiple fails
> sporadically in case xe_guc_pc is not started.
> 
> v2:
> - Changed wait for completion to interruptible (Anshuman).
> - Moved timeout to xe_gt.h (Anshuman).
> - Created a debugfs for updating timeout (Rodrigo).
> 
> Testcase: igt@xe_guc_pc@freq_reset_multiple
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c         |  2 ++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>   3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..47abb9336c58 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   
>   	gt->tile = tile;
>   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset_done);
>   
>   	return gt;
>   }
> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	XE_WARN_ON(err);
>   
> +	complete(&gt->reset_done);
>   	xe_gt_info(gt, "reset done\n");
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..fbda886c8a95 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
>   static int force_reset(struct seq_file *m, void *data)
>   {
>   	struct xe_gt *gt = node_to_gt(m->private);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	long ret;
>   
>   	xe_gt_reset_async(gt);
> +	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
> +						msecs_to_jiffies(gt->reset_timeout_ms));
For now this is ok but in future if there is need for synchronous reset 
in other places then we should use wait_event here. 	> +	if (ret <= 0) {
> +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
> +		return -ETIMEDOUT;
> +	}
>   
>   	return 0;
>   }
> @@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   		return;
>   	}
>   
> +	/* set a default timeout */
> +	gt->reset_timeout_ms = 1000;
> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
> +					&gt->reset_timeout_ms);
May be move this in the end i.e. before calling xe_uc_debugfs_register.
>   	/*
>   	 * Allocate local copy as we need to pass in the GT to the debugfs
>   	 * entry and drm_debugfs_create_files just references the drm_info_list
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..824cefde20d2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,12 @@ struct xe_gt {
>   		/** @oob: bitmap with active OOB workaroudns */
>   		unsigned long *oob;
>   	} wa_active;
> +
> +	/** @reset_done : completion for GT reset */
> +	struct completion reset_done;
> +
> +	/** @gt_reset_timeout_ms : gt reset timeout in ms */
> +	u32 reset_timeout_ms;
Wrap this inside structure.
	struct {
		struct completion done;
		u32 timeout_ms;
	} reset;

Regards,
Badal
>   };
>   
>   #endif
