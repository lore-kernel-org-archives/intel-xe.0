Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62CC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E5E10E431;
	Mon,  8 Jul 2024 22:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anYdymiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916DB10E431
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720476782; x=1752012782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rWsYXKjeKSJ3FvviAgTAiJtFZKeTQkgaMKBblYQTcTE=;
 b=anYdymiRgIKBmhvs3NRk3ZxJq588BVZy52yYNKzxRvFp4uR+Wco2YnNy
 CpBj2YqV4lY8+owHzstx9kaLBZo2b828n+T/TJwCKYyelIc5rr7wzSdzu
 hzbUdUAMGmN7ah/eWWhTkdYlSRv/nr4ugS1M33jmrlsPRN07Z/Fg/hIPj
 aT/J1TJ/QgwWNBMSwubiAouYK9plX1RweReRKg81MRj0tT6shCljqZDsR
 qO49Th5QgN5QcbBS4clmZhAUwRYiC3VwV2REzO8XaU6aA3iy1codLD5Bb
 JtZMwzZvC685H3oqR9WnonecRZdFsmyE5/B6JVIBjDCaxg3pJt9ZaJTyw Q==;
X-CSE-ConnectionGUID: sTBD3TGnS+mGdAyAfXA6dA==
X-CSE-MsgGUID: +G309LxTQOCezDLO+Fs9NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17535918"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17535918"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:13:02 -0700
X-CSE-ConnectionGUID: I1VfqkJURS6gL/1xOwwkfw==
X-CSE-MsgGUID: Cv9UpayRRZKoAJinMq9wqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="48364963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:13:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:12:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:12:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJBwQNbxycfkVg6sZVQ9wxBt03aH6TWgDkbr+csUg0keb/e3501aUfAXwf/Sh+N4LAoKf9datICuUUddRHb+fl3YoncJM65biDGmOkLyNZndq4z/XyryadST74Meh+oieiwb7mXGOwcwlrhM4+kJiKQnhENiK6suYyWbeRWTzotASujsbANwRKS2RwVA9gvH1OgsZU7KJpA1K0Qv1INfeI+YKvYQldMclrTZ5GqMRRGjm6piZ3PU9wqFqOaL2wp8cvzeCGiD3yvmyxNJIp32Y7tVcdBSx9hmsnSBzH6m/HWbGZmLTqx70fCNAJ1FaYxnhHlGA42Tcno5kFtydywYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNKgXTWZioS4b7CpIUYyrKGygoLfpjGqh1GbeL3zNoc=;
 b=H1XP4UiTkAfVuvSKyDnWoq21tA5ApAFrOKgwuIPdKENzeNFIdAeqhASuaFtOSYJo8yuODddBnTNb9XFYgddaOYT1p5GJPnruF/kYkFT7+MItdwSyUmomQSoOPcWeBdm1RQYtMspEsQ+cpgrhC/xQafL1afK3vqn6407VqzVvQQnWQSHiSwgcidc9A29KlDkxHhK3T9Cqp13OpvET8H8y5HFPr2qSPGq+peTw2dx/3OqwaKCd5z5Y7i1KZVjkjpa4grMaijjuxTVDTqZ1Io8Zea74zZpnKh1Xko3cNNEz8d/DsBggGli+G+3888muOo5Gyn3XzPMNH4e1n1DvRpqWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 22:12:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:12:36 +0000
Date: Mon, 8 Jul 2024 15:12:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Move part of xe_file cleanup to a helper
Message-ID: <ZoxkUZMQUrzSdVGy@orsosgc001>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-2-umesh.nerlige.ramappa@intel.com>
 <ZoxYPUice8rGGTrL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoxYPUice8rGGTrL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3b2744-6950-464e-f861-08dc9f9b128b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFVJcFBxYWlTc3ZvKzNrR0VvRXNWbXM4ejFLd25uSE9DeU45alI3ajk0dlR4?=
 =?utf-8?B?OHc1dm10R2JiOWlVVGtRVWdOUk5zZ2ZOMUYwbENvOGk5ZjZ2cmY2VlVkY1la?=
 =?utf-8?B?QUFtTGQ3ZzB0MTY5ZVM2QlROTTVhVmpjL0p4TEdyc084dExGN1lUeVFCZzRz?=
 =?utf-8?B?cC9OZFVXdkY2NEpFaTJQb0x6bXI2eEliVXNqcmNFUERVVFZqdWxNaGJ4Umlh?=
 =?utf-8?B?TjZPNk5YSmNDTUtiTHR5MHVEMTJDSDVaUHpIRFZOSlMrcjF6elpHWXI2NThN?=
 =?utf-8?B?eHI1V210Zkg5Z3k5NTgzakVsQ01XTmpyclg0NS9pb0JvREVPaFlHcmtSZndT?=
 =?utf-8?B?RS9NTERkV0ZGR2drUWJYTkdOTW5ZVzBNV1gxOE5KaHk1c21nZ1UyMDBFWkZl?=
 =?utf-8?B?TEg1MUw4TzNCQk02M0Z2QkNSZHd6SE4zMzVXTnpKc1dkOWdYWmxGZGVzN1U3?=
 =?utf-8?B?TEtpb1pNVVFrRDBiNVdzK1VNQldTRmF6c01SOS9WcXZWQVVicVNENEdhaWli?=
 =?utf-8?B?SGxyWUZDSVhYQm9ZN1ovMDJ1cTAxcDR4L1JheG8zYkFlVkowWThzZ2JTbSt0?=
 =?utf-8?B?cEN6T0Z3Q1VLK09yNGg3OE52NWhOZU9saFBBd3dJc29BTmhjVUw3Wm9teWM5?=
 =?utf-8?B?U2NJSWNGYWFvNit6Z3Y4TnJJdG1HVUhTZStLTzlhcnBPTVNzUVBVVFdYVnBm?=
 =?utf-8?B?RHVxd2hxVzJYS3BHUjRjWDFRcmhNT2lFa3BMeUc5ZHVReEdyRW5iN0NaN3ln?=
 =?utf-8?B?NFZZL01OM05kS2ZoMVFVRXNydWUyNXNISld0VktsTXFzM1ByZWJHUy9ld20y?=
 =?utf-8?B?ZXhLNUNCd05vZCtERWR1QjB0NzJDNS9VdXNLTWxPSSt4cHRHQmIyOVg2aDNX?=
 =?utf-8?B?a0FiY1Awd09zdGU0MVA1a1BpbDJZZHpBdHNTTWdWWnlhWmE0Vm1xRzBRci9p?=
 =?utf-8?B?WldwSTQ5V09mV0pzMTJrbXducEM4RTV1dVFXaDE1Tm1uOFBKUUlZUGNneE9n?=
 =?utf-8?B?RStFN0tpQURncGtOWCtpekJhRGY4V1M5dmVHOXllQXlTQmNkWGpDM1NnV29E?=
 =?utf-8?B?SVNJd3ZYMjJaVkYvbk0vczM0aTkrcFVicE5YMktyMzZvVGF2WTNSSmxueFBv?=
 =?utf-8?B?cndTU1JMWGhjNXZ3b1ZUblBESC8yTmF5cUcwNWhsQXJVYkFDVG5xUnZrTmNh?=
 =?utf-8?B?TG96SGRSeVhwRFJHKytrbjFiUTRRTG1scXFiSnk3dVVVWWRZMk44NTEydk1h?=
 =?utf-8?B?dTE4L2lHYXd3L2FNMG4rdFMyVnZJMytLVHIrNkNGQjMzSDU2SnluWmJPYXh4?=
 =?utf-8?B?bVcwRThRTjlPWFM4UXpZYXFGTjFxNW5OVmx5TkZQKzB4M0VGc3NaOC9uYXFI?=
 =?utf-8?B?YjZpa3pRT0poMVhBVERWa1Z0NDNIS015bWFML2lLbVJvYzZLVDdWb3RYVVpn?=
 =?utf-8?B?cjdiWEZQdkxncDV1bUQwekl5bEdsM0kveDh6WkFaclNKWUFtNlQrTWhrSkVs?=
 =?utf-8?B?OWdXY2tDU3BoQnNJQU8rV3M4c081TXJvOFZOMnduMmVwMlJ1N3JPVktTWnhX?=
 =?utf-8?B?VmhZQVJHeG5PcXQ3UndWNjJFVktDa3BVYXQrSFpQSnU1T0FMS005VGduSXVY?=
 =?utf-8?B?OFBYT0VTZEMxTWVwMjM4Q015STh5RTNkd2I3WFdJUnVwVVQydnpLWEIyRzRR?=
 =?utf-8?B?aktpTDR5cUFkMUdjVDluVGlRdDFDK2ppMVNBbzVnUmtmS2VNeTZmTUIvSk1u?=
 =?utf-8?B?Ykt4SlRJcldjbStKZXp1MXN2cDBhUlVpalh1OUpZT1pmSmxCWUVTYmhndVFZ?=
 =?utf-8?B?dmV2SkgxdlFlTklLdWRSdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REF3aHdOakZMbmZ1djEvdUdsQTRZYUNzNlNTb2dNbmlCOEN2S3loMlhMMVRI?=
 =?utf-8?B?enhHQytJVUQ0VXFnMEZzNjZ4MjExcGh1VnFsNVlZcndrOXBES2FXN0Fubksy?=
 =?utf-8?B?R3puSzcvVTRuZGc2MFkraEt6ZkVuKzFmVy9RWitLam5uY1BnT2pJVC9CeXhX?=
 =?utf-8?B?Ym01U2FUVW16NUFzTmlmOURRUGtJR241bHNQR05XTzkrOFZJaHhoTHpuRkQz?=
 =?utf-8?B?UUFtWUY4T2N6cUt2c1U1TkNLNXRkTStEMGhQWko0ZWt0aVl1Q2g3V1MzV0Rx?=
 =?utf-8?B?SWNWdE5EVEZSczNPMXhQNWMvc0NvVHFwb0NGeWFmK1pPY2JKMUNrSzAxSlFM?=
 =?utf-8?B?ZFA1VGNwWDNoMDFsb2syT1pGY2VEeXVFVFI0TkxwMkF1M3ZVNWxKVWpSL1I4?=
 =?utf-8?B?WlYwT1JEeGVybUdHMzhsc2Y4ZmJDeTJnUEpTUnB0V2ZOVWFtRVptUUJXMnNU?=
 =?utf-8?B?ckFZTHp2cmVERDdvUklDZ0RlVVRaZENqVzhpckhzRVpBYlZPQXRPUEZ4dFFy?=
 =?utf-8?B?ZDNoT05QYVlTUXZmeGV0bEdRc3V1TC9xVzN0Tlp0ZmtTR0JqcFk5Y0hPR2Ju?=
 =?utf-8?B?aVpzNGlHdnU2RDNyMTNQRFpMKzRkcmtydm9TWlVhK1BxazNrOUZXYmc1WkRP?=
 =?utf-8?B?aWd1NTl4U1ordkovSldWRnhqb21mVWFhV2x3TEM3OGx2ZkwzNjRkSGhqc3ZE?=
 =?utf-8?B?NnlwZmRKYUovWENmdGt5aXhOK0wxSWtjcEhYRVQ5cFNrUSs0eGE1TkdLSEh4?=
 =?utf-8?B?ZGRQMVZSdkdUblV6R3diMEVjL2tkNUFrKytNNEFVVWRFV2c3Y01zL25wcVZW?=
 =?utf-8?B?YWwxWjJRUWpuV3VFZ1Jlb0Z1d1FzTnRjREFBeVoxNExOUE1mUnBWTDREcmVW?=
 =?utf-8?B?dHd2NGcvRVAxTnV1T0RQbEtMQkZ0bW5SdE9FM25sb0pEa2FQa2N3Q1JtTTJ1?=
 =?utf-8?B?NDUwbFM3cmtzOTZQZTYvSy8zdWJZSjI4cmswR2hTajRqK0U5UUQ2YW8yb21u?=
 =?utf-8?B?MU5uazF1b1Q2cG9PUkJDWjREa2dsMDcyQ2cvWDRyUXZVV0VsM0FzaG9nM1pi?=
 =?utf-8?B?NFJhYlRCTVpLMWtsMm9UTExXbVZHNVU0NENrTVFpNUVNVkxWeE5vOWxNeWl3?=
 =?utf-8?B?blFlNGtkZ3g2WXcyenZFK2lMV3hmY0ZIcllaRjFqTDY0djhpZWMrRW1aRDQ3?=
 =?utf-8?B?VTlHaFd2aHNwV0U3QW51ZlNkK1QzR2c3NVBiNnQ1QWhkN0VBRVM5SjRxa2VW?=
 =?utf-8?B?M0tnZ2dDWVM0KzJSUk9OalhZMkRQOG9FVmlHT0wvSnZYVDlaaG51bmgwSE50?=
 =?utf-8?B?aUdqZHE1YTZNRlJ6ZWllWlAxQ1BTM1cyMXpNVTZ0RjBJTTlUZVdlUlRBc0x4?=
 =?utf-8?B?UTZ0QUNrbmxBNUozTStFNFdNeUhYODRWRmhaNG5EY2cvMDM4eVRZdDBMelB2?=
 =?utf-8?B?SmtiL29YTWRDY3JKekcwazFRWWRSOTlnNUVWdTdqTHRRTE9WYk9PWm9TSE1v?=
 =?utf-8?B?RExUQlM3VndyL1RiL3YwMEF5UEZIWFpYeTU1MXpRM1B2UGJ2V1dDYnhnYTJz?=
 =?utf-8?B?bVEySFZSR3dSTDluWFZ4c2xrTG5VYm9SWnNOcUw3MGZ0T3ZqS2MrNkNaVnBu?=
 =?utf-8?B?b1N5SWt5bWtIOTgyc2dYSGRubnB1SXRBM0N0UDNxbFVKWXlkU1RFRmtXK2p0?=
 =?utf-8?B?TGhoS3k3WWVJU044Ty9rSWNDdjIyekVMZW5yWDJQd2NjQmd6aDZ2RWh3ZDEr?=
 =?utf-8?B?SE5pc3pPS05DbS9GZzlSaklMNlg4RlpsOG5mbi9aUytPdlZuL2lwOUR4NFVV?=
 =?utf-8?B?MjlvSjg3cG9uSTRQaVdFSDFrUHplV1pSOUkyVVRndkVuR3NCS1NWaVZtWW04?=
 =?utf-8?B?YTlReDQxWG91VzZzdFN6OVUzcHVXTnhYQndybHZjeDZ6RFlRZWxOU0U2NGRr?=
 =?utf-8?B?UUZ4eVZYTnFpVE5XVTNyRzVidkVPcUc3RGNPUTZEdTdta2M1RXd6K2VWMXJD?=
 =?utf-8?B?MVdES2V4bTIzWnNNZ29UOW5TUlAwZWd1TjgzaVNYVDBSR3ptbG4yNlMyYzdM?=
 =?utf-8?B?aURRbERDVnozRWt1bnNYNGx1MTV6RU9TU1FTK2RjWGRtVnlTVXhkWGVjRVU4?=
 =?utf-8?B?eGkxR1VXbHA4L1RhalNQNzR6R1p0TEpHV3ZlMGlEa0xXTDBWTm5lUGJHR0lh?=
 =?utf-8?Q?lvkWdg1C/EC+nIa3bzaNn6g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3b2744-6950-464e-f861-08dc9f9b128b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:12:36.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rs0IUWaEpnI4RlUoPIAi0LRM5YiKVgWc815X8XYU/JeFyQjqnQo77u/rzeNeeCZceQHUIQLUV1SicQU8UdbaGVY0Zr8qpjq+ferpCzzePc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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

On Mon, Jul 08, 2024 at 09:21:01PM +0000, Matthew Brost wrote:
>On Mon, Jul 08, 2024 at 01:20:59PM -0700, Umesh Nerlige Ramappa wrote:
>> In order to make xe_file ref counted, move destruction of xe_file
>> members to a helper.
>>
>
>I don't see where xe_file_close is called in this patch but appears to
>called in .postclose later in the series. I'd move that change into this
>patch.

I don't follow this point. The series is not calling 
xe_file_close/.postclose, so not sure what change I need to move.

Thanks,
Umesh

>
>Also I think the VM should ref count the xref too to be uniform and it
>appears this series is not doing that either. With a VM ref counting
>xref, the 'xe_vm_close_and_put' is going to need to be in xe_file_close
>too.
>
>Matt
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 36 +++++++++++++++++++++-------------
>>  1 file changed, 22 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cfda7cb5df2c..babb697652d5 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -90,24 +90,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  	return 0;
>>  }
>>
>> -static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> +static void xe_file_destroy(struct xe_file *xef)
>>  {
>> -	struct xe_device *xe = to_xe_device(dev);
>> -	struct xe_file *xef = file->driver_priv;
>> +	struct xe_device *xe = xef->xe;
>>  	struct xe_vm *vm;
>> -	struct xe_exec_queue *q;
>>  	unsigned long idx;
>>
>> -	/*
>> -	 * No need for exec_queue.lock here as there is no contention for it
>> -	 * when FD is closing as IOCTLs presumably can't be modifying the
>> -	 * xarray. Taking exec_queue.lock here causes undue dependency on
>> -	 * vm->lock taken during xe_exec_queue_kill().
>> -	 */
>> -	xa_for_each(&xef->exec_queue.xa, idx, q) {
>> -		xe_exec_queue_kill(q);
>> -		xe_exec_queue_put(q);
>> -	}
>>  	xa_destroy(&xef->exec_queue.xa);
>>  	mutex_destroy(&xef->exec_queue.lock);
>>  	mutex_lock(&xef->vm.lock);
>> @@ -125,6 +113,26 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	kfree(xef);
>>  }
>>
>> +static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct xe_file *xef = file->driver_priv;
>> +	struct xe_exec_queue *q;
>> +	unsigned long idx;
>> +
>> +	/*
>> +	 * No need for exec_queue.lock here as there is no contention for it
>> +	 * when FD is closing as IOCTLs presumably can't be modifying the
>> +	 * xarray. Taking exec_queue.lock here causes undue dependency on
>> +	 * vm->lock taken during xe_exec_queue_kill().
>> +	 */
>> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
>> +		xe_exec_queue_kill(q);
>> +		xe_exec_queue_put(q);
>> +	}
>> +
>> +	xe_file_destroy(xef);
>> +}
>> +
>>  static const struct drm_ioctl_desc xe_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(XE_GEM_CREATE, xe_gem_create_ioctl, DRM_RENDER_ALLOW),
>> --
>> 2.38.1
>>
