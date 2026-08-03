Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DD6C55179
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 13:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A68210E66D;
	Mon,  3 Aug 2026 13:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrWAe42N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926510E66D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785765544; x=1817301544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6H4OSim1y3dc02Uai+5k7wMeZcATlNDmnFvCQLrF/bs=;
 b=WrWAe42NP0Eq2KpMbkXI2SKH3PTwUD+LQ0jFVnQU/7S5M7SgMuOA9BOz
 9ehDiV/HhrUkwl3cXhD5eKfheeNdjsAGMmeoVa1AkJsnuoxUbkElvvedz
 3h/8zGEHK3pmC25Lo6BDVUdi7s45GZXuAoAeR2JRv9xieYtq7PK7mtQOv
 QfhOwU+grpdXTMFs0hJydI87I59DiKxUqttBE5YUFZ+w7NSelnT7Bmdf2
 OH+hE+ryz5qyMCUPrs13duvBCH1LMVex/A3Dk1u2s4DRGM9El49pCklm5
 8UiTO3PvtLNwE12tQDz3tglqBK3misE6I8isXV4ZuAlqsRjKFceQImiJt w==;
X-CSE-ConnectionGUID: HA9eFkQKR8Kc2O+O4kEMKA==
X-CSE-MsgGUID: csPZ1USiQVqZYjpTkzYtZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86421636"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86421636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 06:59:03 -0700
X-CSE-ConnectionGUID: g3afg5dVSIKxbpAnJevZ0Q==
X-CSE-MsgGUID: QvmsCrS2QyecVH8yTUjjEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="264700020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 06:59:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 06:59:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 06:59:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 06:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYysVO/j3V3zgoim7tlJHz2MJA2q9kTDzLxezb6QoIQK6sa3sEiRtQhxfsTzXudphdquO25EG0CR/YWdKs17R6zbvkP1cFda4FtdcdVJDVvCU2AqaZIw/z1kb1YjXHmXj+/cPWzcypp7JZSAd2zFy9zgaWt0q17mYI6tbtFmuLTAHI2ELe1+TAP8CoSxqVpJJb15bA3IVAk+XwpKINcCzif0SdbxoDPPE42K8o4n+M4WDO5+1jw1rsWNY59fxGnZuzYVEy32zJycSY6Qo7RNBX0x0iCnCMWlmA91f6rI9TJeGhMHBMCoZzvK2kw1K4tvC0nX4izIDyQCuLRR9f0AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/Pkpk+CYRhi+n5UZt1TdwvDpyUVcSrxPGP0tuHiYGg=;
 b=h/arNkvrIsqRMVyjOxZh0pddTL2iCcxLS4Dc3NTjzGx3rlxwy0UMF3yQ7Aalbm9j5/9Aoex47ixCqb6cQjIdc2Md7o1KOeaytLMw5gH3nItO3fPC2UfoeLcddxCUVTpvBr+LDFz9DUoaNSqc535oDiKByJ73NwScTxIIm8PhD3m1wIi4JeeM0P5rvjHAsqBlfHXaS2zw5TjCB5HrQLZj+6zuVit1NmBHoiQbBF2+rXY8iPdd4FcpQlMmJGlNxsNdtx8vZ+curJcOpxEFioHdqsNJng5U3zUhdX/kix6lh8S/gQdpt03+QrXDGTtaP/u3kCZJ7rPXxVMTVKIjCVMwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:58:57 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 13:58:52 +0000
Date: Mon, 3 Aug 2026 15:58:27 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 08/12] drm/xe: Chain page faults via queue-resident
 cache to avoid fault storms
Message-ID: <anCefLQ3vLJ9e40Q@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-9-matthew.brost@intel.com>
 <amnyqqDRREq2SJQs@fdugast-desk>
 <ampEd1vMgFDIUxga@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ampEd1vMgFDIUxga@gsse-cloud1.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::11) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: af660dcb-1fac-4d5f-e4a7-08def1675965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: wBecj2XriIus8oQoVH8E4xeVe2zqyBryHYR220pLSxwTeydC1spjFc6/sEzLEViAbSyGlFg7IFQrSx1wzvfU5TbAUYoPzSQJN/qgmGpdUGN2HeRWABx3oDxAwdSYbkZGVdQXo/EjBAI7Zv8wZcXO1/we8VnG9PH+O4nOjdjp8qyKnGbgfjGgDTSHcnqvvcrVCm/59Q+e29OVmhaR5F4C/8snvGhjGdXGYnOi+1OLFOLMF8oPIGLhsj6WAcAoT9iZtGEYN3hyFom6EflneTsN0mV1v0MyG+sr9+7jPHpMh4a4P2m57/H9OCdA7205ftzRhnvMuNgved5fmIasAz1soRdb5/Hj+czuX9jhhkI6ZZtp0cT2FjQPxZ3l+AXUZxANY90qL9637zX2FYODssaTokVUnNCRFGC2lUhFB2u8AvkXhM2TTSYcJZ4pQbWiK1eeSqJb/+tm8Q1IJ5PTIhfVoIRkF0xp03l/8I1uQTxJFk58qPDj2xxpCkQCZfuGdFuG+xmRjK+vBOkU4M2W20/f+o3id9SNMzdC4m8rEOLtW8+M+wg9o6G8IEwuGvsGcTigWk7ghJbC/JTJVBqrxdqHgpBqnLkKYIpKE4RYhAfByw0MHakphc3geSjZZqqATejsQfIvqr2QaU6QlpjVprUWjssWkohGRapqoGsZVnebVZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5XMzR3K1N2UGI0WDA0cW5GMkpGT1ZrSS9KMTBuQ1llN3NEanVxVnQ4TVpz?=
 =?utf-8?B?aVVUUU5tMFVZdFNTeEVtdG5NVEVZbGovSFUwV1ZnNWlJZjJsYzVmeE5INW1l?=
 =?utf-8?B?dXRha0s0dEtBclFtNGFzaUdTWGV3NER3NlkxZzVST1R4VWMxMFVWQm1xRGJ4?=
 =?utf-8?B?ZXJBYW1vbmF5NGZrNHErNEZhSzBpNVJVdWVia0J2ZkRZSWFrWXR6ei9XelJH?=
 =?utf-8?B?RVg5Q3BqcXF5ZXVSL0pwTHJQRDg5YjhOa2VlWW9uOVRlKytXV1dPUTFNV053?=
 =?utf-8?B?d2M0MTFEYzFrMTZpSUVFOE5lelZabjVSUmRTTGt1N2xjVzMwVTNnUjVEVkI3?=
 =?utf-8?B?cEJmQlNpWlR6cDBuZXBqdUd2bmpBK2FaTFZMVGY0MG1XU25HQ09naHM3MG90?=
 =?utf-8?B?NmIwVDFKaS9wakxWcXpibnRIellJSjJnaTQwMk5xc2FZanpOKzNxVjF2NkJT?=
 =?utf-8?B?WDkyTS8vbkpzWUp2YzlvcC9Jd1IzTUNmRElVMGVRUEdDNkJLK3A4NkFkYzZV?=
 =?utf-8?B?THFGQjlDL01ZYlVyMXB1RHlxY05KT0I4TDdVRFVNeXQ2a0E0d3UvbUEzdWdr?=
 =?utf-8?B?SjRFSW1YenpjNy9zdG1QYkdWeE5aZjVYSGNDWnhHVDUzSCtqQmJMVkxVV0ha?=
 =?utf-8?B?Z2t3TGpydDhoemVwV2xUa1J1VnVhdDlhemxvRWhMVk5zMkVtY094RTdyZlRt?=
 =?utf-8?B?T09YZzZTR1VFTDM3TzZhWWFTdUhrQXYybDV5cEN1Slc2UnovdnVJS2d0bmhh?=
 =?utf-8?B?cDRVN3NVeFpMb3NTZFRncjI2Z1M2cXc5akozT0ZsVlJYR1c0L2dVSGtsWThz?=
 =?utf-8?B?ZldndEI3YTZoSzVscTFpUkxUcFJiV1RqejNqcHhxdThOWkNSS2xnSExGTWJO?=
 =?utf-8?B?YjQ5WjhFSmRNWDFNYTF2YnpSZVlyeW1EY3JFc1QwUk82MCtROEJIaEJFOVo0?=
 =?utf-8?B?enZSaUNjYjBQWGczS3JWZThvRVJmNXBXcGhGM1NHOFZqMHJKUTRNN2V6eWxR?=
 =?utf-8?B?NjBtb1A0a21LWlBiZEZFZTlYeFJlcU5hc3RmdkxRMFFTWVM0Q1EycG9VYWZN?=
 =?utf-8?B?SUwzOTZhSkgwNkxTajRPYXdxSEtrWm8ralJEVitaekVSWWZjRFRYT0lLakcr?=
 =?utf-8?B?ajRqU0N2NTRQYm9IYkFoN1RROU9WVFQ0ODRrMUhyazF4T1dPYUFrQTk0amcv?=
 =?utf-8?B?bDJIL2JGL1dmZ0VDRTAwYTdZMEhxK3hFRXRUSHhab1lpOU1QcmlRWTZJaGU4?=
 =?utf-8?B?bk83TlpiekRnMTA0WFdXczZFbmhDWHhndjFWTUR3Tis4Rklmcm9BdWlHZkt1?=
 =?utf-8?B?ckZrM1h0ajc5QWt5cEhVLytONmpSOFFWVW1GMGdZT0dVSktzYzY3RmhiUktU?=
 =?utf-8?B?c3VKV2kvU0prRXVZemZmWDdKaXd5d2JHemtMTWYyMEpvRlhuQVJPL0V0ekJV?=
 =?utf-8?B?MkQzZzhaMFZPZi92aGQwK3g5R0JMR0N3cmVUY0FDNWNIc255bEZnc2lLamQy?=
 =?utf-8?B?NTViWGNxK045U3hjUEdxcElLVVE1NWxwdUk4RHlUdWVpTWpTMlVzR2sxYTlZ?=
 =?utf-8?B?cU1IejlpYUxaYjQ1VzZwOGN2emZYaUk1WUZuRUZyMUJQWmpJZVlubkNzR1J0?=
 =?utf-8?B?MDRqTmlTeVVpMkE3VldHc3ZKcXZVakRUekdNbXJWZGl1Z1U2RnhvODFsaUdo?=
 =?utf-8?B?RVJnVnFUN3VoaVQ3Q0s5aXFOcDIvUlVNV1I0MDNjMGIweDJ5MW5SbzJBYUps?=
 =?utf-8?B?RDArT3dnVEZSdUE2cW1OZ2lVZHBxSTJtM0xQNm9pN0F2LzBUSGtwZkd5KzBD?=
 =?utf-8?B?amZ5Y2w0cGxhN2FxVGRWWS91QUpHQ1ZFSXkwSVBwY09wNlF3M1psYUhtQ2hC?=
 =?utf-8?B?SFlKMlNUNjJkb0hISHFmYVE3TDQrYTBQai82ZzUxS1ptNldTK3ZXb1BQLzFP?=
 =?utf-8?B?by9RbTRnaXU2by9qZTRyVmNxRXdtZitTOVJGMXJtMlRpYUlLNnplMVp5KzRv?=
 =?utf-8?B?czQrNGUrL3REdHFnc0VkWGFJQWx4clZ4ZzNVRmhaNjdQS0dBNGJRMWJpV1NC?=
 =?utf-8?B?ZFFpVDd5bVZUU2lLTFlhTnJWR08xcVB6d2Vva0pGUDVEbUlWMWFqWHl2REx1?=
 =?utf-8?B?R1B5QnJzcWlteWsvZWJvVHpQT0wxRnd2SDJ1Ung2NHlITE12V21HV3pVS1U3?=
 =?utf-8?B?WHpZeVJYdXptTHlZZ1hKZzljQjRRNHYzTzlxUHEvL0dEY0txNktIZVVaUDBG?=
 =?utf-8?B?bEhZdlIvZW5MNDBmMVlUS3FwZHp3ZDQwM3lteUIvL3VhdE5ZaDFnYXc2SUVm?=
 =?utf-8?B?VHJEeEJxOGtsN0w3ZHlkekdVbXVRakpqY2UvZ3FMZEhkU1pVWXkzWi9vOURT?=
 =?utf-8?Q?3Opa513KDFjWPXDI=3D?=
X-Exchange-RoutingPolicyChecked: Jdsu0AvXAIKYK1NgtBM3jSR2+WQGQ+mmKhyay5O4atKmrD76CpWvx2KMIQlyVe3ZjZVcynmHloK05lKsr5sN8ChZw7n9Whulc2IGORvZWyze0id96LGvHFYBaBK+4DlDfSABeZ9aHk0ypn0BIadHN4fUi5ZEePLe7iBmLLBW1NcCUwGHFTsAQGrB7CSk5SVO/9aPaS3risiThmfZVNM5b4yqEzDHb3NnPNlP1Y97voteCtJ4NyFi9yAZgs6K32t+JDquuKPeG3VEAsWMue6UUKq9KTGKw7iRsye/wYToKAKIbRy293/3S4/KN8K+luEDV+HqoiEDQPhqmPYg/JA3ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: af660dcb-1fac-4d5f-e4a7-08def1675965
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:58:51.9906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAO+o7PVeStfMMXWet2LysI0kggNxclYiabszQnl0qlUV2Yi5gUShBsE216ZH9Bz68W0++r7o9t9TqZxH9Smrq5WvUZNWAx7sOB4RLgeFl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Wed, Jul 29, 2026 at 11:20:39AM -0700, Matthew Brost wrote:
> On Wed, Jul 29, 2026 at 02:31:38PM +0200, Francois Dugast wrote:
> > Hi,
> > 
> > Patch size makes review a bit longer but I cannot suggest a good way to break
> > it down.
> > 
> > On Fri, Jul 24, 2026 at 04:25:57PM -0700, Matthew Brost wrote:
> > > Some Xe platforms can generate pagefault storms where many faults target
> > > the same address range in a short time window (e.g. many EU threads
> > > faulting the same page). The current worker/locking model effectively
> > > serializes faults for a given range and repeatedly performs VMA/range
> > > lookups for each fault, which creates head-of-queue blocking and wastes
> > > CPU in the hot path.
> > > 
> > > Introduce a page fault chaining cache that coalesces faults targeting
> > > the samr ASID and address range.
> > 
> > s/samr/same/
> > 
> 
> +1
> 
> > > 
> > > Each worker tracks the active fault range it is servicing. Fault entries
> > > reside in stable queue storage, allowing the IRQ handler to match new
> > > faults against the worker cache and directly chain cache hits onto the
> > > active entry without allocation or waiting for dequeue. Once the leading
> > > fault completes, the worker acknowledges the entire chain.
> > > 
> > > A small allocation state is added to each entry so queue, worker, and
> > > IRQ pathd can safely reference the same fault object. This prevents
> > 
> > s/pathd/paths/
> > 
> 
> +1
> 
> > > reuse while the fault is active and guarantees that chained faults
> > > remain valid until acknowledged.
> > > 
> > > Fault handlers also record the serviced range so subsequent faults can
> > > be acknowledged without re-running the full resolution path.
> > > 
> > > This removes repeated fault resolution during fault storms and
> > > significantly improves forward progress in SVM workloads.
> > > 
> > > Since threaded prefetches now use a dedicated prefetch workqueue
> > > (usm.prefetch_wq) rather than sharing the page fault workqueue, page
> > > fault servicing can no longer deadlock on vm->lock, so this cache does
> > > not need an -EAGAIN retry path for a failed vm->lock acquisition.
> > > 
> > > Assisted-by: ChatGPT:gpt-5 # Documentation
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> > 
> > Please remove this "Co-authored-by".
> > 
> > (Already mentioned in patch #3 but repeating here not to forget)
> > 
> 
> +1
> 
> > > ---
> > >  drivers/gpu/drm/xe/xe_pagefault.c       | 435 +++++++++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_pagefault.h       |  71 ++++
> > >  drivers/gpu/drm/xe/xe_pagefault_types.h |  81 +++--
> > >  drivers/gpu/drm/xe/xe_svm.c             |  16 +-
> > >  drivers/gpu/drm/xe/xe_svm.h             |   9 +-
> > >  5 files changed, 527 insertions(+), 85 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index 65be8dd09e2f..b897698a4cfc 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -35,6 +35,70 @@
> > >   * xe_pagefault.c implements the consumer layer.
> > >   */
> > >  
> > > +/**
> > > + * DOC: Xe page fault cache
> > > + *
> > > + * Some Xe hardware can trigger “fault storms,” which are many page faults to
> > > + * the same address within a short period of time. An example is many EU threads
> > > + * faulting on the same page simultaneously. With the current page fault locking
> > > + * structure, only one page fault for a given address range can be processed at
> > > + * a time. This causes head-of-queue blocking across workers, killing
> > > + * parallelism. If the page fault handler must repeatedly look up resources
> > > + * (VMAs, ranges) to determine that the pages are valid for each fault in the
> > > + * storm, the time complexity grows rapidly.
> > > + *
> > > + * To address this, each page fault worker maintains a cache of the active fault
> > > + * being processed. Subsequent faults that hit in the cache are chained to the
> > > + * pending fault, and all chained faults are acknowledged once the initial fault
> > > + * completes. This alleviates head-of-queue blocking and quickly chains faults
> > > + * in the upper layers, avoiding expensive lookups in the main fault-handling
> > > + * path.
> > > + *
> > > + * Faults are buffered in the page fault queue in a way that provides stable
> > > + * storage for outstanding faults. In particular, faults may be chained directly
> > > + * while still resident in the queue storage (i.e., outside the worker’s current
> > > + * head/tail dequeue position). This allows the IRQ handler to match newly
> > > + * arrived faults against the per-worker cache and immediately chain cache hits
> > > + * onto the active fault under the queue lock, without allocating memory or
> > > + * waiting for the worker to pop the fault first.
> > > + *
> > > + * A per-fault state field is used to assert correctness of these invariants.
> > > + * The state tracks whether an entry is free, queued, chained, or currently
> > > + * active. Transitions are performed under the page fault queue lock, and the
> > > + * worker acknowledges faults by walking the chain and returning entries to the
> > > + * free state once they are complete.
> > > + */
> > > +
> > > +/**
> > > + * enum xe_pagefault_alloc_state - lifetime state for a page fault queue entry
> > > + * @XE_PAGEFAULT_ALLOC_STATE_FREE:
> > > + *	Entry is unused and may be overwritten by the producer, consumer retry
> > > + *	or requeue..
> > > + * @XE_PAGEFAULT_ALLOC_STATE_QUEUED:
> > > + *	Entry has been enqueued and may be dequeued by a worker.
> > > + * @XE_PAGEFAULT_ALLOC_STATE_ACTIVE:
> > > + *	Entry has been dequeued and is the worker's currently serviced fault.
> > > + *	The worker may attach additional faults to it via consumer.next.
> > > + * @XE_PAGEFAULT_ALLOC_STATE_CHAINED:
> > > + *	Entry is not independently serviced; it has been chained onto an
> > > + *	ACTIVE entry via consumer.next and will be acknowledged when the
> > > + *	leading fault completes.
> > > + *
> > > + * The page fault queue provides stable storage for outstanding faults so the
> > > + * IRQ handler can chain new cache hits directly onto a worker's active fault.
> > > + * Because entries may remain referenced outside the consumer dequeue window,
> > > + * the producer must only write into entries in the FREE state.
> > > + *
> > > + * State transitions are protected by the page fault queue lock. Workers return
> > > + * entries to FREE after acknowledging the fault (either as ACTIVE or CHAINED).
> > > + */
> > > +enum xe_pagefault_alloc_state {
> > > +	XE_PAGEFAULT_ALLOC_STATE_FREE		= 0,
> > > +	XE_PAGEFAULT_ALLOC_STATE_QUEUED		= 1,
> > > +	XE_PAGEFAULT_ALLOC_STATE_CHAINED	= 2,
> > > +	XE_PAGEFAULT_ALLOC_STATE_ACTIVE		= 3,
> > > +};
> > > +
> > >  static int xe_pagefault_entry_size(void)
> > >  {
> > >  	/*
> > > @@ -77,7 +141,7 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> > >  }
> > >  
> > >  static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> > > -				   bool atomic)
> > > +				   struct xe_pagefault *pf, bool atomic)
> > >  {
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > @@ -102,8 +166,11 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> > >  
> > >  	/* Check if VMA is valid, opportunistic check only */
> > >  	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> > > -					vma->tile_invalidated) && !atomic)
> > > +					vma->tile_invalidated) && !atomic) {
> > > +		xe_pagefault_set_start_addr(pf, xe_vma_start(vma));
> > > +		xe_pagefault_set_end_addr(pf, xe_vma_end(vma));
> > >  		return 0;
> > > +	}
> > >  
> > >  	do {
> > >  		if (xe_vma_is_userptr(vma) &&
> > > @@ -141,6 +208,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> > >  	} while (err == -EAGAIN);
> > >  
> > >  	if (!err) {
> > > +		/* Give hint to immediately ack faults */
> > > +		xe_pagefault_set_start_addr(pf, xe_vma_start(vma));
> > > +		xe_pagefault_set_end_addr(pf, xe_vma_end(vma));
> > > +
> > >  		dma_fence_wait(fence, false);
> > >  		dma_fence_put(fence);
> > >  	}
> > > @@ -208,10 +279,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
> > >  	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
> > >  
> > >  	if (xe_vma_is_cpu_addr_mirror(vma))
> > > -		err = xe_svm_handle_pagefault(vm, vma, gt,
> > > +		err = xe_svm_handle_pagefault(vm, vma, pf, gt,
> > >  					      pf->consumer.page_addr, atomic);
> > >  	else
> > > -		err = xe_pagefault_handle_vma(gt, vma, atomic);
> > > +		err = xe_pagefault_handle_vma(gt, vma, pf, atomic);
> > >  
> > >  unlock_vm:
> > >  	up_read(&vm->lock);
> > > @@ -220,21 +291,221 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
> > >  	return err;
> > >  }
> > >  
> > > -static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> > > -				   struct xe_pagefault *pf)
> > > +#define XE_PAGEFAULT_CACHE_START_INVALID	U64_MAX
> > > +#define xe_pagefault_cache_start_invalidate(val)	\
> > > +	(val = XE_PAGEFAULT_CACHE_START_INVALID)
> > > +
> > > +static void
> > > +xe_pagefault_cache_invalidate(struct xe_pagefault_queue *pf_queue,
> > > +			      struct xe_pagefault_work *pf_work)
> > >  {
> > > -	bool found_fault = false;
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	xe_pagefault_cache_start_invalidate(pf_work->cache.start);
> > > +}
> > > +
> > > +static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> > > +{
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> > > +			  pf_queue->size) <= xe_pagefault_entry_size();
> > > +}
> > > +
> > > +static struct xe_pagefault *
> > > +xe_pagefault_queue_add(struct xe_pagefault_queue *pf_queue,
> > > +		       struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
> > > +					    usm.pf_queue);
> > > +	struct xe_pagefault *lpf;
> > > +
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	do {
> > > +		/* Not possible, warn on and drop page fault */
> > > +		if (WARN_ON(xe_pagefault_queue_full(pf_queue)))
> > > +			return NULL;
> > >  
> > > -	spin_lock_irq(&pf_queue->lock);
> > > -	if (pf_queue->tail != pf_queue->head) {
> > > -		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
> > > -		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
> > > +		lpf = (pf_queue->data + pf_queue->head);
> > > +		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> > >  			pf_queue->size;
> > > -		found_fault = true;
> > > +	} while (lpf->consumer.alloc_state != XE_PAGEFAULT_ALLOC_STATE_FREE);
> > > +
> > > +	xe_assert(xe, lpf != pf);
> > > +	memcpy(lpf, pf, sizeof(*pf));
> > > +	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_QUEUED;
> > > +
> > > +	return lpf;
> > > +}
> > > +
> > > +static struct xe_pagefault *
> > > +xe_pagefault_queue_unchain_requeue(struct xe_pagefault_queue *pf_queue,
> > > +				   struct xe_pagefault *pf, struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
> > > +					    usm.pf_queue);
> > > +	struct xe_pagefault *next = pf->consumer.next, *lpf;
> > > +
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +	xe_assert(xe, pf->consumer.alloc_state ==
> > > +		  XE_PAGEFAULT_ALLOC_STATE_CHAINED);
> > > +
> > > +	pf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_FREE;
> > > +	lpf = xe_pagefault_queue_add(pf_queue, pf);
> > > +	if (lpf) {
> > > +		lpf->consumer.next = NULL;
> > > +		lpf->consumer.fault_type_level |= XE_PAGEFAULT_REQUEUE_MASK;
> > > +	}
> > > +
> > > +	return next;
> > > +}
> > > +
> > > +static bool xe_pagefault_match(struct xe_pagefault *pf, u64 start,
> > > +			       u64 end, u64 cache_asid)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(pf->gt);
> > > +	u64 page_addr = pf->consumer.page_addr;
> > > +	u32 pf_asid = pf->consumer.asid;
> > > +
> > > +	xe_assert(xe, pf->consumer.alloc_state !=
> > > +		  XE_PAGEFAULT_ALLOC_STATE_FREE);
> > > +
> > > +	return page_addr >= start && page_addr < end &&
> > > +		pf_asid == cache_asid;
> > > +}
> > 
> > Sashiko's comment here seems valid: access type should be taken into consideration
> > when evaluating if the page faults match (atomic).
> > 
> 
> I don't think that is a major concern. Generally, when we move memory,
> you end up with the highest permission level available. Atomics are an
> exception because we typically have to move the memory. We more or less
> always attempt a move, but we try much harder for atomics.
> 
> If, for some reason, we encounter a read or write fault, fail to move
> the memory, and then chain an atomic fault and acknowledgment, the
> worst-case outcome is that the atomic operation will fault again, and
> we'll handle it at that point.

Sounds reasonable, thanks for clarifying.

Francois

> 
> > > +
> > > +static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
> > > +				   struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
> > > +					    usm.pf_queue);
> > > +	struct xe_pagefault_work *pf_work;
> > > +	bool requeue = FIELD_GET(XE_PAGEFAULT_REQUEUE_MASK,
> > > +				 pf->consumer.fault_type_level);
> > > +	int i;
> > > +
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +	xe_assert(xe, pf->consumer.alloc_state ==
> > > +		  XE_PAGEFAULT_ALLOC_STATE_QUEUED);
> > > +
> > > +	/*
> > > +	 * If this is a retry, we may already have a chain attached. In that
> > > +	 * case, we cannot hit in the cache because chains cannot easily be
> > > +	 * combined.
> > > +	 */
> > > +	if (pf->consumer.next)
> > > +		return false;
> > > +
> > > +	for (i = 0, pf_work = xe->usm.pf_workers;
> > > +	     i < xe->info.num_pf_work; ++i, ++pf_work) {
> > > +		u64 start = pf_work->cache.start;
> > > +		u64 end = requeue ? start + SZ_4K : pf_work->cache.end;
> > > +		u32 asid = pf_work->cache.asid;
> > > +
> > > +		if (xe_pagefault_match(pf, start, end, asid)) {
> > > +			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
> > > +				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > > +
> > > +			pf->consumer.alloc_state =
> > > +				XE_PAGEFAULT_ALLOC_STATE_CHAINED;
> > > +			pf->consumer.next = pf_work->cache.pf->consumer.next;
> > > +			pf_work->cache.pf->consumer.next = pf;
> > > +
> > > +			return true;
> > > +		}
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +static void xe_pagefault_queue_advance(struct xe_pagefault_queue *pf_queue)
> > > +{
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
> > > +		pf_queue->size;
> > > +}
> > > +
> > > +static struct xe_pagefault *
> > > +xe_pagefault_queue_tail_fault(struct xe_pagefault_queue *pf_queue)
> > > +{
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	return pf_queue->data + pf_queue->tail;
> > > +}
> > > +
> > > +static bool xe_pagefault_queue_empty(struct xe_pagefault_queue *pf_queue)
> > > +{
> > > +	lockdep_assert_held(&pf_queue->lock);
> > > +
> > > +	return pf_queue->head == pf_queue->tail;
> > > +}
> > > +
> > > +static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> > > +				   struct xe_pagefault **pf, int id)
> > > +{
> > > +	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
> > > +					    usm.pf_queue);
> > > +	struct xe_pagefault_work *pf_work;
> > > +	struct xe_pagefault *lpf;
> > > +	size_t align = SZ_2M;
> > > +
> > > +	guard(spinlock_irq)(&pf_queue->lock);
> > > +
> > > +	for (*pf = NULL; !*pf;) {
> > > +		if (xe_pagefault_queue_empty(pf_queue))
> > > +			return false;
> > > +
> > > +		lpf = xe_pagefault_queue_tail_fault(pf_queue);
> > > +		xe_pagefault_queue_advance(pf_queue);
> > > +
> > > +		if (lpf->consumer.alloc_state !=
> > > +		    XE_PAGEFAULT_ALLOC_STATE_QUEUED)
> > > +			continue;
> > > +
> > > +		if (xe_pagefault_try_chain(pf_queue, lpf))
> > > +			continue;
> > > +
> > > +		*pf = lpf;	/* Hand back page fault for processing */
> > > +	}
> > > +
> > > +	/*
> > > +	 * No cache hit; allocate a new cache entry. We assume most faults
> > > +	 * within a 2M range will hit the same pages. If this assumption proves
> > > +	 * false, the mismatched fault is requeued after the initial fault is
> > > +	 * acknowledged.
> > > +	 */
> > > +	pf_work = xe->usm.pf_workers + id;
> > > +	if (FIELD_GET(XE_PAGEFAULT_REQUEUE_MASK,
> > > +		      lpf->consumer.fault_type_level))
> > > +		align = SZ_4K;
> > > +	pf_work->cache.start = ALIGN_DOWN(lpf->consumer.page_addr, align);
> > > +	pf_work->cache.end = pf_work->cache.start + align;
> > > +	pf_work->cache.asid = lpf->consumer.asid;
> > > +	pf_work->cache.pf = lpf;
> > > +	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> > > +
> > > +	/* Drain queue until empty or new fault found */
> > > +	while (1) {
> > > +		if (xe_pagefault_queue_empty(pf_queue))
> > > +			break;
> > > +
> > > +		lpf = xe_pagefault_queue_tail_fault(pf_queue);
> > > +
> > > +		if (lpf->consumer.alloc_state !=
> > > +		    XE_PAGEFAULT_ALLOC_STATE_QUEUED) {
> > > +			xe_pagefault_queue_advance(pf_queue);
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!xe_pagefault_try_chain(pf_queue, lpf))
> > > +			break;
> > > +
> > > +		xe_pagefault_queue_advance(pf_queue);
> > >  	}
> > > -	spin_unlock_irq(&pf_queue->lock);
> > >  
> > > -	return found_fault;
> > > +	return true;
> > >  }
> > >  
> > >  static void xe_pagefault_print(struct xe_pagefault *pf)
> > > @@ -295,36 +566,83 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  		container_of(w, typeof(*pf_work), work);
> > >  	struct xe_device *xe = pf_work->xe;
> > >  	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> > > -	struct xe_pagefault pf;
> > > +	struct xe_pagefault *pf;
> > >  	ktime_t start = xe_gt_stats_ktime_get();
> > > -	struct xe_gt *gt = NULL;
> > >  	unsigned long threshold;
> > > +	u64 cache_start = XE_PAGEFAULT_CACHE_START_INVALID, cache_end = 0;
> > > +	u32 cache_asid = 0;
> > >  
> > >  #define USM_QUEUE_MAX_RUNTIME_MS      20
> > >  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > >  
> > > -	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> > > -		int err;
> > > +	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> > > +		struct xe_gt *gt = pf->gt;
> > > +		u32 asid = pf->consumer.asid;
> > > +		int err = 0;
> > > +		bool invalidated = false;
> > >  
> > > -		if (!pf.gt)	/* Fault squashed during reset */
> > > -			continue;
> > > +		/* Last fault same address, ack immediately */
> > > +		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid))
> > > +			goto ack_fault;
> > > +
> > > +		err = xe_pagefault_service(pf);
> > >  
> > > -		gt = pf.gt;
> > > -		err = xe_pagefault_service(&pf);
> > >  		if (err) {
> > > -			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > > -				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> > > -				xe_pagefault_print(&pf);
> > > -				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> > > +			if (!(pf->consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > > +				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
> > > +				xe_pagefault_cache_start_invalidate(cache_start);
> > > +				xe_pagefault_print(pf);
> > > +				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
> > >  					   ERR_PTR(err));
> > >  			} else {
> > > -				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> > > -				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
> > > +				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> > > +				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
> > >  					  ERR_PTR(err));
> > >  			}
> > > +		} else {
> > > +			/* Cache valid fault locally */
> > > +			cache_start = xe_pagefault_start_addr(pf);
> > > +			cache_end = xe_pagefault_end_addr(pf);
> > > +			cache_asid = asid;
> > >  		}
> > >  
> > > -		pf.producer.ops->ack_fault(&pf, err);
> > > +ack_fault:
> > > +		xe_assert(xe, pf->consumer.alloc_state ==
> > > +			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > > +		xe_assert(xe, pf == pf_work->cache.pf);
> > > +
> > > +		while (pf) {
> > > +			xe_assert(xe, pf->consumer.alloc_state ==
> > > +				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > > +
> > > +			pf->producer.ops->ack_fault(pf, err);
> > > +
> > > +			spin_lock_irq(&pf_queue->lock);
> > > +
> > > +			if (!invalidated) {
> > > +				invalidated = true;
> > > +				xe_pagefault_cache_invalidate(pf_queue,
> > > +							      pf_work);
> > > +			}
> > > +
> > > +			pf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_FREE;
> > > +			pf = pf->consumer.next;
> > > +
> > > +			/*
> > > +			 * Requeue chained faults which do not match the last
> > > +			 * fault processed
> > > +			 */
> > > +			while (pf && !xe_pagefault_match(pf, cache_start,
> > > +							 cache_end, cache_asid))
> > > +				pf = xe_pagefault_queue_unchain_requeue(pf_queue, pf, gt);
> > > +
> > > +
> > 
> > Extra blank line.
> > 
> 
> Will fix.
> 
> > > +			/* Ensure resets are safe */
> > > +			if (pf)
> > > +				pf->consumer.alloc_state =
> > > +					XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> > > +			spin_unlock_irq(&pf_queue->lock);
> > > +		}
> > >  
> > >  		if (time_after(jiffies, threshold)) {
> > >  			queue_work(xe->usm.pagefault_wq, w);
> > > @@ -333,10 +651,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  	}
> > >  #undef USM_QUEUE_MAX_RUNTIME_MS
> > >  
> > > -	if (gt)
> > > -		xe_gt_stats_incr(xe_root_mmio_gt(gt_to_xe(gt)),
> > > -				 XE_GT_STATS_ID_PAGEFAULT_US,
> > > -				 xe_gt_stats_ktime_us_delta(start));
> > > +	xe_gt_stats_incr(xe_root_mmio_gt(xe), XE_GT_STATS_ID_PAGEFAULT_US,
> > > +			 xe_gt_stats_ktime_us_delta(start));
> > >  }
> > >  
> > >  static int xe_pagefault_queue_init(struct xe_device *xe,
> > > @@ -431,6 +747,7 @@ int xe_pagefault_init(struct xe_device *xe)
> > >  
> > >  		pf_work->xe = xe;
> > >  		pf_work->id = i;
> > > +		xe_pagefault_cache_start_invalidate(pf_work->cache.start);
> > >  		INIT_WORK(&pf_work->work, xe_pagefault_queue_work);
> > >  	}
> > >  
> > > @@ -454,15 +771,23 @@ static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
> > >  
> > >  	/* Squash all pending faults on the GT */
> > >  
> > > -	spin_lock_irq(&pf_queue->lock);
> > > -	for (i = pf_queue->tail; i != pf_queue->head;
> > > -	     i = (i + xe_pagefault_entry_size()) % pf_queue->size) {
> > > +	guard(spinlock_irq)(&pf_queue->lock);
> > > +
> > > +	for (i = 0; i < pf_queue->size; i += xe_pagefault_entry_size()) {
> > >  		struct xe_pagefault *pf = pf_queue->data + i;
> > > +		bool active = pf->consumer.alloc_state ==
> > > +			XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> > >  
> > > -		if (pf->gt == gt)
> > > -			pf->gt = NULL;
> > > +		if (pf->gt != gt || active) {
> > > +			if (active)
> > > +				pf->consumer.next = NULL;
> > > +			continue;
> > > +		}
> > > +
> > > +		pf->consumer.alloc_state =
> > > +			XE_PAGEFAULT_ALLOC_STATE_FREE;
> > > +		pf->consumer.next = NULL;
> > >  	}
> > > -	spin_unlock_irq(&pf_queue->lock);
> > >  }
> > >  
> > >  /**
> > > @@ -478,14 +803,6 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > >  	xe_pagefault_queue_reset(xe, gt, &xe->usm.pf_queue);
> > >  }
> > >  
> > > -static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> > > -{
> > > -	lockdep_assert_held(&pf_queue->lock);
> > > -
> > > -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, pf_queue->size) <=
> > > -		xe_pagefault_entry_size();
> > > -}
> > > -
> > >  /*
> > >   * This function can race with multiple page fault producers, but worst case we
> > >   * stick a page fault on the same queue for consumption.
> > > @@ -511,18 +828,28 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > >  {
> > >  	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> > >  	unsigned long flags;
> > > -	int work_index;
> > >  	bool full;
> > >  
> > >  	spin_lock_irqsave(&pf_queue->lock, flags);
> > > -	work_index = xe_pagefault_work_index(xe);
> > >  	full = xe_pagefault_queue_full(pf_queue);
> > >  	if (!full) {
> > > -		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> > > -		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> > > -			pf_queue->size;
> > > -		queue_work(xe->usm.pagefault_wq,
> > > -			   &xe->usm.pf_workers[work_index].work);
> > > +		struct xe_pagefault *lpf;
> > > +		bool empty = xe_pagefault_queue_empty(pf_queue);
> > > +
> > > +		lpf = xe_pagefault_queue_add(pf_queue, pf);
> > > +		if (lpf) {
> > > +			lpf->consumer.next = NULL;
> > > +
> > > +			if (xe_pagefault_try_chain(pf_queue, lpf)) {
> > > +				if (empty)
> > > +					xe_pagefault_queue_advance(pf_queue);
> > > +			} else {
> > > +				int work_index = xe_pagefault_work_index(xe);
> > > +
> > > +				queue_work(xe->usm.pagefault_wq,
> > > +					   &xe->usm.pf_workers[work_index].work);
> > > +			}
> > > +		}
> > >  	} else {
> > >  		drm_warn(&xe->drm,
> > >  			 "PageFault Queue full, shouldn't be possible\n");
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> > > index bd0cdf9ed37f..feaf2a69674a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.h
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > @@ -6,6 +6,8 @@
> > >  #ifndef _XE_PAGEFAULT_H_
> > >  #define _XE_PAGEFAULT_H_
> > >  
> > > +#include "xe_pagefault_types.h"
> > > +
> > >  struct xe_device;
> > >  struct xe_gt;
> > >  struct xe_pagefault;
> > > @@ -16,4 +18,73 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > >  
> > >  int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > >  
> > > +#define XE_PAGEFAULT_END_ADDR_MASK	(~0xfffull)
> > > +
> > > +/**
> > > + * xe_pagefault_set_end_addr() - store serviced range end for a pagefault
> > > + * @pf: Pagefault entry
> > > + * @end_addr: Inclusive end address of the serviced fault range
> > > + *
> > > + * The pagefault consumer stores the resolved fault range so subsequent faults
> > > + * hitting the same range can be immediately acknowledged without re-running
> > > + * the full fault handling path.
> > > + *
> > > + * The end address shares storage with other consumer metadata and therefore
> > > + * must be masked with %XE_PAGEFAULT_END_ADDR_MASK before storing. Bits outside
> > > + * the mask are reserved for internal state tracking and must be preserved.
> > > + */
> > > +static inline void
> > > +xe_pagefault_set_end_addr(struct xe_pagefault *pf, u64 end_addr)
> > > +{
> > > +	pf->consumer.end_addr &= ~XE_PAGEFAULT_END_ADDR_MASK;
> > > +	pf->consumer.end_addr |= end_addr;
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_end_addr() - read serviced range end for a pagefault
> > > + * @pf: Pagefault entry
> > > + *
> > > + * Returns the inclusive end address of the range previously recorded by
> > > + * xe_pagefault_set_end_addr(). Only the bits covered by
> > > + * %XE_PAGEFAULT_END_ADDR_MASK are returned; other bits in the storage are
> > > + * reserved for internal state.
> > > + *
> > > + * Return: End address of the serviced fault range.
> > > + */
> > > +static inline u64 xe_pagefault_end_addr(struct xe_pagefault *pf)
> > > +{
> > > +	return pf->consumer.end_addr & XE_PAGEFAULT_END_ADDR_MASK;
> > > +}
> > > +
> > > +#undef XE_PAGEFAULT_END_ADDR_MASK
> > > +
> > > +/**
> > > + * xe_pagefault_set_start_addr() - store serviced range start for a pagefault
> > > + * @pf: Pagefault entry
> > > + * @start_addr: Start address of the serviced fault range
> > > + *
> > > + * The pagefault consumer stores the resolved fault range so subsequent faults
> > > + * hitting the same range can be immediately acknowledged without re-running
> > > + * the full fault handling path.
> > > + */
> > > +static inline void
> > > +xe_pagefault_set_start_addr(struct xe_pagefault *pf, u64 start_addr)
> > > +{
> > > +	pf->consumer.page_addr = start_addr;
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_start_addr() - read serviced range start for a pagefault
> > > + * @pf: Pagefault entry
> > > + *
> > > + * Returns the inclusive start address of the range previously recorded by
> > > + * xe_pagefault_set_start_addr().
> > > + *
> > > + * Return: Start address of the serviced fault range.
> > > + */
> > > +static inline u64 xe_pagefault_start_addr(struct xe_pagefault *pf)
> > > +{
> > > +	return pf->consumer.page_addr;
> > > +}
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > index d349d79bc95e..a1fff0e47fa5 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > @@ -60,36 +60,58 @@ struct xe_pagefault {
> > >  	/**
> > >  	 * @consumer: State for the software handling the fault. Populated by
> > >  	 * the producer and may be modified by the consumer to communicate
> > > -	 * information back to the producer upon fault acknowledgment.
> > > +	 * information back to the producer upon fault acknowledgment. After
> > > +	 * fault acknowledgment, the producer should only access consumer fields
> > > +	 * via well defined helpers.
> > >  	 */
> > >  	struct {
> > > -		/** @consumer.page_addr: address of page fault */
> > > -		u64 page_addr;
> > > -		/** @consumer.asid: address space ID */
> > > -		u32 asid;
> > >  		/**
> > > -		 * @consumer.access_type: access type and prefetch flag packed
> > > -		 * into a u8.
> > > +		 * @consumer.page_addr: address of page fault, populated by
> > > +		 * consumer after fault completion
> > >  		 */
> > > -		u8 access_type;
> > > +		u64 page_addr;
> > > +		union {
> > > +			struct {
> > > +				/**
> > > +				 * @consumer.alloc_state: page fault allocation
> > > +				 * state
> > > +				 */
> > > +				u8 alloc_state;
> > > +				/**
> > > +				 * @consumer.access_type: access type, u8 rather
> > > +				 * than enum to keep size compact
> > > +				 */
> > > +				u8 access_type;
> > >  #define XE_PAGEFAULT_ACCESS_TYPE_MASK	GENMASK(1, 0)
> > >  #define XE_PAGEFAULT_ACCESS_PREFETCH	BIT(7)
> > > -		/**
> > > -		 * @consumer.fault_type_level: fault type and level, u8 rather
> > > -		 * than enum to keep size compact
> > > -		 */
> > > -		u8 fault_type_level;
> > > +				/**
> > > +				 * @consumer.fault_type_level: fault type and
> > > +				 * level, u8 rather than enum to keep size
> > > +				 * compact
> > > +				 */
> > > +				u8 fault_type_level;
> > >  #define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > > -#define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
> > > -#define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
> > > -		/** @consumer.engine_class_instance: engine class and instance */
> > > -		u8 engine_class_instance;
> > > +#define XE_PAGEFAULT_LEVEL_MASK			GENMASK(2, 0)
> > > +#define XE_PAGEFAULT_TYPE_MASK			GENMASK(6, 3)
> > > +#define XE_PAGEFAULT_REQUEUE_MASK		BIT(7)
> > > +				/** @consumer.engine_class_instance: engine class and instance */
> > > +				u8 engine_class_instance;
> > >  #define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
> > >  #define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
> > > -		/** @pad: alignment padding */
> > > -		u8 pad;
> > > -		/** @consumer.reserved: reserved bits for future expansion */
> > > -		u64 reserved;
> > > +				/** @consumer.asid: address space ID */
> > > +				u32 asid;
> > > +			};
> > > +			/**
> > > +			 * @consumer.end_addr: end address of page fault,
> > > +			 * populated by consumer after fault completion
> > > +			 */
> > > +			u64 end_addr;
> > > +		};
> > > +		/**
> > > +		 * @consumer.next: next pagefault chained to this fault,
> > > +		 * protected by pf_queue lock
> > > +		 */
> > > +		struct xe_pagefault *next;
> > >  	} consumer;
> > >  	/**
> > >  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > > @@ -131,7 +153,7 @@ struct xe_pagefault_queue {
> > >  	u32 head;
> > >  	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > >  	u32 tail;
> > > -	/** @lock: protects page fault queue */
> > > +	/** @lock: protects page fault queue, workers caches */
> > >  	spinlock_t lock;
> > >  };
> > >  
> > > @@ -146,6 +168,21 @@ struct xe_pagefault_work {
> > >  	struct xe_device *xe;
> > >  	/** @id: Identifier for this work item */
> > >  	int id;
> > > +	/**
> > > +	 * @cache: Page fault cache for the currently processed fault
> > > +	 *
> > > +	 * Protected by the page fault queue lock.
> > > +	 */
> > > +	struct {
> > > +		/** @cache.start: Start address of the current page fault */
> > > +		u64 start;
> > > +		/** @cache.end: End address of the current page fault */
> > > +		u64 end;
> > > +		/** @cache.asid: Address space ID of the current page fault */
> > > +		u32 asid;
> > > +		/** @cache.pf: Pointer to the current page fault */
> > > +		struct xe_pagefault *pf;
> > > +	} cache;
> > >  	/** @work: Work item used to process the page fault */
> > >  	struct work_struct work;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 6a470a02fee7..627a741293d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -15,6 +15,7 @@
> > >  #include "xe_gt_stats.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_module.h"
> > > +#include "xe_pagefault.h"
> > >  #include "xe_pm.h"
> > >  #include "xe_pt.h"
> > >  #include "xe_svm.h"
> > > @@ -1264,8 +1265,8 @@ DECL_SVM_RANGE_US_STATS(bind, BIND)
> > >  DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
> > >  
> > >  static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > -				     struct xe_gt *gt, u64 fault_addr,
> > > -				     bool need_vram)
> > > +				     struct xe_pagefault *pf, struct xe_gt *gt,
> > > +				     u64 fault_addr, bool need_vram)
> > >  {
> > >  	int devmem_possible = IS_DGFX(vm->xe) &&
> > >  		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > > @@ -1424,6 +1425,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> > >  
> > >  out:
> > > +	/* Give hint to immediately ack faults */
> > > +	xe_pagefault_set_start_addr(pf,  xe_svm_range_start(range));
> > > +	xe_pagefault_set_end_addr(pf, xe_svm_range_end(range));
> > > +
> > 
> > I have not checked the GT stats from later patches in the series but are we able
> > to chain enough faults by setting start/end so late during page fault handling?
> > 
> 
> This doesn't affect the chain-building process. We blindly attempt to
> build chains on 2 MB-aligned boundaries. This is about communicating
> back that we serviced for the fault and determining whether faults in
> the chain should be acknowledged or retried. As a result, the placement
> doesn't matter.
> 
> I had considered dynamically updating the chain size/window after
> looking up the range or VMA, but that isn't implemented in this series.
> If we went that route, then yes, we'd want to do it immediately after
> the range/VMA lookup. We'd also probably want to use try-locking on the
> VMA lock to avoid HoQ blocking.
> 
> The chain reconstruction is a bit tricky here, which is why I haven't
> implemented it yet.
> 
> Matt
> 
> > Would there be a way to move it closer to the beginning of
> > __xe_svm_handle_pagefault()?
> > 
> > Francois
> > 
> > >  	xe_svm_range_fault_us_stats_incr(gt, range, start);
> > >  	mutex_unlock(&range->lock);
> > >  	drm_gpusvm_range_put(&range->base);
> > > @@ -1446,6 +1451,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >   * xe_svm_handle_pagefault() - SVM handle page fault
> > >   * @vm: The VM.
> > >   * @vma: The CPU address mirror VMA.
> > > + * @pf: Pagefault structure
> > >   * @gt: The gt upon the fault occurred.
> > >   * @fault_addr: The GPU fault address.
> > >   * @atomic: The fault atomic access bit.
> > > @@ -1456,8 +1462,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >   * Return: 0 on success, negative error code on error.
> > >   */
> > >  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > -			    struct xe_gt *gt, u64 fault_addr,
> > > -			    bool atomic)
> > > +			    struct xe_pagefault *pf, struct xe_gt *gt,
> > > +			    u64 fault_addr, bool atomic)
> > >  {
> > >  	int need_vram, ret;
> > >  retry:
> > > @@ -1465,7 +1471,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  	if (need_vram < 0)
> > >  		return need_vram;
> > >  
> > > -	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
> > > +	ret =  __xe_svm_handle_pagefault(vm, vma, pf, gt, fault_addr,
> > >  					 need_vram ? true : false);
> > >  	if (ret == -EAGAIN) {
> > >  		/*
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 46be2e5c6f7f..2a0dc0d125c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -21,6 +21,7 @@ struct drm_file;
> > >  struct xe_bo;
> > >  struct xe_gt;
> > >  struct xe_device;
> > > +struct xe_pagefault;
> > >  struct xe_vram_region;
> > >  struct xe_tile;
> > >  struct xe_vm;
> > > @@ -109,8 +110,8 @@ void xe_svm_fini(struct xe_vm *vm);
> > >  void xe_svm_close(struct xe_vm *vm);
> > >  
> > >  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > -			    struct xe_gt *gt, u64 fault_addr,
> > > -			    bool atomic);
> > > +			    struct xe_pagefault *pf, struct xe_gt *gt,
> > > +			    u64 fault_addr, bool atomic);
> > >  
> > >  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> > >  
> > > @@ -298,8 +299,8 @@ void xe_svm_close(struct xe_vm *vm)
> > >  
> > >  static inline
> > >  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > -			    struct xe_gt *gt, u64 fault_addr,
> > > -			    bool atomic)
> > > +			    struct xe_pagefault *pf, struct xe_gt *gt,
> > > +			    u64 fault_addr, bool atomic)
> > >  {
> > >  	return 0;
> > >  }
> > > -- 
> > > 2.34.1
> > > 
