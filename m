Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92171D1BDF3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 21:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435AE10E4C5;
	Mon,  4 Nov 2024 21:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8OQYGM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9410E4C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730754135; x=1762290135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FS/5tZSsRX+qtXy6y4VYhTDQTMEqSWJ5kAxKblhab+c=;
 b=V8OQYGM/zPyoMj7qALmHCe/aqdvaPPCXqAb/9j1j1LLYdtGSiFxZc6Sc
 y39A9EoO9qugbJIj4zI4QwvFVsMNcZd5FSSd/sJESEUQI0oELTMJVsNuJ
 xwC7scR4fpTuQP/3Y5h0n+Rx6m9vHf5zSJreFTuTNp4cNffNYw2dCnz2l
 10gKnXUDfwA6vVsfHOtwXhknWmd9gQuUKFx9Bpu3c1F/gn+TIj7g7M1D9
 x00KNzsKP9TVf4cPlpqVnhRjjfPkEoq7ZbLIB3Chzujj8D2AuS2SP2jia
 YUMWFqzJf4UVnHcTQYP2pihq8lTu8ls9Y43GpPmpdAlWvNvQM9VgFwifa A==;
X-CSE-ConnectionGUID: KNiWjNZxQzSdnHtuq/5yyQ==
X-CSE-MsgGUID: c5D6rng2RGqJIiF6syRpTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30584623"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="30584623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:02:14 -0800
X-CSE-ConnectionGUID: roTd65I4Sv6jpOMh/9FjWw==
X-CSE-MsgGUID: yXdfkxPsQ1Oo9kbyxQ9aQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83443910"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:02:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:02:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:02:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCtX01Ffni1usAHYrAISF4pGR7E93Hb7iv18PofG0FOgXVedhY/eBHSpzMOZobNHGXvh/oIBwDCixcgTPmHo/cSx3Lm2QJUMDB7QuWHTChuKW1asbnEhGwMdQ883IpcXLk0sWPSwkQVWNsKaa0XbGMeZTjxdpSRiKl8F73D+Pkp5evklomlB2UN7cgR/oDqnaA9SPaa8uVmjvwtpC0+8c4Hm79jNKsxi2z4xdiLtkTjiOMGTFtse6XqU7iPEV/DfDJNaaAzOT1kQ63K57pm/BjRInttt7dKANKk/x3dzhiDOgpS9DWXkCZ0ivyZHdY3KcibCNUua3lLXHNSniqbVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1q3B/wCtX0E4/IfX48qdFNjDypqoCh7gLpmNB7gBC0=;
 b=ulkBuQC5Jen6GJN/v7lIAk77sVhlmvAPjUnQl19WoFyC3N6dSbB3jz7J6KTfT62O0EiGMnBShjOzDqgjEGyfdfaqmCAsyfGlR0lm5vrvEFVn9QTgwupq4VnWroNrUBTzSboCScSqYM2zmJtiL/+8BB8JG6agThyYeIUxjzwVPcUlyFc7QVOf4IiVU7RRxoJLpj805HgksssszHelFg8f28VX4GY30bq/0/rStcaVskD9QItvEdCGnA3O3MCpfkpzZ77SlNcrcj3rBV0Cz46p7fkNLn26Nn2t1C1Cn5GbHu1iVQbnRd6zIXOSwwAEFQVhJ3IYTrEEvxJddQY6STkrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:01:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 21:01:54 +0000
Date: Mon, 4 Nov 2024 13:02:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Wait on killed exec queues
Message-ID: <Zyk2YX1bk4M6koho@lstrano-desk.jf.intel.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-5-lucas.demarchi@intel.com>
 <Zyj2dFOOqKnTaNPq@lstrano-desk.jf.intel.com>
 <zaabktbnnwhysogfhv72cm3f7i2lecrv3pjjnucwttgab7am5u@76hsjobttcy7>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zaabktbnnwhysogfhv72cm3f7i2lecrv3pjjnucwttgab7am5u@76hsjobttcy7>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f88dd79-4b96-44dc-f1e3-08dcfd13e96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+rL404/Fkyda67yohD5RH02UfkxV6cxH9ta09e+S0KOi8Lv2p2c5QOACE5Pf?=
 =?us-ascii?Q?7eJfP1u890GHkFarZxeyjoHHdbLIrzl4h9PUaErwjpSQlsdFsErqIE1Atc9z?=
 =?us-ascii?Q?Af10/tsUHDw03ttygGVXmUcg9XTbGQf5TqG1+dHUkuybC66ae3qRqR2eSo+o?=
 =?us-ascii?Q?EA6cJVyVcxQ1HjAJ36y0KYJtWXYcyhSN2559DG3OgmveQ7QWqygq3O9hmKer?=
 =?us-ascii?Q?iQmGUl2LEAEIKrePTZmYZgRH0gOibQmBgXd+IDiRo6II7Nk9q3+2eoa1X4Fj?=
 =?us-ascii?Q?g8WYpnF+Zn65H4KZs3empuoqxWhNZaMPLw9pZzR7g+vV+1B9Vpfl9pObFS/8?=
 =?us-ascii?Q?nT+FYqLhz0hZllLlM5fiwAaOrjACx5tBRMlKFDApP3BJ6daEHie0CBmo9mKD?=
 =?us-ascii?Q?KLXKurwv0Wg7eh3PV1RqrCtHW7rBU0KucG10f9rnb2fKZ78Xb3pTKENNkGiW?=
 =?us-ascii?Q?3s0+0PoCmawHXYA4j2c8XpS91eSXsyqQ7oWYI+D9UVd9NfGB2gwoaFv/6nW8?=
 =?us-ascii?Q?KCtOnha7t4+agzEfdBuwKGsJMmAV5bxsxDdhLCbxkC+F/aOp/UTq7k8v9SYn?=
 =?us-ascii?Q?c65TZMmLNjM8F+7XUZbV3tNDk06vWnRQ5tgt1L6sY0+fdp8QGjOslsA0Jgfh?=
 =?us-ascii?Q?GW5pS9PS7EGZIeCliOqbC9x8ylrqpOEKho/nYpWCo9QdXXpACyTo6qV5qoEF?=
 =?us-ascii?Q?LFKhsVDFVs7lZuJAd68GsZJkv79UrTk8eHgccAQDOphEORFTA0snSZl6h046?=
 =?us-ascii?Q?QPtc1CJpq7Ke43Aa7A+e4XIar1pRt3lWy48Z9IpUpc2M26Nf42luTZ1F9tMf?=
 =?us-ascii?Q?o25Xbb2T39IjLKSfw3vcEwqVBmyy9va3zcg+mik/ZvMfTYU2PgnZKc2VaOZw?=
 =?us-ascii?Q?w0YrZoobHsowKVc3bjjWONGKx18gpcj+Vwcsg81zNIDBMyA1Dtph6G1uz9Ne?=
 =?us-ascii?Q?eIJ1Ar/jZ7LC2KArrcsOry6yCAtR4zxWuxKFGY7YAeAleLrPGGaI8DhkuqaD?=
 =?us-ascii?Q?pEP8pa3wHcjrwR6W0vQqzLoHtyjTIx85r2GDMe1dyTvPeH4D59nEw9l84xtW?=
 =?us-ascii?Q?ui5EI2QstUMK8iDoYyxx2v6GJtTZ2i5CijFd22ncGch3lIuyg2M7ig1BG88F?=
 =?us-ascii?Q?wwny6857BwidWvzkGhpkp8r1KZS6yeCgqik0QQG9IPfKdGRfo+BBe62/X7fO?=
 =?us-ascii?Q?y1ecASZnzKeUl2vhJQZ9lfr75iOpbH03QZOgNJWJUihDongl5BXgqEIUcS76?=
 =?us-ascii?Q?Wu9jwXpEtMSsF93qKnhI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKnRQMDBqjpvJ5jHY6gOSHJKwn8s9SzXv5SoWtfLVm1PIMEU7Jq6tsNXbY5F?=
 =?us-ascii?Q?36UG340JYNVHK5LMAbYvcbjMrw9XGBZRmblT2DHqz4hw9wh49EAo6QcCCtUc?=
 =?us-ascii?Q?8fEYoGCG1imF2haO65gigcIAnxy++f2Dfst4rypBp81Km8v5SIw1nIWVxji7?=
 =?us-ascii?Q?RMIAwE3SkTc8lPp5WQCxNgmi/TKFrsZDujOCnqyoyexPojpVMnAcpoe5Zvfy?=
 =?us-ascii?Q?zrxI55H/6Hxr7IVLjty5wH28tQbY+iR2oIgD1N5qVolLX22PCY2sdv+PL87V?=
 =?us-ascii?Q?ouK5g0u/T+pO+KeoSUUVq7NCzjfZkNWqG3W7BAdPmiqJ03pUeFxrey9GWxvB?=
 =?us-ascii?Q?A+DKR3S6i8q8u2FMS/JJWKWFJ4CmvxUaHfD/VuJBXVerv4eI5IVjQkicyKAw?=
 =?us-ascii?Q?4qQQZFzDB7+E3rwbCQtupWH3yZANFVvnzFGdWstBcAxoAT1s82z0p4pXtwBQ?=
 =?us-ascii?Q?dNAC76nZPTuadGOXJof6MspICXY4r3Xx9YPexnWJJ8u0LB2+95Ta1PVsY0cu?=
 =?us-ascii?Q?mCR6I0wWIyS21n9RMoXrD9HIEJSG3823eV8yQlOh7q6qdDqz1oagUcvPywEE?=
 =?us-ascii?Q?x9JbamJijIHoMkZz93wdLSnEIjvSrbUooZniTOx/mD/SqfW6QStMSxAaC4rp?=
 =?us-ascii?Q?Aa9YXVzWJVRHJCs46+tiCvGTIoTjbRHxBAan55a7k5sGdR9kZQapd8dQoRGm?=
 =?us-ascii?Q?z65ZAoGYx7cNdWsAHvrwPHUoL2RtHlarP0zSK9Plxr5LDl/R7s39ZYCBzSW4?=
 =?us-ascii?Q?kQqo1YPWpWFuCcJd7F05KRuwe4y76ybY6KXO+6yF4/xIWfQKvng/pNJDhFJp?=
 =?us-ascii?Q?j2tpzop0vF6zkOzSAiIcG7iTIbeuUSaEnOWTtkVLpBjEsnH+iB0HWt1BE68A?=
 =?us-ascii?Q?iGzTt8pzPJHfR3XD4DNGBKchv2qRG8dFvsNacVleAHaqiLS82IqoDl7hEUBr?=
 =?us-ascii?Q?0Zpjg41QS55mNNdtmnPUBg2yndUwQF4FcEhDRRyBg9qwJXDYELfN/gJKEqEt?=
 =?us-ascii?Q?U5TIXm3rbEcSCw14XnEW5m6yKBdjNO2V3MI1u19rp+/TSHw7/lVR4Jec0ILR?=
 =?us-ascii?Q?2HC+LC6MfG+h4fEQFXzGvRJVRMZ8+/tnCKtBu3hMZs/+QnoCf2cupLH+AzzJ?=
 =?us-ascii?Q?JHlCe/L0VIkb0BV6CGWg+cwhdCw7ft6CA1xEWI0VHfC3V2uW/IEn5c68t1tG?=
 =?us-ascii?Q?WsfV4ftWM2fuPjEygco3zctCyKfAdJgoqP1rsyYIgpeN8BUNbxnbKFkDlpkT?=
 =?us-ascii?Q?T50BPBLtOKt9/pAOTZdDRH817V01hcADYY2s2c0xbYl3t/9y362FhVhqjgVz?=
 =?us-ascii?Q?Vf03+/RXau23AVzspP7lc14PRKLhI+MyvEoT8o9Fa7gAWeiBppJb1P+Cjxdt?=
 =?us-ascii?Q?atnZofI1ser/dztHJ2lZWjDu/5vCpQ6Q6VmF9vUiUI8EVeliA1U4Pf9Qy7D1?=
 =?us-ascii?Q?M26UT/13KSYtR6X+CZYWCc2v3mKViL6gqp5+p4zRdS+//8uDQkTk49ix+1rk?=
 =?us-ascii?Q?+b1K7BM4KI/toN/dmmseCxv+R129sJOyx5SFwh70uC1HRDeCBCQuQwFzbK4X?=
 =?us-ascii?Q?UTJDSBG81LRYHLAmrqpV1lXdqlcf2cPjdFVCk/eFeaRulk5B3174whafquxe?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f88dd79-4b96-44dc-f1e3-08dcfd13e96f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:01:54.4348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GpW0qmfHG44cZpqMY2ZulgDjb3RvVii79CJI/yiaAqMwTFkwXQheVfNyhXbovefMRul1pkkv2tOtdwiKtBw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Mon, Nov 04, 2024 at 11:54:04AM -0600, Lucas De Marchi wrote:
> On Mon, Nov 04, 2024 at 08:29:40AM -0800, Matthew Brost wrote:
> > On Mon, Nov 04, 2024 at 06:38:14AM -0800, Lucas De Marchi wrote:
> > > When an exec queue is killed it triggers an async process of asking the
> > > GuC to schedule the context out. The timestamp in the context image is
> > > only updated when this process completes. In case a userspace process
> > > kills an exec and tries to read the timestamp, it may not get an updated
> > > runtime.
> > > 
> > > Add synchronization between the process reading the fdinfo and the exec
> > > queue being killed. After reading all the timestamps, wait on exec
> > > queues in the process of being killed. When that wait is over,
> > > xe_exec_queue_fini() was already called and updated the timestamps.
> > > 
> > > v2: Do not update pending_removal before validating user args
> > >     (Matthew Auld)
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
> > >  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 6 ++++++
> > >  3 files changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index cb193234c7eca..ed6b34d4a8030 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -605,6 +605,11 @@ struct xe_file {
> > >  		 * which does things while being held.
> > >  		 */
> > >  		struct mutex lock;
> > > +		/**
> > > +		 * @exec_queue.pending_removal: items pending to be removed to
> > > +		 * synchronize GPU state update with ongoing query.
> > > +		 */
> > > +		atomic_t pending_removal;
> > 
> > Would the interface in 'linux/completion.h' be better here?
> 
> I think it'd be counter-intuitive in this context
> 
> 1) most of the time it's "done" rather than "pending", which is the opposite
> of the completion interface - note that you can't call complete_all()
>    multiple times
> 
> 2) we'd still need a counter to support multiple queues being killed if
>    we keep it on xef. Imagine userspace did:
> 
>    	for q in queues:
> 		ioctl_wrapper(fd, DRM_XE_EXEC_QUEUE_DESTROY, ...)
> 
> Not clear how you'd do the complete_all() thought. Could probably be
> more easily done if the completion was in the exec_queue, but the task
> reading the fdinfo doesn't have access since it's removed from the array
> 

Ah. When I briefly looked at this, I missed this was a per device
counter rather than per exec queue counter. My suugestion was based on
adding a completion to the exec queue which I see your point of not
being available in show_run_ticks after DRM_XE_EXEC_QUEUE_DESTROY.

> did you have a different way to integrate the complete in mind?
> 

Not really. I can't say I love a global counter / wait but can't
really think of anything else. The wait is outside of holding any
locks, right? Seems fine then.

I guess my only question is do we even care if races and is a little
inaccurate? If the answer is, not a big deal if stats are slightly off
then maybe drop the patch. Up to you. Don't consider any of these
comments as blocking.

Matt

> after writing this I'm thinking the wait could be the first thing when
> reading the fdinfo, even before  taking the force wake. That would
> synchronize well with the scenarion in which it's the same task doing
> the destroy/read-fdinfo and for others it wouldn't really matter.
> 
> Lucas De Marchi
