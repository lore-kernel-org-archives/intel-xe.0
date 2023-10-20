Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C9CC001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 18:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1D10E5DC;
	Fri, 20 Oct 2023 18:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B010E5DC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697827622; x=1729363622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y9FRpRqG6MIZacT7ZVUocr1lapP11duuyZvZnSRll30=;
 b=HMyL8zjSnF0zhutZD3EMXu8xqX2zd1LkC1v2aX+AxzpDesrA4yfYBh2N
 jsn65fM9aK3lsoxxdoCxATHM3iV/qSHngY43G5APaK0HbNP+evLZJT3Ei
 3gQsz/ofeUykN0nITO5G0X+z7PYBI2J9kcCfiJNISxdVBfvNHKReXxK4R
 XUWmD6hgekJZvwNGeZS9cyUG0z1IKBcngPoP8gJVWjz4ARXDQDi2TxZDN
 oeMxRGc7nnzHkeP3BHGgeNg39fzbaoNmb9QVREoWhoubmcA9akOAWN/xp
 dWVxqnGmgLl+JpmvKTXT2+h/BFd9N98hbaLN+j/UCfT9TN8rKPTw7rKgS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371623464"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="371623464"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 11:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088821138"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="1088821138"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 11:47:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 11:47:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 11:47:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 11:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJM9ws/ROUd0/DEM8+xSwG/QaixcOiOsnTcmaxfFs6u6pxsWAeMGzHPs28r0toHtM2ouWRuZR0cfnXVZcycJtQ48RmLDiggXZP1QU8CNiuPEwQ2hsWJE+ILvTrmZZvvI2WHjDW5398y4/5UWTFfwBP5BSii/3tg2l235J9mIJPNR+v+/x7czTnn+IRihysueEe+Jbwe+sq4neZC6QDe3uPhc0g8R+FH5OJqvbZ0cezBxdaf8Xt+lDd/ceduciS4DAigali7OYPVqWZ2Noubg21BMBt986ILa1h0jitm/C/7L4dyumoHZzsjEjtQV1pUtgeJ+8PJadKhPQj7Q4mqirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26leactpD7XMNR0K8TSOyG4qp8r023FeGKPkJuREpGU=;
 b=Z+AxsGlXqCOzMgdGYqgbHfdt6MVWYuexKK2iLncHuzgGUH7llTVNHXqL90osy5S5YIeeQ4xvkc4kXSwB5GAzAvIEAnCinhufcvyPLyRMcNPMHDLI2cbLOCnGaICBvmHPoqmPrrmm3FMqU3tQ3grU99e3IiG12t2OG/qsMvFc07weuU4isX6C9BlMmp4t3hLaHKZuU29ILa2p2LZW26e8zvyPN2/G+NB0q5c9ezUwOlEl0+v5hojfAi3PIQUfP2K446OtXIHAZAQ6ssHQ+VHwJc0aj5SGJceQHDZ4xYiZkUrybByeEdxZzHtmmW/XiAb2yEhoMbp4RLV6qX67AQcEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA1PR11MB8543.namprd11.prod.outlook.com (2603:10b6:806:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 18:46:59 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 18:46:59 +0000
Message-ID: <5361d832-4cd4-46aa-a7db-d79fefb484cd@intel.com>
Date: Fri, 20 Oct 2023 11:46:57 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
 <20231020045533.1425375-7-himal.prasad.ghimiray@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231020045533.1425375-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b35c79-5ef2-4e22-fdfa-08dbd19cf104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3KM2NwP5svqUJDrn3+IHNaQwUjkT9bjzhnc7lC5obzjYCe0aHjaXOLZaG/yFqvPK6ZBvVTP9kru0WLeNRo5ggePoJV6K14QNiEmwwYsrj4MGfgLrd0p7rmsoT6ALrSHNFrABQcYNwdmS1AvRhlrZEM05ISb5s1Bz2YrxM1jVWdTTWniTZGCkzC+PEo5gAFrptUBQuDfYvf1bkmfwKGPINnvkCFAh5pWx9BpbcIYXfAZsD2fdgMOMQ5t3NFW0m/xP88WeMmOSjjuBlWVgATOLsLd/T/PV2pCbuhFlfEEtTkQgZUohGkrm629VqMDD4b7wF7YTiK4zAVZDSJSJw5mMtInGPVVs/dxbWIbi2cfHxLxyVXRBD+gj3X6lubIelmS03LGUh4y5mBm0i7En/5DiQsoPnht62827HK+LjS8L+kSf6BesOLgMXyVT8EvZlpjZ6XDcvi8Ag0CDi9impjNs8E2BYu8758av4tlIsqu1OpvCDoqqjbUPVK4HAZci/+oBmkQNUZKHZ4YD9tBrYVd7ssqVMs/cTvRZshwqur6LmySTO4DbtWEhy1b3XV2kLIlivZFBKxacdFKI7GNpcxqYU+qGrgyDeKLPOtk9J2QxYGVK8rzHcyewNN68wjXsu13LK7ivBOpKq6DqT/aOMtU5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(6506007)(66476007)(66946007)(66556008)(478600001)(41300700001)(6486002)(6512007)(8936002)(86362001)(316002)(31696002)(5660300002)(36756003)(2906002)(82960400001)(2616005)(83380400001)(4326008)(26005)(53546011)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2o2cGJwWGxBalVQaVd5RnBCMWJVc2ZERnZIUy9VbkMyZmZISmNpZlo2V3hE?=
 =?utf-8?B?R3lYamhrRm03QlpTVG45aFVONmZuNVpoWHpDZlI3NVlicnA2RkxLY2U4SDlZ?=
 =?utf-8?B?NXlFV0kzUjdLRm1ubjA2b2FRelpzT1JDN28zeFhBRWhKOXJBY2FoMlpTT0ZP?=
 =?utf-8?B?QmQ5NlRPSXNCazF1RVFsUGlLcS9oelYvSThvRXUyQ1NkSDNHT1g5NjlPYVhH?=
 =?utf-8?B?R3VhTEREdHhmK3B1MTNBdTZQNGkvbHRoajRiNlIyQTJsUTJjc0dpQU1ITlc4?=
 =?utf-8?B?OTlmYUpRUlFnRE5GWlo0bWFTUGJvRVRYdnVGQWVxeGtGaFVVdkN1cjFwNCtu?=
 =?utf-8?B?TTNnRGJyQlFPOENMWGRONHAzYm4yVWpKZ0xGdzlGNkdsSFptV2graHZhZTUx?=
 =?utf-8?B?YTM1QW5GQnA3WGlYTm9WNklqZ0lIVGJ0RzA5Z3laQnBCaCtRbWYwTWY3S2JH?=
 =?utf-8?B?UUNwaGNVeUErU0F0WE1SendhZ3VCcC90RmcvSUJMZG5vSDNHN2d4VlQxbG15?=
 =?utf-8?B?aXpOajlrTG03SyttU1VRRHNNV1hBeXdwY1V5Q3h6dnl4UFQzU0I1aDF5UUFZ?=
 =?utf-8?B?bjJkU0tneGpFYzNieU0zcnBtZzJIUFhHWnVudDFTU1k0b25iQUdmQWx1Qjc5?=
 =?utf-8?B?a1dDSkwxZ1hPRGxWQy9MK3EwcHoyRlZOb1l4OUoxZVV5MjYyYlNMNDhsR1Fm?=
 =?utf-8?B?dERLQU9oU3IyOFVtS2c2cHoyYmlCeFg0Q0lERmlHenloSU5SVWpxODNtL0dQ?=
 =?utf-8?B?ODBXYTMwWVdzcUZnNXVyc1llWUdYMm8rOERNQXpocHRXRUpCS1ZrdVpOaWQ4?=
 =?utf-8?B?R2F2dkE0bHdxRlRnY3BZbVIvZDNLd3RMRHFsdkRjV2FpL09qa3hUd0tRQ0tr?=
 =?utf-8?B?ZG00K0hqY3k4cXlmbHZlQTZxVk45d3gxQW9MWmlJRFBGSWZyalBZazFHU3c3?=
 =?utf-8?B?YzFEZmhzaEF4bGprYk9vdXR0ZTdFRkx0WkFSZ2JEcHdIblUxK1pMWGRBR0Vk?=
 =?utf-8?B?MjNaR2EzcVJnUWJ4dUY0TXg1LzQvYkdFeFAvWlhjV3JnUFRzS3JIb2FoaUlj?=
 =?utf-8?B?ck9oWndpem0vcWl2MlVuRjNSb2ZXQkJTK2JuT3NiREp4OHcyNGQvbkNxOXMz?=
 =?utf-8?B?MTVEcnNEN2Q2aHRlb1ljNDRYMnF3ME9kQnNDZ0VJMjVuUHVjVmhqWFhmYm9E?=
 =?utf-8?B?WkVYOHZxVEZ6dkx0eStOSmppR2ZOOEsrZTdDVjRhL1VpOUZXNkFxdmRNcUZH?=
 =?utf-8?B?V0JWUlBtKzZGd1dOOW43dE83REsrbFNXSk9yU2JidWdnK0dDZ015ZDE1Z05x?=
 =?utf-8?B?dDNGSmxjY0FnMnJ6NTJiWTBWQ2Nza3Z2TlV0MXJYVjJ6NkpYRmFpOGpoOGNo?=
 =?utf-8?B?ZmxZWVJ0WjljaFZ2d1JkN1BMbTIxdmhUZ2owc3NqRXdvMzUxM1Fsenh5R3gx?=
 =?utf-8?B?Mnh5TXlDMjE1TmRPWmRDWDBvT1BKZ3BHaXU5Snk3UFg0elEzYk13OEs3UWlW?=
 =?utf-8?B?ZGJ4dERKa29JaThXcU1MbSsrV1krOHhQMi8vWDlkbGtCVXYvZTQxaVZ6bC9D?=
 =?utf-8?B?MFppaHlYY21sdlhwRWY3VGJTdW5NMVZFeGhCSVdQc3lwRjZvaHJEREwxbmxw?=
 =?utf-8?B?cGRmWlIwNUplZjJqTzRwVW5jaEV6cW5aK1dhN09WRHZ5SXlvNkFBTTJTNHNQ?=
 =?utf-8?B?OXkvNUQ1STVsb2JJNjhUcjVNNThLb1JGMDlJTG44RnZZL01VL3I3b3N0WkFC?=
 =?utf-8?B?bmEzcEprZnBqQmtJZGxTZ09KdnZuUldLTS93eUdzZXFvNDdBdldQSm1UZGRC?=
 =?utf-8?B?M0xYczMvRnpsSEk2QjFhQ2JJbUNIOGRCOFFBMU90L3BDeENLMFFnb3Y4cjZq?=
 =?utf-8?B?SzJNeXd4RmpuTzByNWoyODY4SnpqQ3BUcGpPTjRXdmU1dDNKSCtGNmhac0Vx?=
 =?utf-8?B?d21hZjUycGY1Y1JHVVQ4WUhybmREYXp3S2NRUTQwaFR4aUxscVZTUXhoUXZ3?=
 =?utf-8?B?SUV4TmUzOXZYUGQ1QWFBeDZVSVgrVU5DTGFNQXlZeDE1UDVMTWxiOWxVUVhq?=
 =?utf-8?B?ZjZnR05iL3hsa1VsVFJXeUxKOTR4V0xPUHJrQlFmU0pEMkJBVkViT0R4Z3Rt?=
 =?utf-8?Q?O9vxKyVvTcVNRT8NUkNdVXnG5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b35c79-5ef2-4e22-fdfa-08dbd19cf104
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 18:46:59.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS6gtGSE5UvXMy1PFAtSnPTWcAKUI3vOR2wTJdXKx0n1nUd3oyaECRN7UKHo+stfgDoWzqRvWydR34D1ZXtuuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 06/12] drm/xe: Rename
 XE_RESET_FAILED_UEVENT to XE_RESET_REQUIRED_UEVENT.
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



On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:
> DEVICE_STATUS=NEEDS_RESET will be used for other reasons apart from
> gt reset failure. Hence use more generic uevent name and provide reason
> for reset along with the uevent.

Looks good to me.
Reviewed-by: Brian Welty <brian.welty@intel.com>

But as I mention in other email, this looks unsafe if 2 GT resets are
happening (and fail) concurrently.  uevent will be overwritten/corrupted.
But can fix separate from this patch.

> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 13 +++++++------
>   include/uapi/drm/xe_drm.h  | 17 ++++++++++++-----
>   2 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd401..91e0a9a7f1cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -545,16 +545,17 @@ static int do_gt_restart(struct xe_gt *gt)
>   
>   static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
>   {
> -	char *reset_event[4];
> +	char *reset_event[5];
>   
> -	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
> -	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
> -	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
> -	reset_event[3] = NULL;
> +	reset_event[0] = XE_RESET_REQUIRED_UEVENT;
> +	reset_event[1] = XE_RESET_REQUIRED_UEVENT_REASON_GT;
> +	reset_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
> +	reset_event[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
> +	reset_event[4] = NULL;
>   	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
>   
> -	kfree(reset_event[1]);
>   	kfree(reset_event[2]);
> +	kfree(reset_event[3]);
>   }
>   
>   static int gt_reset(struct xe_gt *gt)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..ae1b1c7528d5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -19,12 +19,19 @@ extern "C" {
>   /**
>    * DOC: uevent generated by xe on it's pci node.
>    *
> - * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
> - * fails. The value supplied with the event is always "NEEDS_RESET".
> - * Additional information supplied is tile id and gt id of the gt unit for
> - * which reset has failed.
> + * XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
> + * The REASON is provided along with the event for which reset is required.
> + * On the basis of REASONS, additional information might be supplied.
>    */
> -#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> +#define XE_RESET_REQUIRED_UEVENT        "DEVICE_STATUS=NEEDS_RESET"
> +
> +/**
> + * XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to XE_RESET_REQUIRED_UEVENT
> + * incase of gt reset failure. The additional information supplied is tile id and
> + * gt id of the gt unit for which reset has failed.
> + */
> +#define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=GT_RESET_FAILED"
> +
>   
>   /**
>    * struct xe_user_extension - Base class for defining a chain of extensions
