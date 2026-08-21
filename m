Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46873C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF6A10E210;
	Fri, 21 Aug 2026 11:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnJpaot9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917BD10E210;
 Fri, 21 Aug 2026 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787312332; x=1818848332;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=wAfnkp/d4lsE5/O/0m8ZZyTFxz1VxTMT6VQw68GbDiY=;
 b=KnJpaot9xZ88+g68LrzfStvZRmNuGv4ysfSmxAJUUPNd58/dPV3jJDNe
 HIIrmRPBeaikqAbAgZAj7/8Uk6NFbP8aWMVMRazOfSCqPMrKxdIlN15V/
 vYb0u/ZyPBpBG0KxfpHWJDM2mu1Q+X9iW8Qx6W1EI4j8dm7iY+/ytwMbx
 b8RLOK9oHz3OeYW04cDeCa7HoQBQDqtvX0smi1zGMUI0yRBs07fY/FK5Z
 IaUimOkaXy+bCwWKTnqsbVSfYK31+TRs7NmOtVEcXI2arP3hvYbz0wkGK
 ACBNRFtimIZ6tVEIaviKNCGkunl0BTvcDl7EeZggu6tGo5H1rDSeGKqo7 g==;
X-CSE-ConnectionGUID: 8nXIr6eAQTmV8irQ6RJOMg==
X-CSE-MsgGUID: WsSBrH7DQCGiA1GkOYjWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86979358"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208,217";a="86979358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:38:51 -0700
X-CSE-ConnectionGUID: yLM2/oJvQ5W5AVUQFAppug==
X-CSE-MsgGUID: Ydwe8U5MTxmV3ZngvcGaJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
 d="scan'208,217";a="265814897"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:38:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:38:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 04:38:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WniBqizcEVQC9rXTX0WOtiyd2hTgNna9OeBUIrE7FyyB1qC3MayfUdwpAsobrhW0EzyoOsyE1K5VJs+3/WmJyXuqHY9VBMgyvjK9FeEkm60v1gLaVHw7lNlHM+qffL0bnCrCd6S2zfQOdaA8MwcT4/+4WfNP5czTqDX11Rk9eqruamxPmrxKPl2TGQ8DGRMjZ12pEvG9NqH4A9cJgha0sdHNzi3HcDMM2YUHwMPT6QemjlZTuWQZd4AePc5Adhc9HzcMDC3T3W7o3CEMnBj3Pu5q/wNFJ+WnMijzoPtZhNK2n/7Mg98L1L4h/Z/ijuCCuLV6O+L+DlO+L189ltv0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nz8cLo968d0nqzEQWI1iXpzHogC1AssDjwhVpgU74M=;
 b=m65RfvKdNDC8wEfhCjvM4p8rKkmDp3NAeCZhU66lKP67unrCsZG6Bpv6nnAz121cy65ogWn8VupYfeTztPqAaQIcuwNwgVXyS032mZroijz6WoB6hmpElCil9P7EQliya8MI/Hu2J9aoxr1TxxJd3rxfHMAaUvJWnSbipjF3yzgnU1CQUn/LCMDJfIY92TOMgObLT676ICpDlWRQvy4TgoL79ZlgbTy6FNx1o73VUF/RPd8btgJ02nAlUFTB2Q3W6I+iK7QEo/2sOfv32moK0B/bNjpW28OJ/gZ0orjiSg7k1M4+6lJeV71jebODkqyFXj//PUPyHL940gNzM/XNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA3PR11MB8938.namprd11.prod.outlook.com (2603:10b6:208:581::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 11:38:48 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 11:38:47 +0000
Content-Type: multipart/alternative;
 boundary="------------vaoC6A2vobikY0DVTU3a1iuj"
Message-ID: <24f46bcc-5c4e-4a4b-9f91-895adb2ee1e5@intel.com>
Date: Fri, 21 Aug 2026 17:08:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] DP-HDMI PCON DSC fixes
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.kaplan@sms-medipool.de>, <suraj.kandpal@intel.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
X-ClientProxiedBy: MA5P287CA0317.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA3PR11MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 42421c3c-dc36-4c49-833d-08deff78c3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|8096899003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pDigqeh3wd5nZd7mIU/0GTpRE19mme5Efm9XvvdgfGiD6vpciGnJUZVEZ9Y/HzwG2bwBfwtOC89wnMU+YuBu7D7UQQMm1BqQL5EoIzKP6Oqgv6c9CFZF3LVtniD6whfjKpwWPP6dEr6QBnMd6efImY2CXS4zD9FlFytFkCw6AsudAWttRUIWlEB5PMr540Z/V59AtAZ/DbUtt4ytn4QvoyMtqrXlNObpi5IyLbIMqkogI8PCX2yk9zlcsirk1IHSuMc3NLdnjAncaJoVTfHjm1CghFriDynrBmITCpDrKhmei1079b6UvPytkGG/WyteauuKhil3bJtANvzhiKztU51K8RfPr9t7u2UQGNaXkRImHh4ZnC/mb5vJIcZNmqpT4CLuEmhF3AQUJSv8W6ZK2VvX49PoRAv2YKxui6KUTa1nkNMURVh2lKhqcKJTuPUXev8NHboqBfhreXRMW6G3ge8SySSZGUcesbSJaUFEHGgUYr7GvK5yOWSbZmr0pdFcbbvp57KHt+ESVtrp1ymDjwkNgql5mOVKrmFCp3+VFegJ2TYIavPNYuidxE+s2Xr1d+X8Yh+RdUW59gC+gJguwpJ43tmnJsBR7MYH5lD6G93pFmGLDUFuCqS19jS92r4y2UWnPmmeQ1eTgoMJUQvUpd7W9sGgThHotDdbPjRVmPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(8096899003)(3023799007)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VUT2FjbXF5Z3QyU20zSEVocnA2WVJ5eCtqRWdaZXRucVM4ZlF4TnpFdkFY?=
 =?utf-8?B?VmgyWmJ0b2hlWWFCR1U5bzFTNGZPemtOYTlybll1VWVWTXZmN2RvSThpQmNK?=
 =?utf-8?B?dEw0SzB2aGpQcXFyVFJ1Z0FIbFEwRlQwU3Q1akwzMW40WHhWaWJQbmNUaVNI?=
 =?utf-8?B?eDNQbk9GNEpoMmxFd014UjRqODFkKzJHVjVUcTZ0b1YrazZDWS9NaFVaR3B6?=
 =?utf-8?B?bVVxdmlkdkM3Unl4czZjRWwxNkdoVy9tRVZ0TW03c1hvNXRYM1RvQUFiN1E4?=
 =?utf-8?B?aWd1dEppT2xuWUc0bUtMZlhQRldmZFhCcmZGNXhMKzFsWnZxallvQVBSSHhZ?=
 =?utf-8?B?UkxwZHMvNGlxL0VrczE2UFNCMHVxOFJKczYzblIwNUZ5djBOMFJPMXc2KzYx?=
 =?utf-8?B?cUhBeXVITFd4c1JMS0ZhMTJNd0VKSlN5eGVJS25lYkRLL1M3UUFYTW9NbHNM?=
 =?utf-8?B?aGJyMXB0VlhRUVRTb2hsSm1ySGhDNFRZNy8wM2NsSTgrTlJobnIzSU9hSUR2?=
 =?utf-8?B?dG9jTDByUmszVkxzRU1JcFRiSmR0MXMxK0ZPWEJ3Vng2ZkxzbjdTbkxzb3Qw?=
 =?utf-8?B?QVgvNVc2OG43UmRYWE5NSG5HWUVVN0cyNnFubEkybVFyeHUrWDBocVltd01J?=
 =?utf-8?B?WEdyTW02K3p1L3ROQXRNMi9Ca0VTZldtN3A4cGIrMUk2Ni9mT2ZHMmt1akR1?=
 =?utf-8?B?Z3drZ1VpUUpoOHlmMVBZcDdHeG85TEZiOHJvTkZ1T3VEaDBZQ2oxUTNoR1Fw?=
 =?utf-8?B?bHV3ajB3c0NWRXl6cU5Ubks5Z2FRREkxdkZJM1ZBSHZ1VDhjWFZxUEFZcjRO?=
 =?utf-8?B?YThRdldYem1JaSsrWHFOT2VoZDJudUNpMUZFYjhnMWVWR3dCdno4SEJvSmxi?=
 =?utf-8?B?WWgwTVRNckVBdmZHTDFWbWc3bU5kMFhPVnpocXQ5bjBzQVFIQ3QzRVJBT2ZY?=
 =?utf-8?B?QU9WNlRQT0dVUTFRd1ZUcHVpcXNvUlhCZDNFaUltN3FnSTBzM3h0WkQxYTlx?=
 =?utf-8?B?ZGh3c0hkZGV1c1UxSTNQUGxJUVI5M0MwYVQzZkJEcko0eHpXQzRNdlBmdlVi?=
 =?utf-8?B?eGpGYzc5TjJ6d0RUaDdQZW1ZU1c0UGVNeHVIOG1XdkVPenJaeVdwZ0I3ajg1?=
 =?utf-8?B?a09DNHpGZGpIYk1uOXB4emV5eVR2cGJiMVNZSjFhTTl5S2tmSHNGQVR1N21H?=
 =?utf-8?B?WlZSVFdDZ3ZOeWFtcWVPRk9EYmFsMWJ6dDZybnZ3OW9Od1YwVm1mcnY5TFlN?=
 =?utf-8?B?cmRHT2Y1eldFVnpsVTIxcEF3a0J0eEdLOVlRQTkwZHZVZWkyZUxaYTkxd29Q?=
 =?utf-8?B?VEZxc3E4QndZYko2UUJQdXhTcEEzOXIvYTZEUWhTS3dUY2w3M1Q1LzRLKzZT?=
 =?utf-8?B?ZWhqL3NiRkpBeFZuOUJnWEFUS2VKM0xTTjZkem9qQytjWm1kMU9Rbk9DeVNo?=
 =?utf-8?B?OUptYzdxQ2RhVTRxM1hRZnhHUmlodnpNck81TmY0V3JRQU94WXczeE8rUldT?=
 =?utf-8?B?S3U1Wk1XRVgwcitBMFlDcEJhMElxWU45VytEc08xcmErRkJOdkZlcG1wbzlM?=
 =?utf-8?B?cDNja21mYURqbjNvbThYMHJWMkxNQU5NRk8yd0kzUWQ0V2VTdldvNjhxalp4?=
 =?utf-8?B?UXhFUXZmVExNd095UThkTy9Rb1ZOTXE5WlQ0TzZ5MGdOTWxUbzQ5dEhOai9p?=
 =?utf-8?B?MzgxN3QzMXNqcWJ5YnpVSWt5UTJJN1dsVXR3NkdyUm93eFRhbFhVbUxBR0tI?=
 =?utf-8?B?cHlpZkw1cnBRUW1QTWpFbVplcmFOTEMyck1DMlRWU25wTHFiMzB0b04vbmh6?=
 =?utf-8?B?a1FFcVBLYWtOVTVxcFJqV2ZMZmZENnRpdnFicHJib1NkeVVJMzE1S0hoM1or?=
 =?utf-8?B?ZUlkUjlZY0FjZVNPMUFFUk1uRXpNNGVYbkQ0YnU1eHBuVERrWWNMb25kbEVo?=
 =?utf-8?B?NVhSV25mQ0J0Tk1MdlZyMlJYckJlNW54MDA2QkZaWHVGRzBvL21uajRZMXRE?=
 =?utf-8?B?eUFNaWZOSng0amk3Z0dTODRYbTdqK2h3WG54RTdqMkppWm9mZndyTkhvYXZk?=
 =?utf-8?B?R0c2czdyMTEzKzBmVWdQckRjQWdDS3JQbVJpM3lTWHJoNTA1c2dSY1hxYVdr?=
 =?utf-8?B?QWZlaUZwZ1NwYlBMUzU5bEJka3NmQ3A2MTdIUGRzYXc2ZGQ5QzdQemoyckZ3?=
 =?utf-8?B?UmNDcklnQW1rS3BsTUp0SisvcnhUOXBkc25XOUF1d3pYR284c2lMQUQ1Wk5v?=
 =?utf-8?B?UXVnRGNJaEcrSUkxRklQRStpNURhWjIvd0EwY3lDU1FKdEtpUHd4N0xrdnN2?=
 =?utf-8?B?N0xocndqRzkyNkJzbFdUZmRDVXErRXUzSWdLN1BsbjhGaVVlNW9zdz09?=
X-Exchange-RoutingPolicyChecked: ME6xfkaNibmwGNCJZ4XuBELEApbuLoeVKrbFoFn3YqIQftzYmvB7hILMF1xqJglJfIIJyFdaUlDvpAS81Xy/LGBEnDEtTnK2fO79aXDl37z4LMW+KbISYK2/pj8jrUp+KSCXN+TbHYdBe7oeBIciPMS3gYExL7Bbt7iA4Z02SD35SFzNUGLuDB2f0fuLgQAccXUGQdSSjzz9GRGGUer/W4NDKaOXNp0GFfnSlolDBl0TWwTe+J/3+uY+HV1E5tjbPpxTg70Eds/iPdpVOMBnca7OVdw5DrHQkhVK8Rt5jVz9i/AgSFNF1PdlKalHUvHe1WbYqus/wUvRf2Xn7GuhKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42421c3c-dc36-4c49-833d-08deff78c3ad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 11:38:47.8549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPHjSnpmdvJdd01CdTHW34SfKr06yNnW4Tna4NAzddQRHQa5kRICsuHW5FifFuK5mm3VFAGxhY4HrxP3Z74ReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8938
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

--------------vaoC6A2vobikY0DVTU3a1iuj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ankit,

Tested on the NVL platform using the AORUS FO32U2P panel and a BizLink 
(DP to HDMI2.1) dongle.
With your patches, I am now able to achieve 3840x2160 @ 240Hz, which was 
previously being
rejected with a CLOCK_HIGH error without the patches.

Tested-by: Swati Sharma <swati2.sharma@intel.com>

On 11-08-2026 10:12 am, Ankit Nautiyal wrote:
> The PCON mode_valid path currently does not fully account for the bandwidth
> limitations of the PCON <-> HDMI link. The DSC capability between the
> PCON and the HDMI sink also needs to be taken into account, which currently
> isn't. Furthermore, the compressed bpp chosen needs to fit the
> FRL configuration, which is also missing.
>
> This series:
>   - reworks the HDMI DSC helpers so they can be reused across the
>     mode_valid, compute_config and FRL bandwidth check paths
>   - fixes the FRL/TMDS downstream bandwidth checks, and allows
>     PCON DSC modes through the FRL check
>   - Clamps the programmed DSC bpp to the FRL link bandwidth.
>
> Rev2:
>   - Rebase and address comments from Suraj.
>   - Drop drm/i915/dp: Use FRL pair check for the DFP dotclock limit as no
>     longer required.
>
> Ankit Nautiyal (8):
>    drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
>    drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
>    drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
>    drm/i915/dp: Use the common downstream bw check in compute_bpc
>    drm/i915/hdmi: Expose DSC min/max bpp helpers
>    drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
>      limits
>    drm/i915/dp: Allow PCON DSC modes through FRL bw check
>    drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth
>
>   drivers/gpu/drm/i915/display/intel_dp.c   | 144 ++++++++++++++++++----
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 124 ++++++++++++++-----
>   drivers/gpu/drm/i915/display/intel_hdmi.h |   7 +-
>   3 files changed, 218 insertions(+), 57 deletions(-)
>
--------------vaoC6A2vobikY0DVTU3a1iuj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ankit,</p>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-size: 14px; font-style: normal; line-height: 20px;">Tested
        on the NVL platform using the AORUS FO32U2P panel and a BizLink
        (DP to HDMI2.1) dongle.&nbsp;</div>
      <div style="font-size: 14px; font-style: normal; line-height: 20px;">With
        your patches, I am now able to achieve 3840x2160 @ 240Hz, which
        was previously being&nbsp;</div>
      <div style="font-size: 14px; font-style: normal; line-height: 20px;">rejected
        with a CLOCK_HIGH error without the patches.</div>
    </p>
    <p>Tested-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a><br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 11-08-2026 10:12 am, Ankit Nautiyal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260811044234.593986-1-ankit.k.nautiyal@intel.com">
      <pre wrap="" class="moz-quote-pre">The PCON mode_valid path currently does not fully account for the bandwidth
limitations of the PCON &lt;-&gt; HDMI link. The DSC capability between the
PCON and the HDMI sink also needs to be taken into account, which currently
isn't. Furthermore, the compressed bpp chosen needs to fit the
FRL configuration, which is also missing.

This series:
 - reworks the HDMI DSC helpers so they can be reused across the
   mode_valid, compute_config and FRL bandwidth check paths
 - fixes the FRL/TMDS downstream bandwidth checks, and allows
   PCON DSC modes through the FRL check
 - Clamps the programmed DSC bpp to the FRL link bandwidth.

Rev2:
 - Rebase and address comments from Suraj.
 - Drop drm/i915/dp: Use FRL pair check for the DFP dotclock limit as no
   longer required.

Ankit Nautiyal (8):
  drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/dp: Allow PCON DSC modes through FRL bw check
  drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth

 drivers/gpu/drm/i915/display/intel_dp.c   | 144 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 124 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |   7 +-
 3 files changed, 218 insertions(+), 57 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------vaoC6A2vobikY0DVTU3a1iuj--
