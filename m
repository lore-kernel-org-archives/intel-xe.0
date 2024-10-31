Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF5D767D8
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 16:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8A10E097;
	Thu, 31 Oct 2024 16:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzxBe8KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C513F10E097
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730390786; x=1761926786;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oYIcfd2aUcHtW3h/Ee6VC8M3N/OyqP4Jaz162Fzi+Mw=;
 b=UzxBe8KQAwtbKk6/iFxOlZMsiYzWgT5b24wi3SzDngCy6+4bsP/lv3Aw
 kmbnz34pIL9v/FUkY2D2otwSfNGMPaY8cW59FEHFcyWQBPep08lsfORRE
 EUeMoFCu5qu+gcrdftofm7MEqKM90mQWt1/hSgceceGaxUfR3DwtXDUic
 2nJHgXooRPF5sWtZ3YyUSdLfMFyu7uSWDJ0yhPoV9RvLrv1LQ0jusC7aU
 VpswT2LGhn9DQCNgZUwVyq8g2NeNJiHi3epjEY8DldTMrjf+lGVzjv8Vf
 GgKOV75MjQ0dm5MValMeqnUwsLHuqOmJOXU7F+k8tDZAITBEEFNEGCqr3 g==;
X-CSE-ConnectionGUID: eyLpae7lSNa+LOYQpFbWnA==
X-CSE-MsgGUID: wp2Kwe0AROqSN5oW94bWng==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="32975347"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="32975347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:05:17 -0700
X-CSE-ConnectionGUID: OQImBOjnS+KLGgmhmifI/w==
X-CSE-MsgGUID: 4NweH5B3TYSBDc8WIdTqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87215837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 09:05:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 09:05:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 09:05:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 09:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIZ19/2q+2pRUqqKELeerF12sqRYn1H5hz6PyZc1QAPHCYbEuJK8s0Rhv0NmH6K7WdNf0Fp4UtDClGdUDf7iIry/wnRyKP45QA5hRDivJ1uaGiIBUofJTgFYwJvQj7lRQGS4lgnOBPaIY+3GW3FdcWOYmDRDaBRldJiROJHoTr+Esv77G0EOtNvogS3LnHDX5+Bbsgd42L2QDhVOFyGIufXqmvxAMxXmYTkqy/+6lwGpM37Jemyv8ORAc+Cfj6iHvN/keEd8gQTBfhx2YXju16juIJ+o9yDgD4bAS6M7kLyXUdxiU64RpVvbqjeiGymqhQFcYsmUy7VmFLyZ4Xjvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbUpKz2Utb05c2k8Cc5qC7n0s3LxPynLKBUOglNvoaU=;
 b=Jhgl4IqYGjNwrNZB8aEXPwPh9RaPbfcbforpxjHRQChk2tESAbmcZ0JYMeXhp25il604YmcOfioiSNuua3bbnAKcjJ/sTInm1BPEXGziWu4pgEMmWlI2SrFvIIqFMHc145/VH26x3wcFxd/k0dyxifJ+r+1ePdM2G1DE0nfyeI2QETG6//bhCR5Gnfa6VufDNvpCQMPl9HrUGMwfPBT3NQ3UekqEKTs5maGvjNaAJUdm9X5+wMsIUah6IB1DaH93xtQbYOCqzQRUMrmwW7ECdDAqRhlvIJzwseCLmLYa1Fk+d8X45TkNfGSc7eGGDWC/LVB4ui72H6zjTxVOD/NcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 16:04:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 16:04:04 +0000
Date: Thu, 31 Oct 2024 09:04:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.winiarski@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/pf: Allow to view and replace VF LMEM and
 CCS state over debugfs
Message-ID: <ZyOqkrGAzX1q5v1C@lstrano-desk.jf.intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
 <20241031151725.28315-5-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031151725.28315-5-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW2PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:907:1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: a9486568-22f7-4e86-2ab6-08dcf9c5a4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFJjZTJRZ0FWaFgxaHNRc3ZQbThNUGYrOGYvKzUzdHpoYkFoSmNCM0hZVi8y?=
 =?utf-8?B?cnYrQWpLY045VFB4eVpZSk1Sd0R1OHJsSHplVUwrMUdnWjZDTlNuQW1ocXRS?=
 =?utf-8?B?Rlluek84QXp5RXZ4SEwrUWVlZURrelBlOE13bk1lTnVGWnJld0ptaG4yclhF?=
 =?utf-8?B?UGt3TWRsbzVIclI2SmN4bTQ3MDRVbnFqbHFOckpId0FsVVZ0UTBMb2NHQU4z?=
 =?utf-8?B?VU9Ed3EvQktDeFU1aFhmbFAyRVAyYUU3UUV0dFE2QWdzZ0EzcGFOSFNwRXJP?=
 =?utf-8?B?ZVh5K1d6MUY1SkJGV2tJM1NoVjRyVXUxT3lzaUU3d3VhRVlXTXVQWE1jUU50?=
 =?utf-8?B?SDNzQlNXcG9yZzVTMXBPblllRzhJZDJtSEtSUDBZSUxtSXBQTmkwMHFLQ25P?=
 =?utf-8?B?ZUlHRzdDS0xhcnNCeGUxMUc2NDljL0lBZldTWFMwUnNZYXR3dnQrdzlBU0tK?=
 =?utf-8?B?Z2RzdWdaa3k2QkZuWUJJUkd2S0c2VVdsK0VkN2dSRkJaNmZoQzUzTmFiN1JC?=
 =?utf-8?B?VFRCbTlHMXNoaVBvcWNjVGVqb0xib3dkZWR6MkpqMldGNnF0YXhjUS9CNDJU?=
 =?utf-8?B?eFgydzFGRGVKUEdsR3V2cHgrVDFud1B2U2RkaU55QzR0eCt4VWVtTERvNXJC?=
 =?utf-8?B?eTgzR3FVamJMYzVFR2JaVzhXUGcxOEVsc3poY3lRYXMrUmdxSDU4NWcwUkh5?=
 =?utf-8?B?RGYzZy9FUFBKWUZQZHV6cFYzaEJ0SU9ZN3htTkVwMmJ6Y0F2MHpvZEJ4R1Zu?=
 =?utf-8?B?cHRUSlJ5OG1GMEluNnZKQ3lLYmdRTUV5bkR5VlNNaDhXSkVnWnlBa04yQytv?=
 =?utf-8?B?TlNDM1dreDRzNzU3S1N1bFN2eWkzZzFBeUc3cWVxZUtBZmtXNms0U2pKbWpF?=
 =?utf-8?B?K1U0TGRaQU14UTM4YkwyTkxDck5OZ3lHanYrRFJVdEo0L1N1MXFPZ1h4M2ZC?=
 =?utf-8?B?djNaSEJJQXdmNTdFU1BVRU9QTlpVT3JVbUFCT1BoU3dMb2tjYTRJOFltUzZO?=
 =?utf-8?B?WHhSTXFrSE1EeW10c09SOXYrdDlwMEFQVCtxZi9QK0JvWkFtQnNjZ1FFM3Mz?=
 =?utf-8?B?eklJQTVJRTVlSXkyQ0pNTFNSQkpHS0R1RloyVnZ2blJYMmJSNmZEVnFVTWhM?=
 =?utf-8?B?M3g1dVRJMzYrOHNZSmc5STBRWHowVnlDZGhUTkJ3YUhqQlhHd2ZMR0JjOVV3?=
 =?utf-8?B?R1VCOEdza0pvYXJreXdjbWVYRHdydTVCQS9IWmVSVUpra0poaW1tZ3c1UnZm?=
 =?utf-8?B?UkxmTkdSVGcyc1dqcEtuanQwTHpkRVVjbnFON2t3ZVdhVzJ6OWowcEFlMVk0?=
 =?utf-8?B?YlpYdWU2aFpSZ2tURStwaUNOTnF0MnZLQ2JXUTJyYSt1OFFmb1NqanNvUUNS?=
 =?utf-8?B?WVdBNmZWY29FaG1QRktscXVFaVhFRmsxY05lQjA5d3pteEdwMWdJZWpZazB5?=
 =?utf-8?B?K0R5S2hpWGNFNW10YU1pNVBKVUlJdXVOa1JyUGRnNEh6NjI1VHBXNkZvRklI?=
 =?utf-8?B?eE5GZlNUeWQxWWthZlBFZWdDNHl4Skt4b005SkYxKzJRQVloS2NYZW85dzFW?=
 =?utf-8?B?NWFudDl6S0tEdSsrdTgzeGZnOXNsbVZROHJ6Y3BCMlgyZGhmNTBCTG90VGl6?=
 =?utf-8?B?ajU3QW1qbU1mL2dWTWJUQ1JCYkl2bnJTRjJwWERlYnRvak5yVDlxYmdmaTdl?=
 =?utf-8?Q?6Bt7pGYryQr3OyfRo6HO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWdxVVVoS1RINFNTMmZqd0VUdE9UL1hHVU9oVy9nMjk4emV6b2VmYVJiR3hM?=
 =?utf-8?B?c2E4aE80OHd4MGRFK1V2RzUwK1owdDJiank3djAxTUtDYWRwSnhELzJoUzRw?=
 =?utf-8?B?U3p0ZzAxSVFackZjMEkva3E3UFRpOEpvTDlPeFdvTDd5OEx2aHJBWElXR3Ro?=
 =?utf-8?B?M0JVZnl6cWRtRUh2Q2orb3JrSXVHSmpqRjVhU3dkTjduWWYxcDVMSS9zT3FU?=
 =?utf-8?B?NU52RTkzQjVFSjhKQjdKc3JrQWFURThhZWd0SE5nYk1NamU1cXdJWEgvMjg4?=
 =?utf-8?B?dCtBS2tnNUY0MXU4aFlhUWJzVUtuckxKN29LRVArWlpQS2Q4c3d0N1dGQmx1?=
 =?utf-8?B?Z0hBODgvR3BHNDNmUDkwY1paOWJpY0owc1poQXR4M0ZNZFBYM0pHdkVvd3oz?=
 =?utf-8?B?NkN3bmpOUzdFbi92b0s3ZURkQkg1MU90Smc4Y3poUkQzbEVxWE4zSzA0SmNO?=
 =?utf-8?B?d1hEcVhabUljZEhXYWJpWEFYVVl2OVhZM1poTVIwM0FVcDlFSmdZdkFPYjdz?=
 =?utf-8?B?dU1JbndqUWFGc2lCYkxycTdLYzRGM1BUVjQzZFUzNUxhZUxZSEJ3SEV0Uklh?=
 =?utf-8?B?bHhsVEsyYjdHV3dSc1dtejA4cXhaNmhWbmlRVTZYaXdkaFFESzJ6S0lKTFNM?=
 =?utf-8?B?MkhBVHFFN2Mzcis5OFVJUW1xTG9RcE4vTHBlUkxkVkhUVnVPaU5aWFFDWEZo?=
 =?utf-8?B?UEp0bmVEKzhnN3NWZGU1OU5lNUdjUWZxU2J2dE9oaXRybnZhL0ozMlJVZUFX?=
 =?utf-8?B?MFk2clRtM2dnVXk3ZmxISjNaRUcxNER2MDI0ZjM4NGZNWDNlTWxsdjlNSVhr?=
 =?utf-8?B?T1RiaWx1UXVTbVE1b09qMDlQTnByY1FHMHdOSTBJVjQvMVNPaFRzVEEzK2Za?=
 =?utf-8?B?RFN4emFBTGRIM0NUK040WmI4Q2ZWWTdvQ0sxTk9sc1NEOE1xL2ZKVVgzWHFt?=
 =?utf-8?B?cG40RzlxT2FySExhRG1tQTc3THNtcTF3VFNCTGFMZ2tzTXlSZTVwZ05QTkdX?=
 =?utf-8?B?aE5EcHpVY3hrb0ZxdG9NTGdIaFFNTVUwc25NYjQ0aWVBMHJkR2thRGZyZWZi?=
 =?utf-8?B?blZPY3MrY3B0c3p5bHBGa1gzYWF1TnZtS3Iwa3VBSXltaHVIRjRZMjBIU1BC?=
 =?utf-8?B?ZWlIcm9kcGZmWGdKSXhRRDNTa05QLzRCVzBMcnJXMmRrUlJJeU9tbXR1WWM0?=
 =?utf-8?B?aDh4Tk9lYy9pV0VsT0Ira1dyQTlGMnhvcTJMWEdiL1JYMEVZYnVuTm4xNzRT?=
 =?utf-8?B?VCtFemNSbXh6RUJUNWpudWs1SmQzWXBNUlU1eXNjSkJ6S0psazZmbnNuMUpQ?=
 =?utf-8?B?d2JjUmRRb3VLeGtHMmpCQkkyMVMyZ3djajkwR2JwU1pzOVZMQTlCZGpTOVhx?=
 =?utf-8?B?TUN6VURYa25xdnNRK0cyajdreVVpa3hjYTgxNU1UQWxZSng1TGloZWFiOTJF?=
 =?utf-8?B?cXdXRTRhR0tDRFlLc1hKcDUycC9YOGVGeUgvdWJXNjlJVDduV0pKYmRYTEpk?=
 =?utf-8?B?dkJBUld0RTljUTJWQVRub1JtR1FQN3NiN2dDTGNJS1FuUk9WaU1MZWNjMDZN?=
 =?utf-8?B?OVNYcHg0SndIQitzdzRsQ0pHM2kvMCt2bWtLUnRQRUxVdGFlSVJlM050NG9q?=
 =?utf-8?B?RnZqRDQ1a1hteXdYSTVoVmVxdkMzd1c5NXJic25SbWg4Y0N0d1EzNGxUK2Qv?=
 =?utf-8?B?bXFpYUhvZDNhU21ZRExDRWR5TlB0WENqRXl3ejVHbHI3WlBnRWxXdXJYY3lx?=
 =?utf-8?B?U2ZFTGdsdEJLWm5QdkhYZlJwMC9LZDZaUHhYMW96OVJPQkVlVlJSV1ZQOHVY?=
 =?utf-8?B?UUVnRVY5UEQ4bEV6SXZ3ZEo2QlpzZFlLZXY4ZGo0WVBsZ1I5WWxxcHhJai8w?=
 =?utf-8?B?ckRWOXZuT2JaNlZTaUtQMHJINnk1dG1ERlEwNlBHbTJSWTByRXJSaDArTVhP?=
 =?utf-8?B?YWFiaWZYUWIwZEFHS2NIVUthRnVEdkV4cnRjbCtzUGtMQ3pjSHpSaFJUNW5s?=
 =?utf-8?B?QmNlYWlaV1lURForbUx1Smt2WnQvRTk0NFhrOTNndlNoK1RsWUxIdXRXWmhU?=
 =?utf-8?B?WUs0WUtjMSsvQzNNMGcvWnpaOXhJRnB5ZDl4K0lYVFA2ZnRMTVA0RnpTT0p3?=
 =?utf-8?B?UUVTR2VhT1Ribm9NakN1RG9ZZHE1RDVYOVJyT3FwSTR0OGhyLzQvU2pHVnBC?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9486568-22f7-4e86-2ab6-08dcf9c5a4a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:04:04.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8kXvMsDV5jkh3v5bhjzfrAOJB4bUJOYSEfEoMZwKsd2WLLp0QNWkRtxTLLr7/59QPPL9c33B8SV6vbulK2ptQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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

On Thu, Oct 31, 2024 at 04:17:25PM +0100, Lukasz Laguna wrote:
> For feature enabling and testing purposes, allow to save VF LMEM and CCS
> state and to replace it using debugfs blob file, but only under strict
> debug config.
> 

This patch resembles a function I'm adding to support BO access to and
from a void * for EU debug and general kernel use. Here is a link to the
series [1]. It utilizes the GPU for non-visible VRAM access and large
transfers, or it uses the CPU when possible. It doesn't have CCS
support, but to be honest, I don’t fully understand CCS, so it may be an
omission on my part. Either way, I think we need to synchronize and
develop a common approach for BO access in TTM/Xe, ensuring it meets all
requirements (EU debug, general Xe use, SRIOV, CCS, etc.).

Please note that the version of my series on the list is not 100%
functional, but I can share an updated version that should be fully
tested for non-CCS access.

Matt

[1] https://patchwork.freedesktop.org/series/140200/

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 205 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
>  3 files changed, 292 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 05df4ab3514b..001fc6b585ee 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -422,6 +422,76 @@ static const struct file_operations guc_state_ops = {
>  	.llseek		= default_llseek,
>  };
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf1
> + *      │   │   ├── lmem_state
> + */
> +static ssize_t lmem_state_read(struct file *file, char __user *buf,
> +			       size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	struct xe_gt *gt = extract_gt(parent);
> +	unsigned int vfid = extract_vfid(parent);
> +
> +	return xe_gt_sriov_pf_migration_read_lmem_state(gt, vfid, buf, count, pos);
> +}
> +
> +static ssize_t lmem_state_write(struct file *file, const char __user *buf,
> +				size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	struct xe_gt *gt = extract_gt(parent);
> +	unsigned int vfid = extract_vfid(parent);
> +
> +	return xe_gt_sriov_pf_migration_write_lmem_state(gt, vfid, buf, count, pos);
> +}
> +
> +static const struct file_operations lmem_state_ops = {
> +	.owner		= THIS_MODULE,
> +	.read		= lmem_state_read,
> +	.write		= lmem_state_write,
> +	.llseek		= default_llseek,
> +};
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf1
> + *      │   │   ├── ccs_state
> + */
> +static ssize_t ccs_state_read(struct file *file, char __user *buf,
> +			      size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	struct xe_gt *gt = extract_gt(parent);
> +	unsigned int vfid = extract_vfid(parent);
> +
> +	return xe_gt_sriov_pf_migration_read_ccs_state(gt, vfid, buf, count, pos);
> +}
> +
> +static ssize_t ccs_state_write(struct file *file, const char __user *buf,
> +			       size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	struct xe_gt *gt = extract_gt(parent);
> +	unsigned int vfid = extract_vfid(parent);
> +
> +	return xe_gt_sriov_pf_migration_write_ccs_state(gt, vfid, buf, count, pos);
> +}
> +
> +static const struct file_operations ccs_state_ops = {
> +	.owner		= THIS_MODULE,
> +	.read		= ccs_state_read,
> +	.write		= ccs_state_write,
> +	.llseek		= default_llseek,
> +};
> +
>  /*
>   *      /sys/kernel/debug/dri/0/
>   *      ├── gt0
> @@ -554,6 +624,14 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  			debugfs_create_file("config_blob",
>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>  					    vfdentry, NULL, &config_blob_ops);
> +			if (IS_DGFX(xe)) {
> +				debugfs_create_file("lmem_state",
> +						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
> +						    0600 : 0400, vfdentry, NULL, &lmem_state_ops);
> +				debugfs_create_file("ccs_state",
> +						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
> +						    0600 : 0400, vfdentry, NULL, &ccs_state_ops);
> +			}
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index eca01c96a348..8ff6b7eebb33 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -6,7 +6,9 @@
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_sriov_abi.h"
> +#include "instructions/xe_gpu_commands.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -381,6 +383,209 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  
>  	return ret;
>  }
> +
> +static ssize_t pf_read_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
> +				  char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	size_t lmem_size, chunk_size;
> +	struct xe_bo *smem_bo;
> +	struct dma_fence *fence;
> +	loff_t smem_bo_pos = 0;
> +	ssize_t ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	if (!pf_migration_supported(gt))
> +		return -ENOPKG;
> +
> +	lmem_size = xe_gt_sriov_pf_config_get_lmem(gt, vfid);
> +	if (!lmem_size)
> +		return -ENODATA;
> +
> +	chunk_size = min(count, (ccs ? xe_device_ccs_bytes(xe, lmem_size) : lmem_size) - *pos);
> +	if (!chunk_size)
> +		return 0;
> +
> +	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(chunk_size), ttm_bo_type_kernel,
> +				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +				      XE_BO_FLAG_PINNED);
> +	if (IS_ERR(smem_bo))
> +		return PTR_ERR(smem_bo);
> +
> +	if (ccs)
> +		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, NULL, 0, smem_bo, 0,
> +							   *pos * NUM_BYTES_PER_CCS_BYTE(xe),
> +							   chunk_size * NUM_BYTES_PER_CCS_BYTE(xe));
> +	else
> +		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
> +							   chunk_size);
> +
> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
> +	dma_fence_put(fence);
> +	if (!ret) {
> +		ret = -ETIME;
> +		goto err_smem_bo_put;
> +	}
> +
> +	ret = simple_read_from_buffer(buf, chunk_size, &smem_bo_pos, smem_bo->vmap.vaddr,
> +				      chunk_size);
> +	if (ret > 0) {
> +		if (ret != chunk_size)
> +			xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
> +				ret, chunk_size);
> +		*pos +=	ret;
> +	}
> +
> +err_smem_bo_put:
> +	xe_bo_unpin_map_no_vm(smem_bo);
> +
> +	return ret;
> +}
> +
> +static ssize_t pf_write_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
> +				   const char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *smem_bo;
> +	loff_t smem_bo_pos = 0;
> +	struct dma_fence *fence;
> +	ssize_t ret, err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	if (!pf_migration_supported(gt))
> +		return -ENOPKG;
> +
> +	if (!xe_gt_sriov_pf_config_get_lmem(gt, vfid))
> +		return -ENOPKG;
> +
> +	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(count), ttm_bo_type_kernel,
> +				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +				      XE_BO_FLAG_PINNED);
> +	if (IS_ERR(smem_bo))
> +		return PTR_ERR(smem_bo);
> +
> +	ret = simple_write_to_buffer(smem_bo->vmap.vaddr, count, &smem_bo_pos, buf, count);
> +	if (ret < 0)
> +		goto err_smem_bo_put;
> +	if (ret != count)
> +		xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
> +				ret, count);
> +
> +	if (ccs)
> +		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, NULL, 0, smem_bo, 0,
> +							      *pos * NUM_BYTES_PER_CCS_BYTE(xe),
> +							      ret * NUM_BYTES_PER_CCS_BYTE(xe));
> +	else
> +		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
> +							      ret);
> +
> +	err = dma_fence_wait_timeout(fence, false, 5 * HZ);
> +	dma_fence_put(fence);
> +	if (!err) {
> +		ret = -ETIME;
> +		goto err_smem_bo_put;
> +	}
> +
> +	*pos +=	ret;
> +
> +err_smem_bo_put:
> +	xe_bo_unpin_map_no_vm(smem_bo);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_read_lmem_state() - Read a VF LMEM state.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @buf: the user space buffer to read to
> + * @count: the maximum number of bytes to read
> + * @pos: the current position in the buffer
> + *
> + * This function is for PF only.
> + *
> + * This function reads up to @count bytes from assigned to VF LMEM buffer
> + * object at offset @pos into the user space address starting at @buf.
> + *
> + * Return: the number of bytes read or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
> +						 char __user *buf, size_t count, loff_t *pos)
> +{
> +	return pf_read_lmem_state(gt, vfid, false, buf, count, pos);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_write_lmem_state() - Write a VF LMEM state.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @buf: the user space buffer with VF LMEM state
> + * @count: the maximum number of bytes to write (in bytes)
> + * @pos: the current position in the buffer
> + *
> + * This function is for PF only.
> + *
> + * This function reads @count bytes of the VF LMEM state stored at offset @pos
> + * of the user space buffer @buf and writes it into a assigned to VF LMEM buffer
> + * object.
> + *
> + * Return: the number of bytes used or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
> +						  const char __user *buf, size_t count,
> +						  loff_t *pos)
> +{
> +	return pf_write_lmem_state(gt, vfid, false, buf, count, pos);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_read_ccs_state() - Read a VF CCS state.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @buf: the user space buffer to read to
> + * @count: the maximum number of bytes to read
> + * @pos: the current position in the buffer
> + *
> + * This function is for PF only.
> + *
> + * This function reads up to @count bytes of the VF CCS data at offset @pos
> + * into the user space address starting at @buf.
> + *
> + * Return: the number of bytes read or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
> +						char __user *buf, size_t count, loff_t *pos)
> +{
> +	return pf_read_lmem_state(gt, vfid, true, buf, count, pos);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_write_ccs_state() - Write a VF CCS state.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @buf: the user space buffer with VF CCS state
> + * @count: the maximum number of bytes to write (in bytes)
> + * @pos: the current position in the buffer
> + *
> + * This function is for PF only.
> + *
> + * This function reads @count bytes of the VF CCS state from the user space
> + * address @buf at offset @pos and writes it into a device memory where VF CCS
> + * is stored.
> + *
> + * Return: the number of bytes used or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
> +						 const char __user *buf, size_t count, loff_t *pos)
> +{
> +	return pf_write_lmem_state(gt, vfid, true, buf, count, pos);
> +}
>  #endif /* CONFIG_DEBUG_FS */
>  
>  static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index a4301574d92c..da1b067baf56 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -28,6 +28,15 @@ ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int v
>  						char __user *buf, size_t count, loff_t *pos);
>  ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						 const char __user *buf, size_t count);
> +ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
> +						 char __user *buf, size_t count, loff_t *pos);
> +ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
> +						  const char __user *buf, size_t count,
> +						  loff_t *pos);
> +ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
> +						char __user *buf, size_t count, loff_t *pos);
> +ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
> +						 const char __user *buf, size_t count, loff_t *pos);
>  #endif
>  
>  #endif
> -- 
> 2.40.0
> 
