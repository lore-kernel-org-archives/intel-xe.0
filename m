Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F10D78770
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 15:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87810E4AA;
	Fri, 19 Dec 2025 15:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdSK0k41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7595010E4AA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766159877; x=1797695877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ntE5IKhV0y4imdPU9g3rBYglfZB6KPl7DxdTA8wiLxk=;
 b=QdSK0k41aLKE3L9mN8/JJ90QXO3st8BYNBGZXMiqeoE5hJ6Xft/MVYk7
 rO9uXtBQdLFcshSbN4JwwjqaGdxxeVrBXDaWfOfYxBBYhQv5Dvv6nNS5Q
 JCTyV4WwWvJX/jv5mjVEXdIBQVS1IXoWDu1lA5QqbBePiJPo++QQCuSkQ
 dPR/GYTHI+YbfuCeCN/tMZlUZpNaq/z1JgxW1szm+P/KgmTbMY2TLiD2Z
 rNofjEj/ntRL4x8ss/+u5IVHlhBPZ3PLcm49ex1xJXZgbT7ICssjz7pdi
 UmEO6P7QAOpBW0rjY/dsTx3d4Uu9RDL9txLxqfk1Pt7SRz+ohft9oE5l+ g==;
X-CSE-ConnectionGUID: lNa6SnljQVu/80w4EEd9hg==
X-CSE-MsgGUID: OPxUEVa4RsqRU1AVWQPjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68098528"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68098528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:57:57 -0800
X-CSE-ConnectionGUID: H/y2ucZnSBasroIYF23aKg==
X-CSE-MsgGUID: FJlS+vsPRciaT0qbYwu4AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198483298"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:57:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:57:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:57:55 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:57:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypHsTO2EdC/P/Rb3bgljMz5l81pbb5HrehpnGht/Aoh+A4KX31FERTsPUspm4KVJGwALt4XLwRMgqOWpttIL3tqG8vOx8Z26FyL2jVBEFEOzaU421X2TlMwO2F5pMG+l+JwuxmFHsDGDhJSh/rh1HNXsMsfrNZ0wyGeSghCDsdQ5NRW8aFr4pqOYL3nD3XBuIVR31XetjqgG8cR5XgkwWnip+ooinyY2VTefusOtXdVwOjerwDGM1bPbhZuawDaNmnzdYqeZiLDj1joSRbn1SVebv6vZOuj0W6Hp5NzPArkpQTBiyjBvEQGYQLqh501qIfYOyu0zNvtHMaJUl7Dqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZMKu6Lc6hK9BBZhKeXRsZy+bXii6Zg5tpUlQSxXNM0=;
 b=yEFWZMuifBd9f6XRvUC/PAPbK13TQ/tkx764+9FOc7b32ZSHRh1+vig/0k0eMNL7mOQ6Qf4uMKQfQHS9Y7kvfgAndQEm97mnBUU9dJvGQgIhnRS2WV90p8Uzva6kS1XSyXaIv7MgBXrfU7S17Mh7bgv0NTkasm8UjeMVDMth/O8q3o7r9EdneJ2BkaAga8fvdNkybZBBt5Kh9zkxffuYyqJRWEcvqlqcp3TQ0D0R1MRN9pS6LPdsFQub77Yu1B6dv+xKxiHGehFA2cWyrwYuboFqSC8bKeNm+Dni3S1Dlg4jrhjydIUcNUy7TWdEgf4Dhc+F2nTwdEMUSHzT9M5Otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:57:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:57:48 +0000
Date: Fri, 19 Dec 2025 10:57:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/xe_survivability: Use static for
 survivability info attributes
Message-ID: <aUV1-IBqkOH4ASDP@intel.com>
References: <20251219105224.871930-4-riana.tauro@intel.com>
 <20251219105224.871930-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219105224.871930-5-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec7be0e-c982-4665-dd13-08de3f175b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8Zjzo8GlSSFuY9S4bHqrp+C5ZZzGagQSIEDjYyIVE25zNYFcYehp8KXwmVB?=
 =?us-ascii?Q?soelg9kzKh4cSFQrMI9GkBgOY3e2YJLdd85hYhK8T/INUTBlq+aJ2HPtjOkF?=
 =?us-ascii?Q?Q6AQPFTLwp5VivIQooKW4MeRHPV9yNpIzHFQgIpvel9is8MSHRKCepoSILP7?=
 =?us-ascii?Q?EVlvZPWl+iL0DSEOqgMu6/lp2mhr1lVR29NEGjc4aTky296nqrMgTKcC0B9a?=
 =?us-ascii?Q?mUFsJ07FV7N/efUlSNpd4X8NY88EfSFfNwqIP+pbe+zGu/1TuA6CTr0pubaM?=
 =?us-ascii?Q?JOjrsD9XeDu2FKyXJZ849lcZehmkTsAC4C65yllDpMGeREZ1HhVaBwGDHZpM?=
 =?us-ascii?Q?WBqMQ7iQKEwVgthWfjptKZ1/pdqT/KGVt58oHQdsCKjXJP8yjH7830ucaWBE?=
 =?us-ascii?Q?988wm4c3mn/l/fjypCOAxozevFcodo1+Xt6YC3f07+jKpoSt8z30MPLm2/WD?=
 =?us-ascii?Q?nBy2xjQqlQ1ymBKCoFF1IbWjTYnPN2Zf0cU8NW8dsuCesuHAgZ9qL4WFbk+L?=
 =?us-ascii?Q?oOCSTW4+QIEp0bulsXmFpEd4vYaVGbYQGQYkm1jayVX09f19WhQCc6Y++pNF?=
 =?us-ascii?Q?Hiwv0pRmWFq6XYxJUcFskhcbUROV5zmI4hSuhJC+7qGsDBOxyXt5xkEjdsYt?=
 =?us-ascii?Q?rvstddtCYqN3zE37myWN0OH1GRNVYe73+FKFO7A4+sEJ4kTJXEE9q7WEV8qm?=
 =?us-ascii?Q?yHBu3qTz0gc7Lh3ZqPxxfD8v0lnmHP+gTswCgAiiG5FJdf9FLvKaXDDXSeYD?=
 =?us-ascii?Q?dqC3AEcOTxskoy/V+L0/Ow01B6FjnElLIXN/DARU/u6oWwkOvG0QeLf2nBsF?=
 =?us-ascii?Q?x3iR6qP83FOU39848g64P00AWJXfgqrJuroB/qw+UJh1YwxVd1sHpPaaHHGM?=
 =?us-ascii?Q?yvPrI+apB94hUmbSOa3dJc0y/o+zQ865KKaV88YwiZsCXtUYw9P+yFL/KHw+?=
 =?us-ascii?Q?JMxjOS5CCormy7Jxyf870EXCTEbc/Idg7cTzA/q/akQ+k5bMErvP7X2L8jEa?=
 =?us-ascii?Q?nmtNa0E8dZtjfM9tfM2Bc2bv2mdKFONsQQJnLgz946XPsE3L/MjGWtFrw+Gb?=
 =?us-ascii?Q?QePC9WIQFm2j7tHqyI2fuHhHu4Qr6iKrgnvPSK0YEjntKozfcA/3+YL9c+fP?=
 =?us-ascii?Q?s1OD6PirE94m96nzj3i0zSqT0BzjRfd2H34/0GCxIFnndQnCTOchO5IXafw3?=
 =?us-ascii?Q?rHI0GszcNmpDa9Oz9XQ1XWRdmMYX4OdAthtg8o5A8ELUMNMoSkvXlFfK25ql?=
 =?us-ascii?Q?qkQ8LreI+TXExInH203R+SgYoaTooR99j1IIlJCfl+5hPQytWKpqK99KQVcW?=
 =?us-ascii?Q?Bwh3Q8CD2VtUJdY9M8VAEx56BHrvYA7IGZYADffshvTbTOpJPxswOVVixp70?=
 =?us-ascii?Q?rTYFdzVh6w7HyIx7PkhjMItb8m3PADN4wYt1sK+U5r2iNbKX20h51axbgRuN?=
 =?us-ascii?Q?L5U7HFoIsx9BJX8ybT8sP0a/QAGwLdA/utSYDUCJEw7Fxh6MeWffKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iL6zNG62VkNh3mRugnz+Kuub7SoX0mFBTIyFfZlvkMq0Rn69cvmikQOk26Ch?=
 =?us-ascii?Q?eNcwHry5/zGiKaGrP7ohjRjHU5jnq2I5a8/Dl9ULVuiyJI9h857xI3mjt4rS?=
 =?us-ascii?Q?8oFM6olJdEIk1AmIZM+tI5SNdY9pHzvpE5c2bt+0r8ZKzYg+O1UJUfjyokIg?=
 =?us-ascii?Q?bDVt5ZeErDMCktzD6DThKRQJphP93PYXl7RpVpRTWy0up2W1ARokcT8rxBiL?=
 =?us-ascii?Q?AX5Lv/A+F1toBE1zm+73ygb6e/WKa6NP1kMzSpssdt0f1SI45Qivh1qxxBfX?=
 =?us-ascii?Q?NdD7VHGSS760XVuzjl63qGkJ1mwp24JaHkZvZXEuzXSZaqpAxWeopkQrlNOT?=
 =?us-ascii?Q?RgpCxhGTRIFxi4KmPDlUIBDIK4yEI/TcCO3JpJKx+Nqv4ImSDdZG4r9ENh4T?=
 =?us-ascii?Q?pz3jSqk3Kk/cuIcDw76vtD6HXpyrWmXp7gkA1Mco2qwnzeyTZ0NcP3R/YKx2?=
 =?us-ascii?Q?y+YpQ2KEW1bUgBQW7uWUFtFlQbUHFhjwEVY6I4vDfmV+/VOUg3IO4+gUq5H2?=
 =?us-ascii?Q?0cOIAS4tnfkPUIZMezJ1l0FFynavpUiCAT680LNAajgbAEWy3tfj2zUXzb8Z?=
 =?us-ascii?Q?9ok3T786tFbCDv63wb5fGxXraF3PDkY/GPJmo1fQtZ1PjpJkXYyx/rB4cCqs?=
 =?us-ascii?Q?7UFhBAOFUMxXdp7OFVyi2h4MXW9ReGId8xbC5RhKtm3HrQzkh/wCz1rl4WdE?=
 =?us-ascii?Q?+wp/OAuVoAn9XAy3+VTIx6Dp4Bsjj/nD24zGJqFTMFQSXD9WvOgBmMyKYasy?=
 =?us-ascii?Q?cblQPwuGcWAXL2aK0joNELBQ8E1pvFLjetHqRVSyc8Q6gEyUTVgakQPphKL2?=
 =?us-ascii?Q?qcq9eguI3IrSL1iQ+60qjoTLJKM6cnWcFrNeySkVzhY241kAyhbKk/n9DfCl?=
 =?us-ascii?Q?MEHSMdhxnQ8ZmiJhen4998cIrQRmJxo+qqPeVu652vinSjkytHP1yEYGnOxp?=
 =?us-ascii?Q?boYDWoCQXJrQvaPP0Ro7rYd0SkVSUY1+1yqNemfErg377Hw0dM8XtFbS+W3w?=
 =?us-ascii?Q?UKZK7iPTpAJSB9qM7XyP9ZLZokruwkjE4TBoL+yJxvYiNw4tbh1bHp9IwZog?=
 =?us-ascii?Q?vKofTbSkPPciSlgDuGG2zEtbFT0Ytwe/fLom7juAd+ObvB2kjdIm+KckRMI7?=
 =?us-ascii?Q?AS45RB/yF0ghsZWnWj/oGGqsat1BIaoVbbqoc7c4i+XfWUsHA/6ZFIgnC5YC?=
 =?us-ascii?Q?NUl8NERzk/xvkGMCCirtrJ7Fn6N+En9CQoMgfF7G790zkgCff4CmVeapzoda?=
 =?us-ascii?Q?Mmqc5+2XL9lCacGauYg+ndETBvBmtA3ugiBwr66eipaaBiRUqjNbBt+bW8vW?=
 =?us-ascii?Q?n4yb7mzyL2/ML9JEwG8+lGpgjp/PBO00Rl1+ZLFFvTPlZb+6j3CFxO+LTgHb?=
 =?us-ascii?Q?kcCVVtlwqfeaXASJs834sEctjAQAukQzfHmL1nvRkvtgf2vT8DHlBzWICeWL?=
 =?us-ascii?Q?Pi0/CQN7IohS9Knfu6xs25AXRAq4zktt23XT+iDsujnK0Vpl7s17OGKG4iBV?=
 =?us-ascii?Q?rpkXrPiL5YwJpy9Y309zuCBslidfxnP9o46kbHFYtEgP3VK7+hkh1FxzDCyB?=
 =?us-ascii?Q?3Tz0c/coF5L4Rl2x06vgGZwW4DiWMoRCSWFF5Ij74FELGazFQ2ZAJBtFWzJc?=
 =?us-ascii?Q?5gsIZoGyj2fpAICJ9Ig0aFU/A7WJpO20ZoeYgdP9M6WD8+VxnLAejBE8F2CK?=
 =?us-ascii?Q?VPWhyzjFzFWXewz+bQE+pG9byfJLAXyzdeWh+d1zoxCL8wEB0pTXhaESrkAW?=
 =?us-ascii?Q?OgffsnRuqw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec7be0e-c982-4665-dd13-08de3f175b4e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:57:48.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPlglOqjrFlj4y+K+YsSBf5RSOWtCxngIGGhJbcxpAlcaPLvQ9LhHPEYzx0Hlujrep/WoyQPsk1ZjQsI+a17xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

On Fri, Dec 19, 2025 at 04:22:26PM +0530, Riana Tauro wrote:
> Fix sparse warnings. Use static for survivability info attributes.
> 
> Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 7520d7b7f9b8..e6e326dfb92b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -228,15 +228,15 @@ static ssize_t survivability_info_show(struct device *dev,
>  		.index = _index,						\
>  	}
>  
> -SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> -SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> -SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> -SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> -SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> -SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> -SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> -SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> -SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
> +static SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> +static SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> +static SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> +static SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> +static SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> +static SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> +static SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> +static SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> +static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
> -- 
> 2.47.1
> 
