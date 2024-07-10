Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA67C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 16:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2A10E83E;
	Wed, 10 Jul 2024 16:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1efuNz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677C10E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720629891; x=1752165891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nkk2gBJaiKKRJGQxMI7/wFsjIJm4622EdWmOFcLhjqw=;
 b=T1efuNz/D8yufZRLOKoTZ0hIjn3JN6YPMe7jg5XMvk6DwZ/o0gwDl6//
 S5uBptBN4JhWHFG9pXPNQNMZpODaygVVskYIWvI31nfaGIkDBuesdFXIh
 V/2n6vCr9wsxj0cPUHa7OqnPVz44+3Es9xpVNfb4jiejaorT+Tdz1CRyu
 jED1nLWnHQINkkwCO5LtX7/uFwdUeCU31UbXEuC6T173NJqv206pGxFsK
 LljdgYRhmgdZVcm4PdHNUZ8WypqeFHYkS/YxfuDQqhArHP7u2+nTb7b/G
 eS2ejUP9hQxECLptgB3NMX0BcuedLyucTiJRWKMajdswubxHFPFydYP8j g==;
X-CSE-ConnectionGUID: P5LaVb/PTuWhvzw9oqFBow==
X-CSE-MsgGUID: dnR86Rz2S5OHCkNqo1zv8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28572126"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28572126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 09:44:48 -0700
X-CSE-ConnectionGUID: ITbzvXaKRWqlRHj/efEXpw==
X-CSE-MsgGUID: MDDIBdl2Ri+yagDgxj4Icw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48146990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 09:44:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:44:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:44:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 09:44:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 09:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNRRnhdysROwRatyAcdbXHzNxpQ8AH9JyDDBBh0xUPKyPVCPjH5BbEQUWJ2KY+NRk6xS8M6XNUSDqfFLQs3lme3FkObVkq1l63djmBfcxiSiS0J5DaZC9lf4JK7EEGRwqJGLpQc303lTBNhe3OFOf1cLhib6y2YRVdT3/igQHmTUjoKSEb79Jlhuy7qDXnHQ0tVwcF6P6W6JEYk4P467eBHY63VzYtCxcCZsoYEn/0BoZL7LMo/2AqMkpDqC2XVcGkbPIKSiicr3s1lf/X7sHEfC7YUWylZoWFlX68pItlW5vscEOHyAr9o8676y21G9URz6DzzieIi4Xs73iVkJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Q3alViRc9exvdZCQGMtUSZnlLT3vRgVLFZQv+XNHY=;
 b=VLj+jt6Vb3KDQ1R/Xz/Akf+hSbrEfozWf9ELIc8jEmPAPIjyh2L4RcQNsxeEYPtAdH4mvmfbhs4ya+xhQnPexFVSANCRWlsIEVI3lX/lNqr9aW8f5J4NUR+ejt4ZK8OMTFJ8YSsXfU0SLzt5zinkjpnRCwAEU6ZRfsSvq/uZWyvUbEqeYtOCBkXQINja67eVO5NwJ4QpCZ41o+7E10lQVHbDfFOgnItmhREnCDjuXRIHP8OOXGlyTdGOWr6ZNUIqug9SGM0SEgzOQoORuA1sUZcEj+Amh/VsvHXyDYdCagbC2uI7bFskKAiycyfOVduip9fI7JNveac+0Pofh0LxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 16:44:42 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 16:44:42 +0000
Date: Wed, 10 Jul 2024 09:44:39 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 7/8] drm/xe: msix support preparations - enable memirq
Message-ID: <Zo66d5199BXpCJ2z@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-8-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-8-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d424c3d-b590-407b-1a47-08dca0ff98cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SP83Lwd+MWgBeTbNwHHtFsyG00bYPRZg+vby00W9Dy+5uHmdETpSE0tCk9zI?=
 =?us-ascii?Q?UdC2NophVUOyNt/5LZGlO8qgN7WOTzGO4W4tCw6D6Wq6X1flXqEJcPwcnvaC?=
 =?us-ascii?Q?Jh9JLkU3Z7F8dtVitW3qyePspndOvv4XYe2zPPyrc+xbqgj7HvkBlIIfimNc?=
 =?us-ascii?Q?UL/IzFvpN2GaRVQ4G/Xle2cW6+bETX8WrbHCZ5HYkeH7MNxnJbXHzqsZDtRP?=
 =?us-ascii?Q?kx5lK3oH85kW85p7MRIxc2ur/8nfITk/bcacUf1OLjK+AMnZ0/8zEhKSl3kB?=
 =?us-ascii?Q?xCYzfYwYXK9KHrDRLjyxdJ4YtIAA24eCqMYSh/PJQLEt+3QsulSRjQEsyVjF?=
 =?us-ascii?Q?y36BKSgNMzbEZWj2B5Mf25f7ZH933YThFs8DsZud4HuI92OV1o1QJ9xlG4Zg?=
 =?us-ascii?Q?9PF3f73E7pr2MvPCtXqb4+9A+T62KETpl1/3AUhabxU6/m5XCLUggAPN2Uqr?=
 =?us-ascii?Q?VlZeQ7UufUrQJXOiRTC/RlIZ8c+VGmCOyLh+Mje4VA7d8Fm+buiMNtxTo438?=
 =?us-ascii?Q?jP6gdLeTnHxvtvNymWGHNOIDDg1bEexxhTS2wuo4Tix6vX6XBYu8ewnVU0yI?=
 =?us-ascii?Q?txkK+0/qUXbXy77N1MR/oeFJ8mVP30Am84jNOIk9viNvxcvs5y5HUlW4YbHk?=
 =?us-ascii?Q?1jZnhPPvQZbQuGQNhaX69tW+geYg1FQ23W90G/pgXfM0mspmCLN3XmyeJTXu?=
 =?us-ascii?Q?5yWPEaiEaZHBieJIwVS1OIPa1foafS6hFrxczBEAZFZCHUSOx1p5RDDqIo5C?=
 =?us-ascii?Q?Wlj6SXzwWWIuta3TO8j5Z55rbFrimSVsJZs1sAteCpaa/1TBv4APR9JZKPVV?=
 =?us-ascii?Q?ALyS661x2r8ilUycZhxjO4IjCAF+uRSzqfez4D5dGo/S0AlBHaqCOzZG3rje?=
 =?us-ascii?Q?F2J64Zj7Rw7LD7v4AYNxd3UPJJOenAKMDBMsZ1x1rxAXofG+uqAypqhyuarF?=
 =?us-ascii?Q?6c/m+3MrZLk2v2GObO197ziZdEQa4sPLf4phnF5Jr8/sGBtPjErAIHTPep8M?=
 =?us-ascii?Q?v0TFTEqaBKrHu0Zbsx5myo6s1AnerxuMUQVyvGBMbsFrHgMuSdmxoriJOtJL?=
 =?us-ascii?Q?3i/j/lRdOXW/JFWRHnakZDgnZfjU5Ya3nPb4DR1esbLV0+mF7knmHrOufsxC?=
 =?us-ascii?Q?XPfGaG2fOIdhSGOQMGXwex65CYT1Ahmu/n38QJytj8ClWxELWVYRNibkRtQt?=
 =?us-ascii?Q?Yubw4Z9VCuivBB5jM4ylUJq6163azwicM4I2s84vB6kBz1peW32RvUf0N8HG?=
 =?us-ascii?Q?zr0DdiFa7C0pgAbhRK7V31rscBPHOD1v4zdjex47ZbqkCG5VJlOFLWm8Vx+A?=
 =?us-ascii?Q?zD1bJZb8+q/ZoMapubAV7oPY7ZKWh1DbKnLDE8fYvbc0wQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q4ZVUhSjEm6wiQLYYUvhKZL7NUy3kmdU3tAVWA4pSEEgJnXM28m2GUSQdned?=
 =?us-ascii?Q?VDAxtiUY8sQ1OsF4v/8XG2tKJ0vqlV00/7zAWqcRvXiK5oXfbSBriCy+BFcb?=
 =?us-ascii?Q?62nUHgoGitLu+mFDPZP5i5pIZU+f7jJxo2HFv2oIxCmkvnVomyIP1/5/QWEh?=
 =?us-ascii?Q?4bi//nOL7mrAuW6UzsUmHwGLYuVXWwSMZr7VYA9nu7PHSYYc9q3Li+p2JZuO?=
 =?us-ascii?Q?IrLNxl/yHXIhEWdvxciYxJ2YMhs29k+4EzSTzn2Qy2ustATtRVuRcLzGdM9v?=
 =?us-ascii?Q?/bY/IkDUBp5EqqgE0Qj5sz/Uv4LfPCsa79rSGIpSLJPh/I4eLdriMSqf5j5R?=
 =?us-ascii?Q?0Pw3gc7uX1SiJ0gHcMlRUkeJLobN+nEJASMYnUBPIFKea65PIp9WdBFH+VDx?=
 =?us-ascii?Q?62FYzCUuzs5J/FSZt7Z1o4GrAbrWFkmyITx1kU+O8enGPYxY1twmnEW5Cuuy?=
 =?us-ascii?Q?33LuCkfbgDbVtZfIN7Qw5LitB67J9yP1u97EMClayMfV9tOEuPfj3kwPRam7?=
 =?us-ascii?Q?s1d31ms17xlKiuadq5vLRvQKHiWpiXp6yHRosDTEgvsW7EJmtPtmcuBcczV9?=
 =?us-ascii?Q?i8Wy1C2qOTlNHRTXY+C4Tmo8czz8xYWCKy68pjFWPDVzNMo4rVGGmVASvJdN?=
 =?us-ascii?Q?4cw6i1gaVf7OPvxhGnotk9lD5RQ6XZF+YDWn8cltyQlSFGE3gqjRKG8Pb+Wn?=
 =?us-ascii?Q?1scdRAGNsWaN5TSOdL0zZxjccgP+qoPX6f0j6oCiY7nofsSPbWPkUMRMkMWy?=
 =?us-ascii?Q?d+2cOWppeC2uWbd+yvAM3LMBZ++d7NcBnlUH2TmSu/Ox2DnrxJs9Pp7Kn7m1?=
 =?us-ascii?Q?S8tLFkXIUY4Tt/ek7aJ3L1FY0qWBMy2QhIDUhn6dKsnUvBDE8bdkGIPiKggg?=
 =?us-ascii?Q?9xYkWImOfds+GL52ZTkTvwfvyArQ9mi0pbSDvUZVp39aEkjHG8MgrIaooBox?=
 =?us-ascii?Q?yZFe0bW+26hzN3PYJ5qGcMnHgHkB4unji277uD2WmtGqZLmSP4v0CgKuBUJS?=
 =?us-ascii?Q?vHClILRHl0cU9jK9B0KD0UjNSpbYhTOMzCQbSfqPHpDHsb+WpNxQKTDIj9C1?=
 =?us-ascii?Q?kr7aQhmO3FGagq7Kw/HhAJp6GqbFA0BLWaeRZpZOXSs6z1SVlvnt6tp6fgjL?=
 =?us-ascii?Q?sysQt1yiWgv4PcThYr7qKW4Ss+Gw5P5VWk7qUALGhdE4dMYRqdRiVGwIjFKo?=
 =?us-ascii?Q?3SxwQguLQ2dg+Tp+c+C4frfaKNDN7MBOiIlePYCZ2I6dnJIhMe6CF5s+w1Xv?=
 =?us-ascii?Q?d70qTjW8mJOFLec1zyrBNaqBkf2FEdpl1q+UIzQsveqje4PM7umFGDw9Px3J?=
 =?us-ascii?Q?Qs6cTGDBG3PlKrDVYTRxouzItrX4uP4sqH0AEbEZD7tyAai8JMHHQyCOohjq?=
 =?us-ascii?Q?LcI2uVv+vFuO8CqZwaK4l3kE43ITOhH4Hor75pVscE529ELHcXzUaIpENz77?=
 =?us-ascii?Q?bsHxF1Dnb+aK8nLnuOOaPJOmPXyENzzEUe8rwM/Dd8tbc6Um9nPGbpWU5MUY?=
 =?us-ascii?Q?Y8ZPXfeXa8wTpSiZf2Y8i5XPebKutbZO/hmiplnn6E54QDiH58nVEhsrWxH2?=
 =?us-ascii?Q?dJio9Kke13GyGEbSbsxg1Mvb6Bpy5qBG2hd2/UhG1SQHHvJwJfBPLJ8R6jJz?=
 =?us-ascii?Q?6Kv5KTDPHLWD8ZdSy3dzBtk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d424c3d-b590-407b-1a47-08dca0ff98cd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 16:44:42.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKP/Ytc0IXQqgzMpJc0bVYVDOtaRI8CtmZc0rzG5tMd4Woe7P2c1AV4MhljzLHUY5aKNzM+t82t/PBZRCy36JqyCE5qoluc45u9n0xxlfB2RPHcB1Ugk9TkVHtnhAMW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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

On Thu, Jun 27, 2024 at 03:40:42PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>In order to configure the HW engines to use MSIX, we first need to
>enable memory based interrupts (memirq). Up until now only VF used
>memirq.
>
>Thus before enabling memirq, we need to test whether MSIX is enabled.
>For this purpose we move IRQ vectors allocation to an earlier entry
>point.
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device.c |  6 +++-
> drivers/gpu/drm/xe/xe_device.h | 12 ++++++++
> drivers/gpu/drm/xe/xe_irq.c    | 56 +++++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_irq.h    |  1 +
> 4 files changed, 53 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e4c7ecefa33d..1f5d40904927 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -591,6 +591,10 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>+	err = xe_irq_init(xe);
>+	if (err)
>+		return err;
>+
> 	for_each_tile(tile, xe, id) {
> 		if (IS_SRIOV_VF(xe)) {
> 			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>@@ -604,7 +608,7 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>-		if (IS_SRIOV_VF(xe)) {
>+		if (xe_device_needs_memirq(xe)) {
> 			err = xe_memirq_init(&tile->memirq);
> 			if (err)
> 				return err;
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index bb07f5669dbb..7b4f651652e9 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -9,6 +9,7 @@
> #include <drm/drm_util.h>
>
> #include "xe_device_types.h"
>+#include "xe_sriov.h"
>
> static inline struct xe_device *to_xe_device(const struct drm_device *dev)
> {
>@@ -154,6 +155,17 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
> 	return GRAPHICS_VERx100(xe) >= 1250;
> }
>
>+static inline bool xe_device_has_msix(struct xe_device *xe)
>+{
>+	return xe->irq.msix_enabled;
>+}
>+
>+static inline bool xe_device_needs_memirq(struct xe_device *xe)
>+{
>+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
>+		xe_device_has_memirq(xe);
>+}
>+
> u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>
> void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 3fdd297516ab..24e8445b2a76 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -559,19 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
> 	struct xe_tile *tile;
> 	unsigned int id;
>
>-	xe_assert(xe, IS_SRIOV_VF(xe));

As this function is still VF specific, we should probably not remove
this assert.

Niranjana

>-
>-	if (GRAPHICS_VERx100(xe) < 1210)
>-		xelp_intr_disable(xe);
>-	else
>+	if (GRAPHICS_VERx100(xe) >= 1210) {
> 		xe_assert(xe, xe_device_has_memirq(xe));
>-
>-	for_each_tile(tile, xe, id) {
>-		if (xe_device_has_memirq(xe))
>-			xe_memirq_reset(&tile->memirq);
>-		else
>-			gt_irq_reset(tile);
>+		return;
> 	}
>+
>+	xelp_intr_disable(xe);
>+
>+	for_each_tile(tile, xe, id)
>+		gt_irq_reset(tile);
> }
>
> static void xe_irq_reset(struct xe_device *xe)
>@@ -579,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
> 	struct xe_tile *tile;
> 	u8 id;
>
>+	if (xe_device_needs_memirq(xe)) {
>+		for_each_tile(tile, xe, id)
>+			xe_memirq_reset(&tile->memirq);
>+	}
>+
> 	if (IS_SRIOV_VF(xe))
> 		return vf_irq_reset(xe);
>
>@@ -606,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
>
> static void vf_irq_postinstall(struct xe_device *xe)
> {
>-	struct xe_tile *tile;
>-	unsigned int id;
>-
>-	for_each_tile(tile, xe, id)
>-		if (xe_device_has_memirq(xe))
>-			xe_memirq_postinstall(&tile->memirq);
>-
> 	if (GRAPHICS_VERx100(xe) < 1210)
> 		xelp_intr_enable(xe, true);
> 	else
>@@ -621,6 +615,17 @@ static void vf_irq_postinstall(struct xe_device *xe)
>
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>+	struct xe_tile *tile;
>+	unsigned int id;
>+
>+	if (!xe->info.gt_count)
>+		return;
>+
>+	if (xe_device_needs_memirq(xe)) {
>+		for_each_tile(tile, xe, id)
>+			xe_memirq_postinstall(&tile->memirq);
>+	}
>+
> 	if (IS_SRIOV_VF(xe))
> 		return vf_irq_postinstall(xe);
>
>@@ -731,7 +736,7 @@ static int xe_irq_msix_request(struct xe_device *xe)
> 	return 0;
> }
>
>-int xe_irq_install(struct xe_device *xe)
>+int xe_irq_init(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	unsigned int irq_flags = PCI_IRQ_MSIX;
>@@ -750,14 +755,23 @@ int xe_irq_install(struct xe_device *xe)
> 		return nvec;
> 	}
>
>-	xe_irq_reset(xe);
>-
> 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
> 	if (err < 0) {
> 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> 		return err;
> 	}
>
>+	xe->irq.num_of_interrupts = nvec;
>+
>+	return 0;
>+}
>+
>+int xe_irq_install(struct xe_device *xe)
>+{
>+	int err;
>+
>+	xe_irq_reset(xe);
>+
> 	if (xe->irq.msix_enabled)
> 		err = xe_irq_msix_request(xe);
> 	else
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 4ab63e61a062..428ec3eb484f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -12,6 +12,7 @@ struct xe_device;
> struct xe_tile;
> struct xe_gt;
>
>+int xe_irq_init(struct xe_device *xe);
> int xe_irq_install(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>-- 
>2.34.1
>
