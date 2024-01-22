Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEC5C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7FF10F078;
	Mon, 22 Jan 2024 22:15:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBE510F078
 for <Intel-Xe@lists.freedesktop.org>; Mon, 22 Jan 2024 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705961724; x=1737497724;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MpBCulDKVSbIwEejKkWEI1cMYwYHaAAGIfUYvgWK6TI=;
 b=fKJ54PFxBR6pt4rTFV+MjHIbvPM23jACSgET3EPvk0fq598vzjwLD7rP
 q6XuoXDTSy/voW49MKw3NGAHISsWxuVF5jeORGqXjGP8O03JyvsbDaiBp
 F7LVA8rNqp+2CvjgjOFG49ox8MqmZ06drDrEjcY1o/kfvqY14XLQnxiCX
 7Ne0B2SI14mc2M3maMVb33iJWvrwdb9cKU7IHz61kArgrPKiK33GOf4US
 OcPutiAbglABDgY5y9PalAlYpB/niN/7mXh9PcHtjcNZX+A8Q6oocxh6M
 FSJdT2E54+gfaJkim3P6HPLuu33V2xOGYGQXRjZZeqAT49bNZkiUxM9On A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14684851"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="14684851"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 14:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="876104841"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="876104841"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 14:15:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:22 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 14:15:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YENSYbHv25pj9VTHn2vN53ciPo69Nuha78ryrlZeeTtM+wXnrOTx1jsHZwDNSZjcd3JfLWKAKiY0qMwmwvrtzZrrSPZ+gV1Wc4Lok/WqDXLiGlEaRJhmjn3zbe35CLFO1zNS+L+7lBIXc4OMdHDzpPhKmWggO6UTuzzZlgvbzOKw2DbRRt2PeimGBy8W0Dgijq6Kux877+6EBsrkKnpiPDImKlTiP83uaJ0g8tKNWdqezEsmMAdPFIR4fufyafjsF8l3tg9Ooq9EHy3LeXb6FOUJf7+Ouy1G9CSWZKzRJfqa0GMMQdEDELkiA9H67eAXAp6UI/BI6VK2lI8cp0/nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5Uer2B7/zmNUUWfPAVRT6g0TGjSx8MdVc1YWMjjHwU=;
 b=NXqJ3Ri0ZszxJLeuHhRZbBNxFMFZP+DsNKBPzn+ANzn+/wItK8igum4QaVG2G8l1GxjjQUsPiXjISocb8hSXZdbnXhHi8NA7HccKmV3kB/cKuIfbZ/d6g2U9tdql4P6IBGCXwha5ZqNh54Rswxf2yJMKRoV9ff5q2G6MIQPcBuIPozFeTIwphzGwPmbnEuTce6GfNRQOlNI0smOCAViCQX7B6nWJi0Mtwk6yfjtzcksUymGIE6CvF8YRNg3O9XebG2YOXxDJRVGRE/+UYvkypIikujD7lfYpekJlNtaJm+yXjlGbGBNYA0YtTr1QnwYR9g5nBu1yVLvlF6xwOpHxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Mon, 22 Jan
 2024 22:15:19 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 22:15:18 +0000
Message-ID: <08818e71-c687-48eb-9c38-2d28dc4e08db@intel.com>
Date: Mon, 22 Jan 2024 14:15:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/uc: Include patch version in expectations
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-2-John.C.Harrison@Intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240122213708.1841488-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d7ff42-d08a-41d5-7aeb-08dc1b979e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6V01Smem92g+mYhDGw+ZOE2/hILL8LuOrO+KNJlVIoVSMYQqeW2Lft9ckLDWYPDF4LMwB3zgO1LW+pTZeiJicNKSo/Fc+LeT5ZXNqeRLnsjBWJApdjWoidA/PoStsiJOJnDzKskbqplmz8IhHnk5G+MhjnIbaf3dglUUhB0ZVx6xn0aX1yl2m0t1+gl/vFOLxEGifCNLATz0PRYxY1guZSc9lzNeRjZpPdHcKInDUlxaIrU4DKwFyHpd+LiGTtEIeS90YdzpsstURYOfFNXCk0SfvUioPMum92IVj7yk9gRvIJN+hFgxnnlVz2TPcJiw20C1c8XHf8sZnNeJdfjdApgQeYqSacWfTCidaNLZhw8iWaH31ELuIm84eKfbgz4TdK/Be9m93857kRtzKdcD+h+QvX9AKAuF0RzUVv1nCr5q9VB4WQLXBmvoJnayovP7OneKnsMkjHJkIvhM5Pg3c5iaS6PW9NX/+lOjRAfCe1TSLCrA3XxrDrTVvL5w/JEAl4POVPSTD5bGH6F8M4NIKPIpMm0Y4i/a2AVOBt3mxMjOYupxd3e1VFEo5g+og3+/0sNZAKaiegTuh7KXDZ5nasu1bcxfoac7nGyIpZbhjNCvpYo91Bd6uMWRWqO4s2sao3RhGePun+x3yjD9yHgbKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(38100700002)(31686004)(82960400001)(8936002)(8676002)(6506007)(26005)(53546011)(2906002)(36756003)(6512007)(5660300002)(86362001)(6486002)(66556008)(66476007)(31696002)(316002)(478600001)(2616005)(66946007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpTemJLS2YyN0ozMWZtTTE5ODB0YjdRcVNFNG1WQ0V5TXBXenFVZzZCZjNS?=
 =?utf-8?B?U21kQWx3L2d1dlZULzVxbWRpR1FxamJ5ZE40QVVIMnVBNVhZZjl0ZC9hUlhE?=
 =?utf-8?B?Z3pYdWtLQWJReGQrbGJFb2JtdXR1VVBPMlFLN1JVN2dXbzRzOHlCaHNGM1dJ?=
 =?utf-8?B?WDdxYjlIUk9OY3pLTDh5YWs5ekIwcDRHZTdsZndMcVVoZldzSXZwa09NSmpF?=
 =?utf-8?B?ZDB1SXB3Y1IwZVZ1anl6cEJhblZuRXlFVlRTUDVyc2RBTWRBdHE3dkEwRkJa?=
 =?utf-8?B?QVcxKy9GSDJsbVdBVXAyeUprWXJrZnozTGlHQkhBeUZ5Uk1nWUtQdUJKOUJt?=
 =?utf-8?B?WFFwZERGNGx6WGxmM2hpelNJaXJxck5SYk44WXVES1J5c1NlUDdGODkxZHZX?=
 =?utf-8?B?MlhxVFZ0Z0FmUkdqMUJWMXMxVi9LMWR0VG1NYWtaamxJVVFiS051MU1xS2Yr?=
 =?utf-8?B?Tmk5aGNoQTFxL1FBcFJIci9HMTJDWlBkSDUycFBiRjlPQ1BuMGtrTkVmbkll?=
 =?utf-8?B?SjdFRHdNeE5BdGdKSWEvVFFPMWpsL1pnZzZDTVN3QWJBOTc2aFVhaTAreEU3?=
 =?utf-8?B?WXB6NGdaSXA3RjF2WHlPWnRIa1ViRzZtUENPVUphOGdIWDN4SkdrSk81dXdZ?=
 =?utf-8?B?ZVo2RUtuS254ME9jMTVqbGQzZmdsMFFDTzVYMEU1Tm9YWk40TnAvLzB3dytB?=
 =?utf-8?B?UWJYZGZDc1BsbXlnbUJ3TWczczY5M0lNV0xrZ3RJbFFFTVZ5OWJKOHdlY2Zj?=
 =?utf-8?B?MG5KUGpXVndGbnprNkFlZXhPOS9BMFpZRXpoeC9tMC9lOVB5eWZJK3JYYm45?=
 =?utf-8?B?QS9TT2dJczZtcVdhSUVnQ3d1aS95M3RySjBaY3piUHU4Z0ZwK01PYjhwWXkx?=
 =?utf-8?B?UUlFL2hhMmU1RlRXNEMrcjFGWkdjaXg4VmVVU0JjVWRHbGwrZXRJZ0JUaE9Y?=
 =?utf-8?B?N1lDZ0N0bnV6a01aOG5BWWt2cWdncHZTSG9FaW5XQmh0R0VvZGRiNDJoWFBk?=
 =?utf-8?B?cE1GVmkvZDZibHdvckp1ZnI3N3MrZ1pNMUxLSE9lRHBZMEltSmcyZ081cEpK?=
 =?utf-8?B?cVFGcWRUdzBmUllWeXMvYUtQeEVYRW5DZ0l0eHppSkMzOExXT0NHdklEcUIx?=
 =?utf-8?B?N2ZCTk1qdWp1ZGFnVk5uMDFXdFg4TmlraHJpS3pMQ29jeWg2T0x1K0JuYkdv?=
 =?utf-8?B?NVI0cFV0SjhSVmlOSktvbWIvL2FiYUFKVzlhUzkyVEEvcmp5bVJBWEtyeE43?=
 =?utf-8?B?Zm5LaGZpazFab3ZsS09DYUt3TlFwdEk4d0Q0LytCampEeGsxN3pKL3FSb0Rj?=
 =?utf-8?B?TTVZcVFLNXJnUm41azFnSWRERDlsY0hMOHlDVXRFcmhoa215eHoxSjRGait4?=
 =?utf-8?B?VVh2OTViRzc1RnNvYzFXUTN4YXNBbGtPMnpGZERkQ0I1VjJ3R0Fadzd2ZGNW?=
 =?utf-8?B?a3NZaC9tYklLajY0R3hIdUJibVRQQW5jTmUraW1oQTlGUkIxc2lCMzZUZDhq?=
 =?utf-8?B?TnVhY294KzloTmtJQU5KLzNPWFRPSldNTm5ZVEJVeTM1REFXOWhXNDlrSFha?=
 =?utf-8?B?QXlicWdaQnN3MHR4OTZxZDdTUGpGS2IyNDJpcEVTUDQrOHk5U0xyV3ZMdyta?=
 =?utf-8?B?cnVoTUJud2tkcTJHeUY3ODlDUFJXNVpaeFArdnVHY1NYUDdPTHpXRVpRMFJK?=
 =?utf-8?B?T1dqQjU3bjFzdURMdkFtalMzd0prVS81aW1FazU2MERuVGVydU5NTDlDOFdj?=
 =?utf-8?B?MTAvazR4OVlPTG1kdS9pNUJPbkt3eG9XYThrMk03b2sxV3IyMFpZY2JwQjVo?=
 =?utf-8?B?OWFEczJEMkU4UnVWRE9GVUQvODh0QVVOakNTT0loZ3A0U1RGNjlkSmk5bjJO?=
 =?utf-8?B?dk8xM0FCcEpHLzRKdnFveVFmamVqV1JPOWVITnRPd2RhRUFtbGh3UHBsZS9S?=
 =?utf-8?B?QmtvYm43WXF5NmtTcDBsWGJnVkZYMzhGazZia3lqcUU2NGxuUm04SjZNVVhh?=
 =?utf-8?B?TVpPbjZaU09VWkN6VWdveHM1ZGRIbi9ndGYrUlpmMlhrRDE5S1ZmSktyRElF?=
 =?utf-8?B?ZjlmVjR6NUNJckFtTXo0YndPa2hOcnVwdmUrNmpLTk8rUzBTZnF0Rk51MkFw?=
 =?utf-8?Q?GNnfIJKcVJoxpyliKVcdzesqZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d7ff42-d08a-41d5-7aeb-08dc1b979e0f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 22:15:18.6516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N6/K1S7JRZeczwblN6jRqhExQ013pWmSdv5F/NAZrYw+7BlsuWrvDO1cmd0txHy0CVo1nN6cMuOZgC74ZNCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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



On 1/22/2024 1:37 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Patch level releases can be just as important as major level releases
> if they fix a critical bug. So include the patch version in the
> expectation check so the user is properly informed if they need to
> update.

Reviewed-by: Brian Welty <brian.welty@intel.com>

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 49 +++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 9dff96dfe455..d3f0fe2101a7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -92,6 +92,7 @@ struct uc_fw_entry {
>   		const char *path;
>   		u16 major;
>   		u16 minor;
> +		u16 patch;
>   		bool full_ver_required;
>   	};
>   };
> @@ -102,14 +103,14 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
> @@ -121,24 +122,24 @@ struct fw_blobs_by_type {
>   
>   /* for the GSC FW we match the compatibility version and not the release one */
>   #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> -	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0))
> +	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
>   
>   #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>   	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>   
>   #define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>   	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
> -#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)			\
> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
>   	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
>   #define fw_filename_no_ver(dir_, uc_, shortname_)				\
>   	MAKE_FW_PATH(dir_, uc_, shortname_, "")
>   
>   #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>   	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
> -	  a, b, true }
> -#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)			\
> -	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),			\
> -	  a, b }
> +	  a, b, c, true }
> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
> +	  a, b, c }
>   #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
>   	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
>   	  0, 0 }
> @@ -221,6 +222,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   			uc_fw->path = entries[i].path;
>   			uc_fw->versions.wanted.major = entries[i].major;
>   			uc_fw->versions.wanted.minor = entries[i].minor;
> +			uc_fw->versions.wanted.patch = entries[i].patch;
>   			uc_fw->full_ver_required = entries[i].full_ver_required;
>   
>   			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> @@ -340,19 +342,22 @@ int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   	 * Otherwise, at least the major version.
>   	 */
>   	if (wanted->major != found->major ||
> -	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
> -		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> +	    (uc_fw->full_ver_required &&
> +	     ((wanted->minor != found->minor) ||
> +	      (wanted->patch != found->patch)))) {
> +		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u.%u != %u.%u.%u\n",
>   			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -			   found->major, found->minor,
> -			   wanted->major, wanted->minor);
> +			   found->major, found->minor, found->patch,
> +			   wanted->major, wanted->minor, wanted->patch);
>   		goto fail;
>   	}
>   
> -	if (wanted->minor > found->minor) {
> -		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
> +	if (wanted->minor > found->minor ||
> +	    (wanted->minor == found->minor && wanted->patch > found->patch)) {
> +		drm_notice(&xe->drm, "%s firmware (%u.%u.%u) is recommended, but only (%u.%u.%u) was found in %s\n",
>   			   xe_uc_fw_type_repr(uc_fw->type),
> -			   wanted->major, wanted->minor,
> -			   found->major, found->minor,
> +			   wanted->major, wanted->minor, wanted->patch,
> +			   found->major, found->minor, found->patch,
>   			   uc_fw->path);
>   		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			 XE_UC_FIRMWARE_URL);
