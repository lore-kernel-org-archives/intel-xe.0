Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89583D4335B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 23:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2C110E037;
	Thu, 11 Dec 2025 23:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTeEjoif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640810E037
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 23:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765494483; x=1797030483;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AxS9RpnrztTqbWI+n5rjPr6CNi1OczN3rInPvGcV/m4=;
 b=lTeEjoifqlhaGeXyGoCZZDp+1nylLi5Sqcrn9qqDexrbfQYGF2hGpJon
 MIO5lCWWHFamCk6p0Qvqp+0rpsdM8f/QfPLmLvvzCeW3LiSVCZRmSfibx
 ObcAV5T6V/kglwuYxpOyXbyuvD58p+ztb2NZh34kS+nUdG0WO7QReRxqD
 Wp/OXKazrOmxFUaG63EEBNsKoQkP+lS5PZ54qyNu5q6PjVixUqdrllSS0
 FZT60+xp3EDJ5h9paq64bn5dSbo8JhOKGgF2NkdKVpGnS+9+w9gD718sM
 E12gwyM72SaEbLoSgsFVca9G0fniyUAK93l1DXL/zDtMZZR4UU6V/Vb3N w==;
X-CSE-ConnectionGUID: yHl99FRaS3SO9l7nYZ/ncA==
X-CSE-MsgGUID: Lo/wEbQKScOm7Sm8e1vG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78950070"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78950070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:08:03 -0800
X-CSE-ConnectionGUID: dVDe1cuzSVeutArpova0yA==
X-CSE-MsgGUID: O2uGPcMfQACMUSxwVtNtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196696918"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:08:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:07:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 15:07:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:07:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgNiowbdlXPVqJPvYlrapnyXwl3hrLkA4HHDx7074mr08zPfHRRpjALRwCo+ipHAM8QqtkVwdy9TZFc17pDTw09J1XP+MLRGSrWAlceNTCpfE5c/i2ZGm4DUTIuC75/oKoz8AmNEy+KXGVVO6pZ04141S3SOvdEuATSWWi8nb2ze+PRq7M2JD6TdiwNcXOcgw1MAVU4M6rsdca4rSSsNMbVbqYTDy2LU5aKWVeDM6/ZVzQHpGR4LVahCcmsh+KNu1vnGEdFPd8rBW9HSJfEJXrLuQD0IDIrRYHp8cRodhC1zyPHRuIY3TudZzTBz2c3SboLMIQotr7g4+AbnQ8MaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVhTZrnbn53bfExIWEf5+GBQJdx3TZ+YUYUp5Xrwdvw=;
 b=vQvuk9DId6O9pg93BRkFo4X8Q4y5Iq6XrxnFGu88zGBtg5Fs8gWLp5zTjGEjX5smzNhUl8fO+2ileiHFLXB1BbsnkEFGsCi3707fm/pO5ZzJojSXHge/TNsdiKDrcgv3lLbDnSWb2WNYXpSypvsEDRNceabRKkZiuzyYy6JeMrRk8RCLeuhrADbOA5TKKUWVAV1loI3YX/ldtjqxARavoyvEx/YBkQfz/6knMXyDVJQghgzNAyZb2F4z2BLxhWjxzPPPN0GDHpDUU2Zv2H1HWNd/bdRpK00wbG5IBu65f2TJvpeqSVWNyS6WkmqTZ0mOpjQxjtTbxNrsz1bj5632pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB7120.namprd11.prod.outlook.com (2603:10b6:510:214::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 23:07:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 23:07:51 +0000
Message-ID: <efd62943-b61a-4829-9af9-e2e1dd46717d@intel.com>
Date: Fri, 12 Dec 2025 00:07:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-26-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-26-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbe77da-7b0d-465c-2475-08de390a1bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2t2SVUzMGxlMlRBWWxnRUVXRXlhalJKSmhqNG5zQVI1Zmd1RzVhbXg3cGwv?=
 =?utf-8?B?c0s4Q2ZKUURNZ1lkNTNxUyt0eG9uZVM3aWlmZWMwUzVqcW9zcXhWYmEyRE9q?=
 =?utf-8?B?SjNSTnp4MkZkRGtBR1JXZzZCdEZreU5rYlJSK3pMWVZFQkgxSmlIa0tCQmNs?=
 =?utf-8?B?QTFIZWVUU2Ixc2l1T3JWSk4yZmsxWWczcmV4QTVaRExxd0MzRmkyQ0Vyd0Z3?=
 =?utf-8?B?MitrckU2VnlIWFNlMHFIeWFWZHM2R1lvSUF3elNndXpHLzk2bXp0SC9FUHdx?=
 =?utf-8?B?dWZvSFhYT3YrQUxGWHFIS3RZdDJZOXh6d2NQVnoxWXpKR0dtaHRGaWZSc0kv?=
 =?utf-8?B?MWlsYlBtOWo5RGtnOUdHcmJsY0hHTTBTeGpCRXNCek9kbjFDdmcwRGI1akhJ?=
 =?utf-8?B?bkZtVjdTaGd2U2FJbHlub1owNkFDN3hpV3pGRW1pUHhzdXJ1Z2wvRDFCaWJp?=
 =?utf-8?B?cElPSkRjSFI5QlVUdTJaWEthaURVVXg5b1h6V1lVYUgvNGZvM2E1NFBxR3Bi?=
 =?utf-8?B?UGVrd0kwT3hzK1UvWGpseW9VUjNiNUlyT0tyTmNoSFlJL2puaStlRHA4NWVk?=
 =?utf-8?B?MjZxbzN3MHlHNHdSeHRrZWEyQ2ZjREwyRnJYaEppTko1d054bmR1bUVFZE1P?=
 =?utf-8?B?VUdoeVBEbW5DTDhpSFFtMHB0WWZ2b0tvTlY2WTE0ZEpOMG5sNTBkaGtQbE0z?=
 =?utf-8?B?RENOZUpiUkgvbFNHaStLaVltMEkzTG5HZDQwNmNuOVBBYlRvTHVDek51d1pD?=
 =?utf-8?B?bjYvNVNOVmRlWnh3VGx0alNtMWlOb2lUbklqVVc1anE0OXZIZE5rSCtRckxT?=
 =?utf-8?B?WVF3SzFpM2J4M0VENVlvNEdGRlRCYU9TU0NXWHZqSzZBTi9DZDZRODBERVkr?=
 =?utf-8?B?dHRtZVA5ZUFXL01CeDlqK2dXQ3piQ2lSS2o5RUR2T1BuYkNVcFI3em5qbC9j?=
 =?utf-8?B?VDFvZVJCRXFZSGJmNkpidnlFSzBGM1hIN3d6UUxhOVJzWm9IVlZFRUMwK2Q0?=
 =?utf-8?B?VlRSL2VtejlOS1VaVHJrTkJkZ1g1cDBUQklqYWpQMm9CdmZPOVVMMnY0MFFx?=
 =?utf-8?B?RFlnRTlKV1NxNWZGMDJCTnJXTUpwcllxWjdxeHZtbVlhclU3NFNscWpQOTRY?=
 =?utf-8?B?ajM3OVVKRnNXcE44S3JFdzlER0UvL3A4d0ZZUXpVMG9Yck82SFh0Tkxxd2kx?=
 =?utf-8?B?enpjbzVqcTY2NklxNXNnWFZITGNNM0x0amxBaFY4L2dZOHhTQW1oTmpCdDIx?=
 =?utf-8?B?a2xPdUhPZlExUFUrQ1IvTndGUXhJblRLU29wOEY2eUMzakU3UFlETmNkMTRr?=
 =?utf-8?B?aS9iNjJmTVlNN1g3KzZHdnliNFNUTlZJSzZGa01aRU9HTjlUMHNJU1FNZHdM?=
 =?utf-8?B?cisvT2ZZdnYrUnJCNFdMOCtxK21SUEQyME4vZ0JuekU2WWNGQnY0SldmNS9u?=
 =?utf-8?B?bEFSMGFrVCtMRG1MTDNKZlRnb0JNQzNweFVtMmVKYkpsK2tKLzJOZHlSeHB6?=
 =?utf-8?B?YmlNTElKNzJvN0s0NmZ1SnRLWkEwRisxby8vV1ZxNmlXMExIQ0tJVDBoaTJ5?=
 =?utf-8?B?S0tsWE1TdFpnd2lUdmFiZUJERFpIZTNZTUtablFDSXIwV3VGdzRuNkljWjhP?=
 =?utf-8?B?MWlxR3kwRGoxcmY1N0xRL0ZuWit3NTZwemp0MDdPdnlqaGozU25udUdGeldL?=
 =?utf-8?B?S1A2ZjRDQjlSRnBaRkx5dENid2xXVEpHeit1V3d1dTlHeU1FRFd2a2MxMmtZ?=
 =?utf-8?B?SVRwbDNaU0NTamhWZTVQSWtHMGpsd3VOUHYwVzRIeTVNeFlTRG9Fdzh5L1o5?=
 =?utf-8?B?QStiU3NzcEdrWDhpODZNc2NBWjVNR2JBUlV2Q0FFTlRDVUhiTmozKzU2ZUJI?=
 =?utf-8?B?NVVDVFUrSmdtaXRzRGt2dnhwaHlzRXRWQkNIZGFMVUpnNEcySnNCWG5FWmxL?=
 =?utf-8?Q?4JMUx3RZsj6q+uBgvUG0DBJogiPyD94Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NKTm1WQnY0TzMwYXNsajdOUHd0UWRHNXlYYTRjWjROLzVQeW1rendjNHF6?=
 =?utf-8?B?eGdzZWpkMGFzdk5DMXQyaVIzK1RBUmpWQ3hvL1dzSmgvckxCd2o4dEZzTC9j?=
 =?utf-8?B?eE90cDJyTTBYRExCWjRMRnczblJjRjVsYzNCendNM3NuRlQ5bDF6Tk1DTzJn?=
 =?utf-8?B?VXliTWtZTzdrbHZsMFR3bFBkdmJ4c1libFdhN2tERHI2NU0xSGpEWGh2VDEv?=
 =?utf-8?B?RGExMUxvelRJRmVyOWxwUkVZRWJaMmJxZHlQSjFLVzVoT0NFR3gzWUViSVVI?=
 =?utf-8?B?YWQ2NzRyZlFuZFhGYVVRUXBad0ptMVlXUlV2RmVlTGk3RG1HazF1N09IK1gr?=
 =?utf-8?B?NTREekJ4RHY2WC9pZDZqUXAxcUYxQjE3NEM4OWdYeWlYdWxRNTNaRkc5TGF4?=
 =?utf-8?B?MHVCdGdDTVJXTjQwYnU1UzlYbWxETk8vRVppazZmTVA1L2tZQ2dQdiswcE1t?=
 =?utf-8?B?Smp0WnlMVlk1YlVKUWFaMXBKdno1bFBCTlkwZlk5cU9TOWpHTXl1K1BOcFZk?=
 =?utf-8?B?ZDNZMkwxSXZJUjB1OXNxMmw1K3hYZmliTVFteE9JVEJuM3VUeGtyZDZ0NS94?=
 =?utf-8?B?Ly9XakQ1dUdYMWR1YzNqdW1BbUEwNndKQzhJRGlyRXp1Nmd2cU4wYlYyMHl5?=
 =?utf-8?B?ZnhwYzRxcldxSDd5Q2NlREh5QlZyVzliMndaRUttU241eW5QN05VS1FnQTEz?=
 =?utf-8?B?TlE2OHBicHJxcFlha2JLMVZqWXRvbmx1ci94NjdFSWZpL2xGTWxtMm1Jd1ky?=
 =?utf-8?B?R3h3c3orRmp3bzBjUkhxUkxYVXBMYzBpV3ZzMVJya29UMTBqcDZWblBud3cr?=
 =?utf-8?B?TnRva2RhdHZQR2RQbk9GNm9ueE5ENllpVUwvRXJVZEhiU2tEcEpZekVua0xj?=
 =?utf-8?B?OTF2azJieDMrU0RrUG9qNXdCZEQxZWJpVmhDNGpST1A5aVpPRUJqc0txQ3pH?=
 =?utf-8?B?bzFXaUVNalRqWENvL0dWR0dxd2lCbEtDeGVnenVKZUlCOW1SS0ZHK2xJNVM2?=
 =?utf-8?B?dy9VUmFQMlMvLzBVbUJ6ZjRJYm9OeGJwOExOTDg1cVRHc2lwa3FER2ZqenE4?=
 =?utf-8?B?RVRsV3IxcjFJT3BJMDRaZ0ZUbHJOSXBQamZYL0pURXlGbXZzVFhmZU93RGxF?=
 =?utf-8?B?bUFuUDZOaGFHNEUwWUh1MHNYVkNaMUpnZHVDbEdtQktwYkszRGxNS2liVE1O?=
 =?utf-8?B?Z2NYZ3JZY1pjRlNXdHliOTZibk1FKzdyUkM0SjVyYUc4b08yTGdMbzlBOTF4?=
 =?utf-8?B?N2RKWWpRQWZIY2doR3lwVkd5MUpoemJncWNwWWIxNEUwL1p5UjVQU2QvSmk5?=
 =?utf-8?B?UjAveGhQYTM5N3NwM1Vvc2lZRnNraXNMVkdxcjZkaURmLzkzUWFzTzR4ZWFz?=
 =?utf-8?B?bDg0OUNVSTFCM2p5Rmh1YmVNckpnM2RwY29hVXF0RTM0VjdVYTRmdExKR2V6?=
 =?utf-8?B?bmJoNXVUdUZreit6WDFkNi9IM3FVaW9nMmRvVHpHZncxSkFmcXVzd2NmbDBR?=
 =?utf-8?B?MGpNd2JRSFJZRE96TmRhS010M0dyakpZdXkxQ3hDVGNlaGlVSGgwNmhTMTZq?=
 =?utf-8?B?WU0wemdHNHZXaG9LRWIreFpNbHNaeWhFTVZJc3RyNHVqY1ljRm9HR1ErbGpt?=
 =?utf-8?B?S3Q3cEZ5ZUlYbTZZbm9zNEJJajhqTlRESlNZNXc3QlZ0bXQ4Zk4wNm1NREZw?=
 =?utf-8?B?K0FwdU9SSlBGVzVYVmhieFUydVo0Tlo4Q3lsSm55UHQxVURBaVBlNzlvbWgz?=
 =?utf-8?B?bFBWeTNRZHJva2NQL01nQmdyd2xwTC9rMkc4YkpPaWJuMllhOUUybnBWT21q?=
 =?utf-8?B?Y0ZYaTcrRDhkTzl1REJuMkJzL294aVNreW1mcGhzNkxBYzN4ZnFaVXZORmU4?=
 =?utf-8?B?MyszWkRwWk9NcjZ4NHZ0bGFXU0dlM000QmRBRkRWcVVkdDFlbDNKdTlqTTZI?=
 =?utf-8?B?YllzdjJaR1ZTUDJzalFpTjhkWm43R0hNMVYrWGVxS3UyMGtkNDVla2hqekRk?=
 =?utf-8?B?WisxSktrdFV2K2dVMUhxaG54dlROUllUakxWQUZVSEpydjhKTDRSMmNPM0hz?=
 =?utf-8?B?MGI1ZmhYenUvYTlnNHlyV3VDWTRJSUJwNGlyNmRNV0VSOEVzb2dYeHBJaTVT?=
 =?utf-8?B?RVU4Yko0emVsU25mdGV0eG1wWDZURm5pSit0UXlDem1MYlg5RmpsWEFHTmxx?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbe77da-7b0d-465c-2475-08de390a1bfe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 23:07:51.7027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNTQDmENMAIC/SEq0D75vb87pvzAzM5bqNEMBS78dJH6CTcpDux2nNXxGwnfzlm7yGe0PTUqWo/ydyvaXoE9MXE7AwvIJEO+qZUmZmTrIHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7120
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

please,

	drm/xe/pf:

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Debugfs files are added to allow a user to provide a comma-separated list
> of values to assign to each group for each VF.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: drop files for individual groups, check input length (Michal)
> v3: add an extra space when to separate the dumped values (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 128 +++++++++++++++++++-
>  1 file changed, 124 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index c09a89c69fad..7bf17649affb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -163,10 +163,18 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>   *          :   ├── tile0
>   *              :   ├── gt0
>   *                  :   ├── sched_groups_mode
> + *                      ├── sched_groups_exec_quantums_ms
> + *                      ├── sched_groups_preempt_timeout_us
>   *                      ├── sched_groups
>   *                      :   ├── group0
>   *                          :
> - *                          └── groupN
> + *          :               └── groupN
> + *          ├── vf1
> + *          :   ├── tile0
> + *              :   ├── gt0
> + *                  :   ├── sched_groups_exec_quantums_ms
> + *                      ├── sched_groups_preempt_timeout_us
> + *                      :
>   */
>  
>  static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> @@ -258,6 +266,109 @@ static const struct file_operations sched_groups_fops = {
>  	.release = single_release,
>  };
>  
> +static int sched_groups_config_show(struct seq_file *m, void *data,
> +				    void (*get)(struct xe_gt *, unsigned int, u32 *, u32))
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	unsigned int vfid = extract_vfid(m->private);
> +	struct xe_gt *gt = extract_gt(m->private);
> +	u32 values[GUC_MAX_SCHED_GROUPS];
> +	bool first = true;
> +	u8 group;
> +
> +	get(gt, vfid, values, ARRAY_SIZE(values));
> +
> +	for (group = 0; group < ARRAY_SIZE(values); group++) {
> +		drm_printf(&p, "%s%u", first ? "" : ", ", values[group]);

unfortunately, we can't add space between values as then currently used
function to parse input does not correctly recognized such input as array

> +
> +		first = false;
> +	}
> +
> +	drm_puts(&p, "\n");
> +
> +	return 0;
> +}
> +
> +static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
> +					 size_t size, loff_t *pos,
> +					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
> +{
> +	struct dentry *parent = file_inode(file)->i_private;
> +	unsigned int vfid = extract_vfid(parent);
> +	struct xe_gt *gt = extract_gt(parent);
> +	u32 values[GUC_MAX_SCHED_GROUPS];
> +	int *input;
> +	u32 count;
> +	int ret;
> +	int i;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (!size)
> +		return -ENODATA;
> +
> +	ret = parse_int_array_user(ubuf, min(size, GUC_MAX_SCHED_GROUPS * sizeof(u32)), &input);

while this is core function its functionality isn't perfect

* it doesn't complain if we provide malformed list "1, 2"
* it accepts ranges that we don't want "1-2"

while we can use it for now, IMO we should prepare something more robust
that we might use later in preparation to sysfs promotion

> +	if (ret)
> +		return ret;
> +
> +	count = input[0];
> +	if (count > GUC_MAX_SCHED_GROUPS) {
> +		ret = -E2BIG;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		if (input[i + 1] < 0 || input[i + 1] > S32_MAX) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		values[i] = input[i + 1];
> +	}
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = set(gt, vfid, values, count);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +out:
> +	kfree(input);
> +	return ret < 0 ? ret : size;
> +}
> +
> +#define DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(CONFIG)			\
> +static int sched_groups_##CONFIG##_show(struct seq_file *m, void *data)		\
> +{										\
> +	return sched_groups_config_show(m, data,				\
> +					xe_gt_sriov_pf_config_get_groups_##CONFIG); \
> +}										\
> +										\
> +static int sched_groups_##CONFIG##_open(struct inode *inode, struct file *file)	\
> +{										\
> +	return single_open(file, sched_groups_##CONFIG##_show,			\
> +			   inode->i_private);					\
> +}										\
> +										\
> +static ssize_t sched_groups_##CONFIG##_write(struct file *file,			\
> +					      const char __user *ubuf,		\
> +					      size_t size, loff_t *pos)		\
> +{										\
> +	return sched_groups_config_write(file, ubuf, size, pos,			\
> +					 xe_gt_sriov_pf_config_set_groups_##CONFIG); \
> +}										\
> +										\
> +static const struct file_operations sched_groups_##CONFIG##_fops = {		\
> +	.owner = THIS_MODULE,							\
> +	.open = sched_groups_##CONFIG##_open,					\
> +	.read = seq_read,							\
> +	.llseek = seq_lseek,							\
> +	.write = sched_groups_##CONFIG##_write,					\
> +	.release = single_release,						\
> +}
> +
> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(exec_quantums);
> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(preempt_timeouts);
> +
>  static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
>  					size_t count, loff_t *ppos)
>  {
> @@ -303,13 +414,13 @@ static const struct file_operations sched_group_engines_fops = {
>  	.llseek = default_llseek,
>  };
>  
> -static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)

nit: maybe we can use this signature from the beginning ?

>  {
>  	struct dentry *groups;
>  	u8 group;
>  
>  	xe_gt_assert(gt, gt == extract_gt(parent));
> -	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +	xe_gt_assert(gt, vfid == extract_vfid(parent));

same here

>  
>  	/*
>  	 * TODO: we currently call this function before we initialize scheduler
> @@ -326,6 +437,14 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>  	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>  		return;
>  
> +	debugfs_create_file("sched_groups_exec_quantums_ms", 0644, parent, parent,
> +			    &sched_groups_exec_quantums_fops);
> +	debugfs_create_file("sched_groups_preempt_timeouts_us", 0644, parent, parent,
> +			    &sched_groups_preempt_timeouts_fops);
> +
> +	if (vfid != PFID)
> +		return;
> +
>  	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>  
>  	groups = debugfs_create_dir("sched_groups", parent);
> @@ -703,6 +822,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  
>  	if (vfid) {
>  		pf_add_config_attrs(gt, dent, vfid);
> +		pf_add_sched_groups(gt, dent, vfid);
>  
>  		debugfs_create_file("control", 0600, dent, NULL, &control_ops);
>  
> @@ -716,7 +836,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  	} else {
>  		pf_add_config_attrs(gt, dent, PFID);
>  		pf_add_policy_attrs(gt, dent);
> -		pf_add_sched_groups(gt, dent);
> +		pf_add_sched_groups(gt, dent, PFID);
>  
>  		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>  	}

rest looks fine, so with nits and show() function fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

