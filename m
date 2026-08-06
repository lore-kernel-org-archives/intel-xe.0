Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B29DC56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 20:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A70A10E37C;
	Thu,  6 Aug 2026 20:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOkFBYFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9ED10E37C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 20:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786047517; x=1817583517;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SVUEhAvvv2GivTOWRobv0BrN/nqDf3d5ajg5cf8WRbw=;
 b=WOkFBYFYnR7cvXWay7yx1nWDYoAVLpDELX1lWfDj6vM0pHwCFNhfYQR+
 8VrknBD5EbLEt6E6O28M0WWUQE+B8vbVt/mQ9jAqDYtWZ5Syhn0ozxM/c
 /wkclwvujVIbRthf/mXCkH7v51bQ6H2iYUnV4mJgcpzN0C4UEmizvtU/F
 bm7oqFkC7F4XJhNfaTukUdfomv8dH8w3Zghi70m/niNhcCe+mwp1A9lEI
 iA2KoGZU/kzjE0EmS5eZkuriN7FWe02ZHyof/PtEhmNlNeSgmntvtpyFk
 Jk5J5SBpJ0+vV78Ide2ptcFqRNMph7Uvf6uQn6Pn8zvhb15gzDwPaHbg6 g==;
X-CSE-ConnectionGUID: 6yHV/vKUTHSVaHzMGGCTmQ==
X-CSE-MsgGUID: SKM834EwQBO/MCPPkuZKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90470768"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="90470768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 13:18:36 -0700
X-CSE-ConnectionGUID: rmudbQ74QhK+qgsPcDQAxg==
X-CSE-MsgGUID: iiTFoeG3SBKS99C2+TyW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="262267135"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 13:18:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 13:18:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 13:18:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 13:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjesZQaR16f/t2iWATRP1NthHz9Vb4EzkkXlHdMraPd9QTadeB0ZFjUHqaufLRsaaZNz5jeK7EHsTUL/f6PWjxN4TA2/7mp19q8kXAN0jarbFFShINhUIUhiU6BEgl/4pfxgBFiLcvY8ArctyZkMESyf/t36y0vxlkdKjis6EAv5yeseQVAXxIrJLN5heVnU5mx4LN3g6z1d4qwbhhsgYLF3rWDUNOfWpscRH3HDh2w9SNGxvCPntgbjefY74RKxvcw6yre4m/qrku2RnWgKbnB0JQZLdD8jk/CXhvx5EOFntA1Eflv71rjw6an0e0FlzMe9f/GIQHM3lAr6763kCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC2Hew1wBakSlQVkUQWC4tWo8NHOCuV0pLVU02M1YYc=;
 b=aNf+0xUsVkP2ohBb8cu+0I0xTaBamaY2X1ze0eAyD/hsPQIgq486WqxsJ+L+k+aNsQdvJnWSD/afW3xrAIlsXflC1etSnGHFTDO5BpWrjHFbWrgQcmPT1h2HHcopTKqzNjMcVaIjuFiEGppKYT3Z1mfWJNZZdHRTGWY7p9SyWJVIOuN5IHDbDdk3MEq3ZwluDbov/tkfiFN81O4q3SPNRGt4Ek7BOa+HJKd3RwXJLsnc7eCP4bQ2fpo1BVrvaD4mAMR4KbpDHLy2Ljtb9FeoATMN371E9rUJyKMsCCTmljjF8BJypmezptRO9uT7oOJuhXtLt3MwdPCQJ9jnaYSTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 20:18:25 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 20:18:25 +0000
Date: Thu, 6 Aug 2026 22:18:21 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
Message-ID: <anTsDcQ8CtJjjiVw@fdugast-desk>
References: <20260806185202.3922432-1-matthew.brost@intel.com>
 <20260806185202.3922432-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806185202.3922432-12-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0326.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::31) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb8e92c-9e6b-4a7c-f7a5-08def3f7df00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: pmpn7xmP/hMXOG2oo+hxTFeOfOaBVFgFzWs3l76jtZHbW7uBoMSVRq2C0dbHYACR6V6MQ94YHdwJsZz/NvRNSLZ29mLqK3BXtaienT7kdfR9sPIpuUFkUmdQjFWRL0jopbGaw+HEBZrQnK9ulacYU2hhgzI4eOhYMYeEUTZPGJmEyuh7Yk3mWbJUBSAgWwkoArbM1g7Y7cayrWONUW9YFsFvo2SNWc0JwXBhGJNS7vrwk8lwyD7U6D/WVQLKCT15uuy0jmSKmRJSHsLtGSY1iT40M2ak5mlmV9CixA0/dJXDj4wVAPlNGCs2HGJcG9uBAXilrdrpbVc5Q9s9p+D+/F1LPcCvuI2Q1PuIZE80ub71Uv3g16OpuTSgReO2wVx9La4pIv3n4RtVd4nhy+LJYtxguRB5epuQn+9ukuNgWuvJC15QOYUAcfUhE3paNk8E9qWLbmywL18949Zy9Zqc+3/i2uxCQmssyDdiETplXSWam5uqzY1l1VHY+bGnLHQxC3qHC+XXYcrdKeeYFtSXITnjVrHWIchDGaXwfQHZzAE7WM6OM//etf9TnSOo/k8X7c1NZzPCzgfV0qqHYaGzm/tQbTpEErjEAYld8U905RthzF9fZIFtqDkzNQixIrMMytA0YmCtdbGIQTHfj1okbN4/sBF7xkepgCMf6QzZ0fM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1hCdWZzcUdJUXlPNkNsL1FrdTBNd1NyeFBlOGUyUlNvWkg1VlhYSUtRdDcv?=
 =?utf-8?B?VllJMmhSc1Bwd3BpRUszc2RqTkczVWtBSnRDcWFMbU15TjY0RUxhZEliV3pO?=
 =?utf-8?B?WWZpMjRSVEdudTR1N0VpcDdiSnY1ZFBYeEVZeWtBT3J2cTBBNVljTDFrYlNT?=
 =?utf-8?B?N3dORHR6VHRZWnExcEEwN1pOaE5rMUVReW4yditoaGc0WS9FKzF1QUxoeGJD?=
 =?utf-8?B?aW43UnlKRm1wcUQybUVSTWM0QXVoT3hXbXg3U3NldEVuUkJya1FsdjhQK0s4?=
 =?utf-8?B?aXdQbXhWM01vOEtCMlJ3Mm1RR05VNWN2bThPK2FEeUVRQ0xLbmxjSFl3L3Vu?=
 =?utf-8?B?NkZydENIaTBDMTRKcWRxK2dvekNzQjZua1VLbkcwZWdJcVUvelVRQnByOHp1?=
 =?utf-8?B?RTEyTmhHbk1CQzNrdFQwVVRTQ2xrOGR0ZjhIcGFGOTU4UEpsL0lZYWIzdVk3?=
 =?utf-8?B?cU9yUVlCbGpEQXBZMktyeXBDVzl2M0ZmUlNRMWtVYUwxZGlMWGsvamdLMXJ2?=
 =?utf-8?B?RG9BRjZaSGhZZzFxYnZ6S3E5QlkySlo2c0poYWRkRk45Q2ZXY3BlM3YyeUcv?=
 =?utf-8?B?eWNidGt3bFdPSkdOMzZxT1pyeGRoaGpnNlNHeXBnallHSU50UWVzWUR2LzZL?=
 =?utf-8?B?MzFQODg1b3Z4aUwrazhoNlpJRnRsMG1qckZiaXQxaWp3RGRBY0hHc1pvYlUz?=
 =?utf-8?B?bzZRWjdBNnVyOXRna2FncmtHOVdSSFBMd3VTZTdTZWFpa2s4WUV5Q1R5UXZu?=
 =?utf-8?B?a1FjcUtCTkQ0akdqcGlhTHhseFhOVWR3YzdDZ0FBa2FaZm9GR2VmeW9FSW9I?=
 =?utf-8?B?K21FMXNkNllWSjZMaW5oUXVmYk1HUzFFdEJONkVDK2VERi81OExoS3NaM3NC?=
 =?utf-8?B?VTBHQmZkVisyWmV4RFhVRzU3RXBSWmxOeFFncGZ6ZkJvZzFxa0IzQ0d4WURr?=
 =?utf-8?B?NUdFNmNxdU1SSzQvRVNVQm9sVlMzRmhBV1hyZTNBNXNndWJ5UWFFWjFvRUZm?=
 =?utf-8?B?MzNvUVZTM05kVkdaQVVGa3NXUlN1Y3VxYk5VRTkzM0FLeFRTcU5OaURKZ3RG?=
 =?utf-8?B?TWVDdzZCVEhieXJMeWFuVXpqL2d3Q3lDalh5OWxhcU5sakc4emRXblVwaWhY?=
 =?utf-8?B?Qkd3NUlWMUcrRGFwZmFNaFU4Ukg5UUJQSXFPUC9VS2VTNksrdkhMc3BOM3lI?=
 =?utf-8?B?NFdaeUl4TlZJL2Q1cHFqVDN2NWNRM2RZSFlxS01rM1dxdXdpYkpCU0VMV0dV?=
 =?utf-8?B?aGdBSVhpVUQxQkwxZnV2NmtSc09sVHNxMWt6L3Y2TFlHOGJweC9NbVVxTjBj?=
 =?utf-8?B?SkM4NFQ0VTE5TTBaVTdaM2M4WHpPZ25sbjVOblV5ZVkzZ21qcDlTZUdJS2s2?=
 =?utf-8?B?TTY4WU5yR1lycWxYN3V2U3lLZXM2eE5ndWZKdjJrUDI4MlptbFpqMFpBRDRM?=
 =?utf-8?B?R1A4N1BJcVBTOWdmVG5FcHZXL09MU2N3clVuVE9EanJIK1Nxb3ZhdERSMGNx?=
 =?utf-8?B?SEhrd09teGhqUW1zVms3TmRJL08yZVVqcHEzQ3pCM2RCV0twdHRGNEdTbEJi?=
 =?utf-8?B?cGNFQlZRdGpMckhtOFhUMFFmd3FYL2llaUVRb0JZbDk4OTJodFl1blFqdGM4?=
 =?utf-8?B?TkI1eVBac1dpQVo3Q3JYZEFocUN4UmVhajVkVTJ4QVJtMUR6MGJlV1E0MWV4?=
 =?utf-8?B?VTFqcWR5bHNkalhEN1NsU2ZOWVlDVmt5QUhTVHJkYXNBeU9NTkg5aXlUV0hI?=
 =?utf-8?B?UWpxRnpyRjQ4d2ZuMlpzaFpGV3lTZTVibEpHY0xlL2FvUS82dDdPYXh0UkRt?=
 =?utf-8?B?OXRITndaNzBROGZ4N1VrckExNElaNXREaEFJcmozN3ZCVkZ5WUtlZmZtcm01?=
 =?utf-8?B?UTk1M2xXZzBGS0tUWlZGQUJUM25FZ0FHYVN0bFhPTjVTVUlCdi9CRXFTZ2lK?=
 =?utf-8?B?ZmI0UGs5NjlDRVBDaWQ1VGlpYXJaZjQ5bDRMbVNWV2RPMkhJcExPaWZpOHlo?=
 =?utf-8?B?M1htalo0MTh2WlZnTFNUaCs3M040emZFMkVVWGZUbFdvRkhBUS9XUTYxVEov?=
 =?utf-8?B?WGpxUk03M3hXWVI3UzdlU3NGZ0Jhd0VkbTJJVE00clRJU2ZlTTQ4UVR3OGRO?=
 =?utf-8?B?NUhHTGlyYmM5VzlUNWg1UXlPK0lqbmcxODFPZnUrdXN2OVNXc3kxRVBqRXhp?=
 =?utf-8?B?WlZ6elBNZW1TbUJwNUJvUk5hMmMyUHd5RTFCeWZiYmxmd24xNWFHVFNWZTZj?=
 =?utf-8?B?emNtRFZDSnBNekRkMDhHVGh1d0pJUzBBWnJ4ZDg5YXNRMEt5WmtFdEVFa2Ur?=
 =?utf-8?B?dERuck1BVWZiV0Fya3l4VTNXK0tsa1VFS2RiUjJSYk8zM2d2aThqS21qZTlv?=
 =?utf-8?Q?hpYHskCKvSxXwOkQ=3D?=
X-Exchange-RoutingPolicyChecked: agBq1X6WdrxQSrntUElEu8zfYUn3mot96aSoiSq1XyJA14e55xhYyLF5+r7z2uOKkKaiBx7ZhbSLCvfkrqcYqCxtLBY1TzLMBs/V/WvyJty1JKSG2xvCAZoSATp0C27V+DfAcp3T4s9l3WJ6Y+RMCo2gC1owsUw9i9kJuzcH0UfsK0QOeyK7BwmR3FiWsdmqYj3ST9D9C3b3PyqE+TI3L8vrt26ohoL0OFb+MAKSAbkTSqnGd1hRBNdIoNoNQTaE9rCmB9e3p8I51aWFfBt91EHjQYNb7I3Wu941gxnlF10sBuV7lU3fAusiffFhT8SB1lsWFJZJMnEjCcy/VnJKhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb8e92c-9e6b-4a7c-f7a5-08def3f7df00
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:18:25.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TO87x07pYn9oJGZk5aWw2tjn9I1/aHlM8q/+JfPS+ydABe+gJ338jwjdlcKLowKb8gvmGEmmRN/jnNQN6FWeri3fSPZjiN26TEPYIrs0s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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

On Thu, Aug 06, 2026 at 11:52:01AM -0700, Matthew Brost wrote:
> Pagefault storms can generate long chains of acknowledgments back to the
> GuC. Sending each ack as a full CT submission forces a barrier,
> descriptor update and doorbell per fault.
> 
> Extend xe_guc_ct_send_locked() with a “defer-flush” mode that copies the
> message into the H2G ring but defers publishing the descriptor and
> ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> writes and notify GuC once per batch. Wire this into the pagefault
> producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> wrappers.
> 
> To avoid excessive flush latency while still amortizing MMIO costs, use
> a simple periodic flush heuristic for GuC pagefault acks: batch most
> acks as defer-flush and force a publish at a fixed interval (e.g., every
> 16th ack), with a final flush at end-of-batch.
> 
> Also increase the H2G CTB size to 16K to better absorb bursts.
> 
> Assisted-by: ChatGPT:gpt-5 # Documentation
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> ---
> v9:
>  - s/write_only/defer_flush
>  - include <linux/mutex.h>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c          | 95 +++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_ct.h          | 38 +++++++++-
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++-
>  drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
>  6 files changed, 172 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fe70c0fd85c5..5c4733da385c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -265,7 +265,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
>  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>  #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> @@ -939,7 +939,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -		     u32 ct_fence_value, bool want_response)
> +		     u32 ct_fence_value, bool want_response, bool defer_flush)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -956,7 +956,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		u32 desc_tail = desc_read(xe, h2g, tail);
>  		u32 desc_head = desc_read(xe, h2g, head);
>  		u32 desc_status;
>  
> @@ -966,12 +965,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			goto corrupted;
>  		}
>  
> -		if (tail != desc_tail) {
> -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> -			goto corrupted;
> -		}
> -
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> @@ -993,7 +986,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			      (h2g->info.size - tail) * sizeof(u32));
>  		h2g_reserve_space(ct, (h2g->info.size - tail));
>  		h2g->info.tail = 0;
> -		desc_write(xe, h2g, tail, h2g->info.tail);
> +		if (!defer_flush) {
> +			xe_device_wmb(xe);
> +			desc_write(xe, h2g, tail, h2g->info.tail);
> +		}
>  
>  		return -EAGAIN;
>  	}
> @@ -1024,14 +1020,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	/* Write H2G ensuring visible before descriptor update */
>  	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(xe);
> -
>  	/* Update local copies */
>  	h2g->info.tail = (tail + full_len) % h2g->info.size;
>  	h2g_reserve_space(ct, full_len);
>  
>  	/* Update descriptor */
> -	desc_write(xe, h2g, tail, h2g->info.tail);
> +	if (!defer_flush) {
> +		xe_device_wmb(xe);
> +		desc_write(xe, h2g, tail, h2g->info.tail);
> +	}
>  
>  	/*
>  	 * desc_read() performs an VRAM read which serializes the CPU and drains
> @@ -1052,7 +1049,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
> -				struct g2h_fence *g2h_fence)
> +				struct g2h_fence *g2h_fence, bool defer_flush)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	u16 seqno;
> @@ -1112,7 +1109,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	if (unlikely(ret))
>  		goto out_unlock;
>  
> -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, defer_flush);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> @@ -1120,7 +1117,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	}
>  
>  	__g2h_reserve_space(ct, g2h_len, num_g2h);
> -	xe_guc_notify(ct_to_guc(ct));
> +	if (!defer_flush)
> +		xe_guc_notify(ct_to_guc(ct));
>  out_unlock:
>  	if (g2h_len)
>  		spin_unlock_irq(&ct->fast_lock);
> @@ -1196,7 +1194,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  
>  static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +			      struct g2h_fence *g2h_fence, bool defer_flush)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	unsigned int sleep_period_ms = 1;
> @@ -1209,9 +1207,10 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  try_again:
>  	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> -				   g2h_fence);
> +				   g2h_fence, defer_flush);
>  
>  	if (unlikely(ret == -EBUSY)) {
> +		xe_guc_ct_send_flush(ct);
>  		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
>  						&sleep_period_ms, &sleep_total_ms))
>  			goto broken;
> @@ -1235,7 +1234,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
>  
>  	mutex_lock(&ct->lock);
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> +				 false);
>  	mutex_unlock(&ct->lock);
>  
>  	return ret;
> @@ -1283,25 +1283,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> + * @ct: GuC CT object
> + * @action: payload dwords (HxG header dword is expected at @action[-1])
> + * @len: number of payload dwords in @action
> + * @defer_flush: defer publishing/doorbell for batching
> + *
> + * Sends a single H2G message to the GuC CT buffer while the caller already
> + * holds @ct->lock.
> + *
> + * If @defer_flush is false, the function completes the submission immediately:
> + * it makes the payload visible to the device, updates the H2G descriptor and
> + * rings the GuC doorbell.
> + *
> + * If @defer_flush is true, the message payload is copied into the H2G ring and
> + * the software tail is advanced, but the descriptor update and doorbell are
> + * deferred so multiple messages can be batched. In this mode, the caller must
> + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> + * implementation may force a flush to ensure forward progress.
> + *
> + * Return: 0 on success, negative errno on failure.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h)
> +			  bool defer_flush)
>  {
>  	int ret;
>  
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, defer_flush);
>  	if (ret == -EDEADLK)
>  		kick_reset(ct);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> + * @ct: GuC CT instance
> + *
> + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> + * doorbell / updating the CT descriptor). This helper completes the submission
> + * by ensuring the payload writes are visible to the device, updating the H2G
> + * descriptor, and ringing the GuC CT doorbell.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	xe_device_wmb(xe);
> +	desc_write(xe, h2g, tail, h2g->info.tail);
> +	xe_guc_notify(ct_to_guc(ct));
> +}
> +
>  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  {
>  	int ret;
>  
>  	lockdep_assert_held(&ct->lock);
>  
> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
>  	if (ret == -EDEADLK)
>  		kick_reset(ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..3ddc665ab84a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_CT_H_
>  #define _XE_GUC_CT_H_
>  
> +#include <linux/mutex.h>
> +
>  #include "xe_guc_ct_types.h"
>  
>  struct drm_printer;
> @@ -54,7 +56,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		   u32 g2h_len, u32 num_g2h);
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h);
> +			  bool defer_flush);
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer);
>  static inline int
> @@ -63,6 +65,8 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv(ct, action, len, NULL);
>  }
>  
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
> +
>  /* This is only version of the send CT you can call from a G2H handler */
>  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
>  			       u32 len);
> @@ -87,4 +91,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
>  	wake_up_all(&ct->wq);
>  }
>  
> +/**
> + * xe_guc_ct_lock() - take the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> + * performed from contexts that want an explicit "CT locked" pair without
> + * exporting the lock itself.
> + *
> + * Return/Locking:
> + *   Acquires @ct->lock.
> + */
> +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> +__acquires(&ct->lock)
> +{
> +	mutex_lock(&ct->lock);
> +}
> +
> +/**
> + * xe_guc_ct_unlock() - release the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Counterpart to xe_guc_ct_lock().
> + *
> + * Locking:
> + *   Releases @ct->lock.
> + */
> +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> +__releases(&ct->lock)
> +{
> +	mutex_unlock(&ct->lock);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 2470faf3d5d8..8f8210a732e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -10,6 +10,22 @@
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> +
> +static void guc_ack_fault_begin(void *private)
> +{
> +	struct xe_guc *guc = private;
> +
> +	xe_guc_ct_lock(&guc->ct);
> +
> +	BUILD_BUG_ON(((XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1) &
> +		     XE_GUC_PAGEFAULT_FLUSH_PERIOD) != 0);
> +
> +	/* Ack the 2nd, then 18th, etc... */
> +	guc->pagefault_ack_counter =
> +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1;
> +}
> +
>  static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  {
>  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> @@ -36,12 +52,26 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_PDATA, pdata),
>  	};
>  	struct xe_guc *guc = pf->producer.private;
> +	bool write_only = guc->pagefault_ack_counter++ &
> +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> +
> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> +			      write_only);
> +}
> +
> +static void guc_ack_fault_end(void *private)
> +{
> +	struct xe_guc *guc = private;
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
> +		xe_guc_ct_send_flush(&guc->ct);
> +	xe_guc_ct_unlock(&guc->ct);
>  }
>  
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
> +	.ack_fault_begin = guc_ack_fault_begin,
>  	.ack_fault = guc_ack_fault,
> +	.ack_fault_end = guc_ack_fault_end,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 31a2acb63ac3..3dbcb1331690 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -122,6 +122,12 @@ struct xe_guc {
>  	struct xe_reg notify_reg;
>  	/** @params: Control params for fw initialization */
>  	u32 params[GUC_CTL_MAX_DWORDS];
> +
> +	/**
> +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> +	 * pagefaults in a batch.
> +	 */
> +	u32 pagefault_ack_counter;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index d77a7d76b444..af19cd82e014 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -412,6 +412,10 @@ static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
>  			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
>  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>  
> +			if (pf->producer.private !=
> +			    pf_work->cache.pf->producer.private)
> +				continue;
> +
>  			xe_gt_stats_incr(pf->gt,
>  					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
>  					 1);
> @@ -585,6 +589,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
>  	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> +		void *private = pf->producer.private;
>  		struct xe_gt *gt = pf->gt;
>  		u32 asid = pf->consumer.asid;
>  		int err = 0;
> @@ -622,11 +628,14 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>  		xe_assert(xe, pf == pf_work->cache.pf);
>  
> +		ops->ack_fault_begin(private);
>  		while (pf) {
>  			xe_assert(xe, pf->consumer.alloc_state ==
>  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> +			xe_assert(xe, ops == pf->producer.ops);
> +			xe_assert(xe, gt == pf->gt);
>  
> -			pf->producer.ops->ack_fault(pf, err);
> +			ops->ack_fault(pf, err);
>  
>  			spin_lock_irq(&pf_queue->lock);
>  
> @@ -654,6 +663,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  			spin_unlock_irq(&pf_queue->lock);
>  		}
> +		ops->ack_fault_end(private);
>  
>  		if (time_after(jiffies, threshold)) {
>  			queue_work(xe->usm.pagefault_wq, w);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index a1fff0e47fa5..efeba5c3a58b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -33,6 +33,13 @@ enum xe_pagefault_type {
>  
>  /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
>  struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault_begin: Ack fault begin
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer begins acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_begin)(void *private);
>  	/**
>  	 * @ack_fault: Ack fault
>  	 * @pf: Page fault
> @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
>  	 * sends the result to the HW/FW interface.
>  	 */
>  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +	/**
> +	 * @ack_fault_end: Ack fault end
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer ends acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_end)(void *private);
>  };
>  
>  /**
> -- 
> 2.34.1
> 
