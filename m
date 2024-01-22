Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7165EC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 07:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3AB10E5D5;
	Mon, 22 Jan 2024 07:08:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B3A10E5D3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705907311; x=1737443311;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ahhiAaHfGce4kSlfXY6RmtX2k9NMI6KHpBhgn5eEUlU=;
 b=cisYIKGQboANv2RT0zCJG/o0Z6R/FsqwE/9tB84H7mAYti8M0kgmJ8mp
 OUfhmGVqRFayCJQb6oQ3oePUj2loa/uGw4Ip/HUNJZpDOsIi7jA7GUKbD
 8rV3ph9cP9u/Fd0GHV1UvUssDxEP1HYnr1n7ci1USQYxYetm7oV+3C8Hk
 oYGOfKhdLSXim2llNFHsr/aIGbnqLXhBucN/0dus2kMfYwU4Uyt1x0Aju
 AHezkl0iDM8AhvTrgjooHUa6TMQrZTZ/gdyJdpGhDt4i7AXACiYJBzUf9
 Cut5buKOsxUNMmh28hWOv0bgoCD1jj4xLX99Wdan0gsYZ6Na/vnjSHo9/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400774872"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400774872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 23:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="855850375"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="855850375"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2024 23:08:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 23:08:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 23:08:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 23:08:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 23:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6B3IudE13/ZX5AlTfUGCcfI+ZSRcEW4PefglVaVl4ztMKN+Wyy/iowrnmQx3Qst8tHJJUZ2HzfV9XA53cvngArsq/XdmFE875usmlKtfoWwFSdFXzyJOFSRY2ZXqqh812wfabY4vwuJUyW+1y3uqbCxVLQDmfyMt59pOFrr6SeWHRqKifwAMR7BzVZMcwLV/zGtV1Ov+b0B/Y3s5Hv54js9IjO2WpOFR6vOHXjiXbDm8gHs2jvvZmRTUKNJ3ps/DvPljV2sm6Wql7pOTL8UlxVRWGCWerGFXLN1Q7nMADEKrtU46sLJYZfswgWfHCjlm0Umxgl7tA+JlIouc0VOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hVsZQtM5WY1r6t73lK/I91c7R8ti6gYPyBlqp8/gis=;
 b=W00VwPhTUaYbKQxl9fx7tqJTOiK0EMHzXRQwEvmAMAoFdW2joRhngLbR28JvAF3FY2fqiJvqXpRo1D41EKH1Rnw1e0Wh94QCWkbLoX9Q2HCeMonKmLQ/iGKeNOPbypFV2mHXPH70TxFYkFhlSyoZ8sBrsJ0Gn9xEH01nNPVTXFudVFi+wijFiyGUe7+GuRvgxjpK38x3fVts4zDXDDrRrKHiXfcF5aj6l5W795d/85JfYvQPkU1eCvxirMowCYKC3E2DeHah3XHuwb2Zjht7GidDXLImn62+nOe/WLEWUxdBTKnUGt82QDyvrDe2s7SSE5CEQ0SsdNXBDwp6a5EjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.31; Mon, 22 Jan 2024 07:08:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7202.033; Mon, 22 Jan 2024
 07:08:25 +0000
Message-ID: <11530813-d796-4e76-b268-2a020d7357f5@intel.com>
Date: Mon, 22 Jan 2024 12:38:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/xe: Fix typo in vram frequency sysfs documentation
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: bf87ab14-5b58-43ae-de77-08dc1b18ed61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9Az/yQueRI9oe2n/tkZY92yofp4JM88Vfrl8NX3haPE3HRI1wwAr3l+qJUMs2o+OAgVSz+xtHkfjxcN+vNSzKH4qAjVqxyYU6CFiBqQgogmyaZq0FXgLWAjAnDgMMXmZyAetQEM1ZR1+eTHh03ikEuJVZ/eZfJqVkvrtQ77TQ/JMHFCFatoGrTfSCvHgrZULGHinV33hioKFD2f97xUwlF9B/GMCfMFNvc1FTfNHuMp/y8iyLAY+PNGa0H+pp+u9Dt5v15V1YzdMCVKeS9aqmBGg1YBOTSWQfXcCwZELHwY/7XtRTLF+WGc1bjv88mOaihWbqRoGl4tISmk6PzCcr0GjB6XEHP7Lgfl2ympw0APf8t6oXOiqgO4vO+bOEWzFNx3Y9BbxKYslmZkrm2cNpmZWKF4N94YLNWjljIOUggd3CKYcBwIx1XiBZUPZ2jxtrJ3Wg16wPkFv7NMEpJ+iW0cUkCR+3CVPHMZ7BDO5bLbyC+UEO5MT/27gOhSR14wFG7mGsC+CGBUr3HVvkMLieheaRHTBpxUrYkyKbqK01uxs/U8aL9vKmVWsvK/NtE1WePm7zZN9Ss5cKeQmkVBlf8J7DlhO3Z+P8Y0PCPyBzaQhKFDG2D7aaistwop1vGBuU68jChb+NTaxBLuQuK+hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(31686004)(83380400001)(31696002)(86362001)(36756003)(82960400001)(53546011)(8676002)(8936002)(26005)(2616005)(38100700002)(6666004)(6506007)(66556008)(6512007)(316002)(6486002)(66946007)(66476007)(2906002)(41300700001)(478600001)(5660300002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhsYWlmMHZjcHZ4N0lmbnZVeW1XeUp5UUxXb0x2bHZlSmNQZXFCY0FpV2xD?=
 =?utf-8?B?RUUzTURYRDhkQ1MzanBTbFRramhCeHI2SDZCcm52QTNIUnR3ZGdibFE4RGtJ?=
 =?utf-8?B?T2FwV0xFQXJTVlY1dC9ZMkkzN2pDUGFjNVA4Ym9INm5vSXErUlNKdHZlMDk4?=
 =?utf-8?B?bzlhL1Awb0lyKzFSOFBodS80RG9JNnp1dGJMTUdRN1gvamtYNTVkd3lPRmxa?=
 =?utf-8?B?QkRFZ1FrZzBPVlJiSWg4ZHFGSVNhRURHQ3V1Y1pnRCtpbDZRRjVNN1JNOFlZ?=
 =?utf-8?B?SDU1dDM0a2k1eVV2blNZcGF5cXdzN3BoRGc2VjFWT2ZGdFZSZ3RTbDJBVmd4?=
 =?utf-8?B?dFFJbGFRajFEbXVybVlpeDZHQUFDN3pNRUFhbTZBeThxKzFkVmxGTzk4Z1A5?=
 =?utf-8?B?SzQ5emtTYzJPOW9Oc05iUjJ4WkhsVlRSbEE0YlQrWVk3TXBzNUNSN0s2UkZQ?=
 =?utf-8?B?UVNUVTd2dFR6MnpWUC9vQTE3TlZqbDVqanFLVWR3SGM3Um5tZ0NaVGR6RFBh?=
 =?utf-8?B?V0M0THhuSzdpNnlEdDlmUmxBRHRuZFhTRzZOTEtGOXNBaDBwOG53SzNJK2x4?=
 =?utf-8?B?R3ZLZXNHWTlZR0RJUmh6UUErUmlnZlhnU1FZNmJhc0hJZkhVMzlLTm5nQWFm?=
 =?utf-8?B?bG9kb2QxdE0wa2hTOFF4ZUFBZkl6Y3BBbG9qRHg0bjdpNjBHV05UcitDd0E0?=
 =?utf-8?B?dFlZNHNKVW1mSVQ3bDlJQVhkTy9QUFFqSFp1Q2k2TW5SMU4wUE5QOEVvUy9y?=
 =?utf-8?B?Qy9sakU4VXpkdGxzT2NnMXl1L2hGOE9BQ0ZjRExDelVPYjdhamthblhxR1dt?=
 =?utf-8?B?cWMxSk44NVlpY05uKzBINXZKMlpudXVCaC9laUpGakZuMzBrdUgyZkwrcEV0?=
 =?utf-8?B?T3Y1Z3R1L0YxSVJ3MzRjd0F0OWxwdHprSEpXMWtOb3lqL3VpN2JhUmFBQThl?=
 =?utf-8?B?T1FzVHJnVmFLcnpJQkZlTUk5eVI4NUwvOUxXdjhBUHh0Ly8vQ041ZlRpVCs5?=
 =?utf-8?B?SGg2aTlJN2hEcE9LMlRiOTNqUEphaXJGTzliakpQOWg5ZkJwOTVBUndNbExv?=
 =?utf-8?B?MDg0cFIwZ2VqQ3RFVTN1ekorUlJuRkJmTS9nWUZHMTloZjdQN2pLRjdRcTY2?=
 =?utf-8?B?dEozOE9UOUc0YWwvMVJRSDd2UUt2c3dzREFvRUFaNVorMGhwTGVLTUsrVmxX?=
 =?utf-8?B?MHdrRjdMTE9iZFhUYzNkZVE3anhaSS90K01WTGhDTGxYWVY0TVBVRnV3Y0Nh?=
 =?utf-8?B?RzNTcHJzQjc3aitreHMzVitiVkdnaVVlYmk3TTlCdjU3YmFTRmVDN2s3RUkx?=
 =?utf-8?B?QVhCT3hVY1dQUHlXcmpSQlRNYmQwVWU2Yy8wWVJiTERMZHRCTnBXa2lZWUd3?=
 =?utf-8?B?TnpCU3hrdmo2YjlLZHhFbEI0ZDlSaVM5TUhVamtPSTRIMkt6N3NvZzdnQjdH?=
 =?utf-8?B?Mmw2MDUwTlpCMXpZVHdZV0NCbERVbUcrSWpTZWxVVVRKV1BJYTNMQ2tQOXd0?=
 =?utf-8?B?dnN0Q1lhTFhld09RbEVvbW1YTGttbm5vamxQYkNScHE4M0dYOHEzS2xTa1Q0?=
 =?utf-8?B?TnlBYUtUL1FRTUFmaVNOR3NBWTZkUEJZZnk1cWtrUFhFYWtqZmU5TTRMQnFT?=
 =?utf-8?B?dThCMUNEU0JKMmNCY0djU0RjZ2czOUJudlkwWURobzFBc0VCejdNcUxOMWdD?=
 =?utf-8?B?U09mN0d6VG9UVy9xZU4zT2xXSTZZQTlEM1Z3QXR0VUlKanBTbk1lWXlFZExm?=
 =?utf-8?B?a0RxM2FBTmtJcFRxUWVyWUdvcnpGbDN1ZFZlazJsQlhxOGNzakkzZ0UxNTZM?=
 =?utf-8?B?OXNydWc1eC9NNXpTVGt6S0ZsN0FCT2VFaW44V29OQnVYekdqNVpvWlJ4UXBq?=
 =?utf-8?B?cVY2elBKN0x6VXBDL21xN0xqQ01aKzRXNEdpTVgxSFZsdnU4K3JFTytQc2NF?=
 =?utf-8?B?LzRSQjljZWF4cG5IS3czN2J1OVRkNnhuVVE1LzZnL1l2YW5mdzVqQWdoUTNs?=
 =?utf-8?B?eUJIVXUwOWxOVk5qOVFwRHVMRUNGVGhtNzJESUhsS2RQVDdJZ1ozVEJQbEQz?=
 =?utf-8?B?QWEwSkJqM2xldU9ZamlYdjhtQ3JLT2MwbEVyVW0xK25HaG4wOW0rd3FKTml5?=
 =?utf-8?Q?l9iAAxbPBWxCj24SjMWdBVO8z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf87ab14-5b58-43ae-de77-08dc1b18ed61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 07:08:25.6677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoHEH5KaOxtdjQG3bcLryIMaWFFAjWtLnC0r4V/+CqWleU5mYLA3bLLMwZRNU7wV/qgDArlrYDvh7WMl19zvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/17/2024 10:02 AM, Sujaritha Sundaresan wrote:
> Fix function naming and description for xe_vram_freq_sysfs_init
> function.
> 
> v2: Add fixes tag (Riana)
>      Fix review comments (Lucas)
> 
> Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram_freq.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 733146293307..079cc283a186 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -95,13 +95,12 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
>   	kobject_put(kobj);
>   }
>   
> -/*
> - * xe_vram_freq_init - Initialize vram frequency component
> +/**
> + * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>    * @tile: Xe Tile object
>    *
>    * It needs to be initialized after the main tile component is ready
>    */
> -
>   void xe_vram_freq_sysfs_init(struct xe_tile *tile)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
