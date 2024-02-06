Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD7C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 08:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5010E5A0;
	Tue,  6 Feb 2024 08:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmLPslNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EBB10E5A0
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707209076; x=1738745076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pVW+39r2fpZMM54TKkueHH25KUjJCCoGRWAZyEKKMPo=;
 b=dmLPslNTXJYeUSk6gYoxwVLqNuRAzatCAD28okkwUkrjahzYeM0N2XDZ
 lXt4sLflebFyPoDzDnbpZueK1mYHPP6ArzlYO9ae5qHnrR5q8HAvv40oF
 QzfL5PzOV0/nlwufjLpMF+5wu3kK2n6VyFabyjXZl+opvsUQPAGtY3w8o
 LmAVCXjcA0iolCfavT3Zc0lWiC7Xh2dDuSidZ3VuBQxdL7AkUiKyxGXln
 8wjoTHwX9miN7KqCK6B5tFb8N5QQBaAo5v8NAgbcaofASbaG5rxS6Gs2x
 Hs4SuXO3/+cbkqnWzfmF1xFZ0HcNwnd+lMaH+FNYwkYV7yNbpZaBQ7and A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4488035"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4488035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 00:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="1271087"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 00:44:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 00:44:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 00:44:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 00:44:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 00:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SovlhmgqF/obbHFHjQny8URKmps4+ZF6SeDueap3qSsZgGVMOGOmUCPNjSnjlkH1qFItg3x+AJYQOp+tSZMaExGcOc/eCPnEp8GonBc0/6lvMzAzWVhsvgxzPQlvv5YvBnVwdKFEq16ANX/tFsl6tF53vwuWjFQnOBTmC9GTqlTgkmn0l4km+mTxn/J+QzEVFqEb53HWz1DqgwvkhWpnHP86bJfgnaF3fdUCQh/Q4aa5W6ESsQojkGmmm/tchhElwT+ZDehvyWgQngW/NiGx0664zKyE+q6ldgtnEHy/bLi2GbVjoLqJpm/RkFq4Iui726oudQ7Rivvp+L074jqOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2qyBmqN2wettaEcmaX5WkQCU1g4aAtO5AN7boMAQEY=;
 b=cKDJ8SnAJEfGg+vKscTN4nwvGr2BWYhqFE8kwpOrZk7HRpQY66OH6QJDzG0OpGvaMpAczISYeSz9WIa/E/PC1uV9/54gQd+T6K0Px7596aVyyvNiykmfanIKPKWHl1s9/cU4Ii80u0gY7heVijq93p9C8n4rQ9ay5Ma9MV60qHKGY82oHkeHK6ET/1DyRwyjL1ut4U8py1EAmtEfYxDULCzhJdtcAGtayQPIG7tdKLDsYjiXIx1Fx9zaNcG3PTQ5eH2/bSdozp3ndBR8hALejFDdWf+O1QHrL4dpncY33UA0mc4AU1+aZC65MlErbswlgHYnzWYfaJ6hHV8oPoctxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 08:44:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 08:44:24 +0000
Message-ID: <30bccff0-56d2-45a4-9709-34f3bd83ed9b@intel.com>
Date: Tue, 6 Feb 2024 14:14:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: add debug logs for D3cold
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20240206055917.2629027-1-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240206055917.2629027-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8fcf97-d496-46a2-6446-08dc26efd23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6eynSddSwwqnWLLpPrzY6YCHQ2ZeF488WBV+DIkj+HeqRVoeNTTjqZRyVvQN7NIIqPdVlnVVHNdSonNO3KxhqdzWWO/X48Ofvry0LLiUQzoOajBpaAvVNPjETqnvCqaxI4m70VNMepyOiihL14wN7EQp7T+WaUgpOPwTMuChXrGSHogaT6lFNw/x3anA+0sHVyAg2HM0jMopflSDowwHPAmpBRBAmLoXAjUNOdbJmbK6nIOtMwAZR5QSVLQsgOvYMYMu/7RzAsej8YDszibDOscMpA/dK80DgmvkTELj2v+oLGPMYutNgZas8eSN0STye8nhEwt/4ttvahS5mthCGFXfvd6rE8w6d6JubS2VpI9+hQX2ccmVKDCCx763hsix+OJipueanuj6xSc+iUGpbJSXWeX/qMs1PGqv8OeeBW4qd1VQhGDJDVX11RE5kDmoWm74TJ7IRyDjlfUxCwxRPYYdzYGoPd9NifZT/z2DWPejXNuffBI5vAlMsdqUN1KKh27uVcwyAyMLe2KkSSvDZ3V1esDchQFRD4CSSPMK9f0cK+bq+xiVJlbqLWeCNlY7JAzVBZRHAqPDaPOkwP0St27LXfzmDILvsxdQVWAXf6pLuaLPO50zBu68qcEYGah2C6UwCKj1OnnfQn4LteD6Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(82960400001)(86362001)(31696002)(53546011)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(4326008)(8676002)(8936002)(5660300002)(2906002)(38100700002)(6512007)(2616005)(6666004)(83380400001)(107886003)(26005)(6506007)(36756003)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhmKytrZHJBRmdDZjMvc0FQRW1yKzNIemxoSjl1aklWZ016YnBPc1pZVW5M?=
 =?utf-8?B?bUhIV3lMUGdkbWRGTmlJNmNzWmdvaC9kSzlUQ241MUwzSmw5cFllYWhMRWVq?=
 =?utf-8?B?VUdOdFg4cGllaG05UnB6Vzd0SHVaUUJMbTZUM0M5V3EySGpkN0Z0U1dIcXRJ?=
 =?utf-8?B?MHBpVGcwMlNOTVhNTXBQV2R6SGlsVnMrc2VOL3AySjRYb1pQcWhpNlA0Q25S?=
 =?utf-8?B?S3RRREtvaUxvMmk0dXFTYmpEN0dicDNaaCt5K0xxNE1Lc2V6R2xoWjBPQjcx?=
 =?utf-8?B?WVJodmFmRjR0eUVzWS96OUZiRTJoZ2FtNzZJSTJaZ2p3YlRzdG10R3JWZm5k?=
 =?utf-8?B?TGxiSTV0UTdIcHRxNlVSbThUMjRtUElwbmFIcE1YdkV2TzFEdFYwcXJQTzB4?=
 =?utf-8?B?WTlLc21YUjZGaHkvcVdybmtSVHBrbmdrNmpHbzZRcFlITVNxdzNVNXpWVGZ6?=
 =?utf-8?B?eHRNNU54bUF0c2tMMkZHWnpBTXlFVmRlc1NDUXdEUzYwaUZWZlc0YXBielpr?=
 =?utf-8?B?YXdsS2hUeWZLY2k5K1hLTlhJWlVyTzJtaGFFWmVpWXk0aFEzUFc0a3ZsNmVN?=
 =?utf-8?B?clpHWXpGVzltZGZ4YW45SDJwUDZjeTgwSUIxTllhbnRYSmJRMzVqYWcycC9G?=
 =?utf-8?B?RzVHNTBYNTV0cEZJM3hJM29BeFpRRzR0cWo0Ti9WaktzNHBLbWw1MWJBRWh6?=
 =?utf-8?B?dXFMdlg4ZnJoSFRNNVJJZUo4UXp3WmUvUjJYc2NSU3cxbzBiREVNczZ0T3hB?=
 =?utf-8?B?TjJJR0pqN0Q2eW9NWHhpeTE0eVBZU0FoQnptZHFQeFRpdHU4TXRGdCtHUnZU?=
 =?utf-8?B?WmluVE9FR0pFRisvM0JMYnJGcWVSRDYrMjRrVk9TREtTWGdiUnZEUjAwcTRh?=
 =?utf-8?B?VEN6MnJOWGpKVXVETmplNCs2VHU1T01rdExVY1IwRnFzNmIvM1kzNmhRcHlO?=
 =?utf-8?B?UHIvcTJHalFxdVdaaHZ3eE5LT3RTZTIveGthRmJpU2lncUppZUViRDBMaUVl?=
 =?utf-8?B?bDFZbVlneTNYUjJDY1YzUnRSN0xINzFrLzJhbEFLZ29pRHlPb0RkVW15UHpL?=
 =?utf-8?B?ZGUwaGJzcHVGeXprcVlqUmsrdzJWNzlHL1hPTkxJdkVIeFBLc21mNEdrTDJl?=
 =?utf-8?B?WEJxaDN5bHQ3eVZNYVA5clkzQVlZOUhEbk45bHFCR2FiVWU2N3NYNWxqQkFZ?=
 =?utf-8?B?RGQwS3Y5VHByallUMzl4NlJyTUt2Rjh2TWdxeFJCcDBkRlFCWjY4N1I5ODVm?=
 =?utf-8?B?QVc4bFpaWndxY1dCN0xTdHpvV1RiRmJNbVRHZlhZd2RyejJsdDVGdkNDdFhn?=
 =?utf-8?B?UnBSamV2TjV2dW4zK1ZjS3hsd1JlVitqa25MWm9PUlQ5dEJBSXlsYXUwUDU3?=
 =?utf-8?B?UlpmVWltVnZUUXo4eHdMUy9ZOFIzT3VrZGkzTVlVanN1MUlsTDhPTXU1SFZW?=
 =?utf-8?B?YmdjaEJuRk5aVk5OamtlTnF4Vll2NzJMYlZnRkVYbHBNMGYydHdzaTFlWkRK?=
 =?utf-8?B?MTY3M1VXdFArQ2ppMXphM0p1dzExUzA1RFFRMUFDUDM4TXFaZGY1NDNWYVA0?=
 =?utf-8?B?dkdxQmJhOVFoaDZHenA1OVhVS1J2VzdoM3U1SjMzdGE0QVhWbm5kSTg3NWdx?=
 =?utf-8?B?eDh2cDkvbS9iaGNETlorZVlxMmYzelVCaFc3S2FlNHVidVpBQ2ovWlZLUTI3?=
 =?utf-8?B?ZEtCSjBZck1yaklBTk9GWGF0bjFEZmxEcW5wMEVSOGI5QlBBYlZCcThlNzdY?=
 =?utf-8?B?RG9Za2h4VW1MZzIxLzg1Qjd1NEFBdUVLN3MybEpoenoxdnhzYTBSYmJRSkF1?=
 =?utf-8?B?OEdpdnR6WjIybFJkV2dOOVB6OUtQOExvTmd4TFNiWmxVNm9iUGxrZHBSL3VY?=
 =?utf-8?B?Q1JRd1VyYnRwbzNhN3BkYVpGN1Nrc24vTkxWa0tQbnlOekZFQjExQU5GbVpE?=
 =?utf-8?B?TTY0UGpxWGRTSWxhV2J6c0oxZTZJelNDSzhpY2RxRTZqZS9aVW85b0M5NU5x?=
 =?utf-8?B?Z1VUVG5ZRlRQQ2VCbGNuOGRMb1BUaUx3RUoyMTlBL0IxR0xLdElDelNoVlMw?=
 =?utf-8?B?M2lLUmRSNGxuSHFxT2R5Z01CYkVNZFdIMDZML1ZqNHcyZzVpeStIK2dDcW1t?=
 =?utf-8?B?NGlrNXk5Wmd3eXEzczg4UzB3cnkzV1BpL2tiaGlseUZJcXByTDZXZEpnUXoy?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8fcf97-d496-46a2-6446-08dc26efd23b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 08:44:24.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BMfHHBClRlCTUloLJbnSAMQleJBAyVmXgcCOFgEGeuGcP8UVcwvEQG21gTZvCZ2V8FLsGT+Ci3Qez4CMzJ1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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



On 06-02-2024 11:29, Riana Tauro wrote:
> add additional debug logs for PME# capability and
^Add
> presence of ACPI _PR3 resources. This is to identify
> the reason why the card is not capable of D3cold.
> 
> No functional changes
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d5f219796d7e..3d55ff77f7c3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -125,17 +125,26 @@ int xe_pm_resume(struct xe_device *xe)
>   	return 0;
>   }
>   
> -static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
> +static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
>   {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct pci_dev *root_pdev;
>   
>   	root_pdev = pcie_find_root_port(pdev);
>   	if (!root_pdev)
>   		return false;
>   
> -	/* D3Cold requires PME capability and _PR3 power resource */
> -	if (!pci_pme_capable(root_pdev, PCI_D3cold) || !pci_pr3_present(root_pdev))
> +	/* D3Cold requires PME capability */
> +	if (!pci_pme_capable(root_pdev, PCI_D3cold)) {
> +		drm_dbg(&xe->drm, "d3cold: PME# not supported\n");
>   		return false;
> +	}
> +
> +	/* D3Cold requires _PR3 power resource */
> +	if (!pci_pr3_present(root_pdev)) {
> +		drm_dbg(&xe->drm, "d3cold: ACPI _PR3 not present\n");
> +		return false;
> +	}
>   
>   	return true;
>   }
> @@ -171,15 +180,13 @@ void xe_pm_init_early(struct xe_device *xe)
>   
>   void xe_pm_init(struct xe_device *xe)
>   {
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -
>   	/* For now suspend/resume is only allowed with GuC */
>   	if (!xe_device_uc_enabled(xe))
>   		return;
>   
>   	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>   
> -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>   
>   	if (xe->d3cold.capable) {
>   		xe_device_sysfs_init(xe);
