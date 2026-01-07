Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFFCF6BE2
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 01:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740E610E567;
	Wed,  7 Jan 2026 01:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv7Sh+i0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDA410E567
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 01:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767749094; x=1799285094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e9MalDNzDXH87uGJeukWyGh1cFbb3VbLYm0qcFQW6Pw=;
 b=iv7Sh+i05LH4b4FUb6IPbQWN7pdhtLQabIJSHQMexRJ9s79sWLTipgEg
 OM8bhe9F4Hq/PpAPSkZdUHbkygTj10ySnt+GFV6Xjn8nZukBnDO0+2VMl
 sHfe0TchdB6NcXJlHMxkwJbeNDNX14CSTutalwmtioPF0HREKhnfGKlS4
 d45BtO46W1+jLlVptRwVDRKpNb2ag8XFM7g77pKgrWy9xMdklE7n8D3B1
 5IP5fLTn/5d4qQVqyXwdha2i8Iv6iXrEuouXU98KIuCFhgu4y1dsIjYVN
 ECUM7aIR6+CfLXTX//XoEC2+mx7VPj7dYz9B0OX5vBoM/ZNmiuLIKHoIP A==;
X-CSE-ConnectionGUID: jeoU1e2lS5C09fIM1pjEJg==
X-CSE-MsgGUID: hQYSiYQmR+O+gIrQ/KC8Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68129059"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="68129059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:24:54 -0800
X-CSE-ConnectionGUID: LUPh35RpTRuUioe2KmYptA==
X-CSE-MsgGUID: ZMbSSfvWScGYqCB5RyB+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="240277176"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:24:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 17:24:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 17:24:53 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 17:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pvl2Yc97KSAKrahfv3MIwUoy2yVV1G8ncnn8LCpDfjg0YZ5J7+0crnZyQeSlnO6RXygOv30M4VHcwPKS14FSpMGztoVS7ZvhgrFu81I77tkoT44dKOm3oYAb94FLEHC6DsdKH5MXoYMjJFR0t5cBPE6OBGq5vPL6Jvdfes6SFzRXt1bNaVTmavlEkWCLzL3HcmdnYxSpfrAh0yJ92Du79QGsDOpDMBLgIluyx7IU6Qc3BY7AsoHaWFgib0eUUJjykjPQy6NC00EjzfxUEwO3mhHWZl8YyN3OhgaH2Fa/eOmQlnvgfkSYWXXjtFbYB3oay1A4L6ND4VGnqx0Z7tYQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKDfxcROP4NMRWVqjQ9qBthUeZBYtUWCzfexytmT+7M=;
 b=u+GX+2qy2UXUv4+o3OdQ+LvMzPMdFjROoND2P7esG0w+ZCa/0aHAMpZtncZgJrqeP2tZisjOkWNKhwgzt1BDTQVle2gksbHK0uDCB0tjW/nmoIpeMIjyteehzgMPTZ31lG0CEmNk4JeR6MVPDCByy/RlecRcXtO2YkQZNvhYAz+5Ay/V4uhuk137Z5nHjvcDsOj3F9LHGOy5ANRyinUul2SAg/vyWd5dhagdWh5HTWwdDn7Hix4+hBtNjOprKDc36cqxhs0s8Pl9Nz5DuPL1/6JrgiB9zkseMBwYD3AYyL5svUOGs0nK5S0flW0BQvwqWFH/Pn2RYPu73zdRYY5+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 01:24:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 01:24:50 +0000
Date: Tue, 6 Jan 2026 17:24:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Message-ID: <aV214ECqe28iHfz1@lstrano-desk.jf.intel.com>
References: <20260102165450.561614-3-anoop.c.vijay@intel.com>
 <20260102165450.561614-4-anoop.c.vijay@intel.com>
 <aV1WekOuQFlqdEne@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV1WekOuQFlqdEne@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 193ad87b-b10a-4c65-d167-08de4d8b8daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?12MX0OtLrlFvwevoQh8f2dVImrKD6tZjemFVUShcArVOTOaI0iiG2M6x5d?=
 =?iso-8859-1?Q?K+Pt6p1gVdyZCdq2R8ifPhntpYAxHQAnY//f3Y4e5eFjuKfOpz41y3Qkd1?=
 =?iso-8859-1?Q?zdA9knCJecmYnbd9S9PrpDDc/n9FvFZXq8GKrE0RLfoK5/uP/67G0+Q5Gi?=
 =?iso-8859-1?Q?iBRHpydtutgJMz7LuNen/0qCsazfxb5e0Ze6lk5ovR8tHBe8zxhSuVIhgb?=
 =?iso-8859-1?Q?LUOfq/wyM0o/7ENSfT8yRRlq0UXFsQTSq/R8rhDMnr2lef//Sm7XQM5bEm?=
 =?iso-8859-1?Q?2sZeoxPkjsQqwKRrnyO+DREZ4nZs17UTIJk12DGrf2likbba1rwrV1A4vk?=
 =?iso-8859-1?Q?ingxLr97/QysleuKiNbFSN10fTW6NGSNiqFZ8KWn1fAw3I/qxAMCIy7CtB?=
 =?iso-8859-1?Q?DgtAHlvzdlPuVHCGx12VsQO11boaQSjGCodntoHzPi3uCDFNNPhFf58z8Y?=
 =?iso-8859-1?Q?X4W8Ce3lpk2+Hsu7Vn6ZjZbCMGKlywa7rSD2qVefvI0u1KyNflq1kLj9oV?=
 =?iso-8859-1?Q?9T8X5YdoyiXG0j7ToQHzdgVKYrHFm9TSJ40orZ3QJiwzUIjB6kPg65Coug?=
 =?iso-8859-1?Q?U3CXuVtI4G/NencVMBbRk2M5qLX4R1+601NFZSIUs5qg6MgVZXQUWXvL70?=
 =?iso-8859-1?Q?dHk4JVus5wYUsvWFY158FeHWWy/dB1W2IydqHxpnFEUH4pru9KLFDSoAdd?=
 =?iso-8859-1?Q?qTun6bao5qjd2fqOmy+Z82sw0vHJ1xT37gn4uu45S60PBjUF+O/X8+KHnT?=
 =?iso-8859-1?Q?vmQMAoZMOGvhz3VMS3g52tvuoYlI4NExM5QN3lU2SeVw3BqPqEzTxh0y/l?=
 =?iso-8859-1?Q?++45dBifoxZJPtU/xxagQ/lBnHARq0SmfbL/wNbg7+UZQaVHkGr47DsTrm?=
 =?iso-8859-1?Q?X8KgRWfS8UwkvMoX7HQu+joF1t/uFbSrmVK8IxSGvboenZxGPjNa8DGa2C?=
 =?iso-8859-1?Q?VqsKrteouw/UO6jdaBfiDfI7pTtRS7JHlhnRn/ElYH0JwLBYd6NnQU8gbf?=
 =?iso-8859-1?Q?UEu4y5HKCFO/WmI2YTINZQu3SvMRLA/Lq+Dinvv08My+NgOGphrm0aNmBx?=
 =?iso-8859-1?Q?2rSF55SNAPbS8EjqAJ2rojS9gSLuhiUDiqUOUbU4LFqngi9aN+fMpflurq?=
 =?iso-8859-1?Q?p1YpCT/WZFnrKKiZ6qZWY7yW8ZOie4DF1+Wi9VvRZMEAn+6iFNmAp2z4B4?=
 =?iso-8859-1?Q?ZI5+9SEQbSN16nI0YhQIdzf/v0YyTErEBPE+07h4JraD/VSe1NwlgSCuyi?=
 =?iso-8859-1?Q?EB9S6ZSB8lrKZRdCqMp4o7cCU9nDoLzlhjzo809cVmHp7bh66vDwZx8qCQ?=
 =?iso-8859-1?Q?QdJPHXT4p1xVMxe5pJaHLEnsFSdrrPTGYlsc+B5fV2MM4DzM1mX28t9PX3?=
 =?iso-8859-1?Q?3+rizvkTq16AmMvI8JMS/6Yb0DpBQOCq3P6YMMC/pFeziB3/RIqzn1iJW8?=
 =?iso-8859-1?Q?rf/OvASfuYk3kxjip3NlYlbtdd6bAEbuDPlNex8yVYFzP90Rzqz5aLK+RL?=
 =?iso-8859-1?Q?jTSPMpbJ9Bdlb4FNrI+PIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iRzrIHMN5rdlk06RBhoVcTA44XLYI7a5F5WzINAVCLwKTlGkR6pZ3RBmgr?=
 =?iso-8859-1?Q?m3uJX9gmj393liEQ92Ub1LhhKRAw/lqlDRC7vimwDCHgbApnpWWc23cW6F?=
 =?iso-8859-1?Q?69YfgAcqxgZkwl8lfw1v+24Nw7UitHJdQ5IW+HmmoelPLHB8RDWCsE257R?=
 =?iso-8859-1?Q?NXaBjG5EuvR6kKcvPmAnY5/5l8hR7kCf9axpAnzCT4QZaxs2ffCrZXg+ak?=
 =?iso-8859-1?Q?snWWr2fDcW4B9P74IlCpe9ULcHyHiYAhACuE76PreATt6iPAB4g5b8vQnh?=
 =?iso-8859-1?Q?0aE3XSwFIbyvZ/isn4i92Xyb0fBUtUwQQtJfMP/4mD3CsyiJ30WGO0xRWu?=
 =?iso-8859-1?Q?nwCjXuQPP2Ufq95m6yCCHPQ0eeLQFVNpK/uPZ32YLTqT4eaPDz5zZaLGWo?=
 =?iso-8859-1?Q?uL6mpAmV5Z4YKKa0yrp+jVZe3yTIPxsbpacq3netTAXGO2zIwamZUu1OQB?=
 =?iso-8859-1?Q?GlNMSkibjRXmQ4OoMszpaK9YKgWcdyOqKmVOh3afL2n1CTzoBeO+CNXm+t?=
 =?iso-8859-1?Q?7PSyh/ovjh32O10Lg/l0stnJKTRflTqUOpLg8NJFj26vuXvPo3qA5AlwyA?=
 =?iso-8859-1?Q?k+nlLqu+zZ146u6dRKkoavihInLJdWW3cdlkTLHs6NuTo3lLaogRVf+7vv?=
 =?iso-8859-1?Q?tsK/Mc/0mHzOJJf/8sBcaElha8slWO0NWk1EoeVYGzQIK+ou96AHOkkV6L?=
 =?iso-8859-1?Q?geOgnl0CUOLN4aECFqBSNhi+p6GUp9KbTlhROltT1GXSxDawEy68Y7MTA/?=
 =?iso-8859-1?Q?V253D/EtiA3QdKLbf1/J/wPANle1uy5m93PM48NmhUj6z6teeA4awNDF6Q?=
 =?iso-8859-1?Q?cMcj9x204i0h//SYBjV8IlyK/xt91GAHXrTfksMScFwr59OCfTCBquB2tp?=
 =?iso-8859-1?Q?tlQLzXqVIPK/v9wEF99tXF0v8Bh2z3cG41Mi1zE1KlEC60Z/YsvueE/Zzr?=
 =?iso-8859-1?Q?kMdCNc4y96b4frUcCkAl/p1uWPsXDVfyhmG8+YZF1ebu6NRpNhFTwbbyjR?=
 =?iso-8859-1?Q?Tf1KvzXN9EPtp/9KhFWp1jzU7EgTaIR5O5YE8EfKls6B2Z09POm24rFm6U?=
 =?iso-8859-1?Q?3Fa0GxeXxsn5ku/IJmUbfOkAdSGhIyfSDcaUrdlPiu1h23Tn5qdTRnnGbB?=
 =?iso-8859-1?Q?KaQRgxKcBKCD/WaGvyvwjt51iwjAlcLlIDvonPp3aPLkf7bAgtFrJAUJH6?=
 =?iso-8859-1?Q?6xbJ6/75YiVO+iCjxLR/7zjaUReVpIhvkrsinZTnw+dmCP5dttm5HxxJbC?=
 =?iso-8859-1?Q?Vnkg/24tN7kYH5RWQJ8aU07pN6/oe99F14k0fJscg6zHpcLVzwwbY9LJRk?=
 =?iso-8859-1?Q?jsPLS7HSTzZuoaNC10KUu1s9Sgfd9UtJcbXMrwQaryIMR1vLzpfaWVRW7/?=
 =?iso-8859-1?Q?HLxCvp3zbuGZ6RcMPBsRu7QgYoYBLNmtLyuty92k6ZVIaP6ErjjHCz1/pE?=
 =?iso-8859-1?Q?ec9iAs9MpNya+gvw9mjQ1lb2TFvh3hvL+GcLoV5Q5FoQ6ZjQVGzMR/XlVs?=
 =?iso-8859-1?Q?nSHzMdOshKPISzpkyHZQH+kM0gjwRn6q6mGg0RYOH3h+P3b9b9GoSJOzt3?=
 =?iso-8859-1?Q?8wYE/kXaLNQomqfJPrLwv99N8/Mle2qXwlVt6dmd097u1kuykDWqhvIDZ3?=
 =?iso-8859-1?Q?Fe9Js0AMzHnzGkqYyzd+qODfmSHMnOGtGshlPiuFu84L7IRdFj3JMhqW0v?=
 =?iso-8859-1?Q?kQP7EbVL61UlhuEQzOba4BX07knEDHTAJrNdYXKWZaqIfSoHtYvh28ey97?=
 =?iso-8859-1?Q?EjtJqRZHtPUaG2zxKYBL3J+zMtxTQ4KHVDWKw3dmsf0DVI7sa8omBdBsFg?=
 =?iso-8859-1?Q?/AdqCzK7eh0RReeq3ZhQlfaEIeVCkZc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 193ad87b-b10a-4c65-d167-08de4d8b8daa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:24:50.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdpMJYbROZOaVVC+b+6gshv1aKkpnSSZt8eDlCchx+2EDqLd7URkgQX6a0Dzmmmyn/oUNE+NEIDwV/qsVfgDPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

On Tue, Jan 06, 2026 at 10:37:46AM -0800, Umesh Nerlige Ramappa wrote:
> Hi Anoop,
> 
> Thanks for incorporating most of the comments here. I have a few more in
> this revision.
> 
> On Fri, Jan 02, 2026 at 08:54:50AM -0800, Anoop, Vijay wrote:
> > From: Anoop Vijay <anoop.c.vijay@intel.com>
> > 
> > Add a new system controller (sysctrl) component for Intel Xe3p dGPU
> > platforms.
> > 
> > This component provides the foundational infrastructure for communication
> > with the System Controller firmware using MKHI protocol over a mailbox
> > interface.
> > 
> > Key features introduced:
> > - Detection and initialization of System Controller interface on Xe3p
> >   dGPU platforms
> > - Mailbox communication with System Controller firmware
> > - Fragmented message transfer for large command payloads
> 
> Let's break down the patches as Matt suggested.
> 
> > 
> > This implementation establishes the base for future System Controller
> > feature enablement and firmware command handling.
> > 
> > Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile               |   2 +
> > drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
> > drivers/gpu/drm/xe/xe_device.c            |   5 +
> > drivers/gpu/drm/xe/xe_device_types.h      |   6 +
> > drivers/gpu/drm/xe/xe_pci.c               |   2 +
> > drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
> > drivers/gpu/drm/xe/xe_sysctrl.c           |  62 ++++
> > drivers/gpu/drm/xe/xe_sysctrl.h           |  18 +
> > drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 409 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  77 ++++
> > drivers/gpu/drm/xe/xe_sysctrl_types.h     |  23 ++
> > 11 files changed, 649 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 2b20c79d7ec9..947fbcac65d5 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -121,6 +121,8 @@ xe-y += xe_bb.o \
> > 	xe_step.o \
> > 	xe_survivability_mode.o \
> > 	xe_sync.o \
> > +	xe_sysctrl.o \
> > +	xe_sysctrl_mailbox.o \
> > 	xe_tile.o \
> > 	xe_tile_sysfs.o \
> > 	xe_tlb_inval.o \
> > diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> > new file mode 100644
> > index 000000000000..6627a9c32c4f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> > @@ -0,0 +1,44 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SYSCTRL_REGS_H_
> > +#define _XE_SYSCTRL_REGS_H_
> > +
> > +#include "xe_regs.h"
> > +
> > +#define SYSCTRL_BASE_OFFSET		0xDB000
> > +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> > +#define SYSCTRL_MAILBOX_INDEX		0x03
> > +#define SC_BAR_LENGTH			0x1000
> > +
> > +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> > +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> > +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> > +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> > +#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
> > +#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
> > +#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
> > +#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
> > +
> > +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> > +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> > +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> > +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> > +
> > +#define MKHI_FRAME_PHASE		REG_BIT(24)
> > +#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
> > +#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
> > +#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
> > +
> > +#define SC_MB_FRAME_SIZE		16
> > +#define SC_MB_MAX_FRAMES		64
> > +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> > +#define SC_MKHI_COMMAND			5
> > +
> > +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> > +#define SC_MB_RETRY_TIMEOUT_MS		20
> > +#define SC_MB_POLL_INTERVAL_US		100
> 
> 1)
> I missed this the last time. Can we change SC to SYSCTRL here for
> everything? I see that for the mailbox, you are using SC_MB, but at the end
> of the day SC still means SYSCTRL and consistently using the same name helps
> readability.
> 
> 2)
> The MKHI_FRAME definitions can move to the xe_sysctrl_mailbox.c since that's
> the only code accessing it. See more comments below.
> 
> 
> > +
> > +#endif /* _XE_SYSCTRL_REGS_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index e101d290b2a6..805d48dd954d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -66,6 +66,7 @@
> > #include "xe_survivability_mode.h"
> > #include "xe_sriov.h"
> > #include "xe_svm.h"
> > +#include "xe_sysctrl.h"
> > #include "xe_tile.h"
> > #include "xe_ttm_stolen_mgr.h"
> > #include "xe_ttm_sys_mgr.h"
> > @@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		goto err_unregister_display;
> > 
> > +	err = xe_sysctrl_init(xe);
> > +	if (err)
> > +		goto err_unregister_display;
> > +
> > 	err = xe_device_sysfs_init(xe);
> > 	if (err)
> > 		goto err_unregister_display;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index a85be9ba175e..6295b2c35d4a 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -29,6 +29,7 @@
> > #include "xe_sriov_vf_ccs_types.h"
> > #include "xe_step_types.h"
> > #include "xe_survivability_mode_types.h"
> > +#include "xe_sysctrl_types.h"
> > #include "xe_tile_sriov_vf_types.h"
> > #include "xe_validation.h"
> > 
> > @@ -340,6 +341,8 @@ struct xe_device {
> > 		u8 has_soc_remapper_telem:1;
> > 		/** @info.has_sriov: Supports SR-IOV */
> > 		u8 has_sriov:1;
> > +		/** @info.has_sysctrl: Supports System Controller */
> > +		u8 has_sysctrl:1;
> > 		/** @info.has_usm: Device has unified shared memory support */
> > 		u8 has_usm:1;
> > 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> > @@ -606,6 +609,9 @@ struct xe_device {
> > 	/** @heci_gsc: graphics security controller */
> > 	struct xe_heci_gsc heci_gsc;
> > 
> > +	/** @sc: System Controller */
> > +	struct xe_sysctrl sc;
> > +
> > 	/** @nvm: discrete graphics non-volatile memory */
> > 	struct intel_dg_nvm_dev *nvm;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 91e0553a8163..b6dc3030b673 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
> > 	.has_soc_remapper_sysctrl = true,
> > 	.has_soc_remapper_telem = true,
> > 	.has_sriov = true,
> > +	.has_sysctrl = true,
> > 	.max_gt_per_tile = 2,
> > 	.require_force_probe = true,
> > 	.va_bits = 57,
> > @@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> > 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> > 		desc->has_sriov;
> > +	xe->info.has_sysctrl = desc->has_sysctrl;
> > 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> > 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 5f20f56571d1..53e44a32883d 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -56,6 +56,7 @@ struct xe_device_desc {
> > 	u8 has_soc_remapper_sysctrl:1;
> > 	u8 has_soc_remapper_telem:1;
> > 	u8 has_sriov:1;
> > +	u8 has_sysctrl:1;
> > 	u8 needs_scratch:1;
> > 	u8 skip_guc_pc:1;
> > 	u8 skip_mtcfg:1;
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> > new file mode 100644
> > index 000000000000..e0e7b0ecf2bf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -0,0 +1,62 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +#include <linux/device.h>
> > +#include <linux/mutex.h>
> > +
> > +#include "regs/xe_sysctrl_regs.h"
> > +#include "xe_device.h"
> > +#include "xe_printk.h"
> > +#include "xe_soc_remapper.h"
> > +#include "xe_sysctrl.h"
> > +#include "xe_sysctrl_mailbox.h"
> > +#include "xe_sysctrl_types.h"
> > +
> > +static void xe_sysctrl_fini(void *arg)
> > +{
> > +	struct xe_sysctrl *sc = arg;
> > +	struct xe_device *xe = sc_to_xe(sc);
> 
> Instead of using sc_to_xe here, just pass the xe as arg.
> > +
> > +	if (!xe->soc_remapper.set_sysctrl_region)
> > +		return;
> > +
> > +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> > +}
> > +
> > +/**
> > + * xe_sysctrl_init - Initialize SC subsystem
> > + * @xe: xe device instance
> > + *
> > + * Entry point for SC initialization, called from xe_device_probe().
> > + * This function checks platform support and initializes the system controller.
> > + *
> > + * Return: 0 on success, error code on failure
> > + */
> > +int xe_sysctrl_init(struct xe_device *xe)
> > +{
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +	int ret;
> > +
> > +	if (!xe->info.has_sysctrl)
> > +		return 0;
> > +
> > +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!xe->soc_remapper.set_sysctrl_region)
> > +		return -ENODEV;
> > +
> > +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> > +
> > +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe_sysctrl_mailbox_init(sc);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > new file mode 100644
> > index 000000000000..fe90d6577d54
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SYSCTRL_H_
> > +#define _XE_SYSCTRL_H_
> > +
> > +struct xe_device;
> > +
> > +static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> > +{
> > +	return container_of(sc, struct xe_device, sc);
> > +}
> 
> I would move this to the xe_sysctrl_mailbox.c. Also compile fails here due
> to missing struct xe_sysctrl declaration.
> 
> > +
> > +int xe_sysctrl_init(struct xe_device *xe);
> > +
> > +#endif /* _XE_SYSCTRL_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > new file mode 100644
> > index 000000000000..940ea535da2e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > @@ -0,0 +1,409 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/errno.h>
> > +#include <linux/minmax.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +
> > +#include "regs/xe_sysctrl_regs.h"
> > +#include "xe_device.h"
> > +#include "xe_mmio.h"
> > +#include "xe_pm.h"
> > +#include "xe_printk.h"
> > +#include "xe_sysctrl.h"
> > +#include "xe_sysctrl_mailbox.h"
> > +#include "xe_sysctrl_types.h"
> > +
> > +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> > +					      unsigned int timeout_ms)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	int ret;
> > +
> > +	ret = xe_mmio_wait32_not(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> > +				 timeout_ms * 1000, NULL, false);
> > +
> > +	return ret == 0;
> > +}
> > +
> > +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> > +					    unsigned int timeout_ms)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	int ret;
> > +
> > +	ret = xe_mmio_wait32(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> > +			     timeout_ms * 1000, NULL, false);
> > +
> > +	return ret == 0;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
> > +					  size_t len)
> > +{
> > +	static const struct xe_reg regs[] = {
> > +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> > +	};
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> > +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> > +	u32 i;
> > +
> > +	memcpy(val, frame, len);
> > +
> > +	for (i = 0; i < dw; i++)
> > +		xe_mmio_write32(mmio, regs[i], val[i]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
> > +					 size_t len)
> > +{
> > +	static const struct xe_reg regs[] = {
> > +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> > +	};
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> > +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> > +	u32 i;
> > +
> > +	for (i = 0; i < dw; i++)
> > +		val[i] = xe_mmio_read32(mmio, regs[i]);
> > +
> > +	memcpy(frame, val, len);
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +
> > +	xe_mmio_rmw32(mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT, 0);
> > +}
> > +
> > +static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
> > +					      u8 group_id, u8 command,
> > +					      const void *data_in, size_t data_in_len,
> > +					      u8 **mbox_cmd, size_t *cmd_size)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> > +	size_t size;
> > +	u8 *buffer;
> > +
> > +	size = sizeof(*mkhi_hdr) + data_in_len;
> > +	if (size > SC_MB_MAX_MESSAGE_SIZE) {
> > +		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	buffer = kmalloc(size, GFP_KERNEL);
> > +	if (!buffer)
> > +		return -ENOMEM;
> > +
> > +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
> > +	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
> > +				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
> > +				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
> > +				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
> > +				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
> > +
> > +	if (data_in && data_in_len)
> > +		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
> > +
> > +	*mbox_cmd = buffer;
> > +	*cmd_size = size;
> > +
> > +	return 0;
> > +}
> 
> In all the functions above, you do not use the sc pointer at all, so  why
> not just pass xe to the functions? If you do that, then in most functions
> below you will not use sc pointer and you can do away with the sc_to_xe
> conversion altogether and pass xe everywhere. Note that you only need the sc
> object in
> 
> xe_sysctrl_init()
> xe_sysctrl_mailbox_send_frames()
> xe_sysctrl_mailbox_init()
> 
> > +
> > +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *mbox_cmd,
> > +					  size_t cmd_size, unsigned int timeout_ms)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	u32 ctrl_reg, total_frames, frame;
> > +	size_t bytes_sent, frame_size;
> > +
> > +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> > +
> > +	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> > +		xe_err(xe, "sysctrl: Mailbox busy\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	sc->phase_bit ^= 1;
> > +	bytes_sent = 0;
> > +
> > +	for (frame = 0; frame < total_frames; frame++) {
> > +		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> > +
> > +		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> > +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> > +			sc->phase_bit ^= 1;
> > +			return -EIO;
> > +		}
> > +
> > +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> > +			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
> > +			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
> > +			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
> > +			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
> > +
> > +		xe_mmio_write32(mmio, SC_MB_CTRL, ctrl_reg);
> > +
> > +		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> > +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> > +			return -ETIMEDOUT;
> > +		}
> > +
> > +		bytes_sent += frame_size;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
> > +						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> > +						  void *out,
> > +						  size_t frame_size,
> > +						  size_t *payload_bytes)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	u32 frame_data[4];
> > +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
> > +	size_t hdr_size = sizeof(*resp_hdr);
> > +	size_t payload_size;
> > +	int ret;
> 
> I would rearrange the variables in decreasing line length. Not a coding
> guideline, but is generally advised to do so.
> 
> struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
> struct xe_device *xe = sc_to_xe(sc);
> size_t hdr_size = sizeof(*resp_hdr);
> size_t payload_size;
> u32 frame_data[4];
> int ret;
> 
> Also, please avoid hardcoded 4 in frame_data dimension. It could be
> frame_data[SC_MB_FRAME_SIZE / sizeof(u32)]
> 
> > +
> > +	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
> > +
> > +	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
> > +	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
> > +	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
> > +		xe_err(xe, "SC: Response header mismatch\n");
> > +		return -EPROTO;
> > +	}
> > +
> > +	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
> > +		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
> > +		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
> > +		return -EIO;
> > +	}
> > +
> > +	payload_size = frame_size - hdr_size;
> > +	if (payload_size > 0)
> > +		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
> > +
> > +	*payload_bytes = payload_size;
> > +
> > +	xe_sysctrl_mailbox_clear_response(sc);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
> > +					    void *out, size_t frame_size,
> > +					    unsigned int timeout_ms)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	int ret;
> > +
> > +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> > +		xe_err(xe, "sysctrl: Response frame timeout\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe_sysctrl_mailbox_clear_response(sc);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
> > +					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> > +					     void *data_out, size_t data_out_len,
> > +					     size_t *rdata_len, unsigned int timeout_ms)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> > +	u32 ctrl_reg, total_frames, frame;
> > +	size_t hdr_size = sizeof(*mkhi_hdr);
> > +	u8 *out = data_out;
> > +	size_t received = 0;
> > +	size_t frame_size;
> > +	int ret = 0;
> > +
> > +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> > +		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> > +	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
> > +
> > +	if (total_frames == 1)
> > +		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
> > +	else
> > +		frame_size = SC_MB_FRAME_SIZE;
> > +
> > +	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, frame_size, &received);
> > +	if (ret)
> > +		return ret;
> > +
> > +	out += received;
> > +
> > +	for (frame = 1; frame < total_frames; frame++) {
> > +		size_t remaining = data_out_len - received;
> > +
> > +		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
> > +
> > +		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
> > +		if (ret)
> > +			break;
> > +
> > +		received += frame_size;
> > +		out += frame_size;
> > +	}
> 
> I fell there should be a simpler way to implement this function. I will get
> back if I can think of anything.
> 
> > +
> > +	*rdata_len = received;
> > +
> > +	return ret;
> > +}
> > +
> > +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
> > +					   const u8 *mbox_cmd, size_t cmd_size,
> > +					   void *data_out, size_t data_out_len,
> > +					   size_t *rdata_len, unsigned int timeout_ms)
> > +{
> > +	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> > +	size_t received;
> > +	int ret;
> > +
> > +	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!data_out || !rdata_len)
> > +		return 0;
> > +
> > +	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
> > +
> > +	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
> > +						&received, timeout_ms);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*rdata_len = received;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sysctrl_send_command - Send command to System Controller via mailbox
> > + * @handle: XE device handle
> > + * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
> > + * @rdata_len: Pointer to store actual response data size (can be NULL)
> > + *
> > + * Send a command to the System Controller using MKHI protocol. Handles
> > + * command preparation, fragmentation, transmission, and response reception.
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> > +{
> > +	struct xe_device *xe = handle;
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
> > +	u8 *mbox_cmd = NULL;
> > +	size_t cmd_size = 0;
> > +	u8 group_id, command_code;
> > +	int ret = 0;
> > +
> > +	if (!xe) {
> > +		pr_err("sysctrl: Invalid device handle\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!cmd) {
> > +		xe_err(xe, "sysctrl: Invalid command buffer\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!xe->info.has_sysctrl)
> > +		return -ENODEV;
> > +
> > +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> > +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> > +
> > +	if (!cmd->data_in && cmd->data_in_len) {
> > +		xe_err(xe, "sysctrl: Invalid input parameters\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!cmd->data_out && cmd->data_out_len) {
> > +		xe_err(xe, "sysctrl: Invalid output parameters\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	might_sleep();
> > +
> > +	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
> > +						 cmd->data_in, cmd->data_in_len,
> > +						 &mbox_cmd, &cmd_size);
> > +	if (ret) {
> > +		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +
> > +	guard(mutex)(&sc->cmd_lock);
> > +
> > +	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
> > +					      cmd->data_out, cmd->data_out_len, rdata_len,
> > +					      SC_MB_DEFAULT_TIMEOUT_MS);
> > +	if (ret)
> > +		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
> > +
> > +	kfree(mbox_cmd);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_sysctrl_mailbox_init - Initialize the System Controller mailbox state
> > + * @sc: System controller structure
> > + */
> > +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> > +{
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	u32 ctrl_reg;
> > +
> > +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> > +	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
> > +
> > +	xe_mmio_rmw32(mmio, SC_MB_CTRL, MKHI_FRAME_PHASE, 0);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > new file mode 100644
> > index 000000000000..3e472418ebd0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > @@ -0,0 +1,77 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef __XE_SYSCTRL_MAILBOX_H__
> > +#define __XE_SYSCTRL_MAILBOX_H__
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/types.h>
> > +
> > +struct xe_sysctrl;
> > +
> > +#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> > +#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> > +#define MKHI_HDR_IS_RESPONSE		BIT(15)
> > +#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> > +#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
> 
> Same comment as (2) above. If the MKHI defines are solely used by
> xe_sysctrl_mailbox.c, then you can just move them there. I assume that the
> app is only using the APP_HDR and is not concerned with the underlying
> protocol/transport.
> 
> > +
> > +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
> > +	__le32 data;
> > +} __packed;
> > +
> > +#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> > +#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
> > +#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
> > +#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
> > +
> > +struct xe_sysctrl_mailbox_app_msg_hdr {
> > +	__le32 data;
> > +} __packed;
> > +
> > +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> > +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> > +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> > +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
> > +	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
> > +	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
> > +	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> > +
> > +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
> > +	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> 
> Same here. MKHI defines can move to the C file. Either that or the APP api
> can be moved to a separate header - xe_sysctrl_mailbox_api.h.
> 
> Regards,
> Umesh
> 
> > +
> > +/**
> > + * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
> > + */
> > +struct xe_sysctrl_mailbox_command {
> > +	/** @header: Application message header containing command information */
> > +	struct xe_sysctrl_mailbox_app_msg_hdr header;
> > +
> > +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> > +	void *data_in;
> > +
> > +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> > +	size_t data_in_len;
> > +
> > +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> > +	void *data_out;
> > +
> > +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> > +	size_t data_out_len;
> > +};
> > +
> > +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> > +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);

The above function looks to be unused too.

Also why 'void *handle' rather than xe_device or xe_sysctrl?

Matt

> > +
> > +#endif /* __XE_SYSCTRL_MAILBOX_H__ */
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > new file mode 100644
> > index 000000000000..88a34967688b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SYSCTRL_TYPES_H_
> > +#define _XE_SYSCTRL_TYPES_H_
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct xe_sysctrl - System Controller driver context
> > + */
> > +struct xe_sysctrl {
> > +	/** @cmd_lock: Mutex protecting mailbox command operations */
> > +	struct mutex cmd_lock;
> > +
> > +	/** @phase_bit: MKHI message boundary phase toggle bit */
> > +	u32 phase_bit;
> > +};
> > +
> > +#endif /* _XE_SYSCTRL_TYPES_H_ */
> > -- 
> > 2.43.0
> > 
