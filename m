Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F156C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 20:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A86110E07E;
	Wed, 15 May 2024 20:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlHIEha9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988E310E07E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715806760; x=1747342760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dDifrVCkYayGrKvED6MSGf4qu1p3hHH5CxEJ5OmlSWE=;
 b=ZlHIEha9lSER4Bl1VCP03KTGV6301hfNO4WVa+6dj/kySDJf2Ei7fNsx
 ruxEeTxPo05ufjVtfvpiFXZ6Rv2futDs+JgqDD753T75PyRqpt8hFmoHf
 1VlXtdv3xUZeFS5Txwz0BpaAlebgUw636DYRXg+gb5KBfinVQWvbim8BM
 0wtK/O8Rizj0FcIkul6Rk4roxG0SDjROQIWTT4M5wAEHt4AR0/ZoPbRye
 YI9X155bjkHZJWuQEbQxoEHEaqfwijfRJU5znFizfKzwMfS2keGQrl/L0
 tpHV+qxs5ASmNsOzqGz2+A02P8iRAZq8FafvGCgtbxZOfTpWBiU4qKONT A==;
X-CSE-ConnectionGUID: BTxnlFIGRBqO4PMgF+r24Q==
X-CSE-MsgGUID: YO5x334iT0CJCnjR45wT/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15709227"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="15709227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 13:59:20 -0700
X-CSE-ConnectionGUID: daLzCHTASn+/ctOsyDasoA==
X-CSE-MsgGUID: LM9Km0T3Rv+puHTPPyrR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31310775"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 13:59:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 13:59:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 13:59:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 13:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FihevN84FVh3vKiMczgJL79/MYa4LSte+qT6ymRCw/FXfZMaR2HgFvC2Ov6zkDULAuz3+YK8xHafzdvds5V+m1GkjljWB8cXoEjA7LIJh30kBHu0JNAtzoyc9ydCczScaJ5NgjLW+bLqD0sSXl8RjzRXBkpFLG+BI6wp+KarmqI20JlY5VaxS6ip1kmxRtpKwnvXV38izS2fe+BflLBzUj7ryfR2vvsFkdhTxlyzjc2VpJddpzVkXW3SIPemVRN8Una3Da+hcsUufkfoBBAng+3pMeRTOyBQNEPsLiA3JvqY0vjunnqpzHVgRQqm9cAsNObxueEi2xPgjH8+5mF6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDifrVCkYayGrKvED6MSGf4qu1p3hHH5CxEJ5OmlSWE=;
 b=RsflGmpQHQqCmAF4rCx/1LSnvQy7ph+ssgPnheckw12HnYr9fkgTQ0SEmYZoREnoadY15UoSaEHqFiOIs4U9e6RfQhLvMhlII3BpxZ/A/7TI1KTa50yYMD/FuVCh0kTY4tAglrD/8Ov7L+Bn0pff1dnO80hMcE014hcIxZEKM5dzpFCPzJ5xwN7q1GE3dg5HzQj84nYnY+dg67Ru+S2cagTv4vP+rOm2nlNMAQm+nmCrHaxHGIWNPT1zEhIWHb0Y3LskfGDv2iCKweJYKZoUIhGJP+QWR3ItHvbKZnrtzHKQiV98h0+6GibODqRpKHL0oZKecmDOlSdbGLtDevIKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 20:59:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 20:59:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Zeng, Oak"
 <oak.zeng@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v2 4/6] drm/xe: Update VM trace events
Thread-Topic: [PATCH v2 4/6] drm/xe: Update VM trace events
Thread-Index: AQHapmBvN+7vf36rBEKiK9cob5OdIrGYyKgw
Date: Wed, 15 May 2024 20:59:13 +0000
Message-ID: <CH0PR11MB5444FA3CE4E73DAE84C5A17EE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-5-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7760:EE_
x-ms-office365-filtering-correlation-id: 6b18d372-2654-42a1-6b17-08dc7521e00c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dTlvbVB6R0FxbnZ0NGw2NnREdWpENGY5SkdtWmZ2T3dXSkxPWFczRjRnWEVF?=
 =?utf-8?B?d1UzUlVFbDFlb2R1S1FhWHVhWXFadGlpSzdvWXlpVTZKTk5PK1BxQWhMd1gz?=
 =?utf-8?B?NThYSDYyOHZ2ZWI1WFJBd0d6VEM3V0xqdmw1NFowOVJoc1M5WkIvWFZqVy9i?=
 =?utf-8?B?U01wZjhHdGdyOVZuaUtYd0wxV0ZOMFZkR0x2emRscFR0RVpoUEdpcUNSaVlZ?=
 =?utf-8?B?VzExTlN2UW5zR0pxSjVzR0NwWUo5eFlxeGR5Nld0b1BRRCtZUndZUTJ2eUhu?=
 =?utf-8?B?Y0JLU1k1YjlRUC9lOWhGUVhISDl2b2VEeGR6bFNrYnpybSt4cHdwWTJqYWhp?=
 =?utf-8?B?MmIydGxnMEtGRVl2T090bWJLUGxkdXd3bzJiK21DV1k2QzhWTnpSZHBRMTFD?=
 =?utf-8?B?dGY0VkVZMlpmNjJHSytPdGxVYmswUFBIR3ExZFR4cUMrN3ZhS2ViQTJIU1lL?=
 =?utf-8?B?VTRyUTR3ZlVSL3d3Rm1mMlJhZXluSFd6cWF2RWZuRnh5Rm43ejVKVXBVZS9n?=
 =?utf-8?B?bzB0ek0rRHZWNkV6VmRMSEhZdUpScmZQa1doREZVdnJjd2RHRCtkejhSOVZZ?=
 =?utf-8?B?dVJreVVoSjR5cXY1L1hrdFJnT25tclZ2dFQ0dmk1MVRtNHN5TVNtbW12eGdo?=
 =?utf-8?B?N2FjYUpaTEN2ODI2ZGw1K2ZOVk1wMitPemJ1R3UzWWlRamFHTHdFc2ZWRUxI?=
 =?utf-8?B?a1F4VlRvR3JmaTRncWthczBGbHVDRzVkczluM1hvM1l4emdWSjg3K0QzcmYr?=
 =?utf-8?B?bTFucUkwNmhpa1oxQU1ScHB6OUdUZXk2VGhRSGI3R0xYamo0YXMwQVF1OWk4?=
 =?utf-8?B?Mm1HZFF5MlRzTWd0Njg2SjM2TDBnMysyYjhpb01tMStiL0dZcklMc29XVWFE?=
 =?utf-8?B?bjdXYjVTRjBWdlQ1RDlFdjRsbTU0YzMraytMVU82cDRHS3VIeVNEaU96QzJT?=
 =?utf-8?B?WlQzaFNSdCtOUjJnREVYRmJ1ZFdpaVcraUxkR3VBK0pQb3VSdjBMaUZBNTMr?=
 =?utf-8?B?NkZMSGpiUlJpeFhOMll1bVRrWUpTMURKRGVrSzE0QkRHYlJxMWs4Sk9XNVBI?=
 =?utf-8?B?MERxOFN1d0RvdnJMY2JnMTRCbEJ2NmZVVE12VkZUVERNUXYxQ2s0ejFIS2xF?=
 =?utf-8?B?dTdabnE3ZFpVOGMyTE5GRGZHcndsNDYyUFpDdndEYUZpQjFhZCs1OTNNL0la?=
 =?utf-8?B?Ni9DTzlWTUtsUGdsWmhZUEg1enU0RUdyVXBwM3ZVWUJoTzZZdDBXaDZtWk9X?=
 =?utf-8?B?QTdtN0ZHZkxLVTVKYVJXd2FTdVQrb01QblFCSDFFNUpScVg1UkMzbk5hbzFw?=
 =?utf-8?B?SXFJbjZTMlo2ZkN6bDdVWmV6dlRnd095UDFOdy9wRVd5UzJrdEpxVTM4VG1F?=
 =?utf-8?B?UVAyelpDOUFiUHZwQm1FVGc1UE9LWGs1azQzM2pOV1RuSjJibHB1bUwyQnkx?=
 =?utf-8?B?T3dtdFkwOG12Y0p0amp6TzdUSGNWYUxKTGxmOUpjUjNPUktPU3phQnRra3lM?=
 =?utf-8?B?dkxNTllhOWFKSkdpZHA5dXY3K3FJVXp5Lys3RkdHU3dUK3JWd1Y1QzNpSkEx?=
 =?utf-8?B?aUpkam4zSjVLRk81eXFKOUxZNEw1b2lGQitWb1ZhZGNPRkdXMkRmKzQ0MDh0?=
 =?utf-8?B?YUlmaWcrUnNEQXp4ODFzUmJyanpKc3JnblRPTUI4aHdGUTREcHJuVnVOZnJq?=
 =?utf-8?B?YjE1MnExL1lWZ3Awbmt6c0Q2YzJuQzdmeFRKcUczOGxNUjRsR01TUXZzaDRC?=
 =?utf-8?Q?Di5AAQUiOXUyRkICIXHi1UaoTFuewb47N9gDwVr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1VKblEyWkkyWXorRVdlTFZPVGdQOWl0cGwzVHFqSy9IQVk3bXZNV3pXOFhT?=
 =?utf-8?B?Qk55TTJPWGVxMVROcnQ1bE8xS1U3ZGE4VHNnanJFeVM4SnZ6VUxiZzNJUzlZ?=
 =?utf-8?B?U3pGYWQvRkovL3BuOVh4NVptTy8zVVZidWZhRlowUzJUTkNoNzMvZkZldFRW?=
 =?utf-8?B?ODROU1QzZTV5MHo3Y3pXYXVWOGd6MmRwMTQzMjJ5YThpL09iVUpJM29NWWhS?=
 =?utf-8?B?cEpMcGRRSFV1R253VE1tV1hQV3FORHVuQjd3VUNGV3M2V0M1S2NJeWR4dlo5?=
 =?utf-8?B?TW5BR0ZqdFdtVTAvT3d0Nm5wVnBabjNDRHcrVGNPUkVKSWJNYS94azEvUldH?=
 =?utf-8?B?VXNGd2tjaEYwV1RVR09SOE1SRUVXaG0wa3dpUjg4TjUvWWtkKyswNUVoMUpv?=
 =?utf-8?B?SjdaK2hxVThkL3Z1RW0vTFVJbEpIaE1SNE1JdUZRVTRMamFoZ2p0dmZ0eU1t?=
 =?utf-8?B?RUFxdm13WG5Qb0M1KzZqc2FiNHFuSlQvMzNRK1JKc2h6QUg5VWt5a0loZ0ha?=
 =?utf-8?B?S2VFbjdjQ3lwb2crb3ArejFZc0tQQ3N4dUphMWo3MFUrOE13UWdja1YrOCt2?=
 =?utf-8?B?dWNRQlBFMEFqd0Z5SUFhUWFpZitEcWRaQ2V2ZU9oU0ZGcE03UE1MaVh6NUFa?=
 =?utf-8?B?V1h2K2tRL0wzOGE3bWtyZ2YrckV1TkIyU2NGTXF2RkpEZ2RFR3RuYnNVelA3?=
 =?utf-8?B?YVc4THBZK051ZGdZMVM2cDhkc1lkMmsycUwzUlpEVUJ6dCtSSjVldEVMQ1RR?=
 =?utf-8?B?LzNJUlRwNTI2aTZ5d0o5ZjA3STBhMG9TNzh5R29VNHQwZFdhQ1VKSmcrYm54?=
 =?utf-8?B?WE1Fa3pVdEZON0Z1aGFjaDRvWUJRckNTMmNNZzVTSHJuREhjWDZ5cndHdHEz?=
 =?utf-8?B?eFNzSnlSbVF6TTRwSDlzdzVETVFQTzBUdHBsZGpxS254VzREb3lTaENIYWVG?=
 =?utf-8?B?V213aDlEaDMxTUVRdTdzMHg0bUZLVUFnb1hZNVlRNDd3eEF3enRnRDNuZ0d6?=
 =?utf-8?B?bW40TFdCTFlXLzhIOUZoclNOVzdkR0dpRk1tV3M5U0RYclhLSVVxOVRNUndP?=
 =?utf-8?B?K1JsMGY4SStNL1pCU091T1B0QzYrZ0VsYWpMZENvUDlHancyR2Rudkh3dGwy?=
 =?utf-8?B?QXpod0ZJa1ErQUdnQVRhVFdCVTNYUlp4bUdGVmtMMXdtK2xCeUpCbzBjcVBP?=
 =?utf-8?B?YlJHMmM2UEU0ZmFrQTBaVmpoMCtTMGw3VVBTZHdSb0o5MU9pLzAwZVdjVGRC?=
 =?utf-8?B?OTBablhQZTJRVHJVaTZBdit1Z1psM3djbU0wVG53U243WHRRY3BpN1hJa2cy?=
 =?utf-8?B?WUo0cm5EcFgzdnlHbG9nYWs0RXBZeDZEREF1YTlsaHJkSU5Ld2VIcldnTjZq?=
 =?utf-8?B?NVBGeGdHUVhzOEtnQTVpVW8wOG5la2ZiQVZOOGNibHNMeGMzTmRwR3ZWMjFy?=
 =?utf-8?B?Q09qZTMwRXFzNHpuYWpWQkdrVHN6Y1NiSVJMaVQyV3E5bWhna2w2SkFNREJq?=
 =?utf-8?B?TjdmNHFtcWVmdlcxMk1IWVZhbUNaNUhaeXZScnNyS3g5cnc0ejRzejFuem5p?=
 =?utf-8?B?Y2ErbDFucElEYmVZZFZZNlFmZFhmRGpFR3NTWVhGSERMajBIbnpaeVE3djNj?=
 =?utf-8?B?QVRuSzB1WlNFdlZIVkJYTW44b0NaL3RYcGFra3ZyeVVwdWU0UzVuMXZlak5O?=
 =?utf-8?B?Y3diZFhvcEcva3J1YWZWR201WFBsWVg0bTIzWXdaR3RTRW00VUNnWWdMd3Fm?=
 =?utf-8?B?cDRRc2ZlMDEwRzF6dzVsNCtMSHluMkpSWHRueEJBQUl5Nm1jaDVrblZyckdV?=
 =?utf-8?B?KzR2UGJSMVlLeUUvdlRxV2pDSUpmY2ZKYzRnTC82czUxU1cxMytsWW8xNk9s?=
 =?utf-8?B?V0tSSjFWZXdHUXpjeUxxL0NnVTBnb2xCM0IzeGhrNUY2WHlYSjhwYytXVkN4?=
 =?utf-8?B?MkEvci91NnpPWGkvUUJ4anRZdWV2NEpORzF6RTJUTGxYMjU2czIreTlKbk9k?=
 =?utf-8?B?SDRoUjJxSXRLVUpDeGJIRnRWUTV4eXBkMUcxeEh4ZFVGMjZmQUVNVDVPUWpP?=
 =?utf-8?B?RllNdzRiVFIzbjIwc3piNlJPazArNVE3U0kzQ2ZFWmg0cnUvRzR6QkZNMW1K?=
 =?utf-8?Q?tHChBJNUJiMzfZ+EMw2hwLazr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b18d372-2654-42a1-6b17-08dc7521e00c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 20:59:13.2825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joDf6TnxKaKFKmI+jpysSyVzEXcP5gWDHl32A6w39pLZT4cRNPpZ3oIKNq02J+fBapKdjynj+p2rMZGY0zoSwkrPA3d3ZM5TyQdsRIWTcRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hdHRoZXcgQnJvc3QNClNl
bnQ6IFR1ZXNkYXksIE1heSAxNCwgMjAyNCA1OjQwIFBNDQpUbzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQpDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
PjsgWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjIgNC82XSBk
cm0veGU6IFVwZGF0ZSBWTSB0cmFjZSBldmVudHMNCj4gDQo+IFRoZSB0cmFjZSBldmVudHMgaGF2
ZSBjaGFuZ2VkIG1vdmluZyB0byBhIHNpbmdsZSBqb2IgcGVyIFZNIGJpbmQgSU9DVEwsDQo+IHVw
ZGF0ZSB0aGUgdHJhY2UgZXZlbnRzIGFsaWduIHdpdGggb2xkIGJlaGF2aW9yIGFzIG11Y2ggYXMg
cG9zc2libGUuDQo+IA0KPiBDYzogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gQ2M6
IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQoN
CkxHVE0uDQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RyYWNlLmggfCAxMCArKysrLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5j
ICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV90cmFjZS5oDQo+IGluZGV4IDJkNTZjZmMwOWU0Mi4uZjE4YWUxYzYzMDMxIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHJhY2UuaA0KPiBAQCAtNDIzLDExICs0MjMsNiBAQCBERUZJTkVfRVZFTlQoeGVf
dm1hLCB4ZV92bWFfYWNjLA0KPiAgCSAgICAgVFBfQVJHUyh2bWEpDQo+ICApOw0KPiAgDQo+IC1E
RUZJTkVfRVZFTlQoeGVfdm1hLCB4ZV92bWFfZmFpbCwNCj4gLQkgICAgIFRQX1BST1RPKHN0cnVj
dCB4ZV92bWEgKnZtYSksDQo+IC0JICAgICBUUF9BUkdTKHZtYSkNCj4gLSk7DQo+IC0NCj4gIERF
RklORV9FVkVOVCh4ZV92bWEsIHhlX3ZtYV9iaW5kLA0KPiAgCSAgICAgVFBfUFJPVE8oc3RydWN0
IHhlX3ZtYSAqdm1hKSwNCj4gIAkgICAgIFRQX0FSR1Modm1hKQ0KPiBAQCAtNTQxLDYgKzUzNiwx
MSBAQCBERUZJTkVfRVZFTlQoeGVfdm0sIHhlX3ZtX3JlYmluZF93b3JrZXJfZXhpdCwNCj4gIAkg
ICAgIFRQX0FSR1Modm0pDQo+ICApOw0KPiAgDQo+ICtERUZJTkVfRVZFTlQoeGVfdm0sIHhlX3Zt
X29wc19mYWlsLA0KPiArCSAgICAgVFBfUFJPVE8oc3RydWN0IHhlX3ZtICp2bSksDQo+ICsJICAg
ICBUUF9BUkdTKHZtKQ0KPiArKTsNCj4gKw0KPiAgLyogR3VDICovDQo+ICBERUNMQVJFX0VWRU5U
X0NMQVNTKHhlX2d1Y19jdF9mbG93X2NvbnRyb2wsDQo+ICAJCSAgICBUUF9QUk9UTyh1MzIgX2hl
YWQsIHUzMiBfdGFpbCwgdTMyIHNpemUsIHUzMiBzcGFjZSwgdTMyIGxlbiksDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5jDQo+IGluZGV4IDM5ZTIzMTQwOTZiOS4uN2ZhNTMzOTAyYmRhIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYw0KPiBAQCAtMjQ3MCw2ICsyNDcwLDM4IEBAIHN0YXRpYyBpbnQgdm1fYmluZF9pb2N0bF9v
cHNfbG9ja19hbmRfcHJlcChzdHJ1Y3QgZHJtX2V4ZWMgKmV4ZWMsDQo+ICAJcmV0dXJuIDA7DQo+
ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkIG9wX3RyYWNlKHN0cnVjdCB4ZV92bWFfb3AgKm9wKQ0K
PiArew0KPiArCXN3aXRjaCAob3AtPmJhc2Uub3ApIHsNCj4gKwljYXNlIERSTV9HUFVWQV9PUF9N
QVA6DQo+ICsJCXRyYWNlX3hlX3ZtYV9iaW5kKG9wLT5tYXAudm1hKTsNCj4gKwkJYnJlYWs7DQo+
ICsJY2FzZSBEUk1fR1BVVkFfT1BfUkVNQVA6DQo+ICsJCXRyYWNlX3hlX3ZtYV91bmJpbmQoZ3B1
dmFfdG9fdm1hKG9wLT5iYXNlLnJlbWFwLnVubWFwLT52YSkpOw0KPiArCQlpZiAob3AtPnJlbWFw
LnByZXYpDQo+ICsJCQl0cmFjZV94ZV92bWFfYmluZChvcC0+cmVtYXAucHJldik7DQo+ICsJCWlm
IChvcC0+cmVtYXAubmV4dCkNCj4gKwkJCXRyYWNlX3hlX3ZtYV9iaW5kKG9wLT5yZW1hcC5uZXh0
KTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBEUk1fR1BVVkFfT1BfVU5NQVA6DQo+ICsJCXRyYWNl
X3hlX3ZtYV91bmJpbmQoZ3B1dmFfdG9fdm1hKG9wLT5iYXNlLnVubWFwLnZhKSk7DQo+ICsJCWJy
ZWFrOw0KPiArCWNhc2UgRFJNX0dQVVZBX09QX1BSRUZFVENIOg0KPiArCQl0cmFjZV94ZV92bWFf
YmluZChncHV2YV90b192bWEob3AtPmJhc2UucHJlZmV0Y2gudmEpKTsNCj4gKwkJYnJlYWs7DQo+
ICsJZGVmYXVsdDoNCj4gKwkJWEVfV0FSTl9PTigiTk9UIFBPU1NJQkxFIik7DQo+ICsJfQ0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB0cmFjZV94ZV92bV9vcHNfZXhlY3V0ZShzdHJ1Y3QgeGVf
dm1hX29wcyAqdm9wcykNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfdm1hX29wICpvcDsNCj4gKw0KPiAr
CWxpc3RfZm9yX2VhY2hfZW50cnkob3AsICZ2b3BzLT5saXN0LCBsaW5rKQ0KPiArCQlvcF90cmFj
ZShvcCk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgdm1fb3BzX3NldHVwX3RpbGVfYXJncyhz
dHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3QgeGVfdm1hX29wcyAqdm9wcykNCj4gIHsNCj4gIAlzdHJ1
Y3QgeGVfZXhlY19xdWV1ZSAqcSA9IHZvcHMtPnE7DQo+IEBAIC0yNTEzLDggKzI1NDUsMTAgQEAg
c3RhdGljIHN0cnVjdCBkbWFfZmVuY2UgKm9wc19leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sDQo+
ICAJaWYgKG51bWJlcl90aWxlcyA+IDEpIHsNCj4gIAkJZmVuY2VzID0ga21hbGxvY19hcnJheShu
dW1iZXJfdGlsZXMsIHNpemVvZigqZmVuY2VzKSwNCj4gIAkJCQkgICAgICAgR0ZQX0tFUk5FTCk7
DQo+IC0JCWlmICghZmVuY2VzKQ0KPiAtCQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICsJ
CWlmICghZmVuY2VzKSB7DQo+ICsJCQlmZW5jZSA9IEVSUl9QVFIoLUVOT01FTSk7DQo+ICsJCQln
b3RvIGVycl90cmFjZTsNCj4gKwkJfQ0KPiAgCX0NCj4gIA0KPiAgCWZvcl9lYWNoX3RpbGUodGls
ZSwgdm0tPnhlLCBpZCkgew0KPiBAQCAtMjUyOCw2ICsyNTYyLDggQEAgc3RhdGljIHN0cnVjdCBk
bWFfZmVuY2UgKm9wc19leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sDQo+ICAJCX0NCj4gIAl9DQo+
ICANCj4gKwl0cmFjZV94ZV92bV9vcHNfZXhlY3V0ZSh2b3BzKTsNCj4gKw0KPiAgCWZvcl9lYWNo
X3RpbGUodGlsZSwgdm0tPnhlLCBpZCkgew0KPiAgCQlpZiAoIXZvcHMtPnB0X3VwZGF0ZV9vcHNb
aWRdLm51bV9vcHMpDQo+ICAJCQljb250aW51ZTsNCj4gQEAgLTI1NzQsNiArMjYxMCw4IEBAIHN0
YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICpvcHNfZXhlY3V0ZShzdHJ1Y3QgeGVfdm0gKnZtLA0KPiAg
CWtmcmVlKGZlbmNlcyk7DQo+ICAJa2ZyZWUoY2YpOw0KPiAgDQo+ICtlcnJfdHJhY2U6DQo+ICsJ
dHJhY2VfeGVfdm1fb3BzX2ZhaWwodm0pOw0KPiAgCXJldHVybiBmZW5jZTsNCj4gIH0NCj4gIA0K
PiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg==
