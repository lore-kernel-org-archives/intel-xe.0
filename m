Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94205FB5175
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 00:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E35810E2F9;
	Tue,  7 Apr 2026 00:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WF4PxnGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C485210E2F9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 00:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775520448; x=1807056448;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aoAH6JEx2lg836cxhVjMAz+8xZIcUqHqZD6ylMJLQfo=;
 b=WF4PxnGnT9+rcsIMkZkclppWwcOy2e9WaEckvKjkWbUb7rgIILwSx59D
 NErKtvIcwnOa20TfMxuSWXE90fmhu4gq7ewh+BuVbz++l46KMhjfisEA+
 2Mh4g6XgbIHk6v+LWXJNlW5r9NPtFkVupB20N5HqgKR0yw3L7nK5tO39q
 NM3AsM+mr1BBlHrvyDyltHZnZokHq/Hxf261j9UFq2w7EsAYtky6uj2Av
 hMxh7kkqAeSGjDGSmq8f48Cotn6I3sFIQEVXUGopY4sO1JKQsgZygWtg5
 rcOQcNrD8HioGh3Vwhwp5wpGyUNIbrT2OuoMtcZRSU6WGpro+CTnChcVB Q==;
X-CSE-ConnectionGUID: 1twayn/QR8Ovd3ZzMG1y2w==
X-CSE-MsgGUID: arWrCj7rTnK3NhW2mbENaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75517166"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75517166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:07:28 -0700
X-CSE-ConnectionGUID: hHyx5PMoQi2Kf7tf8E29Fw==
X-CSE-MsgGUID: 3FIJYONvTd+J7+Lw75nFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232881099"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:07:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:07:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 17:07:26 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMb4ZoeQ0py8ujPmFc9ozH5Dh32xnZCEzyadtMbb8TF0c0LkG2WwtkTkXq7zsh2xuz+MgUGYypK6oGzDFtNcMOdz+VKoR/RON4URIEPWZq2NoG6dMyHoJzpolahDlcHIQBjmOXuWcu4N7dVMu7X0Ew6x7RE4ekbdiEidcaFfhSbvyfuYkN/iRed0zGUgnkVKvhJ6qJbHN2CqrCeiJpRs1sApCGd5GojMAroE9+vq6wiXEYNW+yL/xXclbM8xUiDjXhSBadV4lFKclw+IYrGDOLkZrafIMWiINcY3+u/F8jYthMujsRdfJgSG03MgeF35LmK8yzW6sGZHhXvyGiPs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8ywSZ1nsux7n3VOWULpcGeCuSw/XQFI2rPap3ecabg=;
 b=hseBhhfWhmaj68QjaG88c0vEvUqaHPx8FgNUVkyAVw3Wn/ykduZCA126pGaA0rQxk8SUuiVTYCNLgC04UhB/KmwO2WeAU4NZ3BuSNOEXM0fOmzL6/iiS+5Snxtz1wiJTQP3A3Hk42LWDxmraW6DbdKyCCxHfqj5uYgEym1r6gYEJGWjWppA3H2gDyM0eHcl2cn1F+E5/BJuYj9ITwJ0jZoTrsOv5p8/wM8TonLqWJ59MSYqujURQtk0hUqiKoxExD7vYNrJ5vqEvoXAWF0dppGoCatqZXoDfqgFmj5G8GjePNoMVboX/i6pgE5wfsBUMPEjenvVvefjtrdQyty2DZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Tue, 7 Apr
 2026 00:07:24 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 00:07:23 +0000
Message-ID: <6ed69861-b31c-4dbc-82ef-6f0ebf68fd02@intel.com>
Date: Mon, 6 Apr 2026 17:07:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/uapi: Fix wrong names and references in
 xe_drm.h
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
 <20260331172049.3053871-10-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-10-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad7177d-b535-4260-987d-08de9439a4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: EvDD8Ge7kk0tGfJ35+RbVyhjYbGhawhqolzchexAMt4pbHjhnXZ+Owep/dPLJrGMrembTcVomgFmrjxE7/R5m+iK1l+t+ubFP/sQOGAsecuXXjL8heWhVwkLyXjD8HLekzOm9el3Mu06IT6ywsKhWwo3MLljM8Me3dpSz4PSjkY83W9LBYfhhYvkwLyNVlmV4mZRfe6krmB4UxHjs6uX0SBVV+QCeqp0KmlP1iRlWBm1kCqK4mICZSpXBCre901OorrO1LSjqKrMBKsrup5ODpGG0mcl6p94WreTgNWCmjf+KUXjipSbWt6GixK8R7P3HR6+l85jR1qFYDvH/huOS2OU+tIZzjVUPxGl5DWXnffqausMbKsHnMLUbElMBlBrUNd0vvrecNnjafUWWhU+Snc2o6ok1NP4lO4aXBDtVby46aP4LxnslNrQGdLIqMNsA9kzaJOlBy1F2y7T+dFjR2O2XV374zbVnm8UAZ8wtm1gLXhhFDKbyfY2f+cYAOTrSQcKYUpJos04E+xh4P3XF5/lnsxBKvq8WUZFg3Op6EjmJndJvyeswAEHGjIXpwpw6cUWqjpnFvRHOkLKtA06G+VC7BOgo8sfodFhFLn8A9bBm9fdDW66UD/onLokU/h68W67wyBv4Ktvs09W/DhYiJncc2x+EqIVyJZazcaeZ4Zc4xPHMQNbvwiWIWtLJzAjpirh86C80T4Tv/QlVqWKVBkR59amUoSWbB1skp3qCys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlNRSERsbFZYNUIxbXRwUTN5T1dxOXljNHJEeVp0cVNHYTl5SmMxd3lOL3pw?=
 =?utf-8?B?UFlLb0wwV3lBRFAvNlBHUEUveEdMc0pDb2xSeFZCdFVDR1hISDgxSzVQQmxa?=
 =?utf-8?B?N3pIcTV4Rjdxc3VDVGdLanpmZ2JoUTh3QnJwUWtXQXlGVFdrOVJwRHo4b1hD?=
 =?utf-8?B?NjBzVXhXanlHL0NNMSszRDVTemt6TTE5ZFVaZGZ0UFF2bXplUmNwOG9IbGtZ?=
 =?utf-8?B?ZXpEWi9ob0c1TU8vTXRCZFA0c2VhLzh1cjRoNm1vQk1YTU5lT1lSN2Q5Kyta?=
 =?utf-8?B?VmQ1eElWR1JhQ2RtTlVqQXZwcGcyL1pqbm1sczloR1M5WU1BQ09KRVJ4TFhI?=
 =?utf-8?B?Zk44ZnRYblN5QUJ6ZjEwLzg0MEpkbm9EcTIzMEFQUXdwNW5xT1htQ01UR1Nu?=
 =?utf-8?B?R2VDTWVORHBKbUdncUlqZlZYd3RCYklGMWlDdnl1T3RJaG1LSFhuWDlSTE9F?=
 =?utf-8?B?aFF4NjVsVWd2TnNadmJLWTA3cDA3WVJ5RzFyK3U3WStjalVyRDVBb0krZHJi?=
 =?utf-8?B?eDVqRFpmOWRKTzZYa0NYTGk1azlzcVYzVTFOMG91VUxKcGlVend0UXRFbDV1?=
 =?utf-8?B?aHNjVDlIVGJydy9wOTFNMyt0djNNdzRhYlI2ZURTOHhFMHZTODQrdmMwWWxI?=
 =?utf-8?B?d0ttQlRsUDF2bS9MWURMWmdpNlhoTW1yLzVHbEFVUjhicUx6c0luWndHNkJj?=
 =?utf-8?B?SDhKQWkxdE1Wc084bVRDQmhtdzhyaWh0c3NLTEVBYlBTTXdDSEdISDBGaEND?=
 =?utf-8?B?YzhLcDhTMzB0K2I2S2EwTnJrU1BjYnY1VERvL3Z1Rjhrc3g3dkhEL3AzOUk4?=
 =?utf-8?B?NVlBVTV3VGxsT3dGeUEvRkJ3T05OSGtVME0wWGx4NmxYaGlDd3dZSWpUZzA5?=
 =?utf-8?B?cFE0aE1MWUZINmtJZlJBT3p6SEtZME1MUnc0YTg3WDQrN2RTdXpkeTJUaEUx?=
 =?utf-8?B?cU8wa3Y0QlQwa21uQy9NRndEQWRIM3FrcHZXSmQxU3EySnJOR3ZoNkx6dWl5?=
 =?utf-8?B?emNOS0U0NENqY2tCLzJhcDBKR1JESUdNVEFGT3lNUnhtOWNFNDI4YU5OSU1k?=
 =?utf-8?B?K0hrd281dEpoZnZyVjNFRHc1VE9mUS9GSVArNFVkTGZ2YVdtN2FkOTRoMm1j?=
 =?utf-8?B?c3QrakFSU1dUWjNWak0vZWI5RGN5cUdjd2h6REtSV25CcExIbnJnUTJCamtD?=
 =?utf-8?B?Um9yTGNEOXM2ZFJQZUx6M1p2Y1ZqRzJ3NGxmQWpSVEJiNDVTTXJnN0dTMm1U?=
 =?utf-8?B?RTFyY0lucVU2QnREU0hjVTFISVBtSVVVN0k2SUZjRklzODcyckEzOGE1bE5R?=
 =?utf-8?B?NDIvV0pmYkFRWHVEbGxtWGNKRngxSFVSNm5VcWZMZFY2dzJKdXFoY2xId1Uv?=
 =?utf-8?B?eUdMNjJFV0ZabW1odlFaQVIrRWdCSFRQZkNHT2pEbWV4QkRDL1d4WEFIUXA4?=
 =?utf-8?B?THVsbmN1Zld6ZzBKd3l3b3ZEQmNqZFF0YjAwcUFzU0V1aERVTWt6Nlpybk1o?=
 =?utf-8?B?Z0ZqOVE1d0hhTjVvSVh2dWpRNlBPdkpjOHh0dUd5R0tJajJJeW5GaUtMOUhT?=
 =?utf-8?B?aEx6ME5XUkxKamhManJqeDd4MW00bjRZbmg2WFAwNmJMdm95YmRVUkh3bW43?=
 =?utf-8?B?cXdUM09TMklQMFdxMkNXcWxXYXF4T0NveVRuSHpjSUg1TXJBcGtSTzJ4eStx?=
 =?utf-8?B?YjlMQ2xTR2dGSS9aUE9CanZFbHM3Z2pqWXlKQ2oxU0F2OEttcDRaL0RsVThM?=
 =?utf-8?B?Q1ZYSUVIZ1pRNlFGYWpjQUttWk9Cb3NiNVlRZmZZenJ2TlZTb0ZkQW9oSGdD?=
 =?utf-8?B?TWQwMlFrUkc5SHVhUWgyZTROMEVwM0dzQW9yR2Zub1JLK0NGNG5MbGp0enhI?=
 =?utf-8?B?N0NXU3RzTmJ4UitLWEpRMWczODA5b1BKZllqM3dNQ0R3bkRGcXJCVkc5a3RY?=
 =?utf-8?B?RStrd3E1bEFPTVU0QVk2RXlwaHJDd2hpS0U3aE41SkNvYk8zTlh4ZEtVQmhX?=
 =?utf-8?B?QnFYNVBSaHRKdHJMRUp5NWoxZFoxc0F5elhJNVZVdDBnYjJHYkQ2eEExcW5p?=
 =?utf-8?B?R2NqTEI2OFpzU1NuVXZjdTlhN0dQWDFFSlRBZTQ1dDRWNnZwTDZpeXZVV1dh?=
 =?utf-8?B?QjRWb0IxZlhLRWRJOWduWmNDRWo3SndxSlpUUS92a3VJcThuZENtNGFVbExt?=
 =?utf-8?B?a0xIN1BJWHh3Ny9sZTZCeFFIaEJrTVVodEwwWlZYdE95OFFUNTVKd3JyOXFo?=
 =?utf-8?B?SEErcVlVNFRoeXgwcVlKNTUwU2hiOUE5WkFHOVU1YldIclBSLzBpdEhkZFVG?=
 =?utf-8?B?WmhXUnFMcmhtMFM0RmIveDdUcy9uT0RCdm5xUmdJZmtmQm05aXE5UT09?=
X-Exchange-RoutingPolicyChecked: BYycSM9hHC4aTzDcHX92G3KHEFSf8ifO+IwUVvlyqzpixPyBecgodzwhjC3jG0gDNcuFgs4E2jotzBKlvm082gfJmvnHQJpeVTBwbJSiivVgFZXoafGX0ZC/pYYnjFHsK23xqheWaTdxVg1j4U8YI/u/Z/7iuWA6U7qDVzBVoXjUVACyMJ/RPFdeYS0yLb2WWt0Qvyab59BbmqkAoz2f9iBGHOqaltP6Dss9bW1TcaJiCa0jAMQSqbT7KRiVhyvJ3c2vkt2wNq2/sIvy37v+eceFGLweNYYxLFger2Z4hw98gHZIyFuMfksOAfggq1YzfxSSLVr6il98AmHO4fVPhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad7177d-b535-4260-987d-08de9439a4ce
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:07:23.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvSHOdeb4Eame7OqMdASyCRTrUkWgPpwqNJBYs0CgKVTy/2IhRmf23s4I0JWtRY15sCjYSkFxxUw3HZVX0rByw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> Fix incorrect field names, struct names, ioctl names, and
> kernel-doc references in doc comments:
> - probed_size -> @cpu_visible_size (correct field name)
> - @flags description was copy of @placement ->
>    fix to reference DRM_XE_GEM_CREATE_FLAG_*
> - %XE_PXP_HWDRM_DEFAULT_SESSION ->
>    %DRM_XE_PXP_HWDRM_DEFAULT_SESSION (missing DRM_ prefix)
> - Remove undefined %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
> - &DRM_XE_OBSERVATION -> &DRM_IOCTL_XE_OBSERVATION
> - ids/structs: fix incorrect possessive forms
> - drm_xe_query_oa_units -> drm_xe_oa_unit
> - &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE ->
>    %DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE (% for constants)
> - DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ->
>    DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> - DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES ->
>    DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> - @sizeof_mem_ranges_attr -> @sizeof_mem_range_attr
> - @vector_of_vma_mem_attr -> @vector_of_mem_attr
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1d3406416d8c..36627322448c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -349,7 +349,7 @@ struct drm_xe_mem_region {
>   	 * is smaller than @total_size then this is referred to as a
>   	 * small BAR system.
>   	 *
> -	 * On systems without small BAR (full BAR), the probed_size will
> +	 * On systems without small BAR (full BAR), the @cpu_visible_size will
>   	 * always equal the @total_size, since all of it will be CPU
>   	 * accessible.
>   	 *
> @@ -862,8 +862,7 @@ struct drm_xe_gem_create {
>   #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>   #define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>   	/**
> -	 * @flags: Flags, currently a mask of memory instances of where BO can
> -	 * be placed
> +	 * @flags: Flags for the GEM object, see DRM_XE_GEM_CREATE_FLAG_*
>   	 */
>   	__u32 flags;
>   
> @@ -1366,7 +1365,7 @@ struct drm_xe_vm_get_property {
>    *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>    *    there is no need to explicitly set that. When a queue of type
>    *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> - *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
> + *    (%DRM_XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
>    *    The user is expected to query the PXP status via the query ioctl (see
>    *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
>    *    attempting to create a queue with this property. When a queue is created
> @@ -1651,7 +1650,6 @@ struct drm_xe_exec {
>    *
>    * and the @flags can be:
>    *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> - *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
>    *
>    * The @mask values can be for example:
>    *  - 0xffu for u8
> @@ -1741,7 +1739,7 @@ enum drm_xe_observation_op {
>   };
>   
>   /**
> - * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
> + * struct drm_xe_observation_param - Input of &DRM_IOCTL_XE_OBSERVATION
>    *
>    * The observation layer enables multiplexing observation streams of
>    * multiple types. The actual params for a particular stream operation are
> @@ -1902,10 +1900,10 @@ enum drm_xe_oa_format_type {
>   };
>   
>   /**
> - * enum drm_xe_oa_property_id - OA stream property id's
> + * enum drm_xe_oa_property_id - OA stream property ids

maybe we should  change this to `OA stream property IDs`

Thanks

Xin

>    *
>    * Stream params are specified as a chain of @drm_xe_ext_set_property
> - * struct's, with @property values from enum @drm_xe_oa_property_id and
> + * structs, with @property values from enum @drm_xe_oa_property_id and
>    * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>    * @param field in struct @drm_xe_observation_param points to the first
>    * @drm_xe_ext_set_property struct.
> @@ -1919,7 +1917,7 @@ enum drm_xe_oa_property_id {
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
>   	 * the OA stream, see @oa_unit_id in 'struct
> -	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
> +	 * drm_xe_oa_unit'. Defaults to 0 if not provided.
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>   
> @@ -2242,7 +2240,7 @@ struct drm_xe_madvise {
>   
>   			/**
>   			 * @preferred_mem_loc.region_instance : Region instance.
> -			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
> +			 * MBZ if @devmem_fd <= %DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
>   			 * Otherwise should point to the desired device
>   			 * VRAM instance of the device indicated by
>   			 * @preferred_mem_loc.devmem_fd.
> @@ -2369,10 +2367,10 @@ struct drm_xe_madvise {
>   };
>   
>   /**
> - * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
> + * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>    *
>    * This structure is provided by userspace and filled by KMD in response to the
> - * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
> + * DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. It describes memory attributes of
>    * memory ranges within a user specified address range in a VM.
>    *
>    * The structure includes information such as atomic access policy,
> @@ -2427,7 +2425,7 @@ struct drm_xe_mem_range_attr {
>   };
>   
>   /**
> - * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>    *
>    * This structure is used to query memory attributes of memory regions
>    * within a user specified address range in a VM. It provides detailed
> @@ -2435,14 +2433,14 @@ struct drm_xe_mem_range_attr {
>    * page attribute table (PAT) index, and preferred memory location.
>    *
>    * Userspace first calls the ioctl with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL to retrieve
>    * the number of memory regions and size of each memory range attribute.
>    * Then, it allocates a buffer of that size and calls the ioctl again to fill
>    * the buffer with memory range attributes.
>    *
>    * If second call fails with -ENOSPC, it means memory ranges changed between
>    * first call and now, retry IOCTL again with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL followed by
>    * second ioctl call.
>    *
>    * Example:
