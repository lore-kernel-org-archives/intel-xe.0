Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFB2C5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AED510E376;
	Fri, 21 Aug 2026 21:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+NB9Fai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED4310E376
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787348578; x=1818884578;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=4LFg5vN2IowIblbwa+k0Gj4N/OyrfvtPtgoBf+m+2WY=;
 b=E+NB9Fai5Kjcx1oBubAn9O9ISSm0k2Dj6w2B+Bq4AYOA8aZXCAH5XUAN
 e5hzuZAzfiVWp3ITxcyjkiw9HKGw7VbIljGciDuejZro4Yq88MrhjwZa3
 eM9yT8qGAhIdubA54VX5WurgnpignVEE0mXj0DrZG/vVFa+XhmKT0sDIi
 2CTlo4R70auE/L9QOIknDjk4x/BGb6bKeGuKN7W0otSSt9FguxmL85bWm
 Tk2jfuAGR+nMjSWpj6Kqw9NdUqMnGNw5jxsrz8mh1hI4VlvBMMQL434Sw
 rrKJlEazHccphx788TYzACK8zlV/P84QtvIM15STCNoOLzFejoB3vMbHk Q==;
X-CSE-ConnectionGUID: DXXhxnuGTD6WHXYgYXWpag==
X-CSE-MsgGUID: LrzE8WU2SQ+XMn9gxjXwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87021182"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87021182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:42:57 -0700
X-CSE-ConnectionGUID: HKewCIAUTA6x8rYQdE/BGA==
X-CSE-MsgGUID: xqtC6K06R+yApP0mM3sgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="270281353"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:42:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:42:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 14:42:55 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCVNiLJ52V9hxAKuk9aGkcosm5mz6vmp7mMHPkhFj3nVLPd7b2H+kScwUYCFwPgz//VX4ZijTaRR7HMzgsEzYkx5I98443HKW0A33n190cRWG0AwCymskRvQ05cFFRzSHpCGnt7+OwhQUqKSVWv885I0QdiFjpmbS5K+TuwZzEKgjoOZu3IH+hY3zZ8qkbJOlD8/ko75SqCJvd7KZffq6OEFteXq90u5fVzmjsUrOP9c/qwhYpBZhIZTsdcTl/P5+As6DCekqwm/OgENYjoXRDMFjtFdUUoNs89rvRJYEnlmDnFDCRnNIIt96JHaIvydSP271KURUcYZlNW/BTsd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Met41fTu6hIb4YIogvV3ylxvPdrXyea6ILmeBm6zoEA=;
 b=NQ9wrzPew0Qupy+Hk9ZkW8/JSSRt15vfFr3B2RwB/KyBthRzvs0JWdAc/cI5qHhkIq28cPFATmF3i+ucvy8m/AXBDT6PgjjwTA1XdwwhPWFPhQCNLtZCwTTHpjCEfE+evjX8DYQFs1zH4Txx49H/mwOy86UMQBy3icMIlXs/hYEJaQfHIZgT7upDeT1TmmvWY9UdhkNnJ98cmXnrutt/0QNZPUiOhJ96dvNq063Ruozhp1juWqCULK+vY04tnUZ0wxRrokbKt2Wr9kt4x4Y7d6W884hDOsB0pXhF4RIa7H6H04sTuQCPlVMvQcpugYkbUIeB/FQijkzE6wqid3150Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 21:42:52 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Fri, 21 Aug 2026
 21:42:52 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>, "Filip
 Hazubski" <filip.hazubski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
In-Reply-To: <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
 <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
Date: Fri, 21 Aug 2026 18:42:48 -0300
Message-ID: <874ignduav.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0da607-4f92-4f36-7009-08deffcd26f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: scg8MTBnmEGf9r5RyluD21uxg1ct1vnDpXRtD2yyb03Yw5TYxxRPuwLyze+AhFkKXfmGnV0319IXNob3sVPpP02SY/6zbvPY0vBE4Ftkh3OiVu2PefBaOqsxNfaoc/HDZpGvS5fUmyOLbleL1B5KpuwN4H2wp5Mh0wYD/QkTrjTDMwtF9mHcHvXQ6m+CVikYDPik1fQQ3M1nmi2gr2NVf2hx37Qh9FlSI9j8A4sTSr/xrwGwIN46sDNuXaY9WEBuqkpx7JxUI/08jd+b5ZtvPrvA25gxuMVQ97ILA0cYwAYBQz0Ci1CGC8Sc86DuPDcobYBhN19yrGeQX9TQtb/IoPpZE5c5Wwcuzt9oEI4PAzR7n10MkLBbVhPxuLVm2L6xDwUQraUB+bGwqd5T1vF1oGT9k+v3xKcE31S/vVf8bGl4MS5zg4jTbG/LzFbwvTXEWrdMG1dtLkWui3etAuEyzEOe7m9Gh0lquQg9RyxzegtvQRKIi+O9tUuBkYKEib5Z+XpaIF5+0hZlRtD+xpl6PMvZfagEfWzgUCn8q3bmu9oIAbmvI6rroftsPGfK/sbe9aB5/YYsPgo59cVshQkscVlr3ZerfzbD7gBYdSrv0PjfpcfvYrKMGijSjvwILflg4Yj3nyx0eavb25t2k5LE6Kf11rSjq6sH6tu8WHOdoJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpXMmtSTjBwOXZjVHVFdlVHUjVVYTc2NDg2MGxQZWI5TVh6RTV3Y0hNcUlq?=
 =?utf-8?B?SUJyMjZjSDcxM3Y2Ync1OEdUZ1dwMmZoampPdlZIVDZ3QlJET0dSYmU5Q0s1?=
 =?utf-8?B?VDdreVRpVGR1WFVvM3VYb0w2RWIzYzA3cTh2MnNGaWJvWlgxckZldGY0TXZu?=
 =?utf-8?B?UlJUb0xoS3hlUENsYVdBU0VqYUZMYVZrL0FxVFUvVCtUT25kTzZJN2tBbWRN?=
 =?utf-8?B?YzA0RS81RnZvWEdlWHgyOUJ6Y25CRTNzTnl5NjVkWkhBNzhNdEdkYU1qQlpu?=
 =?utf-8?B?bXRmdTdGcnAvQ0hjT3dyK3JaUXN5Q3BRN2xjMDVqSzZBSUw0cm1xREo3WkN3?=
 =?utf-8?B?dEVESUxaQkpuMTh2dXNpbXNWMG9odmRXcEM5Z2llUUgvaFR1UEJiN3pVSWIz?=
 =?utf-8?B?bldNVkdaaERPZHdDKzhEVjBKVStHODRyVVlWWVdVUmJacTI1UVVTUThkTUtH?=
 =?utf-8?B?Q3ZMTXZMMEVsOHJicWttcTZldGoyYk9hdnk5UmRIRy9xa2JOS0U0VjRQM25D?=
 =?utf-8?B?aDAvNC94cm0yamhiN2JqcWNRRWZWanV5NXl5bFJROCtIWWhOcGw1eHlkdnpa?=
 =?utf-8?B?ZUQ3MHFVTmloT0ZXK0w4TTZKZEFMcTd0anpIYWNXVTlLUllRSkd3NDdmU083?=
 =?utf-8?B?ZUMxK1JOUjk5OUtzMDY3V1dqamhxbk5HckU4eDB4OHlMMlNYNEpFTnYvRERq?=
 =?utf-8?B?ZVFyZjhkVDI3Uk9ONG4yTEZaeGdMR1U0cHhKSCtCWnF3NnlkWjJhTXg5L0xu?=
 =?utf-8?B?WFlMKzZ0bHdXZFpPZUNWUUhZNldCM1RGSFhEZFJiSUxMWG9rODBuL05HRTlU?=
 =?utf-8?B?UFVWNkx2TWNHc3R1R0Y0N2tqNHRWeGpVY3lyeGQrZEpRK0JzckVtRlBhWDdi?=
 =?utf-8?B?eWlyTHptSEd3MGlLK2NvSlFoT2hnSWlGbjc1RVBEOW5hV1FtNG1vSFROZ2dK?=
 =?utf-8?B?TzI1SFhLZ0RqM2JLa0tFSTUxWHgwRXJYcGFCZWVvemJsaWx6UkVOZWUvcUR3?=
 =?utf-8?B?d3BhejIwYTNqWmVJb3RhRFYrMDRKR2UzSENvZTNGdjB1Qk5kTXVLWXdwakxD?=
 =?utf-8?B?d0dQSVozUXFJRkJuNjA5ZGQ2b1JKM0J2VE1peXpTb2RKNW9SRWd1dXA3aFN0?=
 =?utf-8?B?cHhmaGVLRHdUb1BLMndLRTBwSWU3eHdTRXFlZ1BybEdHQzdxT2xzM3N3cjdz?=
 =?utf-8?B?ZjA3cWVXWElvUG5Jd2x5VFp4Y1hOVjN4Q2l6b0lBdWxxSFJqUzlZU2JYaWpC?=
 =?utf-8?B?KzErY1JWRkJsUkU5ZjB4ZngydG1CQkkwNWhoeW1TYktvekg1dVdZZ3I5Vyti?=
 =?utf-8?B?WTVvbzNyVkFFTml2WERVNWdiWXVJLyt1dC91cXpxeXIyNDcrQnp4cnNLUHVh?=
 =?utf-8?B?MUFKanJZNGdiU0NwU0JhaU5oVEp2S0YvQ3lhUXBwbXhxanFNYkZtWklaQVV1?=
 =?utf-8?B?WVl5YmVheVhaOVNTUWhmYVo3NmJMSDlQdlNrZE8ydFhweEJ1ZmpyUjBPeXAv?=
 =?utf-8?B?aEYvRTVTOGZUZVJyQUh1aXZ6QmpaNEFDbDVTRGtMdjJvODEvNDMxbHVDV3lw?=
 =?utf-8?B?TVVHSVZNSG9qZ2w1a2NWbUJmaW9WSS9Cd0tRUVdDbE9aRG94NlV3Ti9UbWFU?=
 =?utf-8?B?b3lJMTB2QWtCd3BmWlNDZGlScDMrc2Y0R1BJa3VNeHkycC90dkdnTFlpM0hx?=
 =?utf-8?B?SDI0WnJEUnF4TzJTR1lTMmthRE4vdCtQUDRJRTRaT05acUtXSFUvQ0c4bUk0?=
 =?utf-8?B?UVFTUHh1UmhFWUdYckdkSTlTTTNGbEMxOU81WVBjS0NYZklqRVhXeGxFQU1B?=
 =?utf-8?B?UTFIRzgzMlNjbmFtOXgwUlA5UkFSUmtKYWZpbTlKRVJaZDdSYkhhTkhiTEd2?=
 =?utf-8?B?UkNxdnF1V0NhbGlCaTcwdERvZVNmV250SEZuVW5KUXpaUFhLNCt4U1FNZG8x?=
 =?utf-8?B?Z0Y2bXAvNThnRGpWV3M4aVV2SXkraUo2L3NUbW0yOTJMeEZRSFp4QVVlbHdT?=
 =?utf-8?B?elQrZTFDajFNUHEveXFaeE1wTXVLTld0d1hsdkdIQWlSMndlOE83d1U1U0tI?=
 =?utf-8?B?VDhHOS9jMXIyN0NSZWNMVGNjOVFDU2NpcWp6Q1cvODN6eDI2SVJ5UTFXYmtE?=
 =?utf-8?B?TVN4dXhxR3Z6U1BFa2U4Rk8xODlDaHNST3owN01qc1AxVXN2cytieXVOMUdx?=
 =?utf-8?B?MTcyaHNyU1ByckR6WHlpeVd5S2hVYXZ0RFZQVU1rTHgvYkp4SEM1T2ZSZVlr?=
 =?utf-8?B?RS8rZVNJOHRDcXEwZmU1dXl2cTJOQjUzYkdla09BSnhScmsrOWVuMmpvT2xs?=
 =?utf-8?B?bW5Lc1ZPTC9yY1dzMzh0b29Gc0FINFdPYkYwYm9GcFluVWxoS0dxdz09?=
X-Exchange-RoutingPolicyChecked: s12m/n/EihK2w2SnlP973ge55tXq60PKwqaLR6uC0H2Y783jfZ5ifZ8EPpku7IHlIIFyBB3hJjeaEWpN+fviSM7TiI/H59THviyKgj4805m2BiYvqSh+/CSzgYZIYRB9bX0ZKKPVzhwRRqRl7ijrrMuvJS2Nw2qV6cXAOoQ/+9MBrdUvS3CoHDV+5CWkwloIKFYUpacaHCX+iW/jZfrW2Kz9NYqjKU6Nm+Lc9pZ5RX7GAZiDz+VCQ2J0p2oKh7VA3xPJz6AJ/nZ4Jrgza9RzJCs+PnSy7ClrUl/AAuGtluut2JY5rbwN1o30DvCefYtpg2kEX+fJ/c5/FgrQM/e3Bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0da607-4f92-4f36-7009-08deffcd26f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 21:42:52.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNTXhvd0CBfIhSJT98pfUtiZAYIODL30tJp4TmTiAcB3HMwxCrTJDYo5Eu2jwZL1iPme2TBJgTScwvgu3EbajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Wa_14026539277 is a temporary workaround that targets only A*
> steppings of graphics version 35.10 and requires that we avoid using
> 2-way coherency for device-cacheable memory accesses.  For
> driver-internal usage, we convert those configurations to be
> device-uncached and 1-way-coherent; on the UAPI side, we reject
> VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
> userspace to select the alternative option that is most appropriate to
> their usage.
>
> v2:
>   - Add missing bits to convert the PAT value to device-uncacheable in
>     wa_14026539277_fixup_pat_value(). (Sashiko)
>   - Also validate the PAT index in the DRM_XE_VM_MADVISE
>     ioctl. (Sashiko)
>   - Match against the graphics IP instead of the platform.
> v3:
>   - Handle any 2-way-coherent PAT index irrespective of L3 cache
>     policy, because L3 UC can be promoted to cached by MOCS. (Matt)
>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>

Jos=C3=A9 and Filip, I would like to request new acks for this patch, becau=
se
now it rejects any 2-way-coherent PAT index, not only those that are
device-cacheable.

--
Gustavo Sousa

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.h        | 10 ++++++
>  drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
>  drivers/gpu/drm/xe/xe_pat.c        | 64 ++++++++++++++++++++++++++++++++=
++----
>  drivers/gpu/drm/xe/xe_vm.c         |  5 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  3 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  6 files changed, 87 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 7060f66e1d63..10374022f1d2 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u1=
6 pat_index);
>   */
>  u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
> =20
> +/**
> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
> + * use due to Wa_14026539277?
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: a boolean indicating whether the PAT index is reserved or not=
.
> + */
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)=
;
> +
>  #define xe_cache_pat_idx(xe, cache_mode) ({					\
>  	const struct xe_device *__xedev =3D (xe);					\
>  	enum xe_cache_level __mode =3D (cache_mode);				\
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index ccf7ef3cf3e7..516da74b542f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -847,14 +847,18 @@ static void override_has_cached_pt(struct xe_device=
 *xe)
>  	struct xe_gt *gt;
>  	u8 id;
> =20
> -	/*
> -	 * Wa_16029380221: The affected GT will always use non-coherent
> -	 * access to page tables, so we must do uncached writes from the
> -	 * CPU.
> -	 */
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		/*
> +		 * Wa_16029380221: The affected GT will always use
> +		 * non-coherent access to page tables, so we must do
> +		 * uncached writes from the CPU.
> +		 */
>  		if (XE_GT_WA(gt, 16029380221))
>  			xe->info.has_cached_pt =3D false;
> +
> +		if (XE_GT_WA(gt, 14026539277))
> +			xe->info.has_cached_pt =3D false;
> +	}
>  }
> =20
>  static int probe_has_flat_ccs(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..66378128377c 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -313,6 +313,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe,=
 u16 pat_index)
>  	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>  }
> =20
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	bool has_wa =3D false;
> +
> +	for_each_gt(gt, xe, id) {
> +		if (XE_GT_WA(gt, 14026539277)) {
> +			has_wa =3D true;
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Disallow 2-way coherency for any L3 cache policy because
> +	 * XE_L3_POLICY_UC could still be promoted to a cached policy
> +	 * by MOCS indices.
> +	 */
> +	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE_COH=
_2WAY;
> +}
> +
> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
> +{
> +	if (XE_GT_WA(gt, 14026539277)) {
> +		if (REG_FIELD_GET(XE2_COH_MODE, value) =3D=3D XE_COH_2WAY) {
> +			value &=3D ~(XE2_L3_POLICY | XE2_COH_MODE);
> +			value |=3D REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
> +				 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
> +		}
> +	}
> +
> +	return value;
> +}
> +
>  static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> @@ -373,18 +407,22 @@ static void program_pat_mcr(struct xe_gt *gt, const=
 struct xe_pat_table_entry ta
> =20
>  	for (int i =3D 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i));
> +		u32 pat =3D wa_14026539277_fixup_pat_value(gt, table[i].value);
> =20
> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>  	}
> =20
>  	if (xe->pat.pat_ats)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->v=
alue);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
> +					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
> =20
>  	if (pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
> =20
>  	if (tr_pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->v=
alue);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
>  }
> =20
>  static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -534,13 +572,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_pr=
inter *p)
>  	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> =20
>  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> +		bool rsvd =3D !xe->pat.table[i].valid ||
> +			    xe_pat_wa_14026539277_reserved(xe, i);
> +
>  		if (xe_gt_is_media_type(gt))
>  			pat =3D xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>  		else
>  			pat =3D xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> =20
>  		xe_pat_index_label(label, sizeof(label), i);
> -		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		xe->pat.ops->entry_dump(p, label, pat, rsvd);
>  	}
> =20
>  	/*
> @@ -747,9 +788,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct d=
rm_printer *p)
>  	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
>  		u32 pat =3D xe->pat.table[i].value;
> =20
> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		if (GRAPHICS_VER(xe) >=3D 20) {
> +			bool rsvd =3D !xe->pat.table[i].valid ||
> +				    xe_pat_wa_14026539277_reserved(xe, i);
> +
>  			xe_pat_index_label(label, sizeof(label), i);
> -			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, rsvd);
>  		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
>  			xelpg_pat_entry_dump(p, i, pat);
>  		} else if (xe->info.platform =3D=3D XE_PVC) {
> @@ -764,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>  	if (pta_entry) {
>  		u32 pat =3D pta_entry->value;
> =20
> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "Page Table Access:\n");
>  		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
> @@ -771,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>  	if (tr_pta_entry) {
>  		u32 pat =3D tr_pta_entry->value;
> =20
> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "TRTT Page Table Access:\n");
>  		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>  	}
> @@ -778,6 +828,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>  	if (xe->pat.pat_ats) {
>  		u32 pat =3D xe->pat.pat_ats->value;
> =20
> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>  		drm_printf(p, "PCIe ATS/PASID:\n");
>  		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 19b3d0be7928..92a1d5098aac 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3829,6 +3829,11 @@ static int vm_bind_ioctl_check_args(struct xe_devi=
ce *xe, struct xe_vm *vm,
>  			goto free_bind_ops;
>  		}
> =20
> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {
> +			err =3D -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>  		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>  		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_v=
m_madvise.c
> index 0474768a38aa..265273294756 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_device =
*xe,
>  	u16 coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
>  	int i;
> =20
> +	if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
> +		return false;
> +
>  	/*
>  	 * Using coh_none with CPU cached buffers is not allowed on iGPU.
>  	 * On iGPU the GPU shares the LLC with the CPU, so with coh_none
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index dd69ad07f7a9..46290d039fa8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -71,4 +71,5 @@
>  		GRAPHICS_VERSION(3511)
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
> +14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>  14027054324	GRAPHICS_VERSION(3511)
>
> --=20
> 2.55.0
