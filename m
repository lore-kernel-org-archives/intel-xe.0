Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A2C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1510EFBD;
	Mon, 22 Jan 2024 21:54:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66B10EFBD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705960485; x=1737496485;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=v5eeGQLXgTa+mkGaDA0GK5AJt6YlVmr6RyGE704Z7l8=;
 b=O5joyDTPocd9VzBa5kZ7LS7382O5i2ttT0rJsbSLRj3iTdZ4l5EDaNlI
 7uEk5snWeyqYsGbToo92e38No6o6OjkM+labTXsLO71m6YuXfThOZY9G3
 yh37bvFB5xSwKNsYLLJrI7zZoCtntyu7tpPQzbxQX6F8nmN32/4IOGJqY
 qJG33ElsaM/HGFmYEBK11Km9T1p/iWEacLhy1XWaX0SHqhVqq0npQ1yOc
 G4LM6oTkPUv6j8YpCXk8QCxAQzJbKfq+VAIOufo/ILcXpwQwuqY6neRf9
 PEctvctRQvgfwpFL2JRy4hHWdm6pHmKUoVL2XxtXlTXgC6TlkVeo0UQVC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="405093356"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="405093356"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:54:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="876099560"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="876099560"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:54:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:54:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:54:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:54:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6eapRcFRwIxLIrQLkYbYmYQdqXst9B3T0mM6SkpLsuDPZqyeybSd9nuZkHmcDpY+RGpqQ4Xr0cy1mCTQPJL1gMD2edZHSvIZ1boErd1qxEZGIyP1RWTScjV8SCeoEk9tdMH5MTDvjKzO/JUoQlt98uPQQuF+50ErXYlJ8s75vh3C9KGS5FvmqhjLcD9D5rBhAvprKZB2FY4SwQdFRUD0/7BHikM/ujJrFxlzzNcu4TkkqGlcLJmUXzs0QnUck3Yxn3YSZTUcIvApHR56AfphYp/Q8qH5XekM1ORb276nbVPqSfhloemw3fkfSt8zEm8jIOT6jIPOpFDzamfX0Mrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HIXupZz6gDPevcYFB+m30i+K+ggyyWYR5dz7hVxjck=;
 b=eQFgHOo2Tg/Z0Co/edY0QKmV94gQGVgn69N9U0ey9/AEDjRwbdjWZ+JMZ+9jV4EP5jiE9+szPyn8U9UVyRUhvDnKSKBKosM6cpDDyEZ8ItEO3bGqgIUUO4XIVuxKiiZOuyDlV1yTenfjBCJra37tN0s9d4NtRh9/ANXklbMInim/yZTCaDTcMhuP2xlv/4kxSrKK14nklenJ2wy1fcROtg4FYV/uXTvlfvm+gDOY0tdA1xtH1FiCT52w9q2ihAXy/KaDI8Yz99U1JcuTLV61V4tggidy0YqHNc1esd1fYp/gl3YNlhLKlZulGzRfz14MFGuBhwwP/FSDCDOCmEV8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 21:54:36 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%6]) with mapi id 15.20.7202.027; Mon, 22 Jan 2024
 21:54:36 +0000
Message-ID: <8b05ebb4-c8db-41e6-9c27-219b39a8e2d5@intel.com>
Date: Mon, 22 Jan 2024 13:54:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Add status check during gsc header readout
Content-Language: en-US
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240122063545.495082-1-suraj.kandpal@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240122063545.495082-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: ccebc5fc-6104-4528-3776-08dc1b94b972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV9W8taeS7/9it3MurXOjRsof8M8EF21VMYc7iPF6kOGDucqVpSfwpFkxCRqXNVR9qOo4SW2pb71JXGAbZzSrTPN5k7YLDdBu3/CjV5hFMJt/557JPou5AswvJO9B8kAFZ9wFgG3kh6rYbceBeeyofstVpM/rPulH8fZHhlimiMEU+GRHYzAQtTxP6Kvwq+Y7FLjmVUZQX+GpiFwQz167oMdWHqsu8iQpvgZHkcZ/gymPjKg414jrrFC4DWPlgVUcjstTT7BbonJ2PjpQqURwgCSuK2157gMAfxnCzq+8jJSjl0PTAfvmtKLAL9E9A389nPvkh9E5qB99s5E9ula7mxR94FOCZ0Yf9OO20IfBvTxYg2iAKaPu80XBB1ueHPsQxufD0uMNLEqtPuIDcfKd7QTpjWuFKfHKno/gsHFLJLC2JRh5igiIcA4LAE/2UNNi2QKy9fqLl9t9LYRwJqDcmvEaJfL00H5Z59c/eo/yV7LP4/J3CTwddkr18tYkVPYaL60OQmWfv8mQUXfiS7gkYwuCwwcFs8cU15XPtG5CApsBJBLIPK15E0kqICebJXpZuE2Z+IaU5225Jy1yFX1hkvUuz6iuikJDquHmvR3wEbKhDwfh0Rmj6Qu4GJL8f9aQG+4Pj9YmcpPprtlwKz1OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(38100700002)(8676002)(316002)(6486002)(8936002)(66556008)(66946007)(83380400001)(66476007)(6506007)(2616005)(6512007)(6666004)(53546011)(478600001)(41300700001)(36756003)(5660300002)(2906002)(26005)(31686004)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThRcS9PN01nUUR0M1ZMY2lSUlNUTFBEbUpNNWljNHIrUjVEb0EwcDBXNHRj?=
 =?utf-8?B?bHB0NFR3MHY1OTIvZytKRHYvVEVybWdNc04zcldQMTdpazhaQWlocTBJRXBK?=
 =?utf-8?B?ZDZxdVlCWk9DZk1wdy9tUlRhbWQrVm5teGpKaG4zY1J0MFVlU1dzTytHdEx0?=
 =?utf-8?B?eVFOSGtJeFdIOUlhOFZVMVh0Z1dNNTlZdmYybWlkaDlJUXhsYmMzczF3QmVU?=
 =?utf-8?B?MXZSTERmOVNZOVhoN09XUFN2Nm1CQ2hDK3Q2V1VBUk5YeGM3SjVjSWNvZ05J?=
 =?utf-8?B?SXZZaWVuUlA5bDQ2K3BDNjNVNXdDcnBGeG43WktUSkR6MEZnU3dYby85bmxs?=
 =?utf-8?B?N1NERWRsL2hlTFJBMVlTSGJrKzBRU2JieFJjWE1peEhkSm1jYTFvalQvQ1pC?=
 =?utf-8?B?SEpPVWJSdTVESm81OUZEc296NEE1MmVSM2hOak1lU2RGNUd3dmNyOEtTcVcr?=
 =?utf-8?B?V2QzRHFRUXVvVHozVkdDM0pUM0NsTVVESU45K0k0Ykw2aEhPZXZUc0t1YlNl?=
 =?utf-8?B?TC9oL2FydmtrMmIrNVRVWHZaMW1EbTV2eWpld1M3ekljQVVnL1ZWekM3amo5?=
 =?utf-8?B?TVQ2K29tOUJHaTJUSlE1V0pnUzBQczhndzNENFNpcFE5RlRtaGVCVWZGdkkw?=
 =?utf-8?B?U3ordExXcnVTNEkvTktabFNpdVZyeWlIU0RJTkZhQ3h4c2FidEdhaVV5UGlH?=
 =?utf-8?B?Z2hseXNka1V2dU5CaUtPVkl6dnVVWmsxT204TG52VUdWUHg1TVI0cEF4ZHlQ?=
 =?utf-8?B?S3IycmVhYUpWejUrYmswN0RlZEw1NWhsWlJtSkVqVlVNWFNlU0dleUZHaFE1?=
 =?utf-8?B?RWhFRmxzaXBwTndNRFFhL3ZrQ1NyRk9jOVVIL3pmOCtYVmgxc1RzTlJsQzl4?=
 =?utf-8?B?aWo1ZWtWSVNoSGl4eU9LOU5oM2dJVGh0VTJFWEZxWGZFazE3b2FvMVlDaXZn?=
 =?utf-8?B?YllER2o4M3ZSOGxUVUJZWHkxdjFldklKUUdnek16dmRRUXhrc3h6RFplcExi?=
 =?utf-8?B?RFZtVzNLRUwxRXNEbnVRREpTVmREK1hmN0xyUHJSTVRMNkQ0Zmd4SldsNzht?=
 =?utf-8?B?d3pmbmplQU9uTG8xVk5vZWhXamMvOWc2ekJlUC94dDM1MjFhdUdIM0FaQ3Ns?=
 =?utf-8?B?ZkVZM0NmSm85VjhYQ1RwMkpTK1NFWFZtbVJweDd6eU1nd3hUaEJ1K3dqTytN?=
 =?utf-8?B?NlBUZFg0bktERmVPVU8wdXYyS3Fadjk4QVpmd0FsMTdYcVR1WUkvQ01wSnAx?=
 =?utf-8?B?Tzh0OTk2bDNMWHJWc1RTcU9yZHFMMkVVaTNPaGt6ZmpqSHk5dktqbG9LTy8r?=
 =?utf-8?B?dnZ3OUQ2cHcxZi9xMitQM3JvbWJ0NzV6Ump0U3lIa3hLbUpWV3lLeWlYOXV2?=
 =?utf-8?B?UjR4SW05M1JQRjIvVFRlUndUaERESSsxZjZ4dUd5WURkT0RwNFpsTlhrY2FW?=
 =?utf-8?B?alk1blZQMUJpWDJ5aWFSeEJkdTBxVURYWWFWNWpkTEhLN0dzbUUrMUp4em12?=
 =?utf-8?B?MXI0eG1ZcHA4MzlVR1FOdU1MNWM5cEZ2L1RyOHhXSjZYU0NTOHdsZ0ZqRFJo?=
 =?utf-8?B?TTA1N1lVSmhyalZwMHd4T0lDS3QxWmk1eFJ3RzRhUW5uQ2hNZmZHTng4di9B?=
 =?utf-8?B?R3hvRXZ2UW5CZXFQNnA4cUxHaEFJNEtoMTVOdit4SGRSc0Z2Mlg2NUwrZWVo?=
 =?utf-8?B?b2VCY2xITFowaldGcDV4WTB6ZzBxSGNSRXlVNm8xV2VxS1lZTERSYVovbGhL?=
 =?utf-8?B?TllFMHhkUVd6V29rSk9xWnZxK1hBejBzM1hwVWNBU04yV0Y0cDA5RGw1WlJo?=
 =?utf-8?B?Q3dNN3hVZklaWG0yd1VCRFZLeWFuZDRCdHNlTWZ4RGlHV3F4bXFYSkdodDBK?=
 =?utf-8?B?OS8xTWN3NndCODBuRVJ0bHhydmE0UlpVQm5XSEhIblVyTS92WlNsdkt0aW8v?=
 =?utf-8?B?NkRnaDNoTUVTdWZod2FxM2pvRE1uQU5yaWltVXFRekx3THlCSVNsekJZN1pi?=
 =?utf-8?B?RW14MXBUanpkazZnOXlSdDdHc3NoUlBnaEhGWXgzQkJnS1ZJTXdBTDZ4YU9W?=
 =?utf-8?B?WUNZRWRzOGpsalljb2g2SW1FNnljNHNtQWpJWkVwVGVWSHM3aFZnMVR1RWJY?=
 =?utf-8?B?MkJmRmRKVzdnZ0hoSGs3SFFYSE1FOHUrRENMSEdCNzdBWUpkamRIRlFidGxi?=
 =?utf-8?Q?GDZbPgtYFF7UivW7ph5oyCg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccebc5fc-6104-4528-3776-08dc1b94b972
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:54:36.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jl87CoSLlgXGFRosP8ACcK5Q6+bdooJfouO9PvqbWIHbm2wq6Y/y0wtxabLkvXPygznDKYWtO6v6YYmCqYZI94DU5U7QMUIK9IMpMLmGPdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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



On 1/21/2024 10:35 PM, Suraj Kandpal wrote:
> Before checking if data is present in the message reply check the
> status in header and see if it indicates any error.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc_submit.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
> index 9ecc1ead6844..0ccc6d52dd3f 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
> @@ -125,11 +125,18 @@ int xe_gsc_read_out_header(struct xe_device *xe,
>   {
>   	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
>   	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
> +	u32 status = mtl_gsc_header_rd(xe, map, offset, status);
>   	u32 payload_size = size - GSC_HDR_SIZE;
>   
>   	if (marker != GSC_HECI_VALIDITY_MARKER)
>   		return -EPROTO;
>   
> +	if (status != 0) {
> +		drm_dbg_kms(xe, "GSC header readout indicates error: %d\n",
> +			    status);

This should be an error message (drm_err). With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		return -EINVAL;
> +	}
> +
>   	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
>   		return -ENODATA;
>   

