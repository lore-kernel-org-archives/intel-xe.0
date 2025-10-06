Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CACAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874810E0D1;
	Mon,  6 Oct 2025 14:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFRHVEQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BC610E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762588; x=1791298588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y8HyUsCLyqCCstyTNxrF5nW5++IXBjigPKGJ8mQRFdA=;
 b=iFRHVEQlPRKc+RrmIzQW59zpVuvHLKflN2MGcXeNi8oDQMecM3s38sEO
 jklhiQnzHYTaBoNQqRX1zDwslnLJs+7vXZKMI//xPpNdbZVvVFYHPTmqG
 b2+r+fBDQDdjXnkP/VaSRxwV95oZY29rabUS+DY1Hft56YC+ejjfURsWb
 xH7OOtFp7HhBlyWRspL2Zp49CcX1RIlczZFQeDS3FcrbL4iiue9QzTUHu
 g1axW2pWrpWmbC4GbGhfRVS4YLTMHaYcW493VCJV9u9nBYMTgxpB4fgzh
 CdcJBStUMH2x8aTQGFgDCfbOwVS6pbmluojCE+mgyK/+y+ka05dZFQ+kY Q==;
X-CSE-ConnectionGUID: Ym+S7KcrTw2jpIHcqDqUeA==
X-CSE-MsgGUID: RyR9nk+iQbSIF0V1SaOeLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61854196"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61854196"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:28 -0700
X-CSE-ConnectionGUID: 65hbeoIwQdWbZwHiasmUBQ==
X-CSE-MsgGUID: V0Bte8XZTlCJM78GupeNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="183924103"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:56:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:56:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:56:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9myARMrV51BgqBA+WZp1M3r8jzObK9OzGikWnQe4De3DSxzp1d0gV9bnTf3CO7xEQAnejVlXqj6zIHDQNABh5lxAOPwu14yddPpmLTfAOvskNgEI5WaWDxHCGwyiZHUjFMitIniFtmaPNPZdHTJnxXU6zOzJKG9olI5IrBiaOefyLYsk3s3DcIyBWHTdpfzzflNvFxFzuP2ZpI0e7an1LAX42iOO9yWmGgke8s8eOYHOpjVB/+HHCmvhUlUo8m65WQuORvtHKQsqtQKaigO96kGG3OnPNm9lVJBi+qs7fHL9Xps2rEzuiHGdzKnbcX7ClU4Zhc6Pm39O3veGuruaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqJln6cq00gIRWr9LUlBG+OiR5NCI6IZ93CMJBaPRps=;
 b=d/9PQ4IDsbJIl31rAgKzX3GWLyj1a5CDY7Ti+NrCDlty8QjJJrwHQ/xMlfDz1z6bNq7iuN7gV0mDYyV8Yh9+ysLi7vAjXtt8U3yq7XW0wxqUtglkUX8Rq/a0Wy3FMRi+4coFdqVWOvwCPhZ2WvP5PEYdtycUnSAZBvHn7psEtxNyiUp3H6S9hGGKnD5J+Nf/jXSRU1NeZqjWAU8yEJbwLhI+QqDQy5Qa1Cl+WkOGdbUl2CqNZyKVsgh9JFQJO4mVB/gBTVbTQXXdLfqD/7CtOKNTqARBCfHUl3kbdZKv+kgbD/Mnq48Ece9M5vhPldLn4BPy2W/pzLuQAUaSTaWsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 6 Oct
 2025 14:56:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:56:12 +0000
Date: Mon, 6 Oct 2025 07:56:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 11/30] drm/xe/vf: Close multi-GT GGTT shift race
Message-ID: <aOPYic7n1QVY2TJl@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-12-matthew.brost@intel.com>
 <790758a6-3697-444c-95bc-1ce62d9cef6d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <790758a6-3697-444c-95bc-1ce62d9cef6d@intel.com>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF6A4412A55:EE_
X-MS-Office365-Filtering-Correlation-Id: c67d2d82-1aaf-4c2b-b6eb-08de04e87d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fB8pZ/sir44wdk1WSiTa97V6Aot/V/M1yKw2r1TDCu6QXte6WmkZmv9BOv?=
 =?iso-8859-1?Q?idnI42LjS5o8rQ78b9AxnUkc3VEEltRvuXMwbDEFzt2Jiyvlf8f7+6Bo8T?=
 =?iso-8859-1?Q?5Gy3Wn5kF2Ye0nCwl7/hpkqQOWNyHFPFQyEiaiu0KziQBqpSRNL5/KKMyI?=
 =?iso-8859-1?Q?/hJyp2g7SqI7LoPfswA8TShi0h9j/XgP8XdFn5Mb/vlGEfTCPa+9beZCHQ?=
 =?iso-8859-1?Q?tn8a7uKdLupk437ih2bITCucKoNM75MMnvZUmrNUelkWMbwm1DJBB0psZH?=
 =?iso-8859-1?Q?WpajcA53FM5SxvFw/Xg+nk4TNaPh2uAfDfM5VrQYAjU1zQklaOgui9ubS4?=
 =?iso-8859-1?Q?bPZ+wI+8NE3TVwRxBYdM6/8Cv4HwzGmhEcg6H81QgBJAZEgIB32l4HEBKH?=
 =?iso-8859-1?Q?mIoNXAlMIQafaWHKy2HbTYGxetfq0MU2/eCqS+kcnMA12ptyT+E6hQVsl1?=
 =?iso-8859-1?Q?gdQ7PmuBETq1gjbdQqc25ciuLQBfU479pjLqE9Q6csKRwBdQMZRDHMcMCY?=
 =?iso-8859-1?Q?iNgADhcFh330achPxSuuIF0UM2l1vydjB3UnfN028uXahV+QamBLk8nZFQ?=
 =?iso-8859-1?Q?FHnMbi2/EhPVtd3tAvKQN/Wghtf8GpbeuJFO9iduOEXfHtvQopay20WYEc?=
 =?iso-8859-1?Q?vT0GjzRPhN5kMilsP/XU/AzTx+zAUaw/VSTcRyGuOOBr0IKFLg7vLltzYv?=
 =?iso-8859-1?Q?3PYQ656ViigkHbDOVSApWb/K9tdzz0x4I4G6p7GbmfojlsLigYr5uma8cR?=
 =?iso-8859-1?Q?GvjlKqc1xXotURR7VcyZ9wZ2PF4W5Yvl9JaXOfPh1jSvuiP6siBRh4q5RC?=
 =?iso-8859-1?Q?2MfDCeNxkldWa4JgjX6/w3XsMshsxe0QvmGKh47ftgBk9Q8d9zunSovlcW?=
 =?iso-8859-1?Q?HNmWrvNM92+qWmEse/90BIOSxUdrFF8SJefId7+8DWfYqjdg9BHwsSF6oI?=
 =?iso-8859-1?Q?mffLHPFTuWidOmseV7n2vxY1XG2lCvnuw09rrrfIn4U9RvC14b96b1sQ2F?=
 =?iso-8859-1?Q?6XGtAiF3mHl+y6BcMKZazWgL3/F/hwIAmbL4PxUij0ioJJ3CaXvipkAhVD?=
 =?iso-8859-1?Q?3xY4C3tb0znoiaar/Ejqpy9Sk/nvMTWeYFHucI+bTwEpr9NuXldfOmMgyI?=
 =?iso-8859-1?Q?FS1XF1fMog5T4VV0cI52ytcQ6iHgqec7kl6cBSnDimkFFkGd99gJAjODKP?=
 =?iso-8859-1?Q?QOWbKV62qHS2rPAbYSbmUDwTNr93pLHsh9e0nss2g3gMS7b8maMolYfrxa?=
 =?iso-8859-1?Q?ismCTdBzTiOAPXduQ9BwwSbP52kYgCzD+NdIzhLmmkyZX+5Vo1tSlC6QtH?=
 =?iso-8859-1?Q?YMNMJESkcExjwPzIQ4ZPEVvS6wAwSnniToY9AlKMsD7XM4d2OTMAjkg0u2?=
 =?iso-8859-1?Q?Rng9toTXeVPNQRKKg6Qc38r1N/iPo8wUywSnsSfFxDIWhWFP+wRt+pPUeS?=
 =?iso-8859-1?Q?KMaBsMW3jetLEJzKKzs95WLZp2nTDZOsoWEFrTjY7RUxaLD43Mvh9pWmz8?=
 =?iso-8859-1?Q?txrw2RsU3xdNwq/jVvpxRd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gRUKbgSIvcbjTSjf6K9rrTPcxoL9mhL+tBCpbLPVOequWhvQrNvgQmhNLY?=
 =?iso-8859-1?Q?xFFRPDJ3tCFPxPwTMVzjoJwLClxTe+0vKObG6OxusNLhM7hL+P/ODM8DP/?=
 =?iso-8859-1?Q?H+W3pSzsMQeuFJldcJwWxmdvlHJ4yh5j/+xqiB1ZXXZ32NcWLw1XuDct2T?=
 =?iso-8859-1?Q?PHm68qvjmV5+tqUODpK6cNyscCWWan6pKlYWP8F9TVcnqD78S3dd3xsnuS?=
 =?iso-8859-1?Q?MHYyif9mJUqYmON+mmA2fQ4D30/PIuO4zdo5WEIJ89nLmNDMkOc32EHELL?=
 =?iso-8859-1?Q?1OULDpndAe1eBFF4gdcZ4b3AiaGM+p1cbHXy3b8NJVd/vJZ9QN180lvHF+?=
 =?iso-8859-1?Q?gxTrsDhmvSsuSyCsWXkWsxElY3/xIIw1BzIQC3V8wpqv/dkhapUh/PnVPc?=
 =?iso-8859-1?Q?anO2EwNchJcKRMfKn9Opft3a/f28EdXTEsUij1e6CbGjyM6JG9MP9TjaOO?=
 =?iso-8859-1?Q?1+ShsUY1pjk+F3dO0SJf0VwmGNocNvP8JaahiIokBQpKsvkNVOYt8tl71/?=
 =?iso-8859-1?Q?TBD7GMcr9U5LrBEegGCr6FM7JZ+iG9OuTM4WLQksvd73Ih+x6GshwcqTq9?=
 =?iso-8859-1?Q?5ct2qZtaIZAnepvUEYP3a5fHSJr1EteZkCIXfnN7tiV4FAEjyy5x0THJLI?=
 =?iso-8859-1?Q?FQe7ilMqJEzUwba4os0tHFkYQSefyraOTIJnvFGimMKv43YnVrLLO+DPMP?=
 =?iso-8859-1?Q?Gy1vMjby1CmsRyxw03d4mKAHG1SXbfL8oBGz3Kb6Xg6MFU8sZkA4ZJWjB5?=
 =?iso-8859-1?Q?oZ9MjY5goIq3V9NwMuGUZwjHRXN05mkDge2r+OnrfdwfPR1PUgbfG6C7Gc?=
 =?iso-8859-1?Q?3cHUDzgQtyyfyXCup/Y7J1wQlOhvc4WteWFZ53+Em7WccyAqDq9P3rd2wu?=
 =?iso-8859-1?Q?cp/00x+6RFhCDjgpmXurvKNYBChRILXuATlW4FvA8eHvYSF7NWbR2xWzux?=
 =?iso-8859-1?Q?W0inrI2kwxTJkkl4wjgiG44Jm/fo4AXiGFWGs+7boMlFe9jM2BdyZlbNT7?=
 =?iso-8859-1?Q?VoZYNi0wKXn62j/nWgLtvWKCRDT9R/k8TOG2p8bEeDE26tHzI/wHyEkKWR?=
 =?iso-8859-1?Q?ITkihTzAyVqBjon3rlBa44Q9A+EdgU6OfGz58CExJzwCGUB2sCdTVvduOs?=
 =?iso-8859-1?Q?3l0dH3N68egfiZLGCYfbDCzgZmclBbOfXYhJ5zzMa6fdq3/f8GKD3Aqvt3?=
 =?iso-8859-1?Q?Zbt9/ZRcEqmc1GzSX2NTq2eWT0aD0vf9xf0iNsiSfVQNJ4NuWpL1mYix6X?=
 =?iso-8859-1?Q?cTclxrmofr8K20RrDgHb1gfU1bqpTrSD7qH7MPHUif3mxNkScnCHo5QJ2T?=
 =?iso-8859-1?Q?ZTLDcVyweqXloJuz3fwqqARRyR6dIN4rKc1zXj6u1O4sRGpqrIZ0kpDbBS?=
 =?iso-8859-1?Q?aCcqT1ktOQKd2QqoakmeHdCOe0TU8wyLk2VyBR/yuqtKa8TWDOWD4Y+jUl?=
 =?iso-8859-1?Q?jbdeOpkVEnpiyfdqd3oPNvdzU7918OOYPhU5xyK7xkUeZ2ZKI0Ub3E1EpW?=
 =?iso-8859-1?Q?nBymV+KJux5GiQpVjgLFgcdso0JnmEvj3xxMUju5sRWoiAzIFSd2chFGC0?=
 =?iso-8859-1?Q?Yll7JPzWBeKaa7Ps2qcKQSn5ycc/Ah/40TSiNW5RwalA3UN/KA61AtMFN3?=
 =?iso-8859-1?Q?/5vDSycZ2ti4WOp8M7e9mkSaWvxeuuEPb79QNwdvET1dZv57WzmNSYqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c67d2d82-1aaf-4c2b-b6eb-08de04e87d79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:56:12.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JrmiyBRO26YHFVrKQK94/ywiF30u+AJdR1hJ13w4ZO61FBBmWLUZYVvJxFQuM4X54y39mnNWZCNL39yEzLt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
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

On Mon, Oct 06, 2025 at 04:27:36PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/6/2025 1:10 PM, Matthew Brost wrote:
> > As multi-GT VF post-migration recovery can run in parallel on different
> > workqueues, but both GTs point to the same GGTT, only one GT needs to
> > shift the GGTT. However, both GTs need to know when this step has
> > completed. To coordinate this, perform the GGTT shift under the GGTT
> > lock. With shift being done under the lock, storing the shift value
> > becomes unnecessary.
> > 
> > v3:
> >  - Update commmit message (Tomasz)
> > v4:
> >  - Move GGTT values to tile state (Michal)
> >  - Use GGTT lock (Michal)
> > v5:
> >  - Only take GGTT lock during recovery (CI)
> >  - Drop goto in vf_get_submission_cfg (Michal)
> >  - Add kernel doc around recovery in xe_gt_sriov_vf_query_config (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 153 +++++++-------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   5 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
> >  drivers/gpu/drm/xe/xe_guc.c                 |   2 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  30 +++-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   2 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 +++
> >  drivers/gpu/drm/xe/xe_vram.c                |   6 +-
> >  9 files changed, 112 insertions(+), 119 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 1d2718b70a5c..c66523bf4bf0 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -27,6 +27,7 @@
> >  #include "xe_sriov_vf_ccs_types.h"
> >  #include "xe_step_types.h"
> >  #include "xe_survivability_mode_types.h"
> > +#include "xe_tile_sriov_vf_types.h"
> >  #include "xe_validation.h"
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > @@ -193,6 +194,8 @@ struct xe_tile {
> >  		struct {
> >  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> >  			struct xe_ggtt_node *ggtt_balloon[2];
> > +			/** @sriov.vf.self_config: VF configuration data */
> > +			struct xe_tile_sriov_vf_selfconfig self_config;
> >  		} vf;
> >  	} sriov;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 55a1ebbbf47f..d227c8a3ec81 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -436,42 +436,65 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> >  	return value;
> >  }
> >  
> > -static int vf_get_ggtt_info(struct xe_gt *gt)
> > +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >  {
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_tile_sriov_vf_selfconfig *config =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> 
> maybe
> 	xe_tile *tile = gt_to_tile(gt);
> 	struct xe_tile_sriov_vf_selfconfig *config = tile->sriov.vf.self_config;
> 
> to avoid line split
> 
> > +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> 
> then
> 	struct xe_ggtt *ggtt = tile->mem.ggtt;
> 

Ok.

> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	u64 start, size;
> > +	s64 shift;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	/*
> > +	 * We only only take the GGTT lock when potentially shifting GGTTs to
> > +	 * make this step visable to all GTs which share a GGTT. Also the GGTT
> > +	 * lock is not initialized during xe_gt_init_early when this function
> > +	 * can also be called.
> 
> hmm, the real fix should be that GGTT lock is initialized right after GGTT was allocated
> it looks that just split between GGTT alloc() and __init_early() was not ideal
> 
> note that while almost similar pattern was done for tile, in xe_tile_init_early() the pcode mutex is initialized
> 
> alternatively we can change VF to do not perform full query when doing early bootstrap as it is looking just for the GMDID
> 

I looked at that but the GGTT init early relies on GT W/A being applied here:

286         if (GRAPHICS_VERx100(xe) >= 1270)
287                 ggtt->pt_ops = (ggtt->tile->media_gt &&
288                                XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
289                                XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
290                                &xelpg_pt_wa_ops : &xelpg_pt_ops;
291         else
292                 ggtt->pt_ops = &xelp_pt_ops;

GT W/A are applied in GT init early, thus we have circular dependency.

But I think moving the lock init to xe_gt_alloc() should work.

> > +	 */
> > +	if (recovery)
> > +		mutex_lock(&ggtt->lock);
> 
> then we could use
> 
> 	guard(mutex)(&ggtt->lock)
> 
> > +
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->ggtt_size && config->ggtt_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> >  				size / SZ_1K, config->ggtt_size / SZ_1K);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> >  				start, start + size - 1, size / SZ_1K);
> >  
> > -	config->ggtt_shift = start - (s64)config->ggtt_base;
> > +	shift = start - (s64)config->ggtt_base;
> >  	config->ggtt_base = start;
> >  	config->ggtt_size = size;
> > +	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > -	return config->ggtt_size ? 0 : -ENODATA;
> > +	if (!err && shift && recovery) {
> 
> maybe "recovery" is not needed:
> 
> 	if (!err && shift && shift != start)
> 

Do you mean remove the recovery argument all together?

That might work...

> > +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
> > +				 shift, config->ggtt_base);
> > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > +	}
> > +out:
> > +	if (recovery)
> > +		mutex_unlock(&ggtt->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_lmem_info(struct xe_gt *gt)
> >  {
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_tile_sriov_vf_selfconfig *config =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	char size_str[10];
> >  	u64 size;
> > @@ -544,17 +567,20 @@ static void vf_cache_gmdid(struct xe_gt *gt)
> >  /**
> >   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
> >   * @gt: the &xe_gt
> > + * @recovery: VF post migration recovery path
> >   *
> > - * This function is for VF use only.
> > + * This function is for VF use only. If recovery is set, the GGTT shift will be
> > + * performed under GGTT lock making this step visable to all GTs which share a
> > + * GGTT.
> 
> hmm, the question is: why GGTT query can't be done under lock even without 'recovery' ?
> 

See above, I think we can fix that one.

> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> > -	err = vf_get_ggtt_info(gt);
> > +	err = vf_get_ggtt_info(gt, recovery);
> >  	if (unlikely(err))
> >  		return err;
> >  
> > @@ -584,80 +610,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> >   */
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >  {
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> > -
> > -	return gt->sriov.vf.self_config.num_ctxs;
> > -}
> > -
> > -/**
> > - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: size of the LMEM assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> > -{
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> > -
> > -	return gt->sriov.vf.self_config.lmem_size;
> > -}
> > -
> > -/**
> > - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: size of the GGTT assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> > -{
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> > -
> > -	return gt->sriov.vf.self_config.ggtt_size;
> > -}
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u16 val;
> >  
> > -/**
> > - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: base offset of the GGTT assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> > -{
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> > -
> > -	return gt->sriov.vf.self_config.ggtt_base;
> > -}
> >  
> > -/**
> > - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> > - * @gt: the &xe_gt struct instance
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: The shift value; could be negative
> > - */
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> > -{
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	xe_gt_assert(gt, config->num_ctxs);
> > +	val = config->num_ctxs;
> >  
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> > -
> > -	return config->ggtt_shift;
> > +	return val;
> >  }
> >  
> >  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> > @@ -1057,6 +1019,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> >   */
> >  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > +	struct xe_tile_sriov_vf_selfconfig *tconfig =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> >  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	char buf[10];
> > @@ -1064,17 +1028,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> >  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> > -		   config->ggtt_base,
> > -		   config->ggtt_base + config->ggtt_size - 1);
> > -
> > -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> > +		   tconfig->ggtt_base,
> > +		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
> >  
> > -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> > +	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > +	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
> >  
> >  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> > -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> > +		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > +		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
> >  	}
> >  
> >  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> > @@ -1161,21 +1123,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> >  static int vf_post_migration_fixups(struct xe_gt *gt)
> >  {
> >  	void *buf = gt->sriov.vf.migration.scratch;
> > -	s64 shift;
> >  	int err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, true);
> >  	if (err)
> >  		return err;
> >  
> > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > -	if (shift) {
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > -		if (err)
> > -			return err;
> > -	}
> > +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > +	if (err)
> > +		return err;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0adebf8aa419..47ed8d513571 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  				 struct xe_uc_fw_version *wanted,
> >  				 struct xe_uc_fw_version *found);
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
> >  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> > -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> >  
> >  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> >  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index e753646debc4..1796d4caf62f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
> >  #define _XE_GT_SRIOV_VF_TYPES_H_
> >  
> > +#include <linux/rwsem.h>
> >  #include <linux/types.h>
> >  #include <linux/workqueue.h>
> >  #include "xe_uc_fw_types.h"
> > @@ -14,12 +15,6 @@
> >   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
> >   */
> >  struct xe_gt_sriov_vf_selfconfig {
> > -	/** @ggtt_base: assigned base offset of the GGTT region. */
> > -	u64 ggtt_base;
> > -	/** @ggtt_size: assigned size of the GGTT region. */
> > -	u64 ggtt_size;
> > -	/** @ggtt_shift: difference in ggtt_base on last migration */
> > -	s64 ggtt_shift;
> >  	/** @lmem_size: assigned size of the LMEM. */
> >  	u64 lmem_size;
> >  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d5adbbb013ec..c016a11b6ab1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, false);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > index f221dbed16f0..074981e2ef07 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > @@ -9,7 +9,6 @@
> >  
> >  #include "xe_assert.h"
> >  #include "xe_ggtt.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_printk.h"
> >  #include "xe_tile_sriov_vf.h"
> > @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> > +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> >  {
> > -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> > -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> > +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> > +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	u64 wopcm = xe_wopcm_size(xe);
> >  	u64 start, end;
> > @@ -244,11 +243,30 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> 
> what about naming style to use _locked suffix in function name if it expects to be already protected ?

Sure.

Matt

> >  {
> >  	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >  
> > -	mutex_lock(&ggtt->lock);
> > +	lockdep_assert_held(&ggtt->lock);
> >  
> >  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> >  	xe_ggtt_shift_nodes_locked(ggtt, shift);
> >  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> > +}
> >  
> > -	mutex_unlock(&ggtt->lock);
> > +/**
> > + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> > + * @tile: the &xe_tile
> > + *
> > + * This function is for VF use only.
> > + *
> > + * Return: size of the LMEM assigned to VF.
> > + */
> > +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> > +{
> > +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> > +	u64 val;
> > +
> > +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > +
> > +	xe_tile_assert(tile, config->lmem_size);
> > +	val = config->lmem_size;
> > +
> > +	return val;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > index 93eb043171e8..54e7f2a5c4e4 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > @@ -11,8 +11,8 @@
> >  struct xe_tile;
> >  
> >  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> > +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > new file mode 100644
> > index 000000000000..140717f81d8f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> > +#define _XE_TILE_SRIOV_VF_TYPES_H_
> > +
> > +#include <linux/mutex.h>
> > +
> > +/**
> > + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> > + */
> > +struct xe_tile_sriov_vf_selfconfig {
> > +	/** @ggtt_base: assigned base offset of the GGTT region. */
> > +	u64 ggtt_base;
> > +	/** @ggtt_size: assigned size of the GGTT region. */
> > +	u64 ggtt_size;
> > +	/** @lmem_size: assigned size of the LMEM. */
> > +	u64 lmem_size;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index 7adfccf68e4c..70bcbb188867 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -17,10 +17,10 @@
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt_mcr.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> >  #include "xe_sriov.h"
> > +#include "xe_tile_sriov_vf.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_vram.h"
> >  #include "xe_vram_types.h"
> > @@ -238,9 +238,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> >  		offset = 0;
> >  		for_each_tile(t, xe, id)
> >  			for_each_if(t->id < tile->id)
> > -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> > +				offset += xe_tile_sriov_vf_lmem(t);
> >  
> > -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> > +		*tile_size = xe_tile_sriov_vf_lmem(tile);
> >  		*vram_size = *tile_size;
> >  		*tile_offset = offset;
> >  
> 
