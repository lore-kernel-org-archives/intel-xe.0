Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374EFC4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 11:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D500D10E484;
	Tue, 16 Jan 2024 11:27:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962CD10E484
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705404457; x=1736940457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ei+B+ZSJakllJwYY8A5G45hUqefY/fM2qROAHN1RBfc=;
 b=Z4BEkxIObMLmpYDM+bF7eLchwMNRG2dDR6OnMng5JUeI7J/JJuBlOwhq
 f5Dq9KaJPmIgXoRJDegvfbI9d+ljRRZoSsj2XKdc2mQzTrMIRl95/mu3a
 j/UyCyvW4KzZPiqDTB0Yy1vBxarYn5tkIw9vSUc1WwtKeyDhlZZrDEvN2
 LoCXztu/ifiQ0rTOg140UZ9mkWOD7kt11EpXz+XUjy53lL+bo0NPbH7qu
 L6tAMyI8HhbcgPsF0jhYNQ9GDkwJ8MIF5mgu3QAfHXPWuj63zpcU5UKHg
 QDZtSdpq1RIorJwpH2xvaRmHrl+6bZxEP1ohXfz2auaL4kNNJuEKXOEIu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="21307581"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="21307581"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 03:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="777007925"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777007925"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 03:27:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 03:27:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 03:27:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 03:27:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLBOcDI6S1uNCx53FR1jSBupaxytiKCRrk5yL1B0p85sr/qb7vssVZjYv6sxUNwO/07Xt5rh3U95PCoTR4IIia6WANrLip7MM+IBYls3y7+8BfJlcyZmSiE0b/ntrORGz7shpwgDKaKgnwMAXMOXABwMRq7Ta4xeGJjfXo8sXyJypzQ6777dQJWgIYZ1t9jEm26VMwmjGRYZcPmzeY7wbx/XJmOFxbTIlC0xGxxqGY5Mz/F+wBOsuXrJnzd4ZnGzq/Rj+sv7Qa5kduBiXllGsoPFkB/TST7odIcpxxdI4B0vupg/bNXwaGOa+z8fbVwHodxWV7aTVcUWxHdsYnjRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCPZ4D+9OSULbU1KLVGVPIZl7eMUStOw+UY4n5ixiHQ=;
 b=Bh79qZSGXhg2bSmKPWhaDRVJnMee2pxDhPs0V4+Y34mjxIXe0l4X4sQ+XJKaIwJerOoRaRURBpk+8dwP8s9ZdWS17ZhD45qA659AeUr0qZhqgqI7KM7juPYn+PuvRgiugRfhvqxEZRa0NooQlgw4BqLd7SGSEkYT9VU0mbSS/dSdJZuafnSmIC7xMJUnmLbnt5MthKhSNX5+wXlnb1lEMsRq6hmuofvPus/iEZ5Iz3thq0u2JvD97amjHwMgr8uJEjMzKPlkuus3cKVFpP4Xfb/i9tKmLQ6XiCK/qqEMTxdoICxdS2EQW5HOb5Sz0gD3R7fMwzkWf3G2ncsa8ORVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Tue, 16 Jan
 2024 11:27:28 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 11:27:28 +0000
Message-ID: <7d9b6e54-ee1c-454d-b970-07feac5cff58@intel.com>
Date: Tue, 16 Jan 2024 16:57:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA 14018913170
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240116095535.2304397-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240116095535.2304397-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: a4efaa4b-bb83-46ce-8f1e-08dc16861ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXXGLM/hm9m4HphJZyGQ9LSQp1/5IEKeJx9mgAX+2G40ZlfU4G7+bmE5PjHpl0w8Rc7lG8xqMYb/y+Ts33NOYadaxGbmNuIXAaD0CEjLHrjsn0z66olio3Ri8c5uquGqRwfGHOMOuwIP6iFcfDc7GHjiFcaRv2KO7aKd/GQFVm7onroF1HSGXC5OKJeE/AY3H8hXaBBJ68vlQeHEozEs75a6Rxei48dgIgHsLtr1DQjdPHU/2hzI+kN4GBxyUqb9pYMvx2Btf351VksfzQfkb1d8Nqsx0kzy6i43QXWqeAhX77tH7eRrPj0bKWunh/HbCu++VU6xl4IxXeFIsbRTW/55es71QTyZxShlyDS3xO7I1XBWa39jBxqZ8zGpWcIN9QXMNpdOjPHLl2E0AXOTMnYXweIHIAzV+m3UtlwTac2AVRG6qP9TH1qQwnxHgDVRSvXSKtLAVL38CcAlJ1a1gL2Ibt+OVJDiAQ86lJG+RzUjXUoppmlYAEZFJJ0fo7Q1ebOA4xU2HxlrEw/A5ldTvTYhuhqSa3HYI9jFD5kx5dhuiS0zLLz8ujjdlmOr3Jkm6vPaNrHmz9grWfXiyfifo+wosYPecQ5DP3ZFJgohipIwDau4OfX7YbO8uSnsqp9zXlapGRwWsjxFQzg0TQHKEKUTP1KA3+zHNoP+Wujq44bDxQ9tKCU7TvxyuI9JzCk4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(451199024)(64100799003)(107886003)(26005)(2616005)(6666004)(6506007)(478600001)(6512007)(53546011)(83380400001)(5660300002)(2906002)(41300700001)(4326008)(6486002)(8676002)(8936002)(66476007)(66556008)(66946007)(316002)(82960400001)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtyT0s3bWZhVi9ubDFxaWRHL2V6UDlpVDVvcjBVS0c3ZSt2azBRNFNtUSta?=
 =?utf-8?B?YzhOWWsvb2VqZTBTODlldmlhZHBqUFZDVVE0bllPZTY5WTNuOWFjbndUZTdx?=
 =?utf-8?B?QTZROFRmSFhUSE1YdnJhcEhGcW1RMElINEpKdWd0MzhIcmNBTGY1QktNVndV?=
 =?utf-8?B?OFZwRStzWC9sdDlqdUJkK2ZrVkQ4SzEvcjRRK1dXcjArUmhpRnpVc3h4dUhT?=
 =?utf-8?B?LzF6S1c2TTdhK25DTUtBNEIxV09UVWoxa3FHREMzWEpYYlU0c3FrRUplNk92?=
 =?utf-8?B?MFdQdFE4RlpEcDY5dXBjOC9JMEVqRTU4aGZpQUtuV0FYbFNsdGNiOUhranQw?=
 =?utf-8?B?dlp1T3FDY3RIMmg0dnZrZjFCSS8zYVNVSDJBdXdVaFhKZ2dpOEVDM2htNVYy?=
 =?utf-8?B?ZzNZRzcrOVo1bTZ3T3BZcDBudmZuNWtlSzFDSXNqWFlvTlFGT2pyTVNEeW8r?=
 =?utf-8?B?ZWM0QkNrRmxqbWx6aXVxKzNPSGZjR1ZnNmErWXFlV3c0akhXRU9VbTl4ZGxN?=
 =?utf-8?B?d00za0xoMFAwWlVTbjYrTTdoN3EyQmpVdTRvZlBwOHRvM1RPR1NhVGVjV3FT?=
 =?utf-8?B?RkhnMmt1QUwrb1I4TTFNTWg1WHI3dmZiQW9qRVpJVVppZVhFNWQwQVk5VGl0?=
 =?utf-8?B?eUszNFR5c1NsOVI4eWVmaERzdXI2WnE0OGUzKzUxK0hmVEYyVVloejF0SUdi?=
 =?utf-8?B?dnpBZlRzZUN1VG8rQS8rbU1HTUZWek9yRm9pcngvcDZPSExDY203ZzJFTnd3?=
 =?utf-8?B?S2M5WHJLd2dvNjloZk8yMXZFMEpvQTExbGFyRmt3bUxqVFM3aUF4V1F0VVl0?=
 =?utf-8?B?N0RLZ2x1TE9lV0ZmT0tFWTYyNHUzdmMxRkRNZmRuOEJSVExIeFd5VEVXb0lj?=
 =?utf-8?B?SG9CNjZMN1BRVzR4Ykd5MlFsREVVWTYwMnkzS21BSlg4bjY2c3hhdWptblZF?=
 =?utf-8?B?eDZkZnljNzh6TlU5eVVLNkpTbmFKLzZheXJ4c1RTUnVTRDFiQk4xNjhwZWlX?=
 =?utf-8?B?RWlMZGc0SE1LdGY5QmExaHhVOVVIN0trRWpqWVBqNWU4dU9TUkVJcHdiRVZC?=
 =?utf-8?B?M1pNeVZZSTkrN2R1T3o2QlUzZ202cmJtTFBJQjJWYW9xdk5EUDdnY2FRNE11?=
 =?utf-8?B?OUNZNUpVREtXclc0NXpKd2doR2t5bkVuZWRsd2ZLQXNyTmlkQUt2K0xWa3Ey?=
 =?utf-8?B?aE5keG14K0YrUXlsREZqTzRMNDBUNWh5VVdxcy9yNFF0S3EyZEVZb3BWSldq?=
 =?utf-8?B?MG53d3A0ZFBtUWZWUGxBcTltRFhTR2tJNEJieVp3azEvcUtBUXNDL3NxNjI0?=
 =?utf-8?B?WldxOXRsQWMycVRqMWc0NFFWYVoweTlvMWlZTjg1RjVQMWpCbDFUcytkLzBl?=
 =?utf-8?B?NmdIdVgyMG13NmdMSnpHd3d3d3I4QTlVZ21xejArM2NXNlhHcTZ1QktTQWFi?=
 =?utf-8?B?U3AydnhvNnByZWVFUWpVRmxWMlhrVlhnNzNQcE0xZ2ZVR2JQN2QxcVNVWmhT?=
 =?utf-8?B?RHZkWWxieHZTYXJ3eWtsNFltbHlHZThIcG9XY29oWTQ4MGcxNCtKc1N1dEdo?=
 =?utf-8?B?bVBTTXNuWDVUNDdLdDlHYTZHSnpDYVg5Y3pZQUJjb2doQXRrSlNXQytjM1No?=
 =?utf-8?B?ZUE5VVJBNzZ1ajQ0aUg1MlluNkxnWDd2VWZHTmlnenRaNUZrdUZyZ3RpQjhB?=
 =?utf-8?B?NTRMQ1FkQlRlVTNRZjJvOUd0N0hyRHI0bmZ2c3BHeEpZUXB6Tkg1NUdBM1lJ?=
 =?utf-8?B?QU53RGZtTlNFNXN4c3hqYklCQWFmVE9SSGtvQkRJM0p4Zmc5bjR5RlRGUU1F?=
 =?utf-8?B?REg5aW5HTlBsZGRvT2tTcXVYKzRnYnd4ckpPRFVxMmkxR2RwdEJQNmxaWTNQ?=
 =?utf-8?B?emdqQkhKUWVmbXVubFRKNndibTMyOWhjd0tFQXJmcDJMU1JNWUxtWXRNNmhW?=
 =?utf-8?B?Zm9zc3g1TVVyc2o5akdvUGZtOHhzc2Z3RW82ZFgzLzYxS1YyWUFkOVFRWWpY?=
 =?utf-8?B?UGJGNWdNZUdhQTd2Q3BGZjJjZmNDOXpRNFIzNkxqK1Y5aGFEWkFSNFpDbFlj?=
 =?utf-8?B?Y2hUNjRHUURsV09CdzZlUllWZkUyUWx3MUI1a0UvWkUxQXcxaW4yMGF6TmVn?=
 =?utf-8?B?L3JsdHFqbldLMElueUVLd0VwZkNuZDRlY1YwWjRPNzMwQ1FEa2NzQldJUGVv?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4efaa4b-bb83-46ce-8f1e-08dc16861ec7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 11:27:28.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5v2f6DZaZSQ0LO9wIDT2nNptN1YcBm8kSJ13BFRo2SFNoRYsyhTmF6xgWuhxsoh8psB2YX1KIRkjg7Pr/NU/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 16-01-2024 15:25, Karthik Poosa wrote:
> The GuC handles the WA, the KMD just needs to set the flag to enable
> it on the appropriate platforms.
> 
> v2: Fixed CI checkpatch warning, alignment should match open parenthesis.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 235d27b17ff9..5ecd9cd964de 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>   	return flags;
>   }
>   
> +#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +
>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_uc_fw *uc_fw = &guc->fw;
> +	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +
>   	u32 flags = 0;
>   
>   	if (XE_WA(gt, 22012773006))
> @@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   	if (XE_WA(gt, 1509372804))
>   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>   
> +	if (XE_WA(gt, 14018913170)) {
> +		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> +			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> +		else
> +			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %us %us %us\n",
> +				 version->major, version->minor, version->patch);
> +	}
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4dd5a88a7826..c281fdbfd2d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> +#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e73b84e01ea1..b138cbd51bdb 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -17,3 +17,8 @@
>   14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>   14015076503	MEDIA_VERSION(1300)
>   16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> +		MEDIA_VERSION(1300)
> +		PLATFORM(DG2)
