Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8323CA0EC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 23:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7560F10E20B;
	Mon, 11 Sep 2023 23:54:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485F10E2A8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694476475; x=1726012475;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tzYm+UhtSx2PhOqA4rSuLWY4Q+stbj6qUOFPXLckjBo=;
 b=lUOkr/zc1gyaBoBrZVC5DVUAQ1w2iskyH+BB/fscuHneNOlFsragW5Qw
 9/EhKNKi2nJ2lHiQEDzvVC8jiTMsjwst+sDghJRKvnsEPvn49SHt1IVpc
 SSqgDmAeU8IVMU2ZTme7CPULf/T6obxqzFrpSbTcWvNmi9N7XsEGtHd9p
 2rbtu15UKmkrkNv0RNxta1A+n4GRMaFJ7nRrQIkHAWjq1iAI9gkDKC3S1
 gC7lBfabQY6R1lfWs8/45EZiqHG2eHw3l7VQD8fFxCGx6nfuZLTIEEXi+
 yrK08QsKF1Y07ezUzBsDLIRvjy0Okcs1c9/iAkTq0E3Wp+JEoXL5DmtQu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363271618"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="363271618"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 16:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746630272"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="746630272"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 16:54:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 16:54:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 16:54:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 16:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWKlF6oqL6eNEOE1zKgXge/TqZcpG91xaGy+9QpwTqhN2PIj9ST8O4RC6DJfMl7SuLgEH0Yv1321GkoAEu9P9/OVZE02rHt9ATCuvqAaili8qcYtgYG02ps+gRo/nzZFOEVElEwWgqreOgp24cW9vnVqzliaLHuAtnHSrFHD0pc5emQG6OMXT16kZHOx/pUiR/VDgOPDMdrhWL8R3beg0AWsbp9UbPqwAwSVbXdgH1Bcv3IJeNmi6dukoLFCYRLPeHYsrbbDkZ85yEWbrDpGVPsR/TjCBZoe4gagfrMaDmByykws93IgkLB+J1WKHOmhe/GEbGlK1G4GC2O8O/5T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCYJfqVC+jb9blnEDiW7y+qE7PKY5u5tcq2YVabN6hg=;
 b=CaXaOsbj4rkmGp6z60/1/Yer9r5h1WSC6tJ4/xGfr+DSJQt4Sh/5WIsLr90j5t29ndFcu+6vNUyJpPkAPvJb6/3CDTShW8QXl7n7A58wshSovQ31Hv12quqFPwFdQnbHYcTpv83jg3taAur9EpMKBaN/bC8WJGCcDbHubShXNwyK/vWmknreHG3xYDwjwOan/cRgkcrMTLECzpQcNw+VxQoXXlH9ACPiCFI146VQvKqUYJT1F8/wORrKhMwpYpXUcCibmGbIDZvvoRS+wck0P+JjaBFPgTg56HryKFLLPo9DruQRFzkkFvojE+nSK4Ac9/JFV6fZ4adBvJXdCzFNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Mon, 11 Sep
 2023 23:54:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 23:54:32 +0000
Message-ID: <ba6018b2-ba65-99be-ab77-2b1b2b663fca@intel.com>
Date: Mon, 11 Sep 2023 16:54:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWH0EPF00056D15.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:1e) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e5c3d3-f198-46c8-9fe3-08dbb32271a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJy+v5u5235bfB2eouzWU48K0jBgmsZOl6cYPgQwQfKbPMCUcmAgQVPZoTz9KIEUfUcLfwBiL6in59diTazfGWY6X2CjeQ3MTqpx30wyIUJznRoDuuxj2KGugli/pLDOR+i/+slhFJv9XmlwuZfIPrH866b9kEL/7qIoUQFRaS1UEmLkwTAq005/w1HKmT36n/W0TCO//8voQXSIHqXSTJBcotuHMBVw4lmUGZl/ad/Nm1+7EfieDkJpcaeZAocUIVQi0nKfz/tZ5JYT1u3M0tVK7jyxelAam8bTB50+PAKOSeFxDAjCqS1l8NKOC+JjOQnurGOabEkO0RVTl3pPXpMPGl5LuaZXcvh5NtUW3jZx3ANg84flUZj87y2XB9R96kBZOhptbEnKwVi8gmJfCstEahhIWKLfrCrQ1jx5wA50XjywBxxywoYScmWzctY/0ll/9Jj518cInNPPJvysuOJ12m2Uinn8+L3bdZ2A3VBTMO0BiveYKdKjjYaz6vfnInmOxMS8YkDVmibrpRhNX9VK4CTwZF9cMffc9sF+5qwoikgxAeLhivU1BUkgXVq7ZNdd3VpzQx2IoF5RFcXucFRe+mkkRbuRflMem/H/yyJD14dQEdtr9uCimYoXkBN0Drlr1waQu/aEjAp3PeR0Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199024)(186009)(1800799009)(2906002)(26005)(107886003)(316002)(41300700001)(66556008)(66476007)(66946007)(478600001)(5660300002)(4326008)(8936002)(8676002)(31686004)(6666004)(6486002)(6506007)(6512007)(36756003)(53546011)(2616005)(83380400001)(86362001)(38100700002)(82960400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVMxQytrV2F3ZGFNZmRMQ2h2T3p1UW5BK1Y2eUlyTEpuSHFuV1E5Mkl5VGpr?=
 =?utf-8?B?NlJqTkVSZDgrb294TjBmR1hsazhEUFFxR3NIYnZjcmM4RVExUUc0TjdzbGY2?=
 =?utf-8?B?Zk5BeUVPVmpRcmFqTkp0YXVsZHhIUlFYZGYva2tNcm1DUFgxcHVLWElVVElF?=
 =?utf-8?B?N1VwUFl6Y3p2eHI4cWZMU2QrcmRBVFhPOENWUGcrWFFXQmpCUFkrMzJWMVBn?=
 =?utf-8?B?N01oRW9HUGdGM2VKRFpqbWVRTGJud21LZmhVR3VXNnZ0Q2pjV3JRc1BhMVNn?=
 =?utf-8?B?ZDNpZ2VsT1pPNUZVdzhpSy9NdlRhTlZtYll5cWUxOHRnc2hWRy9BdHJXN05u?=
 =?utf-8?B?SHB5Mkc1QUhYbVE3a1g3dkdYM2I4VDZGZlR1dXpvQmlsNkF0cVJqc1QyNjZm?=
 =?utf-8?B?TFFWckE5ZzBnOFlFUFRvSm9vdjFtOWdhdnUwUDBWd2JzVTk0bWkzSnBOcUNE?=
 =?utf-8?B?QzJyQ3ZLeFNjc09FQnBLcEFPZHpVNDhyaHdXc2EzZU13T1UydExpeTc3bVZk?=
 =?utf-8?B?bDQ5UTVqTlJqZWFjQ0ticEhWdkVsUXBwZXpQMTVWcEZNOTNqckUvMEN6eHZ0?=
 =?utf-8?B?c1ptMHhtdlBIZkdlWURrWFNJbkN4ZnVuUzhXeThVREFNVnBaaXMxN2NrejJv?=
 =?utf-8?B?RWxkR20yWEpiVXMveFdTUVNxcms0QjV2QWdvUFBUQjh0ZW1OM0tram5VM041?=
 =?utf-8?B?YkowQndyZUdCbXdTZjFCbXRWMHc1VStuMWNxaXhJR1Jhei94Rld2VlJuMnUz?=
 =?utf-8?B?aTZUZHVUU0pvMysvT1h3dHhQVXM2Qmh6b3FKeXdFNHpLWHdQZDIzVG1uR1FG?=
 =?utf-8?B?RXJpcUlVckRFSG55aEV2cEJlMXlwUmp0eDBheFQvQ1p5ZU5tSlUwRkJxaXV1?=
 =?utf-8?B?Z3FLcDBGZ0Rad1RidTk2STRCcEFZSXdYMjNDdEp4MnoxSExOSEVOWlUvTk5o?=
 =?utf-8?B?NmlTbThZcm5JY3BIUUYzYlFGdE9kN2FMMjdTZ1h5VjlRRTRBNzJaOFh5NlpT?=
 =?utf-8?B?M005M3RiclQwM0FabFkrL2Vna1hVQnZLeXErZjY1MzhTd0w3UFoyellyQ3ky?=
 =?utf-8?B?YmpFVEtQWnAzRlZ4QVNQa3k2QUpSYWl1R2Z4OXA1ZTR0ZWYxUnJSTWZzS2Jp?=
 =?utf-8?B?QUZsaEp1SGQrVVdRL3dpemZvajBwNlFDMUYrUW14NGc1THdnR3lXMWJxR2xY?=
 =?utf-8?B?WUN0Yk9CZEN2TXl2UUF6ZHdwUDV1SWs4QVoyQklWWS9zQ3V1aEtXQmF4dzFQ?=
 =?utf-8?B?VGQ2OVljTzNQSE1oNkUyaVpFWjlid2Y4NXBkNXRJSXRocmRuWHp5ZWlnY1JY?=
 =?utf-8?B?Rml2S0NvY00rZ1VMR2kvQmdQZmxsbWhqQnFHck9hOHc4OW9JLzdXNTgvNlZV?=
 =?utf-8?B?Y0dtMFJtWWpWRTZFdEFERlhEaS94Zy93c2VVRGpJNm9ReUludHZWQ2ZjMlZl?=
 =?utf-8?B?bGx5UDBiU0Njd2NxTWZkc2trMStPTDB6WGlta2lDeDJ1czlXbGJoQUpmRTVt?=
 =?utf-8?B?Z1JCTGxwU2JybzBISXJxWi9OWVFweDhWMHg3TWpQdjRjMkNnVnJ0Uk45QU1o?=
 =?utf-8?B?dExDUEJYSlpGdVJmS3J4Ym5VQzQwUmQ3L3YvZnU1S0ticUlMM1I3aTJSbTBD?=
 =?utf-8?B?bS9MR1pLeko1bktXeHNHYmM1Tk5FeHBWczg1Unh3K212Q0s0T3VlSDlQWVl6?=
 =?utf-8?B?V1dXVnBMdWRET2xDbTl0YitYUjdwTnhERHYwU1FuQnpTYmtzZTM1Q0VDWXkw?=
 =?utf-8?B?SlFkUnVscHdjRXBBK3lwVHdxNTdycElLb2hTbFZJSEZOMDh0b0E1TjY4RUJ5?=
 =?utf-8?B?UHJVK3FRakgrMTZJMkR0MS9MVjFxb3ZNNmhidnhSNFZhQkVrREFyMUhPbURt?=
 =?utf-8?B?MUVycDBUZjRvMm85ZG9YSFhiNWhUT0NKaE9XRzZ5ODRIejdGOU9mUUVJYTZJ?=
 =?utf-8?B?N2NKazU5akJCZ0FXU2hUTDF2Y1VIY0U3c3dHRURPcEJTc1JkQ0tmeHZlR0xJ?=
 =?utf-8?B?dnk0Q2g1YXFNbHRCbWxMcFJPR01oZ2M5dEx1cEQ4Z3puRGRlUStvcy9LY3FS?=
 =?utf-8?B?NXdhc2hXOTNIb2J2L04vSnBjSHJlZTBkTlZFVzVkNG1TVXlsdCtuQmJXV2Rk?=
 =?utf-8?B?V1ZJN01jczVDVXB3ZFYrUXJQbjR4RG5mUVc5WlMrZkZnd1FKY0lYTVNGRXE3?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e5c3d3-f198-46c8-9fe3-08dbb32271a9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:54:32.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eJNRavVfSZ88+Ven6eWrv9UcAflrbEGAbR7ruUIDQ3zD98PQoU+jdI4CAG4lTBgCS6DNVyp9JWZXLcoGRF49YMEDqlnxU6vnG3sAYXcNcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uc: Fix uC status tracking
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

On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
> The current uC status tracking has a few issues:
>
> 1) the HuC is moved to "disabled" instead of "not supported"
>
> 2) the status is left uninitialized instead of "disabled" when the
>     modparam is used to disable support
>
> 3) due to #1, a number of checks are done against "disabled" instead of
>     the appropriate status.
>
> Address all of those by making sure to follow the appropriate state
> transition and checking against the required state.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c   |  3 +++
>   drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
>   drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
>   drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
>   5 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2493c5859948..7cef5dcf571e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -228,6 +228,9 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (ret)
>   		goto out;
>   
> +	if (!xe_uc_fw_is_enabled(&guc->fw))
> +		return 0;
> +
>   	ret = xe_guc_log_init(&guc->log);
>   	if (ret)
>   		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 177cda14864e..35e2fdd07f69 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -42,22 +42,21 @@ int xe_huc_init(struct xe_huc *huc)
>   	if (ret)
>   		goto out;
>   
> +	if (!xe_uc_fw_is_enabled(&huc->fw))
> +		return 0;
> +
>   	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>   
>   	return 0;
>   
>   out:
> -	if (xe_uc_fw_is_disabled(&huc->fw)) {
> -		drm_info(&xe->drm, "HuC disabled\n");
> -		return 0;
> -	}
>   	drm_err(&xe->drm, "HuC init failed with %d", ret);
>   	return ret;
>   }
>   
>   int xe_huc_upload(struct xe_huc *huc)
>   {
> -	if (xe_uc_fw_is_disabled(&huc->fw))
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
>   		return 0;
>   	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>   }
> @@ -69,7 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
>   	struct xe_guc *guc = huc_to_guc(huc);
>   	int ret;
>   
> -	if (xe_uc_fw_is_disabled(&huc->fw))
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
>   		return 0;
>   
>   	XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
> @@ -106,7 +105,7 @@ int xe_huc_auth(struct xe_huc *huc)
>   
>   void xe_huc_sanitize(struct xe_huc *huc)
>   {
> -	if (xe_uc_fw_is_disabled(&huc->fw))
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
>   		return;
>   	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>   }
> @@ -118,7 +117,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>   
>   	xe_uc_fw_print(&huc->fw, p);
>   
> -	if (xe_uc_fw_is_disabled(&huc->fw))
> +	if (!xe_uc_fw_is_enabled(&huc->fw))
>   		return;
>   
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..368e4feb57db 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
>   {
>   	int ret;
>   
> -	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> -		return 0;
> +	/*
> +	 * We call the GuC/HuC init functions even if GuC submission is off to
> +	 * correctly move our tracking of the FW state to "disabled".
> +	 */
>   
>   	ret = xe_guc_init(&uc->guc);
>   	if (ret)
> @@ -43,6 +44,9 @@ int xe_uc_init(struct xe_uc *uc)
>   	if (ret)
>   		goto err;
>   
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
>   	ret = xe_wopcm_init(&uc->wopcm);
>   	if (ret)
>   		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 2e70dd4880f6..fd53ef9e5c99 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   	XE_WARN_ON(uc_fw->path);
>   
>   	uc_fw_auto_select(xe, uc_fw);
> -	xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
> +	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>   			       XE_UC_FIRMWARE_SELECTED :
> -			       XE_UC_FIRMWARE_DISABLED :
>   			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>   
> -	/* Transform no huc in the list into firmware disabled */
> -	if (uc_fw->type == XE_UC_FW_TYPE_HUC && !xe_uc_fw_is_supported(uc_fw)) {
> +	if (!xe_uc_fw_is_supported(uc_fw))
> +		return 0;
> +
> +	if (!xe_device_guc_submission_enabled(xe)) {
This is generic code for all firmware types. So why specifically check 
for GuC submission? Can't we still load the HuC even with GuC submission 
disabled?

John.

>   		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
> -		err = -ENOPKG;
> -		return err;
> +		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
> +		return 0;
>   	}
> +
>   	err = request_firmware(&fw, uc_fw->path, dev);
>   	if (err)
>   		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 9a85bcc18830..bf85d4fa56cc 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -139,8 +139,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>   {
>   	u32 base = wopcm->guc.base;
>   	u32 size = wopcm->guc.size;
> -	u32 huc_agent = xe_uc_fw_is_disabled(&gt->uc.huc.fw) ? 0 :
> -		HUC_LOADING_AGENT_GUC;
> +	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
>   	u32 mask;
>   	int err;
>   

