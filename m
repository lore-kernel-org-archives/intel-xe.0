Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3C9C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 20:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513D110E7C1;
	Tue, 18 Jun 2024 20:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMV1rsMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822BE10E7BF
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718742396; x=1750278396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d6yZgJuixKyCWzI6jAEVlKvRdbgCZc/XXbPwZDlISXo=;
 b=dMV1rsMS2KsSG1laM6cIF5Z4ymKIEkH2rYYUpRs8Z6gSBIYJQxqD1C/M
 +iHKjCLATD+UUVnGyZWwh2AhA3iz2Fc+9fz4ys8UCdYktAmliIN0t2vCa
 WA3OfImxoTA67sCSi55fgB2IkciMK60GbzfGJmtm9q4yClg931QDpnnVr
 wah+3zWgR0xHu6Z7hp2DY1zrnkIBb6xmIe7HoBjFSFJ8Dr2kf8h/oiQ8E
 6XoSzduG0ExGN6gMNZOGeo+VwVky+3UbaUyuzl6y9VOMuvYvT+toIZQ8R
 N2nB5csVatd34JIfSm7hheBwufYQb5s85/VWTGMZxK/QhfPuhyQWAHPj0 A==;
X-CSE-ConnectionGUID: tEXyrkCxTnumgxkIm9oPAw==
X-CSE-MsgGUID: ml04GS3DRliJhSJ+YWM6Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15364090"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15364090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 13:26:35 -0700
X-CSE-ConnectionGUID: gvcvyHU6SuqJtkqnYO6R6A==
X-CSE-MsgGUID: uoBbWqGBTE+K+3X6RaeDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="42365427"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 13:26:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 13:26:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 13:26:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 13:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk4PJf0yj9KKbn4zLRacTIPhP1eW1sRHifS4bulpCGLaSAGUnXJMxzMbTDSVM59GRY7Dz9DqN4+0m2HrR01mDL8GZWr7O1iQUos++raGhLoxObldbsvuU65ek228Mxmeiftef5AJ84nbPPDm6y73kws4v/6LxyH2erT1wfN95E5zhl6UljbnO3VosgxrKrv3b1ABAY2BxGyhy7dyw5fRBtJMgXU9+ZT+n6uE4qrQenIvXMdTRr5jixGOxSbyRwjmCJTCRReJv+etZUou0jpJ9rmlPIYLqH8UJ/GhM4HvMtyeXTuBFQpVV8fuRhm5O0tZElE7BPqFppVJ/D/+w5fmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CUPDvZyAc9NnsTco+B4OkdiVD6lzzM3ULQ9dNEHE+M=;
 b=mCvPzUSuoCwQ3uIK53m9mGbZ/nrmrzEDzaRD5QL03AbdCqIGaABs7wVPxrxiQ82ej5+PQXuLuObLeL+dfpcY6VwmsYcdGFOkNmJUnrNc1wn9zXgjmS/OUYP0smlSMOZYW1Dvj85JFBIKrkZqOvumvzja3pypiV7/EMcj+IqnIo/RgO1r7nbEthmoC3v2Oxlg/BiX/BtLsUx2qZHTyujbmjPZFupp7yVLh5DCFMQrbJjM78vCYi1pWNOhRMC/DZFOrEPCZV1oWBCJFPGv2XeyU0kILjI9ahmf6OqXiUs+Qh2ZFk4uAR8EfE/sA5RHm0E3txH3u1dVdlAAotWuqF/vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB8447.namprd11.prod.outlook.com (2603:10b6:806:3ac::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 20:26:32 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 20:26:32 +0000
Date: Tue, 18 Jun 2024 16:26:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnHtdMLEHFAHMqRr@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 43262cfd-f3b3-4ca7-6226-08dc8fd4f149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+CIK+eG4obVNCna5atS2nurZYjEHcJVz4NqZflYl+p0lxFGQzGYcNjOdN/54?=
 =?us-ascii?Q?mKI4w3nvtCM84cu6PlZ2AlfL6rTHYziEKr0cJfwrkVBt3J5Yt4NvC1gNfOR2?=
 =?us-ascii?Q?U6zJZlSAyQGq+lF8q/a/Plk+GAXbD58xiiKXpzwAoprLfMwfVgoJohZLHfu0?=
 =?us-ascii?Q?tfmr4IytouV4DkTRQPgQKVMkfgptfxw2Wyv0fFJFTTlDjrdivHgrvwn4FOTB?=
 =?us-ascii?Q?bdlibBypZT4E1FjgIABm97V9DD729fvxVCp1Nz2ELgMeAu2DBoBlu+FQWDC+?=
 =?us-ascii?Q?9Cp5snIGcp8b3jHtiEKkq4LUyq5C+kjDmxN8mveJrFpcvHIVhjw33lXBKhN/?=
 =?us-ascii?Q?cU9/hzhGn2QQPJoZKgjJE3MPhPRtU4GVnwk0Uh3ScwuooGGqwjjCAwYpPoCx?=
 =?us-ascii?Q?mLq5S/eqPo9j2UgSFEM3PwnZOwX9brn+vGCPe9/qMsoKwVL7wFdOw1/kPYHn?=
 =?us-ascii?Q?YqrmMZArkm/zovsYYIgGjHG0VH+jHug3DGLOA53zYW1Dkpui2ImK5cO8zccQ?=
 =?us-ascii?Q?DPtimaCcImqaZJyEozFpwYb1B1X4dZ337fkOh4+1moBZ/F2XwrFllr4QyxuO?=
 =?us-ascii?Q?u6SxJCx4ttXp52JyFTvdIUxDOufCy6GAwiViWW6pjMv1NKQBVs7wPkdOERch?=
 =?us-ascii?Q?7r5c+kWOagKBSL0rZPYu1/MG4fwNVca0sS6JKSsyAhP4NByNFjZ/oMHdJNLX?=
 =?us-ascii?Q?adocyKJZAoNqvgtvauFRidiXXBPBq+X3rwQueYdLOQ/ebmcbX6sklgEsNU8V?=
 =?us-ascii?Q?TbSrd4IXPYR3Yd1FwU9Sz7qerN/f7SYWeG1GigH9+os2LBtI3zhvS1AOrYfB?=
 =?us-ascii?Q?wi4MBDg0dTNocPcfv4/6MevPkMnU3oVTQZC6fzSM8kYM3RQVJNRfZ5/KSL1z?=
 =?us-ascii?Q?uPtFQOuHJMMw26Q3yMAfLGGinUOlU7sbTG07rQ8kR39WhiZOhz+crrSrACH/?=
 =?us-ascii?Q?PQ1eW6L12Yv8WRXcp2v6zpBlVP74rpQTGybmLW1JGCMYjsclRD0+KPaHsMLp?=
 =?us-ascii?Q?pBHJ7leQ2ShTKPJAU1QuyU4Y6WpCB01Mc6yM0VayyFHzM5ZCHgQat/Vif4UO?=
 =?us-ascii?Q?6rKmjMtVzhhqoOt+aWcJferaeqpeUAZp9HUIES+fboy0QoxvNr7UCyTmEYF0?=
 =?us-ascii?Q?Ct3Je6ZI/6JWEjsEcS3J8jZ6CrdK2c5vSzLKVwgZb6NvVAYv3G8CEDMByM45?=
 =?us-ascii?Q?CDflLVPVtkVP3qF/xrduAjbvtl0zFnaTnLRkliV3f+hKFk/KtNCdm7+MaPOt?=
 =?us-ascii?Q?b1wy5vtmxEvrowtaY8Ly?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/aSJAIsYc7PJyQnDxL7lcNU3tEK/3blPlfxK3BJJbC6DUaLwi5+9lT5Vu1di?=
 =?us-ascii?Q?L59sT5YmDHtRgQnah0TdTNTE3FXMTb2rCpvATLBpSnwAhLmhoM9evkkRBmGB?=
 =?us-ascii?Q?E3AunlnAjNo1IYPXh8ts+3ivthTIhWDt/tHkfbh7EKLJy3n43lMqjBVaoinl?=
 =?us-ascii?Q?MEPDjf1RUyVcqB/dtml8JBqQdZ2FxhM4gjMI4RAm2G8Wu8+iiXSGSypA38Pk?=
 =?us-ascii?Q?/QUceECeADfwwD1FrQ4MYNfcP2wXJkn+JgnbHSJtz19QLgTyBkSwtXF8fauE?=
 =?us-ascii?Q?97Qt1ChzFn2gsGSvMMlT5z7cKTMTeitg7oLbFE5iNuBIzv0NXIjzGbjnsSgg?=
 =?us-ascii?Q?mwot6GHWt8vqrK1Q3Cvagtrfc5bHK/rJ5efuuLiqMXrhtruAksABtmdQ9iH7?=
 =?us-ascii?Q?zE/ARtGWTWSjL8L7BzUMWQblHeHewVhxmB4XTu91TGx8eJbqqSHMDtpx2hSC?=
 =?us-ascii?Q?VKRPYNqP+EIc2SRtxsHW/UCbtLbs4OpCUAt3Q6PJ3nRQaa04tXEwNWFdTd8W?=
 =?us-ascii?Q?IgaWhqnqKzr1fRJdCu5rfIUWO8C5jUWfN4v4EUeIcYR+290bJlNUEqDs9RaI?=
 =?us-ascii?Q?JTMYpRbOlxVEgn3dU0nKS3t3vNk5MScfYf0t4oeuc1U6P8N3b9YvupcywVrR?=
 =?us-ascii?Q?1ur539Cd4owS8SpvAHynaoDEdgIqsNoEw0zPaCy7fIHHDHfF1Ldx3T8+fI7v?=
 =?us-ascii?Q?ljGrpE00t1mykHDdsibCVNbDACCvNV6NJ3713YcWifAiVs6Cvxph8TQs6pgh?=
 =?us-ascii?Q?aRF1FqaeX3CQVNb2U5Bc3sxk9dwuOx+EolH2vCrF+Lq6+oPEPNxtCsxmUSQ2?=
 =?us-ascii?Q?sviW+bIecdH6A+otboCbPQDke0hkge/NZZuM1DjzeLfFPDwC/K4KkK4vg1DN?=
 =?us-ascii?Q?Tf7sKGsVN7nSbidoKgrblME5ibpGQtMnC5OWwu6dR+0R8uEu9XuRlAd/5XrA?=
 =?us-ascii?Q?sbggW+13JB8rzTZrTyquK7ZWU2vKMH8UKVcZca9TV8VkxUDfmWuF2lUPAHwi?=
 =?us-ascii?Q?vQCtCTybzF13N0AWf2b5cXsbNazFkoH705iBsG0vopn5N1TUGEhqyQvhPett?=
 =?us-ascii?Q?zZ4wa1fr+RsR5Sbv6FUw2V+6wZq7C4hjDwjZCna2v2npmQzc441gU6fg1MW1?=
 =?us-ascii?Q?WwsS6L96rvcqWz1YlPk6h1tNVtxnU6/NH+ZKmpNaYwE3TjP3HXe/33qQFUc/?=
 =?us-ascii?Q?WUwNOCT0faSQ1pmj7ZlMGA56wOpBbbBCLgeS/HeE0WKy+WPjNwKgpUC5THYR?=
 =?us-ascii?Q?Esb3o/jG/zNiQQY59qHim7UAe4TwW0ulyoMTJ2VQ0Ut3kJI/jwQkVKJah+c+?=
 =?us-ascii?Q?WYaCwq83ECBeFcdyQODtuX4YaQltuC6kfNBQvCKpCnEwPY4OOYT+VFkS/F3S?=
 =?us-ascii?Q?gvEjsPSStYfIeKW8gReLO51R7txu6p8uaaq8Jh834lAff6qTTlj5kI/lueMv?=
 =?us-ascii?Q?6zTp9vIM4XCKfxEQTXh0vDOydOWDQI8XjiobAMhFEnTLDu0G30/xUA/6MQF3?=
 =?us-ascii?Q?qP9sBsFls3a25ZDU9Sf2vYsuImABaI/Adc+u2IU7ZtFUnW8ca63A7xWx4QSb?=
 =?us-ascii?Q?p2xt0J8UMUergS1U82Cr/VgPb+86IjbMEXP9VthB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43262cfd-f3b3-4ca7-6226-08dc8fd4f149
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 20:26:32.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qncf2/80g+Q9m7tROb6/oOJVg1LL++F/4329+StKwc3DmcqV01q8En3diMnybQZsU6t2C0SeOvoEuGL2MNDwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8447
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

On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
> On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
> > On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> > > 
> > > 
> > > On 17.06.2024 20:00, Rodrigo Vivi wrote:
> > > > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> > > >> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> > > >>> There is support for 'classes' with constructor and destructor
> > > >>> semantics that can be used for any scope-based resource management,
> > > >>> like device force-wake management.
> > > >>>
> > > >>> Add necessary definitions explicitly, since existing macros from
> > > >>> linux/cleanup.h can't deal with our specific requirements yet.
> > > >>>
> > > >>> This should allow us to use:
> > > >>>
> > > >>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > > >>> 		foo();
> > > >>> or
> > > >>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > > >>>
> > > >>> without any concern of leaking the force-wake references.
> > > >>>
> > > >>> Note: this is preliminary code as right now it's unclear how to
> > > >>> correctly handle errors from the force-wake functions.
> > > >>>
> > > >>
> > > >> I'm personally don't like this at all. IMO it obfuscate the code with
> > > >> little real benefit. This is just an opinion though, others opinions may
> > > >> differ from mine.
> > > 
> > > except that is more robust than hand-crafted code that is error prone,
> > > like this snippet from wedged_mode_set():
> > > 
> > > 	xe_pm_runtime_get(xe);
> > > 	for_each_gt(gt, xe, id) {
> > > 		ret = xe_guc_ads(...);
> > > 		if (ret) {
> > > 			xe_gt_err(gt, "...");
> > > 			return -EIO;
> > > 		}
> > > 	}
> > > 	xe_pm_runtime_put(xe);
> > > 
> > > and thanks to PM guard class we could avoid such mistakes for free:
> > > 
> > > 	scoped_guard(xe_pm, xe) {
> > > 		for_each_gt(gt, xe, id) {
> > > 			ret = xe_guc_ads(...);
> > > 			if (ret) {
> > > 				xe_gt_err(gt, "...");
> > > 				return -EIO;
> > 
> > Just responding with a question here - haven't looked at the rest of the
> > comments.
> > 
> > How is this not still a bug? Looking at scoped_guard, it appears to be a
> > magic macro for loop which acquires / releases a lock or in your
> > purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
> > step? I see coding patterns like above in the kernel [1] so I do assume
> 
> with __attribute__((cleanup)), the compiler guarantees that
> it's executed when the variable goes out of scope. What you are probably
> missing is the use of CLASS() declaring a variable inside the for, which
> uses attribute cleanup:
> 
> 	for (CLASS(_name, scope)(args),
> 	     ...
> 
> GCC's doc:
> 
> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> 
> 	The cleanup attribute runs a function when the variable goes out
> 	of scope. This attribute can only be applied to auto function
> 	scope variables; it may not be applied to parameters or
> 	variables with static storage duration. The function must take
> 	one parameter, a pointer to a type compatible with the variable.
> 	The return value of the function (if any) is ignored.
> 
> 	When multiple variables in the same scope have cleanup
> 	attributes, at exit from the scope their associated cleanup
> 	functions are run in reverse order of definition (last defined,
> 	first cleanup).
> 
> 	If -fexceptions is enabled, then cleanup_function is run during
> 	the stack unwinding that happens during the processing of the
> 	exception. Note that the cleanup attribute does not allow the
> 	exception to be caught, only to perform an action. It is
> 	undefined what happens if cleanup_function does not return
> 	normally.
> 
> This was only possible with the recent change in the kernel raising
> the minimum C std to gnu11 (uapi is still c90 for compatibility):
> 
> 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
> 	Author: Arnd Bergmann <arnd@arndb.de>
> 	Date:   Tue Mar 8 22:56:14 2022 +0100
> 
> 	    Kbuild: move to -std=gnu11
> 
> 	    During a patch discussion, Linus brought up the option of changing
> 	    the C standard version from gnu89 to gnu99, which allows using variable
> 	    declaration inside of a for() loop. While the C99, C11 and later standards
> 	    introduce many other features, most of these are already available in
> 	    gnu89 as GNU extensions as well.
> 
> > this works, just confused how it works.
> > 
> > With that, any code which isn't easily understandable IMO is a negative
> > ROI as it just creates confusion in the long / makes problems harder to
> > understand. Again this is just my opinion.
> 
> I think that is mainly about getting used to the pattern. I think we
> just have to be careful not to overshoot on trying to use everywhere.
> For example, I don't know why there's already a second use in a separate
> thread when we are still discussing it on this one.
> 
> A very positive thing is that this is not xe's own invention and comes
> from core kernel, maybe from the hottest path that is the scheduling and
> locking. So I very much disagree with arguments raised here about
> a) this is an alien thing and b) performance will be severely impacted

just for the record:
a) the alien thing is i915's with_runtime_pm... this is part of core kernel, so
it is not an alien thing. I still don't like C++isms, but that is just a preference
not a blocker.

b) it is an overhead, but I really doubt that this would impact performance.
Only data would show.

> 
> I've used __attribute__((cleanup)) in several userspace projects in the
> past and it does help avoiding problems on the error path that is
> usually not very well tested (and xe's track record on error path is not
> very good either: those were the main issues being submitted in drm-xe-fixes
> for the last release). So if we have a way to improve (and that I've already seen
> being used successfully), I prefer failing on trying than on repeating
> the same mistakes. 

Pretty much agreeing here! Specially because this is a Linux core kernel
infra available. Let's try.

Cc Nirmoy Das <nirmoy.das@intel.com>

who is looking at the forcewake stuff and to solve the flow.
Specially to get his eyes here and see if this would cover all the needed
cases for the forcewake.

If this series were suggesting another with_runtime_pm macro, then I would
push back hard.

>  In kmod my only regret is that I didn't start it
> earlier, during the bootstrap of the project.
> 
> 
> Lucas De Marchi
> 
> 
> > 
> > Matt
> > 
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
> > 
> > > 			}
> > > 		}
> > > 	}
> > > 
> > > >
> > > > Well, on the positive side, it is not adding a driver only thing like
> > > > i915's with_runtime_pm() macro.
> > > >
> > > > But I'm also not sure if I like the overall idea anyway:
> > > >
> > > > - I don't like adding C++isms in a pure C code. Specially something not
> > > > so standard and common that will decrease the ramp-up time for newcomers.
> > > 
> > > does it mean that the use of other guard patterns seen elsewhere in the
> > > tree is now prohibited on the Xe driver ? like:
> > > 
> > > 	scoped_guard(mutex, &lock)
> > > 		foo();
> > > 
> > > 	scoped_guard(spinlock, &lock)
> > > 		foo();
> > > 	...
> > > 
> > > > - It looks like and extra overhead on the object creation destruction.
> > > 
> > > from cleanup.h doc is sounds there is none:
> > > 
> > >  "And through the magic of value-propagation and dead-code-elimination,
> > > it eliminates the actual cleanup call and compiles into:"
> > > 
> > > 
> > > > - It looks not flexible for handling different cases... like forcewake for
> > > > instance where we might want to ignore the ack timeout in some cases.
> > > 
> > > there is scoped_cond_guard() that likely will be able to deal with it,
> > > but I guess we first need to cleanup existing force_wake api as expected
> > > flow is not clear and there are different approaches in the driver how
> > > to deal with errors
> > > 
> > > >
> > > >>
> > > >> Matt
> > > >>
> > > >>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >>>
> > > >>> Michal Wajdeczko (3):
> > > >>>   drm/xe: Introduce force-wake guard class
> > > >>>   drm/xe: Use new FW guard in xe_mocs.c
> > > >>>   drm/xe: Use new FW guard in xe_pat.c
> > > >>>
> > > >>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> > > >>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> > > >>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> > > >>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> > > >>>  4 files changed, 82 insertions(+), 50 deletions(-)
> > > >>>
> > > >>> --
> > > >>> 2.43.0
> > > >>>
