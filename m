Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB42EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 07:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4A10E226;
	Wed, 14 Jun 2023 07:52:45 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D7F10E415
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686729162; x=1718265162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0vl94ltUGw+2QE7G8b0OjE+pkhObeS4NS74v8ZoGBwM=;
 b=C43x3AyXf2DCTGVh3v38moWjTkBZXkn820TwvBMF1dwJELycNU1/UBYI
 YT+OMAzyhhTQDydTfP8BcxwdLrfOBPYBiKN8sCbhcVXE1ByXWW53SEsT0
 VfzVMQOJzf2Er2j48va0/IEoKxLNiyo36wgaeJ2BUgPYkdvvt9JPN401A
 qmsDRbPPSJZ8jKQeMk4Gh9YCml0QJf/6qbqNfuyWCSgigrBw8OeEmjBby
 mSY6Aj4esNBizUQAkQ6bFzX5iwoYijZffDVQNu1kJGyn/CL23BxbUTD9h
 u3B/qgfP5ODcQg2qtPzdJCZKcQsCRI7v4rOj3Gis3y3nnM9AhZ9qBNhUC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386956552"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="386956552"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 00:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="715096804"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="715096804"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jun 2023 00:52:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:52:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:52:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 00:52:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 00:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZeKs23ln99FXNoKkxlUBwfBEiBLOy68uTmCtdMJ/ndSW1mJm/Hb2Tv+qE1Qgxx6LPZAm1cfB88KcjqfQDvM8X5KXvNVyTb+UvYAYrRQdISNhmGbzdgfaLVfPZ0N0WaGibvEyXeWYISe9l9Lu6EkVqm1lKysJqvG3n8k7VOWKSu4Lyao/rWuCUNI56h6gxOS+1kOsKQm/XZME9eDboihcXDlkmiEJly3qTaVBpAmpQ2WdTVAFopfCf08ehqJnZRK7aJSNcolC/QVwJwy48mDSrMmyWhzhc4/T1fA5CMVlfuDZvdbEXUpg0tylAxRrKuNAnZNIvnpWteBe8lrk8rCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITaWHiwnX3c9XnOxkx1oh758bHGaiBymdLRakHKXp8A=;
 b=RmIGoKRBoyyJ7pKygfvpWQcfzO8gGTVKLK2Yj3VOM8IxI3Dv95NdYThxPQSI6T3xkNO8LIupAH5/ysXmz88yCNnTIn0w56hUhXDS/sGb4Y2kNCBKCgAmTs1rAvL6Zw0YTdnO2QR7Ypg6kfAT+ejHDz/xh+vETlgW/996DQwBm2w17eyB1EouNe/oxVVLRYpjCGZVv5VC+z7sqxCNCV+KRmle2KNTpkeZg3nRdop82yZ3fZNbPb4ixD31s57NOMGyyYhC76GFU9GdqO89erF826v0R26TBSdz7tLF4X551IUH1EDy/7U6Up80RKLzLNkUc4dVndbaEhdj9+acYQq3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 07:52:38 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 07:52:38 +0000
Message-ID: <bdf648c3-bacf-8f24-1695-981a9e4d7b0d@intel.com>
Date: Wed, 14 Jun 2023 13:22:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-4-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 635a9201-099f-4f34-e72d-08db6cac526d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: su5v4up7tQwuERa0/YRBlvk6zKUKQz+zFfprG7G2RazLArAA1y8seVpez0mGVtOgkS6qZzcQicKg9+KwjQC7aJ6jRTreYNbH7/Je2xeqvIArP41eJDnWcjYu3Q/V2ci0CmQkw3gvlbkvGAAr4cH1hZLeQuJi2bVqvvu/flVW7L8NcOsjAry5y6FJ7/189d5X/Dfwrc+Oxh6HbH9tMyVf4LnLT8fFwBepPKT3JKLlzVDunpTKBbqr9WeIJpeeZn9i8kP4EEOohh+jSFTNDwai88fBRQkW9zoYc7f6NOwHKV/NRwne3rcdcSCwuGjmo/M0oLEufKgkBqgz08Ba8dK69a0+C/z2s1wHMRiTgzViwjl8mfocvnAxzUUq5OpXpg3Yce2jNlgxUCxVP7ngE5kAXgCpAGGGfpycBNnsKOxT+iITyv+LiFYfM7K3O8U9X7Itm5kgHF1Ttl9LsxuFzEat6UFgBzat3bHI0UBbQA5CjpQoBLQAHNE09CsKOfscPBJUnwG6+Upkd1npvJyVgvsZg7was8FEJH9nGa6acQ0aAduPN7l+Jq5ftCcl3POP3+7KA2P5KnS3dxUN7YLBPDn25hYo4YRZ+MLzsWp9/JqrVjzd+H0Tj71X9V9FFMZdKbdP1vcaClHfNDV3QaCPDo3zNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(38100700002)(478600001)(82960400001)(36756003)(86362001)(66946007)(66476007)(4326008)(66556008)(31696002)(316002)(6666004)(53546011)(6506007)(44832011)(5660300002)(83380400001)(186003)(2616005)(107886003)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRBMVR4ZStZZFJjdEoxRG5LVzltYW5DLy9waDVDdDVNZmt2YXk3bk50SDh3?=
 =?utf-8?B?US9zZi9aV1lyY1VsMmhmOUNTK0M5VjdTTTd0eXJ6alVBeDhuRzh1cnlRQlFx?=
 =?utf-8?B?WnZWYmF6SnJjZjR3djZPK0tmWi9JUTRVa2tnK1ZGck5DSDdWZ2VpNWhGbUNI?=
 =?utf-8?B?ZEo1SXJncFlyZzd5VVV2ZSs5d3dGdEk3em1KMk1NQUJIQ3kxZm5rdVBLcVhx?=
 =?utf-8?B?L092VkxIdmVuMXpoK1NZNlRXbVN0Q2xMRjhFdlI2ZzlETXJucjBMVDBUd1Mr?=
 =?utf-8?B?R0o4QXlqSVZzRURoWXBwS05xY1N6RExtbXZUZkczR2ZYak54UWU2d3ErYnFI?=
 =?utf-8?B?NWRjUCtXOGFEY2pWRnN5QVhPMWo1Z1VjQldsS3NnSHZMVzEzN0Q5UGIyWjU0?=
 =?utf-8?B?cXhoZndXcmxJU0xhZWhGcWNlcTd6R2lqb0dDV2lrN24xeFpqcHdPZCs2eHMw?=
 =?utf-8?B?dEwvSzZONWhmbmxVdnMydWRpVjZvOXo2MTlFamgrdDZWMSsxTTBBQjVBS3l1?=
 =?utf-8?B?V3ptMjd4ZWFPRmxNMGNqWTc5bUNOcmYwd0dOdk8rZEFIOW1yK29SQUNNWFFP?=
 =?utf-8?B?VkphMGVacnFnVjJjcmZ4YkpWSmZMUGV0TnloWFBPYytvRW5ISlJMNkYzdjU3?=
 =?utf-8?B?U0RTSGE4VzFYY3UySGNoTEo3bmw3QWlFN3U4a1VuRjJIT2YwbCtKdXB3RFVI?=
 =?utf-8?B?SXBkOG9XUmNvUGkxdjhHRFFUcDF0WjkxVTNDT0h6WG1YYndzODFlMUtjbXBn?=
 =?utf-8?B?Umo1UGF2eXNsekJYSFc3Tkw1VXpSVHlaTFBodElJbllmOWVLNk5IQlhLaVlv?=
 =?utf-8?B?aTNBc2FwMzFyZjg0WTVHYVVHRjNYN0NIUXp3dko4OC9pd1Ird2ZheXcreEhv?=
 =?utf-8?B?NTA3S2hTNk5ReVZtL0psSVRweHBGZk5YVXNyVTFJb25FNmNCci9Ic3VNanhZ?=
 =?utf-8?B?VjJkek83R2RJNTNTcFd6d3JkZXdsY0puak9acFg4Q05XN3BTKzhrSlFXUklt?=
 =?utf-8?B?SXhnc0s0OWxQUkQzMDV2TWl4Wk1wME1ISk45N1ZkTnJ3bWl3dlVlNHlwQ044?=
 =?utf-8?B?QXk2NytZL0pDMkZnd004MHdwclRIOGJGajZmM3E2b3hNUEE4elBuVk5xZUo5?=
 =?utf-8?B?bEZ5d1BrTFBhTlY0dkMraGhvK1FEWXdIQmVJZERrYkNvZTcrUDhkdHc0SzQ3?=
 =?utf-8?B?SHVBRkpyOGlnK2NkeCt5a2pwQS9iTS90bkpQQnpURzd4VjkvcFFaRzJ6Y2xa?=
 =?utf-8?B?U0NxcDhLcytaenYzNTRyUlRGZnRNN3JwNzByS3Jwc09idm5zMzEvUko3bllu?=
 =?utf-8?B?bFd3UWhoN1RLQ1A0WGhubHFHMDU5YkRCdUs5UFVWV3Y2bjNPUnQwNUdyU1FZ?=
 =?utf-8?B?cFZ5ZS9lTnpmQWxxVy9VeGdQNlFxVzJQbUlvSVhraUNjK1ZRbW5ZYjh1T29E?=
 =?utf-8?B?aVp2SExndXVkbXVUa0ZlYUxZYjFJb3BNVk5TUW9XUjVyWTQvYkZVSGRNMlY4?=
 =?utf-8?B?VUcySjg3RmZIUS9KcFZ0WWh1UFhHODJudWIxZEE5a2Z6Q2V0NHBkYXV1cm5n?=
 =?utf-8?B?YlZINHRMZ2tFVzV2QjVIMGN2Tk9xVkdER3hpelV0WldnVjlCVy92c0hxUXpn?=
 =?utf-8?B?eXQ0YnRHUytmTUlScXc5VlZ2ODFWT2t2RVFKeVRYb1c4Y1RYMmV2OERERENG?=
 =?utf-8?B?ZVNTbHdMOURPSi9SbTJxejVHTERVQ0lxSGRCcGNXa3VndzN3RHdWeWI5NlJq?=
 =?utf-8?B?cWNOUmluSUxGU09rNVhRckVmYmZLZTlmcXNXeXkvR21iZktIUUZIWFh0TktQ?=
 =?utf-8?B?TVBld2JjbUxkbjJzNVNHb2dXRFByK1V6OEpzWUtVS1BMd0RXSnUyNGYwcGs3?=
 =?utf-8?B?Qzd6SDZlME4yK3NaazNDaXU2MWE5YnhXNi85UW4rV1FOYnZoQzlsc0Q4anpt?=
 =?utf-8?B?RHkxd3JVaGhET1g5cHdJd29OQnlrOVhuZEsxOURLNU1BN0t3VHBFNzZjNFp4?=
 =?utf-8?B?VFZPaUxlZ0d2TmRxdkRRQlRiUFJmZU5hYm5EV1FxRXNZWmZON2dEVnFOZmlY?=
 =?utf-8?B?QTFWWlYzSnBkSG9Vd2xIbUpoSWhTSzVjUnZMNmhlSmE2UmVVSHZISktSK0NM?=
 =?utf-8?Q?mBmRjEPA0iE9xQtrOy0DwAlGB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 635a9201-099f-4f34-e72d-08db6cac526d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 07:52:37.9862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6OoYnUjYIH9+mjN6hCN+TNb3+msmkwjfXvlafnY0UTYRxP7Q0OTlN/nRKpzBRisL9vNZRkS8QyekVSEvoRaBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 3/6] drm/xe/hwmon: Expose card reactive
 critical power
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 106 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>   3 files changed, 139 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 54a7b668009e..fcc2aedb2aac 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8e248e806559..b07ea53fdbc6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -14,6 +14,13 @@
>   #include "xe_mmio.h"
>   #include "xe_gt.h"
>   #include "i915_drv.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +
> +#define PCODE_MBOX(mbcmd, param1, param2)\
> +	FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
> +	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
> +	| FIELD_PREP(PCODE_MB_PARAM2, param2)
Should this be moved to pcode file?
>   
>   enum hwm_reg_name {
>   	pkg_rapl_limit,
> @@ -31,9 +38,11 @@ enum hwm_reg_operation {
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
>    * - power  - microwatts
> + * - curr   - milliamperes
>    */
>   #define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
> +#define SF_CURR		1000
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
> @@ -246,13 +255,35 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
Remove duplicate line. HWMON_P_CRIT needs to be added above.

Thanks
Riana
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	NULL
>   };
>   
> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> +static int hwm_pcode_read_i1(struct xe_gt *gt, u32 *uval)
> +{
> +	/* Avoid ILLEGAL_SUBCOMMAND "mailbox access failed" warning in snb_pcode_read */
> +	if (IS_DG2(gt_to_xe(gt)))
> +		return -ENXIO;
> +
> +	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> +			     uval, 0);
> +}
> +
> +static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
> +{
> +	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> +			      uval);
> +}
> +
>   static umode_t
>   hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   {
>   	u32 reg_val;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -261,6 +292,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   	case hwmon_power_rated_max:
>   		return process_hwmon_reg(ddat, pkg_power_sku,
>   					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   	default:
>   		return 0;
>   	}
> @@ -269,11 +303,23 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   static int
>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   {
> +	int ret;
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return hwm_power_max_read(ddat, val);
>   	case hwmon_power_rated_max:
>   		return hwm_power_rated_max_read(ddat, val);
> +	case hwmon_power_crit:
> +		ret = hwm_pcode_read_i1(ddat->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (!(uval & POWER_SETUP_I1_WATTS))
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -282,9 +328,14 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   static int
>   hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   {
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return hwm_power_max_write(ddat, val);
> +	case hwmon_power_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> +		return hwm_pcode_write_i1(ddat->gt, uval);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -332,6 +383,55 @@ void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		ret = hwm_pcode_read_i1(ddat->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (uval & POWER_SETUP_I1_WATTS)
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_CURR, POWER_SETUP_I1_SHIFT);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> +		return hwm_pcode_write_i1(ddat->gt, uval);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -343,6 +443,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_power:
>   		ret = hwm_power_is_visible(ddat, attr, channel);
>   		break;
> +	case hwmon_curr:
> +		return hwm_curr_is_visible(ddat, attr);
>   	default:
>   		ret = 0;
>   	}
> @@ -359,6 +461,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_power:
>   		return hwm_power_read(ddat, attr, channel, val);
> +	case hwmon_curr:
> +		return hwm_curr_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -373,6 +477,8 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_power:
>   		return hwm_power_write(ddat, attr, channel, val);
> +	case hwmon_curr:
> +		return hwm_curr_write(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..5935cfe30204 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,13 @@
>   #define     DGFX_GET_INIT_STATUS	0x0
>   #define     DGFX_INIT_STATUS_COMPLETE	0x1
>   
> +#define   PCODE_POWER_SETUP			0x7C
> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
> +#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
