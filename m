Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4DAC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F30C10E0C1;
	Wed, 16 Sep 2026 09:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NslAdf87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE810E0C1;
 Wed, 16 Sep 2026 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789551621; x=1821087621;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cHOM5yfJyBPt/8uKSOiEpx/PUAUTai5/Vw0xHTDY0Mc=;
 b=NslAdf870cLtniShsEE1kN6Y6DinAf5LwZmnNgbMZ+OFdfv2+EnBtT89
 RoblOZakz4WIymt053tuYt7ajA1TnHyRz+6/gU8N/rc7VSmTF4481RZR/
 vIfzJv/k9g9/KVYZAb7Lfdjf29celzKpa0uwt7kXcna3YDGwLeBqP3Jgf
 +8pNH6f8d3ZgJ/ky6p86zxjYQZHqllfG9GJXD6RQbFib3WkVDl3Q24qlO
 S+e8Dd5mKW49QXKV3uCdMVKFOxU/rZpLiVVEG9V0oQHvI0gMwj3CDO9G/
 2spOatdahtHamWBmv7uYd5IsErGtRWwdgLTOwiLZvprQFSAq3sQfUHY87 Q==;
X-CSE-ConnectionGUID: N2ZQSJElSMeVTUID2KOYQw==
X-CSE-MsgGUID: 6TM1XSeYRAyWwBrqiuKjVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101269385"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101269385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:40:21 -0700
X-CSE-ConnectionGUID: Rg19sEl1RoeMdPrmqL7RiA==
X-CSE-MsgGUID: dB3CrQdvSKa5GaBW8UUyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275251913"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:40:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:40:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:40:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeeabnVWXj4RSU+6IzRA3gpbczFevl1k6hPJfMz2vd5rcatbU9eG9eRdwvbidEQua6BCVVIW1fSWiDedf883CzfVlfQyqTISAsSJVEuM2BEjZmGRIMJ6Lk4uXLoHaxQJh0i3xDGg2pT+PAHykkVBdTsRw+KumoiU+YxdW1QnwlJmjowhEXYLLDpW5+HHKF7UQ41+Y7Lic+fvf7TU3b4PAjstYw+3iAVdw3y8XhEaRsE0pRlEkIW/IHRf5lhzl3OFZCLwLHnJep6sNM6MEN0/rNF3TXCgk2zHJ7LGAZBcibZoHB5UUI702+bm24HEQGg3OiiL0ybrQeTyr2m5fwymNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53y/RzKalf3pja5IzKAbT1Gkig42FMtmvJ6+AXPTEAA=;
 b=XczDMzblYaKQAWfvNf9DnTHcTo5XkJEWJIaXPaBi3KsJmsPerev7sDer/NInwkayDQoHX7EpHU+KhWzLpE/dbAVzkqPvxnM3Yw6jT+V3I5sGSwGGtE4Dlow5Edhou4nB4DZKt/0nWfAbIoFc3VxWw8TCLCkZKWqXJlFnBFfb/Knqb/Rr6Hx9GdB/qL/d8f6PPmciIFt4t+aCXi8PaJ5jkff9tqg8i8kDT8F8nF9hWxok5AY3IJbV5KU46efyLXYA8Rc0Hr+SvEUsJFXNjeTYgjJYMSkbOnP19/tyqMl54EFEWFqNW4tJHIiU3QYkLNuOImd/SodxtpDEnOeNhhWs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH9PR11MB681838.namprd11.prod.outlook.com (2603:10b6:510:419::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:40:18 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 09:40:12 +0000
Message-ID: <a2327859-46d6-4e06-a9f2-63f1cb944486@intel.com>
Date: Wed, 16 Sep 2026 15:10:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/2] Support YUV buffers in HDR planes
To: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0357.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH9PR11MB681838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e543623-a2bb-48cc-7df0-08df13d68128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DZ9SBjCmfnX0vaGup/nX0AmBGxbvaGfb9vCQ+Y7rzuFihDwUvaKY2cyjI1UGcc2KlHFibeJvGwo9YlCy11lARsoTXxW/XQVXB4qk8jNHCGJS/SVC+E6Dc7HwbJULui2RUaeouIobjYtx92dldKvzwMpNLuGOMNxwp2mHbpLf0Qnt2JTqHNEKljp9VPASTqM+Z6+a0x8OwNk408cdHTdaOIZ6XF4RfI1b/Dg6uiPSFt8BIvX9LGU6uVrN6iSNOws1DJ+4q24iYUHbsTVlsYM3+BglVMxd2hh+dqSOHebngo0sbmUaNrJiFCsEYWnUjmaROn0VYeYI4Ynviltbkonbs/LkoRROHX3Mh5Ls0ZaVzQZGKlaPl0l1qf4ka7HMG14/AfU7rovRvctjdYPryuBkU9bC4dQkIdtFVoPkDGs8Va79TMzMwFWMJDzbvkY30M31PB/kbw5Pn/sx+jmCwMbRBADn9sXZy1ok4ayxCDeAtIaVFsiQ8CchjyW/5P7LRW8W9O1a9NuzJLCob9rvojNwnvV/fnBlZOo1/EYQ0nNXnqueKWHfL6cQJeXU6cjntWE/HxJVwIbOSuvC2eDZhaXowmu5fnPkJ6jSXCXLft2WUrGiPyIClCcwh+Ivbq8XYAhO3cdyJlU87QW4SUlgAPeV49Na72B22y+BqXWKO4IBrsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZoWjd5bFlWMVhITmp5ZkpRcGU5TjJkVENVWHJ4Y1JzenpzdUtsZU50Qlpn?=
 =?utf-8?B?bFpLTTR6OHRXRkkxOEp0bjRTa3Z3R253NmExcVNTMkpuVTFXZzFhdHlBSXhj?=
 =?utf-8?B?Umw0YytMeGRTRkVybm9sRFM4QkNaUjNLWTBtWnd3UmlFNGRDWExNTXRkaGVx?=
 =?utf-8?B?Z3dRZ0Vrdi8zVE1pbENhcmpPWFNteHpiZHlCd1psaktYMld4akRKS3Z4N1kw?=
 =?utf-8?B?Y3p2MVp0QUx5T05tblM2RFBJZ2xGbk8yYmRDUEFMR2dJQlo3K2QxRStwK1Ru?=
 =?utf-8?B?QmE5VXR3WG43VUVsMys5K3N3VVg0VkJDbjZHRG00eHltWW1xNEk4SDU5Tm5i?=
 =?utf-8?B?aFZDaUtPckp4eUk2NlUzaHpqYWprYUE3YmtYVG9KNDB0UGlNd1VuRWRNb3Q1?=
 =?utf-8?B?NjFPZ240RWFCek45Z0lvUHFxNC9FVlNWOHNtaG9qakh1N2puU3lxY2JUbU5Z?=
 =?utf-8?B?UEl6NFVNV2xLdUp1Q2tYdWhvdG9wV2JtWDA4Qmo3ajlUUWQ1ZjkzMlZRamtu?=
 =?utf-8?B?RUI4b2VZVU5aV2F3UDROM0JUdDdTQWo3ZWJWTFZpZ2liWjEzSFhpMG1ydlpi?=
 =?utf-8?B?UmtJWDN3WXlZcDFSTUgvVThtZ0xRMEFzSHNpK1hoZVVRKytLSElqYlA2ZGMv?=
 =?utf-8?B?aGV0U3ZrSEl3T3ZZY0JWZmdBWWx1eXFBckFieGFpdzJWMzZFeW1LcW1EVnMz?=
 =?utf-8?B?U0YrZGlSTUtVYWprc1BWRFV3SnZrSHFRam9HdUYrcmxEUEdHSm84WHoxSk53?=
 =?utf-8?B?dXNhYTBxMHc4YnRYcVpsWE5KalBIMHBjeFQwVUJuWkp2bHg4NDBwNklOamEz?=
 =?utf-8?B?d3RpR2RDK2ZUMUZQZk9OR0s0bTNzRmFUMXhMR2M5SWRHckdzcDN4U0l3eS84?=
 =?utf-8?B?UGNHd2FleS9kRjdzRXdDZENtNU9rY1lERFZyVjZqenlBU3VIN0MvOGl2OFQv?=
 =?utf-8?B?cjNjZ0lwenF0OXQwSTBlVnhUL3ZjZ1c0YjN0RW1OVUhLbklBWGs1K25mU29F?=
 =?utf-8?B?eDQxL1ZWeDNWTERCSXZsa0tTdUljR0kxQTQ1eDYwNTFtWVFpRWEweDJ2a0N1?=
 =?utf-8?B?M2gzeU0rRWhnb0hNK083RmcrZkFSVWNYUVJWOXdETGl2TzhRaXoyNVdOWWVR?=
 =?utf-8?B?elFWT3Fuc2FYUUExb2lLaG5zSGNNaUo0YzdMTSsrMEdFaUlQb3p2UFF0QU1R?=
 =?utf-8?B?dEF1TUQ3Nnd1MDhRZkk1Tm1OakJOQ21vOFNjM0QyclZ0N3NVVW9LampEYkQz?=
 =?utf-8?B?Qm1qZGVWYnNjaW5sR3FtbFg1NEJmTndtM3czN2hDcFlHRnNZVHA2ZDQybHYw?=
 =?utf-8?B?QWd0SzA5d3FxSk1tMWdBb3Uxb01RYURlam92STN4WGRVTEtCNkt6WHN6TDZV?=
 =?utf-8?B?RDh4SCtYYW10RmhNbEVabnhDZnF2dnZkU1VtU3VDNVo4QmM4ZFhGOWxIeGVo?=
 =?utf-8?B?L3Z4M1hwWEs1VFc5ZFIyTVM4ZFpMN0xmZjR5KzhHVU11UUYxNkZ3MUJTZFI3?=
 =?utf-8?B?UnNiMmtoaGtsUFlzempGVDBSUFNIRnY1TXE2YzhTQktkNUJWUVhZL2lBem9z?=
 =?utf-8?B?bXJlelRkUzlJd2VLMEJIOXVuL2FvVTZzblBhMEJXVkUxYzlWbG11KzBnVXBP?=
 =?utf-8?B?anVvRjUwcEZHTVVvUmc1K0dBVFBLSWEwSjdTS29IN2pwa2JlY3FOV25wNncr?=
 =?utf-8?B?Ry9xa2Nld0R5SlhvSU5LckJUelVJaWVwd1EveUJVeThuWTZqQnVSN0orTldt?=
 =?utf-8?B?U0pyL2xZd2VRVzBhUzg1ODMxeXRsTm53TlRxVkppRzl6TlJpSHNRZGRDcUZv?=
 =?utf-8?B?RGxFS0poNXNYUnEwOWJEd3h2NmxhK3VwSDhUOVp3QWIyU0hCOHFjMEd5Vy9C?=
 =?utf-8?B?ZnM5YS95K1FsTllHMFJnNTdRakttekc0MmlubTBaMjFBWC9NQVIyMTZaOXF0?=
 =?utf-8?B?eFZwYkFKMjI5TEk3WTlrdUZoWXNrY0M3V0sycExFYnZWc0dqbUNLTitNYXRJ?=
 =?utf-8?B?WFBLdGZKK1VJYjM5cWtZdTVyeTk4dmZwRHN5Nms2YmdVanZsOVN4M3BMcnV5?=
 =?utf-8?B?SmdWRTFnbnZwWURZYlNYdzRqOFZJRjI3WVB2cHp1eFdOZnQ3MldYK3hqejFV?=
 =?utf-8?B?a25YcDZGQmF5OUh5MkV6OWRMdllmWXVQV1EzYnMvdE1rUmpLaWFBQXo0WTNt?=
 =?utf-8?B?Nkk4YmJ2NFdWdklZd2dNZGtOTHFYL1dXWUwzenliOEp4MXdLUEl5T1ZhbzAy?=
 =?utf-8?B?UHBsN0YvTmpvWGVhajdQSFhzU3NpaHcvUnIvdUZFV3lSVFYxeld5Qjl0MDZD?=
 =?utf-8?B?UXhCbFhjRVZjZFgzUStUSDByVmFUZmtHd0VyUFpmOGhmSkplMUhiNkxyUGMz?=
 =?utf-8?Q?Vr42x6p/PZqJ+OOU=3D?=
X-Exchange-RoutingPolicyChecked: t02ZvUdI2KXdpEj1/dXrp4YCTcTOnctgo+776u8nFGEVTpwN56wD1LuHdWuEv0Kh6js+fSWWgHn3zu4539se0Wf/+kp9C/9dH9mqGSLc+ArZv2DDSNuQl9IGTfzkXaBTc3Vt3EVPyiZqHleAevAbFzsLvKoAPGSfmW2ZXPWRQERcDkgO1nuZUaHpZm2RAq91cVknnHOhizSF2wldklM0Ijds/q/oOYWzY94Hcd5W24jAN9ggqIi3nTWBS9DrI9mwhOEY23vlklcflZecIJ3Q5+5ET/XhUGVTQ3WiDE1aKAEKRL2iFqnDSad8eTWJ/Zg/tcHfz2uaQ+sbioo5WGAwHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e543623-a2bb-48cc-7df0-08df13d68128
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:40:12.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5SU/WhUXS/Re8QAc6LygRu5rHW/KWtMcQpki624zezTOxgKZBadI418am3QHeZ29rODNQsXdeykv2Dvo4q4CzuphmHUkQ+8NSncYszKK2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB681838
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



On 9/1/2026 5:32 PM, Chaitanya Kumar Borah wrote:
> The legacy COLOR ENCODING and COLOR RANGE properties are mutually exclusive
> for HDR planes. Add support for FIXED MATRIX colorops in HDR plane color
> pipeline that can be used for YCbCr to RGB conversion.
> 
> The first patch contains the base work done for SDR planes and is being
> reviewed separately.
> 
> v2:
>   - Increase MAX_COLOROP to 5 (Sashiko)

Thank you for the reviews, pushed to drm-intel-next.

> 
> Chaitanya Kumar Borah (2):
>    [DO_NOT_REVIEW] drm/i915/color: Add color pipeline support for SDR
>      planes
>    drm/i915/color: Add YUV buffer support on HDR planes
> 
>   drivers/gpu/drm/i915/display/intel_color.c    | 76 +++++++++++++++----
>   .../drm/i915/display/intel_color_pipeline.c   | 34 +++++++--
>   .../drm/i915/display/intel_display_limits.h   |  1 +
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_plane.c    | 53 ++++++++++++-
>   .../drm/i915/display/skl_universal_plane.c    | 45 ++++++-----
>   6 files changed, 168 insertions(+), 42 deletions(-)
> 

