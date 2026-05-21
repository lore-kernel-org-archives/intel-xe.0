Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D634CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B7A10E144;
	Thu, 21 May 2026 06:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLk0Jnxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6754310E144
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779344989; x=1810880989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rw18oDfhJSGvd3v1TCQGw/oWXZvifSjU14fI+2t8PLk=;
 b=HLk0JnxhwouG0LNDnipE3JPrzCuWWi8faVbfIsPuSLqrhD2RnxnBhd3c
 5uj7vq57aA4I/Afa8cW+x1Dj6N8sPehyOl1l3mdv4K8CsN7XcV3VvS3p8
 4nQerRnspGa/Vy9YxeEqcG9ryD0akCEuqzBGPcSgekYPw8qf4JwXzb98L
 xY+JwFjIFqXmOP7x5Q/8dv4TOP0ft6JiFfdS7jQJVF8Gst6fEA5C7kLgX
 wcZCnFGsSZbVCpuGXK3MrD8496MPPKvmaNK8pUKONrU6dZ0InD9+0sC99
 cjM57G/ZD+rGTU5GCYW8Z4JCXlSRhrFDRx9Wipmv3zpsfCHWvb3iCAxJV g==;
X-CSE-ConnectionGUID: bMfAh3YaREiVXezfLLUY/Q==
X-CSE-MsgGUID: ddydOdUjTiyTLJTCRnfGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79405132"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="79405132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:29:49 -0700
X-CSE-ConnectionGUID: mTQpMQJGSG688qRb20WB/w==
X-CSE-MsgGUID: KsG009KDQxmzByJKjoDYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="245467868"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:29:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 23:29:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 23:29:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 23:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktOGC2mixkOetRxl7HPcA5moN3FctQx8o9JXcQe7c3M2J04de5nwwh2EOTReY5OSjYchEV0mYqwejlSwsVVt+dIN9tCCzjtPhvKIlXHUWqD1HlAj25YbTDSHWtKjw7G7YnFp8YnzGO8RJKZAj1tDvVgdFr4hK1R6L8D7SmDLYhihx5cseyta6bu4vuv4kcojigtZYFIUks1meuoujzRVQJTr7T72DKJAuu/L7ugCDvFD1fQyX3hR6B+FD3J6F7RI/utaoY8qW2S/LQt6dunG8NoAYJ06BLK+I3Zs6ZHFuaJ5h33agpEjHGHFplCKTg/HjfSBR7NwlNuZWh1j9lTayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z07aA+46ArAwHHmueTmVyqtVKvTNkw9b+hZ2sNyX9Bw=;
 b=QvPnVWnmOlbG24TxtQ9GdGTuV6gHBzYwfWqlCuONlTACLk3JH9aOyqvmO9ietBgX8EzKvSX/IiZoEEWVx2QsS4BDvXveIMPTa+Vk42d7BcNE1cPR558gnFutvg7n5Iu0wb/D16SoBvUfwPxpEKxnyClTYyPvXeQRbbyAgkVTb4+3e/MT5C97Qb0qMgHPp8NOL8P5rGbjaQg0Gk3EQ6yHBeKfaFPVJRfc5ch8HW9UonfCY8PM63hamowThVZqlqv6VusyToxz8jV3bSpocQvWiB65u4D53rOKs5NSHaRq277PiJDSe73J2LtiJzNI1LnvoO6oDJ/a9AOOnpAQONJCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Thu, 21 May 2026 06:29:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 06:29:43 +0000
Message-ID: <1e2718b2-bb7d-463c-84e9-f85d6a8c635f@intel.com>
Date: Thu, 21 May 2026 11:59:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-22-riana.tauro@intel.com>
 <agYJDqkslpMvjprk@black.igk.intel.com>
 <6fe6f3e9-6779-4949-acac-3d73a9bca571@intel.com>
 <ag6jYGZFzK4L6mF5@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ag6jYGZFzK4L6mF5@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7fc093-576a-445b-a001-08deb70257fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: whmlyFtx5zKNnHvFH5zMT2FSsEjmpxXgdAtR3H43Ll/h8tXdbMCL6ZPje1YBQifuBSrgANRFteGBF/sN+uLMpeeYyHSCf8vOuWTReQmz1mkzjaTAxnKU8nb62v8gaBYdrtDvxRVH2L026QT+bAeUNKSwDO3OlpOUVfOudlck4F+0+6aewU3wHy4dAsfVm165GupBe+lWCp1DCT9XSKRQrow568Q8gS2mlO2KocRKTz7q+YN3FXmr6hS+Hqw+CoX3JdEw1qB25zIYjlBRirgS2j3nFio3avaPWSFOxJgUSC0Ef7ZEBcDH8TxH5fS6JEAhgXun/Yn/KYyCfj5ExKQncEXWukuAjyuIfmX6+ZjtD0hk9tdCvlSJkHzb5s5cht4/wFWCaoIYpyA57ZH71eW6+bNAKomduKWUOb0/IsIMhZBtUWA2gmqQzyOpdCfTi3bD1l1uz+dtnSn52qPAthUPm21sYDH33LGICrZ6UMeI0OL+FUjBFlw5Au5SGlbMxWhmVj+A+DuMmXJj5gjkgVnD0Oby2ZUMktOOQ6lVONZLzWytyXzxcPuCVXN+xl4Hn/kG+K9UIH4GFCvcgGwdyJRHq8um7Dloc/dbvWNUQQG4K9ep/lU7G7WxUUbjjQ42glxVebyauG6IA3g5zMYSf2j7A+xhCsg+Trho27//AJIENIf3s0qGsHIvYUIhkOfH5+w/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW1KMG8xZ1RjSDZ6dUVITjV4aE51dDJEaWU4TTU4NWdmU0xoMG1UY3phcUJw?=
 =?utf-8?B?cmltSkFlN2RMdjZLbmR5VmpnZGJFMEE5b0FJUDhSQmlNMjVpRldzYk44ZVZ3?=
 =?utf-8?B?N0ZhQzRQUFNQamRMd1hoUlJhZGtHcXBCdmRsK2FyMisxSmQzcUtxMlhzWHdZ?=
 =?utf-8?B?RFA5YzRYdlcvVmRmRmtZQk1zTGZtVGU3OW1WbWw0YjIzTW9pOVRvZkZySDZV?=
 =?utf-8?B?MEMxblYwcFNpcHVSeXFrK012YU9RaktKWmEvR2RIVzJtNEQrM3I4YzZSYjRW?=
 =?utf-8?B?UCtoUFhMSWJoSGc5SUlYSFBvb2lFencxQUlpR3FIUEhNZ2tLMmF1UUcrOVdt?=
 =?utf-8?B?aUJ4RS9zeHByVUwzZXBHQXNubkJ5bWVMeE9zQVFPbWRlc085WTBmUWZnL0xJ?=
 =?utf-8?B?RDNKdU1rYU42clB1d1FNNUp5S2RoVVhwci9iTSs3VFdDMFovZ3I3Mnk4d1NT?=
 =?utf-8?B?dEVvalJVQVRxVzFNUG1VSE8rU0xvRFJiQW9KUllUQ2VCWEZtaDZFcmZ4aFZ2?=
 =?utf-8?B?OUN1a1YyditVb3d0Nks5bHlQYUF5WncwUU9ESi9BRHBocFMrdmJkbE54bWJm?=
 =?utf-8?B?dWZXSTZVdktNbUpyKytWbnBUQ0FIMHQ4S3MrK3JlWUNubnI0cFhVWWNpWno0?=
 =?utf-8?B?aVVOclNTTGcxMzhaY1hZaXRkdTZLMTFOTytldzFrbXRuczgvdmNBSnJMdUgy?=
 =?utf-8?B?M1BUQnJxUzlWQW5yeThIa3I3YzNWZGw1VDh5SmVWb040eHVtWTFGclpWaDlM?=
 =?utf-8?B?SG5Yc3BkdWJ3WENBbU9iazV3WTBuQ0JFUndSaElDVC9yWDlwd3pxVGg0ZEc3?=
 =?utf-8?B?ZlcrS2h1SWh3STdRQ2dvczM0dW0yajlEL3lnSlh6TE5RblJ4Z04xc0daM1Mv?=
 =?utf-8?B?WGFLcnlLR1BwRlNYWkxSY0dzNTZkNFZ0cytiTGRqMTkvR0hweDlscDZOdGZh?=
 =?utf-8?B?SmpEM3QvNEdieVd3VENWcXRHM1IwYTREZ3RkVW5rODkydFA0Wnd4SCtlQUNP?=
 =?utf-8?B?OGxTR1NUNTVsL2Vod00zMVV2ZElOZXZLTGRlLzB4YldRUW9tWHA5cy93Yno1?=
 =?utf-8?B?b25xeXQrSHRpNW85RzVlUEphZm5PWUR3WVEwMTdlOGpBSnEwSGhTYnJ6dFFM?=
 =?utf-8?B?cUtOVk8wc2hBN3ZLU1c1K0FreHJzT3kzOWdQbmhISm16bTQ1MGJHbVN3STJM?=
 =?utf-8?B?akFJYnFaTU9pRjFEZkpkdXBzQWVoOHg4MVArUlc5dXpZSVVJRE1wb3Q3QlZH?=
 =?utf-8?B?eGxqVzh3TmVETkxPUUZ5eFNEdzVLT0dkaDJNR0VVRHpoQVhMUkF1bzF1eFVa?=
 =?utf-8?B?cjlTakhMM2d3Y2pJVnBiVVJaU1dRK0lRNXNPaWZzckNiS3orWG1GUW9EZGJB?=
 =?utf-8?B?ZkVEZThqMHNZN1g1TjZnVzJ4cVVLeW5MQkFWQnlscmlIU0tBVE1HYW44czRn?=
 =?utf-8?B?aURjdnRRWkVhbm1TempFTitndmhOL04xYXNqZ0Y5ZGRoZDE2NHgrY0J3djdW?=
 =?utf-8?B?Z2l2c2NrUWkyZTIzZitWT0JFMVZpeDc2QzhZVVBiY24rVHR3K251SU41SUM2?=
 =?utf-8?B?a21TRmhoMmtRNkxuNFFrMFdlcHdVbmM0SnZFUVdZSlNiSzBFOXI3NzB1VHZn?=
 =?utf-8?B?SmFQdVdDY2J2QkQwamMvb09hZElFbFpPSUhLK2FlSkhYa0xNcTQzdSt3TUpV?=
 =?utf-8?B?ZGVoTlAzZE80dDl3ZzFpdnpjZFFOS0k3ZWJzeElvR01STGZ3NnJqOVdnVW9E?=
 =?utf-8?B?TGd6QVczRDNZanhmUUowRE1mMGNac1FTcm1Fd3IzbjBoZ25DWjZzb25lRUl6?=
 =?utf-8?B?ZFo1TkR3R3VQbHgxcHBYczk4ejVlQ0lOR1ZldE9wb2Roa1BwMlNybzVsVHNs?=
 =?utf-8?B?d0dxNXhybFYrLzUxR1BucDZ4MHJCUW43OWE1QmVFdmQ1NTVWakNaU1cybVgz?=
 =?utf-8?B?SjU1UEUycEdLMFhRQ201aHF6VC9UNy9LRUNuQnoza3pQZHZiVG1pczUzNGk0?=
 =?utf-8?B?cmlrb2tsaUNrNGhFVHdXbWVYV05JSkUyTmZjUmxVZ1B6OGV0Tk1rM0l2YUJm?=
 =?utf-8?B?bVJmRStFZ2RrdGJPWlN0eEVUbnorTTB1MEE2eXNEenZsNnUwalVqTDF6aEo0?=
 =?utf-8?B?Z2k5QXNGRGgrcUtFYXpydTVOcVJ6Ykd5cElOWW9FWGpyMFNjSGo3VGtSM2Vy?=
 =?utf-8?B?b0hORWdiMUFUc0FXMnNpcGhxV0NWN3o0d3JyemgrSFpPd3huMWRVZXoxdkxW?=
 =?utf-8?B?Y0RLUGwyYWllaDNRTkFNTDVudkw3d2VDR1hNZEN1U2xHeXdzVUsvNE5Tc0lJ?=
 =?utf-8?B?SVVDTFdwS29mb0RJeEZnWi9hTGY3dk8xZk5DNFhweUtYL05iZ2pSZz09?=
X-Exchange-RoutingPolicyChecked: lBBURivbmMnHV1KGfqnTPSzODn6L6SxJULTOnL5rc0/83uz00dXIbMmonP+SttRK2oKkUjbiulKkLJAK7NsxKJG+Di5G/Fr1kODeR8Dx4kT1mloSAIFDT4S0mNE9IB+53sHhpYrjXNIpw48rwmqUxfYlUXm4KYuvWlsckmBCueXJa6k8XcgD7M6YaS0KLaxQug43ehm96N+rorDyg995S5NITfNd912IN/GNmignzIm47Q/hJhmiSP+r+sgeQuTdVnpznEBxvcC3vkSXUL2RVpLMG8h7BXnpEjCijoEIZpz57LD51iCXbnnKW43C/s6Hc2en7csnMHnQrPSf/qvhTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7fc093-576a-445b-a001-08deb70257fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 06:29:43.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5CWyoC6aD0ytx8b2UAry4fGhkyzWWp2kQUTTJtE36YDELWZJtpTSURiaua/27Ii4qs2GJKRMdlMgmxqJLW22g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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


On 5/21/2026 11:47 AM, Raag Jadav wrote:
> On Thu, May 21, 2026 at 10:28:16AM +0530, Tauro, Riana wrote:
>> On 5/14/2026 11:10 PM, Raag Jadav wrote:
>>> On Mon, May 11, 2026 at 10:59:13PM +0530, Riana Tauro wrote:
>>>> Uncorrectable errors from different endpoints in the device are steered to
>>>> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
>>>> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
>>>> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
>>>> detection, containment and recovery in the driver.
>>>>
>>>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>>>> Internal Error Severity' set to fatal by default. Set this to
>>>> non-fatal and unmask the error.
>>>>
>>>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>>>> ---
>>>> v2: clear stale uncorrectable internal status in status register
>>>> (Aravind)
>>>>
>>>> v3: abbrevate TLA's (Raag)
>>>>       add a info message if USP does not support AER
>>>>
>>>> v4: add a success log (Raag)
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c |  3 ++
>>>>    drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_ras.h    |  2 +-
>>>>    3 files changed, 82 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 4b45b617a039..200d6bbb1b70 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -62,6 +62,7 @@
>>>>    #include "xe_psmi.h"
>>>>    #include "xe_pxp.h"
>>>>    #include "xe_query.h"
>>>> +#include "xe_ras.h"
>>>>    #include "xe_shrinker.h"
>>>>    #include "xe_soc_remapper.h"
>>>>    #include "xe_survivability_mode.h"
>>>> @@ -1048,6 +1049,8 @@ int xe_device_probe(struct xe_device *xe)
>>>>    	if (err)
>>>>    		goto err_unregister_display;
>>>> +	xe_ras_init(xe);
>>>> +
>>>>    	err = xe_device_sysfs_init(xe);
>>>>    	if (err)
>>>>    		goto err_unregister_display;
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 4cb16b419b0c..24642c309967 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>    			comp_to_str(component), sev_to_str(severity));
>>>>    	}
>>>>    }
>>>> +
>>>> +#ifdef CONFIG_PCIEAER
>>> I think all the PCI stuff should be part of xe_pci_error.c but I'll leave
>>> it to you all.
>> xe_pci_error has PCI generic error handlers. However this is not a general
>> PCI policy.
>> This is to enable RAS flows for devices having a sysctrl to steer errors as
>> uncorrectable
>> internal errors. According to me this is more suitable here.
> Then perhaps let's add a xe_pci_config.c? We have a bunch of similar
> stuff incoming[1], so probably worth having a dedicated component.

That patch is still in discussion if we need to check the config space. 
If required, this
can be done in that series.

Thanks
Riana

>
> [1] https://lore.kernel.org/intel-xe/20260520113351.171119-12-mallesh.koujalagi@intel.com/
>
> Raag
>
>>>> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>>>> +{
>>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>> +	struct pci_dev *vsp, *usp;
>>>> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
>>>> +	u16 aer_cap;
>>>> +
>>>> +	/*
>>>> +	 * Device Hierarchy:
>>>> +	 *
>>>> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
>>>> +	 */
>>>> +	vsp = pci_upstream_bridge(pdev);
>>>> +	if (!vsp)
>>>> +		return;
>>>> +
>>>> +	usp = pci_upstream_bridge(vsp);
>>>> +	if (!usp)
>>>> +		return;
>>>> +
>>>> +	aer_cap = usp->aer_cap;
>>>> +
>>>> +	if (!aer_cap) {
>>>> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
>>>> +	 * Status Register.
>>>> +	 */
>>>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
>>>> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
>>>> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
>>>> +
>>>> +	/*
>>>> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
>>>> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>>>> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
>>>> +	 * detection, containment and recovery in the driver.
>>>> +	 *
>>>> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
>>>> +	 * Internal Error Severity' set to fatal by default. Set this to
>>>> +	 * non-fatal and unmask the error.
>>>> +	 */
>>>> +
>>>> +	/* Initialize Uncorrectable Error Severity Register */
>>>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
>>>> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>>>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
>>>> +
>>>> +	/* Initialize Uncorrectable Error Mask Register */
>>>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
>>>> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>>>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
>>>> +
>>>> +	pci_save_state(usp);
>>>> +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
>>>> +}
>>>> +#endif
>>>> +
>>>> +/**
>>>> + * xe_ras_init - Initialize Xe RAS
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * Initialize Xe RAS
>>>> + */
>>>> +void xe_ras_init(struct xe_device *xe)
>>>> +{
>>>> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
>>>> +		return;
>>>> +
>>>> +#ifdef CONFIG_PCIEAER
>>>> +	aer_unmask_and_downgrade_internal_error(xe);
>>>> +#endif
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>>> index ea90593b62dc..a88ea0a46766 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>>> @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
>>>>    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>    				      struct xe_sysctrl_event_response *response);
>>>> -
>>>> +void xe_ras_init(struct xe_device *xe);
>>>>    #endif
>>>> -- 
>>>> 2.47.1
>>>>
