Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E9FEEC285
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFB710E2AC;
	Mon, 23 Feb 2026 21:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1At2rLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F4210E2AC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771882798; x=1803418798;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=64FvPpAWh/rranDhccCONTJTpdOa/laskppGP+dEOdY=;
 b=N1At2rLrArsKgQUkvJkH5zhVzCi0ytwvw01ULgTtflQiXW3jRZRdjaDm
 yjQrolp54pdbkvs39Wbncc/9/DP81TwMP4O6NrD57VksyPn6NOBjuI6hq
 T2LFDMSeS60nGtayja84WvWq+wcHPTYrqbEJ9xblUQ+l/vxWpppWSJDLc
 U/1krTjw4aWgIGBtJyS5z7IKy9pj6vRj1/IY+4T4BMUCZ64/tyhvm7dFa
 zF/k8AXLglABW0b9dNCrx7O5pHH2PUuoW6FNZiSpLaEJHlWAuGwwFCeCJ
 n99PfqD6Ff4VxO1jigXH7jWRYcr74yWwpRaYKSFmDAZ/MdU0Fwo9kzCgr Q==;
X-CSE-ConnectionGUID: gzbhPwTnRAKe1wFMidGv9A==
X-CSE-MsgGUID: YJ9P1L07T+2V5yKytZ3vcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90471528"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90471528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:39:56 -0800
X-CSE-ConnectionGUID: rBFVJuk9TZ2/8+5d+8XlQA==
X-CSE-MsgGUID: 0/ShdlehRFakdTC7cNVHZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219216997"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:39:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:39:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:39:55 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy9S+zbUAkR1rdZCYAUX39vHrcGXjcVGdY97ibvbTQ2z7fLQxDwuET3OZef1oEZCbpiSUUhcyLc3Vdj628JQqtmz4EUaCJw9M2Cg2QkPscfk9CBP52Bx4A7mbvwbaOFCjdITT/laE12Deu0EM1BQJSp5fK+JF8bBRgv4Tw3Q9+b50ueGdchifo7CCxZFBgHebNfwLQFpSzxTOrraKKP9kozrKOstZfywstOdaNE/2cVRvLEdS70wvT+H47ox4X0rhCI2qKxWugX8ppgzzGlcnKOzJys4666Y6zPNGK4vEDD5/7Y7AveCzd7uC8kKUkgTkNees1Nu3rvPWt5L39QsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fnimg2hXKk6wCW1i2souHHSF4yqgGCh9mtrrw/kXxjg=;
 b=ka7KLOe5vla3Kqs+LDorTH0AsVykODz2Ge5KZGp4iZStJjCMZ0D7KNvpnnDNHwNaM/NqHDZzqUtOiL5mMPpngFVt9lCSMwexjI2001xfhmV2Zv4dVC1ZI8ba+LWMEUKayjVF+ZOTEsiISqIXNRU0lJhKh5SuvMQw2/iEunEi6MteXECbfbv5GKwPjlZ6kBHS+H619yJg2fP0E+/psdcwFUlBPjLUkarkv5C/ZyJxCPlN2U1KOrsRYo1T+uffutLqzv7vzarsxc8yhd7b78YllxjPq53PkMG4FG1YkOH7Mqz3+umKJlROBXb+afonPQ3T+D39iF63goBahytzMEgzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 21:39:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:39:53 +0000
Date: Mon, 23 Feb 2026 13:39:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <rodrigo.vivi@intel.com>, <michal.mrozek@intel.com>, <fei.yang@intel.com>, 
 <daniel.charles@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Document exec queue priority rules
Message-ID: <aZzJJiWLHYn59O1G@lstrano-desk.jf.intel.com>
References: <20260223212442.8923-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223212442.8923-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: f17769d2-fafa-4db3-c9ac-08de7324144c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHE2OHE4b3A2ZDM3ZmdENFRQYkorQkt6MmNsZEVmTlpGQTlZYlNmL0wramV4?=
 =?utf-8?B?VnBqSk9TRlZuYlU4S2lNY1FRdEF5bS8rMkhpY21wY0VwZW1US0J5N0ZaNTNv?=
 =?utf-8?B?ZXp0TnUzUWtRay96VnBMRlYzeGRmNStwaHZLamJFY2JsciszbmswSGtDMHNt?=
 =?utf-8?B?by94QlptYXRZWWJ3UEMwanMwV0d1N3JCMWExWk8xbFVmMmVNNDBSU0NNM3dG?=
 =?utf-8?B?aEUrQmZTMmxHZ0JHWERlNmNoN2FrS2QzMnVGZ1FMUVdXQVJiMkJ3bDl6QTJl?=
 =?utf-8?B?UTBtZWFwdjNuN21adUFJL2R5aEMzSG5oTnlTQVNsNlo4eXBYZmwrSC9rNXZP?=
 =?utf-8?B?MWI5ajFwbVZhVkdkM2ZnNDdkR1M3dkh0UXU5bnJZVkJhaVVXRGtPWlZQNWdr?=
 =?utf-8?B?WFJVR2dVU1p0QnpwZmtLSXg5ZW5Db2VCempyUVRFWitkTjM1cjV3aktzeXBz?=
 =?utf-8?B?MzZ1a0ZOSHVmKzl3ZlRtakFZQUhzbGdTY3ovQzVHSktkSUdaT2pDUStvcXdn?=
 =?utf-8?B?WUg1OFRjY3JUZHNxaWlWeDJEMEpUMzBNM3FQeExMY3RpUUlmem5jSkdic01w?=
 =?utf-8?B?OElsZUZQdFMzbEh1S2tTY1JxYmp2eFplc3VjckpRa0VRZE5lUjBTUzNEcWJa?=
 =?utf-8?B?Z1orZ2dKVDZseGlUdWVuMVhFZ0krUWNJV1UvWGVPUzhqSFR6eSt2WTBJMDhJ?=
 =?utf-8?B?VXdvd2dZTHJ2Q0hHa0htRm9ndUVxRk1HSnBPeTRjMFN4aWhYZ2VMYzg4alVH?=
 =?utf-8?B?WkFFTjJlaFBjTXFmN3RNSDVlR1BxbFJMUnNrQ2E5dVFIRlJRaHhFV25NQ2FZ?=
 =?utf-8?B?MGZXVTVpWW1aeWtEVTFzUTBVQWtOemJDUFExaFNJa3dqZ0JMUHU3QlllM1JG?=
 =?utf-8?B?WHJQMjA4VGJBS0kzQVkyTWZUYXE4VURxOXdLL3BKUkhUVlF2WXZBMHh4SkJm?=
 =?utf-8?B?ZG5OdkZ1Y1pQcm1FdGEvbEluMUFrVDJTcFdtKzlKVklyQlJ4TDV2cFMzd3B4?=
 =?utf-8?B?Zm1RcmZsbjQrZUVUMmNPRTdlYkhabkdqc0o4dDJtaG0rMTdiYWtBb0l1Qitz?=
 =?utf-8?B?RkNCR3NsM2hIcnVLZEo0NXlyenl0SlVaUndpdE5mVm5jUThCK0x5SmlJbkEy?=
 =?utf-8?B?aDh1OGRCeVVueVVUcEE2VkhRZFg1MW1JdlpxLzFFUkx0ZytHaGJ5eEdUK1pC?=
 =?utf-8?B?bVRldWZPcVFHNjc3Z0JZeXVOdGdJZ1hlZEV5UGdEUElycEx3OFE4YU05REgy?=
 =?utf-8?B?NFVlelBkaUl2QUNKbHpnelJ6MU80VzE3NTliTVlncWR2ZVM3L3JiN3VtS0F5?=
 =?utf-8?B?S3BZUjNaM1dlNU1ld0ljSGRpTGpzeEl6VlRSRWJQdEZraFk4ZkFKclhxeHFx?=
 =?utf-8?B?T2hiNHZ0Q1V2WXByK2hCL0N4WWlhL055aG1OOWNFd0Y4RTNHRzNUczVkZmI4?=
 =?utf-8?B?OStXR1RPSTRPTDh5SlFwWjhJcTJ5bmNKWXExcTRpdzNGdG9xRDR4b2FWQnJU?=
 =?utf-8?B?OXZ4aDF6emFLY1NwenNQQ3ZaSzhKSkJRODhmd2VBeVkzR1hpRGRsb0syeXNV?=
 =?utf-8?B?YVVTUU5SbmZZaU1BVVRXVWRxV3Y4ZnNPUTRHcFVFYlZPMWdOQ3N3Q2xxQlA5?=
 =?utf-8?B?dW5sdnNlWjRGNnd6RnVLVnN5NHk3RTNPTG1GM3Fnb0hZSmJtYVVkbWhGQkZ6?=
 =?utf-8?B?bEdLVURpdWxuMWc4VDJiODFFTnBiSEFIWG5rNnlDbS9lZ1dFVzgzZnF3WXBT?=
 =?utf-8?B?aXFVc0VLN3lnT2dlMCtSSWNUWkNUTy9HUzJrUUcwT1NxRm96MGFoQ3EwVTJX?=
 =?utf-8?B?WVFoNVFjZVVZS3Nrbm1vSnRmM2JFYkFmTDRFbDBZSkZVaU5MOWZPa0xkS2tU?=
 =?utf-8?B?VnAwMmRFT1FvSHRMQzN3YjZiYlNqOXBZbmNEbUFHY2VnUFV0V2MzRThxeDUz?=
 =?utf-8?B?T1ZURVhuODU4dksyNGZLSDcwbGdWNFVHdGVCYWdIVkpxL3pvZldlblFGWHBQ?=
 =?utf-8?B?bDdWZTNwQmZobFJpZll0UTJEQ3RWRU9WZ2ZNcUk2c2VDdExReFJCRGhXemtu?=
 =?utf-8?B?TW5mS0o0b1BNS25oOHR3aXZvbVdOd3BOaXNoNldJVFFWZUtJdXRsTVVDWWsz?=
 =?utf-8?Q?0N+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUo4YytNZjJqNXRzL210dUducHA2TXl6L1hDcmpnTkd3N0twR1lDaHZQVFYv?=
 =?utf-8?B?WnJMVnBmWDdJaGhscHM1SzVvMDFyUk5zZnB2alVRZXByenkwRUpqUHFlL3ho?=
 =?utf-8?B?ZnFON1dvYWZBWUYwSHRlcENMRi9OMVFnZGwySi92WnNDZmo2ZHc0dUd3SVJk?=
 =?utf-8?B?Z3p4OXExWXBwYnZ0ZVNWZVpEbnNXVlhBQjByRmVkYkZBMWpSK0JtOXdDZEh5?=
 =?utf-8?B?UEpQcVdteHhDQzJwREsvY2VQbjJlanVtSDkxb0tkMk56YjZ1WGVuRHh2Mzcr?=
 =?utf-8?B?eXFEa2M4a3VTWStZMDYzdk40UHh1RDRBYjVHbHpXR2c2TGtON216cFhJZCt4?=
 =?utf-8?B?cDVlemFxL3JPVVhpVDM4QmpPM1h5NlY5R3pXcVd1TVFteEt0b3NaTUNrc2pU?=
 =?utf-8?B?SW9FeForTzJDTVJOOFl4cnRHbzRYSmEvNW9VWUJhSHJaZUNSWC9IMWs5cU4x?=
 =?utf-8?B?TjUzbk5JMW5icnVXamF0d01UR29Ma28xbmJPUDVQako3eTZLY0dpUkZwM0wx?=
 =?utf-8?B?U1RvZFYwZjBOeXJUTVVzamh0RkR0aHcvRCtzN2pmZGhJYjZRL2tvMWhuSFdu?=
 =?utf-8?B?SWY3NDEyYUp3UDloK1dMME1jUHViNkxTa1RLSEtnV2JTR0VzZlppZmg1b1RN?=
 =?utf-8?B?VjdYQUZQQmZMaFlBSU1kUk0raHA4blpQY2tleFAzR1ZscDZxQnpaUWlJd1Fp?=
 =?utf-8?B?VFc5VktaN2R2QkQweit2aWRFZUFZWERFWUZVaDlHMWZ4dTc5bzJzSitOTXEx?=
 =?utf-8?B?L2RzV0V1Vk5XMDJkRW9RSkpKSysrWlkwejc5MGhYNm5iVWpkdVZIOFRQUFkr?=
 =?utf-8?B?MVB0Q1V2MWFpQjUvM3IxMWd2Vnk2UmxiRUR2Z1ZaMllRMUFRbndsTXVHTGZu?=
 =?utf-8?B?Y3pEZWx5eVhpZGNabHRhYWdCUGhpcCtVQmV4dkhZZmVUU3hJSXZNK0FENzZF?=
 =?utf-8?B?WnEySFpySW5KMml4SE5vdXJoQ0QvVys0dWQ4SE9xZmQvOW5TZXJsclNtTzlC?=
 =?utf-8?B?UXBrTDdsMHRMK1REZ0VQN2loMTZZdGIwc3ZpY3h3SzRWV25FSFhqaDV0TWVE?=
 =?utf-8?B?N3MycDdEQUVUZnU0WlZWb3BjdVpCSVd0dTJ0RUI4dlNyWXVXZHVQUUFVdUc3?=
 =?utf-8?B?clRMMjliSUY5a1dMYnRTd2VLbHZQWnZNOVJyR0VUSUx3bzg2Q1RiQ0VKVWtx?=
 =?utf-8?B?Q3FvOGxIaDFPQ3QveDl5MjdIZXFxNFM5UGhTeHIxd21LcmNhM2tiZ3loSWhY?=
 =?utf-8?B?ME5zVE5qcTdFWm10bXJDanBsZCtNV24xT2xxWTVZcmVEa0hBMnUwSWFBb2Ez?=
 =?utf-8?B?QU12NHdMaVVuTzNkYi9RR3A2MzFLVm9XbDFhU2lDdEN6UExucW11ZDZUTVVy?=
 =?utf-8?B?a3QvMHc4a1lOc1V0Tk5OQzN2ODB6ZG5CVTkzUEpnZFZJM1pxejdkZGozbkIv?=
 =?utf-8?B?WFJkdTN4dkt3ZW4zOW83TDRHbVRhWlFZUkx5SnI2WDZpaHZqYzUvNUZQWWtt?=
 =?utf-8?B?b1V0dTFmOXVJNEE2d1RrSUtSdzFibHcxNlBCVTdxeUtwa1pUYUppZ3hqNkQr?=
 =?utf-8?B?Q3lmZUVKSGdPTENibzByZG1FNlZZU3ZodCthN2JYSU5VR3Axd1lHY2dTeWJm?=
 =?utf-8?B?R0hpWlBVUDIvK3U1enJIQ2gzRjVSU2k0UHArckNESFVWUVJCSFMxeHNVSUl6?=
 =?utf-8?B?aFdwSDhhemI2Qk5hRXhsdE5NNzIyRmZxSm9MZTZwbDR2YWRmclZIYmpwajBh?=
 =?utf-8?B?aStFb0kvYXhoRE5xTVlscnZsZEhYZWdJUjh4Qy9pNXlORXM5TXowSlZuYUZl?=
 =?utf-8?B?dGNnNnYzRTc0YnpVMnVSQVQrb2IrQmc0S2RaSzlvQU5mWFhxdVdsVHV3RWZo?=
 =?utf-8?B?RXJqeU5IZHFSak5HSjRlM1l1Q2ROVFpnK0dwekMwcGlPeGVDeHg1eWI5aDll?=
 =?utf-8?B?ZDdiL3ZZazVzQldCK1dtU1BReDdoSnBPUEpPby82Z1l3ZnNsYXdzNUFvcEhY?=
 =?utf-8?B?RWZEWnRKQTBQNjk0Q0piMXVxa2JsN05sMVhtZnpJQVdSVHl6cGRSTjVURVVh?=
 =?utf-8?B?b1JMaFYrWDFGS0hUR2cwNjFEU0NLNU5hK3JjWG5xMDZZRmh6ZFBiTGRGbmRI?=
 =?utf-8?B?MUlnL1ozOS9GMUVvdTQ4Y014ekFnbmtQUHlDN01mWU5nVUpSbTNzcnB3Uk5J?=
 =?utf-8?B?SEwxNzE0ZVpFcnJSazVPaDl3RVdNR1VPV05QZHNLbjRiVGxWcWxnZUhRR1pL?=
 =?utf-8?B?ZmdwOFdObCsvNTB5enlncXBRZVplZnJCdVVVaDNmcEx5SHo0SExPQnBiWU1F?=
 =?utf-8?B?aXhSbC9IS2RMWTczMlBFM0FtNG9BVFA4TlE0TWo3QUZYZnBEVithSmZ6MnBO?=
 =?utf-8?Q?adyNYiS0B+gGr/IY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f17769d2-fafa-4db3-c9ac-08de7324144c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:39:53.0996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5nHsUm5RHp7xAo31gNmlL1jwpEBZblrDH+AanB6P82KZj9Y3PC/d6D0dp30bEWo4PLGcIJk9xfsAdeBMxjweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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

On Mon, Feb 23, 2026 at 09:24:42PM +0000, Stuart Summers wrote:
> Add some documentation around how the GuC will employ
> the xe_exec_queue priorities provided by userspace
> application.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa..aefebfc6996e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -22,6 +22,30 @@ struct xe_guc_exec_queue;
>  struct xe_hw_engine;
>  struct xe_vm;
>  
> +/**
> + * enum xe_exec_queue_priority - Exec Queue priority values
> + *
> + * XeKMD uses GuC as the primary submission vehicle to HW.
> + * GuC has 4 priority levels that roughly map to the 4 levels
> + * shown here but in reverse order. GuC scheduler uses time
> + * slicing to determine how long a queue should remain on the
> + * command streamer before issuing a preemption request to
> + * allow execution of another queue.
> + *
> + * The following rules should be considered by applications
> + * employing these queue priorities:

I don’t think this is correct, but Daniele or someone on the GuC team
can correct me if I’m wrong.

My understanding is:

- Queues at the same priority are timesliced. The timeslice quantum
controls how long each queue gets to run before a preempt is
attempted.

- Queues with a higher priority than the one currently running
immediately preempt the lower priority ones. The preemption quantum
controls how long we wait before the lower priority queue is reset if
it doesn’t respond to a preempt.

- If a queue is running at a higher priority, those with lower priority
never get scheduled.

This is why setting HIGH is dangerous — it can completely starve out
other queues, which is why we don’t let unprivileged userspace set it.

Matt

> + *  - A HIGH priority request will preempt a NORMAL and LOW
> + *    priority request when submitted and based on the time
> + *    slice quantum.
> + *  - A NORMAL priority request will preempt a LOW priority
> + *    request when submitted and based on that time slice
> + *    quantum but will not preempt a HIGH priority request
> + *    until that time slice quantum has been reached.
> + *  - A LOW priority request will never preempt either a
> + *    MEDIUM or HIGH priority context.
> + *  - Currently KERNEL level priority is reserved, as the name
> + *    suggests, for kernel-submitted queues only.
> + */
>  enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage only */
>  	XE_EXEC_QUEUE_PRIORITY_LOW = 0,
> -- 
> 2.34.1
> 
