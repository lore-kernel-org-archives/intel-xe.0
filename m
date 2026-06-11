Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F43DCD98C5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 00:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9FF10EC2A;
	Thu, 11 Jun 2026 00:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3LDtP31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DE10EC2A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 00:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781136674; x=1812672674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WFV56vT2kW0CJ7XFXrFFbMOvlDQ8bPYZGs7Orir95qw=;
 b=O3LDtP31Z/Vb2JOt8e694I86cgurKKiCk0UTPLagukyaqtP1bXGCafbM
 q218u0VhRgO0ihtbil6WbDsJ8QhPB6U62y92Yz6syigCh67Kh87eotHp2
 Tm2YVvwq/TU3tIbsIF0q5uERHqzbd9G+/wf7OaMirdOpUJgdXfEKg4AiA
 pk9JgV0INI+AExegL4scO/Fvk46BK9LIrkJPI83TqG8sCe6y9EKPNo/Xe
 Y7k1SgTeeiqUSDd621AVCrejNmp2NUHpjPq8oXn7zKPKH67XEe2AfbFzo
 2/jtWUtVsT3Hgkdm4QdeEUbg84sLNMiI0k/KC0rKMsFYrxVu8RLaimaur g==;
X-CSE-ConnectionGUID: x1irPV5GT163Ag57/np6Hg==
X-CSE-MsgGUID: XqhvcMaaRCupGiga848+1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84518685"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="84518685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:11:14 -0700
X-CSE-ConnectionGUID: 5wGHJzn6R0K5i+zQRQZnyA==
X-CSE-MsgGUID: gVvBoByKThKM5bRS1SELmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251424752"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:11:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:11:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 17:11:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:11:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jjc+mQ5ZZ1EnB13Ep8VK+Vttvs3tO4QRC0gK6IESGEcADU20tsRih5ER8GxTpPklz3pzcjD68/D1+jt/Tex5YK60gpoUvB5pDVMeEx92W1hdLYSFj9r7bingjoWpsGNqJOcNqwINKLJ9TKFmin8n/76qIs+oyDGW+njgQSvf+xkjNcV28VzZAXLaWE2HjEdBI4w33i+nAYwAKdEI8NX6PAt3o/i4/oDrxrHW9halzpm82oS4D7OgmjAnQf54PGGw2KEJ/b00snMNr6tfpnBZ0UNgFZAPX6SzAg6gSCeLvd0dY2FVEkxy9FHhUnkEw4vg9eft4l3amUcA3qsljI1Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hmoTnfhL4Ts495lLD2Gjb6sOxPED+XTE4YWzwDl+Rg=;
 b=TRmWst60vdGP03FtWgWRkSwL4HXYH4jUMUkCAHSPjR1z0LuIWPj4sAuT/LRDBegBbAYToZxIX5GbJe9uEziryqczkoucd8cBWKsEK013d+NecqNSzQ9gVBkkDSUT64hiJtMAQ+ql3ZhDw4JWo+WFyV3C3wUTgYGglkw2Du3PHXSyN3h2JU3lIXp9sV2pSCDMSOQGTMCn17YPc0DHl7YjxI0e9iJlSRfXjkwtGiaYmtQKkwFDEyObkQytdIo8kq3n3xpIILSpO1Vlrk2Lw2VWzBzsAYNKnKmJcDFFyIhaiskeXWchCHpLDYUbu8/jNJ61lo2AgVEfk0/+g2ZJpv6S8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7026.namprd11.prod.outlook.com (2603:10b6:510:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 00:11:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 00:11:11 +0000
Date: Wed, 10 Jun 2026 17:11:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/guc: Add suspend refcount to exec queue ops
Message-ID: <ain9HQbDMBOqUt1o@gsse-cloud1.jf.intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525133051.91636-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cde6045-3f49-472a-7b2e-08dec74df1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Ixhhf5uGNA1yVotLdgEpCzll0BD2zVSeKiF4TChDLXJOzS23r1ozyi0braPj1cKFZ4OFvVUFOEzMdb5HWYlRGfdLfisSsYje9FYHVH6dyOgc/OFHIFFqeAIU3rCuMzwG7CoH/d3bvkvM9Cb1akmNC1yUFTSxSxTV216EpCG2OTPxiJs8+Q0w4gwngLzDJBFROwPYh3TFOIFqFhKp/5yaNN33wxID+fmaVave1TrA5RtSMkP9HAaQav+mIk88zDvqxCGyAiv83hbxWKONQRQ+6NjqQR3o9MjZGubBerOSjtiFVSZ6Wv9+j+9BqWaGQ59Eju6JI1zeQ6A2KiTrtG3meMNdIPHTi72sGfMDfICR5tNfWrOc+SSPoGoDENMk5CMYNB58huhUP8vc/9C9hrcmx4rs2KQlZNnN6U5eqYX+eXCNw7B3Y6tQoyxHspqKJO/5GW5HZZj97hUYg0W7+fGe1Stlce06r1f0idfNEXoJ9eJzLKn0vWqWb/0UJd0r2Zip6P99GoTsyU9fkwSMKnFXN6lmF8QlZWY4ho1L5JB4L3BaN0NsTmmg5ud7iJnvl3uHE21fouNhyW+J3eXg9VCG569BTg9Z822BpMB1zsn4SeQacGmjs1CBiaLPSVrxiW5AYJMO9Jt1b8H4XInmZU5SJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmx4WklBUS9sRndTV3lMVlByUlJsSkNSQkpGM3JERFBESGVJRXV1SUU4bWVE?=
 =?utf-8?B?cGNrRVN4OFhveGhjVFdrdUtXTi9NMUFnVW9JR3RBTmp1cmJVK1o3bXNveHRr?=
 =?utf-8?B?VlFXcW1YbXpnVTN5Tm1NN3FRRFdzKzA5VWg3VDJDWit4ckF4b2orR1pTSlRo?=
 =?utf-8?B?Rmk2bzZLaHgrR2RhNDZmK1pXY1NHME9QSXBtenpLUTZnMGtlMTU2cUJUclVu?=
 =?utf-8?B?OFdHYS9UWEdSS2xpOEczNWtSQlhFSG05Z005cnh2VzZlQmE1a00vcFNhSWJl?=
 =?utf-8?B?Rk1may95OGVvMFRydjYrQnNNTXBja0w5TWc0NUJWakpLb0Z1Q3BEbUVXR1ps?=
 =?utf-8?B?R2llWjg4cGIrSWplYjFUbVJxOVBiMit4elZNdFBLSlNDcWlXZU5FYTd4bjlt?=
 =?utf-8?B?dXZ2VWxrcDk0S0d0WjBSRHBycHZBZm1vdDZCR0dZMEU4azNyTWhKcTNpaEd6?=
 =?utf-8?B?V01YSC9Gb0d1eVViMVpBYUZEY0pXY3E0TDhmREsxc1ZjNGNZTllHSVZPSVVw?=
 =?utf-8?B?bHM2VkhRMytUQnhCajBHWUVJeE52TUhNMEsxamJEMlBnanl3ZlVYMXMyNFBB?=
 =?utf-8?B?SG51UjNqbFh0Qk5wOVowTVRBWjI0a3FFa2JjTVRkZHd0cGVhZEsvSzBEMG55?=
 =?utf-8?B?Z3VkWUtGcXRhRGYvNHp3NnJCdmI1THVBd3cyOUtDM1liNjF2UjdDdVpDT0hz?=
 =?utf-8?B?Q0t4cHl1aVYzcVhJajluU3E5blJqTDQxaC9JR2IxTXVJc2VLVERjQkZZRlU2?=
 =?utf-8?B?YjlkcTNKQjh2dWlteXVzNW9qRjRhRjRzL2tOdTI5c3hBK0hVNWZ4MWI5VjZa?=
 =?utf-8?B?cHdISXBCT2dDd29aZnB6YW9vZE1FVXFtbnhTUkJvNWpEM1pqaUVZVzF5ajMw?=
 =?utf-8?B?Y3ZOdFExS2hkUWpPWHphRjdwWEVaeE5vVXM2ZkUwRDZTREYyd3hnT1JTNTFE?=
 =?utf-8?B?UjV1VkJDTlFnSy9seVNBRUlaOUY1ZUJmYUFRYnVCNmhUeklSY0lxYU5WYmw4?=
 =?utf-8?B?ajk4ZnZWZTBLSng4Y0c5OWRFanZYb0MwbXlXZWlqRG5uTlhHWnlGWXYvdDJB?=
 =?utf-8?B?ZnlENVZyVmJJTUhpa1NVM1BiM1lTOU5lbVJKYkRVMGhJK2lSU3ZSaVpUZDJr?=
 =?utf-8?B?NXdEWUllSkpBWXFMREFUZ2NZdWZMRHVsRGtMd3JlWWpOeSt6S3N6TXZFT0p4?=
 =?utf-8?B?azhZRFU3TDJCUGlWRjU2TmFzZHVKcXJMcUE5eDdnSFQ1YUljUVdCcjNkZGRv?=
 =?utf-8?B?bHhWbmU1SXZnajMzMGxqOUN0NFdmQmRrMko5cFhxelhvWG9qTC9PalRmOHF6?=
 =?utf-8?B?bDlWcmJocWZVeG9xaHlFNXZOckR0dFVObVZJLzFPaU9pSElqQ29VZ1Ftb3d0?=
 =?utf-8?B?ZFE5MU1vK0dNdGJaQnF0dm15b2xpZGphWjBaUGRySXAwcFZ2S3F5M1MzOE81?=
 =?utf-8?B?cFdBa3R3am5rd3VjYko0cWRyQWxJNDA0UTcxelFGZzV3VXdzbFhteEFHWFoy?=
 =?utf-8?B?M2hKcytJMlBjaGJmeGlYMzNFa0dLa0gyTUdHMkJVNytGaVBqSmhKTktZMzRQ?=
 =?utf-8?B?V1FCdUw2Uyt4Qk1JekFCNlJiOEpCYUhsZDVIcU0ySWVjU2JVMXF3VjhYZlpu?=
 =?utf-8?B?OW5RS0x1dzc3bGdmRHRhU1NDYTJtcHdNRjJORkE4aW94STA1S3VqdU5oR0xp?=
 =?utf-8?B?M0loc3BBbkNNM0NVS3gyV21QaEx6bGhqZmJYZW5XcjJEbVIyVm9QbEZvNmhl?=
 =?utf-8?B?eHNEWnBhZmR0YkMwOTBOYzhPcDFYR3FBTS9rMXdHSGZkalFLNThjTGNBRjlY?=
 =?utf-8?B?VGtndnVnNVp4NTBlY0dJeXB5T2RLU3ZzV2tvUndveEZkdTcyUEtxOW1mV1kr?=
 =?utf-8?B?NmdMY1NhUHFHS1FkQmdtM3RhY0pKYzh4dXFmZTRkcThxS0NnTU1qV2w4NW5w?=
 =?utf-8?B?V1F2ZnlCaHZwUFZQOXFqS2dnNG01ZHNJdXNzRkFHVExGOTRoZTNSTjZpeVg0?=
 =?utf-8?B?VktJUjUxWk5NSUhDcG9VMUpQbnptbkZML0Zha3lkbTJhbTdoWXNleDhvVEE0?=
 =?utf-8?B?dDAwUWpYU09mWkxCRGR5OU5tL3BvRTU4eFRHRHo0TzlLZXpRUVU5ZkZsSjRk?=
 =?utf-8?B?SGIzTVE2QVhqT2lrSHV0YzZRa09yenNmaDBJSXRjNjVlR2hoUEp1RDJxSHdq?=
 =?utf-8?B?ZkxzeGRIWXZBMVJyNEdJeXVSNndYRURRdVpJOWs3dGFMMlJ0N0NHRzMvK1dR?=
 =?utf-8?B?OUVNamViWmJvYStkSmpKeWZtb0lrc3F2djBzbHA2YjBiREU5SFN0KytSdTRm?=
 =?utf-8?B?MlU1WWtjdmFaOE14bzZEaVdrdHd5dm9wTkpkeGVCcDJyWEtUbUl5YUtLV1VY?=
 =?utf-8?Q?1ryWbvqMsIblF5X8=3D?=
X-Exchange-RoutingPolicyChecked: noCtNj97q+UzStjWEZGIgmqKA6ChNh5DOvMVrt60JyeP3yzxl5y/MavdSLj18WSEWW7fK11j2h+FAFnNZujlFaY2x5NI+vjv4ZX6qt/EKFf13ZffGZ9rd6mxXfUmASuK2dFDtnmp8d19AmSciz2SYkgR7L0BkSShJ22DwgPcNS81LmJkLCUUo8me93JVqQIXXlDJT4UkH2tNeKK5Lw9HeGO5ics4kPeXSVS40MhYDQv8RXZXJCbeV9tk7Yb09J4A1vY4XEh83YET0wutc2wTaq4qm6tQ5A33YxyOCETRs+vO72EN4o5gZQXnQalbtdl5LEHcMAydBZUQdcai4XCebg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cde6045-3f49-472a-7b2e-08dec74df1c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 00:11:11.7819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pv+CGysBUm7bkaFpu9EIVPAB+AZ4Ow0NQS9wCtYKKF5HPXFI8DsspTayxkBazwvl8F80cO0WQayTw6zmYzorBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7026
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

On Mon, May 25, 2026 at 03:30:49PM +0200, Thomas Hellström wrote:
> Concurrent call sites that suspend exec queues (PM, mode switching,
> preempt fences) each need to pair their own suspend/resume without
> caring about other callers. Without coordination, a resume from one
> path can prematurely re-enable a queue still suspended by another.
> 
> Add a reference count to exec queue suspend operations. A queue remains
> suspended as long as any caller holds a suspend; it resumes only when
> the last caller releases it. Each caller simply pairs its own suspend
> with a resume without needing to know about others.
> 

+Niranjana

The patch LGTM; however, this is likely to collide with conceptually
similar WIP work from Niranjana [1] for multi-q suspend. I wonder if
your patch and his could combine ideas so that his solution is congruent
with what this patch is doing. I’ll also reply to [1] suggesting that he
take a look at this and perhaps rebase on top of it.

Matt

[1] https://patchwork.freedesktop.org/series/168035/

> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 24 ++++++++++++--------
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..1207d51cf770 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
>  	wait_queue_head_t suspend_wait;
>  	/** @suspend_pending: a suspend of the exec_queue is pending */
>  	bool suspend_pending;
> +	/**
> +	 * @suspend_count: Reference count of active suspend requests. The
> +	 * exec_queue remains suspended while this is non-zero, allowing
> +	 * multiple concurrent callers to independently hold a suspend without
> +	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
> +	 */
> +	int suspend_count;
>  	/**
>  	 * @needs_cleanup: Needs a cleanup message during VF post migration
>  	 * recovery.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f1a6f13011b5..7800a9d1d377 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2131,15 +2131,18 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>  
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
>  
>  	if (exec_queue_killed_or_banned_or_wedged(q))
>  		return -EINVAL;
>  
>  	xe_sched_msg_lock(sched);
> -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> -		q->guc->suspend_pending = true;
> +	if (++ge->suspend_count == 1) {
> +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> +			ge->suspend_pending = true;
> +	}
>  	xe_sched_msg_unlock(sched);
>  
>  	return 0;
> @@ -2190,14 +2193,17 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
> -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> -
>  	xe_sched_msg_lock(sched);
> -	guc_exec_queue_try_add_msg(q, msg, RESUME);
> +	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> +	if (--ge->suspend_count == 0) {
> +		xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
> +		guc_exec_queue_try_add_msg(q, msg, RESUME);
> +	}
>  	xe_sched_msg_unlock(sched);
>  }
>  
> -- 
> 2.54.0
> 
