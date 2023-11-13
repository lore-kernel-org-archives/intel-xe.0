Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DAC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5A210E413;
	Mon, 13 Nov 2023 20:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC2510E415
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699906278; x=1731442278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RaMf9HRZy/MIGbkSxQ/mNrnwyNDx0XTG7V+L9mO90QQ=;
 b=aHFUx87qgb0AzCr+i0cPmnlQ6SBmFgSsBpQ1PbZ3l5aCVrak79Ti26DD
 ghIrHS1NjcXiEgNooYfqAzkT9mH8ZaHBJ65XV8hPIQn573LzJBjk/bOB3
 BLGwaSvnw0C4SccIlDGohGIdZr1xWN/jU1Xq5ua+h6UpBcYFrY51yuthr
 12ROndhEsVl0fxaHpxNZz3eo+MqGp7/KXTWCJOI8wDnN6k34L70pIfjMe
 mcTTb6axGrs9p6GxVyF8KYfjGW8dG1Nv5+gFgcX5Y2+Rikf9qP55cK7hP
 VjOptdQzEF0Y3XR2qdsY0iJh//FBiA00G5II5EL56Q+VufIoz531+4Yk0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3590468"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3590468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714316323"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="714316323"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:11:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:11:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:11:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:11:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:11:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+2BYaqgrShTA5i5+SIi8LGHAnm5DPmRFvEA84iGNUHAXNI5YQH+NUExIxsROR25rLiKYurLYIWrTa2N+PgCyuYYIKCbMKfPPYmycf8yJTi5JwDwklJlvBG/hz9IaAfQvSQiEOO4MNQxiZie7Ljg9LhEh9yQkVvCQxjoRblJXgZBiwzs7EQQcp+loAnTrXLbLmqIbnezgzfdjRgfnYFv40d2IdaG83kZ5T2ur6i2Dwvdz2iOYmMXg4jVwnRewhJlA4x+ET3LqoCcrK6rLhFBgqtzf2d5LW1L9vz+mX1ocSbHU/YC+mrAvftSooo28pYTQebxncHm9Xl+2owmqViapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzbACNvSaffve0lyF34yrL/EKBN/AlI0LTomMcVyfHM=;
 b=XdL7KHbLzkL/uZWWYSshYTE0P7766Z1diOk7wd5UTP+X4beEZpXMrK4v09yHbeibOIP+qTdpXLwAySpPq1BBsGBAKARFIVOix6pRKopnaysRBXpzjHjb3qqfunHl2AobDoMLvO5LDQ6UiNXX1hDqxBmwgtnRZyx0Fo4Ul8Vdn8yuLIp1EO1vAe37BCgdDf81VZog3sxdOJ/D6Auuo3PHF9oeZ6ZwTP3A/a8nZGCKS2ymFR/M1wvlfOB2JUhX9nI7JzNvagO7nnUcaCnNs7k3Xzn3DcVCRS3ZLsgy/NxrUOYVyQsL4Qhx8YCYS62koUE/fFV9mB7Qkm8JMCSUYVJTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 20:10:58 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 20:10:58 +0000
Message-ID: <2ee561e7-7396-4718-852d-f417510cefa9@intel.com>
Date: Mon, 13 Nov 2023 12:10:56 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-11-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbe3c6f-14a6-4d01-424c-08dbe484a651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WP48sgAqnuS45XHz4Anegdxb8RDhFOF9EBAl90tFPj6Uda0fwgwV2SVdBi/yuAdW5js/WlAgskJMihG3ZklFhhVUk17VUm5br06gDEXdIlgLUu43m0sIH09bEQwezqqqjZfHvb1mrhjpfNQcYftgUbRMhgp0v2XUzeJ/iztFTZPK2skrJ63y6y6Fdc9cpL5hNJwrnt7oiI5Fn2U3nZxD9aLEd9Yrj1i/+IMVsVHKxYMDrAEIyYhp9t4A1EVojT9Vg6PZLiKv27L0SEqvcbsCaGiv6a2hBKv17uhN97ohqO+9Q3bVrT/t9WG039XPEktXgRlhT0H7h85dhv5d0xnTmVVItYbQs9SHrdOpcp1uPKomvVHCgskAcKX8d56kaCI5IZIirtTXWOdVzKnLCYDbIzkMPbYBK11JQWyiWGtYDMY85tVfuQa7tMSc/GsVCI6bzuqYYX6c+lPISyVyNnld5QMwPO53LoAgnkY5d2tMb7nTCvW+1PtAUOh1rdD8c8t1wr0G4/NwH2iJFqTMGLLgdY6JMvAyAUWyZnUua7oIYgxMAzNwhI5IpuBVsw0YfXpdXiS5MznEP3Kxj/ktmEtJ6IbsxHlRPUyJcTDtsL79i8YlxOCtXauLSD25nBFvQNiIOIbrShP82KO+MTciYu1mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(6506007)(53546011)(2616005)(6512007)(83380400001)(5660300002)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(66946007)(66556008)(66476007)(31696002)(86362001)(82960400001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU92Y3B6S1liQ0FFLzdhbzZzOC92b21HUm5XNDZVV2pzdzdXVS9zTHBsZXhk?=
 =?utf-8?B?M0l5OVE0d2dWZUs2THR2bURsY05kNnZUVEFNY1k4TUVFQlFYeko5dWhnNDNz?=
 =?utf-8?B?UDZSRmFxM3VxRWFlNEdMS0libE43SFJYYUN1YW1wKzRidUd1eVNJV2pzdHp5?=
 =?utf-8?B?TkJwM2dhdm5qVENmbVpJdC9CTEJuVzV1bTlxUVkxS0dZK0F1TTU5MFdXYmh4?=
 =?utf-8?B?ZngvQ3JHMlVHbXRmVGJPNnNST2MyOEJ2U2E4b2hUc3ZmTkNyWjZNYkpMZlNY?=
 =?utf-8?B?ZWlLeU54dXVjUVVkZU9PNkRQS1FtN3VhL0tFRVNKMDZsZkxXQ3dINHdQWmVm?=
 =?utf-8?B?clp1cHVYZVdUVGNDMHhCV0xBQW5lTUo3MnFjNThFRWZlVlIrcm5udks1alk2?=
 =?utf-8?B?VTMyZzdyOW5zeFBJYjBuRm54TEl6WUliWVBIUW0zM1I2Z1RMZXlSWG5LNE9R?=
 =?utf-8?B?WkpneHhVQ2hqMWRaUlJwZ3Z4Mmw3WXhPenorQjkxSHVMMjNjVTFFelljc3l6?=
 =?utf-8?B?eEN4dnU3YWVXU1hoUjgyRWRJOHE4aTBNcU1VT3RuS0NBMlhhZW5HUXc5VUZq?=
 =?utf-8?B?NFE0NTZXRWlqZHltL09sL1FIeHdJaW96ZXF6ZUs2SmpqeEhaOExTWVdTaWcz?=
 =?utf-8?B?SVZGK2RpS0xOZVZ4U3lZMzdyTVRPL1hxb0VRQXdjQlM5UVBGbVhNNXhybjlM?=
 =?utf-8?B?MXdxekpYWkxZUko0ZWZYTEo2eDN6ZjkvQmdkV0tCbjBCdEhMQkNSS0l1eW9C?=
 =?utf-8?B?SG9kZDZ3Q1E1WXdobTE5bERFa1h4djVUOTFHYVQ1KzJlRlNuM05zTXA4SUdx?=
 =?utf-8?B?M0w1NWNCR3RNaXl1TEZmTUFCMmE0b05xMmhmV2diaTMyZ0JWbnRxY2dsODZC?=
 =?utf-8?B?SWNLVEY4OFk2ZDQ5UTNNWHBRdkd3clM1akxjYTNJTm02cjFJWGI2ZFpMaDlW?=
 =?utf-8?B?YTRtcnEwZEZUaTEzcnBDNjlYc3IyenlPcSt4RTIxM244T3hyUTI5NThuMzNv?=
 =?utf-8?B?QzhtdE51OTc5K3lRU0pmUVRreitLekFOcWM2UUJQdzVvM0dFYzBOQTBYeVEw?=
 =?utf-8?B?dzcrZlV6bDFsd040MHBXRGpEd1lVSFhOa0Q5WFJZbkFxS0Jwem10SHE1WUlF?=
 =?utf-8?B?YlZHb0RJaWdlZ3dSZFkwWnFOeFR5c2p5T1pYaUYzU1ZqSkJnNUM4d282RGxE?=
 =?utf-8?B?dVk1bXIvQzkwemNLcFQ5VENZZmc0VHppL3Vrckg0eXVPeTBKRXJzSDVGeUJ4?=
 =?utf-8?B?Qmc0b0pOV3BKYURrOGFKN3lETFpZdmxhRnVrdEZqWU4wRmsxallvcGZMVXNs?=
 =?utf-8?B?TjYrQllDMEt1eFBabndqM3U5SHdlR2RmamFET3dnSnpTSENFUGxmMzJ0Q3ho?=
 =?utf-8?B?TnZsRHhKdGFFQzJnRjgvdTZ0cTEvM1ZHdnliSlNUaVlOOWlOZTN5ZXJDcW9Q?=
 =?utf-8?B?Q1p2R1lPd1J2VFMzUlBNVUIrSk5QdVlUN2FCc3dGaWZWK2xhNytBQWY5cHBv?=
 =?utf-8?B?N2lZWmxNbEgrdUxPSUVJRUZGdzF6NExVWkU0cmc5YjJtYzI3UkhpK05MVSs3?=
 =?utf-8?B?L2o1T1QxbktxOTgrbmRrZzkvNG1OeE5JWE1ZQ1gxMWMySTlsaDZuaVozTmV1?=
 =?utf-8?B?dTZxKzR3ekpZWXpxbWtBZmMrV0VYUFF3R1JuNDE1RlFNV0NXaDVwWkhacXhR?=
 =?utf-8?B?QStsVDdib1Vxc3lXQ3loM1JDODlmY3FDYlZjWHI3aUlucG1Vb2ZtQ2NjOHdH?=
 =?utf-8?B?RVY5VlNIOUU0YStnQSt3dTJUSDdUblBUeXhIM3IxV0RScVRzRXowb25PbjRi?=
 =?utf-8?B?aFBjM2JMV1NCek8rODVwNkJGeER0NGVScGZpdnFUTDdzRmRLT0RkNTMwVWtx?=
 =?utf-8?B?Y2RxcXhZVUJPbzJlRE5JNTEwZDhXWituS3FlWEZKdDUvaE5uME9veXlaVy9Y?=
 =?utf-8?B?TWhaRVI0bElFUHRDWjljRGFKcGRuSUNrS0EzK0NtL1dhTSsvKy9KdnFEK21X?=
 =?utf-8?B?TUY0SS9XOU8zNkxZMlVxMmlEUHlwYUhuTjlGZ0xLc0ZESVlLbnJzVmdkUVZt?=
 =?utf-8?B?T3BBTnk1UEtqb2dLbTl4Q1BoS25OTDRtSXNVNVJmaDY3OFVjY1dYU0J3Zng0?=
 =?utf-8?B?cWQwRVlXdVY1ZkorZjA0OVdzN05qM0xEVDN4UHVZUks0dnFVRktqOCtYOUxT?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbe3c6f-14a6-4d01-424c-08dbe484a651
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:10:58.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPhPVleky4xIvLSGtTaTBbfOEl8IewT3Kz10pEek80/ojHyTNfCrpZIzBGqrVlUiH1tf79sTMX5tT2pFR9EQQ82K30CM+nZiu0H2GwNBRNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/12] drm/xe/gsc: Query GSC compatibility
 version
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> The version is obtained via a dedicated MKHI GSC command.
> The compatibility version is what we want to match against for the GSC,
> so we need to call the FW version checker after obtaining the version.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    | 39 +++++++++
>   drivers/gpu/drm/xe/xe_gsc.c                   | 81 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw.c                 | 18 +++--
>   drivers/gpu/drm/xe/xe_uc_fw.h                 |  1 +
>   4 files changed, 133 insertions(+), 6 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
> new file mode 100644
> index 000000000000..ad4d041873ab
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GSC_MKHI_COMMANDS_ABI_H
> +#define _ABI_GSC_MKHI_COMMANDS_ABI_H
> +
> +#include <linux/types.h>
> +
> +/* Heci client ID for MKHI commands */
> +#define HECI_MEADDRESS_MKHI 7
> +
> +/* Generic MKHI header */
> +struct gsc_mkhi_header {
> +	u8  group_id;
> +	u8  command;
> +	u8  reserved;
> +	u8  result;
> +} __packed;
> +
> +/* GFX_SRV commands */
> +#define MKHI_GROUP_ID_GFX_SRV 0x30
> +
> +#define MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION (0x42)
> +
> +struct gsc_get_compatibility_version_in {
> +	struct gsc_mkhi_header header;
> +} __packed;
> +
> +struct gsc_get_compatibility_version_out {
> +	struct gsc_mkhi_header header;
> +	u16 proj_major;
> +	u16 compat_major;
> +	u16 compat_minor;
> +	u16 reserved[5];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index edf74780322a..63323a53f77f 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -7,10 +7,12 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "abi/gsc_mkhi_commands_abi.h"
>   #include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
> +#include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
>   #include "xe_map.h"
> @@ -89,6 +91,77 @@ static int emit_gsc_upload(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> +#define query_msg_wr(xe_, map_, offset_, field_, val_) \
> +	xe_map_wr_field(xe_, map_, offset_, struct gsc_get_compatibility_version_in, field_, val_)
> +#define query_msg_rd(xe_, map_, offset_, field_) \
> +	xe_map_rd_field(xe_, map_, offset_, struct gsc_get_compatibility_version_out, field_)
These have a very generic 'query_msg' name but are very specifically 
tied to the compatibility version query command. That seems wrong.

Otherwise it seems good.

John.

