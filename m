Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDBFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF24F10E0C8;
	Mon,  4 May 2026 04:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub+gOECo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11F10E0C8
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869447; x=1809405447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=S4XpNsJQA0QxVZ5sPZgI+Dloo79J2dGHhLiUa7MOv7k=;
 b=Ub+gOECodhZPpIucvXYksCdzJBcbvWoR83GklUccAFNt5gMyheromSFf
 I6vTzBesRhxZ7Uvcl5J2AHE/HSO/3ajPnjsDAjgkw72qRTx4gfh7J4kQk
 XEYxB4Hd2fKWaumKed6aNbk22JeguogVFzyijSvZ086d2WbY27cE6mJfB
 Qo7A9/ESKL/YXt2ZDAWK+8ZEFanBqXgETpUAFBp/lOfYNRWf0I3g9wMBL
 THKcoXgCGTsywOvRXjvs1IdXmr5vf+GXuybYNaT9lNGZhHHk5FnxfHq00
 QwwjpMgtvdDsdbi0AdSmd7Yuv5/itpJyYovy+w3PB0kmkQnT1Dtr+lFbL A==;
X-CSE-ConnectionGUID: y587JhhwQYuPRz9v/wKdMg==
X-CSE-MsgGUID: P2lUfeE3SbmnW8Ze7hbNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89310578"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208,217";a="89310578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:37:26 -0700
X-CSE-ConnectionGUID: XJEKXfDvQyu6NZpwZGPU4A==
X-CSE-MsgGUID: pZUgunb7QXuy7sEBhTRx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
 d="scan'208,217";a="239727493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:37:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:37:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 21:37:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaaqjPyxYFcxgyyRBylUCXbxGroUq26LH+F6rPGBRSOBswyqAXaucc2+I6Pf45eiIFXjhuLjf3Q1CR+ejlNF7dVCkwH8z4x+QtH2BWaj+j9z9lnEFwQlrySNcIsMYMtDdeGyX2kIzQkrN2PewXsLMjnuYx0n/aeseT2g4odCunAqNRyI865vfS2vJV5yDRgSsDBsfkptr1S1zHW7jaxgTYmzLKyL8dzu9UNivbdgbVwactgybJsOe0tvLChQHkE+v1rOPHm3ALeAC5AxdJcRovfTxVIqbtts8u35F5YzECIKTW+3W8ZyXH+dIcled4v2csn9QxbxJ57qvvrBF42N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWegFN1ZcfEHoHI3PPW+xQmMYojfmntuXxwMNo7PvBs=;
 b=FQ1J4pqDQgAAc8CVcNzVeVGB6bl3AfSycmJNMb4rdWohanbss6WZ/OyO5UEobwZfWtx/Z/zeIN1wN+xT936w22OOe4/m5TlK/V3fpJ/IqpaF0N6BtBZzyFYWDtavtNQ6etRU0AvrqFtboKv1/sDcLlsyVuqug+HXPHX6P3UlAA+ZLq+/9Tf3+B0hcE8I4C/CfpvZWCrJuJh8Y/O0+9ld8yQWjBoGAVZ+NpnzM/Ox0KNDIfURS3WgAcsjpW+bKA9q7p8wjZxKABx10JjFTA4o4438ReMXnr56M0z2eVeYUMsh00MpKHfG/x07pbonXNpRZI0C+C+YvuPEZI6et/SpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:37:22 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 04:37:22 +0000
Content-Type: multipart/alternative;
 boundary="------------58pSGEOyDNjKcadcyXr9V0aH"
Message-ID: <165a529d-e62f-4064-95dd-38304aaec4d8@intel.com>
Date: Mon, 4 May 2026 10:07:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/madvise: Track purgeability with BO-local
 counters
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
References: <20260430101130.1365878-1-arvind.yadav@intel.com>
 <afOvSTNaIZk7WKoy@gsse-cloud1.jf.intel.com>
 <afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: ddaf94f5-c864-4e6a-c106-08dea996d55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|18002099003|8096899003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: FGNFK19GEKyyKAZh0KirqvIrkDIdjtk8wTCoccEkyd2qNCEiz+KrZflBxye75YAwARcZhhawUH96Hgp68zhC0sqSszjHW3arI+NIaEVYRVhmiTeRaHB+VikEqX8tR2NtlyLG6aO/kh9TOl49vF9inqrhRDT4rCWWEQrIpHTTS8292jZSsSfkTclxDjlx1sgNLqaHhikbfRRF1WzOER1E/ZvN9gDCD4USh1i9aStd6QhKKXcnd+tRGqY2Rp/mgCiFM1hCnFe03GU5WCEP9qSs03tZa7xL6roFMW68VqFbqaHmalUozaLPk+IUdiHN5pQhHBfjepJZ+iU4TJ1tXNspXBZtwN+eQKt7eOxNDvCDRGepABYDm9NyacqHHFLlnJtvMA3Svter02qDL3reTpZrkqTbW8UznCDK3wJ2yIqUf1Qncyz19WM8X76ZhD6iY34JapCr+r1X63jFuyk22l8Kl/U7XPAz8mRDEtn7Rc5HgUFKIywXhjA1XaqFI0p6kvIY5KDXdeacoA0tkATP60tNm7Uo49ykI1aEjku8ntsF6vKKcWtuVZ6n0U++IBLxN1ZP5iG2R6EmJSPmcIEH3LRp2wZsmXjiLkcKMu80zLY8m8NTTe7BWqqJxF4+rDJB7KRbjg276JO7m/SMTmZpxrIS0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(18002099003)(8096899003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU1JM3NaS3BzZTdhbkJ2bzFkNWszUEhBVURJeXRSQmNzM3dlL3UwWnVvQmRs?=
 =?utf-8?B?cUtHYlE5WWtIbWZtdm1NTjNXOG1qalc3cXRuU1N1ZnJBdE4xOVV1bEsyd1Za?=
 =?utf-8?B?UEZIK3o0L3orTkRKUTZqZ3IyZ001ejE1OE9PQWdlYUdpa3l2c1Vva2kvYVV6?=
 =?utf-8?B?OEpSYitKZnozZGJ5ajdlcElERExSZHZnajRyMkhFc21TQldtYitOWENUSGFk?=
 =?utf-8?B?TkovQnJreDZvdU5MYUhUQUFBdk1qaTljbE01d0VZZzZtZVI0ejNtWG5yNERD?=
 =?utf-8?B?MjgxdVZ6UngyRFdPWUVEQ1lhU0tLYW1kN1ordk1vTXV1V2FIS2tEQVpMa2U3?=
 =?utf-8?B?SlpXVWNMSjFtOUNVeVRhZnR3WkxQSm0zWVBLdXBVVllyUW9rbldES2NzRzJI?=
 =?utf-8?B?bEtXNDNGdGdKWWZmcUdGVTVvOTlnNWI2elJ0SWJiR1BQbG8rOG5YbG9vb0RY?=
 =?utf-8?B?KzR3MjM5bHB4M1ZkbFpLeEJGTmY1L1JPYk5EYk5Ra2NPTy9OUXhPZjMzaC84?=
 =?utf-8?B?TkFIMTFiWFlRVHBJczU2MlZYVG9IMzg2c3k0aFlJTEkxaEJSTGo5aGE2ZHN4?=
 =?utf-8?B?SURsSjU5dW1YZERIYURleXN5NjNTTVpnMVExS3kyeG42QXcvMVJGdVUrWWxE?=
 =?utf-8?B?eGZKNmg3QVpRdmdwS1FOVWxPZDluR0tzSWh6VXRWNGRWNHRIM1cxR0ZYNnRI?=
 =?utf-8?B?enRwYm1RV0UreFI3Y1Y5S2VtZUtWcWhIR3MyUFc3aGUzYnJBT2xaTDVaVEJQ?=
 =?utf-8?B?UXJOSm9nK29xZEVLOS81WWtsOFM5S1lpa2ltQ3ZVNS9SOVlOQ2lYSldrR1BF?=
 =?utf-8?B?WGxBbFdnSm5OMTVHd25QK3hybEUwMDJjU29iVjBUbUxPaE50amJxdDIraWVk?=
 =?utf-8?B?S2FqYnBrR3UweUoxRmtyczB1cVVieWZucDhuREdtdVNyZmJEdkhoYXNpNTZx?=
 =?utf-8?B?WTVzMmRPUHJmOUdQY1lqZ0p6QlpPWVhCcWxxdGVhVzRtd2R5QU00Q1VJZ3Ux?=
 =?utf-8?B?d21maWpYV21URytYS3k2SUIvTm1PYjFLZTZqZE05QkJKTFl4Q2xCT3RLWjdS?=
 =?utf-8?B?V2ZvK2QxRlhDSVBZTU5oSlFPMWhUMXV3Ni80VVZTTnhkY2JPeVVuam5YUFZW?=
 =?utf-8?B?ZEhNSkFOVStYWkhlbUZxZWl5ZU1Qblk1ZXhGb2kwb2FGUDRRRUZnN2d3MFN0?=
 =?utf-8?B?NDgzbzJERU1RUktSMmFzeFVMcStVbE5HVUtkcjBSQnpWSDRnRzRqSHdZV2R3?=
 =?utf-8?B?ZzF4L2VGT2dzQWEzSXR0REw0RUR0bXVJcmNaRVlNNkd0dkpkVWI1UGhlZXkv?=
 =?utf-8?B?TDJORWI5dFliTXd1YUtKcTdTKytqY0dYZEtVSkp4TTRsSFlqQXNOTmtEdS9F?=
 =?utf-8?B?TG96bENpcEp0NjNjZlFUTGo1ZmVrV3RjK0Nyb2tGTEVabmpITmNabnp5Qk4z?=
 =?utf-8?B?djNlVUlsbmZCRElpQWZUNlZ3aEJUUnBTZFFRUFo5TWVuYzZHNjRHSmoxcUky?=
 =?utf-8?B?Mnp4L0pidUl6WlBLSEdGRlBnNjFaaExQOGgrN2VJaVMyTmFENTMxdXRHVHZt?=
 =?utf-8?B?eHBsRjR6UTFuZHpKQzJscjZxUVM2TUhDOVJEODJCeGQreEZJTlVqQ1ZYLzZk?=
 =?utf-8?B?cFk3UFJMbTQwMTh0Y1ZuTW4xNnJCN0tQY21aNUc5M2pNd0o2UkY1bVdmQVVq?=
 =?utf-8?B?TkYxUHdrTllVMjVWZFppVmh6ZlJnR3l2UUFPckpvSGJhNkQ3RmhLUVRBUjYw?=
 =?utf-8?B?ODlxNmFHbEZCR3NUdlkwaGs1aHhCQnUwQUQzRHNoOHBkQ240MzZYS0xZRzJY?=
 =?utf-8?B?bkhJNEpDYWptVlJnQ1V5ZjlrR1RGU2JSVUY0ZVdoLzU3VUVnNGtLWVVmL0Z3?=
 =?utf-8?B?N0RuSjZBcEF2WXZzVXZlSjdHNGVZMkFVNVZCd3NVMHMyeFZURnZkbC8zeVVH?=
 =?utf-8?B?MTZuUFRjd0RBOUZadUp2QXQyTFFmODROZmdEc3p3cG1jS245SHNYRkkrNWRD?=
 =?utf-8?B?VEZaNFI4bWIzcktFWSs2MFJlbWg4SmE2RXZPcVZDZHN3OGIxUXFXSnpNellp?=
 =?utf-8?B?TlFJeTNlYUJXRFNaZ3hwTEFwRFRyanJOb3E4cGlwWCtTczFVNm9qem9CajAy?=
 =?utf-8?B?RXZCREJYZDdLcWpGaEhjSmhaZUxsbWNiNGF3bFA2QWdoT25GQ3ZUQTZZaEVJ?=
 =?utf-8?B?STZONy9uR2JJQzVDbGtqbGJ3SVdybnRGU0lHT0pJbjdIQ1pIeDFEZmxKLzR0?=
 =?utf-8?B?clpnZGc4N2d0NnFSWDBPaTgyVG5JWTgzOWsxOE92WEttcFpIb1d3OW1kcWZV?=
 =?utf-8?B?MDMzZ3Y5R3AvT2Z1VFZpbEYvenFYbUgwWWR0YkdBUHFqdWNGS2xIZz09?=
X-Exchange-RoutingPolicyChecked: Vj1TRVMksITB8RCr3yRImRtQp0JQab1X1XmT/Hadglc44OXZrQiHOc1Tob4enRv3ZVY0d3lwX4p832RLZpfSak+3OuOv++MZ9k4Vh8uN6hHNR8tK7wZFFAw7Y46VIIuZO5BZYK7qlD14lXJ0eAEMSZopTohmgAME0i4y5rlVe5QULa+PAUta4T7Wa/cgFSikPHAYgdyRy9lvCJ4MDhSk1Fngvr8ZfBreGcTwFa4MOnZx/2FLGDGVtnnxqgnHlRlUif+1H3U1kFZ7puFYShOvYmksjHKi0EYfVmDS3ynS9OXthLKYeJutvIPnhhZrB8ZFjo2pwwGx+lk2Ui+I+iCtcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaf94f5-c864-4e6a-c106-08dea996d55e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 04:37:22.6747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCidmghBlaFVo1ubHlTuBPKCN6bytseFKKEnFsATGoiftILIQkZut9EhsuTl3pQDF4NeMqMQRWhZmyXBVr0dOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
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

--------------58pSGEOyDNjKcadcyXr9V0aH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 01-05-2026 23:38, Matthew Brost wrote:
> On Thu, Apr 30, 2026 at 12:36:41PM -0700, Matthew Brost wrote:
>> On Thu, Apr 30, 2026 at 03:41:30PM +0530, Arvind Yadav wrote:
>>> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
>>> whether the BO can be made purgeable. This makes VMA create/destroy and
>>> madvise updates O(n) in the number of mappings.
>>>
>>> Replace the walk with BO-local counters protected by the BO dma-resv
>>> lock:
>>>
>>>    - vma_count tracks the number of VMAs mapping the BO.
>>>    - willneed_count tracks active WILLNEED holders, including WILLNEED
>>>      VMAs and active dma-buf exports for non-imported BOs.
>>>
>>> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
>>> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
>>> when it still has VMAs, preserving the previous behaviour where a BO
>>> with no mappings keeps its current madvise state.
>>>
>>> PURGED remains terminal, preserving the existing "once purged, always
>>> purged" rule.
>>>
>>> v2:
>>>    - Use early return for imported BOs in all four helpers to avoid
>>>      nesting (Matt B).
>>>    - Group purgeability state into a purgeable sub-struct on struct
>>>      xe_bo (Matt B).
>>>    - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
>>>      transition means all remaining active VMAs are DONTNEED (Matt B).
>>>
>>> Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
>>
> My bad - sashiko flagged a valid issue here [1].
>
> So I xe_vma_create need to flags.check_purged check that is currently in
> vma_lock_and_validate(). We the dma-resv locks in xe_vma_create so
> moving the check to xe_vma_create should be safe.
>
> More below.
>
> [1]https://sashiko.dev/#/patchset/20260430101130.1365878-1-arvind.yadav%40intel.com


Yes, Good catch. we should add the check in xe_vma_create(), but it also 
needs to remain in vma_lock_and_validate() because PREFETCH does not go 
through xe_vma_create(). drm_gpuvm_prefetch_ops_create() generates 
operations that reference existing VMAs, and the PREFETCH path in 
op_lock_and_prep() relies solely on vma_lock_and_validate().

>
>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c         |   6 +-
>>>   drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_bo_types.h   |  27 ++++-
>>>   drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>>>   drivers/gpu/drm/xe/xe_vm.c         |   9 +-
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>>>   7 files changed, 155 insertions(+), 167 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 5ce60d161e09..eaa3a4ee9111 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>>>   		  new_state == XE_MADV_PURGEABLE_PURGED);
>>>   
>>>   	/* Once purged, always purged - cannot transition out */
>>> -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
>>> +	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
>>>   			new_state != XE_MADV_PURGEABLE_PURGED));
>>>   
>>> -	bo->madv_purgeable = new_state;
>>> +	bo->purgeable.state = new_state;
>>>   	xe_bo_set_purgeable_shrinker(bo, new_state);
>>>   }
>>>   
>>> @@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>>   
>>>   	/* Initialize purge advisory state */
>>> -	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>>> +	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
>>>   
>>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>> index 68dea7d25a6b..6340317f7d2e 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>> @@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>>   static inline bool xe_bo_is_purged(struct xe_bo *bo)
>>>   {
>>>   	xe_bo_assert_held(bo);
>>> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
>>> +	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
>>>   }
>>>   
>>>   /**
>>> @@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
>>>   static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>>>   {
>>>   	xe_bo_assert_held(bo);
>>> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
>>> +	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
>>>   }
>>>   
>>>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>>>   
>>> +/**
>>> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
>>> + * @bo: Buffer object
>>> + *
>>> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
>>> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
>>> + *
>>> + * Caller must hold the BO's dma-resv lock.
>>> + */
>>> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
>>> +{
>>> +	xe_bo_assert_held(bo);
>>> +
>>> +	/* Imported BOs are owned externally; do not track purgeability. */
>>> +	if (drm_gem_is_imported(&bo->ttm.base))
>>> +		return;
>>> +
>>> +	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
>>> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
>>> +}
>>> +
>>> +/**
>>> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
>>> + * @bo: Buffer object
>>> + *
>>> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
>>> + * DONTNEED only if it still has VMAs (implying all active VMAs are
>>> + * DONTNEED). If the last VMA is being removed, preserve the current BO
>>> + * state to match the previous VMA-walk semantics.
>>> + *
>>> + * PURGED is terminal and the BO state is never modified.
>>> + *
>>> + * Caller must hold the BO's dma-resv lock.
>>> + */
>>> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
>>> +{
>>> +	xe_bo_assert_held(bo);
>>> +
>>> +	if (drm_gem_is_imported(&bo->ttm.base))
>>> +		return;
>>> +
>>> +	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
>>> +	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
>>> +	    !xe_bo_is_purged(bo))
>>> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
>>> +}
>>> +
>>> +/**
>>> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
>>> + * @bo: Buffer object
>>> + *
>>> + * Increments vma_count.
>>> + *
>>> + * Caller must hold the BO's dma-resv lock.
>>> + */
>>> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
>>> +{
>>> +	xe_bo_assert_held(bo);
>>> +
>>> +	if (drm_gem_is_imported(&bo->ttm.base))
>>> +		return;
>>> +
>>> +	bo->purgeable.vma_count++;
>>> +}
>>> +
>>> +/**
>>> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
>>> + * @bo: Buffer object
>>> + *
>>> + * Decrements vma_count.
>>> + *
>>> + * Caller must hold the BO's dma-resv lock.
>>> + */
>>> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
>>> +{
>>> +	xe_bo_assert_held(bo);
>>> +
>>> +	if (drm_gem_is_imported(&bo->ttm.base))
>>> +		return;
>>> +
>>> +	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
>>> +	bo->purgeable.vma_count--;
>>> +}
>>> +
>>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>>   {
>>>   	if (likely(bo)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>>> index 9c199badd9b2..6756d7820aca 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>> @@ -111,10 +111,31 @@ struct xe_bo {
>>>   	u64 min_align;
>>>   
>>>   	/**
>>> -	 * @madv_purgeable: user space advise on BO purgeability, protected
>>> -	 * by BO's dma-resv lock.
>>> +	 * @purgeable: Purgeability state and accounting.
>>> +	 *
>>> +	 * All fields are protected by the BO's dma-resv lock.
>>>   	 */
>>> -	u32 madv_purgeable;
>>> +	struct {
>>> +		/**
>>> +		 * @purgeable.state: BO purgeability state (WILLNEED/DONTNEED/PURGED).
>>> +		 */
>>> +		u32 state;
>>> +
>>> +		/**
>>> +		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
>>> +		 */
>>> +		u32 vma_count;
>>> +
>>> +		/**
>>> +		 * @purgeable.willneed_count: Number of active WILLNEED holders.
>>> +		 *
>>> +		 * Counts WILLNEED VMAs plus active dma-buf exports for
>>> +		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
>>> +		 * transition only when VMAs still exist; if the last VMA is
>>> +		 * removed, the previous BO state is preserved.
>>> +		 */
>>> +		u32 willneed_count;
>>> +	} purgeable;
>>>   };
>>>   
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> index b9828da15897..855d32ba314d 100644
>>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>>   	return 0;
>>>   }
>>>   
>>> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
>>> +{
>>> +	struct drm_gem_object *obj = dmabuf->priv;
>>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>>> +
>>> +	xe_bo_lock(bo, false);
>>> +	xe_bo_willneed_put_locked(bo);
>>> +	xe_bo_unlock(bo);
>>> +
>>> +	drm_gem_dmabuf_release(dmabuf);
>>> +}
>>> +
>>>   static const struct dma_buf_ops xe_dmabuf_ops = {
>>>   	.attach = xe_dma_buf_attach,
>>>   	.detach = xe_dma_buf_detach,
>>> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>>>   	.unpin = xe_dma_buf_unpin,
>>>   	.map_dma_buf = xe_dma_buf_map,
>>>   	.unmap_dma_buf = xe_dma_buf_unmap,
>>> -	.release = drm_gem_dmabuf_release,
>>> +	.release = xe_dma_buf_release,
>>>   	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>>>   	.mmap = drm_gem_dmabuf_mmap,
>>>   	.vmap = drm_gem_dmabuf_vmap,
>>> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>>>   		ret = -EINVAL;
>>>   		goto out_unlock;
>>>   	}
>>> +
>>> +	xe_bo_willneed_get_locked(bo);
>>>   	xe_bo_unlock(bo);
>>>   
>>>   	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>>>   	if (ret)
>>> -		return ERR_PTR(ret);
>>> +		goto out_put;
>>>   
>>>   	buf = drm_gem_prime_export(obj, flags);
>>> -	if (!IS_ERR(buf))
>>> -		buf->ops = &xe_dmabuf_ops;
>>> +	if (IS_ERR(buf)) {
>>> +		ret = PTR_ERR(buf);
>>> +		goto out_put;
>>> +	}
>>>   
>>> +	buf->ops = &xe_dmabuf_ops;
>>>   	return buf;
>>>   
>>> +out_put:
>>> +	xe_bo_lock(bo, false);
>>> +	xe_bo_willneed_put_locked(bo);
>>>   out_unlock:
>>>   	xe_bo_unlock(bo);
>>>   	return ERR_PTR(ret);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index c3836f6eab35..12457173ba85 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>   		vma->gpuva.gem.offset = bo_offset_or_userptr;
>>>   		drm_gpuva_link(&vma->gpuva, vm_bo);
>>>   		drm_gpuvm_bo_put(vm_bo);
>>> +
>>> +		xe_bo_vma_count_inc_locked(bo);
>>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>>> +			xe_bo_willneed_get_locked(bo);
> So at very top of this function I think:
>
> if (bo && attr->purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> 	if (xe_bo_madv_is_dontneed(bo))
> 		return ERR_PTR(-EBUSY);  /* BO marked purgeable */
> 	else if (xe_bo_is_purged(bo))
> 		return ERR_PTR(-EINVAL); /* BO already purged */
> }
>
> Then delete the check in vma_lock_and_validate. I think check in
> vma_lock_and_validate is actually wrong for rebinds too - e.g., it is
> prefectly to do a partial unbind a dontneed or purged BO and the
> existing check I believe would reject this.


Agreed. I will dropped .check_purged from MAP and REMAP prev/next in 
vm_bind_ioctl_op_lock_and_prep() for v3. The check now lives in 
xe_vma_create() and only triggers when attr->purgeable_state == 
WILLNEED, so partial unbind/rebind on DONTNEED or PURGED BOs works as 
expected. and PREFETCH keeps .check_purged as it is a separate check for 
existing VMAs with no backing store to migrate.

>
> We should put together a test for for this too.
>
> addr = bind(2M);
> madvise(addr, DONTNEED);
> unbind(addr, 1M);
>
> Assuming the current code fails in this test case and new code works,
> I'd suggest making this patch a fixes too.


Noted. I will add a test case to cover this and include the appropriate 
fix tag

Thanks,
Arvind

>
> Matt
>
>>>   	} else /* userptr or null */ {
>>>   		if (!is_null && !is_cpu_addr_mirror) {
>>>   			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>>> @@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>>   		xe_bo_assert_held(bo);
>>>   
>>>   		drm_gpuva_unlink(&vma->gpuva);
>>> -		xe_bo_recompute_purgeable_state(bo);
>>> +
>>> +		xe_bo_vma_count_dec_locked(bo);
>>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>>> +			xe_bo_willneed_put_locked(bo);
>>>   	}
>>>   
>>>   	xe_vm_assert_held(vm);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index c78906dea82b..c4fb29004195 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>>   	}
>>>   }
>>>   
>>> -/**
>>> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
>>> - * @bo: Buffer object
>>> - *
>>> - * Prevent marking imported or exported dma-bufs as purgeable.
>>> - * For imported BOs, Xe doesn't own the backing store and cannot
>>> - * safely reclaim pages (exporter or other devices may still be
>>> - * using them). For exported BOs, external devices may have active
>>> - * mappings we cannot track.
>>> - *
>>> - * Return: true if BO is imported or exported, false otherwise
>>> - */
>>> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
>>> -{
>>> -	struct drm_gem_object *obj = &bo->ttm.base;
>>> -
>>> -	/* Imported: exporter owns backing store */
>>> -	if (drm_gem_is_imported(obj))
>>> -		return true;
>>> -
>>> -	/* Exported: external devices may be accessing */
>>> -	if (obj->dma_buf)
>>> -		return true;
>>> -
>>> -	return false;
>>> -}
>>> -
>>> -/**
>>> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
>>> - *
>>> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
>>> - * one WILLNEED, or have no VMAs at all.
>>> - *
>>> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
>>> - */
>>> -enum xe_bo_vmas_purge_state {
>>> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
>>> -	XE_BO_VMAS_STATE_WILLNEED = 0,
>>> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
>>> -	XE_BO_VMAS_STATE_DONTNEED = 1,
>>> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
>>> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
>>> -};
>>> -
>>> -/*
>>> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
>>> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
>>> - * both enums so the single-line cast is always valid.
>>> - */
>>> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
>>> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
>>> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
>>> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
>>> -
>>> -/**
>>> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
>>> - * @bo: Buffer object
>>> - *
>>> - * Check all VMAs across all VMs to determine aggregate purgeable state.
>>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>>> - *
>>> - * Caller must hold BO dma-resv lock.
>>> - *
>>> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
>>> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
>>> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
>>> - */
>>> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>>> -{
>>> -	struct drm_gpuvm_bo *vm_bo;
>>> -	struct drm_gpuva *gpuva;
>>> -	struct drm_gem_object *obj = &bo->ttm.base;
>>> -	bool has_vmas = false;
>>> -
>>> -	xe_bo_assert_held(bo);
>>> -
>>> -	/* Shared dma-bufs cannot be purgeable */
>>> -	if (xe_bo_is_dmabuf_shared(bo))
>>> -		return XE_BO_VMAS_STATE_WILLNEED;
>>> -
>>> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> -
>>> -			has_vmas = true;
>>> -
>>> -			/* Any non-DONTNEED VMA prevents purging */
>>> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
>>> -				return XE_BO_VMAS_STATE_WILLNEED;
>>> -		}
>>> -	}
>>> -
>>> -	/*
>>> -	 * No VMAs => preserve existing BO purgeable state.
>>> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
>>> -	 */
>>> -	if (!has_vmas)
>>> -		return XE_BO_VMAS_STATE_NO_VMAS;
>>> -
>>> -	return XE_BO_VMAS_STATE_DONTNEED;
>>> -}
>>> -
>>> -/**
>>> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
>>> - * @bo: Buffer object
>>> - *
>>> - * Walk all VMAs to determine if BO should be purgeable or not.
>>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>>> - * If the BO has no VMAs the existing state is preserved.
>>> - *
>>> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
>>> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
>>> - * This is satisfied at both call sites:
>>> - * - xe_vma_destroy(): holds vm->lock write
>>> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
>>> - *
>>> - * Return: nothing
>>> - */
>>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>>> -{
>>> -	enum xe_bo_vmas_purge_state vma_state;
>>> -
>>> -	if (!bo)
>>> -		return;
>>> -
>>> -	xe_bo_assert_held(bo);
>>> -
>>> -	/*
>>> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
>>> -	 * This matches i915 semantics where purged BOs are permanently invalid.
>>> -	 */
>>> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>>> -		return;
>>> -
>>> -	vma_state = xe_bo_all_vmas_dontneed(bo);
>>> -
>>> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
>>> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
>>> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
>>> -}
>>> -
>>>   /**
>>>    * madvise_purgeable - Handle purgeable buffer object advice
>>>    * @xe: XE device
>>> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>>   		/* BO must be locked before modifying madv state */
>>>   		xe_bo_assert_held(bo);
>>>   
>>> -		/* Skip shared dma-bufs - no PTEs to zap */
>>> -		if (xe_bo_is_dmabuf_shared(bo)) {
>>> -			vmas[i]->skip_invalidation = true;
>>> -			continue;
>>> -		}
>>> -
>>>   		/*
>>>   		 * Once purged, always purged. Cannot transition back to WILLNEED.
>>>   		 * This matches i915 semantics where purged BOs are permanently invalid.
>>> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>>   
>>>   		switch (op->purge_state_val.val) {
>>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>>>   			vmas[i]->skip_invalidation = true;
>>> -
>>> -			xe_bo_recompute_purgeable_state(bo);
>>> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
>>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
>>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>>> +				xe_bo_willneed_get_locked(bo);
>>> +			}
>>>   			break;
>>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>>>   			/*
>>>   			 * Don't zap PTEs at DONTNEED time -- pages are still
>>>   			 * alive. The zap happens in xe_bo_move_notify() right
>>> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>>   			 */
>>>   			vmas[i]->skip_invalidation = true;
>>>   
>>> -			xe_bo_recompute_purgeable_state(bo);
>>> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
>>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
>>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>>> +				xe_bo_willneed_put_locked(bo);
>>> +			}
>>>   			break;
>>>   		default:
>>>   			/* Should never hit - values validated in madvise_args_are_sane() */
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> index 39acd2689ca0..a3078f634c7e 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> @@ -13,6 +13,4 @@ struct xe_bo;
>>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>>   			struct drm_file *file);
>>>   
>>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>>> -
>>>   #endif
>>> -- 
>>> 2.43.0
>>>
--------------58pSGEOyDNjKcadcyXr9V0aH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-05-2026 23:38, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Apr 30, 2026 at 12:36:41PM -0700, Matthew Brost wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Thu, Apr 30, 2026 at 03:41:30PM +0530, Arvind Yadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
whether the BO can be made purgeable. This makes VMA create/destroy and
madvise updates O(n) in the number of mappings.

Replace the walk with BO-local counters protected by the BO dma-resv
lock:

  - vma_count tracks the number of VMAs mapping the BO.
  - willneed_count tracks active WILLNEED holders, including WILLNEED
    VMAs and active dma-buf exports for non-imported BOs.

A DONTNEED BO is promoted back to WILLNEED on a 0-&gt;1 transition of
willneed_count. A BO is demoted to DONTNEED on a 1-&gt;0 transition only
when it still has VMAs, preserving the previous behaviour where a BO
with no mappings keeps its current madvise state.

PURGED remains terminal, preserving the existing &quot;once purged, always
purged&quot; rule.

v2:
  - Use early return for imported BOs in all four helpers to avoid
    nesting (Matt B).
  - Group purgeability state into a purgeable sub-struct on struct
    xe_bo (Matt B).
  - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1-&gt;0
    transition means all remaining active VMAs are DONTNEED (Matt B).

Suggested-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
My bad - sashiko flagged a valid issue here [1].

So I xe_vma_create need to flags.check_purged check that is currently in
vma_lock_and_validate(). We the dma-resv locks in xe_vma_create so
moving the check to xe_vma_create should be safe. 

More below.

[1] <a class="moz-txt-link-freetext" href="https://sashiko.dev/#/patchset/20260430101130.1365878-1-arvind.yadav%40intel.com">https://sashiko.dev/#/patchset/20260430101130.1365878-1-arvind.yadav%40intel.com</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, Good catch. we should add the check in xe_vma_create(), but
      it also needs to remain in vma_lock_and_validate() because
      PREFETCH does not go through xe_vma_create().
      drm_gpuvm_prefetch_ops_create() generates operations that
      reference existing VMAs, and the PREFETCH path in
      op_lock_and_prep() relies solely on vma_lock_and_validate().</p>
    <blockquote type="cite" cite="mid:afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c         |   6 +-
 drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h   |  27 ++++-
 drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
 drivers/gpu/drm/xe/xe_vm.c         |   9 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
 drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
 7 files changed, 155 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..eaa3a4ee9111 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 		  new_state == XE_MADV_PURGEABLE_PURGED);
 
 	/* Once purged, always purged - cannot transition out */
-	xe_assert(xe, !(bo-&gt;madv_purgeable == XE_MADV_PURGEABLE_PURGED &amp;&amp;
+	xe_assert(xe, !(bo-&gt;purgeable.state == XE_MADV_PURGEABLE_PURGED &amp;&amp;
 			new_state != XE_MADV_PURGEABLE_PURGED));
 
-	bo-&gt;madv_purgeable = new_state;
+	bo-&gt;purgeable.state = new_state;
 	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
 
@@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	INIT_LIST_HEAD(&amp;bo-&gt;vram_userfault_link);
 
 	/* Initialize purge advisory state */
-	bo-&gt;madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
+	bo-&gt;purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
 
 	drm_gem_private_object_init(&amp;xe-&gt;drm, &amp;bo-&gt;ttm.base, size);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 68dea7d25a6b..6340317f7d2e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
 static inline bool xe_bo_is_purged(struct xe_bo *bo)
 {
 	xe_bo_assert_held(bo);
-	return bo-&gt;madv_purgeable == XE_MADV_PURGEABLE_PURGED;
+	return bo-&gt;purgeable.state == XE_MADV_PURGEABLE_PURGED;
 }
 
 /**
@@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
 static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 {
 	xe_bo_assert_held(bo);
-	return bo-&gt;madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
+	return bo-&gt;purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
 }
 
 void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
 
+/**
+ * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
+ * @bo: Buffer object
+ *
+ * Increments willneed_count and, on a 0-&gt;1 transition, promotes the BO
+ * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	/* Imported BOs are owned externally; do not track purgeability. */
+	if (drm_gem_is_imported(&amp;bo-&gt;ttm.base))
+		return;
+
+	if (bo-&gt;purgeable.willneed_count++ == 0 &amp;&amp; xe_bo_madv_is_dontneed(bo))
+		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+}
+
+/**
+ * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
+ * @bo: Buffer object
+ *
+ * Decrements willneed_count and, on a 1-&gt;0 transition, marks the BO
+ * DONTNEED only if it still has VMAs (implying all active VMAs are
+ * DONTNEED). If the last VMA is being removed, preserve the current BO
+ * state to match the previous VMA-walk semantics.
+ *
+ * PURGED is terminal and the BO state is never modified.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&amp;bo-&gt;ttm.base))
+		return;
+
+	xe_assert(xe_bo_device(bo), bo-&gt;purgeable.willneed_count &gt; 0);
+	if (--bo-&gt;purgeable.willneed_count == 0 &amp;&amp; bo-&gt;purgeable.vma_count &gt; 0 &amp;&amp;
+	    !xe_bo_is_purged(bo))
+		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+}
+
+/**
+ * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
+ * @bo: Buffer object
+ *
+ * Increments vma_count.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&amp;bo-&gt;ttm.base))
+		return;
+
+	bo-&gt;purgeable.vma_count++;
+}
+
+/**
+ * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
+ * @bo: Buffer object
+ *
+ * Decrements vma_count.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&amp;bo-&gt;ttm.base))
+		return;
+
+	xe_assert(xe_bo_device(bo), bo-&gt;purgeable.vma_count &gt; 0);
+	bo-&gt;purgeable.vma_count--;
+}
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 9c199badd9b2..6756d7820aca 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -111,10 +111,31 @@ struct xe_bo {
 	u64 min_align;
 
 	/**
-	 * @madv_purgeable: user space advise on BO purgeability, protected
-	 * by BO's dma-resv lock.
+	 * @purgeable: Purgeability state and accounting.
+	 *
+	 * All fields are protected by the BO's dma-resv lock.
 	 */
-	u32 madv_purgeable;
+	struct {
+		/**
+		 * @purgeable.state: BO purgeability state (WILLNEED/DONTNEED/PURGED).
+		 */
+		u32 state;
+
+		/**
+		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
+		 */
+		u32 vma_count;
+
+		/**
+		 * @purgeable.willneed_count: Number of active WILLNEED holders.
+		 *
+		 * Counts WILLNEED VMAs plus active dma-buf exports for
+		 * non-imported BOs. The BO flips to DONTNEED on a 1-&gt;0
+		 * transition only when VMAs still exist; if the last VMA is
+		 * removed, the previous BO state is preserved.
+		 */
+		u32 willneed_count;
+	} purgeable;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index b9828da15897..855d32ba314d 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return 0;
 }
 
+static void xe_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct drm_gem_object *obj = dmabuf-&gt;priv;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	xe_bo_lock(bo, false);
+	xe_bo_willneed_put_locked(bo);
+	xe_bo_unlock(bo);
+
+	drm_gem_dmabuf_release(dmabuf);
+}
+
 static const struct dma_buf_ops xe_dmabuf_ops = {
 	.attach = xe_dma_buf_attach,
 	.detach = xe_dma_buf_detach,
@@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
 	.unpin = xe_dma_buf_unpin,
 	.map_dma_buf = xe_dma_buf_map,
 	.unmap_dma_buf = xe_dma_buf_unmap,
-	.release = drm_gem_dmabuf_release,
+	.release = xe_dma_buf_release,
 	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
@@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 		ret = -EINVAL;
 		goto out_unlock;
 	}
+
+	xe_bo_willneed_get_locked(bo);
 	xe_bo_unlock(bo);
 
 	ret = ttm_bo_setup_export(&amp;bo-&gt;ttm, &amp;ctx);
 	if (ret)
-		return ERR_PTR(ret);
+		goto out_put;
 
 	buf = drm_gem_prime_export(obj, flags);
-	if (!IS_ERR(buf))
-		buf-&gt;ops = &amp;xe_dmabuf_ops;
+	if (IS_ERR(buf)) {
+		ret = PTR_ERR(buf);
+		goto out_put;
+	}
 
+	buf-&gt;ops = &amp;xe_dmabuf_ops;
 	return buf;
 
+out_put:
+	xe_bo_lock(bo, false);
+	xe_bo_willneed_put_locked(bo);
 out_unlock:
 	xe_bo_unlock(bo);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c3836f6eab35..12457173ba85 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma-&gt;gpuva.gem.offset = bo_offset_or_userptr;
 		drm_gpuva_link(&amp;vma-&gt;gpuva, vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
+
+		xe_bo_vma_count_inc_locked(bo);
+		if (vma-&gt;attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
+			xe_bo_willneed_get_locked(bo);
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So at very top of this function I think:

if (bo &amp;&amp; attr-&gt;purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
	if (xe_bo_madv_is_dontneed(bo))
		return ERR_PTR(-EBUSY);  /* BO marked purgeable */
	else if (xe_bo_is_purged(bo))
		return ERR_PTR(-EINVAL); /* BO already purged */
}

Then delete the check in vma_lock_and_validate. I think check in
vma_lock_and_validate is actually wrong for rebinds too - e.g., it is
prefectly to do a partial unbind a dontneed or purged BO and the
existing check I believe would reject this.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed. I will dropped .check_purged from MAP and REMAP prev/next
      in vm_bind_ioctl_op_lock_and_prep() for v3. The check now lives in
      xe_vma_create() and only triggers when attr-&gt;purgeable_state ==
      WILLNEED, so partial unbind/rebind on DONTNEED or PURGED BOs works
      as expected. and PREFETCH keeps .check_purged as it is a separate
      check for existing VMAs with no backing store to migrate.</p>
    <blockquote type="cite" cite="mid:afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

We should put together a test for for this too.

addr = bind(2M);
madvise(addr, DONTNEED);
unbind(addr, 1M);

Assuming the current code fails in this test case and new code works,
I'd suggest making this patch a fixes too.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Noted. I will add a test case to cover this and include the
      appropriate fix tag</p>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,<br>
        Arvind</div>
    </p>
    <blockquote type="cite" cite="mid:afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

Matt

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	} else /* userptr or null */ {
 		if (!is_null &amp;&amp; !is_cpu_addr_mirror) {
 			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
@@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_bo_assert_held(bo);
 
 		drm_gpuva_unlink(&amp;vma-&gt;gpuva);
-		xe_bo_recompute_purgeable_state(bo);
+
+		xe_bo_vma_count_dec_locked(bo);
+		if (vma-&gt;attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
+			xe_bo_willneed_put_locked(bo);
 	}
 
 	xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c78906dea82b..c4fb29004195 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
-/**
- * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
- * @bo: Buffer object
- *
- * Prevent marking imported or exported dma-bufs as purgeable.
- * For imported BOs, Xe doesn't own the backing store and cannot
- * safely reclaim pages (exporter or other devices may still be
- * using them). For exported BOs, external devices may have active
- * mappings we cannot track.
- *
- * Return: true if BO is imported or exported, false otherwise
- */
-static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
-{
-	struct drm_gem_object *obj = &amp;bo-&gt;ttm.base;
-
-	/* Imported: exporter owns backing store */
-	if (drm_gem_is_imported(obj))
-		return true;
-
-	/* Exported: external devices may be accessing */
-	if (obj-&gt;dma_buf)
-		return true;
-
-	return false;
-}
-
-/**
- * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
- *
- * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
- * one WILLNEED, or have no VMAs at all.
- *
- * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
- */
-enum xe_bo_vmas_purge_state {
-	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
-	XE_BO_VMAS_STATE_WILLNEED = 0,
-	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
-	XE_BO_VMAS_STATE_DONTNEED = 1,
-	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
-	XE_BO_VMAS_STATE_NO_VMAS = 2,
-};
-
-/*
- * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
- * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
- * both enums so the single-line cast is always valid.
- */
-static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
-	      &quot;VMA purge state WILLNEED must equal madv purgeable WILLNEED&quot;);
-static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
-	      &quot;VMA purge state DONTNEED must equal madv purgeable DONTNEED&quot;);
-
-/**
- * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
- * @bo: Buffer object
- *
- * Check all VMAs across all VMs to determine aggregate purgeable state.
- * Shared BOs require unanimous DONTNEED state from all mappings.
- *
- * Caller must hold BO dma-resv lock.
- *
- * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
- *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
- *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
- */
-static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
-{
-	struct drm_gpuvm_bo *vm_bo;
-	struct drm_gpuva *gpuva;
-	struct drm_gem_object *obj = &amp;bo-&gt;ttm.base;
-	bool has_vmas = false;
-
-	xe_bo_assert_held(bo);
-
-	/* Shared dma-bufs cannot be purgeable */
-	if (xe_bo_is_dmabuf_shared(bo))
-		return XE_BO_VMAS_STATE_WILLNEED;
-
-	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
-		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
-			struct xe_vma *vma = gpuva_to_vma(gpuva);
-
-			has_vmas = true;
-
-			/* Any non-DONTNEED VMA prevents purging */
-			if (vma-&gt;attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
-				return XE_BO_VMAS_STATE_WILLNEED;
-		}
-	}
-
-	/*
-	 * No VMAs =&gt; preserve existing BO purgeable state.
-	 * Avoids incorrectly flipping DONTNEED -&gt; WILLNEED when last VMA unmapped.
-	 */
-	if (!has_vmas)
-		return XE_BO_VMAS_STATE_NO_VMAS;
-
-	return XE_BO_VMAS_STATE_DONTNEED;
-}
-
-/**
- * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
- * @bo: Buffer object
- *
- * Walk all VMAs to determine if BO should be purgeable or not.
- * Shared BOs require unanimous DONTNEED state from all mappings.
- * If the BO has no VMAs the existing state is preserved.
- *
- * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
- * VM lock must also be held (write) to prevent concurrent VMA modifications.
- * This is satisfied at both call sites:
- * - xe_vma_destroy(): holds vm-&gt;lock write
- * - madvise_purgeable(): holds vm-&gt;lock write (from madvise ioctl path)
- *
- * Return: nothing
- */
-void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
-{
-	enum xe_bo_vmas_purge_state vma_state;
-
-	if (!bo)
-		return;
-
-	xe_bo_assert_held(bo);
-
-	/*
-	 * Once purged, always purged. Cannot transition back to WILLNEED.
-	 * This matches i915 semantics where purged BOs are permanently invalid.
-	 */
-	if (bo-&gt;madv_purgeable == XE_MADV_PURGEABLE_PURGED)
-		return;
-
-	vma_state = xe_bo_all_vmas_dontneed(bo);
-
-	if (vma_state != (enum xe_bo_vmas_purge_state)bo-&gt;madv_purgeable &amp;&amp;
-	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
-		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
-}
-
 /**
  * madvise_purgeable - Handle purgeable buffer object advice
  * @xe: XE device
@@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
 
-		/* Skip shared dma-bufs - no PTEs to zap */
-		if (xe_bo_is_dmabuf_shared(bo)) {
-			vmas[i]-&gt;skip_invalidation = true;
-			continue;
-		}
-
 		/*
 		 * Once purged, always purged. Cannot transition back to WILLNEED.
 		 * This matches i915 semantics where purged BOs are permanently invalid.
@@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 
 		switch (op-&gt;purge_state_val.val) {
 		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
-			vmas[i]-&gt;attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
 			vmas[i]-&gt;skip_invalidation = true;
-
-			xe_bo_recompute_purgeable_state(bo);
+			/* Only act on a real DONTNEED -&gt; WILLNEED transition. */
+			if (vmas[i]-&gt;attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
+				vmas[i]-&gt;attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
+				xe_bo_willneed_get_locked(bo);
+			}
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
-			vmas[i]-&gt;attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
 			/*
 			 * Don't zap PTEs at DONTNEED time -- pages are still
 			 * alive. The zap happens in xe_bo_move_notify() right
@@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 			 */
 			vmas[i]-&gt;skip_invalidation = true;
 
-			xe_bo_recompute_purgeable_state(bo);
+			/* Only act on a real WILLNEED -&gt; DONTNEED transition. */
+			if (vmas[i]-&gt;attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
+				vmas[i]-&gt;attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
+				xe_bo_willneed_put_locked(bo);
+			}
 			break;
 		default:
 			/* Should never hit - values validated in madvise_args_are_sane() */
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index 39acd2689ca0..a3078f634c7e 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -13,6 +13,4 @@ struct xe_bo;
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
-void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
-
 #endif
-- 
2.43.0

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------58pSGEOyDNjKcadcyXr9V0aH--
