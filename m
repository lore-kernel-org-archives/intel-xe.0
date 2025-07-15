Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAFEC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 22:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541B310E38B;
	Tue, 15 Jul 2025 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGaHbJFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6410E0BF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752616819; x=1784152819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qigmYbE1gfxDKcQnzADLYqiYHHWS69gSh4FYoFZxH2g=;
 b=hGaHbJFyblxkJoMP5MNNC82OgjkaUCfPfMg2HAMtuYRZJDW1Ed0GvmdD
 63NX81ncTNk9WrIpFgVe0pDr+Eepl4t+7SmmKsozzSPlgYhfRkKgeLSoU
 R8I7sRzKqaDuYzxJyBy+f2F+79xokFUjGYStxn8e14t75kNyPgzGoq9LL
 TcYe11S93cGNHEaARfHlbVfZj7ZuHJhw9Axs+1ufhYsdLwihp/Kza9NBf
 GlUE88r19Q7OevU9zkhuNDlu8ZuID8GG9nQcVvj4LIxlYDSMsPMEYSvCo
 SmmqCWQGP/HNr2DMAIJB1aGxlhHCa67AHGj750Loa11TVF5Dr9mSZgi3Q A==;
X-CSE-ConnectionGUID: /WM5ToFhRfWEvT5kmveSDg==
X-CSE-MsgGUID: SwJVnseAST6GC6jFJCsGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65112755"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="65112755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:00:19 -0700
X-CSE-ConnectionGUID: YiKc1To+QJq8X1Q3j7oqhg==
X-CSE-MsgGUID: ecoXT8afRGOhCLASYpzECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156738961"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:00:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 15:00:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 15:00:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 15:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlARkivP9GZqMpd9LgHH3KMVQPB+GGF3lqLV1o3q9yFEMucUwBm4oUxbHx2YqtA2XUhOB+NYGM01hn2ikeoYWNPAzqbw7ppiny9xstLi+sYg86xgTCfFPgpZlY0L6rCHqP+bKCYwg+xUFooAZ1xS4no7qmU4ziuAZwpnValexsgn0V98CYaCcroF2vAEFWJCrDEkl/s1Cy+Bh9KI1Seyd1v94JcQICsvVAGhYsfGjWIr+ItxSxZKWhbmppi4SeM8ZxeAyxg2W82wbFSzPecNj4Tw8BIhZirBbGzLRRcxh1XjCfEqWzwx2iktv8n+9Imxs37r565ClOOyCOOZZnlipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDqrbXQN1Rd4kF22tFqwHnftmDiK5aRgjY6fBMeCl5o=;
 b=RpCXwZu2U+XTxCpGkYq7GW6+giWBZ2i9uctuJr5ho+OImu/tn6MzwtL8/XUgC2iXoJUVrXsBbwW19EqYxfX+9n5PnPSM6R8EWApGto5Fcsi6MTVEctuuC/ABBoJmcfnYM3HNDvOn4sWJGNp5afuL/UBpeQXYRXsohdimUH80yknsLrLTWZPZG0iJuiQLlUcvY4mP0ESmKDQE3PkafAY9wu/0UIT7/LcT5S0ZMFM2CTz+Q+dTYWmn7uSAeeHJ7SAFBCrNZ/0Z735oQBD68Jww/bA0crInl3GHhflVWsdAEZo1bow+qWnS5o/T6cEkQjdhXaf0CHgwaKVlfN6ObhiusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 22:00:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 22:00:15 +0000
Date: Tue, 15 Jul 2025 15:01:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Message-ID: <aHbP18q00wYuShIQ@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
 <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
 <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
 <a5faff54361576d0ba2eb30001122479f91a5756.camel@intel.com>
 <aHbNjNGwbz+GRy76@lstrano-desk.jf.intel.com>
 <0a2e487bff470dd4184b2e044853ef730928e5a6.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2e487bff470dd4184b2e044853ef730928e5a6.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 1182ebd1-e79b-457c-f511-08ddc3eafa95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnB1NndBNG1QREphMXdiRkV3aWVBRUtjMlBTVys2c2VsbjBLeFJZT21tVU82?=
 =?utf-8?B?cGNLMHJncjRJeDlxb2pJYjdIV25ZU05Nd0EvK1dvYnZiOUNEeFE2dzF3S0xN?=
 =?utf-8?B?WEQvTWJYL1ZJcnZ4NGpmWE1JOWc1QlcxaFJoQzRGb1J4eXdManpoelNvTmpG?=
 =?utf-8?B?SjBrVVBYdTd3b0VINEtRQlgxNjF2TVNEUUVBRzhXUm9CQWlsRkNURUZxNUpL?=
 =?utf-8?B?WHlPTUNMMG1aTXBiaXc2R2pnbjVqdm9Pbjg1YkVvMVhiL2hKTEx2bklFTHN0?=
 =?utf-8?B?aWxoRzdNdXh6YVdrY1ZvbFJ1dUh0L0VXMGQzSW14NVkzS0JEMkVWZkd4blVX?=
 =?utf-8?B?ZkhWc0YwaTV6ZGlEbm43b0ZCbmd3R0xkSURHVU1GaXFCVC9lbVpnWG1oY2Fu?=
 =?utf-8?B?YmVQK0RsdThIZWVLYUtJZ0EyMWNhZndXQ1NTVDZMTDBXM1dySFA5ckd5M3JL?=
 =?utf-8?B?WFNrTU5TQlZTQmw3VyszZWJzNndCdVcxcmltY2ptdVVWNFhjV05jN2pZYnpJ?=
 =?utf-8?B?enljQm9TaTNoUTRhMFBUZTJhYmJjajZ0VUJGYWpXeUVuMWdUMzh4TFVHNmUw?=
 =?utf-8?B?VVdzRUtjSGxucUdzNG15b0pUMTdhRzcrZW5MSGNBaVNtWjlkajNTdUVsOHFI?=
 =?utf-8?B?MGhaM3k4YlJvWWsrYjVoRDQ0blg3ZVVWaWxkUE9vSHZwS0JWbWpQL21mRFV2?=
 =?utf-8?B?b0tJbWVMV2ZVSnoxWllQSERvUHlYVkJOVmVPS1FDVGpPdndOb1RpZEgxQXhO?=
 =?utf-8?B?a3VxcVl3bFJ6am1DNXQxK1ZlZHBPTUtudFo1YXRCV0E1a2xqa1hmZHZwQ1p4?=
 =?utf-8?B?N2lZeEVtL0YvQUhQa0J0azVNSzlyelBVMGxFY0NvWlRJQ1l3cGJHemJ1cXha?=
 =?utf-8?B?aUZxdUgzdDlzblp1SWVnVzZBMFFzWHlOZGhFbE1qaituQ0pxaWtzQVQ2Ynhz?=
 =?utf-8?B?bE1NTnRRNERpVUQ2VHViTkpBWTE5VFpqNmVZRU5JRGVlMTV2UktldE91clpk?=
 =?utf-8?B?em8wOUFlSmgwNVREbTlBbmRjQ2k4UEtMbnR6R3Vpb1NDTzVCK0diRXRpTTMx?=
 =?utf-8?B?QXp1WW8vYlFNb3JjUDhpWnpZQXZURE1ERHV1UGhTMkxNd2EvbmJoSG9DOS83?=
 =?utf-8?B?U0xHMzd2cHdrQ2xpY1Y0ZkRTY2hydGMwTUQ2c3F3MWppVDVvME01bmIyMm1S?=
 =?utf-8?B?NWpuQjVmUGx1RHpJQTlUYUpuVFMyV2k5M0JJU05wVUlCWm43WkFtQ3U3YzdF?=
 =?utf-8?B?ZDBqLzA4ZzBtZzdrSFZvQ2FoUysyZnlCMVZ1bXZqK2xrWHcvNzdra2ZwQmtq?=
 =?utf-8?B?NVJZY3dDZVNIT3RRK1ducnowR1Q2TURweUhRSEIzTW42UVNtNWJRNFdWNFJj?=
 =?utf-8?B?ejByaHJGbUNvcElMb1gzalpRc211ZHcwZmU2enRXZ3hmcy9lSzAzOUpTVTZP?=
 =?utf-8?B?RUI5K1lmenh3eVh2RGo2SWJZRGRtWTJaZUtsNEE5T0UyeTgyM21VTm5jbWc2?=
 =?utf-8?B?VXlOUmNRWjBURnNmWDdwOWxkVWJLdm1PUVoxNS9kaEpZNFV6RWx2TEtFbHFI?=
 =?utf-8?B?bm5ENVZ1UlV3MUZIeHV6R3MrSnJBeVd2NFFIOTg4YTFjUkV2TUV6d0dTVlk1?=
 =?utf-8?B?WGs1NUVvd25vQzVNczZTd09RNDhERTRsUmt6MXVqQTd4VFl1aFJuTmIxK2wr?=
 =?utf-8?B?MzJodEpvTDVtdG9BbGdvWU5Gb29iQVdXeHZmcVdaL0s0QjlYV3Z0bDc5QThZ?=
 =?utf-8?B?OTh2SlpSTzVQRDNHa2ppS0VUajZwT0UveVQ3a1Azb0VLZDJTZEtOMENlTEw3?=
 =?utf-8?B?RlZSSEFnWm5ObVR5NzRzbCtxZnp0WExQczV1TWtDVGlUazJORnoxWlJoZk5s?=
 =?utf-8?B?eWhmSUV5SEQwQXRnU25UWUN5OCtzTEZBSyt6ZDVtTDdXd2NNYS9KSDRiVTg1?=
 =?utf-8?Q?d+TqdBFxCZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm1vQno3MTdzY1JOV3h6RGdSRkE0TzY1RU9rZG5Pd3NPRkphQXQrZUtwVlRn?=
 =?utf-8?B?SXoyaVNzNFJLK3Q1eFk2VGhZcWJTUUlyUC9sMXVvdmZNL2pvMEVIbm0yZ2xq?=
 =?utf-8?B?VDR6N3J0OEJxTWpuZGJUYjJodENvZnFlM3NERUlSMU42NTB0RzJSaEVHRGJE?=
 =?utf-8?B?UytjQkRRWGZlc05IcG9uQ2svREVxS01sK2hIM0ZDaDl3VHVDR1B5bFAra1dl?=
 =?utf-8?B?WGtLS0hTeTBwNVR4eFFBZE9KVnFyc2NaajBvYnVxbzdJWmk0U2UreTQwbzlm?=
 =?utf-8?B?K256STB1M0YzelBuejlXMjhNTjFzaDlXODhFSG9TVnVnRmppb3JzdXdlVFJj?=
 =?utf-8?B?ekY2bmhZdmM3Z3U4MzQyMWFNYlZBS1ErU0pIVjhFK2x0cmoyVTFQdGsySWJv?=
 =?utf-8?B?Q21JTWQ1U08vRG42cS9uQ1Y5ZnN4MWc0aU1Rc0VzRS80OFVXOE1Xd1VONVRo?=
 =?utf-8?B?V293cGZobmxYQ3kxZ1dvR1l6a2N2aTY5ZTBpMEVKYUNzVnZjTnhFUWFUR3l5?=
 =?utf-8?B?Z2dITXNqU21rOHA0S0kzWTd5ZTF2TDhZbWRWeExpMytITmRUSkMwazV4bC9t?=
 =?utf-8?B?OGtPRWhtZ3ZUR3R5V1M3SWI4aTV3L1BoTVNKa29VTFJzSkZ2MTFJL0ZIT1g3?=
 =?utf-8?B?NG5EOG9jLzM4WW5yNjI3bzRjdjNyaXZyMUpyVXFFbEtPbENkd0thUWI4eW9z?=
 =?utf-8?B?ZHBnVEYrUVJOZFZEY2ZXd3E5Nlp3c0RUM3MyVEJSbWVSZDFBc3Ric1BoMnNR?=
 =?utf-8?B?QmpsSXJKcHloZU5qd2d5THR1MkMxL05Bd1FqTmxleUFQWVJxN1E4Z1lFOWpG?=
 =?utf-8?B?YXROMFpDQ3NCUklsU2hUWk1nMGNjQlVnS1NXT2trMVE0eEZKWXlZKzJ2eVE5?=
 =?utf-8?B?WWYzbmdWMVhETDV3dHQvdDNKaVh6ZXRNUWNJQ0RCN3JDV0ZLMnQ2ZUppNU9L?=
 =?utf-8?B?Rmpqdm9JbC9OOHZCZ0J1WTJ4eERCbjgwRzJyRFFIWXNiMWJxZ3lhM0dSK0Jw?=
 =?utf-8?B?a3VvQTUvSVRPSklTcS93dTQ2amEzU2NXQUNlWDd2VEM2c1V5ZGN5MnNIZklv?=
 =?utf-8?B?d2g1VW1nL1YzckF5dVlOVDRzbkE0SVZLOUtyMzNFbk05ZDhrYm1WYWFRVTFW?=
 =?utf-8?B?cGZuS2hKeWZEN285VXgvaU9peEZNc29lNjNuOEs3TEtRTW1ZOFRtQUZwQWdJ?=
 =?utf-8?B?ZCs3bE81R04rOVF3aTNJMmhvQjRIemRoSjhTbEJsTHZoMG1oTUl2RFo1ZUxk?=
 =?utf-8?B?bHVOMkVaSzI5dC80ZStidmZPaEgvOU5VYWw4RTZlT0g3aWhQRUtad0RKcHh2?=
 =?utf-8?B?WHhmaGtCMlhoZUVNU2VFR1VWdERkOVNDZ3c3eTlIRlJEU09GeTUrYVRlTmNS?=
 =?utf-8?B?YmNyLzZjVEkxU1dHcXRoOThDTzdYcjBROXNIeUxQSXZ3UGcwOG9XL0pPWktS?=
 =?utf-8?B?QzJ4WDF4dDMycFBlSkJsbUJzL1NNbEpUVVFMOEVoWndXdUxyRTJaZ1E2V1Fi?=
 =?utf-8?B?WG1DbDJJSy9WUjl0bDEyU3A5UTZWM2gxTlhiSWdKTmUyTkxqNkRwS2F5T3cz?=
 =?utf-8?B?aDBSV1hQVlVaOXBRV0ExSnhPeURiTGhVMkZHOXlMUGtzQUE0dGE2VG5oZHVM?=
 =?utf-8?B?WlVUNUUwdnBPUWZmMEdwWnErYUx3bm5ndDBvOXdab0RmL1RCNVRDSEQxUk9Q?=
 =?utf-8?B?aUg1a0RjakNlY09nQ3A5Q2JoeWRnbjZZbjJQTnNXTVBkOURSYzk4aXcrNkZh?=
 =?utf-8?B?YzRYVkh6NjhaUTE4ZC9UT3JYQytuUTFqUElrR1RGWFRJUEJjVHlyU011Q01x?=
 =?utf-8?B?Tkp0SHI2OXBBbmlmcklmc3V3aGh1N1RIM0krRlYvOHFKRmRVV29LbEExSi9z?=
 =?utf-8?B?RWpzaFQrUlBudFVoWm0reDVEZ3JGSittbkgwK3piSVVJd05wUGtLU2pWMWU1?=
 =?utf-8?B?UEFudHFTZTljbnRXMUpEQXJMek1CTWlsRHdIU1ZScG1Ba2toMFNqSVRjUnBt?=
 =?utf-8?B?Z2hTZmJ2bHNyYUN1ZnVVd2U3WjJ1Y3N4UjZTem1KMjFIOEtKdGVISGQyNHVJ?=
 =?utf-8?B?a29DU2JUYWlQRCtrZWJsRWhSVUFtZnpGMzQ5TnlCM1p4QmRyNEpXZG0wSy9R?=
 =?utf-8?B?Y0dqL0RnNStrMVZLbW5lVkNDdERzV1lwQm10L040MlphOUZ6RStZMnJyakM4?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1182ebd1-e79b-457c-f511-08ddc3eafa95
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 22:00:15.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Llyr4ENKw8diBF83EZChIbSGmtNejnAc2bFmeTNnbaviHkxerm4mgqkmuJ+R3qM3U/ayjgDs589ZqNkiuCOv1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
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

On Tue, Jul 15, 2025 at 03:53:27PM -0600, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 14:52 -0700, Matthew Brost wrote:
> > On Tue, Jul 15, 2025 at 03:45:55PM -0600, Summers, Stuart wrote:
> > > On Tue, 2025-07-15 at 14:44 -0700, Matthew Brost wrote:
> > > > On Tue, Jul 15, 2025 at 03:34:29PM -0600, Summers, Stuart wrote:
> > > > > On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > > > > > Add a generic dependency scheduler for GT TLB invalidations,
> > > > > > used
> > > > > > to
> > > > > > schedule jobs that issue GT TLB invalidations to bind queues.
> > > > > > 
> > > > > > v2:
> > > > > >  - Use shared GT TLB invalidation queue for dep scheduler
> > > > > >  - Break allocation of dep scheduler into its own function
> > > > > >  - Add define for max number tlb invalidations
> > > > > >  - Skip media if not present
> > > > > > 
> > > > > > Suggested-by: Thomas Hellström
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 48
> > > > > > ++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 13 +++++++
> > > > > >  2 files changed, 61 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > index fee22358cc09..7aaf669cf5fc 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >  #include <drm/drm_file.h>
> > > > > >  #include <uapi/drm/xe_drm.h>
> > > > > >  
> > > > > > +#include "xe_dep_scheduler.h"
> > > > > >  #include "xe_device.h"
> > > > > >  #include "xe_gt.h"
> > > > > >  #include "xe_hw_engine_class_sysfs.h"
> > > > > > @@ -39,6 +40,12 @@ static int
> > > > > > exec_queue_user_extensions(struct
> > > > > > xe_device *xe, struct xe_exec_queue
> > > > > >  
> > > > > >  static void __xe_exec_queue_free(struct xe_exec_queue *q)
> > > > > >  {
> > > > > > +       int i;
> > > > > > +
> > > > > > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
> > > > > > +               if (q->tlb_inval[i].dep_scheduler)
> > > > > > +                       xe_dep_scheduler_fini(q-
> > > > > > > tlb_inval[i].dep_scheduler);
> > > > > > +
> > > > > >         if (xe_exec_queue_uses_pxp(q))
> > > > > >                 xe_pxp_exec_queue_remove(gt_to_xe(q->gt)-
> > > > > > >pxp,
> > > > > > q);
> > > > > >         if (q->vm)
> > > > > > @@ -50,6 +57,39 @@ static void __xe_exec_queue_free(struct
> > > > > > xe_exec_queue *q)
> > > > > >         kfree(q);
> > > > > >  }
> > > > > >  
> > > > > > +static int alloc_dep_schedulers(struct xe_device *xe, struct
> > > > > > xe_exec_queue *q)
> > > > > > +{
> > > > > > +       struct xe_tile *tile = gt_to_tile(q->gt);
> > > > > > +       int i;
> > > > > > +
> > > > > > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
> > > > > > +               struct xe_dep_scheduler *dep_scheduler;
> > > > > > +               struct xe_gt *gt;
> > > > > > +               struct workqueue_struct *wq;
> > > > > > +
> > > > > > +               if (i == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
> > > > > > +                       gt = tile->primary_gt;
> > > > > > +               else
> > > > > > +                       gt = tile->media_gt;
> > > > > > +
> > > > > > +               if (!gt)
> > > > > > +                       continue;
> > > > > > +
> > > > > > +               wq = gt->tlb_invalidation.job_wq;
> > > > > > +
> > > > > > +#define MAX_TLB_INVAL_JOBS     16      /* Picking a
> > > > > > reasonable
> > > > > > value
> > > > > > */
> > > > > 
> > > > > So if we exceed tihs number, that means we won't get an
> > > > > invalidation of
> > > > > that range before a context switch to a new queue?
> > 
> > Sorry missed this.
> > 
> > No. This is just maximum number of TLB invalidations, on this queue,
> > which can be inflight to the hardware at once. If MAX_TLB_INVAL_JOBS
> > is
> > exceeded, the scheduler just holds jobs until prior onces complete
> > and
> > more job credits become available.
> > 
> > Context switching or other queues are not really related here. Think
> > of
> > this a FIFO in which only MAX_TLB_INVAL_JOBS can be outstanding at
> > time.
> 
> Got it. So basically summarizing, if I were to submit 17 TLB
> invalidations at once (before hardware completed any one of those)
> theoretically, followed by a submission from userspace on a new
> context, the scheduler would still accept these, but would only submit
> the first 16 to hardware. It would then submit the 17th once a hardware
> slot became available, then finally that new user context. Is that
> right?

Yes, exactly. TLB invalidations from a bind or unbind resolve to a
fence, which is installed in the dma-resv slots and returned to users
via sync objects. The dma-resv slots are used to ensure that KMD-issued
binds are complete before scheduling a user submission. Meanwhile, the
user should use the output DRM syncobj from a bind/unbind as input to a
submission if there is a dependency.

This is all part of the existing flow—this series only changes how TLB
invalidations are scheduled and how the fences are generated.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > > > 
> > > > > > +               dep_scheduler = xe_dep_scheduler_create(xe,
> > > > > > wq,
> > > > > > q-
> > > > > > > name,
> > > > > > +                                                       MAX_T
> > > > > > LB_I
> > > > > > NVAL
> > > > > > _JOBS);
> > > > > > +               if (IS_ERR(dep_scheduler))
> > > > > > +                       return PTR_ERR(dep_scheduler);
> > > > > > +
> > > > > > +               q->tlb_inval[i].dep_scheduler =
> > > > > > dep_scheduler;
> > > > > > +       }
> > > > > > +#undef MAX_TLB_INVAL_JOBS
> > > > > > +
> > > > > > +       return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static struct xe_exec_queue *__xe_exec_queue_alloc(struct
> > > > > > xe_device
> > > > > > *xe,
> > > > > >                                                    struct
> > > > > > xe_vm
> > > > > > *vm,
> > > > > >                                                    u32
> > > > > > logical_mask,
> > > > > > @@ -94,6 +134,14 @@ static struct xe_exec_queue
> > > > > > *__xe_exec_queue_alloc(struct xe_device *xe,
> > > > > >         else
> > > > > >                 q->sched_props.priority =
> > > > > > XE_EXEC_QUEUE_PRIORITY_NORMAL;
> > > > > 
> > > > > We want these to be high priority right? I.e. if another user
> > > > > creates a
> > > > > queue and submits at high priority can we get stale data on
> > > > > those
> > > > > executions if this one is blocked behind that high priority
> > > > > one?
> > > > 
> > > > I'm struggling with exactly what you are asking here.
> > > > 
> > > > The q->sched_props.priority is priority of exec queue being
> > > > created
> > > > and is existing code. In the case of bind queues (i.e., ones that
> > > > call alloc_dep_schedulers) this maps to priority of the GuC
> > > > context
> > > > which runs bind jobs on a hardware copy engine. 
> > > > 
> > > > dep_schedulers do not have priority, at least that is used in any
> > > > way.
> > > > This is just software queue which runs TLB invalidations once the
> > > > bind
> > > > jobs complete.
> > > > 
> > > > wrt high priority passing lower priority ones, that isn't
> > > > possible if
> > > > there is a dependency chain. The driver holds any jobs in the KMD
> > > > until
> > > > all dependecies are resolved - high priority queues just get
> > > > serviced
> > > > by
> > > > the GuC over low priority queues if both queues have runnable
> > > > jobs.
> > > > 
> > > > TL;DR nothing is patch changes anything wrt to priorities.
> > > 
> > > You're right I think I read this wrong somehow :(, ignore my
> > > comment!
> > > 
> > > Still the minor question above about the max number of dependency
> > > jobs
> > > when you have time.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > >  
> > > > > > +       if (q->flags & (EXEC_QUEUE_FLAG_MIGRATE |
> > > > > > EXEC_QUEUE_FLAG_VM)) {
> > > > > > +               err = alloc_dep_schedulers(xe, q);
> > > > > > +               if (err) {
> > > > > > +                       __xe_exec_queue_free(q);
> > > > > > +                       return ERR_PTR(err);
> > > > > > +               }
> > > > > > +       }
> > > > > > +
> > > > > >         if (vm)
> > > > > >                 q->vm = xe_vm_get(vm);
> > > > > >  
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > index abdf4a57e6e2..ba443a497b38 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > @@ -134,6 +134,19 @@ struct xe_exec_queue {
> > > > > >                 struct list_head link;
> > > > > >         } lr;
> > > > > >  
> > > > > > +#define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT     0
> > > > > > +#define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT       1
> > > > > > +#define
> > > > > > XE_EXEC_QUEUE_TLB_INVAL_COUNT          (XE_EXEC_QUEUE_TLB_INV
> > > > > > AL_M
> > > > > > EDIA
> > > > > > _GT  + 1)
> > > > > > +
> > > > > > +       /** @tlb_inval: TLB invalidations exec queue state */
> > > > > > +       struct {
> > > > > > +               /**
> > > > > > +                * @tlb_inval.dep_scheduler: The TLB
> > > > > > invalidation
> > > > > > +                * dependency scheduler
> > > > > > +                */
> > > > > > +               struct xe_dep_scheduler *dep_scheduler;
> > > > > > +       } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> > > > > > +
> > > > > >         /** @pxp: PXP info tracking */
> > > > > >         struct {
> > > > > >                 /** @pxp.type: PXP session type used by this
> > > > > > queue */
> > > > > 
> > > 
> 
