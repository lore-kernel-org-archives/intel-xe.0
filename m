Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601EC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 14:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1016410E038;
	Mon, 27 Feb 2023 14:34:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947D10E038
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677508472; x=1709044472;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ZsdfRK/Xy0TrMkBsKr5Y8FstgBpyblqL8upGZFSdCP4=;
 b=JrDd1lvKbrCtkr92vVVNo7m4X9YKgaZdVJs5VCp79p0kStI2PoIdDg/I
 lj2XOdmwLYGzRpUD4QyHJOvJOCcapU+fHV8SPahQKAw48oV5ooiJNQhG4
 a7BKl0MROEUKw5ThA7y8HmD/fr1sQseZISyljehXH2JXCsg306qvOyC9P
 XNBuMdtsV3iwMk7COXM1JPna7UyUJxn9BHqhvLl8+7ACQEo1WIjVoDpVU
 nINCxf4Vbyc45zWuysDi8xdy4OinQ43L0gH9aX/QO0L5CZj3RfZnomb3Y
 YkZM0layXllbP/UPcgM6siZCXabBl2O+n1f2B9y9cuwYGxf31nGAeHP6w w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335350540"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="335350540"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919375440"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="919375440"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 06:32:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:32:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:32:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 06:32:21 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 06:32:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH5rBBtFh4noJAKVj9OME2trg2xdBYr8cFBo7vyZN0ufkGnCFoQXA3FLVMKNof/T+dDlGrQeL8eB4goiZCun1eOW1ErkxrErrCYKA+h2nMBRSSQLNMnHo3SeYBz8d+24xfJIaT8lSvDegjuYbjKFEfnypqFpQ8Cm3HCKZ588bo5b+EwaxM8YphKI5PY9tHjd3yaKH4si7JHVP1+mNCf73lUTOt0NVs5Y+3Z2W5vml73oNa8PIitLgNQFfKmwAxVwiFpiS8yCBIKXQOEx2kBLcFxALW4K/nrHvzVvcJFQyZLM/wVqKvVtFCpCCsSScOIMGapcNFKWLexTYU2YJozw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG+f1pH2z9vEPBjybQF/J/zw0sLIxziZXGQvgLFUNIY=;
 b=BSxwVoR5/CXIL+R7SuKelNErC2mv4UTWk+5+lb5wtlifI4ApgBDU7xgLcAGJeG0P/dzOsJGF1E+zARZBcvGvd07jY4++1fSE9poLpweeyN2b4Fwed3FXv8JkwR4hBjiMrw72qBbDjA6cWkTjq+ZDF95mCqdEYcXUsnhZLHikBx/gYAzhfhkH0eRU5Abo7Fp46FGNYZRS8Ifnsr4zlfDX3D9JndWlFO5taqiYYl2n1e4188WzoPjD4kIzwzRNysUg0ZR5+HS2i/ycDlBxUf0evzDmhyeVS0xBvNgiOVte6Bb0r0/q7kkh9FVJs0Vkceexk02ZfC375CSGftysxJCdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:32:18 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6134.021; Mon, 27 Feb 2023
 14:32:18 +0000
Date: Mon, 27 Feb 2023 20:02:03 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <Y/y+Nbc/5K7zA+br@bvivekan-mobl>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf9b09c-d0a8-4990-67d0-08db18cf6df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bASGxgh5qVuPcQpj7QtCTxNV5hMtf4NgRYOPosyGKssP8rqXqq/FbS8JVCTTOT93nzWceq8hiIZIxnSZLzdpoMMpCyjVkB33gQ4JCVOM1EUa2I0V+93fvF2FSklxeYpFqLXIGAUb6rkLTFOFGa+CCIy6OSOPKkTgKSevS49trN/wFfiC0qNLITiUNCxXahh0WCcbkM5L7zXU5eRZCbI/Sc+V6L+2jXYsNYr1ZTCIeW0c3x98dTLhfVZRpSU6RKI1l+hWaJx2qpjGQGNYwSRWcoxVanBfz0dwVXjEBXYNfZSagzOVJdfFAdYyrWrpTFLfISF+CAMsRiM7+WhWP6WxWdKhUr+1TXKm1nNyHNP+O7Q2S6eN+GVal6PFM3lO3kpavb2hhqpc+hxa64H8GmwqwvzAZmc7Y9wxmL8eWDXX8OrFPs4boP8oMwY64jiFaDS7UyuWVPs/LgQSgdC/tG/WQDMI7lgA4ne2bRxKxLxZcoxjJ3OF9eOoWVpTaejMDLFoopEiJLGS6eQsV5cXE4RnHzQNQQQDpZC1e9CsUzL7Wdo6Bal4F0ousqpXrsFZxjEZgIQrKdTH3nBMXpWgpvfLoHPB5kRqWPfc0dy0rkHRRW9k2MLOqnyy4n4rFFw1xQX9LoXlsXK9HArhvlIZmO4H4EVpQZoNA8T//18Ji3KpFI/NNny+T+xK6bNSey70Ya/w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199018)(316002)(38100700002)(2906002)(33716001)(86362001)(82960400001)(41300700001)(8676002)(8936002)(5660300002)(44832011)(66476007)(66946007)(66556008)(83380400001)(478600001)(53546011)(6486002)(186003)(26005)(6506007)(6512007)(6666004)(9686003)(26123001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDIzaW9UbnhEeVR2RGRNOUlOTzVsRE1XaWN1b1ZlQ3A0YUVaUTA0Yml0TndE?=
 =?utf-8?B?WDhXcVJmcGhVU0tBWEFmQThyTkR0UDlvNUFzdEFtZSs0d051NExTMWxDYk1w?=
 =?utf-8?B?V0VtT2NZaTNWdjh0Ums5TkJMcTdiaWV5UHI0RjgxOTdiVWV5dGJ2VTlvWHdU?=
 =?utf-8?B?T3M0VmFBYXlCU1JheFl5UnlJY2ZCN2c4c1kvMlBGeUEwLzQrR0NiU2lTWFFl?=
 =?utf-8?B?cWEwTHRTdXR2TVh6bTVpYVQ3M1QwZjU2M3FsTjVyVDhZZUZQT1N0aXJEWlAr?=
 =?utf-8?B?aXdsWE1zL1ZHV3kwN0RuYXpwMUEzVnRReW9Kb09FWVdxSStrTHNuYlF2dy9Y?=
 =?utf-8?B?RGRCMVJ2K2hRM0JHc1lDZXdDYXlHVFRnV1FGVGVHb0RVRWF0cUtOd2dTVVFS?=
 =?utf-8?B?RUtuQW5Va3lkcEZLUFI1V2k1Nk0yZkM1VDRmRzl5ZGVYanJsc2d5MFVvVkFn?=
 =?utf-8?B?SFFlOGZzR1QybDZJd21vMlFXRkxZeENEWlg1M0tNaWg3UVlwVVNvRWpFUC82?=
 =?utf-8?B?b3lMRnA1dnRYZlA1WlhYaHRyK0FFUjZ2am5LZUxnd0RJNnhWMzBMMHF3SlM3?=
 =?utf-8?B?c0hIamxjdWZiMnFHT0ZMQ0RSTElVWFlkenVJOExEc2NjNUIvVXJWTS84TlpN?=
 =?utf-8?B?Z3QxWGt3aHdQeHBBbitONXh0YVJuY0RpWjJrQ3VPQlJZUEdSTmlrdm5KbkNr?=
 =?utf-8?B?THMxVFd5MTJnZmJ2K1g5ZVg3VFVtOTkxa3ErYTRzVmFFN2RPVEpoMTNsL1dB?=
 =?utf-8?B?ZDEvNlJSZTdTOThDY1NXUUordXdJTS84T3ZXOWdldE5RRU14eGx3NXRrVVRx?=
 =?utf-8?B?eFZ4M1ovV3dwZHJIbEN5eDRhMjdaY3RQbDhpTkl6TXBPamp3RFJLa0xFVTVl?=
 =?utf-8?B?TUVodlZaV290SEtRZW0wWkZDK3lESDdwKzEvdEJuWkpkVlFpM2E2WUxLMHpx?=
 =?utf-8?B?TWhGUUh2c2dEWlFiZXh5Rnd6ZmtiZjRhWkhJR1c4T0tHeFJ2WVY3Mkl4WEtm?=
 =?utf-8?B?a1d3a0lSSEtmVzRwamxoRDIwVTFJaTJtbWxLeDljTUhhRG5Nek1rem4zcDNy?=
 =?utf-8?B?ZGloWDR6UXpjMzdDa3BwaE93MkhCTUttVlZCb0dTMCtnSGg2SURCRWpXV2tC?=
 =?utf-8?B?UEg5N1FZTTRUQlh0bzFxU1M4VEFsdWcwR0QwK3Nudytadk0yWDhTRlA1SlVp?=
 =?utf-8?B?eXZvckUvdlFZM1krSFA2M0piZ0pNWWNqNXRKTVRpMjNvMHU0QVU5amlVMUN6?=
 =?utf-8?B?TEFKRkFYYXR0VkN6M01PK00yL0cxdFdveHJKV0FJMk8raitKRDZ6R2g1VCti?=
 =?utf-8?B?NzQ5R3BxaUNTVW0wK0F5ZDZpWEljZGtXUEtrRjJ3REh3bmJnWmVYUXA4NXAr?=
 =?utf-8?B?clhST255enduVFlydDBqOFlSU3Rza3I1MTBweWdZUGVBa00wWFdzcHJ2ajdY?=
 =?utf-8?B?eDBKajdBM1dnYkR3QW5ucmtEMVZLVlNwYkM5TEZYKzQyOUZRaTlRS2hQTHZi?=
 =?utf-8?B?ZWpQREI5L2U0M0NWU3ROTWM3ZGU1WXVIbnNPVFpBMTNJWmJ3OEJrYkV3bEdx?=
 =?utf-8?B?TmNJVU0rRkhtN2FPKzc3Mk5LeE03WXRQay95dTVWMXB1Z0twYUtLQ1lZUEZt?=
 =?utf-8?B?UEVERWdyTnJLRFJxcG5KbVIwc2RZQy9rQWNiSlorNEFqNXgxZXJCMmNZV2xB?=
 =?utf-8?B?K0wyTklCYmNaY21zZU5Va2FtL1ovUTlGM0NmZVN3KzV4YWFlR0RwS01WcHJw?=
 =?utf-8?B?T21qRSsrUVhnOFVSZktYWXNnUjI2dFZsbndIQUQzU1ZEYXNuV1YxZTJycFdN?=
 =?utf-8?B?K1ErcmhEUUU5dWFKSWFkYmJKRWFTb215bXUvekFUR05HTEZpK1FxcHdnZ0ho?=
 =?utf-8?B?WGhRQVNoQmxhMGdBUVVqVElPbHduZW9UVk9zQnpqWmd3THlyelJOSUwzVklw?=
 =?utf-8?B?UWxLNW5xMVRSNWFIR1EzekJSUXhaKy8vMlRmN0dSQXk4bW9FWGJNdU1DdlFo?=
 =?utf-8?B?Qm9hZ3FCVWdyZnJXMDV2VnFZMkJTNlNTSmMyblNCZ0o4T3kzamdpMDhic3kz?=
 =?utf-8?B?VWhodmtPZmxJL3gyU1A1V0lDSWdpdFZEdHNzYUNza2J3dFJGL0hJdGdQbTdY?=
 =?utf-8?B?bUVaSDEwdzdHbURzZnB4Qm5vWGZvZm5sNXl4Q1lDR3BRQlhrVGFPdWNWY0Vj?=
 =?utf-8?Q?yEebC4jt90fL1k2tg44fGu1aBQjlFKTKslT4EjIlzu75?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf9b09c-d0a8-4990-67d0-08db18cf6df5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:32:18.7340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7mzEwbCnieEHMQEdXAh8g5Nwi4SyiEWRTS9qT1zJ8alRBZYnECCQK4z489abfrQ2jlhj9rd34i2L566Q8Fgh9SZiB/T0p8OtLsa55iyrclRMGdmKAWqsOvRuLn7fjHC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe/mocs: Drop unwanted TGL table
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

On 16.02.2023 15:17, Matt Roper wrote:
> TGL/RKL/ADLS/ADLP are all supposed to use the same MOCS table, with
> values defined in the bspec.  Any entries listed in the bspec as
> reserved/error/undefined should always be initialized to the most cached
> and least coherent setting possible so that any userspace accidentally
> referencing those undefined entries will only experience an increase in
> coherency if spec updates down the road start defining real values.
> 
> The TGL and gen12 tables that exist in the driver today are identical
> except that the TGL includes one additional (incorrect) setting for PAT
> index 1.  This is a holdover from i915 where the platform was enabled
> with an incorrect setting and by the time we noticed, it was too late to
> fix the table without breaking ABI compatibility (and on TGL we did
> indeed have some buggy userspace that was referencing the 'reserved'
> entry 1).  Since the Xe driver starts fresh with a clean slate on ABI,
> there's no need to repeat the mistakes of i915 here.
> 
> Bspec: 45101
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 46 ------------------------------------
>  1 file changed, 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 86b966fffbe5..09adb69d1545 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -247,47 +247,6 @@ struct xe_mocs_info {
>  		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
>  		L3_1_UC)
>  
> -static const struct xe_mocs_entry tgl_mocs_desc[] = {
> -	/*
> -	 * NOTE:
> -	 * Reserved and unspecified MOCS indices have been set to (L3 + LCC).
> -	 * These reserved entries should never be used, they may be changed
> -	 * to low performant variants with better coherency in the future if
> -	 * more entries are needed. We are programming index XE_MOCS_PTE(1)
> -	 * only, __init_mocs_table() take care to program unused index with
> -	 * this entry.
> -	 */
> -	MOCS_ENTRY(XE_MOCS_PTE,
> -		   LE_0_PAGETABLE | LE_TC_0_PAGETABLE,
> -		   L3_1_UC),
> -	GEN11_MOCS_ENTRIES,
> -
> -	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
> -	MOCS_ENTRY(48,
> -		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> -		   L3_3_WB),
> -	/* Implicitly enable L1 - HDC:L1 + L3 */
> -	MOCS_ENTRY(49,
> -		   LE_1_UC | LE_TC_1_LLC,
> -		   L3_3_WB),
> -	/* Implicitly enable L1 - HDC:L1 + LLC */
> -	MOCS_ENTRY(50,
> -		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> -		   L3_1_UC),
> -	/* Implicitly enable L1 - HDC:L1 */
> -	MOCS_ENTRY(51,
> -		   LE_1_UC | LE_TC_1_LLC,
> -		   L3_1_UC),
> -	/* HW Special Case (CCS) */
> -	MOCS_ENTRY(60,
> -		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> -		   L3_1_UC),
> -	/* HW Special Case (Displayable) */
> -	MOCS_ENTRY(61,
> -		   LE_1_UC | LE_TC_1_LLC,
> -		   L3_3_WB),
> -};
> -
>  static const struct xe_mocs_entry dg1_mocs_desc[] = {
>  	/* UC */
>  	MOCS_ENTRY(1, 0, L3_1_UC),
> @@ -422,11 +381,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  		info->unused_entries_index = 5;
>  		break;
>  	case XE_TIGERLAKE:
> -		info->size  = ARRAY_SIZE(tgl_mocs_desc);
> -		info->table = tgl_mocs_desc;
> -		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> -		info->uc_index = 3;
> -		break;
>  	case XE_ALDERLAKE_S:
>  	case XE_ALDERLAKE_P:
>  		info->size  = ARRAY_SIZE(gen12_mocs_desc);
> -- 
> 2.39.1
> 
