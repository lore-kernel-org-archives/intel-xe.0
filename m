Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9719E92FDF
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 04:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7687F10E1D3;
	Fri,  6 Oct 2023 04:37:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB32D10E1D3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 04:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696567036; x=1728103036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bqSYpehqrUivFdAXdBdu0zIBRmHdb8EHLOQ+i0mi6eY=;
 b=b8sPLeerHbN84CYUGuL+aWc4XjkH3J/72rsZGHeFNsw0sejb7gOInZ7K
 ER5DA2DTWXlZfxafdAawHvCUmn4E4RWPTraiKi5eD6XvktCrN1/NZNY2/
 wxR+VjDEPb/VE6xIYhm4kkIhVaxqTQjBaFVBEJAULmIgXe7lSKr/tJfhp
 eXJatoL0YvrnPup5b61BzochonPGdWTue8rJUgFCoyAVG6dZ2gQR7Tigu
 fuSti5AV9AX0KhfHuZSSfTcFfX8sELmCYvztg2LUiKBTlDCFK7oDfYGXG
 umUkG3vAa0ElqXEWv33nzRjDUMTE6K3CAVx3xBiQIvEG6yqPBzUHP/sVW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387555637"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="387555637"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 21:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745726161"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745726161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 21:35:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 21:35:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 21:35:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 21:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7T00TZQp9/81K1U7gXCznScsDbZX5XiROS8oSJbvl7+Lf9bwvJAe+ifQdzfuH11FbAUeVixV7k7zLNajcQsxW1XB6CFnUDDwiobuhMVdfDQQusUxbOvXfGVySpgXEmBuBKeyVIB2AtJX9Kbdy6ao2Z1XNt3Ro6OO91hOyKLB2tfIm6QN07tYUy90qmAo7vaNyOk1nVUK5hs0PF5K3N5GLZbaFu5/ysaPrhdZu0AiuI/fEFwg8udKaFYE5UCSeKnpbXI+wxv+9I/vQe3ENm1+Ehrq42vJ+idp9Uy+rLjdvHobb7req63Ep+JATkec322T0wcyzD1SfPlTzPuqlVlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHfgDQ8hdV3pKwwp3gaiblH2oqneB8QpLiIfQaG4OeM=;
 b=k3huGw4HLSGaVqmXgurPCoSUB6SOjEbuds6pXXylEtFLmhOmoDEJBGDmqRmCutTe06jFlqRrqfsLLp+cjb/MCGyTUuH5IJHOzrIDTit5Fy3OtcDm1pRjkP3JF5JPOfXt0OPqVYtla0JYGkc2Cb+ussdIK740pNXo+I2IdqVTSWpVxZRlC4j6BwRH/bo+J0Ln15r7xhYV4S9YmPHTOaQdVu2lRv/w3JZb58bD1YiyOGYVpgqhl9aVq4KGSJXXEHru6ODDUCpg2GKjMVss4CRmhct1hfgb538fdAQYy87g08YGtyn0UuEExa7Qe220mNaSafFCFY/DU97ctbD9f91ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 04:35:46 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 04:35:46 +0000
Message-ID: <bf882215-a962-4de4-8c25-7d6bbb221a04@intel.com>
Date: Fri, 6 Oct 2023 10:05:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231005163854.483488-2-matthew.auld@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20231005163854.483488-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 446a6648-b620-4f40-2086-08dbc625b476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsClbDZqik2tjbDhlAOltY7rLfAJPNeHpEtWoVBI2z1caFla0a7s/yLPuGp/uvPTev8l1u60Y2b8PCadD6912iWJfaT+WPpUFZbZrhUCARlbvRIMBCo3+sdgn85QQMvdgVkjHRIoVbvqGPwOksyF2KSM9OpDinOG0ViHIc5XE1LqsYWRKLprezsrLrA6TnX63jvhsPVREPMAioKZ0WDn1e2toUAvhxmjQZWIWJLYEozBvs2/VOOBigu4V2KnQj5p/L/3kVDAwwMH/6l4VK1uaxOrOjOGi3NrMx3PsW0dlusNWtiTrWRgB/lfjShErNW33KMqwVYDHlLC5t0W/xqjkY3FX0hIZZUgVwkW6RP5QNCBmWl0BTCtrhcvOGXEHbKSO4lhexfyPaE1HzhwMpEMlsl6BNz3YFxwxt8n7w1lppxURB2zZ5aWSg6Qpixe+zqLpSIavvjkYhwjBQz0o5w4Bmr5Rd6gyuc4U61NeefwFZQdNi6rMxefZYs9LE5eHyUooudCXaRCUaOiclQ5AawFz8S/W6sC3UyHg87GQ7HM7bTBkTKWIScRlO6OLvO5G34FeuXY3tPNoedd4JEg5e7N2Q9p4TLYHM7Y7Q8vvIcEhQl+YEtPNtzs11n4Xz32rum2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(31686004)(6506007)(53546011)(6666004)(6512007)(478600001)(6486002)(966005)(38100700002)(31696002)(86362001)(82960400001)(2906002)(107886003)(26005)(2616005)(316002)(36756003)(66476007)(66946007)(66556008)(5660300002)(41300700001)(4326008)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJaWDlDbmx3aTNhMUZTT1hYZ2hqUFJpcEZrR2FsVlRNSFNPUVhreklzS050?=
 =?utf-8?B?bkppY2c3cVNZTzFDMk9pa1VLNnMzYVk0c0lYQ21FeGFaRGhldStVWWZ5N1ZL?=
 =?utf-8?B?MUVMVW5YSUFnc0F3dllmbnFOVG5xcEE3cU8rYTN0L3M0TFZmQjZ4YWJZSlBq?=
 =?utf-8?B?Uis1Z1Z3ckFLN3JJYW44cjhzS3NzWXNBYjRLT1EwQTVPcEZ5WmYzNkl4RzV5?=
 =?utf-8?B?UjlvM2hHRUZZSVE0ekNpcWZRc3dVdzRUakhCZXFPOU95cnRGT2tXeFJuR01P?=
 =?utf-8?B?RjI3Y3NsaDJrQjkwQ3JVVkpzQzlxOHRMMzJQL2JmcmtsSS9teXR3dHA3T1Yy?=
 =?utf-8?B?djZubGxtd0Z0ZHoxSzBCcHppTzByL2hwYlVlUFBadGRGSUpGc2trU0tkUDVH?=
 =?utf-8?B?TTFHTXdtVVBkcXNkN0x6SS9FdU9UKzRkN3lzcnd1NWYrcnJmWTQvSlQ1bmNI?=
 =?utf-8?B?ZDBTT21IcTV1SmtHdk1acXVzeHRtWmZWc05GRk5NTEtwaFBZR2cvOUJHcGhQ?=
 =?utf-8?B?S1h6amZzak53bHMzNG1HK0pwNGhYZFZPY1MyZ0RleDZldHBRN1RvUW5LVFNq?=
 =?utf-8?B?cnhIVDdBS3YzV0l0ZjNZelJ6YzJKVG9YMkdPckE0YmwraVd4NzhYRDI2Q2dT?=
 =?utf-8?B?UkNYZjdWQmlSRHliOXRmV1pxZXB3WTB2V2g5WkdBaytmcXZBR3M3QWJ4dGtK?=
 =?utf-8?B?bytnbzhMcnQyZFFFZnRXdEJ6T1VzSHZRVERWQWNhZmQ0S25WcGZLSDZTbEdl?=
 =?utf-8?B?RnVlbmN6UzFoRDY4RzRTSUdYUGtjeHRQWGdzUWVEMFRWcXZ0Vm1Mc3pvN2gy?=
 =?utf-8?B?eXJma1pRY29DSUNJdXdacEM4OVJoRm13Uk12WitVYTZRNWU5d1JLdk1MK3ox?=
 =?utf-8?B?WVNtVDNna3p5dUZtdEpqYzRiNnpvZDFJZkhKSTdPbSttK3NvYjFMRWpOa25r?=
 =?utf-8?B?S3ZEZ1FUMDdxZGFzWEsrblJieFUvL0NFajMrWG1Jd05kWjVBR2krMlp0YlFX?=
 =?utf-8?B?ZWRZN3g0VmVwL2oybjlVd0xLSmtDeVhacDhqMEd5VFY2NGRhTXlYVTVmTkZr?=
 =?utf-8?B?QXhhTVFJZTRRSUJiVVhJdnRMYnRRaFhNVEhJeEFZbXMwclpVaEZXTC9Ld2ds?=
 =?utf-8?B?a1hMUU01V0N3NmFYQnN5amNTVkpJY1NrYkhTeldPWFp6NWVTSTRtNFUvVDdZ?=
 =?utf-8?B?azN0YkhiTVlLejUrVzNDKzA1TzE5Sm45TUFRK0tyQkxub0k1UFFycGZoN21p?=
 =?utf-8?B?UmVVOWViMkhYc05zMVYwZGlKQnlMbnNtUXdhUG9NQkJob3FSNUpxUnNLZldu?=
 =?utf-8?B?NXRVM202aTdGUnBlZEhSVmhuV2IrVzhRR3dBbjk0UENYMm1HbkdhZm9WNzU2?=
 =?utf-8?B?QWozR29XZFFkaU5DMlpFYzBuL09TeXhjMEt4OTRNZ0RRUStOb21FVmFwbEZR?=
 =?utf-8?B?NGh1MkVBYmV2YXZiaTl5MkNSbW1FanBBVnRMWHl2VFNjQUdEeXo4bVNUWllR?=
 =?utf-8?B?cG5vWDByc2pyVnEvck9mcGg1RnZFaS92UDBxS1NzcVUzUVZFU2lMbnF1OFVK?=
 =?utf-8?B?SisyRWtGT1lWUzhIVVBpOCsxOFFRMndhaHJ6akxaV3VpQ0FMN1pzdlloQm8w?=
 =?utf-8?B?NnRLeUVoYzI5NWwyNmNlKzlkZ3RneVNXaWhVVklITVpwY1AwanhFWlpybWlm?=
 =?utf-8?B?KzFFeEtJN1JyQnArTUFpNndFRllmY1BySmY2ZmhjTEVpVGdkVG4xaTFSdXdo?=
 =?utf-8?B?eGJ6RnV6dlpTSUtDZkJRa01ycnNHbjZ2ckpzUzBnQm5sQjBnd3M3VnM4clFu?=
 =?utf-8?B?RlhkZFJUR01UYnlJMWtVajduSVU3aGN1V0F4UllZTUVOOU9lVWNCbWttSndL?=
 =?utf-8?B?ZktQSzNZMldVZS80bk1Xb0tBSk94enZFNFhRQjhoQ0k3RGhlVk42VWV5SllT?=
 =?utf-8?B?YksvUmtjTDhQSUlINkNnK3ZBZlE0NUlBU1FXSXZpTmQ5VW80aXp3d1MzVFdw?=
 =?utf-8?B?Y1dnc0J6ZktBRkRkeldYS3c1R0dhRks1bWpDdWVFNFNUQ00yQ0xueWtGNzJY?=
 =?utf-8?B?Nzk0R0Z0bkNwb25LZnpYR2FpTzRCa1JXUHBaeE9aUTA2b0JnYk0xYVU1WldN?=
 =?utf-8?B?aXJrUC9PL1VhdG9HdEdPTkRTKytjbmF5QUh4UUQ3czJwK0VxS0tkR0J0dlo5?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446a6648-b620-4f40-2086-08dbc625b476
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 04:35:45.5663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmXx8TuK0HBxDIAs+xVcCZJ9ZRPdNuVWBac5ZkXorXXA3t+c983jzYlhPgfMl8PD3LaP7UIsM7bZfHXD9mo3Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/hwmon: fix uaf on unload
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 05-10-2023 22:08, Matthew Auld wrote:
> It doesn't look like you can mix and match devm_ and drmmm_ for a
> managed resource. For drmmm the resources are all tracked in drm with
> its own list, and there is only one devm_ resource for the entire list.
> If the driver itself also adds some of its own devm resources, then
> those will be released first. In the case of hwmon the devm_kzalloc will
> be freed before the drmmm_ action to destroy the mutex allocated within,
> leading to uaf.
> 
> Since hwmon itself wants to use devm, rather use that for the mutex
> destroy.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/766
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1deb5007e1e2..9d3e06b96073 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -584,6 +584,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   		xe_hwmon_energy_get(hwmon, &energy);
>   }
>   
> +static void xe_hwmon_mutex_destroy(void *arg)
> +{
> +	struct xe_hwmon *hwmon = arg;
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +}
> +
>   void xe_hwmon_register(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -599,7 +606,9 @@ void xe_hwmon_register(struct xe_device *xe)
>   
>   	xe->hwmon = hwmon;
>   
> -	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
> +	mutex_init(&hwmon->hwmon_lock);
> +	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
> +		return;
>   
>   	/* primary GT to access device level properties */
>   	hwmon->gt = xe->tiles[0].primary_gt;
