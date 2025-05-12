Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC98C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75C810E048;
	Mon, 12 May 2025 22:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEAW7LO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9E10E072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747089210; x=1778625210;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tboBi+ofFGZt3fVo7p738Tol8OYo6BQaVM7nVwEKQfQ=;
 b=hEAW7LO4VhhHYD/sXPh05JG3F0nEI3k827NohCkXK0wV72fMOVZ73n4P
 p6ZqsbuvMrKttn3As32KFn+WRiSNtGevaYJMyx6KScbApwY0FthEbQ7qo
 bknIhoKHcCDmhdTLQU8mD4n25KxbnK3dxzPxXn8BGVCQFcjM1rb/CkVHA
 1g5Vh/rEt7j60JiuHhh0lE9Bw0KsdgfCLiKaCzL/1rzVxy6FVsRjW7q9a
 BLJAUjK79jEkKVIL3fqgeGOITUx5ozY+Dc9lrQLzadvoksD6KICGnLoUT
 EutpcohWlaFTtMqNjGGFnw+xMjC3g028V7KRRKMOkhSAxT1B4o8M5mfVn A==;
X-CSE-ConnectionGUID: jiIvSMPQRsmTPtDLYiNA+g==
X-CSE-MsgGUID: Z2/xv8HKSxWhsXE+Zj21og==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66450520"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66450520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:33:30 -0700
X-CSE-ConnectionGUID: t5pyq0adT6elwC6fcAV3jA==
X-CSE-MsgGUID: wtd/KNMqSdy5DTpzWI+40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="138024921"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:33:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 15:33:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 15:33:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 15:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7+4mHHVfvSC8OXrypx72yGS1WE2elhtW4n3j+5uIZqsXDhhUvRyUuKbg8JqUfaiAO83Eq0NF4U2XLvqfS1p8N5Ok//2F6ju2buTxZ0X5kxzAwIjAgd7a17ME6EXuj7TvWvJKT3TCyZncSlHctnpq+Ux83OB2HJshQlzQoY3GkzaMYt/UZ2lDEYw3w0l2TVrmsaVR3Y+79CQsKyzwWqvy4mPL3JpfrbHOcGYBMZ2ZA6ZvRLBkwGmGdmrLjkixM1yS2LytyG8pcyQgP9R8Lys1HeUprZaIB/nA+miI2mfGazgOO4CS8ePA231icl4L2zuSW5590t5mlS6wKRiHoL67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+lwjTZtzNglk/7iHqecALQP7ACTJiAcDnjsSxJpCwU=;
 b=lPCeUaAZa8SttUqZC5fbv3ECtSNfVuxLD/3tNgZKFjGz9CJqwN3B1EEDlHbawi/774Kapv4OH0lZwsbxtfHSxzWZ7kEBi/kpt0VYTKpnpAV5eRC5LSEs01Xi7vR1B2GVV/yiO8pdrzMRDrbUukuOtxg249LtJhe6ryWuu8u15PdfonTYYxfnVLwOV+PAffmLCDSOcnwO62GPxRm0p8cyeCDca6+mTI4URdLh5jWCe6A1ZlGUQEUkksekkx1Ivs3t6ioqJFBmijjcERBpI8q3A+3OFO3cdLLe7wxHbW+BI/kcZCeba0AH8nrDTlq7NEaFUzI/mRoXygOg/iOksdrpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA3PR11MB9135.namprd11.prod.outlook.com (2603:10b6:208:579::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 22:32:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 22:32:59 +0000
Message-ID: <ce8893f1-ef7f-466e-bf1d-36259f9347c1@intel.com>
Date: Mon, 12 May 2025 15:32:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Unblock GuC buffer cache for all modes
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
 <20250512220018.172-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250512220018.172-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA3PR11MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 4967b312-29ed-463f-4268-08dd91a4f2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGFEU0dLajZtNy9YTSs3UkgxZnp3a1hmRW5XSElybTZRQk1ZNTg1TGN6bUJO?=
 =?utf-8?B?RHJqbXJ1ZHFreFBvQUpDV21wbHN4RndrampqS1pxZnYxejh0bXcvVlRMM09G?=
 =?utf-8?B?TkNRQk1rMEgvRjQ3Zk01c080NmozbGV1WkpnME5CeXFUdWJnRmJFWVpBUk1L?=
 =?utf-8?B?ajI2cUhldHdQc1lDS3BXV3I4eDFCVzF6MFNncExmVmg2QTNsNmFTYjJYWlg1?=
 =?utf-8?B?TGZCMUVLak1tYkNMcW1iZmJQNXFPTVEyMFVvd00zc0ZzeUFzT2FhdTBwUzNw?=
 =?utf-8?B?OUQ5NWQ1QXl1YW8xTDdhR084VHhNN2x3bWhOUW5tSTkrbnJvSjhsTGUyYWd5?=
 =?utf-8?B?TmlMcUpLWVQxb3NyWVdBQThnbEMzbUFCeDcyNnYzWjNlL0tYU1Y3ck9hWlFR?=
 =?utf-8?B?aFEyT1U0dDJjV1N1SG4yYnpORGx2SDVsMXd0cVpFUytYVGZFNDBLUi8za0pH?=
 =?utf-8?B?ZnYreTVqMy9YSEpyYUh6NEpSZDZYQmZxVTlFZFhib2w3c2ZNQTJFa0pueWxI?=
 =?utf-8?B?R2NVaEZWcitNZVdraXQ5V05wVFRrdE9xVVRHTDg3bXo1QUdEY09sSTFZV2pk?=
 =?utf-8?B?bjl4MTMvY2NERkNVckpFUmpvWG11UnByTGNFWE42RnRqelpkdDJkdE9PRGNj?=
 =?utf-8?B?aXpJblh0a1FsajhONm42QmVxYm5KbEppT1gwZ2RSbk9VMDh3cCtURkNXZlFS?=
 =?utf-8?B?Nkcwelp3bVBHbkd6VmdKQmtwTCtnNGwvUWlEN2lxK0pmWGlPb2Yzamd5dHlx?=
 =?utf-8?B?ZWtRbnJSeTJSVUVMSnJVY3Z1ZW5QUm5VdzQyalJXeHhPenEwTGFHWElHcDlh?=
 =?utf-8?B?cVNrWlM2U1pOT2tCQ3BDaWJUb0llbEFoMFpHbmVJeGwrQmQzem5ybWptWGZX?=
 =?utf-8?B?bVlWYUVsbjRrRDRKdzhyWXkxaDlaKzBadmkxell1ZVU0dlg0cnBHS2txMFNO?=
 =?utf-8?B?Tmk2NkpTNXphbkozdGd3eFA3aFhDL3ZQZ3RzTm5ZbHQwKzVPWVkwUnh3SitM?=
 =?utf-8?B?OEgxeENjdU53S1JnS3B2WG4rc2tGK0k4d0x2Q1BObG9XQ0U0QlFsaWhMYm12?=
 =?utf-8?B?cWVMK203dXZkZkhKTXFtYUZ6NDBnT29uakd6enYrSENEb093S1J3OEdJZ09H?=
 =?utf-8?B?TzFOdVBNdFgya3R6dWRweGhZUU96cVdORlljYTVtenBkMStGSkJLa0RyYk9X?=
 =?utf-8?B?UzFXZWIyclZXWExOamFpUmliUEVQcVZwdUtaTnZkbjlTMVRHeWZxNlJlQWN1?=
 =?utf-8?B?U3dHelNOc2t4RWJnOXE3a1ZyYTRTUG42VGk4Nng2WmhtTlF0SnZ6TVhnQ0d4?=
 =?utf-8?B?S1FJV1BOY2JlQWZhUWZGcWRlWnFkOTRCUVcvN2dlSnUvNEJJRlFaNUtxamFi?=
 =?utf-8?B?QTFOR1ZSZXJubytRdm9nWWpyaWNCcmFKRWpIeEp5RTR4M3ZNYURNb0VNdDN0?=
 =?utf-8?B?Q3pvSy9yWC80azg5QmhVcFRHUW9jVXdoaVFYeWJ1ekdmS0E1S1ExUUJ0cGo5?=
 =?utf-8?B?dGNxSHVHSTZBQythSGdCbWJtTVl5eitVbmVtV2NIMithZktPZnhFajhmRURS?=
 =?utf-8?B?Vk5aQ0IydjBBRGJHRDhsY3hvbXBqN3cwQVY1RG1hcXl2V2xvUWx5ZGpQVHFE?=
 =?utf-8?B?QnFER1o2NndLYXlkOGNXZlMrUlRweGpmRVFYRlFXNTdZR0kzaWtQTXlSbXF6?=
 =?utf-8?B?cE83a0s1YTRZT2g5Tks0bjFobmlLb3pvc2tYUHErMlBZQzc5ZURldTFQYmNB?=
 =?utf-8?B?cUZsUEN5d0hRdnQ2MDA3UWl2NXE5UHBoUEpZTFlZTndFZ3A2cDIxMnFyeVht?=
 =?utf-8?B?YUVyUVJmZlZERVAvdkJuWTVvNjUreXhSeGtIMUdpY05xL3ZnWHA1c2ZOWVpJ?=
 =?utf-8?B?bGtjTkpmK0NUKzEzNzM2VDZXTVVGa2w5ejR5blN4MElDTk44eVp0YlVuUkor?=
 =?utf-8?Q?wMMpw8HpUs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dhbHdxTi9Rd0FQMitjOFNvWUZqcCtKU2hkTGtEUmpVQm9oaXFaeEV4ZFN5?=
 =?utf-8?B?Z0xmU01BRTZDYU1iZnkxSlU1MFNYU3p1SXdTejlFVG9FZEkwU2xhWWdjdVdm?=
 =?utf-8?B?aTBoNVJTYjhlUkE0Vy9KMjYvRXdyRCtRMXBUV1g3UHNsZVlEQjZ4TnJua3Av?=
 =?utf-8?B?Z1FlVTl5VWRwQ1FoT2ZBTkxQemtOVGlJZ2NHdVRRUWRLT3R1ZEpaQmVGMFRL?=
 =?utf-8?B?VE85cnorQ0VNdEk5VVUvWmtJYVJYanJoQVhGc3VXdFg3VmVKQ1NtTWYzcTE0?=
 =?utf-8?B?ZjlZd2NBbnBobzZmTkJZQnEzQU1mbEsySHlIcUs1SDZJOW0wUDJlWUlBVGhx?=
 =?utf-8?B?bVltZ3g2THRjcXE2cU5IN0xBS3d5MUFHOTlZT0ROcFRlVjBpSExqcFZ4L2pX?=
 =?utf-8?B?Z1k5NUZPcFlTaE1WT0ZmSmhyQlRieG4veE0xa3QvZkI5Q0FSQVdQU3RSaUl1?=
 =?utf-8?B?ZGp6aWppQktWNjdJczdOZmJBVGtLR0Y0OGo4V3VFSzh5QmVzVFRBNytHQ2s4?=
 =?utf-8?B?OXpkSTBhVXFyb0xqWGRyTDhhaUJOak8zeHNjRFpPcFVEMHF3TTJ5V3J0ZU1G?=
 =?utf-8?B?a29xVi9lcXZSQVlJZTV6WUZ2UXFwMUJKQVZBZ2JWTXNDN1kxbjdDWVVhbDND?=
 =?utf-8?B?WHpFNXJyVXBxVkFLQ3cveitJbVgybm5DS01LVEZhQ0NlcVNVd2JFcW9ONE5x?=
 =?utf-8?B?bWZGczJyanMxNjltNFc3a1UrUHM1Ry9QYk5weVlBc1I3eURnS3BTUTB6MXVp?=
 =?utf-8?B?RUtxK0RzNlVKMSsvenNZZEUvRDJBTDZsRlVmY3I0K0dUczR3RjEvR3VOOHF6?=
 =?utf-8?B?TDJGOXNJSDJ2Ujk4QVVsMVY2aVZiUXhYcHBTVmJyUmRXenI3NnI4SmNLK3Rz?=
 =?utf-8?B?RzNUQ1NJTzZSSUNxVUx4NGRnWk90emR4OUF0dGVmUEw3T2d4Zk9PdmM5ZDFu?=
 =?utf-8?B?b0Q4YTlkcWFtNnEyZGJxR3htUno1dEtoa1BzcnovaXNxL1NSQ1hxcmdzQXli?=
 =?utf-8?B?ajYvMDY5ZlhFcDVlT0toTHdSK2t6TEtyMEFWSDVGQTRsbDZOWDFtOE5UKzdr?=
 =?utf-8?B?eXpnSXlXc3pidm91TzE1ak1LZnNJOXUvSDg0ek9uWE9LZ2VXdW1NeUFpMmNV?=
 =?utf-8?B?aHBjQ2ZvSUdUWEN6dDZMYWJIU014NnliV0RnQlJabll4QjlvNkhoOUNjVWFI?=
 =?utf-8?B?b1Y5WWczcEU5aEVCa1RRbDNjZTljaklISC9oS1ZCVHNRWnlqYUZ2czdMaEcx?=
 =?utf-8?B?Nzh3MW1zWEwyTXIvbkZrcnN6NTd4eWtUb0ZJRTdrMmYrRFJIVFVWb2VEZ2hu?=
 =?utf-8?B?YkxCOTVWQmszVkJ0WnJPZkk5Y3N6ZGdsV2ZFcm4za3lpT1BtU0pCYjFydjZF?=
 =?utf-8?B?V2hHOC9xL1dVaHVkR0tTaEFUajlhdlF3bWF2b3UvblB3UExjMUo4bjJSZDUv?=
 =?utf-8?B?TUZuTXEyNDd2cnphTWZ1VVB5OUdDRjZObGt5d2gzSnYxZ3VSTEkvYXhsNHZG?=
 =?utf-8?B?Z1dEOUtpK2Y3eFhyYjZDYTgrajJPSVJxWDAzQWJwNVB6YXBCWTVOa1lqTzVH?=
 =?utf-8?B?YkRxVTM3eGJqNHU3eGdEaExHbmJrM3huZEFDWnVwVDd1c3pDdWpGSERiVkkv?=
 =?utf-8?B?c1ptMlpWb01ZRmdkRlQ0V2syMFNRTjRDWHYzOGZEZktnQk1rYUJxeDNZTXhx?=
 =?utf-8?B?OHkrMVFBMHBRSWt5N2xBODV4aC9CRHV4aE5IaXM1MEpnaWNmS3BBQzdNdlBs?=
 =?utf-8?B?azZZQTVjQitkKzB2SHV0ck4wUWR6ZUxRdENhUDJxOURHRGxTTnJnL1J5SVZL?=
 =?utf-8?B?anM2V29tdDV0RklIT3A2c3lDTUhZaisxY3JmRFExOFV0Zkd5dEprUHd3Tjln?=
 =?utf-8?B?RzNJSUk5dW1tckZBazJremthRlQ0ZVhqcmhiakUrR2F5V1dXSC9ZOUFta1ox?=
 =?utf-8?B?Z2oxOWFWQVZZUUgraGdGUEw5dXUvMDRrU0VhQ1FRNDhKeUtFM2cwVW5hUmZt?=
 =?utf-8?B?cmdyZmxVTUpoZWs1VFNVZ244V3YzMzlONEd0eFY2Ti9rcXcxQjFQblJReG1M?=
 =?utf-8?B?Y1FaeFlEWEZKNnZobkhkaFcvdWR6TFFEM2JCVk54WnFzYmJVbk1NazJBS2Zh?=
 =?utf-8?B?VzBRQUg3em00NDNZeHJmNkloNlQwQ2ZIM2pRb0MvUExhTFN2MUZyY2R5U1Bw?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4967b312-29ed-463f-4268-08dd91a4f2ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:32:59.5242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aA/v71TrroHkx3eP2UFqbLmyTLRZXdt3UlQUyOKnyjwJpKJNLkRGIhg3ZXUFcPIFaYCw5Y9Sr0gcigYEm+VugheyR+4zsumwYJJkre5iY8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9135
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



On 5/12/2025 3:00 PM, Michal Wajdeczko wrote:
> Today we were using GuC buffer cache only in the PF mode, but
> shortly we will want to use it also in native and VF mode.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_guc.c     | 4 ++++
>   drivers/gpu/drm/xe/xe_guc_buf.c | 4 ----
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bac5471a1a78..350434a8b953 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -710,6 +710,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>   	if (err)
>   		return err;
>   
> +	err = xe_guc_buf_cache_init(&guc->buf);
> +	if (err)
> +		return err;
> +
>   	/* XXX xe_guc_db_mgr_init not needed for now */
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 0193c94dd6a0..14a07dca48e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -37,10 +37,6 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
>   	struct xe_gt *gt = cache_to_gt(cache);
>   	struct xe_sa_manager *sam;
>   
> -	/* XXX: currently it's useful only for the PF actions */
> -	if (!IS_SRIOV_PF(gt_to_xe(gt)))
> -		return 0;
> -
>   	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
>   	if (IS_ERR(sam))
>   		return PTR_ERR(sam);

