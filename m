Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DD1CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77C10F04A;
	Tue, 29 Sep 2026 19:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fkii1vXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8CA10F04A
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790710645; x=1822246645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ENawDizKJWXYTkz5U9+Q088lUS/8oConk06VAMehe6I=;
 b=Fkii1vXb541rht7YLzWRIH80okLAThqIqaSSgAVZltdWt3va39cmChmu
 JmlQXPQmsr0+jWELqEvAjaYXj1L9SzdcS3c+2AnOjjQk2tb6kOKLKq29u
 KvGsBoWBqOtmCmmnYNQ406zqUNkqfUWpFKUq9pC9ykVti5reVGfH119W+
 1+uD2s8GSBxUgzOT+GB3Xbw3luz1FtLxrmPJYDE5JKc8fVswZqNhVCwmM
 ozSY6sQ/ewZZeCAA06+ZJSZzY0et1dTapTPejBiCJt+wBojQYF70EJN/K
 ElePTWS62T8+m6EP7U/33xHySszWuS7CRBaVo6ubqMZAVZaS93AkfgSQH A==;
X-CSE-ConnectionGUID: sz/dMErrScGAKYMb088yuA==
X-CSE-MsgGUID: ZDP5UjWyT8mPnrNQfsFY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91460857"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91460857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:37:24 -0700
X-CSE-ConnectionGUID: 35XuMY1QQpGL850qIvMDYA==
X-CSE-MsgGUID: Y0WgX9gHTbmIzTE4fM4fgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273237287"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:37:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:37:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:37:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:37:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS5BoaKg6ricakdKpyA5njnmeImUWsShTO6+vIaGo0Q9i0TH7SF5vJcWKFgjMTZO9nQSU9gMFjYfFX1Ywxw3BbUl6UahnRa8HUzBQsCIQQBYCxH7kyyev3Gpbqo9B3NbEDwSMzHl+hgb7rRSZUjhVPTB1vwnk9K/YU93ncbrCEQ2F2ylVrAwQv7oQ4J4DhC/CRd6YNg1kEa57WUsKMpnvkRwBvGJEH7UvyW/cqw+x7bzq274F8zsJgx8rN0aNmf5VgglQjoY44fsOFc/jdgsZPufDhq1ea5vadqxSurzWabyA8Zb9G52rjnC3jdQ4fEtO1EOXIf6HT/6kZLu4wJ/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0w/ZEUOW/zydBWJbPE4IVFJ6gjfu1yqUM/tIT2zIUU=;
 b=mNbexPUkpU9mZ5hXzH2iv8RAabyB37cZCqwIJ4LiQosWiR2FYIqjLSVQ9Z3ZPqh7xuVzLZb1mNJK+YEOUtoHxm+RnoVJlVum13Cn5PYIe+AIp3npA6POnYMp8oeDfmbW601pnfZauMhvVUuSpOMkFc0GqvQHUL2cjdH2jrxcMEH6202KeHiib2gCXrH+Kw++ljF2HMe4kJTINYu8i9ahWPZXqhjKUngS/36klbLfr9F8lUcaDuyjScwB6WShOFeXkbI969uRQp0yN1m9mPlsTrXC7jR4FGgQGWGfTaG4xakX5jZlgwRylH2OvEprJSKbwcvAA65K3StRVXA8HoVbGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:37:14 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 19:37:13 +0000
Date: Tue, 29 Sep 2026 15:36:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/nvl-s: Enable PXP for NVL-S
Message-ID: <arwTW980kMknB7jU@intel.com>
References: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
 <20260923183600.1186943-6-alan.previn.teres.alexis@intel.com>
 <8847b63e-bf98-4b63-8cb6-daa4b1f7490d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8847b63e-bf98-4b63-8cb6-daa4b1f7490d@intel.com>
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: e06b0e5f-4ade-425f-fdac-08df1e610f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zqUa7U+HejTgtELfn+E55vhThGQZGTaD2P7naQ0B3OtV6oDY+EI5aOmyXrhC7YEC+Rvn+A/wAA6+KET2uTCnY9NpiU3C5uwUx4E80xHdmQoSghtXw8fSaAWzE6qu0NSdlh6oH0wAhMpw/UqNBgAsHKY6UZk2ZvnIwcDCCE3fSE+3bQqBUTLppcnNRKBQP1cMO9mw9fztConOYme7JEi1qOEQooKdnYQ35sgxgFaLsmrOFOifBmVRdGWJuR0lOA376xoA8b9M+zydenuvTneW9mtYcxE2PeMCeFhpYAT9XkERfaJmJwkMcfdsiMbDJf/itsptY/520iMSKgVuou80Oano6NfBUgiZs5sqP+zH9NO7goZIt0T7XYwiZSfPkZtPLr+pdIYVF9SEIdVA5gV6nbLUhI66JggbyEVDeRQztvfBubfuRpX+EaK/ysp953asOgod7t9+IA5bl/W2OV1ACkisjPy2InzAezrBG6VGO/vJ2HWQhHyuKbTfCqPOlufPf5SPnr4TkaIxqXkyWKybo/DHY45ncFxGbdaDr/etufeyViiaN9zp0Nwf4DwuvRZISW+pEdA7TLh3XagJMfFHPoCXSqL7/2p4eiZXDEL9tG03uVtgzGtgkI9r74LW8fV5H6rMNUVTu44uKvhyNIdd/YBW5rvo0na9eoVCjtXEFRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jpfJ9tBKRlPx/2u4m9pA7AaWBpKG3D0X5CK/37YenEPe2PnOgkbO/7ghPbI?=
 =?us-ascii?Q?7am3RKJYoVXMcgYCvisoJn3wEveaDwTmWcSJweFvRfgjRhtAcKJt5z3WhZsr?=
 =?us-ascii?Q?DMi2MS2k20xGxuoVxHQkLJIXzAHNSstCbicAOcmCVs5X/VHbbA4TeqcW+c+r?=
 =?us-ascii?Q?iOx60n/ekZ9cxGMrsJPJFNp+15mGUUNmy/KoXK5OSFaMQ/sISR8h93Bz3E/s?=
 =?us-ascii?Q?a0OLneyHRIu5lLh/YIIFU7EMqW81xD8vKMZwpyrBhuA92Z4SHIKhpg5wgiGZ?=
 =?us-ascii?Q?FYS6zgmFpYj6MCQ6P94zEoI1zjyPM6+iUca+3+g5JJrBLUfATfTbEfw2HNYh?=
 =?us-ascii?Q?F7E7/V+FGZ6sT1k0bGKU3axzQPH/sfT6l2q433uhKored8bFHL6CeAm3KESw?=
 =?us-ascii?Q?QX5b39HXxd3zk+4Q9qLaz7oeMINBQrCArKURmIsDk+MQ0Sjyxy9efVLDCK77?=
 =?us-ascii?Q?biKYOWOO/WGRUv4kNRQkWJ1H1j6AuAFS+k7o8gnG89X/9jIMCiE7ORO225g+?=
 =?us-ascii?Q?c04y97uqnMqQJq2g18GYq2L7OneQCkzjPJhLYBZAOjtZfJjtger7DxT3tLYV?=
 =?us-ascii?Q?GGBBLeEV9dpipLPIXcdYOwxQA+oYM8A7ZnVylfTzCp273ZrpxRHKC7y9ZqND?=
 =?us-ascii?Q?v3OiEmbsUegLnxEjLiVxyPbD37tliWlZiLbQJLbPkb+F05K9s6OE8FL32W55?=
 =?us-ascii?Q?1RVzn670yeCVbWSkrIanCPyBVkoTn3VepAA0aN0sIWA9WHhcyfrRENkQ7A//?=
 =?us-ascii?Q?/mwh+AQ64I15J6PRHmnE34rI7VlWYuLqPmLECNQ/MD8l1W5Tn7fKDR3vbzWb?=
 =?us-ascii?Q?IBkFKEexWp+OBDxsR4DmfEIBF+yKEwuRHyDSco+9ST1FjWi5iyth9v/8FdGD?=
 =?us-ascii?Q?clftzA9oNcEIcKYn0kNbvveD3IzD3eyFj6WyHwJXs/cLt2OUS2c/TS5jZR8u?=
 =?us-ascii?Q?r3C/XB7hR31KudU6OfTvxB/GCLiDhUPixM021qyIH9dj2mqsze93WGLkkpbv?=
 =?us-ascii?Q?ee7GVFURE2wq4Y22AYFRzypYgisTWUl3VvlwjtAYmL2IIFJ7YwbMRRu70Rx1?=
 =?us-ascii?Q?MHBeby9/H54AIS54HmsmdxI3z7qACS8MYbDd8Sx3ULcHl5HA2FPcmIG8/GMp?=
 =?us-ascii?Q?q1GyYezESTg/jnTciu92QRy29V9Q7FLcuu8+rAFb810Negvs9THK1yb9oj+k?=
 =?us-ascii?Q?yjj8NF9nVTb060POueqwvv5tzd8mmuyY3g1FNxZa6RFa1P6YO4QM3QFj7hTJ?=
 =?us-ascii?Q?5/Yq/dZNbk1PApAvj7FM8S46zluh1a8aKrBWv4e0HOOEjVCmadWftLtA2mIl?=
 =?us-ascii?Q?5ck09s+jMNwEmukcBC5RANwNIo/ic0S9iNieCyMNLhxQfq7YCgXzcShmkRRb?=
 =?us-ascii?Q?gd6pWykjJ3xttkMftYtClH/bQMbdaTPZ1udYPjShajemLr+HNq3OH2CU3z9a?=
 =?us-ascii?Q?iuRVmajIcLnuecJmS3JrzbtMVuEbgXsvPuA9A7Ncqz8SsPo+U1Q1hM08hq6x?=
 =?us-ascii?Q?lXsoADPWGrLjXmQhUXwcaopuzvX0qd3O9x5wNr7zn+8xZTpys865Bf4QvrEV?=
 =?us-ascii?Q?8lOoBvmx2ELEWr6asOxFC6WHfAZDeRs89zruHkyvzgJf9cqkiBa9tMd2Z7pQ?=
 =?us-ascii?Q?wr5IvzpTxXKwggrt10/l/kQo3tZlGtXSWOXJ9A11rawV9nZlCVPeCz+arUFi?=
 =?us-ascii?Q?AaS/ZS94nJsx0HAXERJf7U9TTZF8iqjKBYra2MYgU/uqPWCnCtkrfv9Cbxeo?=
 =?us-ascii?Q?DNySRGtbtaXYvzDoVSPGnvokb+LC9t0=3D?=
X-Exchange-RoutingPolicyChecked: M8lMpmLLXuc0T7ftZ6zTHiWi+oYZ8TxgNhUDqS3H7v8LhQaMkawwx3PVktSkyxLoS4o/tPl/bWzkCDlPskB2k8Te5Gcidsp7Y51r37Pb7A5ru4poT6nMCF2pBa6CsmIxrjiOsoEmJGXvm9mBu5PnJWhskHVIN0jkH0yrwqR+MrdrWHMV6N8M5tixG3ZsfRO/ond1wRmlc0aaggT5Qgik8JsoVVuvsUNIA9NsgQcOLRw3njKD69xXEPIBb8YAa+ZSaSnq3sIvhR22U+0NOrUdlfoLmVHrrBNOnm1Ys2chpFVCAy477Z71/tKjFKuDgxf0EHu+vTNtYu734bLhRWacfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e06b0e5f-4ade-425f-fdac-08df1e610f68
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:37:13.4739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhCtwAMp8ZRHusTen/77jCseVc5as/4sUMMzvHY39aDh5cBdfLUpNN9TjXCU6eyd3ieskuXdFIZDvR2KmvobBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

On Tue, Sep 29, 2026 at 12:18:54PM -0700, Julia Filipchuk wrote:
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

thank you, pushed to drm-xe-next

> 
> On 9/23/2026 11:36 AM, Alan Previn wrote:
> > Now that the GSC FW is defined, we can enable PXP for NVL-S. The feature
> > will only be turned on if the binary is found on disk.
> > 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index d64e873d9e71..94fa9c960235 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -460,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
> >  	.has_flat_ccs = 1,
> >  	.has_pre_prod_wa = 1,
> >  	.has_sriov = true,
> > +	.has_pxp = true,
> >  	.max_gt_per_tile = 2,
> >  	MULTI_LRC_MASK,
> >  	.va_bits = 48,
> 
