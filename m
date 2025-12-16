Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D6D609D7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 18:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C757B10E86D;
	Tue, 16 Dec 2025 18:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaOj8DOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDB110E86D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765908580; x=1797444580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+2xTlaUzL1MlTvZbr1DqFU+6kznTG2NTmk+sV8snZXc=;
 b=VaOj8DOoAShypGoDBkZZIsHvuiVtD0DPlzc8nKaFYZjgpcz3IDIKpFbh
 wdZJFR5SxHIZyib82xKMU86ZJ1YjUNumEbBlwqO+OsoOS/TRoy5DAlwAC
 /CalZVF5lrdzGe7akfw7ugND1PQ8DodmVWb8PV5Ef+CIQUIdRwOK6PfSc
 53E5rqLzc4XV9VCCKjzu98Yg0BGbme3j0poI5i/MmoBJSc7sr7fCpFfQ9
 32ZdOSJJqw24hYQ0rrKVyuzW/imOVGUQh9tlRtWRFoIdAbzcOozDdRYEM
 yIYk2fWUF/a68/j9ZV810XK6ZpES1f9hr7DriUe9qdFu9KuWRuBD+Icz8 Q==;
X-CSE-ConnectionGUID: gcDiBVwhSu2xRE0sazSfnw==
X-CSE-MsgGUID: uM337IdfRaGc5JXs0eWXUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67878063"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67878063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:09:39 -0800
X-CSE-ConnectionGUID: dFgUXhrISnGT7T8Umv2mDg==
X-CSE-MsgGUID: Nu6zt4LvQW2xRHR+tKa7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197705442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:09:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 10:09:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 10:09:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 10:09:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL1KF07rz6blKTQVPWkF4QOlDLCDkmmb76F1dyVSnPPAdMya4jiRR4Fml6pMsD6Wz/pDrIwncZ9EJVkAAHQL8LWCy8RU+RnA5S46+ANcI1vvVwkDHHGipmMMN+iiFL4ykWAXxyUhwvjBz6K3Wkh6p4RcW3n8r0tLaABIeXgR5ozS1TsCjexOcbdGKZrAkqIsJtw5ykSKvU6oX7vIoZGqWK1oaou3vlogUsc6aaKoLFgFRhgRbjjDoCq0+KdJv0oWdhqUiJCIekiZPiFT1XoD20rrFUkcK9OEYn+2XtIzOs7r06Y2s13cvIG6E5SLXUyBbwF8fkpgDII9C4QkkrOMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1icKciV6wk7s8kiknl8vk+IDvzPuXz3bPY/AJ7Da7E=;
 b=fcRgUwvP9odV6oD0TrIdNseNlMpuKd9oJhM+KtjAclG0GYnVyCLe93EylirRcqJLTt153iexWdlFxoOZiEw9CHves9xKHCLgbAEst652xGAoeldfZMmjqWOXIweCPuyzvNkC1rP+Y45q0i223OfB3sGLDN7QLZds8NflGV+Gp8wmN4fe+Y20/BzdbDznrk07xs0HZeHbWGfOEnNEgSYHpHY/nspat7KM6ZWJzhyX1h2CQnrIxSOKhyA0vqRlpKdtVkaIqJ35KKVaKe9D7zNIEbqOnj8Qor9x1Vn7lIgPL5PC12NEMryw53fkeDBbQDcO70pcxYJ+7UZHn5W7J7XSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 18:09:33 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 18:09:31 +0000
Date: Tue, 16 Dec 2025 10:09:28 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <peter.senna@intel.com>
Subject: Re: [PATCH 0/3] OA/EUSTALL: Syzkaller NPD bug fixes
Message-ID: <aUGgWO8LN7N01yJR@intel.com>
References: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:303:8f::27) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e7896b-4b74-40d4-99f3-08de3cce426c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjRETHliYThvem9JbU5CdXhQNHZWRWV6ZXZTZDJqUUNxMWJRMVJvWG91eFlD?=
 =?utf-8?B?NTE2RldxTXcxZlJESVFpdHhOcitLUkJsRlhLaVpUWDVldGVYYWhoRXhqbnhP?=
 =?utf-8?B?KytieE1DNlFOaG9mMldYS3pva3diS0ZzcHoxS0ZkVGhYUmFSYmJidEo1bGZJ?=
 =?utf-8?B?elNGZm9nRjNmRjErdG9lYktMdVlvQXBUYnRlYlEwSmNvbjZlcjNCQkxncGhV?=
 =?utf-8?B?UXpEck5mRVEzd2FKVHUveEZCZWZhSGxDcmVNdEJMWWI3ZmI5TGcyclhNWC9F?=
 =?utf-8?B?anlzNmwrNXUyZVV3N1JHMU1iSWorVVBtS0t2KzkyRjF3d0NWUDBVL0ZlQm5y?=
 =?utf-8?B?RWJnanhjdzA1UkltUHpJcmFhdXB0QUcwcVk5U1FRWE1KeWwrMGs5cU9IemJ4?=
 =?utf-8?B?WCtkWmVYWkJCOW50UzRJblE4eVlTMW1QMnlaWVZnMGVsZk05blpTWmhxL0FR?=
 =?utf-8?B?SFNOd0paQjZlSEZYTDV2NFdQc0hGQTRqSHp4SnVkMmplaUh4dVJyR3dGeWZH?=
 =?utf-8?B?ODNUcXlkRW1nMzhBakNOb3htYjNOOHdvYkN5Ni9LK1YzRDRQcjl1MWR1S3Rt?=
 =?utf-8?B?MlJLQ0I1NzAzRVpVSGFhV2hSK056ODZYT2RqSVJLWTE5TlBySU81S0JCTjNZ?=
 =?utf-8?B?ZGZRVEFoQzlYaktzQnJnTEljTXl2eDNWMjV1a3FqTEI1TWpjMVljOExCNHlV?=
 =?utf-8?B?dWlhMytHTFh4eG92MnJwNXl2VFRiUHVxVm9HaGlPeHV1VXcrdkdrMnY1cEkx?=
 =?utf-8?B?cHNNU1VwaEd5aVkrdVh5dTA1RjZDL3ZXUGJvbzJyeW55REJWRmEvaFVZVmtI?=
 =?utf-8?B?VnU5Z3kvNi8xRlBCM0tyV25iU29jZzljZzh3Mmoza00yTDJ4TUJkbVRyaGtL?=
 =?utf-8?B?dENMVjk1YlM4ak1YajdsTHk4ckRSNWdVNHF4THBCMGg1aU5uT3c4NTlLTW1S?=
 =?utf-8?B?c1YrSjc4c0hFcWxSTG9kR29JN2NDSGl1WHJ5NC85WnNoMm9DSWZ4MWExMEx6?=
 =?utf-8?B?Y3JWMEx0WHRrWlpxZTRMQzRubG54SXZ6UVFHYlRJNENvQzdsbmxXRndDNmI2?=
 =?utf-8?B?bDlIZWVzTkVKQ1BZc0ZTV2tidVN1S05DampETk5zVEhNWmtnRW5qTWFrcU1h?=
 =?utf-8?B?dnpYOUdTdmpuNDllTmFpaGEybVJnbVA1L012YlRSbnhSdWdkT1pwTkVTcmZC?=
 =?utf-8?B?WDFBRHdHMVRrK0dpTDhlY0dveEZ0aDFPZGd1VlcyciswSkZ3cjltQWZHWm04?=
 =?utf-8?B?dTJORDg1S09kdlArZWM5cS9PZ3lGTWY5ZXFZQ3pMUGtpN0ppQWd1Unpjd1pW?=
 =?utf-8?B?Y2J1d2JEMFJtTW5wVm5DUjJPT0R1dngycitHNnV3RVZUMkVLWEUxam5JTUt6?=
 =?utf-8?B?bDJQTlE5TkNLL3hqTXVkWGhtcnlsZklMV3RLU1BGY2t3VDdCM0l2SDc4YUc5?=
 =?utf-8?B?S2F2aGg4UnJjUmVSZGw3d1BTVjBUNk5lUzJHTzBhZzZXdmNZaVdqUmlIakty?=
 =?utf-8?B?NDl1SnBzWGlheVlrN2RvMW5uVitXWmJTMHk3SExCZVNCbkcrRWRqNG5kdnBh?=
 =?utf-8?B?Mmd1YTkzbUorNXd6dnN3OUNTWGlIRzBRdG9TcmJZQXA5cTllTzBWcFZNWmxU?=
 =?utf-8?B?VWhLY0tJZVRQT0hJeWZTRDhCTXVLV2ROcUtScFpTb29Gc1NWdlZGUTJBTXF4?=
 =?utf-8?B?M2pMME9KZ2EzRHd1UjVoSnpKU3ozNHlXaWU0OSttNXJGaHVKVWIwQjhjYjVD?=
 =?utf-8?B?NDhjc0MwQ3ZQeTVJb1AvM3I0RTBoOHpxUHU3Sit0QkVGYkxEODVWYVh2dVVP?=
 =?utf-8?B?c1RBUWhTWVEyTk5LSm51WFNidnp4b3crT29DKzY0UkU3U0dSdkdCZXRoWFpV?=
 =?utf-8?B?aGE1aWVRSS9RUHY1SmhCME0ySjdseEkwb0xoclVNdk5CR01tV203QXR1SGlN?=
 =?utf-8?Q?SX/Qwh+VQczCHvP7/clvrISlENfONVZm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2RIcHFWajVMaDNZSU5xaWd5VXFGV2JyUG43MW1YN2Q4VFFrTk9SWHYxYWUy?=
 =?utf-8?B?NVpEYVA4SjgvRkZBUnpFREtSMzVtM3pldm55cWpKMVI3c3lKaTV2d29HY21p?=
 =?utf-8?B?NUZEVzdmejNrWUFWTHVOelcwSDM4TDl2c1Q4YTZab3lxTVR0NTVaYUY1RW9F?=
 =?utf-8?B?MXlob2d4S2RTTTdvZHFXWVQ4RnNYNjBmc2ZLc1BZOFBJVC90bkEyaW5FSUk1?=
 =?utf-8?B?SlFQdEgrQjJnbmVTVDJxdGV4MFczVVNyUWsvUk56Z01sQ1lLenJBRXVPVUFH?=
 =?utf-8?B?ZmIvNVhUejhidGhiZTNIUmQzejVjRGJMeUt4TmhNMFNrWTI0ZEFUT2k2UTRQ?=
 =?utf-8?B?ZVhHT1BBeU9OVkV2L09UMW96ZG44YkM1UDFybHhBTzFPZVZXVXMzUU5uWTFR?=
 =?utf-8?B?STNveEtvNkx5enJSUit2NnRUNXhobVdvbjlRVzFYSnlXdzA2RFdOcHNkdWhp?=
 =?utf-8?B?dGpPRXZwZytLWk5yNHRucTdwalBqbytOeUtXRlBYd0pmQ2gybk11MzlFM1di?=
 =?utf-8?B?R05UcmY0Ly8zdmZLVUoyVGxCVjdkYXpVVVN4YVBNakxMN3B6Uk9PbUQ3eGJw?=
 =?utf-8?B?VEdXMWpKM3dVVVdNL08vOE9WTnYxV3lNekxvWFc3SkNabWtsMmQzckdRU3Yw?=
 =?utf-8?B?MzMxOG12blhiUk84cHBma3FGUUJOS2lxSFRnY3JoNDdQenpmTTBIeU5tMEJy?=
 =?utf-8?B?NTZLN2lnem5VZ25PcTVPN0hnWXFRam5LbGtHZlZrRnFlWEV0SDl5N0Q0RDhv?=
 =?utf-8?B?UHdCVXlHK1R5TzA2cFNRUkV0dE5xRms3Vll3QUN0eWFaZE1QT0I2M0s4eEFQ?=
 =?utf-8?B?UzVQNjFTUGhZV2xKemN3cGsxcnNyek9veTZIT2Z3bmRudEVGZFM3VkJtcjA5?=
 =?utf-8?B?enEwWUhMYTlwWlVOOHFtakl6SDlhQU5ScU1Ma2pEK09CbU0yeXk5WXNIN0NP?=
 =?utf-8?B?WG9WM29hZVhPTVJhUmI3U3p0MFpFWDNTSE0wL1JvSVJOSDNQN3lRRmpURzVo?=
 =?utf-8?B?anp0YllHYVRKYzdENFlkdjh1Z0lkWjdDT1Y1MmVWd1hIajk3SFFaS0d1SldP?=
 =?utf-8?B?OWFwd20xUjc5eWhyNEFOYmp6MGR2ek9tZTRJZ3FtUWYybUhGMlN0ZXJ4R1Iv?=
 =?utf-8?B?OVVCK0QvMDNqRkZPdmlNMTFUVElLMkd4clR4K2hDU29UandDQUd0NGtBM3cv?=
 =?utf-8?B?ZTQ5LzBvdUM1ZGUyMWQzWVNEYUswWVl4cUNXUzM5U25wYkc4ZWMrYXpUb2Qv?=
 =?utf-8?B?U0xJM3RCS3htSTZoa3ZFajY3QzJPVi95MERtc3FIVHRvdjVYT0xaZEErVnBP?=
 =?utf-8?B?RzlocXNRaUZxa0o4QVRHNCtveHVLbzRUbkJ1NnBjTVc3T25vQ3djVjBlYnB4?=
 =?utf-8?B?aFNRMDRoZUMvT0lRRnovelh2MjNoelFxMTF0OHd5bHgzQ21vZmhYRlUvUW5M?=
 =?utf-8?B?bG1mLzVCeVNSa0pkWjhCVmN0S3ZYUGpLZTVzb3MwZGlMbWhBQWlzM2lWaEZF?=
 =?utf-8?B?YjI5VU80QzE1RDE3YlZKbWt1ZkpHcW1nd3JwTWg4YkdkdlB5em93c0hzWFdF?=
 =?utf-8?B?NXEvWW9kRnFVeUxxMFJvRzcxVWx3V2UrSXdxbWtFZkNXdXVFSjdXa2dpVzZV?=
 =?utf-8?B?V05uWE9HQjY1eVhCTU5wc1VUd1dLZnA5WklySmg5U2w1b2g1c2xzUVdRVXFr?=
 =?utf-8?B?cDhQUHRiZHowQk52ZGlQcUJQMDFkY0xadmcxMnVJYWV6NGFNcjNiRUFIclV4?=
 =?utf-8?B?cnRTUmtKT05mYlNZTDdqdU5zRFRDNUtRWGgrREN1bXcvNVZhb0FRTk81Qmpz?=
 =?utf-8?B?MG52MzZYU2JRNlFEZjBKaVlDd3NOMWVTRDFUNDRqeTc1RzlMTzZ4QlRWbXR5?=
 =?utf-8?B?RVZGQkxBdWNkeThHb295bmJGdWZMWG5MTTEvUlgwMnZCVWI3TkJsKzdPd0w3?=
 =?utf-8?B?bWlOYlFWZGpUcDJJUDQxV2tHcko1Si9qNUlFdnEzYTgwekJlbnVMOE9EdWha?=
 =?utf-8?B?L2hLNWdXaGJ5REVnVE5ZOHp6K2xoS3R0dXhzVUt6TjlPTnJ1bldvRjlCVkhV?=
 =?utf-8?B?aDkrTUowK1FuYWVuYVp1OEpXVUczZDcwUEJPK2xvOVYzWFFRbHcwMFNOTFFO?=
 =?utf-8?B?TWtuU3hWeGFhYmR5R2RpY2FNNGEvNHNyTjJ5UGpuc05yZC91WVRWMElJWGFI?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e7896b-4b74-40d4-99f3-08de3cce426c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 18:09:31.0443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ztb2ibBEYouLUfeXWoHIyg9TSS4PADHC6YSQBmLnbJXIFAHAX3DOx0QV1EyjPikjAuD1/NrKrR2bV836fXr+R3WLQ30A87JAJ/JWXBa610c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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

On Thu, Dec 11, 2025 at 10:18:47PM -0800, Ashutosh Dixit wrote:
> Ashutosh Dixit (3):
>   drm/xe/oa: Move default oa unit assignment earlier during stream open
>   drm/xe/oa: Disallow 0 OA property values
>   drm/xe/eustall: Disallow 0 EU stall property values
> 
>  drivers/gpu/drm/xe/xe_eu_stall.c |  2 +-
>  drivers/gpu/drm/xe/xe_oa.c       | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
LGTM. Thanks for the patches

Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

> -- 
> 2.48.1
> 
