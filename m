Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AAFC531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 09:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEB910E619;
	Fri, 24 Jul 2026 09:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChVh2qAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E83810E619
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784886574; x=1816422574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z5OY75Bt27PfpV/OvY3l1G8WrfXW51vtLPz3tJVD0VI=;
 b=ChVh2qAYzcMOUq/5R8Ki4dq2HNn1jRYe3djI9kU87WnkyCjZM4IA4PAV
 ADzCIG9iRixvLqWZ+ByeXx9HGpKpIKBX+BI18KATVY8lKi30OFmQH8baH
 HbJ7NqxR3nzsmlqk/RRG93jGW5QJ6ltjsA1olW2WmaoP3X2yDtOMDVuhT
 3/rAjk+U1CMlT7nBf1Do79U9qiKfuCC8anYcwAAH+XkIPtaWf2rYTCgSM
 7dpFm0k4rRKoy/M9hc76EsW1nlR1tsYOSKOh//N/bhMRRDgRW0MjezY+X
 tyQeM4NLJn3vKoWdQYifhENjK3EJakXdwbsYJRL3drFS4zukg2jJ/+fsh w==;
X-CSE-ConnectionGUID: 28rBZDaeRN6rBvnbbo/dxQ==
X-CSE-MsgGUID: YyabiItMTyq9aZOIUwymwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85422091"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85422091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 02:49:33 -0700
X-CSE-ConnectionGUID: skRDqm+0SI++XGMcvpayaw==
X-CSE-MsgGUID: vtpD2WLORLKZB8QihslTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="258122907"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 02:49:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 02:49:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 02:49:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 02:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY4LctiO0k+lnGf08BeV7YAdANt1v/kJSQvICSvcssVE28Gjg6hkktx2jn3fG1DCJTh6zeDOiv735523VeZprsOxqmRCl0/vqrW4Zf5auW8n7FOfs0ctAWOkE1KcIOLKmQmyV+0lx8f6nUfbTJReqI7mldUPpVs6OMSGsngtjcuaafUJC2XPmJXo0xIAwMk3SzDqY7Q6cK9yrxTPxuOe9YgWdjjokzVeqzuvmeYEpNmhR3wl8oQNrm7ibX/p70ZZXkpEe1bjLCklEaJnwTtsqfAeh4lEgg9WgvMGNfmD1+BylvHo9wqbNXkl+xfoDH0aviTK4fThnhYyfY7/KTWWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5OY75Bt27PfpV/OvY3l1G8WrfXW51vtLPz3tJVD0VI=;
 b=auNx390p0X//hgL8Qx8wrtRfDuUuJCzhc43OEWmJWY+i3chXqLQSKzNwcFXPhPv+C9nqikoc38iqwZT3qGgZAd8y1s9SGOseyDMxqODjQtnUO2p0zLH9snrxpo0Vk3PSe1ILcYaXdAFIrzG7FiMnuPmPzqkdAfREjmvZ9bQeNPGimOEZR7jMitpgG0nL+aoM8LsJIO6LBtZU4fhqXWTDZ14b72SW+RwBIF+g2w88aPf8uqaMc7SlJ1Wy80w+1yIXR4s0iLt4y4gmxzNJXDOvmLzpTRpLqO8vDWYvFLu3BJRAq2ZH8in2A4E7o1uZYZSk/bJ7O/oDpHAxB6TMo48D0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 09:49:30 +0000
Received: from SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57]) by SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 09:49:30 +0000
Message-ID: <95514f1d-2cee-4c3e-b228-2a43dddd5269@intel.com>
Date: Fri, 24 Jul 2026 12:49:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/mmio_gem: use write-back mapping for dummy
 page
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <koby.elbaz@intel.com>, <meny.yossefi@intel.com>,
 <shuicheng.lin@intel.com>, <thomas.hellstrom@intel.com>,
 <matthew.brost@intel.com>, Sashiko <sashiko-bot@kernel.org>
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-3-ilia.levi@intel.com>
 <87f46e8d-f436-43a8-a2b9-bd509ff566c4@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <87f46e8d-f436-43a8-a2b9-bd509ff566c4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::13) To SA1PR11MB8575.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8575:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 783dbd48-49c4-4d79-fa8d-08dee968db3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uvU2cfOmbOCKLzalRIvVpQ8creF0wQfPA9HbM0H8Sa+iI6bZeYdaTF7oB7i7jlHPfPpaa0x5NgO2qT7iVSk1ZvfknmUnnH+LOHC3fzQ2wlyw5W94J46ZpOCk8uJkzZqig4jbcw+V7H6LE41xnF0qHOhGjCtVIyn0/qgvf6gjYZVfDh0jyUQFPEwYkv9W9yR4ytBLAMQ4expuA0bmDfF65ftvw+5ASsc54HEOC05+T60AtCE88LphhBdOb9y0GT4bosstzpuw8WqJSgFFWdTcYP/jeUu/wDvbNpngF2p9/QBkrscR+dZW599svzpQJ305EtRoNPmFbH2pmNvga+dxy/gthLkZnS7PPddwkKH2rHR1l31JQPoGRv0Q++uAKC7/TADvHErTqGT0jFCuGWzAHgQC/lwJN8rKJmUswjKyqPu1drcxLguOUP6ngFfZHHnYq6OENuXa8r0Dokqz1ZEpeac6wkVT4giZXCvTU+etbN8COr+xql0U0re3wLhSBthcNewT99j3DZviteoxj3dLIcaA44UyJS+IP+TeOqXXy/58xnV+uId06qsPYyPeaOvCi5JnoVBWH2O8fks0SvLmApoCinfflatKenZKbUc3kww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8575.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNIU1R1dXNmS1pvbno3emU3bTFWSm00M01CMmFJQjFUbU10OTdod1g2Y2FK?=
 =?utf-8?B?LzY0TVpqcE5SM05nVGR4VlZBUHVOdHRVc1hYYVl6ektSTkFMZnRLR0RyTUhK?=
 =?utf-8?B?OGQ3eXZmZ0dtZUpCMXViSTFnc3Z3d0c1UUJsR2JWdEYxWEc4VE1QS1ZvcFZu?=
 =?utf-8?B?bFE1QkthMjAzZkphdlhOYnBuRnB4eHJjTXB0S1B3ODRWZXpZQmR0cFZIWVdR?=
 =?utf-8?B?VHI5V1F2ZTdZWXViY0czY2xhcmlBanhWRkVva2pHK1B4MHRYRUhSK29heFJP?=
 =?utf-8?B?Q1FYclc2UEdsbnZSRFAweHcxaUF4V2crQ0R0TitmUDJINWFNWGEram45VFdo?=
 =?utf-8?B?b3ZGYVBlMWMzY1Ywd1dLRzBtZFhxTzBUWUNHbVpZOWVoakFZNXRlVWtmK2Vv?=
 =?utf-8?B?UGkzR3M4aW9mVjVsUXNSQW94SUMyUm8xSzBTd2p5L2hOa251TnYzRUgwaFAr?=
 =?utf-8?B?ZkFFQU96dy84MnJudFhyc04zUVhTWlJBMldZUGRnT0dwaURtc0FKbUsrMFBZ?=
 =?utf-8?B?eGc3NjZHOFBpSHJnRWpVSXFKOW91eTFGaWsycWpGZU5IbVRCL29TR3hyNXlG?=
 =?utf-8?B?dzFHRVJ3dExRZFhjUkMxeFFqMHpHTE9Bd2ljN3duY2VwRUcxclp3S2svNHE4?=
 =?utf-8?B?THVmZlNZMUFLYmhJY0FEdHRQb2llTmpjU0dmZncwRHh1bnRHVlN4RndCV0dE?=
 =?utf-8?B?OGo2TTJGREh2RTNQRUtqOTdvK29SV0F3aWJIeTQzRllhRjNKZzUva3lkQkVG?=
 =?utf-8?B?Qms2WVN0L0ZtNzgzMW9Ubys4bE80cktNTDZzeG04Z0UxMWNtTUJNcFU4Y0kz?=
 =?utf-8?B?OStWV0dLN3ZtVlR5VThCWmdlcEpVTXlkVXIveWhRYm1UcDZpVFlaSW8rQWNx?=
 =?utf-8?B?MDJ6eFFzWEtkM0l4R0hVMVFuWjFlSmhjeVN6THRGSGZwVDVvRXVBbi9MdEc2?=
 =?utf-8?B?dkRaejVqalJGVjgvSWRuZ1E0SUgzM3Rsa0JOZDgvc2lYTFNEYmZzRlRLQXpT?=
 =?utf-8?B?dU9GcFBBdUxSVi8wYWIzWFFQMTk3SHdpTlkyMFN3VGVWOEJlTzgxZDBoY0o2?=
 =?utf-8?B?TFR6Tm03TS92UVpZaU5KMEQrQS9WS3NRZTBCRnIrZGE0VVFiUTFOdnUwZldF?=
 =?utf-8?B?cXJ2OEJsdU0rN2xoZThQQks2V2c3NkNqK3FRZEQ5ang2eTUrZk9PdklGV1kw?=
 =?utf-8?B?d29ob3pKSzFpQnVWelNFVlo5UEVqUXRNc0ZkK3BwSDFxdGRiSzYrVzIwM1N2?=
 =?utf-8?B?SEt3MFRNQk5FMkJXR05wZm1DalRCbTZkTHFFSVRCcWlKU0NSczRjcGxPWXVa?=
 =?utf-8?B?TG5jM3dXYmZ5QUtJYlNBTFQvaDMxeEVjcm9DelEyelVDbmIyZHZPVUwwcFpi?=
 =?utf-8?B?Ry93anl5a25qc2tyWmV0YjlSdHFLNkdXcXcxTHQxZW0rdnFBNHJqUis1Ykcr?=
 =?utf-8?B?M1JFMmp0eHoyK3pSVXU2cXJqL25tdWNmVkFlQjFLcXNZdzRUT3NJMFdMU0Vi?=
 =?utf-8?B?cHIwYVFpTnArQmcwK3JYM3l5MTVZWVFiMUpzZnpORUZHU1BqbTA4U0w0YUkr?=
 =?utf-8?B?anRBUFlGSlZoQ2k0VGtpbGJsZTdOQWcvSkxmV1dOLy9DYWhEcDZweUhOelpN?=
 =?utf-8?B?ZGJtVVlsdUdhaW5Sd3BrOExnK1YzZEZsNHN6WkZ5Wk51ZEY0MFo2ZmtESG55?=
 =?utf-8?B?L3NpcUxkOG1FdDQyaEVpSjAvKzJGbk9tNDF1WjJoN0RoL0hRM0dXdGNnQlZv?=
 =?utf-8?B?dFpUeGl5akIxZjVqSnByRktuR0lLL3hGNGlrSzdqNEpod3ZlY0NsbW9Fb0c1?=
 =?utf-8?B?MlR5d2ViSjMyUDIxQThLNFMvTHhSb2F2Mm03dzN6MW1ZYjJmMklEODdQM3Z2?=
 =?utf-8?B?dzloVUpvUk9oYUpCYXFwSUFUaVNMTmFSK2F0VnFFMnVpZVNBL2ZVSDZnTWFW?=
 =?utf-8?B?VHZrWnphVjdGdk1jN21zTHg1T2JnMExtYXArZG5sRXQxdTIxQW0wQmdRLzRu?=
 =?utf-8?B?cFFkNVBNRVIreWV3cmhzY2RjMEFSL3l1cy9teDh5TlRYcCtGMUZERjdLeXBn?=
 =?utf-8?B?bWRlblo0emYxSG9UcDR2YVUyaFRGNURDbnNuM0M1TWdxd01ERGFUZTZ6ZDNY?=
 =?utf-8?B?b1pjWlhQUCtqT3JqY01lakp3eEh1SFNOWWtpVVNYOGFkMXliR1VaQ3ZuOFhZ?=
 =?utf-8?B?ZU0wQWdwVmdEY1QvWE5IWVZqT2ZwSHdKOHRzQ0tYSmdkOE5IM1lKVVFpazdq?=
 =?utf-8?B?YitjZGdhY1NQOVRNYjRFRjluV01BT1BnV0tMZm9hTEN2eUFWenp4ZmFJRnNl?=
 =?utf-8?B?TEVrSE9yWWdWMWpwa3JIbnNzRG9GR29RWDF3YzRzZUJNOFZyYTJOUT09?=
X-Exchange-RoutingPolicyChecked: osq6tANTca+gmGdQC9G8zgv7IoS9aicrG5Ey+Y0mKwPswLLs9n6g7RZbE/Fhf2AwHIuOqp2b8IRDfyhlPZ9vSWzGBPZ1JN19uK9VddfxbJN7ZD/sDromevOwVc9jkpr3X6bR45kaj4M9DrK55o60JLlq2FI+qFf91G7vsfSwfWcsn+CiwA3ErlwbzTNRu+YxCDyAnt0KAhQovsQTRGes+SspRNfNv8Tnac02GTY6+c3+LVpbVbYf6gSvKNw4qabBl++N/nbjoARiYHs74xB+2hhV7bbTMv1j1LNmWVUbjJMydzHy092CHo+BmTq+TbDMGJdG82qaRW79HQq4clgy2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 783dbd48-49c4-4d79-fa8d-08dee968db3f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8575.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:49:30.0142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57ePZyiGntbAORccGJ08PFf1sIPeXar2swNMan3TxF4R2Q9lw3J1yt+o4p2fpiSqH/VAxxi73bkapdDCtWyvtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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


On 23-Jul-26 20:16, Matthew Auld wrote:
> On 23/07/2026 17:18, Ilia Levi wrote:
>> Currently vmf_insert_pfn() maps the dummy page as UC, inheriting the
>> VMA's page protection which was set for the real MMIO region. This
>> conflicts with the direct map's WB mapping of the same page, creating a
>> cache type alias which is architecturally undefined on x86.
>
> Is this claim correct? AFAICT on x86 it pulls the caching type from the pfn, so if the page is allocated as WB, it should just use WB, no? I'm looking at pfnmap_setup_cachemode() on x86.
>
> Perhaps this is instead needed for non-x86?

Right, or on x86 if PAT is disabled. Good catch!

>
>>
>> Use vmf_insert_pfn_prot() with a WB pgprot instead. Also simplify to
>> fault in the requested page instead of the whole VMA.
>>
>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260525125801.975038-6-ilia.levi%40intel.com
>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio_gem.c | 19 +++++--------------
>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>> index f15a6a84af15..418a24bdfa4e 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>> @@ -172,14 +172,13 @@ static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>>       __free_page((struct page *)res);
>>   }
>>   -static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
>>   {
>> +    struct vm_area_struct *vma = vmf->vma;
>>       struct drm_gem_object *base = vma->vm_private_data;
>>       struct drm_device *dev = base->dev;
>> -    vm_fault_t ret = VM_FAULT_NOPAGE;
>>       struct page *page;
>>       unsigned long pfn;
>> -    unsigned long i;
>>         page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>>       if (!page)
>> @@ -190,16 +189,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>>         pfn = page_to_pfn(page);
>>   -    /* Map the entire VMA to the same dummy page */
>> -    for (i = 0; i < base->size; i += PAGE_SIZE) {
>> -        unsigned long addr = vma->vm_start + i;
>> -
>> -        ret = vmf_insert_pfn(vma, addr, pfn);
>> -        if (ret & VM_FAULT_ERROR)
>> -            break;
>> -    }
>> -
>> -    return ret;
>> +    return vmf_insert_pfn_prot(vma, vmf->address, pfn,
>> +                   vm_get_page_prot(vma->vm_flags));
>>   }
>>     static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>> @@ -219,7 +210,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>            * It is assumed the userspace will receive the notification via some
>>            * other channel (e.g. drm uevent).
>>            */
>> -        return xe_mmio_gem_vm_fault_dummy_page(vma);
>> +        return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>       }
>>         for (i = 0; i < base->size; i += PAGE_SIZE) {
>
