Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B8C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C34A10E22A;
	Mon, 27 Nov 2023 10:48:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41310E22A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701082097; x=1732618097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cEmhTEODE0XVGxuhH03T78i8N+gd2COnBl3KKOK90+A=;
 b=JWoi+yKv66WXCyXiDbDdEWnUk+w1KLvTu2uCq63+cooQMZ/K5NoWWtbf
 eLuQw8az7WJWw7/E6XXbjbxXgWVNw5At6UYU5v5aHme7WcpnhDeaT2RqG
 +1ytNKdW/Hcpm18PazF7U0EYArmeJHBd5LchxHNFrxJXpMOQhzvw7Y2hW
 PEnctU1Cx9mgibe06b3UZ/AcoN7VGXx5qPStUKv8sWvFJ4EvwuzOy34ON
 IOy+392z6xtUDQS6xy8idfR83ZQwPO07+EOh6zasj8WA2ECs9ca17QJPS
 HL0oIw5W/wBfkcJGiUMwzHda+hjL1ZImu8m2bE1UAQ6EWH4CO7/EVLqlV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5867590"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5867590"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099733725"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="1099733725"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:48:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:48:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:48:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:48:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxozk84soovr1xzAXoqo7Wa8TIL3fpz64YLENzQjfloQhFaep6WK9jCcwB3nBljxH9OFfZsUFZI1N2PPjbTwBDejTyZmH+bycBvacY0U5cTxFFhBZuOCxB0LxZr5yAj4G6Q2k4CWxRRKxeAbOK9ZuY0AdfwNIIBPNPzhMrFr4bUgzBFqe4ZeiyuFIhflHNC09TUQdiY6Dtjb87FiatmdBU0d5ni4+3qyqEBvqqGBr8nAHS1qnGVkR7A5XT4h7E7H41ufSVXGsTAYBE8/x0EBciqKPLTi6qsZ+RTFKS+CfCfoJuogIMWJL3+XxQQ9KXnPreWUxdEpiEUvhwuX4V+mEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viLJZw04tvrWN2PYLBjCiq9Z01BR09yqC8l9X1+ZK8o=;
 b=Z5auanVF4ugwxftoxfcqZSgito7e4adVzlZS54DpS9X/6z29vupRz7XBLQZjvXF9DnTWrblXGKxGotZQ6kBGH4I6YxcYn6ZvWeuhc8SN2nDiegAk7P3l288cAkShszpxGAFugI+OOm4aVbc7P9h+X8GaNivLqC3BMCPhZ1vvCS7ceqm7mw7kkFSJZQZ2oTDoFiRvVHuusnZjMwFj8+qn2OLKobbyV67hCELnyIT/4eJ4ZaTaD/azffXepHHpJUqFs2CtGsmlozUDjjN7iuVq25761nuWFc88Ev+kgd7oZ9GHQnJb7l8dyABAaA0iKqleyXknC3eZOyq7ibuB6LYLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8347.namprd11.prod.outlook.com (2603:10b6:a03:544::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 10:48:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:48:13 +0000
Message-ID: <196f822e-415b-4333-b4d3-e2245bd2bedc@intel.com>
Date: Mon, 27 Nov 2023 16:18:05 +0530
User-Agent: Mozilla Thunderbird
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-2-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231124122755.91279-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cd9c04-a250-409e-57d5-08dbef365a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Q7C18bwd+oNUSgZns4GHEJEOSqXaTSRU/mbTH/Qk67pJSvDWvYsRYDuQug7XNaaoaiq5BaTyj6w5gKccw1GFJA3C+ksuB06hWRJtyYqImDlw1b+De27WkUT6LLvLmKRQrGzBVWm03ThibZ5B8H2uBuXnoBruQ1CjBgBhZbzxbLMWwOcnAspez8UEtBmSC3TfT4VgVFAxZv1FX+iHQmFESfO0wOJDXQq7jGxAV3AP4p6xypp+eN2uOBiYresCANuWxGWi4/lCXRp73lJ98SCbGqbbqN9rzRpTCjk7t6oBdz8PatG4ufEv9S/PfJKEkgyVz1nkH4Ngvzu/xm2GHxMr8cp4rxLjoBOnthTWXUnVT21tJ4VeCMCYXhOL80HItJ/MT3waVpL+38bTuV6OwgK9hp3lVKGL8xkd5ZTVkZsotKPtFkyRDXq+XuCCHNBfmcJTNqS9j5AsGy8QuyisLewti9MbRyV+OJGpeV7XrTt2VRW4f3TLcwdJk5qWhJ7+kc6/gWz43qM6l5bi6yyN1+yyIaIUWtTsgvJL7JK3wGu5aopNk5/JNdtmHu+U1Ogx/O8OdXVOQ616txOpmCvdIa7pZPOe8c56AINsRk0vM++Nz8OpXko8snbYA8I3Ajhh7A9TIWEEa0/jDuyYF3G9x/eSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(107886003)(26005)(6666004)(6506007)(6512007)(53546011)(82960400001)(8676002)(8936002)(4326008)(6486002)(5660300002)(31696002)(44832011)(86362001)(478600001)(316002)(66946007)(66556008)(66476007)(38100700002)(83380400001)(31686004)(41300700001)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTdPQXpxcmllemtaRTJqdnZQUTlsZGkyVjMzenFvZGtXcE5ZbjVqRHdyemVG?=
 =?utf-8?B?VmlvS2lQd1BKSU9WditwWG4vL0I3WXFvODVYVUJaWHk2amZmT2c0MzFWemYw?=
 =?utf-8?B?ZmhmMHQvZHhKakpIK1dONG1jV0dWL29LRk4yYlc4M3BrdFdmcEYzSjQxMEhD?=
 =?utf-8?B?RVAxbFp1SWkvSnFRcGFCZFR1T1ZRLzI5VzQ3SGc0V0xmQXV0Ym1FZnZSK3Va?=
 =?utf-8?B?NStoRUdLME1jc1Vsa1hLdksxclBFMUt5OGJ0aDF6Mk5Sa25jeGU0YXU0OVRo?=
 =?utf-8?B?ZWRmcXVBOGV3M0lCcWJKSHEzMXFVVmlBMkZDQmE5UWswVjd5REVWOS9XcSts?=
 =?utf-8?B?QnZpejYzK3dRVUlyZDZranR5S0pLL1lkU0k2RDBRWkZQNTJNWVhJNVZwakln?=
 =?utf-8?B?ckh0OWdMNVUxSS8vS2p6emgyaGd3bG82eWdQbGc2MFhacmJpbVh2bXlhZFVl?=
 =?utf-8?B?Z2hPTWFRbHVTOXY5bG1Uc3dBeEF6b0hJSzlzZ0tHbFVyNGhCMU1LallpVFNv?=
 =?utf-8?B?S2hMaC9vVnl5c1ZJQXJYNk9LN0tXalRtWXlHY3g3Z2NRNEUxUWpjYm4vWkpn?=
 =?utf-8?B?ZVA0TENHMGI0aHFlQVVmOXNiVW0ra2diNUpuOVRFSGoveDhsWWFEQXR6a0pn?=
 =?utf-8?B?WUljZk9BOTcxN3k3TnlGM1pWNXd5YTAyYnVqUlJNWHJTaWVNQ1dkSFNEc3Na?=
 =?utf-8?B?SzQwWTh1dHkwd1JyTkZrc1Y4aTdmYytuaDM5aTlKSGhEdUlhRnJwUUNmeS8x?=
 =?utf-8?B?anE5d1JuVHVtSlVKV3NCckN2cXNINjJ6L2xOSWZPWXpiR2JGdnVRVWNrODNY?=
 =?utf-8?B?Wk1zNTFMdU5MdzI5L0FZbld4VXVJQUNqbjEzeEYzSnUvdE9vK0JtMFJ5cVFU?=
 =?utf-8?B?QUxRdHcvK01TUjNGQjlIN0VNajUycEwwOEtBMkF0VVJ2b0ZxTUh0RDRqYUVR?=
 =?utf-8?B?eUNSZzg4MnhULzBVU1RSSU9kc3NRZFpZTlpWcXlnS1B5U0FnQmpsN0hWNGdG?=
 =?utf-8?B?VWVYc2k5eG5NY1FnbkNqaGJmZ1Z4UG5lM0tSeDdBN1UrVSt3aXVJOUkwRU5L?=
 =?utf-8?B?ZVJaeHd1NXNXL0ZWSUp4TEt3R0JKdXQyeUtSSHc1Rjk5SStzZWJGb2hENFNH?=
 =?utf-8?B?Wld5OHI3Q09ZZjlWSURFUVdMd2lyV3diZVhJQmFkcXdYSFhXVTRqMTIzQWZi?=
 =?utf-8?B?UkZUakI0bU85bDhxSWRuV3owRHRGY2FrMDl2TElqS1ViSjd0RjZnMXJoM3ZT?=
 =?utf-8?B?WHR4YmZsSFBjTWJ1b3FiQXpQMjZvYmZuSWlMQzJVazBONElucmRVVDR6VDJ6?=
 =?utf-8?B?V0FkWHAyTmlyd1I5MHg1dlBYbmhUdjhScG9VbEY2UEwrR05KNC9iTTB5cWpE?=
 =?utf-8?B?MWNQWjI1UUNVSkdCU1FqRFBQeHVKMDVVbFlGYmtvOUVycFNuWXN6ZXB3eXBZ?=
 =?utf-8?B?bUIwL2Z2VzVSMk4xZEZzNHQ0NTViQlRJR3drYkkwYldNWERrenJHRElady9J?=
 =?utf-8?B?ZFlwYlNTYWN4L3p1MmpzVURqN2VMMnFsekpyM3pEdmFHMHE4c3NkcXZkTmJS?=
 =?utf-8?B?cEFBQ1F1VlVKVVlHMmVrQ0VwdFJIZ0UyVVhpd29HTFd2ajVBSUNsYXpFV1Fq?=
 =?utf-8?B?c0llelJOb1FoQWZDTmdHUEh3SGtUYTM5S1Z0T1l6b0UrNUpWQm9PNlA0bmpM?=
 =?utf-8?B?MGRINTVTeUY2dTB5blVpODdaN2ZLTDFMbmVmbmE1b01jOWhvVEhXR055TEFq?=
 =?utf-8?B?Z2pJYWpWQUFHR1N6UnJsYzVMenZreE9CTHErZEluZzBNWU5BL2I5VlZzbUdM?=
 =?utf-8?B?NFk2VGhiVnE3MFZ3dHEzeWVRMTZheERLeFV6Ums3eEFCL3ZGSllmcVlZeHZN?=
 =?utf-8?B?RENkNVBONkNjVlJubjZSQ1dSR05qeVRjbVpVQXBZVy92N1MrTUc4cGRDZ0FL?=
 =?utf-8?B?UHAzMHl6cmVqQkhzQVY1bXpKM1pYTjdYNnBtWG9Zd05mMjJJQXlIcHBEa2VF?=
 =?utf-8?B?YkpmdFpsT0VGWmxacXM4VG4xNmdaUXRtUDh0UFZsUFlOQzlMUWF5OHBPUlNz?=
 =?utf-8?B?MzVSWkhISC9LK3RwOVI0Zjdxd1p2U1BZbGxJYzg5M2tZdVhTZUcyYXRrK1dm?=
 =?utf-8?Q?gRNxf9q2m1bGDOmWIZ8fbMoZN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cd9c04-a250-409e-57d5-08dbef365a37
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:48:12.7222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcXLRmhjHzhKTZTi6577kfY9noMWm20Nv8q7wEGOdVMrSW/8nLelkliOWMUMV/2gecmj9LrPHsrRbDac1wKaRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add a new memory direcory under
 tile
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

Hi Suja

Typo in subject
%s/direcory/directory

Thanks
Riana

On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
> Add a new memory directory under /device/tile<n> and move
> physical_vram_size attribute to the new directory.
> 
> New hierarchy:
> 
> /device/tile<n>/memory/physical_vram_size_bytes
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..f354c8b2bfc6 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -24,7 +24,8 @@ static ssize_t
>   physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
>   			      char *buf)
>   {
> -	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>   
>   	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
>   }
> @@ -46,6 +47,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct device *dev = xe->drm.dev;
>   	struct kobj_tile *kt;
> +	struct kobject *kobj;
>   	int err;
>   
>   	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> @@ -64,8 +66,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   
>   	tile->sysfs = &kt->base;
>   
> +	kobj = kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
>   	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> +	    sysfs_create_file(kobj, physical_memsize_attr)) >   		drm_warn(&xe->drm,
>   			 "Sysfs creation to read addr_range per tile failed\n");
>   
