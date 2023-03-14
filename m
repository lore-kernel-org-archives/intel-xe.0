Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90BC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 09:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12E310E0F0;
	Tue, 14 Mar 2023 09:58:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E0410E0F0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678787932; x=1710323932;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yja/JNMi3wqMUXUyT5QTE70K6pobAaSCCDCsBqQO52k=;
 b=M861Tnev80UJ8mj1MZEHglnPDvsh1dHaDXQcx3UClMQl7Y8/Bi0Jh4Mi
 6im3U8onHfaXVYRaqa67+nss1zmVfKTHMyGHT8UynJF3pDBSyqf/+QM3y
 MuKU/JX3EEFatBLnLDBemjS/Ghii+P1ktHKXYUh4NhfK0epJnkB/rSft8
 eGQfn7orTCDntOjwvyCcXpES4bW7xBrvcXBnuXm4qzpjqHYUIjXcBlJCJ
 rlq2u2l2WXIZfUcmHW1iztEmaWmhgI0E+kLv594M4kNk35oh0G4aPutIj
 IBKt1SxkewHNMqnxNAwpsE3F1dcKx1gcjwqV7T9D2hHiTlciMT7OoFiy3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317767635"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317767635"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="853112671"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="853112671"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 14 Mar 2023 02:58:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 02:58:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 02:58:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 02:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipRSUf8sT0c7ay8dquhg1wqL5VtYxN/g4rYuh0SUlSIt5+ipuuXhlmtoNppRnx4WkNu1pWI7ZESKuqepG637kpCFIOoBMN/gihM6EocEdXASDRUyEXLkUegcX/mKDgSE2WDvykZp7Nj6LvLK5c0QWb4rT2RX0qpkBOkGxfNVyGvS8CVJWWVTerx9O9vBPsLVf68UAVyt2fZVCSawzJrslKAepGxd91JlaGOIWoZDGRg8B50ht2/avHZngVPNed9KvE5aUmz6oarBq73Hn5ek3YtqQRBVPSFnACrhfeLKPZohcOedL5k3wbIfT8sS/naE0FILl/vb8J9IclGuXb/kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HXpF8Cei9cwD5cX7aWTk9reHhWPkwktyQUKBlW792M=;
 b=EbnhgGKTP1q+GlgNdbd31N60rpdoB6xmx4BlidSdYPR7tPUAXmgjXb6X6OyuVXIeqitNAY+RvVqsiXw+hOQnVFb/j4bwiyoSabW1Q2KA7AJdc7XrfegVp5qsUqHAT9js/QomvLBPxsUbJ3rroO65BgSuM0/jOxPZNX3i98vN2UkyDZ8PWEWPF9LWNZ9pp5WyxCyzZKPSHyTlEBI48Mo40NT0nB1bKsrBpG0p7QYFvmfwSHLoMZn4atkFKCVl/HHHyOzEIvwlQqTRwGAJtmk2PMw/jAPGn21a/749RCSyQ3Q/asMlEv/kt4fI7xgJNmCNZTBT/VkH7d/sCeCS8NiElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 09:58:35 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 09:58:34 +0000
Message-ID: <6cd67568-5400-1fa6-2c1f-58f56147bf66@intel.com>
Date: Tue, 14 Mar 2023 11:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230314085842.134239-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 4479b4b8-b799-4f51-0b11-08db2472ac63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGib4Msab5gc2AUT9Q366SQEcogf5E/r/pMoaphgkZHHpB+yDyYwPyyXbGIAtAsh9+2s8Y8zEO9VEq+Z6FjOhCwo6nmzcfgJyPQbm6feCguyPgF8EeYcgr7jhSh9nL7LIOV9jOzYZWcu8anXWF09aoXD3KeJNL1neAYVdWRkeobb1DRQrzotd4enLsOeKHLXkWNdIys4xghjSJBr8/S3WVbLvNsx4Rj/3OlT3+aNRa6VfEerP8oVyE21vWdUYyOH/SeeTNw+q5fzZkCKX+n9Hnzk+E5o6rrSDP20tBxW2UDWf/nk3znL44rK/AJU/RVeB7h4Cx8GRpV9sFJFNLfk3EdKMy4n6NCXGD9LvyO62pS5hACX8jkm4pvKDLK3nLo85k9WpvOiKhJyl69O3diOQxBlWBODScKM3Nt1T9q4qqqaqzsJeW8MvXlyPRhpcL2rn38GAexP2VIsWVaXhhlWAMyrj8YeFIzAnLTkW1eDExC0YeahN/ID6F0yq/wwR1LR4IX9SJgxHsssUJoHFwoAa7wgmKGICnl1puDo24ft/pV5iuAQh2+mn6bjlGm2E4+n37HKuxjr6qWbkEYPkGWpsG9hc71CUe89Llpl/UHvrbS3AK1Xpk0rca8/J8sfMuUA4hqs4BI5ULm1lBWDerwzg/3L0n1dwNzrv7Dpv4YD/TkrOpA7Tx25ZkxYn/RGWvK8T8ON1EtyJrjvx9tQpC8jvhbHJX1Rd8BVAVeJBDTzEfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199018)(2616005)(6486002)(31686004)(478600001)(83380400001)(2906002)(5660300002)(8936002)(82960400001)(54906003)(38100700002)(8676002)(4326008)(316002)(36756003)(186003)(66946007)(66476007)(86362001)(41300700001)(31696002)(66556008)(6666004)(107886003)(6512007)(6506007)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJVc1QzR3V1Zjl3VlBLVFV1dlppRklEWVI5VGsvRjRUODRBaVFKUnZRbDJX?=
 =?utf-8?B?VStHcjBXUERDTks5bFF2TkFOdkEzL1VSdjNBcHc2ODBweWxhNFUwQVJUTTVV?=
 =?utf-8?B?UkJuT2pJWVNCNitPWHVpOUk5dTVnNm41dld3SWVvd3ZTZ0RJWDRBS0dmQ0J1?=
 =?utf-8?B?UGlneXBPMzRIakVGeWd3cXo2QjFHMnJOMERSRDJWd0FmTlZZazBPM1BIUnJE?=
 =?utf-8?B?Q3UvYitpZUFnQVhEamhJbHlHcUJpV2RzWEpXWHFSU2NoWEp2NURtS0Z2SWth?=
 =?utf-8?B?aHZiaXMrbHY5Y1NQbHlNRkw3UU5WNkdBMHBKaVVFdHRyUHBzOS9xU1JlWlYw?=
 =?utf-8?B?a2x5VUNaYXNmanpmbHpBVkdlbTRLZUpqazYyVkkvUWgzS2o2aTZ6ZnVUeW5X?=
 =?utf-8?B?ZHlHY3J3RktFak8rYTN5SUFCZTJLVXVOcVFFWmtFVCtJeFlXck5GSkR5MUU2?=
 =?utf-8?B?RWdXN0xvS2ZIL0NpOTlyaHIraDlHQlpnNlhndnpKME5qellHZGZPeDljZEtK?=
 =?utf-8?B?S3lFRVlibGloa2Z1RDNHNEREUDQ2T0Z1YnlUSmM0VERSUXdCR0VFNFVybWVv?=
 =?utf-8?B?UWMwSDFlOWhkZDQrUjBxRVF3R3J5MDVkWVl1VG5aR21IYzJTUkNyK0t0MDcx?=
 =?utf-8?B?VVZocEYwWkYvT1kyQUo4WUU2b0x0UWUrT1k5NTRWQW5TTWVPck53UFhYY01X?=
 =?utf-8?B?bS8xY3paRzRxOWppcXVTR0NoaWNIV2N6QU9MM0V2dDdqclI3YjFseS9MdmFV?=
 =?utf-8?B?cU44eXp0eWV5YkpXTG1WNzZYTGpFRDZFVFNGU1ZXalBDTndSSlRFVzdCeW0y?=
 =?utf-8?B?M1o2S01TaldUYTVRb0pkZ0ZuazdUMXRaZ2lVa3I5aXplUXVqVjVuSjA1b2ZK?=
 =?utf-8?B?eXYxSm1KSGxlSmNGRW1RVWE1RjRhNCtPTy93S2R4bktVNjN2MVBxTEFuZHBV?=
 =?utf-8?B?REZhV1hCTk1sbDVENGZEdUdBOGR4YzZTS05XcVhHVUVEMVRCODJLY3RhczJl?=
 =?utf-8?B?L0FxVzFXVXA1MEJBR3Z1b1hMZ09XV1pEQTZhWW9jTm9NaytJdTB6aWFmUGRJ?=
 =?utf-8?B?dzd2ampDSkFRbHRBKzlnTWtyS1JVejVJL2FJWXljcHVyUExyNkVOT2ZDdnJK?=
 =?utf-8?B?TzdxalR0eWc4elgzV0dLSjRiMldrZlVEUEgzMlFWOEhtTWpHeE5mMUs0d2pj?=
 =?utf-8?B?Y2NmOE5DakZ4ZEtEV29MT2Q3OGpxSEpUdWgvS24rd1NkTitMVThmc2d1blF6?=
 =?utf-8?B?NmNaZTZvMC9SUUFnY1E4UWJqN1FrdEVpaysxUVdQeDZZM0Rqa1crbnRmcGR2?=
 =?utf-8?B?Z0RCZHF4cSszNEJHcUFOWGsrbE10OGd6ZGQ0NXhDeFZ1ajJrQ0Z5ekpjNlpV?=
 =?utf-8?B?Y2lTUjEwa0VuQ2UvOVhhN2hISlQranlTSC9XaEhjRm1wb1FSQ2pJTFN3UThQ?=
 =?utf-8?B?RVZ6VWVXV0R6dGhKeENVY296VEdLNkU5V3MwTFZONW5oVXlHOVMya0FTMTJT?=
 =?utf-8?B?SU9ndVpkUnkwcUY4cVJTQlZubjNnajgxTzhRQ0ZkRkFsVDg2a3UzZ2swV1M0?=
 =?utf-8?B?YnBqZXZPdVZEbVV3a3FKclBlT01DU3pxaG5aSXppTTM0WWZlcU95SG1aajBU?=
 =?utf-8?B?UGx0WFUvMjloZitFNEF1MmtPOStDQXllbGRQdjhHQXAxek90S1FCbmEvNzc3?=
 =?utf-8?B?TUErY2tqWnR0dkMxRDkwTHk1akFFL0pYTmlXUDZPS1hzWFlCeDcwbHFzajhn?=
 =?utf-8?B?eU5JbHBIRVhxVDIwTXB2cHVjUVNVcUJwRENlZDZzMHlxWXFsWm05aDNrS1Fk?=
 =?utf-8?B?Q2lMTVhCQlpRaEdTWDM2elpaQnRSRTR4UXBseVkvaGN3UVJMU3lKbldvSC9l?=
 =?utf-8?B?anZNaFdUUW9KRnlsN0syNTJ4SFFkNlZSeWJ2dWpsdFBjN2dpWnU4QXhKQkNW?=
 =?utf-8?B?WjdPazVrZWM1UXpSSEV2TkFZOTByZzFIUXpjbXFLNG5JbWRDcFRBWTFKVVo3?=
 =?utf-8?B?MFRXbUM1a3VyTHFGcmlOOFFSUUZBSysvOWwvV2xwOFhGTmtQVUlzSXo2UzIz?=
 =?utf-8?B?cVhEM25la3JzTjNTbmEwVkxoczlQOTFRbkdkOHVpMHQrK0NwdS8vd04vaHRn?=
 =?utf-8?B?Qk9LaGdHam44YitaOEEwcUxXN1p5ZlByZFVzN29TZnVJYVFkUnpBVi96dFFw?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4479b4b8-b799-4f51-0b11-08db2472ac63
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 09:58:34.5724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFORiF2jKDYP0YkaLogiNWEV1TwaLNWex2fp1Upk2YnfjqV6oezYg+Sn8rPY4czFrN43uDW1uxtjYsEWkeP6XlB7oXNzN9gmBTA9brSsBu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/6] drm/xe: one more s/lmem/vram/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Looks good to me.
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/14/23 10:58 AM, Matthew Auld wrote:
> Looks to have been introduced in some very recent changes, in-between
> merging the driver wide s/lmem/vram/.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 1116e217ebc2..27cc31f022a5 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -90,9 +90,9 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   
>   	/*
>   	 * There may be few KB of platform dependent reserved memory at the end
> -	 * of lmem which is not part of the DSM. Such reserved memory portion is
> +	 * of vram which is not part of the DSM. Such reserved memory portion is
>   	 * always less then DSM granularity so align down the stolen_size to DSM
> -	 * granularity to accommodate such reserve lmem portion.
> +	 * granularity to accommodate such reserve vram portion.
>   	 */
>   	return ALIGN_DOWN(stolen_size, SZ_1M);
>   }
