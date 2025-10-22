Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F653CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3A510E14F;
	Wed, 22 Oct 2025 16:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2PcmQPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0010E14F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761150923; x=1792686923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aTWmtbz1EnISYrsFlh7uJLlq90ZfFIDqIiFEO4FqlW0=;
 b=A2PcmQPhLyELOzsDL4xw+06XmTZWzgaTIwdXfxLZNBXCKeO9wx9TJECm
 K4yzinoqN0b9S++z8VAia8MjT/CK1TVbOFT2zYm49b17KlAepavdAVgcC
 7hdGFmTu3hNWaCjPbOrqS/H6gKaRcQyCyqwEy/yPUgsZyAgRb9aeiPx4t
 Ds9ql6CbMLuLZtc3AxVP2ficLkp8vRhDC8//6lDSpMuxNJKCsS9vzKEwi
 b9wgOY4S6f3JB+uF5fHnXZaKRf8O+0vbK+bVguow7TeXvc2BmSC3LRNV+
 mGs6Uey/yRl0eGCcapIZk9/JhfzHWNDuQW5heYi6U2VhljaBagAvjc+JT A==;
X-CSE-ConnectionGUID: RxO/fsVpT0OpB+q9HRW4jQ==
X-CSE-MsgGUID: 0BM0tAXjTySbJjiQqeAuog==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67171642"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="67171642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:35:23 -0700
X-CSE-ConnectionGUID: wYUGwQ82S8ikNTuMjjVOVA==
X-CSE-MsgGUID: qiyhRqSFQYmw9l26bpNJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188323054"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:35:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 09:35:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 09:35:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 09:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCUcvk0vfI/9NQ+XuUkIrTa+xuz8mh2I4j1xI7dS1t6y7tCRI8jVm1zr2DVcNFQRGhjHk/9FF7NQD117zw6a2+TBzQlqCdex9Row/wOkNbQN8DJtdZkpZclhTMpXaZvnCUV5vxOBmJVh4aQd/FpG5pjeXt5GhOcYW5fTqy1TYGGgudUA/WZNCA03MEI2V14rKzyY5RQmYGOk6C6yKyqagnXN8jegneqbXmyjZO18pjhjWlQI5oBYDRAe0fHUitOxGDR2lv1qO+UlzRMDUdQS5T/XQTy2jVJ273TpYOPPpCM9+2W/QEJve00OX5o3YQ8+44yBb4Z1Meru04+EIBh+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQWarKCU6nM6XZHk06fBERZutBw9TxIN9qs6edRf31M=;
 b=P6tcLhgYT8isrrWLbc9jwH0tNn4ZeFfkNve61dCA2iIvs0w3G+FFetY7kcXtlN3ksuBaMOtkOIsEjl9u/lJi18NlmHIdqQAaNKWBe+JJ1F09r4QjVA28cvC6KOUQSKmX85heElAaonVOnDc/l5sIW7ZiiE0/ruYqjUv+zfsIT1iC0pdUeTsVptRH3wUr22zEDfl2sR09OO6ZGaotvglvwsipU9UkleaeSYH69uqv0giD3eP9LW5D8TiN2/f1DlMwSIkbJvPn3LZS9gDVzLe3cSYqrbRvjXt4zWuXfyTLLNqiX+OtC8cBGl0QX3aJHMsqpNAy1c2oF9TgBpSrtAd4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 16:35:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 16:35:20 +0000
Date: Wed, 22 Oct 2025 09:35:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Introduce RESFIX start marker support
Message-ID: <aPkHxSoiTXd5/Evu@lstrano-desk.jf.intel.com>
References: <20251022123822.3747-4-satyanarayana.k.v.p@intel.com>
 <20251022123822.3747-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022123822.3747-5-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:303:dc::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a39bb7-8884-4ab3-7e59-08de1188fd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3lzcWViUXhMZjg1Yml4MGNJZ015N3dkOWlNaXZBQ2IwUTNaNTVrTlEyZFpt?=
 =?utf-8?B?cEVrQVdPd0kwTzE5cTZ5T0x5RFZ5Ui8ybXp3NUgrWWk4RFZqL3RlbHRPeXN2?=
 =?utf-8?B?a2JVdzlOY3ZxM1dTZ0NPQ3RYbml4YldMcjl2OVVNZlRKcnVEZEx3TEt5VDdV?=
 =?utf-8?B?dDRLSlk2bnJPeHNFNWJVdFJnR2FGU3VTcDhwWHI3OEsrR3RzcjBLOHlIeUUw?=
 =?utf-8?B?ZmdXUTgrd3Q2Y2hFSy95WTNjZ003SUFQRnBiWVF5WE1zc0FCOWVtWDRxaVBT?=
 =?utf-8?B?dlZTWGVFRE56R09WODFRNDlLQUQ4ZGVmd1FCWmhSZHUrRlRIb0doR1lDY21a?=
 =?utf-8?B?YXJKNDBtUkJFUDI0UWlrM2M0V3BNWHVxZFY2QmM0MytMbDlWSlJUcTRmL09Y?=
 =?utf-8?B?eHFBMTFBRnpxbGo2V2l4OW14UG12NmNFdzVMUHJyZ1R5QmM4QVFhOEZtRW9n?=
 =?utf-8?B?NE9zTXNrWUNSSWN1VnZQbUtqaVV1MXVVazBESzlvYnBCNS83TmpMWm90TzR2?=
 =?utf-8?B?NHk0YmVFTC93MnpDV25DL2RkMXpEa1h2Wld3eFNSQm90bTVtbkhhejFiUkxh?=
 =?utf-8?B?Z0VjMmJCU3NlaDhKSEVObjZnbWpmR3p2UG0vQkRxeG9PUHFUTU54M0xZdUlB?=
 =?utf-8?B?a2VQTUkrb21Ua0J5cS9TOVE2S3BXNTN1Rm5TL3VoL3YvekV6ZjdvQUhFSEpO?=
 =?utf-8?B?SGRGV2FXR1NLa1NLcE5RRUptSWc4SENHY0l1UUl0OGsvSnhadVdIVldsaWJy?=
 =?utf-8?B?TUdIdXljdDVQQmtsQkNaWkwvQmVucnFoQXgvNk5GMW11aktCWDVBSUJva3RY?=
 =?utf-8?B?d3NjanhoOXowY2xsVGd4QlQyaTFaenV4ODJqbDNVNGtwc2ViaXlTdXNMYjJN?=
 =?utf-8?B?R0UzSmJDU2t0SDVWOU11NzE3dStsdE0zWFpuMXlrRUdacUZGdFU4WnVEcmJF?=
 =?utf-8?B?WlZKSWRFcE10THVXbExpSGRxY2hNcXV4UkFJZUYrWkJvTDR0U1d5cUdOMkZ3?=
 =?utf-8?B?SlFvRG9DRHFkdVFZdTYvWUZ3bzF3Q1hQbGRMOEJUZEFtTTRZV2xrYkJDVWZO?=
 =?utf-8?B?WDVUTC9FOW13U0Rxa0hkcWFEaVJ6K3hRZFBiSzRJazQ4V0tUM2lRTTBrZ2xk?=
 =?utf-8?B?c0lmT25qQUxxRkxjQjQwelBqTEFiZ2V5SUtTOE5FeTgrVDVxWUF3MXgreUlN?=
 =?utf-8?B?UjB5UUozQmN1cUpKenp0QmtSS2YrK3F2bThPY3RVQ1BMUXJjUmlFTGVYL1RH?=
 =?utf-8?B?Z3F5VEw3QzU3WDlLL08yWTZrVmJSVFUvbDlFMXdDL3hOODAralVHZU5JS2Fp?=
 =?utf-8?B?bkRHc0NwS0JPU2ZLZGdZcGhZT2NTYTZWa0dGRWJLNlFwbGlsNDhrYU5DdnVz?=
 =?utf-8?B?RWJXZFJPQW0vamg2SGNTRk1Jdkx1S2FGKzIvdytnM3lSaVNSRlRBZDJJWHhW?=
 =?utf-8?B?WGVMUHFXT01vVGtZWVQ5YWxLT1VHNmgySUJvYUpvcjdNT21ybWxtdTBDN2Fw?=
 =?utf-8?B?VEtFOEdmUTVFUUtnNTFHbnRhc3pYS3Ivd1VTa2JTS01QM0ZCUlNvN1FsbENj?=
 =?utf-8?B?ZDRoWDJiUVl2VG9vMlpSL1lOSldlQUt0d2VxQ2JvRE50dDBMWHFDQjVha2dm?=
 =?utf-8?B?UnZsWmNLeDYzN0FacllGWkkySmxmK2NMVGV4N09WSjNsaG5NVGxNSXJ0cEdp?=
 =?utf-8?B?eEhRcFBQSkNWK0sxMkZGWkZkNVRPUkRSaEg2TmZCU2g4U3pXK2R2bXhuam5s?=
 =?utf-8?B?OHR0RFlKeCtEYUtpaXU0bm55RTVGYTR2UjNlWjYwZE9wVUw5RlExRERSVEhC?=
 =?utf-8?B?TEdBbTdXNVRMNFhYWXZCZ3hIeThIVkZoV3V0TGc2TXl4QTlhN1Z1UTJNdUpP?=
 =?utf-8?B?MkZ5QmxpOVEyYkkvOTV0UWR0UzRXd3VlcCtrTzBneTRyb2pGWjRXaTBwRnB1?=
 =?utf-8?Q?wcye5b5aEFlhgYpSYOP61Ib6AttndMWL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andKSUpJTWpFSG1JbnJjODJ5WFg3Z1FXQ0JzVlJBdHM0WS9tcDI5dkZ6dW10?=
 =?utf-8?B?NmVPSmIyNXh5Mkhaamcrc1dEbk9UQ1luVVdGK3Nxa1hzeFVSSDN5cHFxT3Rv?=
 =?utf-8?B?K3lvLzluSmlFU0xPNHZLRWlXZHVXeGVvN2Fhcno0TWFuOU9hc0t6akM3TEVC?=
 =?utf-8?B?NUtDU0pIUzMyNmU5UC9CZTgraFdmQWlRbUhQSnJyTFVSRk0vWWtkQkozYUdw?=
 =?utf-8?B?QUFYMmhZeXVZZnZvREYzTFFaZE5Fdmc5bHBGTDNRc2YrTE5VcFRQeFZna1lP?=
 =?utf-8?B?MG5wQW1aZmtoVFhXZVFQTUhNZ3BJckx5cnlQZ01kWThkTXFMYkhaNTh2NURF?=
 =?utf-8?B?U1dmT09ZeWEwUlRvaGRqOExwajd2THJ0TkpBTThCTHFKcitZNzFISW9CL2J4?=
 =?utf-8?B?R1p2V21CRkJ4eVVLaTlxak5kQk10Qk1yWWFrQ0JNeTBIWHFpVmpVeXlBSWp2?=
 =?utf-8?B?MlorSVBVZjZoN2pyaHJQWGVjK3Z5M1NaVEhid2hnbjVjbXo0ZUY5aXZlMzZX?=
 =?utf-8?B?TmdrYk9ITm1oaEVTeCtrMXFrc3Jub09UWnJzbFBjMTFwTzk5TnVsaTdKZWR0?=
 =?utf-8?B?YnpDMWtOMGtOenZjcGthVDhUb2FOZjJHSGN4cmJqaWxDUVJ0K2I3SFJJOG5p?=
 =?utf-8?B?OTB4Ty9VTEFxa0E0ak9uYjBWZXErQXYwR0JXRTcwenhlYlkwU2xCZVJzY3la?=
 =?utf-8?B?dG55cmlKTEhuWHlxM0tibFV5ZE1LVkY2RTArQVJQcnJtN1lVVzB6Zi9KcDdD?=
 =?utf-8?B?UFdETytMd2lJSm1nZVVMSEo5NWJvc0c4SFZESk04YWNwbW45RmVvRXdjZlFr?=
 =?utf-8?B?RTZWMXpHTjVtMGFCRzkrc3pYdTV2aEtrbnJKUmhKdkd0UTJMVlRkNHUybmp4?=
 =?utf-8?B?TnY3MmF5a1pVSUNzK1QxL0N1cGZHT2FoRFh0dU1meDRwS1FQRDBuVkQ1bTkr?=
 =?utf-8?B?enJtKzVzb3FsQlZRWHlNM21ibzRZYXFsd0d6VGNBYTVmN29KZHdWQWoyRzl3?=
 =?utf-8?B?UndPM05hYXFCenZaY0Y4dHZoTzlXUXN5aGV5ajZWMGtQS3dEVW5JWjB2aWFO?=
 =?utf-8?B?bE9HMUFHcEV5cklDd285bVdwN1ExekxkN2RybHorbHMxUjM3Wm03dXQ2cXQ3?=
 =?utf-8?B?Qnp0T3hONTRBczlyRmozTnFNRG9mdUQ3b1JKS29FZm5aSGxrNXZseERrbjh6?=
 =?utf-8?B?MzY4RmJlT3pYbzFUYXdHYUt0ZDYzcktyNUtXRjIrSlc3Zy9zQnRpK213Y3BZ?=
 =?utf-8?B?VU4xZUc3NmMyVEY2UTM0cTJUU3FpYzg5VDVEN2R2Y3JCMUJ5Tis4bzJhQm5J?=
 =?utf-8?B?ME9lSzZqYTFnVkxFM0lCTFhldG5QcjNFWEFibGVlYTZqUVFKODJ5RHlTS2tJ?=
 =?utf-8?B?OXUwSnptVTBBN1R4M0dpM1NrM0xwOVk1cGdSRXNwQlRtWEJhWVNMRndsNElS?=
 =?utf-8?B?UW1HdThidE5PKzlqM3JVNmdRNlZpZmQ3Y2VmVUs1VnV2TW5kTlFHODVYb000?=
 =?utf-8?B?Zzl4NGRqc3ExRGlyTy9VMHNwMnZTaVBnMkpnbS9VWllZUWZxSXhFRDRhclpH?=
 =?utf-8?B?YmNGRDh2dkd6dit1Tk9KS1JqcHRVdThzYkozOExFQnR6YVNJa29rUlFHeWpP?=
 =?utf-8?B?S0ZPamNxTEFVbEVrcVpWV3hHK0xESXhsaENIb0JBamlidnVkWXI3UzZyd3ZM?=
 =?utf-8?B?SVJldDhlMWFMWDJKQjJQL0tCQU1VYjZYdVZtVTBSSVoxb2kxcnZoc1QyOG5W?=
 =?utf-8?B?WkRCamQramh3TzR2bStEUUZPS1liTENnUW50YS81bkZ6bG8yS1M0V0JmbHFl?=
 =?utf-8?B?ZStyOTZka05RUG44dWhBcE50Vi9CdFNQU0M5NDNCc08zUnVCTWlCaEc4YU9n?=
 =?utf-8?B?V3p6akpLdlVubVZ2b1ZlVXl3Rk1Odmczb25FcXk3YVVCeXhJaWVkWDJBQWZy?=
 =?utf-8?B?NjdJSFB4ejI3Z2tlY0ltUDM5VWFCODJ1emNwdmsxWi9mdUkzQnk4cldUZlNY?=
 =?utf-8?B?VXhrT3RBTm1ndkh2OXphaDJ6Yk01Y2VDVE9kenlZbXNHL29oaXFDSmEvR2hV?=
 =?utf-8?B?QW1TVGlXaENQbGVuK0NrUVUwSThCWDF2ZGJWWklpQmpyS2NuYUhOdzkvcjB4?=
 =?utf-8?B?MTJRM0JpYTVJcS9FSmN6bDkwNnhIMjFRNk5MR2Y2cExyVmNOOWE0bmRONVJv?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a39bb7-8884-4ab3-7e59-08de1188fd60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:35:20.0093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cY8WNL2eOq+fIRf4eme+qyxgDdrKRrmzIsgf4jkF5P1S8Sjf1b9zb7+xeD/Df8ke2jEV6NomYO65612h8/11Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

On Wed, Oct 22, 2025 at 06:08:09PM +0530, Satyanarayana K V P wrote:
> Post migration, a marker is sent to the GUC prior to the start of resource
> fixups to indicate start of resource fixups. The same marker is sent along
> with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
> in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 77 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 21 ++++-
>  4 files changed, 133 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..b9141497bfd5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -656,4 +656,42 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_NOTIFY_RESFIX_START
> + *
> + * This action is used by VF to notify the GuC that the VF KMD will be starting
> + * post-migration recovery steps.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..d0ac0ceaba91 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -300,12 +300,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +/**
> + * vf_notify_resfix_start - Notify GuC about start of resource fixups.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error
> + * code otherwise.
> + */
> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_vf_notify_resfix_start(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> +				ERR_PTR(err));
> +	else
> +		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
> +
> +	return err;
> +}
> +
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
>  	};
>  	int ret;
>  
> @@ -317,18 +360,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
>   *
>   * Returns: 0 if the operation completed successfully, or a negative error
>   * code otherwise.
>   */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>  				ERR_PTR(err));
> @@ -1184,7 +1228,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1207,12 +1251,19 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	return ++gt->sriov.vf.migration.resfix_marker;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u16 marker = 0;
>  	int err;
>  	bool retry;
>  
> @@ -1229,13 +1280,25 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Increment the startup marker again if it overflows, since GUC
> +	 * requires a non-zero marker to be set.
> +	 */
> +	marker = vf_post_migration_resfix_start_marker(gt);

The code is broken in this patch as the GuC version check is in the
following patch. So this needs to be reordered or just squash into a
single patch but I suspect others may not like the latter approach.

> +	if (!marker)
> +		marker = vf_post_migration_resfix_start_marker(gt);
> +
> +	err = vf_notify_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> 

I think it is harmless to call vf_post_migration_kickstart if -EAGAIN is
returned but we should probably skip vf_post_migration_kickstart if
-EAGAIN is returned again. You can split this is change out into a
single patch. 
 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..ccd850313328 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_inprogress;
>  	/** @ggtt_need_fixes: VF GGTT needs fixes */
>  	bool ggtt_need_fixes;
> +	/**
> +	 * @resfix_marker: Marker sent to Guc prior to starting the
> +	 * post‑migration.
> +	 */
> +	u16 resfix_marker;

Nit, I'd move this above the bools.

Overall patch looks good.

Matt

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..46dac62eba23 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -55,7 +55,21 @@
>   * When the VF driver is ready to continue operation on the newly connected
>   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> - * CTB messages and scheduling workloads from the VF::
> + * CTB messages and scheduling workloads from the VF.
> + *
> + * In scenarios involving double migration, the VF KMD may encounter situations
> + * where it is instructed to re-migrate before having the opportunity to send
> + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> + * prior migration is still underway, but the VF KMD is migrated again.
> + * Consequently, this may lead to the possibility of sending two migration
> + * notifications (i.e., pending fix-up for the first migration and a second
> + * notification for the new migration). Upon receiving the first RES_FIX
> + * notification, the GuC will resume VF submission on the GPU, potentially
> + * resulting in undefined behavior, such as system hangs or crashes.
> + *
> + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> + * sent along with marker and when GUC receives the same marker with
> + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
>   *
>   *      PF                             GuC                              VF
>   *     [ ]                              |                               |
> @@ -102,6 +116,11 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
> -- 
> 2.51.0
> 
