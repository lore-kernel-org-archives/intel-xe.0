Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA043CD5BC0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 13:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646E310E273;
	Tue, 19 Sep 2023 13:35:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22CD10E273
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695130543; x=1726666543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mzjbyyDJhjag/03BIz2+QNKdh+EOQJoh4SVm9Khp2zc=;
 b=K/6b8tJydnmsuO789Uny26bme6jiKMMQbATtGD6vQw6DgialMDFVJi5C
 90+OWXKtWu+cWDTAEdSvMs94AB0VNYfS9TV7x1gbqG4FZxpft/CNipLYF
 PXxaTvN0mfH1DZdzCSziDpNtzT3rXW9nHRYnZARjWT9rU9rvEaSmIEFNd
 IaQ+ywkifaoIEFfpyrz18zhG1GWwUIA3CXdLcQXNdHyOtUbHY/S9qwhRm
 OBIwkqV6ehs2tkBEo6y8f509GGJXEfTvTX9UQJBf+A/qvSLpfW6WhVarY
 C73y0LqLNIrEPDlCYui0c1jZ4URP8SbjZKDs+j7Z2B/KsXixzZmYU8kvy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359333935"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359333935"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1076978432"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="1076978432"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 06:35:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 06:35:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 06:35:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 06:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDHQfuu8E1orSRNu+iVH3PZKDNsA6jgNcfsv4hTWgNldO0VpOuAQ/yB73OO1TR8rhfpTyez3g2b6+hGDS89fd8DfocoU3/yLow6UfQk73znp2m++J18xMkiUt4gSNKaPTJ+jADiaApbkoZWzBn63VBV28rXC5tSc+3S+5bt6r3YcHQ0ipekYNp9Sm2d55AumSQ9QvQP4J/RYM+xBLY8AHRr0KxXI5IIMw90jVri0mTxReW4DWIHNTJ19I5HuW/D8UXD0UK6qCLoY3xNrrg/S6Tg66aqkLBC0KNZ+wdsSTOIlVwrkZqscV7K1w0Fqj08d24Nv2Jpxsr0anexMoJh6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uclmnONXKhXevbFegele1B3z0zJwbX/LF3Wuk2T1VYQ=;
 b=KfmFZt2fU/K5BOsz1lNqlp5f6U/5rYCnTWEKPHVQynKbL4PRgSQuOhshh9zmKjN8SVyHn9jvNSg9rOz/Q5b5liHr5BuIHumOmK6NJJHxCSiXuPy8aaX3cC5PnzsM8NhoxDCEkDgIlrsLH5iCRe7YRvrEWWvcQx4PSaBWJnq487ivEeAYuYrc1SF1fcrQbGmFidkArwu6+L0kUtmZPV5ExiuygIkHqtnl2Nb6vvMoyyYoggStY0DnQ9PJGgoy00/TfK92FSvUr8XFxbRhGPRiOhHmZOGKgz9uC9r8qudQ6DwwhyIoHjNlMHyKkF27pYS+YR+pfKdMDmkvx5YcPv8E1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 13:35:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 13:35:38 +0000
Date: Tue, 19 Sep 2023 09:35:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQmjph//w3+9mKOI@intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <ZQmenqsn4JVHeoDr@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQmenqsn4JVHeoDr@intel.com>
X-ClientProxiedBy: BYAPR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:a03:80::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 509c52b7-044d-46f7-a230-08dbb9154f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVfmJrS+0JnPqxCe/KhT+DuiJAuyAoehTzwRS3HOak9RMSH3qwnkNu8VeIT+Ro5Lbd/1pztSGHKBiwHzeps0WdANe5CIVhbu/jrSdfREzYtTIQT+20xYkLGLVhxTTjlPg3rWk9ZCQsCNSb7vZnPqDByncaqyunnfP+KpiEGQNILuAlrihucmrE1ZhKLKzT4e9GGwdKa5cHI2SszbMKJurpyK5ftfrEUq79IHjc9uYojvzgPC8UzPf1kofSTZ1S0UCIiUDxQnhNh/do3I7vpbvrbg1WnMmbNAc4n9zRWDlLMKneyy+tEb0JCurRblEicsjr/11r7Sh9LrO+BBXpjAeDXdXm4aJVVc4nmSv3AKxmkJLlAE3hw6oE5ot8lHUT6cUrWquoudbne5F5rwQsWynlu0ZNIjWyDiRFtBW0YKv69BA5/Y4m8wnsUoUfQqtkFqQuT20UvIUIUmcXbVgyxte1dV9qRP+foGAA9jNk3QxrnQCtWXaG9/RBAaFrIuaG+azcKPXYZWvyGYiMm3i2Iq5eRz7CODcbbuxvBVC7cf/XuIzPhEmkM/wHvJk/gz32/awKocoPNNFxirtZVZXu3HGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199024)(186009)(1800799009)(5660300002)(83380400001)(4326008)(6486002)(6666004)(6506007)(38100700002)(82960400001)(36756003)(86362001)(2616005)(6512007)(26005)(966005)(478600001)(2906002)(41300700001)(8676002)(8936002)(66556008)(6862004)(316002)(6636002)(66946007)(66476007)(37006003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTjPzSg1H8gJfL98Y5CMhSFARL7B1CHIib+lnMDLiRlMATO2qvKFshrR2pBL?=
 =?us-ascii?Q?GGiO0kMCW09I/DsgW6rcqfuCZLvuQechoUdHcI6flaiAUoYkvbX2598RHKYo?=
 =?us-ascii?Q?ciWlpZDQKVUxJqmQwtT4FTgpsb/ZzZlzNfGF1xN2tw1968HihYD/YX1brzL+?=
 =?us-ascii?Q?7gCSbUBntYWioVi5xjVjj7IgzGd3hdUA96S42RYDV+29QEshvBS2C5SbqIVt?=
 =?us-ascii?Q?Dla9P59P07Q9TDO5stHSrAAS/lsKaziUy4023b5QbuAdlrVxjV53GkOY0QxU?=
 =?us-ascii?Q?ClkfBOTleh3q3M2BqmNal1nmqAjvQTP/hlHMl+hDD+IskmVBTXjrrotkmTGv?=
 =?us-ascii?Q?c9joF7o9BkCWtQOvflOvBfsX62j4952NQaraecdhAP2AQJSKe1aMYd8Gy+nU?=
 =?us-ascii?Q?MBb15i3sVjo6jgi2IREV0XsjtbE4IWvqM/A3eVQM6BS61S2jHki6sRzTE4bS?=
 =?us-ascii?Q?Wc1tW9fMDoEBrmXJ9a3NFqveOqhCjHRe2UxF6RI4Sg6n6OOQvveOWO8xii6h?=
 =?us-ascii?Q?KumN+FXcrilBo+Yopv4aGvV8L/rueVXlCIvoWAXYBBZJS9ZKvlTsWZbEMpm2?=
 =?us-ascii?Q?viq78qT/AnDFSTgD8SWbm30PSILRRb45x5wDKYE+LPzxLGqwf3GzksXDX4OI?=
 =?us-ascii?Q?c4LrEUZ31F1iR+VBW7+sZxcjTRjYVZmr/rTYXQLNuZBmTtGLukcnzfKRCbHy?=
 =?us-ascii?Q?dBP688GXGAKFYVdsa8fgMBmNBZ0ddEKUyfE+RoS98wbNh8sQZmpgjL5dWWbU?=
 =?us-ascii?Q?b7F2YCDHlgWmFoZzNr9/6zodYhksplZTbDil27Y3e/ObSP8pKl6MQ5FXczFO?=
 =?us-ascii?Q?W8rrs9P33RjdndJVEikl4/MjZ4sZ210dkjGRh8dqAqiscRYkC+OKe4GqVUyj?=
 =?us-ascii?Q?VSl3xAKFERBcOvurHfdxrjLy3McKFWkpK74R5PRGgWq4Deal8HakjLr+l823?=
 =?us-ascii?Q?FMhYsHywAlGiEm8hSi/K6eZ1ISvPenNK9rj/5HlaUzA76iDgyadN7Pzt6D+e?=
 =?us-ascii?Q?96DD9jKypHXLo0VhZ76hHela/pcabPhdfKa0n101leIW7lxyAd+bh4QW2dY+?=
 =?us-ascii?Q?8hhTwiF9ZEe3HESyiZ6HMlcKvnxQBJREcugG7viiRQNMSCKAMptWRKfy7lRi?=
 =?us-ascii?Q?psMCWNnB5RSQDL78FGjwH9e1m1mzBBIfx+LoibnsIWPnr+O1OZLeo5llZHU+?=
 =?us-ascii?Q?KV7fgKg4wF3Yax8+0Awddvs3F0oLDdoTNcGrDcs8RiGBHdvqf5iK3a3OtKCa?=
 =?us-ascii?Q?im6UtHr67TBDlhYoyelU660Uf+qo/W69cUGRN61gBvewE1RgKFUSC07KUqoU?=
 =?us-ascii?Q?EL1ZSneTraa3krQTBB1TMvqsmG0vKuT0N398UzCpDWxQFrRvc6CJhogeeIVA?=
 =?us-ascii?Q?006VdjFuNXiYsfFkFsMtZhJ16UauYeTQM5B07Um8cqKwIvR2CPIuYYzc19TS?=
 =?us-ascii?Q?xpWtRz+ERHvqdnjT+wcsXgLQyd+ui4lU53cruOGw3LDmSrgF6hAQ9BJGZb9u?=
 =?us-ascii?Q?05ITWql2/tBPhXpAh3DfpBtH+8LC5ZM6FiodNsRapz/Hi8+SRBMZSGPP4Lhr?=
 =?us-ascii?Q?ppIf7m/Eh9bva0dFk9NmL4wEXlTLEwclop+mes2l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 509c52b7-044d-46f7-a230-08dbb9154f2e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:35:37.9265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSZxeH0Rdjs9VzS02V/BZkGBYCz1j+guaBpV7q8jmQwON3ZcdPyH/Ye9HlAhxKv5dZnAQEamoqLJ3nzSe61jow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:14:06AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 15, 2023 at 04:34:41PM -0700, Matthew Brost wrote:
> > Backwards backing uAPI changes, getting on the list.
> 
> Patch 2 breaks compatibility.
> 
> > 
> > First 3 patches already on the list [1] and free to merge as soon as it
> > gets an RB.
> 
> Please do not merge this today as I'm getting these patches with
> the others that Francois and myself are collecting to have a one-time
> shot on breaking the compatibility.

I just noticed that my message came too late. Since it breaks uapi
compatibility and no userspace, not even igt is ready yet, I have
removed the patches and force pushed drm-xe-next.

Please do not push these patches again since they will be part of
the uapi series we are preparing and will be pushed when the UMDs
are ready for that.

Thanks,
Rodrigo.


> 
> > 
> > The required IGT changes are also on the list [2].
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/123820/
> > [2] https://patchwork.freedesktop.org/series/123821/
> > 
> > Matthew Brost (4):
> >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> >     implementation
> >   drm/xe: Rename exec_queue_kill_compute to
> >     xe_vm_remove_compute_exec_queue
> >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> > 
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 97 +++++++-----------------
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +-
> >  drivers/gpu/drm/xe/xe_vm.c               | 21 +++++
> >  drivers/gpu/drm/xe/xe_vm.h               |  1 +
> >  include/uapi/drm/xe_drm.h                | 19 ++---
> >  5 files changed, 57 insertions(+), 87 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
