Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65F3CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 18:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759BB10E2EB;
	Thu,  2 Oct 2025 18:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8I7Kphp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2877210E2EB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759429528; x=1790965528;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=NMkDrqU9xv7M2vYUT76LdetTQk9leLtDH8TIwhoZVMg=;
 b=B8I7KphpSrl2snTrGnhSNv2+JHIlBCPQbIVPG+fWcwzBqLp1zL0jFiPw
 NsKMZXei6jYPQeVRbUCbrDGG6N74okOpVZNRJEz+OuzIqfpnkfAFbrm6q
 G14qEgFldDegc48nIqfJjezHqwwB9KCQG81Cjc999qz5uCrOYSl0yLn2i
 zgcNf6VXKMIVfM7rg22GSnWQ9EQTuVkZsXZa8iNJVxEHonUtPInZ67gQT
 oPIqsK3jZklcrqfDAd5mc3SEek3IEri+rOcBzBVaayL9ZlxjSqd+XPUQ5
 fSy6B2H52kzg+E56ssLQnqwcNig3fLCw8zaPN9ns4K0BFFIx3KxgLe89P A==;
X-CSE-ConnectionGUID: TvLX2/utTNCBfNSEoAnFbA==
X-CSE-MsgGUID: g+IjXbcBSQi5E3HITR0O+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79146745"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79146745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 11:25:27 -0700
X-CSE-ConnectionGUID: DiYVr1x1RGmuzG5YoSoWjA==
X-CSE-MsgGUID: 8sEGf2+NTRaa9T0qnblRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="202854018"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 11:25:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 11:25:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 11:25:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 11:25:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSCpmMU17vUyK4+zzU//3XHd4ZZirMju+whWYIWTzQCmr6AzV05Sx951EgJCGETSXEzzMpU5hIC94HkD6PUzXdPsSDTJDcqUT2DjOZisaAF+VAl+JPJ/m0kJ0OAWJSKpdZTcR4+RvL1Cdh0kpz/dwA2gpkeZCOROnYSwiSofZtHK+NM6YZMDUgIHzYaM12DrAqwreuI5KSsEesGvyssgT2XVRMor0Z+sfJ2X4rQKrKVU/QWee1Qzkqvvx5QwxmzbrKDtTbmVUjUHK0WyINTPoBbpKP/w9A+RFh0wkVdiDHrQest3ncXk7OocFCnGNrmSS0nrVZG1wl5pocxqJaDC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54lY0Df99RdW3TZej2JLRfZPZhVb5UODP/B0Qa+0MaI=;
 b=exXt+7Hj4tse1i2YUQwRxAGaGy1apG8WchPkjxwhTYEuIlUjEdYBCm1q//DzowT6eRV+OMH3ramI/097EMm/4iU7SAaHj3pzpMIdyY2QJDWkpsIFQcBDet7160CqAlrcSyhrcWiZvkBF0+na647d5EPMj7IEQB7r0GtpGG3g3M3SgClpTU395/uw2jpmIRfwbMqZs5DgdWwzSVvVWc9G5dQHYiGMqbwDxxwWyDrH/bgb8+DR9On635gw8CT1B0nohSdkORgRtKIeUowwMFCtOYn2Bpq1/W4oFuAEyIIy3X+0Clo6xQICTSdsJaZqcsDMeVcZZAx0fBiu7CSuiBF1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 18:25:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 18:25:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-41-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-41-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 16/23] drm/xe/rtp: Pass xe_device parameter to FUNC
 matches
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Oct 2025 15:24:56 -0300
Message-ID: <175942949696.1952.3655236659711662379@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 267177e8-ff79-4404-617a-08de01e0fffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3hDNFU3TXRNdStBdFB5OTlla0RnVk9ST2M0SU9tbTBzaDBEU0I3YXlNZWJx?=
 =?utf-8?B?U3NOZWxJMW9zR0ZjSjZSL3ZNcmFPcUp2MXVLRXdzRDJiTzBWK0JHZ2tSV3Bw?=
 =?utf-8?B?U2NoME91eVBUODJ4M1lPK2YrM0VNbUtnZE9zU1kyT2VwTHl5Tk5SbEg2M2JV?=
 =?utf-8?B?eEwzL1JKUmlva3NTMCtlNDByR2lJSUpSMnRYMk1hVnNqYkxPMEdBYTNOcFV5?=
 =?utf-8?B?US9jN3J2eGFYTUYzaThvdEpxQmFEWG9wSzNvN0hlSUQzbWFRVnJ0T0E0anlj?=
 =?utf-8?B?Sm11Y1MranFjR1FKZWFYOEcxRTMwMkxyOVV1RWwvam1PRUROMEppSWpOQ2Q3?=
 =?utf-8?B?ZVVLaEE0cmRoeWkzWlhWeDh3UEtuSzlSa2NoTTNMdVNyNlI5RWFIQzlUU3JJ?=
 =?utf-8?B?cGJpbXI4R3BXZU9rZW42RkZQQVFPam1xMnRtdjUxTjlDK25uY1VjdmoxYmVY?=
 =?utf-8?B?Sk1Yb0RISHkwVGozbnVPWTlLcGhCNkpZbGJDVDIrdXFSMUE5TXNMSTh3YWFZ?=
 =?utf-8?B?Rm9lODV2Y2F4RzJTN2J0NHJ2ZzM3S3UyWkZ1akRVQ0lpLysvY21GZjYwZFRC?=
 =?utf-8?B?bE80U292dHJsTG15OFZMcDlVODhoclJ6ME1kV1d5VGFMaE81QlVJc3JKQmhw?=
 =?utf-8?B?SlJCQXAxMkFSY20xWkg2SXNkM2I1Q1RLNi9XRU9SSWJORDN0NHh3S0dTNzJu?=
 =?utf-8?B?dW9kb0UxVXMyZnJOclhOVE5jZjh2cUYvUUdGY09jYzN0QWlZNkNwYkxsUEFo?=
 =?utf-8?B?Y3Aza1VMek5sWXhnbVZnQzAxWVFzRWJqTFY1ZVFobmFRdlRHc09CaGhWS1NM?=
 =?utf-8?B?ZlFreXVrSHo5Vi9RQlpPTkM5NUUzVlJrTTJmR0xEZXVEQTZrTGpjQWR6R2Z0?=
 =?utf-8?B?SDBLbTMzU0pvakgra3ppNzZENlluTEJvdmI4bTRUc05KcDNydHk3YnNGeFA0?=
 =?utf-8?B?K1Nvb0R1YzRvdi9XbFNLaVNjcGdhaDVKTTltVFo0NWFSSWlqZm5FVGpFNzVj?=
 =?utf-8?B?SUZUK2RNMzYxVkE0eFdaWk5CTmZNOGhQTFFHZlR6WTlQNlp1UGk2d3ZERlV3?=
 =?utf-8?B?S0VJTHBCc2EvRWFqR1lYWkhlMmFkV2lnbHViOHdCN2h0K0IzMzNiZ0o5aStG?=
 =?utf-8?B?SXVkUUpLdnN0OTlhNndrUFV3a0ZQUkVrY2FDeHp3aUI1UXFpZWUwa1YvaS9s?=
 =?utf-8?B?NzZRWmZwQTg1bVB4UzhqM3ZFMmdYT29xY1VvZnZWaHhPNFFmTVhEU2FRT2t2?=
 =?utf-8?B?c0VxVHE4MVFIMDFxY3NGK3Nmdk9xYVgvS2lQMVRGT0lNeG0yeGk3Rk5JbUdk?=
 =?utf-8?B?U0ZnekVaMXpwNzVSb2pRY0ErMFgvK1lzMFRHQXdXV1N1VW9sWXYvYURwQUJM?=
 =?utf-8?B?NUl6SmlIZFJwWmE3ZDMxL0t2RWxNaTJrbmdDTnFiZlNoemRmN0tJNHQyZmRP?=
 =?utf-8?B?UVBtMG03cVBLSXNqRjBCaGRiNytJZnZmWno4TVdJRlNJSG9OVHo5bTROL0Qw?=
 =?utf-8?B?cjM2dWN1V05PVzVMWW1IUjV4UFFUNUFFa3V5S1VLRHZNL2VSSUR6TWh6UFh6?=
 =?utf-8?B?SVp0eElNSy9JUk5scElVYTEzc0xQUDFkYk5jU05FaDlLK250ZnJXVCtCY2J4?=
 =?utf-8?B?NmlNN293OXNHTllqZ1plZXh0RUI1NnpDS2lFaTNDVE50SDRMM0pBbEQrMi9o?=
 =?utf-8?B?VHdVUnQ3OGlkNWZMOVVjQkV1VGpKZ3VUY3NKVElQTitIajlCWXJVTUpHMXpv?=
 =?utf-8?B?bzJRNTFES2psV1NxRkJ6alBGVlRSSWFOTWduWTFlNjZGdW1LQnZwNEJ5Tkp5?=
 =?utf-8?B?ZHRmZ3doOVJESEdIUmdDMVFlNEsrSkJZM1hTdlNwYzYxdUhWMllKZks3N09t?=
 =?utf-8?B?VmVHNGRNNXk2eGJrYzZFWW5JZnZJWDNUbW1SOWlVbUxjeGV6VzNUOTdGd1VB?=
 =?utf-8?Q?ta2TsgQf00X2SnFy1Bn5oDyCkwtmmbe4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRkLzc2ZXFzNUIxSXp0cC93ZUx3NkNwVDZqWGUyOHBKS0RDV3hhbXBoZnQ0?=
 =?utf-8?B?UlhtM1orQ1VVZStLNFE2QnBiTEc1U0RQTFVZZGFxeTVWMGpKd2JTcTMrZDkx?=
 =?utf-8?B?QkxBMDE0ZHlsV2hRd2tzdC9ONi91N2tKQXRlZVgzc3lTMXJWVUJ2SlRDWjNH?=
 =?utf-8?B?YVo4UDZsVkdPdTFRdDZ3R1MwV1BIMU9RMlM3VTNQNW13VUpNUlFuTWgvUEZn?=
 =?utf-8?B?WlUrYVllaUxVRi96NW5MRWFBS2VWQ09wRVc5SkRsZE1wa05FdkZUeFRzaDZq?=
 =?utf-8?B?cUt0TENzaTlzdVBzbTFqSzdyM0RiU3JTOTdpdHNzVndlZXFYamZkdWFSNUc3?=
 =?utf-8?B?RDMyWCsxU3E2UzVsanhDT0VETXV4Sk9Oc1BlVTVLOUxsbmJsMU5PV01hZDVw?=
 =?utf-8?B?bWlMaVpyMzRhVlBFdWNuYjNmL0NtWUtrR2NVYzZrUjN2cnhVdkJ5YkMxbGg1?=
 =?utf-8?B?aERFem0vTUlhWmhDOCs0cEhqejkrSkRJUWx2a3drdmVRQW9zaG9tbmtvR1dp?=
 =?utf-8?B?VzhNYzQ3ZDdTWkVIZXEyVk42K0xoZ0taOXFFTi9kTkM0R0Q5VXVreDJTdWwx?=
 =?utf-8?B?U1pER1lGS1pyQnhLYWl4WGNaTHFvai9zK3ljaXl3WnE1eTNiZHdJQ3RWWXZ6?=
 =?utf-8?B?aWlzdHZQdkZlUGF5MG0wcTF3Vmg0cC9OV3NVdUZkWW9pK0t1T21hTE5nL0pP?=
 =?utf-8?B?bU5oRmxObXFvZjJmQ0xOOGxIQllWWUhoMjFtZGdzYUhsTFlscHRkRjZqeGJk?=
 =?utf-8?B?OERiQXZzQ0srbmFjL3pWTGZndUt6cnNTV2ZhZGt1Q2RGWEl6ekM5eVNtOHZp?=
 =?utf-8?B?NkVneXBFWUdITHBaL3hqU05ZMEErRHkvQmFpemM0OXdWdWh6TTZ4c001YlNI?=
 =?utf-8?B?K1IxYVRGVitQRVY2alNKTnlGMnYvOVVvYUJ6N0VuUUZjTEVWUFp4NUNwNisx?=
 =?utf-8?B?eUF3cGN2K0lBekVqQmpHdmMrQjZlVHA3dUJYNlE0NDdYOXlwVzA3VnpGVkw1?=
 =?utf-8?B?M1FnT2xjcEhxUUhZaWVHNlpXeVJKS1NsVU9ZWFQvbXg4VVRlc3hKR1pTS2V3?=
 =?utf-8?B?SnRNTmNXb01TQmdaUTUwM3RNcExVRGg5Zit2djludEdid1lmN2pWOVVLa1ZQ?=
 =?utf-8?B?RU1MZ0JIMUo2c1ZjdWwwVjdUa0RuZmZDTWdVSnFzWHVQa0VJaDlEdk8xajdl?=
 =?utf-8?B?WUp4eUdUNThZaTB2MUk5TVNsU3lPSFBpb0NUeE1OOXRRS1NyanNncUR3T3Zz?=
 =?utf-8?B?WkN4RUVLODFjZmRIYTRpQXZJTEdabWFFNlVlckpqMFpZWk1pRGNQcy8vN2Yv?=
 =?utf-8?B?Q1hJLzlLb2JhWGpDeGJWTTh4QzVhKzNWaXpqdTh6cFA2SmVmMXVWRzd1Vjla?=
 =?utf-8?B?aythR1FVNnNqKzdvWEtDWExJTHZ6dTRETDl5RUJLeEV1ekVKZTRVNnZFTktu?=
 =?utf-8?B?NTAzbGF2UFQ5MEpIOXpLdzRrbEtyWm9RMlNwaS83RTA0MXNWbDk5ME9waXBH?=
 =?utf-8?B?UzZYNXJic1JRLzF3L2RVSDAveDk0WkplOEJIb0ZCWUhzTEl6bnhFeHk4anBJ?=
 =?utf-8?B?VjZTQ04rNFphUHFZUXc1d0IxdnpJOFl1WHpLM2RTWDVMbDJGOGxLYVR3LzZu?=
 =?utf-8?B?SzcxTDRWNEhUZ25FK1BDQVptZDJsZytKOVNMNXc3VGZrMndxVjZCRkFXbFhz?=
 =?utf-8?B?VU1KM1p3WjhEWFJDbktCbldoR3ZFVEFqK3Z6eXVCZk1KYk1mZWM4bDIrQXU5?=
 =?utf-8?B?WWlvbVNmOTVOcmFZRld5cXYyRFdJcm9UVjN4K0tkTm5DaS9GYmtBNE5Hemhv?=
 =?utf-8?B?RXRJMG55ek9PUVQ2N3ZkUmZnRDlhMVREN2pMUUVUUUVZOE9PcTU2VXJlSHhU?=
 =?utf-8?B?ZG80NmtvVE5LcllxNU1hRGxiU2dzYlFHb3lIWkNMbFBKOUtMUG9XaVNQd0cr?=
 =?utf-8?B?NGt2OWgydmF1VDNhaEZOYlgzUDBIUUovVDNRdm5VK2hSV0JKYTdtQTAyQjBU?=
 =?utf-8?B?MjExd2hHdHdUcW9TcFp3bzZsQU85aHZhTEhzbGhZa1VVRTJGM2gxczF1c2d4?=
 =?utf-8?B?aEpEWDZyVEhCWkcyZzRoRjUvanAvdndRK1BJZHlLS2VhdzB6MmlyclMwbEwv?=
 =?utf-8?B?YzRvQU1ldElNclZmQjdqYVYwREE0RmNGcHdrQnh5bFgwR003NGZVZ0xaNnpQ?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 267177e8-ff79-4404-617a-08de01e0fffd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 18:25:01.5961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Es1/43UyW4oT0+lYPWlRic7KL4GZYc6+dB78SX+eHjc30+e8CehL1GHfuSOJ5e+zfWKcQmRMjL/Q731cYpQcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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

Quoting Matt Roper (2025-09-30 19:56:33-03:00)
>FUNC matches in RTP only pass the GT and hwe, preventing them from being
>used effectively in device workarounds.  Add an additional xe_device
>parameter so that we can use them in device workarounds where a GT may
>not be available.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++++--
> drivers/gpu/drm/xe/xe_hw_engine.c      | 10 ++++++----
> drivers/gpu/drm/xe/xe_reg_whitelist.c  |  3 ++-
> drivers/gpu/drm/xe/xe_rtp.c            | 24 +++++++++++++-----------
> drivers/gpu/drm/xe/xe_rtp.h            | 18 +++++++++++++-----
> drivers/gpu/drm/xe/xe_rtp_types.h      |  4 +++-
> 6 files changed, 41 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index b0254b014fe4..d2255a59e58f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -48,12 +48,14 @@ struct rtp_test_case {
>         const struct xe_rtp_entry *entries;
> };
>=20
>-static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *=
hwe)
>+static bool match_yes(const struct xe_device *xe, const struct xe_gt *gt,
>+                      const struct xe_hw_engine *hwe)
> {
>         return true;
> }
>=20
>-static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *h=
we)
>+static bool match_no(const struct xe_device *xe, const struct xe_gt *gt,
>+                     const struct xe_hw_engine *hwe)
> {
>         return false;
> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index 1cf623b4a5bc..cba4375525c7 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -346,17 +346,19 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *h=
we)
>         xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> }
>=20
>-static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>+static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *=
xe,
>+                                                 const struct xe_gt *gt,
>                                                  const struct xe_hw_engin=
e *hwe)
> {
>         return xe_gt_ccs_mode_enabled(gt) &&
>-               xe_rtp_match_first_render_or_compute(gt, hwe);
>+               xe_rtp_match_first_render_or_compute(xe, gt, hwe);
> }
>=20
>-static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>+static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
>+                                      const struct xe_gt *gt,
>                                       const struct xe_hw_engine *hwe)
> {
>-        if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
>+        if (GRAPHICS_VER(xe) < 20)
>                 return false;
>=20
>         if (hwe->class !=3D XE_ENGINE_CLASS_COMPUTE &&
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe=
_reg_whitelist.c
>index 23f6c81d9994..690bc327a363 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -19,7 +19,8 @@
> #undef XE_REG_MCR
> #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
>=20
>-static bool match_not_render(const struct xe_gt *gt,
>+static bool match_not_render(const struct xe_device *xe,
>+                             const struct xe_gt *gt,
>                              const struct xe_hw_engine *hwe)
> {
>         return hwe->class !=3D XE_ENGINE_CLASS_RENDER;
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index b5f430d59f80..66707cc89ec9 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -133,10 +133,7 @@ static bool rule_matches(const struct xe_device *xe,
>                         match =3D hwe->class !=3D r->engine_class;
>                         break;
>                 case XE_RTP_MATCH_FUNC:
>-                        if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>-
>-                        match =3D r->match_func(gt, hwe);
>+                        match =3D r->match_func(xe, gt, hwe);
>                         break;
>                 default:
>                         drm_warn(&xe->drm, "Invalid RTP match %u\n",
>@@ -343,13 +340,15 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>=20
>-bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>+bool xe_rtp_match_even_instance(const struct xe_device *xe,
>+                                const struct xe_gt *gt,
>                                 const struct xe_hw_engine *hwe)
> {
>         return hwe->instance % 2 =3D=3D 0;
> }
>=20
>-bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>+bool xe_rtp_match_first_render_or_compute(const struct xe_device *xe,
>+                                          const struct xe_gt *gt,
>                                           const struct xe_hw_engine *hwe)
> {
>         u64 render_compute_mask =3D gt->info.engine_mask &
>@@ -359,19 +358,22 @@ bool xe_rtp_match_first_render_or_compute(const stru=
ct xe_gt *gt,
>                 hwe->engine_id =3D=3D __ffs(render_compute_mask);
> }
>=20
>-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>+bool xe_rtp_match_not_sriov_vf(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>                                const struct xe_hw_engine *hwe)
> {
>-        return !IS_SRIOV_VF(gt_to_xe(gt));
>+        return !IS_SRIOV_VF(xe);
> }
>=20
>-bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>+bool xe_rtp_match_psmi_enabled(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>                                const struct xe_hw_engine *hwe)
> {
>-        return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.=
dev));
>+        return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
> }
>=20
>-bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device =
*xe,
>+                                                  const struct xe_gt *gt,
>                                                   const struct xe_hw_engi=
ne *hwe)
> {
>         return xe_gt_has_discontiguous_dss_groups(gt);
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index ac12ddf6cde6..e5b8a9452e29 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -440,18 +440,21 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>=20
> /**
>  * xe_rtp_match_even_instance - Match if engine instance is even
>+ * @xe: Device structure
>  * @gt: GT structure
>  * @hwe: Engine instance
>  *
>  * Returns: true if engine instance is even, false otherwise
>  */
>-bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>+bool xe_rtp_match_even_instance(const struct xe_device *xe,
>+                                const struct xe_gt *gt,
>                                 const struct xe_hw_engine *hwe);
>=20
> /*
>  * xe_rtp_match_first_render_or_compute - Match if it's first render or c=
ompute
>  * engine in the GT
>  *
>+ * @xe: Device structure
>  * @gt: GT structure
>  * @hwe: Engine instance
>  *
>@@ -463,24 +466,29 @@ bool xe_rtp_match_even_instance(const struct xe_gt *=
gt,
>  * Returns: true if engine id is the first to match the render reset doma=
in,
>  * false otherwise.
>  */
>-bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>+bool xe_rtp_match_first_render_or_compute(const struct xe_device *xe,
>+                                          const struct xe_gt *gt,
>                                           const struct xe_hw_engine *hwe)=
;
>=20
> /*
>  * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
>  *
>+ * @xe: Device structure
>  * @gt: GT structure
>  * @hwe: Engine instance
>  *
>  * Returns: true if device is not VF, false otherwise.
>  */
>-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>+bool xe_rtp_match_not_sriov_vf(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>                                const struct xe_hw_engine *hwe);
>=20
>-bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>+bool xe_rtp_match_psmi_enabled(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>                                const struct xe_hw_engine *hwe);
>=20
>-bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device =
*xe,
>+                                                  const struct xe_gt *gt,
>                                                   const struct xe_hw_engi=
ne *hwe);
>=20
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp=
_types.h
>index f4cf30e298cf..6ba7f226c227 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_types.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>@@ -10,6 +10,7 @@
>=20
> #include "regs/xe_reg_defs.h"
>=20
>+struct xe_device;
> struct xe_hw_engine;
> struct xe_gt;
>=20
>@@ -86,7 +87,8 @@ struct xe_rtp_rule {
>                         u8 engine_class;
>                 };
>                 /* MATCH_FUNC */
>-                bool (*match_func)(const struct xe_gt *gt,
>+                bool (*match_func)(const struct xe_device *xe,
>+                                   const struct xe_gt *gt,
>                                    const struct xe_hw_engine *hwe);
>         };
> };
>--=20
>2.51.0
>
