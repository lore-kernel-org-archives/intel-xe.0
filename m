Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EF4C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 09:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9B10E2F3;
	Mon, 16 Jun 2025 09:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auMNbL/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859A10E2EC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750065300; x=1781601300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vsegD0U5JVrNOzgnQwPuf6u21NhnvqaetX6ZUWMwt0w=;
 b=auMNbL/KeZsSeLEYlIUfTMnMJpzeaXGp2ID5BXnmEBMoPiSAe+7PSaDv
 jVRuEawB2T0OS99XAoN5LVYlQhOvBwx8EPpzNGxLrhQBHJORz7n3ZMHyG
 kPcTuLJXh6ki4rqEtTbz/dm1ckZKX6ZaYV2S0nV/y2avxDPp+jhDPfdcq
 q/0SPe2KvjEbxeTjSTXq2vQFzJGoGlAOoqJZ3jl9VXDYoBS+3p21AEMg8
 uDZA5VpNzY/fPeHkjN1cegXjUPRWkIEJcajSjDmnh1jzsuUND1KMhu09r
 mgulC6X/6mzz1Z7K9qyLob3aPDT+MZxccGtP/TpWcEAh1BFZDsUfGhZ/d g==;
X-CSE-ConnectionGUID: N0MD0cLXTGqfbZrJ3/L1oQ==
X-CSE-MsgGUID: LHlXr0VfThmHuDErGLL6SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62809800"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62809800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:14:59 -0700
X-CSE-ConnectionGUID: xz1i7/YZTz2g8WdyOZ8omQ==
X-CSE-MsgGUID: h/FBoG25RDOi2C6Mn6gK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="152250659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:14:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:14:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 02:14:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:14:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp16GZTDwd3YL2jAfgxM1jvOO+UAw5AkhDCEtqzR9a8uk46naAEApU/6jfz6SsUXGuqfShXqpiwsERZqAp1ZU6TSU5/0FuASfn+8nA1T6JGebxF7LmWJIy97v1CZxGxG8N/iSZXv5M7AbXtAP55MZGswgbCautjsQrC1sdTtjrLZSSvInFIhrf6nQrlptdZW1A/VQ2gAqqP21xubCW6nUjmMJ0fM6qfN0fAGQi/a00DfYE8Aiyrdilfy0tXNq5Oabpg9mGeUOSpBJiSpCig+RAeePVoMw+9NRKs68h0DeohV0vRs8RT5+zSxwCn9Kwln1qqRFwaA+hzwXZ+c8D3Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01azLBmPOZ9pXN1B+xeMqfwjlJRqh6VqIzrl48YPHjY=;
 b=DRlc3vpNbaX/vhlXf0Lm/OwG5VSAVhnNiYMoxKTPtyXABtq4uou03PcwL9NlAkz3v2VhybCQ1UGkRwTQsOuLR/YYmu5O/J9YeF/sOMUJaaFwQTZ15Xh/X2yAKZ0jgp2CPS+fDxcvjUpXNoRWdaFlIHIBPgQMWIvHG7WReqTiwnveTh/RvnkH3urNssIjHqr7QsYZDpMwPPQW0pQllXcZIcHXlZQUH5i55jHdZcRvG9aVWoKD9byzMlWB6myYC1G1YPeqHqDI2XIaTI6bRBnGSiXTR1eYJmqb/V4VupjPrqSfhpSVt5HAgalHA1Z+QaNreECS5CWFP5oZBcifdPNB4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 16 Jun
 2025 09:14:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 09:14:25 +0000
Date: Mon, 16 Jun 2025 02:16:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aE/g0Hw/ZmBxBXpD@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
 <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
 <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
 <aExQEKec1H7yqS1I@lstrano-desk.jf.intel.com>
 <aEyDw0ZQ5R/ohrO3@lstrano-desk.jf.intel.com>
 <2f5a1a129ae6dff415d7160a1bed9e28786147e2.camel@linux.intel.com>
 <aE/OLjpW/pwyV+DM@lstrano-desk.jf.intel.com>
 <cb55e47574a0fcd62728aa4fad150f1682b92b83.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb55e47574a0fcd62728aa4fad150f1682b92b83.camel@linux.intel.com>
X-ClientProxiedBy: CYZPR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:930:8f::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d48e0b0-aec0-40d3-671d-08ddacb6302c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjl2YVkzc0Y1aTdLM2FpNEhVUHROSDhpRjE0TzFrS09aQ1Q2cXBMOVFSWUMv?=
 =?utf-8?B?WVZaV2JLZ2E0cE1EOHplWmZBRm05eUV3a3lBdEZIeXRLTUxYZ25CeW1ucm9O?=
 =?utf-8?B?bkQxNGVJSm9oWGNQTHdsYlVnRE5iVTFlUmhDUEdIbmd4ZWZKYS9oRUIwYU4w?=
 =?utf-8?B?QVpqNU5UTDdCMzRna20wMlFwUUFuSzFUejk2MHNsOEFvNlRJeGpSTFluVkhY?=
 =?utf-8?B?OWU0SFREMHhndlJuV2p5UG9oeElEU0t2Ly9YNnArT2lEbTA1SXFVQk5QRXdq?=
 =?utf-8?B?SmNsTkJiYkswaDBTcjVrZ0hnQ3RRc1hVYytNQ1FZRDl4bXV3dnhNdmR2VzBX?=
 =?utf-8?B?MkI0S1FaU0VhWVN5TlhBcWk4VSs5anlqRy9lNHd0eGxHUzNZdXMzNmxnZW55?=
 =?utf-8?B?MFJUdXRZaDJNRmUzWGlGLzNZTEVpaVFtRUUzenhZVHJCaFR6dGMvVWNjRU1F?=
 =?utf-8?B?RWxmRXpKdHN3RWdYUis0Q0xGbFY3NUZKMEdUakw2dHhXUFIrWjJ0ZnJCWU92?=
 =?utf-8?B?eS8vL3dBMWtZYlFSTzRnRXZPb0hYT29vckFkSXRLeVVROFowSUxwWUdqMGJs?=
 =?utf-8?B?SUUvQjgvZ3hsc2F6Y3kzUUgycXJGbVV0SDc5S2ZQVVB5RWtLNnR5bmRDNVg2?=
 =?utf-8?B?d3Y1QnIzL1V6MlkrUDBkSW1kelVhRDNIQ1I5VVpBeFZyc01KZUY4SXNCQnI2?=
 =?utf-8?B?VGZWTEdxOWZSTGYvb3dxNlpLWExnNDBqaXBjbVhSazdMOFVVaEkxQjNaaE91?=
 =?utf-8?B?cmVQaGNVVE9WZzhpYVRHRmU1cnBTL0VMU2dCV214b0V1eUdOcUgwVlYvcVI3?=
 =?utf-8?B?Vjl6bFZ4V2JQVmpsZ0hxdWpLM3Q4OW5ublRSYzI0SURVcXZuQjN3SHFhKzI4?=
 =?utf-8?B?UzdpbTJFb1FId1dSNG1oRm1nWlVNUlc3Qjd2ODFLUkltL3pUMkUxWXIzZ3lu?=
 =?utf-8?B?bzJNalhjSFRFUjJBMFBydkU1Y3psUWlmeEtqYlVmSVhWeko0elRxK2JSRGZP?=
 =?utf-8?B?eG9ZMDh4Vk4wSXQ5NVRFM3B3bDhsMnlDTnJESjNCRFJmVmZMOU1aaGF3QkQx?=
 =?utf-8?B?dXRJL1NQZEZ1eUg2ZldaSXR3VmlhUGkyTnFhOTlnTlNpODZFVzNqeWVnUU1i?=
 =?utf-8?B?UmxXV1l0eEFXamdtR2JWVE4yY2VRSlVadVJFeHdUblZLamNtNE12a0RGUjZ5?=
 =?utf-8?B?aHhUY0U5TnpWaytrdDRWUGtpVXk4SE4vS1BrRkN0WTl0Mll3T1k0T1JWek5o?=
 =?utf-8?B?TlViZ0l1YlpmdjJmK3F0T1VLanlMQ2d2RWpzazhQaWNLY0lmVGRlVzkveTF1?=
 =?utf-8?B?R1BQNmZZK0k2WnB3Mm04K3hmL21wSzZheWpDbFh6M293V2FkUGtOencwaUEr?=
 =?utf-8?B?dkpKRFRKYTM0K293U3BySnYwcC9FQ2xhd3hranZNd1dSNmRyT1dqNkVMNWhX?=
 =?utf-8?B?M01HZ3d1VnBlTGNYa1h1TU82d3BDaE1HRitmSUt1RHBXZzFHK3R6VC83dmZN?=
 =?utf-8?B?cndBcHhtQldtbzNmcFNYbDhXWDdwWDYzNWI3YzEzT254eHVkekk3M0VXckxJ?=
 =?utf-8?B?OVJwbEdRd1F2SzVTaGplaXA1TlBXVzNzdnFXWUhNeW93WE1RSUU0eGVnM2lx?=
 =?utf-8?B?a1B1ekhvNzVFVHVIeFh3YStsWUhLODNod2NpUWJGVFh1enQ0cVNsMlBJR1ZH?=
 =?utf-8?B?SHJkWnJmdUFSb0d0SEpYRkdkWUQ1S1dpSStuWUw1bXo0NjRzcE5UZjQzUWFD?=
 =?utf-8?B?TGU2TGRGaXZlZ2N6c3p0STJSRk80M3gwdU1CTFZtendTMWJadnVoandGUlAy?=
 =?utf-8?B?YXdHa0JIR3p6cisrRDNKQjZCYzlGRkZEOCtseXNZbmF6eFdBSWdaUkp4V3la?=
 =?utf-8?B?UisyY1UrNUF2WUMyZlpQcTRMcWtkSnREcFRBVUlrQzZ2Q1ZxdHJnaVVjVUQ5?=
 =?utf-8?Q?M1tM8uRYcto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFlSd1gxYURwSDhvRlA0Vjd2YVdEVitTb2M2eWl6N21qMm1RM1l4cmU3Ly9a?=
 =?utf-8?B?dXZha1g4cGprRVh3NlJGTUFXY2E3VXpNU0JiUEdzNVdXUWdmK0hVaXpXdUtN?=
 =?utf-8?B?cHlTY2RrOHlHUWc3eE9MMFBrMER3TGk1MU9vSkhEMk5SNGhRclFTTHlvN0NG?=
 =?utf-8?B?ZWZHZ3lQVXlTMER3WlZPYnJ6TklOTkNzQWdlQ2JUZGRvUVl4ZFpHQnJHUGFo?=
 =?utf-8?B?SnZDVytybi9iREpadHV3NEYraFRlVW01UmlWU1RIWFV3MWhyRTJVelpHb3V5?=
 =?utf-8?B?U3BUeUtFUVdJYUxwZjJhdjZDNi9FdUZUZFhXVVdCYm1NWlZDaThqMlgvd0Vi?=
 =?utf-8?B?RytxbHB6T0NqRlNxMjgvdTh5UzRIUU5aZTluY3hVYkhzbmlQcHhKU016NUZV?=
 =?utf-8?B?V0VteTBqeGZEb3dQb2szWGpzeUdzL3p6TGtKK2RqZEIwK29RV2pSd2pOMjVY?=
 =?utf-8?B?clpqVGJGTnJYTHVvbDNoZ3E3OVYrUXZoWlowS003Y0VBeXpiQmtMSW5KZG9D?=
 =?utf-8?B?M1ZpMHRiSURWaDRESHNmeU5KanVTMFBvRi90U2NKS2VQdlgwVGo3MzRvN1BM?=
 =?utf-8?B?cksxb2g2Y25lOHR5djBoeUZJd09RRTF5YjhCZ0JXcDFJN0FLVGNQcUlmMDZh?=
 =?utf-8?B?TXc2MDd0VCtDUm9vYTBuTkk0eDVwQy9QZ1NmRTJIL1FSS1h6OERyQW8vQUtP?=
 =?utf-8?B?OGtQbkdXd2pGbXdCa1JnM3VpOGFmRVN2bmM4WHBCOXJMT0tkM1R5ZXdoL2FD?=
 =?utf-8?B?NktHY3ZOcGFSdzd0d1pMS0h2VUpzM2JFd0FLMWRVM2pIVzhuQWhtVWFZRElZ?=
 =?utf-8?B?KzFxZDE1SUZmeDJxcisvNmFvMEpoUHowR2NDd2hDT0dqNVpMc1pyM1RSL2Fu?=
 =?utf-8?B?Vlg2ZktNdEVwbUhKYmd5VkhERTY4MHluNmJnT1RpakhLYkpqbkhsTmZVMFZs?=
 =?utf-8?B?b0IycWJCeXpRN1IzUmtRdFJrWnR1bDYvU3o5Tk9NdnpSYmJXQzZKYVlFQ09B?=
 =?utf-8?B?a1ZPSGY5Uzh4YXRKSEVHMGtvK0VnbnVBVitvT1EwOFBHa0tHQzhOeW51R29L?=
 =?utf-8?B?cGdkU2I5YUtFYUFPWEt5eFdWT2tkMHpodklxcW1HenFHVlNZQ0tSMTlaV2xm?=
 =?utf-8?B?dWlkc3o1a1g3Z2R4QklGT241aXFlT3hiNVF2UGMwMkNoOHRqSkZRWnFzQXJv?=
 =?utf-8?B?RVhRbXRnNVdaZERkQXZwYmRJVXhJbkdRUjdGM3lxaWw1dE95aTg2ckN6Z1Bi?=
 =?utf-8?B?Y20rSWlmdlZBYUZIMEhDNHQ1ZkhKMjdYTjBoOGFJdzIrZDJKVVQ3MDdYUks2?=
 =?utf-8?B?bHFkWWpwaGxuZUFXd3FqSmpkODhXaGY1dTRzWGdiQ3BMVUZVdzBmakdUR0Nk?=
 =?utf-8?B?NEtDZU5ZbEloeEgxb1VyT3JRTlliQzZzc3ErOFcyK0Y4c0ZCaWUyN05IcjVX?=
 =?utf-8?B?TnBUWkQ1d3FSdzZSV2dPMEV4OGh1bHlZL2FGMXJaMzM2MmpSWkJLL3NrK2t1?=
 =?utf-8?B?N3BQQWZRZ3NOVEpqd2lrVTlXZCtFNmFWMXVJaDN1V0tPdEt0TEltMHlwYUNW?=
 =?utf-8?B?aDljVUFpckIvc2QvdU91bCtUN1JEZFlTTEd0OUtQdDNPbVNESDcyM1V6RUto?=
 =?utf-8?B?a0tQbncvb2VLV0dWUUhDdU5UZmhQYVh0VUZQVHFWT0hHYVJjKzVnYURBdzdK?=
 =?utf-8?B?YnJPMTBiTVIzc3M5U2JkMDBJOWNzKzNMdld1WU10bkMrTy9nV2dVUU93Wkc0?=
 =?utf-8?B?aUZhWm1vaDVGYlZJZHkreGtFLzVRUHA4eGxRRWhvS1MwVW05djU0RnhicmNU?=
 =?utf-8?B?T2wrWk4rVkE2cDl1Z1RLWW1qSzZYMW9SRDVCOC9IK3JrcFJyVStqTGVudVpa?=
 =?utf-8?B?dkZIdmJMbWZJamJpajhNWDZYTXdXN3lLb0dEQ3FOZGQybmxSZUFTYnMrZnlG?=
 =?utf-8?B?SGJORDVzVGprZ2NUQjd1Q001OFNiZzlUK0ZzeVU1ekRZdnNsTTBYMG1scjF3?=
 =?utf-8?B?Y1dXQW1HK1l2UFl6L2xQazl6THM4MWVDUXNQNnBOMytidVN5VUhIV2VNb0xq?=
 =?utf-8?B?SVNZNFFpdEVMNjJBWmdjVHkweGcvUWpvV3QzZTE1OGY0dlFjdWo1SlQ4M0h3?=
 =?utf-8?B?eGFMYUtOblpGVlJmaHFZMHVQcDRGM1RBaFgzVllmY1RnL24vZ0QxajI3Z011?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d48e0b0-aec0-40d3-671d-08ddacb6302c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:14:25.1822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1GZaFC3+Fnl34ZM9L14eOS3Ka9sB7f7Pqnsd8SAs3jvLJ5IEULdRiS7SVP0UE9k5L6/pOytEyO9DC7xyVoWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
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

On Mon, Jun 16, 2025 at 10:53:37AM +0200, Thomas Hellström wrote:
> On Mon, 2025-06-16 at 00:56 -0700, Matthew Brost wrote:
> > On Mon, Jun 16, 2025 at 09:40:05AM +0200, Thomas Hellström wrote:
> > > On Fri, 2025-06-13 at 13:02 -0700, Matthew Brost wrote:
> > > > On Fri, Jun 13, 2025 at 09:21:36AM -0700, Matthew Brost wrote:
> > > > > On Fri, Jun 13, 2025 at 10:07:17AM +0200, Thomas Hellström
> > > > > wrote:
> > > > > > On Thu, 2025-06-12 at 10:11 -0700, Matthew Brost wrote:
> > > > > > > On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellström
> > > > > > > wrote:
> > > > > > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > > > > > > Clearing on free should hide latency of BO clears on
> > > > > > > > > new
> > > > > > > > > user BO
> > > > > > > > > allocations.
> > > > > > > > > 
> > > > > > > > > Implemented via calling xe_migrate_clear in release
> > > > > > > > > notify
> > > > > > > > > and
> > > > > > > > > updating
> > > > > > > > > iterator in xe_migrate_clear to skip cleared buddy
> > > > > > > > > blocks.
> > > > > > > > > Only
> > > > > > > > > user
> > > > > > > > > BOs
> > > > > > > > > cleared in release notify as kernel BOs could still be
> > > > > > > > > in
> > > > > > > > > use
> > > > > > > > > (e.g.,
> > > > > > > > > PT
> > > > > > > > > BOs need to wait for dma-resv to be idle).
> > > > > > > > 
> > > > > > > > Wouldn't it be fully possible for a user to do (deep
> > > > > > > > pipelining 3d
> > > > > > > > case)
> > > > > > > > 
> > > > > > > > create_bo();
> > > > > > > > map_write_unmap_bo();
> > > > > > > > bind_bo();
> > > > > > > > submit_job_touching_bo();
> > > > > > > > unbind_bo();
> > > > > > > > free_bo();
> > > > > > > > 
> > > > > > > > Where the free_bo and release_notify() is called long
> > > > > > > > before
> > > > > > > > the
> > > > > > > > job we
> > > > > > > > submitted even started?
> > > > > > > > 
> > > > > > > > So that would mean the clear needs to await any previous
> > > > > > > > fences,
> > > > > > > > and
> > > > > > > > that dependency addition seems to have been removed from
> > > > > > > > xe_migrate_clear.
> > > > > > > > 
> > > > > > > 
> > > > > > > I think we are actually ok here. xe_vma_destroy is called
> > > > > > > on
> > > > > > > unbind
> > > > > > > with
> > > > > > > the out fence from the bind IOCTL, so we don't get to
> > > > > > > xe_vma_destroy_late until that fence signals, and
> > > > > > > xe_vma_destroy_late
> > > > > > > (possibly) does the final BO put. Whether this follow makes
> > > > > > > sense is
> > > > > > > a
> > > > > > > bit questable - this was very early code I wrote in Xe and
> > > > > > > if I
> > > > > > > rewrote
> > > > > > > today I suspect it would look different.
> > > > > > 
> > > > > > Hmm, yeah you're right. So the unbind kernel fence should
> > > > > > indeed
> > > > > > be
> > > > > > last fence we need to wait for here.
> > > > > > 
> > > > > 
> > > > > It should actually be signaled too. I think we could avoid any
> > > > > dma-
> > > > > resv
> > > > > wait in this case. Kernel operations are typically (maybe
> > > > > always)
> > > > > on the
> > > > > migration queue, though, so we’d be waiting on those operations
> > > > > via
> > > > > queue ordering anyway.
> > > 
> > > Hm. We should not be keeping the vma and xe_bo around until the
> > > unbind
> > > fence has signaled? We did not always do that except for userptr
> > > where
> > > we needed a mechanism to keep the dma-mappings? So if we mistakenly
> > > introduced something that needs to keep them around, the above
> > > would
> > > only make that harder to fix? It sounds like this completely
> > > bypasses
> > > the TTM delayed delete mechanism?
> > > 
> > 
> > See xe_vma_destroy — if there’s an unsignaled fence attached to the
> > VMA,
> > we delay the destroy.
> > 
> > Yeah, like I said, this code is very questionable at best and was
> > written early in my Xe days, before I understood TTM a bit better.
> 
> But I'm pretty sure it wasn't always like this? Perhaps it was an easy
> way to keep the user-fence around until it signaled?
> 

I’d have to check, but I’m pretty sure I added this worker early
on—before I had a clue how a lot of things actually worked, out of
ignorance.

> > 
> > > If the remaining operations are maybe always from the migration
> > > queue,
> > > they will be skipped for the clearing operation by the scheduler
> > > anyway, right?
> > > 
> > > I think the safest and looking forward least error prone thing to
> > > do
> > > here is to wait for all fences, since if we can restore the
> > > original
> > > behaviour of dropping the bo reference at unbind time rather than
> > > unbind fence signal time, the bo will be immediately individualized
> > > an
> > > no new unnecessary fences can be added.
> > > 
> > 
> > I think this needs to be a tandem change then — we drop the VMA/BO
> > delayed destroy and wait on the bookkeeping here. Sound reasonable?
> 
> Yes. Although we need to keep the delayed vma destroy for userptr.
> 

Agree.

> Also for the user-fence, perhaps it can keep a reference to itself
> until it signals, rather than we keep the vma->ufence reference.
> 

I’ve paged this out, but user_fence_worker already dereferences itself…
so maybe we’re okay? I’d need to dig back in to fully understand it
again.

I think we’ve switched to an unrelated topic at this point. I agree that
the whole VMA destroy path should be analyzed. At a minimum, let's add
comments in the code explaining the design—and at best, refactor it to
make a bit more sense. I can take an action item to do that in the short
term, since I can’t give a precise answer right now.

Is this worth holding up the patch, though?

Matt

> Thanks,
> Thomas
> 
> 
> 
> 
> 
> > 
> > > > > 
> > > > > > > 
> > > > > > > We could make this 'safer' by waiting on
> > > > > > > DMA_RESV_USAGE_BOOKKEEP in
> > > > > > > xe_migrate_clear for calls from release notify but for
> > > > > > > private
> > > > > > > to VM
> > > > > > > BO's we'd risk the clear getting stuck behind newly
> > > > > > > submitted
> > > > > > > (i.e.,
> > > > > > > submitted after the unbind) exec IOCTLs or binds.
> > > > > > 
> > > > > > Yeah, although at this point the individualization has
> > > > > > already
> > > > > > taken
> > > > > > place, so at least there should be no starving, since the
> > > > > > only
> > > > > > unnecessary waits would be for execs submitted between the
> > > > > > unbind
> > > > > > and
> > > > > > the individualization. So doable but leave it up to you.
> > > > > > 
> > > > > 
> > > > > The individualization is done by the final put-likely assuming
> > > > > the
> > > > > BO is
> > > > > closed and unmapped in user space—in the worker mentioned
> > > > > above. If
> > > > > an
> > > > > exec or bind IOCTL is issued in the interim, we’d be waiting on
> > > > > those.
> > > > > 
> > > > > > > > Another side-effect I think this will have is that bos
> > > > > > > > that
> > > > > > > > are
> > > > > > > > deleted
> > > > > > > > are not subject to asynchronous evicton. I think if this
> > > > > > > > bo
> > > > > > > > is hit
> > > > > > > > during lru walk and clearing, TTM will just sync wait for
> > > > > > > > it
> > > > > > > > to
> > > > > > > > become
> > > > > > > > idle and then free the memory. I think the reason that
> > > > > > > > could
> > > > > > > > not be
> > > > > > > > fixed in TTM is that TTM needs for all resource manager
> > > > > > > > fences to
> > > > > > > > be
> > > > > > > > ordered, but if a check for ordered fences which I think
> > > > > > > > requires
> > > > > > > > here
> > > > > > > > that the eviction exec_queue is the same as the clearing
> > > > > > > > one,
> > > > > > > > that
> > > > > > > > could be fixed in TTM.
> > > > > > > > 
> > > > > > > 
> > > > > > > I think async eviction is still controlled by no_wait_gpu,
> > > > > > > right? See
> > > > > > > ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu
> > > > > > > is
> > > > > > > clear
> > > > > > > the
> > > > > > > eviction process moves on, right? So the exec IOCTL can
> > > > > > > still
> > > > > > > be
> > > > > > > pipelined albeit not with deleted BOs that have pending
> > > > > > > clears.
> > > > > > > We
> > > > > > > also
> > > > > > > clear no_wait_gpu in Xe FWIW.
> > > > > > 
> > > > > > Yes this is a rather complex problem further complicated by
> > > > > > the
> > > > > > fact
> > > > > > that since we can in wait for fences under dma_resv locks,
> > > > > > for a
> > > > > > true
> > > > > > no_wait_gpu exec to succeed, we're only allowed to do
> > > > > > dma_resv_trylock.
> > > > > > 
> > > > > > Better to try to fix this in TTM rather than try to worry too
> > > > > > much
> > > > > > about it here.
> > > > > > 
> > > > > 
> > > > > +1.
> > > > > 
> > > > > > > 
> > > > > > > > Otherwise, this could also cause newly introduced sync
> > > > > > > > waits
> > > > > > > > in the
> > > > > > > > exec() and vm_bind paths where we previously performed
> > > > > > > > eviction and
> > > > > > > > the
> > > > > > > > subsequent clearing async.
> > > > > > > > 
> > > > > > > > Some additional stuff below:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > > > > > ++++++++++++++++++++++++++++
> > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > > > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26
> > > > > > > > > +++++++++++++++
> > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > > > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > >  	return locked;
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +static void xe_ttm_bo_release_clear(struct
> > > > > > > > > ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > > +{
> > > > > > > > > +	struct xe_device *xe =
> > > > > > > > > ttm_to_xe_device(ttm_bo-
> > > > > > > > > > bdev);
> > > > > > > > > +	struct dma_fence *fence;
> > > > > > > > > +	int err, idx;
> > > > > > > > > +
> > > > > > > > > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > > > > > +
> > > > > > > > > +	if (ttm_bo->type != ttm_bo_type_device)
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	if (xe_device_wedged(xe))
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	if (!ttm_bo->resource ||
> > > > > > > > > !mem_type_is_vram(ttm_bo-
> > > > > > > > > > resource-
> > > > > > > > > > mem_type))
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > > > > > > > +		goto unbind;
> > > > > > > > > +
> > > > > > > > > +	err = dma_resv_reserve_fences(&ttm_bo-
> > > > > > > > > >base._resv,
> > > > > > > > > 1);
> > > > > > > > > +	if (err)
> > > > > > > > > +		goto put_pm;
> > > > > > > > > +
> > > > > > > > > +	fence =
> > > > > > > > > xe_migrate_clear(mem_type_to_migrate(xe,
> > > > > > > > > ttm_bo-
> > > > > > > > > > resource->mem_type),
> > > > > > > > > +				 ttm_to_xe_bo(ttm_bo),
> > > > > > > > > ttm_bo-
> > > > > > > > > > resource,
> > > > > > > > 
> > > > > > > > We should be very careful with passing the xe_bo part
> > > > > > > > here
> > > > > > > > because
> > > > > > > > the
> > > > > > > > gem refcount is currently zero. So that any caller deeper
> > > > > > > > down in
> > > > > > > > the
> > > > > > > > call chain might try to do an xe_bo_get() and blow up.
> > > > > > > > 
> > > > > > > > Ideally we'd make xe_migrate_clear() operate only on the
> > > > > > > > ttm_bo for
> > > > > > > > this to be safe.
> > > > > > > > 
> > > > > > > 
> > > > > > > It looks like bo->size and xe_bo_sg are the two uses of an
> > > > > > > Xe
> > > > > > > BO in
> > > > > > > xe_migrate_clear(). Let me see if I can refactor the
> > > > > > > arguments
> > > > > > > to
> > > > > > > avoid
> > > > > > > these + add some kernel doc.
> > > > > > 
> > > > > > Thanks,
> > > > > > Thomas
> > > > > > 
> > > > > 
> > > > > So I'll just respin the next rev with a refactor
> > > > > xe_migrate_clear
> > > > > arguments.
> > > > > 
> > > > 
> > > > Actually xe_migrate_clear sets the bo->ccs_cleared field, so we
> > > > kinda
> > > > need the Xe BO. I guess I'll leave as is.
> > > > 
> > > > Yes, if caller does xe_bo_get, that will blow up but no one is
> > > > doing
> > > > that and we'd immediately get a kernel splat if some one tried to
> > > > change
> > > > this so I think we are good. Thoughts?
> > > 
> > > I think we either (again to be robust to future errors)
> > > 
> > > 1) need to ensure and document that the migrate layer is completely
> > > safe for gem refcount 0 case bos or we
> > > 
> > > 2) Only dereference gem refcount 0 bos directly in the TTM
> > > callbacks.
> > > 
> > > To me 2) seems simplest meaning we'd need to pass the ccs_cleared
> > > field
> > > into the migrate layer function.
> > > 
> > 
> > So, pass ccs_cleared by reference and also pass in the TTM BO? I
> > typically despise pass-by-reference, but yeah, that could work. Some
> > kernel doc indicating that xe_migrate_clear can be called with a
> > refcount of 0 would be good too.
> > 
> > Matt 
> > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > /Thomas
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > +				
> > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > > > > > +				
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > > > > > +	if (XE_WARN_ON(IS_ERR(fence)))
> > > > > > > > > +		goto put_pm;
> > > > > > > > > +
> > > > > > > > > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo-
> > > > > > > > > > resource);
> > > > > > > > > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > > > > > > +			   DMA_RESV_USAGE_KERNEL);
> > > > > > > > > +	dma_fence_put(fence);
> > > > > > > > > +
> > > > > > > > > +put_pm:
> > > > > > > > > +	xe_pm_runtime_put(xe);
> > > > > > > > > +unbind:
> > > > > > > > > +	drm_dev_exit(idx);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static void xe_ttm_bo_release_notify(struct
> > > > > > > > > ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > >  {
> > > > > > > > >  	struct dma_resv_iter cursor;
> > > > > > > > > @@ -1478,6 +1523,8 @@ static void
> > > > > > > > > xe_ttm_bo_release_notify(struct
> > > > > > > > > ttm_buffer_object *ttm_bo)
> > > > > > > > >  	}
> > > > > > > > >  	dma_fence_put(replacement);
> > > > > > > > >  
> > > > > > > > > +	xe_ttm_bo_release_clear(ttm_bo);
> > > > > > > > > +
> > > > > > > > >  	dma_resv_unlock(ttm_bo->base.resv);
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > @@ -1063,7 +1063,7 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >  	struct xe_gt *gt = m->tile->primary_gt;
> > > > > > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > >  	bool clear_only_system_ccs = false;
> > > > > > > > > -	struct dma_fence *fence = NULL;
> > > > > > > > > +	struct dma_fence *fence =
> > > > > > > > > dma_fence_get_stub();
> > > > > > > > >  	u64 size = bo->size;
> > > > > > > > >  	struct xe_res_cursor src_it;
> > > > > > > > >  	struct ttm_resource *src = dst;
> > > > > > > > > @@ -1075,10 +1075,13 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >  	if (!clear_bo_data && clear_ccs &&
> > > > > > > > > !IS_DGFX(xe))
> > > > > > > > >  		clear_only_system_ccs = true;
> > > > > > > > >  
> > > > > > > > > -	if (!clear_vram)
> > > > > > > > > +	if (!clear_vram) {
> > > > > > > > >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo-
> > > > > > > > > >size,
> > > > > > > > > &src_it);
> > > > > > > > > -	else
> > > > > > > > > +	} else {
> > > > > > > > >  		xe_res_first(src, 0, bo->size,
> > > > > > > > > &src_it);
> > > > > > > > > +		if (!(clear_flags &
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > +			size -=
> > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > +	}
> > > > > > > > >  
> > > > > > > > >  	while (size) {
> > > > > > > > >  		u64 clear_L0_ofs;
> > > > > > > > > @@ -1125,6 +1128,9 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >  			emit_pte(m, bb, clear_L0_pt,
> > > > > > > > > clear_vram,
> > > > > > > > > clear_only_system_ccs,
> > > > > > > > >  				 &src_it, clear_L0,
> > > > > > > > > dst);
> > > > > > > > >  
> > > > > > > > > +		if (clear_vram && !(clear_flags &
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > +			size -=
> > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > +
> > > > > > > > >  		bb->cs[bb->len++] =
> > > > > > > > > MI_BATCH_BUFFER_END;
> > > > > > > > >  		update_idx = bb->len;
> > > > > > > > >  
> > > > > > > > > @@ -1146,7 +1152,7 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >  		}
> > > > > > > > >  
> > > > > > > > >  		xe_sched_job_add_migrate_flush(job,
> > > > > > > > > flush_flags);
> > > > > > > > > -		if (!fence) {
> > > > > > > > > +		if (fence == dma_fence_get_stub()) {
> > > > > > > > >  			/*
> > > > > > > > >  			 * There can't be anything
> > > > > > > > > userspace
> > > > > > > > > related
> > > > > > > > > at this
> > > > > > > > >  			 * point, so we just need to
> > > > > > > > > respect any
> > > > > > > > > potential move
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > > > > > > xe_migrate
> > > > > > > > > *m, struct xe_bo *bo,
> > > > > > > > >  
> > > > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > > > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > > > > > > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> > > > > > > > >  #define
> > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG
> > > > > > > > > _BO_
> > > > > > > > > DATA |
> > > > > > > > > \
> > > > > > > > >  					XE_MIGRATE_CLE
> > > > > > > > > AR_F
> > > > > > > > > LAG_CC
> > > > > > > > > S_DA
> > > > > > > > > TA)
> > > > > > > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate
> > > > > > > > > *m,
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > index d1a403cfb628..630082e809ba 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > @@ -315,6 +315,32 @@ static inline void
> > > > > > > > > xe_res_next(struct
> > > > > > > > > xe_res_cursor *cur, u64 size)
> > > > > > > > >  	}
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +/**
> > > > > > > > > + * xe_res_next_dirty - advance the cursor to next
> > > > > > > > > dirty
> > > > > > > > > buddy
> > > > > > > > > block
> > > > > > > > > + *
> > > > > > > > > + * @cur: the cursor to advance
> > > > > > > > > + *
> > > > > > > > > + * Move the cursor until dirty buddy block is found.
> > > > > > > > > + *
> > > > > > > > > + * Return: Number of bytes cursor has been advanced
> > > > > > > > > + */
> > > > > > > > > +static inline u64 xe_res_next_dirty(struct
> > > > > > > > > xe_res_cursor
> > > > > > > > > *cur)
> > > > > > > > > +{
> > > > > > > > > +	struct drm_buddy_block *block = cur->node;
> > > > > > > > > +	u64 bytes = 0;
> > > > > > > > > +
> > > > > > > > > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > > > > > +		   cur->mem_type != XE_PL_VRAM1);
> > > > > > > > > +
> > > > > > > > > +	while (cur->remaining &&
> > > > > > > > > drm_buddy_block_is_clear(block)) {
> > > > > > > > > +		bytes += cur->size;
> > > > > > > > > +		xe_res_next(cur, cur->size);
> > > > > > > > > +		block = cur->node;
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	return bytes;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  /**
> > > > > > > > >   * xe_res_dma - return dma address of cursor at
> > > > > > > > > current
> > > > > > > > > position
> > > > > > > > >   *
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > > > > > > ttm_resource_manager *man,
> > > > > > > > >  	if (place->fpfn || lpfn != man->size >>
> > > > > > > > > PAGE_SHIFT)
> > > > > > > > >  		vres->flags |=
> > > > > > > > > DRM_BUDDY_RANGE_ALLOCATION;
> > > > > > > > >  
> > > > > > > > > +	if (tbo->type == ttm_bo_type_device)
> > > > > > > > > +		vres->flags |=
> > > > > > > > > DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > > > > > +
> > > > > > > > >  	if (WARN_ON(!vres->base.size)) {
> > > > > > > > >  		err = -EINVAL;
> > > > > > > > >  		goto error_fini;
> > > > > > > > > @@ -187,7 +190,7 @@ static void
> > > > > > > > > xe_ttm_vram_mgr_del(struct
> > > > > > > > > ttm_resource_manager *man,
> > > > > > > > >  	struct drm_buddy *mm = &mgr->mm;
> > > > > > > > >  
> > > > > > > > >  	mutex_lock(&mgr->lock);
> > > > > > > > > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > > > > > +	drm_buddy_free_list(mm, &vres->blocks, vres-
> > > > > > > > > > flags);
> > > > > > > > >  	mgr->visible_avail += vres->used_visible_size;
> > > > > > > > >  	mutex_unlock(&mgr->lock);
> > > > > > > > >  
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > > > > > > ttm_resource
> > > > > > > > > *res)
> > > > > > > > >  	return container_of(res, struct
> > > > > > > > > xe_ttm_vram_mgr_resource,
> > > > > > > > > base);
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +static inline void
> > > > > > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct
> > > > > > > > > ttm_resource
> > > > > > > > > *res)
> > > > > > > > > +{
> > > > > > > > > +	to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > > > > > DRM_BUDDY_CLEARED;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static inline struct xe_ttm_vram_mgr *
> > > > > > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > > > > > > >  {
> > > > > > > > 
> > > > > > 
> > > 
> 
