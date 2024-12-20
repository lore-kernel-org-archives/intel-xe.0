Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F07E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7E510F047;
	Fri, 20 Dec 2024 19:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfKVlQdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3010F047
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734722508; x=1766258508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JaAcojQVrohOr/S1iN+6RJB/GypI76et11he3QfWKts=;
 b=lfKVlQdJksiAmT69qUNf9z9NrUCqaKwUReobwNDkaxAWO5NYTl/foZV3
 DVYhMuUhiXbv94PZysYg78G25kHRWH3oA1x+I+BiFMVbg9nNZi5G6/u3o
 pfJIEh5TXjyDMrxhsEYoPm6i3+dops0fWbbXj410564DbQMnI3EldE/eM
 stmrDKa1r2mOrSi04tCC+m0p4RsNKe20feqF7OCsQcibjYad4vLXVVGO7
 aZfHRQg6OuBIz/DarCuZO1O5vAUOg2PYFz/kKz/eRYohNbClxwR+YbgFe
 Q9KQ5+Fc5H9B4rkRFN5qllVaIdxk8Fp2Msx5QdgjfeG2TNgw/ZRDyZePf g==;
X-CSE-ConnectionGUID: g+r6Y2oUQhq6h2ILJSnf1g==
X-CSE-MsgGUID: K6fK4sG8QGGZ7E7aEcvVAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57752934"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="57752934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:21:42 -0800
X-CSE-ConnectionGUID: EL2gTI6pTDiEvKUDDZSYtQ==
X-CSE-MsgGUID: gR8iDzerS0qrYF+eyfe+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103198666"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 11:21:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 11:21:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 11:21:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 11:21:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVT/qNN2zd7N6HwPTijTYZAFSo321HNm/dEKnAS3JNCh+Pisn8b9wW8TYIu5e9jsxP3JWcEx52jAsGTEwxIx8jqWzYCEZv2XbhrPAxsBwCKWH6GjsXv6048nroC6rj8qNKx/jioN4/PqdVVGjYWzUEmF4i/wxJBAA4dnJ1e+oAGI2XRr9VZ0cFg+aEOWmMghqEqm0kmTXh28G3JEN3aL+PEXL58V5w6SxXa41rP51peI67yIKcllXimLjEauiamLZvffS62jDrny7LF4NgfAENaUtNRj4W4FoebYSLngDRVmTU8YcSz1U8GWNeLkGSc6s8pkYqYgjJgpXwn4TZbtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96y1wx46tDXfZJDnRMkyzfXOp39j9fxCQ5IDXNH41eo=;
 b=BuB1Zd4zkPHtLLcQimQnBsAlpZRdOQ8FdB4GJ4pcuSROCCRcfM/fv+kc1SW1eCYy0B89iNlUPgVWEFtI7ZqZWqzxwugVCXV0cbeelI8P/LaQz8AyXK3La3dywh8tZRODrmoGIuAh6ncxZpsk5wV1z0LsHpiBIyeJWd1FY5+tsU3pMxZBnLaeyFD2oZ0hxftQQec2FJDSa0EdoC3o1odYy3Upgb5pSZTG1YtfDvV0q534LGFG28K30GLOsbTjH472hToB5HNFQsWbERyoIZO0UM4PgjvyohLTUxSrxu3Bx7FeiKL+JcbgxegOAeHptSBnNhazmmLgusDRcYrHXhJVnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 19:21:20 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 19:21:19 +0000
Date: Fri, 20 Dec 2024 14:21:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on
 system suspend
Message-ID: <Z2XDrV3iWFwLO35z@intel.com>
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
 <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
 <Z2WFSGR0ejBA4yTp@intel.com>
 <Z2WZNp0YZAehJfoL@ideak-desk.fi.intel.com>
 <Z2W4mTZBwFPujqzM@intel.com>
 <Z2XCRWUu5niI2GOz@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z2XCRWUu5niI2GOz@ideak-desk.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:303:b7::15) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c98d48-f535-43f4-ae52-08dd212b7b97
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yXewKPe11avltyerhz03/MzKfd/xniEWxzXk4+zIt3jpQPq4Uy8S8DW00UAq?=
 =?us-ascii?Q?hhZX9b20fYph/g/0S7ua+9S/qyNGGHtBZ1GVInI66FXSv8WgPTHW3Xky1AK6?=
 =?us-ascii?Q?JvHyEaHsgcNS6FTcvYIva8wElxVurbkQkionkwxvnZrHpG2v2XOm3RqzGEKp?=
 =?us-ascii?Q?4eBecXXXjUlTGzqphU7Df0vf4npobEnAdhO40FUMBg4OvEHXQ4zG9aPXovsB?=
 =?us-ascii?Q?zTast6lx2JEDppE+wc7N9gVDAmWPS18ppDMYX2T+uXd9iDvCn6XA5RriVxoy?=
 =?us-ascii?Q?rA5kx3KvlEfUz0hjJNl+6oypasoHFqjAxdLDlHgyeczFX0rofLfHQrcj3yD5?=
 =?us-ascii?Q?94sIu4WwkRVKOS8KntVl330rNdQsjEv8Xwitlo2zXUdymfkSznwt7VFHRBgz?=
 =?us-ascii?Q?Zwqx2mIombz7CrF8u/aVpm6eJ3U2qOj0QG1k543Ze7DMCQ5ecFYVzxlWiB2Z?=
 =?us-ascii?Q?S096D45SUiTMy+9hfXj2tT3kNrMSGV6HKEbAACJnifYy4kE1P6YTtlprN8KJ?=
 =?us-ascii?Q?1Tll9gYZWMjkWC3U5W6KkyNEzFqfbvII5vS8XWWQReo1RdDOIg2QYXUiPbTo?=
 =?us-ascii?Q?hFTglkZEuMafvULJ0Fkgu6wCvHE244lAj02kNj6lfwR1vOj6QOWKtVKk46Ta?=
 =?us-ascii?Q?1DoQFKRO48qXl5PdhCxj1qazmaREkCqhFgKdXydm6ID1ZKj5L1aupglvZ4ar?=
 =?us-ascii?Q?AECH50YQpbd/3KsnjsQ497djrpxlWeyQXD7qqMExiPHcoJkZCFKr2Yt/GR1o?=
 =?us-ascii?Q?+hhX1UUFDdsa5C3vloOyADxCzhOyXCYMpFtfBZoUfjqYaoLWXDqtXTkTbZDL?=
 =?us-ascii?Q?oDakBgxaWRkxXPPD8yrsaQJFVh+YMESuRTEC0VK8PxczhhmSgHdX5/8sdw6z?=
 =?us-ascii?Q?clt/wmGHOIjm9JV2sQM985htikUq+cjRA/RY6x9zMO70gJFzSnT/BmMvZCnE?=
 =?us-ascii?Q?cWLBI2X1toaKeAUnWu4MWOwmrLttA9mPBPkpxQ26Z0n9by29gkNln1QbCvAC?=
 =?us-ascii?Q?+o9Yb8yYnhd78rXHuKO434ASqaS4n/Acud3LM//psv1aAhk4NfEG6as23wL9?=
 =?us-ascii?Q?0sZeznjbnV/rJbGtbKGqfgEdiHaaLcisHZbcgWtMOYnLRSWShHn45Rlewn+R?=
 =?us-ascii?Q?W8v1booCyXS/vpBWl1q1a5lS9GzlgxU/hr2qGKIGFKUsIWS3vo/gCCgzqMQj?=
 =?us-ascii?Q?drLzY/01dIJNudnCL3b3ds253jMzwP5gtGkTILNNq9EmI0o507lJChb82ApC?=
 =?us-ascii?Q?iK1PX7VpPoEdFqSPKsWINt1a1sMxh8jDvRZt3t7sflJxX7GgSq7Vbanc2FPC?=
 =?us-ascii?Q?9Zmvi8UEu/Ck8V0LUWCG1XwvpOmbYQ0fHiJBfaHJcP+VVF27eXZUYsg/PtEn?=
 =?us-ascii?Q?ETakvshlhv+vs6dr9F8jzdEwz7Pp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pqdc0LHFjyIkueqMdvlTHHs1RDWP0LLZVzLLfAZsOx2/cQwKU0TrsUYyuhOv?=
 =?us-ascii?Q?xHyyw+JGPkZTPhiDrjifhwpn/RD2JmuywneK93BvqH5LzDmbh+xsbWHWaErb?=
 =?us-ascii?Q?GCNgi3YoD6MGDwH5WrNN9VyChC4edWAUfbHcSS2Y9B9RmI68+vxupTH6RRHG?=
 =?us-ascii?Q?hiPePc+q+OanG+FEmfy2l7WAogAVayrPWlq3MOyhMftzTD+MWYZu6VAxlrbh?=
 =?us-ascii?Q?dt4w9qXAqqafCMLBN0UB8be/JJyh4BvDajjNVB+n2QIqxaV8vvssIqzi9z+c?=
 =?us-ascii?Q?RtRkjSVrmRFf1BQ39rE14beD02EQsabcEXNU6UPzDVgLy6cPmGePucm0zAKW?=
 =?us-ascii?Q?CafO26sZaGwhp24UB/B5kWu9UNopWBT2Bujb0o2veZt/fHdC8D4D9iG3jDAq?=
 =?us-ascii?Q?wXMjO6x77SoSYhOQ4RHX62L6nqI2Cs81LjlNMyiJWHRO+bXAzdyZtmutkFBa?=
 =?us-ascii?Q?vxYAbZFWgPsDyHifZvY+c0Ibd092A17LJ39fU9XEjC97impXF1IsilBCAMix?=
 =?us-ascii?Q?T4v4/Fjo4RyRHzPyryQ352XxvuM/7JI7H45KF75GlNLe8lQcACKLqOnH6vWz?=
 =?us-ascii?Q?Rk22nvNwgLPDsVMnL9FtXG/73iNaYAezmvvbizopYL9MjSPNhmEG+tGPlQZE?=
 =?us-ascii?Q?+0MF8BPaponxP3vIesvvwKGtB4leY0pTqPHEUglbizYMnWoS23Kn68sS6E99?=
 =?us-ascii?Q?7B1Zpac+Pvt7fRQ26j9ZS6xbOrcGpldRc45fjQfXaEoVxSQ7MX4dydHd2TUL?=
 =?us-ascii?Q?bBff0/6Jbx9WLXBG81RV3jrpJTvS8uJl/2Xyf8OXq7VTw04qer8dTePtoXlM?=
 =?us-ascii?Q?OL6h0P9LBzF764C4Yhv2oLEsyzV130TfRb2wkMdhUGtrYh0W0lcm3SQasZb8?=
 =?us-ascii?Q?p+8pH9x9s5B/wS2z4Mm7rWUfBcl+1xKzaa3DhDbYzOcHEu3OXkf+YooJJzsu?=
 =?us-ascii?Q?6Je3IOMUGt7SHJtQmNj3GvxNDrImZ4yCvQMkfeH0wJSV8wZYJIfsxdkk+KNi?=
 =?us-ascii?Q?hppj5OTk7fQS+9WnUHi8QfUY7QBCh773jMihpKdzEviI7wptYMNt4uZoValx?=
 =?us-ascii?Q?l90Qkrw9AwEi79w3YwpkVX5wirKX4R+r+of05FALQUWZVx2ZjjmzsvaBUG4h?=
 =?us-ascii?Q?evtC1/32Q+s5U9QwLOA2iUNLE3QxlVtwKj8T+rg33hwP1X6CDJKRePJI4VJm?=
 =?us-ascii?Q?exuYQfpQxskHf3XcdjhCKWSbbEy1cOgoFli4mU5P1vBAkVs0IrLddYVSh2pR?=
 =?us-ascii?Q?jgF33ii4fv70jP4ySY96EMH7JIPwIcvSVAH4g5Tj7ZLRrCFi0S3/G9PfMMfd?=
 =?us-ascii?Q?l8CuFwsBspuexw/ZWRplPz/6n9aH+Somw8cTornhzXyaBcyNSiGSIrVXCmPZ?=
 =?us-ascii?Q?2I8yVSoCsndQSf9w53iRHy1VhvFwQgD9ph5j+CDKrlnXZDp2YR2hE1wZ6Ztt?=
 =?us-ascii?Q?FrzBeSx1NXifvvyRc+ZK399ulm977JBEcO+WBFZ/wT9i+UUijwa1LBFYwhCL?=
 =?us-ascii?Q?9K29kpyO5ebgDg0D6/LlLe0FS2E5IXWo/JFW45cDuWv7T6Q8QLFB/Web5KOT?=
 =?us-ascii?Q?ns7xroxRTKLG28jxnZUK4R5jwlRmAkTrQM6obAY1yb4AZ1rNziP/zCZx+7YA?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c98d48-f535-43f4-ae52-08dd212b7b97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 19:21:19.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6I/0TNGPdraKHNosxeJUMyVkXAWF4Tw0Cuv+62T2kM4CD74MHw5eAX2bLroGM0WTn5n6Vzt9ydP/ltvoRUzGaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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

On Fri, Dec 20, 2024 at 09:15:17PM +0200, Imre Deak wrote:
> On Fri, Dec 20, 2024 at 01:34:01PM -0500, Rodrigo Vivi wrote:
> > On Fri, Dec 20, 2024 at 06:20:06PM +0200, Imre Deak wrote:
> > > On Fri, Dec 20, 2024 at 09:55:04AM -0500, Rodrigo Vivi wrote:
> > > > On Wed, Dec 18, 2024 at 04:33:09PM +0200, Imre Deak wrote:
> > > > > On Tue, Dec 17, 2024 at 06:05:47PM -0500, Rodrigo Vivi wrote:
> > > > > > We have some cases where display is releasing power domains at
> > > > > > release_async_put_domains() where intel_runtime_pm_get_noresume()
> > > > > > is called, but no outer protection. In Xe this will trigger our
> > > > > > traditional warning.
> > > > > 
> > > > > I suppose by outer protection you mean an RPM reference that is
> > > > > guaranteed to be held at the point (that is right before)
> > > > > release_async_put_domains() calls intel_runtime_pm_get_noresume(). This
> > > > > is guaranteed, i.e. such an RPM reference is held by definition (by the
> > > > > power domain reference that is being put).
> > > > 
> > > > not actually.
> > > > The outer rpm reference needs to be a reference on the outer bounds
> > > > that ensures the device is awake. _noresume calls should only be used
> > > > in inner places where you know there's something already ensuring
> > > > that the device is awake but you don't want to take the risk of that
> > > > reference being lost while you are in the middle of your sequence,
> > > > so you call the 'noresume' as an extra thing to ensure that you can
> > > > go to the end without device getting suspended because the other
> > > > reference got dropped.
> > > 
> > > Yes, that is what I meant. In case of release_async_put_domains() it is
> > > sure that the device is awake and hence there is no runtime resume
> > > needed. The power domain reference being put holds a runtime PM
> > > reference. So the "no outer protection" reasoning in the commit log is
> > > not correct.
> > > 
> > > The reason for the WARN that this patch fixes is simply that
> > > pm_runtime_get_if_in_use() used by xe to check for an outer RPM
> > > reference fails if it is called either during runtime suspend/resume or
> > > system suspend/resume. The existing code took this already into account
> > > for the runtime suspend/resume case, but it didn't take it into account
> > > for system suspend/resume. After this patch the outer protection check
> > > will work the same way for both the runtime and system s/r case,
> > > removing the WARN in the latter case.
> > 
> > great then, we are in the same page.
> 
> I don't agree with the exaplanation of the commit log, it should be
> something like the following:
> 
> """
> Fix the false-positive "Missing outer runtime PM protection" warning
> triggered by
> release_async_domains() -> intel_runtime_pm_get_noresume() ->
> xe_pm_runtime_get_noresume()
> during system suspend.
> 
> xe_pm_runtime_get_noresume() is supposed to warn if the device is not in
> the runtime resumed state, using xe_pm_runtime_get_if_in_use() for this.
> However the latter function will fail if called during runtime or system
> suspend/resume, regardless of whether the device is runtime resumed or
> not.
> 
> Based on the above suppress the warning during system suspend/resume,
> similarly to how this is done during runtime suspend/resume.
> """
> 
> If still possible, would be better to amend the commit log based on the
> above.

Indeed much better... Fixed, thank you

> 
> Thanks.
> 
> > > > > Instead, the actual reason for triggering the warn - IIUC - is that
> > > > > intel_runtime_pm_get_if_in_use() called from
> > > > > xe_pm_runtime_get_noresume() (probably for the exact reason to check if
> > > > > an outer RPM is held) fails if it is called while system suspending /
> > > > > resuming. This is the same scenario as when
> > > > > intel_runtime_pm_get_if_in_use() would fail if called during runtime
> > > > > suspending / resuming and - worked around earlier I assume - by
> > > > > suppressing the warning in this case using xe_pm_suspending_or_resuming().
> > > > 
> > > > The get_if_in_use is only the choice inside our _noresume so we can
> > > > properly check if the device was really awake and warn that we have
> > > > an unprotected case that we need to handle properly. If we were sure
> > > > to have all the outer protections in place already, we could safely
> > > > just use the _noresume option from the rpm directly.
> > > >
> > > > > So in this fix the above workaround to suppress the warning is just
> > > > > extended to the system suspend/resume case.
> > > > > 
> > > > > > However, this case should be safe because it is triggered from the
> > > > > > system suspend path, where we certainly won't be transitioning to rpm
> > > > > > suspend.
> > > > > > 
> > > > > > This wouldn't happen if the display pm sequences, including
> > > > > > all irq flow was in sync between i915 and xe. So, while we
> > > > > > don't get there, let's not raise warnings when we are in this
> > > > > > system suspend path.
> > > > > 
> > > > > I think the issue fixed in this patch is just a consequence of how the
> > > > > outer RPM check works using xe_pm_suspending_or_resuming() and wouldn't
> > > > > change even after the IRQ related issues are fixed.
> > > > 
> > > > If there's other cases where this release_async_put_domains is called
> > > > out of the suspend path, this warning here is showing that we do
> > > > need an extra runtime_pm_get right at the beginning of the workqueue.
> > > > And this patch here would only be masking this warning in this case
> > > > here, while leaving the release_async_put_domains unprotected.
> > > 
> > > Fixing the IRQ handling doesn't change how pm_runtime_get_if_in_use()
> > > works and hence how its return value is ignored in the outer protection
> > > check during runtime and system s/r.
> > 
> > indeed!
> > 
> > so, pushed to drm-xe-next.
> > Thank you so much for the suggestion, review and insights here
> > 
> > > 
> > > > > > Suggested-by: Imre Deak <imre.deak@intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > 
> > > > > With the above understanding:
> > > > > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > > > > 
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pm.c | 4 +++-
> > > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > index a6761cb769b2..c6e57af0144c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > @@ -7,6 +7,7 @@
> > > > > >  
> > > > > >  #include <linux/fault-inject.h>
> > > > > >  #include <linux/pm_runtime.h>
> > > > > > +#include <linux/suspend.h>
> > > > > >  
> > > > > >  #include <drm/drm_managed.h>
> > > > > >  #include <drm/ttm/ttm_placement.h>
> > > > > > @@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> > > > > >  	struct device *dev = xe->drm.dev;
> > > > > >  
> > > > > >  	return dev->power.runtime_status == RPM_SUSPENDING ||
> > > > > > -		dev->power.runtime_status == RPM_RESUMING;
> > > > > > +		dev->power.runtime_status == RPM_RESUMING ||
> > > > > > +		pm_suspend_target_state != PM_SUSPEND_ON;
> > > > > >  #else
> > > > > >  	return false;
> > > > > >  #endif
> > > > > > -- 
> > > > > > 2.47.1
> > > > > > 
