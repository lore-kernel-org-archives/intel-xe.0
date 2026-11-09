Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394B606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GliTpwSC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA36110E116;
	Mon,  9 Nov 2026 22:28:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B58310E5DC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 22:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794263315; x=1825799315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SAERjpnHyYF5HnsGMapK0q9Uj+zy4kXZvliEuN2C5Ck=;
 b=GliTpwSC1Y227GOZPn4b3oB7cNlLJbsiAXh0N9wOcswCKAn5ASVQj+b+
 /6XbZhsJyQFiE+f0Rzbcfluq2HcPCeMNRwNYYxVsjk4K80ABI1+da6QOL
 gOfEDNvAD3OwFjeej14/6PKvXJQ3doWmryLiTDYfKv78WIL94GZpnJr+W
 NZtAsu79RRrUoxbJgLwnJuZ7yhs4YVUGraelKLv4NkoVDkcPa0GChULoL
 QUqHcXkt7jGsiEPJ3CTqN5sfBXTM/541UEMFBclt2Zbt6uWMpQ2j4E7Zz
 9lqgaz1BjV/xvQmyJRww/KYKQFUnrWokzw3WFcfglL3/XVzI8ZEhvT9+S A==;
X-CSE-ConnectionGUID: 4FARW5ylRKupJ+52OAId6w==
X-CSE-MsgGUID: krtRBBOPSMuUUN7wDjhW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3034666"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3034666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:28:34 -0800
X-CSE-ConnectionGUID: 7R2cBS28T6ajwCDRD4XD6A==
X-CSE-MsgGUID: mExwoLYBRnS4Aej/5YN9vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8312284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:28:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:28:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:28:33 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:28:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLvFi/3ymqT90VxnVwhRjmdH3xfdQsWiU5nOsUFCTds9Y8QdBjFXtIQzZsVivU2s07B3AEasbu3ThiAcOLTT+kAOs2juRWmGUinRyhRyAqqy3ZMwC+G1eTb/rpy74JySeAHNFwgwQlxUYRPY6A4WoEMF3gGDfcoVk8sbbLQ+WGmtX9p4maAGjOdP9J/kftwL8I9w8Xx0Bjancsa/ciHlhEObANqSYoSsbg4YMYGtoMtRi2VSNPZB3e0JdodMzhpru8WB5h526u2miKb9LpqFhxvDnEmQVA2QNGyXziZxaXFwaOXopTU8hHOSrNLtE6hEo5dysiA8xD41q25+B9Hbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNHlWGm1LSR2FxUznDpKkLh7jxy0s4/mhH91XLuPXRU=;
 b=IIlqVdvIlhw9maj3sc6GnlV9W4+AFe2DhAdKGqyV3T3wC65MgEZeY9pnfeTEhlQSWvMFPsgEcQ6hzkzTulP9LqHAMWEXOK7cxfHqkm3rOlHP0pmoSeGuhiiA5WXpyeNM1U8+pDYPRqfkboYFBFCHOb4cE4LKf8Bp6bMNWvKkWlDNw4bNaHb2ZHNxGF2Ashp3o7nGEqvX3tvb5bC0WBLSkgIxn/7Lc/T7W/g/lpRH0LjdsO7RztBBIDgtrhhv00JkIkMyWR5gjCLOfpbcnMj9gSU4/lfSU4uCJlUEV0gIUuRbpu6Y5ctlsfSPlLvBtdGqLt9nLQ5yuNlb/9K7WxQadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:28:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 22:28:27 +0000
Date: Mon, 9 Nov 2026 14:28:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Bump offset for PPHWSP software scratch area
Message-ID: <20261109222825.GB6134@mdroper-desk1>
References: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6c9243-91d2-4549-ebfd-08df3eb0c63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261022113327099003|261009223027099003|261026140227099003|261028144727099003|261102124527099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: azT0X2nbWjmBEk+Vngia78Okjk3jvns4sUqMsYDg5jBSBUzT6dGF28VKQLgPxTVEwnWzvQB7EI82EqcP5WWGZ6+V8HxZM6DfjqrgA9o2FZCC689Q0+rLDC1bM319JEX18HIqGKVSJEbxuXXCSw81yIhOZBjHpVR+1r+bYAtouSU5w8RwzlAVZ7cLVf53PMLqdc/0cEEEpnsD9Pa8hxtIjhRSzx4gl+DpLa9yzwBcU/Hs+E61bdG5PNAnU4nMQ7Y0YqEsi+WcnXI4GsudTVctS85bnrRBkOhWlaN+IEyGjighSDgP+BPz3vsNrSIqssR7OheqABbUa/b+nYYIKZjrpEPVdjQ7qGe6kDUpGaWASOqiH3j6mb/x3W3VBAwIC/YMoiZ0i/38hAjJcF7p3rTkl6zDJNseH+1GVam9UMnePJL+apDksu9gYzLQRQRISZc1I1lPG2kVRX7A0Kx0bZt+IM8+7KZo02CeO+aBHYw9DLPa5cjfj4lsftKMmzdvqFDNS9NFApMSrt6R+x8kj1eSi2htSxnARB+K5tnSspmBkLyviWpRfC70jDt1QMX5h2ytsxgik+9jJaSPY/1lJu4UO/14wFRtPNfrKIO/i1SGYklcRD3/LjqTzxO9vkSvUUtTO22mGavp5g0L1XsizO/0HEQfbj+UYOr2SUU7s0+4Aw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261022113327099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102124527099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GfR9CQi33xzNwvZnGR//EYvOwREFfeS+PoH4KcPb7Fsw7wPZF7OZjIUowlRH?=
 =?us-ascii?Q?G8Zod6Lb+ICYoscDQDHvwjYiVvpo3UA5pvA5k8CTcKiPXxC4yYyFhNdoF1Bc?=
 =?us-ascii?Q?CCtPhBsdiab2YQieWJLZ4CX6x9mYiqZe7R8hZfnoO8jpnDXxVgQsDMfRxXv1?=
 =?us-ascii?Q?zEt5ACoY05uNA7StKpUj15eDoUdtmZEJZgnCrW5FDYpBRP98ESuUWT9L+MQV?=
 =?us-ascii?Q?kE7BBZaPqxFik9zrfJwfqjtAbh48AKL5sXbyZ7zZu8N018c/XBfR0mdoypm5?=
 =?us-ascii?Q?0KFjJRhCGPJDtuBZnhVRvIVlCrvBOckrNW6WooCVrlW1tPh6Xl//IQV1p+HM?=
 =?us-ascii?Q?WKbVzcyRIoK76Ky1DHmA2VClsfajXOGAWlTnLcjOu9SxAQR3bDqS5lSSdNtN?=
 =?us-ascii?Q?5QVNFfH6CGMRvbz+3mAYORowVNuW9znLddfTW+U24lgn76Qa5wZnvuNUTIf5?=
 =?us-ascii?Q?mq+NAEOTFHWjgBeRZYh4N5eHVqxu1CDFu+blFZUG7raPZjAsBuZJlpbK1zf2?=
 =?us-ascii?Q?2CgsWt2oOUB4/2aIdS3xiBdMG1lShmk0/ZDGVt8YXuH1OyFqdnQWF0HtDEoD?=
 =?us-ascii?Q?xSrgm8Jt9MMv5I04KuAFMQ9u/4tuyM09dd8n1wdzHOUE5gVuLGXbF1GfuJAv?=
 =?us-ascii?Q?NCT2MSk/1qjSEMbNxIU0KJSrPNj2Sbjscq4q1eVYB0leFuL7Cy1lt64j4Ged?=
 =?us-ascii?Q?882BOAJCVmr2KBTYGdxvIBrX0M7KewgZKhDD/UB0pV9bI19m5z2RX5gUSg0s?=
 =?us-ascii?Q?Rp0v4ADagK77XqervWm85T0Bsj9M1wGNwGMfRM1IWAQtL2B7xXzhSCmCkpjP?=
 =?us-ascii?Q?+sf6KQ/EdrY2vGER5xLQdc8W6uc5ByIwk6b7oram5MRr3LtPwIRXIJX3K5e7?=
 =?us-ascii?Q?6FATvx3QbjwksA/MuQ4GREUoSoRwhPkxqHdv+qNxKt4GL17dy4hhY2vs4iwr?=
 =?us-ascii?Q?gLndIvYQ8Vzo+zLS7CKN1qe1ZwaQGspwdJXo+UOwxb51JnEQopn/00Lxwp2P?=
 =?us-ascii?Q?VWW88Wo1jHB0rSgZvMTDivgS3sQvcOzX0wjjtVEfpepfQG9b0oc3lHjn+rt2?=
 =?us-ascii?Q?QkoFwbj2ooljM/lwiWGzI9EjYpmXBmW2d9QuGj/vGuloHGG43A5WPMuDZFSA?=
 =?us-ascii?Q?YGwUFpQMp383hYJKOnkKKx3x1kfIWEFlTSk3CQ6FV+QtjtrWA2IPotO34Puy?=
 =?us-ascii?Q?2Q1RBVpDQn9g3s5eyp0c0bIDCa88cAETkPgtsmT5fOLzCfEi0oMDUdp2E3in?=
 =?us-ascii?Q?CH04+oUDAMKs/IgJ7HL1C8Rn/NiS69/xVj7wzVY5iWuLIozrQ9k+EsPfy4YU?=
 =?us-ascii?Q?ygMZCXYHUrcXRY3SQ1mDz+jmbvAzGU8QauEdAFAFspG0z2aMX3+GrBXTmFJP?=
 =?us-ascii?Q?1vVcQ4pbAhTFPRkHbcCP6XNr0MTzTV6lKEQH3FHl6Hlsz92/g1q5Nl5fADFS?=
 =?us-ascii?Q?HnRcVFTXN7wlIPcXRdhNAiPSq5IH978sJtdcseO7IqSuQFxRYok69Mi9FxfD?=
 =?us-ascii?Q?D5OwRAsgX9XLDq7zmZiGl5Bb9C7hupIgubwQSLzzDmVL1CdXpokhK7cLc1Lm?=
 =?us-ascii?Q?OOy1PpdPAeL+ypGcBRaPhsQTqNn0HjURmWqIyFe5uVOdUh9jTVpXiyBAYh7w?=
 =?us-ascii?Q?5AqEkFLDT06Mn2GfCzpZlBSLFULN4mxDmkkB0jV6ikAQl7OHWoBaD1NGq9Mr?=
 =?us-ascii?Q?/HY9bwcS/NDkkrRlPusTP1GB6oUPgXvNbszMp23FxaDidKPjMfSE3Ifr/azY?=
 =?us-ascii?Q?p0QvjQddwDKm4ttrg3eiilsaXF7ssXU=3D?=
X-Exchange-RoutingPolicyChecked: dxs/veFZdP2xDA+UjfWBpaPUiZnXTb55ji5ofg3dV3ZQMW6E5V+W/CvGY42uEf67iwYVG3LR6Sb9RhvtQQy6KmCdEg4aqu4SpY3D5nKkRmmaZkbZ5Bh88uv0RoK5aH+eMvmNwGQsyo8CmSr/gCrg1tQNS2c5UhqPp+h4PYCN9tGC+uqEYvkQshiI/xG5PGerOmHxh6zNqvS7HE5sEQvWPafhzTX//tD8mdgNSSTBnsq8vZhiAXbyR8B0j369Sv7P3tHCKE4D4yz5HyuEDzWiQFVtl5CTfxrfqARxrBBxk2NTeRnOjdw9DcThvlgEFSbnxofNmDFQAddkUlmgdYklIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6c9243-91d2-4549-ebfd-08df3eb0c63f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 22:28:27.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAp2NCISTkINFCfy5VLYPY5KwIZeyKgrN6VMUhpXXlCgt+eArJ9Bq+taV4mAXtqO+Yrj4ddHiROulyjgyZUK/64XyNlXepgN60SFEQ9w+eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:32:35PM -0300, Gustavo Sousa wrote:
> The Xe3p_LPG version 35.10 B0-step adds a new feature that allows
> 64-bit token for semaphore wait/signal commands.  With that, the
> PPHWSP layout was modified to store extra information associated with
> the new feature on a region that was previously considered part of the
> scratch area of the PPHWSP.  Previously the sw scratch area started at
> dword #34, and now that base has been pushed to dword #36.
> 
> It appears the value for LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR was meant
> to point at the beginning of the sw scratch space, but, because the
> hex 0x34 was used in the calculation instead of decimal 34, value is
> actually pointing a little further.  As such, we accidentally
> "future-proofed" our driver with respect to the layout changes
> discussed earlier.
> 
> Now let's make this future-proofing intentional and use a buffer area
> a bit bigger to allow future hardware extensions not to impact the
> driver code for some time.  Use dword 128 as the base for the area
> that is going to be used by the driver as scratch space.

As Umesh pointed out, HWSP offsets should get documented in the bspec to
avoid potential clashes with offsets that other software/firmware (like
the GuC) may be trying to use for other purposes.

Looking at the existing code, I think we can probably just consolidate
our two offsets today down to a single "dummy write" offset.  Keeping
the separate offsets mostly seems to be a cargo-cult from i915 where we
had a lot more offsets and some of them were important for coordination
between different software components.

In Xe, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR is only used with
PIPE_CONTROL (rcs/ccs engines) either during the post-amble (which
shouldn't even be needed on Xe2 and later, but appeases the gen9-gen12
requirement of PIPE_CONTROL when the "flush llc" bit is set), or when
applying Wa_14016712196.  LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR is only uses
on the media engines in PXP code.  Both offsets are just used for
"dummy" writes that behave like memory barriers (the address and value
don't really matter since no other software is actually watching or
waiting for those writes to show up).


Matt

> 
> Bspec: 60424
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.h | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index f2e829e62168..77949593562c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -51,8 +51,23 @@ struct xe_lrc_snapshot {
>  	u32 ctx_job_timestamp;
>  };
>  
> -#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
> -#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
> +/*
> + * The PPHWSP software scratch area starts at different locations
> + * depending on the IP:
> + *
> + *  - Before graphics version 35.10 B0-step: dword #34.
> + *  - Starting with graphics version 35.10 B0: dword #36.
> + *
> + * For our driver usage, we use a custom base that fits all supported
> + * IPs and adds some extra buffer in case future hardware updates end
> + * up reserving extra dwords and further pushing the base of the
> + * scratch area.
> + */
> +#define LRC_PPHWSP_SCRATCH_BASE			(128 * 4)
> +#define LRC_PPHWSP_SCRATCH_DW(idx)		(LRC_PPHWSP_SCRATCH_BASE + (idx) * 4)
> +
> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(0)
> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(12)
>  
>  #define LRC_WA_BB_SIZE SZ_4K
>  
> 
> ---
> base-commit: e96f23b42352b7b9fea6bf92bceed052533fb98e
> change-id: 20261106-xe3p-bump-pphwsp-scratch-bce9931eae4d
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
