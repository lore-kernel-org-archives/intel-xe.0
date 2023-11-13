Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD73C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A87510E030;
	Mon, 13 Nov 2023 20:23:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C9210E030
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699907020; x=1731443020;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NXEjR+NBU6A4XPxcWeqg8YX2lRAgjw01Kx8ONA7VT6U=;
 b=Lfr8XlEJR1bW+PJSOvra66VOlkb1Yu+v0Q+3B3VbUsPh7ZRVvrvc1jRk
 wZiJdY0wDXKixe716beOBeOmRRuEgRJJyJvhLcph59aiPsmDf2kPBjS91
 6cWZ1t4Zl0UGDxLQtEPltAs8+bLoowqAmaiT8EcxIsL3g2esuyYZjwmIE
 dW0tjcqfIJOzPI5o68bTlGwkJoKh9Wx46fBk9DT91K1DPVf9SYqUKkCJ8
 i01bo4RVu8uo2H92mKHLX94qWT2u9hIGiCMaAT9XKUn4bDu2gapQ9g9Fk
 hWpAv9F4SyrVBloikxR95bDm2vMj2AQLt6x7yj7FjjcipDEMAQz/I5noa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370702609"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="370702609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:23:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908135412"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="908135412"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:23:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:23:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:23:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:23:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:23:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqrpNE6jYSuB5ZIL/JGKAXsv936rfkVfG851mIBkganOBAMuFMTcAl7PX9KWCxBVUVaS0BrTxMReseljwnKm7ZIqsghWzGs5kVHCOz+5ilgTIhwBPgvZo1HTdDkMLJ7TmkilNXGzQJHoKoP0ZIgU7bM6pcz/QnOgYmuTfBRXb6N0pmbqyiZdMhJEg71iGOXuPLcrANQuY0Zyvf9KM+V8MaFxFWNufjru4xtkSZPOOKfViHTMnCWbOVUyncodXAUUVJIiopd6x51Cr3sW+RsAG7NA+m0thoUESg7mxEQtkXMM55rGcX9tJ7F46KTPxMejRVXndWzocTDQ89Qw/SBDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzAqBoQ401D0F6LX02cQESxQpBA8BMDpmhr0udhJJEk=;
 b=TWyLkvgyijthHVYLLXRiGFjpi/KvrU8VUjSr8WgOiWVRrONIWDpGCq6Bf1MxuLV9DBwrRuGvuQTj1q40zqvc2bNSa8GnMWFSx6CmxDrnLeAxKtq72BBEA1SYnnNQhOLiWoX+41fb0iDw5m6xdRLwTaD0joEjWHIipkpGeQSftHhlFm8YhMC7vk5SvIGjFDt7q8nPiGyswtLw3ULzRNGAJULNchJkt74nPFKhCqcI1vZHsjZYCsjxm2CCbBlsakZUrvhjpIDji648MPu69MnzOmyt2yS2ay7biSWLgi/8QLb4+mWQyotOspBekmRgQka8nrduvMa6Xbb9ss6LDEno1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 20:23:36 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 20:23:36 +0000
Message-ID: <fb742073-a0df-4406-9e81-e27d049244e7@intel.com>
Date: Mon, 13 Nov 2023 12:23:34 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-12-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-12-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4945e1-e4e2-4deb-e04e-08dbe4866a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GcOl6qvQHNQjQzdQPxZfbxYkHetVBGzQW4rQZv7KtqIv6azbX6rly2aNiYIfEaOtnLcCFW+AlTHqP7JFzOaRlbgVFODK6bocs7NidnkDxgwkG3TstbFhAAjVcEYO3o3gQ7zU3PUfFPeSQnzLS8FTgrtt/dWJR6fYpGZwMGv/xIU7t08QWoQQV1+qQKUClnK5ccF8lfMuFSnZLuOW0qs/p6hVdQmVCsaeBh9KuIPV19uEwcDMMesDs+GIPJjzV0PCXtO6vgveD/DYbWWQiNI5yZUTyN947U1x3q5nG0SsXvrhMvHtGyFVL0UEJAOOxT+Jmz6vdcnsuq55+JyQ5HwauEfYoTt6l5x313K9t5Dfr4DBkVV4lFrfOl9Kdj647uX4UwfWE7XGawhgR+jVwXGeypAYtcDgvBHsKjWmA5LuEUEk37HT3tjNzjxIJoFbNN4norgaysdpDqyLS2bBDs4VeefvG6TANO6vjfGEddxR+9rRZ+mH/6nlSXnPJ4ZtcfY9mkU/a9YkfVf1rE3/3ywLYLh8W3wucAifS4EVmUV9EY2HEY6ZTA3hSA7o+ulmfr1rPy1uCI9SiVisOpuXgrQ0OfVV67UAN6npeEuiNEAC4kpeiBKtEMHNqB0/6+RwKNRnO1kZcta6xHueFbCs65mHTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6506007)(53546011)(478600001)(31696002)(86362001)(2616005)(26005)(6512007)(316002)(66476007)(66946007)(66556008)(6486002)(82960400001)(38100700002)(83380400001)(5660300002)(36756003)(8676002)(8936002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTB5MnJaMHVyMlAzdHNUYUhsSTNGQmMvbGVwbjlESjZBVFVnNXFmbmRZeHcr?=
 =?utf-8?B?c0trZjY0alUyM2ptcysrakZSR0pFWG9WMWRwelEyUE9NNzJPcDlXNk5BNnpF?=
 =?utf-8?B?amMvTktFdUFtUi92ODZPdjMxTkZwSGVoUTJQN1UyejVUK1ZZNFgySHk0eWdL?=
 =?utf-8?B?MUI5YXJkMVFPN2loUHNiU1dEY25EU0lFSTB4bFJuWHovRXlZNlVxblIzbm9W?=
 =?utf-8?B?eVovSXA4V0JEOWhKaFo3TzJKYXh4WTVIblAwNFpNZVJUaERNcmxvQ092VHgr?=
 =?utf-8?B?WDluMzRldmk2c085aXhXbHZNYXBTS3U5aEJoR09uVjdndG9wT2NFV3dPS3I0?=
 =?utf-8?B?ODY3Rk1FM2s3YXlTeDhZeHRib0s0dnh2UGdONWdmTTZDMEZRMzliSkZWL0xl?=
 =?utf-8?B?Vm8zYTcwZ0FtNUp6OUl1b1NGcVMrWWpQWUk0Z1U5Q3JqOGFMZXJKR1M1c2F1?=
 =?utf-8?B?Yzd3ekxoRmYzblFNc3RmT3VPbkdncmhqOG52Yy8xYWYySHlVNHJHOTAvU0Jr?=
 =?utf-8?B?allLaklMblltVXJOMGpmZEpaU1BBcU9MeTZDM3RKYVBuMWUxai8zcGYzOVVG?=
 =?utf-8?B?OVFGcGpybGozOHBuZVFBbExjZWQ2NXZ2Sm8wVWRBcE9mbGNST2pEZFowTENv?=
 =?utf-8?B?K0o2bWZjazlzS2YyRW9jOEpVdFExRFlPaExKZjhTY05uNkRKTmpLYTBuZDVs?=
 =?utf-8?B?UFV1SmEvd2dlMkhiUjhEblozVW8rSU5lWnE0N25haklKNU1IN2I2T04xSmM3?=
 =?utf-8?B?NmtWS3FZeFcrUWpVZlIwS3ZSV0lXcVZFVGppRlREOEFuTE1takF3Unp5ZVVU?=
 =?utf-8?B?dXZrakJGYWtoUkV6N3ZrcEk3Rm9QSktZZ0tsSFEzbTgvalFxSmZrTVArV2xu?=
 =?utf-8?B?TE82elI4NWRLdGV3VTdkMEwycHR0SW15Q2trYWcyRVNwcVQrOVlXR3JFc2ps?=
 =?utf-8?B?WlNYK2poNG9EbkR1eDg2QXpQZ2pDQVpMMXUyMmphWDUzeTREMGlQOUxhanMr?=
 =?utf-8?B?V1lzakd1TXl6ai9ONG5PYzhrbE9MdCtHUmJzcXdhcGt3bVlaMEdoczJxUDEv?=
 =?utf-8?B?R2N4VEM3VVEvYVNaYnFjejZqZDYwelQwdTJGaitxSHNseW5STHhUSzQ2V1l1?=
 =?utf-8?B?dG1UeEN3MXZjNGg2QmJuaWdYaVQzWHFmRkw1Y0YrK2VjTFhVT3k4NHFTVEky?=
 =?utf-8?B?Q3JpbVdCUC9mRHFsMUdJY3F4czJBalZFblBiUkpaRWFmL0NKMHJkUm9ETG5x?=
 =?utf-8?B?K005YWhwdDJ6V1l0TFFmbzlJcDlJZUVoU003RG1kTHhXYmhJQjdWSkZnRzZP?=
 =?utf-8?B?anJNMEFMeEN6MHJoTG83UmorVkR3VE5XYkZoZ2t6UGNtZWVwdklzM1NVZ3VI?=
 =?utf-8?B?TGpiZEJodVh1U1RmRXhvUE1iN1ZONkpuNHJlTDNHcytFOXExVDl0dUVHMlp1?=
 =?utf-8?B?TS9rYjdTaStEUXZ4QnlyQjUzejhMSVdiYXRaNmRDSlFHVXlqdjJMVDhyNnpP?=
 =?utf-8?B?WkZtM0xJR1ZVajNVUXN3OTNCbit3cysyNFdPNVFVUlE2RlZicVBDSWV6Ny9Y?=
 =?utf-8?B?Z3BqUHNXa1JnSDY4WjAvTnhmdStFNHVJOTJGZFFZZHRRUlJIbTNkUnNncHhn?=
 =?utf-8?B?TmRNK0I3cmM1WUlkKzQ3UWI5bEN2OC94Zy9JOVY4UTdTVWtwbjFrSlk2c2p3?=
 =?utf-8?B?NU5zQkJxaTJiWXkrL05EVUYweldBeng4b2o1K0FORWZOQjBJaThrQTVqOG1X?=
 =?utf-8?B?cFo5VmVHTC94ZlAxajNHeThFVnBMNndrUDBGQXBPSFRmZlVZNFluTkZxUFJE?=
 =?utf-8?B?THFjSFg2NVVqdisvTDhvMlk1aC9CSG82RFQvL2ZCUFZUekprc1pNUitwdDN4?=
 =?utf-8?B?ZjNrZjV1ZHRqUjdJZU1VZGRDZjlIWVRmVkJTdENXYXhJdlpJTkdwK2FUQUh0?=
 =?utf-8?B?RmhGUnpNNlg4NHhYclpuSGg3WnE3eGhnblEyUVBaNm9ZcGgzV05nb1U1cHVw?=
 =?utf-8?B?S3ZOdGlZTW9OSG9ueEJDS1d0NllYaXJSUTc4UzIwT3B0alErZ3ZzdG9PcVhZ?=
 =?utf-8?B?VDRxRTNFWTZxMnJlczkvdzE1cnZqcGZyWkl4enM5bTdVdm9aRFpRVU9JcHQ2?=
 =?utf-8?B?bXZjRXozWFh2a1d5bW5mQTVzZlJuSE1kRWhRKzBtdzBJZEZTZFV6U2VNdWpt?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4945e1-e4e2-4deb-e04e-08dbe4866a7f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:23:36.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dj9ppqfdVK4+29RnpbVel4G9TZ6JOyKiT6pW1QzIOvf6On/Fou9r85wZXoUEQu9MHX/O4rfYA+rxxUq79Bs2TGWa42Hwf7NcvsgKw8bAuO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/gsc: Define GSCCS for MTL
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
> Add the GSCCS to the media_xelpmp engine list. Note that since the
> GSCCS is only used with the GSC FW, we can consider it disabled if we
> don't have the FW available.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pci.c       |  2 +-
>   2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b5b084590888..142783177e45 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -26,6 +26,7 @@
>   #include "xe_rtp.h"
>   #include "xe_sched_job.h"
>   #include "xe_tuning.h"
> +#include "xe_uc_fw.h"
>   #include "xe_wa.h"
>   
>   #define MAX_MMIO_BASES 3
> @@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
>   		read_compute_fuses_from_dss(gt);
>   }
>   
> +static void check_gsc_availability(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
> +		return;
> +
> +	/*
> +	 * The GSCCS is only used to communicate with the GSC FW, so if we don't
> +	 * have the FW there is nothing we need the engine for and can therefore
> +	 * skip its initialization.
Is that correct? Is this testing against a firmware image being 
available on the system or against a firmware blob being defined for the 
platform?

If the firmware is not available but was defined then presumably that 
means that any feature that is reliant upon GSC is going to be broken - 
HDCP, PXP, etc. It seems like that should warrant more than a drm_info 
level message.

On the other hand, if the check is about whether a firmware blob is 
defined for this platform then surely this code path wouldn't even be 
taken in the first place? This can only be reached if actually trying to 
load a firmware file at all, can't it?

John.

> +	 */
> +	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
> +		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
> +		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
> +	}
> +}
> +
>   int xe_hw_engines_init_early(struct xe_gt *gt)
>   {
>   	int i;
> @@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>   	read_media_fuses(gt);
>   	read_copy_fuses(gt);
>   	read_compute_fuses(gt);
> +	check_gsc_availability(gt);
>   
>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2fae45b9d88e..c09b51735ee4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp = {
>   	.name = "Xe_LPM+",
>   	.hw_engine_mask =
>   		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> -		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> +		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>   };
>   
>   static const struct xe_media_desc media_xe2 = {

