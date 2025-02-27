Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F5EC021B8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 00:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5050110E0B1;
	Thu, 27 Feb 2025 00:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9fvP6PD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69E10E0B1
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740615720; x=1772151720;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qVGdxY9UxsQHitoHZioiQBUAaOEqpLdVuoB3hEvOZlc=;
 b=L9fvP6PDUzueJQcwZqFOQlJmORF7oDDUrYnixpaEqMod6Zo8IUNtGUfe
 Pv8mxXiAM91ZRxTEc4oXN7V3JOwvDRxWZA8UN6gplebKA7SN3HdOg5yIi
 GHj5h5++ih7H/yUuzkmYi+L3YDoTnF0oOgDoPijQtnQYJC3XUExZRsN8C
 Zy8xLnLLce/7rVriO6mMLquVsB4acBnmMWAlACH+A5hqegzkuu1zeD7ZX
 TChjfcf66c2bKFe7SLOfVucK2kFt6SppJ9QCLXW9YPDSORIysdKQmfmVP
 YzRFvef84fJrXvWe1o+bllp+S76OAHRDVWagJu6k2VBR42suslcZfVMiy A==;
X-CSE-ConnectionGUID: 0fMrDcPfQ5CJaQ1XuIB38A==
X-CSE-MsgGUID: MCc+s8MvT7aqFR4sow1kcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52125930"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="52125930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 16:21:59 -0800
X-CSE-ConnectionGUID: feZmloxuQvesRW/6I/WFng==
X-CSE-MsgGUID: UtMpGAV6TMSyLLAMwkyvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="140090280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 16:21:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 16:21:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 16:21:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 16:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZErJXdhUxk8nR2fwZsnJGqx4YawUl/fGUeaNmaYh9TaBMvT4kBXhyu2eoTvzaTucthdDIB/Fc+Ly4G1RGjfNc2ZgJ6lWj3i/AT/ycWqiOJoMqG+mwzywHpTZiSpPJ9nEBjJHtdkQAXWW6TIIhjKSSuy1IpZSKjC0YogW+Cj6N4xQgOUGtANaEjm+O4BO63SNQf+DZVv1YzMTekvmLQaUDEdSyYv18AQBazqpmIR34ouBoawIYFU/zkj1s5o3kOdj7sEcKZjs0TVkEfthkQdH8i4mzl0StET93SLaX1wZSG92l/7GBj/mwMctDV1BWkyQXlgkDicqPoupjzuivh0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV+9joTtw8nyvAg+915vE24IMG8BdbERCm8UboJpYzk=;
 b=PRdW1MLDcGntVLXygWBKaSxcYnjsn+zoat+NLb9VuZPqRbuRHAFOj7UNrQEVQYhsi8mb/TTdQLcD7Ov5ajyDOCAi08wds1fP2zaxAPOJybr3lZz0kbFhPl5WJjDbzjpWR0VhPsfC7ZySc9w/2D3nsaWeKBwWGf0rV/AoLdqdmDC2AbXzXQIMFq5ombXpyMjJ8C7LCqmnT1XaXRkwkWgqAOJlNsvXrQuNHeEBajf5oWPI9erA3QPyqsE/zPvRspVeO9dtAKiQeLiFi418Se+14NhNCMoqWimZuzF1EmYR8r4SS8/YkpzD4gl99cwUeWkue1waKypST+8ndtzEjtawLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Thu, 27 Feb 2025 00:21:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 00:21:37 +0000
Date: Wed, 26 Feb 2025 16:22:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Message-ID: <Z7+wUZNmzjKjT1mp@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-3-oak.zeng@intel.com>
 <Z74/7JpxfZf5LIQN@lstrano-desk.jf.intel.com>
 <MN2PR11MB47288A74BEB2EA729C1A45A092C22@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MN2PR11MB47288A74BEB2EA729C1A45A092C22@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c799d15-3823-46f5-afad-08dd56c4b2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UW9mhd2fXF9vJM9K82lDTePnLeZxXRMXWxKlZ/lnYoymT8+da2ZY1oRkUohc?=
 =?us-ascii?Q?0mqU/FbMiGSF3SKM6QlBXZO0Mq3CAn8BFziHF7LBFSM+ZiZW8dKaT2PCyhvg?=
 =?us-ascii?Q?l5B4oLyleEd+LOl3LeAeEu6MfOMse7/0P4xuF0Q7/kCtbqzwHlWWcwtJikH3?=
 =?us-ascii?Q?FaSWQmToJLDQR0C/xI0vN1RGW/m0T2rJ5EF8sRXVttmaYg6cl5xlJkjcVUGf?=
 =?us-ascii?Q?26CJELSY1uowPbPLEy9YS4OOA1QvTUEHvd99Dv+XuZWi3ImVbCX4gb3rQPv4?=
 =?us-ascii?Q?L6Wjxj+jw/fvYx43rXv0WFkJsX279kTPM+dseqxiQeIDWVzIbjGw7KAJHYbq?=
 =?us-ascii?Q?nDcGdhy0NdW9HVOo2zTG/NWBYgnTcK2J12MYE8sCetIxmG+lWKbTnBuAs/hP?=
 =?us-ascii?Q?GLG41Zk/mKktbNFMRZejnBi3BFa9xnh2XylinoPYjjm1jqLcxCLTsFigM/J9?=
 =?us-ascii?Q?2E3olV1CuKHY54G5V41kpjlZb0kz9DxrQ20YaCgOLJvsr0L6Rt6IwNRNdUGs?=
 =?us-ascii?Q?0K8Cae89RDIPIQt7hm9SjeF+zKD87AuNBVcH6Dw9vgCf/uFhQtIxvn+3t/0z?=
 =?us-ascii?Q?p+i1Gs/tSUrxBKP7N1/JanhOiidkCabb12ZbUqNtgmI41cHcotNTMxhq8OW1?=
 =?us-ascii?Q?ce9AZICHLKYoSXKwZQt1O5wvfH7SGsg6f0l16PKqKykkG53oe5nMdGqAUEA1?=
 =?us-ascii?Q?Uik7Fe+v7pY8MzS9mAvVnMQQcMxU4xZU/CQO+fQUPze9ljpx/vGMiTh038Ad?=
 =?us-ascii?Q?38ukytZfXKuOfk6QUzt/gYJ22/m19yLktUZ3RP8BhBChSTbMoX3oDgY6QrrB?=
 =?us-ascii?Q?LcxNe8k6o6KAfEB/9TU0IALGhX61+g5OdoZceMyYEwpjOY9E5XAuCfwW+G23?=
 =?us-ascii?Q?oe6Al8N3iWh/IWfP37nz+LFH1t3BNT6kdg3Gv6LtUASvH+L7ZuYVqp9TL8c7?=
 =?us-ascii?Q?hzZTp29Xeqo+kXpKEl4YhZu4Rk6a9tBlWKH1EKHndIptqpRxtcBO/DIvqvSt?=
 =?us-ascii?Q?ZqZEjNqu1Xnoyb9zXb9HdKQoU7Sily8qaKyCEQjzz++sFsn8eVv4uAP2RFBT?=
 =?us-ascii?Q?WJ08ouElS19UF02xY/qR72kfJUFcA4lPoUH2mv8DEpNW7PPIhDjXpV6TsE0Z?=
 =?us-ascii?Q?fJz/TjvlP0FHOS71EyHxnt5CTsygG2rO27HzwftH04wgJhc1akninJgSKqen?=
 =?us-ascii?Q?nC+47iK3J4qsKBSjdQF+l+tYmU+SQQDWyzPI3Y8PnjsUlvNa+4nWRUwVC9tS?=
 =?us-ascii?Q?i7qlQe7XzZvXspqGgjN+wJK0rR6cvNpSmDzX1DG24vsq0qj+OkQ6vQh3BdZ2?=
 =?us-ascii?Q?lsdLuxXquvTURZjyooVgq8wn5LlkLJlIVwJNCPDLgy9oKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sNgjHvGA4A5xLTN4pBQ2kVO0MfqJaRsbG+VJe3mlllbP85L7W4oPQdMlPJfH?=
 =?us-ascii?Q?v7SKNri/8xAlubk1ez4Z7s9LT0StYxoUUoJ9byeaOJWmeyvjnn7bw0x0w861?=
 =?us-ascii?Q?iQdkJ9gUWYcoVl3FvjO5DK9PvuM5drJsFj9kuyUlvI9MhVjz7Yjzd9Zu2Msg?=
 =?us-ascii?Q?0uxDF+Eof+4OWXSKZoL7jIkJEAfSndxh0iwH5Ibw1uFM8T4DVtFuOkWcPO/I?=
 =?us-ascii?Q?w3uqDfBdUXp7jbZ8VvaopaOrMXP8t0NT4Pr/O3Y/2VmIwS9VJax+5o951AJb?=
 =?us-ascii?Q?YkwT4Jnva8+8Eb0NIwWP6RHLlXZHfFnkUAdVpSgBuVbCSXdF6MHFVgT225XP?=
 =?us-ascii?Q?ptswnKrWR/jVD5LrPSWXQF3zIwqiFeYrqF39DgKJoOt9vs9MEb3KF04Xl1tp?=
 =?us-ascii?Q?QzinsSiTOvpAxh2S9GZqCkgD1jtNGlHIRRn5Hak3noSOVXfP8zWTnKZ7knxn?=
 =?us-ascii?Q?AQ5JUJckhfvPSbrL8vvaVx1Tqv/9uZYYM1tfVkjJ/HdnPCleu1YoQYD87//n?=
 =?us-ascii?Q?o4tt/IpiR2zhhcQJ7Hr0kUb9VAjSnbGNMHX646L5xQpQY3caV8dUB1EBRqfj?=
 =?us-ascii?Q?OWGvLsuhBYQnsNES1dojkUcXud/2P6CLEIZwCnCO7LYervUrxXXx/FVZhF4L?=
 =?us-ascii?Q?XIdd79WEKuq0Ml+Cn6E3TiNcvYdPadbVxmUvOkUl5I+9vDFdmgCV/voQAnvu?=
 =?us-ascii?Q?Utwh7/tyBnFb47uVTKVfFREgfDJWQEUU9rpM1nVfG9iqlIHXuL1eAZFTEU+x?=
 =?us-ascii?Q?50E0Fi6xVXNFqEZoE0Nsi9iYEl5zGdDVA2k3ZF/tcJRsBNwBoKPnZtFvMti8?=
 =?us-ascii?Q?qwebNiemu4WIhNdm49A3N/1MSR2QMCepwyYmTjeOOLe2QyjPcA4p/nXGi+FV?=
 =?us-ascii?Q?VJEl8+gOxNzNvVCmoz8+Upne12YbtlKMiPTQFxOab6KRxy+1NZpEFUj8RMg9?=
 =?us-ascii?Q?f+E9xWxS8z4ryVrMd/7HIm22jWvs8m8rrwe339YfoNjefItP4Ah2GhIUVaZV?=
 =?us-ascii?Q?v0+n+yGOwTt6RSvl/JiBmD4mNU4Q733eevZz4RBpMKOqZtrKj4frEYow6Sh3?=
 =?us-ascii?Q?aGHZIG8CQHYxufEYiFKT0Vtoh/ujye5+oy9dnPmc25j/5famTty3aJiI9VZC?=
 =?us-ascii?Q?oNt+x6FiCLwOEx/FujCTYs4Sbxnp8ZqL0XD6vIib9k9O2zd3vvXsE9/ubNY4?=
 =?us-ascii?Q?EkgB+CkqaPcJdAchWkHZWtAF/qJTg2t1pRTP4anQCWDddPuWvVpgEae2FbNg?=
 =?us-ascii?Q?Gim/7jIwOjN1SviZx8VVbbCP7tkkyzDVjKzFaFEyFoWfji8TXBgV9i4U7o+8?=
 =?us-ascii?Q?4BY/ApWOelJZ1V3vgky6Ha2P5ZxU/bWFzSiMmpbk9+AbawL7wirtZcK/bQ1o?=
 =?us-ascii?Q?CMn8BMe+0qmP63owB58kw7h+OlqpbgEi2U9Fy214H2fn4KNN8B+IC6DUOWf6?=
 =?us-ascii?Q?GUIWb7SXLykqPUKkh+EWeRrxFgrZLgQiSFyUyVGLgIKJtRuhBynvThwxGbFV?=
 =?us-ascii?Q?kDoVUKFMyTE82CTtF1hXddorlXzmC7w+nlBtPwodRK+rn7s2NUBgbg39FiIQ?=
 =?us-ascii?Q?9kGVC8aPVksntKrBc295isDR83LbcogIeYLvZnns8UpWbh6MsqEv8nBI0dcj?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c799d15-3823-46f5-afad-08dd56c4b2c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 00:21:37.0862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxJMEd4zYgZHFMfkX79pIohwNrK3bTbBOhkJ8b9Qno+0iMV3zu8apx+/XBQPamDVT9engSfLAhvTRWcr7xkYCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

On Wed, Feb 26, 2025 at 03:12:14PM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: February 25, 2025 5:11 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org;
> > Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault
> > mode for certain platform
> > 
> > On Wed, Feb 12, 2025 at 09:23:31PM -0500, Oak Zeng wrote:
> > 
> > I replied to the wrong versions... Please generate the patches with:
> > 
> > git format-patch -v<n>
> > 
> > Where <n> is the version number. This will help avoiding replying to
> > the
> > wrong patch.
> > 
> > Copy / pasting my reply here...
> > 
> > > Normally scratch page is not allowed when a vm is operate under
> > page
> > > fault mode, i.e., in the existing codes,
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> > > and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual
> > exclusive. The reason
> > > is fault mode relies on recoverable page to work, while scratch page
> > > can mute recoverable page fault.
> > >
> > > On xe2 and xe3, out of bound prefetch can cause page fault and
> > further
> > > system hang because xekmd can't resolve such page fault. SYCL and
> > OCL
> > > language runtime requires out of bound prefetch to be silently
> > dropped
> > > without causing any functional problem, thus the existing behavior
> > > doesn't meet language runtime requirement.
> > >
> > > At the same time, HW prefetching can cause page fault interrupt.
> > Due to
> > > page fault interrupt overhead (i.e., need Guc and KMD involved to
> > fix
> > > the page fault), HW prefetching can be slowed by many orders of
> > magnitude.
> > >
> > > Fix those problems by allowing scratch page under fault mode for
> > xe2 and
> > > xe3. With scratch page in place, HW prefetching could always hit
> > scratch
> > > page instead of causing interrupt.
> > >
> > > A side effect is, scratch page could hide application program error.
> > > Application out of bound accesses are hided by scratch page
> > mapping,
> > > instead of get reported to user.
> > >
> > 
> > I'd include the IGT information in the cover letter, not the patch.
> > 
> > > igt test: https://patchwork.freedesktop.org/series/144334/. Test
> > result on
> > > BMG:
> > >
> > > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> > public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> > > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > > Using IGT_SRANDOM=1738684805 for randomisation
> > > Opened device: /dev/dri/card0
> > > Starting subtest: scratch-fault
> > > Subtest scratch-fault: SUCCESS (0.080s)
> > >
> > > Without this series, the test result is:
> > >
> > > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> > public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> > > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > > Using IGT_SRANDOM=1738686046 for randomisation
> > > Opened device: /dev/dri/card0
> > > Starting subtest: scratch-fault
> > > (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure
> > function test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> > > (xe_exec_fault_mode:5047) CRITICAL: Failed assertion:
> > __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull,
> > exec_queues[i % n_exec_queues], &timeout) == 0
> > > (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> > > (xe_exec_fault_mode:5047) CRITICAL: error: -62 != 0
> > > Stack trace:
> > >   #0 ../lib/igt_core.c:2266 __igt_fail_assert()
> > >   #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
> > >   #2 ../tests/intel/xe_exec_fault_mode.c:537
> > __igt_unique____real_main407()
> > >   #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
> > >   #4 ../sysdeps/nptl/libc_start_call_main.h:74
> > __libc_start_call_main()
> > >   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> > >   #6 [_start+0x2e]
> > > Subtest scratch-fault failed.
> > >
> > > v2: Refine commit message (Thomas)
> > >
> > > v3: Move the scratch page flag check to after scratch page wa
> > (Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 813d893d9b63..c2dfd0ade403 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1766,7 +1766,8 @@ int xe_vm_create_ioctl(struct drm_device
> > *dev, void *data,
> > >  		return -EINVAL;
> > >
> > >  	if (XE_IOCTL_DBG(xe, args->flags &
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > > -			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > > +			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> > > +			 !(NEEDS_SCRATCH(xe))))
> > 
> > Same comment as patch #1, I'd drop this macro.
> > 
> > Do we need a query uAPI so the UMD can test upon process open if
> > the VM
> > supports scratch page + faults?
> 
> Introducing a query API seems a little overkill to me. 
> 

This is really a question for the level0 UMD I suppose, I'd follow up
there. They have asked for a query uAPI for other seemly simple things
before.

Matt

> Maybe I can add a little comment in the xe_drm.h, saying scratch and fault
> Flags are normally mutual exclusive except on xe2/3?
> 
> 
> Or should we just not restrict VM
> > scratch page + faults ever and have it choose based on platform
> > recommnedation?
> > 
> 
> I think having above checking/restriction is still helpful.
> 
> Oak
> 
> > Matt
> > 
> > >  		return -EINVAL;
> > >
> > >  	if (XE_IOCTL_DBG(xe, !(args->flags &
> > DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> > > --
> > > 2.26.3
> > >
