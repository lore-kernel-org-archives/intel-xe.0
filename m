Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E7E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 12:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67F10E109;
	Tue, 14 Jan 2025 12:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVkXmr5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D0410E1FD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736856272; x=1768392272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qdlimiGEHhEZ7cVjgONfywzRs8P4jCMARDmU51JVGqk=;
 b=gVkXmr5ALUMeqhCOzyYQqiJmEf0+x2KyrwbJwQNZ36VwOMFOgcGcRiBx
 DphEhqr+5EUUO5ntnAGFgwwMtRq/JfySkTnIBSWv1gtM6afC8yrjQdUSo
 M7bixprjYEbeSjsh4fZkPEL8dyMEI6VHc6U0d+j0L/UeotZGCMmrYziKL
 pPAapMYd3YVp06MZ38hlwe5HQyTdkPWnBkEMzPaataO40PhpTWqUTKItd
 FIQlwFzXx9lsjIEGOrgnRPQnd47rTspVjTeUj9lnmHtGqvXbHBB58aNu9
 gRa9IdXYl51n0jGw1hZ0VQ6FaLIqtRAW9KImhE7SEtCPdRxlcEWv48usV Q==;
X-CSE-ConnectionGUID: UGX839FEQmG8h90j4q4PDA==
X-CSE-MsgGUID: 8Qgl5LhpQIiiFkTIl7qqog==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="24748298"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="24748298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 04:04:32 -0800
X-CSE-ConnectionGUID: Sr1gk1aQQWmcLIFp1Oa8lQ==
X-CSE-MsgGUID: a2V8FjWZRsWi3mT7mjZZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128035399"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 04:04:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 04:04:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 04:04:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 04:04:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOMkRxXXbZM2dM+/xI7HbZXFH78UrgzbGa2wClwuBjmSpMnMC/peeUpY73tgp1PGYguaFp3jUXrfG2ck7nnv//js22G19hk+W6uvcr8YcEXMHK5ZV1CIIgcTRqGBb1tRltAjcdnxUjCLTxtSeSoIYIxW0QrArweCNGKZgbWG3xPmzKlN9iBF9drieTMYyclHY/sYhlGLGdXhGRynf0UXUODTiTtze0xf2u+dE8rLNGyYBmwgVLTi7RwdLuxfiox8g3ewiPGhv+Id8iRtod+SQzvKNpn/akBNC+tb8abhWRQGtIWGju2HqecrWTxteT3240stdYZAlpzkzSGiMp9+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeigTkfLTSS1V1JdgRuyiwdYNK/os9iwHy0m2cOOfdk=;
 b=Z4cxyV0ct9wLcFXk7LTPVv6uQ85okCzL4QeUPmTAe312qtbLxlgA0mfkJoTJbnM2C2x1ZJIANp5DK9pahytVCCJCU1UDWk2bnsRoIDjBz5spSgI3+4rS8FNLl0B5Y4Dj4DkAM+QYWEtqkkEWS4nmi+pEe3wKp5YdRKm8Pz+/UEz9xH709xHweYnCXmR64SBF7bZbatq0TCxX4nYabAo1zItTiTd5G/5EMq+v5IGbV2edPzPAxZhLtpJppcQDnrLwFZA1t/sfkctg3Q3hK2aofOoKc8fT+CvcK3KZQ0xiqWC8khRmxUefWqxOGcbCWiWUihBYpRIgqL+doHEkwn91KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Tue, 14 Jan 2025 12:04:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 12:04:25 +0000
Date: Tue, 14 Jan 2025 13:04:22 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 11/11] drm/xe/kunit: Add KUnit tests for GuC Buffer
 Cache
Message-ID: <bsvj7ypm47rxv5lpqkwhazcbzyvwye5jjpycah7toetpe7vz6x@phuoxfq74npl>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
 <20241220194205.995-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220194205.995-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: aeab47b3-4e48-4e17-ded1-08dd349396fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVUvdTZJTFY2NXM4VnlYTU1hNlQwaWl2OFVFTUQxWHJEWnUwSVFnTWppU2VM?=
 =?utf-8?B?V0RpQlAwY1FibW9yeHVZK0hVN1FrYnpFcXREVmRrUzF4Q3REQU9YOHYwM3VJ?=
 =?utf-8?B?M2dyTTZCN0pKNUYrajZsYTN6bm1YQVNXVE13SHNpZ0FYRW04QjdQbVR5WXBm?=
 =?utf-8?B?YWsrdmUyTkdxb09kNmpxTkZqU3RvenYyM2g1YlJDUURCRWNYbnhHQSswbEl1?=
 =?utf-8?B?MVExNVluMEg2N3U4eFFLQnJCbTBjVGVtWEJqMzJFeHBIRy8xTnhneTVWS3dN?=
 =?utf-8?B?OWx1QkxKZkJESkFFUFpVY2JHWUY3c1hFMjNjdlhnVS9taUJEWEdPSnJTOGhk?=
 =?utf-8?B?bXhNSkZYa0VNcFhYVWVLTUw5N05UdENwck9WR0ZOM3M4Y2VZNjIwTzJ1ZWV1?=
 =?utf-8?B?a3dKMDkyREQxNDZENmhZcFp1ZDlwZU9SNzBMMzFFeTBNSkVXa09sVDUzTDlX?=
 =?utf-8?B?c2xHb3RERGxUR2RGUkhSMEl1Zi8yV1FydVJTaG8vVGMzVDNBS0ZlK2d4WnN5?=
 =?utf-8?B?aS96Smc0ekdIdXF6UE5zcjFYNm9EdHd5cEF0ZmdWNW8rbkF0OHFuRXBydXBQ?=
 =?utf-8?B?b21vL0hrQXVlcHFuUFJCREN4WnJMMzNSYWloamJiRG9UV201OUlvYVhGUTV6?=
 =?utf-8?B?Z240UUl2c0c5alZtNTVublFnMlZzbExPSUZCVFV1dXVzMHNtWjJ2RVhqR0tI?=
 =?utf-8?B?ZzV4MFN6ZDFjVkdNUlk3VGhWYW03ZUtzN1FrVDArNWlxQ3FCM1YySS95VEl5?=
 =?utf-8?B?UXVMUEU4YUtEazNPM0RRS0NZNE1lVHJpeCtFR3VxQzIvV3NvRFF5VHQ4MVVX?=
 =?utf-8?B?ZmRITm42WjcvNE9uV3gzVmY2dHJPNjlKdTY3Ukl5Y29YV3lFT2g2Q0hpWGQ2?=
 =?utf-8?B?RFI1TldlZDc3QjZEVlZSN3ZRb1ZhZU95NzE5c0R3bTFZSkZkaE5GcVRDekI3?=
 =?utf-8?B?SnUydXkxdjdFeWZtM2NSQmU5T040b1VoYjE5R0JucXRsTDQyc21PVm4rSnJ5?=
 =?utf-8?B?VGtTZEo2MEI1RWk2bFlSY0hESDI5RXJ5WFRjMkhSQlBJeHF4VlpNSUFUTUVo?=
 =?utf-8?B?RE9zUWVnbENBR05vSzMyOUR6RWRMbGpaR1B2L2tkc2J4MmpGQ2RnQ2NZWFl5?=
 =?utf-8?B?ZEluY2dCYUFmYUVZNGh6UTd6empPT1ozWjRHMnNEaHp4TXFTbEZwSUdiRHE3?=
 =?utf-8?B?dDJnb0tlZTZ0Y0tXVW16eEwrS2NvdjZ1NEtxbUNlaHA5TkJQTWRGU0JQMHJk?=
 =?utf-8?B?VzBBQmFSL1d2L1JJK25vNkptS0tXNmQzY0w2Y04rTmloaDhxOWRmNW16T2di?=
 =?utf-8?B?SG9xWlB5Ty9IaU1oSUpTRGRXTXBDTFNOYzBMTzVsQ1VKODZYTSs3cjYrcVpy?=
 =?utf-8?B?STU5QUdNN1QrSlRmd2ZIc0s4SGdGZjAwM1AyTkVpNnU3U1FzQ1ZxVVQxUVdL?=
 =?utf-8?B?c3Rac2dJWkR4Rk10SThqR25KTkFvcUNKY3JKT2ZUL0dNRE5KYUpzckFzZjRZ?=
 =?utf-8?B?UHBtZUtxS05vYzd2ZVV2Q1ZVY2l5cFd6RGVGYm8vOHFCZitoUElHYzY5cVNw?=
 =?utf-8?B?TXFZNjRnSkdaelBmY0V4OUU3dnUrVHh3NngzcG0xNy9VRGNzQzRBRTh1eDZo?=
 =?utf-8?B?YjVXRmFJZU9FRjFmUDlXcmFWRlZRaEdKb054Z3JYcjZERk5lOEJLOTZwWXFX?=
 =?utf-8?B?UjU5WVR0MVhCeHVaaGdvVmlWRkQ3VFBlYzhGR0k5Yksyd0ZOam5yT3ZyWjI1?=
 =?utf-8?B?UHlVRWpidjdKOTNPVExBK3htVTlVUS9wYzFCODBDRFo2WDZFQnBzQ2ZHWDVu?=
 =?utf-8?B?UUNQUDczbU9HT1haRlRnN0M2OVpKWU5IOW55alVieVErdWJYdkZhTE15V2hq?=
 =?utf-8?Q?JrzOS3C8k/JCk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anovU0dMdzJ0L0U5clMrT0NOWDFpbml5QXdTcFRqQjFsU0dqNmM0a2NldlNH?=
 =?utf-8?B?VSt2RzFpVitURnhqOVk1ZDV2NHFJMGhxdWJnOTRUaml3Z2txZFdNeGpCd2No?=
 =?utf-8?B?L2hhMEc3MVpoaFdtS3hlckZPc211bUJXTWptQjJPbUdjcmNFazlMMkhHTDlz?=
 =?utf-8?B?WE1pbE9sWGFOVGxkNVBKUFRDU3FxQlkvbDh6dm90a0dQOUlnUlVzWEF1N1BY?=
 =?utf-8?B?QS9MNVF4QXZuOVpKd1VGSDZ2cDErb0pmalZWdC9GM3JLd1pLcmxqSVd6Ry91?=
 =?utf-8?B?WmJ3UVFiT3lsc2o0NStNVzBTNjdKcThGVkwzOXVJOWVrWEt4bC8xblFlM21Y?=
 =?utf-8?B?SCt6SW5uYW91Q29HYkZBeThtRjFIUWt3cVpGMnJhMTNaT25QVzhPQUZ3RjVI?=
 =?utf-8?B?YUdENW9USUV3OFl2YnJnNUNDMkFnK2tuNW82NmUwWU80N1lyamlFL3oySDdZ?=
 =?utf-8?B?Uk1WRVNWTi9Pb2pQZzhONzhrN1FKNTFRV1JFVWRna1k5enN6OGRwTXZkdXVU?=
 =?utf-8?B?RWVhR3BqZXhmckxlTFdEWmlMeHMwTnlFeDBWMHAvRUx2M0RjUitlZWxhYTIv?=
 =?utf-8?B?ZGZnd2Y4dDkrL3JMNXlRZk9WWWRZT0dqNGdlc3JabE5uY3ZEeHY1NXY3c04v?=
 =?utf-8?B?QmdLRXFYejJaOEphVEZWT3B4UHAyVFNoeE9FLzR2aFJOVDhKNFIydDdOcm9h?=
 =?utf-8?B?aU9WT3QvOVB1NUpzSjlKbVl1cHUyYW1pVVYvWjc3NVovNnMyTk9saktUbXIv?=
 =?utf-8?B?bkxIZkN1Q0pZcFJ0MCtKZDMycWRYM240QlRFakxvbFRJbmFEbWxTbWRTOENH?=
 =?utf-8?B?SzNRL3Rob0lRdldEMHZVam5GcjJjbnhTL3BKY1hQakVzUm10STV5cytvZWxO?=
 =?utf-8?B?UFl2aS9ra1I3bmppajFsczFXQU96cUdCaGllM2hqc3FCa2hjSDVaRkRmSCtL?=
 =?utf-8?B?QlpIUXN1aHliaXNPSk9QdXBVTGdDWDYxdnhpTWdzWVVhOHFLSWxrdGZMYmto?=
 =?utf-8?B?MTFqWkFkejY4VUdTWk5iKytxL08wV0NwQUNkc09qeWVLZXBNUnJkS1JYM1NG?=
 =?utf-8?B?TFFWdXZlRFB4NlZRY0RFWUp0dmRPNllVQVpoak9JWktaZjB0MmQzVEs4a0lF?=
 =?utf-8?B?aFVCMFhibjhOSWFDNng2RnF6ZEpaVDF0M2RJTitOLzBiTysxNXREZDNyN0Qw?=
 =?utf-8?B?T3IvZC83VE5WazNnR1p2YnpqeTJESlJocE9pWE1JYmtxSlZKeEZmNzVYZTd2?=
 =?utf-8?B?S1RySE9mL0dJQmxXdy9Fb1NpL0dMMXpvVzFLNlRlWVdPb1h5MEcxWUtQamJ4?=
 =?utf-8?B?WldwcjA0OFI4NVIvNjhMcTY5ZnBFcUlPczlJOWR0aHk0NHVJWWtFcEd5MnB0?=
 =?utf-8?B?WGxRV09lQWErUmxpai9iMStPNDlyOG5QcmdmMTVQZHBid013Ri9pRi9qUDFZ?=
 =?utf-8?B?d2xXSU0rQ1lLMW0rYXFYem5pS2NYc1JSSEtsTEVGQ1hyWHRJM2xBZmNoQWxX?=
 =?utf-8?B?U3FxeXNUODhpN3FVSlR6SWg0RTQzNDRKRDRLV09iNklGbjdveUZ6WXJ5RW83?=
 =?utf-8?B?bENZZmEyMTA1NjBHSTRncnRqS3JSd1UxRGZwMmE3RHJkaWpvblJDbGl5MlN5?=
 =?utf-8?B?YWxaRmJkSnU3NnJnanNOVXRQL3NpQkRvNGhKTWpIUEYyTVp2QUppdHFuQ0pJ?=
 =?utf-8?B?ZjJuVnJQdFhFVmxRT1dYSVlyeFliWEpxVHdwUENvbTUrd1J5U204TndyTzhm?=
 =?utf-8?B?d3FXaklnaTNQV1NGUHYyYUR1bS9wY0M4cEdZY0VhUVl1NHVBdVFoYk1reTdL?=
 =?utf-8?B?RGUwMWJiQUpCMmZsWnVLRndSYllxalhHbWJEemVlbHNFbk5XbEhIOXFmWTg0?=
 =?utf-8?B?aHQvS3ZTV1lSdG9KZHIvUlBzbi9QbXBveGMrNzhHdmw2K0VOM2M5dGc2UXk0?=
 =?utf-8?B?a2dVUHlpOTJsQWVGM3RsZlczaU5ybjRVN1BjRkYyWlpwaGVNU0x0em1iUGZC?=
 =?utf-8?B?SlpYR01wMDRvQ3I4MURicUFnL0VxTkZVQkRoekFCNzR2MjNUNCs3UUx0czdY?=
 =?utf-8?B?b3JaWXk2cURNUlF2aGp1c3JoRXdHZ21yVDQxaTFWTWc3R09BWVZBK2FxVjE4?=
 =?utf-8?B?alE3L3BjRWZhTXE5S1BZQTE3S3FmdzgyQlJZNWFnQWhiTVZ1L1U4REJrcU1v?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeab47b3-4e48-4e17-ded1-08dd349396fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 12:04:25.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eXuUU2hTCP7cGqId02M++QfIbu6Q/OahffYDwY/nYgWZZvOxt35m5OSvEeHIwOw3YN/o0fFcCmTzy686JCfECW/M+tsO1Kj8kMXrZLd+Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
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

On Fri, Dec 20, 2024 at 08:42:04PM +0100, Michal Wajdeczko wrote:
> Add tests to make sure that recently added GuC Buffer Cache
> component is working as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: rebased (Michal)
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 335 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.c             |   4 +
>  2 files changed, 339 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> new file mode 100644
> index 000000000000..8a90f832915b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "xe_device.h"
> +#include "xe_ggtt.h"
> +#include "xe_guc_ct.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define DUT_GGTT_START		SZ_1M
> +#define DUT_GGTT_SIZE		SZ_2M
> +#define DUT_DATA		1

DUT_DATA is not used.

LGTM otherwise - just simple sanity checks, and takes less than 0.2s to
execute on my system.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> +
> +static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *xe,
> +							      struct xe_tile *tile,
> +							      size_t size, u32 flags)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_bo *bo;
> +	void *buf;
> +
> +	bo = drmm_kzalloc(&xe->drm, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
> +
> +	buf = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +
> +	bo->tile = tile;
> +	bo->ttm.bdev = &xe->ttm;
> +	bo->size = size;
> +	iosys_map_set_vaddr(&bo->vmap, buf);
> +
> +	if (flags & XE_BO_FLAG_GGTT) {
> +		struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
> +
> +		KUNIT_ASSERT_EQ(test, 0,
> +				drm_mm_insert_node_in_range(&ggtt->mm,
> +							    &bo->ggtt_node[tile->id]->base,
> +							    bo->size, SZ_4K,
> +							    0, 0, U64_MAX, 0));
> +	}
> +
> +	return bo;
> +}
> +
> +static int guc_buf_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_ggtt *ggtt;
> +	struct xe_guc *guc;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
> +	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
> +
> +	drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
> +	mutex_init(&ggtt->lock);
> +
> +	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
> +				   replacement_xe_managed_bo_create_pin_map);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
> +
> +	test->priv = &guc->buf;
> +	return 0;
> +}
> +
> +static void test_smallest(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, 1);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_largest(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_granular(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf *bufs;
> +	int n, dwords;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, bufs);
> +
> +	for (n = 0; n < dwords; n++)
> +		bufs[n] = xe_guc_buf_reserve(cache, 1);
> +
> +	for (n = 0; n < dwords; n++)
> +		KUNIT_EXPECT_TRUE_MSG(test, xe_guc_buf_is_valid(bufs[n]), "n=%d", n);
> +
> +	for (n = 0; n < dwords; n++)
> +		xe_guc_buf_release(bufs[n]);
> +}
> +
> +static void test_unique(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf *bufs;
> +	int n, m, dwords;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, bufs);
> +
> +	for (n = 0; n < dwords; n++)
> +		bufs[n] = xe_guc_buf_reserve(cache, 1);
> +
> +	for (n = 0; n < dwords; n++) {
> +		for (m = n + 1; m < dwords; m++) {
> +			KUNIT_EXPECT_PTR_NE_MSG(test, xe_guc_buf_cpu_ptr(bufs[n]),
> +						xe_guc_buf_cpu_ptr(bufs[m]), "n=%d, m=%d", n, m);
> +			KUNIT_ASSERT_NE_MSG(test, xe_guc_buf_gpu_addr(bufs[n]),
> +					    xe_guc_buf_gpu_addr(bufs[m]), "n=%d, m=%d", n, m);
> +		}
> +	}
> +
> +	for (n = 0; n < dwords; n++)
> +		xe_guc_buf_release(bufs[n]);
> +}
> +
> +static void test_overlap(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf b1, b2;
> +	u32 dwords = xe_guc_buf_cache_dwords(cache) / 2;
> +	u32 bytes = dwords * sizeof(u32);
> +	void *p1, *p2;
> +	u64 a1, a2;
> +
> +	b1 = xe_guc_buf_reserve(cache, dwords);
> +	b2 = xe_guc_buf_reserve(cache, dwords);
> +
> +	p1 = xe_guc_buf_cpu_ptr(b1);
> +	p2 = xe_guc_buf_cpu_ptr(b2);
> +
> +	a1 = xe_guc_buf_gpu_addr(b1);
> +	a2 = xe_guc_buf_gpu_addr(b2);
> +
> +	KUNIT_EXPECT_PTR_NE(test, p1, p2);
> +	if (p1 < p2)
> +		KUNIT_EXPECT_LT(test, (uintptr_t)(p1 + bytes - 1), (uintptr_t)p2);
> +	else
> +		KUNIT_EXPECT_LT(test, (uintptr_t)(p2 + bytes - 1), (uintptr_t)p1);
> +
> +	KUNIT_EXPECT_NE(test, a1, a2);
> +	if (a1 < a2)
> +		KUNIT_EXPECT_LT(test, a1 + bytes - 1, a2);
> +	else
> +		KUNIT_EXPECT_LT(test, a2 + bytes - 1, a1);
> +
> +	xe_guc_buf_release(b1);
> +	xe_guc_buf_release(b2);
> +}
> +
> +static void test_reusable(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf b1, b2;
> +	void *p1;
> +	u64 a1;
> +
> +	b1 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(b1));
> +	KUNIT_EXPECT_NOT_NULL(test, p1 = xe_guc_buf_cpu_ptr(b1));
> +	KUNIT_EXPECT_NE(test, 0, a1 = xe_guc_buf_gpu_addr(b1));
> +	xe_guc_buf_release(b1);
> +
> +	b2 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_EXPECT_PTR_EQ(test, p1, xe_guc_buf_cpu_ptr(b2));
> +	KUNIT_EXPECT_EQ(test, a1, xe_guc_buf_gpu_addr(b2));
> +	xe_guc_buf_release(b2);
> +}
> +
> +static void test_too_big(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache) + 1);
> +	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(buf));
> +	xe_guc_buf_release(buf); /* shouldn't crash */
> +}
> +
> +static void test_flush(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	const u32 dwords = xe_guc_buf_cache_dwords(cache);
> +	const u32 bytes = dwords * sizeof(u32);
> +	u32 *s, *p, *d;
> +	int n;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, s = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
> +	KUNIT_ASSERT_NOT_NULL(test, d = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
> +
> +	for (n = 0; n < dwords; n++)
> +		s[n] = n;
> +
> +	buf = xe_guc_buf_reserve(cache, dwords);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_PTR_NE(test, p, s);
> +	KUNIT_EXPECT_PTR_NE(test, p, d);
> +
> +	memcpy(p, s, bytes);
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_flush(buf));
> +
> +	iosys_map_memcpy_from(d, &cache->sam->bo->vmap, 0, bytes);
> +	KUNIT_EXPECT_MEMEQ(test, s, d, bytes);
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_lookup(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	u32 dwords;
> +	u64 addr;
> +	u32 *p;
> +	int n;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	buf = xe_guc_buf_reserve(cache, dwords);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_ASSERT_NE(test, 0, addr = xe_guc_buf_gpu_addr(buf));
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p - 1, sizeof(u32)));
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p + dwords, sizeof(u32)));
> +
> +	for (n = 0; n < dwords; n++)
> +		KUNIT_EXPECT_EQ_MSG(test, xe_guc_cache_gpu_addr_from_ptr(cache, p + n, sizeof(u32)),
> +				    addr + n * sizeof(u32), "n=%d", n);
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_data(struct kunit *test)
> +{
> +	static const u32 data[] = { 1, 2, 3, 4, 5, 6 };
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	void *p;
> +
> +	buf = xe_guc_buf_from_data(cache, data, sizeof(data));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_MEMEQ(test, p, data, sizeof(data));
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_class(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	u32 dwords = xe_guc_buf_cache_dwords(cache);
> +
> +	{
> +		CLASS(xe_guc_buf, buf)(cache, dwords);
> +		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	}
> +
> +	{
> +		CLASS(xe_guc_buf, buf)(cache, dwords);
> +		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	}
> +}
> +
> +static struct kunit_case guc_buf_test_cases[] = {
> +	KUNIT_CASE(test_smallest),
> +	KUNIT_CASE(test_largest),
> +	KUNIT_CASE(test_granular),
> +	KUNIT_CASE(test_unique),
> +	KUNIT_CASE(test_overlap),
> +	KUNIT_CASE(test_reusable),
> +	KUNIT_CASE(test_too_big),
> +	KUNIT_CASE(test_flush),
> +	KUNIT_CASE(test_lookup),
> +	KUNIT_CASE(test_data),
> +	KUNIT_CASE(test_class),
> +	{}
> +};
> +
> +static struct kunit_suite guc_buf_suite = {
> +	.name = "guc_buf",
> +	.test_cases = guc_buf_test_cases,
> +	.init = guc_buf_test_init,
> +};
> +
> +kunit_test_suites(&guc_buf_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 261c7c74417f..ce6d9830e13b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -170,3 +170,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
>  
>  	return cache->sam->gpu_addr + offset;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_buf_kunit.c"
> +#endif
> -- 
> 2.47.1
> 
