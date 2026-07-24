Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CA9C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44EA10E0E5;
	Fri, 24 Jul 2026 21:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoOnrl33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1510E0E5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784927382; x=1816463382;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nWF81FbBJJDCba3sj/X+vH76+HNlMCN2wegqQB6rny0=;
 b=VoOnrl333lK/an03rXZhlVz2aLRGajM0XiNayArVNdJfsbG36AwEyP0L
 M8tSspdWghngkv7GJDicmExYQ/d8hCRrZjL1xoyhJBIdkNITrUEct7PD1
 kHjxTF3TiNiB+Wm5mSq8w0/YUk7P+Xx3Mf/7fOIFymckWPDo0Q3DqG8km
 9jOLQ/EbR+s296RUizKj1J+LaOAmj6FhnmaMrWjAvFL9fKQQpvRBv5D3S
 YOR12R1pJyVOf6eKA8i/OKUbmbRsO06ZO2J3SMWcpFP3iFFGZQbIcs9hi
 ILfEuim7MeZ9AyQILCd0wCzSdDbLu8gr59Vf2e7BeZQwnZYZ1B2g3kEIq A==;
X-CSE-ConnectionGUID: oU2Q0Pt9Q0OIZmskbfvHjA==
X-CSE-MsgGUID: CfkFsrL7SCm3IvlsQeegLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85611250"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="85611250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:09:41 -0700
X-CSE-ConnectionGUID: bM80e6C7QOKuoFlOsglsPQ==
X-CSE-MsgGUID: tX6vP8tmS0aGO43c0wg4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="259466644"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:09:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 14:09:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 14:09:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 14:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl3fWCSSA5zCpvbzd4zPd/BuFXy7xIDrZLWnVNXtGpwaaZheER3Ef3whz0C6/qFWBAAbt49dmC/ESDlpKXxoE70t6DkgFK6g+0VDmiB9N5AGVLc8wPTfDThQ0Geap5DFYXohnXjvXDFokn1MxYUCY732zLp9hkeSYppzgBwmNAt6eUoF0xr06YeljfNOWKIVx+NHzBCePUy9ej+o6TYHyzgGHVuuUk3iEyy7o0c6bG4oLQbbJ3mTTRnKYTwIMSFG2X5NS02wPuhi8k+g0U3HSrxlal/iisOQxk9P3hsJgxyjTx8gZP/BaqcB6YjtGQ2x4X0tr8LgX16cyNrILFY/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m/wnO2BrdQCLA+ovMuNO7mvbCI/dVDmM16igAjhfq8=;
 b=c56hxfaVj6Tn7lZnzM6x2qsprex255q6mSiGAFenR9MAsQu90SNY5ztuBJ4LCEemVTZsHhELnhnADyUHJKFN/aOjMo0NpBLkh8mVp2dq9I3t5n8Z+mwYPdrEEMsZCvyOdmzIFfhsBTmO7irbLc3zv4Ex7ZWvw5rEnQbNR/t4/LNORXmE0M5LFrZew2uIcfGBb9dIcVR33tl7J5KvHqx8ALNOgaYtPTInFyrIUBC7kTme3yYKc0ZM7Q3WyUpIQXww4SEpPI15zkB0nWZOQPoJScMebe/XqJRtSrXHRYQP/gvydmYdVp54EYMW89jTHdKjYpyqewZgbN5qQKtmEE6Wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 21:09:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 21:09:37 +0000
Date: Fri, 24 Jul 2026 14:09:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_with_=5Bv5=2C1=2F1=5D_drm=2Fxe=2Feustall?=
 =?utf-8?Q?=3A?= Add WA 14027054324 support for graphics IP 35.11
Message-ID: <20260724210935.GG2327163@mdroper-desk1.amr.corp.intel.com>
References: <16b6b972691943daddebad6e7b93b9d73add5249.1784745545.git.harish.chegondi@intel.com>
 <178483938154.222631.18342108634041208280@6beec6c84f66>
 <amOyfLom0Ce8S23q@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amOyfLom0Ce8S23q@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 839d72cb-a903-452c-c6d7-08dee9c7de1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|11063799006|56012099006|5023799004|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fMRQic2LmiqCV5bnnu16IfyEOBL9JvY1TwpwB27aOCIlRb4gOixj/n7oHrDMiLdTLRR8dRI7pTZuiJH2KFF1vHvvlTn3ftWb2j3OTq9xbPO9bLoqT2JCTAwIp7Dul7sU9zFZ2vPw7MVqp0WN0Tais/s1n0N8NUaX+27fBoBcJGq6K9pQVoEPHi38+F8kqMLWQ6oL6OD+ELht+jLLdVBoJ5R17EIb7p2lPlLudywbN+wAKtKAzb+tdXW6kjsA6PRPNqhIDMFSzGum7rT3bCyyT2EgcNUphnQfK3ce8E22GwnjTPRCzs5+T5L6uAInP3N1R05mLOavcMbw0koTmGDxZfsYjpYgk0TloqVNS3xEmb5WMxONWaPk+Djlor6n+bF6SduSx6OFhOJo4VCDjb4u9y28qioW58vff+g9Md5tyEVHbhFnSmmzpPgo9S9RsEczkuhFYqHhKGj7Kk6vS020PjEDPKGEkMryKBnh2XPLszP0RkVV4xrXJwDgIkc2S0tt2g2SzE8GM7thTzEX8fPKGcm+eqGQc68F3vINlqFm/5DGexmn2asZm8X5DSIBVkDivdH7+iuWTIjBPQstT3uH2k/7UBs0SQLkgRPdSm3+JtBtPf3EnFbWpzcdJVrxsH/4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RtU3ZveGxFczd0RloyRlZybzJHUEtjaVRjVDVtbWFHNHdHbGJZNTI2SUhr?=
 =?utf-8?B?dmF1c1JtRGtNNjk3M1J4NCtJcFZkZ3A2QVBhcVZzWCtTY3NTbzlHZzRlN2Yw?=
 =?utf-8?B?YXJNMlVVTzFJYWpEKzZKVUROcm5Sa1graWdSZ1dlNERXUzBvRjJlMzRFSGxR?=
 =?utf-8?B?T3UwOExmdGllV2dSM0RXMGZpTDNZYjdxd0Z5SWljMEg2TFcySmg0ZnhHN3Rw?=
 =?utf-8?B?WHgxL0xQYjFaNWQ3cStOeWpnY2h2UEh2UzJLQUJHb3Q2WCt3NVNZcWdaWWxs?=
 =?utf-8?B?T1pEdkZ1UVhnNHAxM2Z4UzhXaWI4MFZ3Tkd5T3pKRkNBeVhxa2gyanIvQXJW?=
 =?utf-8?B?OTNFMDJiYWMrOHFNSENYeGdCZzl0SGgwWGVrSFdaYW8zNC80NlExZUVvZTB3?=
 =?utf-8?B?eit5OTM2NWdvdnNsSjlKYjU5Z0MvWjNwdEQxY1pTZVhERzVEVVlMcWsySE10?=
 =?utf-8?B?RTdxeEt4YVRiSlpPVlh1c3pJU2xxVGc0UERsdDd3R0dkanJzclo2UCt5bEFS?=
 =?utf-8?B?ak5oNDd5T3BpTjl5VjU2RUdBbXFveTd2cVV0VDBTcW4xODJTOG91NzVWazcz?=
 =?utf-8?B?UU03a0VDM2prbUdvcjg1WUtFUHczODVReUw0aDRWZmkzaTgxWEFnemlpSjBo?=
 =?utf-8?B?RHdQS2d1Wkg4Z3VnWE02d1pHRjBReCsvSk55QXNEV3F4cEVJbktiaTA5WG40?=
 =?utf-8?B?U1NNMkgwQ0JQYjN3YkphMWZQejErb1NqTGhvSVdiZ3B1dDBTMGExTDU0TW8y?=
 =?utf-8?B?YlhZMUhQRnd1NGJsVEc0a3p2ejJoMEZwbHN6SVJKZkpNQk95cDhwaUhodEhj?=
 =?utf-8?B?TDUvK244dkJIbXlRM3dRcWhRTzNiNFkxNG8rMHc0YU9uUmV5ZVQ4T0E5NFhP?=
 =?utf-8?B?NXMybHV2VVlhVlFTQmNmdmRKYlF3QkQ1bDJCZ0pINmh5U3k1SXA4dW5WWnJz?=
 =?utf-8?B?c2J1U24vSFhnWnVBN01FbHhObHFzRHQvQ3pvN255RTdWMkFGTFNVc1g5b001?=
 =?utf-8?B?bVhxeVZMclV0NUxyenlrTjRWckRHV1dreGpWZENCU0RjSGNpZVd1bVFIZTdq?=
 =?utf-8?B?VlZLSUtwYzBlYWsyYlh6bTVwRzE5TXlVTWhDeENIQXZNdUlMVG5DQitmZjUz?=
 =?utf-8?B?MVVOZUg3WWduNElhKytxL2tjZzNadzJpYURiT1VJK3p3cHR4UGo5SXlmKzhD?=
 =?utf-8?B?Wm5mNnl6NTVQZHZneU5rUzZ3cS9WTkY0YlZYdFhhYnB3TEdkS3VaOTFKengy?=
 =?utf-8?B?UFZUWHJkSHVzamlqM0F6MlRIZUdacFdaTzFlblVWTWNtZnRvNVZsQkYyVFBO?=
 =?utf-8?B?N093MXhsYzR4WmxTOURQa0RkTURPelp1VW05SEdqc3l3VUtWZ0R0VTEwMU9V?=
 =?utf-8?B?ZW1PMVlVdFZMS1Y5cjc5bDRhYU1RVURqNk9OZ252NTFtZXpoRC9VMi9yenB5?=
 =?utf-8?B?bE9GVHF0YXdxMkhrd2wrNERiK1luUDQ1TEc5NzFYOGdNWnR5SWtVekVBemZt?=
 =?utf-8?B?Ump6UUxUamtLT0duZXp1bHBXSDZBb24yT2o4b1dwTjZNbjJFRHpaZWhxQUlO?=
 =?utf-8?B?SjQ2TlgwNndqRnNSWVYxODNUVUNKK095dGgrR1VsSnpReU1TTVhTR09QMzNh?=
 =?utf-8?B?V01zeXJBS2xCSVlCYW1OazlDbVlNVEM5RVBXVGs1YjY1bDZhZ1VHT3pDT3Zv?=
 =?utf-8?B?YmxIc3p5clhMNWRZaVBZYnEwTXRSVDRibnE2Uk5JdERUMTNWYkwzYlpxMEFB?=
 =?utf-8?B?cHRjNldqR3dKSG9zSXFRZXZDNWtyMDZyc0dCcGh1SmFoTmtXTFpYRHJLdE5B?=
 =?utf-8?B?b3VwVmdBcktUaWhlTDNYOE5zdXdWQmdFWDBFVUpjQzVNbDBWUWUwSzhKRjVR?=
 =?utf-8?B?cjMrY0dIZm5ITDRPV0JaNE1XR0YrS0VjR0VIWFBYNW5lY1dBeW9tVlAxeTBI?=
 =?utf-8?B?NXN4L01hbndubllHazdrTFZsZWZsZ0h3VTJIb2Y4UWdZdmZIcGRjeGZZUTk0?=
 =?utf-8?B?WmFSd3pRUWlCWGVzRlZlZm9ScUZ0dUJLTktWcHo1ZkVDUGJwVGVYZmF1QWFZ?=
 =?utf-8?B?NGlEK2tTMXdlUE1wbFNyaFMvaEFvK2Rwd0JhalY1Y3Qrd1FEcU9lTFJFTURt?=
 =?utf-8?B?ZFJUcDV4UWR0Mk4xbTluUVF4MncySENhb0xtMG8rM1FVdG9qa2QzT2JpZEdi?=
 =?utf-8?B?N0F2VGJYZFE5OHNIZFFES0l1aFhMVldBOUNHVzRzRFRmMDJCOTFsTmszVmRo?=
 =?utf-8?B?bkFzSFVlemlNaUJ0Q00vWE9Nb3o3cW0vckRtSlFVbldGaEh5YUl4S3dGN1BB?=
 =?utf-8?B?Rm93Q2Y4TllkODg4WURwdXB5WmY1R2JKZGhMUzZCMHhHU3VrTElaOHBmakxx?=
 =?utf-8?Q?l/pVM4wzqpNwQVn8=3D?=
X-Exchange-RoutingPolicyChecked: Lf7kPFRHY4N8ul7aduwEY34w+cmDzqIQd2qWcO9DEaK8IeMpQqht380hWUJBuGlC0HicxANVsGkkRxG4LgpPIrDLY5HM0DoKis3IOl5cVeiCdVb1McfFNVuUED2nzrbAsRgxyFGWpkVelrCRH4VC/UsIMocQ8j76mDB45Vb3Yj4ULMa0qImlO0D/qb+0ZXYRCUEHT2LIfX1TM/s8M4ufz1DaxfYQGbKc0plvy3P0pcdgepAySNMueK7w0FgrCcDgM9sUqmdlTFcAocJ1ut/1NYjRu4oZO6pYc1l6npp521Wl7Zic2ju+5PwYpOT2/HzZesFm9a+c1AZrigJJDp2Mcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 839d72cb-a903-452c-c6d7-08dee9c7de1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 21:09:36.9814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcWppKvGkVTsqTetVfxCQtmicZtD4CFKioQrP8KaqQorZ6rWW4/BQlAjHEfCzWHNrYCHeIojJZ8S/uxXzvTnT40Lq4gftKz7Rc4+YMZ9Sxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Fri, Jul 24, 2026 at 11:44:12AM -0700, Harish Chegondi wrote:
> On Thu, Jul 23, 2026 at 08:43:01PM +0000, Patchwork wrote:
> > Patch Details
> > 
> > Series:  series starting with [v5,1/1] drm/xe/eustall: Add WA 14027054324
> >          support for graphics IP 35.11
> > URL:     https://patchwork.freedesktop.org/series/170932/
> > State:   failure
> > Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170932v1/index.html
> > 
> > CI Bug Log - changes from xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004_FULL
> > -> xe-pw-170932v1_FULL
> > 
> > Summary
> > 
> > FAILURE
> > 
> > Serious unknown changes coming with xe-pw-170932v1_FULL absolutely need to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-170932v1_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > Participating hosts (2 -> 2)
> > 
> > No changes in participating hosts
> > 
> > Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-170932v1_FULL:
> > 
> > IGT changes
> > 
> > Possible regressions
> > 
> >   • igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
> > 
> >       □ shard-lnl: PASS -> INCOMPLETE
> >   • igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
> > 
> >       □ shard-bmg: PASS -> ABORT
> >   • igt@xe_pm_residency@cpg-basic:
> > 
> >       □ shard-bmg: PASS -> INCOMPLETE
> 
> I have verified the above failures and they are not related to this
> patch.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> Harish.
> 
> > 
> > Known issues
> > 
> > Here are the changes found in xe-pw-170932v1_FULL that come from known issues:
> > 
> > IGT changes
> > 
> > Issues hit
> > 
> >   • igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
> >   • igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
> >   • igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7059 / Intel XE#7085)
> >   • igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
> >   • igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
> >   • igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1124)
> >   • igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#367)
> >   • igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#367)
> >   • igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
> >   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
> >   • igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
> >   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2652) +8 other tests skip
> >   • igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7358)
> >   • igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#373)
> >   • igt@kms_chamelium_frames@dp-frame-dump:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +1 other test skip
> >   • igt@kms_color_pipeline@plane-lut3d-green-only:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006) +1 other test
> >         skip
> >   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-1:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6969) +7 other tests skip
> >   • igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
> > 
> >       □ shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304 / Intel XE#
> >         7374) +1 other test fail
> >   • igt@kms_content_protection@type1:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7642)
> >   • igt@kms_cursor_crc@cursor-onscreen-32x32:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
> >   • igt@kms_cursor_crc@cursor-sliding-max-size:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
> >   • igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343)
> >   • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343 / Intel XE#7935
> >         )
> >   • igt@kms_dp_link_training@uhbr-sst:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4354 / Intel XE#5870)
> >   • igt@kms_dsc@dsc-with-bpc-bigjoiner:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8265)
> >   • igt@kms_feature_discovery@display-4x:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1138 / Intel XE#7344)
> >   • igt@kms_flip@2x-nonexisting-fb-interruptible:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
> >   • igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> > 
> >       □ shard-lnl: PASS -> FAIL (Intel XE#301) +2 other tests fail
> >   • igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> > 
> >       □ shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149)
> >   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351)
> >   • igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#7385) +1 other test
> >         skip
> >   • igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745 / Intel XE#
> >         7385) +1 other test skip
> >   • igt@kms_force_connector_basic@force-edid:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#352)
> >   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +15 other tests skip
> >   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#656 / Intel XE#7905) +7 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6312) +1 other test skip
> >   • igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7905) +8 other tests skip
> >   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +3 other tests skip
> >   • igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6312 / Intel XE#651) +3 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7399)
> >   • igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7061)
> >   • igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7061)
> >   • igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +12 other tests skip
> >   • igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7865) +4 other tests skip
> >   • igt@kms_hdr@invalid-hdr:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#1503)
> >   • igt@kms_joiner@invalid-modeset-big-joiner:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6901)
> >   • igt@kms_joiner@invalid-modeset-ultra-joiner:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6900 / Intel XE#7362)
> >   • igt@kms_pm_backlight@brightness-with-dpms:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2938 / Intel XE#7376 / Intel XE#
> >         7760)
> >   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608 / Intel XE#
> >         7304)
> >   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#4608)
> >   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#4608 / Intel XE#7304)
> >   • igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
> >   • igt@kms_psr@fbc-psr2-suspend:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#7345)
> >   • igt@kms_psr@fbc-psr2-suspend@edp-1:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609)
> >   • igt@kms_psr@pr-sprite-plane-move:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
> >   • igt@kms_psr@psr-dpms:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +1 other test
> >         skip
> >   • igt@kms_psr@psr2-primary-render:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2234)
> >   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#3904 / Intel XE#7342)
> >   • igt@kms_sharpness_filter@invalid-filter-with-plane:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
> >   • igt@kms_vrr@seamless-rr-switch-virtual:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
> >   • igt@xe_compute_preempt@compute-preempt-many-vram:
> > 
> >       □ shard-bmg: PASS -> ABORT (Intel XE#7893 / Intel XE#8300) +1 other test
> >         abort
> >   • igt@xe_evict@evict-cm-threads-small-multi-vm:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6540 / Intel XE#688) +1 other test
> >         skip
> >   • igt@xe_evict@evict-mixed-many-threads-small:
> > 
> >       □ shard-bmg: PASS -> INCOMPLETE (Intel XE#6321 / Intel XE#8355)
> >   • igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7482) +1 other test skip
> >   • igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2322 / Intel XE#7372) +1 other test
> >         skip
> >   • igt@xe_exec_fault_mode@twice-multi-queue-userptr:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8374) +1 other test skip
> >   • igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8374) +1 other test skip
> >   • igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8364) +4 other tests skip
> >   • igt@xe_exec_multi_queue@one-queue-priority-smem:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8364) +7 other tests skip
> >   • igt@xe_exec_reset@cm-multi-queue-cat-error:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8369) +1 other test skip
> >   • igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8369)
> >   • igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
> >   • igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8378)
> >   • igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8378) +1 other test skip
> >   • igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
> > 
> >       □ shard-bmg: PASS -> ABORT (Intel XE#8007)
> >   • igt@xe_mmap@small-bar:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#586 / Intel XE#7323 / Intel XE#7384
> >         )
> >   • igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
> >   • igt@xe_page_reclaim@basic-mixed:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7793)
> >   • igt@xe_page_reclaim@binds-full-pd:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7793)
> >   • igt@xe_pat@pat-index-xehpc:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#7590)
> >   • igt@xe_pm@s2idle-d3cold-basic-exec:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#7370)
> >   • igt@xe_pxp@pxp-termination-key-update-post-suspend:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4733 / Intel XE#7417) +1 other test
> >         skip
> >   • igt@xe_survivability@runtime-survivability:
> > 
> >       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8415)
> > 
> > Possible fixes
> > 
> >   • igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
> >       □ shard-bmg: ABORT (Intel XE#8007) -> PASS
> > 
> > Warnings
> > 
> >   • igt@kms_flip@flip-vs-expired-vblank-interruptible:
> > 
> >       □ shard-lnl: FAIL (Intel XE#301) -> FAIL (Intel XE#301 / Intel XE#3149)
> >   • igt@xe_wedged@wedged-at-any-timeout:
> > 
> >       □ shard-bmg: DMESG-WARN (Intel XE#5545) -> ABORT (Intel XE#8007)
> > 
> > Build changes
> > 
> >   • Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -> xe-pw-170932v1
> > 
> > IGT_9020: 9020
> > xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004:
> > 447a47cf86f97a1f5362d0675d65d129be27b004
> > xe-pw-170932v1: 170932v1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
