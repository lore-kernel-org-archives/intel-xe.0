Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B141C021B8
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 05:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCD110E12F;
	Sat,  1 Mar 2025 05:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFRIkll3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20910E12F
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 05:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740808160; x=1772344160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LXtCjPiXQLulsS8rn/MoSrMdEWn5PQ2oXselruksoW8=;
 b=CFRIkll3M/mkB3vuvusssBAfxHecYJ1Hq2SDmqPbbk8cThEcpFUtS+0N
 xkgr8Mkv30kku3XHQR9CBTVWWYbrX6AL9NHmm6fQs5zL8a9Z08sh9xKqZ
 JDsjx15OS3U2rYxgBLQ3ZyqIV5T3o1KvfiQawqIGqaKAC5OL80MQ7EpTx
 QhORCSa4gQXG+TMlMBfqHn8ajNQvhmSW9U788ISc2tLWV3QDOI3rA09Ub
 DOTlwQRVlICmYEboBm748GlXUb7RFKRW3INezWlhJoLgHHV16S18AVx2U
 TV84CcfFx8BlQPFyLhZyWZQ9b4IyPhUc57Q0izTp1C9rkE6ARrwveA2eP Q==;
X-CSE-ConnectionGUID: sRoa81Y3SCO5eG0Cz/NC1Q==
X-CSE-MsgGUID: KNu0sPJrRnmE2wnJryzv5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41936363"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41936363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 21:49:19 -0800
X-CSE-ConnectionGUID: O1aJs3+bSsm/9ssnJUYyUQ==
X-CSE-MsgGUID: WiE0NXg6TNSr34HesG/qeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="140752900"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 21:49:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 21:49:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 21:49:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 21:49:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo99CdEsOd409phyuq4jRNS3OyBIWLq9UIsDapsQCuhx1RkjWS0h2rcQl4/EyRlXi+YJgUJIYE0kMiJNhRfTKZLgswHEhQ5muoHSeu9mPPUenWi3i++fCe+UF3oSNvfGQV8oh5Tc+mln8JrjwlQ0ZpCZdEBBQD2OhF5OUDgCPy3gKQiy1n0av2VSn5aBZn6AwJnoR6ZWRaoeh7+Xotn5bD/B7av6go/K92tx0+CrfiusH+gJtwo+DCSfojQyFHH9ndufNP5hONdNJq1kB4ZbbLOEczBtC4cCH3XsJVlB0bRYHMISgJzL5x8ldMjhEBwy/qzJ1sm3MZudP2Wok1vqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvO00MMbn7BzkgC2gvdDSDX8ZsFeD41UQkAw+hXhUBo=;
 b=w6Z7cCoLMHpgHfFhb/n2rMIgECEmV9k5yhgC/0s/3GKNZXJoqtPatsSJmvv08XWzp/tDXJJAZQd9K10hS1JxMWAd70Wogj/grtJrTWnkpwCF2ChF4Zf+Tmr6l2ProGncrR3Uhk4T+vc/TY3L5pqqvY5dFV6PtjlNmJgjc3zo+R3U6NS3Cq+5WLOTgCYLMgZhUNRqN1Ep309MEZtWkXxXqcCfxmZdtnX5XAeQGUMJnHfaCNZIquU+JbrKpAJGMs7ggqB9EzZGEhTGWSgsLB618Vqmd2y/28t7PpTre0mjKvc7fnqr5pYBJ03DRDgVRI0Qgx+jo8XQ2yKOaeWFa8Jqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.22; Sat, 1 Mar 2025 05:48:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Sat, 1 Mar 2025
 05:48:34 +0000
Date: Fri, 28 Feb 2025 23:48:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 4/5] drm/xe/xelp: L3 recommended hashing mask
Message-ID: <ieloss43p2xdjidty3kszv3gcwsygnchmjt63xi46urx55t7kt@bqc7juwqgdab>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
 <20250227212110.GS4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227212110.GS4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: a83388e9-ab05-4273-bedc-08dd5884b47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sQifo046bkXNWUL0RH014dHdjQ7p/7nZI9H6BceKrAr/v4+bI//ZIbL0vPVp?=
 =?us-ascii?Q?vbCM06ihk4GPNr8XQkWxUHm8FMZgWKjcjIiGZV4Y0WxOBqPzJEs9bIA0KiXg?=
 =?us-ascii?Q?atcqn7yLPaMdYtjCQRsZJP98NWCQXwY4cPe6ijcXhauJ1X7+10rvZyRqVSoI?=
 =?us-ascii?Q?LccVWyq62fxXeuILTUX0znfivArX/d18r9hQ1k+uh3ljpQ1lsvBwg6vj7v78?=
 =?us-ascii?Q?WGOUV5RvN0HZ4akN3LoVS69/W15W622zWi42EZlxvK6aOd6OH5vjkvN/d+G3?=
 =?us-ascii?Q?stw8l7UVfXZxVeU9wFUggJBpy+W45+LWMzVgeSCFZoZBYkzj8+EHw1pC3GMR?=
 =?us-ascii?Q?SurMzTehRHFuzeaIxGywKMoWQX/4RlPFHCMtX4tEioXiKoWelo7SWiZpgs5O?=
 =?us-ascii?Q?qHxGtpuwzyo4q84j81FajczbJxmzd+1Y4rGih2cIA8S3bXH8Bo1H4S986rpK?=
 =?us-ascii?Q?skgBy9GXE7Kgcg9+DnCQurfkb0VCbiS/uHRPFrcm9TWLYm683WnOV/+Wzcre?=
 =?us-ascii?Q?ye+UjlgKV5+cW7/+QLW95vXh4YDPD9WbUjueJ6coycD1j3ik+3gOLdPaQn3v?=
 =?us-ascii?Q?z1tTuMiKEeu3s3nF9Zj6o5P0T6wFcyMztssm2+vBA0LVPjNYlXZYjjZTNw/w?=
 =?us-ascii?Q?E1uRVIIb5xAxGb76aLDxOXrqePEJph1CJcBGYHry57URbHZNtPtVM6GBYUBn?=
 =?us-ascii?Q?bC7gCTnPI1nPbDBkZa9KM/3aklBJT7wUnXhehVCWPjsD/5bznnciETGC6+y8?=
 =?us-ascii?Q?upm/n6fzw9l4dq/20yKIxCx40kw/2isvLHAJUAl3Mdi/oZiuyMiqhk4zn4oD?=
 =?us-ascii?Q?pKi2kW1PY6WSmUqfK1UkGffUHqJIIbGpu1yzhz5DE5tr/5ARMjNShxguDbm1?=
 =?us-ascii?Q?094Dfz3aerKYCD2kDYmGrw9OsVOJmSAMLUTSh+UCDPNFLMAgn1ScKr12Y2d7?=
 =?us-ascii?Q?Qu555CVN0P7wy/u5fq5zwczfj+XfCXOAxdXJpVHMZ5/1wYl+FsTv674cxozS?=
 =?us-ascii?Q?e4XwwvHc3wF0mbXli333eQLQfQC/rkKZH/TBDIfLNzUBwzFJavPcxFT3gkt3?=
 =?us-ascii?Q?TmNRy7qzUrPLPQ3sAgwTqfzh7G4Zgf4kX9BEbmt6ofAT1OoHtaS1SoW/ehAA?=
 =?us-ascii?Q?+193maUnjH93HtWfC4HkWLVg8MEtm+xJQsq/umGUlmwgUq4HNbzNpIEEIRjR?=
 =?us-ascii?Q?2zCkUrnxqEreTq48P0s6d3Qv+JUtN2une8HDpjaTw0+OFzJKd5QWDWSotTHD?=
 =?us-ascii?Q?naC9KMt+rvMvZwA7gRhe9haNAXLyu0eyeytIv2N7/FV5yGcfTnzFWVjoYRQk?=
 =?us-ascii?Q?/DNYidZUtoJgO20AvuDp+2ryh9NoOSG4Db+MbHGGDZjBFlL+J5bg3BpRsdsq?=
 =?us-ascii?Q?pm4ogTfygfQQWm1uipimMuYCBkR5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FL0no+3jvNVarmgTURC1HBVIVPpWMqriasWIdpPUNJ/Xqf7iXPCU6tIYFJEr?=
 =?us-ascii?Q?ZF1wT4j5phcHa2n0KSkPA22TavvpC6rhHM2Z1fjKLvF4F8tSoU1utQ96h0si?=
 =?us-ascii?Q?Ok6rffJE8DVakIITxJX3daQN8TyX4Xp1+YCcUpYc53RFdPoxGPddCIoInCaj?=
 =?us-ascii?Q?8EkVng+WXGMOFPcjcvS7e+k+k7WlveYiS+3a+8FphJm+oCheZ4t1R26RBpJ2?=
 =?us-ascii?Q?NI4+iNAbX9WKgkBmC4CY4z3z/uv7/SNc5lcS3v/+qbwlcQ0k5IWHU2i2w3Ar?=
 =?us-ascii?Q?++nUqXde0nzVgVSeQDGbPHcOYvyeJykuKkgaBnCSEAa1sNYB9UvvRBRbAXKy?=
 =?us-ascii?Q?cPr0WqhFv8x37lIO+tneOAA03uyJBOsxtzZo0XHsfn2g1I+bBvwewSajXFoB?=
 =?us-ascii?Q?bZR/kqkuh54cHDHzGqa+wMYm9ISoNFkbkXzjeUZxrAoVpsIhEIXTPriRiEvL?=
 =?us-ascii?Q?zOAyop092ZSvOKgs4hCyN5NTusrv5TTyyut+7xfSWkGm3ldiPTG00XeKjQIH?=
 =?us-ascii?Q?Lqsel52SKJ3zC4Dz19TQ3JfIWd/cKTAHEfqs9DICKNSFCgNF63hBMZ8PAyPF?=
 =?us-ascii?Q?bEA+d/1PKdLBiT0yZJlux1IfeH3tzG59gMnfU/KpWpBbSpptr79R9k3bDlzQ?=
 =?us-ascii?Q?BpYNeCiX7N4AZlSvHe2wDGsBaJgOMqvBAdwnrc962dfUy0x5uA8LDt+/OBC5?=
 =?us-ascii?Q?FEE9YoYuMzNV9Zsox5Md+zchzJPhhct0M3Fq9onRzUVxNqOh8ImpIW/Luapo?=
 =?us-ascii?Q?zP0dkciRDXM+cxO3G8IC8oXSjpLlAm6hrK6hUQXc0urKxpLfvPfnSqTunRwK?=
 =?us-ascii?Q?YHND2mrYlu2Z+e+zES9iACIPwfdy8UHhl+I2pe2JG3i/kW94Oaa81tn1zais?=
 =?us-ascii?Q?io6SO2rugQ/l12C/p7Lop+xuP21fwV9UUHU1lrBJqVATD/yIcy9D42aKRmd9?=
 =?us-ascii?Q?SUOLhRoAziQ+N0xuXD/3qmLep+0nr8F8XkLtGSZIoRtow5+kfRF1sVJS4Pg2?=
 =?us-ascii?Q?AlGzczY3BGH7/krtHdQrctBeTz2He/JID9rqngVb0usN52PtCGej40sS9F7w?=
 =?us-ascii?Q?dxyF6EtRWrZ8RitSJiRjG80KWJ1nzJJ70zDRrlSaV6Xg1nCpxOzimQmfVLzA?=
 =?us-ascii?Q?qRgyfUKg466vYBULr6tTf+rk51sAKLaTofy/XwBmN3EDvJkRQE5V/qMpG2dx?=
 =?us-ascii?Q?DfKws+QrhpJ2WndS2N6jIC8r44detAS/n+fG6GrAMZKdA3L+ovy4WHqa0E2W?=
 =?us-ascii?Q?n1rSwpctXsLOeG9k1oFy83Dv2cMHAMki2KNxbmo81CSv+FpQT09sERMSjNEP?=
 =?us-ascii?Q?9Y0sa9ynFNmoO2FIhOniAUJpBaBdnPvOEeQ8AOUDbKZZL2oQg64l8cyXIxAv?=
 =?us-ascii?Q?e33u0VYTyogT2GyaS0E6C7sCTMH+9GuaBFlYQK0y1se+MzUwvilOWT6edyb6?=
 =?us-ascii?Q?rByZ1JHj+c9FvbVf9+CQj77Nx+xWy8RnjtvHvan+pypSJ12cnvO12v9Zr8OF?=
 =?us-ascii?Q?OdJRWYwNBrtVHNI2TD4YwZqZqhkvF7eTWkn6ESejbL4Vd2BhpmdVOSl67Ulq?=
 =?us-ascii?Q?LHluUYCwMtNNAb5yFmPbWH5iwBufEhGUdWfOzsp3DadD0jIHqlOBXl4iKeTN?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a83388e9-ab05-4273-bedc-08dd5884b47d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 05:48:34.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Aaf+0117YvUOEPLuJa4SRD5ZLCgn8FSTiZpSmCV2gRTNIMvUQq+dxLQzCSozUMUtHDzuKJg6moFDntPaEScwQSPvqxrWqXZIQ668NhC8Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Thu, Feb 27, 2025 at 01:21:10PM -0800, Matt Roper wrote:
>On Thu, Feb 27, 2025 at 10:13:03AM +0000, Tvrtko Ursulin wrote:
>> According to the i915 codebase xe missed to set the recommended
>> performance tuning for L3 hashing which is applicable to all legacy XeLP
>> platforms. Lets add it.
>>
>> v2:
>>  * Rename prefixes to XELP_.
>>  * Tweak version end point.
>>
>> v3:
>>  * Add bspec tag.
>>  * Tweak version range.
>>
>> v4:
>>  * Move from LRC to engine tunings list.
>>
>> Bspec: 31870
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 ++++-
>>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 282afd22b68b..da833a147c0c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -365,10 +365,13 @@
>>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>  #define FORCEWAKE_GSC				XE_REG(0xa618)
>>
>> +/* L3 Cache Control */
>
>Did you mean to move this comment?  This was originally intended to
>refer to the "l3cc" MOCS values in the LNCFMOCS registers that people
>may remember from older platforms on i915.  Even though 0xb004 is also
>doing L3-related stuff, it's not providing the specific l3cc values the
>comment here was originally written for.
>
>I'd be inclined to just drop the comment completely at this point; I'm
>not sure it's really providing any useful insight to anyone.
>
>Anyway, the actual tuning looks correct, so aside from the comment,
>
>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I dropped that comment and applied everything to drm-xe-next.

Thanks
Lucas De Marchi

>
>
>Matt
>
>> +#define XELP_GARBCNTL				XE_REG(0xb004)
>> +#define   XELP_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
>> +
>>  #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>>
>> -/* L3 Cache Control */
>>  #define LNCFCMOCS_REG_COUNT			32
>>  #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>>  #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> index 3c78f3d71559..551c2f308e1c 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -88,6 +88,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>  };
>>
>>  static const struct xe_rtp_entry_sr engine_tunings[] = {
>> +	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>> +	  XE_RTP_ACTIONS(CLR(XELP_GARBCNTL, XELP_BUS_HASH_CTL_BIT_EXC))
>> +	},
>>  	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>>  		       ENGINE_CLASS(RENDER)),
>> --
>> 2.48.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
