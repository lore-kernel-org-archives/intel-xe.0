Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D6FD3E779
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8C310E0F9;
	Tue,  5 Nov 2024 22:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EvYr6PZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1D810E0F9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 22:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730846167; x=1762382167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qJMFjKIqI70HXbUNFh4D+wl7a89UxV6iECN6VBqpFfs=;
 b=EvYr6PZ9BsWCl6G85wuLWC2NcC9S6kQvQr4QMo1mmwRtYLcPqT6GZ4L3
 x/kDBHLjvDRWAsnhP2PICFOToK6on2snjoUIC47UhU8hprfC+L+FAPxgD
 ScpfykGelf81IlsgPXALldBIat1qZowe2e3OG0D9HgAggJbQO4Y/XWBxI
 hequuUdPDuOxUQcfym2gO5aNKWw+y3eobhNoT8Zzmryr9Rz61c6fMwJxn
 uK8KAqMSOt0NDKZ141Kke9wzzeyLNkLeZQaBFF401HTzDPfN8oBHX9g94
 Ym+9+tZaGJd1enYROhDWW6BlBJ2uup9hmKFZ6T/y+++V/f6466RScVNL6 g==;
X-CSE-ConnectionGUID: S13luZfjRSOYEHm4EojH+A==
X-CSE-MsgGUID: fVqfM5oRT+CN4nh8xLtvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="56021495"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="56021495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 14:36:06 -0800
X-CSE-ConnectionGUID: hrzKcbeoQlyMqB6I7yoytw==
X-CSE-MsgGUID: lUTC8LfPRQOZHsk5N+i7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="83732902"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 14:35:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 14:35:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 14:35:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 14:35:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tywL+Thtv06sMOmC3NjUuyrQM23xS/RUHzfKhR74nZFaDen5kVjp/YLK20aBPR7ncqpJRJ3l9Nxv7l7RoIqbpUCf9zQ40gloGpuVb/yoRguS4eiz49tw+e6xlSDv+EQrRveOq1TEe1EXq3rpGGfI67MxlmNCLox7EB9sF/T9BJ6bNzojjrxXIJd/aSEdGCJqIDqSVtHn4K+vUBqT70vdxhiXkEz01OTuQJS6fyUfFfQvw6ASpoEp4LQeo8Hh6H4+TpJRLpvtFSMu+ydfP8aCDiuPiCjrtW87VtCR8OG4EMwVL2hxP3xiPtNLjKx9GBOrDJB/0O36biHkxxrEFnCXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmz6cK2p0FPBCHftOzgvYESdC7xs8VhjAI15OA6OgYw=;
 b=U5VnEoBcXgI6hsGb47Nm+8pmBrOQi6fKVmI2BnaDpPywwTl08bNXtScbDiNGKCSa1d/iGfVRQtt4JR3tDztwSTBDLy7kkbjshaxIKrD5N7h4FBFCTc8rHiWT3/mR11WQdR5UpFU1p1MioRZ/ruRbPS9k1UmJgoT7wbysUzrBk0mIdN8Ier3FwR1NNRjpvv8YdOn6hPRVg80J7MvD3os0AVrBazeRUhhnXHoFK/qcKVXuyfSdsd8bJBeKvuQGXrYPMeKItk8hWG2ryPS8SibvZCadH/VMEWK9xlhq9jo5937dvcndjcjMIGy2TWN1Dak1/oNG7pSBPmgAf2RcEpKKtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 22:35:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 22:35:42 +0000
Date: Tue, 5 Nov 2024 16:35:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Message-ID: <gaojnshpsrdej7lyq3tq2wpxy2cg6cmgjrdnut4u4ocrq573az@6mv6744pet5w>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-6-lucas.demarchi@intel.com>
 <BL1PR11MB54450989B36755C082301F49E5512@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL1PR11MB54450989B36755C082301F49E5512@BL1PR11MB5445.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 1935fced-cccc-4dd0-c7af-08dcfdea2e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CXv6T4rmaVJH+1Nx2IJ1P3f5XanfouaE8twYlrlFbyp0VSwhp+dBhn0O7Y+j?=
 =?us-ascii?Q?x/hZ9j+rEkMPOVxtifGciP38iLN4m4zfTK5VTKxJHpx2Oj05C2DiUueh6Ro3?=
 =?us-ascii?Q?mGpJZA4dkN6JR9UlI19WMRCpmt3RFd96Phin8XVv5luj7YTBD66oWbyvx1kI?=
 =?us-ascii?Q?t/jDdOnyN6cuyDZvadYcplUIIP3KDcj4omuIZqjT7Eyx5lo4WxFOX7uyQ5Dt?=
 =?us-ascii?Q?zZP6ObLB6ckzEfDsPt7d2GKkTSyjkq3DGy+1sQFRU3BSXtLaub7/Ka75Eyef?=
 =?us-ascii?Q?OfwQK+uu9ItdYRiNgkxUW/mDXfQS2bQ2WnvOEYfAP6yT5FcPeEtpfN7ctmo5?=
 =?us-ascii?Q?U37hwwlVZMl9WXY5WE6biJM6Mxo45d8qzC5aJ4IfLTPZCvRm7szEmaDKXKrc?=
 =?us-ascii?Q?eGLTr4Ta7jNsQFPHlJODvoO2FSEfCRh9bUfqQuAxG8V3ppahItfGdLq+pTcE?=
 =?us-ascii?Q?ebB3HFiFGWf4Atu99DIa2IN+NliF4tiDJQdhZ/swiGYGly+x3ksWNTZlhx9i?=
 =?us-ascii?Q?7cbyuZ3nernEa7tW0bz1JOLhNrBYQIPBnLK695u5OuqwUH3luCLtIhrGqPyQ?=
 =?us-ascii?Q?7G7UJsKrYye3uw9tpvv9LOJ3PhQ2OW5pJ/eOSnyuFRxIN0ujcbnSeDOF/1vF?=
 =?us-ascii?Q?JEBCb/sjwZmiyoUxp4Fbqq3nFJYdbtDAroGNe8IEPnFzBQSOk54JCuJk6SWN?=
 =?us-ascii?Q?Uk53DCCAG8x6+8RUqs34YSML7qcXvK7UIguIffy4by/1pwETXLY1GyGvTnbL?=
 =?us-ascii?Q?uMhuEKK6jsInbnSQ8vkgloiQzuHB/EpCOKYr6bCt5H8hsG1c1peWJGFBdvcR?=
 =?us-ascii?Q?tzaIauov7v3Ry56d68azHrJbTN4jWmn4uajSN4fspRMquhHWw+rB19VD1qUi?=
 =?us-ascii?Q?JQb07lvX9VOHz1WwlktoaYmSz+nCR8UssNiW+EIm+Tdk+EG018zth9JG1ocm?=
 =?us-ascii?Q?epPL7+0WRma33CN4DVyvUFDFsK1rsBYIhULtymOuZ+qyaUgGB1hK4jup0MXs?=
 =?us-ascii?Q?fXjADoflvZiDJhv7EBGWVQFcd4xrc5lD0/G/j9/hAi7i60nuU9ySZo80B7ee?=
 =?us-ascii?Q?nTri2nSCVInxyTZnHIJj3cm2kQJ0Xwbfo8uGMEW9TA8YyLfoAhsPHdxLkOEy?=
 =?us-ascii?Q?KARIz1tIuvJGyvj19ohGqQKK33BpN1IqFTzUUIiRFzkFwuZLYGLNF+c1bbU4?=
 =?us-ascii?Q?d7zFdeB1dQyjdJDRX36CgeFz652bK4x/bGHQu4TvmNJJ2XePnVdn/rAfE904?=
 =?us-ascii?Q?3J5mm12d6yUwpG1traoD75KIUMcxSzCmy70BNZPSmuOM9AFEosSrtYeKbXIH?=
 =?us-ascii?Q?hXBfcqaPIN/0dmH9S+oB5UGH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOzp4YQtDlyN3ecLuO3ps4rOeVOW1VHWcFpt44Ev79i/6WOUrpK9oVK9InyC?=
 =?us-ascii?Q?1I9GP6qtFll34KfNtYJ2oj4SqImVu80LzFDVFHYHIoTNGECde+N14xZzJBbg?=
 =?us-ascii?Q?Kfz+bxwTV38CAwJa84H4fbgTqzksgOlf3mR86Pr206d50OQn+QANH8fdYP/D?=
 =?us-ascii?Q?lGK5ujH7iHrc6aS/Ua6N5XMbYP1Wxk8P6PNcT+y+LJoevEnV/tzaQJCPH71n?=
 =?us-ascii?Q?TAODcGnMFrDZtnoc5ll/a9cjsVcuJTYGgt96qHlTVqTfBBqjfLKO3/xb2eeW?=
 =?us-ascii?Q?s7kGNLLslBVpJWVhblSXF8PEUwG08k3q376wXURqablUHCYvQ5DsKIavS8UT?=
 =?us-ascii?Q?zQJqs3t1V+rj+3JLyiiRobp321JyKuTexXd3P2v3zUcGTx2CcYBaTfcVHfPh?=
 =?us-ascii?Q?9N1+TRYcYMhEiABdS6ZfkWG1Gl4zRq82VXlXNFvO5iHHPYMyEyvlsIQs/CqK?=
 =?us-ascii?Q?RlEoKBNYFhqWA5ghQDnThsGhfyNbeBXiLmhRFwMyoliYyYzWsTjEd68myBOX?=
 =?us-ascii?Q?oJGpREqTprQmjAWqIG0VWEH7gEZ06Umb+rF1VeMnAbPnra1A1alWvUfdBruz?=
 =?us-ascii?Q?TFmuiL+JyJ7lXwA55GR+JAcqDG+s50DB+LJiTdUS8iml5276Sp73rC2G4DGE?=
 =?us-ascii?Q?gl9oT91fNhlGM1PYquSy0MyYauKVihdauQtLRpaXIKMvCxnPsN12xspb3ww9?=
 =?us-ascii?Q?FZmrSJn3bqKlpPEtpnqPvL04Wy9ZGjp6u6Mx3dp9NFGcMxCm1nmT0Wu2fL2E?=
 =?us-ascii?Q?zeFxE1TkSas8QA8I8t4ugp/LDyNUN9bfO6UbOoaeqPMNPqGDQ/aXWXFNKkxX?=
 =?us-ascii?Q?6NHABMGkjEH8Z92EliS8hJ+IArjc9D2zvMtunKikHMA1L+ldGpZoz+XS9CiT?=
 =?us-ascii?Q?eRF7Qdor6vvxcoDhw3c/pZWMWbcvHyL3FXHlVEu0uzAUi2eJ1kGkc44Gwe/t?=
 =?us-ascii?Q?KG08M44JIn0xluOap/FcYPgDGVHvzBF6aojodggHlfEtrJtWLpXGifVzC39P?=
 =?us-ascii?Q?G05HLn6yf872ht4gpdh6e6y/lNISO4ORjggc44nRBF4Q1UVBz385qhCrl2CJ?=
 =?us-ascii?Q?0Dz7OR2/rZeugMb3zzPWaPmwVUSsp7v9yzuT4qNe59+kdNFTj0xiTi12+rUI?=
 =?us-ascii?Q?sbp/Fi59mQu3g7LKGRkAle4VtWx+waobbryltcZ3hUC8eSZKv1BXQh/3iYEj?=
 =?us-ascii?Q?eMmYMUeiiR6Vp4GzGMbmmWGSvnXVyFOFdoS8T0PiW11oVteJxf+uvdgbLqHP?=
 =?us-ascii?Q?91EE/Ik1Sd+HcqJJWdgOZTTpOOcMl9PNkXts4tYWtLYadnNWovFCXq3s7Vms?=
 =?us-ascii?Q?XxEGttjrZIosGcKs6tu8bxSoDfv1i3zhiQe7nsFPhHr//z8EilC2g6n0pD/J?=
 =?us-ascii?Q?cG2KBNUP7OFISLqiCrhJOTmhS0t6EITzaqy2GneWXsgWoS5GLMlRDdcpjx5D?=
 =?us-ascii?Q?M9+bgZCSL84N2sR5m8j9gHi6qgeGY/8lU820ECnlJOlAvPq4VtR/NhbB2VUC?=
 =?us-ascii?Q?E9WgyGSLnc7APA0HIynzDuOuvJK5QYQ8N4dKMO10aUHZ74jwRUG8ei8q0qYB?=
 =?us-ascii?Q?eEMVgpLeZwqRaecQ57ETl8mDdwlDoIdOCGmioPz18Xz8tM24BhBfY1EI946o?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1935fced-cccc-4dd0-c7af-08dcfdea2e40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 22:35:42.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFg/GC7OOQitYjMqVhThOJYmzZ6DO/o27CSFsAMrVd7SQPfP+3owLZ35eYMHnGyKizvEShjlCjrBy145Osxox1raJqaVD6aDhi7kFRQuPxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

On Mon, Nov 04, 2024 at 04:11:16PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Monday, November 4, 2024 6:38 AM
>To: intel-xe@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
>>
>> Move the force_wake_get to the beginning of the function so the gpu
>> timestamp can be closer to the sampled value for exec queues. This
>> avoids additional delays waiting for force wake ack which can make the
>> proportion between cycles/total_cycles fluctuate either to more or to
>> less than the real value,
>
>s/either to more or to less than/around

changed

>
>> depending if the delay happened in the first
>> or second sample of a top-like application:
>
>Top-like application?  You mean a spinning application?

no, I meant an app like gputop/htop/nvtop/qmassa, that read 2 samples,
like below, calculate the delta and then show what was the utilization.

>
>>
>> 	sample 0:
>> 		read_exec_queue_timestamp
>> 					<<<< (A)
>> 		read_gpu_timestamp
>> 	sample 1:
>> 		read_exec_queue_timestamp
>> 					<<<<< (B)
>> 		read_gpu_timestamp
>>
>> Additional delay in (A) will cause the utilization to be bigger
>> than it should. Additional delay in (B) will cause the utilization to be
>> smaller than it should.
>
>Maybe:
>
>"""
>In the above case, utilization can be bigger or smaller than it should
>be, depending on if (A) or (B) receives additional delay, respectively.
>"""

changed

>
>>
>> With this a LNL system that was failing after ~60 iterations, get to run
>> to 100 without a failure. This is still not perfect, and it's easy to
>> introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
>> the same igt test in this case fails after 2 or 3 iterations.
>
>I'd say either specify the failing IGT test or cut this paragraph.

I don't like to give the impression I think this is a perfect fix. I
will reword it a little bit for the next version.

>
>>
>> Although not perfect, this could be viewed as just extracting that ugly
>> loop to "find the forcewake for any available engine" into a separate
>> function, and at the same time improving the results a little bit.
>
>This seems like an aside and can probably be cut, though if
>you think it's necessary to keep this section to make this
>patch more likely to successfully land, then IMO you
>should probably merge it with the first paragraph.

I will merge this with the paragraph above it.

>
>Something like:
>
>"""
>Move the force_wake_get to the beginning of the show_run_ticks
>function so the gpu timestamp can be closer to the sampled value
>for exec queues.  This cleans the code by extracting the for-loop
>that finds the forcewake of the first available engine into its own
>function.  Additionally, this helps avoid additional delays waiting
>for force wake ack which can...
>"""
>
>Note that by saying it "helps avoid" rather than "avoids", we go
>from a full fix to one that reduces harm, meaning we don't have
>to specify the imperfection of this fix later.

I like concrete numbers. I like when people actually tested the patch
and make it clear in the commit message.

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++------------
>>  1 file changed, 39 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 24a0a7377abf2..874c2157baf49 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>  	}
>>  }
>>
>> +static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
>> +					     struct xe_hw_engine **phwe,
>> +					     unsigned int *pfw_ref)
>> +{
>
>This is amenable, though perhaps we should just call it
>"force_wake_get_any_engine" or
>"force_wake_get_first_engine"?

I'd agree, but then I read the feedback from Umesh and decided to keep
it as is. The reason is that this function may in future use a cached
hwe and that hwe only makes sense for this specific use.

>
>> +	struct xe_gt *gt;
>> +	unsigned long gt_id;
>> +
>> +	for_each_gt(gt, xe, gt_id) {
>> +		struct xe_hw_engine *hwe;
>> +		enum xe_force_wake_domains domain;
>> +		unsigned int fw_ref;
>> +		struct xe_force_wake *fw;
>> +
>> +		hwe = xe_gt_any_hw_engine(gt);
>> +		if (!hwe)
>> +			continue;
>> +
>> +		domain = xe_hw_engine_to_fw_domain(hwe);
>> +		fw = gt_to_fw(gt);
>> +
>> +		fw_ref = xe_force_wake_get(fw, domain);
>> +		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>> +			xe_force_wake_put(fw, fw_ref);
>> +			return false;
>> +		}
>> +
>> +		*phwe = hwe;
>> +		*pfw_ref = fw_ref;
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  {
>>  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
>> @@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>
>>  	xe_pm_runtime_get(xe);
>>
>> +	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
>> +		return;
>> +
>>  	/* Accumulate all the exec queues from this client */
>>  	mutex_lock(&xef->exec_queue.lock);
>>  	xa_for_each(&xef->exec_queue.xa, i, q) {
>> @@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  	}
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>> -	/* Get the total GPU cycles */
>> -	for_each_gt(gt, xe, gt_id) {
>> -		enum xe_force_wake_domains fw;
>> -
>> -		hwe = xe_gt_any_hw_engine(gt);
>> -		if (!hwe)
>> -			continue;
>> -
>> -		fw = xe_hw_engine_to_fw_domain(hwe);
>> -
>> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>> -		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
>> -			hwe = NULL;
>> -			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -			break;
>> -		}
>> -
>> -		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -		break;
>> -	}
>> +	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>
>>  	/*
>>  	 * Wait for any exec queue going away: their cycles will get updated on
>> @@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  	wait_var_event(&xef->exec_queue.pending_removal,
>>  		       !atomic_read(&xef->exec_queue.pending_removal));
>>
>> +	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>>  	xe_pm_runtime_put(xe);
>>
>> -	if (unlikely(!hwe))
>> -		return;
>> -
>>  	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>>  		const char *class_name;
>>
>> --
>
>I know I've written a lot of suggestions at this point, but none of them
>are particularly blocking, so just clean up the commit message a bit and
>this is

thanks

Lucas De Marchi

>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>-Jonathan Cavitt
>
>> 2.47.0
>>
>>
