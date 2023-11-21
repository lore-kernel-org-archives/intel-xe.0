Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92630C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 04:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BB110E035;
	Tue, 21 Nov 2023 04:50:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191110E035
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700542213; x=1732078213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VxCA/gtvlMFBnC5T2NbHgcSMJi2e8pwmtXS5eJ0sjq0=;
 b=DIP+y/od6ewn4NPPCR5x9lMN1PXwaI9tY+JYI5WT9OqebjCfbIv9+N8j
 iSGwjQT53LVuILhHya4hFlaiDtczsCStU9i6C64hrMafVs+ZA2f6ERBBG
 NCfFAk7fjTZLGg1BZhjH+YUXXbIMU/Lii48NQ4SAadZnUSUYE1LZIiKfK
 SL2pW35wEcyCwmGvvTu4OxYrg973FtRQFMwz2MCiuffLckhkL1B5lieJr
 6fNfK13vhBf+4XC5pFg7KEeXuptv1P7IFhiTua0+FKCSIxZ0PGNA6uMST
 t+B5sjCbUw2MX4po0lFVcS+E2ipxzD6k/AeUKzf0q+E8IoXDD1W41hRID g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13310519"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="13310519"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 20:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716417683"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="716417683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 20:50:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 20:50:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 20:50:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 20:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln+9trgXjIRpgORDzKL+pSQqlAExGGRr03dh5Uj9Fmo7ugSf2UMl7EblBLiSHoyVhrVceN1SgSiLiCBeU+/hsO7N869xCFvYMHHfY7XIZzkl6fXCL1alQ7GEF7uYrWFzIAkRWgMNQkl69henCns+dG3BaXrxc8RJbm0dmP1JmBv+3rdr2ou9Lv1qAfqgY05TZ5FftTKC/6gZNqhDFFM80RcMt5xEyKIZnO9ffo0YXNVwnjF5FBhGTLIlM0zqEgwS1wI1gjkodwX1kKshq1cVKYQgYu6jpHGXDCcAuuXMZ8/LW7Z+hU754YVevnPKDtcpE85/XLLqQuLn+2I91mkYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg5wpY/eCgL5+5K1aLnQPbmWVVrAW2qxEPsKG+TBTVo=;
 b=WinVg3hF5L875lHTOT12KrbBWZIO/LvI4PJDAGCQIId1dRCso3qfkAOpI6n5n6SHT+KHhOtXQjPnEfF3u4swMSGaxK2DoCLZB4UO62BuMPr6+p4RVvMvVGE2vuz8GFIbwPhVdWIPApqDiUVV9h7aBibvlzVWpVCUSK45l0I4fQ+zWu6f2AGP64ZyAlMdgEtlyibXbev/2BQGYFTXgn7VTfDLgG5sMGVkUVnkNhuSYvvLBbg1LDD46xmeduDAbE9UuupEWOfIruknJsZ5UsU4HVRyr19+QrLKM/E8Vu7qzBdouSJE74y3pLCXInoHYFeqry/q5InTGG4QsdkU74V4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.26; Tue, 21 Nov 2023 04:50:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f%5]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 04:50:07 +0000
Message-ID: <27e7aba4-6048-4023-ae71-f1501bca570d@intel.com>
Date: Tue, 21 Nov 2023 10:20:00 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-2-sujaritha.sundaresan@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231116143043.908412-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: d5305885-d8a7-4426-e55d-08dbea4d5582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMMb4Ieo8zadEPsp1aiGq+KaHrfPlTrHslBwN9OFNvkpNZjUrDAHUIWXHiGXmqLIE9YnNy3ptJiDr5Mc5LzWC5W03Jglx/xjtm5Er9RQ6Gv9yqzKXUdQCOw+AC9YPbJHkW5VfSsoXFI+x8MJDmIJalZuxNWt5VGrlbDzW0KtkCIM8mc2n5HHTIu5nEI/9O5JRlt83QS7Lx9cIHqPqS6sn9gXWmaKkOFcAlQG5wgjkPeO3Ja20YFBRmEQLTcAS9KzFvHrBx/BL9G81mexIqMhy+vEZy/B4eBIYqfdCILJ9W+qGBM7pSwDJAh8SNKPEyGohtFKufv4mKZ2frtTCrktXsHu2KwSWURF04+eDjoDIpU9t4/wzF8Ttm8iDSH37iTaekq9AtPkbIpZYikm71XRSgtVj1WgcRqKsbjOpnDdDgwMtWTIS1Dp2xTUW3AlV1fOMyfaIf2caPVL2VK6tm9izDy9r76uV8pU06dAiraCLRwOGgDF2JH2DC18S8q2vfUneF21fjJKIjXOPKC9hckPJ6Y/BEZzFwXCXIIITjlw6CdTu4DVH9OPGXEUK13uFBal4+HwWHfmv6prSeHW4M8mpwKiHj7hp4GRuK5aHruB7eeFwVyctdXBOm/cZ15MwhlMAZQW9LY6V36UqmpNnJ1bUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(44832011)(5660300002)(31686004)(2906002)(8676002)(4326008)(8936002)(41300700001)(66476007)(316002)(66556008)(66946007)(86362001)(107886003)(26005)(6486002)(478600001)(6512007)(36756003)(6666004)(53546011)(6506007)(2616005)(83380400001)(31696002)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFLaGNVVVcreVZCTENJeXdyeHNwbU5iaU41dlUxei9NSjh4RXhONTJxRkNo?=
 =?utf-8?B?VmQ4NTFEZExSSzJ4U0dvMlluL0I0S2ZpaExMWTB3YndqTVlyeXVMamgydzAw?=
 =?utf-8?B?N0ZWSlBBbXNrMXh3dkZIemhtZEw0N3ZoeXdINWc4Sm5FMmNvY3NGdUp2Slcw?=
 =?utf-8?B?eWVGb2VvWDhHMDBGenc2cWVrVDBlS0R1dUhzaW1Id1RSUVRTZS92UXV0bW51?=
 =?utf-8?B?ZGlhbExhTEtjRUpOVXhkYnI2V1A1d1VHUGpNYXJobGxmVVdxQWpId1FOeERj?=
 =?utf-8?B?TlVTeWhoWXBWdzliTkZhbVRVUjdjS1pyZFlvSjlZUmxDMVRkUnJPTHR4ai94?=
 =?utf-8?B?UW1BQm5TMTZuWUhLOG9tTXh1WlhQb0k1ZEpLRWl2NytiOW1XdDJncDhUTEU4?=
 =?utf-8?B?TkdQV0MvRkZGdmZORnFPT1JLR0NRS1B2SUJjUVhoZ3BacWxWOU4vSElXUENr?=
 =?utf-8?B?OVBnT1VrSWFHbElaUnVIODdwM0hRY3ljd1JHckxHbGNGd3Q5RXFtRmJSUExZ?=
 =?utf-8?B?YWZjNzRELzNXRWt0Z3FiU3JzMFpTd3lkRFRHMmx2VkdRaEszb1R1eWJQY1Jj?=
 =?utf-8?B?eEZjRUVDdUZuNlkwNjgwWGFjZHhJS1dQKzBVNTU1aCtFR1dGVVJCL2pyK09D?=
 =?utf-8?B?aEFGSFZlWU8wZEtqVWJHWVJNcVNzSWJOeCtLcWh0R2tYZ2ZxNWxwT0VmakJL?=
 =?utf-8?B?aE4xUzRNcysrNTRlQlkyK2p0REpzYmRtNVpLb052aFI3SGc3SU9hd1c1MkRX?=
 =?utf-8?B?MjJMcmRsU2xnSlJrK3ZyL2JRUzFVMmNkR0c4ODVHd1ZERHpzbFg0ZGdGT1NS?=
 =?utf-8?B?STRqZW5iejZOd1VQOW5nSGpONnBhTWVEQ2U2SnR3dGNzQW5mSCsrMXBoMHB3?=
 =?utf-8?B?T2FmMHBDYUpRL0NKOU9PSVFhUk12STFFdG9NV0RvUHdvZWFwWW1XaVVUaHpT?=
 =?utf-8?B?U0g0WG9zNjdsdkFMOXN5NjA0WTJTZ0RRN214NytSODkvVzA4N2xMekJmWHNN?=
 =?utf-8?B?ZE9BOUlNeUJIbVpuTjhyY0ZydDNMRE1WS0lLR0pseVpVYVlsei9NQjJ0RWND?=
 =?utf-8?B?Z052YmwzSFhJcm1PMC9YL1NVS0pDeFRWVjZ6d2xNaWhjRXd1NEZjaGR4K2Rp?=
 =?utf-8?B?V2prYk0xQ1JvSU5raFNNRTZDKzN6THMyZnVzMjRtZGdqRGptUWw3ellFUlVJ?=
 =?utf-8?B?dmNyUHM4YitZRTNOZXQwbVBRRVVKN2Z4T2pXSngwVFRrVU5UNmhKZmtDTEp0?=
 =?utf-8?B?RUdwSDg2SzZZMENpRStoaVJxQVBvVFNwdXRWUnBBVmlMMmc0Sk5zUGdJK0N6?=
 =?utf-8?B?RlBHWnlmZkMzczZrWWtKbHVENjFPU1lhZW5NSFVEWmhjL08rMTNaZHoxQ0R2?=
 =?utf-8?B?QjRqYVd5b3Y4bDRHcVBDSm9Nckd0dWFuYTVqM01RamlHY0lmb0F4S3dTR1dO?=
 =?utf-8?B?TUVSOENBVTNxUDhuL21xTndCMnRhaTJTelk4SUp1TDFVcmVxTXNqZDVKKzVz?=
 =?utf-8?B?dVlTOWorSnJ1U3RzclhNRE8rZWRaN3BiZE1FLzk0UStRdURyaGxMQ1VQRzJC?=
 =?utf-8?B?U3gvcE9OTWVFSlA3Uk9oS21LNVFlLzhsTnJlZzd6YWtRWTl0Y0xaNCtEOWJU?=
 =?utf-8?B?Z2xEM202NjJhT1dwaGo3Sm1td05jRDdDZFhjejJURU1kc2hWUzM4UkxER0N4?=
 =?utf-8?B?bCs3eEIxWEJzUTFHTHVtbFVrNVh5c2tUVndhS1dVemc1ckZmR3JLclNrbGkz?=
 =?utf-8?B?SE91ZEt0TU1iTHBaTE1UcmY1UzVRdnNwMXdJQmZMSm96RklTZ20zOUxrT1c0?=
 =?utf-8?B?ZnlpYW1UOVNvVktYZ1lrcUtvQ2JyQzhHOVdlemJORmoxTER2ekFkM29STVFL?=
 =?utf-8?B?TThOaENaK2dGbFNHT3AvSTVWVnk1Z1dTak15TitqWmFUbEFTZ1NXbVpDYWhP?=
 =?utf-8?B?TEsvandoYzFvWmV6QTA2cEllV2pkN2RzT2tocXcvM25GcVlIbUZ5RHJWdTYy?=
 =?utf-8?B?R2loVkJwL3RWeTVsN3ZCQ3RscG9GSitFcERlK1pVbXN6QXJzOHNiZDBGYkp1?=
 =?utf-8?B?NGVtdXhvdTYrQzRzZExwSGZuQTdzTHZ0Q2lvSUIxRWtmM21qbXhCNm1hL3Rs?=
 =?utf-8?Q?r60oR0ExIP4lbsAdDCGlpUYph?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5305885-d8a7-4426-e55d-08dbea4d5582
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 04:50:07.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0Yz8+84qLHD2aJ+WIw214/uLecXODw3+lHdrI9nHEljBAj5JXgpn9bMG8ygOICTenIAW64tSkfRfXLYlt7o9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/4] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja

On 11/16/2023 8:00 PM, Sujaritha Sundaresan wrote:
> Creating a new freq directory to move frequency sysfs attributes.
> Additonally, renaming the frequency sysfs to align with devfreq
> requirements.
> 
> /device/tile<n>/gt<n>/freq
> 			|- act_freq
> 			|- cur_freq
> 			|- max_freq
> 			|- min_freq
> 			|- rp0_freq
> 			|- rpn_freq
> 			|- rpe_freq
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++++----------------
>   1 file changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f4ac76d6b2dd..5d64cd041db2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -57,15 +57,15 @@
>    * Xe's GuC PC provides a sysfs API for frequency management:
>    *
>    * device/gt#/freq_* *read-only* files:
> - * - freq_act: The actual resolved frequency decided by PCODE.
> - * - freq_cur: The current one requested by GuC PC to the Hardware.
> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the Hardware.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>    *
>    * device/gt#/freq_* *read-write* files:
> - * - freq_min: GuC PC min request.
> - * - freq_max: GuC PC max request.
> + * - min_freq: GuC PC min request.
> + * - max_freq: GuC PC max request.
>    *             If max <= min, then freq_min becomes a fixed frequency request.
>    *
>    * Render-C States:
> @@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
> -static ssize_t freq_act_show(struct device *dev,
> +static ssize_t act_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -410,9 +410,9 @@ static ssize_t freq_act_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_act);
> +static DEVICE_ATTR_RO(act_freq);
>   
> -static ssize_t freq_cur_show(struct device *dev,
> +static ssize_t cur_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -439,18 +439,18 @@ static ssize_t freq_cur_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_cur);
> +static DEVICE_ATTR_RO(cur_freq);
>   
> -static ssize_t freq_rp0_show(struct device *dev,
> +static ssize_t rp0_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rp0);
> +static DEVICE_ATTR_RO(rp0_freq);
>   
> -static ssize_t freq_rpe_show(struct device *dev,
> +static ssize_t rpe_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -462,18 +462,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>   	xe_device_mem_access_put(xe);
>   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpe);
> +static DEVICE_ATTR_RO(rpe_freq);
>   
> -static ssize_t freq_rpn_show(struct device *dev,
> +static ssize_t rpn_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpn);
> +static DEVICE_ATTR_RO(rpn_freq);
>   
> -static ssize_t freq_min_show(struct device *dev,
> +static ssize_t min_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -510,7 +510,7 @@ static ssize_t freq_min_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -540,9 +540,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_min);
> +static DEVICE_ATTR_RW(min_freq);
>   
> -static ssize_t freq_max_show(struct device *dev,
> +static ssize_t max_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -568,7 +568,7 @@ static ssize_t freq_max_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -598,7 +598,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_max);
> +static DEVICE_ATTR_RW(max_freq);
>   
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
> @@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>   }
>   
>   static const struct attribute *pc_attrs[] = {
> -	&dev_attr_freq_act.attr,
> -	&dev_attr_freq_cur.attr,
> -	&dev_attr_freq_rp0.attr,
> -	&dev_attr_freq_rpe.attr,
> -	&dev_attr_freq_rpn.attr,
> -	&dev_attr_freq_min.attr,
> -	&dev_attr_freq_max.attr,
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
>   	NULL
>   };
>   
> @@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_bo *bo;
> +	struct kobject *kobj;
>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>   	int err;
>   
> @@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   
>   	pc->bo = bo;
>   
> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
> +	kobj = kobject_create_and_add("freq", gt->sysfs);
Handle error here
> +
> +	err = sysfs_create_files(kobj, pc_attrs); >   	if (err)
add kobject put if creating files returns error

also clean up on finish

Thanks
Riana
>   		return err;
>   
