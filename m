Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138FACEACF3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 17:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5E110E0F0;
	Wed,  2 Oct 2024 17:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNAd9Dgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6810E0F0
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727890137; x=1759426137;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=gNAd9Dgthd8vpAyORgXuRlQyx2mouTCy0qIzW9uotYSBofya1vBC9n8v
 MO/Y2fY7jdpT2IvaSrNwIPIkH8N7jGmjxW8Q7CL5MzO3Edcne634DIWyt
 y3xQ8EaQRjofDwCobls/f6i7UIJhD+yQkGZUAr0Z5WdFQEclvmdd/pvMM
 vkH8LLipQ/9xGqO17AKsRLPGdCuJgISLJ1bkACiG4QFdsmAgP5IHv/QpC
 FBJx7ee+fx2XewxOgxOMSYq81pkEe1mU3FsJA5jSXamSR/CghymAa1uQK
 EuY8MHlSZBks1vt86nMmBvW26doVCumQK0qVYyciVzVN6rQ8LFYuVXfbp g==;
X-CSE-ConnectionGUID: xjNheJtGSnyzlAxXW1b9ww==
X-CSE-MsgGUID: VSriotJ8RpSuS3eKJUCSuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30859597"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="30859597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 10:28:56 -0700
X-CSE-ConnectionGUID: 1YZG9Q/fRIGTWFJ57pcC8w==
X-CSE-MsgGUID: bYqtG04bTpOAqrSu3rO6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74492703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 10:28:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 10:28:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 10:28:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 10:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV5A+WhLKwc4vCBSMccSIDMKIiLEF5XkdH8aY+yT7ERUzbiA+i2tXH03bhOZ+5PwLECklGWTBSMkwcZh5FQ2VGboOOzXOct7aOkmIk4iiCUZ7BIa/WYuzQrWyumxWn354ICagszsdVauBaWnB2VL7I5BgH7D2Xi4VbzFCxjkvOfoY/+DzQ7d593qkTGEewZLqUIWIXBhfG3QWQb45Vta5M0qTevYgKlyKQchBGr4fpRhKa983vv97tO6q9tj/j73JSuyhQIQPNTySYsqtNSYTfDo7KszZF49wnHpyHMVbB6aV7vr6UwyB9LOjIe1yCrCXROBCypEWVEQDLtWXwdyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=HrW0zNRmU5AlAx6LjGX0/ZL5gJr95yyg1w74+wuQAJQTvtDZVSxt9HWJ/XlJJwFecCRwigj7t22H+q6VpQNFAAC45jtlnzBFTPwsV5ZQn25tYjx7zGiPTFmCVS5X3z4PF1sOLDddes3SqpvGZ/3IDTl8ttHR+VJ2eVE1KorsfvWGBDkoG0ZWDXg9d5d7ZZAZBA9cZtrybbRXuGOuf0jaYrLZ8FE/2ibQNzjlJD0ZS8LJlisOZO83RreH+OpR/+pJHQLmmFppV9RJUuF6tjxfuTgCvzU4ra33R1i7Z1A4NxqptZxplsr0bbX04kX5E931nklaH8k/amZlsS+sZKc7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 17:28:53 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8026.014; Wed, 2 Oct 2024
 17:28:52 +0000
Message-ID: <b50e3730-7025-432c-aa71-f436a7e038da@intel.com>
Date: Wed, 2 Oct 2024 10:28:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/11] drm/xe/guc: Dead CT helper
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-9-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-9-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0266.namprd04.prod.outlook.com
 (2603:10b6:303:88::31) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: ed770ac5-a676-4650-388a-08dce307af4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGtWT25SZzBJSElPOHBsRTFSZEJHK2RuTmQwbm9vYWZnRENWdzlpallaQ2tr?=
 =?utf-8?B?SXlTQ08ybUR6UnNDRTBCUXZ5bi9CNjdkQjVpM0IxVGRGRUh6Z3g4WDE3Z0xk?=
 =?utf-8?B?TjFnSUpHTHQ3ako2US9jVzRoTXNVOTd4M09KclNNb21zMnM4WUNUYWI1U0FW?=
 =?utf-8?B?ckM5RUlleUpkOXM0STlVUHg4YzJRcmFKZXgwUHFZRit5VFBCVmVtb1BmNzZK?=
 =?utf-8?B?Y1dOb1FUVElNNzg5dmxicE9VVjkyR3VRQ0NHR2ZUOEJqMTZXSDJ6OEdGRDJr?=
 =?utf-8?B?N2RUSm1OeUJLbFIyWlNDbzBlZTh6WUgra05rRHdYeFpIRGdoZWxEeDNUM2xZ?=
 =?utf-8?B?ZTZKd1phbVNXYkh6YnY5eldKZGlJKzJxMjRGUzFjNzR2VmVaUkM4REdEZ3Nx?=
 =?utf-8?B?T2xJZFdDUy9QbTJ5dmh3U2JvdjZrZEJZTENyMnpBM0ZzVGswemlBRWkxRVBU?=
 =?utf-8?B?alFxcVhzU2l5SXl1VXV4ZUIxLzZHUFFoem93TytCVVl3VnE0UmhIdk0wN1BW?=
 =?utf-8?B?cDBFTjkycTM1emgyL2JSbmloZ3k1Rk5XYmlJV1VSWEo0NUJHN2p3NHlnckFs?=
 =?utf-8?B?WHpSRGQwdDAwSXh0dUZKSEVVTEUvWDh4UXg1UUdvUzN5Ly9VSko1dWVoWlVM?=
 =?utf-8?B?Wmw1YXo5cThZTVJ3eExCdjRoa0lwRnN2UzRON0dPMTE2ZzJhSktRVjIvUTJJ?=
 =?utf-8?B?SUxjNTJOMzJ6c3JhWG5sZ1FvM2RINjdwSHZaakRIUVZkdVZuajVyeUF4c0hj?=
 =?utf-8?B?THdET003ZitEL2xKczBrOVV0M3dzV1dVRFB3VDJOR3M2UjNESmI5QWwzdk5K?=
 =?utf-8?B?MXAyUWVlTTFVTlFjcjgxU2hmbTVlQjJoVnkyc3JJQUswL0RhYkJjaVk4dHlz?=
 =?utf-8?B?aGs0Ty9EdFBxZUp0MmVLZ2R3M1NYSGlnQ2V2OEtKRW5UWHdxSnkyM1RGNTdt?=
 =?utf-8?B?YzVqSnZ0NVIybUIwbzdsSXZ2Z3AydUFMY3YzaDQ1N3dTbjlNcFFHY210NjQ3?=
 =?utf-8?B?V3kxeTJET0tWT3AzVHZWMVJTYzd3dXZZN3JnMXJCRzFhLzZVdWtZL1d0YnJh?=
 =?utf-8?B?d3A1WnAzamkzUTh3YlVaVnRqWGVyYk5QVnNJT2N3aitGdXdLb2ZQckdOMk0y?=
 =?utf-8?B?YWdTWkwweHhkbk1UdDQ4WnJuS0dOSHJHeHN3ZWxieHFiWnk0bStNcUhnR1N0?=
 =?utf-8?B?QzJKdDNSWndIWk1LaWJPdkdGSDdCbUpPN1RZYXA2Ujg1SVRwVnBWM2FXM3Vn?=
 =?utf-8?B?aUNxZUFRZTNEUmdzQ1kxYmhaTXFZbWtUU1ROSkdYVXhMTjF5S0J5WnE3c1hE?=
 =?utf-8?B?MHFYN3QvT2hYTHNtRWN5QjJ3U0lheTQ2QVVTOVM0SE1CSndvRVJISlRhU2cv?=
 =?utf-8?B?QTlqdDZRVzBFdmRZRllUVjRYWHNPazIzMnh6clNubUNycU0xUW5WeWFOVmM4?=
 =?utf-8?B?dkk2dFpSYTJBS1pOUjlBZStwbVY3VHdFQmdPZ2M4OTdnQWFuQTNjT09mcmlY?=
 =?utf-8?B?d1A2dHI2YkcyWXE3OVZHWm8xOUJXbzc2N1MzeFJVSExRTGtsWlhsWUJieXpq?=
 =?utf-8?B?cWUwNElpYjY1NzhBQXRWSkdjeFdWbHFkV3ROWGw5dmlkTllUNnJzQlVxR1pu?=
 =?utf-8?B?RFdudUQ4ek5XRjBNNmZLU2x3ZDdRdlgxNVA4VjhYMStFOE5NSG55eTJGWTJM?=
 =?utf-8?B?a1o4bFVBT082U3l5aTZlK0tkQWxpT21NZFdXZ0xaWG5Kc2RzWVVlNXdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFB6Rkl1MnQ3aGpiby8rRitnVzVZRW1BUlFCanZsb1VYTEtNaWh2QWNCRHJJ?=
 =?utf-8?B?bzZ6b1hMaHpNTFg0UVFPRFpnWEpqY0psZnUwT3RTWDZYZmxpUE9SV3J0a2lW?=
 =?utf-8?B?VmlMcHVHYnZtbVg2UTExQnkxUk1VVzM1RzRVc3BuVVdPOThRejN6MFBmZXh5?=
 =?utf-8?B?eEM2ZWpGQWN2UmI4SXZ4TlJOamJDZmZnVU03VFdEOEZ1MFRVTHMzWUYwNnF3?=
 =?utf-8?B?UjFrcTlyUnhTam9BR2tscXdoRGUxaHlSU2pLSW9vSnBrWnkrNDUxOTRJYlJ3?=
 =?utf-8?B?VkhiMDR4TzUwMDFEQjgvcDdtam5IRHpyN0JKYkgxZjV1bmVidFNoZXdaNi96?=
 =?utf-8?B?OHZXd0E4MUxkZng4RnhFS2JpUUJFMDQ0SlhuUkwrWldaREEyUDB6eGIzdnBX?=
 =?utf-8?B?U3k2TU53ODdZdk1WUitEb0gvaDg2UmptblNCYnhxZ0F2d3M0WnJxL2l1YzRG?=
 =?utf-8?B?SGZoRXBZR2pOMWFuN0hpZ3o3aDgzaTl1dkdlbyt1Znl6UUkvdzQ3N2gwd3Mz?=
 =?utf-8?B?eldybzJQdjIzRk1yNzlhVWhXOFNxUHg0ZnBZNzFGNHVEYXNHb1BDNHo3NWJl?=
 =?utf-8?B?ZXhteEZ5Sk94SnlxQjZCTFd5VWo5M0ljY0JMK3ZqT1kzU0FFT1hQMFZXKy8w?=
 =?utf-8?B?dEF4Q09NNkplZkVod1RUd2hROW9rbDNaMVdPVkE3T1JnUXdjcDZJNHE1MEpr?=
 =?utf-8?B?ZTBYaFF1cXVlZUM1dFZXdFJoUm04SHFBUkdsZVlGY0R4SXVPNjY4OENkNm1X?=
 =?utf-8?B?TEFJQVFyRU9BdDNoMldKR3F2cFFJeE85RXNqcGpOaDhZUE11akcreGh6RDh4?=
 =?utf-8?B?NEVHVW5wTmJQeTV6M3J2YlFGZFNSWXpzbHYxTDNNZWVqRmpwWXl0VFFpQ3R6?=
 =?utf-8?B?RUtYRXNQcjVnSSs0TjV3cE5lZ2JsdXc1VXJxWmZxem0wcE1id1dMTkdvNjVL?=
 =?utf-8?B?SmdqakJ3Y0pISzlHMEdIR3dRN0tCZnoyNHdrVCtnMWJiSE80SjZTTXpkUEpN?=
 =?utf-8?B?dHVlWHp4WldRb2dTTW9SeEFZdHhDbGxreXRsUG8zVDl1dmMrVmJpWkNvc0pE?=
 =?utf-8?B?ZkVzMDFIbGxRRHFzQlhid0J6cGtMT1cwMEljdENYdWpRMzdRRTU0RDFFcWdC?=
 =?utf-8?B?Z0FDbWR3TDRDRjZrRWt3TUg4OXV1UE5hb0dPdTMzUUEreFhHTkd0MkRRVk1U?=
 =?utf-8?B?RjE4a2hxTlUxYWRYQUUyVzBoL3U3NU9WSG9GNGZUWjAwaGpFa1lNZVdsSXQ4?=
 =?utf-8?B?eXgybWpSMG8rbmFkVjhLRkNnbi9BQ3lhZGdJVDFSQXlVR2d3QU9MUzlMQm82?=
 =?utf-8?B?VmdJSlRDUlRPK09uN2UwTjhGOHlmN2YwcFk4SXZ1WnQwaVhYV05tT3FQSVQ0?=
 =?utf-8?B?alFsWnBZUzdtd2piQ1NKWnJiR2Qrd0hHYTVoa01oRVIrTnlDYWtORjZjVTls?=
 =?utf-8?B?ejI3NWxGMng0OGo3TEtVTVpHWStQaUJndkUzRVUyUlBhajNVNHdHZXVwVlp1?=
 =?utf-8?B?MUFWSk43Y0FMejV2b3ZRU1RRdmRGK1d3Z3ovR054Z01nd1hnV2FpdTEwT1VS?=
 =?utf-8?B?N0pzYU5UWTAwSyt0ekhsY2l1S3hubDJJM2tMWllIRSt2SUJSdmpNelE2OUtC?=
 =?utf-8?B?eUVLR0h2TEtDZTNJUWlDV2NONFh2MzJtRGxkMG9NdDV4b0tNTmM3YURrNW1U?=
 =?utf-8?B?YmZMbkt1bFo4MVdrTzRtc2xlRkJvQU9OOGRmY09MVXU5ZklON0M4QUhPcGdM?=
 =?utf-8?B?Q25yV2R1Mkgrd280TitaMkl6M3lvUHFZMDlCL2Z5R1M2NDhaWTFacUhEMDBE?=
 =?utf-8?B?N0dkL2tQb0JJbDFZRWZqTHJNdWdwNUgrWDdDY2RtSWhpWllOWmQzcFVQYUFC?=
 =?utf-8?B?Rlg5Z1BSVGkrL3N4dCt4MXZSMzlRcjg5Y2lnVHk2R2xoeWwrSmlRekxkTzlP?=
 =?utf-8?B?MEFLL2puZVFoYW9MRHlabk9qTVZGdXg3SXJKeDJmUWl4YUdsTEsxOHd6ekdy?=
 =?utf-8?B?YmJndTcyOUFCdHlvWnhyMkowSHZhYlhINWV4TE5aUkdoTnN0bnRreGtMcTZ6?=
 =?utf-8?B?SkhQWnl6NDJVOFhwYm1od3p0c3Y1TnJ4MzVBUkJzQ3oxUVA4R0xtbURLaXc4?=
 =?utf-8?B?ck5TUzVTT1pjOTc1dXlZWWIxSkREaGU2SXZaTjQySVpuYm42SDkxV2dzdFly?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed770ac5-a676-4650-388a-08dce307af4f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 17:28:52.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k8LrN2ZzKCr31oyWO8qSRKrgXOSQ8qMB4szFV3leA1rqrgSxu+r/dLaeTcPYNJxMqZZXjnKCTq9AKF0BBEFwrQkugsgrV8vUT3CFEWnwME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
