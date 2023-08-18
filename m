Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D51EE498B
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 18:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F181310E0E0;
	Fri, 18 Aug 2023 18:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0719D10E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692384334; x=1723920334;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2c2ih5ZJa9kDKTPhihXTIdgM2NPBlmJ61T0r5J3Xucs=;
 b=U0thEifiar1V1OXxviLnwUy7XMc2HkdETRcS6+qH/Af0EcIo43Z6jDjF
 sbCFlQHVRTT+nScFEaW/vaaDS0xMLWMAHioOj0/GX4v5rUP9KmpH7Wo4M
 bX/m+EvxaGf7W2pUnDfqkeT7ONtITgjU6IgDiZi8kfOlxLrpWGig2KPve
 lmuhr5FozizKTIWtB3PuA1bHxI/KRLR+BNa3ViPz/4ADt4JkOk2VEVOXA
 1P71NOwiKvQ42Rndk2bMgJaVmexq2JmhnMyuLkixof7ulYONJJLuSpTJA
 U2rWzIlDwQLqXClN5Z7YrixTuYkN/moWOHjozuXL5TgMqcI1dHB94UUYd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="376927993"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="376927993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="764638579"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="764638579"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 18 Aug 2023 11:45:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:45:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:45:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StLZNoOcPj5KVyX9w9GQ19sfvvgr09IenGzjnx7U0lyVTe6qpDFBuHsaE4bvI5QlPkQH6xBniltIHi4MOehFNbO64D0YRz3/f8Vqpy6d8hX2m9o2jxEKlvHVYA8Cw6DBiEwm7WVybHstuu2YikUTJbAxb4gdOoEf4gT1w5Ekvg8Jiv2Fgh9K4MdtyPTnrsFFbX/70BBMax9lBmn+8XOhboYHD5rLbj0RMG2ADSIhYXKclafq4ITymmKTWlDlLIciQ8ofKDGjOwb+HuYs4sbI0WSkOFJG0N7Bx7CpueLuk0afYX6avrp+vNRG6aZUY9Z5vDp2VxHzt4uyQMQW7ws7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0l9aMDtPdlCbab26fNjSWbe7oVg2cEkhOdkQbJs23M=;
 b=Bv8t3MNQSiCLHo2xtAnr7eBkFpwHoh+Yg1dZwVd+4Sz4+vpX9ISNYLoJBoHoAfHw2tttr88K7+iQmm+ktHE6YAbREv4sCw/6shQLg125ycedPlpqrBmoI6Y+opy6T5QWg6zu1u2ktF0GD143+7AuGRm3xsVVmchwpAlzZIMXbsYlwTNHM7w+h/v8tF9VuscbZf+OmZJ4HoQMgXaXv5eaoPC6bRuMdDOMtWr5WqSIfFPvg1nYpodpVopHPc9XicrdzD/ylGVuzkpHCcokJlMJXLbF9Bfj6gmFYkuqRuyefs1ztVk7TVKU1aN9sX0RAh0/fYAJtvXAIUzsYs4LfLyXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 18:45:11 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f%7]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 18:45:11 +0000
Message-ID: <25e0f9e9-a46d-6556-e27f-2a528248f944@intel.com>
Date: Fri, 18 Aug 2023 11:45:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230817213028.838531-1-zhanjun.dong@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230817213028.838531-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|DS0PR11MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: fd419b35-a115-4ccd-6fbe-08dba01b40f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kw0+ZHwVXcvNrzX5U49rLsj9v9JovicDnKEl85cQ1b9If+JEokNhlI9EZie7Rybw2bT5TYdyqTu2DqzV7B6fr73QAQBNDFku7A7+i4ntMoKTLfYS+8oSThaeUTrh7Mz2roNX6lvSkf7ZJuzMEPKuBMDj/Ul4trdnpY5vlbeE6VA0pA0T7h9HEp9FEsjJHpucMpfpJhVzncqWkX6jr31VgIOlaEpSzE8piWZVoyBa3uZ7eETqakTY9iPk4Qxy3KGFMv7Brq6l++XtCA8U9Yp2Qh11WRY0jU0d/yaC6MTne93pzr4cvESf13ZPHPrU/8s/puVi2cEzLhdG1OT7h6/q2Lxtl1jvHy2dQtZSwNdBBvWI7Qjx8bqsRXlXFtlzJrSth34cmqtH7BbTUdtzeLb3hFPLtmzBYD8VxwT0/+xD0byPLHx+cKlTnMS/hzuci3wdvqDo9e/qsF0wxZz66P7vvubcp3FFmof/4WYATMg2CNYMOK66VMhUiCSiHbLDwXnZLn3Dc4nIXDJrLYhRg2dCf8jwYYXYulhSogXcK0pRcwO14DbdUIYMVxJbkYblxRhclo5waccfr5uMzbBmNWUG5H1Jvazk6fBEn7kSYj+AcONnxA6UYETIKK6QndnAjDumvAIlfRKblDk7RYLWoeFhgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199024)(186009)(1800799009)(5660300002)(2616005)(41300700001)(2906002)(66556008)(316002)(66476007)(66946007)(31686004)(8676002)(8936002)(478600001)(86362001)(31696002)(82960400001)(6486002)(53546011)(38100700002)(6506007)(6512007)(36756003)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGZNMXlOYWNyUTU3TUlYWVJBME5DRHZTQWFxZzJaY1lSSzN5cUtUeEI3ZGN4?=
 =?utf-8?B?Z2krUXhua1BPS0N0TmFmWEZtUlhzTHNxL1VNZmVtTlBtaDg4OWFaT0VsOWEr?=
 =?utf-8?B?NDRPamlCK2xLU3JlVnJFRnBEMFl5Qyt3M21OSjluQTdTamZTTzIzV3VvWjVn?=
 =?utf-8?B?bDhHb3N4cU56MHV2RFk4NURXc0pXNk43NWtCLzNmaXVuSXU1NGw3OTJXaHAw?=
 =?utf-8?B?OTFEdEJSaW1PRUtNR3V3cTdQREdIeE1XaHFWSVRWcU9IcFdNYVB1WGFPdERW?=
 =?utf-8?B?cGVveDc5Uzd4Myt5bkx4cnhwY2dEL2N3aW9KanZhVG0yRFJHSGR2Z0lIU3VP?=
 =?utf-8?B?OHE4M1JJWmhKb0NZb2dodjJLV2MwMjBTR0JxR2NRL2dCbDlZZTFrb21EaDYz?=
 =?utf-8?B?QmVGaEREeEh0NmhtZVJZeTBBOStIYkpiK0xtN0R6YWdVRXVod0xxcmpXdVpL?=
 =?utf-8?B?TDY4V0p2Tm1iUHlaNWVpR2VxSDJMMStsUGxYeDBMZ0JiSVBHdVpPMjRIOE5z?=
 =?utf-8?B?QW80YUpZNk1uVjRSMWRHc2hnT3NIQWlHVmtUbm9FcVpiK0pTV0VBcWVGTmhh?=
 =?utf-8?B?V01FTUU5ZUFCbjduVlhPamp6dmZkWThXYjVrVDBpbDY0a0pvYTNNcmYwQktO?=
 =?utf-8?B?dE5CWWFtRXNOVThwTDJnaGlBSGVraXIreFczc2NOcEdEZFJpcU41K0Y5N1pL?=
 =?utf-8?B?T1JtenhTQzBXOFg3M0hwZWptSExKZFVzRTNpR3VTMG82a1kyZlhHYnc0SEx6?=
 =?utf-8?B?SERCYmVoUlA4ZEF1aTA0WWF1OGYvR3N3QVRESE81bGVrMWM1bmxwTUlOSXkz?=
 =?utf-8?B?YzdLdnpkRTVxTWpKT0NXdmJtOEg1UElJY1A3dUNSdU5lN1FrK2xBVkVTbDJB?=
 =?utf-8?B?YXJaNFl4YVVWTzB2TGM5ZzZxQ2RzbkdmU2ppeTV4NXpYNmlBMjhMK3h5cVFp?=
 =?utf-8?B?czZQNmlkWWdJWElWY2JvY0NKZnM2YnVRdTUxMUxySU1iejNIUHgyeFVSc0lS?=
 =?utf-8?B?c0VndlhDeUJpeU03YnJiUlRrMG9IMWJ4TXNyT0xpT01YdDVhazlnZkRQMlE5?=
 =?utf-8?B?LytPUWMxcXZsQTFDWVJRUlpsRXp3RGZ0MjRxK2VpK3VrNW0zTDVhZlhwU1Ft?=
 =?utf-8?B?Y210ZDFoaGtQTVViN2VQMEo5blplY0xvTWhXbGttOWd0T3Z1QitCUmN2YW0z?=
 =?utf-8?B?MTFmZ2orZ1Y2Z0NzdVIwZ1MzTEJlR2ZBNnBhS1NUVTFFSkNva1lNZURHdGdP?=
 =?utf-8?B?YmJmWENhckgwZzhqZGh1T0xVTEFxbmxST25sV0lKQzFodi9hNklPbkZzNzkz?=
 =?utf-8?B?U2JMUXlnV0JOMUtUSHNkQjdxZHBaYU5STURORUx2bVJ5bXN3aXBFY3lPZUF1?=
 =?utf-8?B?dzlXclZEZG5CZXpFckZIbjJGZXpyd3o5V0N6ZVkzOFZVYkJUOFhjV2l4a2t4?=
 =?utf-8?B?b1M4T3RLMVNtYUkzOXBGMVp3dWpwNk1LMlU4MGQxeXB5RVVnc3VXNXVNaUll?=
 =?utf-8?B?SVc0dDg4ZHc4Y1VLMXFMWmJ4bXUzdVRuR0JhY1NNZ0EwVTU3aUJlZndTWHI1?=
 =?utf-8?B?UDZ3K3FxWlkwUW0zQ3QwWktYcUMzZVRQYTFUd3lpM3ptTXJyRis1cUxHV2pv?=
 =?utf-8?B?dm1FdnpKYi82UWtHb3ZDZEJBRVFic2dxSU5OTEp4ZjJpWi96WmlxWnZ3TnFv?=
 =?utf-8?B?Z1piMWJJaFlZb0xSaHhQb1YvREVOeGM2UGpEbzB4YkVCTWk1clU1M21ZZmpo?=
 =?utf-8?B?S2VqMjNndy9ib1N3cmtmUVJwRUNpT1VlaEpVNTFNOGtwTTJ0ejFEUEJ5ZU00?=
 =?utf-8?B?V0RQN1lHTGQ5V3g0akp0eXc4OXZVU1NJakJ3K1NTRVpEampEZFVvN2JPV0g2?=
 =?utf-8?B?bTdabEx3UnUxNldkZ090VlQ1ejdDL3I2dCt1OHNjTm43aDJIR2oydGt6ZmpS?=
 =?utf-8?B?bmVjL1M3RCtmQ1duUFJETnJEajVZMUM4b0FtZlJLYjFBNEQweXh3Njh0NTlH?=
 =?utf-8?B?cU9jYk1GR0ZWazBiMHNCcGhLQkNuV3k1L1NZT0N1NnErMzVxTC9FbWJjOUdI?=
 =?utf-8?B?Y1dVQnNrK0RTdm5QS0pRUFlHcVl1bCtrQXc5R3VXS1M1SnBwTjVwY29NNm1E?=
 =?utf-8?B?UlQwUW05VjNkdUE5RWh5K0MxcFlxTk5HWmlDc2c5VkFHZ3I4NmVtZzZQUGFG?=
 =?utf-8?Q?aHT0I3IxHmIVsSFKqtmAlY8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd419b35-a115-4ccd-6fbe-08dba01b40f0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:45:11.8636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYnrr0R9ZcLbFw5SuJeu+L9YdAdgNeuTwpTgPOimufcJr7nbjsUDXS2FSVqy8Z9ybbN+rDy2lLv9p0gObLs7qHCGfAg3qZX/o/A67sKgvNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware
 init
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



On 8/17/2023 2:30 PM, Zhanjun Dong wrote:
> Add patch version info on GuC firmware init. This is required info for
> GuC log decoder.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 13 +++++++------
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  2 ++
>   2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6c95a3e4c3f2..2111b3ef4975 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -403,11 +403,12 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   					   css->sw_version);
>   	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>   					   css->sw_version);
> +	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +					   css->sw_version);
>   
> -	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
> -		 xe_uc_fw_type_repr(uc_fw->type),
> -		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -		 uc_fw->path);
> +	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> +		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
>   
>   	err = uc_fw_check_version_requirements(uc_fw);
>   	if (err)
> @@ -540,9 +541,9 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
>   		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   xe_uc_fw_status_repr(uc_fw->status));
> -	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> +	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u.%u\n",
>   		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
> +		   uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
>   	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>   	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 837f49a2347e..444bff83cdbe 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -106,6 +106,8 @@ struct xe_uc_fw {
>   	u16 major_ver_found;
>   	/** @minor_ver_found: major version found in firmware blob */
>   	u16 minor_ver_found;
> +	/** @patch_ver_found: patch version found in firmware blob */
> +	u16 patch_ver_found;
>   
>   	/** @rsa_size: RSA size */
>   	u32 rsa_size;

