Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B659ECD99C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 20:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CDD10E02F;
	Thu,  5 Feb 2026 20:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWXgB2M7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1182510E02F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770322073; x=1801858073;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GI/fB3UFL7zSE3H3ziiiyOF2IanKiRcsDonTENNJO4M=;
 b=hWXgB2M7IL2fKq+xGLcyrwZSLmWkp1LEIb6p9aPCKoWWTxQiMnY6UPyF
 Ni7cmK0bFV3f7lqJ8VsfJ9RkXbRp8VtArFxSQj33YTVRWEovNxuIborIs
 1eNfQx3Ci9/cqPjx6NtZTPwFuVxhFnjW2Ptq8UePHDndRy4g5z/X343/n
 9B3yTeH3mBqfaqvaBSgc8hqgqZMBhpC5OnYuqudlYqQVYc3dc5/9OBsqT
 ial9cLKwwdsm8OeMcsW4mag3Px1/aSAyhtNhrYjAbsPSM+hdAWf9L/SYK
 H1yaoFKdHFo9fF/4tzHYC8cwasMu9wg8fWq82Hs5w/XntPFx9YsaDN2Bf g==;
X-CSE-ConnectionGUID: 3A3p0l+4Qp6WsCh0whPnSA==
X-CSE-MsgGUID: OyyjLG8/Rsijt+B1B/Ms5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="96983437"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="96983437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 12:07:52 -0800
X-CSE-ConnectionGUID: PUxzP9BMSuC8Jcmn3a0Nxg==
X-CSE-MsgGUID: kKVUFJu0S7md+a6Jy3hIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="209946206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 12:07:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 12:07:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 12:07:51 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 12:07:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwN1HeDjr2cUldXMAg9irCja0YpIlBM2oLibt3i4Y01UfQHgKZ2wbSnO4HiEex7iQ3DL05M8QG8SGyUXKjtN5TsV2v4odQMZVkPtk8Hgs79BuX7COObEI1mm6VKKGu6OUKFFaAa1AfNSAq9PXvGojFYJWvEQXD5ybt6nBCVfBNYMPO67m4B4CzbpF30towfZBD/D7Dyg2DoDdtGGBTwcDXDPOceUHx6r/1uCLvFfmkuIRZw3X8m4RXYxM6faHgGMvgiFVNzJvR7SpOAvPX8GiETee7Da8YxrsC7LHAxGU/lGYCmk7g2gpd0d3hLmENcrbSRIh4uLyKm4L8soiR4i5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrPkRYZuPZIUunYJuAuS+lb1koN0eYB5lXKUsldrOVs=;
 b=ZHKCzozbrWzk31UvHZfJlT+G4V6YO5exiMGemtvRHCdCowNiEkCQ/06DOShM5wmVx/sBMuQ79fGGWjeB0/Fag/JTjrfJiLdksJNXI6wz36db9GKXMtH62KpcwHWeWlZAZ/YueqlpBv/Ufy/JKjScJlXMrThR+m+3QS19/3OMlg7mZ+QWWr66PQPdKd5rh5V1Bykgqiwa3Ua4VZ3JWQ39xFl3yGs9Roh9nlv2WPS6HGMP1KUoz5XE66rEPYDpLvovhWZIKRMKVMVNX5QdDJaYvJoCnDBQ/6BU7d8p8hk1O9ienx3reXBnRR7N/7cxqouA5Xy8UzogY+xKHXtPgBR4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 20:07:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 20:07:46 +0000
Message-ID: <324eeef3-47c2-443e-9aee-2cc932c26fea@intel.com>
Date: Thu, 5 Feb 2026 21:07:42 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Some_more_?=
 =?UTF-8?Q?=5Ftypes=2Eh_cleanups_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
 <177030162507.228151.7216687703707281185@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177030162507.228151.7216687703707281185@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: fee79729-4bae-4075-7cc8-08de64f23a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWRRUHA0Y3VBWjg1ZnJZK2wxaXlSdmxvMmI0RkUyM241Y3NtYldiR1hmcHYy?=
 =?utf-8?B?cEE1ZjJBTjBzeHFTbkY1L3ZDY0lzUVQyTXJaa2pXeWxsdXlnMTdHUEgxZXcy?=
 =?utf-8?B?S1dWSkxUZlFvWWpvK3Z0Y05UMXJWOEc1VklyMnZPRUtWbE9TcEU0dlIwdGRr?=
 =?utf-8?B?TUlqNGRMblBudzZNM0ZZWktIVDc2TzNRa0s0MUlIcCsyNitQblVsT3JTZVJM?=
 =?utf-8?B?a05teUxDZnpTRGhRSnRZNXVqNXhYOGdPMzVXbnJYcHVyL2VqNTdaSytMZWV3?=
 =?utf-8?B?S0luMHVvNVdKYjQxOXd3MVdINllBNU9WaSt4N2xETVl4Z1V3QTJWa3hOejZ5?=
 =?utf-8?B?SjlJbHNjSjZZdmVKUm5Qd2ZEQXVINXF1cUpsT2ZGV1IzSnJHNE9JUVRab0tt?=
 =?utf-8?B?NFc2cCtjeEdHUXYxWmdqblNjWlpjV2pOOHlHcVNLMHB0MzlhSDNHQ1lWUmwr?=
 =?utf-8?B?c096N2ZWNkFUVkw2MkcrK2pRbDk5WGVzc3RqT3BsR2dmcVpvKzA3eEw0cCtK?=
 =?utf-8?B?N25wblhQZHJXUGNqM2JrUk9yanc3NFVXRldrejRYZEM0b0FaRVZwejJqalZ6?=
 =?utf-8?B?Ly9VT3VHRG5HNHk4cURiSTdwTzBqZW8vMWw2YjZjd3pRZEdsSzFrbXFPWERZ?=
 =?utf-8?B?UWNYWFBwZ2RYYTdraUI2Rk1VdzBUU3YrTlcyc05PMW94SkNWRmJEbXRBS3BX?=
 =?utf-8?B?azZycGVlWjZodzlPaWR5TXhrTUwycnBiQnNNbmV0bVNGNi9kZkxoRExwSVpa?=
 =?utf-8?B?T20xNFlrdERjMGJvSEYzVDh6NkFKKzFhNkMyYVJlNVd6OGFSTitsYm9xckJP?=
 =?utf-8?B?Y0RzM0hrMlF1MXR3SlNPSjdFVS91NnRGMlRWZlIxTmt6d1RXTXZvVDZ4akJs?=
 =?utf-8?B?V2ZORG9QajhsQldYWWJEQyttRXpUSWh0aHBjbjN1R1VpNWJ2UXBZUkZYc01j?=
 =?utf-8?B?MWt2bWltbmZtYktpSDU2SVJCVG5ZOUJ0c3JaakhmQ2FHUG1qYk0vWm5XM0Y3?=
 =?utf-8?B?YWxhTkgzRmtUVmVxbXltZXIvSWZNT3hnRzI4TnFIdGhKQmttZmgyeUlhOXFv?=
 =?utf-8?B?TGVHenVXcDczakYyRlJkV3gzd3YvdDhUN1dlOVNNT2dLblRBaHFoSkNOcE82?=
 =?utf-8?B?bWJPeThkYlNka09hc2QvM29DSzBOeEFDZTVpbCtVSHRyVisrd0FqYkNSckZZ?=
 =?utf-8?B?UkJWWHBTdnEwNGZrUDFNVmtyWU1Qeldmc1diL3BGcmE1VkNRQ2Zrd2h4bnIv?=
 =?utf-8?B?cnNoc2o2ejJSQ0RmM2haZTA3RVZhdUgxZkFBRHIrWWZQSXR5S1VtdngvY2h2?=
 =?utf-8?B?VGZ1Y1NSbXlvczU1QWdmTlNERlRnS0RBNjF6VnFiOXdsL3pERlJ6My9uUWVH?=
 =?utf-8?B?RkV1eHVMT3FWZlFtMk0ydHB3TVpsdE14MkNNQklaYldSSm5CbzVUcVJjK3h1?=
 =?utf-8?B?Mms1WFpTYVd2OVh3aFl6RlhwOEE3YThrQWM3QzZlaitWZ20xdkdlNFFCWkZX?=
 =?utf-8?B?N3ByMUQyTW5RWDBEWGlaV1Z4WkhDY0FZdVJpYVNVL2ZqQ1dOSFc3TWFGOHIr?=
 =?utf-8?B?T3V2dnBkajFyaGhsUGFTb2dsbmgzZmdvelhIR0Nwb09DUEQwbWtGUktGMnpE?=
 =?utf-8?B?dy9zMDdYWEpYWGU0Ny9ISWNmbnZVSVB5Um9yamNzZUpvODEzRWNhTjFvSVhl?=
 =?utf-8?B?VjdBa2ZSL0lHRzdJaUgwbVkvcVBvRi84cFkrZ1R4OWlaVVJwMWFLdWZQV21R?=
 =?utf-8?B?Y3VFNkVkV1Rvd1g0WnErZVZYNis3eEFFdG5LbC8rZnYzZUFqdHBJT1FrYmo4?=
 =?utf-8?B?cXBxZU1iMWdRR1pqODhQZVE2YzJkblEvUm43L3g3c1UrM0gyOGdqREUxZWc1?=
 =?utf-8?B?Q3ZGVDByUytobUJsZnFOQjZPaGNxZGp3dUxXcGhsdjE1ckhBbDY4M2Rva0cx?=
 =?utf-8?B?cFVNMlVoWDhNOUMrdG5YRFlyOTZlc1VZU3loZGRhYnFzS2lYbm1kaHZjTUkz?=
 =?utf-8?B?b3lRYUx2bWJhQ0ZDOW9rMXVXV2QrL1Bvdm81T2ovNVVnanRxWExIeXdDVjJF?=
 =?utf-8?Q?Cc+rl8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZJUEt0aUtvT3ErTHh1YU9QbkRhRHpGcHJ4Zk4yTzR0eXVJUnUrblBjbzh2?=
 =?utf-8?B?ekpLN2tIVXdwOXpCT1BLYTBoQTViaExwU0F5d1NOanBYQkw5djBBOThHMzcw?=
 =?utf-8?B?cCtVdGJDQXFUNVBuM3V0cXBqY2FEemovTUFFZFNodHdFQ3IwUzdhOVAvL0kx?=
 =?utf-8?B?emtYUXIzWU12ak0xTnBFSmluU3ArMjl3Myt2a21pRUtDdjdNNC9GRDRjT1BX?=
 =?utf-8?B?V0hhdythTTBFYVNENE9vNUpNL0dudDVaRnJ2M3JBMENwdmJTbFFlL213SGJr?=
 =?utf-8?B?MVdzV2dvRDJBSG43eTBWS25LM2syNlA1dmVteENZbVpQMGUrNERSOUpKTHRi?=
 =?utf-8?B?TVppK3BSVEJyQjRFNHp0VmExTTFwOHBDY0JDekRIN28zcFRGVTl6cERzRldY?=
 =?utf-8?B?b0x2L1MxWmRWZjR6d3BtRUFtRlZQUEN6cDZhT3MwVUdidnN6bE1GWHdLby8w?=
 =?utf-8?B?bDJDWUdBRjdFTE1pb1ZzcHZ1MVQrS1M0YjREL2poSlF5UHZPNXBRZitsNnRi?=
 =?utf-8?B?VUdNbmVYUUcvNXdnODFUVUJQRHoyR0xmdm1VTWo4VVhMMFJvWDlPVk8zbm5I?=
 =?utf-8?B?dzVPOW9JTVF2RDhSczVlT2xLZ2N6ZzQveG41V0RSRHAzSkpwVm00VnE5YzE5?=
 =?utf-8?B?K0JGaGNHeFlRTHZvVmdJMUQ3ZjlhclljaDJEWXkzTGJrbzVQbU8xUUNyZ1pC?=
 =?utf-8?B?elZRcVlMRGVjREVHbTh4bGdCanRFUnVXYWUxekwvQWlwaWUzSlhoVksyQThH?=
 =?utf-8?B?TzdlcnM1Y0N3VG4xcE52Q013WjBvemZ4UkRRUzZGanA1V3hGQ3hXTm40NGlJ?=
 =?utf-8?B?TlJqbTAwQldYenovWU00cmVMOGFzQ0poWkdnWDFweVBmMTFmZWJTeHdSUnJr?=
 =?utf-8?B?M3RRNERPSDUySkVDUzZBeHpvNU9ScVdnWFZXbVk3cXdQN1BzV213dGwwbVRJ?=
 =?utf-8?B?d21RblgrcU9kWTZINVVTSkdBRE5NTFNYeU1oWlhldVZBazY1eVgwUHhKU3lU?=
 =?utf-8?B?c1hkK3pPaW9VWEgrMjZuaGd2Wk1FcmNQMmZMT0ZyRHkwL28wUWE3R1MyZlRp?=
 =?utf-8?B?ajZHRkdRN1d6c3BEeERCM1lHUExDc0RxcEQ5b1NyY0w5N1BFSmhkU3gwSlJy?=
 =?utf-8?B?L1RPYjFKWFFreitPUGVTWWtvOFo3UlkwM0dnNE82emFVSFpva29mNk85QThT?=
 =?utf-8?B?eHVMSm04THlsUXdKeFBQUmZaaTNHL09Nc0pYa2puRXpGUkhYQytRVFZmbVpP?=
 =?utf-8?B?bDBZSUlXRGVSZUR1UzhqMzJGSENESTdNeVUweEhBUVIrcmFTKytDbWRRbEtR?=
 =?utf-8?B?eG9YZkFvRFhnZnM0bXRmUnpHUnRFZytiMDlVN2lPNzAvQ016WVFrdmN2VlFx?=
 =?utf-8?B?YlBqZHVNSWZUYTN2bm9DcFZub2dkbGQwRmZDdkl2a3NHVWtzZHZzbUs3cVEr?=
 =?utf-8?B?VVFXTDJSOC92bEFTM2Q1RjZaQTE3L0RKR0VFa1loV0xRUEpXcGl1R3l4VFJV?=
 =?utf-8?B?UDViZkxUTXF0cTBmSTJpTWs5SzYzbzVpRWxJeXRTUDdPRUhaalFObFNpQU1I?=
 =?utf-8?B?SlNqNzBsaGlJY1JvMmtHUGh6WG9TUDloaURtVjIzN0ZEa3hrVGU1cjZENUVU?=
 =?utf-8?B?U3hPR0pPd1NhRXUxOEtHM3UxSXVMdDRkVjV3Z0k5aWVPSE9RNk1hOStoSmQz?=
 =?utf-8?B?YUlrODZFVU1tNnBRR3BIWUQyNGVaRkpIdEZFK0dnTXdSa1ZnQlRkUUpnRWNX?=
 =?utf-8?B?UGlJUUZDcHJPL3FOazJiZi9jZTJYNG5IUDZMbXRjMTExejg5aWZnaUd5YXNq?=
 =?utf-8?B?b1cyRmFha05PWkZ4TFp2NGs1SXR1aWxaa1hmSW9WdXg0N1R3aGp2ZkRRUVNK?=
 =?utf-8?B?ekVRWk01WGtLSjNadUNNRFFlckdvdENBV1hBVmsyZy9SN1h4Zk9YZFdlYVR1?=
 =?utf-8?B?TVNZMkdJaVR2WTZwbXRDNTlUWFUxZk1wMlBWaU5OQzkvMWp0aXhXcElPS0gy?=
 =?utf-8?B?aFZmNHZxaTQ1WFNwKzFHTmdOSUN1WTE3WGZ0blpSekJRMHZRNXpnaWhLQnhF?=
 =?utf-8?B?MHI4YTRua05pWm5PUmFwUE1aZCtHQnhacEs0VHF5V1pjTktuempPS1ZwcU84?=
 =?utf-8?B?TW92WEtEZnJzRU51Q0Y2V1VETHlBVDNiR1o0Y0xhU2NwR0p3M25EK3J4MnpC?=
 =?utf-8?B?d045dUszaXFQVlNWMTNSK1FVbVV3cmk5cEVzMkVNYm5SQTZyUVFadXdNRXlJ?=
 =?utf-8?B?TlE3UENFYnRLS3NwWm5HaHdrTThUOXdqTWlyTmR0S0ZWa3RsODdkNktZSXFX?=
 =?utf-8?B?VldRb2FJaTVpUFJ0ZkJGd0x2Y1NxTmQzRW5sMjczdFhqVGdPcEorMW1Rem40?=
 =?utf-8?Q?2L0c1f1DmYcLDeUI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee79729-4bae-4075-7cc8-08de64f23a8d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:07:46.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAG9K3juCJXftwDxKNIVnrMhWCtmuVkU1HVCNE5mn6qb8CV9GoodJHkpBpoUlNVpWvaNvO3M6sLisYFN4SNS2ZQseZgNTaLEwx+JDK0g8pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
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



On 2/5/2026 3:27 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	Some more _types.h cleanups (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/149807/ <https://patchwork.freedesktop.org/series/149807/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149807v4/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149807v4/index.html>
> 
> 
>   CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_FULL -> xe-pw-149807v4_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-149807v4_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-149807v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-149807v4_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149807v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html>

unrelated

(kms_flip:7788) CRITICAL: Test assertion failure function run_test_step, file ../tests/kms_flip.c:928:
(kms_flip:7788) CRITICAL: Failed assertion: end - start < 500
(kms_flip:7788) CRITICAL: Last errno: 4, Interrupted system call


