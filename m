Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF30C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 22:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DBE10E311;
	Tue, 11 Feb 2025 22:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFRc8MJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEFE10E311
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739311367; x=1770847367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nKYU+rtQ2ZVFhh2JKFjJaN8nER5f3pO5fwIFtkW0k84=;
 b=YFRc8MJbi1CR+bHZUPNRczAo8pmUUeVkOfub22oh8dZcwW7Vj9X+ptyA
 ask0tvuhzhIQT1UaLVMPdJREA5pE0/F1Az9c3Mv9N42lhnQbMJQaopHcZ
 pi5ApIMiwHanFh6DbRQoIew+v+BHbxFwOK8puyyTqnKBv7zRsX63pg0Lx
 OaYbcE/RLZSqS9IMaZpoxJOc4pKYmI19BdxAqr+DXogintf0g5Os+IZ2e
 6p6MS3hrLxcWKLbwFFtC64/+5c1lZStx4Yrss5V5t5BDm0v+3WvsKLHnR
 DKfGhQleO+izg7JVy/sWZuT1pnUwnyuQ7RNR9D0lDJ47Y57uS4mZxU9iT Q==;
X-CSE-ConnectionGUID: /9zKC+SiQ7CeK4Nzp5JmuA==
X-CSE-MsgGUID: t+RTvxvjR9yZj2MvXbnB2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51344654"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="51344654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 14:02:47 -0800
X-CSE-ConnectionGUID: EmCJsT7AQlG9Zpd4krJfOA==
X-CSE-MsgGUID: 5W6/F5bWTg+aZ8cmp5cqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112494810"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 14:02:46 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 14:02:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 14:02:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 14:02:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg1z6C47elHhHDMs2zSPmn+foD2zZ+tFs6n+7AkcNbm6ItKe24eBLfem3hIg8oRKbPy5TwIHKsx+UQGqj8tH7tyvSSCnei7lEwvqt6t3bfuK/+trjE1skeDRDpjub2m49AmFjLMbNcCKXQVlxjr5EurDebArOhrQEoxjBim+Q5f3YoK3T89beYw0z3hKTjKj0oqy8pfIYgNEcpiXTLHO9szFfYkymxjoMexTe2yqtCPAtCFIHpMIDtS3MbUlOud9JxseLwm3ZGHH/vwdTwlgxOcN2akiB9Texg+vozieY38NX+FVtnP17XzRccq+dN0IAHSie1KONnejHzvPXVDXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfV7a7o2ZhTlTwMrr7cSlFlFKXpIy2CGHnr0uDKGSGw=;
 b=WgUOnpuQqCSqFQ8KGJV72u2k2qT/rmifDeYe90iM3B4A3rf5H94EgvD0UIRVAbTnCd+WXesy/6DmrvbCc6RPD0aHOErc/crLCCpaf7oWaVpyJd2WY2Swoi0MLQ5FvftL69NMp1ZMGeF1hxaVGrABJ1u/2qa5mQ9Cmh/SjixseiVGa4Zc9UCjH+JuxqMhZ/DSBEd10L3Ny2tfFEQgjLxEzMOAZGeeErcg++PP4AA4GdKbk/8GM1xE+S1QAnge4cUQA8xcf6WGmA8sND6ugj53wjZpzkoLiQtMjo/PbKUPFkRK/ntAuyZPfXGpezgmO0wYQU8rCHGDXOF75FU7ykDmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Tue, 11 Feb
 2025 22:02:42 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 22:02:42 +0000
Date: Tue, 11 Feb 2025 14:02:36 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 3/8] drm/xe/eustall: Add support to init, enable and
 disable EU stall sampling
Message-ID: <Z6vI_ErTmhzFYUdu@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <724540fe6e68526abc8a271d500f5a8a84acc0a9.1739193510.git.harish.chegondi@intel.com>
 <8534gk8jy4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8534gk8jy4.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CO1PR11MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 06daf508-6b9b-491b-f8e7-08dd4ae7ce5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWxmZDRtUi9uWUxDam9yY29iTzh0UThaL2JIeVlXYjlvNFlTNkhPMjEzWmhk?=
 =?utf-8?B?OWdNamU0T3Z1MUk1citSdWVLNkNOZVE2ZURJSm9mTGNieUtLSHZtNzZyc0t3?=
 =?utf-8?B?WjFIdFA5T0pUQjhJWWRRRUs0TUtqa3Bld216NlY2UHBQVmloTFF4cDgwdDdh?=
 =?utf-8?B?bk1VdEZxSVVXV0VHSFJMVmx1VzNMQU05NXdmcWd1MHFmNUxDTnUyZW96T1JF?=
 =?utf-8?B?TkFMbWcwU0FpeDhEN1NuQkladnpWUGpuY1lWaE5yeG11S3pRcHhQdmlCc1ZD?=
 =?utf-8?B?SzVMTkxERWd3T2ZGMHFncDdXM1J0R1VrVDZCY3B3VUZsRzZQNFZkWDltN1JR?=
 =?utf-8?B?QVNCNVNTZnpUbGRHM2dLTEN6eFZTMytZL2tnVlloZmJPMXVxTWRnalFCTWFD?=
 =?utf-8?B?R2dRZjFwWHhpYlE3cm1Jb3Z2RDE3UnAyYUR2VGU5dWx6NXRrcEt0b3JUeEw4?=
 =?utf-8?B?SFpuUTZ4NUFpeE5maTIrWUVIZ1A4UjBwOUgzTmlRNGRKVy9lSkhqcXoxZUNS?=
 =?utf-8?B?ZlorUkl6Y1NWd0pXS2QzQkFIcUQwRDBwdWIxN0FSMzc4RTJMVjdNeHU1aEJI?=
 =?utf-8?B?cWxrQlNtY3NrNG5mQ1o3Qk5sYndTakl3cFJQSkFNeENvckdXTVp5UmxBQnIw?=
 =?utf-8?B?eG9YN3pFNFJVTldBT1dlV0FjMituSVZqQmdyRmE0djdCMDhGOFpDQ2c2akhH?=
 =?utf-8?B?SVBXdFpHZi90SlV3WXJMNXJ5cEN5Zk8wZXRtWXpyRnMvL3pXWVZJZzRxak5h?=
 =?utf-8?B?QSt0dkxnSVg5ZFJYdGhMYlRoOFY2eHk4NmZkWUovVHhsTDlMMmZRT1BNZys3?=
 =?utf-8?B?ZlIwdi85cTZTaFhRbnk4QjM4ckkzS0FQTmp1eXZjZ29NSE1yNVpKOXVKMEVI?=
 =?utf-8?B?ZzkxRTFmT0E5aDIzd2Z1dWRNVkIyYm9oSVlEdWhHdmoyM0V2V3UvWWRSL1hT?=
 =?utf-8?B?ZHJnOTNvU05vdHVpdnU0RlJ6eEY1c3FWbU5FZ3NEemFTMTlMdXVzemhaRDRN?=
 =?utf-8?B?SjN6SmZ1NUxVODZzU0hvY21hMnhHUUJnSldQd2EvK1lkVGVDKzkrYWdFV0pj?=
 =?utf-8?B?d3B2M09raStQS2tFVng1OUwzYnRmTVc3VTFBZlRhVDlzMFlWeDRlRTQyb0c0?=
 =?utf-8?B?dUxmQk9lNVJzb1Vtemg5S1RTR0NGM2swa1VmeS9sSnNnZFd6WUpSVDFGZVgx?=
 =?utf-8?B?ZkpHTmMwT1VCMWlGalY5NnMrakRRaDA4NC93NTFrUkFXQjgrb3o4ZnlrNENQ?=
 =?utf-8?B?Q1pXUUN1MlFwVFFNYVByVlJuaXJWd05SUldmMG9ZZWIxOUlmc0dpM2pzRExm?=
 =?utf-8?B?enE5Mk9MS3l0VUZway9XMDNYSFBVM0w0V3BpSS95dklQUTAySmxuTmJtQ2wz?=
 =?utf-8?B?RkpkajhBOVJoYnlvd1EzK0hEWnZmQ3hoWEZOZy9RZHAzdWFERXlWeVp3N0JT?=
 =?utf-8?B?ZVNRRXB6ck8zckpzQUVQdmNRWFRwOUtWYTJmeTNDUnNIWks2Zlp4UEhGblNO?=
 =?utf-8?B?akVPcmRqNklBUlhEbGtuY2tKUHB4L3pPdlM0SG1MOVBwYkN1b3JmWnZJV2ht?=
 =?utf-8?B?T3R6bDluYmFFK0xaN1VlcEdDV0NBUlZlMjVUdEJRWmtOQzYwRXRhWWhLbFdZ?=
 =?utf-8?B?N1dPR1pFYU9uR0IwZjNIRHpBMUlqM0l1M3BGT1dpVm5TZTNhd3hJMmJaVGN1?=
 =?utf-8?B?WWFyZGkydWdzODNBT0ZRVCs4blozcnF4ZDNKSEFGVC9sT2psTkwrSnRzbi9K?=
 =?utf-8?B?bFRRWTZ4OEhnT0VDS2IvWjltK0FaZmVJenJBQXliYlJTU2F1T1MvYTlXVDE2?=
 =?utf-8?B?WExWL29TeUFpK0gxVXM0MzIyb2pRNll1ZnJBWVAxL3cxVGFmckZKbVZOWDVP?=
 =?utf-8?Q?zuBjf5I0L9myM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpUL3FhNThZYitpQUJaTjFzbWhoWkw2dzdlTHlmSVE5V3BKQ2dPUXFJSU1L?=
 =?utf-8?B?UU8rWDVGczVEaWM2WDJ4YU1FRzVyUUpCQytCcFNXMDJ6S2lmMXJva0dVeXNi?=
 =?utf-8?B?ZkFlaFRIemhJWUxnMHlmVTlncmRmVEpuY1B6WkwrQjlqdXNweXArek1KNlJJ?=
 =?utf-8?B?SXQvU1Z0ZFByZnJqTlpuMjJSUXhPOUpIWXVOVitLUGN6eDBNYWh1RTl0SDBH?=
 =?utf-8?B?eFgzc214eVlJV1RKSkxiM3ExSEJoRTZqeVRsV0NKam43SnJuNUNQcWRRbnZt?=
 =?utf-8?B?M1JIVjRKTlg0UVZ4TW1BcDlPUy9XY2ttRy9WMjZicTM4ci95c0FsUzhjZHNU?=
 =?utf-8?B?WkZsaVJKZjdIRlhDeGU1TWluVnFONlpHZ2JjRktXM0RNc3ZicXhJRW1mbDND?=
 =?utf-8?B?czBBOGRzeVZvTCtyZVRRc2FhcnUvQmJhNU14UEZJcTlXN3hhaFZLTUg5VnFO?=
 =?utf-8?B?a0xZR3VHTTdjaXk2UFpOb25zaDlpbVZ0THd4bFpkbzE4aHFWb3VMdzhIcUxq?=
 =?utf-8?B?VXlBcDllQWVXdjZlLy8vbG5RUCtmRUI1RXdJeVhtdHZuU1NuRHNnUmJLeHUx?=
 =?utf-8?B?TDdmMXdWdkZVSFd0OFB4TWwxV3h4cmJtTnZjN0swOWdGVlB2NjNCbFJsNk1a?=
 =?utf-8?B?ODQ1L0xDNk5EZnI4dHdicEVoM2xJbUVxa0NUUFJneGhISC9FcFdoQ2RTcWY4?=
 =?utf-8?B?SEFlRUJoYnZBcjQ2R2hGSTcvS0Fjb05KVDgyalpSaURTVXYyTnBQeGhhWGcr?=
 =?utf-8?B?ZmlVWFBQTVp6Zy9KWlB5bWZhVVhQL29oMkdydm9WZi9WaHRvNUs0cGV5QTNR?=
 =?utf-8?B?Z0Y5Y0lrUUdycFZhMXQwWXVCa05WcWozck5QNll0Rk1nYTM1OFVNeWo4RnVR?=
 =?utf-8?B?dUhEc3U2QVNSeEgvV2lORUg4cFpCK2pSZ1hVbHFNYUFPb2pTaElpMXNib0RF?=
 =?utf-8?B?M0YyL3VjSnVqWU9tdnVVR2xaTytIeTVOTERBWldZYmI2TXpqQ2hYYXBTL3VJ?=
 =?utf-8?B?alA1VnM4NzBWZ2RxKzl2clZwSUs3YnpDazRjWldRMlNtZ2hLVngwaEJqZ0V4?=
 =?utf-8?B?QVVYL2x5Qk1TMVRqNnB0UEErQ2hpMFNrbVdBOTQzbXA2SnA4OGJqaWhNZDUr?=
 =?utf-8?B?ajdSb3dGL2NTWEJLcXJuQ2J3S1BYa0cyWTZoSlRYa3B6bUU2VUlpZHFEL3Bz?=
 =?utf-8?B?QWJ3UUVXUmFGeEtrMnBVNUJJWk1ieFI4amljK3lQUzFrbTlGcjZ0RUNFMTFW?=
 =?utf-8?B?V1B5WmxDVkF0M0w1THhxb1dyaDFCWmZKaGcwYko3OXBBQ0trWXY0QjdYNWp3?=
 =?utf-8?B?dW5ISzZ0UnQ0RkhWNDkrb09YRGhUN0I5N0ZWMmhnMEp1R29aYXdrbUNRaW5a?=
 =?utf-8?B?QUtUVVlLNHhuMGUzSjVoV3ZMbGg3Rk5oTWo5cFBiaTI1OGp6dXpqMlNXa0lq?=
 =?utf-8?B?c01WMzFTU0xxNi96K2J4cjBNRGRZNGRIbXlLMWNVVmFUQm5KeG0xOGI1aFhR?=
 =?utf-8?B?azN3WUJLR1o2N3JteDlKQ3Y2TkQ0a3Z2OFhGZTR1dU1iaW44eGQvWWxMS2Jh?=
 =?utf-8?B?QklLMjNNR201ZVpxVllUUUova29qQ1hJNisxTVVGanFteU5LUHE4aS9iaDA0?=
 =?utf-8?B?dUFxbXlUaFg3Y3F4ZHdqdnV2NW1jcU54K1lKRTRlMENTNGlzN1Y5bEE0M3Zz?=
 =?utf-8?B?aVFCYS9qU0daV3B6YWMzMmU5YmZOU0tDdXNmQ2xDUm9zdG1oUHkxcGhvSTVz?=
 =?utf-8?B?ZHJxSlRUQVh3c1MvcnNYT3g0aFpOUHpDcUdsZG9oVk9xcG5WOXZGb1VqdXpz?=
 =?utf-8?B?emFNUWttNUM5WHVNNXUzMDFGd0l4c3lrc0RtS2J0UEN1YkRWSDlVbWE0MGtP?=
 =?utf-8?B?ald1U09kd0xUQkFFMWNVay8vK3VkMG80OUc2VGdzUDdvMFJxZHdTdEw1eFpx?=
 =?utf-8?B?UTR6bWhlVjVQUDRhaWw0NThrc2N6QUViSDRSYjBzS3hHdHYzNVE1QUx1YVd3?=
 =?utf-8?B?WVphajY3K1RYdFFRa1RURHRreVd3a242K2trdTA1c1NORk9GSzNXdURTL2to?=
 =?utf-8?B?NFNBcCtLTWpjQ1pKcHcwcEJyQzdXVUU2WExsSDBRREt0MTMzcE5HRjVTMTRi?=
 =?utf-8?B?bnVqaXR6SytIM1UzaC8rdVBWOUpMeERmVTlIMnFFS1cwN2pnc3NNMlJrc0to?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06daf508-6b9b-491b-f8e7-08dd4ae7ce5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 22:02:41.9208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8CHSOoFMyN1gIcD99Q391b4SfOOxVE1dUdanOkfLNz2fU+Ln7cEO1+haXwrMk5zTkJ20tFKA2oLO09mtlCLRC1HUwkbzBLEGXM/erhFe2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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

On Tue, Feb 11, 2025 at 09:33:55AM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2025 05:46:44 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 0ceb3091f81e..12afa9720971 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -8,17 +8,57 @@
> >  #include <linux/poll.h>
> >  #include <linux/types.h>
> >
> > +#include <drm/drm_drv.h>
> >  #include <uapi/drm/xe_drm.h>
> >
> > +#include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_eu_stall.h"
> > +#include "xe_force_wake.h"
> > +#include "xe_gt_mcr.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_macros.h"
> >  #include "xe_observation.h"
> > +#include "xe_pm.h"
> > +
> > +#include "regs/xe_eu_stall_regs.h"
> > +#include "regs/xe_gt_regs.h"
> > +
> > +#define POLL_PERIOD_MS	10
> >
> >  static size_t per_xecore_buf_size = SZ_512K;
> >
> > +struct per_xecore_buf {
> > +	/* Buffer vaddr */
> > +	u8 *vaddr;
> > +	/* Write pointer */
> > +	u32 write;
> > +	/* Read pointer */
> > +	u32 read;
> > +	/* lock to protect read and write pointers */
> > +	struct mutex ptr_lock;
> > +};
> > +
> > +struct xe_eu_stall_data_stream {
> > +	bool enabled;
> > +	size_t data_record_size;
> > +	size_t per_xecore_buf_size;
> > +	unsigned int wait_num_reports;
> > +	unsigned int sampling_rate_mult;
> > +
> > +	struct xe_gt *gt;
> > +	struct xe_bo *bo;
> > +	struct per_xecore_buf *xecore_buf;
> > +};
> > +
> > +struct xe_eu_stall_gt {
> > +	/* Lock to protect stream */
> > +	struct mutex stream_lock;
> > +	/* EU stall data stream */
> > +	struct xe_eu_stall_data_stream *stream;
> > +};
> > +
> >  /**
> >   * struct eu_stall_open_properties - EU stall sampling properties received
> >   *				     from user space at open.
> > @@ -33,6 +73,47 @@ struct eu_stall_open_properties {
> >	struct xe_gt *gt;
> >  };
> >
> > +/**
> > + * struct xe_eu_stall_data_pvc - EU stall data format for PVC
> > + *			Bits		Field
> > + * @ip_addr:		0  to 28	IP (addr)
> > + * @active_count:	29 to 36	active count
> > + * @other_count:	37 to 44	other count
> > + * @control_count:	45 to 52	control count
> > + * @pipestall_count:	53 to 60	pipestall count
> > + * @send_count:		61 to 68	send count
> > + * @dist_acc_count:	69 to 76	dist_acc count
> > + * @sbid_count:		77 to 84	sbid count
> > + * @sync_count:		85 to 92	sync count
> > + * @inst_fetch_count:	93 to 100	inst_fetch count
> > + * @unused_bits:	101 to 127	unused bits
> > + * @unused:		remaining	unused bytes
> > + */
> 
> I'd say delete this comment, it seems to be no zero extra information above
> what is already included in the struct below.
> 
> If you want to document the bit positions, add them on the same line as the
> struct field, e.g.:
> 
> 	__u64 active_count:8; /* bits 36:29 */

hooks scripts complain if I don't describe individual fields. I either
have to move the descriptions above each field or remove the description
of the structure above - "struct xe_eu_stall_data_pvc - EU stall data
format for PVC". Let me check if the hooks scripts complain if I
document the bit positions like you suggested.

> 
> > +struct xe_eu_stall_data_pvc {
> > +	__u64 ip_addr:29;
> > +	__u64 active_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 unused_bits:27;
> > +	__u64 unused[6];
> > +} __packed;
> > +
> > +static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
> > +{
> > +	unsigned long record_size = 0;
> > +
> > +	if (xe->info.platform == XE_PVC)
> > +		record_size = sizeof(struct xe_eu_stall_data_pvc);
> > +
> > +	return record_size;
> > +}
> > +
> >  /**
> >   * num_data_rows - Return the number of EU stall data rows of 64B each
> >   *		   for a given data size.
> > @@ -44,6 +125,36 @@ static u32 num_data_rows(u32 data_size)
> >	return (data_size >> 6);
> >  }
> >
> > +/**
> > + * xe_eu_stall_init() - Allocate and initialize GT level EU stall data
> > + *			structure xe_eu_stall_gt within struct xe_gt.
> > + *
> > + * @gt: GT being initialized.
> > + *
> > + * Returns: zero on success or a negative error code.
> > + */
> > +int xe_eu_stall_init(struct xe_gt *gt)
> > +{
> > +	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> > +	if (!gt->eu_stall)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&gt->eu_stall->stream_lock);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_fini() - Clean up the GT level EU stall data
> > + *			structure xe_eu_stall_gt within struct xe_gt.
> > + *
> > + * @gt: GT being cleaned up.
> > + */
> > +void xe_eu_stall_fini(struct xe_gt *gt)
> > +{
> > +	mutex_destroy(&gt->eu_stall->stream_lock);
> > +	kfree(gt->eu_stall);
> > +}
> > +
> >  static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> >					   struct eu_stall_open_properties *props)
> >  {
> > @@ -166,6 +277,120 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >	return ret;
> >  }
> >
> > +static void free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	if (stream->bo)
> > +		xe_bo_unpin_map_no_vm(stream->bo);
> > +}
> > +
> > +static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
> > +				   u16 num_xecore)
> > +{
> > +	struct xe_tile *tile = stream->gt->tile;
> > +	struct xe_bo *bo;
> > +	u32 size;
> > +
> > +	size = stream->per_xecore_buf_size * num_xecore;
> > +
> > +	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> > +					     size, ~0ull, ttm_bo_type_kernel,
> > +					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	XE_WARN_ON(!IS_ALIGNED(xe_bo_ggtt_addr(bo), SZ_64));
> > +	stream->bo = bo;
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	u32 write_ptr_reg, write_ptr, read_ptr_reg, reg_value;
> > +	struct per_xecore_buf *xecore_buf;
> > +	struct xe_gt *gt = stream->gt;
> > +	u16 group, instance;
> > +	unsigned int fw_ref;
> > +	int xecore;
> > +
> > +	/* Take runtime pm ref and forcewake to disable RC6 */
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
> > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
> > +		xe_gt_err(gt, "Failed to get RENDER forcewake\n");
> > +		xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> 
> The above line should not be there.
I think you are correct. Not sure why there are several places in the xe
driver where xe_force_wake_put() is called if a forcewake ref doesn't
have a domain. It makes sense for XE_FORCEWAKE_ALL, as getting a
reference on XE_FORCEWAKE_ALL will only get reference on applicable
domains. Also I didn't use XE_FORCEWAKE_ALL as the all the EU stall
hardware is in the XE_FW_RENDER domain so don't need XE_FORCEWAKE_ALL.
> 
> > +		xe_pm_runtime_put(gt_to_xe(gt));
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
> > +		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> 
> My previous question regarding this is still unanswered: "Why do we need to
> do all this, read the write ptr reg and write to read ptr register? Can't
> we just set both read and write ptr to the start of the per xecore buf
> address (likely stream->bo ggtt_addr).

Hardware doesn't allow writes to the write pointer. I believe it may be
a security risk and therefore doesn't allow it. That's the reason I read
the write pointer and set the value to the read pointer.

> 
> > +		/* Initialize the read pointer to the write pointer */
> > +		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +		write_ptr <<= 6;
> > +		write_ptr &= (stream->per_xecore_buf_size << 1) - 1;
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		xecore_buf->write = write_ptr;
> > +		xecore_buf->read = write_ptr;
> > +	}
> > +	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> > +				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> 
> Please explain this mocs.uc_index business, as I mentioned in the prev version.
MOCS stands for Memory Object Control State is used to specify memory
attributes. MOCS is a set of registers with each register specifying a
certain combination of memory attributes. MOCS index is used to look up the set of
MOCS registers where the corresponding control parameters are specified.

Bits[3:9] in the control register indicate the MOCS programming that
should be applied to stall data eviction. As per the format, bit-0 is
reserved and bits 1 to 6 are for MOCS table index. Therefore the index
is shifted left by 1.

> 
> > +				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> > +						 stream->sampling_rate_mult));
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, reg_value);
> > +	/* GGTT addresses can never be > 32 bits */
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
> > +	reg_value = xe_bo_ggtt_addr(stream->bo);
> > +	reg_value |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_XECORE_BUF_SZ, 2);
> 
> This "2" should be derived from per_xecore_buf_size or
> stream->per_xecore_buf_size by dividing by 256, as I previously indicated.

Even though the hardware allows the user to configure the buffer size to
128K/256K/512K, for simplicity we decided to use the highest buffer size
512K for which the register setting is 2. If the future I plan to send
out a patch that allows the user to change the buffer size via debugfs
as the user may choose to use a smaller buffer size for debug purpose.
In that patch I will add as you suggested. But for now, I think it
is not required to divide by 256.

> 
> > +	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	struct per_xecore_buf *xecore_buf;
> > +	u16 num_xecore, group, instance;
> > +	struct xe_gt *gt = stream->gt;
> > +	xe_dss_mask_t all_xecore;
> > +	u32 vaddr_offset;
> 
> Should probably be size_t
> 
> > +	int ret, xecore;
> > +
> > +	stream->sampling_rate_mult = props->sampling_rate_mult;
> > +	stream->wait_num_reports = props->wait_num_reports;
> > +	stream->per_xecore_buf_size = per_xecore_buf_size;
> > +	stream->data_record_size = xe_eu_stall_data_record_size(gt_to_xe(gt));
> > +
> > +	bitmap_or(all_xecore, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> > +		  XE_MAX_DSS_FUSE_BITS);
> > +	/*
> > +	 * Enabled subslices can be discontiguous. Find the maximum number of subslices
> > +	 * that are enabled.
> > +	 */
> > +	num_xecore = xe_gt_topology_mask_last_dss(all_xecore) + 1;
> > +
> > +	ret = alloc_eu_stall_data_buf(stream, num_xecore);
> > +	if (ret)
> > +		return ret;
> > +
> > +	stream->xecore_buf = kcalloc(num_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
> > +	if (!stream->xecore_buf)
> > +		return -ENOMEM;
> 
> What about free_eu_stall_data_buf here?
> 
> The way to do this is: either the function succeeds, or if it fails, it
> frees all resources it allocates before returning.
Will fix it.
> 
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		vaddr_offset = xecore * stream->per_xecore_buf_size;
> > +		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
> > +		mutex_init(&xecore_buf->ptr_lock);
> > +	}
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> >   *
> > @@ -181,6 +406,49 @@ static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> >	return ret;
> >  }
> >
> > +static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	int ret = 0;
> > +
> > +	if (stream->enabled)
> > +		return ret;
> > +
> > +	stream->enabled = true;
> > +
> > +	ret = xe_eu_stall_stream_enable(stream);
> > +	return ret;
> > +}
> > +
> > +static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +
> > +	if (!stream->enabled)
> > +		return 0;
> > +
> > +	stream->enabled = false;
> > +
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	return 0;
> > +}
> > +
> > +static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> > +					    unsigned int cmd, unsigned long arg)
> > +{
> > +	switch (cmd) {
> > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > +		return xe_eu_stall_enable_locked(stream);
> > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > +		return xe_eu_stall_disable_locked(stream);
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
> >   *
> > @@ -195,14 +463,22 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
> >				     unsigned int cmd,
> >				     unsigned long arg)
> >  {
> > -	switch (cmd) {
> > -	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > -		return 0;
> > -	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > -		return 0;
> > -	}
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	long ret;
> >
> > -	return -EINVAL;
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> > +	ret = xe_eu_stall_stream_ioctl_locked(stream, cmd, arg);
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_close_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	xe_eu_stall_disable_locked(stream);
> > +	free_eu_stall_data_buf(stream);
> >  }
> 
> I don't see the point of this function since it is just called from one
> place xe_eu_stall_stream_close. You might as well put these 2 lines of code
> there.
Will remove this.
> 
> As suggested below we can have a xe_eu_stall_stream_destroy() which can be
> called from xe_eu_stall_stream_open_locked() and from
> xe_eu_stall_stream_close(). But optional.
> 
> >
> >  /**
> > @@ -215,6 +491,19 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
> >   */
> >  static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> >  {
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> > +	xe_eu_stall_stream_close_locked(stream);
> > +	kfree(stream->xecore_buf);
> > +	kfree(stream);
> > +	gt->eu_stall->stream = NULL;
> 
> This sequence should generally be identical to the error unwind sequence in
> xe_eu_stall_stream_open_locked.
> 
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> > +
> > +	/* Release the reference the EU stall stream kept on the driver */
> > +	drm_dev_put(&gt->tile->xe->drm);
> > +
> >	return 0;
> >  }
> >
> > @@ -230,7 +519,67 @@ static const struct file_operations fops_eu_stall = {
> >
> >  static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> >  {
> > -	return false;
> > +	return ((xe->info.platform == XE_PVC) ? true : false);
> 
> return xe->info.platform == XE_PVC;
A subsequent patch adds another check for xe2. So, I used the
conditional operator.
> 
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_open_locked - Open a EU stall data stream FD.
> > + * @dev: drm device instance
> > + * @props: individually validated u64 property value pairs
> > + * @file: drm file
> > + *
> > + * Returns: zero on success or a negative error code.
> > + */
> > +static int
> > +xe_eu_stall_stream_open_locked(struct drm_device *dev,
> > +			       struct eu_stall_open_properties *props,
> > +			       struct drm_file *file)
> > +{
> > +	struct xe_eu_stall_data_stream *stream;
> > +	struct xe_gt *gt = props->gt;
> > +	unsigned long f_flags = 0;
> > +	int ret, stream_fd;
> > +
> > +	/* Only one session can be active at any time */
> > +	if (gt->eu_stall->stream) {
> > +		xe_gt_dbg(gt, "EU stall sampling session already active\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > +	if (!stream)
> > +		return -ENOMEM;
> > +
> > +	gt->eu_stall->stream = stream;
> > +	stream->gt = gt;
> > +
> > +	ret = xe_eu_stall_stream_init(stream, props);
> > +	if (ret) {
> > +		xe_gt_dbg(gt, "EU stall stream init failed : %d\n", ret);
> > +		goto err_alloc;
> 
> This is wrong as pointed below. If this fails we jump to 'kfree(stream)'.
When I wrote this code initially, I may have tried to reduce the goto
labels considering the fact that kfree() checks if the input ptr is NULL
and returns if so.
> 
> Also don't invent random label names. See
> xe_oa_stream_open_ioctl_locked(): err_destroy is for destroy, err_free for
> free etc.
> 
> So this should be goto err_free.
Will change it. I have seen code where the label is named err_alloc to
undo an alloc. I think each developer names the labels differently.
> 
> > +	}
> > +
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, stream, f_flags);
> > +	if (stream_fd < 0) {
> > +		ret = stream_fd;
> > +		xe_gt_dbg(gt, "EU stall inode get fd failed : %d\n", ret);
> > +		goto err_open;
> 
> goto err_destroy. see below.
> 
> > +	}
> > +
> > +	/* Take a reference on the driver that will be kept with stream_fd
> > +	 * until its release.
> > +	 */
> > +	drm_dev_get(&gt->tile->xe->drm);
> > +
> > +	return stream_fd;
> > +
> > +err_open:
> > +	free_eu_stall_data_buf(stream);
> > +err_alloc:
> > +	gt->eu_stall->stream = NULL;
> > +	kfree(stream->xecore_buf);
> 
> This is wrong, stream->xecore_buf is allocated in xe_eu_stall_stream_init
> and we are jumping here if xe_eu_stall_stream_init fails.
I will change it. But considering the fact that kfree() has a NULL
check, this is not a bug.
> 
> See xe_oa_stream_open_ioctl_locked() as an example for doing this unwinding
> correctly. We need a 'destroy' function which will free stuff allocated in
> xe_eu_stall_stream_init. And that function should be called from
> close/release too.
> 
> Ideally, we should not have to peek inside these functions to see what is
> being allocated there and then free them. The destroy function is the
> wrapper which should do all the free's.
> 
> Or maybe if you want to skip destroy() we can do that too, but at least the
> code here needs to be fixed.
> 
> > +	kfree(stream);
> 
> err_free label before this line. Should do kfree(stream) and
> 'gt->eu_stall->stream = NULL'.
> 
> > +	return ret;
> 
> So basically, without destroy(), this is something like:
> 
> 	err_destroy:
> 		kfree(stream->xecore_buf);
> 		free_eu_stall_data_buf(stream);
> 	err_free:
> 		kfree(stream);
> 		gt->eu_stall->stream = NULL;
> 		return ret;
> 
> Not what you have above. And the code under err_destroy can go into a
> destroy() function, but if you want we can skip that for now.
> 
> 
> >  }
> >
> >  /**
> > @@ -252,7 +601,7 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >  {
> >	struct xe_device *xe = to_xe_device(dev);
> >	struct eu_stall_open_properties props = {};
> > -	int ret, stream_fd;
> > +	int ret;
> >
> >	if (xe_observation_paranoid && !perfmon_capable()) {
> >		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> > @@ -263,6 +612,10 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >		return -EPERM;
> >	}
> >
> > +	/* Initialize and set default values */
> > +	props.wait_num_reports = 1;
> > +	props.sampling_rate_mult = 4;
> 
> What about props.gt? Can it also be initialized to gt[0], corresponding to
> default gt_id 0, basically default gt if not specified in uapi is gt0?

I had that initially, but there was a review comment in the first few
versions of this patch review, I think from Matt Roper that GT ID
should be mandatory from the user space.

> 
> > +
> >	ret = xe_eu_stall_user_extensions(xe, data, &props);
> >	if (ret)
> >		return ret;
> > @@ -272,9 +625,9 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >		return -EINVAL;
> >	}
> >
> > -	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, NULL, 0);
> > -	if (stream_fd < 0)
> > -		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > +	mutex_lock(&props.gt->eu_stall->stream_lock);
> > +	ret = xe_eu_stall_stream_open_locked(dev, &props, file);
> > +	mutex_unlock(&props.gt->eu_stall->stream_lock);
> >
> > -	return stream_fd;
> > +	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > index d514e78341d5..e42250c1d294 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -6,9 +6,10 @@
> >  #ifndef __XE_EU_STALL_H__
> >  #define __XE_EU_STALL_H__
> >
> > -#include <drm/drm_device.h>
> > -#include <drm/drm_file.h>
> > -#include <linux/types.h>
> > +#include "xe_gt_types.h"
> > +
> > +int xe_eu_stall_init(struct xe_gt *gt);
> > +void xe_eu_stall_fini(struct xe_gt *gt);
> >
> >  int xe_eu_stall_stream_open(struct drm_device *dev,
> >			    u64 data,
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 9fb8f1e678dc..ee5a16727300 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -60,6 +60,7 @@
> >  #include "xe_vm.h"
> >  #include "xe_wa.h"
> >  #include "xe_wopcm.h"
> > +#include "xe_eu_stall.h"
> >
> >  static void gt_fini(struct drm_device *drm, void *arg)
> >  {
> > @@ -159,6 +160,7 @@ void xe_gt_remove(struct xe_gt *gt)
> >		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> >
> >	xe_gt_disable_host_l2_vram(gt);
> > +	xe_eu_stall_fini(gt);
> 
> Maybe move to the top of the function, so that fini happens in reverse
> order to init?
Okay.
> 
> >  }
> >
> >  static void gt_reset_worker(struct work_struct *w);
> > @@ -625,6 +627,10 @@ int xe_gt_init(struct xe_gt *gt)
> >
> >	xe_gt_record_user_engines(gt);
> >
> > +	err = xe_eu_stall_init(gt);
> > +	if (err)
> > +		return err;
> > +
> >	return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 6e66bf0e8b3f..833a1a67e9ae 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -430,6 +430,9 @@ struct xe_gt {
> >
> >	/** @oa: oa observation subsystem per gt info */
> >	struct xe_oa_gt oa;
> > +
> > +	/** @eu_stall: EU stall counters subsystem per gt info */
> > +	struct xe_eu_stall_gt *eu_stall;
> 
> This needs a forward declaration for 'struct xe_eu_stall_gt'.

I thought so initially, but the compiler didn't complain. I guess because
eu_stall is a pointer and not an instance of struct xe_eu_stall_gt ?
> 
> >  };
> >
> >  #endif
> > --
> > 2.48.1
> >

Thank You
Harish.
