Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8C606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BkcbB2dz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gB3m90ts
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2712910FEA4;
	Wed, 25 Nov 2026 18:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A216310FEA4
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795629867; x=1827165867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pXiVdOHQH42nIxPaG2DDwTrL3dfQvJEJAz4AMYGxWrQ=;
 b=BkcbB2dz5f++8+orMXNdmYt1k0D8BKB21GA3iSU8iiWZQvVoyQMe1lKC
 CgvweqFUkfaVmEOp7rGi1T4rcRZoFYjv+h79jBEUobNsnbZmsaFWXUnB+
 A9a1+Kd8YH1csN7XyM2i6/e1ieqqgD3Z95Tump+oA1Y2FsZlYhaig9S3Z
 oncwHLJDJcsHUFDn85hGtwvz8Vt7YVih2+QvgnP74LOhJq+ovWyIZTYjH
 QuQoY7mdfo5Po1y5Kiy0glsEcIpfuDJ1lao5U9GNix9sCuB+FEWuKocUp
 5AaNCRalwrGayazMowsaqW/v8pBMWw+c0afCmegv48aSlDXbRQU6blmHJ A==;
X-CSE-ConnectionGUID: U2ODC6MSSmunEK8ZWkImkQ==
X-CSE-MsgGUID: BOAJH8NESgiz2e/ycOW+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4404850"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4404850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:03:10 -0800
X-CSE-ConnectionGUID: cy7c1SstR4+CdKt7ghqXAQ==
X-CSE-MsgGUID: 9frIqZcqTeKoGqxBX1O0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11951197"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:03:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:03:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 09:03:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:03:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR3OOXA/ASK43LN55Ajg5HZNWoOeeguRU4rPE7PxFexGpuH1ORUT9BZCqVW7l8+IMizxYC3FokavCuB9jerCAXfkn0TdBjhQIIQlOda/ASxuIvhZLZ35KO1zOh0zGOHxun2GaT9af04N/pv8JARE4QTTFb5mJ8xvgiiiNIjHp3RnGOWDFb+p3BJA9AXMQC+1v64f7vYSZpoYZM2+9kvB5Yoabbk2cRUtW1HTfEOOtHg8hbKU6xmSj7hh8fHf1wvXXFkceexpviqeGTViOU7nXDqci+cDvt0siRFtuillQeaq91C373FYM7hY6ZU4lnMaJVCG8y/s7lsE9UdTsebcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArOboQ7fe93tfexS49EtfEoN8lgVKW4/duFNOtwp8wE=;
 b=qKPIwe0tiQbQFIGn1ioaLtPCTaNj69sQwwjDu0j8GUSEa2kh8pfi2rQv1pChpudifFwZVwI358EQoqSMRrz8GW56sPpG8hmOIcZTSKxKLhHxLn+1Kh5lSG0bXePP9vY6lKbLbPfSTllUc6ijVHCCO+wR1HhvQshcq6nKS57BHjucBL5rKy6Q5zaVXwv1s5Hx7BbOmKUxKQNcnsNzwbGLa8q9P3IV2fMLuOHdHUybMzA6XkYZbUQu7MMGwZVK6+mMjW822dax4NG6EQtPg/yQxohpqbsJmTc0pxsazVTQj4xwiecys9dq3LUkXb6mwVZITjl8Y8oG7LENTw7EJhhP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArOboQ7fe93tfexS49EtfEoN8lgVKW4/duFNOtwp8wE=;
 b=gB3m90tsxGU/iiP3PwPKEDcUxVOPhSGUOOPXljJXizvF63o66Dr5sysuFnbspWEfLiZXSF2/MhGVqWelFpTHHES6AKEYx+Y1/NwlUO5Mj7PcL0EdE/ywX3BKq2VOQz6myTvzPO57FmuLolABZhXTp4US+e6mtEzvJTv7U086674=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 SA3PR11MB066336.namprd11.prod.outlook.com (2603:10b6:806:588::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:03:01 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 17:02:59 +0000
Date: Wed, 25 Nov 2026 12:02:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/hwmon: Improve mailbox power limit init
 and visibility
Message-ID: <awcUv79JuIdn2AkI@intel.com>
References: <20261123170259.394360-1-karthik.poosa@intel.com>
 <20261123170259.394360-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123170259.394360-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|SA3PR11MB066336:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c606707-093f-4670-e679-08df4b15f538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|261009223027099003|261102123227099003|261021121427099003|261021123027099003|10067099003|261026140227099003|261022105027099003|261028144727099003|3023799007;
X-Microsoft-Antispam-Message-Info: LkHX/dzQWk4MfJ97HxeoxyO+77vYe9/KVzN+MnX1CHW23PAWqzE88en3YwKusDdE/RdcB/29sVWoB2KbCmsY0NM5SMOL087P6UZ7FFp0EWlpMyg5nR2O3sIQTtPizHteI+woVaV9Be48XfR0WyfxOtyY65FS/toIGlD+IXElNeumZ198aGvJX/oylOSAFLuih2KBETW7DCsCzuNbF3Nhb/SaSZ1krkVwhdmdP6NKnH0lBY724RjOY3kJ9z/ClzCO+ksVMORp1qllTDDBjdL7Ng/M2+1gZmvU68krxqe+7gC6mU5yxuZLuWPpXBq9Jw2+VaVnG2/nECpOjajRkGUH8cmSb0UH6SPznc4VK4MUmGiAuFHJVkNVqauOk40y0G+y5NIeR/+XVuFobLdTJ540ykn1FCEGJ8PV3NPBWHDbp+KVw1w6c+k/ywuJc6OSz2DgbeFeGvzM0PK/Sn2RvuUZXetiLAUL86Efh3nuTIMVAKA9NzWckWLKmFmwoRd9IOQeesVZvx44U5Ue7g74zf5fK34wzkPBP4NBHC6S7b3Rz+69cQmlNQqpI6R2Lq9P5s4gYpDunlQfgGMH3MpvNOzFmIEcLmU5D3Iy4Ago1RFGaG4jCNfWJfjUqnAPZHKQ4OQhjwNjZ7MxAKFx2kI/sOlEKSNOjz1GjTkxnR7ZKYngoiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003)(261028144727099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?10gLWU2uXnKuVcThZZP0WpwH1/ukosRSwhUJg+yBv8Jg4o+uTtFfYba8V6Py?=
 =?us-ascii?Q?RjZAYRczBmFtEPywtlPIkJ+iqn85Rj22kFul3PetmepZCJnpdKWi69VDlydr?=
 =?us-ascii?Q?+Ht5z/SFVOCdvY+Olc6RVeHXPEULZXJD1OOhBH/E4sXX4I5VGminJW7ZRosE?=
 =?us-ascii?Q?Su9F6gEhmOwtMTrYgJY3pwOq1o11LzPvveFfjgE9zA1+qO1OoJkojqGPFQyG?=
 =?us-ascii?Q?y4/2xUalYYIkMpLUdpDSCrb1/hWY4xpYIuHuLeAathuAyDAbgirbnkDF3Lja?=
 =?us-ascii?Q?d+ig5sGEt6Xf5mHC9MHFP6W2uXMwqwQ+mKmyRj05OxytaqrmeVNbnpbP7Dup?=
 =?us-ascii?Q?wXzujpc4FvSDPHtoWvspywFeKibVWKQGlpQ0IA8fRgG1Xx8JP8smaC3uMNpF?=
 =?us-ascii?Q?0CO0cYg9R/VcR8j3HRCbzpQLM76N0cJYK3SYxU0Z2fj9mWOgUL4MpvZNNNyS?=
 =?us-ascii?Q?yDkPFhjSp+/V15YqiR4GL96BdHBhnteKo3AUc1+U0dwc4U6KCGrIEcso6Bs4?=
 =?us-ascii?Q?8F9lc6Gi+o1Nd4mPwKXF8LPWgJfqSrCNiC23efBl64Q/i3C9BsCmhaanpuEA?=
 =?us-ascii?Q?cuRD5hciiurgdzfmwnAP9IL5jkY6uxTs+r3XiVjXO1/3OdUUn3PGXxTIQVXO?=
 =?us-ascii?Q?4+mea31PG10qryPdQmcUm+F7Js5mrn6Hcd6MPefWWPVjE5tP7Ft1FLe1b+xn?=
 =?us-ascii?Q?wVH6ZHjROTKaLdD8+MbU0qyDWEIku7vg2N0v1XQC03M/mVIcdU/5q2SlXQS7?=
 =?us-ascii?Q?oJieOHDsibZikmzGqFVNoUwp7ML6NgA2D0kMBU8OVLcfxxGykU6RgbA+ALX7?=
 =?us-ascii?Q?mB5CxV7NujH7HLRhIgsWBzTtytx4HUrLPiSrG/51Ckc6SZkhIUPHkE1u6Qxe?=
 =?us-ascii?Q?l+Uji0K0oXZaYul7kpM5wv6jLBDZpG/6l1wZjzBlyWngewSFmJ/o/ZBOPgHf?=
 =?us-ascii?Q?wgK0nSjklOc4KKGn3ba54WKm/Jn28+nOzVazOQj922Bn07sUYHwF0ey1l4hm?=
 =?us-ascii?Q?K1TP1iQ04jBv3/9g9MZT7X3IuBUaH6gBNeAVF95/dR6Zav+AIqCEATSPygvD?=
 =?us-ascii?Q?JtISAY3n0oXnLDn84huR4ZjVSFeMIOHR+N7dv4ItbL4ZYU6USLk0PL39dMnf?=
 =?us-ascii?Q?QVDVbkPJqtcjXcw4Q3/reX5p4zRau2onHd3XSDNb264g9HjZC8Efk52lFlS4?=
 =?us-ascii?Q?MA2agGElo3x7SWYrye1QS7giKRg2OzcOSAPjxrvytl52V0Bzrs1AFgmn5ZW1?=
 =?us-ascii?Q?NlIJUnfS6q5Fn/uCPYomh823HF//xUINXaGZYfOaynXPZ7miWxBtNGEQWg9X?=
 =?us-ascii?Q?6hLPE3ycLtpCcYE4Q/Gh2sdG7FYP0HsY+1n7AbMnYXz8uTf1kZ2rEs4s1lbV?=
 =?us-ascii?Q?q80ciV9pzK3fk/GzZDsfaeItTjvml2+4LgF/XzUZ9rfbWl8iHfUJGkQT3K2g?=
 =?us-ascii?Q?3g/aTR6k/N3UxaI88EB975fHndek0staL8z+DnTpW/h4ISE3o57oZ/Eo9c8t?=
 =?us-ascii?Q?j8f+8qRXVlhFwKisSqwfKfLy0Ero5G9hjY2eO1JTikqLzXDZRCKQunwqjdNX?=
 =?us-ascii?Q?fzG1dWL+RiaGLNfLfDsxDvnwwaYPckNwKZiHDQNVYdnNWDDGWLUGilAGqASl?=
 =?us-ascii?Q?AEgZJ28NdDOXF/k7kkzYQuE7PQf6W/J3qLP0ZlvrH80XKX0kHkfX8iPSyVZD?=
 =?us-ascii?Q?UT4Y4d5xPOBKUwMJGgWpMS0JLqqJXFrEFMfiGbRCjw0v7GfxISyk+tqroPZY?=
 =?us-ascii?Q?4jUUwZjvKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: o7ACxuXwEiYQjBg0AfofKqNOBmJsKv+ghoKyUd5+o/fNUqPDy1Ehzyax7G0Z9CbWqcgxEmSXpqf/us5gqamjbSxkyrmhEjFkvaTP0iz3UBE12hNepomyLKCLKmwsTQT08RoS0AVGTY5l4JFvPzpxhBG/IqWCLQ8ohpIOdtzheDYeF86+PZX8+mVrAHMJPvU6PMWgEhxzwI0y6FFJsQTa8tPrqfbo5gKhyMc5evrL/Y67s+bbMX7t94XxUgYFH6wJypvSeM+oPdqA7K5yyLd8fdNMY+n/Nk1NK/ghBVqkicQHoJBqu/sBah56MAthJcZqkRjAxclsaS0/PgiSSiiSHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c606707-093f-4670-e679-08df4b15f538
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:02:59.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxItEGA5Vn3VGvc0Yc9A4tgKWg1QxmnghMdSnxKgxjct9WkP6hHStVOmztOp6EmjPX8v6va5i66Gt4TxCEvpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB066336
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

On Mon, Nov 23, 2026 at 10:32:59PM +0530, Karthik Poosa wrote:
> On platforms with mailbox power limits, a failed boot-time power limit
> read causes two issues:
> 
> - The power, energy and time shifts are only set if all reads succeed.
>   Otherwise they stay 0, while the other reads still fill pl1_on_boot[]
>   and pl2_on_boot[], so power values are reported 8x too high. Since
>   mailbox units are fixed, set them before the reads.
> 
> - Writes to power_max and power_cap are clamped to the boot limits, but
>   visibility comes from a separate pcode read. A channel whose boot read
>   failed (limit 0) can still be visible, and any write sets a 0 limit.
>   Base visibility on the boot limits instead.
> 
> Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Fixes: c713b9a23c73 ("drm/xe/hwmon: Add support to manage PL2 though mailbox")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

but please make this the first patch since it is fixes and the other patch
depend on the units being set, and address Mallesh's nit request on the other
one and resend for CI.

Thanks,
Rodrigo.

> ---
> v2:
>  - Use pl1_on_boot[] and pl2_on_boot[] for interval visibility in
>    xe_hwmon_attributes_visible() and for hwmon_power_label visibility in
>    xe_hwmon_power_is_visible(). (Sashiko)
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8b848470d5e5..10c88af956e7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -825,7 +825,8 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
> -		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> +		uval = power_attr == PL1_HWMON_ATTR ? hwmon->pl1_on_boot[channel] :
> +						      hwmon->pl2_on_boot[channel];
>  	} else if (power_attr != PL2_HWMON_ATTR) {
>  		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>  		if (xe_reg_is_valid(rapl_limit))
> @@ -1429,7 +1430,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_power_max:
>  	case hwmon_power_cap:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			uval = attr == hwmon_power_max ? hwmon->pl1_on_boot[channel] :
> +						   hwmon->pl2_on_boot[channel];
>  		} else if (attr != PL2_HWMON_ATTR) {
>  			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>  			if (xe_reg_is_valid(reg))
> @@ -1461,7 +1463,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		break;
>  	case hwmon_power_label:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			uval = (hwmon->pl1_on_boot[channel] | hwmon->pl2_on_boot[channel]) &
> +			       PWR_LIM_EN;
>  		} else {
>  			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>  			if (xe_reg_is_valid(reg))
> @@ -1824,6 +1827,10 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	struct xe_reg pkg_power_sku_unit;
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
> +		/* Mailbox units are fixed; set them even if the limit reads below fail. */
> +		hwmon->scl_shift_power = PWR_UNIT;
> +		hwmon->scl_shift_energy = ENERGY_UNIT;
> +		hwmon->scl_shift_time = TIME_UNIT;
>  		/* Check if GPU firmware support mailbox power limits commands. */
>  		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>  						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
> @@ -1840,9 +1847,6 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  			/* Write default limits to read from pcode from now on. */
>  			if (xe_hwmon_pcode_set_default_power_limits(hwmon))
>  				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");
> -			hwmon->scl_shift_power = PWR_UNIT;
> -			hwmon->scl_shift_energy = ENERGY_UNIT;
> -			hwmon->scl_shift_time = TIME_UNIT;
>  		}
>  	} else {
>  		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
> -- 
> 2.34.1
> 
