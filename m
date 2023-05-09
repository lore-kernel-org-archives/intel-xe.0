Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517DFC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 17:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263B610E3B7;
	Tue,  9 May 2023 17:37:09 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E201610E3B7
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683653826; x=1715189826;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i3JBjBFTkFk7I9dafTowTjRruvwD93kYScW/AYUqeco=;
 b=DbBOEYPHE5CzTy5ZjTT+1dR8teIp0JiQFOKtPcV9Epe2S5RjE3Av5+nv
 cZ0e+lF9+tr11p5SZ/52fqbXF5O5axOjPAvf6kqg27ddSSKYzhN7a9OiT
 rURsdBkE4hsDgsCoPQC7W84I9H4lFJW3793701JVGreuSymRGz+4t8m1A
 z3weLWoYfWeXnI2sgN9aUhlpGSHIOAgzRr1Wzm5QgW314qO4KtevsXxXi
 1BMgYo+FmYaUICHwzF8PYhy06TwqYHOqWGwkhnT25YmGFN4tMyR2r7R9G
 2gvddLj727aKbTf1hrF1M/U9jiU0i77zXyTxKMvQxSqY+a3pJZKzJ7j2W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413282210"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="413282210"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 10:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649426969"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="649426969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 09 May 2023 10:32:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 10:32:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 10:32:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 10:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us3NlqvdIZ70c3x8mkvFiSJRFACosAJftZuZo7R33JUBEkm2z1CchW3hCGoWiXhlX02sXg3GGug2yWix0krLpXp1Jt3GY59D/EiSgV9XHbglr5bOtngHxhpFPIrFYtmKBHplkLAVsmiTlxjeZf72gRkk+0BfJOy0OkSUD1HTau22uJNgLQNH8fZjIpr/Sz20lPDebsPONvSTTbuq/sN43TWJk0yl6CoID4XYur/fYi/m477nQ48pFI9O7uqK2q1bpMO5JZ9w1owNfoWdBlD2NEAt7zSOyUpAD5BTv71rbMOgh+jhbM5eMxpPWZsH9kVCkg866QLfXyk54pNxF2Nh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1IwuXAmcIP3jSIMweVDNwE4aFlXh4ohO/VJVOg65Jo=;
 b=fn745BhsUWL9Cst9UR14azCpZxfPQA0WDHRq21qNVRN2kcaSERNPqJdMLLYb0duMwxB4hp3yi+nnMPuaIgQGiNyu5kwUukPxELvy5sl8iCq4xq9qhexetkqZnw842+lCM1rjDtLVAjvd3u3FmOJNajGdZ2u6IOdTZKIm9dpr1oUAu+kqYwkoSrIZP35GpPm3G74tEGfekNh3mvX1x5vCvkWFKFz51WYLbWvxr79LlGVWW2Y995DquKojqkfKEqkCNbvOG2NaLg8EoZxwSj1NTFsjkfozHsUi3OzW0p75d1lvMMIZAghhPtop3KgH726EjknKhvAdSy0u6gsVm2bORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 CH0PR11MB5507.namprd11.prod.outlook.com (2603:10b6:610:d6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 17:32:13 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::f51e:6ddc:5400:1042]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::f51e:6ddc:5400:1042%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 17:32:12 +0000
Message-ID: <f0d89489-68e6-d84e-342a-d4d323543a3a@intel.com>
Date: Tue, 9 May 2023 23:02:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230419213703.3993439-1-matthew.d.roper@intel.com>
 <20230419213703.3993439-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230419213703.3993439-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|CH0PR11MB5507:EE_
X-MS-Office365-Filtering-Correlation-Id: 515ebeb2-b197-4f62-6185-08db50b352a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FhyZ/V+hSTADFGhLHmfj62lS6bC7Ny5unRQIg3UoH+cMXMZUBbxBg3WN/6tgm8O/tjPhJwChw3s3frl+lDi3jBYkAMzq/aigzuYfqWeUv3t9UemtlesH7hSke9WIjjMvEEf9UkSjkB4h9giV1nH2wETYS9WOjeN932UIJPa1gOVMvUFWN/ZIVVW2yqG7DDE4B5wLzP0ePJTNBg4n6aSyKtZnWLjPoKbaEtnY5MzKA4dmh3Z2QPYLY0t8dNKfbvQnSgm+LdLUBbHoMy6HxmdJlEz4R/H4ydBhtpvuwHS2njHt5dBqLATAGfqiY5bp0IJn2rsGoPw3vD/wOO5s6gzpTMDAkEYIrLgRGdgwti9A4x8/JA/rwvfrxSpqFciDdOOpV/DaOVJgeQ/o19XYw2kGYipWxjAr656b09i3RKHhF5E9hTMEJkhofKa9aFI7448K7EqesE5yvnS0xcDwNLMuRiuyy/iaTnIIOwAdutIFFtUeDnQE7rsRfjmOaI/bfVNAisntUvMqcsiiHY+bOh4sIvx6Ln4uq80AkvYfBebVhpe9HZ81Wl0jmvOQrR9rRsVmgWRkJ6IGsKEiYfbSN/X7qEbRoI8WRSRPM3hAlRWFMLM8br7NC6eRcDgpWFH5rRdasSm/+mOZE6IMt/xVmxIIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(66946007)(478600001)(66476007)(66556008)(8936002)(8676002)(5660300002)(26005)(316002)(31686004)(6486002)(41300700001)(6666004)(6512007)(6506007)(53546011)(2906002)(2616005)(186003)(82960400001)(86362001)(31696002)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkV6ZmJENGt2RGx0QW9Gd0hGdVNBSXhFQUxFOFc2QzdrS0FmN2drMFgxTngz?=
 =?utf-8?B?YUEzcFY3RTIzMGZSVXNCZUthWGtuclEzd3ZBVnRmcmsrVExPcTZBdzByaVBK?=
 =?utf-8?B?Ri9EQVc2ZGQ1Rys3TmxvajN4ZzZQUDd1MUlCVk5rNU84TTgrdFZBZk1ZdTFK?=
 =?utf-8?B?ZG1jalk0YmM1ZHcwNUc5MW82YldQRVRWcFNwR1dsQ2QrOHZEVnJLWWlyYjJZ?=
 =?utf-8?B?N1o5YXVJVjVBR0cybW1xWFQwWnBtTVpxNmswRkVvOTVGeDNiNEh5ZHBuaTMr?=
 =?utf-8?B?ZUtBMDE4cWVwa2JHU3dtTjNSZ3hVYVlDY2ZWQWNvUHdZQW16b3ltc2hBSmN6?=
 =?utf-8?B?TkNMdDcwRkkwV0RTUEJ0RW5WOFR6dDhYdUsrOVhBb2NDdkEyN20rcVJsbmhZ?=
 =?utf-8?B?Mm1LV2tMU2diNzhEM1pZaWxuMG1EdkNySUFaN0IwQ3F1VHZ0WjZwcGxkaURG?=
 =?utf-8?B?UUhIU051aTZWOG43WUNFWlBLSlFmS1dXQTYzYXdDMWNIdHNtVEw4Y0hGTDc0?=
 =?utf-8?B?NXRqMTRyM0ova1p5SWFFdnJWQitid3dtTEExM0xkSlNIbUg5TWZuSXhSZGdV?=
 =?utf-8?B?VWxsWDRLZmVyN3phTXQzZmtPTjBBbGFPNkZoYk9OaVA3U3F5TUR2UWVXN2pn?=
 =?utf-8?B?TGg1b2xoaGg4WGx0VGl6NmdNYUlQV1I2RlNpMkpneVg0QXN4cGVERk4rQ0xy?=
 =?utf-8?B?amthY0xGMXcvMzRrNFRRSTZYOGZYVm16NERWd24vM1FNeDdhRDd4YWRPeElj?=
 =?utf-8?B?ZmlsWnBDZnZWRW13aXBLUURlOUtKVU5iY0dWU0o2Sk5SNUFyeGdZM1hPNlNW?=
 =?utf-8?B?dEdaL2lkZTQyd0tQZTBESnNtMkwzVVNxVXZRQmpjL2EwNzJUdXJMT1BXbndV?=
 =?utf-8?B?Sjc3MU5aUmw1UTdYb0dsWmlQTmllcnRwMmNYTUVLU3psMXp4N1d5V0dIMTZC?=
 =?utf-8?B?UWVDenNxSCsvUmhwSHpMclFncUZaTVdtNWVKMGlnQjFhWTVnaENtTU85RHN3?=
 =?utf-8?B?K3hQVVkwNVloNXlBVThNSm9yeFdiOXFqQjFEWlJEOW5hbGxBeXREYkJZK1pv?=
 =?utf-8?B?TVdwNWMwOXF4bGM2U1J1clFYQjE0YUNpRkpmNjYwd29ac0lKVzFNSENSWFpQ?=
 =?utf-8?B?OXZlekJYZ2Q2VWxRTlJWcWlubUJSWGtLalBLMkVvNVM2OFllYUNQdjR4U25j?=
 =?utf-8?B?U1N1ZFlQaTlERmVib2Iwa3dEeTMyR3Ira28waU1ZRDJzbVQ0R3FqbVFrdlBv?=
 =?utf-8?B?aWVneGFOcVROQ2hzeGxvVlVIY2NtSEpYbVFaa1NCb0c1czY2aUJhc0NBUHJq?=
 =?utf-8?B?cUNTWk1Ga09IaGlGakppSVREZ05pV0s4YUpGWS80dVdsaDBURE52dEhKK1h5?=
 =?utf-8?B?TTZUZnNDRU9QU1hOR1lVbW5IdUFQVDNtWWFnSkxwU0tNeWU0aTlpanQrSmk1?=
 =?utf-8?B?NmFMWWtIazh0RjdwaGNSL3Q1VXErM1pmT3I5ZjBTVCswNk52NVQvQkhjZCsz?=
 =?utf-8?B?aG9uYTNuZTN3bm0xbE92UUV6aEhzQnk0c0N2OUs2V2d2OWZNZ3FBVTB2WXUy?=
 =?utf-8?B?NkE5QUdCZjhNWjNoWVBJMGdwS1ovS3grRVlQSG5hOVZ2dHovdU8vZUduSkFQ?=
 =?utf-8?B?R1ZoZTMycEc5NC81TWNHUWJYQ2puN1IvNVFxMWtoeGhrTWh0RmN5RWxMVXdw?=
 =?utf-8?B?L0R1MDUzV01vbTlSTmhWc2lxSnVVeFhCMTYydXpIREFFbEZRSFlmbW94a2tX?=
 =?utf-8?B?TjhINHpKY2podjFoUWZ4TUo5NlRKYTNuMVg4b25RYUJKang3eE04VFQ4SXVk?=
 =?utf-8?B?SGFWY09vUnlRblpVT2tpOHdrREd2K3dyREdWa0NMT3lZNHgxYUlIS014eDV0?=
 =?utf-8?B?QTUyNEN6c3E2OWJERlJhaTRPeEpkNWtOdFhLTzJvT1psb1FDY0pGd1FsamVW?=
 =?utf-8?B?Yk1aMHYzeTlvcHM1emRGNDFnbm93S1R6SUY1Z0U1M04wRW5yV2hnMmpPV0lT?=
 =?utf-8?B?MXdZTi9wS0pwZE5kaDU3LzJhK2FXZGNpTk04Mk9ZZ242Qmk4MnpVSzR6OFBR?=
 =?utf-8?B?UDVhanUrRTJOT2FyczErSFBZV3l1b3kyQkxxTHVzM2hmdWhMdkNXZktBTkN2?=
 =?utf-8?B?QUk2Nm5LZkprcy9TbS91czJvMzdLclNqeFl1TkduK0YybnF6OWRnNlZiVEtu?=
 =?utf-8?Q?lJsBCFamngDKsATukZWbnZA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 515ebeb2-b197-4f62-6185-08db50b352a3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:32:12.2658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAbBTLuqlRZq2e8hBs1bPaphnUVT3x7Spq48XYQmgqngUU3/0olKxxadqgQKXH2gV1k1E/rpcu08FYbTPLyk9LOq/qrT9b+MP1XIqFqd0Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/adln: Enable ADL-N
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

Hi Matt,

every thing looks correct

Reviewed-by:Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Thanks,
Ravi Kumar V

On 4/20/2023 3:07 AM, Matt Roper wrote:
> ADL-N is pretty much the same as ADL-P (i.e., Xe_LP graphics + Xe_M
> media + Xe_LPD display).  However unlike ADL-P, there's no GuC hwconfig
> support so the "tgl" GuC firmware should be loaded (i.e., the same
> situation as ADL-S).
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_display.c        | 1 +
>   drivers/gpu/drm/xe/xe_mocs.c           | 1 +
>   drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
>   drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>   drivers/gpu/drm/xe/xe_step.c           | 7 +++++++
>   drivers/gpu/drm/xe/xe_uc_fw.c          | 1 +
>   6 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index aae362f27c77..9bd14ffc8f8d 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -509,6 +509,7 @@ void xe_display_info_init(struct xe_device *xe)
>   		};
>   		break;
>   	case XE_ALDERLAKE_P:
> +	case XE_ALDERLAKE_N:
>   		xe->info.display = (struct xe_device_display_info) {
>   			XE_LPD,
>   			.has_cdclk_crawl = 1,
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e09c6242aafc..2d2e1c216db9 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -418,6 +418,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>   	case XE_ROCKETLAKE:
>   	case XE_ALDERLAKE_S:
>   	case XE_ALDERLAKE_P:
> +	case XE_ALDERLAKE_N:
>   		info->size  = ARRAY_SIZE(gen12_mocs_desc);
>   		info->table = gen12_mocs_desc;
>   		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92faffc838c..e96ea7b98f0b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -210,6 +210,14 @@ static const struct xe_device_desc adl_p_desc = {
>   	},
>   };
>   
> +static const struct xe_device_desc adl_n_desc = {
> +	.graphics = &graphics_xelp,
> +	.media = &media_xem,
> +	PLATFORM(XE_ALDERLAKE_N),
> +	.has_llc = 1,
> +	.require_force_probe = true,
> +};
> +
>   #define DGFX_FEATURES \
>   	.is_dgfx = 1
>   
> @@ -315,6 +323,7 @@ static const struct pci_device_id pciidlist[] = {
>   	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
>   	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>   	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> +	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
>   	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>   	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>   	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 80c19bffe79c..abbb8a1f29a8 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -16,6 +16,7 @@ enum xe_platform {
>   	XE_ROCKETLAKE,
>   	XE_ALDERLAKE_S,
>   	XE_ALDERLAKE_P,
> +	XE_ALDERLAKE_N,
>   	XE_DG1,
>   	XE_DG2,
>   	XE_PVC,
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index bcdb4601c2f6..a443d9bd7bbb 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -71,6 +71,10 @@ static const struct xe_step_info adlp_rpl_revids[] = {
>   	[0x4] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_E0 },
>   };
>   
> +static const struct xe_step_info adln_revids[] = {
> +	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_D0 },
> +};
> +
>   static const struct xe_step_info dg2_g10_revid_step_tbl[] = {
>   	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
>   	[0x1] = { COMMON_GT_MEDIA_STEP(A1), .display = STEP_A0 },
> @@ -129,6 +133,9 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
>   	} else if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G12) {
>   		revids = dg2_g12_revid_step_tbl;
>   		size = ARRAY_SIZE(dg2_g12_revid_step_tbl);
> +	} else if (xe->info.platform == XE_ALDERLAKE_N) {
> +		revids = adln_revids;
> +		size = ARRAY_SIZE(adln_revids);
>   	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
>   		revids = adlp_rpl_revids;
>   		size = ARRAY_SIZE(adlp_rpl_revids);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 97328e441f0f..7b8547bbeaba 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -104,6 +104,7 @@ struct fw_blobs_by_type {
>   	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
>   	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
>   	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
>   	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\

