Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE8E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 23:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE97010EC6A;
	Wed, 11 Dec 2024 23:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+WIxtu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BACD10EC6A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733959753; x=1765495753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f+bBTK/SwmE25Rs9hpXfMuGatiM7oW1hSlftO28q7Ss=;
 b=R+WIxtu6PbnoEdLfSBak6d37NkYtSJivsXefP9lMmwb+pgMPWAuSJEdc
 wR+LlYic/tM+rZ4RO+OczNtVj8SMCrcZrEzeLXXvyZSukC9Z/cOsy6NL+
 ApFOGVCqdbJGYRTkMcXyXm9tWX1YngfEIgU+i76h+m5Stk3eYTziod2iJ
 wWrCYY3AshZrmSF3TOxyGyr7HruAItbnHim122L6T7ejkYvhOuAtYRPXu
 MZArqLE3MjxCOalfgB06Ft1IwMVwCM0xKcgWnBDGyPuhbRShRU3oZVJYl
 55GJ1U8xQUSn8AsuCHNKTC8GLszrFiDwVwNrPgYCpdrAxvNnK3F2JWKhb A==;
X-CSE-ConnectionGUID: 4l7jzGjlSFSdLGwa2QEKVA==
X-CSE-MsgGUID: s28OYLLGSUuv4s6uRfw6dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38293397"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38293397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:29:12 -0800
X-CSE-ConnectionGUID: IhC0pX5xQEeFCfjcgXbFsg==
X-CSE-MsgGUID: 8H1z0alpQxCBF1c1YQFLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="100840158"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 15:29:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 15:29:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 15:29:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 15:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3Pi4MLB6eeE8cMa6cE9uZZGqW+yizXh5qPvt65yTgzf6nkNiDOtxCh2QbtGu0LRuJYD9oNd/zbyELJFAOPkfOIkbHhxS1sLBrSWyWVjZMcnjKEWkcKZh+R1YCSGqGJtcq282ywfSPfJzGKMOevPF2QXaa4KXNCRL1yQGL85Nn62o8mKRldILbuBUWjI6EOHWr829a6/LlYt2outmd5XQdDh7WF2mJfj+FyGX/REoIJxuaXVqtfOYB5ubq8nq0F10ucQDtbb+1J2dmexYeU5VISrBBIt/bMdDXrrf5jBzHUmD8phKAJSaISwJzZj6E/50KN56MrsWyFBdhsO/LA9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edagl2Isya6TjawzJadRZaa3NlNXudDrqEagfDnpSgg=;
 b=VVotN3gNKhBK8/J0GXlhu7gXoOvvq2bLJ4V2ctUlLKzXp6EWNrZXTZQvNtRRE9jBlHAa6PeW1u0zSeIazJ5rlOK6no/7aDILDA486ZIXkmG2wTbJLGFq+tjXrPScT6uXpO0krBvYp649AomYJPv4HB9I22/NsJF8pHAJ4LZqPAn6sSW0wOgisC6QB7LlLw1weIoDJmRsQe1fFJ/z8uKkj7MgX14VM6TffNGnZMjC0XYY88NYX+9WGSoXbWOuA/qoexGVYBKSiehVbTJcHNw9veJBYws9fLxYccFK4sYH6udHsM8o6n8p+/bc2xPHwgSKnl7DPja99arBfi9esnQprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 23:29:07 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 23:29:07 +0000
Date: Wed, 11 Dec 2024 18:29:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Ilia Levi <ilia.levi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <piotr.piorkowski@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Subject: Re: [PATCH] drm/xe: Make irq enabled flag atomic
Message-ID: <Z1ogPhzM1eD6VtlR@intel.com>
References: <20241210173506.202150-1-ilia.levi@intel.com>
 <Z1nWXdfn_azp1KLK@intel.com>
 <b6x4mamnsw2ljm7n7tl7amqmdwqnihjdnufiowudm2i4fxowun@wa2y7s2t2kke>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b6x4mamnsw2ljm7n7tl7amqmdwqnihjdnufiowudm2i4fxowun@wa2y7s2t2kke>
X-ClientProxiedBy: MW4PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:303:dd::30) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e37be9e-386f-4bde-39c5-08dd1a3b9b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VfIwynxOb5j95jpYBVo4Vz+gKsBiG1yCEV9kNxqlfApjYvX76+KejjFLRbBF?=
 =?us-ascii?Q?lrUd2UwJ2GpOnWjMbB0CT6xDo45MBEgb86mcs9W03zufUQFUiEIBLYKq/h5u?=
 =?us-ascii?Q?LQLHJbtLECRQVpM7xOm2XQJXOjHCU1yhmDSCW3bU91yd4Cp/VAvyBarLRjpv?=
 =?us-ascii?Q?JzP5kQzdj1R1PuJLgF5gAKAXOv0lSnrzu5rojhoLkak5FMQTryYKvEfe0hXB?=
 =?us-ascii?Q?XUWdC9H0E6WYQvAfpybbieQV8ADPgrO9dwCDNveHg1HBbmIVrw9zDZ4EnJag?=
 =?us-ascii?Q?HoacfP8EJrrLf2Ak0fupbCITh6AzaDT6g/5YrOgQuUuTvQwCsOjrw6AW7rLm?=
 =?us-ascii?Q?RJP0BtXmZQN4g5i32bHmlqoQHB7SJlIsCIXMLykW2QRL8Hx3f/tbx5Q+lluy?=
 =?us-ascii?Q?3ADfQMVO3xkDC/gRD2djqwR6u0Sz+7AsXexXxJveImVjzpd1VPaYdGlzSvqm?=
 =?us-ascii?Q?/uGzVwI+ZSh8MdVjITUXRSzcyzBckuhzPGlUjDOIicMYbNESaKNrrKjnHccD?=
 =?us-ascii?Q?kO11mu7+X4W9+xqe2LNfZoptvfZJfnhuJzU3ZfKAECJsazcI1K2uczMueqZt?=
 =?us-ascii?Q?blvXmFQGtu6bQZDRpP7iLTGqGUjux6HKnVHKTnkrgQemX8F3eY7mKMqXhnHg?=
 =?us-ascii?Q?u4hiYJ3UYeamf46Zo7ZRdgxMKwaV7eFRDxu72O5R45sJDFzXHOiu7P4SIOvd?=
 =?us-ascii?Q?Ww4e8Tsy7zBo6WNYXqyQ558YZGKP9OXUBkiGRkmBG8jyeHl4zjQJbpnwxiwO?=
 =?us-ascii?Q?tGLG4wN9fY7lP+9qto+EE1zX1+cQyDrDFX9BcYU60DDWrxqNpixDxWEcxLTA?=
 =?us-ascii?Q?DeS6QxqhTNaTVaqCDv35dyVH2oPoD4UyePJ5RqOuqA6tajsck7h1BBKvfynC?=
 =?us-ascii?Q?dFPud+kqm7vngbRIEkmRy/PzVYc6mENYCLCxujF4hPBA+F/Ub6KXU6Ol5BzB?=
 =?us-ascii?Q?sLzZsrK8feQdFcztXAsB+wuS2yhGmb4QVjxaceM916K8cOjhG0R9EH6ByFG9?=
 =?us-ascii?Q?xfmO9YcN9PdBYia4PJMq08ENnmHRBxYoMPxEg1Hsmz600B5gXyVxOJY96d8B?=
 =?us-ascii?Q?a6VsC1walrDn73FDSZ6NQdCYRT0Y9fd9s6kxzLnNE6mADb/NYrog6FIjMo+i?=
 =?us-ascii?Q?y/C2WihsZOQk1p/NQ3OHb/+yT8pBVZBnyUVYB7LTR3OFUFMe7kkT9e3Zk88U?=
 =?us-ascii?Q?Fz6L3fI7NX+8JNPlzBBtmpSY3eOJevGC/PraJxDQXhfZ/cdyns9+Z+GhFd8x?=
 =?us-ascii?Q?74sLipKxzBc0KUBNBTnGTXG4dzuORMcyqWFjgHuqSqQl7mK5Lujqf0QvkY71?=
 =?us-ascii?Q?4znUFaLgH5hP6dMXNCf7ZoxhFi3lMvdOfhQBwYBiG/l/WQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W22woXSqdOQ2eGgHPQMVf4KmmECrHtl1CPmV0AsCyZBme+zgLY8hfrQObtru?=
 =?us-ascii?Q?dI+HggQH6ZTO7A7g5IEJGYsbMSkZCxEuYVHXfOGzYHLkf/VovHV+uZLsTCJp?=
 =?us-ascii?Q?CzVXOp4sSxlHJENl1Ong+p/Bk9X3TUVnwkovcnKHgPOKiyO+mTYqmKA/+ClP?=
 =?us-ascii?Q?PpQyn+OD968eNBX0Fs+IeMYuSgU5JE4M3pglzeSuGe9MpFPQDtcPh6aGN3o8?=
 =?us-ascii?Q?EDC9KqvFoJCcIEjF7/kyyFOjWEW6g7frOMBGTblaZ51gCdHhaDQMcMzssUTi?=
 =?us-ascii?Q?HU0NjXmjvzXmxZGi8JCaV+IvPkNPJDDXxwk5jQRo57zUvxWoQAVt9rb8leus?=
 =?us-ascii?Q?ociWXOPdCy8B3nALWDBfEQHRhsMIelkAj+MiU3TChbGDkPtC6N+WWcQrKNMM?=
 =?us-ascii?Q?XvjWHmaHpBEnZC5QMl9WmVsT4aOKSCqUqFybewEtexLCCimOhmpRsPZgnEbu?=
 =?us-ascii?Q?GxMgGSvyaTJDg/m2+TxWqG1slbRhtwBDVGy9FVlq6hOpsVeKglqUm2X4AoQW?=
 =?us-ascii?Q?opSBBzsVlXRV98ZRossD7equb5/8QuPS6XiHySLp8IyBCQrI1vHttfRsDGZO?=
 =?us-ascii?Q?D22Ifj2tMhD7uPfaiQd7zmCfOv0SShntAZJCDi9NCePriMbPHPbOu6LJW3ku?=
 =?us-ascii?Q?nH8c3pw2zX/82yNj2+l4WWiAYb+3ceqITublcySTuNJ4CMQNf3yM+6/HzLFG?=
 =?us-ascii?Q?tuMd1vgsemncbBbttqLL/Dbz49CFIaJfxiwKiiuKdUiw86rYLqMaNdXNsbmw?=
 =?us-ascii?Q?llkiRrvgdjSXIGy90BI3aRUrUB7L2gufJxwSRCP+QzRHpva8suS/q8t2hl//?=
 =?us-ascii?Q?pB53HD+DZcXp6HM/4zdjGV1e5DknjSstmFFN16SSjqrQz8I0FAfZhiIWC97Z?=
 =?us-ascii?Q?szLyFXt4U/kA09a7Mxpw++esdyfjsP1Z7YWaXe/3Mrp9dYVSzr1M72xGSJmf?=
 =?us-ascii?Q?eRUS28NlMbHCCXadbb8SrCELoBd1efuGg9skxH+TaqZ9buu25JrJDjZeDzFy?=
 =?us-ascii?Q?Qfo8aRzCx4tte3PB4hSWax6gngyUa56vYSuuEFnrP+GDj/IUU9viPXtDpIJZ?=
 =?us-ascii?Q?HRUHQJCyAv+Ub4GzjUotouydGRgwN81SyQ0yhI8e7mxHw2hUGuHHglsiKg+e?=
 =?us-ascii?Q?xmiDabAoHGyse4qM1Upc/KJb+nrxrIBDb7xDAgxsenm1N1tavqNlKBp+NYty?=
 =?us-ascii?Q?gwDEJtPy7c3yFBniR0tHV5FY4ADgmTlIAn33ugZLcCk8yIcOl6jx0Sm+7JyY?=
 =?us-ascii?Q?/QaD3oojOc95XHqyIiRvSOzfMUtdJGWAiP9HqOGFRsMh+ChTWLwMv1x0ssAH?=
 =?us-ascii?Q?haWzTcOvPLiDNV/5HnCO+f88/VbLfita9h6eNdndGBti5Slv8JYs9qZvgExq?=
 =?us-ascii?Q?ZnjgU794+1cpqZObbm4UXBa9Fxbvnu0oj3exMZ/rRedZA6LfJgQ0Rzsl59Tq?=
 =?us-ascii?Q?BcODYGNig7cCDmUUwZ023YQGJLXpEUF45Q2FaRcUGOtvWy4RDtpNzdsJo9Da?=
 =?us-ascii?Q?gBa8Dc3r0X07xJKhFZFw9cWXs2jW+wIcecEij/wwXB3An4+q57FCRzHM25I8?=
 =?us-ascii?Q?g+5lY/RQwD4YbfFNHRZjYrPY2S6uzuhPeUjPEvd9VcBPxngeQfOaofCbSWNt?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e37be9e-386f-4bde-39c5-08dd1a3b9b60
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 23:29:07.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GbR2+p4W4ffYT1oiF9tMdwdlfnP2csS7KHK1fNCIre3gVKAN1Q5dMhUhlzO3m8ufsfN9mqfGXuu8U4GaPUGQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

On Wed, Dec 11, 2024 at 01:58:08PM -0600, Lucas De Marchi wrote:
> On Wed, Dec 11, 2024 at 01:13:49PM -0500, Rodrigo Vivi wrote:
> > On Tue, Dec 10, 2024 at 07:35:06PM +0200, Ilia Levi wrote:
> > > The irq.enabled flag was protected by a spin lock (irq.lock).
> > > By making it atomic we no longer need to wait for the spin lock in
> > > irq handlers. This will become especially useful for MSI-X irq
> > > handlers to prevent lock contention between different interrupts.
> > > 
> > > Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > pushing soon to drm-xe-next. Thanks for the patch
> > 
> 
> I just saw the commit in the tree and was wondering... why exactly do we
> need that flag checked in the irq handlers?  why can't we simply do
> a) turn off irq
> b) synchronize_irq()
> 
> kind of like xe_irq_suspend() is doing, but in the opposite order. It
> seems this was just copy-pasted over and over or am I missing a
> synchronization here?

A very good question. We likely don't need that check there.
Ilia, perhaps you could give it a try along with your upcoming MSX IRQ
series?

> 
> Lucas De Marchi
