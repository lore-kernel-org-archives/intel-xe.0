Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC4CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0375210E45C;
	Tue,  5 May 2026 18:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOSxFwHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15AD10E45C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778007100; x=1809543100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BeT6fpHb73/6Z9hyAYtMcsjS2i3+9oTI3pcGYL9XD/Q=;
 b=DOSxFwHnCYeie3LmR3HX4s9BnM+/VNrpdQ/iEnTDvRmQnlmIHHOJj5Qn
 6Tnb5rG0yiDhlJxj42N/dHPaTPRRiHDSd4I7zD2o+/kUgX7Adsgl5ui7J
 kzwgHHVIPTTJ0DzlL+uAGiDfQkEIFTHcx9powxTTOMdV9a2bYXwL6w4Tn
 AOoEhmHQNE9bcyT/fVLQF8Eg+j8BM5ODB6Hg0RvHKh8UgpQwd9v4uRTJs
 fd6pAbTM5TaTdbMe+zpcap9tx57QgOESrT/9ekPJoLz3Eb5fQ+gjUxcp4
 u2FSWCtMsHnNnXDWpn3Y/ux3cvbET7++193QnF/t4qxoV8C7uTARimETr A==;
X-CSE-ConnectionGUID: Q9q3bonaQc6AQPC71eVI/Q==
X-CSE-MsgGUID: GI9bvua4QBCXAMr2X59e9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104343076"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104343076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:51:40 -0700
X-CSE-ConnectionGUID: rY66VZeTQHmvouvkGHvKWg==
X-CSE-MsgGUID: dq/aUHclQ1qK1dcJuxnZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="266233477"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:51:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:51:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:51:39 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxF+9D8NmHJXFM9qbzEuS+1Wlybj4x/Li93A13OZDM/S3bXeYy8O1c8T+B3d0t2ieEJsS0fjl7HYu3Di9Iuss8KCYAV6DGsx6QEtEUXwOQ8B6LknZ4oDcASo+mj+QfyPzANtRinYXATt4awLXgGjSdUKtieVP7I3Late55ZvjsgdO3mG+NbQ2h3v8n/InXdbEYHWfMLcp2GIMWWA+qmmON4nUy6qsp1mqTEykias0c1s/AGTjOueMaiCBo036ayX9NfDRx8TDrTqRpW7i5/PJu+Bh5LQFR3llJqshFrdz1Uojp1mKp6mhVzZ8cveSupAPTIbW0MNjzL9rYqyM4Edng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw3hT5dEINzWJKGA2TwYmckmW5C1s7Vwk2NH6yqIMU8=;
 b=avn3QQ19dXVCbycoJX2b4J3I/zXpkuGdwajhfaTeH/gVAtb5rUmpL+I2Kw4bVrallEq/8/w+Hz8UECFBUbX8HZB4J55SYHv6tM+vTqXS1II6QgTg90mv36yPjk54Yr0zCehLSTezaYbm5qzb9nMg6h+CVplIK95gYML/CV2mSAAFI2YUDHB0GWVEdb7b3W7UyE++0NwV4WX8h1iPBboix+KB7wAUXCHs6o7wfZQK8myCDI0iX/m80WUjjTISXtiKyecVdlJTeR+JxZM/79xoDV/dXllbjxneNDqeoEAQLkVQX3VfM/ZwmYG6zu2tAKPtfqrT9bV87OoFQQ6pRPMURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:51:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:51:37 +0000
Date: Tue, 5 May 2026 11:51:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 3/9] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afo8Nb87noZPWK9D@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
 <afloAo3OMhrZxVMK@nvishwa1-desk>
 <afo4axPANAfvgzW7@soc-5CG1426VCC.clients.intel.com>
 <afo6ru4u83dDRJFC@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afo6ru4u83dDRJFC@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 695bd9f3-944d-4ae8-1b2f-08deaad7560d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: TtzA/W1xn+R8eyckICunMDNo8mY9YMQxDAVrl+y5VhVvrr2kq//yaxDNAVUTIABZVHShmA54EFkVfhLPV2N+HOtfJGbLfHnRnDLvTnd6iKNQNzOZE8Mx4ZEh2o7mec07pHLq/DWlC6LwQDzFfRMCf6E2VkjrGF2ZDulGQ8WKm0HkVtm0vyTUdWKAqZeBRSHaWPnho9FzWlW64csCO1oCKRQOFns8E3EMC7BatfWDIE7WyOLSV0mowJ8ZRkvgpdJnlYww0yUvnUi9/IsnU2AR9oLxmzSQRt9ydApcyoAUe2gIP3HQWFcTpZeFbvKNAo4zzSeOquslUbHac6c01NcFkutJF+aZGeJiY0DWW5GswmKRDb1g6jnCXnQNxyEEGGt3zq/HYdIH+mye29sD4fvqMWx9oGkfAxCetjswAeUCGg5OrBc7u7p7Jjej0cfroewjku5DcG7yJO5DbMlr56p6qnAHO7UX7gBQm76pb2ZCAmxYLoIfn8XnpQQc2CHmtWFrs3BZsDlPSTeqhGw01YIoZbi+j+uyYrC2rDYn24GyLpqGFnfhhJbjjFlbcBqBpAvitKSQFtnzW+uCymu/5uCRj2ntVWnZojvYTwAbxj1HcLWodW1yIPJC+J+o1OM7AIlCrmfsMmir7pup3S0ZtN3yFJeGJwtGC5GqnyPsdPgOaJg3Fh1IoIyJ026JZaQqx387
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFUrVGtQeG56ek1UZGhIL1hndEY4SzVtMXBYWUNxYUJFRHMvblNwWExUUHVm?=
 =?utf-8?B?bU53Z3NHNnR4QU5lalRPVjFiRUVtNHBVRVhWY1VYd0pueTNteGRnSVBubDh1?=
 =?utf-8?B?YnRSTmcwYWZTVFJmMStvakJSMHFjSnQ5YzZZZENHN2I1a3Y5czNDRlJhL2d1?=
 =?utf-8?B?RFprNGlxT05UZE95dzVoSEM0b3FOZ1FqNHgydXBMR20yWTFqUVN3VHdQWGFl?=
 =?utf-8?B?VDA2UFRZdExZL3lmV0VhT0I4b1ZVRUREbUtLUmQvb0g0V2YvS2FxaUFCSUM3?=
 =?utf-8?B?VHJlWjZaRm53bmd6R0dzaDlodDRsUHRuZzJvRERuaWp3bHh3M2NVQjhwTmJJ?=
 =?utf-8?B?SXIrR0V6QStMY1VrZnVKQXpHK0RIWVFCQkJ4OWo2TWNBUTUrcU9Fa3NFMmpT?=
 =?utf-8?B?M1lHdXVGMDlzMGtJVEJUMTRTa2tBZmJablNUSkJrSUt3YURZTytRY3g4Nm54?=
 =?utf-8?B?djkyTWJKcXZBRE5DZXMwSEVOTlpoZ0tqK3FIT1FFbHhrL1JRamxmMW9LRjBR?=
 =?utf-8?B?WHpLUkNSRGxIaXAwWFBzRzgvYWpHR21oRTdwL1Q0dWZBLzFiTUpOcWpHWldq?=
 =?utf-8?B?NnIxUmZQcTNWTjQ3Z1lFKzZWK0hxb2R6cC95a2o0NFVJTFFla2tFMGNQVnlC?=
 =?utf-8?B?bndBR3hDaDZCVTJMZ09wNS92S09BU3NhVzZtYlBHeXRkK3lPSVlvL1UrYU4w?=
 =?utf-8?B?WFJhaGRWY0FKRXhZOFZTSE5GN1dKTVhCbVR0QVZralZrc3FFWEI3SXYvdlJT?=
 =?utf-8?B?MnJJVlA5Zm5KTGdmL1JvRGlzV3BRekM3S0hsSmg3OTVwN3YxdDRKeExldGx3?=
 =?utf-8?B?V0dlK1F0bnlWVzZHQnVSUHlYVElqcTA0ZXgvcG15UWdaMy9xWVF1N3h5Qllh?=
 =?utf-8?B?aHQvbWhNRHdIS1ZHQ29UVmNaN2tGWmJxQ3pRcGgzOUgvcjZDYTVmdlBtTW9K?=
 =?utf-8?B?TzVMZjUvaG85YVV5aDVEeTRCU0REc0Ixa1VwTUs1akRFeDVRazdxWnlRUHg3?=
 =?utf-8?B?ZUQ2Y3NuZkRvVTBnNU42QTJwaUJxL1R4dXJHcFRWOE8xVDRaVDlHSXJKMmpq?=
 =?utf-8?B?eVFIMUh1SUNGUEVxbm4rRHFVZ3ViOWdjcytId2NBUHIxRVM0ZGVDNEpTZWpC?=
 =?utf-8?B?NjhWZzk0K2VMMVFHUmt0SStkWm13WUlWUGg3VU5xNTU0dldJOTNRbk5zbWVo?=
 =?utf-8?B?Um0xS2xwcHk1NGJtMlU2SEdONTdVRWFBY3p0dTdzcjZQK29YWjB1dmNSa0pm?=
 =?utf-8?B?c2hJQVdNK2UzbjVzK0RXaW5yek0ySlJJMHA0REhLUW40Nm94cE1hZFh6ZkYr?=
 =?utf-8?B?WWVQSlVKMURYY3hrcEZZbCs4NzVoTnF0MHZVNVBCZW5FWDlOd3htdVRRazYx?=
 =?utf-8?B?ZkZObXZRd1htQUlqUHlhU3lWMEl3UitNWlNGSk92eUtTR3RhREVkZm04cFE3?=
 =?utf-8?B?RDNnZHIxdGJuZVNNbzJIL1ZHRjdVK0tGT1NMZ1lNY0swRzg5QUJKRUFHbWhh?=
 =?utf-8?B?U28xaG5SN3RSbS9vQnRZcVF6bHlKS29FeUU4ZVVkc0J6NzZ4NGtiZ2VTR09O?=
 =?utf-8?B?VlJEd1pzdkVIZTVVMWhReEsvTG5rNVhQNFNCaTVDWUpOMWZxYXRHcXhSd25m?=
 =?utf-8?B?V3V3VDE2d0FacFhMSHQxUCtKSWNHdiszRVlaZHVhSUxRLzhyQjFBWnJtbUZE?=
 =?utf-8?B?MXJMTHN4aXBBRzMwSDhlblJtTHZMcm9yWEVOZkFIWmRCczVIdzFhNndEOVI0?=
 =?utf-8?B?Q09Jd3A2NmNSSTlmUWx4Z0c1cW42U280bVlTSVJML0dLTkFmOFp3bjNxbWtF?=
 =?utf-8?B?STdnd3VnLzVXQnIwUXJqdEd5amhYK1ppNFJnazdRa2NuYUNhYXRIRDlWQk0y?=
 =?utf-8?B?QWs2ZnpqREgxdlJRd1lPU1IwQXhjWkJxY2haTHVOUWRkeTN5RHFCL0JTWGdU?=
 =?utf-8?B?YmdWcTVoOW1MenZOUzJSUWZHTVlPN2VwblRpNUtwWEVvbGlYZ0h1UjZrckV2?=
 =?utf-8?B?TFVYR3lOQlF3WWJ3Y1R1WVdrSGFMOWNCMmJjM0VFN29icTNQMGsyREtvRk4v?=
 =?utf-8?B?N3lIa0FvT1g5TXZZcWJmdEZMcWl4WTN4cGI2V0NMNDZTTEd2Z0MzQktUS2RL?=
 =?utf-8?B?endweHo2eXQrS256SUpKVmhadWUyN0RNbThxUTNOTnhQd0J1ZW5WQ2E1ZERG?=
 =?utf-8?B?U3VaZkRWTWtlV2hqK3U5M0plVXRqdUJ4UHpnbkhjZS9IRHFaWW1oT1M5RVIw?=
 =?utf-8?B?QzErMXlOL0VtV3djWkswMkVhTzV6ZUZhdTVaaGhHUDRGS2k1UkFWRW0xTFRR?=
 =?utf-8?B?ZDUyZWFsaUFWSVdyR1hhV0RjM0tIWWJvSDkyUUdnam0xSlF1aUsrU3ZpcjJh?=
 =?utf-8?Q?Xsja5RnA3jUq7bwawoTVGjObxVqK2he17xB4n?=
X-Exchange-RoutingPolicyChecked: LMjR0p2KEuRv7wrX1c8lu49OtLgtYCmEKYHHueKLFf3KM9GHb9FU74lNepzcofqtpGe13h8pExWExSXho++aZQh76Cg06DmkZhD5DOhtAuFQQ/aRLOPywQwxlSD529kjJ01rm4ElD/uyPnDyE0uMk+0lzQYW7QTzUYJDzzLZqfZcyNLVFe+aYIIWOnK7O0jd4xj3uCaB3vsuLmDUuqpBMj2emdM7d2+Tuknzt4IPUTEH7Le0yb4uJol4JXIBatpvr/eNFfwlu8TTXvbuhtZ6/4yHm57GdjY4ZUqc9t4b9Z58ZZQ1VATTWWq8UibQwDt/sBtFeWjiB32c0WTWxS7ubw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 695bd9f3-944d-4ae8-1b2f-08deaad7560d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:51:37.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I93KDUDxE56sA+Bx3DzNQ2n17W83NN1cqYB6fh2sVyozQkyS9YG/X07j3ZX1Cv0r44wTjBjIVZd1xcAo6c9XfYBryBfmV21s+7s4e8u9D/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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

On Tue, May 05, 2026 at 11:45:02AM -0700, Niranjana Vishwanathapura wrote:
>On Tue, May 05, 2026 at 11:35:23AM -0700, Umesh Nerlige Ramappa wrote:
>>On Mon, May 04, 2026 at 08:46:10PM -0700, Niranjana Vishwanathapura wrote:
>>>On Fri, May 01, 2026 at 05:53:36PM -0700, Umesh Nerlige Ramappa wrote:
>>>>Given an LRC belonging to the secondary queue, in order to check if its
>>>>context group is active, we need to check the LRC of the primary queue.
>>>>In addition to that we want to compare the secondary queue position to
>>>>CSMQDEBUG register to check if the queue itself is active.
>>>>
>>>>To do so, store primary LRC and position information in the LRC as well
>>>>as take a reference to the primary LRC from each LRC in the queue group.
>>>>
>>>>A note on references involved:
>>>>
>>>>- In general the Queue takes a ref on its LRC.
>>>>- In addition, for multi-queue,
>>>>a. Primary Queue takes a ref for each Secondary LRC.
>>>>b. Each Secondary Queue takes a ref to the Primary Queue
>>>>
>>>>In the current patch, each LRC in the queue group is storing a pointer
>>>>to Primary LRC. There is a small window of time in the primary queue
>>>>free path where the primary LRC may be freed before the secondary LRC.
>>>>
>>>>__xe_exec_queue_fini(q); // frees|puts primary q LRCs
>>>>...
>>>>window where secondary Q LRC is pointing to invalid primary LRC
>>>>...
>>>>__xe_exec_queue_free(q); // frees|puts secondary q LRCs in multi-Q case
>>>>
>>>>In this window the reference in Secondary LRC is invalid. While there
>>>>may be nothing accessing the secondary LRCs reference, to be safe, this
>>>>patch is taking a reference to Primary LRC from the secondary LRC.
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>v2:
>>>>- Store primary LRC instead of primary queue (Niranjana)
>>>>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>>>>- Document/Revisit references (Matt/Umesh)
>>>>---
>>>>drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++++++++---
>>>>drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
>>>>drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
>>>>3 files changed, 33 insertions(+), 3 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>index b287d0e0e60a..e34601d28520 100644
>>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>@@ -129,8 +129,14 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>>>		return;
>>>>
>>>>	/* Primary queue cleanup */
>>>>-	xa_for_each(&group->xa, idx, lrc)
>>>>+	xa_for_each(&group->xa, idx, lrc) {
>>>>+		/* drop secondary lrc ref to primary lrc */
>>>>+		xe_lrc_put(lrc->multi_queue.primary_lrc);
>>>>+		/* drop primary queue ref to secondary lrc */
>>>>		xe_lrc_put(lrc);
>>>>+	}
>>>>+	/* drop primary lrc ref to itself */
>>>>+	xe_lrc_put(q->lrc[0]);
>>>>
>>>>	xa_destroy(&group->xa);
>>>>	mutex_destroy(&group->list_lock);
>>>>@@ -275,8 +281,15 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>>>>{
>>>>	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>>>
>>>>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>>>>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>>>>		q->lrc[idx] = lrc;
>>>>+		if (xe_exec_queue_is_multi_queue(q)) {
>>>>+			struct xe_lrc *primary_lrc = q->multi_queue.group->primary->lrc[0];
>>>>+
>>>>+			lrc->multi_queue.pos = q->multi_queue.pos;
>>>
>>>I think q->multi_queue.pos is not yet set for secondary queues at this point.
>>>It is set later in the xe_exec_queue_group_add() call.
>>
>>Hmm, I recall seeing that a while ago and that's why I leaned toward 
>>having a lrc->q (back reference to the queue that the LRC belongs 
>>to, but that's prohibited). Anyways, I will try to move this logic 
>>outsize to a late point then.
>>
>>>
>>>>+			lrc->multi_queue.primary_lrc = xe_lrc_get(primary_lrc);
>>>
>>>I think we don't need to get/put the primary_lrc reference.
>>>Each queue holds a reference to its LRC. The secondary queues holds a reference
>>>to the primary queue. So, essentially, the secondary LRCs are holding a reference
>>>to primary lrc. So, I think, we don't need to hold reference again.
>>
>>I would look at the queue and LRC as different objects in memory.
>>
>>In taking a reference here, I am addressing only one specific corner 
>>case:
>>
>>- Consider all secondary queues are freed
>>- Since primary queue holds a reference to all secondary LRCs, all   
>>secondary LRCs are still in memory.
>>- When all references to primary queue are released, we end up in   
>>xe_exec_queue_fini(primary_q).
>>
>>In this function the LRC for primary_q is freed first, and then the 
>>secondary_q lrcs are freed, so there is a small window of time where 
>>the reference from secondary LRC to primary LRC is invalid. IMO, 
>>that small windows of time is enough for strange issues.
>>
>
>By that time, all secondary queues have been deregistered and destroyed.
>So, there shouldn't be any secondary LRC trying to access the primary
>LRC. May be we can set primary_lrc to NULL while releaseing LRC reference
>which should be sane enough and we really don't need primary_lrc reference
>taking.

ok, that's right, I will drop this reference and update the commit 
message.

Thanks,
Umesh
>
>Niranjana
>
>>Umesh
>>>
>>>Niranjana
>>>
>>>>+		}
>>>>+	}
>>>>}
>>>>
>>>>/**
>>>>@@ -388,8 +401,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>>
>>>>			xe_exec_queue_set_lrc(q, lrc, i);
>>>>
>>>>-			if (__lrc)
>>>>+			if (__lrc) {
>>>>+				if (xe_exec_queue_is_multi_queue(q))
>>>>+					xe_lrc_put(__lrc->multi_queue.primary_lrc);
>>>>+
>>>>				xe_lrc_put(__lrc);
>>>>+			}
>>>>			__lrc = lrc;
>>>>
>>>>		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>>>index 97aef0327fc8..3d0bf4a7bfa0 100644
>>>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>>>@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
>>>>	return SZ_16K;
>>>>}
>>>>
>>>>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>>>>+{
>>>>+	return lrc->multi_queue.primary_lrc;
>>>>+}
>>>>+
>>>>size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>>>>size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>>>u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>>>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>>index 5a718f759ed6..0a5c13ec2ad7 100644
>>>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>>@@ -63,6 +63,14 @@ struct xe_lrc {
>>>>
>>>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>>>	u64 ctx_timestamp;
>>>>+
>>>>+	/** @multi_queue: Multi queue LRC related information */
>>>>+	struct {
>>>>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>>>>+		struct xe_lrc *primary_lrc;
>>>>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>>>>+		u8 pos;
>>>>+	} multi_queue;
>>>>};
>>>>
>>>>struct xe_lrc_snapshot;
>>>>-- 
>>>>2.43.0
>>>>
