Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECC2C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFD810F31A;
	Thu, 13 Aug 2026 12:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzjGeVf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF710F31A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786625681; x=1818161681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fFeoWbc3s7CTwonCPaBckk9qhjmaPTGADiowe3ZRLNc=;
 b=XzjGeVf77lgm1LnooXDD2cug1tqKBrNwU37sTI94gi8RgXbF2XtpsZ+X
 lktDt3aSk+EkLZR+qHxmaQ7qnmOsWut0TkvIJC6YLlsHljooHFZmCSdYp
 dbRAbe1qaHf2eJtsqqISmwRioaX9a2xleNl8B4pqZMNt1QDmlFt634Z3L
 3nQtD0LIRIdhwsNIwVzVrz4j30m8AtP5wHj6icf4DYyKEW51oSjp09YvH
 EjbRNAzsRZx3epsE3vH7ekiMLygoEYUgXuMvRtysfFCIFxhTevNCm5h1P
 KAK6OkmgdgFd8DVyvfAhWSll+GOJI7QPCElohRu1pHCRt31Zn5M5XQWFM A==;
X-CSE-ConnectionGUID: UOY94v97RgaoGL3sPiAxww==
X-CSE-MsgGUID: KHtfyRssSEqQkMd7yappXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="74734848"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="74734848"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:54:40 -0700
X-CSE-ConnectionGUID: qukIgeq2TEaPcGQx1EFmzQ==
X-CSE-MsgGUID: UyCSqcqrQJeheSlTk7JJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="263474804"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:54:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:54:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:54:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:54:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7XQbo+/AYpt6qncuq7m2h+0180agqHbnXTaRADrwgTgs6deXrq9LWAeX7PTuNxLJQG13zWsyxtL8ge/qTIvJ8HVx4XUwZl+GaNTNK2V0DW21N6t6VmNNbM0zCKLfH2BE5RGRwGdzUxmxrmWgClaHi8SIpr72WSbkuAvUCPVKnWusuSO60uN71wOf7rJYRFljJLJSezLHr/1alo8MjX2jPkxTva80sjZV840nTM9JyC8MVMUCcjTzJS06yBtT+XA/iGK2Q3WrLWReMF3oEY1PKwawcfOLcNm4XRDpiphbc/Bj5l5HMjsJN93S3008VgNNuRhW3F3/mHXQInyIpU97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC9eTA87+4nzPCkCM+dWf/czpWXU8dhMwihh4TyFnDI=;
 b=GoakzQk/84ZxVoNt6xqPlKhhiaiQd3H31sfVdXB8xOtGJq1OM0TFzmdYmtEy1fMJY6WfS5N1d0TT5dbgsKv92HaTQMRRM+gkMHJzlwqkrMsrFuvBTPU0BlPJGFhHCAgqjsXAOvmAesgqO/z0v6/spJMQiztzHB1auL7SvruEyKuOR36VglRR57x+8F277hSLSLCqBzm3qm6O8I8beiLwrzAGbQ0DzppCo+DhHSkW++SmxTunmn7W+ynLQSRHIt5KbYYIyO/HjpQRAj9haLRe7XnCUTsQjTbXHroaldoFX9ZmrULtdIUkruHXmeWJ0NWqABV17Alhxy+lB/yVri3FkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9038.namprd11.prod.outlook.com (2603:10b6:208:57a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 12:54:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 12:54:34 +0000
Message-ID: <e91dfe34-1e98-4f53-967b-a853a88427fb@intel.com>
Date: Thu, 13 Aug 2026 14:54:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk messages
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-12-michal.wajdeczko@intel.com>
 <5f61f3de-357c-489a-9bb2-f3874a98573e@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5f61f3de-357c-489a-9bb2-f3874a98573e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 85122327-b139-4a2c-ed54-08def93a0611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|56012099006|22082099003|10067099003|4143699003|3023799007|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: /oOeE7DRUlbw9TlQBOELSaky0ix/OcT8BoELWN+bmJacXCZmxuHqdgWDFwP2UA6lwGDf18OJz1EBiAWsWcT4Ox4shGOB8BDG9ugsCPImJrQzyznS5JCUCicgUB7KfnLNg2AW2qydiy0hsO4oc7WrSBohSYzLvIBf5esI4H/zppUZIAsk9eH6rJU7mPunBtOQ/s7Eb76goW0Kv2AnxQKnsWfmGX6L2gb/NzZG1hzoIzqc3fgw8lzUdWNpnhF3HGfqyURoZMkA5SSKntrWzWSTuoV/YG/6TrrUnSAd95qwbO/iKJni2X9kMLSoFEtwD/sHL4T/DtuCucxrHfthuTqJhUqWLfeGYV2+uOangHOxCnF4M1AsnU9skZuftAujzdTWNfLmoUwCT3uDNRruxQaOhpUn9Ph8PKfU+vXhE/BuEn/Pjo104/0yYO82pXGdPp61Q+xaHiArO4/rQZzSzez5GGUx89zv5QbZnwZIuzmB2mRDauREAMCf3R9IbKjvTIQAmdyaDoPWsWKj2diL9y1yMLeXBKTACPzz1I84yrzHbMXDQWf4VmLW4gXhozbJ+3jroE5j5ezdAJuKDYvdFrvjZQT3UcQ5diA1RzKqaJC7VugoPAP4bjucoGKyzZZ8BC+UceKPT5RwRlJTdG7fwFR/dVMiufIo6jkCtFBlQ1/cU4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(56012099006)(22082099003)(10067099003)(4143699003)(3023799007)(5023799004)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3d5WU53cHpnRVF5dThqcis5QU54blR6KzFlTFRBR2lwSnNZUU1weSsyTi9x?=
 =?utf-8?B?M1k2NG04YU9SajJ4T3ViY2FuTDluV2lHSVdXTmtZeVpqcjFpckQwTEpIc0dJ?=
 =?utf-8?B?WnBvZ3U3dURjOEF0T0JlcUxXaGdOSkUrakZBNWQ2WVZiWCszT2NhMk0xbk5h?=
 =?utf-8?B?K1ZvaWVnYk1yUlY0OUNPOHdQdklpY1FuUEwzaXZncjRGTEVEM1FtU2RIL0Zx?=
 =?utf-8?B?OXk5MXBITURQVmN2dXJTMy9tRHRNRTFqRUZlWTZHdERQVjJMOTRsMWdHNHhm?=
 =?utf-8?B?Q0xrVDdYbUNUNXhudk1tNFN2MDFIc1g0MjhLc0RPN1pidWp0R3UvaGhXUm1R?=
 =?utf-8?B?Zmdlc0tEY1FZMG9DVGZxRXpaSmc5bUl5Y2Y0OWNSVkhhT1owKzI3WEhqeHRk?=
 =?utf-8?B?OWh6bkgyODNNYzUwaDk5eGdibTFhZUxVQytoM3FxUHovYjc2ZU5XS055bkZi?=
 =?utf-8?B?d0xCeW81VXZ4dzE2ZmdwYndrTmp5R1JEZ3pSVXpxZjRSMG9TOUR5ZnI5TW5Y?=
 =?utf-8?B?Y0xGZ3R4aVJPZmU4SU5DRWZVWEwvcHI3eEFJK3hhT1RsaU04T2dLM1JZSXZM?=
 =?utf-8?B?Tk9CZDRyZ0Zuc0Q1Vk1RNWVkODBGTHhWaENoN09UQUxHWk9DSFovZDRyWUhH?=
 =?utf-8?B?R1YycUw1T0JwL1crZ2hNQkdoUktLWU9JeWNYNlRJU2VDcWcwdTBsVXNVOHZB?=
 =?utf-8?B?clFKT0EzekQrSFVVUU1hSHZ3bXdaTjAxODZ4c0czQmxNMS9nNVZPWUppZll2?=
 =?utf-8?B?V01RTlFlT0duTUc3cmlqMzkrQkRra3ExL1dqTGRNb04yNXorTkJuNmNxT0pF?=
 =?utf-8?B?cVk4dWxWYlM0TjJoNDVXUkxiaHhGZCtZL1QxejZkdUFRd0hvTWhGRG5ua0JZ?=
 =?utf-8?B?dDBPZ0xleEJlMFFGZ295VCtPdkU0UXNiOXJod0t2NHNLdEREY3lzQmxaSE5H?=
 =?utf-8?B?Yzdha2FpQkRrRXUyRk14NHlmc0J2dlVKTUpFL0sya1ArRU9ySmFvV2FaVDIx?=
 =?utf-8?B?UHRYUm9YbDUvVzl2MmZHdFU2Y2oxaTR2RE5sdU54amVwVmJ2cnd2WlpDS0xE?=
 =?utf-8?B?cHBVS1VLRUV0QXE5aEVtWDVBZTJ3Q0FXeHpNVVc2aXZLTFpkUDR5U1lYcVN1?=
 =?utf-8?B?K1RraVdaY0lUYlVlcXh5QUZTTHdhMWwzWTB2YXZPZlBoQUwrQlhiQlJLSmtQ?=
 =?utf-8?B?VkhDUFFXZnFOSHZaaEFYdUllUmZXNWE3YTc2cmhpUTRZbXAzVFIzZGhjbVhB?=
 =?utf-8?B?eWxHTjVZQXpMbzhwRHBjWmJGbjJkL1pNdHQraVhCVURlNDRKZ0hiWFNsRlVy?=
 =?utf-8?B?QTk5U3ZrUC8zTlpxL2RhWGU3YWRHQ09mcGsxTEtLMDA0ZTFHSmsvSVR1QW93?=
 =?utf-8?B?YTFDWlVwejhmZmhXLy9ieUNFdndtMzRBOWhScjB0L1lVSFhsN3dJUktZUnZE?=
 =?utf-8?B?ZlBBdk5DWVRDVVMvMkUvMGNMZUxvaVBMNmpoK3NsRk9rNSsyRThBcWxnUnRv?=
 =?utf-8?B?eU1FRFJaWXZBakpkZ3VZQW11aGRjUlZNVW1vOXhxNGoyRDVsZzYzdllZQ0x2?=
 =?utf-8?B?b3ExdE1YWWRJR0p1OEpCNHZ5cmF2UkZXRStMZmlxMUQwN2hzMVhwMFlDNUxS?=
 =?utf-8?B?am9TbVRROXJEMG91eWJCWWpMaUluMXcvdWZnVWRGQ1p5ZTUvSG8rZWxlcUtS?=
 =?utf-8?B?YVhDMWVWei9OblY1Ykk1bGJJbmw0bzBEcjZJajZjWlFuRCtMTEExWVNUcjk4?=
 =?utf-8?B?U2xRK0RhUUdQaERteGE1c29uZUhta0I1VlFLSTlMT2tlTFU0UkR1MjhGV0xI?=
 =?utf-8?B?UU0wVktIalpPeWJnQlEraDJRWWYwcTliQUdOV0w3ZWdqNUU4WCtYRHVCVmlo?=
 =?utf-8?B?TzRjaU9xazFIOE5KSGNmZ3N2azF3YmlId3lRejkweE5Cek1aZ0dMUy9sVDFi?=
 =?utf-8?B?ZkpOdVJLYTA1MDVPdmpremU1dWkyTlJlNmF1aVJUd1RkWExYMi9pYklTemZn?=
 =?utf-8?B?Rkh5dmhITThTNDFTTzAydWVIekZuN2xuSEFuR2FrdkFnYjFjTDRwVXBWRXYv?=
 =?utf-8?B?aTdtSjFlN25neVVOVEhjazl1M2xKRE9kaC9DRDRibGs5UFNoK3E1YWVPU0Ja?=
 =?utf-8?B?Q05ib2tRT1VhUWt3aklKdHEvZk81ZjNjemx1VVVydy9YWFZ0RUhjeklGMVda?=
 =?utf-8?B?SjdQTVE5SEJKNTdCOWh0M2pJcml5UG54Q0lJWFpYWWQ2eCt3YmJDR0Q0WE9I?=
 =?utf-8?B?MEdYV3FUbG9tOCtCSlE4NVZJTUtPM2dVbW91WVNMWU4wNjFYZEp1WTRzWmFX?=
 =?utf-8?B?cnhpY2RHbGFCWGFqTTdEZDAvUVZRQlp3bHpSQzFkZ0xwbU5McndlNjd3T2tq?=
 =?utf-8?Q?z1JMnWP1Fn46N+RM=3D?=
X-Exchange-RoutingPolicyChecked: rja69PKxa5YY6XSJWmLLJ9/62LNVwUH8OJXn/9qgnvqc2MRBE/YHIun7Xm0DI/nIOHA15HyZc3Et2a0yBBpT+Bl9NCtJRKXmqVx/ZdSZncmiSUPYF6i9bMpSwVpCjfFgafgx0xrsmbCNuHuqFVxx0nDLXz+gELGvK9/b9KbZWa7bXN+yGEtFPIA71NkOV67ZetqAuNKAWguRxrZK8rLlZWAFibzcU7eUDnKTfflDR8DLiDLuokGWijDCtB3b+Y5o35wLLV34PA8Y4TwL7z9KhaOulI7uSUbdou+1E65Ts9egsFUGOrZlR5Weow8JNNRf+eH+6wNUw7z5yIedr76mPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85122327-b139-4a2c-ed54-08def93a0611
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:54:34.0287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIilpAuLQEck5/gmrXlEuP5YZDRcPrMcc1gMf/4lzo9oI3To8KCNycT6+z76d9tV/mAzzhHGOb8BJjUU36cTT5CFzYrq9v1KryAx3x5IjVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9038
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



On 8/13/2026 2:31 PM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> When CONFIG_PRINTK_INDEX is enabled, it is expected that all device
>> level printk messages are indexed for audit. While usually this is
>> done automatically behind the scenes when code is using regular
>> dev_printk macros, since we are generating different dmesg messages
>> inside xe_log_emit() based on the severity, component and location,
>> we only get those entries in /sys/kernel/debug/printk/index/xe:
>>
>>    <3> drivers/gpu/drm/xe/xe_log.c:142 log_dmesg_vprintk "%s %s: [drm] *ERROR* %pV"
>>    <6> drivers/gpu/drm/xe/xe_log.c:140 log_dmesg_vprintk "%s %s: [drm] %pV"
>>
>> Explicitly generate printk index using dev_printk_index_emit() with
>> some generic prefix that includes the SIGID tag.
>>
>> Suggested-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_log.c |  8 ++++----
>>   drivers/gpu/drm/xe/xe_log.h | 14 +++++++++++---
>>   2 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> index 0b423ed121cd..50a9b35e5b3e 100644
>> --- a/drivers/gpu/drm/xe/xe_log.c
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -177,7 +177,7 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>>   }
>>     /**
>> - * xe_log_emit() - Emit a structured SIGID log entry
>> + * __xe_log_emit() - Emit a structured SIGID log entry
>>    * @pdev: the &pci_dev device
>>    * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>>    * @sigid: signature identifier, see &enum xe_sigid
>> @@ -206,9 +206,9 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>>    *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>>    *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
>>    */
>> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> -         u32 component, u32 location, const void *data, size_t len,
>> -         const char *fmt, ...)
>> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +           u32 component, u32 location, const void *data, size_t len,
>> +           const char *fmt, ...)
>>   {
>>       struct va_format vaf;
>>       va_list args;
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> index 0928b0866617..53fe2bb7ddd3 100644
>> --- a/drivers/gpu/drm/xe/xe_log.h
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -16,9 +16,17 @@
>>   struct pci_dev;
>>     __printf(8, 9)
>> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> -         u32 component, u32 location, const void *data, size_t len,
>> -         const char *fmt, ...);
>> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +           u32 component, u32 location, const void *data, size_t len,
>> +           const char *fmt, ...);
>> +
>> +#define __xe_log_emit_printk_index(fmt) \
>> +    dev_printk_index_emit(NULL, "[drm]%s SIGID=%u %s(%s)%s%s%s: " fmt);
> We need to change format for a. error path b. blob path c. plain or info path right?

well, that's not doable as final format/output depends on the
severity and data value, which could be non-const at compile
time, while printk-index requires this to emit right entry

I can change that to a something more generic (and unfriendly), like:

    dev_printk_index_emit(NULL, "%sSIGID=%u %s" fmt);

but that will catch and match all our outputs.

@Jani, are you OK with that?

>> +
>> +#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) ({        \
>> +    __xe_log_emit_printk_index(fmt);                        \
>> +    __xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
>> +})
> 
> nit: use do{} while (0)
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
>>     #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
>>       xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \

