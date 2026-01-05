Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB9C98331
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 20:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93010E1E1;
	Mon,  5 Jan 2026 20:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqgaRZCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63D10E1E1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767644685; x=1799180685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eczO3TqOShuRu1joFIh8GVYw+DRGrU54gBb9Lu6JCeQ=;
 b=TqgaRZCQd/4DMXHE3bn8QRbTvqT9SGrkEyI99TsvZPrdSEEbXQqsC6Co
 sMKhogy4XzdPS4fWCtK7CzCGbib2GgtMRD8tAynI+gycZOp/0cbmuaAP7
 5WnOcfBa+ZYga00h0Iz7SOpfKRYlUG8Skp/HTQTQ/sLNzdoHiqhhOPQrB
 jndrJE703GwMPb436cKe2J6VGIQRw/tPgR9kjlByeUZI78n0nULHEBL6l
 hMx6NVbvX+OsEaFCiKyvuRmgNNN0017Uih1lVPxFbJypQevNwZqKoYJHN
 9FqIDdCf4s0CFgrALaOL2wVbk904NtvUPMbZ0Asx0URwNmeGQOn0LXK2U w==;
X-CSE-ConnectionGUID: LQopp0JuRq2/fYJgAa3tPQ==
X-CSE-MsgGUID: /fsUTWmsT/m1ubSsD/dD/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80386032"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80386032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:24:45 -0800
X-CSE-ConnectionGUID: xOALvKQSTQOAloDv0XLN6A==
X-CSE-MsgGUID: HBziZ5MiTOW5I4N53KXYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207366128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:24:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:24:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 12:24:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:24:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfwvPVOthtc9CpLfrrgPJZ5k5Ct5teaMoKFbYd5FwBsh4vaVNO7vYrLCAmMhbuk8KyuLwrbcqwmxjAO7QMFxqBh1P0oLpKtsWqxw2gjMBv/LqMqMK6na5FONZMLcHfV5JMlRtCWPtqx9W1t/3yjENgV3n5wBKwJEfhBun66RACO1g5iLFAijeVK3K+eEBfsowHSP47ehXBJtsfRtvs2qRwYxCTxbqbKjUsjiPKzzlv+puCqArBOhidZQqeeSCcjRIu5tmJ8373NvNZT/a/xBY/p6jW5jJWQM5G4dOYuRrdVyL3BTw1ySDG1glZvh368BgpnunpSPrmZdrQycbqq2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0ezJ9CKCY6DxmDQ+CHrfN2rfujOke/KBkMDrum6kOs=;
 b=tUvzJSH0T9OwMIzATkr1YhYjlmfHdayzOLbx12/qZcIHMFN6wIkISfYY7FgATq9aL3MC965cmvDrOKk7mfI9LpjrMINeDD3KKUFn5ggkMk5mTDHuT049u97Y10Mwybxgp6QIQBUApR45KBZTjwZQrtRqbWcCvtK62tAdGB6f6Wm/udfe+YP4h5IyBsXDKsXT4wkgZqVbis7UHKqzuLDmKRnhwV4s5ftDFEX4K6fyXByy0Ev/o6o9u8kgKpB85S0wxpAPTFr7vR34Yos6u5J+Wt3snf5BJpFsfu2Z3Ase9ZrlM+ZH5OoXO8ilJrZW13lsWIzQ+lzfw+6vgqmhA80GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:24:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:24:42 +0000
Date: Mon, 5 Jan 2026 12:24:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
Message-ID: <20260105202439.GO1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
 <176763926313.9480.16817172111730313247@intel.com>
 <cbed73c3-db1d-4d2b-8d6b-39e6d32ab795@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cbed73c3-db1d-4d2b-8d6b-39e6d32ab795@intel.com>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 31890f27-01ac-4fdd-1283-08de4c987515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K6awV/gqvBpMR19xGtXRDVMoUlVFYsGPsd7Uk+/h4RZAwLeIVgweRQsW3o4M?=
 =?us-ascii?Q?ZMwG91MESwIIxbffaQDbevINo91ZfHiBkaWW6eW2PK6w9buYdkRWySHV2DYa?=
 =?us-ascii?Q?XbEdiRcZbrUxeGhDtZQBRgsdNtMkdgVIwRonhpe1M+ZldwukxKuI+2UU3ywp?=
 =?us-ascii?Q?LprBDW8XIbgZEVJs3iHwlKoV+jPdE8ZJNxrVlBFs5WP2QNQ1iRdx4pxUzyqe?=
 =?us-ascii?Q?atb/DKxWeD9sJI0Z6nQhPwjhSBFfCCfo+yelBWDswryXmTsV2adcvMASoNJx?=
 =?us-ascii?Q?irm/hBDuEqEClkKDJbXfXhwGy7evAcQqBFH+fvvzPoM4FN/J0/vce9ML5aPd?=
 =?us-ascii?Q?+aLsLPx67Gz+n7RVBFos7UA8y3dJU0Oj7XsasiNczpJsGAdiaMGqHI+OCyVE?=
 =?us-ascii?Q?fyYaja9v6y6sz113qvi5m3HkrteGJBx3yA3YuMckVQjfy7jIf96l6UNSLQfG?=
 =?us-ascii?Q?k+zsWr+lYUjIsh8xirzCBMdJl3erO8cEuhUqKsInPn3ZmxQc82nSEXnP7Dbq?=
 =?us-ascii?Q?q5Ch8BfVcgv3C3x0J9o2+DMJJ/3ZA7scqDV4me/uYQGEijjGOLeCkM/Zbc05?=
 =?us-ascii?Q?ROY263qnyVOzMt3PKEZUJbRABtDtwfBrFH2RrT9J0uPLRkUGUB9glz/dX/dW?=
 =?us-ascii?Q?CTAkDIV4LBfXGBhMqjb7Fkbw5E/ajjbXPs9LqAn/c7SHQD2A5/8ihplG6Yme?=
 =?us-ascii?Q?jc3M8rBFoz9TyXX/frJvGxsUSb4ZHXriz39RJi/jE77XpJq+uiuRkgDCDTJo?=
 =?us-ascii?Q?tWfqH/ScWr0lVcHHT0UHXujPSfrs3pKR8Nsxxvwu8GE/Lf/yoHyApIriZAc7?=
 =?us-ascii?Q?tkiEFXU+ITIO9MqgVzdNjbc2RIII4B4t8ugs3aA2g+LMAFmDGa3AbWtBaOy4?=
 =?us-ascii?Q?bVBnMUV1VW2fQe6m9mwblNtHPp+ZL2UDKf9C0AlEqrzgZ3jAcxSn0v2KEbS6?=
 =?us-ascii?Q?G0UZgC63FAeys98oVbzLVEpoyvu+EdMNZRwi+1rCEu0Hl9nQENm5hfTrlpIW?=
 =?us-ascii?Q?7gB8CtCHGnzmXXf4ydFFiyXggOmPw1W8DM0v+FBV8YtFdwPzq7xfKh5hNQvx?=
 =?us-ascii?Q?f/7E8D2UuuTawTeMRmQpBjQcdKd4TiGyFRIslPdH5t7L7ALa5DgO37Dlzw7g?=
 =?us-ascii?Q?liCjVzZVr0OBIU347SIP+Zldl4ofupSA4HifhL6lvzvs3P1o+qMEEAWpslB0?=
 =?us-ascii?Q?oSRG/VOVRmPPYZPizo/eNS89o3Eh/Nzx1HJ8rRlSJXLpUCgk0dPHFeHOSroq?=
 =?us-ascii?Q?qbP96gdb+MADBFNwYRE/Nf2pvslec5cz98lRrV7n4f0ypbcC/B3vIYuQRHpF?=
 =?us-ascii?Q?uhcnkJwG06oo+Kw0BjWPQ7Mml8kQnTQ5vxovCjZgbYsSzynFemRaTuA/bdQd?=
 =?us-ascii?Q?qY4L8zVYJ2LM4pjyN1omJHoFLLOF5L3Gy0vEqPu0wTw+eT3jOp7u+xqq/1ar?=
 =?us-ascii?Q?XDprZwSdi5FcXRkSXaydzf5Uq5sVCVJd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tAHmgDyvAc8MY6IN4lC2jEAmxCmJGYt+YrVJ9svfyht1Ctj0+0qMWHSfo3k?=
 =?us-ascii?Q?CsOF23rwBDGng88O95zBIpa/L0dk4LBYjvsmnz75MgoMPVxeyehvEDFNVu4g?=
 =?us-ascii?Q?E6XR3XzZsW/Ei71dgkAYkbkprk1d5TL3JD8QKUV2qIzIeJlQnL+5sALUga4i?=
 =?us-ascii?Q?2GQZC1toR1JxjtOciBnNmALrTM3QrGFG1dSTkpudqnRbzXQ9juiSAwJGhwOW?=
 =?us-ascii?Q?VD9qwak4a4HLlPAU69TejWzIx2YQSaYf6GpvQfXjHYfkqjKSBR3GbeIZy723?=
 =?us-ascii?Q?9crvhEkZPO8WxaVl2GMLBWJ9mNYHHI8xl/XBOewzHdoMrBqdzw2A7MCvBcZr?=
 =?us-ascii?Q?klCrQ03ULm0ss72/dBoOAQxBicTcB72r9EFskhAj/ejwryRFdGEA0SB7L9zV?=
 =?us-ascii?Q?gNqJwDREUr5C2jPasnk4b8aDwXs2ZW3VkOndymrT0P9cOvFt0F+0nR+cb9vt?=
 =?us-ascii?Q?zulIR9nUWjlKEavU4hUfDTrOl8Tcl3YAIU26mI1Uqik2Q48KQ5CxpAgEROMA?=
 =?us-ascii?Q?2wGioe6dQfa/x8ouWses+7mAmEJ5DOJptXzGF2TWEUJNIQLLticj3HLVEqzr?=
 =?us-ascii?Q?AvgGSD5nma2TrHzcSZFKHjB17iwndde8iSt3+/NlEfD7/xf0NUAlarsP7nEc?=
 =?us-ascii?Q?BM73avUu9Fw1JbZwrXRQ4+H+d6cY9Rw63vnXq4AOiOTqiG5ZbOflLnve11r0?=
 =?us-ascii?Q?F/v08E+HS91HmLA4b2dgHpm+sTqrWgVodTOYJQootBy90vU2exeC4tKfZ24B?=
 =?us-ascii?Q?TOEUn5tsZ/gp5633oV83FOf0Xep5eg2bnPbH9N4GuWAF/LcVQMogXR/D56zD?=
 =?us-ascii?Q?6HmUIlPupWv9vVHZWb/O20KkBIxxLMoQgmhJV5R5dRj2elYgqtvgV8+o/mrS?=
 =?us-ascii?Q?sgO9+gsDcEWWT70QKY6xOdGdwyrSIkieTNlrNJ9jaq8lQ9pjMk6uXzPCChQI?=
 =?us-ascii?Q?ICcBKt+dVL8pU7Uad+4BAlnCq92FrZuIlNzJxPQPkf0Zlfee1qiCmsEozwJF?=
 =?us-ascii?Q?3JI/1z5QmrcYOt67xz1dtDrQEmzvuS50i8vThOLGNMwyKwYw8J3AO3qEZMvT?=
 =?us-ascii?Q?ubE2m/eh1CMhYJuo0yxhP2DJQaeqZPir7PI6uarbrtYTAa7OqfImyw0adj/Z?=
 =?us-ascii?Q?m2v0IS9KCjeYc9thK6A8nFKfdHy3Mzmk6jTv00feOvBQ3XDVAFQDDtDCesoD?=
 =?us-ascii?Q?gACUZythgFZAqsUJcohUR9kpxQlwwHi4j6qaZoALyT52TAUFH7B1CkyI0agu?=
 =?us-ascii?Q?Idc1rXXE6G477VGeVaDm+jGI4RNwvmyzrthzPb5/VUIyIZM/hRaBSdC427L0?=
 =?us-ascii?Q?+69k1J0icHAVNyUSd03Q6wHPZdaL8m0CEDmTjRmMp89tM/WJ+bSutiqoYdR2?=
 =?us-ascii?Q?0O74A8ZOEY9rZ2rrwTUvm8/AORKaCxozEOQnLtwuUTF7ShPQX1Po11c9s9sg?=
 =?us-ascii?Q?M8mRPznpOz9DZmgDz5jKd3UQUFgNU8fMB6YmwKgWIGv0GIpiDojr7fQLQIz8?=
 =?us-ascii?Q?B57q2ok34PmuDKYlGGKp0trLFJ99ArYxN2+w/Qt14pSZSpyKdmhZ7CIMZ/KE?=
 =?us-ascii?Q?DqhIcYHJ/xhiAGC7ZhADg8kIMc+WAJDVa+WDn6hNI8Tq/qDqMJD9a8fNYua1?=
 =?us-ascii?Q?2ObA73bPSSp+Ju3vFEv8ERi7shaHt5LIA50r7RJtWs51Ba7PSxpsbimlbFdq?=
 =?us-ascii?Q?sKhs8HNpBseDnWmNNf8Z6olUU0RFbz65ZwBomPAVF4HSjKPkKxKFuECP7EDy?=
 =?us-ascii?Q?If37HtZ5/Hklop8b9TxMNlUyQRJ+iOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31890f27-01ac-4fdd-1283-08de4c987515
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:24:41.9045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4MKj6iFYp96g8DIC4l9xPs39hx7tbd6e7EvZ2s2laYwKYc0TDaprepKbTiYTHZ5+zgU3xelmVFTRnskz9YNXpbrs1XEHlbEM8TIrPsSxPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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

On Mon, Jan 05, 2026 at 10:04:15PM +0200, Lionel Landwerlin wrote:
> On 05/01/2026 20:54, Gustavo Sousa wrote:
> > Quoting Lionel Landwerlin (2026-01-05 12:02:22-03:00)
> > > Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> > > ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")
> > > 
> > > A recommended tuning setting for both gen12 and Xe_HP platforms
> > > requires that we grant userspace r/w access to the
> > > COMMON_SLICE_CHICKEN3 register.
> > > 
> > > Bspec: 73993, 73994, 31870, 68331
> > > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 +++++
> > > 1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > index 1391cb6ec9c62..4dcbc42574bf5 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> > >            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> > >            XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
> > >          },
> > > +        { XE_RTP_NAME("allow_common_slice_chicken3"),
> > > +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> > With XE_RTP_END_VERSION_UNDEFINED, this spans to any current and future
> > GT containig graphics version 12 or higher.  I believe we need to limit
> > this to 12.74.
> > 
> > --
> > Gustavo Sousa
> 
> 
> The problem is that UMD still wants to enable this performance feature from
> this register.
> 
> On Windows there is a way for the UMD to request the programming of the bit
> without the allowlist on Xe2+.
> 
> But there is no such mechanism on Linux.

In that case, we should poke the hardware people to get this register
added to the performance tuning guide for Xe2 (i.e., bspec page 72161).
The tagging there will indicate which platform(s) the feature is
considered beneficial and safe for, and the driver can follow the
guidance.

Using XE_RTP_END_VERSION_UNDEFINED for a whitelist is dangerous because
the register may change in the future to include dangerous/sensitive
settings that userspace should not have access to.  In extreme cases,
the register could even go away completely on a future genration of the
IP and the offset could be recycled for a completely different purpose;
with an unrestricted upper bound here we might be exposing something
that we really shouldn't be.

In general, we're never expected to whitelist registers across several
IP generations.  If there's something that userspace has a legitimate
need to access, then it's supposed to get added to the hardware's
built-in whitelist so that software doesn't have to manage it going
forward.  I'm not sure why that hasn't happened in this case; it looks
like there was some discussion about this on internal ticket
18015615957, but the discussion seems to have slipped through the cracks
and neither a bspec update (indicating the register should continue to
be whitelisted) nor a hardware change (automatically whitelisting it
and/or providing an alternate interface) have materialized.


Matt

> 
> 
> -Lionel
> 
> 
> > 
> > > +                       ENGINE_CLASS(RENDER)),
> > > +          XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN3, 0))
> > > +        },
> > >          { XE_RTP_NAME("1806527549"),
> > >            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> > >            XE_RTP_ACTIONS(WHITELIST(HIZ_CHICKEN, 0))
> > > -- 
> > > 2.43.0
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
