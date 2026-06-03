Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68906CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F031122A8;
	Wed,  3 Jun 2026 19:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5vupF69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70A91122A8
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780513221; x=1812049221;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kpTTqLfsIOCdQk9hge1/1fwO1iDoQpFRcGdiuELS6VA=;
 b=f5vupF69rXkwrqhwTAnn4JYmOquqRx+EAZqF5Or5RQjC9le7aid/TZR+
 0GXmwF4CQAl+CCr1Qwdgc5gXlBNSucvl+tYgCsUl2mOGooHeDpajWMF+u
 hH8ZoFhw0xnjJGypTzHECT9v2Y56IpBUzgehZNvZbxRUb0dSuKqBGYEgH
 8KAlRlmBPjGSDbxkBArkWTtFTAjkBmrjZw9KOgpWK3WDLX/RRZ0awG1by
 OVNOLcgsRS22SzTOeBPa8ZJQfjjaoVsYOYZDre0gc6CFSNOrQiBJKCs8l
 rkx9ZRJXVCkQwqr/2Vx6XE8S27x5WyFJkDPsOUWsKYimj5lV/6LXOJaXq A==;
X-CSE-ConnectionGUID: 7GyVonT9Re2OrGm6O3r91A==
X-CSE-MsgGUID: r99pltOqR/upcGTA1J7SFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80476422"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="80476422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:00:20 -0700
X-CSE-ConnectionGUID: Ha0RvPEFSiaztmoqP8yxjA==
X-CSE-MsgGUID: 1d5WVQPeRUqGcJbmsSDOkg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:00:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:00:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 12:00:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHAlFakgLpTW5gnrOuNK3BzTFsT9YxZTmkvXYXq395tF6LR/vQ9/rQPthEJTRKz72p3J+0/xMA/RO8P7acN0bE+VEP3ogUAbriVdJ6NwzKPZsp+yfSyDXJa0UsTn44uU3CaabGDArkayYf8OFV/FEs+VTfLaqWLFzHNUL0N2UcJYnJc53iO+Q7A5MqZU2Cm83AG3N+wQnlDAYTrG5VknyI2kk4aY1CtgWihmbUcOjq0sIqHTs9FRBcysqlgD/aCnRNSvGTs7QVH6RbWmB3pDSzBPTbn8imer8/OA+7JWFVjp2p1Mg6QpzU1eRZpvINGLwrSHZNRCt2gonSk4ROcrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7Tm8vKEyll/539WofqajBwx29x4G7mQoPVkGxzSRAk=;
 b=m24AXzRVhb/nhUaqbXpSA8XqEOnj8JmhNTi6O/3zLDXu/+VoCqwp0/BmaytGh24wWOx14OdVy19j1OupfyjTnzlwsEAPd32iDdSZltbs/rim8QWaNsN+jdcHSW7peFnRZUrpaJ8SVP8I0XSesxlR/HI7SJJz7AgGY9a0N7v72Lb8SK8ahoWpwETW+gUgYX0WNdWKMZ59ZKZhuHaKOp0wV2vCIvHahFShBZcaRqa5kDRm3dwkvhPUInuIGiupqqNwBWu7JGOwSUEFVkmzzc41xgrGWtyByBrZIm+CTVCzaNztxw3mBfnyQDBjHE2l5QfNOa0EXo9cbzuDr1fyFwddng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA1PR11MB9658.namprd11.prod.outlook.com (2603:10b6:806:4dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:00:18 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:00:18 +0000
Date: Wed, 3 Jun 2026 15:00:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aiB5vKto1zWv9S8B@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
 <5f49eefd-a984-4d96-875a-87173a99a775@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f49eefd-a984-4d96-875a-87173a99a775@intel.com>
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA1PR11MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: f975f6b9-b221-401d-5907-08dec1a25a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: RAg7IGYeYscSBig4VruFl9xEAmMKNI7RlXjn4aCkHYSvZzIm6gacGkWsJl2l2skgWzqgIK4eFBAlRH0UIYJQI0Z8qj3rFot4W8J45WBlIxjP94DlQbZwJvn6LbksehWLr7UpBuyYr3y/CS5FSpVTW4Bov/PQm+pY9ktE6rfRFQDk+zmP8nO1lQWlaE34hxpbvGHiGl5HjdQAFyl/eltAE2jqU3/BLyb5W1z3dD+qLVqmMgquQgiINj9NQ9UP7fgK5w6SNMMPJLgkQxhoDB8nOrr6Uyzmo/D+1mNZNJr8/KI2FySYoBtadJijcobfz5IXYk4FB4BKQ0pvcNalWshOw2hldV+bFKO1y2CPkiOBVnFqglCZ3uBmn0wYr12L0UrpASj7nemXIVPBtfB7Ce0mMy14muotU2zUKoKEN/viNXBhsmTLNFDa8YGVMw4GMzeWxq8C63C2EoeD1QJHdVSz6TCcR+aQtCgZawWsSaP8GW/u8bbF9ElyIcVtE0uSQ1y9vlSzSZlxy/caIx7ToDPJdQYSDNzA3mLqgzQ3CcJaFS+HQ9ZeqswpN1PBQyC4j4V/6Be5nNJLPHezxbEDzc1hVCpI2W+ExHU/cRB89nVV8mx91hgrX/pWdjdjZnjSLIKyq72LJUTuC2khYUNgavE1ppMLB0d5WzyhN8aHaWV8pIuKkuUfloZdzxv3fX3BhQx2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dks0SFk5aXdUV3V3V0o1L2JjdDFPd1ZRUjJDQVQ5ellJMm9PczFTU1NsVmdC?=
 =?utf-8?B?V3Jvb0ZNTWRzOHRTSkFlZTJDaXdMdTlwdFdneUpOTnhUazVCY1NpZ0xHQ01y?=
 =?utf-8?B?UVFQZXZyU1RpN25ab1dZS201RXVwT2dFbnVFbCtkcXB4bVUzVUNtMVR3d0E4?=
 =?utf-8?B?Tnd3UUVqdURFY004TmNMSkRPeDMwYTE4aS81eDF1VUNwK1RtQ1VWRlFUVE9J?=
 =?utf-8?B?WTVzTXJSdCtsVGJVRWVxSjNhMWpLcVV3VlB3WkhpUUUrRzJvS0YweS9neUNz?=
 =?utf-8?B?NkRIeHhLanhGZFVZb3NJUm1USE1ydjhrNjFwazV5Q3RyWk9uNXNYN241Qlpl?=
 =?utf-8?B?cVdEZ1VwTVlnWnZRN0dWTisxcXNJT3dwWmZwV3U1eUw5L0ovL2ZzQmZYMGlH?=
 =?utf-8?B?NTRtT3VQNmY3VEljQWNHQ0tyQnhKbzd2RmFaK21kTEh3N3RmUTJ2RVkxb0Rn?=
 =?utf-8?B?QzB1NlhSTDNUNitJQ2Q2c1dCQ3cxVW9tMytwOEZUMlFaV3VxZ0FuTjJRTjlw?=
 =?utf-8?B?cWtKblRrWWkwZzYrZDEzbkpEZFpmS3ZYSzZWd3ZpTlRUUEk1OVZOcVROK3da?=
 =?utf-8?B?ekE4bTMvYlZ3WC9iS0pHZ2RHYzRQWWFzSlhlN3FRcXJHaGptRHJPSUptZVhu?=
 =?utf-8?B?UTFnNDFKazNOL3hIZDNuMDA1TFZaN3FyMFpDSTVQUFltdHl0MHQxRUh0N0cv?=
 =?utf-8?B?dGFzZTg0VEplOWxCVVlvdGZqSHFMK1B3YWtJUUJjTmpLY0tYVW9BU05yUXNO?=
 =?utf-8?B?ajh4bUNCR1VYUEM0SG9hVmorcVp3dExsVnlkV0hEZG9kTStiM3I1Y2I4NjJE?=
 =?utf-8?B?T1pxYVpVckVTMmE3WTd2M252QmJ4L28zNk42L2d5TUhxVUt1VytuQXI3Ujlo?=
 =?utf-8?B?OHp6eC95ekxDc1JrcUhyWmVWYnhrVmU4ek1wTkZVMmlUZXVJOVZpNjRRVGt5?=
 =?utf-8?B?SEROUXpZSzRsb3pVNXljakJQeG54cHNUQ2VUTWhaenh4d0ZJWU1uYnl4dGlm?=
 =?utf-8?B?MWY0WEFSbWhOOG9TZ251NDNUa2pkL2VjUjhaK2dDL2JLM0tFTGFQMWtPdEgr?=
 =?utf-8?B?dTNSOUF2c2FodXNGYUtOd0h5L1ZDWWpZYmVwN0pMNHhpQUp6VEdTSFBuamtM?=
 =?utf-8?B?cVc3dVppOFpXTVZZOEFKZUJiakNDVUp4UFJnZEQ1WXJESG42ZDI3MGxMRXNp?=
 =?utf-8?B?QW4xNUc4MGFPZzFKRWppVzJpYTJDVXNXbTVPa05vWEJkSzlHUlhPQ2NzUE9r?=
 =?utf-8?B?NnI5NDJiQ0o3QTZ6YjU5d0lSS1VJS3FlazhQQ1lLV3Rsc1BTY0NzVzJ2WE1G?=
 =?utf-8?B?amR5Y0ZETUh3SHpqZkdyMHd5ZHNTaW1jdExGbUgvTjhoZFZMeFoxdEw1TkE5?=
 =?utf-8?B?K1IrbkZsNHJobzE3ZENoMkVHRWpjejVrRjZUUCtCWUkxN2N6YzRDcjRJbVBa?=
 =?utf-8?B?ci9KOGhzYWJDWTBJTFNidFlHbXNkOTBqR1V5cnlPbVZhL3ZERGdnNkNXalJh?=
 =?utf-8?B?Q2dUTzgyNWVEWStsM092eTFEakp5bDQ1Q3VvUVR0aU9MelpXcnVSZmFlaUd5?=
 =?utf-8?B?MkFVcnlXU0JlczdlQjJJcFJVTUNYdit2TVpjTkdkKzllRnRCTWc0ckZSTnR4?=
 =?utf-8?B?MTNJTGhyaWRFM2t1eWJaWFVhZlZGQjRvL21zZDFBV1FWNit6S0w4SG9UQ2Ji?=
 =?utf-8?B?VjlDTzVwdHM0MDZ1Q0ZIZktNZGtuS1djcjFtNFYrV3J5enY1TFdrOGxuMFZm?=
 =?utf-8?B?dWxianowYVJFeW9WaXlDTk05akRsRFdmRllOS2s2NFRpRkhKZXlucisybU9h?=
 =?utf-8?B?OXVhOWtOZXd6ZjdZT0dkSlhDV2l2WlNWYXY2UEdKTU9PSUE1MTN2ZXJ3bWdZ?=
 =?utf-8?B?SnFDNkZIbWtONlBDcnpPcGdwRnBSUGNTZUNQbmMyVG9vNndDcXZLTlNhT3NH?=
 =?utf-8?B?VE5oalpZQ1RnQ0xSOFE2aENGcG9qNTh2OEtuaFhOWHFXZmhreVpoQ3FLOHgx?=
 =?utf-8?B?WWRZSFkvV1p1S091Um5qcExQVGFCR2M1NUtKZTdMSTNqcHcyb3VNVnRad2xp?=
 =?utf-8?B?K3RKOU1oMzRVZ1VpT0EyOVhNbWlPYzhDMFZOWk1FYzNsVDl3TVRRWkYyRnFq?=
 =?utf-8?B?NkpGNDJKa0pKN0lRYm1MNTZmUFAxbGJKUThmcTVWMExDcC9YY2FrQ1FYZWN6?=
 =?utf-8?B?UkZ6NnA0OWs5Q1FNdmE4MkFDYnhrTUlJcEJPalJSUU9GVlpGTVZtbVJhbm91?=
 =?utf-8?B?VHdjNGRpbVgrSXNPWGdlZTRBb1lVa2lyck5sWVZJbWV0UkdrQzFBK1VyeUk3?=
 =?utf-8?B?RmsvZldMM3dWTC9NSmtpSGpEUGRic2FkdnkycXN5OHJMSVZZdmlDQT09?=
X-Exchange-RoutingPolicyChecked: NW8rAcgICoSDUc0QdJgm28gWbWMYn9rmJ7wwgcvInXcx1F+/43sOWrYU7AbIVpTu0dLEMZUrYXCQHKitU8+kAFK+JFXot1fDv26alsjtBfWExbixeahPV0GbHO03LYMnUYDi4IPVlKhbb6YCT+dAdOrExljryLxGq74tvKjZ4aGZqWFseTR2P7PJXFJ7MQMJw4Wl6vAAjAXKmDHVB/LKhsxsRip5sX97NIDj/wMlCRt1xtlDoe40OvjRuKUL5glkPdvCJrL8VFTXtZq7ACrivy+2VYIGjpPeGzvxFitL/E4SswGeMK9r0pkx5xObdmgq2qpQ2fIBT57EF7AnVwLxSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f975f6b9-b221-401d-5907-08dec1a25a55
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:00:18.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQ0PscgtqsjNf/3ZLnV/Oz9ZGkb37GtQP1L7kWEuOTeEc7SWYshxa1vz3qpHZKYTaG2bcTtydpgZVO61coz6dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9658
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

On Wed, Jun 03, 2026 at 10:01:39PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 03-06-2026 20:31, Rodrigo Vivi wrote:
> > Jobs that GuC never scheduled were silently errored out instead of
> > triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> > should wedge the device rather than silently fail, and userspace VM bind
> > queues should stay permanently banned rather than being reset and retried.
> > 
> > The queue is banned early in the timeout handler to signal the G2H
> > scheduling-done handler so it wakes the disable-scheduling waiter; without
> > it the waiter sleeps the full 5s timeout. For kernel queues the ban is
> > cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> > after the GT reset — a banned queue would block resubmission and cause an
> > infinite TDR loop.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
> >   1 file changed, 22 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index ab501513d806..bbccba367626 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >   }
> > +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> > +{
> > +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_suspended(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> > @@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >   			   q->guc->id);
> > -		return xe_sched_invalidate_job(job, 2);
> > +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> > +		return true;
> 
> 
> Sounds sane. But Will also need clear_exec_queue_banned and GT Reset for
> user execqueue, if job wasn't started. Below changes mark it only for
> migration queues.

do you mean to have something like this below:

 if (!xe_sched_job_started(job)) {
        clear_exec_queue_banned(q);

regardless of the type of the exec queue?


> 
> /Himal
> 
> >   	}
> >   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > @@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   			       q->guc->id, q->flags);
> >   	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * Kernel jobs should never fail permanently. Attempt GT reset and
> > +	 * resubmit; if karma is exhausted the hardware is unrecoverable so
> > +	 * wedge the device.
> > +	 *
> > +	 * Userspace VM bind queues are banned permanently on timeout
> > +.	 * No reset is attempted, the ban already
> > +	 * signals the G2H handler, and the queue stays banned so the job
> > +	 * errors out cleanly.
> >   	 */
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> >   		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> >   			goto rearm;
> >   		}
> > +		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> > +		xe_device_declare_wedged(gt_to_xe(q->gt));
> > +	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
> > +		   !exec_queue_killed(q)) {
> > +		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> >   	}
> >   	/* Mark all outstanding jobs as bad, thus completing them */
> 
