Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBBBCFD2E3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 18:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75510E0AB;
	Sat, 22 Nov 2025 18:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoiR+5oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E6D10E04F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 18:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763836780; x=1795372780;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rOQ7UrFDwLPQWEzzGAZuMWn6So4H/R/tU2/pmSqnzv0=;
 b=DoiR+5oiKMPfI9jKyPuvkTDFDLyWn3SdewCt+Mac1yGw5jaWBWqwLjs6
 XYOvAeqqwkO8jstAIrQiQbaokHHujHUcoY8O0AbhlCXHPxiE88CAj38/c
 Uy0MNKx7Ry0OkOPGsCpdbFD1BRQgod54eSD+GgDcdWwqLiIfLqqrClcSk
 8y2vLohXtuBQMCHXH+iZjyIERhVBDphJB2ZcKwvu7uQl6/23SMAs5mh77
 fee9we8fWTmBT7tRfNGYcR2xZKFFBvX1FmVh4V/1s8bRBySCpVTQOFFCz
 i1yWz00lsh+3w4hjUFcrS6HbGTnLV8SUCHvG0cKVxk+yJWyhAbROxxeyT A==;
X-CSE-ConnectionGUID: jSgSX0bVQYCJg9QdP9vMxw==
X-CSE-MsgGUID: ouyOGqmKT9K3QeaieiH5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77011420"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="77011420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:39:39 -0800
X-CSE-ConnectionGUID: TtsUNUEhRhudeuMSadGMmA==
X-CSE-MsgGUID: Y9cGTaMfTXqt6shFQjPBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196254365"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:39:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:39:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:39:37 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQKZquxCT5uDqbJc4IGQPR+nJJ2yOh0M0YqSNZAV/XBDctkMALRR3lX+Jfcbr0ZP0tOZu5i52msjxbARc/ERhBk2O6gxAO5JpcgxFvSaI0j4pISjMeb8JqIk1/cGEK+VH0UzrLXpnDoaqrIN7s2k1/EbV2xQOOwzMexQ6LVkrN2rzM8lOFrfiUwx1GLxC1ZM9c6J9JEexpJmpe2C2DoUE/p9mmeZUPlpu7EMjmnAhUGvwp2UzCabHPBPFsPEUsCs5cwsJQJmKfeqVbL2Braky1I5J0SXPsagIH+5mAXmEY0+6uTpibf3X76UqhOU69VWYjxF3JznfChTkrDpjLjkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUyH0CrRdboQmuhJSx/KMlzD3Z4jSuJgyPbFLP+1+uY=;
 b=jWWBKk0NLWcKxHMzYqkI7aOYlbfc8UeU4GyYEBitslf2iCpTjTYSxehiq0FizgvFeeuK+w3e59Vxw55Z9SmNe3vJLmN6qU1g2uS4oh2ET+3c8yRgPwfqyOaPLseumFENRZXHQwDo5w/EvU9uM2CmrYPkvG38Drginovt13rrYWTpvwLbj+GtdkTON2MG6X8vy4iwqhMpCU6yFsOAhcL7BvDF7iAJtUM6slnhJ1q6c3JuyKWw8p+QI+As38qn0NDTZX5PvPvAqn6z2IFkRwvWy+KsSTqko2Bpa+GTCFOs8U8sN1ZGDcV7dajGbwguCkH6nR4Y593adoGe6ppKsTpnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 18:39:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:39:34 +0000
Date: Sat, 22 Nov 2025 10:39:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Upadhyay, 
 Tejas" <tejas.upadhyay@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: Re: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Message-ID: <aSIDY00xv6Q+I2cg@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-6-brian3.nguyen@intel.com>
 <DM4PR11MB5456D83789C73B756FF7F570EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <SA1PR11MB8839340F6CB3C3E374DAAF07AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB8839340F6CB3C3E374DAAF07AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc30597-8242-4904-cc92-08de29f67b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OPysL1FUzV8P2lHTIIhDfKMhnTMLBwU1M6ukAh7H7Td1AppzMtbJkN0JEZUB?=
 =?us-ascii?Q?o8tTSfGuWcszH+v98zAFnM/wasfMy845Ug8H8VBeH7hPEaIBF9++91cXPSax?=
 =?us-ascii?Q?DvVrG6kX7dZrKKYoaa22wdaLpK9n2wHBcqQmdA7BW6fnu35SROUQccD7lv0w?=
 =?us-ascii?Q?5u0z0mGic3/ZX9sp4UagHlDIKaol8o7WszQKnchQHs9gOwYFPbJBq1ZH5JC1?=
 =?us-ascii?Q?4frfED6fm5/c1t5HvYwwCyRIOFQg+n5iPNYg//pbEir+ajV6u6XIBuq3SLYg?=
 =?us-ascii?Q?l+CnY6WT0HGWMFdECIig5AkzSlm5IEqW7HPjgvBqCo/2sceTPktldaR0+W86?=
 =?us-ascii?Q?xN9Dtv71Jpw/+z+Fgv+C/710B5lsOw9gjpyMoeKk+KMgra7k48yTM/aqFEx+?=
 =?us-ascii?Q?x6ht+LJ3vPoZQbmWJobsh4wRuRNR/G/WSiXusY/z4BkzeruxmThgrXDbRXzo?=
 =?us-ascii?Q?uawztsXC24V1yJgpxFLUPXhRfsNVOHQneojOjSg4a948kczPPndbtrSytpHN?=
 =?us-ascii?Q?1Pr2LcFynKroNFggSxGOPhbTZTYg0lXX5dRpzxzOLkIzm8bI0aQtndZ4DDFx?=
 =?us-ascii?Q?WhmOjwh41iH5a+HuGQDxIykzBvfSr+sf16O+eV2IQ8hdVYicTLUGjQm+L6bZ?=
 =?us-ascii?Q?PwQXdDqmi2BZxhc4cgKY+K70DjMc6J+Wous/Wh+U7Dse9fP2TUfDVZsmRPzP?=
 =?us-ascii?Q?RjQ+iQsdnmFEZpMq4QyoGX+JoKrhEaH9vAWU6Z60uQs5b91oaFWjiC8K8Rjp?=
 =?us-ascii?Q?Ek/orT8I5wR1Fe8t5CnaFSTb2nOoSV/QNM1cC56VFwJM410aQw2znPd9F+UP?=
 =?us-ascii?Q?xmFSG6YAropAj1+y7ykM3eC80TBcin8PgmViinBhV2+pz24UkwsfdLkExFMO?=
 =?us-ascii?Q?cMJErYo9yaB5EDuaLBq/hCi1h5SxhUpI+IlN/RiR4n1XQxn4sq81a8v7Rcrd?=
 =?us-ascii?Q?XqBZ1qisUi4Rus9WNhF2pZo/oRq4FK8SrA+K6kfe/m6dDsEuNBhTfpV8+7NC?=
 =?us-ascii?Q?OhERJ9cMyGSXm/0APnV3cY4BXH30NL6hm9w/FlCayxLUwoHXDeMDt0fwakwt?=
 =?us-ascii?Q?qb6uVhnj84dUXzhei7CSpbmmJi1+MVMtnuGN+S2hmnGu4Dup0nhfD8MsjucB?=
 =?us-ascii?Q?/vOxNInyNLFi3TO0XYur6CLnpWyfG/ijRrV3irblsxd8eR3pV5MkJ+FDHkJo?=
 =?us-ascii?Q?bo56mDt2ae5x9JRHdOVr3a/Cm3ofuR1aT/IT+hML8A8ZPjLXJa+l5ApNYinF?=
 =?us-ascii?Q?96LST+GfAmqNofPNZAD1fT+VECUj4Rb9UwCcuVJmDEO9ZZeiD9vD/3sAluuF?=
 =?us-ascii?Q?x9+hP3jtwxnwvJhxH/Gc33U2HUMq97V8S1/3ksMoL52gT+I910HmsdkC/i27?=
 =?us-ascii?Q?tJlnNPAogivdnofOC542fKfAR0LzuVmwXZfliCo660nuN8165CUw0dpfo52M?=
 =?us-ascii?Q?4LYjVJVvlr6fUCX2pE1CASR2RFNNoELC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dAoLhR75McxYB0xCVpKRDNcITkRvZpBiuniztx22WqRtjJh3WIEeyOx8CTk2?=
 =?us-ascii?Q?smNPEA3BlGHIJSuV9hjxO41STZhm289SFM+FRz9oDWE48PvkDCzVUpgTqidJ?=
 =?us-ascii?Q?BWbgx9/pcHbL3PrpT57neOBiwxQaXjzP/e4ZxHpKe0bTxDwDvKEHkFDtzbhc?=
 =?us-ascii?Q?kBcGbYGNKO298QikFP2AZwBC2ocBBCrzyIkhdtU02ZAp5p928gDG3DJIyfXx?=
 =?us-ascii?Q?d53Y2r1mr4UnMw2XVqJ0B6EoQMPMFVE9EvcufeNbSyX/rbOe+bhO+fNG2Cl9?=
 =?us-ascii?Q?LmHhLZUWbOPBjV3kfecw946/xPCxF7fgeIRHPcUkD9VUxFUSIqiJsw/o5Smc?=
 =?us-ascii?Q?3YNyKXn0ArxSGRdFEQMYhxXuSCzMaI4d/Wsow7xBrRoR1c73zUtMPt+qLjSA?=
 =?us-ascii?Q?rJcF4LOVmFEuyPTcx9N/Komdd/r+jpVlOCQLKLqYk5DAIrpRfOsJrXQ0Fn5P?=
 =?us-ascii?Q?+IXTN0rgMwHtTAp5L+mvS1YW6md8j4X2YOpdCP5TbPKBO/V0rIdiULZKl7eG?=
 =?us-ascii?Q?l0otnSVA0blyrdm98iWQDIsr992HHPfCaZsThEqGq8st9wbVDVZBaeR3xrYd?=
 =?us-ascii?Q?w8Vww1XaYRXWqGauon1E6bz3J6oI2JvE7tLTVqKdbGkl+XCo78pzn2mkAo4D?=
 =?us-ascii?Q?QJcKlbduiuq2o/iizJ5PwqmJ+w4AuIT+4jEd1JW3Dexbp6wEDpX8fyfSr7Js?=
 =?us-ascii?Q?ZIr4nKza8qAmUH7MqGxYNOhmvNp8/53wOXJN5SkQc8qhX6qq6UxGpZM4hwtW?=
 =?us-ascii?Q?covZMHbTkzM4WQk9Np9CWWYjUvNCtt9M/1MdBfVXGNM1baAM8wp76d5xLeN6?=
 =?us-ascii?Q?WXMUaTt4qntS+RySdQjLJf54s575hRjYqpTmP7Ak/LZHxRszq9xA9I5Wsy+7?=
 =?us-ascii?Q?5D1YpJUIg7L5fhESWq3MAwDlvsTSA3BXGC9VUVnJpuqkXa7T3a5YUY2nTFfB?=
 =?us-ascii?Q?BUt4Am9Hf1iNFc1nvu+XvE5JyVkS/2eugy4/L8mrUjCSCegc+6OhPQDj6C/V?=
 =?us-ascii?Q?UP0n6Frt3sVIZA4Jzd9CA17RJ2rC85XJDpmmOwB4azQQrpBtiNe7c65atJL3?=
 =?us-ascii?Q?jTO9/HjA5OOMFSzowqYxOXoV2iJhBozJjEQoUb9gRRyqX6ByOBXHSTTdS4Hp?=
 =?us-ascii?Q?2I9JlL40AwSzSzNcHH91sJb5x9sYdx8nOZmhES8fMKIfG1/7XVTanqgvxlFE?=
 =?us-ascii?Q?mEdz4JzEHmPlqwQN52iXDpa3ifKGuRx0alMbZw6zEOyE2OuQM35oeWbLp7aW?=
 =?us-ascii?Q?9cSRyNn5qntxwcx6nmHBuY8EuJ+VUiLYZyrgNurUBfCz/EafdZcvhGE2TK7z?=
 =?us-ascii?Q?yfCk8vfq4PuCeS7VU/S+uPF/g7YUYCJrcDGk/rYjbyoG71WBnaM0kGAbW1j8?=
 =?us-ascii?Q?gT0oHu3aIb4P/2SW3P4lhnWW7Z/lbOLA7AsqwoR8BmWyLNIAsFAMigxwzC+B?=
 =?us-ascii?Q?Sb2J+DnwUVd/BzUZfKNlx4URAq7WWUpjShhRWGhzkrzkqfdxbuTeIp+FslaQ?=
 =?us-ascii?Q?xh24g3ot2YyT1z6uQqumjnX3nq8HWhCa7rPYUWAfpU1ktqovtMRx4qrFGiI+?=
 =?us-ascii?Q?6T6bTxAqegm7Vfx+Q1jASkVxddiIc+slqqEZRSb3iDkvQ6YDTaI3n4UivZV0?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc30597-8242-4904-cc92-08de29f67b41
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:39:34.0942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdZmMJUfguD6eHBmlK1neSThIS5PPcd1w8D1XTaGtmXFhh2jW8361GnCPNc20AJ8PbEdLFwarrWw1VtwBNFrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5035
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

On Fri, Nov 21, 2025 at 06:56:27PM -0700, Nguyen, Brian3 wrote:
> 
> On Friday, November 21, 2025 10:33 AM Lin, Shuicheng wrote:
> > On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > > Add page reclamation related changes to GuC interface, handlers, and
> > > senders to support page reclamation.
> > >
> > > Currently TLB invalidations will perform an entire PPC flush in order
> > > to prevent stale memory access for noncoherent system memory. Page
> > > reclamation is an extension of the typical TLB invalidation workflow,
> > > allowing disabling of full PPC flush and enable selective PPC
> > > flushing. Selective flushing will be decided by a list of pages whom's address
> > is passed to GuC at time of action.
> > >
> > > Page reclamation interfaces require at least GuC FW ver 70.31.0.
> > 
> > Should driver disable this feature if the running FW is < 70.31.0?
> 
> Default FW version is above this at time of patchset submission so
> I had assumed it not to be a problem, since the danger is a user
> forcibly using a bad FW which already has unpredictable results.
> 
> However, in hindsight, it is easy enough to skip if FW version is lower,
> and we can safely fallback to default TLB invalidation, so I'll proceed
> with adding a check within the later patches that'll disable
> page reclamation within the xe_guc_tlb_inval.c unless there are
> any objections.
> 

I would just flip 'xe->info.has_page_reclaim_hw_assist' to false very
early in driver load once we have the GuC version if GuC version doesn't
support it.

> > What will happen if driver send this action while GuC doesn't support it yet?
> > 
> > Shuicheng
> > 
> 
> AFAIK, if action is sent before correct FW version, it'll report
> out GUC_HXG_TYPE_RESPONSE_FAILURE in g2h
> due to illegal operation, eventually triggering reset.
> 
> Brian
> 
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++++
> > >  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 14 ++++++++++++++
> > >  4 files changed, 21 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > index 47756e4674a1..11de3bdf69b5 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > @@ -151,6 +151,8 @@ enum xe_guc_action {
> > >  	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
> > >  	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
> > >  	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
> > > +	XE_GUC_ACTION_PAGE_RECLAMATION = 0x7003,
> > > +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE = 0x7004,
> > >  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
> > >  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
> > >  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004, diff --git
> > > a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index
> > > 2697d711adb2..e13704e61032 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1311,6 +1311,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct,
> > > u32 *msg, u32 len)
> > >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> > >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > >  		g2h_release_space(ct, len);
> > >  	}
> > >
> > > @@ -1546,6 +1547,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> > > u32 *msg, u32 len)
> > >  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > >  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);

I get what is happening here - page reclaim G2H just uses a shared seqno
with TLB invalidations but this looks very odd to the reader of the code
who hasn't worked on this or understands this as shared function is
called for both G2H. Can you add a comment here explaining why it is ok
to use a single G2H handler for both TLB invalidations and page reclaim?

Matt

> > >  		break;
> > >  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> > > @@ -1711,6 +1713,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32
> > > *msg, bool fast_path)
> > >  		switch (action) {
> > >  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > >  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > >  			break;	/* Process these in fast-path */
> > >  		default:
> > >  			return 0;
> > > @@ -1747,6 +1750,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
> > > u32 *msg, u32 len)
> > >  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> > >  		__g2h_release_space(ct, len);
> > >  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> > >  		break;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > index c90dd266e9cf..34d74a71c4f0 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > @@ -16,6 +16,7 @@
> > >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> > >  #define G2H_LEN_DW_TLB_INVALIDATE		3
> > >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> > > +#define G2H_LEN_DW_PAGE_RECLAMATION		3
> > >
> > >  #define GUC_ID_MAX			65535
> > >  #define GUC_ID_UNKNOWN			0xffffffff
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > index c05709a5bc98..3185f8dc00c4 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > @@ -95,6 +95,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > > *tlb_inval, u32 seqno)
> > >  	return -ECANCELED;
> > >  }
> > >
> > > +static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > > +			     u64 gpu_addr)
> > > +{
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_PAGE_RECLAMATION,
> > > +		seqno,
> > > +		lower_32_bits(gpu_addr),
> > > +		upper_32_bits(gpu_addr),
> > > +	};
> > > +
> > > +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > +			      G2H_LEN_DW_PAGE_RECLAMATION, 1); }
> > > +
> > >  /*
> > >   * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > >   * Note that roundup_pow_of_two() operates on unsigned long,
> > > --
> > > 2.51.2
> 
