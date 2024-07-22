Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962EFC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 18:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAA810E260;
	Mon, 22 Jul 2024 18:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4F7TMIX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4B10E260
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721672234; x=1753208234;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FrpUWvgIE/b69yaU4ra170aq96vPJKZziranY4IzO80=;
 b=I4F7TMIXtm/M5sNiVboZGLBn6WYaxkAzL6B75VhhNGrpm6vQZd5/7NGN
 eYSmMdJ0367KRtwhEBWvmME+ceHYLeS3i9l+U2MzAeNMKk8L37FfSuBIu
 P6bjgKXfLyvliJnvyNglqvWQ9OsrFi4kLUdL04fmmgUM0TS2RewliGJ64
 1pw8UcBvyfCdgcA+CAJ6GABJCYTK6aQSM17H7h4aH104lHoqsSrYcWWOv
 XeGy7u21qVoe5FBwFvaPMNLHsZ0stH2b/WNilZ/Y936HIZpA1cfbvWwxE
 DqRaJ2ExDpJrxtrkc4Fl2rGdic134qpYr1L0cDT2Dd5o/fJ66WpKiWt+1 Q==;
X-CSE-ConnectionGUID: q48IiqThShCow7URmWHIDw==
X-CSE-MsgGUID: 2UKmH23JSkWDZnXsXvfDFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19444084"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="19444084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 11:17:14 -0700
X-CSE-ConnectionGUID: BfNuhAG3SE2Izv1YM/lW/g==
X-CSE-MsgGUID: CJPVy2y+SlKCcvUCJPhukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="75167465"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 11:17:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 11:17:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 11:17:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 11:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl6EEGB0rwwlR1OR0yWMA+HM/U+4H9F4NFAt3uJ2nHKrmCVj9AoOVgQHZLi0hYSwtUhcqOR6AF/jwen64euA7463ZUR0S5v0oCU7pebTdjQ3+UP2ye/39dV+1YE+tGjszW3f5+i3OolN7YtbwEIpUXQMEDymh0WbCRx61FlaUoLpSROW43XnKkGcjqEfHubjZ2us75xMcNSXYv5wQ0MnFAcMl4WvcMsKd1FLx19cNw1PFYuuXkX4rvVg6g6j8/b4IKoulzHCMYYpOAKNXuPX63Y8R/20qjHciTn6wickz+uB8LbiUfcLcv3x+YrwnO3BSq+b/kaTRc1bIhC0Al76VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ECQXiPY37I4zHjm1sY7JHZFDvOpJrUX9QKtc/hvZuk=;
 b=i3QdIaBfD2T5/SwD+rLMqF6qGUM5kjy7asPxdTtI+6U7tc6XrM9hsuFAoTsuogykdtHJLXryASUI0vyBuyEuJmRnOypxL/GXd8mBOBobdpb2ABLsADmP2AmgQDgYqBcOQtr5njt9BL2LwPAwGjhpmu29UeLz4NuHCssHPz5eFRMBxKeUCklSm5HxAYxglcdVoqhAl+M5ZeuZFrnk01ZZ2Ff8qsyd7AlekK0qdMSgZlFJVVyx3mv6xdrkJmGq+9qOzaHimywgLV/x5ZESO2/mxdCc/SAmINWSnmQ0C4UlJZW1sb+2d71/jcbbtjpcMoUA65dW54pUaLLAr4gdZL938w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Mon, 22 Jul
 2024 18:17:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7762.024; Mon, 22 Jul 2024
 18:17:09 +0000
Date: Mon, 22 Jul 2024 14:17:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose display alignment requirement
Message-ID: <Zp6iI6lwWpOQo1d_@intel.com>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
 <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
 <ZpBSOJRDHJfmsX_h@intel.com>
 <20240712090013.ex2peruaomb6q5e5@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240712090013.ex2peruaomb6q5e5@zkempczy-mobl2>
X-ClientProxiedBy: MW4PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:303:b9::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a08807-99b2-40d0-7f1b-08dcaa7a7fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2VwQ010UDkxcVI1aUthWXI1QncvRkM0RXk0aXh2T0t2ZmlkTGNuc2dQSmgx?=
 =?utf-8?B?MVNRWUxORnc4aCtDSXBoclBsUnk5NDFsVFBab1gvR2FldEYxcmlxVndFRlBs?=
 =?utf-8?B?VTNKd01sdkwxaUZZTWFnK0F6eFBmRXp3ekhNZ3FQREhRR2x4RW5ZRjhDZG1K?=
 =?utf-8?B?RjNPVWVlVWhsejhvVjczVU5VRHc5c25OSWlnOHc3Ym9KaW9MV0tQaEdDU3hD?=
 =?utf-8?B?ZnI4MkZ2UDdrL2MwbWIxc29FcmdYY01peTUzOVBoQ0hLLy9EZHNVUVdUVTBX?=
 =?utf-8?B?N0ZMOExuZkd5REVIWGZVL0hqa2RxSWd2STY5Y0wrdzl0OGk2dlpZc3NPd0Zu?=
 =?utf-8?B?bmgzc2kvZGxYN2dTcTdjVFQxMlVKckdHdUh4bzd4bHlnTGFNeDY1WUVGUUtV?=
 =?utf-8?B?Z1FXN2x6QUhLY25ybVdoRXI3QkorclpueEJ5WGc3dVZLbG5vb1ZwaGtFU0NR?=
 =?utf-8?B?Zk8zL2NpUGRMdjViZWI4Nm56N2lld25ISkpiY28wQ2VrQlExamxVemRYaVVK?=
 =?utf-8?B?MExHdVRBQ2s5b1pINWVFanpFSDJPTU5qaS9uVzVyeUVURU90NzA0SzNkaTM3?=
 =?utf-8?B?NEpubXdoNklWMFVYa3l2VHF4RytRY2d1RW1hVk1rUXlDVzBNSE50SWhKQnVp?=
 =?utf-8?B?ZmdzcHlIN1NWYjkzV2hHS0l5VTVPc0JIYStBS3NPVFNYRTcvVG9ZQkxKemxw?=
 =?utf-8?B?SEV5OThiM0NrbkE0dzBjdTdjUm1IbDdIVE1vVlVMM1MzSlBJZ1lUUnlscGh0?=
 =?utf-8?B?SmRUMkdVRDJvY09QdlkzREdxRUtsdzQ3cTU2OGRWSXVjUlNqZzRpTitxUGRG?=
 =?utf-8?B?MVhWUlpTbHptK1hseUJ0eFF4WnVRVHVjT1lGTmNSYWtoMlhWeXd3S1B6bzRU?=
 =?utf-8?B?VFdBU0VGT3dPQ1Q5WmpIeHZCV1hHOHQxZWhFMm5lc1ZYM0NSMTE2RGRTdDJ5?=
 =?utf-8?B?WEp5MHRKN3VPMkpMY2J1UjVaT01BcEErNkhCd1B2WVYrNjFWR2VvQXhJTExp?=
 =?utf-8?B?OXlRQjdGaEpWTWFIVUxiRDFUSGZ6OCtpdjVkQnRZdjg3aVh2ODk1dURMUEhp?=
 =?utf-8?B?Qk9NSXFFc251ck1BZGVCWmMveDE0eVNpeW5TN0w5NmdTa2JZWTBiL1FKU0pC?=
 =?utf-8?B?N1RXOFBzNHYrTUtlL2l1Sm1wWnV3NXBTN0RqdVhoRW50VEszckcxVnl1QTcy?=
 =?utf-8?B?b1M2WW5BVDh2S1RVNURpWG5vTnl2VlRZQkgzQnRKMmlqMEorSkZlU2VlMFFN?=
 =?utf-8?B?NkpySk8vSmgxTXk4TmRzM2FYUHF2NXRnY2JtYWtNb1ZnRTdGdFZZN1c0VmhK?=
 =?utf-8?B?Vy9LSlZQQko3TWVQam9yQjRRMmJsTTA5SzNSN0NEV3BPd1BieXJrZEpVMkow?=
 =?utf-8?B?cGxobHFQa1Z6dURyOWkzNUgxMEF6V3NoSWFaV1VObWdNWWtvYmhlcFIrMEQw?=
 =?utf-8?B?L0t0aW9meHVDVkZDcngxSlpRNW8wTnlnaEV2Uyt1SzBzaVVGZG9PZTNhRXJU?=
 =?utf-8?B?L3hVZFJLekE4QVVObFJPU0llczg0M3gzNjB4ek9WSXZvYitZWmR6SnNZOHVG?=
 =?utf-8?B?N3hYckxla0xlb2RiZkRpZmJvYnZyTWNMbUw4ZlpxWnhGOWhKZnRrblZnQlVv?=
 =?utf-8?B?dlRVTW5DcGtDb1A3ckhmRHdXUm9BVWgweW8xSFk3ZzZISFZjMFVyR1JhRmI0?=
 =?utf-8?B?aXhZaUwrMEptcURYOG5UekNOQXBBSURpcW5FYk9FREczTXRZdmp3RnhBeTh6?=
 =?utf-8?Q?2NwWYJRM5BGm3dbOSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9GYytpWUxBUHhwMVY5bWJpNHB1M2IvQmhYT0VxSFo3dnpqNXFLcEpSSkgy?=
 =?utf-8?B?N01VUnc0Yldubk5STSthZ21SMzNham9DUkJsTHNiSFhzRlBvakRJeTExSkgv?=
 =?utf-8?B?YXdOSWttMTZMOUtIb1FQNzZYN3ZCWE1vQzBJL0V6bVNUZ1dxbVdybU9BVk52?=
 =?utf-8?B?cEYrYWU3Mzd3c2tQeE9qR2M4NHVtRkRNVWowbEhpTE45SDVJWWUwN2tUc1ln?=
 =?utf-8?B?VFU1b1JUc3Q2YUYxd3dTdmxxS2tXanR2RkE5bEI0cTE0OVJUQmRHWEF0ZlN0?=
 =?utf-8?B?OStmSGVvVTJucGtJaENSZ3cra2dnUEhsY0NmM0ZKSXdmZUNRZ1V5dlc3Y2NQ?=
 =?utf-8?B?RStqYjM3S3poaFp1WFJabURxdDIxZ1ZId1lZSmlzQ3lZdGl6OFFxSG5GaStu?=
 =?utf-8?B?UXdqY1BkYWpidW1vZzJkUDB0MGRIb1FUajBWazRmVEZwc01rTnFLVC9PMmFo?=
 =?utf-8?B?bUFpU1VSYjRTMEt6WW5TaGZsZmpkUHRXWFNvOWtoQmpZK3dEOW1jU1hmZEVt?=
 =?utf-8?B?dlpjUHVwc3M0VHlWelVZZmhLSm9iWVh4WUZmdXQ4Rm8wRnJCRGtwWkR1MHJz?=
 =?utf-8?B?R0k3TnZoRVVhTkNDM1FWL1lBMzNNbEI1ejM0VlNRcXd0NUJDenFZYlhNTXFQ?=
 =?utf-8?B?N01WWmV2aStMUXlEMDFrV0F3ZWtYSXdhQjZ2UVNKQytjNGNpRVlQOExMNy9O?=
 =?utf-8?B?RG9DOGtiYk9RYjIyV2VlZmQrSFpxOTkrNDlhUGtyN09BdmNmeUFvb3FPaC9T?=
 =?utf-8?B?bFg4cUt0RXprQ2JLRDRFOTQ4Tmphc1lTNnMyQmFvUDR4eExBMXYxeWNybjV5?=
 =?utf-8?B?YWVRUFNCeWozeTlWMWUzV1c3WmdDVlJETER5MFk4UnJ6VkhKWHFOUXRySDdT?=
 =?utf-8?B?aEVwQXN6VmErUU9TTnlEaHMzYk54SVBQWFlIS2xTMmFSeS9FVXpHVC9XcHZD?=
 =?utf-8?B?K2pFZEkrRWFhSUNPdERDckhYaUM2UVdLUDZnbThDNFVwVFFXazFBT0xndHRk?=
 =?utf-8?B?dlR3RjRpb1ZYV3lzL3NGY1k3cW1TTnQyM3FXSUxpYjhsNVBIRFZFeHUzQlRj?=
 =?utf-8?B?RDh2STUxNGk2THBKV3pZWWFya3FMY000Sm1qN08vNVV5MWFKenYrVDlzMzJq?=
 =?utf-8?B?VU5EQmFOaHBJa1NpZ0s3M29IN3hYbENUT2Z2cFVNVHoxNjdaU3NQZWIwdytu?=
 =?utf-8?B?ajg2ZkU2c1A2UVlKbERnYmgzZzhyaFVnTHlwWDNDeWQxbDNoMDhKL2sxa0ln?=
 =?utf-8?B?N1R1Z2tXbURrRnIwS2gxYys3RjRlbXFqeGd6RDR0M1AzbFJQZDY2L0lLRmNN?=
 =?utf-8?B?M0NObG0yWXZLcTdTUGdFQUQ1VU94ZExPN1dOaE8yeTJNTkM5UFhmcS96d2x6?=
 =?utf-8?B?RW5pMUJvRjdselNqcXVkYk9vODNLZURkRUVxdFhDWDdYYUIxTUVVNlVLZk1l?=
 =?utf-8?B?RTV6UmU4K2Z4VjFTdkY2UWx6VE1hZFBtOUNYbENDTkcwbHhVSkluNGxqaEE3?=
 =?utf-8?B?R2N2VW1XMEZ0UHNQbzlJTTlzUHBrVFVPd01mZmZsaE9zbm4xWGxrcHMwekw1?=
 =?utf-8?B?M2pPb1ArdG5qUnRhOUUxSlFOKzhqVERnNnhtSUx2OFcyR1VDcTlxc3VHcGVN?=
 =?utf-8?B?R1czbWR3NzFBMzdxRGdYQm1MZ0dLVFNST2dxbkZoZWhBQ2dSeEw4ZmtLN1R1?=
 =?utf-8?B?YjBNc2ZzRzhsRzgweVA3a21jT0xQN3lsU0tlUFJ2eDllMVFKN25nTndldmRt?=
 =?utf-8?B?V1doSXNjc2t0aWZLUGZid09EYUlWM3hvS2g0bjhaQWhaZ0dCT2JJbVdUdU44?=
 =?utf-8?B?S2xsUjNmNWMycG01ZGcrZklGM3Y3SVlDRTFzc1JQZTlEV0IrSnowTngvbXFw?=
 =?utf-8?B?L0JhUTFlWjcvS2E2R3hLN2hxQlFCOWt6MFZuMDRaSHVrdlZJbUdSNG80VWQr?=
 =?utf-8?B?YStndDlUczRPZi9WdGNUcHQ5UlVHSDJ3eWpUUHFhYXBzQzRBYUNwVzduSy95?=
 =?utf-8?B?bTZEZ0VRcSszeC9SUktOK3RNczl4VzB4UEhnTzM0dmlKZHhMeW5TM3lIRlJJ?=
 =?utf-8?B?SE1wYW1UaWdlVHRNTzFoUlBSdzlWMlFHUXNUOGUyeCtEVjFLU0lkTDZxNmQw?=
 =?utf-8?B?eTNiMTNpL2dMN1R5MnJjaWdhd3VTL2o5VE9CZzNEQmllcjdKTGZUKzYyNi9x?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a08807-99b2-40d0-7f1b-08dcaa7a7fc7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 18:17:09.1111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OGjto0nhiPLGm/sD3FMgf7vvmmvvsqA9LxjSUTRPq6PaY9jvsJkN/sBXXGDWo7ivMcLGk5EqF1lwF/f/UyKvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

On Fri, Jul 12, 2024 at 11:00:13AM +0200, Zbigniew Kempczyński wrote:
> On Thu, Jul 11, 2024 at 05:44:24PM -0400, Rodrigo Vivi wrote:
> > 
> > On Thu, Jul 11, 2024 at 11:09:24AM +0200, Zbigniew Kempczyński wrote:
> > 
> > Please use prefix 'drm/xe/uapi:' on the commit subject for anything
> > touching uapi.
> > 
> > And also documentation please.
> 
> Ok, I'm going to retag this to drm/xe/uapi.

Thanks. And sorry for taking so long to answer here.

> 
> Hmm, I've added this similar to MIN_ALIGNMENT (see on the bottom of the
> patch). Do you want to elaborate this more? I thought xe_drm.h is
> appropriate place to document this flag.

Yeap, I believe it would be good to elaborate it more. Specially because
the impact on the media side for instance.

> 
> > 
> > But more then that, we need to engage first with userspace and get
> > them to implement this.
> 
> I'm aware that BMG display complicated things a bit. As it supports
> 4K on vram I think switching vram_flags to XE_VRAM_FLAGS_NEED64K will
> work, but we loose 4K granularity on vram so imo there's a waste
> of memory for smaller allocations.
> 
> > 
> > > Scanout buffer on Battlemage requires allocation in 64K contigues
> > > pages to support Tile4 + compression what differs from normal bo
> > > requirements. Expose display alignment configuration to userspace
> > > to ensure it will properly align requested memory.
> > 
> > We should probably consider something that aligns better with
> > the default alignment that comes from the min_page_size
> > from struct drm_xe_mem_region.
> 
> At the moment I see following options:
> 
> 1. change xe_graphics_desc bmg to:
>    .vram_flags = XE_VRAM_FLAGS_NEED64K
>    at cost of loosing 4K granularity on vram

yeap, this is bad... basically expanding the media limitation to every umd :/

> 
> 2. add new flag as I proposed; we may burn out one reserved u64 (u32)
>    and expose min_display_page_size. But I'm not sure should we follow
>    this way as display is not taken from system memory but vram
>    (this field will be inappropriate set for system memory).
> 
> 3. add new flag as I proposed, and expose this in via config query
>    (current proposal).
> 
> 4. any other ideas?

no other idea to be honest. Let's ask UMD folks' opinions on this as well.

> 
> > 
> > BTW: This will be a big impact in Media because right now they are
> > having to use SCANOUT flag for every buffer since they have no
> > ways to know upfront what buffers they will send to display.
> 
> If media will use buffer which is Tile4 + compressed I think they
> will have no choice and they will need to allocate buffers in 64K contigues
> chunks somehow.

indeed. but let's get their ack here at least.

> 
> At the moment I've mitigated this issue seen in kms_ccs for bmg
> in series: https://patchwork.freedesktop.org/series/135994/
> but this is not temporary and not fully correct solution until kernel
> will switch to 64K physical alignment for scanout buffers.
> 
> --
> Zbigniew
> 
> > 
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 4 +++-
> > >  include/uapi/drm/xe_drm.h     | 3 +++
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 4e01df6b1b7a..c32894f3eea1 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
> > >  
> > >  static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > >  {
> > > -	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
> > > +	const u32 num_params = DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT + 1;
> > >  	size_t size =
> > >  		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
> > >  	struct drm_xe_query_config __user *query_ptr =
> > > @@ -342,6 +342,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > >  	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
> > >  		xe_exec_queue_device_get_max_priority(xe);
> > > +	config->info[DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT] =
> > > +		xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K ? SZ_64K : SZ_4K;
> > >  
> > >  	if (copy_to_user(query_ptr, config, size)) {
> > >  		kfree(config);
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 19619d4952a8..c7a930dbf58c 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -398,6 +398,8 @@ struct drm_xe_query_mem_regions {
> > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > >   *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
> > >   *    available exec queue priority
> > > + *  - %DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT - Alignment of contigous physical
> > > + *    memory allocation required by the display, typically SZ_4K or SZ_64K
> > >   */
> > >  struct drm_xe_query_config {
> > >  	/** @num_params: number of parameters returned in info */
> > > @@ -412,6 +414,7 @@ struct drm_xe_query_config {
> > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > +#define DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT		5
> > >  	/** @info: array of elements containing the config info */
> > >  	__u64 info[];
> > >  };
> > > -- 
> > > 2.34.1
> > > 
