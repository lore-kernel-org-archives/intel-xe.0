Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD4BCAC5AC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 02:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D83710E213;
	Wed, 24 Sep 2025 02:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPnkqK0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E5410E213
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 02:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758680179; x=1790216179;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ilK9tntiPJYojr1n8dfQwtsTG0I7Bn88/FirkH8uvh0=;
 b=PPnkqK0k2+5PD8bStacfAasGO0wjzaMUZ/w7JqRkwEeimz8rH4kiTiqI
 O5OKE0+kd8ETEmfAEyV0rzqdjAhx+HH81gALb1xrcx9mLJVaB68kieSM5
 q2Pbfh9sCUVnxhomYhWAS9v9wL12ba2IZqM2bwYg1A4ry4rQ+ZS31eKAB
 iaXQIDdODYbT8VYmom/fzIk1rxfU3MbdIRLL4WJRdNsaK3juQOFrVGFWS
 pBAZsmswaHml1/EH83JY0/U7VNdNTs9HTy5pNRhp2flCX/ywtOI3gLTIB
 N4AT+IVlLDUOjMclumG8dVGWVoPLIKj32RsEFqyhjIDtwUi7nv3/1gpNN g==;
X-CSE-ConnectionGUID: fu8K1IXqRPSAq7c5JiDNyA==
X-CSE-MsgGUID: mMvjEp5gQQKB9bCAHXn2xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71644014"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="71644014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:16:18 -0700
X-CSE-ConnectionGUID: bgdi++E2QdiXikbkunKoeA==
X-CSE-MsgGUID: GGSs34mITb+o1bJwSU7isQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="176200723"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:16:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:16:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 19:16:17 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL4SwYKNAl+mSACwTfD1uO/cyty7AdE9t+WwKvfDwT7tehirWErHqyVTIfSDJVZqBnDWMydCWoLp4G4ZO+xUOeN6lKG7uuRu1x3udZyBhshHxXdkwvmnXKFLE87XdzyZS7VqQOw5UGG+j16Pv5wwhSsfaj8O2fMCHbW/bUjCFg6Gc9HeMp4d4I507Hu0DI54Oj8OTAIjtua3lQ2wyPhBVjKcmVTRYmJ8xKvJJV6aF7oYCEgJCuBmMcBDcTHkwf1rDUWX5E5lexW8sUjUZYk7O5hWuBvl7SGcmaive843NoIT+fxNp+A71UkCnzlziLTHlnBCiV0meVppl6DG9hoLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1Ic/ALbv7UfMC7YAozFudUtZTIPi/K2eFsf/t/+rHE=;
 b=FMqdxNpRjBuEAlR8nLITJk7kAX05VJi0gkmWwPGD3oxxUu6VmULkdPThZgtfD1y9ePMpqABNm6X57Nl9hyOQxZVfjudC2SjSmBZeKXnQ05DoR26EBlp+KWezbUK00w1Put3jXO/bEdSz/b79W6U8by9PFxqvd7rDWaFm6G3htE0/c1bRTtCub8D2cos9U73V7xqAbhrSa4Sjd7CnqzFtmeDdDu+oi8o3/1Iw5XOeP8pRmFTCiLbo7Chhm2tf0bnXIXj8m+4PgbeJTjIvsqfVFsXddRQI99fARlHYzRWhFi9CN41ND8f2oN5uk5MMW/9mHqpVaIx7dat6WVRzNDpNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 02:16:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 02:16:10 +0000
Date: Tue, 23 Sep 2025 19:16:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allow mixed mappings for userptr
Message-ID: <aNNUaC45nFcOQ13X@lstrano-desk.jf.intel.com>
References: <20250917182817.3995998-1-matthew.brost@intel.com>
 <c407b98661b5742352674f577c76cf50eddcc493.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c407b98661b5742352674f577c76cf50eddcc493.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: b80bacd2-1682-4444-5650-08ddfb105428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWhiaUVOcHFobHU5M2grWG8vZHNNLzR1TkdFVzIvZGpFTXYyWjNPaVRwdC9p?=
 =?utf-8?B?K3Jrdm9sK0dHeWFSbmRacFNkTmNmNG4zcS9UZHRvOEp6M1Z6MTJGR3BQN3pC?=
 =?utf-8?B?QWhVemxjdU1wTlJ3aGRZZHRMOGI2aTdjNE8wK2d0VnIraXB6MGhuWFh3cUFx?=
 =?utf-8?B?NTFTbE8wbDVkVXBhVHhHd1lIRWNDNjlHZVlXSUZLRytlTWllTGVac0VkMVRz?=
 =?utf-8?B?b2dvdy93NDZhTHk5RXJtUHBtbEpSSmdKRHBsSTczME1pVTRwVW8xMnpXenNT?=
 =?utf-8?B?QVZqclhzazRnMDkxcFN4Vks4dVd4d2g0eW1Fc2ZUZnE0djAvWnNjUDB5Rk5L?=
 =?utf-8?B?cWFDNlp6ai92bEJya0kvRmRXUkZHbjd2dkY3OHBuN0tsM0hCVHUrSHMvR1dC?=
 =?utf-8?B?dWFhQm9zMS92bFdYZWJBbzVuK1hVMllqVHp4VFB6ZjFQRnk3MS9BTVlTSlB4?=
 =?utf-8?B?OUNwZFg1RXkxeWlOOVRJeHhISWsrL1RVQ3YrNTVvMGZvWjRhZ0pJaDM5dERP?=
 =?utf-8?B?NHdOSkM1clhLNU9MWC9lMm9hdCtGTjBTZTZ3Tk56a2lNdE91cGJXUGxxODVU?=
 =?utf-8?B?Ri9hWXhXZTEyWUNLVFBaaTNvSFpDZDY4ei9kK0ZrUUhqc01IWExLRGRBcTha?=
 =?utf-8?B?VU83bXNBSjY2WGh1blU1SFNTQjFSY1ExeWxMV1hVWWUrQ2U1RmxMWUNFUHRR?=
 =?utf-8?B?TzNOQllKTjd5ZkcwSHFyeVJ5OEthdElzZHdXT1RlYzBVVm1WYkZiY2ZaREcx?=
 =?utf-8?B?VDJQYVRrR3hEb1UxWlVtUU5HNkVneE1JVnVDai90akxCNk53S04rQkpaM1ls?=
 =?utf-8?B?TXkyK2xxb25wV0dkVXZiZ2t2N29qbmxOWTlmN1ovbjVsa1krVkc2c1dLUENu?=
 =?utf-8?B?N0hXRGtCVHcwVUh3U0hrcFRrYk96LzBjV3N0VnF4ZGljK3M5ZVVNWHVMS0s3?=
 =?utf-8?B?Qy9KMHBibWt1eWJ3SHNLNkFhdys3YWR2aGhuU1VWVURMdTJlQkhVSFE1RXBT?=
 =?utf-8?B?NzVJSGg3akJQZGRJL0t4TUh5emJmbDRRc2FRSllQQmR1eXI2ZDJiQ0V0SCtW?=
 =?utf-8?B?cUtycTlxMnFXWU5sUHNQYnduZmVqeDlqaG4xSWVTSjdnRjRmOGdHWStCM1FS?=
 =?utf-8?B?bDJ5YTV4cDdNbERyWThwdTdEV2FpbW1WL0M4SDZSb3dIV1VDQkFTL3c5dGlk?=
 =?utf-8?B?RnN4OVd6TlJzYTRxUGhSRlFVTUZvaGtQYVBjS2xSZGZ2L2pyUjRYMnlyRHRh?=
 =?utf-8?B?N3FYdlFyVS9TZktHRnJIRWxydnVpdW5JRDNHU3MvNldCcFhXK1h0eHdUdmpR?=
 =?utf-8?B?OGROcVZ3VUFGcWpoL1dnZVRPTDcySStleEdmamlNNEtUbzdVZ3FvdlZLMkx4?=
 =?utf-8?B?c1Fya0YvZVpJZzNqRUpBU0xrRGJ4T0RoaEZXbGVubnJKTjJhOGlYL1A3Z1Jy?=
 =?utf-8?B?OFFUV1JiQmoyT04vdnBKL21EeStwcEhaYmJTVDJmVjV1R0RFSGEvYVcwYXlo?=
 =?utf-8?B?SUpvT3lENENjOTdFaE1ocDdXVjBiRXN6TjJObjZQWDQvTld2UUVFL1JRTnpJ?=
 =?utf-8?B?dFA4aTN3UnBkWnJoeEptb0FzNDlGR29BQ1lkWkttVDJPbVVwV3VMM0xHY2Ny?=
 =?utf-8?B?VlBwN3kxR3k0TnNEdG00eG9ZR29DTXozR0d1V25TZG9jcmlSWDd2TmwxckNt?=
 =?utf-8?B?LzFOS0VjaElaL3pwUmI3WVhjVEV6dm90bmFhSWNGNFVPWGk1S1dJQmZRYkpF?=
 =?utf-8?B?U0UrYXJzbkdJZVlsSUQvWUN1dkwzSmUvbVdWRk8wUW1Lc01HR29EcFJpNmJa?=
 =?utf-8?B?aHhlOTFCdS9XdmFqTktYUmNBZ2MwSkpFREROWVFtTW8xWXF6ZmN6M0RNVUhx?=
 =?utf-8?B?OThOM0laVkNRbFhuWks4L0o5dUN0MXlCdnJnL3EvTWxoeW5icHlhc0VsTWxC?=
 =?utf-8?Q?uNl5aCP+HNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGQyRmdPb21LMHd0NllvNlluMWFzdkFHUzFMaU5xcG1ubGwxUlV6Y0dLN3Ri?=
 =?utf-8?B?Q0lOOU1VOFZmN0hxWGJPUEFkRGJIbThSQWpmSWVwMDhsYzdvS2VJS3lOenl3?=
 =?utf-8?B?MndVQjBGVmVWTzVwZDlrV0xadTkwMS9VeW01MEtzS0UvQlRnRG5kblFwd0Ni?=
 =?utf-8?B?bXBMbkQvVWFBblgxNGdEQTNaMlkySllIZjZBTW93d2JxbVVBVUJmTE9PMUg1?=
 =?utf-8?B?TlFISllOeVBYaXNDN2N4a2N1QURPYk16S1hvbW8vMTFqZWUwWXU4SzYwMVhF?=
 =?utf-8?B?eEdOK21QV1FJRW14RUNSQWVCNDBEcHd0YmFCK3NiYVhKSUtzZSsrSWJHeHky?=
 =?utf-8?B?dE9uWE51b1pDeXdXNDBVWk9xV1FOcUErY0pXYUpiUUJSM1Q1YzZvOEtxUmdO?=
 =?utf-8?B?RHV6dEtzT08reDAyMzFoTGFHT3AyQ0c0ZThDNXFROVZ3N29KT0F2UVBSQzVX?=
 =?utf-8?B?TVkrUkxFUi95VWVBbFZzVVhsNmVrL2FHSFREOWQvOHJjMFFmS2tISTQrdnpT?=
 =?utf-8?B?RGE5M2hHZTBTYWE5andrTmNpMTBDclJDYnpha3NUOHc3OCsvVjZTZytCTklL?=
 =?utf-8?B?ZGZEekErVjI1eXFFbDZmaitKTWxZYVZMcHVxNUU1c0hLWWgrd3FiWW9XRkhX?=
 =?utf-8?B?bDRPcWQranFKR2R0Q1VOUWI2VnVORDRDc1QyV0pqeDNxQ09ZRm1ibU9iemRx?=
 =?utf-8?B?VWVoZVhEc2gxYzRjSC8ybXJxcGE4em02NjErelZMSmZDOFhsenFSMGY4V1Yy?=
 =?utf-8?B?NzBCbWhYc2I2NmxLNUJMK0ovZzNuS3lzVGUrUVpTTW5CT05TYkVVa3I1bU9S?=
 =?utf-8?B?NjIwRXkvRVZ6NzhkV0hwMm5yNTJSZjR4ZVQ1cmtYR3hKTE1iM1pSZG1LWU1j?=
 =?utf-8?B?MVV6VzhJclhJdncwZkFqVExRNWNYRFpkV2FFT2xlZ2V3aDBOVnM2OXYwMkl6?=
 =?utf-8?B?V2Rhd1FHUHlsUUllYXVicjQ1WGVjcXc2ZmR4U1NzMWlnVkxGN3dpMFlCa0pU?=
 =?utf-8?B?ZG15OWp3MlFQakp3ZnNlL3NraGxBb3FBUFNyWnhxR0t2Z0U3RGYybXZKRWpV?=
 =?utf-8?B?amt1a1VaRzZZUndobWc0N0tidWVlZVVNdHlHVmxoZDJKSEp6dTkrVTB5QUZh?=
 =?utf-8?B?RU1PTVN5SFVENmpNa05kMGx3bmsrZEF3TmVKZ1lPbFRTdm8xS0hzTDZzR0lr?=
 =?utf-8?B?bFpheHZZNXRqR1lLb2pycVltMzdWVXdCS2ZxejIxaHVDZ1JWblNHNG1sY3Zz?=
 =?utf-8?B?aEwzSGVJUHYvSmtUdUFzbzZKYVlNS25oYWRuSWpkSEVEMXRLc1ozWUpmc0RW?=
 =?utf-8?B?V1BMaklyay85RVhsVkJ4KzIzc2xJVno4L2pobUwrMk8rRjdBQmF0bjhybU14?=
 =?utf-8?B?Tk5ueE80ZXZ6SXhzQUJXdWU3cFpqcm1zVzRscnp1YjQ0UFNBUUtXbDNrbHlD?=
 =?utf-8?B?N0JucEZPMWM4TmNhei9SdU5qM001ays3aFRqaW1VSFFTVlRkQkp6RUpJT1NM?=
 =?utf-8?B?by8vbktrWEVtK0VVdzBFTkY3L01DS2tiQmRXOGE1dXIrVlF4MDNVa2R1cXcx?=
 =?utf-8?B?ZW5wNlQ3aFhvNFU3U2dxcTVvVVl4UWdxWDRSOHFQaGYwY3N0dmRFVXlBYUZo?=
 =?utf-8?B?M1FyYzA3RmpPbWFCRmwvUVUxdlV2Ym5pb0p2OTAxZFpBa0M4MTI2dFVQNEZm?=
 =?utf-8?B?ZmVEY1VHVGVtMjZNc1piR1N6MW94T2JsMmFqVUg1SzVPSzJrNUoxbDFzRkFo?=
 =?utf-8?B?dWFyMTRMU1AyK3dmYmRoaFhuZGRqTlBPRWhGeTRVbkM2L210UnFPbU5wdnJ5?=
 =?utf-8?B?L2tCRkZXRHRCeEpaekdISEFSeDUwSU1QTHU1endrNWovN0NzaDlEK0tOYVRi?=
 =?utf-8?B?NUZOSDcyNWJHTnQxVVl0bWFKTVNtcWh4NWFpeGNQMmNrUjFNWjc3cElzL2VC?=
 =?utf-8?B?VkNvTXhrNW0zZkJacmxpYzgwMzRxTVRHZ1hoMUlBTTNzRmRsMlpVMzhIdlBq?=
 =?utf-8?B?K0RiYzFIdkRtYyt2aDEwTXZtK2ltN3BZcCtkQnhtb1hRYUpGbXFvU1h4ajhk?=
 =?utf-8?B?aHJ2UExSSzZtZ0FTWHc5eGZUS0lodUdPSXhVeVZHVUhCaXFmTVcxaTVUZUFx?=
 =?utf-8?B?RTcrWHVwdnBXbmdic1ZEblc4KzJmSm1tajZzQ0RDR2c3UFBUN0xNYUpUZUlx?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b80bacd2-1682-4444-5650-08ddfb105428
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:16:10.7968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8ID6115h6cMHdJR1zl4T3lnpJgZQyITn3hndcSH59eO24n+fvRt0crjkW57hZKG4I0wpQGSoNjVsvwJYrnvcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

On Tue, Sep 23, 2025 at 04:52:30PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On Wed, 2025-09-17 at 11:28 -0700, Matthew Brost wrote:
> > Compute kernels often issue memory copies immediately after
> > completion.
> > If the memory being copied is an SVM pointer that was faulted into
> > the
> > device and then bound via userptr, it is undesirable to move that
> > memory. Worse, if userptr is mixed between system and device memory,
> > the
> > bind operation may be rejected.
> > 
> > Xe already has the necessary plumbing to support userptr with mixed
> > mappings. This update modifies GPUSVM's get_pages to correctly locate
> > pages in such mixed mapping scenarios.
> > 
> > Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with gpusvm")
> > Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
> 
> s/bt/by/
> 
> Perhaps we need to let the PAT index discussion land before we merge
> this. If we support multiple placements we might need multiple PAT
> indices...
> 

We'd likely just get the pat_index from the userptr bind here, which the
UMD likely expects to correspond to system memory. Either way, let's
wrap up the PAT index discussion before introducing more complexity.
Whatever we decide on will probably require a fixes patch here.
Alternatively, we could take a suboptimal route in the fixes path by
evicting userptr from device memory upon bind — similar to what was
necessary in stable kernels before the userptr → GPUSVM transition
landed.

Matt

> Otherwise LGTM.
> 
> Thanks,
> Thomas
> 
> 
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
> >  drivers/gpu/drm/xe/xe_userptr.c | 1 +
> >  include/drm/drm_gpusvm.h        | 4 ++++
> >  3 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index eeeeb99cfdf6..64c0ea70eae3 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1361,7 +1361,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> > npages);
> >  		if (is_device_private_page(page) ||
> >  		    is_device_coherent_page(page)) {
> > -			if (zdd != page->zone_device_data && i > 0)
> > {
> > +			if (!ctx->allow_mixed &&
> > +			    zdd != page->zone_device_data && i > 0)
> > {
> >  				err = -EOPNOTSUPP;
> >  				goto err_unmap;
> >  			}
> > @@ -1397,7 +1398,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  		} else {
> >  			dma_addr_t addr;
> >  
> > -			if (is_zone_device_page(page) || pagemap) {
> > +			if (is_zone_device_page(page) ||
> > +			    (pagemap && !ctx->allow_mixed)) {
> >  				err = -EOPNOTSUPP;
> >  				goto err_unmap;
> >  			}
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > b/drivers/gpu/drm/xe/xe_userptr.c
> > index 91d09af71ced..c628f58c085c 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > @@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma
> > *uvma)
> >  	struct xe_device *xe = vm->xe;
> >  	struct drm_gpusvm_ctx ctx = {
> >  		.read_only = xe_vma_read_only(vma),
> > +		.allow_mixed = true,
> >  	};
> >  
> >  	lockdep_assert_held(&vm->lock);
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 5434048a2ca4..97d2f57914bb 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -235,6 +235,9 @@ struct drm_gpusvm {
> >   * @read_only: operating on read-only memory
> >   * @devmem_possible: possible to use device memory
> >   * @devmem_only: use only device memory
> > + * @allow_mixed: Allow mixed mappings in get pages. Mixing between
> > system and
> > + *               single dpagemap is supported, mixing between
> > multiple dpagemap
> > + *               is unsupported.
> >   *
> >   * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> >   */
> > @@ -245,6 +248,7 @@ struct drm_gpusvm_ctx {
> >  	unsigned int read_only :1;
> >  	unsigned int devmem_possible :1;
> >  	unsigned int devmem_only :1;
> > +	unsigned int allow_mixed :1;
> >  };
> >  
> >  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> 
