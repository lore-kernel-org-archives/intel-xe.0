Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EB5109E522
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 22:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480610E128;
	Wed, 25 Mar 2026 22:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDc5N/i+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E8C10E128
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774476040; x=1806012040;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6AeTg/f0KiG4n9Zf8LPoiOJIg8mpqmNLpIcLTVh/WYo=;
 b=fDc5N/i+obIkQynzJ4QEZp65YmSlZlpTbanDADSDCFbveTYgnXG8AXTq
 uaEpx1XnU25h7NXbmrcFVzATNtuUZTA4jNa8AGZP2S+8Dmpb7Bs2UE8/M
 imHkEUsLqr83zl6mT4lD6NGuTwIrn4IAORcoGjI54eN0zYlKb4eyC255z
 kpPTchhpXctTvSY+g4U8v3LVYdeSWaQd+RUMWf2Gixjk+ULqQuzP0h7Ek
 lm+pPlMg5K1LqGCyhoggJlB1qUqsR/LhRniu2UMATNYo2ZgYclaMAZj2L
 t1fBXq571yT2ICBxZ42ygU1cjZFg7wmXUsWFzktSmi+A/1IJYejpl1kIf A==;
X-CSE-ConnectionGUID: oVR5IxK2RLGEewKQ6436NA==
X-CSE-MsgGUID: pvMTYWn2TI2f4GnQtnszpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74555295"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="74555295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 15:00:40 -0700
X-CSE-ConnectionGUID: X/mtOBV5RduskFk8TodrVA==
X-CSE-MsgGUID: wmJiZRhtT86sgBwn4HweCw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 15:00:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 15:00:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 15:00:39 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 15:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiYW2ELhCiIXMkZcP5k3ES5ZkoIIm5h0Buh9yQaN7PD559A6xD9nuq1bqMxJwvEvQw5zpm24GLrTRy0X+Bp3FHAsX9Q2WAbDrhBt8iGfIDEmTXyxiZHyvEZfwMCi2k8DKZZSPMqbUlqK0eG37/bJyYUhh83iedjoT8tyGALErZoSU4uqOXfaDHOusMWjia+kFHYaz6G5UVfI3lQHBAu6B/loWd0SSv4iKLsS8XvEuAZr+RRWL+4+O87MwRjc/XZyKmvseI5brdKOicMObzNBTRdtSY7sScV/X6pyez3KzhaszqqpGKyxcbjoZsgaiibrVZojTFAzhfSyu/Olh19NGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3naIulo62WdZZqpGj1Vyc6QEfAFP7mVzC5akdTf9U0=;
 b=AjVqjVS/1ysYGh2D3WzwRr30RyzMXi3/quqocJH8Z+idq+q+cN14XzWzg5CllbRKDjqpfN3pLNrfh0Ot91XdaK/WJHQ8BUume5ImeFbAdkxW0D71+3elyoxGQAalWk15WZwVjBPwZTT8P8BsrY/yYj7K3ceqHDo4pYkd4htH303NAp69P/lgNAVu1u3CogM+ryEgTwrjicqAWZZvkxFhL1Ybv+5XRW4sQhLupzi5U4Y0SbVf/tXA0Wk6T4DmyIZOTpbXc76USAmt1cDd+BrEIXe+g33mTwHd9g+VLQA3oORPiJaA9bEPnGrpZplz0nMskTfmb812Ck6dAq1Nv4EeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 25 Mar
 2026 22:00:29 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 22:00:29 +0000
Date: Wed, 25 Mar 2026 15:00:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acRa+iGbsAqAjjYY@gsse-cloud1>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
 <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
 <acL7D7MVf5F32C++@lstrano-desk.jf.intel.com>
 <b253dfa6eb00aaa61f57d7c9694fec3fea68b79f.camel@intel.com>
 <acMf8wr1wfHoRoWE@lstrano-desk.jf.intel.com>
 <702f79d4601bcf9dce128fe47422f24d830ffe6f.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <702f79d4601bcf9dce128fe47422f24d830ffe6f.camel@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: f64d9d4b-2242-4309-dabd-08de8ab9ed4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 4W0UUFvYUUgUwBWNpwrxhuHu+RKaTP+MIzJGsZwpIGa9SyGZuODOlv+zZCt3MtqaoBxqyavYC83OHfHMYjU+6xNCpCKLrh4a3PifqGmlLYGEl0gLtpQhVYHB21x7BDFyBYCN2vF+c4UetEuOTen9KRwVQhqP8kiIaiKw+RlCuRQ6z4hfeHagzQiKcfSc+EBlfNk0ehxMKXg/LP+wjTyW7B140PH2o7k545xibOu/7NhSvVlK1L+zK+8PRysZP2H2o0ppWhaxCmFVMlhQ46sp516LjcLDTGvyYFvDY8FCCBeSv7+g9C0RC/7qxzZhURoo/+r6crdaq8KzuYW4wjQ6PInxglvxadGrIwymtCQVlbseJWLAgCyDvWgpJ7cHupzYaovSFke7UPBvjDC5yOdjANVEhiKc8tfO4I3e7Q+o2ol7B3Abm7jUOipw3z77ORz+C7uGTyN88Ir2tbUwg5lYiDLTYFsEftIcum+K4pWJ90Mdujib1ZeGD1dEjT65OreFFRPQ4knuz00SxaPM7yT3UlRG4d1uUb+rBZin4HYur+LnehmxyuGGzHPiWz1s3Y9j1ZiMqohjkloDrC1XwXGRp3+42jO00HZmtierIOzc7TZVznQ6M5sgvThHC9XKe6YsQtNZUIwjSNlVbyBsjemsc39p61Clp7vbvqQ66IitwUGujc9Rz2hb7rlCvhYT1qDb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmNlYmNDT0hUMERFekRmNmJwOVBoVGJncTBKNWE2R1FMU1Vlc2ZJU1IyZWto?=
 =?utf-8?B?Qk96ZHRLVEdKaVdRWXFPeEs2UUtFMUptS2dORmhwTW0xcmRFZGl0OWw3UkdV?=
 =?utf-8?B?L0FjWWJoVEdUT0ZvR3Z2Mkx0TWtITjcwUXBaZ2dRRmgxT3JWQzI0YkI5aHFL?=
 =?utf-8?B?UFVweFliNDBMaG5lMEQ0am5NWXJPc1hLWFNoREJIL09rNjZlcUt4eWwyQWpG?=
 =?utf-8?B?azM4dHdzbU9XbUpTN3JuT1VMbC9QY3RaRnd0TTZQallXTGsyZy9kaC81MEZr?=
 =?utf-8?B?bWJqMVNEdG5VUHhSWVNxMVBpc0RMRVI0N2VxYmVvbitKeHo2cnMwUWNTQWNE?=
 =?utf-8?B?eDRzeHNOejJwaldpblc3elpDZWtpRllHVVBBN2pqMWpnVk54alpCdkwyamd3?=
 =?utf-8?B?aXF5ckN3cEtUb0M4b0Rqc0MxcmRUN2pxTHFSM3doOTJVc0U3NnRuV0hITk9k?=
 =?utf-8?B?dDJodGNpQWdXaEZZcmxzblV3RUpCMFBXU24zdWRPVGRUZk1ISXpSMmxORnpz?=
 =?utf-8?B?Q0pCVzEzLytHc3NNaE9lb2pZcXljVlZjYU1aZkFlZFo5N3diUmNOSUdhVjhD?=
 =?utf-8?B?OXhkMC9sTlpvSDNsd1hXcnRQUUlHOWJvYlBDMG5qN0tDSUZyQ1VKY3IrMjRm?=
 =?utf-8?B?dno2Zk0xNTVNSyt1aXE4K2l1UC9nM1FFWDdSd2RvalB0eEJuQWt5eFlsZ2J2?=
 =?utf-8?B?Y0RHTTNKZ2FyRE9vdW9KOU83TzZxQk4zYlIxZ3pHaFFodGtxdzU0N1pLOUQz?=
 =?utf-8?B?b2ZuRXBOZHVWNEtPVmFmK0VXOVI1SXY0RWFpZVFBNDh1N09UaEV3V3M4Qllr?=
 =?utf-8?B?SEFsaEdMb1RhOWlQMi81ay9tWUNWcGJXY1E1emkybnlmOVhCcEhZTEN5TDA2?=
 =?utf-8?B?N1BYMWQyeTJXdEpTKzlwSVB1dEZ5aTdHRzA5Rm1XSXRyYW5BQ05TRzJOdmhH?=
 =?utf-8?B?aUMzMEUxZloyeTNOT0RHdzVDcFUvNXhOR1h0Vko0K25vOXBFVlJxNWdYRkJO?=
 =?utf-8?B?UmJkYnpVd01WVkhDTjIwVE9nMWE1QXFoRWRPRE9vajV0MHFZbXNVRStKRWZy?=
 =?utf-8?B?QzFoWkhFZlVMQ2JLcjN4TzIxR1h4aXd0SlVYZGlMWllGbUlnMXNLVEVvV0ZU?=
 =?utf-8?B?Q3JDd25PUVlYM2d5em5vRVZJWnZvUVFRcEk5RTNWdWIrc2RrVHhhRHd2RVVm?=
 =?utf-8?B?TUNSUXQzVTlUQldrNDI5OFFrM2EyZHZJU2RkZUIrTUw4ajZ5b1R4NVpJQ1Vn?=
 =?utf-8?B?VUtHT2pSVXRvdU9VT2lmSkxDUjVXYmhCNWVESEUzU0hBend6OVZ2ZGU2MllJ?=
 =?utf-8?B?MTNxeGZ0M2h3RmdhaDZiWTk4RnFuVitDQ2VzWUZXZFdTQUQwb0VDSWhNZG5F?=
 =?utf-8?B?OFpvVzNtbDgyMWdYekE0eDZhNjNWYkZkQkxkcWYvNGRYY0hmZFBMdDMyMHB6?=
 =?utf-8?B?bmxKTkI1amFranZ3WEd1WlVUSTJwaDN0ZWh0TmhYczd4SHEwdHV0Skw1SWVP?=
 =?utf-8?B?bTlrc1RuTXF0L3NMLzh0RDRrUmFaaGlYV1NpT0VNeDRNSWJOS2dGTzZ2WWhP?=
 =?utf-8?B?QXBxWmk0VVUyV2t0K2dUYUNsbFhHdFk1dmpMN0Yzcmg5RFZGd0hUOWkydERn?=
 =?utf-8?B?MHZPc0VOd01wdDErL2RxVzNTSnhNWlJFRzBwVkFjTDVvcElkazNZclpZRnBL?=
 =?utf-8?B?ZW02UC9WMHk3SXdWWUJzK0phUUFmN1R1T2FuTjZlaTdDd0NXelVYMjVSUXlx?=
 =?utf-8?B?bWc4KzR6S1VYVXRjdDhxRTFrRkluWk5wdmNIbm4wZk5ibng2YWwrUTB6UE5z?=
 =?utf-8?B?RzlUdkVhK1hNMlpDVWx5UU43S05XeGh0Z3A1ZmV1RWVkSVhZOHRHQ2lnQmNT?=
 =?utf-8?B?TUdNZ1NMV0xvQ1pBWGRVeWhzNHlkL0p6T0krNEUvVXhiem9RQ09yNUtyWGRD?=
 =?utf-8?B?YURKS1I4REhMT2hjeGU2bkYrdnVQYW9tYmRwKzAvT3FGQTZoVlZBOVpkMzJy?=
 =?utf-8?B?WHFFUXJKRmZLTDRvTkc3b3BJby8yMUV3UlBDVzZlNnJKb1I3aC9ndzk5K1JM?=
 =?utf-8?B?WlFOUlVlTkZQRjg1akhKQllVdFRJemtoVzhPaUhreG8raGEzak40UnIvRTNm?=
 =?utf-8?B?VWNpQWJzbkZyMjF1Y2tSMTJGNmdUSjE3MU5FT1NuVEhrS081K1M2bUdtQTRD?=
 =?utf-8?B?KzhFNEdKMzFISFpoVEV6STFKV1ZOcG5MUGZ4V3NlMWlBRjcrOHdPcGNmMUlR?=
 =?utf-8?B?NlZ3NDNkbEJ0UFR6ZzYzUnN2dDRHQVVGM0EzeExsOHNnakJ2MFpmRGJ3b1Fs?=
 =?utf-8?B?RUFhdmRVKzJnRUhMREZGM3hVNXVCSWkvQlVKd1NTR2VjNTA4YU9EL0dmdE1V?=
 =?utf-8?Q?GlRuG/sryXw8jqYY=3D?=
X-Exchange-RoutingPolicyChecked: qNxiDd1ig7f5xrKYuMqYjL0JjvzDvjiUqaWcdI6crVJi13URioy9Fty6yvpHhdnB6phddIHCu0FIMxFXpALcfMjH/R8rixvcCoR7IaM5SSyO9leexQ2wD5tNK7mdcNSgFWCBJyQ0esl3Jno4plFDghBX0RX2AhgfXW0rqI5IWlDqvrbLm255Tn5D0H1m6LA5PQuU1gLuVkXBKdhhT3mJZo2KZ2S4ij1X0vPsf2xbHEjzfeUiU7o5NKnrLBSc7XR48DScf65HBw/Q4f4RPzRFga9f+3JZOyhtIDyfi9fpv0dkG6zjOS5eLsZ6+rCP7Jr5Oroi8o1MP2gfgUzvTM82kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f64d9d4b-2242-4309-dabd-08de8ab9ed4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 22:00:29.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPUsOBahkSfO7hNZT/iqXjlXxmLmdAAFx2l2CJbYjPZOKPCZSZqgGhbbpCbCGnZ+kKFtih7JaA/a2dNxNfcfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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

On Wed, Mar 25, 2026 at 12:37:18PM -0600, Summers, Stuart wrote:
> On Tue, 2026-03-24 at 16:36 -0700, Matthew Brost wrote:
> > On Tue, Mar 24, 2026 at 03:10:41PM -0600, Summers, Stuart wrote:
> > > On Tue, 2026-03-24 at 13:58 -0700, Matthew Brost wrote:
> > > > On Tue, Mar 24, 2026 at 01:53:27PM -0700, Matthew Brost wrote:
> > > > > On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei wrote:
> > > > > > > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers, Stuart
> > > > > > > wrote:
> > > > > > > > On Tue, 2026-03-17 at 16:21 -0700,
> > > > > > > > fei.yang@intel.com wrote:
> > > > > > > > > From: Fei Yang <fei.yang@intel.com>
> > > > > > > > > 
> > > > > > > > > Hardware requires the software to poll the valid bit
> > > > > > > > > and
> > > > > > > > > make sure
> > > > > > > > > it's cleared before issuing a new TLB invalidation
> > > > > > > > > request.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15
> > > > > > > > > +++++++++++++++
> > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > index ced58f46f846..4c2f87db3167 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > @@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct
> > > > > > > > > xe_tlb_inval
> > > > > > > > > *tlb_inval, u32 seqno)
> > > > > > > > >         struct xe_guc *guc = tlb_inval->private;
> > > > > > > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > > > > > >         struct xe_device *xe = guc_to_xe(guc);
> > > > > > > > > +       int ret;
> > > > > > > > > 
> > > > > > > > >         /*
> > > > > > > > >          * Returning -ECANCELED in this function is
> > > > > > > > > squashed at the
> > > > > > > > > caller and @@ -85,11 +86,25 @@ static int
> > > > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > > > xe_tlb_inval *tlb_inval, u32 seqno)
> > > > > > > > > 
> > > > > > > > >                 CLASS(xe_force_wake,
> > > > > > > > > fw_ref)(gt_to_fw(gt),
> > > > > > > > > XE_FW_GT);
> > > > > > > > >                 if (xe->info.platform == XE_PVC ||
> > > > > > > > > GRAPHICS_VER(xe)
> > > > > > > > > > = 20) {
> > > > > > > > > +                       /* Wait 1-second for the valid
> > > > > > > > > bit
> > > > > > > > > to be
> > > > > > > > > cleared */
> > > > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > > > PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> > > > > > > > > +                                            0, 1000 *
> > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > NULL, false);
> > > > > > > > > +                       if (ret) {
> > > > > > > > > +                               pr_info("TLB INVAL
> > > > > > > > > cancelled due to
> > > > > > > > > uncleared valid bit\n");
> > > > > > > > > +                               return -ECANCELED;
> > > > > > > > > +                       }
> > > > > > > > 
> > > > > > > > Is there a reason we aren't waiting after the write to
> > > > > > > > make
> > > > > > > > sure the
> > > > > > > > invalidation completed? It seems like we should be
> > > > > > > > serializing these
> > > > > > > > and at least making sure hardware completes the request
> > > > > > > > rather than
> > > > > > > > just sending and hoping for the best.
> > > > > > > 
> > > > > > > Yes, this is correct—we should after wait issue *if* this
> > > > > > > code
> > > > > > > is actually needed.
> > > > > > 
> > > > > > No, the issue is that software cannot issue another TLB
> > > > > > invalidation request while the ongoing
> > > > > > one has not been completed yet. Otherwise the hardware could
> > > > > > potentially lockup.
> > > > > > So we need to make sure the valid bit is cleared before
> > > > > > issuing
> > > > > > another TLB invalidation request.
> > > > > > 
> > > > > 
> > > > > Yes, but we signal the TLB invalidation fence as complete
> > > > > without
> > > > > waiting for the hardware to actually finish. The locking here
> > > > > is
> > > > > also
> > > > > incorrect for MMIO-based invalidations, now that I think about
> > > > > it.
> > > > > What
> > > > > really needs to happen is:
> > > > > 
> > > > 
> > > > Ah, this actually another weird corner where we take down the CTs
> > > > but
> > > > GuC is still using the GAM port...
> > > > 
> > > > > - In send_tlb_inval_ggtt(), if the MMIO path is taken, acquire
> > > > > a
> > > > > per-GT
> > > > >   MMIO TLB invalidation lock after obtaining the FW
> > > > 
> > > > So maybe 'Wait for the valid bit to clear' here too but this
> > > > still
> > > > isn't
> > > > fully hardend as the GuC could immediately use the GAM port
> > > > again...
> > > > 
> > > > Or perhaps we go straight to my suggestion below - when reloading
> > > > the
> > > > GuC issue MMIO GT invalidation...
> > > 
> > > I feel like we really should be avoiding these MMIO based
> > > invalidations
> > > wherever possible. It creates a lot of race conditions like what
> > > you
> > > suggested or even parallel invalidation between the GuC and KMD
> > > while
> > > we're tearing down (KMD lock might not be able to guarantee the GuC
> > > isn't still invalidating).
> > > 
> > 
> > My guess is the issue calling xe_managed_bo_reinit_in_vram on some
> > BOs -
> > the GGTT don't get invalidated GuC side and it reloads with stale
> > GGTTs.
> > 
> > > Can we instead rely more heavily on the GT reset to flush the TLBs
> > > for
> > 
> > We likely need a MMIO invalidate whenever doing PM resume events too
> > as memory can move without PM refs (CTs go down when PM ref == 0) if
> > I'm
> > not mistaken...
> 
> But we already do a GT reset in that case right? So this should be
> covered?
> 

D3hot doesn't perform a GT reset or enter D3cold. However, looking at
xe_ggtt.c, GGTT invalidations always hold a PM reference, so the CT
should remain live unless a GT reset is in progress.

Therefore, the only two cases where we might need MMIO invalidations
are:

- During initial driver load, after we call xe_managed_bo_reinit_in_vram
  on some buffers used during the hwconfig GuC load phase, and then move
  the memory while retaining the same GGTT addresses.

- During a GT reset, where memory is allowed to move around. Likely do
  this step before reloading the GuC.

> > 
> > I'd also like the GAM port interaction broken out in component like
> > xe_gam_port.c (with a dedicated lock) in this seires [1] albiet way
> > simplier as we only need GGTT invalidates at this time.
> 
> I'd still like to push we find a way to completely remove the MMIO
> invalidation from the driver and rely on either the resets or GuC based
> invalidation prior to teardowns if at all possible.
> 

I agree MMIO TLB invalidations have no place xe_guc_tlb_inval.c.

Matt

> I hadn't seen your other patch yet though. I'll take a look as soon as
> I have time.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1
> > 
> > > us? And for the GuC memory specifically, maybe we do a full
> > > invalidation after quiescing the GuC during hwconfig load (the
> > > first
> > > time we load the GuC during driver load) and before any kind of
> > > reload/reset?
> > > 
> > > We'd still need to cover the case where hardware is fully hung up
> > > and
> > > GuC isn't responding, but then I don't know that we really care
> > > about
> > > MMIO based invalidations since we'll want to fully reset the GT
> > > there
> > > too.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > - Issue the TLB invalidation
> > > > > - Wait for the valid bit to clear
> > > > > - Release the GT MMIO TLB invalidation lock
> > > > > 
> > > > > Without this lock, two threads could both observe the valid bit
> > > > > clearing
> > > > > and then both attempt to issue invalidations, clobbering each
> > > > > other.
> > > > > 
> > > > > > > This is early Xe code from me, and it’s questionable
> > > > > > > whether
> > > > > > > it’s even required.
> > > > > > 
> > > > > > This seems to be required, otherwise modprobe would fail at
> > > > > > golden context submission,
> > > > > > [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0: GT0: hwe
> > > > > > ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> > > > > > 
> > > > > 
> > > > > I’m somewhat surprised by this. A better solution might be to
> > > > > drop
> > > > > the
> > > > > MMIO GT invalidation code in xe_guc_tlb_inval.c and instead
> > > > > issue
> > > > > an
> > > > > MMIO GGTT invalidation whenever we reload the GuC.
> > > > > 
> > > > > We can defer trying this until later, as it is a riskier
> > > > > change.
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > > Typically, if the CTs are not live, the GuC isn’t doing
> > > > > > > anything meaningful in terms of
> > > > > > > referencing memory that the KMD is moving around (which
> > > > > > > would
> > > > > > > require an invalidation).
> > > > > > > So this entire flow of issuing a GAM port TLB invalidation
> > > > > > > is,
> > > > > > > again, questionable.
> > > > > > > 
> > > > > > > So I'd suggest move the wait after issue, plus throw in:
> > > > > > > 
> > > > > > > “XXX: Why do we need to invalidate GGTT memory when the CTs
> > > > > > > are
> > > > > > > not live? This suggests
> > > > > > > the GuC is still in the load phase. Investigate and remove
> > > > > > > this
> > > > > > > code once confirmed.'
> > > > > > 
> > > > > > The issue is a consequence of an earlier failure which caused
> > > > > > the
> > > > > > CT to be disabled. And the KMD
> > > > > > sees a bunch of TLB invalidation timeouts.
> > > > > > At this time I would expect a GT reset, but that is not how
> > > > > > Xe
> > > > > > behaves (the ole i915 driver triggers
> > > > > > a GT reset on TLB invalidation timeout if I remember
> > > > > > correctly)
> > > > > > 
> > > > > > -Fei
> > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stuart
> > > > > > > > 
> > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > > > > 
> > > > > > > > > PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > > > 
> > > > > > > > > PVC_GUC_TLB_INV_DESC0_VALID);
> > > > > > > > >                 } else {
> > > > > > > > > +                       /* Wait 1-second for the valid
> > > > > > > > > bit
> > > > > > > > > to be
> > > > > > > > > cleared */
> > > > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > > GUC_TLB_INV_CR_INVALIDATE,
> > > > > > > > > +                                            0, 1000 *
> > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > NULL, false);
> > > > > > > > > +                       if (ret) {
> > > > > > > > > +                               pr_info("TLB INVAL
> > > > > > > > > cancelled due to
> > > > > > > > > uncleared valid bit\n");
> > > > > > > > > +                               return -ECANCELED;
> > > > > > > > > +                       }
> > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > >                                        
> > > > > > > > > GUC_TLB_INV_CR_INVALIDATE);
> > > > > > > > >                 }
> > > > > > > > 
> > > 
> 
