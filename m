Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A68C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 22:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5687F10F56F;
	Thu, 13 Aug 2026 22:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F89AbthR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D4310F56E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 22:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786659158; x=1818195158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mRj3vjuCyrZmBoAqwlD3OEtuXdsRxrwMBNOrR5HXEhg=;
 b=F89AbthRUyWeCy0rlJQlUmXr5SxsRLR+z/kA43+PDdBDeNk65M0yz/Ha
 qjK7oXUGGJyk53UX2oZ03MoKBJwPyDgfu5beR15nItng7xon1ZBiBxHra
 bk+gIPgp7wFBMzT2cOqconhpOTkjiS161EkyaH4+9Lj71zaHNWXOkA6We
 CTeemb5LGP3utCLzNIiXshil3oAXeoC8qIt3E291mSBous8eEFzMRJWa3
 SRYu/gizXeN9pnjzRzOMAeHgR+I4irFxVkP0LKIeAKakHLJbPnXfa3ePk
 X3SEjqQ5BOHPFvtDlaWRWi2/tEJBxZ7NiXy5/Zz4U0S7lJjtvQyXaz8du g==;
X-CSE-ConnectionGUID: +3TMqbywSd6W0/iH6oJWYQ==
X-CSE-MsgGUID: vME5X/ZWRwyFWNBVHCiohg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98600970"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98600970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 15:12:38 -0700
X-CSE-ConnectionGUID: y6LG3Pj7SjyaA3L9YP4PTA==
X-CSE-MsgGUID: f+EN7lhbRXGlyOITVhHFbQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 15:12:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 15:12:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 15:12:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 15:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N73YEKSoc5xz6mzm/EIsQJzZQOnKYVZKwpX/PDiIp7Uns2Bi+TY/g/CBiOD6boXllpapABQgPUPRoAftjlGioT3Nl1T+mSEl2lFQM3ry0BWZ3HJAjwBuwm6MoN68vu4bsPz5yyYTI0+MjwWvdMZQekDceIhTJSRiUDhg0A+BgNsmWNOBHJHvfvqGh8uxPcm6J0A1agA5CASBLMlsd+ft1iyqKPKEFHwjnCepTw00CZfGOv4xvVJADOC7nzvAaqJZOccXSnOuWnPFLXXSQZN3ZPf8v1PDoukhOfOti5tXWEFd5Pe5IcdOlSZH5//Ra1PMzg96if8nhdkQ6gvMr9x2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDHFihlDSQ1ReqDBYT5/VPFvsItuoWDPjCI9d6Vy3wE=;
 b=kXQlM5lFHwv5z0qDEoJmWMjm/qqsvvmJR1gd2ctCch9tFJN3DZmdFQPlSeJftLv5+m39frndn1Ad23c/B/zmCNJj+B5K68NzorXDR8yOKFa80sWMiUQr5sprZWSxFENcPllz133n1dkBpl6LisuHaQUX6mnAN1omc+h5aonBh7B2k93i8a2yzpxBIQvAC5XsspfUdHiX4LiUueCXkSG+3kPtMIIOrjZrpa62iPxsCdgyYLMUhDqDfZZyVg+MSYl0PhuS+qdHimW989RlQ5WWM+ud4brxUSNrzsfGgvBSuI3PRxbNpDsoWvzYDUrmNhy50UsiScHJTs2Era7O3w74Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 22:12:32 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 22:12:32 +0000
Message-ID: <4c041efa-449a-49f5-89d2-a2db09940cec@intel.com>
Date: Thu, 13 Aug 2026 15:12:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-31-michal.wajdeczko@intel.com>
 <an4PAo7kT0tomdgh@intel.com> <fd80931a-b656-4220-b099-a370fe2a5313@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fd80931a-b656-4220-b099-a370fe2a5313@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8f4b14-d871-4dce-ceb3-08def987f8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: AEv2dTEF68BmZ1jFNu7uU+DElUI38L+tkZNazDpViYjEoZYK4BTFoR8Bq3U0K07zq5rk9zKp1/RPicHMPpIrzNzBxGDOAl7XLiNwwQ8uHdIQ4XD/etPgsMD74NHAllYWwWRSpZYkEwJhdpuLu1KrUYcyGwUe1n6f9nVnO1jCyagP2lCZkxWq9cqwyBiaRpQ0tABfa3h8k5Oqld2JhcpYiEScJqpVL7cUpw7Z9AABG/3SVLCNmE3/oPMszLvitxdRzFG/X6Fc8bVLS0jXxe6anhMzU4gBaOa3ccwUXWu+wu1OzB/YYjdxGSJcQ4CX3YUbRBh7TnxGEwWZ7Pb8RggaPxcthsQyKHSvuidqznDcDMvt4XWFwSExSPuTwf/cDHeS1OD2du2EZvzEM8C8U+JnQj87jAfWcwkZ4oiwQu4ZeI0gTIZ1XJ3jU9Dl3190LYganSNQQrgyJ19clJw6d7EwmBsUXpCoZ7T4wyh2zSQby/PZfEQiy3HPawXmTBusNsIOMloZNpES2vXzCAyaTSUu/6aGdaYzGna9E1FgZzc4h/1+4QkK63PFvkn4d30ST+HZ8iW8BUQAW3Ov+kVYErDW6GjlI+5Zi1yL+yWefh9woSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHYrTHNhZEh3UnVkRUNKSkxRMnhUcmRLaEFYM3V0T2lGcGFuOUpFbmFxbWh3?=
 =?utf-8?B?QmNOMjdRUnFVMGYxb0RtTFVmc21pQndFbE5yKzdBYVZRVUh4WVhZRWEvTjhl?=
 =?utf-8?B?VnV1Q3M1YVdYeGlwM2dENkwwbnRqRGl2eWlXc2lMQWkydmpBRzh1MHZNblNP?=
 =?utf-8?B?MlFwZDQ4OFphb001c3lmYmZBVEVTbUd0bGVkSFFNRFhsaFNUeFA5U1FTTFhx?=
 =?utf-8?B?L1l3cEVJQXRORXp0Y0t2dWF5KzJGT2NWb05iL3JNWFY1RXdCand6Nk5tOU9C?=
 =?utf-8?B?STRGRmtoVVk2Z08xbGdpM3k5aGU2aUszYU5ReXJkSElSeDRpQWp2RGp4OE04?=
 =?utf-8?B?YmlYZG9mMXlZeFQzT2V2N1c2Y3REWURPOHRIVUpCZ3NIcElNM0IvUktuVHZU?=
 =?utf-8?B?TFZER1BHelNsQVJpQmZrNzEwRlVpWjZoeUhnQnFPZm1jTHg2QTVydVh5eUZx?=
 =?utf-8?B?cWxxZngzaWRpeEY0cHU0N2lqZU1KYklEZ3dMTFZtSjUyMHhJYzZHVVIzaTU1?=
 =?utf-8?B?d0l1TEZGbm14VGxCOE1GWjRpeENVQStLYTMwQXk5b09vZGhCL2pVZWVXQkpI?=
 =?utf-8?B?eGZxS3RCMjIyWkhOWkV4ZHZ2MERxSjJUeDl2RXR5RXRVTEd0bU96VnZmLzVH?=
 =?utf-8?B?NkxQWDBIR1ZyMVJaOXpxeFdJL1MzR0E0VGVicFVBdWllcXFKRiszWWwrT3M0?=
 =?utf-8?B?N2txNTd3MWYwS2hibzRMd0c2U2NlZEtQVWtLeW9ybElMdkhwdWxvaS9oVjZH?=
 =?utf-8?B?VFB4ZzhvemJIMEZMZEt3MHZucndzclBnb1lwS2NKWjQ2MjlSb2VmbE5TMHAw?=
 =?utf-8?B?NEk3Um5GSEVVWi82NDFzMGhONkZYTHQ2TUNGUXI2MnhUako2cVVaZ1VNUDI1?=
 =?utf-8?B?NzdnTkJoUFhWZE5makx5WWx5aUhnblVOY1h4by8xT0t1WTRWcndHeURpb2Np?=
 =?utf-8?B?M0dkUWVQUUFPRVF0SDl2R3JzYjNTTnVSM0V0ZU8zdWRNRHU3aWdjeTVSUHNB?=
 =?utf-8?B?Q0NhTEl5aDJya0JJYWlDb2xET1ZIQlJVVzBkcnZrbTNLKzVWSmpHcExvclRU?=
 =?utf-8?B?K0tNNENocCsyOWFDTG12SjZValZFSmFLeWQrT0JZT1ZlYUI4V1A5WFA3b2wr?=
 =?utf-8?B?TGRBRk1ya0dWMzB2RFdRQnZzeFM2YlBsUkJySjBocGJLVkQxaXV1L0c5eW85?=
 =?utf-8?B?ai95a2hYZ2RUOXE3NytKRWVVTGtaeGR3bms2NXJUanp0V1UyRzVsUzhyejhn?=
 =?utf-8?B?QmQrZnFkczM1WjM3YjRHVHNEWjM3TEFhNWZUTkFWNVVLZjNSNWlkKzRtSCsz?=
 =?utf-8?B?Vk9qenRwbEtNM3d1b2tQK1dpeHVaNUpEM2VSYk05eGp2OEovdjdGTWVnS2s5?=
 =?utf-8?B?clpKL2pZcjNyb2h3bjk1bUJvZFM4dnFEcDdqSFNhN1FnbUZxS2J2bzNwM1lV?=
 =?utf-8?B?RVNWTlR0YVRMcHl4MVA0ZVVrM09tMEJqSVlDajdwTi91UVhjYVJseUs4WS84?=
 =?utf-8?B?bTRhcXZBYmh6dXdOcDZ3dXJaNXNxN2JVa2UyNDlqdjZtYi85QmRxMlpUZzFB?=
 =?utf-8?B?YUFJOUkxeU1GZnpVTmIrVkh0eXZGRGhqOHVLRWpUREk0NUpTWjNuYXFBU1hn?=
 =?utf-8?B?K25xSU04L1JOb3QrelRlekozMU1FWUZqOXhscUVYemRqclZnRGc3YTEzMzl4?=
 =?utf-8?B?Si92bE5Sak9lT3pFZzBhZjBFK0xzakJrK0tBbGcrRERjQ0RLZGlhZDczVGRV?=
 =?utf-8?B?TVYyYVgvMUJXNXVoVElUUEsvdFdneHc5WUFNVEM1cHlRVmxTdTlxOEwreExM?=
 =?utf-8?B?V1RhY3k5eHRuTElQSFJKclFDUXZ6SW81VGxwQzZMZ0N6aWI5WWtFQUxuWXRi?=
 =?utf-8?B?d0JWczBnQlRXMUhJTk1uNFp0TUFtK21OU09rdDN0UXJDY2hRa2VvOWRoR2dN?=
 =?utf-8?B?S0ZhZzRFREZQazBMSllicWIwNG1SbHlVVmlxRkF6MUFJczNiQ3pXWnJyeGlU?=
 =?utf-8?B?OTlIQ3Rob0lqUGFQWmMyWmpiMGVqeFpLNnU3TklVNG1KWHVWczNWeTFHTGJU?=
 =?utf-8?B?NFZST25vZDNObENXUTlTOEJqV1hKbHBrREFsVzNnVEI1OHNtRENSOEswUzNE?=
 =?utf-8?B?VnY1Qzk5Tk9Id3hPV2J2YUR3akZDbXpjYVh4RS85aUVqTU1Rem5PdGhpbmJF?=
 =?utf-8?B?L3ZIZm9PSmRtdUFSd3VyVE11RmQ3YVdRb0dTcWhSUXdzWGMvWEpNb1UrSDNt?=
 =?utf-8?B?bHQ4clpxUUxVdWkwdDVnQjhRLzFCemtZdWpJTFdxcFlKSGxac003ZndPTTJh?=
 =?utf-8?B?RUY4MGM3aUp6MFoyNlVkRk5hNE02MUQzTUY3cHljaXQ1Qk1xU3BWWGowdUxn?=
 =?utf-8?Q?TpT7nseQyUUcFb58=3D?=
X-Exchange-RoutingPolicyChecked: e2bGafMste/Ql68WdMh8aolrdICZwHMrYxG+C0izhdCS1LfvuMRrZlfwvDr16OCiXur3YTe3DY6o9gURR4cw8sKB/rdnW8VNWdwPp22JpTVlyLdDYpW1JG6U43zSjNYrI+LDABIMWO/36mvX0X80HNVb5uykTT5v0QEV27qhbOzj1FcL5nz0OFVL9pX1hSmegGDKA+CIuWZMJSxnVrUy/w0Ph7nlILYeXFYjoVTT0W7y4gaGyECCBU7dgNwMb5YdH2hqf1S0pbgitO6VaD3pdbtn8fWMvUEtJGVVl9xjtK6I37HxqUm9+Qe0+I+6SeDQTbXWbNR9S5eklkzdSLynPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8f4b14-d871-4dce-ceb3-08def987f8d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:12:32.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2AOipCrYZN2G90NyJiQ7I1h+dTASdHdhoJfoo3h75OkEZ29g91ROCRPistKLdGvxMwxzf/TjRQX4mu4dfCQAW2Klhcy5tSbTMnzuZeIk+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
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



On 8/13/2026 12:46 PM, Michal Wajdeczko wrote:
>
> On 8/13/2026 8:37 PM, Rodrigo Vivi wrote:
>> On Wed, Aug 12, 2026 at 09:14:46PM +0200, Michal Wajdeczko wrote:
>>> Report 'Unsuccessful response' error using xe_log_err() helper.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v2: rebased (Michal) reword message (Mallesh)
>>> ---
>>>   drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index 7e829c61387f..eb600c466187 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -14,6 +14,7 @@
>>>   #include "xe_gt_types.h"
>>>   #include "xe_gt_stats.h"
>>>   #include "xe_hw_engine.h"
>>> +#include "xe_log.h"
>>>   #include "xe_pagefault.h"
>>>   #include "xe_pagefault_types.h"
>>>   #include "xe_svm.h"
>>> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>>   				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
>>>   				xe_pagefault_cache_start_invalidate(cache_start);
>>>   				xe_pagefault_print(pf);
>>> -				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
>>> -					   ERR_PTR(err));
>>> +				xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
>> I'm wondering if we should really go from info to err here...
> my question was different:
> 	"why this err is only reported as info level?"
> as once we hit this condition we also print large dump
> (see xe_pagefault_print) likely for debug/diagnostics
> so it seems important

drive-by comment, but AFAIU this error can be intentionally triggered by 
UMD by simply accessing an invalid PPGTT address (see e.g. 
xe_exec_fault_mode@invalid-va), and we usually avoid using error-level 
logs for something that UMD can cause on demand.

Daniele

>
> @Matthew, comments?
>
>> Why not staying with xe_log_info or now?
> I can change that for xe_log_info, but then (by design)
> we will not print an error
>
>> But also, why err and not ERR_PTR(err)?
> patch 10/32 [1] introduced helpers that take just errno
> value and convert that into data { ERR_PTR(err), 0 } pair
>
> [1] https://patchwork.freedesktop.org/patch/745993/?series=171022&rev=4
>
>>>   			} else {
>>>   				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>>>   				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
>>> -- 
>>> 2.47.1
>>>

