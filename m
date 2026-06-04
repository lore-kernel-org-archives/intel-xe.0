Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F72CD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 08:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0EF113D8B;
	Thu,  4 Jun 2026 08:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nu1Il4KE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08489113D8B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780560945; x=1812096945;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wrINzPmSYP+FKi9GdCpsAPlvn1PuJvB9VkIHlD+LL9s=;
 b=nu1Il4KEnhAGFjQrcfEPNg0qdJaKlCaQKbzR73y+xyn1hyVRgzLpL8Cm
 9rk1ELCMi5EqM/iJzeEhiTxICT6PwPrNQi0vq0v5zFi2cWqTq3IiU7o1D
 S0xpKhVS0JfSuRCdM9x5LlocqcW165/ZRZC4stGolT21qrwt+TVO4UylJ
 LAHhia2ybxzYFmQ40EKDvV1Djo3VikZIbZc2h9bju6Ku7PUI0WLFTvmBG
 Igld4FGG5ed1uLNHQQwK79nuAVJa2ia1qC3K8JyOfNHtrjV6z6iYPdokV
 98X9eTY/G74HgtABt6Jgygrn5ORYPzVaADKHgk4+tFlDuUnovCsSNGjsI Q==;
X-CSE-ConnectionGUID: wXKf4H2dRs6VHf4kAO9fqg==
X-CSE-MsgGUID: cnw5vCeiRT60yqRS00rnMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91956222"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="91956222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:15:44 -0700
X-CSE-ConnectionGUID: uI8s6puMTlGVZoNfM7Z4Sg==
X-CSE-MsgGUID: kvSMLUWBR/OZXwLllF6hnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="240288831"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:15:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:15:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 01:15:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5PqeRRvrOr/SNwtH6/pYghCOcrXJS5S+dG9jcUiwx+wlm9lwWoyvkPgkzrrDrJfnjTEFHBGGJRobCaiP54z3DrjoP6/1aHS+0JU/CSh2MaQ3hIE7Yq08bxsBMTCnHOhWvx7hxDeiJ7hHsSAjZ/YbdgmxPWlR90Eao3IvpInC5KzKOyDL953kgcoQ5bgGrjTlwejull2DyZ7LLY+bepV2VdTbbFBtENjP+jRUP+3ifuW1vaUsdJZz9ClGsoaf3DvyQ9KTs+qqGI5S+vFCbUQQyEDNbkx9fElp98SSx9ifM9M6W9gQiKPV8zMGv6jnOU18EKJq1kq8Tj0b6sA0jy0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9O0h/JUofFKB4KJcAkQHYWgo0SLQHzXNilUfoxzRXs=;
 b=F6TDBtS9fsZTpNeGI8ufBQ/NEyT5FbjEOqP+KQ4hb6S/oeUfBwdcAkI/qTq9ICiXi3QGaZfI6LLcEfjqhPVdpIp20PXCGD2XZbbsQ1oQYTJgaTNouUztx60hA6Vps1w8AF43HHyoKl4JNoj3hr/go6XKkDbu803GeIfIHWLtSxYPmJYgKB2y9ZCHvFnMlpGx3a2KvXND34v9H1vkQc2Xgj6/61ko61JLBoRasJcGaZAtcf0P48bujv0zWs/WgmcxEDyYQ8+DBhBRBqZw6YQa9mQTKcgWuulKbsa1I3gmWWRJJ/rbcSN3c82i4ZOUXoiXFKGYZ+KE3Hwt9jqvuTD1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 08:15:36 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 08:15:36 +0000
Message-ID: <58d05a8d-2382-4b95-bc5a-83228962b3dc@intel.com>
Date: Thu, 4 Jun 2026 13:45:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
 <49b334e2-a40c-4d6f-95f0-9cf5e959d717@intel.com>
 <ca4450cb-8bbc-4343-9f87-94918430a93d@intel.com>
 <8eccfbd9-2154-41c9-8e3a-1d101c0a2752@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <8eccfbd9-2154-41c9-8e3a-1d101c0a2752@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e351fa5-87da-4c33-d306-08dec2117483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: mTZtsQ7bKZ6VYuKJGg2EIVw+H1qtgA3cGskamhX76gL8u1py9p2nmnF2nILCN1qf2lSs9GY5jU9OHnyrrttRPDbclzY9PKQb6QRCYXjb0GaZjmWG+JGninNjFXXXcAOPWbXES8aQopkQL4YjgUQigdBp4lRwj3bM/7b+W5UpBsaACNDAaoKT2HQ9ktbxug+fs4QwDz0bK0DO7i5fFVkysBLO19zxWHhebhIAz8dIVSLzehiRmUbV7sWN19icl+S51vtowRh79bi7OkNoj3+MFbkpt675G1nL6qtxEmIf+VC2AF2h2Z+6B4pfC8eu/rpTXfqX1n7gfVcFsxvhC9GK8P2IqDwUsZWEhMPwQmgLMKCGmtP51zRuSi72gHpA6VSNpdq5wle0PiIuq873odl/DilWppCEu9wCntCIn75MBs7H+qHxd78dsQXWxY5dUzXQ8r6xhu6Ss1TeVyyMb+4rOQxpPx5Rkw3LMcAKy1lIXB2Uqi+K6/bVsTaLs1pk8Hsz0Pj9o1Z+7UIqNVA8Qbnom61yiU+SaSDcYnReY+SIM64oyslUkTtG0qh+gflA2JjaXPx5YVVd6PyCCv0o/rXS5riHOuUS4anx3zBn/pyJ9wrrtTZ6ymB7t7UquAp7RsUhsg8lRpJhRZ2P3xqgU91OYquDjY8gI7dLb27jczFQlVDAxEM3ZppYXkNAjxUcUHR61ISD3HxC4MDPvdAQ18jt1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVGQmZpZzJ5UUQ4VVR0YUdMdEJ2VjhyRzZsb2pLSTRXSlJLcjk4OEJTWG1H?=
 =?utf-8?B?ak1oazROVWIzeE5kcDlrbGhiN2wvbHNnb3Y5NUc3T0dkYmxmMlZMYjVRMmNH?=
 =?utf-8?B?Q2hqZStUaEQwQ2g1di9IOFhFdnVadHYyWjJGK2VXNmJVaUJrL0tqaVNUdmR5?=
 =?utf-8?B?NGUzSU9qWnF2WEp5bnRVSkgvMGNSK0RlWEhNREdhdEgzdGVubHoxWE5BMnEw?=
 =?utf-8?B?VGZVRE5BVUp5b0Q3Y2I1ZW9Mck1STlg5OFZVRzhVNWNqMnhaWWlsZ3RybXRT?=
 =?utf-8?B?OVN6RDRiYVNzNDU3TXphNjQ3Uy9QTEZEcXFhN0xWK3VSUFVkVmZJWG5tbzAr?=
 =?utf-8?B?eVpRR2lObGFycDZZb2lTYUVZTXJtK01hbkJacVM0ZUlPZ0kwNGpPWWh1U2Iz?=
 =?utf-8?B?QjM3NzlMeUd5dTJlV28vWkcyTHEyMmpBT1YrZG83WGpqMk1NR2lvQk1vTnNh?=
 =?utf-8?B?UFQ3QnEyOWw3d05mVVhPc3lmdDl0S3R4dzl1NW54RklJY21NNDFpVG4zUFpw?=
 =?utf-8?B?K21XRWxHV3hVczVONjVJNEY4eTVYRTZSWTNBNUNuRm9Wa0lIWFZuMVdHK1Q4?=
 =?utf-8?B?enp2cUxLMVJ4TVBTWVI0NW9Jc0E3Y2pBeW0zVUdHN2VCbEVCZ1hiVE5oczN0?=
 =?utf-8?B?eUVlSXBKK3ZxUnUrbUo1ZDl5Z3FTVVBnQ3c3SDdQODNkejY3bVdCUGIvV2Jp?=
 =?utf-8?B?bTU2enRxekt3SU5PWllyMytueEpKc0V3M1FLMUN2SkJiM1kvVkNCa3VUdDQ5?=
 =?utf-8?B?eXRsdzk1bWl2ZlRDWVVLcUUwK21JTDcvQit4KzM2Q1ZnRjZYakJGbFlLVDA2?=
 =?utf-8?B?Sm9EODJnUGlqV3AraW5PdWo5eldRd1RVMWRtdHJzZTArUGgwRTJ4djQ1Z3NB?=
 =?utf-8?B?dTIwLzFlSGp3d0d6R2FwMmVoNWpsQ2Z1T3RqY3VnVzZtUUNlWi9GelhjZGpj?=
 =?utf-8?B?NStmSlJZOTlQU2t5ekdtRTVTS0hwaHJaMXdtcEFaamxDWGVyejM5aTFyYXlZ?=
 =?utf-8?B?VEZHUGxOMFNVSWhFcUNDNmV4SXlXMXFtOWZBQWlsdStDZ3lFdXh6aEtOMnNk?=
 =?utf-8?B?czlDVE9nbTNGc2ZIRVc3Tk9LUk95ZmhVMEMyamJ4anB0b0ZHTFJPU1lDeE9h?=
 =?utf-8?B?Sys0L3B3aWZ0ckhEaUFoZW5YbUtZenV3dHFlYzF0RkRYVWpzYmVKaG5YYnNH?=
 =?utf-8?B?VEpHQXlYU0VtTUpGVkxyWnZxaU1rRTJKR282dXB6bDAreHcxQUdaeC9EZS9t?=
 =?utf-8?B?Zk41OGFGbFdrRlRmU0dhejJ6RDlLdTlnMjZ4UHlpT0NNYXVlOHFDeEJBdlFP?=
 =?utf-8?B?VHl1OXdKOUY0YTRjS2pwTTdBdzhJaXI4MEozOHRQRFpoM1djVEhyTVZZWDAw?=
 =?utf-8?B?U004d0dDMER5VzVxYXdrN0VuUGYzUXJ1YkIydnk0SGJkWkx2eHlQWWg5dWND?=
 =?utf-8?B?MVRNUzZ5S25PMWMxdEV1bmxqV3dqOWcwNy90NG4vWk1YRi9PcjUwU3lJVlFM?=
 =?utf-8?B?bVk1UWRDTk1yc092ZUh4UjM4cUNibEFjbUgyY1NWYWp1WGFqQzNGbmtnVmsr?=
 =?utf-8?B?MCtwcXFsUFNoS1VEb2Y5TlZNS2J0VVhCZU1oZzhaR1RXMzRLSy9pRFNPTzBN?=
 =?utf-8?B?aGFFZUVpOUVpcE9jQTlTSW4vNkJOMTZ4QXBPeEVNMVFxL0Q3R2dJN0tiRHRt?=
 =?utf-8?B?RFIxRTV3bWRtVzdMSWNFTTB1RGpTcnVPWlBuMGxMOXlGOHJBRDQ5RWdUMVJB?=
 =?utf-8?B?YTdKOWpqUjgyaUViNm85dXBEZ3QrT1BKSzgwNktac1lIWUZweHFWQ3JyNGkv?=
 =?utf-8?B?TjdwcFpjQlhKWUs0YmYxK0ZmaFNWWGNXTkd1UWVqczFQdWErRnRST2tsSEVw?=
 =?utf-8?B?bm8ybFNpM3BsNndIeE1TRjNaSDBkcjJJRVBGd2xJbWZkbU1oNzQxby9mekht?=
 =?utf-8?B?RnpTd2RZRGhRY3NSaVNDeGkyQmlmamNoK2E1emFKbmI1Rmx1WUZETnlZTDIy?=
 =?utf-8?B?dDBsR25PMGZTVGlWaFR4eVJyZEdsb2d5RFpNTkZJZWI4aDY2ektaRkV4WHhv?=
 =?utf-8?B?cEJ1ZEpQZ1dQWVdvQmhoNFhvemluTlFYVk9tLy8vRk5aSkFVS3llM3JWKzZ0?=
 =?utf-8?B?RTV2Ylg0TGtBYiswcUlib0xpdVY2TW5nWnNpZGczZFBsbGhHbW9WNzR5enc4?=
 =?utf-8?B?blFmT0dsMWJiUUZwalhPbHNaYk9PN0JuMG8xVTIrcklLS1hBTm5IWm4xTHhU?=
 =?utf-8?B?U2g5Y09nM0ttUmNxUkxabk5pSUVGWCs5VlppVFo5aUIrRmNJM2kyUnNnMEly?=
 =?utf-8?B?NnFaTktMTkUrdkRRa1phNE02ODQrWkxWK1hKRGxXbW14OEsyQVhuakxuY0RZ?=
 =?utf-8?Q?aX617jgdVJrgtboY=3D?=
X-Exchange-RoutingPolicyChecked: IdV6VkhdXAhJrbT2qjw//RjNHibiyqfFT5KH/uOUCzAYa6jBAnbzmYj/a97JQNSYx+D4QDJxk0G/sNrPuYof1Ru2tTKrsDFNKVA1MKn3HgLBt93Gj3rbSGBxj7gt61g7V40vAxPzZEWK9AO0hPdZrQM7sCTwz8vlZrIRp2miYiH/aqxsRe5RJpMnXm5YLSvm23R70BXNX39QU7Mf1foVjjPW36eQcrmzjm23KzIfFkiGUaypU14zByXR4ZnkYdTlVCzFV5qktZUFd0yECRGPtmb2NpvnS+XW76PHmq4WJWDhQTNu4aj71jWMUO322Wph0euZ+9Ya2BJ2FSquAmka9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e351fa5-87da-4c33-d306-08dec2117483
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 08:15:36.1967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YKRRFTMAtuexrvO4yk9hh/ToBXq1vGSb4DxtAbKNQ5nEtkRFcb5hNTG3iN3/4GTpjLBD2Vin/kWXaFhMBZqjIQz5idGfJyATl0py4r7/kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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


On 01-06-2026 11:17 am, Tauro, Riana wrote:
>
> On 5/29/2026 5:30 PM, Mallesh, Koujalagi wrote:
>> Hi Riana,
>>
>> On 29-05-2026 01:22 pm, Tauro, Riana wrote:
>>>
>>> On 5/22/2026 5:36 PM, Mallesh Koujalagi wrote:
>>>> The fault injection code was scattered: the GT reset
>>>> hook lived in xe_gt.h as an inline function with its own global
>>>> variable, the CSC hook had a separate global in xe_hw_error.c with
>>>> an extern declaration, and each was individually registered in
>>>> xe_debugfs.c. Adding a new error type meant editing many files and
>>>> copy-pasting the same boilerplate.
>>>
>>>
>>> Since Xe kmd supports other fault injection mechanisms such as 
>>> fail_function which injects error with ALLOW_ERROR_INJECTION.
>>> This patch does not cover all fault injection hooks.
>>>
>>> If we are only picking debugfs hooks. This is not really unifying 
>>> fault injection.
>>> Can you please elaborate why this is needed?
>>>
>>> Thanks
>>> Riana
>>>
>> This patch solves a different problem than fail_function and 
>> ALLOW_ERROR_INJECTION.
>> Although both are used for fault injection, their purpose is different.
>>
>> ALLOW_ERROR_INJECTION is mainly for generic function-level testing.
>> It injects failures at the start of a function and skips normal 
>> execution completely.
>> Examples include xe_device_create(), xe_pm_init_early(), and 
>> xe_pt_create().
>
>
> The commit message states that this patch is "Unifying fault injection".
> But the file only consolidates fault injection using debugfs. If the 
> goal is unifying fault injection,
> every type should be part of the same file which is not possible.
> We cannot have some fault injections part of this file and the rest in 
> other files as you
> are introducing a layer.
>
> From my pov, I would retain this in debugfs and keep a separate 
> function instead of a separate file.
>
> Thanks
> Riana
>
Agreed. I'll update the commit message which will reflect the actual 
scope in next revision.

  I'll drop the separate files and move the logic into xe_debugfs.c as a 
helper function as you suggested.

Thanks,

-/Mallesh

>>
>> The debugfs mechanism in this patch is meant for changing specific 
>> runtime behavior.
>> It allows testing of particular scenarios, such as simulating CSC 
>> errors or forcing GT reset failures.
>>
>> The main issue before this patch was that similar debugfs fault 
>> injection code existed in multiple places, with repeated copy-paste 
>> implementations.
>> This patch improves that by:
>>
>> a. Reducing duplicate code,
>> b. Making new fault injections easier to add,
>> c. Providing consistent behavior,
>> d. Supporting platform filtering,
>> e. Making the code cleaner and easier to maintain.
>>
>> In short, this patch unifies the debugfs-based fault injection 
>> infrastructure for better maintainability and flexibility.
>> It does not replace or duplicate ALLOW_ERROR_INJECTION; both 
>> mechanisms serve different testing purposes and can coexist.
>>
>> Thanks
>>
>> -/Mallesh
>>
>>>>
>>>> Create a single, centralized fault injection module
>>>> (xe_fault_inject.c/h) that manages all fault types through
>>>> one table. Each type is just an entry in an enum and a one-line
>>>> row in a descriptor array -- no more scattered globals,
>>>> externs, or per-type inline helpers.
>>>>
>>>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>>>   - fail_gt_reset         - GT reset failure
>>>>   - inject_csc_hw_error   - CSC firmware error
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>> v2:
>>>> - Add multiple platform support. (Vinay)
>>>> - Handle VF properly.
>>>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>>>    create xe_fault_inject_types.h file including those name.
>>>>
>>>> v3:
>>>> - Solved patch apply issue on tip.
>>>>
>>>> v4:
>>>> - Add proper header file.
>>>>
>>>> v5:
>>>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>>>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>>>> - Change 2025 to 2026.
>>>>
>>>> v6:
>>>> - Change return comments of xe_fault_inject(). (Riana)
>>>> - Remove full description of xe_fault_inject_debugfs_register().
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile                |  2 +
>>>>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +---
>>>>   drivers/gpu/drm/xe/xe_fault_inject.c       | 62 
>>>> ++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 +++++++++++
>>>>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 ++++++++
>>>>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>>>>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>>>>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>>>>   8 files changed, 123 insertions(+), 26 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 09661f079d03..d4acb8e9c3b7 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>>>         xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>>>>   +    xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
>>>> +
>>>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>           i915-display/intel_display_debugfs.o \
>>>>           i915-display/intel_display_debugfs_params.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> index 22b471303984..8402189b24ef 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -6,7 +6,6 @@
>>>>   #include "xe_debugfs.h"
>>>>     #include <linux/debugfs.h>
>>>> -#include <linux/fault-inject.h>
>>>>   #include <linux/string_helpers.h>
>>>>     #include <drm/drm_debugfs.h>
>>>> @@ -14,6 +13,7 @@
>>>>   #include "regs/xe_pmt.h"
>>>>   #include "xe_bo.h"
>>>>   #include "xe_device.h"
>>>> +#include "xe_fault_inject.h"
>>>>   #include "xe_force_wake.h"
>>>>   #include "xe_gt.h"
>>>>   #include "xe_gt_debugfs.h"
>>>> @@ -38,9 +38,6 @@
>>>>   #include "xe_vm.h"
>>>>   #endif
>>>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>>>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>>> -
>>>>   static void read_residency_counter(struct xe_device *xe, struct 
>>>> xe_mmio *mmio,
>>>>                      u32 offset, const char *name, struct 
>>>> drm_printer *p)
>>>>   {
>>>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>           drm_debugfs_create_files(debugfs_residencies,
>>>>                        ARRAY_SIZE(debugfs_residencies),
>>>>                        root, minor);
>>>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>>>> -                      &inject_csc_hw_error);
>>>>       }
>>>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>>>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>         xe_psmi_debugfs_register(xe);
>>>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>>>> &gt_reset_failure);
>>>> +    xe_fault_inject_debugfs_register(xe, root);
>>>>         if (IS_SRIOV_PF(xe))
>>>>           xe_sriov_pf_debugfs_register(xe, root);
>>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>>>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>>>> new file mode 100644
>>>> index 000000000000..096e1949624d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
>>>> @@ -0,0 +1,62 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/bits.h>
>>>> +#include <linux/fault-inject.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_fault_inject.h"
>>>> +#include "xe_platform_types.h"
>>>> +#include "xe_sriov.h"
>>>> +
>>>> +static struct {
>>>> +    const char *name;
>>>> +    u32 platforms;
>>>> +    bool skip_on_vf;
>>>> +    struct fault_attr attr;
>>>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>>>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>>>> +                    .attr = FAULT_ATTR_INITIALIZER },
>>>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>>>> +                    .platforms = BIT(XE_BATTLEMAGE),
>>>> +                    .skip_on_vf = true,
>>>> +                    .attr = FAULT_ATTR_INITIALIZER },
>>>> +};
>>>> +
>>>> +/**
>>>> + * xe_fault_inject - Check if a fault should be injected
>>>> + * @type: fault injection type to check
>>>> + *
>>>> + * Return: true if fault injection is triggered, false otherwise.
>>>> + */
>>>> +bool xe_fault_inject(enum xe_fault_type type)
>>>> +{
>>>> +    if (type >= XE_FAULT_MAX)
>>>> +        return false;
>>>> +
>>>> +    return should_fail(&xe_fault_inject_entry[type].attr, 1);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_fault_inject_debugfs_register - Register fault injection 
>>>> debugfs entries
>>>> + * @xe: xe device instance
>>>> + * @root: debugfs root directory
>>>> + */
>>>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>>>> dentry *root)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>>>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>>>> +            continue;
>>>> +
>>>> +        if (xe_fault_inject_entry[i].platforms &&
>>>> +            !(xe_fault_inject_entry[i].platforms & 
>>>> BIT(xe->info.platform)))
>>>> +            continue;
>>>> +
>>>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>>>> +                      &xe_fault_inject_entry[i].attr);
>>>> +    }
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>>>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>>>> new file mode 100644
>>>> index 000000000000..91883ffb5f4b
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>>>> @@ -0,0 +1,31 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_FAULT_INJECT_H_
>>>> +#define _XE_FAULT_INJECT_H_
>>>> +
>>>> +#include <linux/types.h>
>>>> +
>>>> +#include "xe_fault_inject_types.h"
>>>> +
>>>> +struct xe_device;
>>>> +struct dentry;
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
>>>> +bool xe_fault_inject(enum xe_fault_type type);
>>>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>>>> dentry *root);
>>>> +#else
>>>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static inline void xe_fault_inject_debugfs_register(struct 
>>>> xe_device *xe,
>>>> +                            struct dentry *root)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>> +#endif /* _XE_FAULT_INJECT_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h 
>>>> b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>>>> new file mode 100644
>>>> index 000000000000..d5402b5a3fd6
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>>>> @@ -0,0 +1,21 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_FAULT_INJECT_TYPES_H_
>>>> +#define _XE_FAULT_INJECT_TYPES_H_
>>>> +
>>>> +/**
>>>> + * enum xe_fault_type - Fault injection types
>>>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>>>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>>>> + * @XE_FAULT_MAX: Number of fault injection types
>>>> + */
>>>> +enum xe_fault_type {
>>>> +    XE_FAULT_GT_RESET,
>>>> +    XE_FAULT_CSC_HW_ERROR,
>>>> +    XE_FAULT_MAX
>>>> +};
>>>> +
>>>> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 783eb6d631b5..242683cd5906 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -25,6 +25,7 @@
>>>>   #include "xe_eu_stall.h"
>>>>   #include "xe_exec_queue.h"
>>>>   #include "xe_execlist.h"
>>>> +#include "xe_fault_inject.h"
>>>>   #include "xe_force_wake.h"
>>>>   #include "xe_ggtt.h"
>>>>   #include "xe_gsc.h"
>>>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>>>         xe_gt_info(gt, "reset started\n");
>>>>   -    if (xe_fault_inject_gt_reset()) {
>>>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>>>           err = -ECANCELED;
>>>>           goto err_fail;
>>>>       }
>>>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>>>       xe_gt_info(gt, "trying reset from %ps\n", 
>>>> __builtin_return_address(0));
>>>>         /* Don't do a reset while one is already in flight */
>>>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>>>> xe_uc_reset_prepare(&gt->uc))
>>>>           return;
>>>>         xe_gt_info(gt, "reset queued\n");
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index 4150aa594f05..f8e3ca63aabb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -6,8 +6,6 @@
>>>>   #ifndef _XE_GT_H_
>>>>   #define _XE_GT_H_
>>>>   -#include <linux/fault-inject.h>
>>>> -
>>>>   #include <drm/drm_util.h>
>>>>     #include "xe_device.h"
>>>> @@ -38,12 +36,6 @@
>>>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>>>   })
>>>>   -extern struct fault_attr gt_reset_failure;
>>>> -static inline bool xe_fault_inject_gt_reset(void)
>>>> -{
>>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>>> should_fail(&gt_reset_failure, 1);
>>>> -}
>>>> -
>>>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>>>   int xe_gt_init_early(struct xe_gt *gt);
>>>>   int xe_gt_init(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index 5135e8e4093f..192e68e847a5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -4,7 +4,6 @@
>>>>    */
>>>>     #include <linux/bitmap.h>
>>>> -#include <linux/fault-inject.h>
>>>>     #include "regs/xe_gsc_regs.h"
>>>>   #include "regs/xe_hw_error_regs.h"
>>>> @@ -12,6 +11,7 @@
>>>>     #include "xe_device.h"
>>>>   #include "xe_drm_ras.h"
>>>> +#include "xe_fault_inject.h"
>>>>   #include "xe_hw_error.h"
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_survivability_mode.h"
>>>> @@ -25,8 +25,6 @@
>>>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>>>   -extern struct fault_attr inject_csc_hw_error;
>>>> -
>>>>   static const char * const error_severity[] = 
>>>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>>>     static const char * const hec_uncorrected_fw_errors[] = {
>>>> @@ -167,11 +165,6 @@ 
>>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>>>> XE_RAS_REG_SIZE);
>>>>                            pvc_master_local_fatal_err_reg : \
>>>> pvc_master_local_nonfatal_err_reg)
>>>>   -static bool fault_inject_csc_hw_error(void)
>>>> -{
>>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>>> should_fail(&inject_csc_hw_error, 1);
>>>> -}
>>>> -
>>>>   static void csc_hw_error_work(struct work_struct *work)
>>>>   {
>>>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>>>> csc_hw_error_work);
>>>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>>>> *tile, const u32 master_ctl)
>>>>   {
>>>>       enum hardware_error hw_err;
>>>>   -    if (fault_inject_csc_hw_error())
>>>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>>>           schedule_work(&tile->csc_hw_error_work);
>>>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
