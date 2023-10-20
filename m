Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8811ECDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8510E58D;
	Fri, 20 Oct 2023 07:36:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0810E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787385; x=1729323385;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f383/2c/0mF6DefLmhhUIGAIjHg5QGnZEDKQ/xWGDqc=;
 b=UUnQKxL0p7ons7qozpH0Zsy8S3QknTZiFa5aYf9PLrU7EQ90bqvCsTz0
 WH2Kc5RnOXQ6xbUo3uRsk7pQWgmYafv/HYmyBcNk+Wn8G4vjdkhiA9Qbd
 GLyw0yK6c+otPH/opraB0LU2k57YfGDUipYxQEQczjoB8aXgMJIQD+/cd
 bA3YxLSknmw42c5yxXYTLDM8mL39+8anmd1O0H1I1Y3U+XUpWgU5FCaXk
 ++Qjo78TDLjMcHHXnXbivGXvxEde8EL+Add2z8BdoikElXzoRx5aQskCZ
 JsMKr2mvzrMxvybIb1qZ+BIoT+ReYbaBkK/A16ibf9x5mNUhdSaPnWoX5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389310755"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="389310755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750833342"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="750833342"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:36:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:36:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:36:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Klw9wK8rwU9HT4OEEs9NPAi62QXX9PFiZ6ZnZFy0n/dWQeDtK7XLPD73QC8v9+TlL5HH0wvpDfSNrejdMOx3fyYC/jfA1PMx8nS9/zMdEwNXGNzFI5RGf0keMy+ZpHaZiUwPK2xxnhktjGOyWFyUX/gXjQ16vIGOPbPrhdbP6/DJcyKUbS6Q1QTFUQGSyu91bVhnPVvm4l5B+FD8muVJy2/XxJ87ppYKEygXy1yXCYRgThjyAhxP2LYJd5xV+O+q3AMybhHye/S0BArtYsfxVF/yXRye3+NsfEi1efDettAj9NXz0b4oYeFLA4S2njf51/F+PU7FiKxE7jQK7DtiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aktAdwCQr0mzfTKblH+TFba3MMTpnA4zwOT560Z8oC0=;
 b=dLnZz99BKJRhYXlENjRtTtD/8K72Cuc0gFdLFJYu/yeJLECuoNqCwr+0Erppy1xxV7YYgHvyShvNqQYrujg+InbhHtqXDydaWYyterFVaF71wv0nLxpxMrPH9V/8LJQKw9bE6Iz0r7XFZswvbnW2WeklrpVDw4+juSanu/Iqcj6NyUjHaEhsX6bHQWPx5X1QvB1LvkT8f3YB8sUboXNtoBQ4y25e8UDoCpTql3Tan755Nvd++Boq5kS5p/BiVgzNN36e06wDs9yDY34nwaG0W7rAaT/vrA1EwKm8i4TdRDxGVYoJO0AKNfu/Ujj2w7uwh7/+etSpt3pAw7370iQjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 20 Oct
 2023 07:36:22 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:36:21 +0000
Message-ID: <340b766e-23ae-4a7a-9633-a2d7d1b97752@intel.com>
Date: Fri, 20 Oct 2023 10:36:37 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-20-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230919161049.2307855-20-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 471a5dd6-9c1a-4bb1-e900-08dbd13f4118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3uNbfQXdw1uaQvTglb8qrYMAkkIWR0zTCAhQTF+u3u6XXvAeJqiAPVkyUD8onCTvJRDgW1WUgA4vX1yR1XP/+iIpvZL7ZcY89MXgGImMXh3G8w6ef7ZFb21fjJIWPPSDBnHqo3s3fLWVzWPaGDaCUZ+slmvyo4D8bpjl0el08XxiAAST/MjolIOyTTcFZNMX9n11nlemUWHpZ6zjTFJdVKYdG1Y6YM1vlhrgvWhQPnqiUdGDDIZmPHopq1Qz9WLZeXbLgm5RuOZCdtF/P/mNGHW8czd2S/U3kW2PW5GPyUmN3feu/+toMPmK2gK9xTfbEYCg7ebB+ochdlglVijjekiMUvh2SPnE2W+msghd+v/LDXfDLm/BVQATG2CmGRa26bjpGpvHyY5dH0GueDhA0JxOq/zedrnm5+zc1ZD1hHoevhlfBhqMnkv+p2MR6u3oLPTpgjMSzSYAfuUn7fyQZao2PFc6wxBbGm3ywYcuIhD6Axga+oFEfhKdECZPRqc0P3F3CjstzDzqvsPFMSRNeU8ogSlwND29aat30C161n0eDmaAi4SmRixL5cROXVQ9nPIEFyLmeSJ6S7VKiOsNrEpmFqX4LjIQvBbJMAp3SXfiiArMZFruLj8D1Djc6ZLxjdBP8CU+e6aDA7aU6/MKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(316002)(2616005)(6512007)(26005)(6506007)(6666004)(53546011)(2906002)(83380400001)(8936002)(8676002)(66476007)(5660300002)(41300700001)(478600001)(66556008)(6486002)(38100700002)(66946007)(31686004)(82960400001)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk4rayt1RE9yVFFLV1paSGJZNmVybGNSbkF6c3lGc1VNRkhKU2RkOTNyUmVh?=
 =?utf-8?B?Y0JXQmxLWkVwZjZZK0pGRm00NjJPYXp0ZHZ4NThMNUlKWUgwRGhhODlQN1R2?=
 =?utf-8?B?bTRGNTJOektWUlRQaHNDa0E1d2ZHemtaZGgxY3BSSlpGMTNPcGx5TklMbW93?=
 =?utf-8?B?Z0wzb0l0RHBsazJzSHh1NnFwNzRQT3NRQ25ENzdyVFVyU1hFY0ZRQzRVYnJm?=
 =?utf-8?B?T0tvRjRJNHZHSVNFZndRV0FkUjNyc0o3dGZyTWhEZzVwU1M2dzVwSVdjVDdq?=
 =?utf-8?B?RjdVSmxrMHREM1M5TUF6VVpheUp3YWhYd25pYVQwNHVISDNLVjYzRmF3YjBD?=
 =?utf-8?B?bjhnWFEzOTgxN0ptcCswM2hscThWeWc5dkV3RncxVzRVa1hhNll6YlZFbmN5?=
 =?utf-8?B?VGhaN0Raa0tyc3BiNldoQy9vUERuSG5veUJQYmlVdkRCWEl6L1JiWW8rVHRU?=
 =?utf-8?B?OWcreDNyWTU2Wkxuc3JrYTJXUlJreDRUUDB6K3dpeS9uUWt1b3hyVjA2MHJa?=
 =?utf-8?B?VjlsYUs4ekY0elh2a2d2bXZBb0dlL0hoaW1xYnNITXNSWDVlSnhaRVdXWnhN?=
 =?utf-8?B?YlZ1MWJnT1J4K1o3TTlXVkNWVDI1aytEcEpxSHQ3ZUZuNEV0cTNmRS9janZz?=
 =?utf-8?B?Qzd1RjVlQ05qOEpCektrNy85MGVFdkF6WjlKWElnOUxLbzZNNlJFVndQZUJ5?=
 =?utf-8?B?emZ6L3piblViS0JrTjZ2enpXaHZ3bXRka0JTc21PQldGQzBWVSthME44SjlB?=
 =?utf-8?B?YWs1MGY2dUFtdFB5UEprWnNwcC80aytEVFY0cm11RG1HSWhzZkVnR044TENj?=
 =?utf-8?B?VGRYOUtoQnFQMm14bko5MlF3OTJiU2syc0tMeVRQUjlpSFF2TVNxb2I2UHlI?=
 =?utf-8?B?MHNWK2t3dDZDWDU0M0w0MzMyd1ZieEg3aVVEMnhOZWpWaXAxeWxFTnJnZ0Jn?=
 =?utf-8?B?ajg3NGhVY0ZCeEZ2QUZmblhZaG9hTXlLc2FuQzQyYm5hUHFhak5oZUQ2eEZO?=
 =?utf-8?B?ckhJSWliNHJLMGM5Vzd3aE55cVJwM0pid0g0cDJKb1k5MlVwNjYrMktMeHho?=
 =?utf-8?B?ZGhvUUVxR2pGZXdqdVhUd3VFZENZVHBOUjFFQnlGTkRwcG8vWW1od3lBVTd3?=
 =?utf-8?B?WHM3eU9ScGNCZzk4c2tOdVRuZXdEMHRKRVJQWUVtWk5ZUHhKSHJQeDBsazd4?=
 =?utf-8?B?STZKb0lsZ1dNUWE4YVl0bGl0dXZtZ3ZzZ0xyQWdrT25ZY3FXblNoR0p1aHly?=
 =?utf-8?B?VEVKSUxZaUFUMERiZU9DeHRERGsrQ0pCTVltMzFLR2UwWDhBNTdmbmZSbndz?=
 =?utf-8?B?blRtR2ZyQUtDbGl6NXVhU1dOTGorSWVCRUoyckFFSzBaZUZwekRPWE1Gd3VV?=
 =?utf-8?B?N1B2b1JuTUhTcGQ0QUdVKy9kK0pwMEt0SEQ2aVk5UXBBSEV5NWdSaWZCMDF3?=
 =?utf-8?B?blQzN3ZrczNtSEorOENPZXJmWEZFcjBzUTJHOG1hWUVUNkxhNXhUbWV5U3Q1?=
 =?utf-8?B?bDNJTFhEc2RZbVdLSWxsakdCK0owUzFhVVlMWnNCUkpGY09uWkxGN3ZraERj?=
 =?utf-8?B?Wkd6YUhWNk16NUVVc2xOc2R3Q1Bqdm9PNGZjUEFNWnlNdEcvN1dqNFdab0lZ?=
 =?utf-8?B?VzBlVis2NGtCdUgyQkhGY0NvYmtSTUNpenpCalNFaG4zOXhCTnVibUZDTkJX?=
 =?utf-8?B?TDcrNm90eUFMdS83UnNBODhGN0NOZllDOUtNTjQ5N3ZLamNoRkJqWkpINVpr?=
 =?utf-8?B?eHZjY1puOE9WK1dKdzQ2VnZrdE91RzdCY0syMFlCRmp5Yzhuam1sb0FJVkd1?=
 =?utf-8?B?cWJxTU1rcENvNTVGQnRIcU5FUTZQWkZzNkVaODB1SFFMM0JPT3ROcDdlczFD?=
 =?utf-8?B?cFdtTzI5RDE0TUdlMGMydzBPWHFVWCt4RlhJM0pRUGFMY3BLWGZiQUI2aGVl?=
 =?utf-8?B?SU44bkxBaFREbFV0TzlOTDYxMmlaUEU4bldXVmx0aGRJWW5wQnRkMmRmeHRE?=
 =?utf-8?B?UkhRRk13TjU4ZFkwWnY0VHU4TVF4dEhmZys2S3hid1NuUDZmVzlPeUhEVFg3?=
 =?utf-8?B?Y3VUM2MzeWFNM3VrRS92dUFwM2xXZTc1T0ROc0lkRlNTNkJtWDV4NEVxRDQ5?=
 =?utf-8?B?ZE82Z1djekNnOGtxcUhwbDFhUkpCNXYweXBPMDdwanlkaGxteUpVTXBOUFVi?=
 =?utf-8?Q?44mZyRsA+foX5SG0lKMfdZQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 471a5dd6-9c1a-4bb1-e900-08dbd13f4118
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:36:21.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FualXWDmzQyk/BN43BnCmIZY79FmZAO5Voa2M0tKdnS8RKlvmgB25lqDUa8/EVrLV+yLkJjaCDSKVClvDwl9V+ZthcVMzO/AcNH7e/DPBKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [19/21] drm/xe/uapi: Drop OA_IOCTL_VERSION
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

On 19/09/2023 19:10, Ashutosh Dixit wrote:
> OA version was previously used to track which OA properties were introduced
> at which version. However OA version is an outlier in that a similar
> version is not used anywhere else in the kernel.
>
> For XE, we will track addition of new properties by means of
> xe_user_extension. Userland can either maintain a mapping of OA properties
> against the kernel version, or rely on return codes (e.g. ENOTSUPP) to
> "discover" OA properties.


As a userspace driver this terrible.

You're making us write more code because we have to discover every 
single piece of implementation tweaks ever made to the kernel driver.

Yes OA version was an outlier in that it was better than the rest of 
kernel API.

By reading a single value we could make decisions about how to 
communicate with the kernel driver.


Having xe_user_extension here is not helping, we still have to fuzz our 
way around the kernel to figure out what feature level is available.


-Lionel


>
> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c    | 5 -----
>   drivers/gpu/drm/xe/xe_oa.h    | 1 -
>   drivers/gpu/drm/xe/xe_query.c | 1 -
>   include/uapi/drm/xe_drm.h     | 3 +--
>   4 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 077698a0c5628..7cb900fc88f58 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2331,11 +2331,6 @@ static struct ctl_table oa_ctl_table[] = {
>   	{}
>   };
>   
> -int xe_oa_ioctl_version(struct xe_device *xe)
> -{
> -	return 1;
> -}
> -
>   int xe_oa_sysctl_register(void)
>   {
>   	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> index cc6f64bc24ddf..c5a2745ab7cfe 100644
> --- a/drivers/gpu/drm/xe/xe_oa.h
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -12,7 +12,6 @@ int xe_oa_init(struct xe_device *xe);
>   void xe_oa_fini(struct xe_device *xe);
>   void xe_oa_register(struct xe_device *xe);
>   void xe_oa_unregister(struct xe_device *xe);
> -int xe_oa_ioctl_version(struct xe_device *xe);
>   int xe_oa_sysctl_register(void);
>   void xe_oa_sysctl_unregister(void);
>   
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index ad280bac9eed4..8246ce4e24ce5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -202,7 +202,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   		hweight_long(xe->info.mem_region_mask);
>   	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
>   		xe_exec_queue_device_get_max_priority(xe);
> -	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
>   
>   	if (copy_to_user(query_ptr, config, size)) {
>   		kfree(config);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 3b106bed42ea6..b0563cfc351ee 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -259,8 +259,7 @@ struct drm_xe_query_config {
>   #define XE_QUERY_CONFIG_GT_COUNT		4
>   #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>   #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_OA_IOCTL_VERSION		7
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>   	/** @info: array of elements containing the config info */
>   	__u64 info[];
>   };


