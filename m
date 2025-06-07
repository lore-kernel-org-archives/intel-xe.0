Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E2C61CE7
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 00:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872E410E430;
	Sat,  7 Jun 2025 00:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0yOSHXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C677210E3EA
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 00:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749255088; x=1780791088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g3s1nkFHkTCzNHgl+hf8vTQNh6T4u9YG3oqcz4QPTOk=;
 b=L0yOSHXXyebquHJH0M1fypZkTj2N3iA8PnjvZmiizv3bg9NYe/m4sRjO
 p7qRc6ySY0QdBojOIbaBbTkQ2m/ZpeXmOcntvPNG4Z4MceFgws+DE8eBn
 im9rAmr6eET4Ix5iePsGNSpV8LTgUpdMQUk+GWTLDYsngBW9tIi1bIqT0
 E3R76xfXuU2DH7wuZcDK7ffv8wh3z2n1/P03xecNU74EcScfRS38OsQ4E
 Gp01aHp9RerGaQR7RujvAgU1jJ/Ptm4hiK4p0bLj2cnhvKkT6zUUOe+zW
 ZjdqNTw4QuMkHWri+P1A9pl7FHm2tvKbp7w1mybPlfhSDN1VMI2e/mzen w==;
X-CSE-ConnectionGUID: BuvZifRsREy21gzk7WO00A==
X-CSE-MsgGUID: n+aZ1JWDT4mB3bTjDgqMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51116324"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51116324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:11:27 -0700
X-CSE-ConnectionGUID: kSuhk/6lTF+JNyjuL9/dHA==
X-CSE-MsgGUID: /DtFl4WdSYOHPzuQawMKZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145891310"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:11:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:11:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:11:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA6m3R6AibEtgGFgf1q3BKYL0zCx2yZ+hlGfSJOaPXfExoyVKCevE2BV54l8c7Bp+6TJW1KiKvBLQLfLWjUdBUuhsTvSC/xV9VLk3n8DtO6p3gW5jpR1icBnKTzKQneT4hI4rErc82bzZJQCglZ3YRwwB+w2G6cOxRRGDJebtnZlsPDSzVeV7D8/TE1BPKW5tZAH0goMBdyfTO16owimji4HBzQJrFJhjvA4rvSPOY8rpHg/9tz7hhUEHsCQ6G1Wun4TpPWndfkrRQYFxmhob+RSXNduAmOYUaTRtElnRG0PgPz+GNe4M4l88R4Lc0amy4zPPFNexp4zLne/ARfEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyxILu31l63nqEvwp3lALQiqwWU17o3VBMd+O2lTIYc=;
 b=L6WLgVVY1wQP04WMhCKzLixLDtuImW0J6ykUsqKWAV12GvZPtgwgye9TYUAyrlYC9egdJ5wvK+r5MSOgHSfgoCco+J4leyUt5bMDYs7j9aX+UXLkQ8jTAChGIbI00wywc4dWOZW1ifTtnNEM0dZRrp9t2nHwoIVJXtL+HwtiGcdGMp/MSVQTE28+F3Ix4meY9RJtEFR8IFrp3mjKFi2IUZ8c10HlGNs1L8fBuYw/p8SMVEdhDjzM/Zpvfdb5YTy+TfxLkvVj6icvaHmkedbz5yxtE+OMvA0Fs77iT/Qf7kEGUNH76dPwX5PZiQXMOtuQm9xt4OvZzKSCHRIis2vecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 00:10:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Sat, 7 Jun 2025
 00:10:36 +0000
Date: Fri, 6 Jun 2025 19:10:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Message-ID: <v5kujvjlbrzqh6w6t44lr4ahli34muiwislesuswosultqb6cu@p5b736ppphdt>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
 <11b5e74326ea99b8d809e5018621bbbf3383b6df.camel@intel.com>
 <5f735205-387b-4a60-91ff-757747b4275a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5f735205-387b-4a60-91ff-757747b4275a@intel.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 020825f3-f300-468b-b515-08dda557ba65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bGhJXAP6MB5ronx7tZASI69Q1khh8atFa3F4ymm4RKXChj+w95KY2PKGckDd?=
 =?us-ascii?Q?n9H+Ps81+B4bU+yISoH1m5QFlsaQlF+DSoHhZaEYfMVOu+rUY4Nfo141v4wX?=
 =?us-ascii?Q?qrkrZWUPp3SYWMNWqKlqfVmYOcw6IK/vwl2SAnEhTzUu6RmwjhUjlKV/cVhX?=
 =?us-ascii?Q?9fJIkj9bv2lH6StU/e0LbY3YQtmxCoLUU3bqNF778YpBEd8vqbCLPiKDKWza?=
 =?us-ascii?Q?ddy7jCPCf3OcW0HsZLte3gFZbXxDoXPrHWLNLqLc6GW8FUfh/SudVRzNXuds?=
 =?us-ascii?Q?67eClsgRWbc4WiJAtFviqsZBgl9Y03rJnO2m+Ag7ptcCORNqcO1/cxfMAdue?=
 =?us-ascii?Q?/SD0wRCnKXkchVNucHciZPMBRMhig6mXflKxXzBVHlrhVxZDYkFxpuC3vCbu?=
 =?us-ascii?Q?jJ/Md/RetBcKDAo5MG5Trf87pf2WMu8wA9gzztU2qLGrVhq4NiDA3KbZJ0Ll?=
 =?us-ascii?Q?oHwQsTRj1nRYHAgDgOVo/9rXIf9j/ovflx43yUMYYlEKFiWwWl999bR86WMG?=
 =?us-ascii?Q?bycaBW7gdInoZ6bD21hPZw0LCYF+7P6/0zGDEtCfOIQVHpLQ1LAwJ0+ZISjD?=
 =?us-ascii?Q?bLCwjWlHk0czu6IGfrEdRCkxJNnk/2rxERJyndhmNZxm4i1hR9P22tUKj5fH?=
 =?us-ascii?Q?UPGqy6KOymwY7F0Eaf+ws4ypR4GpDPmLxRTI+7eYfIPB8dJZwWbj99wVnv6c?=
 =?us-ascii?Q?sEAeYjPXTU0sgjuZQ+HJ1oUzOXBCq4RjehJTcBcmNAGmWpswPYie5RxGwyL2?=
 =?us-ascii?Q?T+v/RUd2J68q5woZr6VP1OerVZ7nGJkToPXxnxJtwg2XB3T9CyKVGEdp4ngw?=
 =?us-ascii?Q?lBc/jOOADSUGW8q0zSlZkvbLODCkqzz6D8ZP7eqsq7kBFPqd4y6iANxMfGK4?=
 =?us-ascii?Q?dTxzdDJrMm+gr7b7j0ChbmmarmjDExREfUyXp3ybN3O07kBXDcU7zUAFX2f2?=
 =?us-ascii?Q?ynZ8VDyE1kyoCLBgsxDSduEwFsLll470OtOJCVYyZV9zWO5pGxPbNfl8ymXK?=
 =?us-ascii?Q?XPugm9IeyMXKeAq11z9HrIdLyVGF+QyKuDAuljUQ3pAjOrWQH7PdvuZtII3i?=
 =?us-ascii?Q?i9lZUItlHvu2NgPJ+xr5tTXzFXTxw8nnIwBcCySxBPZ6rKSC5/anl0Mgkm9A?=
 =?us-ascii?Q?OV8FVr79+00TqCGOCZjUeqPHfmt1v586mLn17sZM1xKD6n77sI7PncykVqig?=
 =?us-ascii?Q?wKnd3QhaG2yudt1IzztI9qoJ9pwqwvfrPldJ/F5KeEdveZMMLUc4rs+KX1i5?=
 =?us-ascii?Q?YCaoKpfpkKBQSjS+Dm1YDNgqDez9OUuBgsrkysAyNBVZ5yXISZf9pgqcsStJ?=
 =?us-ascii?Q?4FhtxttCALIFR7ODaHx3APs8c4ulfGIM46C214HnRyZ+lnn6759OC4omkGGn?=
 =?us-ascii?Q?5kl0Ta5gMP9HUzqiKJplnqEVQh/EUAo7gKvkkRujs8uBJ3f/YMOlomXKTXg6?=
 =?us-ascii?Q?O5pZDv4EdP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEVev+KiYfTJxoM/9knNViXIV7gJuQquG6jLbZFMsgrsRFRKmAlcmq2u0D8+?=
 =?us-ascii?Q?gQWGTSgBXWiVka4A6no++UQCLnnVEG/JNb5Bj1DeS8OIx3c29B7P7NHEUTz7?=
 =?us-ascii?Q?DDBzzD094hXEBigA4joB9yqwuvOGBwcq9VyUqqJC3gvZWNDoUQRCkAQ1hAha?=
 =?us-ascii?Q?ehri6yCcAisNugwoazUgU/wHGnAhv7rRtFfqEIDha1JyasbR/7vKIAdLfdAW?=
 =?us-ascii?Q?R3Tp1WR2x+1ly/4M6MQHTLAilkULvTQkkAFCuV/wrC4n/VbcNyFihz9+AK2L?=
 =?us-ascii?Q?Llxz/NEjUax5HLmyr2+D4lmBTkqwItdL2jUW1uzjFEyp7WM2jIj5TXb0jxsv?=
 =?us-ascii?Q?E8CY36Myr/b6n0OVBcWtU9L53aBJilElXNVbUE2IaBBpMRAIjSC2qkC4a74c?=
 =?us-ascii?Q?VF/YxXrKwy++0SF82pTk2U3PlG33/7KJRsUmv2CRKmygjxRZMHJT+mzEujZm?=
 =?us-ascii?Q?0WVdLYMa90FduEW5OzTD0bBicjk5Qz0Lw894TAQkDvfxjm2l/2lPdCI6s7z5?=
 =?us-ascii?Q?IXvA0W09LaN1im8XHXazzBEyhlBY4+IIt3wVdyOnGzXgC3h5QI9cRd3YHWP6?=
 =?us-ascii?Q?uzK9AyxmRFBwCBEkd0OVebiyxlgSqJBczUJTZeoDNGfNX8rKnG3FCfCQIKtK?=
 =?us-ascii?Q?KTwvy/5DXiYYe/s08VWx/t24U26hKQjOdCm5/S2f/ImhZVRp/S447OlqHoKh?=
 =?us-ascii?Q?sJy0Lx+7eHuWZf5Ddod5bPDTvURR/fM7J/p57unS74vt7iwOyPUwJsH5nLU8?=
 =?us-ascii?Q?IYvO2f3i2/xrqE3sFSWGW0nwl17gdw2NSyqqrwP45kpYBRjc3WB1IKSUpGtd?=
 =?us-ascii?Q?Pg3pMyHMss98zmha215MWSZDGp1rSMTqr4OpjZx6+C9ZTfWDJMheQwXd3P1+?=
 =?us-ascii?Q?XUCXTEZ4Wclvu9prCVqgDYep+g6QQwQSWSfKwTYquwbd8URrjllMJWIusDQn?=
 =?us-ascii?Q?NQ8Urhz9liWKTX6g53wu6A66/2ZL2FUIKIELoMULzzx1hh/y8xbDYhaprEVP?=
 =?us-ascii?Q?iC8P9Asb0RXYzIec6GpKQDPQemsHvJlSP5eU3hl2W0zaKR7HPGwmHBDSMraQ?=
 =?us-ascii?Q?2RTXl6psKw4eJK201DwXwt3QSxevRq64yPp3OvtbB3S8Vrq6j7aD+a99MaQC?=
 =?us-ascii?Q?sf6MS4aP8DZfgWUBUk1+an/X3D859wzuuDYiERTwvwFtJjosa9WSZMQ55vCM?=
 =?us-ascii?Q?cA2VhPj536G3FmKAznZJVZt4sWpSZCRgjZj1OZQn+XxjZIesu/mi56bwuMy4?=
 =?us-ascii?Q?xtr6RTNYW1JIOluaxDabn8LBQJdAI2CAvquqBh9O/EjXkBcepbIhOMVPsR8u?=
 =?us-ascii?Q?n27ylXx7v5bwdz4/HBXQZS4kSH3zSUCW32u03GE+3NwBPWl0UL/H4HRMNey7?=
 =?us-ascii?Q?0J9aDlGAlngKFFGDBpXUSrCtuvhDeYr2eP5l75j3USP5LWSPxVWFkjzmWBAJ?=
 =?us-ascii?Q?XnSAsNbwyrezvAMmdzWLXKLGFHc80CVbgyk/HlmGDxPObYG2WmC8SIh6dN09?=
 =?us-ascii?Q?TxIwjX/l5uJhjr45td5ZPcyTnVw957t+ZTA2xLwE0Quc66E9P/lgWBOi1GaW?=
 =?us-ascii?Q?Hr8LczrIhd8qAdvwU8VBHrmI9UCax89raRWcy6UEE13sZA0MT9v+Iymp0YEO?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020825f3-f300-468b-b515-08dda557ba65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:10:36.6522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvJCM6TqnXBbtA59v1hVkGWn+Y5Pglax36vcTR+dRHOJQoCmeFB1XrLoxPOWaGApCWlr3/KTAnWBP+jAA4iseuZiyn2fXg66D4LlgCnMnvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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

On Tue, Jun 03, 2025 at 11:42:54AM -0700, Belgaumkar, Vinay wrote:
>
>On 6/3/2025 10:34 AM, Summers, Stuart wrote:
>>On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>>>Messaging to GuC may get canceled when device is wedged. Don't
>>>flag this as an error in xe_guc_pc code.
>>So if we're wedged already we are already in an error state right? I
>>can understand flagging additional errors maybe gives a false negative,
>>or rather would prompt us to look at the earlier errors to make sure
>>these aren't just cascading, but do we really need to check for this?
>
>Yes, to avoid flase CI errors. This was actually for a CI failure seen 
>in the previous patch.

order should be inverted then. Make this patch the #1 and the other the
#2.

Lucas De Marchi
