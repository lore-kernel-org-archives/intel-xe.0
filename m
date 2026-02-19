Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A1C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 20:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5346510E749;
	Thu, 19 Feb 2026 20:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoYHCE8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A123910E749
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 20:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771533808; x=1803069808;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e+f8ha8iEi/DlKi8CMM7koFnDtchhINAfYdBF1jwJqc=;
 b=UoYHCE8zx941LKpdIaE0yFEgjHnlGX6025DuwXsen1Sszo5Pbo00lBm8
 dRKezol5l82IyifjsGRFpaaSms5rymvFXS1/rem9+sQ28SvhvhFaW+VEv
 DG7d4WqAR0rp1Fn+pCXuCNxIos0oek0SCL5Nr9cR+augtQpEgiOcCXU3X
 Z420w7g1SYBfKzyklAg5PV8XvXcJ58P0fvPCm13SxQEwAzXzMGwo2ljAe
 96yunGmjcKjbltgr6BsFHrFyIBOAKJlAYC1ty10p1TycfQaI3tAbLpQV0
 dfNa3JVOQBFyo16wSG/ybyfTuujT7SgslK1z0UbkXX68n58kOza+2r9y8 w==;
X-CSE-ConnectionGUID: dF9/YuN2Ss+eJqV+CvLclg==
X-CSE-MsgGUID: ONSzunxDRSafT8oOvjE4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83348357"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83348357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:43:28 -0800
X-CSE-ConnectionGUID: qgR02tXyRbeWZA4fCT8sGQ==
X-CSE-MsgGUID: +MyHbuUWTMS3ias9roNm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="237626457"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:43:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:43:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 12:43:28 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:43:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlvwTCFRoqRlFTJ/oqAjL0Z8rUP/pGBUClnxOWffcu2REreTsCAJt6C9yOMvDzwqQuEu0fJdWCTYqK6uwPFxRn07BiC1mM6fRSV9D8jvNXai+ld6fb5mhxFK9T67NVAShubEwVf3tLFErr9Taa4LO9B3VAt8FZO+2Cnbb5txJb/13hlA6QTiJoZiNnTBTFzIl1tdszXqtf2/ZCoJZl4HW9EsUGQBCdoHeJG/2Q04DL2lPcd8V/SbWe2Nfb9cuvhHPsoaB0zXNIIctzCkYdj6VrLPnVx4dv3rCWA56AI7BXlrDJK75zoZATiQiJvsbIBaQr9L6AICSGKxj2abK9NG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJeoJ3Dj3o7NcRN2gRP7tzfvdtQJL1dYG4szukDKuWU=;
 b=O4J+85vm34S2Z0S+vyA9p+4G3x9iUAfKJNFNCNhDrPZ+CcBmWGl1WHEIPzLrNR4my4pAePIBxplCB2/3iVerI8pLIDe92sfkqzxv1v4uEktqKYxw/PtuE+GXGWxJODtsxay+jixlDTTMCN15eJYTbJDR0dM5uwkJimYh/4BpfleR1RjEsUMLxYmoULprMCX3YyMYwM3JzQRVc4IOBeBh7jbbDmwCxJMlYQwN7HrFs0rvWd9Aykf5Kiv1GWVmOco8x7kVKmiH16ZTfCq90qnLNhkyNUwJBFIaxO9JUaC976Upvluv0dMBxO5X8rM26Mcq7PkyRjpzkg6+ehiGaf1hzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 20:43:22 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 20:43:22 +0000
Date: Thu, 19 Feb 2026 12:43:19 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_wit?= =?utf-8?Q?h?= [1/3] drm/xe/xe2hpg:
 Remove SRIOV VF check for Wa_18041344222
Message-ID: <aZd15y2Xx2tvwZF7@intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
 <177078945057.244838.94516784589253149@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177078945057.244838.94516784589253149@a3b018990fe9>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f2ce3b-3d80-470a-86d4-08de6ff7855f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0w4RVExNVMySFlsb0h1N1NteDA0dDlyOE5ScUdjN0VvSVU3d05iVVBVdDZr?=
 =?utf-8?B?SlhNbkZLamoxTFVVcXVTeU9QOEdPUkxrSWRyaFJBK3Z5cGlnb0EzUmRMb0Zs?=
 =?utf-8?B?NUc3SE5BRElPOHJFVzh4M1JNd3JQYlV3ZW0vb0NZc3FSV1FFVzZFU3dKQ01n?=
 =?utf-8?B?MW9pWldsZEY0VmFXN0Q5QlkwRHRjcmFTNk1WTmlTL3hIMkZWT2EzYUZabG40?=
 =?utf-8?B?emxtWGExWjcrNlRMankvUSs0OWNud3AwemczYXFKSytaRk5Pa3pycGRyUVQ2?=
 =?utf-8?B?b3BuakF0aXJkMHgrL3BLQ2hzeFJaYzNrTTY4UzJBY090ZDM5QTRBVjdGSHJM?=
 =?utf-8?B?dVY4QUVVN1dUNnhrRXZTQ0VpdGxQRVhNd3JyUFd5b3JFT0Q3bEkwM3ZoRER2?=
 =?utf-8?B?SytqYXFmU1RxV3dXTGRKNE8zVU1wdTIzMld6VS85ZUp5UC9xdlBReFpkNllt?=
 =?utf-8?B?ZGFuOXE2VkNmR3R6MzQ1WHN2L3JEdEZBUWJkZUU1Y1pSSW8zaEM4eGFRazUz?=
 =?utf-8?B?RmtQSmdnUndGd0RaKytGcEVtOW8zdStpbzdTM0JIT3R4Vk56ZWxzT21rNXE0?=
 =?utf-8?B?QkdxaGliSDBoRWRFY0lvMFhpd29vSnVhaERmMFVab2lxT2tmTllqSWptM21k?=
 =?utf-8?B?blFBRHNyd1dONXVKOXlVV0ZQbmpIKytObUxMQUdYOWpoRXQ5bmVNUFVNVFN3?=
 =?utf-8?B?ZnpsZWplR2pWK0l0QU51M3RXYitVMjVsejV5cXZCaHZ1SVJwVkJpUC9XQkpo?=
 =?utf-8?B?Y2ZMa0N5VHVuZGtOTVIvcVptYUZuZnROOE1SMCtiK2NDYjhBQjU3L1FVT2k2?=
 =?utf-8?B?YVhKdzFaWksxckl4RE1HcjFlYW43QnBoai9RQ0p6Q010LzVXeUU5amUzbkdB?=
 =?utf-8?B?ZU9rNjNndnhTMEEwdE1YK0dCaEcrNktBRUFRSGp0ZjI5ZHlaY0lUY1VCbVpU?=
 =?utf-8?B?VzR0VU9YSklhMlVRbHFLV3V0NjlKMUVUSEtpbjQvNU1hV2JCMERrWHplTXpo?=
 =?utf-8?B?YWZia3hRZkd4aVhvbkVzZHhOZGVWNXNJU1l2VHY4c3JJb1VSVzV5ZmtUUnFx?=
 =?utf-8?B?dHVkRWt5NzFPNWFTbnUyc1NITXM3aWVzMDB4RmdCSnc2OWNzUVJqSkxaUHkx?=
 =?utf-8?B?cHU4emQ3bkI4NklsYU83OFc1akliSjVzYWpFRmxKZzVvTnJwa0UrVUNWMHdp?=
 =?utf-8?B?ZFB5Z2xhKzViNk5RLzNucEI2SUszQVV0LzVRckkrOUsrWWhZYmpITklEZTZY?=
 =?utf-8?B?c0hQdU5BV1lvSGlXK1JBWXFmK20xbUU0bSthRDhpbU5UVHdzcENFd1p0S0JY?=
 =?utf-8?B?YWJ1L3R1a3lVaW1YSy95ZllkTXFMbmVJUkd4MjY3dFVlSEM1L3FnVitBSXpq?=
 =?utf-8?B?bE9ma2VlYTI3b0p2a2IvK0NhMTNzV29xNnAxazVGM2NxQ2tqdTlzQ0Q0MWdB?=
 =?utf-8?B?Y0lLeEVyOUdtNWxsTDViTzZYMzZTOVlicGZFVWRXY3hZVi9oTkVKcGxteWV4?=
 =?utf-8?B?U2JxbSt3RDluUHdPSXZJK0hzSk5KcGJtZE9lTDIyWHA0U1BwcEpUaHhjZFQy?=
 =?utf-8?B?aUJGOFF4NjNFM3hZNzYrbkZwRG5iZU4rY0txQU5uOUMxTDhraW1MU0owSE1q?=
 =?utf-8?B?WWVXd3VmNVIvcUZ0akNTMVpiOENhT1J1VWJmRnpDZ0VaRytrRUt4MC92TTBm?=
 =?utf-8?B?bG15WW9wOWdvdGk3eithTFErSWxmZXFUWE9SYmJmcXNYdkpUZFJHYllLMkJR?=
 =?utf-8?B?ZVpMZ09mNkhJRkU2b29SMGZzKzhOOWVZa0xKeStxOFJpSnFGeTByWVRUMnVs?=
 =?utf-8?B?cU1xM3JHSkFpelcxOVowWWkybXBiWXYrZjJPNG9obHBYUGFMTS9hOEJmeVhB?=
 =?utf-8?B?MGlscmhrT2MraUJMU0NjWjZVZUtKb1J6R0hmaGFEL1lUL3dLN3pwMDFNSWZI?=
 =?utf-8?B?RWxFUG1wOWorY3NXVjJKM09KOFlrRnJRd1FlRXJvWllnUE8ySUE3MXVqNHhj?=
 =?utf-8?B?SWo4cUZqRDNTUmkrYlZUeEs0L0g3Q2xJa0l3NHFDN1dwVE1HdW85bjgyTkxk?=
 =?utf-8?Q?YXlEaV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dPaXRVVit0M09iY3JFRzAyUGJGU3ZtTXExaDFlNlVyTXRRN3lDYnZmZkdQ?=
 =?utf-8?B?bS9qSnl1M0VZdkdmSk1YTFR5YUtGOGdmY2tEcUIxbk5CQVcvYzJLUUQyUWZi?=
 =?utf-8?B?R0FPUkFCQmxJb0hWd3lyTzhQby9yYnBtU0dKR0FVUEl4enJMUEUwUWdpeEhs?=
 =?utf-8?B?TThkdmNnK0dEd3Y5YTBTT3owWlhNUVlMWUlSK1pMWGdpKzVwWFdDQjgxV0x0?=
 =?utf-8?B?WjRlWGF5V2JPOW4yUzFoS1gvL3BFeFdseWJvS2IzaXV2TkpWWTdjM0pHdTFv?=
 =?utf-8?B?eDBTZnM0cGp5YmF3TlQ0Vm5STGxZL0x6bldPSlVndzMxbE8wanlqcEFYcWly?=
 =?utf-8?B?L2tLVHNEVTNJWUpleHkyZDNvVmFVTm5DTnMzNGFrazFDSUFwZnVMNndrbnRE?=
 =?utf-8?B?OGRDYnF5WG5qRkR6TWI3d0lUZnpKeU1yN3RQYVNCN1BQMW1IYktra2QwZmli?=
 =?utf-8?B?OU9xSkFBRk9oQXZtM3gzVnVRb2tUVlM2Zzkrakx0N2lsdVVEaHdBTW5aUkZq?=
 =?utf-8?B?NkZIMkZsYWQwa2NMZkhsR25sSnFzamJkVjJuVFVvMm95YlhaSDNpQytaNkFQ?=
 =?utf-8?B?UmhzTkowbHQycEZrQitaOGQzTkQrdE94NFA0OEtDOEJrWVFCbWQ5K0hzU2JI?=
 =?utf-8?B?K2xiNStJUFF2QU9kRHpQZFhjMjhjU2xZWk1pYXczc0VTeExFOTNXZWhYTlVI?=
 =?utf-8?B?dnFiVys3bXZJbTRqWVhlWHJsUFhORXF4QSs1OUxFRjlLeHdCdWM0M1MxZzJG?=
 =?utf-8?B?L0dzdUVVNXlWaTluMjRUQVY0Ni9nRW5sM1o4MzcyVFlKY3hWY3lTWi9pbnhR?=
 =?utf-8?B?NXJIWHk0bWJRNUJ5K1g3UWE2VGhpL1hhR2pWbEEvMjdFQndJSms4NmZCMUpp?=
 =?utf-8?B?WnN4b0VYU0FKalZQYzZzTXZTK0kyeFFqWDkvQjJNZEptTmgyOUFocnBOLy9t?=
 =?utf-8?B?Rks0S1JjcTdlRXU2d0JtZmtQcVN6SlpxakRhaUNHTjhaK3hzYnV3c0g2MlRh?=
 =?utf-8?B?UVdQb3k1QW9PVlAwcE0vWWVOTEYrWHg5ZWhNdzZZZ3RSZWRJTVJuTExNL1J1?=
 =?utf-8?B?d3IxUTZYT25lNjArcE1rY0NjNzJkSlFXVXM1TDFFZHZkS1NtV0Y5RmJCTTk5?=
 =?utf-8?B?VklJenhDWXY4clFnbmZ4SUgvRUFtemYxVFlybmw3ZGoycnVsbk1XNFd2Mjhn?=
 =?utf-8?B?b0FsTWcyWVVaYklyN1I5YW9qbmoxS1VMK0tnWkpGdjlYV0lJMEpOZE80QXEw?=
 =?utf-8?B?bm9TSnZyT3lNQVp3UERMeGh4citCQ3FONDlNM1FRMktibW5WQTYwd0s2L21n?=
 =?utf-8?B?YTI2cnZGcWlDMHNCOC9haC82NjYrOTdDQlJQRkZNR0lyNWg4TGgwL05VVUQx?=
 =?utf-8?B?RGFNZUJwWkgyTUcwMTZDandLQ1B0cWFtTi81YTMzS3l0MHloek9ZSWhoaEZk?=
 =?utf-8?B?S3dzY0UvRVI3YlhBKytKaXpha0tTQ2h5MjJ6enFBK25BU3owekdIK1hBQnpo?=
 =?utf-8?B?ZVBQVFQxaUorMzZjNTc3T0JGRSt4T1k1ekJyK1NKdjhsL3dLTFNvbExFZktL?=
 =?utf-8?B?ZHJGQjdMWC9CYVV5VnhJMFlMWEhmUXZWYmtJcVhHY3NPeWo1WTFYQXc3bWRz?=
 =?utf-8?B?ckpBWlBtRUIwbGtlbFRqM3pYMmh5MkkrV1NwU0xhRnZBdGx2OE1sNXNId0Rn?=
 =?utf-8?B?QWxKcWZnaHBPL1NSN3dyeS9rdzUrY0lFbERTTW81dlZZa0cybUNZeWtFMjQr?=
 =?utf-8?B?OU5wZU1YdW9tMUtITG04MWlzRlpVcVpJL0wwZzlQdHZkRkt0a2VVL2szZGVr?=
 =?utf-8?B?T0F4Rmk3OG0rR0RWdU1DOGgxYzM3TkYrWFJrYjY1Z3RCNWdZczEyMTh5S2I3?=
 =?utf-8?B?SVBraUhYQzdwUHg0bG1UU1VISFpNdm05aVJWQnN2OXRqdVdLaHJJdS9YQnpL?=
 =?utf-8?B?TllCSW9YUG8yOS9WcVZheGowWWdnSlg4R3R0dHNLR3lqamxXZUdRaDl3Uk84?=
 =?utf-8?B?VnplVWJSSU9MdzFWY21NM2hvZUgxcHZMR3FrUWx0T2hRRU5jREl0UnluMWRH?=
 =?utf-8?B?S2RSVWFSelY1R24vd2pweHJsWDBKOGFzaHhXOThWWTBFcEZGNytRU1l6Zmsz?=
 =?utf-8?B?dWNQUTFCbzVHNzhpRzhFdnJmMTRlMGZYVkhzZm0rT2lHTVExVjN0dHVDSzRa?=
 =?utf-8?B?NWlVbVQyY3NBOVlQUHF5eUdOaEsvb2xoSW5oRGlidlIza29Ic2FwWEpoMEFY?=
 =?utf-8?B?Nzl6VmJ4ckFYZU5DeGU4UVRuMG01TVlienRmdWFQR0ROWC83eGpwblczelpK?=
 =?utf-8?B?VUQzalhnSWdpbWdsMjJXK29KUDZjK29oa2VOVTFDSURjV0IvSFNuTXlLcWpX?=
 =?utf-8?Q?Dcd1Igh7eHaHzDxk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f2ce3b-3d80-470a-86d4-08de6ff7855f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:43:22.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7T6vlbpUCYI/zHeogA/uxqzEvDsPCL1wSEc9O0VOzQLoam/h5pQJmRAlVrTLlOseNKP0o1Ty4BuQtqgt4WyivdHw5QlWtLd2NyBxbJ08Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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

On Wed, Feb 11, 2026 at 05:57:30AM +0000, Patchwork wrote:
> Patch Details
> 
> Series:  series starting with [1/3] drm/xe/xe2hpg: Remove SRIOV VF check for
>          Wa_18041344222
> URL:     https://patchwork.freedesktop.org/series/161462/
> State:   failure
> Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161462v1/index.html
> 
> CI Bug Log - changes from xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0_FULL
> -> xe-pw-161462v1_FULL
> 
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-161462v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161462v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in
> xe-pw-161462v1_FULL:
> 
> IGT changes
> 
> Possible regressions
> 
>   • igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>       □ shard-bmg: PASS -> ABORT

I have verified that the above test failure is unrelated to this patch
series.

-Harish.
> 
> Known issues
> 
> Here are the changes found in xe-pw-161462v1_FULL that come from known issues:
> 
> IGT changes
> 
> Issues hit
> 
>   • igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>   • igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +2 other tests skip
>   • igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>   • igt@kms_big_fb@yf-tiled-addfb:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
>   • igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>   • igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +12 other
>         tests skip
>   • igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>   • igt@kms_chamelium_color@degamma:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>   • igt@kms_chamelium_hpd@vga-hpd:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
>   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-3:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6969) +1 other test skip
>   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006)
>   • igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
> 
>       □ shard-bmg: NOTRUN -> FAIL (Intel XE#3304) +2 other tests fail
>   • igt@kms_content_protection@suspend-resume:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6705)
>   • igt@kms_content_protection@uevent-hdcp14:
> 
>       □ shard-bmg: NOTRUN -> FAIL (Intel XE#6707) +1 other test fail
>   • igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>   • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#2291) +6 other tests skip
>   • igt@kms_dsc@dsc-with-output-formats:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>   • igt@kms_fbcon_fbt@fbc-suspend:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4156)
>   • igt@kms_fbcon_fbt@psr:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#776)
>   • igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#2316) +4 other tests skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7178) +3 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +6 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7061)
>   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +17 other tests skip
>   • igt@kms_hdr@static-swap:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#1503)
>   • igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4090)
>   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130) +1 other test
>         skip
>   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130 / Intel XE#
>         7131)
>   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7131)
>   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7131)
>   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7130) +8 other tests skip
>   • igt@kms_plane_multiple@2x-tiling-none:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#4596)
>   • igt@kms_plane_multiple@2x-tiling-y:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#5021)
>   • igt@kms_pm_backlight@bad-brightness:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>   • igt@kms_pm_dc@dc6-psr:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>   • igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2 other
>         tests skip
>   • igt@kms_psr@fbc-psr2-cursor-plane-move:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#
>         2850) +5 other tests skip
>   • igt@kms_setmode@clone-exclusive-crtc:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#1435) +1 other test skip
>   • igt@kms_sharpness_filter@filter-scaler-downscale:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>   • igt@kms_vrr@negative-basic:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#1499)
>   • igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>       □ shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>   • igt@xe_eudebug@basic-vms:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>   • igt@xe_eudebug_online@pagefault-one-of-many:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6665)
>   • igt@xe_eudebug_online@resume-one:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +1 other test
>         skip
>   • igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       □ shard-bmg: PASS -> INCOMPLETE (Intel XE#6321)
>   • igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>   • igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +4 other tests skip
>   • igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +14 other tests skip
>   • igt@xe_exec_system_allocator@once-large-mmap-huge:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +9 other tests skip
>   • igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +4 other tests skip
>   • igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6281)
>   • igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2229)
>   • igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>   • igt@xe_pm@s4-d3cold-basic-exec:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>   • igt@xe_pmu@engine-activity-accuracy-90:
> 
>       □ shard-lnl: PASS -> FAIL (Intel XE#7072) +2 other tests fail
>   • igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>   • igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
> 
> Possible fixes
> 
>   • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       □ shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>   • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       □ shard-bmg: SKIP (Intel XE#2291) -> PASS +3 other tests pass
>   • igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       □ shard-bmg: DMESG-FAIL (Intel XE#1727) -> PASS
>   • igt@kms_feature_discovery@display-2x:
> 
>       □ shard-bmg: SKIP (Intel XE#2373) -> PASS
>   • igt@kms_flip@2x-nonexisting-fb:
> 
>       □ shard-bmg: SKIP (Intel XE#2316) -> PASS +10 other tests pass
>   • igt@kms_hdr@invalid-hdr:
> 
>       □ shard-bmg: SKIP (Intel XE#1503) -> PASS
>   • igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       □ shard-bmg: SKIP (Intel XE#7086) -> PASS +1 other test pass
>   • igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       □ shard-lnl: FAIL (Intel XE#6361) -> PASS +2 other tests pass
>   • igt@xe_evict@evict-mixed-many-threads-small:
> 
>       □ shard-bmg: INCOMPLETE (Intel XE#6321) -> PASS
>   • igt@xe_module_load@load:
> 
>       □ shard-bmg: (PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS) (Intel XE#2457) -> (PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
> 
> Warnings
> 
>   • igt@kms_content_protection@lic-type-0-hdcp14:
> 
>       □ shard-bmg: SKIP (Intel XE#7194) -> FAIL (Intel XE#3304)
>   • igt@kms_content_protection@srm:
> 
>       □ shard-bmg: FAIL (Intel XE#1178 / Intel XE#3304) -> SKIP (Intel XE#2341)
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>       □ shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +12 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       □ shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +3 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +5 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +9 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +10 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       □ shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +14 other tests
>         skip
>   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       □ shard-bmg: SKIP (Intel XE#2426) -> SKIP (Intel XE#2509)
>   • igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       □ shard-bmg: ABORT (Intel XE#5466) -> ABORT (Intel XE#5466 / Intel XE#
>         6652)
> 
> Build changes
> 
>   • Linux: xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0 -> xe-pw-161462v1
> 
> IGT_8746: 8746
> xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0:
> 8ef710cfb81579fbf4107d77134e6e8d2c864ef0
> xe-pw-161462v1: 161462v1
> 
