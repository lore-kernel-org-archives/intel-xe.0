Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C3C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B3110E182;
	Tue,  7 Nov 2023 23:26:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BB410E182
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699399587; x=1730935587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0vhSJONvV1UukpxqjD2uZ1WMm2yyFx9hiYQddHE9E1w=;
 b=jKBlYMCu+9auMUBgUT3VCYDgvdpxWM6ALbKlBTfDevbt6gdwxhLDtEKa
 HWehINvuUYcWGqeqhvR/s2kvdXnoM6Sr5RYiaV7h7AKsCuT2zvxW4zuAY
 6uyKjv4y97vLStdIaBX88G29zsBTODaLRM8R5Fka9Qx3QwZHcGk1MIkpg
 zo2deauqOoL317zhfubAaNvO+vLq2+h90QSsCvnt4QElcGut4kwXATDcA
 MFXhfMtHy/uOf0X88SI/osUdrt+gQJC0d4WrAoZ5/gcETu6YEsuUyWRZx
 ZVC3dMx7MEiyE8S7nZ1fsjDKM6Uawau7FXUgLCjSrD2t43T22bJ4VzX2j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420751575"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="420751575"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="739311086"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="739311086"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:26:26 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:26:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:26:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:26:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfSTIOF8eK53NfM5sn0T71ueJNOBs4628/f90p3WKECwlq8ENT2RWKh/oWQR4DFXpPsqsAuR+28FELmizHgW5DQ0XYoy72jRpSIorbk4SfMOsGVEBLWfX49WHVHrJGRXjiJGTITiVDLlOkid8m329P36jzAyzWSGQtWZkX57/onavkUWzsoesePNJnVXVd7n09ePOnFZTnc2oVXgvc6uqGwbwZnr2gzSrB+eOv8NXTEeY/AH8uvfQ2zE/a7FscD+17+uLGO0wxZ3ZyPkvUtvDPqOZKJQdVqBtVyDxPwFdVQvwqTtVdbQav4yJkbft+/MVKuQq7FjQoxEFWX9Xprezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfzgrvGEBqEQ8qwDShyBh1b+zkdg7/DcOtm4eRCaW3U=;
 b=inu1ET6byuG4i20ESM3S5ZekQ5cgcSR5TAJytLWPlgsZnNkSEkJCcGdwZbecG1Pb6O9R/pRY4X8nI7FYYJDbNQY+eV9IMzqpRhhb70aJ+LSm0FuEMwj9VmUqZkJrUV0EfgMHExhxQg6CRWTVSWHlBtA69wQspVf1O2jEEidZHj7ZOMCImSyuKf2ZUO0t+nz5etPYks70sH/flSpj5LUqnqaujSCt3Rp1SDxHL6RI/neIfmG9NP/UoDFuhTsm6YNnodKG8IhAue/uXadGzIWT63oB4Qkqp/axyTdq2HewjiRHyzwHvWn3rdxwDlt3mP124lC73+u/G8BoebHi+e5KTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:26:24 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:26:24 +0000
Message-ID: <db3df54c-47f7-4a8d-9ad3-9ddb2e1626a1@intel.com>
Date: Tue, 7 Nov 2023 15:26:21 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-5-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0071.namprd16.prod.outlook.com
 (2603:10b6:907:1::48) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8a2eb4-df4e-4f53-2268-08dbdfe8f4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TE6uJGnj7ayVQNH71khn8rJ8av7CHeQTX40VuyIvNesw64LqsFUpHNuo70mr8vAxWKcmto8R2OroV5YLoXXJW7bEr6xo0ew+/KQaMPEvGIUI8GHHgGlExqiogKAQcMiQmE8/dkLZSCHq3Y1ReeWFFbmWNzc7tTMRjXYNO2Mv+3UZphylEdn9W9pUyWXBpXPHzJtknfQEUmVrCl2ibv44aJ7GAMfOBwhI96hc3opHKwL2Crv7EM1ASNEUZO7BmkNfO+iyMupXB20bpFKZXvIQ+RvzyMk0KwekjvkxvbbuhvDVa1XGRmFCzeveCEQCkhp+ZrzIQz1uhhQLSBtesXsNgo3VPTIlAF466kVzIo6FS+tJlLsWt4is1Uf43aZQdjRf6Z9meKI9NXsKGejmKzbXEcxRH4hMSXL8wExh1goWFCK2aRkM/rxBSSg4iNenJFp778TuH1BsGhpVxJmuYn4iuKa57+FomI6bJ4DI8OfFvdITDhL+mg4oS5pt3oSwuk3+18dsh25bKt8I96p6QoTDRL6C9jC7xr0WHGloNI2FVPP+ZCdkLH0anAjRIn1Dx8laOnkqDOAhzNafDnKfKTet1C/Z2oEE9hUjT7rTpMGuWZGPw4Tq0QPz6Ry2hRGc8HvbhfjmAb+3gTeY2ZgkYwPbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(41300700001)(31696002)(4326008)(6486002)(53546011)(6512007)(316002)(8676002)(36756003)(8936002)(86362001)(38100700002)(5660300002)(2906002)(83380400001)(66476007)(66556008)(26005)(82960400001)(66946007)(2616005)(107886003)(6666004)(478600001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNWUHMrK2JKRFdLbjNJNWthK1ZmTERSbzltU0xSYUtISkNadWFsQ2xkbW9T?=
 =?utf-8?B?QXFiWkxFVXlyTW5TVGZXWTlCZXlIM3l0ZkxZMlRyb09QcjlKd1JCZ0piT2tM?=
 =?utf-8?B?UWZKT1d4VHFrVURLVUZwbHFaR1JqNldsTTFFemJTanV0aUR6bjZ5ZlVhajVw?=
 =?utf-8?B?TklFVzB2TUxmSzVpV0Y0L3loS0RMdVI1V0pGYkxWaVhpUGVhVmpTVUE4a2ww?=
 =?utf-8?B?cFJRMnBwUkFDYVJGTHRnMk9PVVh2YzgyVElLWXNkV3NobUdFdTJFQUFQb2Iy?=
 =?utf-8?B?UkNvWEd6TU1KaVpPL2JFREF1ODdhR2cvQW9rSDY1aUloWXJET1M5UVJjVENr?=
 =?utf-8?B?cE5FM1lwNGtGbXFDR2FQSlNPdGJkQm9iUlZ6U0swMURQVzlYRU00U0JwaXRC?=
 =?utf-8?B?V2FaZkVxc0w3Z2lwVkZqbDNoTjVxOUZ5Slo2TXpCakdZclorZmVyVEVOeU1q?=
 =?utf-8?B?K3hEaHMxeHhCTml2VzJjM2pYYVdTRitmVGh1eGltYVRxWDd2NWlxamZwSWcx?=
 =?utf-8?B?OUpWcXdLRzdQT1pERUJhY0RleGNOeXVNVkQvelR4NTUrb1lkYytOblZWZkRF?=
 =?utf-8?B?cjB5WDd6cy8yMkNCQi9lNk1jWjFQQTdZSmRUa0xHUjFKeWNOaHVUY0IxQjlw?=
 =?utf-8?B?UE91S3pQSmUxMmJJVDQ2dzNVU0dhQUZTMWJCNXJaTjNQb2RqSEdxa3RWMmdm?=
 =?utf-8?B?UUNROUdJTk1ZU0l6N2xZV092QW5hTzZ3SWYrN1E4bkFVSlB1Q0NaT0NaRlB0?=
 =?utf-8?B?MStlcWZnYSt3RmFKaWczd2ZacHBZNWlPWFpBMWhYWTAyWUZzSUFXcG9uN2VE?=
 =?utf-8?B?SWdUTVRsZExEdUF2c3JBVWdpS2lJK0RGQlprV09RZTV5T0dtYkFFd2tNNUdF?=
 =?utf-8?B?K2x0K1pYQUFKSmNkR3VJSEVJRCtobm5IaTc5RHdrZC95U0hiaFpFTmRHbzFu?=
 =?utf-8?B?aTBWQ052MlNhek9jZ08xYnlEdit1NkRNN2VGOTJaQ1R1NHU0c2E2WVlCbUtZ?=
 =?utf-8?B?UVdWalhoZHNvS0l4YXpNeVlDMExlUzZjVE9hTG4yWVd5T2pkQzhOWkUwSTRP?=
 =?utf-8?B?c2E5Yk9NVllxQTE4ZGNnOEFXWXFuYWJjUVA1dVFSU0Q4dUw1K1FRMlQ3TExB?=
 =?utf-8?B?Y0owckFuSVRSWHdWemR3NmlSZ1p2SUp5QkdSMFFnbUI2dkZBcWxCVklRekow?=
 =?utf-8?B?b3FMdHBRcmZnY2djMVZnc2FOaGI2dXVka0tHYTVMK3B0cWxZVW10RnRIRWhw?=
 =?utf-8?B?TUlscjFLRStVQ0ptMG5uR00vSUhUejR0bVBqcUcrOXlPMGxUTFJhOXM2TVF4?=
 =?utf-8?B?dnUxRHRYbytTdWZsSTM3VVpZWktoMFVLVXlEbEV2Z2V1dVc0UmlqaW9EVHZi?=
 =?utf-8?B?M3RoS3ByMFVhdFliVjYvTHhvUnhpTktvK0VIS0V6YlN0Y0xEMGtBQ3ZpZDFs?=
 =?utf-8?B?c0lRT1ZDblhPMDBxQ2FoZXI2dFlLbmZ0RFNGZndab1NHMDdLSVN2QmhGVTQy?=
 =?utf-8?B?aWFSY2hZblB1VVFmWlNhNmllbllTd0tvazB2M2dGNjZTSEFIUy90MzVyamdC?=
 =?utf-8?B?TTN0T1gwa1c2THhiZTZiaHFtc0tWM2V0R3RGQ3QyekFCWXN2bUVEMUlzZ2RH?=
 =?utf-8?B?MlNsc1hibUtNb0NjdlVNSkg3dEJKSEN1c2VGRllsSCtzZk52UGFPRUxTK2ZH?=
 =?utf-8?B?bk5EUmVyamhHb093dmhMcUl2U3FkYVA2aEFjazBDR3BDMWUvTVBLNHcwMTU3?=
 =?utf-8?B?VWNvczF1cmlmZm0vL3JoQmFXa0FGUDVSZ1hkVTQ2bGNZUmM2N1NFbkFYNTAv?=
 =?utf-8?B?dWdLS25rQU00Y1k0SFBWOU01Tjc0cStQZFNad1FrNkxHeXZwNHpOSEI4aElt?=
 =?utf-8?B?Y2xKTmh1ZXRxQkF2dzF3SlpiRVQvZTJOKzFZRjhsdU5CS1lyTXcvK01Dbm4r?=
 =?utf-8?B?OUFXVzczQ3Zpc0M0MjNMcVBQWHNIbHNGd2RZb3VEdFkwblVyeUt5Q0NqWE1r?=
 =?utf-8?B?Q0Q5V255N0tEaFNKcUF4VWNlTWd6SE5SZUxXT1ZCTDNLeFJveXE2YXBROTE3?=
 =?utf-8?B?aUlRand6MnR0WjZtUE9wd1FXVmhaZFRzU000a3M2c3pzVldCWS83czZieXBt?=
 =?utf-8?B?V2txZC9BOTJPK010ZFBGbWpjbzdKeHNCN2tQWnJZK1hGQkVLOHc5N3pWS2JW?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8a2eb4-df4e-4f53-2268-08dbdfe8f4f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:26:24.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+dCS5KHXD3PnNYaba71/253ZbqDg92a7bZu/QL7IUP3kwRlvNOAhAZ9ZwlpIL1Ebt4n1Z5uUsE6Dx4fY6TuyyZRLklXBBCiCQHQvC896NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/12] drm/xe/gsc: Introduce GSC FW
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
> Add the basic definitions and init function. Same as HuC, GSC is only
> supported on the media GT on MTL and newer platforms.
> Note that the GSC requires submission resources which can't be allocated
> during init (because we don't have the hwconfig yet), so it can't be
> marked as loadable at the end of the init function. The allocation of
> those resources will come in the patch that makes use of them to load
> the FW.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile         |  1 +
>   drivers/gpu/drm/xe/xe_gsc.c         | 50 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
>   drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
>   drivers/gpu/drm/xe/xe_uc.c          |  9 ++++--
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 21 ++++++++++--
>   drivers/gpu/drm/xe/xe_uc_fw.h       |  2 ++
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
>   drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
>   9 files changed, 116 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cee57681732d..474b6044d054 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -57,6 +57,7 @@ xe-y += xe_bb.o \
>   	xe_exec_queue.o \
>   	xe_force_wake.o \
>   	xe_ggtt.o \
> +	xe_gsc.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> new file mode 100644
> index 000000000000..3f709577d73b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_gsc.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_uc_fw.h"
> +
> +static struct xe_gt *
> +gsc_to_gt(struct xe_gsc *gsc)
> +{
> +	return container_of(gsc, struct xe_gt, uc.gsc);
> +}
> +
> +int xe_gsc_init(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int ret;
> +
> +	gsc->fw.type = XE_UC_FW_TYPE_GSC;
> +
> +	/* The GSC uC is only available on the media GT */
> +	if (tile->media_gt && (gt != tile->media_gt)) {
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
> +		return 0;
> +	}
> +
> +	/*
> +	 * GSC can be "not supported" where GuC is instead supported, so we
> +	 * don't want to fail if xe_uc_fw_init() returns an error due to that.
Not following this comment. Can you explain more?

> +	 * To avoid this problem, check the FW status before the return code.
> +	 */
> +	ret = xe_uc_fw_init(&gsc->fw);
> +	if (!xe_uc_fw_is_enabled(&gsc->fw))
> +		return 0;
> +	else if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	xe_gt_err(gt, "GSC init failed with %d", ret);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> new file mode 100644
> index 000000000000..baa7f21f4204
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_H_
> +#define _XE_GSC_H_
> +
> +#include "xe_gsc_types.h"
> +
> +int xe_gsc_init(struct xe_gsc *gsc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> new file mode 100644
> index 000000000000..135f156e3736
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_TYPES_H_
> +#define _XE_GSC_TYPES_H_
> +
> +#include "xe_uc_fw_types.h"
> +
> +/**
> + * struct xe_gsc - GSC
> + */
> +struct xe_gsc {
> +	/** @fw: Generic uC firmware management */
> +	struct xe_uc_fw fw;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 784f53c5f282..b67154c78dff 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -6,6 +6,7 @@
>   #include "xe_uc.h"
>   
>   #include "xe_device.h"
> +#include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
> @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
>   	int ret;
>   
>   	/*
> -	 * We call the GuC/HuC init functions even if GuC submission is off to
> -	 * correctly move our tracking of the FW state to "disabled".
> +	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
> +	 * to correctly move our tracking of the FW state to "disabled".
>   	 */
>   
>   	ret = xe_guc_init(&uc->guc);
> @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
>   	if (ret)
>   		goto err;
>   
> +	ret = xe_gsc_init(&uc->gsc);
> +	if (ret)
> +		goto err;
> +
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 1f7dac394a1d..af3e5cba606f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   static struct xe_gt *
>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>   {
> -	if (type == XE_UC_FW_TYPE_GUC)
> +	XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
> +
> +	switch (type) {
> +	case XE_UC_FW_TYPE_GUC:
>   		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
> +	case XE_UC_FW_TYPE_HUC:
> +		return container_of(uc_fw, struct xe_gt, uc.huc.fw);
> +	case XE_UC_FW_TYPE_GSC:
> +		return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
> +	}
>   
> -	XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
> -	return container_of(uc_fw, struct xe_gt, uc.huc.fw);
> +	return NULL;
>   }
>   
>   static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
> @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   	u32 count;
>   	int i;
>   
> +	/*
> +	 * GSC FW support is still not fully in place, so we're not defining
> +	 * the FW blob yet because we don't want the driver to attempt to load
> +	 * it until we're ready for it.
> +	 */
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> +		return;
> +
>   	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>   	entries = blobs_all[uc_fw->type].entries;
>   	count = blobs_all[uc_fw->type].count;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 1d1a0c156cdf..d4682b0276e2 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
>   		return "GuC";
>   	case XE_UC_FW_TYPE_HUC:
>   		return "HuC";
> +	case XE_UC_FW_TYPE_GSC:
> +		return "GSC";
>   	}
>   	return "uC";
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index e4774c560e67..239256bfdb07 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
>   
>   enum xe_uc_fw_type {
>   	XE_UC_FW_TYPE_GUC = 0,
> -	XE_UC_FW_TYPE_HUC
> +	XE_UC_FW_TYPE_HUC,
> +	XE_UC_FW_TYPE_GSC
>   };
> -#define XE_UC_FW_NUM_TYPES 2
> +#define XE_UC_FW_NUM_TYPES 3
Why is this not just a sentinel entry of the enum?

John.

>   
>   /**
>    * struct xe_uc_fw_version - Version for XE micro controller firmware
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 49bef6498b85..9924e4484866 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_UC_TYPES_H_
>   #define _XE_UC_TYPES_H_
>   
> +#include "xe_gsc_types.h"
>   #include "xe_guc_types.h"
>   #include "xe_huc_types.h"
>   #include "xe_wopcm_types.h"
> @@ -18,6 +19,8 @@ struct xe_uc {
>   	struct xe_guc guc;
>   	/** @huc: HuC */
>   	struct xe_huc huc;
> +	/** @gsc: Graphics Security Controller */
> +	struct xe_gsc gsc;
>   	/** @wopcm: WOPCM */
>   	struct xe_wopcm wopcm;
>   };

