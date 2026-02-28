Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83571048925
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 00:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688E610EC51;
	Sat, 28 Feb 2026 00:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chWunuEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FB910EC4E
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772238973; x=1803774973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/ZhsGkxjV2dtOSO5DnF8ztg5ZzJAmLW2DEZKltSLQI4=;
 b=chWunuEZen8tPilxjl8qxrrUiw1AiQutK4LOW8wqEONeyNHP0sbGFFi5
 A8tlrgowEL/OfqgRHAgM1pT9MNVCMfaxZXxObtsabnttUPyZfAvth6FOm
 9FtOaxlirStlDdzkUnDUNvTHjVleTsTsEHe3QHkhNH5bsknLWhHIxzwBs
 J9ZO8got6BrT9cWoxoeTS/mqtzit1PJE/kL3PC4jA/YDTr4tU2HHkcpBl
 NUFR8/jG+s8LGCHiNrX0d+HnvmoADqXappUpSjB6aTa7dHs96GmxmRFmY
 I6TthYy3csdTudo+YQVPBP0lIJ8mUYXo3RRHtaxcWgHhaAcll6HZnhbYg A==;
X-CSE-ConnectionGUID: 0CYdy6WLT++EIv6a8/dHnw==
X-CSE-MsgGUID: 3p85CdEIROK1O+lwlcU5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84412682"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="84412682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 16:36:12 -0800
X-CSE-ConnectionGUID: nhjrzJN0Sb+lgWFwS5U3Xg==
X-CSE-MsgGUID: zxaCYzs3SoOnfrENfw0bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="216957683"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 16:36:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 16:36:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 16:36:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 16:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrniypW5MyCtmIOTUGm+ltWZvFPwI23UbrbvooIU6t/vDZm0PrA30YXSMDdd+2EKZXu2gpPDJcyH6WXJe2WCA3TAUrXvz6o/mVnAK9iMC3abHIxjA2iOAugQhr+hXeyp7GLknsD1B7aRbwdHMhL9ORpG16Ae0W7UPR0QFtqX496AZ4bC+1SG4bOV/+iWXk0Wh5PZSPhg3HPFksFlyp90pNcf3hb+k0V+EXh2dVn05YvhrajPiAgUDqA8fpEtVxTypG6BPjysKcyDWqx/4kOHDfdlqUDTTCOG0eLmOsXURbgPMaMiSYE4XfFRbfaCgeL5KtNvfKcql1I7nwbn9HxHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HZlI+JpNFYFoVRq+jfCCF+w/FukJTENe1PNf3bn73A=;
 b=g81Z29EuXjXv9i7JgBWlZf8xmPkh5RGPNQBa7fHw4MIkH9RdteZNr5vZb5bdNK/ZTSHXrKP9t0NaiTxt301DUev5q6qAVkuN8KRiZw2Ud48aXND0k2c5S8fz8TASbGLZGfLU0vFmF6vH7dMfUTzEhMjgEVGMEcXVtvqInq5oVFe2LNROHTGykc2b9WelP/ZyPRMdvL96BkZhbNnG2/dfuW/NxaXezFIGBS33UOyUFg69oa1lhtJod7MOlbjLgZ2ln9jRlGC9jW6WEnlkBILXqCY0P9qAQzaccBK10q4MfKzRdJxSyQf7KoX4QhzIzK3BT0lrwSAuWJXUV/flTM056A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sat, 28 Feb
 2026 00:36:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 00:36:03 +0000
Date: Fri, 27 Feb 2026 16:36:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>, Jan
 =?utf-8?Q?Ma=C5=9Blak?= <jan.maslak@intel.com>
Subject: Re: [PATCH 21/22] drm/xe/eudebug: Introduce EU pagefault handling
 interface
Message-ID: <aaI4cEL4F/NvJ/wE@lstrano-desk.jf.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
 <20260223140318.1822138-22-mika.kuoppala@linux.intel.com>
 <aZylxjnJWwP8+vpe@lstrano-desk.jf.intel.com>
 <c27a677f-2a3f-4467-a108-ee71d6c31d47@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c27a677f-2a3f-4467-a108-ee71d6c31d47@intel.com>
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: ca259a11-7335-4d86-6631-08de76615a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: GgTZoDDcmLN9y76FaIXMDVsu/PQg7y7l3oS05/FbRjAkkmVPhtWFWQXcXgJpW+Q8MLabGx1wsFoRiKAOkJ0tOv34secJRJxWzqOPl/80z8j63Ryu1TwFYXKd5VtOW1xqkIxjNHXNT+h8J2B110d0k1IGzOqULdRetMmGpL3E/wYBtluNPtwoPDqtHp+QG9MUYLaeZIJW66si9sPbww0uP+g/83Ragp8R+27WJOOteP+Kib3Qo69VPX7rdA1KdpDAdQdfIlp41bJMuF45LSBCn8iMi1u+SLRdF3Es7Ael2tm5IHOKQC07Uo68dof46veRhNNDEp6H6sf0QqXS6nUzRTUJlm5BWh2zJemT0E4MECVPrq0FzR5yA47MUj+ebS3kHWh7454fXOQ5KnLnMWFeO8rF3WauisCxviZo3KZYPb5QwuiF1clm7IN/tZCZjm4fXPXhr75XFIKONGPxGU/od9/D3dsKMAHbTK4QuLXdDWuCuqv8lyp3JTiUHX/Svx5GfPfX9u61+46smQaxS8Y5ZjrX2P6wGY8YEb7Nw05e7sCqJFWcN3tlnid1/ziEhqC7Ud94+7SpoeS5Sl44b663gvxbaVU8r6rNaE47oQKTyUOhQjQP/+uXwflUNdhD0kJLrCgQFjRUQH+mhaWaAvvYX6Hbft0eofEDvJV3KpyyZn09vpdXnQnT4uPWjigC8bR3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm1tNW9NUUUzdmhndjhXd0ZUd04zWWhlTkdYTDBSRjBaOGxsdlJzdkpqVHpz?=
 =?utf-8?B?VnpyMlVMbStKeGZpVUE3S1RZSXFmclVuNHdyNW1CYWN6Ylo3T2lzN1RIcWNC?=
 =?utf-8?B?U3dvaUVJWTFDNUJWbWt2TXhlak5kWTRPMWhDN3l2Z1k3Qy9jVnIyQ3BvbjAv?=
 =?utf-8?B?RjV0UzdLa0hSVUlEamF3d25uMVIvWE1QdzM4UjlrVU0xYmJyVGlFL0FYNk9P?=
 =?utf-8?B?UE1vLy8rUmh0UjRxWnNWS0t4ZU0yVk5vNnZJcHl6eTQ4NjBEY0RGVTFiVlo5?=
 =?utf-8?B?bkl0N1FKa1BPZ2lGS1YxbC93aGp5a21WU21IYzJBeEg3cGE2eVk5Ky9CMWd1?=
 =?utf-8?B?THFtL0YybEx3anowWXRuR2pKY3pFTFo2S09PWEFoUStaQmMyMFhZeU9IYUIx?=
 =?utf-8?B?S1JvckM4QVpvcHVhSHB4cGVrZzJYVk9tcWV4UVU0MzhBWm5HRzNWWmZqZm9Q?=
 =?utf-8?B?VStRTnJteVZnVWZ0Rml3Uk1iaTNUTjVXNUNibFpFeXdVZ1NjTTBnNDhxVTdJ?=
 =?utf-8?B?UHovek9LR05tNktXTnpLcnhZUTRjVUkrNUNCR1VIN1BlNEplY3g2YWxoZGx5?=
 =?utf-8?B?VjFwZUJ0KzZWV1NTYnkyb2dJRkZ5Q09Qek4vRHp0bnpVS1lMcmJIalltODBR?=
 =?utf-8?B?dnNYTFhtOVdBV01NZ3NSU1lLbnh4WWc4NVFweTlBZE9SYlRIOVJNaGJTYSt6?=
 =?utf-8?B?aGRCWG0zWHEvQmdmbDBzTTF3WWRndGRCTHNOYzZpeldHdXN2NGNOb1h5QWVQ?=
 =?utf-8?B?eW9Cb1ZmYVpQMXh4TFVNMXN0cWJCSkY0cFUvT1M4NzNmOHZQRHJVdmthU3VN?=
 =?utf-8?B?aG9rRGdBZmZaZ1RQUmdEbnRhK1dtRTVtM0dsSVpFYlFvODJ1ZmZXSCtpZTV5?=
 =?utf-8?B?NzQ0WjdMMitXWk1JUUJhNGdmWUFPM3NKQjNGUjhYWmg1VGdxYnpOeW1UMldm?=
 =?utf-8?B?bkFiYTkxUHJRMlN4QzJCVEpFc1JMNTAvUFdOSUgvS200UU0wakdiY0hROUhZ?=
 =?utf-8?B?YVhmMkpMQnVXWk1DSjA1L0xQd3BGdDc1VEw3YUg0L0tObnpjenVVL1dXMXpL?=
 =?utf-8?B?R3ozbUQxcURoQTE5eDZXUFlQZ1F6YnhtTzlHS0g5OWhMTU1jR2NWeWR4dkY1?=
 =?utf-8?B?Szd5WTk3SE41ME02V2tyeDViR2laRHVKYkV3UXB3ZDhuODlTbE41MGtxT0pN?=
 =?utf-8?B?M0MwWnkwMW9rR1VYa1hMSUJaczBpbmdZQlpEZ1pNQUdhVEFRbHQ0VnFDbEkx?=
 =?utf-8?B?clo3NUJoYVFnRXdNMDFQODJSRVplSHoxQVgyRXF1THg1VDQ0QkxWelJLWFhJ?=
 =?utf-8?B?MWNHWXAvVndkaVJuM1ZjdWZIS0RvSmRoMGRwaDdnMCtXbVVWRFc4UkcxNzYw?=
 =?utf-8?B?bk9LZHVHekx6THdiYmVxcVBxUGprV0E0WnRrcFhPZDdmY2ZNbFpHTTdNUVJG?=
 =?utf-8?B?OUxRQkpHR21Sc0dsRWFZR0VMdEk4cVFrSHhXaTJOM0R2V1RkWkZKakkreitZ?=
 =?utf-8?B?RzZmeXhFQVhLNTVYQmQ5eFRmK3kzWU12UjQ5eTIvWEUzZStUL0pYWGxxM3Jm?=
 =?utf-8?B?eGh1N1lxRU4ydWhIYnNGbUZUMkxoTmdienpnM3V1Y0Y1UEFVbEpKRTlZNGlq?=
 =?utf-8?B?MXV6ZFVjRytab3gvN3phUmZIVVd4NHByQmNQV1F1d2tubFNrRzFqYzJtbTh0?=
 =?utf-8?B?djBuQS9wSnVaZHdBL0tUbDhpdjE0c0k4K0tDenZWOGUzYnN6OGxzd0FKK2ow?=
 =?utf-8?B?Sk1GVGtHMGVNNGlrR0dVVjZkYUVLSXpuaFhMaE1qSzlmSitMekx2SWdqR0dv?=
 =?utf-8?B?WGRDaWVKMkp0RzBWYi8yYXVCM2lkKyt3SlU4MjQ0bHF4ejBtMVlpK21MTldK?=
 =?utf-8?B?a1N3S1FPSlRSblVLTllEMS9CaWpWYWJ0SUdtOGRjZ3dBbDlyaFRraVpNdGtJ?=
 =?utf-8?B?OFpnN1hPWTgwVUhNRjFkekdONUhmMmtjMkZMbUl6bjZaQnl6aUZRR1JZS0hp?=
 =?utf-8?B?a05Jd3lkeWIyWlU4bVUwVm13SnorZkJmM1lCRGczc2FIYmRPcUVpZjVPRW1Q?=
 =?utf-8?B?bGw1K24vL0d3WmtPU0U2VFlYMlhNcEVwams3cVBjaS9vMjUzczJzRU96WmMw?=
 =?utf-8?B?VUR5L09wNEVlalcvVkdCZXhHL1REN01qV3pDUGhjUnUxVDlqSm15QWdQNWFa?=
 =?utf-8?B?QWw5MmFJZy95VUhraHdVY1pTYTI3R3pXWjhRanVRMXdwOGFOSitBdjNzZUta?=
 =?utf-8?B?N3MxRk8zdWFId2RyWWkvdTdwQ2diK3JWdHZXNVNPY1JBMWl5U25sSXUxK0N1?=
 =?utf-8?B?dkxzdWJHeE1rYlFFNjJ3OTNZOXhhSnhSUHNLQ05kdzdvNzFEbDBHemNxSHZr?=
 =?utf-8?Q?kZg82E3QAWEMlWY4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca259a11-7335-4d86-6631-08de76615a0e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 00:36:02.9884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tW3s6bKnxVdZOfgInfzwdy6ubLZxOGbbwIfQYAFkeq3dM4cXuYwHqDBNE02gNG69ANr1di79omNcsAb56tmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
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

On Fri, Feb 27, 2026 at 02:10:26PM -0800, Gwan-gyeong Mun wrote:
> 
> 
> On 2/23/26 11:08 AM, Matthew Brost wrote:
> > On Mon, Feb 23, 2026 at 04:03:16PM +0200, Mika Kuoppala wrote:
> > > From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > 
> > 
> > Not a complete review but a few quick comments below.
> > 
> Thank you for your comments. I have left comments below for each point.
> 
> > > The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
> > > access will halt the corresponding EUs. To solve this problem, introduce
> > > EU pagefault handling functionality, which allows to unhalt pagefaulted
> > > eu threads and to EU debugger to get inform about the eu attentions state
> > > of EU threads during execution.
> > > 
> > > If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
> > > after handling the pagefault. The pagefault eudebug event follows
> > > the newly added drm_xe_eudebug_event_pagefault type.
> > > When a pagefault occurs, it prevents to send the
> > > DRM_XE_EUDEBUG_EVENT_EU_ATTENTION event to the client during pagefault
> > > handling.
> > > 
> > > The page fault event delivery follows the below policy.
> > > (1) If EU Debugger discovery has completed and pagefaulted eu threads turn
> > >      on attention bit then pagefault handler delivers pagefault event
> > >      directly.
> > > (2) If a pagefault occurs during eu debugger discovery process, pagefault
> > >      handler queues a pagefault event and sends the queued event when
> > >      discovery has completed and pagefaulted eu threads turn on attention
> > >      bit.
> > > (3) If the pagefaulted eu thread struggles to turn on the attention bit
> > >      within the specified time, the attention scan worker sends a pagefault
> > >      event when it detects that the attention bit is turned on.
> > > 
> > > If multiple eu threads are running and a pagefault occurs due to accessing
> > > the same invalid address, send a single pagefault event
> > > (DRM_XE_EUDEBUG_EVENT_PAGEFAULT type) to the user debugger instead of a
> > > pagefault event for each of the multiple eu threads.
> > > If eu threads (other than the one that caused the page fault before) access
> > > the new invalid addresses, send a new pagefault event.
> > > 
> > > As the attention scan worker send the eu attention event whenever the
> > > attention bit is turned on, user debugger receives attenion event
> > > immediately after pagefault event.
> > > In this case, the page-fault event always precedes the attention event.
> > > 
> > > When the user debugger receives an attention event after a pagefault event,
> > > it can detect whether additional breakpoints or interrupts occur in
> > > addition to the existing pagefault by comparing the eu threads where the
> > > pagefault occurred with the eu threads where the attention bit is newly
> > > enabled.
> > > 
> > > v2: use only force exception (Joonas, Mika)
> > > v3: rebased on v4 (Mika)
> > > v4: streamline uapi, cleanups (Mika)
> > > v5: struct member documentation (Mika)
> > > v6: fault to fault_type (Mika)
> > > 
> > > Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > Signed-off-by: Jan Maślak <jan.maslak@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile               |   2 +-
> > >   drivers/gpu/drm/xe/xe_eudebug.c           | 100 ++++-
> > >   drivers/gpu/drm/xe/xe_eudebug.h           |   9 +
> > >   drivers/gpu/drm/xe/xe_eudebug_hw.c        |  15 +-
> > >   drivers/gpu/drm/xe/xe_eudebug_pagefault.c | 440 ++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_eudebug_pagefault.h |  47 +++
> > >   drivers/gpu/drm/xe/xe_eudebug_types.h     |  69 +++-
> > >   drivers/gpu/drm/xe/xe_pagefault_types.h   |   4 +
> > >   include/uapi/drm/xe_drm_eudebug.h         |  12 +
> > >   9 files changed, 676 insertions(+), 22 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 34db797ef8fc..b49fe7ae18e7 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -152,7 +152,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> > >   xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
> > >   # debugging shaders with gdb (eudebug) support
> > > -xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
> > > +xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_eudebug_pagefault.o xe_gt_debug.o
> > >   # graphics hardware monitoring (HWMON) support
> > >   xe-$(CONFIG_HWMON) += xe_hwmon.o
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > > index eae93c5f5e86..4b2f0dd9d234 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > @@ -17,12 +17,16 @@
> > >   #include "xe_eudebug.h"
> > >   #include "xe_eudebug_hw.h"
> > >   #include "xe_eudebug_types.h"
> > > +#include "xe_eudebug_pagefault.h"
> > >   #include "xe_eudebug_vm.h"
> > >   #include "xe_exec_queue.h"
> > > +#include "xe_force_wake.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_hw_engine.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_debug.h"
> > > +#include "xe_gt_mcr.h"
> > > +#include "regs/xe_gt_regs.h"
> > >   #include "xe_macros.h"
> > >   #include "xe_pm.h"
> > >   #include "xe_sriov_pf.h"
> > > @@ -263,6 +267,7 @@ static void xe_eudebug_free(struct kref *ref)
> > >   	while (kfifo_get(&d->events.fifo, &event))
> > >   		kfree(event);
> > > +	xe_eudebug_pagefault_fini(d);
> > >   	xe_eudebug_resources_destroy(d);
> > >   	mutex_destroy(&d->target.lock);
> > >   	XE_WARN_ON(d->target.xef);
> > > @@ -461,7 +466,7 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
> > >   	} \
> > >   })
> > > -static struct xe_eudebug *
> > > +struct xe_eudebug *
> > >   xe_eudebug_get_nolock(struct xe_file *xef)
> > >   {
> > >   	struct xe_eudebug *d;
> > > @@ -1888,10 +1893,6 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
> > >   {
> > >   	int ret;
> > > -	ret = xe_gt_eu_threads_needing_attention(gt);
> > > -	if (ret <= 0)
> > > -		return ret;
> > > -
> > >   	ret = xe_send_gt_attention(gt);
> > >   	/* Discovery in progress, fake it */
> > > @@ -1901,6 +1902,65 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
> > >   	return ret;
> > >   }
> > > +int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
> > > +				    struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	struct drm_xe_eudebug_event_pagefault *ep;
> > > +	struct drm_xe_eudebug_event *event;
> > > +	int h_queue, h_lrc;
> > > +	u32 size = xe_gt_eu_attention_bitmap_size(pf->q->gt) * 3;
> > > +	u32 sz = struct_size(ep, bitmask, size);
> > > +	int ret;
> > > +
> > > +	XE_WARN_ON(pf->lrc_idx < 0 || pf->lrc_idx >= pf->q->width);
> > > +
> > > +	XE_WARN_ON(!xe_exec_queue_is_debuggable(pf->q));
> > > +
> > > +	h_queue = find_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, pf->q);
> > > +	if (h_queue < 0)
> > > +		return h_queue;
> > > +
> > > +	h_lrc = find_handle(d, XE_EUDEBUG_RES_TYPE_LRC, pf->q->lrc[pf->lrc_idx]);
> > > +	if (h_lrc < 0)
> > > +		return h_lrc;
> > > +
> > > +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0,
> > > +					DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz);
> > > +
> > > +	if (!event)
> > > +		return -ENOSPC;
> > > +
> > > +	ep = cast_event(ep, event);
> > > +	ep->exec_queue_handle = h_queue;
> > > +	ep->lrc_handle = h_lrc;
> > > +	ep->bitmask_size = size;
> > > +	ep->pagefault_address = pf->fault.addr;
> > > +
> > > +	memcpy(ep->bitmask, pf->attentions.before.att, pf->attentions.before.size);
> > > +	memcpy(ep->bitmask + pf->attentions.before.size,
> > > +	       pf->attentions.after.att, pf->attentions.after.size);
> > > +	memcpy(ep->bitmask + pf->attentions.before.size + pf->attentions.after.size,
> > > +	       pf->attentions.resolved.att, pf->attentions.resolved.size);
> > > +
> > > +	event->seqno = atomic_long_inc_return(&d->events.seqno);
> > > +
> > > +	ret = xe_eudebug_queue_event(d, event);
> > > +	if (ret)
> > > +		xe_eudebug_disconnect(d, ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void handle_attention_fail(struct xe_gt *gt, int gt_id, int ret)
> > > +{
> > > +	/* TODO: error capture */
> > > +	drm_info(&gt_to_xe(gt)->drm,
> > > +		 "gt:%d unable to handle eu attention ret = %d\n",
> > > +		 gt_id, ret);
> > > +
> > > +	xe_gt_reset_async(gt);
> > > +}
> > > +
> > >   static void attention_poll_work(struct work_struct *work)
> > >   {
> > >   	struct xe_device *xe = container_of(work, typeof(*xe),
> > > @@ -1923,15 +1983,15 @@ static void attention_poll_work(struct work_struct *work)
> > >   			if (gt->info.type != XE_GT_TYPE_MAIN)
> > >   				continue;
> > > -			ret = xe_eudebug_handle_gt_attention(gt);
> > > -			if (ret) {
> > > -				/* TODO: error capture */
> > > -				drm_info(&gt_to_xe(gt)->drm,
> > > -					 "gt:%d unable to handle eu attention ret=%d\n",
> > > -					 gt_id, ret);
> > > +			if (!xe_gt_eu_threads_needing_attention(gt))
> > > +				continue;
> > > +
> > > +			ret = xe_eudebug_handle_pagefaults(gt);
> > > +			if (!ret)
> > > +				ret = xe_eudebug_handle_gt_attention(gt);
> > > -				xe_gt_reset_async(gt);
> > > -			}
> > > +			if (ret)
> > > +				handle_attention_fail(gt, gt_id, ret);
> > >   		}
> > >   		xe_pm_runtime_put(xe);
> > > @@ -1940,12 +2000,12 @@ static void attention_poll_work(struct work_struct *work)
> > >   	schedule_delayed_work(&xe->eudebug.attention_dwork, delay);
> > >   }
> > > -static void attention_poll_stop(struct xe_device *xe)
> > > +void xe_eudebug_attention_poll_stop(struct xe_device *xe)
> > >   {
> > >   	cancel_delayed_work_sync(&xe->eudebug.attention_dwork);
> > >   }
> > > -static void attention_poll_start(struct xe_device *xe)
> > > +void xe_eudebug_attention_poll_start(struct xe_device *xe)
> > >   {
> > >   	mod_delayed_work(system_wq, &xe->eudebug.attention_dwork, 0);
> > >   }
> > > @@ -1988,6 +2048,8 @@ xe_eudebug_connect(struct xe_device *xe,
> > >   	kref_init(&d->ref);
> > >   	mutex_init(&d->target.lock);
> > > +	mutex_init(&d->pf_lock);
> > > +	INIT_LIST_HEAD(&d->pagefaults);
> > >   	init_waitqueue_head(&d->events.write_done);
> > >   	init_waitqueue_head(&d->events.read_done);
> > >   	init_completion(&d->discovery);
> > > @@ -2019,7 +2081,7 @@ xe_eudebug_connect(struct xe_device *xe,
> > >   	kref_get(&d->ref);
> > >   	queue_work(xe->eudebug.wq, &d->discovery_work);
> > > -	attention_poll_start(xe);
> > > +	xe_eudebug_attention_poll_start(xe);
> > >   	eu_dbg(d, "connected session %lld", d->session);
> > > @@ -2098,9 +2160,9 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
> > >   	mutex_unlock(&xe->eudebug.lock);
> > >   	if (enable) {
> > > -		attention_poll_start(xe);
> > > +		xe_eudebug_attention_poll_start(xe);
> > >   	} else {
> > > -		attention_poll_stop(xe);
> > > +		xe_eudebug_attention_poll_stop(xe);
> > >   		if (IS_SRIOV_PF(xe))
> > >   			xe_sriov_pf_end_lockdown(xe);
> > > @@ -2153,7 +2215,7 @@ static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
> > >   	xe_assert(xe, list_empty(&xe->eudebug.targets));
> > > -	attention_poll_stop(xe);
> > > +	xe_eudebug_attention_poll_stop(xe);
> > >   }
> > >   void xe_eudebug_init(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> > > index bd9fd7bf454f..34938e87be13 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.h
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> > > @@ -13,12 +13,14 @@ struct drm_file;
> > >   struct xe_debug_data;
> > >   struct xe_device;
> > >   struct xe_file;
> > > +struct xe_gt;
> > >   struct xe_vm;
> > >   struct xe_vma;
> > >   struct xe_vma_ops;
> > >   struct xe_exec_queue;
> > >   struct xe_user_fence;
> > >   struct xe_eudebug;
> > > +struct xe_eudebug_pagefault;
> > >   #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> > > @@ -72,8 +74,15 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
> > >   void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
> > >   bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
> > > +struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
> > >   void xe_eudebug_put(struct xe_eudebug *d);
> > > +int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
> > > +				    struct xe_eudebug_pagefault *pf);
> > > +
> > > +void xe_eudebug_attention_poll_stop(struct xe_device *xe);
> > > +void xe_eudebug_attention_poll_start(struct xe_device *xe);
> > > +
> > >   #else
> > >   static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
> > > index 5365265a67b3..270f7abc82e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
> > > @@ -322,6 +322,7 @@ static int do_eu_control(struct xe_eudebug *d,
> > >   	struct xe_device *xe = d->xe;
> > >   	u8 *bits = NULL;
> > >   	unsigned int hw_attn_size, attn_size;
> > > +	struct dma_fence *pf_fence;
> > >   	struct xe_exec_queue *q;
> > >   	struct xe_lrc *lrc;
> > >   	u64 seqno;
> > > @@ -376,8 +377,20 @@ static int do_eu_control(struct xe_eudebug *d,
> > >   		goto out_free;
> > >   	}
> > > -	ret = -EINVAL;
> > >   	mutex_lock(&d->hw.lock);
> > > +	do {
> > > +		pf_fence = dma_fence_get(d->pf_fence);
> > > +		if (pf_fence) {
> > > +			mutex_unlock(&d->hw.lock);
> > > +			ret = dma_fence_wait(pf_fence, true);
> > > +			dma_fence_put(pf_fence);
> > > +			if (ret)
> > > +				goto out_free;
> > > +			mutex_lock(&d->hw.lock);
> > > +		}
> > > +	} while (pf_fence);
> > > +
> > > +	ret = -EINVAL;
> > >   	switch (arg->cmd) {
> > >   	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
> > > new file mode 100644
> > > index 000000000000..edd368a7f6ae
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
> > > @@ -0,0 +1,440 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023-2025 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_eudebug_pagefault.h"
> > > +
> > > +#include <linux/delay.h>
> > > +
> > > +#include "xe_exec_queue.h"
> > > +#include "xe_eudebug.h"
> > > +#include "xe_eudebug_hw.h"
> > > +#include "xe_force_wake.h"
> > > +#include "xe_gt_debug.h"
> > > +#include "xe_gt_mcr.h"
> > > +#include "regs/xe_gt_regs.h"
> > > +#include "xe_vm.h"
> > > +
> > > +static struct xe_gt *
> > > +pf_to_gt(struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	return pf->q->gt;
> > > +}
> > > +
> > > +static void destroy_pagefault(struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	xe_exec_queue_put(pf->q);
> > > +	kfree(pf);
> > > +}
> > > +
> > > +static int queue_pagefault(struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	struct xe_eudebug *d;
> > > +
> > > +	d = xe_eudebug_get_nolock(pf->q->vm->xef);
> > > +	if (!d)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&d->pf_lock);
> > > +	list_add_tail(&pf->link, &d->pagefaults);
> > > +	mutex_unlock(&d->pf_lock);
> > > +
> > > +	xe_eudebug_put(d);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int send_pagefault(struct xe_eudebug_pagefault *pf,
> > > +			  bool from_attention_scan)
> > > +{
> > > +	struct xe_gt *gt = pf_to_gt(pf);
> > > +	struct xe_eudebug *d;
> > > +	struct xe_exec_queue *q;
> > > +	int ret, lrc_idx;
> > > +
> > > +	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
> > > +	if (IS_ERR(q))
> > > +		return PTR_ERR(q);
> > > +
> > > +	if (!xe_exec_queue_is_debuggable(q)) {
> > > +		ret = -EPERM;
> > > +		goto out_exec_queue_put;
> > > +	}
> > > +
> > > +	d = xe_eudebug_get_nolock(q->vm->xef);
> > > +	if (!d) {
> > > +		ret = -ENOTCONN;
> > > +		goto out_exec_queue_put;
> > > +	}
> > > +
> > > +	if (pf->deferred_resolved) {
> > > +		xe_gt_eu_attentions_read(gt, &pf->attentions.resolved,
> > > +					 XE_GT_ATTENTION_TIMEOUT_MS);
> > > +
> > > +		if (!xe_eu_attentions_xor_count(&pf->attentions.after,
> > > +						&pf->attentions.resolved) &&
> > > +		    !from_attention_scan) {
> > > +			eu_dbg(d, "xe attentions not yet updated\n");
> > > +			ret = -EBUSY;
> > > +			goto out_eudebug_put;
> > > +		}
> > > +	}
> > > +
> > > +	ret = xe_eudebug_send_pagefault_event(d, pf);
> > > +
> > > +out_eudebug_put:
> > > +	xe_eudebug_put(d);
> > > +out_exec_queue_put:
> > > +	xe_exec_queue_put(q);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const char *
> > > +pagefault_get_driver_name(struct dma_fence *dma_fence)
> > > +{
> > > +	return "xe";
> > > +}
> > > +
> > > +static const char *
> > > +pagefault_fence_get_timeline_name(struct dma_fence *dma_fence)
> > > +{
> > > +	return "eudebug_pagefault_fence";
> > > +}
> > > +
> > > +static const struct dma_fence_ops pagefault_fence_ops = {
> > > +	.get_driver_name = pagefault_get_driver_name,
> > > +	.get_timeline_name = pagefault_fence_get_timeline_name,
> > > +};
> > > +
> > > +struct pagefault_fence {
> > > +	struct dma_fence base;
> > > +	spinlock_t lock;
> > > +};
> > > +
> > > +static struct pagefault_fence *pagefault_fence_create(void)
> > > +{
> > > +	struct pagefault_fence *fence;
> > > +
> > > +	fence = kzalloc_obj(*fence, GFP_KERNEL);
> > > +	if (fence == NULL)
> > > +		return NULL;
> > > +
> > > +	spin_lock_init(&fence->lock);
> > > +	dma_fence_init(&fence->base, &pagefault_fence_ops, &fence->lock,
> > > +		       dma_fence_context_alloc(1), 1);
> > > +
> > > +	return fence;
> > > +}
> > > +
> > > +void
> > > +xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
> > 
> > This function, as written, is basically a no from me given that
> > DRM_XE_EUDEBUG is enabled by default. It adds time complexity via
> > xe_vm_find_vma_by_addr(), which is O(log N) where N is the number of
> > VMAs.
> > 
> > Page faults are going to be heavily optimized since this is a critical
> > path. Anything less than O(1) here when no EU connection exists —
> > combined with DRM_XE_EUDEBUG being on — is likely to receive pushback
> > from me.
> > 
> I'll consider an implementation where eudebug directly uses the vma value
> returned by xe_vm_find_vma_by_addr(), which is called by
> xe_pagefault_service(). this way will avoid the performance degradation
> caused by additional xe_vm_find_vma_by_addr() calls. ( Previously, due to
> lock dependencies, eudebug directly called xe_vm_find_vma_by_addr(). I will
> verify whether this issue still exists. )
> 

Yes, this would work for me. 

> > > +{
> > > +	struct pagefault_fence *pf_fence;
> > > +	struct xe_eudebug_pagefault *epf;
> > > +	struct xe_vma *vma;
> > > +	struct xe_gt *gt = pf->gt;
> > > +	struct xe_exec_queue *q;
> > > +	struct dma_fence *fence;
> > > +	struct xe_eudebug *d;
> > > +	unsigned int fw_ref;
> > > +	int lrc_idx;
> > > +	u32 td_ctl;
> > > +
> > > +	pf->consumer.epf = NULL;
> > > +
> > > +	down_read(&vm->lock);
> > > +	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> > > +	up_read(&vm->lock);
> > 
> > See my comment in [1] — this doesn't work for SVM. This will need to be
> > rethought.
> > 
> > [1] https://patchwork.freedesktop.org/patch/706437/?series=161979&rev=1#comment_1299420
> > 
> Additional implementation of eudebug pagefault routine for  SVM is required.
> I have replied to the mentioned email thread.
> 

Reading this one and thinking this through.

Matt

> > > +
> > > +	if (vma)
> > > +		return;
> > > +
> > > +	d = xe_eudebug_get_nolock(vm->xef);
> > > +	if (!d)
> > > +		return;
> > > +
> > > +	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
> > > +	if (IS_ERR(q))
> > > +		goto err_put_eudebug;
> > > +
> > > +	if (XE_WARN_ON(q->vm != vm))
> > > +		goto err_put_exec_queue;
> > > +
> > > +	if (!xe_exec_queue_is_debuggable(q))
> > > +		goto err_put_exec_queue;
> > > +
> > > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), q->hwe->domain);
> > > +	if (!fw_ref)
> > > +		goto err_put_exec_queue;
> > > +
> > > +	/*
> > > +	 * If there is no debug functionality (TD_CTL_GLOBAL_DEBUG_ENABLE, etc.),
> > > +	 * don't proceed pagefault routine for eu debugger.
> > > +	 */
> > > +	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> > > +	if (!td_ctl)
> > > +		goto err_put_fw;
> > > +
> > > +	epf = kzalloc_obj(*epf, GFP_KERNEL);
> > > +	if (!epf)
> > > +		goto err_put_fw;
> > > +
> > > +	xe_eudebug_attention_poll_stop(gt_to_xe(gt));
> > > +
> > > +	mutex_lock(&d->hw.lock);
> > > +	fence = dma_fence_get(d->pf_fence);
> > > +
> > > +	if (fence) {
> > > +		/*
> > > +		 * TODO: If the new incoming pagefaulted address is different
> > > +		 * from the pagefaulted address it is currently handling on the
> > > +		 * same ASID, it needs a routine to wait here and then do the
> > > +		 * following pagefault.
> > > +		 */
> > > +		dma_fence_put(fence);
> > > +		goto err_unlock_hw_lock;
> > > +	}
> > > +
> > > +	pf_fence = pagefault_fence_create();
> > > +	if (!pf_fence)
> > > +		goto err_unlock_hw_lock;
> > > +
> > > +	d->pf_fence = &pf_fence->base;
> > > +
> > > +	INIT_LIST_HEAD(&epf->link);
> > > +
> > > +	xe_gt_eu_attentions_read(gt, &epf->attentions.before, 0);
> > > +
> > > +	if (td_ctl & TD_CTL_FORCE_EXCEPTION)
> > > +		eu_warn(d, "force exception already set!");
> > > +
> > > +	/* Halt regardless of thread dependencies */
> > > +	while (!(td_ctl & TD_CTL_FORCE_EXCEPTION)) {
> > > +		xe_gt_mcr_multicast_write(gt, TD_CTL,
> > > +					  td_ctl | TD_CTL_FORCE_EXCEPTION);
> > > +		udelay(200);
> > > +		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> > > +	}
> > > +
> > > +	xe_gt_eu_attentions_read(gt, &epf->attentions.after,
> > > +				 XE_GT_ATTENTION_TIMEOUT_MS);
> > > +
> > > +	mutex_unlock(&d->hw.lock);
> > > +
> > > +	/*
> > > +	 * xe_exec_queue_put() will be called from xe_eudebug_pagefault_destroy()
> > > +	 * or handle_pagefault()
> > > +	 */
> > > +	epf->q = q;
> > > +	epf->lrc_idx = lrc_idx;
> > > +	epf->fault.addr = pf->consumer.page_addr;
> > > +	epf->fault.type_level = pf->consumer.fault_type_level;
> > > +	epf->fault.access_type = pf->consumer.access_type;
> > > +
> > > +	pf->consumer.epf = epf;
> > > +
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	xe_eudebug_put(d);
> > > +
> > > +	return;
> > > +
> > > +err_unlock_hw_lock:
> > > +	mutex_unlock(&d->hw.lock);
> > > +	xe_eudebug_attention_poll_start(gt_to_xe(gt));
> > > +	kfree(epf);
> > > +err_put_fw:
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +err_put_exec_queue:
> > > +	xe_exec_queue_put(q);
> > > +err_put_eudebug:
> > > +	xe_eudebug_put(d);
> > > +}
> > > +
> > > +struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_vma *vma = NULL;
> > > +
> > > +	if (!pf->consumer.epf)
> > > +		return NULL;
> > > +
> > > +	vma = xe_vm_create_null_vma(vm, pf->consumer.page_addr);
> > > +	if (IS_ERR(vma))
> > > +		return vma;
> > > +
> > > +	pf->consumer.epf->is_null = true;
> > > +
> > > +	return vma;
> > > +}
> > > +
> > > +static void
> > > +xe_eudebug_pagefault_process(struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	struct xe_gt *gt = pf->q->gt;
> > > +
> > > +	xe_gt_eu_attentions_read(gt, &pf->attentions.resolved,
> > > +				 XE_GT_ATTENTION_TIMEOUT_MS);
> > > +
> > > +	if (!xe_eu_attentions_xor_count(&pf->attentions.after,
> > > +					&pf->attentions.resolved))
> > > +		pf->deferred_resolved = true;
> > > +}
> > > +
> > > +static void
> > > +_xe_eudebug_pagefault_destroy(struct xe_eudebug_pagefault *pf)
> > > +{
> > > +	struct xe_gt *gt = pf->q->gt;
> > > +	struct xe_vm *vm = pf->q->vm;
> > > +	struct xe_eudebug *d;
> > > +	unsigned int fw_ref;
> > > +	u32 td_ctl;
> > > +	bool queued, try_send;
> > > +	int ret;
> > > +
> > > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), pf->q->hwe->domain);
> > > +	if (!fw_ref) {
> > > +		struct xe_device *xe = gt_to_xe(gt);
> > > +
> > > +		drm_warn(&xe->drm, "Forcewake fail: Can not recover TD_CTL");
> > > +	} else {
> > > +		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> > > +		xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
> > > +					  ~(TD_CTL_FORCE_EXCEPTION));
> > > +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	}
> > > +
> > > +	queued = false;
> > > +	try_send = pf->is_null;
> > > +	if (try_send) {
> > > +		ret = send_pagefault(pf, false);
> > > +
> > > +		/*
> > > +		 * if debugger discovery is not completed or resolved attentions are not
> > > +		 * updated, then queue pagefault
> > > +		 */
> > > +		if (ret == -EBUSY) {
> > > +			ret = queue_pagefault(pf);
> > > +			if (!ret)
> > > +				queued = true;
> > > +		}
> > > +	}
> > > +
> > > +	d = xe_eudebug_get_nolock(vm->xef);
> > > +	if (d) {
> > > +		struct dma_fence *f;
> > > +
> > > +		mutex_lock(&d->hw.lock);
> > > +		f = d->pf_fence;
> > > +		d->pf_fence = NULL;
> > > +		mutex_unlock(&d->hw.lock);
> > > +
> > > +		if (f) {
> > > +			if (!queued)
> > > +				dma_fence_signal(f);
> > > +
> > > +			dma_fence_put(f);
> > > +		}
> > > +
> > > +		xe_eudebug_put(d);
> > > +	}
> > > +
> > > +	if (!queued)
> > > +		destroy_pagefault(pf);
> > > +
> > > +	xe_eudebug_attention_poll_start(gt_to_xe(gt));
> > > +}
> > > +
> > > +static int send_queued_pagefaults(struct xe_eudebug *d)
> > > +{
> > > +	struct xe_eudebug_pagefault *pf, *pf_temp;
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&d->pf_lock);
> > > +	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, link) {
> > > +		ret = send_pagefault(pf, true);
> > > +
> > > +		/* if resolved attentions are not updated */
> > > +		if (ret == -EBUSY)
> > > +			break;
> > > +
> > > +		list_del(&pf->link);
> > > +
> > > +		destroy_pagefault(pf);
> > > +
> > > +		if (ret)
> > > +			break;
> > > +	}
> > > +	mutex_unlock(&d->pf_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +int xe_eudebug_handle_pagefaults(struct xe_gt *gt)
> > > +{
> > > +	struct xe_exec_queue *q;
> > > +	struct xe_eudebug *d;
> > > +	int ret, lrc_idx;
> > > +
> > > +	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
> > > +	if (IS_ERR(q))
> > > +		return PTR_ERR(q);
> > > +
> > > +	if (!xe_exec_queue_is_debuggable(q)) {
> > > +		ret = -EPERM;
> > > +		goto out_exec_queue_put;
> > > +	}
> > > +
> > > +	d = xe_eudebug_get_nolock(q->vm->xef);
> > > +	if (!d) {
> > > +		ret = -ENOTCONN;
> > > +		goto out_exec_queue_put;
> > > +	}
> > > +
> > > +	ret = send_queued_pagefaults(d);
> > > +
> > > +	xe_eudebug_put(d);
> > > +
> > > +out_exec_queue_put:
> > > +	xe_exec_queue_put(q);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +void xe_eudebug_pagefault_service(struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_eudebug_pagefault *f = pf->consumer.epf;
> > > +
> > > +	if (!f)
> > > +		return;
> > > +
> > > +	if (f->is_null)
> > > +		xe_eudebug_pagefault_process(f);
> > > +}
> > > +
> > > +void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err)
> > > +{
> > > +	struct xe_eudebug_pagefault *f = pf->consumer.epf;
> > > +
> > > +	if (!f)
> > > +		return;
> > > +
> > > +	if (err)
> > > +		f->is_null = false;
> > > +
> > > +	_xe_eudebug_pagefault_destroy(f);
> > > +}
> > > +
> > > +void xe_eudebug_pagefault_fini(struct xe_eudebug *d)
> > > +{
> > > +	struct xe_eudebug_pagefault *pf, *pf_temp;
> > > +
> > > +	/* Since it's the last reference no race here */
> > > +
> > > +	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, link) {
> > > +		list_del(&pf->link);
> > > +		destroy_pagefault(pf);
> > > +	}
> > > +
> > > +	XE_WARN_ON(d->pf_fence);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
> > > new file mode 100644
> > > index 000000000000..1ba20beac3cf
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
> > > @@ -0,0 +1,47 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023-2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_EUDEBUG_PAGEFAULT_H_
> > > +#define _XE_EUDEBUG_PAGEFAULT_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_eudebug;
> > > +struct xe_gt;
> > > +struct xe_pagefault;
> > > +struct xe_eudebug_pagefault;
> > > +struct xe_vm;
> > > +
> > > +void xe_eudebug_pagefault_fini(struct xe_eudebug *d);
> > > +int xe_eudebug_handle_pagefaults(struct xe_gt *gt);
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> > > +void xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf);
> > > +struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf);
> > > +void xe_eudebug_pagefault_service(struct xe_pagefault *pf);
> > > +void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err);
> > > +#else
> > > +
> > > +static inline void
> > > +xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
> > > +{
> > > +}
> > > +
> > > +static inline struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
> > > +{
> > > +	return NULL;
> > > +}
> > > +
> > > +static inline void xe_eudebug_pagefault_service(struct xe_pagefault *pf)
> > > +{
> > > +}
> > > +
> > > +static inline void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err)
> > > +{
> > > +}
> > > +
> > > +#endif
> > > +
> > > +#endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> > > index 386b5c78ecff..09bfae8b94ab 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> > > @@ -15,6 +15,8 @@
> > >   #include <linux/wait.h>
> > >   #include <linux/xarray.h>
> > > +#include "xe_gt_debug_types.h"
> > > +
> > >   struct xe_device;
> > >   struct task_struct;
> > >   struct xe_eudebug;
> > > @@ -37,7 +39,7 @@ enum xe_eudebug_state {
> > >   };
> > >   #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
> > > -#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
> > > +#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_PAGEFAULT
> > >   /**
> > >    * struct xe_eudebug_handle - eudebug resource handle
> > > @@ -164,6 +166,71 @@ struct xe_eudebug {
> > >   	/** @ops: operations for eu_control */
> > >   	struct xe_eudebug_eu_control_ops *ops;
> > > +
> > > +	/** @pf_lock: guards access to pagefaults list*/
> > > +	struct mutex pf_lock;
> > > +	/** @pagefaults: xe_eudebug_pagefault list for pagefault event queuing */
> > > +	struct list_head pagefaults;
> > > +	/**
> > > +	 * @pf_fence: fence on operations of eus (eu thread control and attention)
> > > +	 * when page faults are being handled, protected by @eu_lock.
> > > +	 */
> > > +	struct dma_fence *pf_fence;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_eudebug_pagefault - eudebug structure for queuing pagefault
> > > + */
> > > +struct xe_eudebug_pagefault {
> > > +	/** @link: link into the xe_eudebug.pagefaults */
> > > +	struct list_head link;
> > > +	/** @q: exec_queue which raised pagefault */
> > > +	struct xe_exec_queue *q;
> > > +	/** @lrc_idx: lrc index of the workload which raised pagefault */
> > > +	int lrc_idx;
> > > +
> > > +	/** @fault: pagefault raw partial data passed from guc */
> > > +	struct {
> > > +		/** @addr: ppgtt address where the pagefault occurred */
> > > +		u64 addr;
> > > +		u8 type_level;
> > > +		u8 access_type;
> > > +	} fault;
> > > +
> > > +	/** @attentions: attention states in different phases of fault */
> > > +	struct {
> > > +		/** @before: state of attention bits before page fault WA processing*/
> > > +		struct xe_eu_attentions before;
> > > +		/**
> > > +		 * @after: status of attention bits during page fault WA processing.
> > > +		 * It includes eu threads where attention bits are turned on for
> > > +		 * reasons other than page fault WA (breakpoint, interrupt, etc.).
> > > +		 */
> > > +		struct xe_eu_attentions after;
> > > +		/**
> > > +		 * @resolved: state of the attention bits after page fault WA.
> > > +		 * It includes the eu thread that caused the page fault.
> > > +		 * To determine the eu thread that caused the page fault,
> > > +		 * do XOR attentions.after and attentions.resolved.
> > > +		 */
> > > +		struct xe_eu_attentions resolved;
> > > +	} attentions;
> > > +
> > > +	/**
> > > +	 * @deferred_resolved: to update attentions.resolved again when attention
> > > +	 * bits are ready if the eu thread fails to turn on attention bits within
> > > +	 * a certain time after page fault WA processing.
> > > +	 */
> > > +	bool deferred_resolved;
> > > +
> > > +	/**
> > > +	 * @is_null: marks if this vma is null or not. The lookup for the
> > > +	 * vma is done in two phases and eudebug pagefault struct needs
> > > +	 * to be allocated apriori to resolving if we need null vma or not.
> > > +	 * So we keep the state here so that processing and teardown
> > > +	 * know which type of fault resulted in creation of this eudebug pf.
> > > +	 */
> > > +	bool is_null;
> > >   };
> > >   #endif /* _XE_EUDEBUG_TYPES_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > index 0e378f41ede6..2bee858da597 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > @@ -10,6 +10,7 @@
> > >   struct xe_gt;
> > >   struct xe_pagefault;
> > > +struct xe_eudebug_pagefault;
> > >   /** enum xe_pagefault_access_type - Xe page fault access type */
> > >   enum xe_pagefault_access_type {
> > > @@ -84,6 +85,9 @@ struct xe_pagefault {
> > >   		u8 engine_class;
> > >   		/** @consumer.engine_instance: engine instance */
> > >   		u8 engine_instance;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> > > +		struct xe_eudebug_pagefault *epf;
> > > +#endif
> > 
> > 
> > This will grow the pagefault struct from 64 bytes to 128 bytes.
> > Everything will still be functionally correct, but I’d really prefer not
> > to increase the size of this structure. The u64 reserved field will be
> > used to implement the page-fault cache for fault storms, so that is a
> > non-starter.
> > 
> > Can we replace producer->private with epf and set a mask bit in the
> > lower 3 bits to indicate that producer->private has been replaced by
> > epf, then unwind epf vs. the original private on the producer side
> > during the ack/cleanup? In that case, we would store the original
> > producer->private in epf, if that isn’t clear.
> > 
> Thank you for your feedback. It seems I can change the implementation to
> store the epf in producer->private. I will incorporate this change in the
> next version.
> 
> > Another thing we will have to consider is how the EU debug interface for
> > page faults will interact with the pagefault cache for fault storms
> > that’s in the pipe [2] (which I’ll post as soon as CI is fixed). My
> > initial thought is that it should be fine, given that the head of a
> > fault storm will populate epf, and subsequent faults that hit the page
> > being serviced will not have it populated. I’ll CC the EU debug team
> > when I post this code to ensure we aren’t clobbering each other’s
> > designs.
> > 
> > [2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/93669c7f4e00ec13d0a18e28d34dfcb41803b7c9
> > 
> Yes, I've checked your patch series.
> https://patchwork.freedesktop.org/series/162167/
> 
> The eudebug pagefault handling routine does not appear to conflict
> structurally with the pagefault cache for fault storms. After verifying the
> behavior of applying the eudebug changes on top of your relevant patch, I
> will provide an additional reply.
> 
> G.G.
> 
> > Matt
> > 
> > >   		/** consumer.reserved: reserved bits for future expansion */
> > >   		u64 reserved;
> > >   	} consumer;
> > > diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> > > index 54394a7e12ab..f7d035532be2 100644
> > > --- a/include/uapi/drm/xe_drm_eudebug.h
> > > +++ b/include/uapi/drm/xe_drm_eudebug.h
> > > @@ -53,6 +53,7 @@ struct drm_xe_eudebug_event {
> > >   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
> > >   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
> > >   #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
> > > +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
> > >   	/** @flags: Flags */
> > >   	__u16 flags;
> > > @@ -358,6 +359,17 @@ struct drm_xe_eudebug_event_eu_attention {
> > >   	__u8 bitmask[];
> > >   };
> > > +struct drm_xe_eudebug_event_pagefault {
> > > +	struct drm_xe_eudebug_event base;
> > > +
> > > +	__u64 exec_queue_handle;
> > > +	__u64 lrc_handle;
> > > +	__u32 flags;
> > > +	__u32 bitmask_size;
> > > +	__u64 pagefault_address;
> > > +	__u8 bitmask[];
> > > +};
> > > +
> > >   #if defined(__cplusplus)
> > >   }
> > >   #endif
> > > -- 
> > > 2.43.0
> > > 
> 
