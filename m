Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5117CA5FB8
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839AC10E63E;
	Tue, 20 Jan 2026 17:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9jQ6Fuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981FB10E63E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768931902; x=1800467902;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=89SVqA0lrN9iN13mjUTJSyIiDeRFFEm08nJRki00w/A=;
 b=S9jQ6Fuhk7qUXKjgSkneYdo59KtfGXJJleC7Mmkb/GD3JRX40CG1gMf+
 R6F8JuPCU3owcxfiqJ5zhJXAoB00tngaeFoGr+oyOYml6sjrFp1pjV8aV
 r8nV3N8Wwmk4cH3GyBWHfDzzt19wcdT6iBYDeBoOImhB7BA20Q2FgdfJi
 X1E4ZrZGJbS+d72ieGffvQRKtIWSW+i2KeTtw7eA43MybOQndm9zK3c6/
 Sa8zhWgEsFb74oBvlRQP5w3yTE60zBOoJfvh5MXL4CWlA9WYj8ExFwNxg
 B4IxFLfF67yTXRxueALhGXF9bhIhxV/LYQiKWknCiEjyA0PLA6p88Bqix g==;
X-CSE-ConnectionGUID: wSjaHtEbRFu0sQAokhZwow==
X-CSE-MsgGUID: ujZ+eJ+zQlmLnD8UoTLqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87563146"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87563146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:58:20 -0800
X-CSE-ConnectionGUID: ugyU7EMyRGiaJSCUqMHqGw==
X-CSE-MsgGUID: kg33t17LQ/+Ct+YMNnMRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210648024"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:58:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:58:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:58:19 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:58:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL42abZtMNapCWLlbmQ3PmN4yWvMBVhv4A2MJIxuBbNddaotbty7shxwmPV2h7iZk1622IR8DeSnbzcgWBZtWsVD/8qpkGQ9Hboy5KVvLmdtJJQ3gdrBpQF7N+MdQeeiS62zUE2JR4YU77i9LGeUPdccKEjf3ODPuXA++Q8VFWA9JhQvIzwr8Sv42FYFv1BFcxu65QvUkYQar4w6DPpZXfM7OjrHbpB7DZm1wca5dzE2aZgo0lia3nDYi6193mMujlrA3lznlCxqU2qA4hMn9rA2ZFsYkQRRyhaTKtt4TGi/cq3mLBPGWidh7SfuqAuVNztSSGOKwXq3pFFH36OhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJuPNfIWTFrwH47ZoHsnIkdJy3OyklKnjVxfMdbDidk=;
 b=wT/970UVryxsh+ojxCyvi/Xa4wr0/6IQFWtigHKgM4Iij04cvE+OQtukeJvLmcPDKpjta2W3j6VSy20wZed7O2jIAsE8IemsNbvK/SrRQKxRaOC2KRcKRJkVf2l/OLOIvzWFsM4bqAv/O5yRzA/gbtWYH4b1g28MXnl43nO75ZlMtj2YJMp6yEoK5898F4TwCRgCjP7uUieVw1XOkc/qmEdPcxisiNM/QoNXdukGgbX3FIhoFS638rlMh/luG3cexgOtCQDTYbLV5q/dECSm0vxlDceuzp/gnufEEWs0jliaa639yzsobTpdsKt1pXuzOj3jp9DMKfRANEUi9CAoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:58:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:58:17 +0000
Date: Tue, 20 Jan 2026 09:58:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 8/8] drm/xe/bo: Add purgeable shrinker state helpers
Message-ID: <aW/CNu35NYz/2758@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-9-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:303:b9::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a326e64-a037-427e-bc5f-08de584d7d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2hlTWV6b1JycmtvR3lPYlV2RVdLK1hXbTl5UXgxM2ZPTkYvUnlUZTU0L0VG?=
 =?utf-8?B?RHpHaHlzaEdrR05tL2xjSllCcGNqVUlURUlCWkJYNEQ3Y0lPRTE0OFQ1SElH?=
 =?utf-8?B?WnRaaGdWbzBlTmZVd2lBWjNTbzZQcVVCZ1lrL0RHQ2w0NmRYZmZvWFZtVFpt?=
 =?utf-8?B?UVFuNnBIZFlDb0U5S2x6NVE3ZGJ6WG1aczU1OTBpUElsa3lGUkFza0NyaGVq?=
 =?utf-8?B?WGJwM2Y5Vm5PTFYxNE1ic1BzcWFCb0JlcXVNdHp4SlRYaUg5VFU2ZzZGcHV0?=
 =?utf-8?B?L3JOR1Q0OVlKVmJSWE80NVYwMGlwOC9QV0Y4VWF2c2NDWldZMXRCQWRJTDdw?=
 =?utf-8?B?Zm9kVkowZURBdnhLNHpNU2tPb3NSemowRzkwc0IvUGVmWVdyLzZ0RUVoZXVz?=
 =?utf-8?B?NUYrVFBnbmlMcGhUK2xQUFNGdnJpZlRFdTVDbFE4T2FsQW1IQVI2S3RMaHZS?=
 =?utf-8?B?Q05kNnNqSjdhblpTbHN4YUhSL2o5NkVTMmJydmdFLzA4dkpicjVCZXF5Rk9l?=
 =?utf-8?B?NjU0bTFjRm1TWmxRWjdjYVBCSTMrK1JoWHN2RXk5aHZkalFpb24vVjYxM3Ey?=
 =?utf-8?B?dUxRTUdNd09IRDJHcVRBd3VNSkpRMDNmL1JpaEx1ZmFWanp4eUFMUjNNSTJM?=
 =?utf-8?B?VkVHWFBkbC9BYUdCYXZmZmpBSkRaK1NSMVNJM1RSUVJkc2hqcUdGMFdtUEhE?=
 =?utf-8?B?TUlHSFFrZGx0TGthcnZjRlNRQXQ5ekVBQ2pXc3dYai95ZFplYlYzblBSWTRi?=
 =?utf-8?B?dUpvSXhNanFDcXhaU1ZlZm4yT0JEUWs1UittbXQ1NzhKaWNqQ3JNOFVNMWVE?=
 =?utf-8?B?bVVuOVFUSjhWVFNNM0FhYXg1ald5TU5RMEliZlNDWjRXMzJaazlSZ2hSUTZT?=
 =?utf-8?B?TDVGUmFvdlVOd3Z0NjZWSkoyWmk3UTJTMk5SSnAyZE56NEdJdDFuLzBqREJj?=
 =?utf-8?B?V0NsQ1dRVU9QZXpCTXlmQlJmQTcwQXhZM2loUS9yMGhJRXRjQUQxZUFMblpK?=
 =?utf-8?B?NENBczdJK3FUaVJJSTIrVGl1UG1BVHp1a1d1REFzQ05lZldiY2diZE9oTmwv?=
 =?utf-8?B?bGdIU1dhOW1sT0s5eUo1c2xEU0ZYT1VjaFVxWXRLUGhmODZHVlZXclJJek5i?=
 =?utf-8?B?bE9ieWNOMTlRMm5qNDZDdDh4czRxU3drdkZhazZOWlV0bC94cVpEM1BJSUl2?=
 =?utf-8?B?RUVrWjlxS1NsVEh2OVhNdUJ4WVNEVThTZDJrQXE4clRCTTA5YjZLSmlRT1Z0?=
 =?utf-8?B?Q1ppeTlBc3BJUkYxNFJGMHk1eWVPSndBWEpkajhzSGpSWkIzSzBsM05IRVZM?=
 =?utf-8?B?ejhSQjkxZmVRQ2RtSktLdmFxQ2VxT1hvQzd0NzNrb0p0a1Z0UXd3YWcvaSs0?=
 =?utf-8?B?amdsSFNMY1MvQ1BOMFJTSkV4NkpDbHI5Rk4xVFQybDc1OUJPNjAvckE2UVI1?=
 =?utf-8?B?cUdBaHYvdkZHcWM2dnNFNDFMcXhTQWF5c3BwUHhjKzRhYmh4QzZHUU52OUlu?=
 =?utf-8?B?R2lDYmpNOWEra0xFRkJtajdSMnFxOGtLOWwxRkU1ZlA2SG84UnBQbWNDak93?=
 =?utf-8?B?WW95WGlJRkExdHFzaERobWhyU08rdGF5Qnlja3FGdjV1VHFucGJsOXFoSldx?=
 =?utf-8?B?aEFNMlltaHBOdHFsR21qdkhOenNCZ284a3N0ZVY5M2tBckFORVlNVFRXZ2lC?=
 =?utf-8?B?THlVMVlqK3MrdDRXdGVaaENidzk3Wk5qcHdGLzlJSndsYldROW0vdE1iaGx2?=
 =?utf-8?B?MFlKR0lXUW5JbjFtRHBhbkQ2WERWUGxTTHoxNm15TkFDdTdyY3BOOCtISDZJ?=
 =?utf-8?B?bG9ZUnpPTEZ3dERZdGM1RUZEbEtHS2dtaXVoNDBCSlYvaG1YWlY0ZkxpNDJX?=
 =?utf-8?B?UTBqSG8wVHBwY0ZjUU5GcnFBUVRoYVNyNnNhWlpPQ3VGUVJlT3NQaDNPMUFi?=
 =?utf-8?B?b3N6T0dvQVdoVnMycWFDZXJjaUNCR3NvMnNYQVNZYW0vZHFwTFdSRWNxWHFh?=
 =?utf-8?B?Q2RSeDVGTnByS2RxSWVXL1dyMWRXYmNSVThURFA0a2dlMWV2WkxjN045MHE5?=
 =?utf-8?B?M3ZTaTNMcjZudWZUcE1MS0tSMjlmNjlWVld1ZmhhQkRsN1Bka3NvQVFyY1ZF?=
 =?utf-8?Q?/hXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0ZWcDRvcG0yd2hrVzNaazhBNjdqWmtUYzcwU2puOXFFSlpRcUlIOWdnOTdz?=
 =?utf-8?B?R2NPUDNYSXhuZnkxNFpZaXYvNHlKMGpldVJteC8rTzdlNEMwcXBXTTFCZ2Rv?=
 =?utf-8?B?V24vSWZFb2ZDNlVNc2dkd25lSTVBalN6OWZHMHBSc2pjTm5mUVVpeTBEdXQx?=
 =?utf-8?B?U2s4N09lZUxkWmo3OUFvTkFsZFBuUGhmeEpNVUVaWVpMRks2ZXdyQkFNNVhJ?=
 =?utf-8?B?aFNIUTVvbEkvUFA0cFg1QUpYbEZWSk5xNVVGL0k3OXJDTnpneXpjNFJjUEQy?=
 =?utf-8?B?Z2VHYnZSL0E4aXpSWkx3SVNYdStpYWFrZHBaYmpaemV4TlVxNWlnSWhDWnI2?=
 =?utf-8?B?OXpzcGNzem1IcGR1UHBrTTRjRWR4ZlFuTnVUOVJKcXpwRVVSM0FLQnlFblJM?=
 =?utf-8?B?V1MrdHlhR3o5OEFRSWwyYjY0VmthTS9OdXVlelNEa3R5QTkrdHVVSk51ZHJI?=
 =?utf-8?B?cFlseTFHNzJPVkJGa3ZZQXJlMTNsa3F5bXFRRnNrOURVQXhoZENCQUhRWUFY?=
 =?utf-8?B?bHd1MWFzVEkwYzBrbTdSdGFwdkovTHlHWXh3Q25maDRUUHoxRVpGcTNVYWVt?=
 =?utf-8?B?VFNRYUNReHVEZzI1TkExcGxEdUt3VW5QeWxVMFhVc2xHK2dDQ244OFR2YndZ?=
 =?utf-8?B?MmZBYnhGWnhrc0YvVGtUdEFUdE9jb2ZiRWg5VlVFOUlwZFE5OGFGalF6cUI3?=
 =?utf-8?B?R3A3V1lDRW02UUFQOG9sNkM5dHAyZU9DeWs1NnphRi9iakhsT3hXQzQwdHNq?=
 =?utf-8?B?eUZIZWdPTHA0QzVmVTVPTXJtd3N0K2xxQVo3aFZaTHRuRFJzWlNxKzRHYURF?=
 =?utf-8?B?VlIwd0lSNFBvQTVaUUhXTlJJL0oxSTlZK3RucU41TUlnN3lzRStCNUs3M0RJ?=
 =?utf-8?B?TWZQOXFNUTZ3MlN3SGhETXdHWFAzZHdDTWtGVDVad3U5MVpEYU5OZURCb0w5?=
 =?utf-8?B?TWJuQldCVjBxZUVuTnVnMlU3bGpiVENtY1AzNDFlekJmN2orY2VqZkQ2V0hP?=
 =?utf-8?B?eVBHcCtVaFkyZWNvMndEaDFMYXduUHB3OG9Mb3N5eWxPaUlkMjAvVG9XenA0?=
 =?utf-8?B?S3RGSGJTUElJVXR4WnByU0RhYVkyRWliSnBPT2taamxnbGhranM0VmhoZWxU?=
 =?utf-8?B?YkpCcUJmalhGcGlFZU5HQmRuSEIrQUtDRVJLVXJaRlJWVDVjTDVFdSt4NHQ3?=
 =?utf-8?B?ZGorcDhSQTFQckpyNk0yM2ZFWE5qVGMvdkhsQ2d6NkF6bFJ1MlZmbk1oQkMx?=
 =?utf-8?B?RFRmOWVMQ3d3Y0FqZXNqM283MWdYMU91bU4xeEJTTDZRU3RrampXc2lsU1c0?=
 =?utf-8?B?TXhlQUI1OGpRUS9LSU5DVGk5RHhjSEo1VnZ2UGdrNnpoNVduTTVNVVhxS2pI?=
 =?utf-8?B?V1Z1czUreUpOMFRSYThnWnNNQjVtdkNTR2FzbGJmT3N1ekZSUU85TW9ZbXUw?=
 =?utf-8?B?R0FpWVN3WVlnUEN4OEdxYXN5TkV6ZFJ1M2hFaXhpWmNlbzhOeWYvL0dCL2Mr?=
 =?utf-8?B?VDVBQXl5MmliWHpyZkVScEpkOHd1WGZRN0ZKU0c4bEx1T0s0Q2NFVWE2Rkd3?=
 =?utf-8?B?eDlzaDhRUU5QZTQ4MXUzNjR3a0oyMHQvZHk3dVA3R3ZVN0NvTmtLVVhXRnVI?=
 =?utf-8?B?cUg1VXRuTzcwUnl2c2lOaC9OaDNsMVFWRUZQcll0Zkt5aE5FTG12dm1lQU5W?=
 =?utf-8?B?TXdnZWh1djdvYy9KNDZvVy9UajdKRWNTemY1Zk5WWjRVc2RPVDNQaDNlL2hv?=
 =?utf-8?B?d2tVV0JYR2sxQjZNVGxIdTl0eW1IVGRDZnJXNndndThibXErcm1aQmo3SS84?=
 =?utf-8?B?b3Y5Mk40ODloN1I0TFJUK2Z0eHhqcDFJRlkrQXRVMVkybkNEYTgySTRYL3RL?=
 =?utf-8?B?TkpFSURBbjE1L3VFVVlZaU9ORmJpNnZFYVJuaHNOTjZpUUNTZldNdUVuSU9Y?=
 =?utf-8?B?eE0vbFpNY2xRdWFHdGdabXljb29wY1h4TytaYXFrbHF5WW1DN2F0allSUlJ6?=
 =?utf-8?B?UkZuQXZ5emRDSEJnbUNIUnhaY1EvdjNZVVJjMlhQTlFIV1FqTXdtdGZ0Y0h6?=
 =?utf-8?B?djVmeEFJYm9XWmc4ZFBlblYzUWJiazNydTlHTmR6bDZhNHJ1d3lCcm5iWklj?=
 =?utf-8?B?bWgvUHdCVDNZWkVQZWxQaTN2WXpnZDlDUDk3TnJZSmV2c1FOQVl5Q0svRHhl?=
 =?utf-8?B?ajQrWEMzOXhxdUVDUEtrSE8rdUpsbm1MY29xWWhhSnhHT3NIN2lJd3Q2OHNw?=
 =?utf-8?B?ZU9xY1VwVTF6L05EQm5LVG05ODdWeUpwZ0hpRTZEa2pxeU1hTE5HTHFiWVRn?=
 =?utf-8?B?a21lTDdOUSt6WEg3QkdtdDVGMHlNWEFURHV0SU5kbUFoZGRzSUtMVnNMMEs3?=
 =?utf-8?Q?p08t6F60FTW8H49E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a326e64-a037-427e-bc5f-08de584d7d34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:58:17.1021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3JV8xKfl5JbPvXopxJga7uzqYOdCY2NDBv4bi3qOs0bzEGQiSU40p8SzEVQnMaWbBexNPuefW0AY9u6uJ0wZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
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

On Tue, Jan 20, 2026 at 11:38:54AM +0530, Arvind Yadav wrote:
> Encapsulate TTM purgeable flag updates and shrinker page accounting
> into helper functions. This prevents desynchronization between the
> TTM tt->purgeable flag and the shrinker's page bucket counters.
> 
> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
> risks forgetting to update the corresponding shrinker counters,
> leading to incorrect memory pressure calculations.
> 
> Add xe_bo_set_purgeable_shrinker() and xe_bo_clear_purgeable_shrinker()
> which atomically update both the TTM flag and transfer pages between
> the shrinkable and purgeable buckets.
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

I think this patch is right but best to double check with Thomas as he
wrote the shrinker logic and is the expert here.

Matt

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 60 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h         |  3 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 13 +++++--
>  3 files changed, 73 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cc547915161d..2b1448ea3aed 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,66 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	return 0;
>  }
>  
> +/**
> + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from shrinkable to purgeable bucket. Shrinker can now
> + * discard pages immediately without swapping. Caller holds BO lock.
> + */
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
> +	struct ttm_tt *tt = ttm_bo->ttm;
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (!xe_tt->purgeable) {
> +		xe_tt->purgeable = true;
> +		/* Transfer pages from shrinkable to purgeable count */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				      -(long)tt->num_pages,
> +				      tt->num_pages);
> +	}
> +}
> +
> +/**
> + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and update shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from purgeable to shrinkable bucket. Shrinker must now
> + * swap pages instead of discarding. Caller holds BO lock.
> + */
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
> +	struct ttm_tt *tt = ttm_bo->ttm;
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->purgeable) {
> +		xe_tt->purgeable = false;
> +		/* Transfer pages from purgeable to shrinkable count */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				      tt->num_pages,
> +				      -(long)tt->num_pages);
> +	}
> +}
> +
>  /**
>   * xe_ttm_bo_purge() - Purge buffer object backing store
>   * @ttm_bo: The TTM buffer object to purge
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 00e93b3065c9..681495e905af 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -270,6 +270,9 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>  	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
>  }
>  
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 5808fef89777..0fb07a1ed3ae 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -274,12 +274,16 @@ void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
>  
>  	if (xe_bo_all_vmas_dontneed(bo)) {
>  		/* All VMAs are DONTNEED - mark BO purgeable */
> -		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED) {
>  			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> +			xe_bo_set_purgeable_shrinker(bo);
> +		}
>  	} else {
>  		/* At least one VMA is WILLNEED - BO must not be purgeable */
> -		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED) {
>  			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +			xe_bo_clear_purgeable_shrinker(bo);
> +		}
>  	}
>  }
>  
> @@ -325,13 +329,16 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>  
>  			/* Mark VMA WILLNEED - BO becomes non-purgeable immediately */
>  			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +			xe_bo_clear_purgeable_shrinker(bo);
>  			break;
>  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>  			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>  
>  			/* Mark BO purgeable only if all VMAs are DONTNEED */
> -			if (xe_bo_all_vmas_dontneed(bo))
> +			if (xe_bo_all_vmas_dontneed(bo)) {
>  				bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> +				xe_bo_set_purgeable_shrinker(bo);
> +			}
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> -- 
> 2.43.0
> 
