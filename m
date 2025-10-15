Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC7ACCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195CC10E766;
	Wed, 15 Oct 2025 09:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJ8MBK3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762A410E766
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519991; x=1792055991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3jIAsCBEIshjLRqPpNXbROO7zeXCv9y48RXixtQ6yRk=;
 b=eJ8MBK3CNhG2waXB5B45c4ABq2X1PCB+C2RQB6OPeNnhRavy3rlF6Dk3
 FhjUbwM5NFghCkiGll5IAqdro1n9Mwu4XFtTHd2MoaWctAOuyzZX0vXzF
 zVLILFrcFK08Hes3VWogrEPvXxKpgQufEyCTc1n4u0EjsiYaxzSA2CGKJ
 Jdbx6HZtVRnIX57t4uEOG+8lnr8iBQQdDErHj+JX07OOEL5DhoMIdicsp
 3uOgz8NvqS0FdiYj2usOsWVDrl4lA0eqS6G+pwJkD99xuqn356lGUyfDm
 zZuZMl1R0XBhLDT1IkHYwsi0kwNS/L3RBrEf3pIwbVvSKlA7dutVtg9Xb g==;
X-CSE-ConnectionGUID: AS0J++C4TVKdFj4yXNfPOA==
X-CSE-MsgGUID: vOz4AL8WSEmlRAFDvMy56Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62584623"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62584623"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:19:41 -0700
X-CSE-ConnectionGUID: RBV8VwVoQ0yCvlb3EbEyjw==
X-CSE-MsgGUID: g76SoT5WT5WFrFIeKvVW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186131046"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:19:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:19:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 02:19:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9W/Tu5RW1k5bi2M1wBSEfqp2Y2QFUWnV8RJ7/UZ+jx7laOWgmN8/q95ZFlxOOqo3LEE1MjCu+T3/bRDGWeHO3pBr6N3d/2orEaQ3olnrZKBNS/o9ScATBZ3bnJ+ItOuwwqoZxxKh1xOuXJJBWMe/LG0wrTfx/VpMLurRIl1nV5YKe9RBkHpKBDWWfFbrbdyVevHfRDfir8FKvwBsdPa4nwDhrj6hM8hqGMwz+Iqcr7hrXYNuABReJN3TJe/YGN3RUGw2yxhhWxI6ukpMoor40kDq7DTjVgurQp48iG2kGGOspqdLzGUwa8G73sWQAG4n8BtfxvXtgX6bMI3nzMNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtUXVPrEIv3F3hmaTEg9jhuYegk4I7xpq1c4TI1qAek=;
 b=M2cs/7sxmCFaH2eqPOCkBvVx0UC2QJfaT/DXMNPDykvr3jXqEKpnxTwIwwwW+t63bNVt+ng/7v1Oj65t/3fp7xUaDJHkaCC2pGNzbgDwH1BLVJKrhGCJcqJ80rjAuUcwEXSdtGsiK96yHx85+d+V/aNBKaL4YmZeXJZocuLeayF++OVKv4n6oONrjlQKcrVuTsnmVBRYKSaiZ76LGJ4IUfSIoTgKt4v8p8UJD/IF3ywUm/+4TEUtViXDo7j3BZcV8oJA8A/c6Tnn+UeMEqkZLBLnNtTQM9JNKzDUEuPcF2FCH0iJFMllXQiasdrTkUrc5CpvuAWc30t1x0NQetZvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS4PPF30373102B.namprd11.prod.outlook.com (2603:10b6:f:fc02::1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 09:19:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 09:19:33 +0000
Date: Wed, 15 Oct 2025 14:49:26 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <aO9nHrXJWGXcSDiB@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
 <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
 <20251014165211.GR5409@mdroper-desk1.amr.corp.intel.com>
 <77ur4jy56xcjokgp7eko7eckv4y5gfacuqlzgksafo4dmwufxt@ashhsxth75vx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <77ur4jy56xcjokgp7eko7eckv4y5gfacuqlzgksafo4dmwufxt@ashhsxth75vx>
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS4PPF30373102B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8b38c4-cc33-4f3d-6d4d-08de0bcbf3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bldjK3cvVkcxN09XVGpSOEhnOU1CTHB4ZUo4b2JTMER4UVl5Rm84SlFhaitE?=
 =?utf-8?B?MjcrKzJ2WnpXTm1iVVIvS1NpdlZxZ0hxSUhiVEN1ejZSajc5MDdrT3JBOWhq?=
 =?utf-8?B?TkpCVTBFWktWa3drbG9sdUlJT1pUQUtlWTRVcjF2WUZNcUF2Vmx5dmlCVm9q?=
 =?utf-8?B?cDhmMTJEaFVNZHZuMVhoU0RTWWVwS0xEenJxem4zdkVybGtBc2J2aFI2bTRv?=
 =?utf-8?B?cWx0aGowVnNqTUNIVkdTei9acnNtN3B4U0NVbDViVFNpeWl3UlB6RGY3Tkxh?=
 =?utf-8?B?UHgrNzV5QWRST1FFbDlMdUJCUG0vZE5BMUFQRzFrSFROc0tLN0RLbFllQ3Fa?=
 =?utf-8?B?TU1tT2puT0RUK3lGd0EvaGx1MjlLcGllQlJtWTg3M1p6STcwdjBndGtkeTRm?=
 =?utf-8?B?V2tPNjI5T2t5UkgyUFJOOU4yVU5pK2JLQW9IT1Vqc05wWUdEbnRBdk8wZjBh?=
 =?utf-8?B?bEY2TDJNRWdWdGF6N01uN1NRVWdaQmlWbTkwMzcxeFVuOTFxbkU3amZzdVRp?=
 =?utf-8?B?d3ExMW1ub2FrL1FNSlNqWGJNZzZqMDBFVU1OVlM2NWxyejNZekc5d0phRXQz?=
 =?utf-8?B?NTE4OC9sU0RjSzNqa0UwQjVjU2xnWFY2MWZJaUdPVnNHMFNCaklabE9UU2xp?=
 =?utf-8?B?Q2svbHdsTE1nRnYxRm9PeDAvVmExVGhwenZHTXJOcFB0WUxhRVBWTnlkZjEr?=
 =?utf-8?B?dDg5NExZZ0VxZmFwUUl1ZTJabElnMzFwNStnaGlJVWtXV3VuYmUvems4cDZM?=
 =?utf-8?B?cnRBc2xsS1pwOE9SQ3IzZ3ZqWm1LZ3h2ZElOaVFTWjEvUk1zT05MaG5rMVhP?=
 =?utf-8?B?L3EvSUMwNXF5M1IrQW9hQkhNWUlCRVZwVERjOXh6b2tUb3JldVdyTmd4WGZm?=
 =?utf-8?B?T015VytIWFVLMHhSK1krWFJzajFuOWlpVnVVd3prbVY1OU5vQ1phaVM4R21m?=
 =?utf-8?B?a1B2YlB5TVR6bTJRbVl0S1hzNDNSbERzbmg1NkVTRXAvNFQ4N0dLL3NDWW5I?=
 =?utf-8?B?cjl5WDYwN1MxbmVZbEZSQ3Awc1ZhQjZybGFsSFpsV04rU2dMa3BpQXpGMHRF?=
 =?utf-8?B?TTBRaWh5MWprblJITkdGbWVWeFg2SERCUk5PaHZZTy8zQ1lReFZHYWdjZ2dM?=
 =?utf-8?B?dDdkckZ1a1dnQW1GVkc0YzF1aU1rZFJwZ1M1ZmgzQnpzRVdBSWlzU3phZ0NF?=
 =?utf-8?B?cmd6K0huVUlYeVVzZ3pENFBBYVJKeDJrZlh2eUsvUzZOaUNIL1U1TTZ0WHA0?=
 =?utf-8?B?amRJY242OE56MFFINUpuVzNxRzJwT1VhbUxaaHpvTG84YlZlWks2aDNUcVVO?=
 =?utf-8?B?c3NrMTFIYXVEV2NzbXpjS3hpUWFpTlVYZFhwLzFsMkhqYlloc3FqSjZIQ3A5?=
 =?utf-8?B?Qy96NDJ3cUZrcWpzNllhVkhWVHRKeXlQWlpRakVuZFU4NGhtMnliaU96OFoz?=
 =?utf-8?B?bi9GcU1VSFIyRGxyMVlidVh5RjVnZktrc3pmUTB2RHlVSTQ0ZXRCdzZKeEd3?=
 =?utf-8?B?b0kvbGR2TTJpNzBHQVVJQm9nK1hiYTQ0MnE4YnZ2NEhJOHF2UDlxZGRjeldO?=
 =?utf-8?B?c1dIOWNTUTZNOG5jVjJuMTUyMEw5MVBabUxHTWxSblRUb3B2VmpDVVhPcENu?=
 =?utf-8?B?bERRQi9sNzVkTytOcUM4R24raU1WWlJyUXdaS1RyVkovQTNyek9NVDZOZlZi?=
 =?utf-8?B?Z08rOVAwVitTazI1K1N0cHZoR2MwdCs5Q1pXeSsvRTNyaEF5MGoycnVsZWNJ?=
 =?utf-8?B?dDU4L1dGdWNFVzVjQXRNRFR3N3RLNGR3TlA4RnpxUTRGRXU2WiszYWhCdERY?=
 =?utf-8?B?bmRlNEZkcVVobks5b0k1V0YrVXlVTlUzZk91R0w2MFRnbFZ3TjdyOVdjOUZK?=
 =?utf-8?B?S3NEcnJoVWRxWnArS1JhQWoxUWJOd2o1MUhNMTVxU3N2c252a2R5aDNCMzV4?=
 =?utf-8?Q?iRtxjmQcAXiHtDtPgbwy898pbtoZEeQP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFI2dHd0WnRpTjgyL0g3RWNtYXFabVNjekZxS1phSGZDWkZ2Nk9HSW9uLzBM?=
 =?utf-8?B?aFVGYjNtbytLWVRkbEJ5a2gzdDJLRkh5cllsMTcrY1BYaCtwTmZFZklLNVNj?=
 =?utf-8?B?ZnlCQ0doanMzaHpDQjNaazRFT3ovbmcyUUVQZGkvSm1KOXMvVVB3WUpMYVFl?=
 =?utf-8?B?ZE1nN2pYcVhTanp3VlFYMTVQa0t3M1hKQ09YR2QvQk5NaFlKWjN6ZE5WY0tK?=
 =?utf-8?B?UG5RbndzNkZqVHJSeU1Md3k3bUNqYjd2MGRldyt1RHJrNmFJdFhKemlka0Q2?=
 =?utf-8?B?S0NkcCtuLzM2SG42ampGTHdiN3ZERTMwTm1aUGtzQlRWcVVLbzFVbXFBNUsw?=
 =?utf-8?B?ZFYvNWxzZE9laFlYOTJMV1VaQ0VNdFJJMDUwYnNzQm5JMmpSbkFJZks3MlpZ?=
 =?utf-8?B?TVpCM0Q1OHZOdU0zcGN5bVY0K3h1T3J0TzBGN3YwTVFOUEkzWDFDQnJxQTNy?=
 =?utf-8?B?Tm15ZDk2MVk4eDJvRityaU5oazVBU2Y1bDV2ZUV6RURjdDVaZmthbUFUVlRW?=
 =?utf-8?B?TGpZVHJGeGc5S2E3Q3JLNjBLRklNOTVvTXRlUldhR0VWQk8xaC9ORW1nUWdj?=
 =?utf-8?B?T08wZkhxV2pJNDZzQS9ERURUeGNiVm91UitScXhuSXRZdkd2NXo5RWx2TVBZ?=
 =?utf-8?B?QUtFOXd0M2JobXQrclhQNHVYcURvV1U4UEpwRmJoQmtrbjd0VDRzUkp4bk1j?=
 =?utf-8?B?eStBdzZXWUJWV0NKUXlyYTkrZWYyOWZMRkVwSXpuTHVseE9BTW5zbXdBSk9Y?=
 =?utf-8?B?TEdhVWxvdnYraDJUbXBlUmZSaW9nbzZpTkR3RGNBVmlsSlBsUXAxbnVnSktY?=
 =?utf-8?B?dUlsM0ZiaFN5ZFJia25QRHllV0tLY0x1U3lhQllVdUZpUXU5aDVLeWNsSnFz?=
 =?utf-8?B?OG1SRmhIdkV4S3k3SzZKcVFUU1g3ck5vK0hEcHM5cVZnajd0SzU3akcyWU5w?=
 =?utf-8?B?VFIrTERMMFZRTit2cjdnTXQ1M09vd1lxVFVGb1B3NWd1M3I1TDlFNGErVjJa?=
 =?utf-8?B?OVYyMGZWZnZSU1dzZ29lZXBTL05xTVM3Z0NWNDhLUUhTMUN2aEkwMHQ3ekRs?=
 =?utf-8?B?dGlJaXdnSUFlbVFoaHVWOS9GUE5ld0t3dnVES0x3MWpyd0dhWkhON29xZ2Jh?=
 =?utf-8?B?b2IxdEtMdVNNdHY2STRkRnpTQTN3VzhWbm8xTkdYekI2Q1hYTW1neEdmMTds?=
 =?utf-8?B?L1J3aEZROGZtREZ0SlduRW1zMEFycHZiVjNuaUxHbHZsTjhaSDdNNmVCK1dl?=
 =?utf-8?B?bjJvMVA2amQwVlVsOFdHZWc1Z3Yrd1cyMVRUQ2hUUDJkR3lNdE9wbUI4cy9U?=
 =?utf-8?B?RWJnQTZjeEFUYVg5bm52cU9laWc2YndYYnlzZ3BrRmRFck05RzZxVFZNWjRM?=
 =?utf-8?B?clJPWTcvTnNLK2pMaVI2aFFyV3hmR2pIZDR0SmxVWGJqeFpPNDNsK1dndHRQ?=
 =?utf-8?B?TnpSQmVTNy8xMXEvSi9nN0pURng4d0U2eVZoTUpkd2tMaTRiUzIxVVo4NUhn?=
 =?utf-8?B?M1ltMXRDOWZBb3ZiTXFJNWpUMTJmRVlTSmdaWGUxVlkvcWZkSXJWL2pveEdV?=
 =?utf-8?B?YWZhZlZEL0NIMEd1WnREU1JiUC8xWTgxc3U5cURuNU4yZXd6ajZFekk2TWRV?=
 =?utf-8?B?Znp6Q3VzVTZ2WWVTdDNJTEhaL3VxOG1QMTNIVk9ZMEpvNjA5MElPWVo5aUM0?=
 =?utf-8?B?T1o3cG5rNlRZV21hampDKzlkVHpuK3lPdDVwcUE2Z3Q5Smk2WFNxTnI4LzlY?=
 =?utf-8?B?NExVdFN0dCsxaERLZmhOclN5NjlzZSszKzUralVkaDBJTS9BWFBFZExMcG05?=
 =?utf-8?B?MGtqbk9WS3prM2RkNldTOGh2NzFuMjl1L3BqNDY2UGxuOHZleXp2NXlsY1Vy?=
 =?utf-8?B?SUVmdldmaHI3QW9HOGd6MUVBV0JjMHRONkVKL2pleUVaWTRBYzVMVVJGNGQ0?=
 =?utf-8?B?TkR5ZkphNGlmOUxMbEd4em5GdWkxZEkyTVBnRnY5eXJJNlMweTJxaHR3K2NS?=
 =?utf-8?B?UWpaWWxEK3RreVdVa3UvU25SRzYvYy9QYUhrc3VMcm5lZFcwd01ldlBGSjBU?=
 =?utf-8?B?cUV5c1BYbXZmSlVkZ2hwSFVWVDl2R0h6a3o2cmNLNEhrQW1TMUlvU0NIR2dr?=
 =?utf-8?B?RGMwbFNlcWZyRitKVUppQUwvT0M4cjNvLzA1UVh5dWxCemlBdFp1Z3lvYVFr?=
 =?utf-8?Q?KihpGkwGhjNKIK/9oUqP/As=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b38c4-cc33-4f3d-6d4d-08de0bcbf3f7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:19:33.4372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjB2gRDGRC+aPWMXx4RAAhmPImFMlXrtNudaAArQ2cBf7slbBlPBpJrkgLTo7AJFNzUjpKatOXZiuyW/sVaG2MVj/3+RV+VrFJrQ6f400JK1UWrjhdqOd7nMIz/eV6wj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF30373102B
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

On 14.10.2025 22:41, Lucas De Marchi wrote:
> On Tue, Oct 14, 2025 at 09:52:11AM -0700, Matt Roper wrote:
> > On Tue, Oct 14, 2025 at 05:28:48PM +0530, Shekhar Chauhan wrote:
> > > 
> > > On 10/14/2025 8:54, Lucas De Marchi wrote:
> > > > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > >
> > > > CTC_MODE register is removed by Xe3p.  Stop reading that register on
> > > > Xe3p and later platforms.
> > > >
> > > > Bspec: 62395
> > > 
> > > Again, maybe I'm referencing the Bspec in a wrong way, but I do see this
> > > register existing for IP 35. Maybe a possible tagging issue in the Bspec?
> > > Can someone comment here, if I'm missing something.
> > 
> > So looking a bit closer based on your comment, I think maybe this should
> > actually be a GRAPHICS_VER() test rather than a GT_VER() test.  It gets
> > a bit confusing since the bspec website still tries to print stuff out
> > in a platform-based manner, which makes it hard to follow exactly which
> > IP versions and GTs are actually relevant.  In this case the first
> > REMOVEDBY() tag listed is what documents the removal of the CTC_MODE
> > register, but it appears that tag only applies to primary GT; the media
> > GT is not included by the change referenced.  And then if you look
> > through the jumble of platform names that come after that, it does
> > indeed appear that media is still listed as having the register, but the
> > primary GT no longer appears in the list for platforms with Xe3p IP.
> > 
> > So maybe this is another case where we should be using GRAPHICS_VER
> > instead of GT_VER.  I'm not sure it really matters too much though since
> > we don't actually use the register for anything, except to complain
> > about a condition we expect to never show up.
> 
> maybe at this point we should just drop the entire thing?
> It's not supported for xe2/xe3, it's dropped for xe3p. It's supported
> for unofficially supported platforms, but we don't really know what to
> do in that case.
> 
> So I think it'd be safe to just drop the entire function and now worry
> about what is the exact gt version. Thoughts?

+1 from me to complete remove it.

Regards,
Bala

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > -shekhar
> > > 
> > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > index 4f011d1573c65..26052710be8a7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
> > > >   static void check_ctc_mode(struct xe_gt *gt)
> > > >   {
> > > > +	/* CTC_MODE register is removed by Xe3p */
> > > > +	if (GT_VER(gt) >= 35)
> > > > +		return;
> > > > +
> > > >   	/*
> > > >   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> > > >   	 * platforms.  In theory it could be a valid setting for pre-Xe2
> > > >
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
