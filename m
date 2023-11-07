Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C762C4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 21:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB810E6B6;
	Tue,  7 Nov 2023 21:27:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12B710E6B6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 21:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699392422; x=1730928422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TgZN1LOPpqFhSRu+o2O8dYNCpyQiK9wAf2STxjKXfEc=;
 b=C+W2AUF4vNfwUSQWFHAvGb3ln1O5HAlB/uMiTt7KC0V/4XULrOhHz9Xw
 CP+14uSv3mnFdpMCumNfwQ/EC81XUdZHmLVNOiAnZXf5Adr2amqEsolWu
 wmYH/H7GRBA23nlYUwoiU2r7AYhvn78C5KLrE/mO/e94I3J2tbC5pAZYq
 +2HL5JJkCG8Z5NjjkXlzHwPoV7Icfnjmz7YDhS0oMUJhU1GpSnZC1TfN0
 RfXtsDScfKcsaYH+M74eDPbQItLSHFLqE04cCR5IH5KarLQBAtnDbQenI
 F/RJkJm08r7PkkzfKFcHVp599O3obrkTJ1dX7nUWtIOv8vzGSA3OSp1wH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="453932230"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="453932230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 13:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="10960050"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 13:27:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 13:26:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 13:26:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 13:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VV668kRSKs0/oxo47zNZlbpoRctU+yas7AF/S1/ZFH6C//OELgDMlZbMbrdY3HA/V02cAvrQcnkt+qZqUlNbLjQhhtIn6qGJDg1zBQHl7F8/asyWOVVC9oUb8ZCRDMmS2r48opeuX5tjjp6H1j7kUX1RVQCNzwg/97LA9KhPE+mmrkWYdL1aIwthfXRy4ynEwT9Xw2sslGlYCtbbAl21gKPK+fuiO2UvYsWOdvzr2Yy1o0/h3xeeuzTYC6faKUzXxPt5kS6QA3wjI8mU6tnEPCKHDad5QaD9ZKCgz8D1WD3Q9bn5cTy+1ugTMaJ6N8fA9j57Uc4HSvVztyptWpy+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVLXvGgo5jKR2UfAk3K8uf6dGy9h5tjghw2aQokWjzA=;
 b=j83a2AkPB7WFpEFw0PCJe0IXOQmRDfj7a56P/thQSBto7P7oZmNQysYAXvbTH17bOHNVVc7A1HTyKcy4CD5B1Y54uiL3lNluGv+ZeUhxm59kfowGqZbUlnsnrH24eSR8H6/SZrpsmQf1hUDosIYZIEb6DI+xkmOAPOrhZGm+aRBG4NBA3OVkGWnuhiyKT65YAOhxan4O2CGIWpi5bJDr7P+d9Lt5H8EDg9L6xd2SRmZynjTJ40xiiXEFswkb5lD0VUg43It+KC4t4Xi/ZquLgLDy7dxzagQiPyR7PY2RoK3onZDGkI/ezhiAkpFCQuQqFZpMYcKysxr52cn41gsTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 21:26:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 21:26:53 +0000
Message-ID: <5e8b91bc-e5a9-4824-be40-7e65aad503e6@intel.com>
Date: Tue, 7 Nov 2023 13:26:53 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alexander Usyskin <alexander.usyskin@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231107115559.248879-1-alexander.usyskin@intel.com>
 <20231107115559.248879-3-alexander.usyskin@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231107115559.248879-3-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 914ffc9b-b82e-41d1-e8d2-08dbdfd84301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMhq3D+RVUS+9KfAaS+7uLsxrLlE4bfvYcBeY9bBxXwGnSjaBXzVZYB9CIVGdlAZ7RkmIMLp2L/zsaPfFRf0rziLQMC2tyM6eX0f1lpVjDlT6NiRIWcmgkhikojtv+kQadIxACc36Uu6BWyiv4InycD1aw5CAyglU0RUkKA/m+wUFhIoY2fGceCUHQRoqqPszrC8agJt4WsU4x8uHC/U+vDogZWRXCvYULvZsostzxmaF4BxFVD3Tns3CBeBHd9jR1A5EL1oymIjxXV1IJUKApARIMmrDdS9C7XtOolvD2LP/yAdC6ES/HRiQVxx6rjT36mpF5n5hHkUQftFccFOaN9kTRS4d0oJWlp9NUSn7QXhBWwm3/hhBkDX1weH7I3Mo/1HfYrbhUI0i48z3iWMJeAbEx29L64kp/ZhBbpU6dOGJkYcIgSDI8RxY6hqR1BreQF/lRS3v0HYdbLS2GL3+IEyTnTCKHhupzAd32NEcz+K6tKcd16RwJw+j9RVj2Rqm+j0ogtHXAimwHHrnu6uPKc2P1wfm9UM9RdgOfAFUVW5Jk6dfbWmiCOyTVvolSiXQXdmsgRJ3cITFJJkT2EvWskCkvazW4RnXcFMkZf02N1IwQTvdwYZbWC8g9FmUDLaZyZZ0TJeCBiQk/ftT/Eimg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(8676002)(8936002)(36756003)(2906002)(41300700001)(38100700002)(5660300002)(110136005)(4326008)(31696002)(6486002)(53546011)(66556008)(66476007)(6512007)(54906003)(316002)(6636002)(31686004)(4744005)(86362001)(66946007)(83380400001)(26005)(82960400001)(2616005)(478600001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStLUEpWZXNrTS92QWNhbnJpdnJKZW4yOWpvWjRndjZ5aDFLcVlDYjZxWjhX?=
 =?utf-8?B?TzkrK1doSVlzN2FrQThOaklUbm1yT3Fjd2FYY0NoNGlmZmZmaWJ0R2VmYUtp?=
 =?utf-8?B?c3FqaWJuanBKQW9UODAxbXQ3MWIxck1EM2VZZWxYbjI4RURZclZFY0FaMXl6?=
 =?utf-8?B?a2kxcXIvNk5xenVRaitwQ3drSUNCNTNVU2JJZHh5Qm1pZnYyWUxXbm94bFky?=
 =?utf-8?B?dGRKcHlPbEpxQmZJMEQzNW9QRWZxSXo0bzFhSm1uSldvYmhLNk5SNUtZQ1A4?=
 =?utf-8?B?eE9aZENvNVdodk1uc0hrMnlRUDhSTlJTRnZzQTZVeDV0bGs3Sitoa0cyajVB?=
 =?utf-8?B?bXNIOXdNbXhzY2dHVkNIUjgxZUtPMXhtam9MMjVFL0IxVnYwdlBndllVNVV5?=
 =?utf-8?B?VWozMnpoQlhFdU9xdy9TUnJjY200OWduOWZ5dHBmNEt3TVZvR0JhWmhOUlpW?=
 =?utf-8?B?WTFPMGhaVEh0UFdYbWx1czlrT0w4dE93TUlHMUlBaFBRbzlvTnpSWXpYb1gw?=
 =?utf-8?B?emVaZmFkVGptWk5vekpwc1NpUE01dDNObVArL0FYK1BMeHV0UVduY1V4ZSsv?=
 =?utf-8?B?NXdhTmhEMWFIOHNZaGNzRGhnZExMdzFVVlE5MllsWE94SG9wdGVFTDU5N21F?=
 =?utf-8?B?M3VrTFhwV245VkdNcktWZnZOcUl1T2sxZEtROGViTVJkYUFsZUpxL1lCWVZD?=
 =?utf-8?B?SXBHUGNPbmZjUjBYeXB5WDhaODNjWjFKSEs2TndPMmdiWkx5Vks3Q3J3YjdU?=
 =?utf-8?B?MTVidWRsai9BdSs1QmNIN1dVWkJSbVc4TmhvODVzUDFjREh2VFhqUzh6bkJw?=
 =?utf-8?B?dzBURGhqYkxabXpCV2I0RHRNcWhmWmhzbGcyWDZzR2FlbWZmRjIrU2EzQUtC?=
 =?utf-8?B?amVqcHZYNHlHMDhzWEo1WHdaVCtab0VScjR4bElxQy8vN2RoRFo2aHVzNTM0?=
 =?utf-8?B?bVRVcS84THRLWkVzblpJbEsxMnFkTk1jUlJrSHpwdms4Z3VYVzQrOExVOXZj?=
 =?utf-8?B?L296SmZDQW1nZVVqRForVzY3NU81NFVuaDRpVUxzTmdpdGRHd0dGQXlnMzBL?=
 =?utf-8?B?cXF3dndQOHBYZmN1U2F0NW5tOU9RZW0vYnNzaVp5YnpBKzZwOGdOY3lTSVNx?=
 =?utf-8?B?WmlteU80dUxiWVN3SWt2bVBocmFORW9lekwvRTBUdkQrTS9kUmNldFNlWFRt?=
 =?utf-8?B?Zm02L1JvMGpHRXpMTG1kOTVLQnhWVUhHNlFucmI0UjVweGJnQmdwaCtMK0Zz?=
 =?utf-8?B?bGI5bXVHMFdLWjF4ajkwVkNKYTBuaTZhYkkwQ29VQkxBcW5GRzdHcm9HeTJu?=
 =?utf-8?B?RTZWRTRTQkJEQi9HTDRwUXdhVS9vV2QzU3JoVUI2NUZPbHI5YVBMcDJ2REVJ?=
 =?utf-8?B?YWp0dVBlT1MyUEVlQlNHSEhmRDA5bmdUNTRqU3RjN0g2SjhqVTNpLzRHZTB5?=
 =?utf-8?B?ckVYVWMvRll0d0xTQ1N2ZUVaL1BlbmF0U2lVbHBmMThuSW8xU3QrSEorbHhT?=
 =?utf-8?B?QzVwVG1kTmJWUHB0cHhTM1V2RXE0UFd6bllzVE9uQy95N0NyYW5scVNicm1Q?=
 =?utf-8?B?VkxaL09lOU1vUkRYdVFWN1FRaGI4d0NOUThPcys3SkZDZC93M2xkSGFoZ1RP?=
 =?utf-8?B?N2I1V2RhRS9EZm50QVBldHBYUzJnNFBjbDhFN0syMjhRRlRyTCtla3kzTFB0?=
 =?utf-8?B?UGMrU0FhNWRDbzZxZEFUOTJzZnZ6UVdzM2hUYk0ySDBhRkN5Wk4xZjRsUmZx?=
 =?utf-8?B?QlVZNDhyV0N4T1BqWW9sSzBZa1V3WjlNZlRIazkvcTIxdmdqc0wxend0ck1p?=
 =?utf-8?B?TGZzN0c4cXFneGVYdUFYTW1RanMwZTZRQWNKck1IbzRrSjcrbisrRzVRdkQ3?=
 =?utf-8?B?Y1o2MTdWYzNpVG9sdWgvYUx6dmkrZFJUQzFaTjQ0SldCdUFOeFFMalpmdEVK?=
 =?utf-8?B?UlQvREFxTXRLNlpBdFg0OGxoNFdXTHV2RVhJaWRvRWVUWE8xY0xrTmFZbG9S?=
 =?utf-8?B?bVV0a1psa2w0MW1CMk5ucGdVUVNEY3hGbXE4aGZMSytVaFRCTktyNFhjMHhn?=
 =?utf-8?B?SlgyS1NPMDVjakQyN3ZSaG1Pdk92SmlNV2NYc3B5dHpxbFU0TCtkV3Eyazgv?=
 =?utf-8?B?UTVrRDhoZzJvNy9ZZkJGNGViMUozUElobFVEZ0krcHNYMHBYdGdSUTRBdkh4?=
 =?utf-8?Q?d0bD5m3Bu3kEr20g6nzH7Kw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 914ffc9b-b82e-41d1-e8d2-08dbdfd84301
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 21:26:53.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55wo1KgPwMAzueMw1c9AdzuVHnLYxy3dz6iP0+0cwrHI6OoOcmCR8Eqkbav3YhSlJw4ol9/f9lkRUVIcvnn5WfE2eX0WcUgnxuZIxxKMLIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] fixup! drm/xe/gsc: add gsc device
 support
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/7/2023 3:55 AM, Alexander Usyskin wrote:
> Init HECI GSC only after GT enables interrupts.
>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 515cdf599fab..1202f8007f79 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -392,8 +392,6 @@ int xe_device_probe(struct xe_device *xe)
>   			goto err_irq_shutdown;
>   	}
>   
> -	xe_heci_gsc_init(xe);
> -
>   	err = xe_mmio_probe_vram(xe);
>   	if (err)
>   		goto err_irq_shutdown;
> @@ -425,6 +423,8 @@ int xe_device_probe(struct xe_device *xe)
>   			goto err_irq_shutdown;
>   	}
>   
> +	xe_heci_gsc_init(xe);
> +
>   	err = xe_display_init(xe);
>   	if (err)
>   		goto err_irq_shutdown;

