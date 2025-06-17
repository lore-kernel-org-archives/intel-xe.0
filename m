Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB591C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15210E06B;
	Tue, 17 Jun 2025 14:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTOMb+el";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3E810E06B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170540; x=1781706540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mfA1nrvQSqv5SuZ+WKxSNgaDhxeoZUePLigzGvRPblw=;
 b=PTOMb+elDS5COIhrJwuNFCqfDHXt2kJV89XqUGu/AaAQAwK26v1Oq2y4
 4GsZHoZqyqTZuUXSMKjOWoFY+xdn7pvF3K6rZfaihZLze+ZpP09YApUfG
 8uryd1BLdjaBZaJd8YjoD7aTkne0ze/TISfnAitSu3i30wDEGirxyl0wG
 BDi9+vZ4dA5lMB22xlYe8yokKG0hQD0wPhBeEkvqJR1MTJievd5XVBAzt
 ZosLM3GDlP2UCPNT4RwFHZ1Ppm0UwPJMa10VRBbR7TT1BNVTHOnJ988vq
 KqewUkb1H94S55YgfkGcGRP8cyjKMiHuTPS2SPXSvTjAIgyYgz858Bj6g g==;
X-CSE-ConnectionGUID: SmzJGE/hQMKkTcTsNSxjbw==
X-CSE-MsgGUID: A3YS1njQTc6GP19MS9kHPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="74888589"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="74888589"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:28:58 -0700
X-CSE-ConnectionGUID: 9w7nT8xpRLSNKIaGwTuOig==
X-CSE-MsgGUID: M/1liMkqTJ+eCN9aT+04jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148701169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:28:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:28:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 07:28:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaP5t0Pa1oEJ2Rfbg2w2PRCcxKB7JC5JNtwiHvsh6MCz3B3Z6ewDhGVJBodbcbWgjxKbFLiEkX+Iw2QkVxv6sRU2gvTF13W+a0HAMbGzJxHnwGK39ne2JzgMoTo+i1eYQCaVEdT0wiYcBLc/qB5RW0U8IxrNJiEarF9Nl9+tT1RdUJUoLF4gZEr9oK6bSPCKk0rXiTfanWKTR2xuZ0dw7rMe8DArmkhziihhC9+Jd2/3CAHtuA2U73bb5YlGZqwDwgeXQAaeypecwTmmMunS1MMqA3Ux3VCR1zqloUXKinkkvCTeB4duDPun4iZvLlnMgU7Qiw9RLSKPzrBIPjnztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTap/obQE72AYDymhofrBtPu92FAm2i4jKDBLLyhifc=;
 b=Y2b0acM8/L4UpbdtEcmx309tya+KAFl+bwfWNTBV1+i/91x+kfHpiXwgj9sS95EaXrfL6ZYc47C/l/XDbxW7oWQWJ88Kocv9AWWxFlzf0dVaEjD/0i4EMC2uS5qON9FtbqrC5cdxBWICLpo+pMJhCKGht7N2NovhuxTOrc+jMThu/RyrVjJO0/SkW28H9Yvrz3BH8KhLA8ifz3l5AKaPEzuaxF+FMra+mj3Cqkta5mlHtiHibe2/X1su4BStdv17Fe0NawJbXH+5r+imsN+3y0tifZrH8Sg7cCvQNjslMsv2+lDmPYJ+zYqY0fMAY9A+I5IKKdtBV+BfA/Q0u//CVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:28:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 14:28:54 +0000
Date: Tue, 17 Jun 2025 07:30:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Mrozek, Michal" <michal.mrozek@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ghimiray, 
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Thread prefetch of SVM ranges
Message-ID: <aFF8BhGPe5HHo2kG@lstrano-desk.jf.intel.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
 <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
 <9b68aa6f48644a383cb2e9ed5ca3a35a66546ac8.camel@linux.intel.com>
 <DS7PR11MB62718C1EDB1F49C09FF47C18E770A@DS7PR11MB6271.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR11MB62718C1EDB1F49C09FF47C18E770A@DS7PR11MB6271.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 6786146d-38d0-43f4-3837-08ddadab498c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXl0bXVYK1QvTVRjc2dYN3Boci81MVkvOFNpWjdjZC9lbkhPZVZ0VGxBdUow?=
 =?utf-8?B?aUZ3QTFQTVV0TExaT1NFbVdDTkRJZE9nbnNTUjVEZGM5VTB6YnlrMDJDenJt?=
 =?utf-8?B?M0lTblNkZmt4cjcvY2hzRWppVGZHcHRVNk5vQ1ZFczY1dG5pNkdlWFlVYTlu?=
 =?utf-8?B?YVhUdjRPd21OQUEvL3M0bExZNlc1K2FrSGhsTG52SUpBNzlhTVAxTk5veEZP?=
 =?utf-8?B?eC91N0k4ZjZGY1IyclQ4bnphY1dOSUI5bm9kQjcwSVNwZkNXaDA4OXY4Tm1V?=
 =?utf-8?B?SEljVmZSUXZpTFBrKzJDaW12UXk5VEtaUnM3VnN0a3NsMGdtdUYwdXlyR1pv?=
 =?utf-8?B?Q2RNYzZuYS9VTTVnR3NJNHgwT3djTFArOWdQUmYwSzFjTTNCVEwzWEs5Q0dJ?=
 =?utf-8?B?YmdhQjJ3cExzTlNwbnBRN0JnTmRqcmVkM1A3OFF4UXgzOC9aQWxzQ2RQWkpH?=
 =?utf-8?B?QURHSFk4TzVnWmpOQlRTazhBZHo5YUE5WFpVYnZDR3FQOXh3WG9zUElITUty?=
 =?utf-8?B?VUR1UTRLYmg0YnZ2c3o4QnZodDlLMGMyaTZJVldGNjIwTDRDNzBuR1JQUGFv?=
 =?utf-8?B?YzNieU8zNHhQL0U5VE5McllHZSt4MUkxZlJVTTQrR1VmSmxqMThjZGhNOUdy?=
 =?utf-8?B?NTRsdmRKK2NOOTdDWDI4NnRTb3doYitacjhnNitKL2tRbDNwVGhSdWE4TjBC?=
 =?utf-8?B?a1NKWnl5WXVXUlJ0T2Nqeldxc0ZSaDlESHU4SHQ2YUM1OE11WTRBbHJTbm5m?=
 =?utf-8?B?aUNKMmFvc3ZWWE50ZGltSXpobmQ4SnJKWnNUdzdCUC9najZJdWJIdnZPQ09a?=
 =?utf-8?B?Q2Q0bE1EMWw1QllXZE9aemVVTXE5WmRmVWpNR3JuUjhPVXdwemJmUmoxSmU1?=
 =?utf-8?B?c3hkb3cwbjdZM3QvS1N5SmhOL2htNkg1LzFrZTBVRkZwZFNFQ0U0ZWsyeVNw?=
 =?utf-8?B?ZEZnWkZNcXpsT2MvQ1o0amVCWTI4dUdJK1NudnkwV2ZEWHFzWDg1OHBGMmty?=
 =?utf-8?B?bWN4VFJXaGlndzhxVllrOWJBQUJZQkhFWllHb09LRWU2Z1krbi9aVWErbUVk?=
 =?utf-8?B?MlovUUZXVzcyU2xvbU1ZbFBHaStMbE1BNWUwNG4wazVZd2x1VFEvUUptdDV2?=
 =?utf-8?B?VWx0N2tKengwa3V2djNabkpsb2VNZzdXMVJmN2czc2kxb1pTb3RDYnJlY1ZE?=
 =?utf-8?B?cDAwTjZncGFRNlNRMlZQZlZTZkU4aHd6ZS81NGVTZGc4NWdmY1ZzazhuYnhZ?=
 =?utf-8?B?MktQbUZIbjZYdWNEWmdobHF6SytvY2JiWUtyY0sybWtDc2hvSURDVU90Q1Rr?=
 =?utf-8?B?enRLUHBmS0JXOW1OVUVPOXdJM0JHUVgyT2g5YzJ4eGcxb3YwY040YS9qTjN5?=
 =?utf-8?B?SkRuakU5WjJZaGF0TFNBYlJ0ZE9mYW5EYWNYcFVqSjBTSnZMNDB3emxIT2xy?=
 =?utf-8?B?c3dnODNZclhYUC9vUmNna2ZIUW8xVXlheDJLc1l4QkZpVW9aQytkL0IwR1dH?=
 =?utf-8?B?czlpMWUzTG9nK28wTWZEdzQwRXhCcGMrbmltVVVaRXlNcEtNY3JKYlo2SGFJ?=
 =?utf-8?B?MWg0b2owQTFaSGhVeHVkWWlWb2tIL1Ewc0ZoUzIwNTgrZi9sY2ZMeDBoeHQ0?=
 =?utf-8?B?bnVHK2hPNmphQWE5YVRiNEs4M1NnRkMzTDZXcmtsWWczWVFLcDFWa3R6Ukx0?=
 =?utf-8?B?eUtzU3l4ZDVqU20rUUNUT1lseVV5SjNyLzNKV3dhR0tIM1hCWEo4MkNmNVp1?=
 =?utf-8?B?UDJMT0FXcW5mVTlLajRxZi9sMEVONUlwRm1MUmEyaE01eExBMDhlem4yeERi?=
 =?utf-8?Q?/XEvl/NY4YQAGtWFZM2njuOmfYkk6CyP9GZHc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVYbkYvQmpuZEdvdzJBc0srSlA5UTdyQkVLWktRN0V4U2dmVjU1MHl3azRp?=
 =?utf-8?B?dWl6VC85L1BVVmNEWE9SWmYxK2NENWlrYXJtazhRWWdXRVZjMW1HZitqWWth?=
 =?utf-8?B?QU9UOUNtOHh6Z1Q0L2xZV05MMDhTdFRpdFg1K3loNWlHOGlwZW0zRDNYT2Nx?=
 =?utf-8?B?ZE9SWmI1aGpOYmZyTkdTQzE3cDRSaUZxd0JhanEzWGh4c2gxZ2VMeEpqa0JZ?=
 =?utf-8?B?RW4wb1Y4aDBQSlE3aEZzSEdXQXlwc2lGaFJUUHZmMkg3aTRmUERqc3NBdGFJ?=
 =?utf-8?B?bWZ2NHhjczJtVUowaFVuUnVwcExpcEdqSGE1b2J2bDFObFRNNy9qY1FCRFRp?=
 =?utf-8?B?eFVsUzVpY0VEZlRCVGUyd3lSWEdnRTRqM2liUi9hOUs3NW5oK20yTjlFT0Qy?=
 =?utf-8?B?aUZLSlBZaE1tZVkvQjRkc2RvRWwrZUt2czZpODV4VlR1QTFmODlBakpObklJ?=
 =?utf-8?B?c1YrdUd2NzlLd3F3YTBDMktyY0dhdlBzRHQ0TExVWDlqaHdEdTlNNHhOMXZE?=
 =?utf-8?B?bmNUQ1gzNTJtRHhxR1VueU9CLytybWtMNWZpNnBwY0JXOGloMHJ2eGxLN1hs?=
 =?utf-8?B?RkNjZVpEUWZTWitadFdZOVp2VDJQWEhCdnhsV3NSOFA2RDFaTmNWc1FGdEsy?=
 =?utf-8?B?Zngzc0pTdmxxVm1sTHVxa210SnNtUnR4Ykt4NmVBYkN5YjJ5WUozQUlLT3NI?=
 =?utf-8?B?cGVFaktqR2FOTTRoWmlDdXlaVm5uSjI0TEtQWEVmdjZpQWlNbDFxcklEeVFI?=
 =?utf-8?B?M2ZtRldFZlk5blAzTFF0S1ptTHZTT2JCaHFOUlp5TWJ5eW1FWDFrWXFJTmV4?=
 =?utf-8?B?NXRHdXBMNSszU05ITiswS2JJTXdYdzczV0g4VnovcWRKVkxHNnhXKzRIbGZO?=
 =?utf-8?B?cFg0c1pRanc4c2YwR2NNc3hRSXNqdnlJQzYxcUcremxpZVZUTVJKengvbnhO?=
 =?utf-8?B?MHFhM1J4aWJTVUJSSW9BUlhjNDcyaGRRVkhKbzlWUnk1ejBwRkpnMWNsMmZw?=
 =?utf-8?B?bmtCWmxxTkJBZkRLQnRiV1QwcDFSV3ZPSUJ2N2w5aGFnemEwdURsODJEZjRZ?=
 =?utf-8?B?SXBpWlRkSDJraVVxODU1bGNubmVhMnFxdHBDWE50RlJEZ3QzbmJpcURiT3Bq?=
 =?utf-8?B?dVkrZEJ2WDc0OW9NbmRZMm0xVlZCRkk1cFlhU2xXSlYyL2xidjQrQlAxbFNU?=
 =?utf-8?B?a3RtWXpUM3V5RmZaT1dJSVIyWkNHc1Bob2pnSGJONnRFZkhZN1hHeDVDNnoy?=
 =?utf-8?B?aUZRd1l6WkNxbDRVQk9PY1RJZ1BqT2hIM3h4V29iOGRzcnk0b3lZUjlLeS9P?=
 =?utf-8?B?QWNTTW9qa1ZENW1XS3pBaGsyNy9URVZuOXQ3UStNdkgzVXQ3blkzUTFhSkJh?=
 =?utf-8?B?Vm1yM2tKaHc0aDl1RlhIZ0FrMzIreHFUaEhTeFIzeTRvT0ZENjJ0TnVCcW9H?=
 =?utf-8?B?VnQ1UWx5NWllbnEwUVlGWEVPcWpweHc3T3Z1WU1OeWJIYmw2dk82ZjlHbzhw?=
 =?utf-8?B?a3d0di9xVnZTUlFySkE0b05mallwN1pKSEFLbkRCODNhbkJjRUVTdFhSVFJ6?=
 =?utf-8?B?RzI1UTNPeGcvZFpSekZ3MmFsSDg3cEsyaC9iYzVDcW10aGNCdFlvVGFLNmhV?=
 =?utf-8?B?ZTQ1aG1rbmZ3WklyVHN6MVBscFNmV2ZxMDBIdzFyaEY5TkFwTVJyK3RZNXJa?=
 =?utf-8?B?RzI0OTYyUDhDcy80cDVwTE5DQjVIL3NBZHlhNVVhOHFmRVhmRkdKOEhCY1di?=
 =?utf-8?B?RUVtaVVRVUVhdGlEWUI0UkpUZVQxTTZlaDVDMWlxV0dJemdKd2FMcm94eWpV?=
 =?utf-8?B?N0JYdDVreWZDS0dqUnBxOVRiaDg2L0llZjNjL2RreEwvbktQWnNGekltWGZ1?=
 =?utf-8?B?b0VySGhDNWNBQ0VBanVXM2JleEJyVmExVmxTeE81SXM5S01US0thTmt0Mk90?=
 =?utf-8?B?eGdmQmRWNHE2R091QzIybmtIcnMraXpWM09wT0NNc2gxV3JaQ1daVWg3TUdU?=
 =?utf-8?B?UFBOVklwMTFQMVRkdHlkYkFZNmNxQzZhRXdqekJxc2xBSmxUQ09ma296RHBa?=
 =?utf-8?B?K2FxQTdubXBhT0RYandZR2g0ZnIxVVY2Z0ordGFzd3pFWFdJTGV1N3BNZGVB?=
 =?utf-8?B?cldDM04rbWQrT0Q5dmNrMlZPVFNCSEVHMmsyTHd1VEhRQmZmMHFpSkRFT05H?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6786146d-38d0-43f4-3837-08ddadab498c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:28:54.3708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNjGWL/tmKz6e8m75oPa2t7ScW6S8G9TX+yqJk7T7Q18is3AjmlP/nG6Za0kkSgY9JBdW3tyf8s9c0swj5OQeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

On Mon, Jun 16, 2025 at 06:06:51AM -0600, Mrozek, Michal wrote:
> > >>> > 2) Do we actually *want* to use 5 CPU cores for this?
> > >>>
> > >>> Yes, I profiled this with a test issuing 64MB prefetches—5 threads was
> > >>> ideal. I have a comment in the code about this. Once [1] lands, we’ll
> > >>> likely only need 2 threads on BMG. That would probably get us to a bus
> > >>> 8× faster than BMG; for 16×, we might need more threads. But I think
> > >>> we’ll always want at least 2, as there will always be some CPU
> > >>> overhead that limits copy bandwidth due to serialization.
> > >>
> > >>What I meant was IIRC NEO has previously been picky about starting
> > >>threads. Perhaps Michal can enlighten us here?
> 
> Multiple threads only gives benefits if we are able to overlap things that would otherwise keep the hardware idle.
> i.e. if single CPU thread is able to saturate system -> Vram bandwidth then there is no point to have multiple threads doing the same as
> all of those due to link sharing would end up later and we actually increase latencies instead of reducing those.
> 
> Simple example, if single thread saturate a link and whole copy operation is 1ms, then if you:
> - run 5 copies concurrently, all of those finish at 5ms mark due to link sharing
> - run 5 copies sequentially, one at a time, then first finish at 1ms, second at 2ms, third at 3ms and so on and this allows to unblock consumers way faster
> 
> Hence I would be very careful to use 5 threads to do CPU copies concurrently.
> Also you may explore vector intrinsics to do the transfers, sample -> https://github.com/pmodels/mpich/blob/27229e089554fee8ac0ac9da28e56fa7dc648a45/src/mpl/src/gpu/mpl_gpu_ze.c#L3345
> 

The bottleneck lies in the migrate_vma_* functions, which take longer
than the copy job. A single 2MB copy can reach 16 GB/s, but it must be
placed between migrate_vma_setup and migrate_vma_finalize. These steps
currently take approximately 310 µs, compared to around 130 µs for the
copy itself, which severely impacts prefetch performance—effectively
reducing it to 4 GB/s.

This was tested with prefetch benchmark in the following IGT series [1].

[1] https://patchwork.freedesktop.org/patch/658835/?series=150306&rev=1

> In general I would advise to do at most 2 copies concurrently to overlap on ramp up / ramp down between copies where machine can potentially go idle.
> To much copy parallelism may give diminishing returns, especially for larger 2MB pages.
>

Once the migrate_vma_* are faster (e.g., we 2M device pages), we should
only need 2 threads to hit copy bandwidth. I think this should scale to
a bus 8x than BMG if 2M device pages give us the speedup I am expecting.

I can change this series to use 2 threads only which I'd suspect the
prefetch bandwidth would be ~8 GB/s for now if using less threads is
preferred.

Matt

> For 4KB transfer I agree we may be bottlenecked more by copy engine inefficiency and running multiple (2) small copies may give some nice results.
> 
> And also we should be pretty conservative in using CPU threads especially in higher numbers, as at scale if we take too much threads we may introduce imbalance in the system which would create baubles and compromise performance due to butterfly effect.
> 
> 
