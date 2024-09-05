Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B1CD4F54
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 05:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503810E6BD;
	Thu,  5 Sep 2024 05:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1Zwcr/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5410E6BD
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725515802; x=1757051802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FKuXPhSIL8HA2XGyCQS5Z9NFNbs2/c5DFPo8H4l9tJ4=;
 b=i1Zwcr/IeSKwPAUHjvESHomkXEbkUFdTf5PKdHBHOpyhqirUYhGxPPiK
 EnIb4H1Lq9ESJu8jFOKpTQfMw1auDvH3CTflJ4A3IwBOixZiYzxfL1ez7
 P6xnuZfQdpBmC+0deLs7bjLcv3mHNU+4dVZBEQIoEcq6Eie4BhHiaeqR9
 FJVlWiQUsNrFvna//Feo/K2sZ32hB01ChPgXeB4RfqW9WXX2Zvv9nANKU
 VM0sHaelKfiydPcJKfnkxj7nbxymsijxsgn01Yux7nc/Y71oXFZ2v2gXl
 v0GlvaTuIipM9YKqzAWyTUWuFJnvmz3KOMCJKnJBAs456x11NA3vZkwVZ Q==;
X-CSE-ConnectionGUID: kXdWPKJRTD+PKCdtQG2mSA==
X-CSE-MsgGUID: lMRtxOIHT3e7Zrf9W1zRpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27960988"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="27960988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:56:21 -0700
X-CSE-ConnectionGUID: Ckp/Iww3SVOx2FWE+T7kzA==
X-CSE-MsgGUID: 88BBtyyuS1W+lWuDgKXBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="69649359"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 22:56:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 22:56:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 22:56:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 22:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbw3gwj/LM90SdBXzHwvka4LVIEykZ8JPkNGfAqe+2uGDRIR/wn9QE3mJok9cWUS8sR/0v4THEr0EzkckvGbr5VVMzeePSFdvhoXy9npaV5OjdrTs2j3/zCwe6GpyuRSe/hVgX2vOXGeMNhXlkZZG8sOHe8RkkpGrpcacBWAyVJtvFJAtvhJxeMLIs4I0ZtbKFGSbuC25g3BbPfNvqCtUmAArzBvlxnvT9EqHiMiaxEJhDldaA7PTM/QIbyJn8CnLpk9Nybk3vVUpVzn2rgEm24diFKUN/lQVULvZuDnsKQlqT/q489GS0mDZPeO7wLdXh/7PqMW0ImqToyCWtS5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tixe9U3Qa7tkvrto4Cc3QvKGOKmcyLJbhBP8/ljLZA=;
 b=hLYLSSuh7SrUWLgMk9r9UDLIGDGhS9aVk4Sc06LhBEKMAhY9vj5salAMRErToBdFkZS+wnBS9pTZgxPQGjF8qqqNijsMBbdQ5ck96Kx1ZiXwWdEcO6qZUro7wHAxQU/y6+FoBWpZn2miidMRFXt3wNPgyVyADf+KUykWtrerFpfoWSCK903R8PdWjbmODgDEfZVMnLk2gr4+h0XAQzIY/+rItmjxbe2OffaPuZ97Mpjb5Tb7hzmGZY3vfZNfaZ+3iZ0C4PfM0j00voJQaxRdEXPjRSHMY/lIPjVWOgcRsxyqmXBxaO98ZDY9ZmsEHpNnfiBZteZRjX+yGM71OTbILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 05:56:17 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 05:56:17 +0000
Message-ID: <d0950492-ae98-4e6d-8c49-471ba152e77f@intel.com>
Date: Thu, 5 Sep 2024 11:26:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
 <4868d36fbfa8c38ea2d490bca82cf6370b8d65dd.1725443121.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <4868d36fbfa8c38ea2d490bca82cf6370b8d65dd.1725443121.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fca530-0858-4ec2-17b7-08dccd6f755a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG12ck9Rc0VMM0RSV2ZTR0xYWE1tSE5PbkVlT3o0SXpidjA5MForcEtza3hU?=
 =?utf-8?B?WkRjUzNJTmwwRHgrUUVyZ1hRai9RYnhyQmtTbVFUNzNtdkluQUJDbFBjcHp5?=
 =?utf-8?B?eStraE1xbkFuZklHMGRQNDFjZjhMUXJpbmVUMTBaQk5JdEZrWm5IeFFZczBI?=
 =?utf-8?B?K2x0UGJhcGlkUnZmRFhlSlVFdVZ5dUtWaUhROUlZNXFxQzdUNzF5cEIyOSty?=
 =?utf-8?B?eFlFOWpJQkMwRTJPVEdpSllCTmQ2d3RWaiswRHd0V3JLUUo3bWd5SUJmbDBn?=
 =?utf-8?B?aUZYUTJ6Z3ZUQmZNUEJkTWRVYldETDhxMkp0TXc1cHF4dlNPVDVzNHdieWND?=
 =?utf-8?B?Nnp6TXVkYXdZZzdGdXJSQlYzTVgyZGh3a1J6UG92d2p5aW5rK05UMm9jUUV6?=
 =?utf-8?B?K3VxcTA3b2twM2hpVFhhQVVzVnBzdm9GYUJZNVR4VzhXcng3NG8wQ2UrTmx3?=
 =?utf-8?B?S3pGZXNXeWhZV0hzZDhMRWRHbzJLK09XaDJuZjBVbzIweXdOZk13QVpiR3h0?=
 =?utf-8?B?WTZrWEZyeUs5cXZ2NkpTWWxDK0Z6S1Y2WTZ1aUVjWitqdVNvYWI5UDVSVEJD?=
 =?utf-8?B?VGozY3JQQ3ZtUjUzM0RmSllnZ0ZkbnNFTXJFRDFhS2NidzF4aVdCMzhPZjJh?=
 =?utf-8?B?R0VDV1hzZWVQTHNoNjhMUHJ5SkVxaW93R1RGZjMyNmMxckdRZVVhRXc1TUYr?=
 =?utf-8?B?eXovRUxRVlVvVlJXQWxzSXIxTlc3QUN6VjJGTjR4bmx4bktHMEp1YnI3VXk2?=
 =?utf-8?B?a21GM1BHK2k2Z3FUNzFQK2VFbVpXZjg5dTcrL2pyeVA2MDhsaUlNZ2c4enFC?=
 =?utf-8?B?a3dMNm54SHBRWHMxUG5xNW9CcU1wTUpxeXIwY0kyWm5wUVY1ekJOL1JuZVRS?=
 =?utf-8?B?ZjdyVzc4d1dwcVcvRDNNSWk3MFR1ZlkwQXM3QWwxNEFSSlpuTXovVHNnbmxu?=
 =?utf-8?B?MnhFNktpa0RSL09jbzRaeVZFOEtvNmlUMmkzd0Q3NWpBY2doOGs4cCtSYzlj?=
 =?utf-8?B?QXdqK2h3OFRGMjFzSEZObGdwcEM0QzVjUTBrL2l1MTNpN0dhaUowSHdxcm5K?=
 =?utf-8?B?ZmRSeXcvVVhVUVFPYUpodnM3N0Z2eGZRNXZCZDBaNG96WTFpUittREwyYUlL?=
 =?utf-8?B?cTd3bUxkbEl3QzFUYUJwaVdUYklraGI3M0I1VElUcU91aVBnUlNDL0pvSTNN?=
 =?utf-8?B?RTFXUXBFeXB0a3NkWlFuM2RjZXFlbDJJZ0RYNDJRWVZxN25yT2RWNFF5dmJH?=
 =?utf-8?B?bWFvUkNPMU1LbUs0K0UyTUE4bjMrYXFaOFRNN050eVJXRmgxUmRaKzFwR0dn?=
 =?utf-8?B?Q0owaW15Qi9zWGZXS0ZJSm9wbURQMjl5SnhtbVZxZ3E2MFlFYjQ1SW5RbFF5?=
 =?utf-8?B?Rkp1OFVlaHVNY2J1eWY1NU43c3pBRzBKZ3BSMWtpOC9jbFYvU1pyMHpHYXpn?=
 =?utf-8?B?TUVHbDQ5UlNHUXp2VlMwMVBIRi9WMVBhQkNzTGlHRlY3Z204R3FYeTdRQWg1?=
 =?utf-8?B?YzR5QzNuUWdtQnJISStIcUtza0ZjL0N2dkNreVNoRWNCaXpxLyt1RThkNEpx?=
 =?utf-8?B?VHBSRFMxNWtOS080eWVPTkxjT05xaTRKT1ZCSFZXelYzd3d6QkVrM1dIL3hS?=
 =?utf-8?B?WkFWMHF5Vks4L0RnNzY5MzM4S3IyZkRlVmdBWXprWkZjVFdVcElCYnRuczFh?=
 =?utf-8?B?LzNMYU1oeVRRQjlsTUV0TnU0Y0p5Y2NzN2lyWm9oNkVGczFVa2JETTFUajYz?=
 =?utf-8?B?UkxjaFdRL3RUajI3dTZ3U01zSnJCazJwQUVPc29xNlc0cnJEYWZ0c1hMNGZJ?=
 =?utf-8?B?THRhMmRQZjllZEkwYWZxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pDR0ZDMUVJQTlURHh0MTZmeFkzWFljd0tuVFJuTUF3WjRJMlVHb2VpWGZI?=
 =?utf-8?B?ZTJZSFZheG5ldTV1a0xQQXg0NDZiUlFvR0pYekl2TTBCdlhSVmtKbzNJaGNw?=
 =?utf-8?B?M3ZmMjcrVHVUWkhXZ0NxbDN2Z0ZUdlVva2ZvK3FlaFdIbHJoT2F6Q2lZOTIw?=
 =?utf-8?B?S2dXbVJjczg1TGJVOVZxVERiTnZ2bkJTdTlVOHdnOWFhOHNHRjhhNktnZUJq?=
 =?utf-8?B?b2RPUnRPRVlnUGpEMTZ1bXl6Y21pLytSUGpENCtNMlpJWTR2T2lwOS9ZWDVH?=
 =?utf-8?B?YmtYdzI2eW9QMmI5ZkVTUDFWWTllemJpTzNzTDdnSE41OEZSK3EyVTZYY09y?=
 =?utf-8?B?NVpHcTA2Y1NrSVVGb0RoR0d0azUwZm1GbUNOTjc1MzZpK2UwSEQrSXlSbmlh?=
 =?utf-8?B?bGt1eENwTVljV1k2VHdUNDhnRjFBSVVxd0ZOSCs3ZTRZOFBaS3dIcjRBYnhj?=
 =?utf-8?B?a2MrdXRHWW9zS0l2eUQ4ZHBsTlQ4WGI4ZnhxQ2IrZUYybnNUeURSalNCVFJQ?=
 =?utf-8?B?SlJuaE9tOWlYVDljZWgvbkVqaFdIYlRNOVMyNjBXa2gxQTJTNFZDcE9MbVB1?=
 =?utf-8?B?bkNoaHJIUmNucG5lVllWaDc1K0VyYjkxU1BmWklXR2VnRjFhazBPMUNGaDdU?=
 =?utf-8?B?R0hyK1VISHdKaFgvYXkwS0dDVitBV3MxNXNmVU5TVjEwQVZLUGZ4Zzh3VVdU?=
 =?utf-8?B?cGxQeExEaFkwT3NZRlQ4VjIrd1RZa1hKRGR4UXE0c0Vha3dRUm40b1pNcU9S?=
 =?utf-8?B?enozK3VuME9WUThsdUZId1RsWVBZM0pjR3lCTEpURkRBbWtsRFAvbzhBRHpM?=
 =?utf-8?B?SkhrUjVTSEZzUEVrRWxwcWJ4SmtWcWtJMDA1VWxEdjZZUnNDR25kaHJFN3dR?=
 =?utf-8?B?VEcrREV2d1Q3MDJkb1YzTjNLczgwVTJTazYwZE1aL3A1Qjc3TzV5WnFkcS9v?=
 =?utf-8?B?UjBSdU1QK0tHRmpCUWxTRFU3T2tXc3VJSDZEc1A1Q1luY3N3OGlORmF0QW55?=
 =?utf-8?B?WXpUMVJuenhTODRLZTg0eGZ1UDk4WmIwbitHbXFmREZJTXM4WkhDcWEzL1VB?=
 =?utf-8?B?Zm90eTFDSXk3RUx6V1BYY3V4SmZ3VmZSdFhIU0FPTnk4K0tSanB4bWM1K1ln?=
 =?utf-8?B?aVozTXE1Rm96K3AzLzM4OG52SWsxOW9LS2Q2Z1JXMlFIc1hBTEN2N0oyU0Zz?=
 =?utf-8?B?OVorWTJtU3JTWnZJSk5mY3VyY21EQmZkV3BXdDNYY1NGdGZHMDhQUm1JTGJN?=
 =?utf-8?B?RXdPb25sZXZqTFMyZWh4czJDd2JPSHVSTGcxdmtxMVlkV0doOUZ6cFJOSG1a?=
 =?utf-8?B?eGQyYTVmQ2xrNUw5WFR2SDc1bmt2RXhNUGlvN1NaeU8wOUJYNjlCUlpRd0V5?=
 =?utf-8?B?YU14cEhKdFFqMDN1N2k4YmZDNGY1eUNacUZZek10Q2ZwdThqMUFBYkNrWGZt?=
 =?utf-8?B?NWd1dU5ZUDlubGF0RUY0SzduT09xVlFNc3lXWGVEeVZrR2N4aTFpWFk4SS9V?=
 =?utf-8?B?QlVVM2ZtdmhnZ0NtR2RKWS9LOFhYNmpjYWNQVlNPVWxBbUlhKzVoaUtNVUt2?=
 =?utf-8?B?TVYzQ0pWdTViUlZROWZ0WWNMT2V1R283ekFSR2xLSVFqMXRSZ3p6eVFvdkly?=
 =?utf-8?B?NzZwQjFuT2t2dVB5M0hweEhBc1VxdmRjejFqNmNubElINDdRKzFqdHk0a3Ur?=
 =?utf-8?B?dkNnekJpc2tEd1dNR0IwWFIxVnc4dnhWRVFkbzJPR3U2SytnWVJEdzF1cjkr?=
 =?utf-8?B?eDNVTkFkY01zblhDMjRzL3BtQk5ZaHRsVVFTWWQ1NU1SZ1BDMkhFcDRvNHZm?=
 =?utf-8?B?eWJFVWNEYmcvYXJKaGFtWHQrTk1NeUJEdnV0SlZGamtQNXBDN0tQTGZaaC9I?=
 =?utf-8?B?dkFON3NQaUI0TTJzZXZWbzE5bDE5cmI5V21kZDluWnVlanp4cmVGcWRPQ0VS?=
 =?utf-8?B?Y3lObHVDWmtVUnhvMEcvZEN1QnlEb01hbzF4cGhLWnRwd2FuMmZna2RkcDNK?=
 =?utf-8?B?M3J0Tnp4UEJlZktkQnN6VEFuOFhnSHBhM3YzWUkvTmlLT1VobWNWbzhBVjZj?=
 =?utf-8?B?eUVFMXRsMURPS2xUZ1RnbXdlUFo5UnZaNGIzOVB1SVhSNmdGTTdYeGxsZ2U5?=
 =?utf-8?B?TjNsUlJBdXI2RGlJZEdqS1cwbHpyYnIwMWM3SEhVTkhBR1gzbysxSmNsWENH?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fca530-0858-4ec2-17b7-08dccd6f755a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 05:56:17.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHhUNt+G9ES2C9ljoU4kryTcg7U7ho/7AN43GmNznv9p0Ud6xgT0dp8xPE1Q5iOlbO7vR8WIfTYier/4T4pchY9XDMcD4xyGksg69Oarefk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
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


On 04-09-2024 15:16, Jani Nikula wrote:
> Avoid including PCI IDs for one platform to the PCI IDs of another. It's
> more clear to deal with them completely separately at the PCI ID macro
> level.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c   | 1 +
>   include/drm/intel/xe_pciids.h | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c05ca61787be..b1cf21d77def 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -387,6 +387,7 @@ static const struct pci_device_id pciidlist[] = {
>   	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>   	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>   	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
> +	XE_RPLU_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>   	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>   	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>   	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 41617c5ac6ab..334ab02ed6ca 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -122,7 +122,6 @@
>   
>   /* RPL-P */
>   #define XE_RPLP_IDS(MACRO__, ...)		\
> -	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
>   	MACRO__(0xA720, ## __VA_ARGS__),	\
>   	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>   	MACRO__(0xA7A8, ## __VA_ARGS__),	\
