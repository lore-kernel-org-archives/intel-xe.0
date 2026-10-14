Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492ADCC6B2C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 20:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F422A10EACD;
	Wed, 14 Oct 2026 20:02:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101F710EACD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792008121; x=1823544121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uGKGFdkkhzsJqTpAXQrhUXkZVvolhvh+dl8Aa/Nl09c=;
 b=g3ky5claCJIu3c6Gf8gr3K6ReUvOJxecbY9hICGvYPdsJlgr/eYNf7Bw
 3eJZmO+Sw6rRGtDHkqdVcKe2GbLPxGYVLTyicToRxU9M+pq1YkG5pf0qX
 kElheO/OOu8pDGjrcXvN27/I/uUPpAFEs768ygoGWJzYxz9ckjyngcSi8
 kz4lXsHhsXXRQeBJWbC0QPc0rECzMOp4ss9TqepHeLirH9YOh0HaOWM2B
 1fVBqv+sfe+pGSL7KLidGeeiM7j7H+RY33spchECVxtmUXvNz/tzxWaJJ
 pKmsNuToCUqGy05vpZDgMIEe9CPEAUoj3DFG+CjFc9LIUNTjyI2pjaDOZ A==;
X-CSE-ConnectionGUID: +fzy47q9R9mwgKzkZGuLuw==
X-CSE-MsgGUID: GItKVqYbRM6T9SXOPXht0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="655825"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="655825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 13:02:01 -0700
X-CSE-ConnectionGUID: 0OV7MoxpRjC++aqOYPPQFQ==
X-CSE-MsgGUID: Wgxg3WU3RxSOY7+jjVw/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1418526"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 13:02:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:02:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 13:02:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFSahEhtwpn2kmpiC92mKEJvCffQv2Nh+4wOmpPHXjRGbrLSpsbsYvkMm/avUwrpS60eh6lw70wh5IVBavQSII3KJO8RkBuWvqVxcXBZr50fZdsVGzat9cZTAO24xl89RKBXkaRnc1V1kegFVX7hRksUCZy6TWMfmNOKBi9PYkQUoYdt+acb28lSUL1O4l6Z3uzXYpyptjEjZPdxXSqBdtPe8/JjSaX80MA9D3Fup69lolj59n+EMd7KzJes7fIlLS3Qfop7Ut6/rRUPs7KapjChjQb5gG+etKZvV5XVdbWlaU4PLy3ful8MlZCIUoHV0vxRatuwLVJHqpLIiRje1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEZwgkdi1K6NrqLmPKsahzz8LKjDHNTL/HztGavFx70=;
 b=Q/oV8VlmZ8KaW0jaSbK/eGp2R2Yxoc29O9TxbCinSn54I6HQyJgjvTV9VRTpZLRB5h2cQkw/SJw285qJ5QJOKYmtucyb/4Y8MNUVQdVbI+kqEZfh8BpW4pL415MmBHIk83DgYJdxXTxEiRCyEdz7/st5FMixex1OdYz+l5+coUxApY8M6wMSXT1O9FYWChl2iqcLzQMhHYrAbQOjZC0VaoiL7b05wcM8K8AFPv4DKH5bXU+PfE2f9EQ1XHfnPbZlDPlObUR48wVJJw/QQ+igQ3PydikS5vu+vj2zPK8CZ3rDRvpP+/U+v4/0RB9gT/lcLP+GNqflfSXi8L/q4Z19mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 20:01:53 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 20:01:52 +0000
Date: Wed, 14 Oct 2026 16:01:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v13 12/16] drm/xe/hwmon: Update memory controller
 temperature offset for CRI
Message-ID: <as_frGsOPZa89Nq4@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-13-karthik.poosa@intel.com>
 <as_BTb-GDagB03do@intel.com>
 <e7e47f48-112f-48b3-898f-af2a4fc6788c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7e47f48-112f-48b3-898f-af2a4fc6788c@intel.com>
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9be444-c22e-46e2-a149-08df2a2dfd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: JLliBbJColorZQ+ji8dEv85+T0HMS1pdX5PgjDx+Fc0dOM92J2cbvDTdalMi5r77biH9tJIuGeeDJZbtEBkt6Dpb8RmDcx41Ouj5gcU3IHxvkYe0oCzN2xHpdpV6jCzow+fJuW24veMFU+9A2ULOUfCGl3VobGeKGdB5S3aAYEMJgjcbWw3bxYrle8e0PfootDAhwPxYomtychNlj6a3BArqLp9SvLYT1FHqZo4j/42R95uGICGaQiiFiWFITuXowq57oh36Y0MtlQwiDv9Ekr7xtS/eFK5i0LfYIkopXh+eCysROKPIio+nfuFGwaZSnzVJVgSNjHwy1Jm5Uln9knsWeAWrzgCVXMX55VVE+UoDPT7rt3woK/1Zs0qP4S0ILG2tC0FZ6eYBdENFP+636tv5sn/AA819HIf7BxujknCWKWTjEAzTPjfJVQomFD9TVj1X8tgfprLEPG/7uYcAc/3k3OC/haPOacTmlYgWokkFUmvwLC1F6KF9TATPEPQA9yM/WhLbXyj/PS6uib44kvQ5XTpMDX1nUbAiQng0+h85co8bR4vG7H+CZduW5U24Iix5SseqbCov/84WunBVmq6sAY26Ip7dBPqN79BsEyroq1w09UW4avDJ2CZDCVH+dgOEUN3DDCezF+bG7QFaMtusXdCKioviimM2WbK5Jfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKn7O2jiwonpfQuSWUvE+Lg3HuG9xOO7keiMmBdK4BfKeMTRUNGWlBDRbo+1?=
 =?us-ascii?Q?oN4z7iwQHJXaHZYOJULFNmCgI9gaiNUbF+rE/zwscv87tTiJT3M1JohLqa30?=
 =?us-ascii?Q?MSwv4J+s16pNupcKSl8z3Pq/8G6nr7I+TeDWQLZISN8WIc8Ku/C++0tSzR44?=
 =?us-ascii?Q?L9DLP+z2snVq5Yo9Bz4Q8GZauVyWKZ9vpca5lmzVaqPP0LiZLGKzizsKmKRJ?=
 =?us-ascii?Q?yacyMCxxaajtg/tzFZof33boED5fYCfOGCdV3ifgv+gGxcRCfXrBZTmOklc5?=
 =?us-ascii?Q?xCB38jL1FxFvL80epgsUi7KMVlYRoJWHdKrRTz1jtySzlLiQF1AXCrqJpwlp?=
 =?us-ascii?Q?BZpbsH+HEpg/vwkShnMQi8ApZkdYZuoRwy19NCC1ixIve7LetbEEG99u4sUb?=
 =?us-ascii?Q?RzOw/mBBUJ3zaLLeqsU/3MWeo/Y5yqJe6DZ8K/MesSAHKJixsbZ5SMvGENPV?=
 =?us-ascii?Q?jzRW2wWbdyeFrnSola4E13ypn0uBB3RyF2WlPlytwSUvMXgK2E7ZKoWOkTBh?=
 =?us-ascii?Q?kCHi3bw5OiCLt5mIKwKoI54E13shPKNoNX1RsEhvSAGkfehweBeJupVbfTg+?=
 =?us-ascii?Q?eh/rTL7d14Ya9v/P08v9E32/T1pvvhYHwgAzDZLIiuW2K2dL1vfT6KKCXJXM?=
 =?us-ascii?Q?z9HXc4QdgUECct1XiOGLz9vMHWY2lclmAUeFeS2m2F78Zm6DHyUgEuylIOs8?=
 =?us-ascii?Q?3gxzoliddZN7LXa7yk993R9UZoZnumYl38b4ybULCWOWO5apxH7SnUY75dTz?=
 =?us-ascii?Q?liQyGGdmSslYq1cyH2h6AsYGyqnu2KrE362KwjQqeBNFEYO8dH4ZRePrABz6?=
 =?us-ascii?Q?0AHlkdRl1ILIc84Vl6bqUEuRKfsuRb6q9WgreL68KsjCrIl3lNnzpv663t2I?=
 =?us-ascii?Q?bJGjLrd8yp/ofF7riJ85W6ox5s9J/rNckkHpXY1cqfq5rYOwgqo+9Cr4uJ60?=
 =?us-ascii?Q?nIFq+/92a7gJH2zOo8uogeZQAnsycoTSaqOqfBO9Ii+tV0atQv1gWB7IFa1T?=
 =?us-ascii?Q?2jldWi7nrx9yzXf/hurR+kNblTSmyjDIf4Rt9x/wnS99wtNs/QD7Kzn/9yax?=
 =?us-ascii?Q?rqC5XbO2XkrgflMoEi2iDV2gxYGpsyLyxN3s9zbzAAMurjHerhcv1/dsrwJf?=
 =?us-ascii?Q?Y6Kcfne1s5uyxrpB2BYYqdZNjcWJ1wae1pO4+lK2KkiRlNyVI6lfmOkW2gpL?=
 =?us-ascii?Q?tWIfTNAhhwfjc61D0CH+tj+Q4BUpmqpRgzUwNgSMbanjrdyZqNwOqvzAtPBO?=
 =?us-ascii?Q?Z1NcRnigZSPKQy2f5kVMrQYnJ7KKPgPiA3VHyBQwU5SNDgsgL/zieM5xuY3v?=
 =?us-ascii?Q?ih77dH3JzjoECUoyXEQGUG9ZkOJYEpZ2UItUr4lyh/Al+bRFd5V9oTvWQnJ0?=
 =?us-ascii?Q?X8RpUwlVONbOnhzy9R/1jptuKt+i3ADXQGGbOMOv9YwAFghPgMiu9TMBabCy?=
 =?us-ascii?Q?kaKyG1c3kwRVP5jpEaI3BNu50MBmkexFc7Qj444A6z62sM+325ioUesmkFyJ?=
 =?us-ascii?Q?kEuIrw54ODBIJ2ybDt5taVV7ZlOjLKxO7aZ96dl4D2OZACXgX6KFKpsnBQo2?=
 =?us-ascii?Q?MXzeLoRRX+00OapYtEbPo3EEWSjPNjEKWX8Gh8bLto2wZKiWe4Z1KWQEwqdf?=
 =?us-ascii?Q?QXAF8yPOtu7a9o1FsOjx/lQ9IKYNXmiiCIzOZiry+S4fIpL+LzzBDiIO6KDq?=
 =?us-ascii?Q?Ltg2F8JVqIbTCj/32EbiM2SJ4iq9bQLdXPbWbgum21RetBkxoE4hCPCkqmAe?=
 =?us-ascii?Q?5yKpmCJ7Gg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wb6qkpZhPhvoyE1+6Mpd/2Dd0omm3xEE/5s078MS40k0O5kOWtIttWGTPAOQdCXqosHPJfL++B9wVh4hAjeTtdZsNdoot7ddeJv4nuPjaODyCDy4bOjGs4FS2xhKR15AziXudrozu0kX8+swEhYR67Ki4X3T54EH7eXzlwsE8EIFOfidR2rLT+G4AUpVZCST95xLE8ncXWmCw2lNSlLeA3ZXmVscWtWEHQ0SFBUI6QITC6eLNkYHDCl01sN/wBN/nG8yAU6DMqSeaI4v/U3dNVFPo7JcU69GwEKaft4ja15ae2Dzi/hhD/rcFU4BlT7a6XGlrZ8H0xYo6NP9d50/cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9be444-c22e-46e2-a149-08df2a2dfd6c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:01:52.8232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 376RhkHgcIJuHTjJj0jQkL6uYZIKpo8KPxdsFFIVKzd7/K541ptjgEuW6OnqbbfCYwGLWP6EENBPOt+id3YI8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

On Thu, Oct 15, 2026 at 01:03:36AM +0530, Poosa, Karthik wrote:
> 
> On 14-10-2026 23:22, Rodrigo Vivi wrote:
> > On Wed, Oct 14, 2026 at 05:28:02PM +0530, Karthik Poosa wrote:
> > > On CRI the memory controller temperatures moved in the READ_THERMAL_DATA
> > > output: they now occupy bytes 16..19 instead of starting at byte 2.
> > > 
> > > Read and average the CRI memory controller sensors from bytes 16..19,
> > > keeping the existing byte 2..count-1 range for earlier platforms. Only
> > > the group(s) covering the used bytes are fetched.
> > > 
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > > 
> > > v2: Use the CRI memory temperature mapping only on
> > >      Crescent Island. (sashiko)
> > > 
> > >   drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
> > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > index dad2397db141..eef6560569ce 100644
> > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > @@ -109,6 +109,10 @@ enum sensor_attr_power {
> > >   /* Index of memory controller in READ_THERMAL_DATA output */
> > >   #define TEMP_INDEX_MCTRL	2
> > > +/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
> > > +#define CRI_TEMP_INDEX_MCTRL	16
> > > +#define CRI_TEMP_MCTRL_COUNT	4
> > > +
> > >   /* Mailbox sentinel reported for an unavailable temperature sensor */
> > >   #define TEMP_MBX_INVALID	0xFF
> > > @@ -986,14 +990,22 @@ static int mbx_temp_decode(u8 value)
> > >   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> > >   {
> > >   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> > > -	int ret, i, count = 0;
> > > +	int ret, i, start, end, count = 0;
> > >   	s32 average = 0;
> > > +	u32 data = 0;
> > >   	guard(mutex)(&hwmon->hwmon_lock);
> > > -	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
> > > -		u32 data = 0;
> > > +	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
> > > +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
> > we need to be consistent... we either use >= cri everywhere or we use ==...
> 
> I used == explicitly here, as sensor mapping can change based on the
> platform configuration.
> 
> where as MMIO definitions and mailbox definitions are expected to be same in
> future platforms.

I'm afraid we cannot assure that. I just want us to be consistent,
that's all.

> 
> if those can change, I shall make all places == XE_CRESCENTISLAND

probably better.
with that:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and keep anywhere that is modified

> 
> > 
> > > +		start = CRI_TEMP_INDEX_MCTRL;
> > > +		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
> > > +	} else {
> > > +		start = TEMP_INDEX_MCTRL;
> > > +		end = hwmon->temp.count - 1;
> > > +	}
> > > +	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
> > >   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> > >   				    &data, NULL);
> > >   		if (ret)
> > > @@ -1002,7 +1014,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> > >   		hwmon->temp.dword[i] = cpu_to_le32(data);
> > >   	}
> > > -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> > > +	for (i = start; i < end; i++) {
> > >   		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
> > >   			continue;
> > >   		average += mbx_temp_decode(hwmon->temp.value[i]);
> > > -- 
> > > 2.25.1
> > > 
