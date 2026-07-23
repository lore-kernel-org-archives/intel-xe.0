Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F30C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D4110E5E3;
	Thu, 23 Jul 2026 20:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/zCV2M7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E393A10E5E3
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784837437; x=1816373437;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TYgEbam99fhdm7SOtT7LqW4rxl38pMtYnLM8ESaXhq4=;
 b=S/zCV2M7qvRII7PZADAyxx4wOY/OskeDFHY3u+3I6p7ojm6mNucKUhGy
 Xk9BhSwbpgjZAU/V6LWyig2AF9dhqQTV6n1i4VfySklDznbxSXiD8UtXs
 rfSstv2lXhUq6XsC/gQmruHNrDa0MRdT8Rw4UxJ1h3x/SLiVfeeqEQrQ3
 iQt7frcSmJO6RedJiJ0XGmkrPAXcHkJvh1XLXGljjqYUMv/3WL0pUy7/9
 TCljw6XK5sZmG61xDtb/KM2SdsGJ72nXO+I8SbGUJ5OotbHlG4aYtDHvn
 +CV7osSrNw5uGgiznXjZJdbJ9fOkFtJRA2M1XW5mmOHkOzcs4EotoYgHo Q==;
X-CSE-ConnectionGUID: jWmlsy9nT8SBwBeqprtLJQ==
X-CSE-MsgGUID: YybuMCUKSA+/6jefnJPn5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84630243"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84630243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:10:37 -0700
X-CSE-ConnectionGUID: hjSi74w6QRemQuK52AgMSQ==
X-CSE-MsgGUID: WJ/zj8AfRK+uBGTx+NNHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="263482050"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:10:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 13:10:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 13:10:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 13:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfc0hH6c0wbpR9Js/NM0K+RYZuq0qvhuZFWTGM+x2qcIWEm46Zj115sx2JDLnvDZCi3d7moXROVx9fFQpm44PFbbVkvNyYamP6elL1dhKNDN04Q/JkmQ6B4hoU4Xz1nYrFEbRqZPZu+V/4r4dH/6ioQulVAxUOVpZuoRASODp0VdPaqT1YYYR/K2mZYS9yuP8lqH7Wq65LW+SomVSgqPhb/3DHy8DnnPywsjqdn5+mDWkZiOvPJP8A6zDO0ffJbwpjbJDteSZdQedM6q5aTwHqo6vNHEnpAoofzdljzpogB2iJGgg5FcSnkkKOgD9GPsRTnvUxBNJHhi73bQw9Cf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpDPLQtY3hbUfoPQZ6UGLAOSHcrm0wOauEtmJicNKv8=;
 b=qd7hF8HBldpRD65HqUTSz2IdKIbjZJPp4OnBx9hLdGciaTsgq96jFT8PtDuFkuDzf/1Y1Cc8hbyWiirf5UtKnMdia51TGmqZaT4wvizLCjEb4Tu+F3s4airSrfjU+QWgJYEV28AYSoWfU8aIvOWbaMCEdi1aUdlk0JnnfRviuRKHDgOW3o5PQiXISgMwCeuHXarTDofS9qg9I3Gy9OXugTub/NPZFSKatATR+SLXxXOMzduER9L48vL95K/CN1j+GO/vv/7DGVadRPY+zhctdVp4DI12iE/LDlyxDtZWSAARzSMiWHxZ5ZQ51oXKK8e6JHGl5XphV0ECb/WkhgoONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ0PR11MB7153.namprd11.prod.outlook.com
 (2603:10b6:a03:48d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 20:10:33 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 20:10:33 +0000
Message-ID: <db441eaa-87d9-448d-b5e0-41593aba1a9b@intel.com>
Date: Fri, 24 Jul 2026 01:40:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] drm/xe: apply debug page-size allocation policy to
 user BOs
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
 <20260722143759.1718600-5-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260722143759.1718600-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bf8d0c-f259-4aa5-b751-08dee8f67347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10086099003|3023799007|4143699003|11063799006|18002099003|18092099006|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: IyYPegmUbmWmDA8mGOD9N/yYgFEQuXJhRMup6+GucBikQrsklG9ct1Lsc2wkte2k56Di0ymVet3mvpSrkHBpOqGZPTLWHlCLP0K3SbvW5r8jIeDxyYqurCmK1pWDoPV1WUcShEXAvBo36HbX/FdiArfSv6nU+y2vRidMCqMd4J22FxDExzOExt4p5f1aYk39AnXTkkc5njkfrmchJ+DCDTbLWWqlEVWpQVvNA0tVFnWJkt5WqOhWsX/Ng0WVba+wWqSa4tYAqR+ZVJ6Mdm9Z9PEGGgGv8zboKft7L/2ZA1NwxHCIo43t3hm/N7nz+YzxQO75zgZwSxo7+537kFHmrwshbNjhSE+GwJ+/mDefDqVwYLsbZ0spYGcoguzGXtbgSNzHsSKv28A5LJ5+ZiNFZ4D6Fuyb3eR9F0trr92u5PgKray99Z0y0eTgjecaon/4FkLAOrn/2UkmJ3UYm1gIyi1Om7sp1FO+2GU6UJj/oNNnkV6MyJxeInv+gnNao4ELrsqfaIMFubLmwDsuoXbhiiu1qWZ+5JIT7fgQxaxtdrDv5EFZjLWX9wPKQJH0Zu359r0M3aFkGOqp7zjCYh7cbPgkEWNEqWmaF+ux6u00J9fbC1pOZyoxkJxy0tUOnVfLpHv3jaHylcE/ke6Vne9RdiFLcLiKF84j2J0EanBB9PA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10086099003)(3023799007)(4143699003)(11063799006)(18002099003)(18092099006)(22082099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VRclA2UnRxeTJPdVVyQm9TTDllaDFDZXl2S0pKOVdxRktYMU9Gd0wxZmhr?=
 =?utf-8?B?QllpWTFDc1F1QjNMWkZSRXo2dTFsd3phNkRHVXVFRjVWOXo2cGJ6NWhOMXlF?=
 =?utf-8?B?b2p3Mkg2aDBycmJ6SHJhM01KK1ZNeVFPZkF3R2xybXEwSGFMbmdDVGZRSWxa?=
 =?utf-8?B?dVpFbXJSNFRtakpmUWdMMjluY3pYc09ycW51TS9jSytOdnk4TWl2cFpEUXhR?=
 =?utf-8?B?QVprK1M2VEx1QndDbzVpRDQ1RDF0VXNPeXNmOEl5ZUhpNEZ1MEFKMFkxTXBh?=
 =?utf-8?B?N29UUGFaMUx2YzlaZU5OQW1rWDk3WmRWZ3Urc3FDSGltTGFkUUZzNERDVE0w?=
 =?utf-8?B?TnlENHFrYmdmcnRHYjM4dE5qUEhFRUNjNVFLUEdKOUJrUTZSSVFCR1ZJSTA0?=
 =?utf-8?B?YTZpV0NlL2sxcGpYTHIxeVVrckJZSzcxMkZneXNsSDZuSW9DSEJrOVcwdU5q?=
 =?utf-8?B?dEZPZkVDbU9VMzc4Y3grZHF6NzZUMjRDZlJvN0d3QUUwTmtjaml4MXNTazBG?=
 =?utf-8?B?NWNyZ2hTM2Iyb1g3dkVKT04zUWM5eTVTcU0zWklRdTdzd3BoVCt5d1FaTHU4?=
 =?utf-8?B?OUsxeUExRHBITVNsQ1dKQko3MEM4dVBGc0lNMk1IYm9vV1hvY3JOcFU5bVZo?=
 =?utf-8?B?bjY2OHU1RTl2ZnV4MmFnV0dxMW1rUURVYkQ5OVFmQ29NcFdqdHI3SU5DQ21S?=
 =?utf-8?B?QytPYzZuaFgvME43a0p2SXJtS2FQWHdzVHYxd3hRa29pK1JrZ1Q4WXdHYWps?=
 =?utf-8?B?Y0FzV2wzK0U4ZHVlNXNPV2E2Ri9McDJ0OHdHZ0JaSUZOaUZNejV2aVp1K3dE?=
 =?utf-8?B?OUlpc0pOK1NhNE8wS01XTTRHTWJuZEMyQVNaWDFSQm92MHFDSytZeTR4OEht?=
 =?utf-8?B?bDY4NFdiRnkyK0ZSZGdkeHp5TEZ3Q3RKVHpLZGoyZlZTcjBkWFZpd0dTaytT?=
 =?utf-8?B?NHpqRzlJNVRSaTVvdVZBelFqNitweThUeGRwdDZIWklSeGJ3OHZ4bTlRdFRP?=
 =?utf-8?B?Vjl3Y3NGNGpmeU9EaExkK2NzRVV5OVFJY0VleVh2VlducUtrRHAwNW1Ga09x?=
 =?utf-8?B?QmdvU3MxbnJnUGJzdExNWFIxZlhvdXhaS3d6NVVSeHg3R0IramxCVmtOU0Ex?=
 =?utf-8?B?ZWZXZlRuaVRMQzNsOFZYQnZBaDVBamV3Uzl0aUgrMzVNTUpjdXNQNEU2dnow?=
 =?utf-8?B?di9YQ2w2cCtGOXRwRjY5QVFJTDNNa1hTaitFV3lBb2VqUzJuMFBoZ3Z2cDBQ?=
 =?utf-8?B?N1U3WFRtajNNbGt2UGFMY1BDL3pPQnExUDZ5QnRPakpzOWJJNCtYQVQ1SkJP?=
 =?utf-8?B?MGlEWTg4R0I3eUhPcjd4TnlNcXBJSWt5a0xGVkt4SFo5WlhIQng5bVFFdU14?=
 =?utf-8?B?UjVtZlZyRHF2SzlNK0VLWTlUOWJsNDhYY09lbHN0S2FTNEtEeUlCU05RMnhI?=
 =?utf-8?B?NGthbCtkZHpNUTUyZ3NxWnR6VW12TVNObG44cE05bHVmajBNbHkybmR1Z3JR?=
 =?utf-8?B?YTVFSDI5TE04M05UaHAwbndvSTE5RFg5UGpQUjVkNmhQQmYrNm1ScjROcXFm?=
 =?utf-8?B?MytQUmZlQ2VKeEJpZWZXNGxjMFpDSnNFYzZkaUd6UXVVODhsN2cwUFZjRTdt?=
 =?utf-8?B?UkxoRjlyaHhhWkFtMGFueGZTclZMbnpzU0taTmR0cWUvaVZ6dHpndmZhWGIz?=
 =?utf-8?B?ZGlwN3dXR1dQckZ2UlNSbGtncVIyZDlLRmt4cHBDWkV6bnpHeUkzK2xJbVBE?=
 =?utf-8?B?Q3l4cmdKaDF1ZTd6LzRjZnV2UTZZV0RmbjNpUGgxdWNCZlhpUzJlOVo4bjBN?=
 =?utf-8?B?SFJDdXQ2dXJFWGFuSEpsSC9uZ1hLRTBiL0F1SURORGx3MTBISFFmR2cxSWNX?=
 =?utf-8?B?ZGEybVpUVDBXK3JYZGFUbjNCbG1GQTFPVFZKT1RKWXk0V0U4TktPRDNpZzJK?=
 =?utf-8?B?RnVieFVPM21iUmNhUjFlamhWSnVhSmhDNUdNNlRjT3lvMVhsREk5cWtzT3Uv?=
 =?utf-8?B?a2ZheUQrallySlY3NUlnL1FVM2FlaFNuZ0ZOMTI5ZGRNQ1daOFZPODBZcDNF?=
 =?utf-8?B?eGYwcHVKMWNQTVhJdmdDRHd1cVB3NGt3c21DeWNtRkJNRHRGOEh5NmE3dDF2?=
 =?utf-8?B?VlpwbjJJSytiZGNnejNaVDg5TEVvempVWlhIcmFJMjhGdjdReXlSeGxCWnp6?=
 =?utf-8?B?TUdUTFpzUVFNcTcwK0wyT3RXMmVieHVxSjBoTnBEUXRaaWNaMGo4aHl5REF1?=
 =?utf-8?B?bmpvZ2dobUZYNkFUbGFlcjBnRFE0MGRxMEFXUk1PUlkxdjQ2dVdEWUNEbHQy?=
 =?utf-8?B?UE5xTUVKalY1NnV0Z09kZzVPSFp2UU02ZjJYNEh1ZGNNU1B2aEc5TkMySmU0?=
 =?utf-8?Q?qJBGfUPOxTQKI5/M=3D?=
X-Exchange-RoutingPolicyChecked: M/WAHClzIKHMRFVYpdixfqsg0q13CDRUj/lr92KVnsuNkbuVgmTIe+2KaWabGblOuHLAXutJMPp/KvfyzAmbOlc6VIuNV4UfzakP1oc3E2m40LvKSCN0aTN4ePVh+yFrtr/hOA7yL41yRjIuACMDNyfPw4BH9+DSmQGOiMeeGt11i7sCm0QdPegplx8JSokYZrJCDhSGh5J+yZtra06uZ9Gu659l3h9dV7qG/87xlTfv8QTU4ZwFW3VPDYP9EC8gw/6WEGzL+dNDe9ST3RxfCK/Xh8WmeeFUoxuyPemrP1O6yDzWCrad8/HQlie/F5eNGihyw5G0Lg3JsRanGeTEdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bf8d0c-f259-4aa5-b751-08dee8f67347
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:10:33.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8lKUcq6SO7sqcr1M4UTdfezKdvSSmoRFKVeilBbdfaTCwhl2neu5Kxd3wsFHNARfMLzJzbIN8K3SdWdQ4kZo5ydS6GgBgaH/8v8M7o86nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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



On 22-07-2026 20:07, Nareshkumar Gollakoti wrote:
> Apply the debug page-size allocation policy during user BO creation.
> 
> When page-size allocation control is enabled, override the user BO
> page-size selection flags based on the selected debug mode and round the
> requested size up to the corresponding granularity:
>    - 2M mode selects 2M handling
>    - 1G mode selects 1G handling
>    - mixed mode selects the page size from the current mixed-mode index
> 
> This is intended for internal debug and validation flows. When the
> control mode is left at the default setting, the normal user BO creation
> path is unchanged.
> 
> v2
> - ensure debug page-size allocation does not
>    affect the default path (sashiko)
> - rework synchronization for concurrent access (sashiko)
> - refactor commit message for readability
> 
> v3
> - update user BO size alignment based on debug policy mode
> - reword commit message
> - ensure normal user flow is unchanged when debug policy is disabled
> 
> v4(sashiko)
> - limit debug page-size policy application to VRAM BOs
> - do not override preexisting page-size requirement flags
> - advance mixed-mode index only after successful
>    BO create ioctl completion
> - add overflow checks before ALIGN() in debug page-size handling
> - ensure CONFIG_DRM_XE_DEBUG_PAGE_SIZE enabled and it is dgfx
> 
> v5(Himal)
> v5:
> - Guard debug page-size policy paths with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> - Leave the normal BO creation path unchanged
>    when no debug mode is selected
> 
> v8(Himal)
> - Avoid current index increment for system BO's
> - Simplify mixed mode align logic by changing array to struct array
> - Have a inline check if it is on debug mode or not
> - Avoid condition compiled debug in function code blocks
> 

Looks got to me.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 148 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cf0b7b35c331..929669f18788 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2640,6 +2640,145 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
>   	return ret ? ERR_PTR(ret) : bo;
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	if (!xe_debug_page_size_mode_is_mixed(xe))
> +		return;
> +
> +	if (!(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
> +	    !(bo->flags & XE_BO_FLAG_USER))
> +		return;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	if (xe->page_size_alloc_ctrl.mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		xe->page_size_alloc_ctrl.cur_index++;
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +}
> +
> +static bool xe_size_align_overflows(size_t size, size_t align)
> +{
> +	return size > SIZE_MAX - (align - 1);
> +}
> +
> +static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t *align_size,
> +						 int *err)
> +{
> +	static const struct {
> +		u32    flag;
> +		size_t align;
> +	} map[] = {
> +		{ 0,                     SZ_4K  }, /* default: 4K, no flag */
> +		{ XE_BO_FLAG_NEEDS_64K,  SZ_64K },
> +		{ XE_BO_FLAG_NEEDS_2M,   SZ_2M  },
> +		{ XE_BO_FLAG_NEEDS_1G,   SZ_1G  },
> +	};
> +	u32 idx;
> +	const typeof(*map) *entry;
> +
> +	lockdep_assert_held(&xe->page_size_alloc_ctrl.lock);
> +
> +	*err = 0;
> +	idx = xe->page_size_alloc_ctrl.cur_index % ARRAY_SIZE(map);
> +
> +	entry = &map[idx];
> +
> +	if (!entry->flag)
> +		return 0;
> +
> +	if (xe_size_align_overflows(*align_size, entry->align)) {
> +		*err = -EINVAL;
> +		return 0;
> +	}
> +	*align_size = ALIGN(*align_size, entry->align);
> +
> +	return entry->flag;
> +}
> +
> +static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
> +					      u32 *bo_flags,
> +					      size_t *size)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +	u32 want = 0;
> +	size_t align_size = *size;
> +	int err = 0;
> +
> +	/*
> +	 * The debug page-size policy is only meaningful for BOs placed in
> +	 * VRAM, where the downstream BO init path can
> +	 * actually honor the corresponding minimum page-size requirement.
> +	 */
> +	if (!(*bo_flags & XE_BO_FLAG_VRAM_MASK))
> +		return 0;
> +
> +	/*
> +	 * Do not override existing page-size requirement flags, since they
> +	 * may reflect functional requirements for specific BO types.
> +	 */
> +	if (*bo_flags & (XE_BO_FLAG_NEEDS_64K |
> +			 XE_BO_FLAG_NEEDS_2M |
> +			 XE_BO_FLAG_NEEDS_1G))
> +		return 0;
> +
> +	if (!READ_ONCE(xe->page_size_alloc_ctrl.mode))
> +		return 0;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +
> +	mode = xe->page_size_alloc_ctrl.mode;
> +	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE) {
> +		goto out_unlock;
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M) {
> +		if (xe_size_align_overflows(align_size, SZ_2M)) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +		want = XE_BO_FLAG_NEEDS_2M;
> +		align_size = ALIGN(align_size, SZ_2M);
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G) {
> +		if (xe_size_align_overflows(align_size, SZ_1G)) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +		want = XE_BO_FLAG_NEEDS_1G;
> +		align_size = ALIGN(align_size, SZ_1G);
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED) {
> +		want = get_flag_from_cur_index_in_mixed_mode(xe, &align_size, &err);
> +		if (err)
> +			goto out_unlock;
> +	} else {
> +		goto out_unlock;
> +	}
> +
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	*bo_flags |= want;
> +	/*
> +	 * Apply the debug page-size policy by rounding the user BO size up to
> +	 * the selected granularity.
> +	 */
> +	*size = align_size;
> +	return err;
> +
> +out_unlock:
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +	return err;
> +}
> +#else
> +static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
> +					      u32 *bo_flags,
> +					      size_t *size)
> +{
> +	return 0;
> +}
> +
> +static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe,
> +						     struct xe_bo *bo)
> +{
> +}
> +#endif
> +
>   /**
>    * xe_bo_create_user() - Create a user BO
>    * @xe: The xe device.
> @@ -2660,9 +2799,16 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>   				u32 flags, struct drm_exec *exec)
>   {
>   	struct xe_bo *bo;
> +	int err = 0;
>   
>   	flags |= XE_BO_FLAG_USER;
>   
> +	if (xe_debug_page_size_mode_not_none(xe)) {
> +		err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
>   	if (vm || exec) {
>   		xe_assert(xe, exec);
>   		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
> @@ -3477,6 +3623,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (err)
>   		goto out_bulk;
>   
> +	xe_bo_debug_mixed_mode_cur_index_advance(xe, bo);
> +
>   	args->handle = handle;
>   	goto out_put;
>   

