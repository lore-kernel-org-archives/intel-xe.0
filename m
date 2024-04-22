Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06520C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 09:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FC6112925;
	Mon, 22 Apr 2024 09:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iA53EWrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26497112925
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713777945; x=1745313945;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PpUiuzdiD6W7MY+CCxNZiRqRi0N5xOqQiZAq2GrfyaE=;
 b=iA53EWrLHPAmV0sBZCsjZr6CQkcY2Au5xcOYo3kkHvM44P4b7fCG41xX
 ZbLtHyV7UCev7q2gAXYzhIaV7Z84seghDoYoCAzqiu4eLfqhfs82zyNOp
 ZUxzvcchBTenbdLEMPc58xyN7bM+NvwFX+oRR7cGwb6Rqe3jIxRTXKTn1
 V6LOniFpXVWQfzyb9uYvFibannRFLUDF430Zp71amRV1rcUna0o3vLlgj
 1MrM53s7LJL1ukz+4Tl4y5/jFcmU29HR+eqaGiBZWX5GYmKMh1YceklCX
 /UiJZnvIMKqmDfGzNTK1uhrZwlJTurOVt1uvXN/4T2dAygfIkSR1+WHwu g==;
X-CSE-ConnectionGUID: eevRefTaQkK4yH5DUQvRUQ==
X-CSE-MsgGUID: LlSr+/YmRyeZaPBn9zAB6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20729801"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20729801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 02:25:44 -0700
X-CSE-ConnectionGUID: 5thMx5xCTKuyl94wUVvemA==
X-CSE-MsgGUID: 5oG2l4eZTASjUIRkxRhCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24409630"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 02:25:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 02:25:43 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 02:25:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 02:25:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 02:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXgE8pCnqX/lVAL+pTo7jKef1zKQEfs9B2peXQ/fKea3PshH+pe6gn66zlo2g4zwU+ghDURG+oecGYnu1AT2OOmg5VJ+Vau9759fKAKs2Y4Y8VAAKgIc4AMiTX+jMSAhc5j/ivqxIC3X5x1Af69Li3x2Aj5Sl78O69mgtEyKoo1j0zOEJRMwblSVNVihOVsAVmcKcPgWTqSAuPyxUMYq5ZYFs0KExfXE97idkwsks9wckCb8/SZS4ySQVxgYY4lkN/ktNX17/rD2jXcBY8rX+y7OlxoaqqHEfmiIakR+PRYdZ7bT2mVsyOxVCvdxR0vv7uW3/w90DMChnsfNQEya9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTfbavbV78kOPa7NvfO/pScIf+LPVJACgBf2HV8Xca0=;
 b=FdtWv7UQn35UNzPZu5yrbovqkgM8lf5biCcgUtJgtkxeSdGQJifppW69oYEACCf3NSiE2oBaWHQTRFT5fmtE+kUc6vdkEeCnefFkznRdE4/MbuvE1RyNh+17eDX4e6tn57ua+pVHP1VZqFU7nS3blnW0/eAi9bblrxuLCmfU4GZVvmivhf7B9OGBM0cqxEZQq/3lF0WWydAoKb+Y79w/45wqCBDh3KwhftlRoNYUK1HUlBS26CnJO52XE1pZNoyc2/6d+VfNcGdhsxX5ZxTBBElDhXCRY21ymaRVbPwiOrE6Tc1ATOzXdaCnxoatpKSAabcAbKM6AaqzjlN9xl2qRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 09:25:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 09:25:39 +0000
Date: Mon, 22 Apr 2024 11:25:37 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
Message-ID: <20240422092537.lbe5asu3gofps2ib@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418152802.182-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd3ec96-d7cb-4263-5d9d-08dc62ae2cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDdqeGViK2FnSmU1akgybzFwZGw4S0VBZy81Tm1GdUFndHlMb2hnL1duNE1S?=
 =?utf-8?B?OWE3ellRU080TkdRNHg5N2NFalFJUG9Eb3FSam1kby9PbXpjdkZha3F6cktI?=
 =?utf-8?B?K1NKR0JJb3g0eUJkeUNrMy9oL1VybnZORE9oTzBrY2tjdHZNNjI0SzQreUdn?=
 =?utf-8?B?Y09waGJmQXZlTnVGMEt1dktPVjc4dExSTjNNWUJ3OU9nOTNUSjNJd2ZpSWJ4?=
 =?utf-8?B?Qk5pdStyZVpxVFNRcDV0by84UVo1dFNLMFdkaENuSFVGTjE3Ky9LdnMwdmVW?=
 =?utf-8?B?WUxWbzhuTGJBQVZRVzVFcDZPNm96WmhEU3JnWFFrZ0x3OC8rZVJWWG5wUzhy?=
 =?utf-8?B?UzI1SnN2SjFYaFdmeFJ5YklzVXkzVVluelVjQWVDY2o4WmdDZkFYaUF2UENE?=
 =?utf-8?B?RDlmVXI4SEdUdEx1MWtXaXRIL3ZJNkFsSHFoeThseWU1OVJCbVhRM3NkcnpD?=
 =?utf-8?B?Q1MrdGMwMkE0LzJWUlRXYWxiZTZSZUNnUlRxR292bndRdlBDUkZmTHJCUmRO?=
 =?utf-8?B?eEpwQ3RWdXpCc1VDVkw0WHpNdjFibnR0YmFISHNtTExXcVlaMDJQbEZzMW1u?=
 =?utf-8?B?Sm90UThxalpmSWlPbStlTy93NVdWZHdoVlRpNVlRQnFwYlNtd1AyOFlydklp?=
 =?utf-8?B?THBzcHMweFI2KzVuMWlwbTRwU0c3WUMwc00zN1E5UE8yUVBHR3lJTUxYeXlW?=
 =?utf-8?B?cW1HZUJyOTdLa1Y4SWNyWXRGeXFSMkY4TDZ4OEtEamRkR2Vac3RGMjNZOXpj?=
 =?utf-8?B?dmZGWmJSdENwTzJOZzA4UTl5UDl5dWd6eVdKMS9acVVlRDB5eis3eFdSMW5o?=
 =?utf-8?B?Y2xXTFBNNWFrSGZUU1hsRHdvd1NvaURuRWpkMXhwZkFGenZXS2xhVFMzWHRI?=
 =?utf-8?B?c0pYaXdzYjliUkFHUGxjTTlkblExVFdKQkE5RlhOTXBNMEtyT0p5U2NleGpo?=
 =?utf-8?B?N2JLaU9kYWtBOU1nanBTVlBZdUxmUTlGM3Naby9Pd00xdTU1UkhYb1ByVGNq?=
 =?utf-8?B?UXdBL1Bzd3FveHpJQWdVeU81WWVOeDFLUXdBVlpCd1YvS2pON283SEtzcGFG?=
 =?utf-8?B?bm1PY2pySGU5cGgvNWtiMDBVUnJlbDlCV3ZidXJuWTVMS1JaTklvTWloS2JX?=
 =?utf-8?B?cm1tZmFEL2tvcFhpdlBveE5kMXlCb3hpUndld0QvZmZiQjFKdjRlbVh4cnhk?=
 =?utf-8?B?eDR5Vk5ackpWbHFCQWFhVStNK29VcUd2TXI1UjI2VFlicTZvc2RuSWJFdWFi?=
 =?utf-8?B?WFRzQ3hmRXNDeUNJNjI1TDI2K1VhaHZVR0g4L3g5UzF4OFJxUXRhYmJLRE9B?=
 =?utf-8?B?S04xZUhZL2FBMkRadlY4SHZzY2NyUE5Za1QxL2JsWWdlbGRqYTcwNStUdW9x?=
 =?utf-8?B?dGgxT3RtNXhJaG5NN0kvTzFFM2RxcGxKZnZVaStlK0prakF2aGVUNXdUdElL?=
 =?utf-8?B?VzlGZ1NveXYwdVlmZFh2RHpXN1RwVFEvRFNKVDBPTmIxYVJCUDBYYkdIODhZ?=
 =?utf-8?B?ait4aGFiTGRKR1BKaUJGbHRMaVR4SWg3Tlc2Rk91MFc1dFhVU2pXZFg1UUFx?=
 =?utf-8?B?T3RxT3hrcHFuc0JLR3lpdjdyS0diZk1iZEtZVnphVUxTeEZVRDZnUWtLdUlK?=
 =?utf-8?B?ZGxxNkVHY3hDVDdoYUxKanZxdFhHQjNnNDh1Z1dFVDdlblZwaGhVQnFVOEtQ?=
 =?utf-8?B?SFJXMmJRQkw0TXV5bkZ4ek9hd1Z2c2V0bkRXeVZMMjc1RG40LzAzb2V3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUlyS0gzL1oyZ1l4OFZackMvbER4a0RySHhrNThIaG1oLzJoKytTd1JLRVpD?=
 =?utf-8?B?bklnaSsyQ1VPMXgzRm93Zll4R2htVU1DTi9aQ080cFE2VkdIZ0FmaHlUQ290?=
 =?utf-8?B?UE1nQzBDcVpka1dzZk5XOFRseGIvWjRuWDBKZFI0VTdudkpseVkvOUE1a05p?=
 =?utf-8?B?aDRJK21nL3JDT3QvZWlCeW0vZ2dtZVBWNmlzL0lxNjV4ckxuZ2lPOWNuYWNU?=
 =?utf-8?B?Zk5Hd21qZTUxNVVDbm5ySEExbHhaaDd1bXV6Unp1dzB6dFdNK012QUUwQWhH?=
 =?utf-8?B?VGxRTXlkcmZOWkpIUnBBNVVRUVlFa2Z6Wk9RRGRzTDBscWdIQ3owejJhZmZG?=
 =?utf-8?B?ZFk2VE5aTEZ3M25JaXFNeFVlZ1ZrQjhCUWJmcnhTVkh1M0dIYlFNTHplaEhn?=
 =?utf-8?B?NjJlSlZsaTA3VmZqZzdGZFBWN1RURmt1M3o1eG1jMCtLOEwxUktvZjB2ZStS?=
 =?utf-8?B?cVFrR1dVZXNVYlVxdWw0WG90MkVPeWVROG90MWtRWkxwM1ZaV2RNeWorRGZx?=
 =?utf-8?B?bDY5bUE5cE0zMTZXTGN4V1VwVi9jMVpEaHo3c2ZGUkNKQUZwV3pSVUd6TStK?=
 =?utf-8?B?QlkvOTZ3cVVCVDR3Rk93Z3FNRW80Y2U5eHUvSUJsejJoM2YxZGI4QmFQWTZ5?=
 =?utf-8?B?STJoU0xOTDdYMEY3NmdVTTd1NENaNUNsY3ZnV0hGZ0dvenY0YTQzc1QxMkxJ?=
 =?utf-8?B?bC9POE11Wnd1Z1NxZS83eTVGbml6MWs3bXRaYmJpU2JORHVOOUtTYWxMZUN2?=
 =?utf-8?B?STE3Q2cybUsrNVBFa2w3SXBFYnlIbnh6aW5Ddk50SFUzZExpbEdFUDVQUEp1?=
 =?utf-8?B?dEZiRGVDc1VKMnQ5d2lQRWd6YWd4TlQ0TXI2UzFGZGw3Y242Q2wyYkRpVEVq?=
 =?utf-8?B?NHpob3FsUHhGZG9OT0pQeHEwOUlIY1BINGNKYjMrZTJRS3lNSXdxL2QzNUVR?=
 =?utf-8?B?VGlPUGJOTkVKQmJibFJNcU9SbWI1ZFFwN3hoWHMzdW8zaHlpUnU4dkRKZlNO?=
 =?utf-8?B?ZmdLQjREcDRFbk5sMnpQQW9BeTMyQ0c2Y1RKLzhKQW1Qd0JVSmMzRFRPTmN5?=
 =?utf-8?B?OGNKWWE4OUF3ZC8xQXl2TTZsdTBVaHp0L2tpZW1BVFFoU0VRSlp1dWNQRmFk?=
 =?utf-8?B?cGZLQm9yWmlvc1NOcDJJSXpVK2RFK2VRcGxJOEd0dGdaZ0ExM0ZJdm9jbmt4?=
 =?utf-8?B?NDZ4SER2dnJQOS8zcU5XQTdFME9LempKK0pKZG1IZCtQRUc3NlFOTGNQK29y?=
 =?utf-8?B?NW9DTE51NSs0amxKSjVFQUxCTEpaMDNPYlBGVmNEeGhPamcvbG1ZMUZINnVQ?=
 =?utf-8?B?N0dkN3E2Vk9NNTcwdXVwVlhHdzVCZUl6MTVTYUprODdJc0REMklldUI4T0xh?=
 =?utf-8?B?R3RobHBtZDQ1SnhVdm4ySEU4TzZ0KzA4c0tmQUlXZkFQdE5HcmRVTEgwbXJv?=
 =?utf-8?B?Sm9LSHhmZDdFK29vZ2tOM1pIWWVVUmFHeGNMd2dYRGFUa0VxcnZodDRqRWlH?=
 =?utf-8?B?ZTV6SWtJUWYzMlM5U2Y4UTJIeTVHODd4RmlFL2Q5QW9GbFdDalhxVVlncjV6?=
 =?utf-8?B?U0hYSkp0clh4T2wzME5ubjBKczU1TnhmT3ZiNUxpREc1a3ZDQXZBaTJSY3N3?=
 =?utf-8?B?WjYwNXkzNS90T1V5Mm5XT2hNcWNZQ3EzZTdSQmo3cUdyMEV3T05CWHNadXkx?=
 =?utf-8?B?em5QSFNnUzNIVU80TTM0WU5QTHJia3J5bGFtWlFVV3M3RVZuUWJxcnBnOEJC?=
 =?utf-8?B?OGxJRVRGbjl2OUhhOC8wa0Jhak01eTZwRWxOZU5iRUFDU25iSUlPaHRVR1ls?=
 =?utf-8?B?Ulo3dXoyQVpHVUVxR2E3MzM2U0pVQzZuRnNNN3d2eUN0VGZmU0h2RFNTMElL?=
 =?utf-8?B?QktPaFczeGJFRVhoK2o0aDhkaDBqRDd0cUZYeFVMVDVFZjV4V2d2Q25vaUpm?=
 =?utf-8?B?R3c3cWhkRW9COENtNWc5KytNL2hRTVJxSVQySjVBejN1QXFPcWE2bFVMa0w4?=
 =?utf-8?B?ZEZwaE5FNTlTUDhVTWpEWTVMOHdILy82VzV5cERLUS9MT0JFTllCbjdaV0k5?=
 =?utf-8?B?TjVyMmJ4WmU2SWRsY1ZBVW9IelJROVlQcmhyRkRuVGFxL3NQWWpTdzZmYVZn?=
 =?utf-8?B?ajNZOHphamwvU01NYlRRNTFYdzFuVGcwdUFVQnU5TGQzYmNaaXBDZEJOTXlK?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd3ec96-d7cb-4263-5d9d-08dc62ae2cea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 09:25:39.8666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLyHfHwUjb4xNCtHf77xMKlI8gxEpCyn0i2v54/liqoEgDtB/jUuxtwyNB8LJLS+llIC+8jNL6Fx03geV70HBWVXbhoLg2zTFncoIS/1Tc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:27:58 +0200]:
> This initial GuC Relay ABI specification includes messages for ABI
> version negotiation and to query values of runtime/fuse registers.
> 
> We will start handling those messages on the PF driver soon.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_relay_actions_abi.h    | 147 +++++++++++++++++-
>  1 file changed, 146 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> index 747e428de421..05a2066ef7f7 100644
> --- a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> @@ -1,11 +1,156 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2024 Intel Corporation
>   */
>  
>  #ifndef _ABI_GUC_RELAY_ACTIONS_ABI_H_
>  #define _ABI_GUC_RELAY_ACTIONS_ABI_H_
>  
> +#include "abi/guc_relay_communication_abi.h"
> +
> +/**
> + * DOC: GuC Relay VF/PF ABI Version
> + *
> + * The _`GUC_RELAY_VERSION_BASE` defines minimum VF/PF ABI version that
> + * drivers must support. Currently this is version 1.0.
> + *
> + * The _`GUC_RELAY_VERSION_LATEST` defines latest VF/PF ABI version that
> + * drivers may use. Currently this is version 1.0.
> + *
> + * Some platforms may require different base VF/PF ABI version.
> + * No supported VF/PF ABI version can be 0.0.
> + */
> +
> +#define GUC_RELAY_VERSION_BASE_MAJOR			1
> +#define GUC_RELAY_VERSION_BASE_MINOR			0
> +
> +#define GUC_RELAY_VERSION_LATEST_MAJOR			1
> +#define GUC_RELAY_VERSION_LATEST_MINOR			0
> +
> +/**
> + * DOC: GuC Relay Actions
> + *
> + * The following actions are supported from VF/PF ABI version 1.0:
> + *
> + *  * `VF2PF_HANDSHAKE`_
> + *  * `VF2PF_QUERY_RUNTIME`_
> + */
> +
> +/**
> + * DOC: VF2PF_HANDSHAKE
> + *
> + * This `Relay Message`_ is used by the VF to establish ABI version with the PF.
> + *
> + * This message definition shall be supported by all future ABI versions.
> + * This message definition shall not be changed by future ABI versions.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_HANDSHAKE` = 0x0001        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 | 31:16 | **MAJOR** - requested major version of the VFPF interface    |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **MINOR** - requested minor version of the VFPF interface    |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 | 31:16 | **MAJOR** - agreed major version of the VFPF interface       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **MINOR** - agreed minor version of the VFPF interface       |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_RELAY_ACTION_VF2PF_HANDSHAKE		0x0001u
> +
> +#define VF2PF_HANDSHAKE_REQUEST_MSG_LEN			2u
> +#define VF2PF_HANDSHAKE_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR		(0xffffu << 16)
> +#define   VF2PF_HANDSHAKE_MAJOR_ANY			0
> +#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR		(0xffffu << 0)
> +#define   VF2PF_HANDSHAKE_MINOR_ANY			0

NIT: Maybe you should add a description of MAJOR_ANY and MINOR_ANY to the documentation
of this action.

> +
> +#define VF2PF_HANDSHAKE_RESPONSE_MSG_LEN		2u
> +#define VF2PF_HANDSHAKE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR		(0xffffu << 16)
> +#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR		(0xffffu << 0)
> +
> +/**
> + * DOC: VF2PF_QUERY_RUNTIME
> + *
> + * This `Relay Message`_ is used by the VF to query values of runtime registers.
> + *

NIT: I would describe more what runtime registers are (as a struture itself)
Because here you have a parameter "START" whose description indicates that it is some
kind of index. But someone who has the first contact with this has to check the code
to find out what this index is.
You could describe that runtime registers is a predefined list of registers depending
on the platform, and the index indicates the positions in the list.


> + * This message definition is supported from ABI versions 1.0.
> + *
> + * VF provides @START index to the requested register entry.
> + * VF can use @LIMIT to limit number of returned register entries.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = **LIMIT** - limit number of returned entries         |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME` = 0x0101    |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | DATA1 = **START** - index of the first requested entry       |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = **COUNT** - number of entries included in response   |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | DATA1 = **REMAINING** - number of remaining entries          |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | DATA2 = **REG_OFFSET** - offset of register[START]           |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 3 |  31:0 | DATA3 = **REG_VALUE** - value of register[START]             |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   |       |                                                              |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |n-1|  31:0 | REG_OFFSET - offset of register[START + x]                   |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | n |  31:0 | REG_VALUE - value of register[START + x]                     |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME		0x0101u
> +
> +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN		2u
> +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START		GUC_HXG_REQUEST_MSG_n_DATAn
> +
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN	(GUC_HXG_MSG_MIN_LEN + 1u)
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MAX_LEN	\
> +		(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + VF2PF_QUERY_RUNTIME_MAX_COUNT * 2)
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define   VF2PF_QUERY_RUNTIME_MIN_COUNT			0
> +#define   VF2PF_QUERY_RUNTIME_MAX_COUNT			\
> +		((GUC_RELAY_MSG_MAX_LEN - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2)
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING	GUC_HXG_RESPONSE_MSG_n_DATAn
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_OFFSETx	GUC_HXG_RESPONSE_MSG_n_DATAn
> +#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_VALUEx	GUC_HXG_RESPONSE_MSG_n_DATAn
> +
>  /**
>   * DOC: GuC Relay Debug Actions
>   *


Personally, I would expand the action descriptions a bit ( comments
above), but still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
