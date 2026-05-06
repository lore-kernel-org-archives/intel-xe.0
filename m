Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4505CD3436
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 09:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B6410EC3F;
	Wed,  6 May 2026 09:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/p4/rn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1F110EB11
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778061431; x=1809597431;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=XF+QiT5DdzybU4/wRe9bK0iX4s95URTwo9lHc1echk0=;
 b=D/p4/rn/G+esW8OuHW95fH5k01TF/0NLXPObfdBEByzeHZkfAgmYAOiy
 1oAoeFvTBNVcn+M7MLXy2dk5kKNKPfpy9/FC2gfb/yTxGweM2TN4PBadS
 iivmsLZsu4Vjt1xBQY2d7a+rWrnx5mfLxwT5Qf/s7/HyBLLuRVpv7R/AI
 Low886E9lcfHk+c7J5A9aRLfwpJNn2yEFPViDsxXhcwUKRxtAeS3Ns5EF
 cu35k5y0ekuRNHceoS8oGUMJ60UqkB5dgK6f8elqb7CRoR1TR1yD7ey5F
 YtyMQ8eOD54ReIiWS/o1cLEcE5Z1SgPT5dkAzF3hHGKRzdi+35sOkwSxi A==;
X-CSE-ConnectionGUID: kcEAhPtZRWGznM1zEa64+w==
X-CSE-MsgGUID: HMo2QT4JT/OrYyMIiTjksA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81552216"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="81552216"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:57:10 -0700
X-CSE-ConnectionGUID: /TNxKHjtTLWdubl+8uivAQ==
X-CSE-MsgGUID: GQoyesf2STO6ffmyYYePtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="259526923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:57:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:57:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 02:57:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgpX16gBx7PjXgjgboZ17NPMOdBeWJtbOY7lGVCMJ8r0HSdBPYxlvIwHvBBKCnxOXVA/O6Pke4qX2Erdap82+JTQcSzhXdfVzaO8m6p914BLHnWO/1D2bLmJ30N374OoxN9e/5PePtLI4YwUDFcnReS5e9HrD4e6wG+nXGvueEUtNj6gpU0dVIdxQRndY8tSA078CkRsLC1/mT8m+VQWlcQIkRXYikCoaknsUo6SHo5x3BmaEjZNKDWzNct9DriyW2TwK2+mBOmvSxTxNTAkJXt40zQtv48nHa3TtXXld44dHD3xotKrlt8/KDe86v8/QEssyZGvQM8Iln6tw+T++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEB+tOn1ovbeNWFqd5PSPphknxmxyZclLEWnvSTFtFw=;
 b=C0YPEX5VkVTsF5y8ce1Apnu0EL6b0vxANmgelAbuXZeS27KS6H8Z9yjn8Ggy0Lk0zF+8/leU/ZSpw6fRbFOdNkuD8FCXsJ1ERFOXbuFo1N2GN/mtlJ3OND/vLUumYtXK2qWtFoaxwofVfO4g8LoLdzHM7C/XzMO4QNWS567AKdglJI9Op9UzOsiffwJoBLFUG5GEr/+6zjoqHHkC6+jis29jaQhKPi0FxnZh/4XrfKSKd6w5LORIL6GMdWdncc9QXzDlXNvBP7EG75pVKvj/QKU2IMHz311fEPNIdmtkoojppXBJs3/TmdY/VUPxXaqTuoVyejrfUC/5tMIzfaxXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Wed, 6 May 2026 09:57:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:57:02 +0000
Date: Wed, 6 May 2026 15:26:56 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/cri: Add new PCI IDs
Message-ID: <afsQaF_o83DeouhV@bvivekan-mob1>
References: <20260505074855.3813063-2-balasubramani.vivekanandan@intel.com>
 <177800201103.38341.5303124062842615363@5ab824fced77>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177800201103.38341.5303124062842615363@5ab824fced77>
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: f522494a-14f2-4180-953d-08deab55d26b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: SAnzxThu9bZwGqAfcQPKaHZDLhXvNJSZw4NpcBQyKxI9I+BGNQ9h9+lWDf7Zdi4hdZgVwanwYdCYVvnr+aNXDSpE8aUoNHMlpWWWaCGmUWp+T3J5WbEX6Uy4V2qZKQudKuKDgPSTK1ooxmhdzX8bCd2DQ5Po8xlRFsWAWDjl+9kd+NcKdSGQNewZwFAM5P5ogTw7r12a5Knk6hdlwHXE0wpTi7ZlExcxVLVwL6rafiLEbEVad0dycBNt1Rr+9tRvdVjn+Qf+TOLSmNrNjAwMdRSiX/tUMllg8OdTFN+bk/YNjeDO22/Ndh0TxiazYKifVL4fDkEsYQlyb5Tk0Nqfb3mx83Nh2Epqm4h8gCf2Ap+kTAtKkB2NHhKl1Jq3pX9TvJdmmKt+UwzrDwr5ODbLTOuGZ9hI3lEITdE1k4uMNp2X+Uq62nkrOZ+XWrbwZUX2PwTFMpn3I2zkBzqs9brjPvc8yPI0QTBJnAuTvh8LYfpa5zaOSroOUeAq03kPJRZGIXvx/SLyyjkHx3odJKSC/K2AJUcNAjrdIPOLl5UgS2aIQSdaIB4pj+7V5VZ+GO3S2e5giqv9eRYkIXECqlfWPKGcNWa3aB61U3SFj4tWuRdPQ24FoFTjFjoU6JAiF34mH5pa4ecFhAahX7XiGhF0oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRCTWFhekxYTGVFOFFMR2FualZCdThUZlNhQmVhZjRnTEVwcGZGMFRDSHdv?=
 =?utf-8?B?V3Z0TU56dzZROXBkRGFKOGRTSEZkaFgwOEZpTjhoMVVhQnFUUkFzNnBCQkM4?=
 =?utf-8?B?U2RWZ0V1VVFsbzBVM2hvR0sxTng4dmZpVDJydlhwbnltYTYyWWdKSVdBT2xP?=
 =?utf-8?B?c2hidFlJTnhsMXQ1eE91NVBMeEllak5VdHlBTE42UDJnTkYxUUxuZ05RNGxh?=
 =?utf-8?B?ZkdLY1JqT0NocjRRY2Z2S2ZsMkxSUnFiaGpvWlMvMURJSjhad1JaOUpCTVp2?=
 =?utf-8?B?Qlp0OWpHWFJHVzk5L3NOZ3EwUVh1SDVTTHNQYjVTa0ZIZ2xMUGgyb0YrSW92?=
 =?utf-8?B?aTJ1dkw0cFNTRFJaTXZQWCtQMXFBR24vaHAxSnJxdzl3NVdMemI3YXRCYml1?=
 =?utf-8?B?b0VWbEY5UVV5aURuSHhCZk5ISEV5MzlwSUpaNS9uSmg1cEFTU3k5Rmw5RG9K?=
 =?utf-8?B?ZTl2UmNjSllyZmVIUjVCdTliZ0FuYnZ2dHJRMjk4WHhQSFp3U25iaTh6M2lu?=
 =?utf-8?B?cmxzWnJNMlpWczFmdkIrSG4rR3BiRlJjSFVSbzV2WEFBcUdIVVBLNzQydUgv?=
 =?utf-8?B?c1cxVkZhMmtDQjZCdmxTUFY5c2xVaWlkSWc4OFJHemp6UGx0NFl1cHNTWS9K?=
 =?utf-8?B?S0xvSVlYUGo3eFREeHZHQXhSTWI3NUZnOC9nd2NacTJ6U25uQ0d2L0x0bnpZ?=
 =?utf-8?B?THdjNnVKMEdHZDJnSjE3UzR4QlVOS1d4dHdhdzZpYUZ5dlpFeEJJQ0dmWmto?=
 =?utf-8?B?U3Q0SmxhV2VSdmdKNFJyMG85Q2l4cEJYRysvbVVEQW1tRVUxT1ZNQkxiaTFy?=
 =?utf-8?B?dW9RMkgvK044V2RqZTFPL1d2aVFtbVkwbVlQdXlFWklqQnRKVTlBQ1JUTllN?=
 =?utf-8?B?MXpndVhGbnNodmRLaThOa3hnOHNjVUNCcnVZTVJBWlhwMVkzbkIxZHhReE95?=
 =?utf-8?B?TEZheFVVSnV6dGsybEo3SkNsbjFwMTZHS2E0UnRCSlN0b280RVBLRkxQMXk0?=
 =?utf-8?B?L05oSTU3NlFVZkdoZko1VnkyeXZNdjFOY3J5T3l4RFVQRTVrYmN5ekM2N0Vt?=
 =?utf-8?B?TGNQTEVXSVJ5QnBpQkIySTdpYjdMbGNaRllRNllid01oZ3FHaUg4SkkrYW9l?=
 =?utf-8?B?MlpWejRiaEhReXBYM3BCMlNtbjJFN0dRTFlqRmlRR2JLdEpFOFM3dExMeU9O?=
 =?utf-8?B?K3BEL1BCNERObjc2dWpiazg1L05TQW1YcDZONHBNakoxSVQzZ2UzVG1oT0c3?=
 =?utf-8?B?VGN4b2YvcVlYL281M3ZOMCtFRENpVlJFdlJ3M3lhdUU5WTg0VHpoZFdQbU9u?=
 =?utf-8?B?UFFndlJxYi93SDFWZmozNVpDV3prSXY3aGw5NEdxeE1yU2VHdm1OaTY0YU9u?=
 =?utf-8?B?dDM1R2hCSk9wdXdBM1F1S1RMV29qWjJaK3E5bUY3WXRnaVFmS3ZSdlJTazZm?=
 =?utf-8?B?b2lpM1lucnNNenQ0aXQrWllMb2ttWDliaXVtaDNEeHJNQzd2S3JLU3FhWU54?=
 =?utf-8?B?MG5USnJtU3c3c2I1WWx5VG5TdDczanh2V3BJbGg2d3hrRDlERXQ3eFJZSjRB?=
 =?utf-8?B?Smc3b3RTT3A1S3pER2dFRjlSZktJUkZYcU0rT2NJUTU2czlEakllZmFnVElv?=
 =?utf-8?B?eGdEU3l2dWw4R3BOS1B4RDBlc3BMMjFxdHZWTjZyWUZsSlVMemRQbStYYnJG?=
 =?utf-8?B?MWcwbUw4ekVFWlhQL2xsRDY0OUsrMWV3dlZvcmNQYXBhZG85cW12aXNXZVQw?=
 =?utf-8?B?UnUvSzQxcXFrT1Vlc1BZR0puUkE3azlyTHB5NjZuS00wRVpaS0pXblBOMEZr?=
 =?utf-8?B?NkozTTBmVzFxR3RlRnlDYk1hVnMzK2R5NnhSVVlMVGZoRndsRVlCdFNkdDRM?=
 =?utf-8?B?Ymt5RGh4dTV2RCtvVjc1Z0VaK3lJYVYyZUFkMkZ5OVZmdEdNQ3hiTEZQTnRY?=
 =?utf-8?B?WTNaZjNJMVNkR1daTXFJYzJXVEFPbFVPS2V4UnFNUU9uaE1nVDN3cXdhVFB5?=
 =?utf-8?B?MWU3bWFoVkhuWTh3QmdyRGZzTWdWTGxaTFRuTXJPNzdqNkV3WVZtZ1AxT2Rx?=
 =?utf-8?B?dXFZeFRxNHhKamF5MnQwRWQrWXcrZXB4UzM0WjE0QzdxTWx2WVo1OXh4MWNk?=
 =?utf-8?B?WjhiWlJsYTJHemFOV2tRTGhWWW1rdURxQ2FTdldQdDVabVhCUlhSS1Vrc0tZ?=
 =?utf-8?B?MHRDSXQyQnBWRkgramQ0S3FjaDJXNWZYeDhxT3lOajZ4VFp0YjV4NFpPSGln?=
 =?utf-8?B?Mlo1dzN1cXdGazFmOVJkVkRvSmlmQzlOMWt3MHpiUlVPNzlCZ1Zwb2drNmkv?=
 =?utf-8?B?YUV6eTR4QW9KQ3lzRCtJSm81QklielhRWGt1TjBYV2dSY3pETjVGY0dPdU5h?=
 =?utf-8?Q?RKZKkIR5SiV58wseegK/3tZhoKVPsJg24OQ45?=
X-Exchange-RoutingPolicyChecked: YTHNOeHzYB8KJ9v4d0Wu/3vnI+42EsYaQ6FxqqLMftSVLwXYvuWERWPopk0AJdWKM3kFx5W37f4N5Iy7ka498hKDv+t50WzNIo6XtJSbaZCaTk4zZ6NwoNXnNF6xGiFiQhTTBqqdqya6FGGwFtXnnDpHrEYtDmiGj5vC4AZMWJUr14/NuoPyMh3DBuVBd/jo4qpE1g62rS7OrXZmae2Uv7JRgAudwSyLhIwvsMo4nWapu63tjEY8Ffo83IYyz2mz65dcZ5e4UTaDfTr82erR0DQXqldGHglP7wYaEn26ce3A7SkL5P5h+S3IaDeL5tSDTQJIZn1RKPEnAlVp6nG2+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f522494a-14f2-4180-953d-08deab55d26b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:57:02.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPwMn9ky4YFs3Q71wgiAcUZw+xMGseI+KqCpF6lwfXWsx7S9GrJsp50vIYBwyQIjXrllK79+gMmWuCxaCMliRT3gK/voYLfTWwls56KJmYL3y++4Zh6gTnq4faPveCko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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

On 05.05.2026 17:26, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/cri: Add new PCI IDs
> URL   : https://patchwork.freedesktop.org/series/165981/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c_FULL -> xe-pw-165981v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-165981v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-165981v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-165981v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-bmg:          [PASS][1] -> [WARN][2] +1 other test warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c/shard-bmg-6/igt@xe_pmu@gt-frequency.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165981v1/shard-bmg-2/igt@xe_pmu@gt-frequency.html
> 

Failure is unrelated to the patch.

Regards,
Bala
