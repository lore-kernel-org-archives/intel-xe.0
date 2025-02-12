Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10DC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 18:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF48210E951;
	Wed, 12 Feb 2025 18:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRFL2bMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052E410E951
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739384153; x=1770920153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dWmJOmsYcokJ1m2+xz6WYbfwmOkpfCTyHEqTy4hWTxk=;
 b=PRFL2bMdpOX9nnvQVmIzIEL8BrQZoS9NkRg9yG+M3uYGCi6mRBcBeggI
 6KpDpwK5Fm+PMJPNLAm0hweJfsIBjIkNcFtdibuJdkCMTcj4TIp1zRzX+
 99DmL6V2BySgJf6mvXzHneAZTR3a7pBPEoYqoDzdwKf1H/n7YReCQLhCN
 2JqJVWQKwa/OdBpyOJ3WSlLir+I8Ksy22Q5wLcL9GBEMM/elUL2jM7hL2
 IXsDaWnSXeGeXnLg8Z818a08Tu+ebdpIXmXNjRDqResaD4aZLFnity65f
 wMge0u7JQfbHW7wlKVZG7esR61mx5imeN15Bel2nx+g/rucXp1gSVwZ76 A==;
X-CSE-ConnectionGUID: CIjVlHkuTgmG3D7JVPvHJw==
X-CSE-MsgGUID: 9NJyTObMTemwtwGr5o6v9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27653654"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="27653654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:15:52 -0800
X-CSE-ConnectionGUID: PfLbLtkiQH6uaBe/1D4GDw==
X-CSE-MsgGUID: WNwvm2cFRyO8hlDoa2Sl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118070554"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 10:15:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 10:15:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 10:15:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 10:15:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9qmhfW5QFAYjzgImbxj5y9mojgA3+KAVEGRKMfP+farnm5DOcmVnN26mE1jHkvoDPjropbmayxu81mTTq/WY+HtYe5CnOC8LX15lcvS5CW+a2M/KyFisuMLyCsaaQZkMcfP6th6v1qnwOqq8XOD/2whrg9hUZk/dkVFFaipsvulz3Y8VHUVzYB8liliJEadf0l/MQslRJtQqQOp7ftbBJAU1w3/q5kqTzTXfcN7HBOZABzpyI3aNjaQFC3YLu7e72SQF4hl5IShDpVewMo2ODc4xPGJXIUq4/P4RYNR0h5ZZRHOQZnK/osQDcBSTmf/cpCgsl1kF3YlhM9uAfvK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDej1ReqHn02RAuGNrVdHy3np87zAdVTXjAyy3Kee/E=;
 b=pTsbQam0qMMrcn3q8A7Hoh8z2AW2HwixLg3LfjugHtwK57SsVATpvsljg6Gupo0cbNdA5YHGGk5ns55IpDm5MecaEYwaArOdRVuVZmuKTAxgPc8w0Hs/k6qJEZBVE3NlE4mclqMLuS+2uX2UqozOXlMiTlZzOnLPMBNEqO3Z0+eQRBfq8cx/E5GS1fjfDMx0qq8HkSruQa4Quh/rB9eVkeSf0aidpqXHHLuMfLqH3eMsyUZITD/sKKZRKIBZ82Ab9ajdivV8gFnCDm6ikJRuuxxyXc/VM+l/F+wMDZ6t+iVxC9aEVMgR2AOIY+uP1Ag76o57JmjVlvam4rx5PHRZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 18:15:48 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 18:15:48 +0000
Date: Wed, 12 Feb 2025 13:15:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z6zlUOQkRtA5RI7X@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
 <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com>
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ece5353-c8e6-4039-6067-08dd4b9146b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HMzITxUdGscIox50kuYQwfXuHg+sUkeNbKbWtjXU30KaRrFOpnE8hDFd2ySk?=
 =?us-ascii?Q?p77oyiItUs8kHxaM2bChsph7HLNfG1teWBYxoU7VVCqCILTTTw5viVukfE8f?=
 =?us-ascii?Q?CZNXxx2o3kobBN+YtSC95IS6q56TbFLfuRjCRvIMSx6j37nqFeyfgt/Upipq?=
 =?us-ascii?Q?+amno7fqvrs5feoVJYrwgA7vM7F+4Kckn1NXyCpvhOV0rCQUTpWqBuXLdF7C?=
 =?us-ascii?Q?zzmAtMQsZ0RtSXjeicmVMU+MfD48J6DB02bdxxScLdwgn9YIiCrzqPbV6/2L?=
 =?us-ascii?Q?pxeUOqr3w83pk7yJ3XfNwabpeAi9gcuvwKp1AtveGGY+Nb1PXXzpvNvuIfWK?=
 =?us-ascii?Q?e2FfBTdnTbTgvNmxcqP8/G7U8Us4dczi9Oglv9jQUUYEWMyqqXiBrixjJInj?=
 =?us-ascii?Q?xHe2iW3Z4dEUO31KFe6BPv1gwQ5Bxk31eky0T7vgo5JRtJpGDQdZuZKYERm1?=
 =?us-ascii?Q?FPRMV7Yz4fkHImrd5tRiQlkGru65vu22DuNcGfTtQ7Tqz595s7sMQ0jZr158?=
 =?us-ascii?Q?56JcYvye+xMFMGmoRB7zN0Wq/EpOxwdp+I1eQrM5/2o7r5abKt9+NZOiH+u6?=
 =?us-ascii?Q?zEG3gpdtlWcBLb2A+pRSqq6ZHsc6PNohgQwVb5mfpCyQbUBodVNf6w8pN/YI?=
 =?us-ascii?Q?uQ+2zkW8KlqK6ErHhdseTj/bM5SH6o2CWhLR7YZWCgP7ORVWGmJHApC0T7TL?=
 =?us-ascii?Q?kCBKZR4vouVrIcqc2i3PhiD40p2FScHeUZIVnhzB5JwuB8V7iAgVlpT92Y1M?=
 =?us-ascii?Q?7/pHtDt3BTU8seZKrs3GYHMl8wPlIcbckIoC9aKrpGBhqiutnX32P5271jcM?=
 =?us-ascii?Q?w8DNto1TaVrnLUeTqUYT/5lrx/8RtZ40VUsBsFCBXFXWkk/c7TeLoleu+NXC?=
 =?us-ascii?Q?O04IVUSvAWafE8Xea3vVfoENSxrK2JZZstFjeVvwzXmTbcBz7AvTUktSX+ih?=
 =?us-ascii?Q?YCRGo2fqnURBLsnitshzECzYQWptgYvXpTrK4oHLyCXnBBKj/C5dYH2qkFWf?=
 =?us-ascii?Q?lLhGHf2eemNNxkI2CFNS1d3ZXVuTdWd4N7+/2Lb35CiNUlHBAXf9OjxcXeBE?=
 =?us-ascii?Q?JIhvz3BVntNxvdd5B+9qIhAbt/SPvMohJqZGg5pcYCo642UqGOKP+l8US4Zw?=
 =?us-ascii?Q?oKNXGzC840VyehS5wcplfvQXBkbouOMjkubNoIBL4dqoHJ3TuWVz1ZT/iTMp?=
 =?us-ascii?Q?jgwL0vntB0WSiYNcTbaUXVrA3ggDsE6RIFhx+9FxAk4TWWihotbfoU2oPc0c?=
 =?us-ascii?Q?bGTvEcxHy80rh5vf+dfR4vPF14TPkYw99Kz538c055QcAPdz1hOArbmV79Yh?=
 =?us-ascii?Q?gjhOjH8+GnhsHd9KPDrixYH4p+ggfknRaRS86tcdBo4z/e9SAM7xWPQNtv7a?=
 =?us-ascii?Q?8nWVWs/8RDxMvk0ri98BgFpQNwgs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oWsD0VRcYc4YBKt6xxM3jWo+YPeRM3zpr0XX8VgXtpQf94KrFWs/HSqu1/vs?=
 =?us-ascii?Q?GjVGP1UQK/Xe0l531mWDaxyGLPaeaRFG1Lff4T8d0x/p7vFnSIQTM7BWWbCc?=
 =?us-ascii?Q?UehljJT/vb52hifpFH+gVwqKSD1wPuxV7nijoL5XM7kbYMcwfVmJo+acoRdi?=
 =?us-ascii?Q?JhUF3kRXhgpDX+2zgBfywQuyYvr72TuBSqiV7UTASV83nq2yoLuNM+G7XyLm?=
 =?us-ascii?Q?ytZofYN6V5KEB+1wRqtuY5xYLiy+gIjKowzDzAdi5u1uo88wqTLtI4SepWBl?=
 =?us-ascii?Q?NmHLcYDElScBI6hRs8uoMAgarjsKAU7DTGdwqaH5bRqvPin+3Uo/jbsBQcG/?=
 =?us-ascii?Q?wcYIV7wmLea911u2jxGv4LBEwAS5fL8duOuAtS20vTNA65rx78PzvD4zLUuQ?=
 =?us-ascii?Q?v8GrEHuSJrPDknErApl1+1spMxmp3fwqBwVMwsNdHOIuBRHswd3kx6yqE+m7?=
 =?us-ascii?Q?mxzYGbJC+hZa1RIhYXciI6MVK6wtJAkjcB7eR5l6NQDB3tuX6L4P0t6Psl+6?=
 =?us-ascii?Q?IQJTBhkTYkSoOdnXHr9rg8vUpcN3blzMtEzkOx4tUsMpwSrrnmDf6cjpiz5Q?=
 =?us-ascii?Q?Uc8Atm5qxMvXLW/6E18cv83iGcmVjO3uKxPVUemlBn7HHYidGYtbphCESifB?=
 =?us-ascii?Q?lgbpFCkX/QTPWjNIETWF4X0YMcEXjbJvDnR6gNTb1bGMEZQNLLgeHLUNfUdR?=
 =?us-ascii?Q?BPq3gQgGz8B2c/Q4g4tjW/9Uld+/MHZTzEijBtuOe9dfXayevtdpZEQazr7c?=
 =?us-ascii?Q?Anh8z7zqpnZRnbsbYFAJYOSzfisMelcbyWW2fLie+KxbPbnZ6sYSmSNlJOcz?=
 =?us-ascii?Q?FBNOCUf1Vzc3VqSVI6mlXJL0eNfcYPxcXdCkCORbhaIDMlteZkEFCWQufusi?=
 =?us-ascii?Q?wuEOor7wOQlCKCeRxb9+4p4yFelAAZTcls4xyG5xEM6XsdlVahb1o8wNPkTq?=
 =?us-ascii?Q?ZYgafTGlyCWBh/Nlcw9b1TEgVA5tklLWrKKZF6FF3TIB9EQqq9Bz305RtEfy?=
 =?us-ascii?Q?eB6w3iWHWCvxAv9C/uI95HDHWtNqoJc+NyG+RLuf0XraPGdVcQGeDCoYwyQi?=
 =?us-ascii?Q?Gmk+P4KxEMDBYYl2eso+2Prvrb7HTPsq6s4HU6i34ke0kjfmAiKhtXpA0kZM?=
 =?us-ascii?Q?qODeCahXSr5s9gyI0jyO8I3LjxHk1D/d9+nWpCSgA9VCC37AeTp/FHWKkhyG?=
 =?us-ascii?Q?jy+3m3bpvQS63Re53MPjKpRinuaIW2ybeXnQnwlYe8rdE+JyHYtD+iNPfTy+?=
 =?us-ascii?Q?vxEDDXZ5xYTr59Agu9+Ehj0mqTxMWVCSxrGhMysjQjLDmiBGCnj1CFtf4hmT?=
 =?us-ascii?Q?84SrDZ0S3sKhaTKFJOuMGAyN1HtPqEArEQ/TUKLGCoq/gTQWc/fWWykpQNnO?=
 =?us-ascii?Q?kS6WyY9ztb0PhjccAqjqeCGGwykhhYip0AWpe967uYiwq3WzWfJdiL/JDecJ?=
 =?us-ascii?Q?CbXjxq/3YGmlKur9skXDkEYrFF+8vOMr91LVpVP9T9Pc24FbW6dQQLm9Phl5?=
 =?us-ascii?Q?TskNbs/xnBO8bh2ZpiWoHbqFErH/YbcDknpb3pfh/qD+ANrz5SMrUA0DxLpm?=
 =?us-ascii?Q?e8yYWsmMlkxzJy80nzw3v3eLbAoRg2Rks4qCEs/e/EDlPyWswmgVWWHPrSm2?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ece5353-c8e6-4039-6067-08dd4b9146b5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 18:15:48.7756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMwD8xlCENnoWhBAk5zw6xX6hRp26y05JGpnWDFXhadE2AQO502HtnAgS0g9P5rH3WeRMteBUikgj66CxiiJ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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

On Tue, Feb 11, 2025 at 05:19:14PM -0800, Belgaumkar, Vinay wrote:
> 
> On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
> > In a rare situation of thermal limit during resume, GuC can
> > be slow and run into delays like this:
> > 
> > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> >     		 [status = 0x8002F034, timeouts = 0]
> > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> >     		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> >     		 perf_limit_reasons = 0x1C001000]
> > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > ------------[ cut here ]------------
> > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > 
> > If this happens, this can block entirely the GPU to be used.
> > However, GPU can still be used, although the GT frequencies might be
> > messed up.
> > 
> > Let's report the error, but not block the flow.
> 
> Can we expect other random CI failures due to this? If GT is not getting
> expected frequencies, certain tests which rely on this will likely fail,
> causing a bunch of noise. Is that worse than driver load failing in this
> case?

This issue which I pasted the log above is blocking the resume of the
a LNL laptop. Everything goes blank forcing the user to reboot the
laptop.

I prefer to have to deal with CI noise with bugs that we can work on
than blocking users resume.

But well, we are still waiting one entire extra second there.
That should be more than enough even with the thermal limited
condition there. So, I'm not expecting more bugs than we already
have.

Also, our IGT test cases are prepared to deal with some EAGAIN
returns right? The probe and resume functions are not....

But well, any suggestion here on a more robust approach?
Or can we go with this one?

Thanks,
Rodrigo.

> 
> Thanks,
> 
> Vinay.
> 
> > But, instead of just giving up and moving on, let's re-attempt a wait
> > with a very long second timeout.
> > 
> > v2: Keep the precision comment (Jonathan)
> >      Use a define for the regular SLPC reset timeout.
> > 
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
> >   1 file changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 02409eedb914..3b04b62937eb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -50,6 +50,8 @@
> >   #define LNL_MERT_FREQ_CAP	800
> >   #define BMG_MERT_FREQ_CAP	2133
> > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > +
> >   /**
> >    * DOC: GuC Power Conservation (PC)
> >    *
> > @@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> >   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> >   static int wait_for_pc_state(struct xe_guc_pc *pc,
> > -			     enum slpc_global_state state)
> > +			     enum slpc_global_state state,
> > +			     int timeout_ms)
> >   {
> > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > +	int timeout_us = 1000 * timeout_ms;
> >   	int slept, wait = 10;
> >   	xe_device_assert_mem_access(pc_to_xe(pc));
> > @@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> >   	};
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	/* Blocking here to ensure the results are ready before reading them */
> > @@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> >   	};
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> >   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >   	if (ret)
> >   		goto out;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > -		ret = -EIO;
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS)) {
> > +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> > +			xe_gt_err(gt, "GuC PC Start failed\n");
> > +		/* Although GuC PC failed, do not block the usage of GPU */
> > +		ret = 0;
> >   		goto out;
> >   	}
