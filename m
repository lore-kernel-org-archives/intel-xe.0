Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3559CD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B697710E110;
	Fri, 12 Jun 2026 21:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QX8MjlFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBEF10E110
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781300707; x=1812836707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aTQOeTRGrsV0OVClEkCkxR84yI6AvJVPckEbInUxX8U=;
 b=QX8MjlFZKDniBPo/3Ml78TwLeyiaKCjO42KVHyOUsXt9vHgsYJYUmyKW
 Yz6d95dBHfMhqdJw0COXSIgMOId9MaZQB/2PqF9RRfDqPrJxX2Lr+BUBh
 Ne0ZSJ8pZDuBXqm4eErfu5LIpiIIpaFzs+H7HGs4a6xzKCt3XioVuRR6O
 1LT7Lbv6iNadqK+Uf2qcwvtp4CL1SjiIJNHph+5f+E+KgGWNuVbCcCx6D
 ObkjptoW2tqxxAKQL3qNoLSy6Q3HbPwZ9YGdZ4SBzAWikQY4jLb2lE0KJ
 68Cldo1N0BmK1tQe9ynTV1lJKhPOi3CuB86hBps/TSbbwoKn+i/vkCz1w Q==;
X-CSE-ConnectionGUID: uUc2wQtTTaSUiurlcFZFfw==
X-CSE-MsgGUID: vzOsyL68Te+nuXrsBZAvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81273564"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81273564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:45:06 -0700
X-CSE-ConnectionGUID: 0bAd9Pc7STKL1kn66EUoCA==
X-CSE-MsgGUID: ny9lyjldTxmsuNJglf14zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="242780458"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:45:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:45:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:45:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:45:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBbPmBnOKkQpduDRujDwwVvHjv6JOxR6QghQP2DKHnC+V8WKW6kUnKp8YCFKBWMgdWte7dDmU8Rpu8WVQdBk59T4W48F5BCN1r9bxDfhNHIKm21hx4tBoLgKqRpN/2aUOSmPJPW8dc0QgLzlzDR3kvz+vRD7QgjplgcC2LOl7nvOcDTE0bImCgIlXOk3JPLhJ73hKfrOf+BO2881Z0vK4LwBlteDwGyF7WQUQ+igyNn4VNAobEGUgFv45dQRhUhPFv4OjDmdWASSQlTCwQiNvtJzRk33FO8IS8wYtDo7sdZBreYWSaANpCALMJlP+rmPPYu1cvan7dAQm0Vli5EQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMLT6XzFJ5IrLQ/EpTiA9iZ2tyY4l+/is77yRyvVJ/E=;
 b=b0UJTWBeNM5Oh5Lg3zY4VVrh95arRLiCz0fqD40vvCCetmY/ya30JV3t/Qyq/5wZnkuZl/kg6mtPmLu5po3aWb5LcBOVHm7zJm698DJzmADJWG8MssdIFS63aOenWBWi1bgq+NF4FZUE2Rpsqc9WdlQFNhfVu2ufjZ5gOcSdirfmjlrFAiVpytSL1JNASUeBH27uli7rP4edT6nicKILggXjv7jqSav7ojC+M50Q+zoZy4kdluIk+Ez/TjFKRA8IqlHs8u+kOIYYPpMz+2OMrW8gizBInpKDqwdRCTjCqJeOEj4mzPOlyzBrwBEl+IJ+dkOQKBjDGGqvEwac5RdhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 21:45:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:45:03 +0000
Date: Fri, 12 Jun 2026 14:45:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/9] drm/xe/rtp: (De-)whitelist OA registers for all
 hwe's for a gt
Message-ID: <aix93dh6KIcEmeGd@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-8-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caf515e-ab7c-4ad4-0952-08dec8cbdc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c66eyPDJ73jCY2wuKOLomJ4CoyMZs2zKPPK62IQniz+ryZMdy1z2i7MbTUubKl7D3uB5ombPbwV9cUH7SqmYl8pUZ8wjAe8x05jt+iz6/pHpzwbQwQUt1JQDK/AcJrQpHdu+VfQg/OvY+MtcCJAHKCWJwsLR+cW7C9V5ZokS2qITNU42UifoOSy1CQWw36wpciuHrpO0zD3+CKxkzHDmeyS+DGV5uzDA04bpsrJpSMm8w1Ke1YCUwWnq+olbFEwC9IQ8GC3hQ4YCZ5C4L0pGapOjNEXoFpoRe+PNC88eR5fs28XiICj/6vPFjvDRFn+rZxCUOPm6sXBp37cQLHLI7dxTkCeyNRDFrsfDdcaeXvZb7u6QzBYG03Qs9NXUfkmOytJ4aePToz26uGYKwR3r8GyowdR8chM+MAihu/YzYoquvD1UuyXPj/XI0cjVT900rPUwST1M9zyBfZFrwB8QSFeePxlAR2nUjqgPKOwZQVUY6GcrKFcStx9+PL3+3x4zUhArOHuXPjUSoWe3NaXa6weJ9k4vhzFDKW9sbzOpIB4MZuihTYQqJKrO3y7OnnrpRzgxbmfDq3/cOfHYgRoeJwu7L7/DD/jPZ8a1o/pilWOBVMMa/XoyOJVUS9Cf0YiYWNflKJamBhwG2lChSllQdc+VoKMOTGpXO4GZsF7tMM4k6NgjaNsdEXjbBGVVMrrv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXY0R1FQMk9uSTgxQUNOVFlMa2JPKzdVQmovYm14SURGaVZqc2VzM1FQS1hO?=
 =?utf-8?B?Yld4VEJySWpqai9YbC90Q2NDZFV3QlFrVklYRlRIRDNKVnZmWmw4azQ5UitS?=
 =?utf-8?B?ZzlCRnR0SGY2NXk1M2xXT3NDWFZJdXpzdUlDMnRNNEpVeDRQV2V0S0ZBL2I1?=
 =?utf-8?B?ZXRkMVFHUFo3cm5GUU0rdDZzRnJveHNSemw2TW0xQWVpeUZVRnV5UW11cTNK?=
 =?utf-8?B?UE9Ub3h0dVNIVllsSC9wbkVUd3VhZTlhWXdLclMzMlBBeHBNc0tBVVk1UkRU?=
 =?utf-8?B?elIrNGhsZUVqUUJGQXpVQnZlSkdMOERqcG9XVlIrWHEwOTNKVy9wMmhGNVVQ?=
 =?utf-8?B?Q1JORTlYN3dhQ0xzM2YzamdCSStvUXhReFpEeHNVaXNuWXJVS3c2bWQyKzZ3?=
 =?utf-8?B?TVBnOUgvamJoYnc0MVgrbDIrVm8rSnZISm13RitibGtVeTh1S0YwQzBlNVN2?=
 =?utf-8?B?R3B4bEYxdWdQU2MzNlk2dTRLbHdUaGhDT2pEaVVmUy8zZ01WU0p4eHo0aUl3?=
 =?utf-8?B?bk5jWGJMOXZjNStVTGFSNlZBTEZJbEJhZTZZZCtiSnRkNTlLOUJYRWZ5anpY?=
 =?utf-8?B?MFBvSkg3WE9XbkNscWYzVDRkOFFqRHB5dGZ5b25HK2pLKzJIaFQ2b3BLL3p3?=
 =?utf-8?B?ZGprdnI5L1hzS0ZNZi9SMEZwS3cvWENkZk92OU1jclphY0t2Z3I0RG5IemFO?=
 =?utf-8?B?ZFBGMEtQS09WY0w3R2s2WW1zWk5xMm9ibnpMNS9uYW5DeFNEUTd2dm50b3Rz?=
 =?utf-8?B?RHdlYU9nVDlWQW1xTTEvU2JIZlVYOUMyK3U2UC9JMlJQckpoT0pwMHNoU25r?=
 =?utf-8?B?bFhRRjN6MnVWQjZ4QjZqVDVpZWVMbWYxV0NtNU1jdXZBalJqWmk3M2hYR2Ew?=
 =?utf-8?B?dDlqR1VvYUcwR1N0VzA0NEZGOXFRZk9Ra0RKVGIzTTgvRStXTzFlVXg2RDVj?=
 =?utf-8?B?c2N2VXdPcHdzZHU4V1BYZnJ5R1RWQm5WNmNNL1FSK3ZRUCtVOU5xQWRBTVVx?=
 =?utf-8?B?cS8xeGNBUzNiTWRrc3c0eFRhUmZqdFpnYnVpM3lDVmphUHJsRHdSTURSZkxq?=
 =?utf-8?B?cDNCRHFhUFZ0eXgyUW90bW14REpEL0ZYeEZZc0hHUkhYbldEMEE1dGo4ZEUy?=
 =?utf-8?B?UTRnRlIvdzBUbXdLakVqVzVGdVMrSWwzcDJ2ZHdJYndKd2xtbFFuNlJoNnR0?=
 =?utf-8?B?N2pyWk5aSjBkZGdzaXJ2WWx3MjdlVjh2Q2x4SUZoM01BTzhNc0pNNDBvZmZP?=
 =?utf-8?B?WUxBSGQ3SHFpdTFyZXV6b1I2K3l2RmJaMWV4NEdUck5UMlJvWW1KSXlRMXhm?=
 =?utf-8?B?TjlTRWFVeWtTTFVZdFFzbHh4WEh3aXNsMEFGNlB1Z3ppWmV0ZzR3RkZJTStN?=
 =?utf-8?B?bGZJSWQvWTE1YzlnKytBVjlqVU5ZYzh3a3dNanBnQmRtZnVzMmhpUnBJRHUw?=
 =?utf-8?B?cEMxdHYvWERNa0pNeGVybFZlTCtweXZJU2ZmaFA5QTJST1hsUXduVVF3dldG?=
 =?utf-8?B?VmZOYU1KK09oV1NTUXp0QjdVMlNjYmVMMEZiTEgzOUowcUJHM0JGclJ3NzNG?=
 =?utf-8?B?Q25zKzZPeHBrTFpMazJCY09zUS9mSDFaazVhWWoxQ3VzQ1V0T2xYVXRobjdU?=
 =?utf-8?B?anhsc3hGRVN2eDhzcENQYXpWdlhnMTdXT2NtUmpSTmNzdjRaTW1VS3cyaW5N?=
 =?utf-8?B?QjBvdW1LSlpPeTJZelVkZkFRWVNLZ1JUcElvcXYrdzFNVzlpUnd2NmgxWllS?=
 =?utf-8?B?bnRVTWlUMTEzVjlqc2YzdUppV2QzTE1ucGhINGpUdGNnL21MV2xUTS9zRDBm?=
 =?utf-8?B?Z3dXNXpKQTZubkhzT3RpMU9ScVhUamNjTEZEa0diNUsrMitYbFQ0dzU0V1I2?=
 =?utf-8?B?dlFFekZyTG5BQm14RzFHMjhUNFR2Wm43dnFSeGNId1gxaEFHMnlKVExrd1BS?=
 =?utf-8?B?SHMrY3FSYnlHYUZkU091cUZNTU1BZEszRWxQUGFtTmJsMVdtMWxJNHRFNFJU?=
 =?utf-8?B?dXJoeU5XM1lJdjlWWitwR3gvOHp3Wk9IeFE4TjkyekZnY2dmMXZFTVdydkMr?=
 =?utf-8?B?eTV4Uk1IRi9KVGtpNW10Szc0MWZueFh0djY0dTQxdFFIYXNLang1dFFPOWlF?=
 =?utf-8?B?SXdHWXpoQXoxdytSYklpSVZyNHY5ZXZQSGRnRTN1aS9xUkdJWU1QUUo0dk11?=
 =?utf-8?B?K1VFYXp4SHJmVUtzN1NhT1BuTGhVRm1PakNwYVdDbHpEVVluaUxaQm9ad2N4?=
 =?utf-8?B?L0g3K0NUOFl4UWt3NUhkZ3dlQkNkcCtGbUdWSnhXbXdyeVRNUWRBdU9WZ0hz?=
 =?utf-8?B?WENuN2YvNEQzeWxDZVkrQmVSemNGc3ExZFZkRjM1dGtlNVY3R000OXZ4M2Qy?=
 =?utf-8?Q?AgnpS6FveUVDi9SA=3D?=
X-Exchange-RoutingPolicyChecked: jDv+gVg1hmFXcDnRobZoAp8dTThW4VHUbZGdcX5lGIhwGMDkAwH0kX0huYPjH9VdCUrmFnL5FT7ex6gwJoBwTLcSIfPHpqCjPZwcEMigr+V/MKFw0+zY0IKjBQDqJkNsoeMiDyIa5P6Ah8kd0tzlwUKLEvAF8hfPo0wEHvjMZ6EuJsOr0KqquVmsIA44ikq9T8AY1/A+1OXPjuu2mBJPlAICDKkgx2MGdKElq0Gru8BFMDXshDX2foFJLXXtsckzWtCdvaeYmHgSzb1Wi//v3jorBOO3V13HsORYuddsQSBhkDaXyPS9RIhn9+/0U+HfHYHBvW24RAkIjEblmdZKUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caf515e-ab7c-4ad4-0952-08dec8cbdc69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:45:03.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct+SDOrgF1dlTVlDSaXXDNnF2yBV/ge+U/gVnX9avNseUPv0t9EJ31cBxWl8fBHX+aao919UeF+GEDJU2GvroL0dsA9lWAclZddekBfXX+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Mon, Jun 08, 2026 at 03:36:22PM -0700, Ashutosh Dixit wrote:
>Whitelist or de-whitelist OA registers for all hwe's on the gt on which the
>OA stream is opened. This simplifies the case where an oa unit has 0
>attached hwe's (but which monitors OA events on the associated GT).

Yeah, OA unit and hwe mappings are not straight forward, so for now, 
this is good.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 32 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_reg_whitelist.h |  4 ++++
> 2 files changed, 35 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 4bac129cbfdeb..65971e1526d0e 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -230,7 +230,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, first_oa_slot);
> }
>
>-__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
>+static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
> {
> 	struct xe_reg_sr_entry *entry;
> 	unsigned long reg;
>@@ -245,6 +245,36 @@ __maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool wh
> 	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
> }
>
>+/**
>+ * xe_reg_whitelist_oa_regs - whitelist oa registers for gt
>+ * @gt: gt to whitelist oa registers for
>+ *
>+ * Whitelist OA registers by resetting RING_FORCE_TO_NONPRIV_DENY
>+ */
>+void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id)
>+		__whitelist_oa_regs(hwe, true);
>+}
>+
>+/**
>+ * xe_reg_dewhitelist_oa_regs - dewhitelist oa registers for gt
>+ * @gt: gt to dewhitelist oa registers for
>+ *
>+ * Dewhitelist OA registers by setting RING_FORCE_TO_NONPRIV_DENY
>+ */
>+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id)
>+		__whitelist_oa_regs(hwe, false);
>+}
>+
> /**
>  * xe_reg_whitelist_print_entry - print one whitelist entry
>  * @p: DRM printer
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>index 3b64b42fe96e9..e1eb1b7d5480b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>@@ -9,12 +9,16 @@
> #include <linux/types.h>
>
> struct drm_printer;
>+struct xe_gt;
> struct xe_hw_engine;
> struct xe_reg_sr;
> struct xe_reg_sr_entry;
>
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>
>+void xe_reg_whitelist_oa_regs(struct xe_gt *gt);
>+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt);
>+
> void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> 				  u32 reg, struct xe_reg_sr_entry *entry);
>
>-- 
>2.54.0
>
