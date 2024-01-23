Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2898C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807E10E7EF;
	Tue, 23 Jan 2024 17:58:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9110E842
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706032722; x=1737568722;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gkGiR43DjRfjxldFj8OntUR78lby3tr/jpSgsDoa0As=;
 b=h6yY1JIZVio7hW7yyJBqrLuZNesGRa90l7ezUBftszY+j9/4/Ol9anmP
 ptO4yws7jb5Q8xS26+yJNN7OrGplDlEX3JWA7vZDNoj7iD+rqp0xygAgQ
 QjMUDbplTCANL/WThjD7XqokHxS4P31l7jHEnqxma9ik4xwLDXP/r+Zn5
 6q+qut1FRtrKU5p/k5unooK0EZditMtGv4z5fgV4FdfKMI0uJHQdVAbgq
 T08/7UlptK0JQ+hu0qh2JOgNsBDMucqO1Sr/AZv9riTUxQjP0WYKXycEv
 da/zEPjGXWntEvJackAhUpjaoN0dsZGUx3KblqO+OgarHW+22EnUsg+x0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8994277"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8994277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820178557"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="820178557"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 09:58:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 09:58:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 09:58:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 09:58:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 09:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilw2FjhO9IS39KgQFTMoEv9ghDn5daPwjjsaXFlg5UsK9ImClOl3s0gjnETmTvKIhnBGE018Nf7r7a250uA9NHgBFlR6oiuKl5ltgNPejF47KSu08QoKKc5SIm74Yk6FpVX7tFCKygMcm4w2LpRAKsTHxpMhaHQ+UmXqk4hqEtaLRPLPqVip/QaihYw5Bq104YSsxDvOVsd566vq2YyiPSqAJnQURmmcxFvY1fXW+5Bp0oCADFqn0h6ULozazUFuL+H+tjGLBKaWcgFSeexR76Oje239hUHs/RV1iNzTnaoL3SpL8zH4uV9u/33EiIieawf+YJL2UEMygeaULhSeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iJ+cjLRMJO9OAAKQ3kQSwUNry1m3OahRjblLa8XFEc=;
 b=AkB/X6e8wLBznBmkArDLvoDSOF6mHIu32RB7Ik2GbQd12wFW0AjJgc08V35Uj/EXQrjzITJAgm/4mwR8SeF4NjXaryDEVw6xJCR0ITlGsI3n1WRbxfUnByCsHKmfoS4eOvsVn/9Fbg4JMGeeMiLPwM4i5qX0kQJPnWYdiJCzBnXW62pWTfyuEpOw/AYD+VMgioYUuXZenSEJQqv4HsW8NYdX46EEEbfxbp/nzKkXc3eMq77eOBMMQjtdt/94MIfj5yAnAr5CQos684sX1G1rMOa6KnA3lSqYUQ5sfYP19EGkgvIlFTiQbOHZyJo2ITkFsbS0lIQabb44b52onX42rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 17:58:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 17:58:20 +0000
Message-ID: <d32e4718-53a6-4ebb-87cb-3b50cfc283a6@intel.com>
Date: Tue, 23 Jan 2024 09:58:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Add status check during gsc header readout
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240123062846.577031-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240123062846.577031-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:303:87::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: a31c5241-bc90-4cbf-b9c0-08dc1c3ce256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGHePHj6LaHrIchmjU0xC4gVIf26o1viWsGhf+8NoMcGhgnM+KqLnDXwwHBIg5t7bX5JES7mwZ2dWMeW+gAfS/hFvJ8Z7gPh+o8YlmQX8QUyizK/ZUxIY3hKg1SFJ/YAK3pzqQ2Z1Hch2aUNawE4LSoErEIUNffzY31wQNYgHNGJvutHCZtTDJ64LVuYmsjIbOcYqdKbUnAQfLTfeZRvC+Cdb8Sf41D7lbjo23RaB9vFQI6VW3oGkDsrpQhRPC51v9Vwj+87/L7GW/7MU9EUNvc+Y3m6MfAwLY7wTphJx5eyDKZNQQtf0A93P7y/0/pJc4NMT8EjEeghe4dXKlum91FisfLeWA5Q3AwtA1dri/KbgofQvqQH9ziQdoZwDmacKlla7CxKBLKFv1qUyXvjPHas9fNMAyjYl6hZx/LWhFh0lAxynTq8IEIRatvxbiAdyB3iq4wlxj+m0HLBKfAi2oPjKh8B1l4sybWX8nAoi/3joZd+2JmrsszxtUP9g1GNmRXlwXUFBKO+ZUKTRVhwtjqzy9OYJ7fM3vmWeTNIwzMGu/y6kzdsyH1/n8YU7comidrEXlMO0/+bv97UAyEsttPNyEQFWVeUIznqT/bivimNSfGjuwc8gZUliqVNHSwmhS3dZ0G8qN9O9K8CW/GBZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(6506007)(53546011)(26005)(2616005)(6512007)(31696002)(86362001)(36756003)(82960400001)(8936002)(38100700002)(6486002)(83380400001)(5660300002)(66946007)(316002)(2906002)(478600001)(41300700001)(66556008)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmx2RitBNHowb2tWWGp0NUl5N1dBK2NXNUlRd2xHQlhudC81Z1dKTS9hWERS?=
 =?utf-8?B?UG0yRnVWZUpzYVpBTUZXSFUzRFZRU3NPalEyZmx0R2lLRUtuS0dxZXJTMmFK?=
 =?utf-8?B?L2NBZU8xd2YrT0JXWVJGM2pQVDA5WWRFbUhoQk9UQ2lGT0RocFlVRS9wVWg1?=
 =?utf-8?B?OStCbThyb2lwVkxHaHgveURFMXpSTTh0R1crMHQ5ZmJ6a1lETU1SM0dSR3N3?=
 =?utf-8?B?NzM0VzVzbStYZmlwQW1QSFZWbkxQWEpkOWhZOGRRcnNHcDNZZnAvcFQ2YjBR?=
 =?utf-8?B?eFEraTJnajdtK2t1V3ZmMmpzaXE1cDZmS2tCVkFmNC9KZXRGT3A4NHhuNFFH?=
 =?utf-8?B?VDF1ZXRLN3A4NUpmWnJQSTI0OTMvUElQWklpS0VBOUdHQWdVeUhJY3ZZK3BQ?=
 =?utf-8?B?dXFCbGcxT2RvTXV0b1BXSHBINWZZQmI5emlvend6Skg0WXBFZXE5dEpjZ2Vv?=
 =?utf-8?B?cTBBRXJMdERlUFUyYjgyS3l0NzExRTRoaW5zUXhFT1ZkNWNRcndwSzBoaE5j?=
 =?utf-8?B?YTBnUWQ1ZXB4Z3M2ZjUyZjBMSzJrODlDY3Z4K1pacjNHQm8zb0JSWkUyNzNm?=
 =?utf-8?B?WVNlYU9iTUpYc2RzZXBRUkFycUJndE41VEVscGFVaGQzNUFIVTFqREc1dlhu?=
 =?utf-8?B?cXMwdkdxZ3U1b3NpUHM5bGVmd2Ftby9JTXpONXdLV012UXVTWmZ2bEdSVmFV?=
 =?utf-8?B?Y2o4Yk5idjUrNHl5dmR1Z3hmTVluSm45MDE3dmxwV3I2THhMUFdROEszQXQv?=
 =?utf-8?B?NDNvNmtRK0ZVem1ocXN0TUNxVkEvZ0Y4eGhxWmRZTTZVVmhnUzdXMEp0MU9B?=
 =?utf-8?B?YTRPSm4wd3NZTElnU1BvTUI4WDdZQkJCT25rdnRINE1LK0FWR21LbFdva25x?=
 =?utf-8?B?M1Z2UmJ5ck5mVTNvNXJCa2VlVnFqVkd4MUhqZ1FXTjhjZ0VsVlZIWk9DcWc5?=
 =?utf-8?B?dmprc3JPWXhQbDRlamdiZnpuUEswaVQ3SGdlVGJOWjJ1Zy9ObjJDSWplWWZj?=
 =?utf-8?B?M1JVQlA2Vlk2dm9OVnZwTmZ6UE9kZ2FYMG5HNEcxSk9zY0JFTE5FSWMrbEFp?=
 =?utf-8?B?a3VnTFFKcTAxekxsVTRjSlJhc3FsL0lXazkySWNkMHJUb2RsTmpWWlJvS1BU?=
 =?utf-8?B?dWVyZGpEOVViWWtQWHF2NjkyM1FIM3V0bk1RUkZMMFUvQ1RPVC83V1kvbE1Z?=
 =?utf-8?B?aU9mRWhaSmZ3UWdiTFgxYkp3eFMxWnNCdXYzSFM4V1hrVjZSTWpkSERzUFht?=
 =?utf-8?B?d2VjZ3ZBTS9lTmhIUWhhRW1tRXlvMWNzU3NKL05iMW1tTkJCOXNwSkI4VkVm?=
 =?utf-8?B?b1RpRW9EaWV1ZVg2OGpGOTBiMHVISnM1SElBR0VMNUNJOWlVQVBHZm1KUG5t?=
 =?utf-8?B?RUtSL1pBdElETTA0aUZmMXMvSkQ5N1d2RTRweW5OdE5NdkhOaVZpS1RkYXB1?=
 =?utf-8?B?R213UjVOd1pVeWl3L3VqU1NlWks5bGc2MEJVNDR5bDdUR3o0dTl3T21CZnBP?=
 =?utf-8?B?NXlJZkJhTm03SGM4ZXhJNjVhYVNzb0x6czN2UXZXaDR0clNUYk1rNEUrOWkw?=
 =?utf-8?B?dkpZUkU1RmRoejErRlFVZndRMmdNV2gvL1dQVndXbjhnZWNidGJkZ3Q2enRP?=
 =?utf-8?B?SWlYMDgvbnI1L2c4YUxwaEFkK2YwaGpadW5vbEU2NVJaYzlNbU93K1BXQVVo?=
 =?utf-8?B?U2c0VEVrOXZDaWhIeUJZMTJ5YXdZaCtDc0xYYjJoSFBQMXBMYitaY2x6cmlT?=
 =?utf-8?B?K09HUENxTjBkdytkS1FLTkwrdFBIWkJlQ3JEdDRXZFZTbCtEYzhJVmFkcjgz?=
 =?utf-8?B?QnpENys2R1kwNTJUMFFzcHRkOU1FSWUxb2dFMUZtRjFsbVVQWjFTcjIzbDhw?=
 =?utf-8?B?TFl6WkFYMEp1cVhibnRGRUd1aU9KQVNRSEdsZWdRcVpGdlh4OS9tTVU3S3py?=
 =?utf-8?B?WFJHeklHaEZsemU5TEEyekk5ODdTNWlwUFB6RXY5MWQzdjYzMm54YkRnZXlL?=
 =?utf-8?B?WlJ5TjRvYys3ZnpTSTQvZk9NNWsyUCswT3VNQ0FBVG9Lazlkd3Zzc2FGUVdy?=
 =?utf-8?B?RnlmckJDeEFTdW5kK1ZtMzBoZDU5cDNFOUdsMFM4RU1uWjFOSTA2bkdQRWZt?=
 =?utf-8?B?bXZhRjdrT2hiS1dCMG50YVJPTHRkamFWZFlWbkVmV0E1ZVZGTm51ejdrL0pR?=
 =?utf-8?Q?6zI2wXU5Sr6IHhoSZNq8zx0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a31c5241-bc90-4cbf-b9c0-08dc1c3ce256
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 17:58:20.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbVjDW/pxPHbPofpYP3rXvSX0+2TQSwH+s0C4upYr0lvqla4qzerx/vNWyE6gkuF7XKZT8Y7mkKh64AVjKIQWfSbuD+oqhoOPJ2VSnpWoEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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



On 1/22/2024 10:28 PM, Suraj Kandpal wrote:
> Before checking if data is present in the message reply check the
> status in header and see if it indicates any error.
>
> --v2
> - Use drm_err() instead of drm_dbg_kms() [Daniele]
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc_submit.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
> index 9ecc1ead6844..3c402fe36026 100644
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
> +		drm_err(xe, "GSC header readout indicates error: %d\n",

Sorry I didn't notice it in the first rev, but this should be &xe->drm 
and not just xe. Note that since drm is the first thing inside the xe 
structure, a pointer to the xe structure also points to xe->drm, so it 
still works like this, but it isn't clean.

Daniele

> +			status);
> +		return -EINVAL;
> +	}
> +
>   	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
>   		return -ENODATA;
>   

