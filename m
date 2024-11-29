Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF506D729E9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 16:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5AB10E525;
	Fri, 29 Nov 2024 16:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv59mKIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530E910E525
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732897860; x=1764433860;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=eHaA2kTZvXiCeJ8yorKwGtF7rBtiHybjaUzRalyxYlw=;
 b=Iv59mKIGHfRQomGgndTnUmyMuD1xfyQhLEDWnzUVyq+0Tw6hbodgtmk6
 f7DT/2FZ2L6WHZDk6hT5CX+84sblNhZ11BaSObrU+wlNvaUxHvSGjel7g
 19WRKQN7cpDzwPPegwefZD3dSktKwLyWd2BFYSv4RngFdnOU4l6X+fzYv
 MOytgKh7RfZxEiTgMcy9bt/vs5ybeeejWoQab9t9GJDJ+JHoB3X0Y/T6W
 TeGAWFd+cZP5s4TGZFfwHc30mL+yag7/Az5AjXm6UnvAvtzDW4ACYjJiw
 Slpg7uc3BV4Ckg/XG7/q5zd5D7ADxfLQQOdyxpc9p6awlEJgV0cx3CYy0 g==;
X-CSE-ConnectionGUID: QlY70LmlS3qMVosukfk9wA==
X-CSE-MsgGUID: 5rfz3AezTEuKPO4SjLg10w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44188361"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="44188361"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:30:59 -0800
X-CSE-ConnectionGUID: Q0gZHpJ9SJGtr9B01McPoA==
X-CSE-MsgGUID: bEwmKs1FTBWoLZLCs0l4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="130009962"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2024 08:30:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 29 Nov 2024 08:30:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Nov 2024 08:30:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 29 Nov 2024 08:30:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCfnY4UyBSeCnutdh0HeNTBhcCFXkbP0Rf8L8X6xNnYRbxCf43DP5vwOb9EgS9xl9OkIASCtxFVzF5fTFFpGKgoS2AYkORZiOcJGz3Hrkh8N8pQhchlbfdX3R8OSvVlIX+zcDMw0uXTdbyRrBv0YTFsr/vLj8vf47N1TSiVkWZUSuwQg3rlfa1cIZXknfkSt5jIl/tzvWOt3ZwtrFMxj5usu0Pmt/dADeGIxcTB32jFtiF5gMx1iujLb+W88fPr2RYYZQdL4FQPU7VeU5naVHe4PtEhtG3p2sxjM5rOtcKhDtbZSf1aYII5rNqQjEBsqqUk1oMeo/XVMsg7sHFJJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8xqFB49CILLtH2queox2tIUWc6w7bO6J4Abe11GNR8=;
 b=GrTfzsjGr0ngGDEAZktSSephX90iEchhaUDcvU21Ks8JLnWWDiq34YcwqKpsWZ9D9b9cwtkG5QuRcr8kQdd11/iPy9wmlnIBC45nX7hQG2w4w24uWBP0AzdJbUsKpAe2KFcwW/IXEwxK5X8F0SFxIgRylA1xWTxb/ZmulaDkZZnsSddzgK9dYNWjrliDd2Fylzg39QLumCeHillT12cXAgcg8fiWKXvMrmO0gvMql3fCtE8pJ7DFDuj/CtjVxDCcXS6WePueWJQCZMEqdPjIjlvlwpzQvZg7uv4DSCNB0vv7dHJX71tOlTSj9EB5HnKN0q5ZVoQveT4GyateSX4tPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 16:30:47 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 16:30:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173289487343.328974.3967315219627872010@b555e5b46a47>
References: <20241129151754.22015-1-gustavo.sousa@intel.com>
 <173289487343.328974.3967315219627872010@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= CI.KUnit: failure for Flush DMC wakelock release
 work at the end of runtime suspend
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Nov 2024 13:30:43 -0300
Message-ID: <173289784300.1637.11227835643017766780@intel.com>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc1b265-2ebb-4b95-5bf2-08dd10932e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHgzNks3M0dGN0xaVCt5MUkwVVVkZEhXSlg0aUVPdzR1dG9DS3JDY0RkNUUz?=
 =?utf-8?B?UkJOL2ZJek1FMXhHOFpiM2lQNkYwZXVjZHJ2R1lXS09rM1p1eXZvQ1pLNkJs?=
 =?utf-8?B?VVhneVM2UG1VbkNVbDdxZi9zcXlzN1NTSFMxMk4wNCtsUkpUaGpWT2xReUw0?=
 =?utf-8?B?OThOVFB0aTAyd2RrZDAzNmxnVC81QmpFSXBaSTNMSkE0T0ErVjM3ZFp2ZTQr?=
 =?utf-8?B?YkVLUWo1aWd3R3FTc3lTbFhnMlNIVDJtZmpXOFBqc0lES3ZwYzdqaERjdTVV?=
 =?utf-8?B?VUwvU0JCbnU3MHNTMTlCT1F5Q1dJeFV6UEF4bDNKZ25iMGdqWG5XUHcxTUtY?=
 =?utf-8?B?RmdROG9XTUZRdTUyZktvWG5Zc1BxbHVkdkxYeVR4WmRhL29XbVdZL3REY1B0?=
 =?utf-8?B?a1B4OE42ZG9nOE5mZzVZa3BVTWxqeFZsOE9RTTJUejJNSjBmQjNDdDB5WEdq?=
 =?utf-8?B?SHVUUkMrc2g2QkNyU2Jua1V2MUpGUEdmbDZqRkttQUI0aXRDZW9tLzBTczFC?=
 =?utf-8?B?L3RKUTBPRG9DSGgvckRkV3J3M0t6THJnUXcyWVhjSSt3ZXdubFhpU2lGV0hZ?=
 =?utf-8?B?emZyOWd5c0c0UU4ydzdVSmdPUm43cTFuUVU1RHRlbUxLR3MxSnozeUR0WTFT?=
 =?utf-8?B?S0hHdXB3SFRVVnlUZ0ZCVHhJdjJKQlFwbWhkS0UwUzVOSmlrOSt6QXZBMUdN?=
 =?utf-8?B?Z2JJdGVvTlNBbW84K0hETE00SE5BSWVjMnFvMHE1bDN4TVYvZExEV2N4RHJ0?=
 =?utf-8?B?Y3VJRFdXaDkyY0hTMEthRkFGSXpuNU1CbGtzcDYwVCs3ZEJidG90OXpKMC9I?=
 =?utf-8?B?RU5FYThPam5zMU45MWRUaWpiM1lpaUJiM2hTWGhULzYwRElCZFFpUDhmTitI?=
 =?utf-8?B?c3J6eTUzdjJaQnRGVkVGZWtkbExXc0kxVmtNa3pKVFNsVlNLTFFWSHVtUzlD?=
 =?utf-8?B?eUFJSHIzWVd5bXFMNGpCRWZnaURMK1BhbmtZUjVLVm5FWVh4NzZjTXlzQ0VS?=
 =?utf-8?B?ejR5amdUa2ZzR29xQXluZGV3aWFERXVFZnBibWd1SU1NSGIwd2pvbGVERWh2?=
 =?utf-8?B?eEt4VzdlQzJxYlViVzc0eTlzRkNiV3RucFR5L2ROY1MxdFB4eTBvL25XT2tL?=
 =?utf-8?B?SVhkemVweXFmRUV0cTk0bVl3dVdsZndKckNhZWFFM0NtVEVjV3pYRit0Y3ky?=
 =?utf-8?B?WDduUjFJQUhGZTk5TUE2aTB0Y2ZSL2o5Z09BL21zQzhKSjRJbmZHamZlUUMx?=
 =?utf-8?B?NFRqb0N5VFhBa0JDU1ptbCtVelZQK2I0QlFJSndOZFppQUpTQ28rWUJkZUhp?=
 =?utf-8?B?bERJZGxtSGFmNzNrTjY2ZHJFMzcrN3VjK3FNV0VLeWxzUTRrWUpMR3dEMjE1?=
 =?utf-8?B?Z1N0aXAvMjhaa1dUejJ1RXNCWTE2cWxjYW5GcFhyNHhJd2NKNEJoSXpFcUFj?=
 =?utf-8?B?SGVoM3YwUWxtYWZ1ZWtuSHlWaXpwTStrMkZLRldsdlAzTmZDa01TL3lvRkNC?=
 =?utf-8?B?M1ZOaStoUWtwYklSK1RSVmNoSzdaMy81eE1wdWlZaklTL2F5VW1EZWJBdVJP?=
 =?utf-8?B?Q1BkYm5aUDhXYnlES05RSUFMUCtnYUF1TURJTDJxQVlIUWxsbXRGbVE2cnlU?=
 =?utf-8?B?c3dVT0gyVlc5aE55NTFCQzZlTFR4d3JYdUU1aGkxNDdtUWc4L2JaVUtaRG9a?=
 =?utf-8?B?bWErSjBIMFhsRFZiQll6ZjFxellWeFdhVmhlNjNtZ1UzSCtnZ1VuZGFBbU5s?=
 =?utf-8?Q?9FN5ZE9I1xKZmbL/hA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlB4WUNwQjArc1o2V1drTGExY2F6dW9aRGs3NEk4RC9ZT09BcjZyK3BTVC9O?=
 =?utf-8?B?ek1ISHVDM1dvY00wMnYwa1RwOEFrbW5SZVRjamw3eTFCcmVvSFRFdjl4cFdB?=
 =?utf-8?B?YjUrN1RpUGxkeXR3T0VqUXpzNUFnckZjanN5bUVwcXJwakJZQU1DN29YWGhm?=
 =?utf-8?B?SnQ0OFpPaTlvcWdnSUYvMHFldWF2UDRYa3M5T0RSRW5QMVNwR3cvRVA1ajJY?=
 =?utf-8?B?cWJmNHdrMC9lQ0hpOS8yVzlZcmsvUU9vdFNZMWdIaEJJbkZwc1NSOEJuRTNJ?=
 =?utf-8?B?NUlwUzNoMGQ1M281Mkx1Ly9LN3NNaCtsRk5GSE5UMndub1VpckMvYW9uUkQ5?=
 =?utf-8?B?aFhpRnFDVVdCWTlFb29PVzRFcUw2bEQyd2ZqT3ZYOUxJZ2ZWRUJvbTI4UHVn?=
 =?utf-8?B?QTdCaTk0RGZhVjZVb0FKVVZnR1R1dk5YM0RQTitINm5YQnNtSi9HMkFpUGxz?=
 =?utf-8?B?Um5URWYzSVpLbjR1V0VVbXg5aUFEQitBRGhva3k1Rk1TakxnbE4zOHRJWGJx?=
 =?utf-8?B?MW5idlA1YWdWQ0U0M0g2YnBHKzFRY0VHbERzNkZ5TVRXLy9KRHFCM0wxajAv?=
 =?utf-8?B?amY1RERFUjNrakVGMHk1emNUM0VralI3VGtyTklqNnVYaFI1ZWFtTkgxOUVP?=
 =?utf-8?B?c0dHcW1ZRmF2aXhBeEhEQ2JFazkzNmdLUEVVeTdvQnJmbjBoVVFBajJSTE95?=
 =?utf-8?B?M05qR0pVQ2NkeThkbWlSejQ0TkR1VEU2emdkZWJQNklHUy9xWFI3bmJsSjJa?=
 =?utf-8?B?WDFDUkZDTjQvcFVPZzlDcmJleDJiRlc3Y0xFK2RSdjBBTzlGd3VPTERWNnps?=
 =?utf-8?B?Z1JyZm1FbkJsb0ovQkg2cHF5c1B6c1g5UElhM2xaSkhzTXF6SlEyVHdBZzVn?=
 =?utf-8?B?bG9TZnhIZ3NHdzFxMEd4N1ZSSHlNNDlWK0tqUkl2U3ZSSnRxNm5FQURLei94?=
 =?utf-8?B?SkJIV2txOXFGVHNibTRKc1o1ZlFYU3RhWi9oWklCTTloSHMybERGRkcrbmRu?=
 =?utf-8?B?SmFqK3JNK1Y1ZFFBcVFhRWwwSzlBMlVwR0dIeXdzY0RzeDBtS0Y3ZzBKdVVE?=
 =?utf-8?B?WEphaWE2YXNWRDVIbVRaM3RHYmhWaTY5SHdodnpCT0FBaXVoUGZ6Y2tMb1Qr?=
 =?utf-8?B?eWR6ZVJxWjZBOEN0NnUvM1EzSjBmd2RWMUVXOGZWZE9seHhnREFsZzdnOXND?=
 =?utf-8?B?UFI1ZlhSaFJJSXF1UGNDN0Y4RUYwYUxuYkxTMm1DUVA0RDhaTmZBZUxzR045?=
 =?utf-8?B?b0pHaytoNUtFSnhkYUloeHJBWWNrUVkxRE53anJmc0U0OVBQdDFxNm1lM05y?=
 =?utf-8?B?SEpVaWhzMHcxVVVsUnBUWmprTkIxc0d6TUNSS1NqRW5HM2hiOU5DVG96UkRY?=
 =?utf-8?B?VXB1L2ZZUitNY2Y5KzFRdkdDeWJaZGp4d09maVVjSG8wK3h2VG4vSWdOeTVO?=
 =?utf-8?B?QTRNaGZKMVZUejVGYmM2VDJJWlBEK1ZzR1VhazBRQWRubm1kUHFicTNQaDF3?=
 =?utf-8?B?YXdRRDBCZWRicEc1cUVnODNBbWE4VGhDeGJyY1FRRFFpRTRQOXVOWEw5NFJQ?=
 =?utf-8?B?NGpHbjB3Q2pGWUlBQ01jRU54MWd5ZThvenhMaEhmM2cxTHJZd1pNUXhyLzcw?=
 =?utf-8?B?NEhlY0FmS243ODlxa0xNQzlKN0xpekF5bWlOZks2TVpyVmI2QXEyYVpobjZz?=
 =?utf-8?B?SGJqeGxubGo4Z2FmaTROVmdDVzhqT3AvWVVYeDNCTXc1YjVycERiTGxocWR0?=
 =?utf-8?B?UkJwZS9zZHp5NUw4YmZMcnlmMExjK1BpdUlyb3BRc2ZxZWF4Z1NaSmFHOTE3?=
 =?utf-8?B?TUtPTGpsOTVpSTgyOXcwMTI0TTN6Q1ZhSGVoU0xYd2xYQ1g4Sld0Y2NjMlA2?=
 =?utf-8?B?U2JwdnQyMm1oTnBnUFFDK3VpQXc4andQakwzWDI2ZTJvOFdBNkJIYU9NdEpS?=
 =?utf-8?B?dXZnWFo1bTFDMmhlNzFXMWF0azgyVlI3eTdMNEpFbnVhcmhoUzFSOWduR0hw?=
 =?utf-8?B?ZjUzWFYrOVBmTkhaMjdFZTd1cWs3NUdVaWR4ZzB3YnlIVC9XZXF1YWIyRWJz?=
 =?utf-8?B?dzkyREpBalN0T1R0ZHNCQ1lWdVFzbDVoNjB0aUFraW1YdVlCb3hHM003K2Mx?=
 =?utf-8?B?Y2EyVjJtWXpram1oa1d2a3htN3RmNEZUZUdFb3kzNmoyYzFtQjNETTIxL3FB?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc1b265-2ebb-4b95-5bf2-08dd10932e02
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 16:30:47.6714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVelj1EJuBcYuvtz29KQTvPWJRaxu7Bv9U1KPz5MeKAtnrmmmO6DK1jYUXWoL1dv7VBL1nI9330IRi0C30XI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

Quoting Patchwork (2024-11-29 12:41:13-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Flush DMC wakelock release work at the end of runtime suspend
>URL   : https://patchwork.freedesktop.org/series/141931/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/g=
pu/drm/xe/.kunitconfig
>ERROR:root:../lib/iomap.c:156:5: warning: no previous prototype for =E2=80=
=98ioread64_lo_hi=E2=80=99 [-Wmissing-prototypes]
>  156 | u64 ioread64_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:163:5: warning: no previous prototype for =E2=80=98ioread64=
_hi_lo=E2=80=99 [-Wmissing-prototypes]
>  163 | u64 ioread64_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:170:5: warning: no previous prototype for =E2=80=98ioread64=
be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:178:5: warning: no previous prototype for =E2=80=98ioread64=
be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:264:6: warning: no previous prototype for =E2=80=98iowrite6=
4_lo_hi=E2=80=99 [-Wmissing-prototypes]
>  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:272:6: warning: no previous prototype for =E2=80=98iowrite6=
4_hi_lo=E2=80=99 [-Wmissing-prototypes]
>  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:280:6: warning: no previous prototype for =E2=80=98iowrite6=
4be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>../lib/iomap.c:288:6: warning: no previous prototype for =E2=80=98iowrite6=
4be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/xe_pm.c: In function =E2=80=98xe_pm_runtime_suspend=
=E2=80=99:
>../drivers/gpu/drm/xe/xe_pm.c:417:9: error: implicit declaration of functi=
on =E2=80=98xe_display_pm_runtime_suspend_late=E2=80=99; did you mean =E2=
=80=98xe_display_pm_runtime_suspend=E2=80=99? [-Werror=3Dimplicit-function-=
declaration]
>  417 |         xe_display_pm_runtime_suspend_late(xe);
>      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ugh. I forgot to also add the empty version of this function for the
!CONFIG_DRM_XE_DISPLAY case. I'll send with this fixed in v2.

--
Gustavo Sousa

>      |         xe_display_pm_runtime_suspend
>cc1: some warnings being treated as errors
>make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_pm.o] E=
rror 1
>make[7]: *** Waiting for unfinished jobs....
>make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/xe] Error 2
>make[5]: *** [../scripts/Makefile.build:478: drivers/gpu/drm] Error 2
>make[4]: *** [../scripts/Makefile.build:478: drivers/gpu] Error 2
>make[3]: *** [../scripts/Makefile.build:478: drivers] Error 2
>make[2]: *** [/kernel/Makefile:1936: .] Error 2
>make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
>make: *** [Makefile:224: __sub-make] Error 2
>
>[15:40:40] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=3Dum O=3D.kunit olddefconfig
>[15:40:44] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=3Dum O=3D.kunit olddefconfig
>Building with:
>$ make all compile_commands.json ARCH=3Dum O=3D.kunit --jobs=3D48
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>
