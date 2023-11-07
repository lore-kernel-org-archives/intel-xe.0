Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF3C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 20:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B2910E150;
	Tue,  7 Nov 2023 20:42:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95B810E150
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699389735; x=1730925735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehPMUEJhTtHfifTX27g0CxMprge4in1NdWXhzv8Ledo=;
 b=aH2/XzPeGn0Wiu6GrO40KgZg7gbnUXTb89LutzOF4EWXhlVewnV8Vf5Q
 1KQMingFIsHV2xY8LF8L3Uor+4DeaC+pksnYhf15/Rab0a4tf7hV/7pKG
 cNYTyKqJZ/NOyPrAuHHhfcWtdFKH/ue8WV3e5Y8XI+JKv1uBJXaRfN9PR
 1buLZ3bfuGigJio6CtI0qcfAgGmKGICPM44sZP/TLntH13jRydKTWdklu
 Z3DHlM+NfDkv4KjpN0PYflajMXogfvd7FXvp6MMY6uyoZiBBLKJxmwIP3
 8V9gTizC41lFqZOSv+gcf7Wht2pCHaRhGmiZbq1oRlHgtSraJkZIYmfS3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11169907"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="11169907"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 12:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1094266320"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="1094266320"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 12:30:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 12:30:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 12:30:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 12:30:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1GrmcFdGwC1T0KxBAzK8KE4aZXpKs+88rGcRkYu0/u4qqn3Stzknq7styXdG5GZDQbSi2uf7OEkMxLSVg/oItZr63m6vVxerrg2cS381X1Z988Bq6I4+VmsBTplhkPelahhsMe1ZntqC6t8j/9AkZsIcrw6EYbFjigFV0MAtk4m0dSkjkqc3BS2vd0l6XVCc8TqkIFdj5S9A6lrsdC4bfpgEwGql7uSJMn1ymMnhirw54yBdEeTnKm21AhywIh/9ssfj02v31UKJWOoSpe2we1z8AinYyX7nh4wAbbWME3aUbUNiyFTMwqPBa9uYPq0HIGBXDscXefT/mk4Dfr5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdNXPoR+kNkar8bCAVehoBWZgaiGds+AJWo7HIwuxmU=;
 b=YBZAiFPfd/4kQ0xsmqSP4GyhyItTJTecg9gcJmdbmAf6IqRIx3hjdhmcnMuUtERN+5JSzvt/dpMnfxQowzhpdjdJYV+1hHSSRQpN8lGKInBvTettLZgjBRDVMO24I+3MXT9b2wqzQLIfIHtn9xovzJA/+Z1RpayoFkoAFvSXpBUXA9Z0CXGKBxTrwB4k0khpP9XvvXe7/rAS1CxTdQlv3rcMc2K2coLlwH5xF0EszQG4MxjPgVKq9z/QnqVMQpVlaEIYuCO0TCRBjiXfcKgLp+nhLvR7eMXYuteH48VlqEOGJmlmjxV/3v/SGWlpFkrQKPhS5lGthxR2hwMUDgO/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.25; Tue, 7 Nov 2023 20:29:58 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 20:29:58 +0000
Message-ID: <f1ab8b17-bdc8-4866-8e94-c8888bd6b8a7@intel.com>
Date: Tue, 7 Nov 2023 12:29:56 -0800
User-Agent: Mozilla Thunderbird
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231107193751.741119-1-pallavi.mishra@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231107193751.741119-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 276893ea-1536-4f67-189b-08dbdfd04f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIcyX8LZNhRjeweHVT0kXfBBjSOaKL7uzQEBEMNTYTc1um19qkXiIDPhSXB3efviN9cpEG+Ak1DJ8X4DEnOZauk6/OyDwCsC+AhPN0mG7ho1pFiB+EQNm67Rn5OJMsM63lUUTA43Y2oO7gXSU294XeqwkRDsOmjyX7GT1qBphCzoOMck3ADiaGZ6oWsZNU5QtwzMtQRGnLhB5ZMcmXQv5+iSIevp7kBFmXqSX7WDLz+9Z8bpG0s1MKMEfvYIMp7KvkS+UJstw3Ji5p01PTq3ANhcvnYrEdn3mdn8qTxndvoXasd+3vdZP/i78BODNZKWS5wxpRyJuQEpMDoyQVL1Y6zJPELQlCebvaprU/eXd6sU2nHqE74ARxQxNJ+V7ushfZ0lqti7yRqQVU7Qe6kS0YqklZEEdTrY5Z0K4LGZruBkG7BG/70cJkAn0QhQHEls7+5H/uXlWeju2pDJGtOHGcNd2635r2ZB4Ip8K4WkvJFg1Wdxqij1lsGJ9zrEahN1pBoAJLgr89I9r7yLraTHuBihtrbpjddM2qGwmX+U/USKrhpMkatOzhecTnWQAxMJaOvQ3MFnJ8TR6VXAhV15vsnBYKdD0tE8C6q4ey8Rz+ESyNltRfSWo+XLokghui9pF4hU8WuvtQgOownhAWIkRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(86362001)(2906002)(41300700001)(4326008)(38100700002)(66556008)(66946007)(6486002)(82960400001)(6512007)(2616005)(6506007)(478600001)(83380400001)(26005)(107886003)(53546011)(316002)(5660300002)(8936002)(36756003)(8676002)(31696002)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTdVUld1bFdoNUU0M01MKzQ5aG92a1BnY085TUlPcGk2aUxpSVhoaisvVEta?=
 =?utf-8?B?TWd1cGE3RXpZMXhTWG5sNjNTUkw4TitnclpoOExTd3lqK0l2K2tsWlFaV1JK?=
 =?utf-8?B?Z20zTTFIcDlKU1Boek43SW13WFNadmJUS2pEaFVGRU80MjZCM0FTeW9rQ0tP?=
 =?utf-8?B?MEF6cUVLZ0lwVDJxeUlrT2pBWHlGd3ZZNTZLUTZXaWQzaFpGYjFuQmpwcngr?=
 =?utf-8?B?enprcTBHRWV5OGZtUS9oUGZpS05GODA4RTVEMnB1eG1qVTc0Q3RmUjZ6NjRl?=
 =?utf-8?B?Q1hURmp5V3RMazAxNE5aYjc4RzZhTDZtSUsvNEtYQUE4ektCNmNpRlFXelV2?=
 =?utf-8?B?WlIreEtMb3p1NDRILzVMU1l6aHBSRU1wTFE0QjU2U3FFV0pVZktBL2JaMlYv?=
 =?utf-8?B?all5SEhmd0d1cEZIdGhMMVdJa1F6RWxLaTU4R0xZbXI4aEJHZ2FpZUlmaEMr?=
 =?utf-8?B?bDIrYzFwaUdJOFI4Sm04MEc0YUIxK1duTngrZUwwbExMb29jd0haVDVvUTIz?=
 =?utf-8?B?TUFzS01VTXh4aU9GV1FpaG03NVB1cEJOVmR3aDhta0VJRVRIc0RaUFNEUlFQ?=
 =?utf-8?B?d0tDSmwxWWdUdG5Jc3FmNHpZM1owNGZCNVpzVlZndDNYUWROWUtRR09scDJp?=
 =?utf-8?B?aG0yTmRJR2tLUTd3UXVyWWcxejg4WHI1MWNhc1grdzJlK0FKVFdCSXFqVGZs?=
 =?utf-8?B?Y0l6SENNZzVWQUlEeXR2bTZtV0MxSHI0My9rejlHakdvWWFtZkpyMGwySkt1?=
 =?utf-8?B?K0hvZEF3bEgxdzY1WjdvY2NZNTNEbmJrWWI4OGZYWEtkVFRPVC9JckxoUFFX?=
 =?utf-8?B?azZ4NmIxc3FLQWZMRmpIOU95U25hcjh6RHJIaUVXdVhnS2Rla05JSzJnN0Np?=
 =?utf-8?B?N2NpNWV3djVlK1NRbjhkM3NFZ3FNUTVSUWV2YTdZTGhkaWREbHp2bzd2OWU1?=
 =?utf-8?B?SHBKaS8yUElXVkgxWGt0VkNMaEttNEkrTmt1TU5IK1g5ZnhoNUFhM0U0SHFL?=
 =?utf-8?B?U0x1NThaZ01VcU0rU2NVZ2E3akFwYmFtMnhFWVFSczNVeE9aSzJkTUpSZ3Ir?=
 =?utf-8?B?cndQOG42Z1J0MUlyWmZEdDVQSGYrMG1TUUd1RE5CTVBmZm9RditJVCtaRFI0?=
 =?utf-8?B?NUpXeG5hSndDVGxDaXNrcHBLWE1aZDgyZmxwQ1hZRTB1MmxQTHVNcVY0Y1g0?=
 =?utf-8?B?WHlicUxrMFlYcTFJRFpyREJuRVFmb0dmT3pxaGJTdlVkTXBkTFhsSTl6cmlL?=
 =?utf-8?B?cndaWmkwTVNGK0wvdzV5aVpnVjMrZ2thZ1ZXdGRVbmNXWXd6ZWpIdTRBQUps?=
 =?utf-8?B?SHRXcXB0QzZMenNSMEswRlZrTjZjUm9nOE5jbTR1UTM0dC9rR1pmMWdTMUNw?=
 =?utf-8?B?WVdwalhFM3FpenAxTVVITTcxaGdaZjJrUE81MXZXVUJYN3p2SkplbVlxdnQ3?=
 =?utf-8?B?V0ZCM3dIZ1RjMUlTeG9EQTlmajlRcUY0WUk4eXdwWUYxUDJrRmxLc09zeDVM?=
 =?utf-8?B?SzV4TjZUS3M4MVBxQlRSTHhDV2c5cmRwVERBKzEyTTVONmowYVlwVW13Vm5S?=
 =?utf-8?B?U0ZuTE1iL0N3eGdKUm1FRVNuaU9jY1dvUE95c3JpalJ1dm9OOGduNGtJajVR?=
 =?utf-8?B?ZUlTQ2dLMTNFQnFMeUpLLy9BRHYzc3JYcjVsZ2YzZzc2VHczTDRIV2M0eHBI?=
 =?utf-8?B?M29HZzhvc3JPdmMvOEdwWFZWODEzcVlKU2xlcjZXemNrYjl1VE82SkMyek84?=
 =?utf-8?B?ZTVMdk1JNFdjb3R6NTRZMG5pYndDNEhqc29LUGJ6OUtoUVVHV0NoRlhtV1Bq?=
 =?utf-8?B?NC9zSWNVeVBjeDloc3JNY2VxYVdSU1UzVjRzOU51Y0c2VEt1bnFYTlUwb2Ji?=
 =?utf-8?B?L3hob3dmeTQ1WmZmY3JHVU01dFE1c1dhUDZEajBzMzRRUGVVcXFIUWdVMDJs?=
 =?utf-8?B?WnpmZHdRRWE1QXFzaFVyWUM2Q0d6TnFXd0FrZEovSHVuVGFSM2pPNDNFRVF5?=
 =?utf-8?B?aEhYVEFYN1VXTFlISDQrcWU4U3RscFdmTDQ5cTlTWGZQVmNzSWR3L1U1d0x0?=
 =?utf-8?B?aUV0T3NBYWwwbC9FZlFkVHp1V0RyVHVZY3g1Wmx5MFdrY3JFVW9kcC9QRjNK?=
 =?utf-8?Q?432sNyWoJB3DhNUwtcAwL5BPi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 276893ea-1536-4f67-189b-08dbdfd04f47
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 20:29:58.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrpEfw8IFrdXrSgGYaF5JCekwxzuLLf65lgK59VUHjUa70cC68qvE6sWennKDlROy4Bxan6Con/yuBoX8xwaFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/tests: Fix migrate test
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



On 11/7/2023 11:37 AM, Pallavi Mishra wrote:
> Pass a valid vm to xe_migrate_update_pgtables.
> 
> Resolves NPD crash seen with igt@xe_live_ktest@migrate
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Reviewed-by: Brian Welty <brian.welty@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index c984307560ee..7aad09140d7e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -236,7 +236,7 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>   	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
>   
>   	then = ktime_get();
> -	fence = xe_migrate_update_pgtables(m, NULL, NULL, m->q, &update, 1,
> +	fence = xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q, &update, 1,
>   					   NULL, 0, &pt_update);
>   	now = ktime_get();
>   	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
