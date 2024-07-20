Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B602CC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 15:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6310E2AA;
	Sat, 20 Jul 2024 15:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZgEBT44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A799A10E2AA
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721487980; x=1753023980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FvrdtD30sowHOk3AgNZduzlP9e50dw1kF475Aq2aHIQ=;
 b=bZgEBT44jwi9n11iJYWFa0Ma6GZQDd/S4j2+XBOcd5q2xQr7VShsuXEV
 +h0y39HOfcER3NFAWEU7OxXjSPiSunO98U2C6UI5royMyR2Sa6q3IG8l1
 uZ/Lrzm/FnGtSDN1Y2TB7NGAkkdoQd0HJksJk9YLpft+pfwmUmgY+EnOC
 IG2lCY4oSnuUu/w2NnZ9IXntD8z7B0VbllcIc6ES8VqZ1MZ0pPVTx9WyW
 2wlewicBYG+EyN/TG48spPihxjJW9oYxeEgfwadMpO8a9zyNEG581wmUe
 6kLNEY8MgOAU9uzQmlZbAvVncLo+VAKbNTScZn50fbqLeiy5GJiQDT+k5 Q==;
X-CSE-ConnectionGUID: jlFEko+KR3GFuZttRhqQjQ==
X-CSE-MsgGUID: 6CYqGjf3THOkJjaMr87/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19227822"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="19227822"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 08:06:20 -0700
X-CSE-ConnectionGUID: F8yRrj04Qgioi/zWOVuuqQ==
X-CSE-MsgGUID: n9dnXXGYSE21M5wCfbkKvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55954268"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 08:06:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 08:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 08:06:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 08:06:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 08:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nctv//T/T8/cI/3MQ1p6qHVjDvdL+ZAawJJuTKwvURyYqqKlwBKzinhQRS+R+3AWQUvsUopvpKeOPUMBH5iF0xG7cybEZDdo3vJCoOa0O+ojle5G8WgSp5FdroWmWFTQjcEhXycF4YXYG5syex7JvRqjBAPLgCraBiMQWJeoX2tEqSWqgZbo1Ichc/F4+ywqjchfJW3He1OWhac1Myzqs6LZ4T/NxspymSEmMXucKOlK47Wn9hi0JP5pr8QfNZmwAWo2pTOLIV6mDJdKSsoQJ2JThQhlREGfOSZCNpgvVYpvfHEWYI1BGKu0nrP6fa2pkCFaJ0N4zklnTFYgj+JwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvrdtD30sowHOk3AgNZduzlP9e50dw1kF475Aq2aHIQ=;
 b=y11hHw1HtoibSEJ7hGjlwhHP3YWXn8dCILoVYaypa2uwzEE+9va2d56/g24OuNLZHYoyQyl5VKRVmBJeQTSxrcFvJJ0Ja5P/CQ23Qg0Eyt0kfps/dn9b9BKGz+YpKXlYTgO6POlGVnfezXCYuvFsv6z4AEff//m49cjV8M4RXVdqOxIH+MmRiahB6yPi33xoHbgQFCFPdZ6p6/VA18wkjEybxMmIkzmuFZfCvin0zZPaoAcLb2tpXdP8VImbFoFpdFrP3nZWh5J/9vnGXsPy8hRsSwDBB0HQHGJojAVFESH/7fsim10XXyKQSXOEa4GAfP7APbNdGIcxz46dCELNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Sat, 20 Jul
 2024 15:06:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Sat, 20 Jul 2024
 15:06:14 +0000
Date: Sat, 20 Jul 2024 10:06:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Wedge the entire device
Message-ID: <4jmw66whnng7gtbg5vgtmufhjhdlmzvrz5ppxxlvjep6sjsl5k@kgsm5o27kmvp>
References: <20240716060343.1310088-1-matthew.brost@intel.com>
 <iltzke4nifu4uzt4yphxmxxt4lfoq2tklkihdzhuqumqcqoktv@7mkpalgxn4ej>
 <ZprG9fdMQJCw6ctP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZprG9fdMQJCw6ctP@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 28df0ccb-c8b7-4d6e-ebd5-08dca8cd7ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tZjQ2+4FBddK5ks/57M1BmpAp1UluPQiFz2NNsFI0dQarH2mvZ3y72pNajay?=
 =?us-ascii?Q?MijGPsl2ZP+TQvjmaa9WumfDNSRvRawsWOH9FVl9bkE9G1C32qYQRP0sC4Sa?=
 =?us-ascii?Q?dLAA2+KpmBYA6GQBCLqUF4yMrYdQliwN76x6KaQMQZhBqVac4sSdFOaefFaI?=
 =?us-ascii?Q?1wO5cpqWOv8oGUrLdkrGLbfXWo/bmI6Zwy6DG37Hcvtm2a9govH8AbHkhEOG?=
 =?us-ascii?Q?tfE85SRDBzQL+tkyfFYbOuUZS9vTZEv7KK+kipfFllEcFsrgXp+Kee037Tje?=
 =?us-ascii?Q?PO/kNpc6/0itqdhdd5xX2QeF13gqK0pQqViSplCIHuEley3FHrLC605I+tBG?=
 =?us-ascii?Q?0wXNXmbTnp9io2Mdi1Y2+J84pcMEdUiWTv1E8RmT66OGctmMvQJ6uL2r3BTf?=
 =?us-ascii?Q?07XLu6xhYwhesW4urLgeOFCW8wfJ8J1ZqHwmzaHBHQw50/2WdKKfdHCMMpzi?=
 =?us-ascii?Q?Gogoz10NUw0tzzUs2/7PfMgjH8JrSaEf7ioTsRfScDB679NOWg7jrh5ZzyS1?=
 =?us-ascii?Q?OcCaj792Tzyfcx/o17tA4HxoYBhkEJBa0A5h+XA9dGlxk3xxSq+AddXGJ3Fd?=
 =?us-ascii?Q?DRTWpxR7JQDa0T9hl90PMutiiR3V2HAOcggLNFoFgsKw/tJKlMIFunwITKPW?=
 =?us-ascii?Q?fHAoWIPeG93FZYubNxx6LzM3u8WVPw18oMfCT0XRLGE7zRerhPNJK2h1uV96?=
 =?us-ascii?Q?QbYKkW306+bbZElfQwo0dB18z0KRMGebl/xjA2Z93quJQTs0zBlvMop2S2DI?=
 =?us-ascii?Q?mx7WPFtPtcsnWevMQscCMWSlaHze1wvKIKXGpaN0185JkF+mSZSBgmQQA35Z?=
 =?us-ascii?Q?k5DXaHgtU2Qx8VCma+kYHpuGjuCJ0RgoIg1bGOwmH41G+99C5KuT8kvNfmVM?=
 =?us-ascii?Q?PPqNHBr2NQJAUaf+yUy2ozAbt2PViZtg9nqo0iCCETgimXV2b4Jl1wfaFfFS?=
 =?us-ascii?Q?pkuy9YhBaj7ePW0JJ6GjRqqI5DroTCLt3IVyZrqgcjJk5auUuIYvXcceY1dx?=
 =?us-ascii?Q?BMKO6dNCeiUoiM5FC0CP2+LKpbiaanlTmsRcor2G57WSeeAqlPzV8X0cotF2?=
 =?us-ascii?Q?/ZFwwXxHt1Xu8mtTz9LExUVniKZP7TWnYB/YHymAHk6E9KlVdpic/0tQkwF6?=
 =?us-ascii?Q?kCFARYZ+nxZFxLR7k17H/jb85bDdEJk10DKitI8VG35sFCfa2QRdaR0lpURp?=
 =?us-ascii?Q?bpBfMgjKHmQ6HKRnPLYsqXtCzyurxR9KoBUFbzToJ11pSGylaR7gX4MhmnLI?=
 =?us-ascii?Q?39AUZuDK9ppPX2DMQYm/X2ZgRbAuCnn4pr83WUfee3z3fFXDuouWKE1jM0++?=
 =?us-ascii?Q?3IfX9BH7lt6bQUBZZqT4WJqYKRFJS1qtXktlF2qsxdRJnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPUxKF/mTMgeqAuetRywgrh+s7jmlnkG3fe1Phf6QFiAR8eFLzWYXexaOFeA?=
 =?us-ascii?Q?BCd7ocSwCdMOnFsMR1nj0gSknR5f+YYHJM+xLO3HoApn+OqEN0XC+vqxDE+2?=
 =?us-ascii?Q?1FnlLFDOuc1C1EOr/StbIgOvL7GEnkUPqSZR/EUUIXKJIlHFW/jyN+34w87J?=
 =?us-ascii?Q?pTvMWF4pINn1eFWfK12rzDzlPQzAkYBkYBi7sT7F+Y4m+WtGtpBoCwYsJeRB?=
 =?us-ascii?Q?eD2jlTLEjC5z5hyre7JSC1Wuw8zV2E30coklO6PcyUOIibsPBnblCBKu8euF?=
 =?us-ascii?Q?iFka7Peyh6cNLBaTVyG5Gwy5i1eEON1HbOw3Rt7J6WPEjnr0jEy3Sl4u1tP4?=
 =?us-ascii?Q?EJ3sm/9D3kbVfpyh75cVehkmniFjmIYbqv6yPtMqMX1ADQ+YutpOhJhHx+3y?=
 =?us-ascii?Q?yeuC/g674TeLyvj/7y3j6//W654qqIsOjhGKCh1cowkuTb+6R81ovFuGlmbR?=
 =?us-ascii?Q?S2k7H4jRlfPUxIBO7TtAppKGqlUHdvSwKul/sHVSM6lhw26ZnsspxKY0hrb6?=
 =?us-ascii?Q?1Xzmw9rGj+PrLtBrHxQg+fEFdOB7MHlYIZqmuc7g/0634/2RQIPzdT3K/1Ag?=
 =?us-ascii?Q?rwZJn3ePBofZ51jyYxWsC1CRDRXDK9K393XIUkCizImy3AQ34V5xL1tfRhTF?=
 =?us-ascii?Q?PGRFTjkbVjvbqxr/YEJBlOXi65r3BWRiG2Wgz19nqRyO+AaOffmns0j1xOE9?=
 =?us-ascii?Q?Ak7ux+JUrPfLa6D3UP2YZ05aNhKNfXSox0Vy4IPCUm4jGUM5AALs+Ro0CDrh?=
 =?us-ascii?Q?D5CmpV/0pWPV5bEOBT1fCGuNN2aDQXa4R9ehNqfjS+oHmGf1W8JZ0xgcfD2t?=
 =?us-ascii?Q?INPnGmf4sivkfDIyLFwmnJeAnRCYSN+7qekIANgpMPnmpluLNTXaQe9fMf2i?=
 =?us-ascii?Q?WFl30gD7L02/GFAnm6gJa6FT152RWM8uXGbAiuWN+d5OCtRJlkQ9py4XHs5P?=
 =?us-ascii?Q?tzjRDbzzVuFJYbC4EjwtQOmQMk8z3YD/8eygOxaWa+z74Dn2nhCFW6UY/8Fm?=
 =?us-ascii?Q?gHJvmq/R5+t8d+SpIw1XwcG/eOLJ429jg+vvS6l8/oUevj0b1Xr3OzVsJTXM?=
 =?us-ascii?Q?TnVF3JTDZmLgk2yS/mpH4tlWg0BX608sHxmaB8FwdRjfpHst7y+1HhvlwMF2?=
 =?us-ascii?Q?n6r3eSzWWlS/ln03BzL1LSDikQakYWv+53tGBnCMBkOdZx1O3+PLTiA0kp/7?=
 =?us-ascii?Q?I3zy+TV5tx5CyxK21H8tHpcjcPBqJAkqJB+Do6JKYHLCjVQLwYNAT1z6GCaR?=
 =?us-ascii?Q?17SedkI578Q3FURUN885rJXrilVpg4Bt9qbnu54nsDwRUGQ+DT133LrP8047?=
 =?us-ascii?Q?+ouV2R6qMm22vGQ+YCssNwfocI2lK8d9Y+5C9TCKALVKqq3lfKIFeUU8ED2V?=
 =?us-ascii?Q?UXfdkuE/12wvuAPaTrBCfc0dEsoq8/NBiUHao01WTIAs0miC02Dz8usBSazh?=
 =?us-ascii?Q?NMUyKpWewyFKKPzAB6CaUF2CevlInbCXVtrsE+8WhfbjNb3h2GJhX8dE1zdq?=
 =?us-ascii?Q?3tyPgsAyaiazu6vSyU3BNHt0n0k0aDy9gd+hIl/GAI3e+5+kA1n7ERvHGQkn?=
 =?us-ascii?Q?yABMPUKBHwCl7Ctz9RNOANIAhCtGX2qeecs+CWgLQhbum72EgKzn+MgIR0Gs?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28df0ccb-c8b7-4d6e-ebd5-08dca8cd7ff1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 15:06:14.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dbkxi93PrWhVfBEio2s9M/UyPolQo51m3eCvbVmY/KlF2TAbycNwO7QyosJQY7AiQWA480BrfUTKZJwUMnu+QLIKE9rOVLjfFh7K8wuC71E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

On Fri, Jul 19, 2024 at 08:05:09PM GMT, Matthew Brost wrote:
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> but I'd like Rodrigo to also take a look before merging.
>>
>
>I asked him (usually my policy to ping original authors code I modify
>before merging, should really should be everyones policy IMO) and he
>gave me an Ack.
>
>I merged this series this morning before I saw this review.
>
>I guess you have a couple of nits assert usage plus a comment I can do
>in a follow if you like?

yep, works for me

Lucas De Marchi
