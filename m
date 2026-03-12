Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2D4105A591
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 12:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22010E9E6;
	Thu, 12 Mar 2026 12:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gn2OKAqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE14D10E421
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773318373; x=1804854373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s8sB9WqjjnWGDG5TsQXEAEhuRyflmVhA8bckeT2Ehps=;
 b=gn2OKAqwhv1nec0p0bbRU9BWzOIO1EpIKvZpzfitopkjRbhZxyzCVjOE
 Zmi8hULNsx3JyG+C8PKxXUlDGTTsh2w3slSjkLmAuewLfcifKwf0/Qg+1
 jpywGzu1SqQ3zWaGt6aII4BZmptQFh01sISWSuzToxTc66UlKNxElzRJE
 y5v1kSEyDGzM226hCZm8o0jQXKVmJHmCQM0naVl2H4b+3tPmI8Z4fLANT
 j8hBgkoZ8E3qU2iLC+TqvrvAs+MmzIvb1Vv6VyEGYwlo0hYyC9VgHwog6
 rl9ic80JNoNBhRy0pTgDUUhnn0CJ+i5uxDpWUsccRK03UjaC5LLS+kfqF Q==;
X-CSE-ConnectionGUID: WuqBlOkzSWCNur0pq6Xb9w==
X-CSE-MsgGUID: /9/BI3XLSxClBR4TUfY2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74374708"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74374708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:26:13 -0700
X-CSE-ConnectionGUID: A3V3iXNBSmW3hbRJ6Tuhog==
X-CSE-MsgGUID: E91zjstTS5aT5mZeu+z/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225258843"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:26:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 05:26:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 05:26:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 05:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFYfo9HQM5deU6fYVbL7FoeUeymKitrAWKY2Vkq71ALF3aSo9VH/AlmA2Kml6bGNuWVd8+MYl16olBEHt0K3bbm9hAGeva8ZRSIiSc0STGCetTmv8QADwKqNAqZfma36erymyCmcsMjrxuy0/GSCSX/fSPacKC/4VgzaPGmhYBokVfoFbR+CVUC+UsPF4DdFbuH2XCFD8+Ky4gyOA3X6meI4FsgDxDImGVgvnccv805WmWOqdrn0238ajv3bKNDWDATE9coGy+oG0/niHdkmGMu1BjbbQT+8ZCQuHCbOT6zUyifw/i+cRW4BSSFlOIugmU7RPfy2H+peekR4kGExdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Doze3nln3eY0qlOwPJcAHL3tqYZpWdqH4/pAugJDnMI=;
 b=W48utoKz6c5r/osNogPYo/CoIMKGqLgmicavqqZ1MOvk2LGpRrnF0tj5VwiylQDup/EOpkyTGUvAdynRBe3Mtw4ObEnZ5xDgyP/B85M6TmqOqmhq7PZrxz1u+hHOIU1qoWHpG0QHFYoavxa3Q8kzDjGmLCygkmtnO757pPofeV/tsOIOdLNT9WBWHVFcCzeYuabNLaq3sYBrgEtrOFv1I0CzVKVlMcADvF+GbWMxcp2pSAGhCO6hDIi/9Ep9jx+tMzEU6AD6kZ/nFlEXlg2IOf090WaVIfA4mcPP5NeSfUTgO/BvEl1fsrn8J7V3z6XX9k3FNn33cSug5D/O2DF6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Thu, 12 Mar
 2026 12:26:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 12:26:10 +0000
Date: Thu, 12 Mar 2026 17:55:58 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Robert Krzemien
 <robert.krzemien@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Allow reading after disabling OA stream
Message-ID: <abKw1rkEfe5+2ZLC@soc-5CG1426VCC.clients.intel.com>
References: <20260311210107.3112353-1-ashutosh.dixit@intel.com>
 <abI/7h8lOy9NFpBX@soc-5CG1426VCC.clients.intel.com>
 <87wlzhwnd5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wlzhwnd5.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 0083c45f-2739-4bd6-82d3-08de80328abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yxiAsGbQaSPW1XALIAHhPxIm6ssJvnI0ptHId19q6mWoX4y8wAH2u8sCz9nHdPQORWdGF1hxz2simvxd2UHrt8pNH38yZtQwHJi3/tWxL20jpwPYvOF4QLNVXTVIdoqE3+s2iQz/oTdwnPFy25l26c+kba6Z7r3rhB4ORXkhNzjmk5Nv+1KvZR4ncID+oO4Bx9FFCqXa0tOHz8JabVAV3hJCeyS8kL/fhl9f/bRbrpGg8odcj8ykU65ttHdjXwn58vfOTQEl0LIUlqlcPIZE5zLwvAWVXDyfs0VlNe/FM8w0hteBcroGpNBNk9nxLkry5rRPgrji+4gqXn88xJ28PB7cgNCuDpSKvdtQX90SnivXY+5ASUYYPv6BkgCFA1E4sz+30YMou55AFynQSXWRG5NXvbtxWPWnrhxMsTgsCoCSlIkcickIjIYWXCc1onciHSJUnnRU8oqWF5dUuFLQ9JhMTCw8UzK7U5xjWPLvzRot0zwNt0yAkc8rrALlC6GZrz7PoVdkh+oedQvoVhb7KpT5YQBjdkEPREVsmLK8+Hg9J/UUYj8cdVZ/LAmHoJusQO6k0QsfDx57tU+aPP/R4P9EjKAfZRNCFEkDDw4YmuZiZKHdzAroXqHgdG4qltV5HFgD0qauW93ko2d8/v+mWrD04mFfeytsDF6t6xWzL/e7V18ff2v95iJfVkUd+846Zr6FTX6PL9Ndc6h8f9Wa9YEcssf4NXJ4AkOzp5zvkgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZwWmtna0FweTBiQ0tVT3V2SXpIOWN4NUo2VUJCaDhMdm9IaTMrUmNzRnJU?=
 =?utf-8?B?U1JIeU9sdjFNdVJPcTJSWW9BcW8yM2x6cWY1ZU1mSndQNEdNL253K0JmbEx0?=
 =?utf-8?B?SFdDQ1FUMjVjK1hqeFB1QnJGaUJPdG9QS3ZmMXpkUFEwVGdNZTRHZjZSYnBy?=
 =?utf-8?B?ekx6ZW5pM2NrTlJ0VlArMmVoOVF5c01LM3lmYzhOS0kzZUVzOUY2Z3paMFVQ?=
 =?utf-8?B?aVBPeUQ0ZkNmT0NOQlBkKytJSnF6TlR6ampZalFLRFZ3bFdGRlpBeGIvMjVp?=
 =?utf-8?B?dWZrY1lvWUFkWWtLbVNoTjVBVGFMa2hwWklENDNpZVNBL2Q5bFloTGZXVEFT?=
 =?utf-8?B?aFlqZTNERDRreVRCWnVraHNkdzNEanNVTExjM3lQYjJFQW91eVVQMVo1aDZ1?=
 =?utf-8?B?NlpsTTdpZTlvSklRWUlsUGQ5NVhpdFJGc0ZxL21rYnJycmRWclpyMXhmdklJ?=
 =?utf-8?B?QzZ0U0tTeTBkL21qWlFkQ1VzRWNBKy9vcDA5STlHWFlPZThEb0plczMyTyts?=
 =?utf-8?B?dDZYNHpDSEY1RXVOUWpDZlFEeE5jMG1QanEwRjJ0S1hxVFRBQmpYSHRHaVJH?=
 =?utf-8?B?UThDalBUYnRpSHhFSGU4UzFVQmhoc0cyZXNHdkFJd2dsR2VsOUQ5ditCdW5r?=
 =?utf-8?B?ZHljOVI0QUxtVzBHTmtVUnZGZWVGQzJNVnZZcjhoR0FVbTllOEFBWFNLTFRn?=
 =?utf-8?B?dnhwVlN3SXVlTmtxSUxqTFhneXZlYXNXQzdkbTB5WHhhZGZLSWtpNVBpK0p4?=
 =?utf-8?B?R2VleHRjQ1RhMTZlTmQ0TU1ENllYWnlwL0NQaFF2TE45eXJhVHVEbFFSWnlQ?=
 =?utf-8?B?ZDBCNzhabGxoaVhnMVBjaUJFZitHV2Y0YkphL3VHS0RlNGZNSWYyeFRhaEgz?=
 =?utf-8?B?c3pqSXpoZHNWQlQzZmJqM0EvOEt4cFFmNkxnNnYzR3JWMlBtOE5Vekp1bzRt?=
 =?utf-8?B?c2IwS2F3WDA0OVhrVGp4WnZpSHJ2dGNabGdYMjMrZjZrWDQ5Y1RTWTFVSU1U?=
 =?utf-8?B?cHJuV2tCMGR0OEwvaXNaTHlCMi9rNmRoWk8yZHh6cjFzdEJLVE9kU2FTb0Iv?=
 =?utf-8?B?djZqMUdRU3N6eUFYTUxWbWRTMVAwbDZBcStUT05DdmhHTVVHdHJTazNzSTJu?=
 =?utf-8?B?WDJpVGxnMmo3M2JqTGtkeUZMSU82bVNSU0ZDNkgxMUkzQzFCdlhDNWNZOUlQ?=
 =?utf-8?B?WHRDWkpZbzM3dDNkRVlMRXd4QXZQd1JuclJlblVqcWZEQ1ZTakRsQTl4VmhH?=
 =?utf-8?B?VWVSS0NLUTRwZ21IZjhPNDUyYmRibzNiK21xSElUL3lXRDFPcEcvWTRud0Rz?=
 =?utf-8?B?R1hyL0Y4dXVIRzBVNTV5T3NXMzY2ZEV4bnpVTmhNUDQ1VlhwemJJSlI1Ykhk?=
 =?utf-8?B?Sk5palF4UWNtU0xZcXVPQ05TU0lpdkVmaHFoY3V1amZELzVUTm1oUXBMZ0ZQ?=
 =?utf-8?B?WTZwYU5UOGgwWEQzbk8vU3B2VTRlVTBQbmlpeDJER1YvSWpJN05WUnB4L0ZE?=
 =?utf-8?B?eXY0SGtuOTRVblgvRnhSOS9oaWZlWm9IZ0pZZTNLOFp2TDZscU1XZjNtQUJo?=
 =?utf-8?B?Y0NKODR3Z21rM0M3M2NQS2lVRWg2ZUF2cHRyNWFZbFdZQkFqNE01Y0tyTlFN?=
 =?utf-8?B?MEQra3JUbnBKbXRTdGg4cHhJaEV3QnFQZnJ1OTRCSkcrOExQK3hrODlseENW?=
 =?utf-8?B?S0k3WTVsajZjbWRBUFZlZmRHc29ObDhlWGI5R0lJa2p2M0lXV25kekkwcFhE?=
 =?utf-8?B?Z0ZYc2xFMTJmYmNYajZjT1dhdnc3YmFxdU9KYUxiYWhUNE1sK3FRVm02ZGRB?=
 =?utf-8?B?THR0cllSdzRnYkQxVE1CSnRRdi9nTXBsdk1Bam9WMnk4VTd2U0oydm1vVU5i?=
 =?utf-8?B?UUZJaDZPMDQ3RG9nZTJHcmR5U29IR0M5VmNicE8rY3FuOC9GSjNEZDdBOGFN?=
 =?utf-8?B?UGZSbmNqbEJxQkdnM0xhKzdUMURwdUFxek9SckJCeTJKUWlYY3NYRDIxcEp3?=
 =?utf-8?B?ZndqQ3piSEJWN0Z6Z1NlbEhKVTlzN2lFMzNWV2ZxZHh4WXRKTzdJcDdNU1p3?=
 =?utf-8?B?SE1TSlN5WTdaTkZQSEh6elFHUDREbWppb0RJRTg2MjFoZGo2SjZnbW9pTzFW?=
 =?utf-8?B?TU82cGFBd0t1dWNnYVpOVjZOVFowQWNMS1pDSXVpV3ZjNm5YN2tNVU1nYjl5?=
 =?utf-8?B?dTFXZDJNeFVDckFCR2RneEtpRGZGRHZIZjhWOFA3WEpwekltT2VXWFVydnEr?=
 =?utf-8?B?V09UcTd1YXpPTVQrci9zcjVjSWhJanhsc2t6aDhYSmd0VVpRR3FYZmNqaFhF?=
 =?utf-8?B?YXBrK0w5b2FjcHJETWFVQzhxOTZxL3JGYjNpVUUyMUNtdUprNk9TNkhaS01V?=
 =?utf-8?Q?Jm9DL7WFveTVZzL4=3D?=
X-Exchange-RoutingPolicyChecked: ZUp6ktnF8L7FeQboo0KkVj1aU4AeyHjZUia8/aNW+2KUo1jOzVnBTuJdjh/mLoDjcbwGSH3pZCK707IHow71Y4/LU5hGP9cR3ICV5Z9H/4Zmjqh5UfvZh4nVdgU0JaW6Ny63mQ8hm8B4iY36uu3KZYrSkvNapeF7vFzF7Gy2/6bbBIIzQS5oOzLAEipaVTD2sgX6mzUF7JgXKXgpRsN0KW4awCRZJh5UDDCPMLSgVJX9gyDfyDAROTaGlrpyiVeexcRjGD+FgD/2SSw1T2J4NtTtM+ws87P6qVuLKzB6rXoZBJjGw3MOUEWdVaXK38mxw4TylWYXJAlsCu64Gdd8aQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0083c45f-2739-4bd6-82d3-08de80328abf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:26:10.0594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNkiUe+eVPiIPg6Fi8RMj719xNb91dqBJn7+Tcu0TXgQkKvuQPVMf4D9i97G3I5xISa+wIvL/GHSOuqqaBcxzZ0NNNAhf7dQS5veBPuFYFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

On Wed, Mar 11, 2026 at 11:52:38PM -0700, Dixit, Ashutosh wrote:
>On Wed, 11 Mar 2026 21:24:14 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Wed, Mar 11, 2026 at 02:01:07PM -0700, Ashutosh Dixit wrote:
>> > Some OA data might be present in the OA buffer when OA stream is
>> > disabled. Allow UMD's to retrieve this data, so that all data till the
>> > point when OA stream is disabled can be retrieved.
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_oa.c | 3 +--
>> > 1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > index 72fc4424017bf..f840827960eab 100644
>> > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > @@ -543,8 +543,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>> >	size_t offset = 0;
>> >	int ret;
>> >
>> > -	/* Can't read from disabled streams */
>> > -	if (!stream->enabled || !stream->sample)
>> > +	if (!stream->sample)
>> >		return -EINVAL;
>>
>> What if there is no data to be read when the stream was disabled? In polled
>> mode, we are probably fine, but in blocking mode, we may just wait forever
>> here.
>
>Yes, correct. There is no problem in non-blocking read() (it will return
>-EAGAIN if no data). But poll() or blocking read() can block.
>
>However, as far as I see, the responsibility of unblocking the blocked
>thread (e.g. by means of a signal) rests with UMD.
>
>Note: blocking read() cannot return 0 (it can, only on EOF, see 'man 2
>read' but I don't want to do it because "what is EOF"). Similarly poll()
>cannot return if there's no data, UMD will need to specify a timeout in
>poll().
>
>Note, KMD release() method will not get called if UMD thread is blocked in
>read(). So stream cannot be closed till the blocked thread is unblocked.
>
>I would imagine UMD will use non-blocking read()'s to retrieve data after
>stream is disabled, till non-blocking read() returns -EAGAIN. If they don't
>use non-blocking read(), they will have to handle the blocked thread using
>one of the methods above. There's nothing KMD can do.
>
>Unless you or Robert (Cc'd) can prove otherwise :-)

I guess you can argue both ways. I would think if the stream is 
disabled, there is really no meaning in supporting the blocked mode, but 
then blocked mode itself means that caller is blocked until data is 
available, so I guess it's okay to leave it as is.

I noticed another thing - When you disable a stream, you also end up 
disabling the hrtimer. Then who updates the software tail such that all 
the remaining data is read? Note that the poll only waits on the 
poll_wq. It does not check if new reports are available.

Regards,
Umesh

>
>> >
>> >	if (!(file->f_flags & O_NONBLOCK)) {
>> > --
>> > 2.48.1
>> >
