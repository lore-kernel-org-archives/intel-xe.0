Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57CDC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 10:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD6B10E33A;
	Tue,  4 Feb 2025 10:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id4TKhR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B66710E33A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738666306; x=1770202306;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tmS159WXoYoCIpz6LGNdk0eAVdfKz7TDvLDK4lYmRfQ=;
 b=id4TKhR02FVTtpBV7PQLIcplJaxhO2CPEZdnHBb4gti7QaVGZ7DmOiiO
 ijUCqMjLHFDaneT2jrEI0TX1qv0qHmjilMz6jZfz5PSHf7Ok8pbojqSzr
 1ee/p7WyDn6JWIuvPJeFfgldH6WH9+mjh3fYrTOb52FA/yGJdR09JBFjj
 lMVcOnELOpTEHPesW7Yn1gaRu4lwclXxhOuDHQDPO3fkUtTioo2+Marea
 31zDgllLS3132QKtxhYRx2nsbx+7qwGm2IjXf1jV++5heifXY+WvZ23Pj
 opy+mP1fqLwOIIr37Itz9Z4QwX8vnXeMR/536Fnrwl9qVjc1kcPCqt44L w==;
X-CSE-ConnectionGUID: 2m2gkoIrQyeZ5QdkuIFS4Q==
X-CSE-MsgGUID: UzH5B4x4TCC+ivIcKbJkbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42022968"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42022968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:51:45 -0800
X-CSE-ConnectionGUID: IX1f6yrUSVOD49r8pgz1og==
X-CSE-MsgGUID: ZqOTsHIlS1W6jg9m1SVhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141417745"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 02:51:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 02:51:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 02:51:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 02:51:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We2MMaiUSEPi1z0lumBF8/VekUQZuoHD3rCyaVwUpgWyoPRfPMQ6IEZRfAOZjckyi4ySnPjNs/KcDOhlNmVM/OjeCpOW+OpNdqijzlCV4I+lKzlG0nQw0QPSg0qUL18LwtQTX/M+ef8oDvSLG+hXYKEIHCO5quXR2WHR9Rm6FSQK/hhEMgPM335szLvidCP0vpLSC7ecCcHytWrEE5Wo4NCXUJjMlLgdVRHlZh1hovs+CYaq8gROqkl3SP1GltwRr5S9Yj13Bv9xV2nHQXLoO9UOxZ8pKLi1jlbsCUJ6/RdNYN2wEZK9hG0+LwjXV2CpMi3fzq6r8fucwNg1DN0muQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kJGadjk1v80d3+74R4ksUcXAYaomARamdOG1DtFUFQ=;
 b=wKwnt+80l+3SIFioSs8Bbi1HMAoPjQ6pZTI0ksqotDc1SYSQe1Br5BcMVrOfthxB2Tcx1wCkKPf2LhlR0smunFP5ji58u9/P62tnIFGHAhs47/rN8coCtU6W7Xq+U1DLnc0gN1bNmLuVHCCYmQn3EkgYSE0JTFDX8piA0i/wKWyMn5lz7GNT+kS5vHe4CtjGB8aFZiMa8BIsze62S06bAXq7oPook05oRvdtSL8HwLHLkAFtoiZekdbU2ibXJC5zt9iHsCa+3mVvPbUqW0qprAZpQPzGlWq4CzqALhOhCzRtnuSD2jP9la0qCR96OriZ90eSbWDbDnZqhLQe43UYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 10:51:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:51:40 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Tue, 4 Feb 2025 11:51:23 +0100
Message-ID: <20250204105124.795989-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0065.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7f414d-ebe1-40c2-3ca4-08dd4509e7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDVJU3MybGdwVGNuMHlSZ016MTFjekFjNmVZTjUvQU9Od2lHYlhnT281bEFY?=
 =?utf-8?B?elhIZDRjcUlnT216TkxYYTgzdFg4dVAvNHltZllNSjNwcnFKT0hHdzlzNWdr?=
 =?utf-8?B?R2pJQTN1ejBpV2wwVkVNNmJKVXN4RGRBOGwyblY2akxBZ3Izalp6NVRJT2Zp?=
 =?utf-8?B?TC8rU2s3SjhIZUFYVXY2ck5nNHVjWWZYVENyRU5hNDZrYzlPa3NQNEFieFZ0?=
 =?utf-8?B?VkIwVzNocTNxclpqRkVsZS91dXpQOFZmc2ZJdW1FbkhLaXVna1EyRmN1UWw1?=
 =?utf-8?B?bit5WTREa0Rnc0lkRzhhZUVJNFlQK2JnVThRelhzbmZEZ3hvam1MWWRjUmky?=
 =?utf-8?B?NE1Wd2xnWUdvVVBoZXJFNDhhUmIzRk5rL3E3d0pUcUM1bFplU0JxbXZmRnBi?=
 =?utf-8?B?Qld3TkEzallkUmZGa2s5NDFxRGgwMWozVVdMOFU5Z0x6R0U0VUpFRkNLTGJS?=
 =?utf-8?B?LzVUWjV1R2dabzZqM0JJTE5LSElJOHpTbWtiSDQ5aXBjQmU5OXlaZVc5cm9C?=
 =?utf-8?B?OFhPcGRvYU9GK0dlRjVRcmJhM0puV1YxSjRaZnJzT3hEMy81ZHo0LzlvWVJI?=
 =?utf-8?B?MTFzZ2Z4a25GNXNQUXFkcWhaNVJQU3V3Skp6Q09kMUxLRDhSdC94SU85eVlp?=
 =?utf-8?B?bndsMGpaaFI5S2pSSmhqWGVZSm9reEoyKy9pSzRsUWVLU09qUFlPYWVZS2Nx?=
 =?utf-8?B?N0ZkVDFhbGgxM3BHUEFqZTlRVTd6WnJNL2w1MWtqczlKZ0FwSEM0RCtYek1K?=
 =?utf-8?B?dElLTHdqenVMNmVGOVNjYWNTdWtVL3hvQVR2ZUJEdnRSTG92cG5YWW91NjhQ?=
 =?utf-8?B?TDJ6RmdSM21DUVpES1VUWU9Xb0JHZlpteUVBSnVlc1YrSmJ0SDlKZU1CSTdH?=
 =?utf-8?B?YVFFMWRlWFpIbmQ0aVFBRlF5NHF5djdDMHQzM0t2U0J3eWNHSGFtbVZHVzkw?=
 =?utf-8?B?TlkrdHhHWTFrZnlTY2V0QzArWWgwTkJ2dENWRGNUK1crVVA1TGNYV29NQTBI?=
 =?utf-8?B?U1JJamxYU3RraWNpZ25TWUFBTzFEQ0V2cnJyZ0E0RWszNlg3UVNJbWlNSXRo?=
 =?utf-8?B?ZlpNQUJndVNlYUt1TFZkbzZXUDBud1V3Tno4b0IyQ0hUanZYVnNoanpib2Iz?=
 =?utf-8?B?aFZNRjZERmd4Qy9YbmZ5THRyV1I5ZUpsM0pic1k2WjFhY2U5VVB5R3UyY1l3?=
 =?utf-8?B?RWk4VzBBV2Vsa0prbUZtUkRac1hsNGRwc3Z2RWlCYXdBOXVYWEJ1V3M5cXlB?=
 =?utf-8?B?QWFTUUh1cDJNUndhZjFwUGt4U0t6dUdkSW1qTUF2bTZoQmtkdTREQzFlQ0cr?=
 =?utf-8?B?NER6cVc0K2dhNUxtL1cxRDRKWnFla0EzajNrMDRPajlDeVVTQ1QyQXVtUkM4?=
 =?utf-8?B?WmM4b2ZDSVlBTzRveW5VYzMvK08zRS9FVUFtNVN4NCtTTkVnSlg1RU5RbXYx?=
 =?utf-8?B?dTUxVi85ZVlLN1QzNU9xRzZpOENJVk5WSzhQWkM2d1JyaTBKNUJIM1prOUZQ?=
 =?utf-8?B?RW5CK21BczZHTi83VDc0cGZNdjQ3T0FKeWRRT2N1c0I2bWtmdDZIaTBFUmFL?=
 =?utf-8?B?NTFDZnI1akVIWlRha295OWM0YVNWY1RtSnBPRUF6VEh4ZkRaWEtrc3BzSGR5?=
 =?utf-8?B?anBmVWFCeHBmSndtVnd5SlQyT2ZLNnFGaEF3YktFTmVXS01SQStWVmY2N3dm?=
 =?utf-8?B?ejVra2J4MU4xUDl1dnFUVU5rM203V0k4eWRpQ3gvVTQ5VEtEZEFYQzZvOFRD?=
 =?utf-8?B?WVEraVVDVTliZXhHclN3MmdiU2paZWVueFRyVTVVaWF0Q0hCd3d4R3NlMzlN?=
 =?utf-8?B?bjFEeERHbnd5cllmMG1NSGp3Um1yMjN3Y20zUDhTcVVmT1pydlNHMFpqZjRB?=
 =?utf-8?Q?66L5DTPAuIOQd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBOSnJmQ24wSndPbXEzVnVVUktiUk1wTVRPYjg0VlVsenRFeHVzMHN3MnVk?=
 =?utf-8?B?eFJzem1SMjZrSnhwSTc2RWhTQ01mN1FlRjVSb2szM0Q3bVpyUS91bGx0bWpu?=
 =?utf-8?B?VU9uOHR5eDdDMmFqaThMMG1vS25ZM0l2b1IxcWdReDBYZ2ZRbEp5aTRQSkVT?=
 =?utf-8?B?ZEs0cjNWdFZTbU5hdU1Kb0t6L2cvbEhtWDBGQnUrUmdURXd4MG4vYVJDYTBh?=
 =?utf-8?B?VFRHWmppWE9qamtIKzltMnNDTmxtZjlhdE9NU2Zucm5vcHZrQjdFeTBTL3ZM?=
 =?utf-8?B?V2JZQ2c1dkZLb24wOEdtWmJQVHhsKzRtSnpiRXdEZ2tHRHM5Uk9pbzZWeFFV?=
 =?utf-8?B?ZjdKSHJiZTliVDdDNXNIUE1NemlnOUVHdHUwSmNyMmVVbEQ3TjNsZUJxT0VX?=
 =?utf-8?B?Y1FvNmIxMTBPSkdHS3JiL2c3UitGS2NjaFJybFZoVWtpSkRoM3VKWUsrMXVG?=
 =?utf-8?B?c0IxSGNIZWZnS1hZcXduREsvNSs4WHhuOWZZWXo2M2xnejlBNjgxWS9vay9C?=
 =?utf-8?B?dkFZYWtmVlNvUGtrbHFEMk1leHNLWU13ZktTK1I0VC9lbnhPZEF4UlR5YWZO?=
 =?utf-8?B?akNsV2s0QzVsU0FaN1FnSnA2bUlZNmY0czJCbzEvaDlxWHVIUmhFUEpXaHRG?=
 =?utf-8?B?cmVTL1FJMFQ5MVVjSnZDM0pFUDUxWGYrS0dNNi9iTE1SVENPQ0hlbHlncktl?=
 =?utf-8?B?cUVuTS84Q0dFaUM5aFd2bWxlRFhhdWxUakNWWkxNemcyTTh6N21QT1RyWGRn?=
 =?utf-8?B?TVpzMVhEbFlrdFljdENkR1BwbGRpTHQ2VSs2dkdZQ001Sy90MklTMDJTRmMz?=
 =?utf-8?B?TmRyTXBMYWhGcVFROGVQRWExRmlJaGZnOTVHanpidnFJZFNpV1psU1RyQnRT?=
 =?utf-8?B?OWJjVW5ldGxmbXo0QmhURHZ4SHJjUXUrbWFhS0hlM0Y5Q1d3TmpHenN1K0hv?=
 =?utf-8?B?dkVLV1U3S3Y1TTNOY3RUYTBocEhmOGZOT3JQUkpNQXNqNWp2YTl6dDVuYXlh?=
 =?utf-8?B?cjB4NzJXT1pPUlNYOWJFL0h1NFBQNDZ2VXk2R2pzN3VnZ0FGc2kySG5ETU5F?=
 =?utf-8?B?Z2tTby9Lb1N6ZFJwejVOR0lhUTVsUk9oaEdoelZYRVY1OUdSZ2k5UTJDU0N6?=
 =?utf-8?B?K0p1TzFVTTJkQ1FLaTJ0SmRiRW5WNUNLM2o3VUhVMml1QjN3SkhJQjNWaXVE?=
 =?utf-8?B?NmtmTS8vZ2ZTZ285TDJWdTRHaGU3T3FXWmc3enBHaVVWSjF4cXpJQ1ZhNytl?=
 =?utf-8?B?cVhUYmtuZzhJSmhBUDlYdWFnWWpJcjUxZXdYdHBYV21oQ3o0Mk90TWtoZ2s4?=
 =?utf-8?B?OS95cUlWVlZ1RnZuejQxR2NjbzhkaW9VOEpMT0owYmgvUmZ2MFpMZWc1bGVJ?=
 =?utf-8?B?a2lJSzgvSnNjUkxYbm14RnJxajNacG92aWdMTkJqeExMY1p1NlkwMjFwQ1kw?=
 =?utf-8?B?SytETitEVWUxNVlXclYwczdmWUdnYlBvYkdJUm4zVEJ3WHNZeEdHU1pZOU9x?=
 =?utf-8?B?cUUxWm9OUEtlc0tWRVhsMkswM2VPcEQ1MTNFOHlPSml0Z2NnU2gza1czY0FZ?=
 =?utf-8?B?SlNFNkNnUURVY1BaUVVRWXFKQWdCb3Npb09pVHUvVWphSnB1TWhQV2phSXcr?=
 =?utf-8?B?bytQYVRzUldSdWliaDVxRVVYQzRESEpOeHl4d0g4UHJ0QnVZYWZNcVE3SmNr?=
 =?utf-8?B?ZlY0Nk1xblJvRk1EWWxLT3Y1U3gxRFNtdTF3SFVlbHVtQUpkcm1zU0JnbE5t?=
 =?utf-8?B?dTYyU2VOQ0RsamFYTHJ3cmlBODZqcDFIR01KRTRpQW5lakpUeDV6Ykt4RVE5?=
 =?utf-8?B?N21IOUh5TTVtVWtUVzlSY3p3OFcwcWkrbVg0MHM2ajk5Q2Y3b0c1SG1sTUcr?=
 =?utf-8?B?YW9qVEJWRFNlc2JIaVM4QkJJYm4rVHh4Vm9LWEZ6QnVWNitza3ZpWUtLbTZS?=
 =?utf-8?B?VjczeGJVMVk0RkJNTWU0cDN1bUlWRlJNN3VpUCtaYzF3TUswTFhyTnlQeS9P?=
 =?utf-8?B?cklpSStlczQyQktYSElaaStScGdoNUVhT3padTlETWd0anVSazlTRVdvYTIx?=
 =?utf-8?B?R3BrenNKQ0hJOUF2MzIxVGpOUWxuYVE3d0owcVI3QVI2VFRwY1pNVXRQUiti?=
 =?utf-8?B?aFlJVDdJakg0a2dkR1YzK2xaTzdDWmxFWXhZVjdNcDNQUFlTUlpDZjlkV0E1?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7f414d-ebe1-40c2-3ca4-08dd4509e7e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:51:40.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm64hV00HaRcPgCRNZvi5e64GID058xqgsCVSmsl1So1BDiju4l36H8EMb6onXlhZLsgF5nk5+8WyuX687ZtCJj7wMbMeqFWxwApLDeU0y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning

Piotr Piórkowski (1):
  drm/xe/pf: Use an explicit check to see if the device has LMTT

 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++----------
 drivers/gpu/drm/xe/xe_lmtt.c               |  6 ++----
 3 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.34.1

