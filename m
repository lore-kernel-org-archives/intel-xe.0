Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684BC369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 06:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BDD10E2E8;
	Tue, 29 Apr 2025 06:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA5rNGDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127B910E2E8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745909561; x=1777445561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pN1nVebDZqmPxJqTeWpwQ7gOOecs0KKsBbDr6tE7yfw=;
 b=gA5rNGDnKMmTBYVVsFuWWs09GJicr5JPps0QPIWapHOvjAMCmEYqIjmv
 z2oLFnj/6g+eGi0oIb6o5tM8qxzV5LsXEi5iMR28C6x+DBKGlSUj6XoKv
 FUS4jTZ+s+3Qf+PUpmaa6cdhx6DdT00wD5SGRkTUcbhHalSiYy4H37n3O
 PK6w+VTBGQH3BBnC6VZiwMFmlcNjFHbWRjyPRpOuaXNyQdyWdiG8xtHNX
 Wi2PaYWCy0DoPZmVk6a7tVngAwn64lDUrc29r68bDsiaBlELIEWmiw+Cy
 u82gUfEB1xZCiqEgrpNGZ2bnyf6Y+2gOSaVOj1O+MRF3qNGHIa/0zkTWo A==;
X-CSE-ConnectionGUID: 5LXI/cebQh6gN4nx/iH+Ig==
X-CSE-MsgGUID: QHkirQV1T9m+0CdXeAitRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50180300"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="50180300"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 23:52:38 -0700
X-CSE-ConnectionGUID: hmNqr8TWSSWT43agYwjcBQ==
X-CSE-MsgGUID: EQfryxR9Sq+adi2qsxTm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="137781474"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 23:52:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:52:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 23:52:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 23:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIzMtFO1OiMT5eK4MG8MkXGoM5ubMHqOl1wSSuaMcYyW6TyRdxaAyXX0sJ4cT5hjyDv+uXB3dGz1lXJZUuDC+4pgkYfrgjdKF+D2IdP4pKkMfFwHVwgBDUeAcGxihGO+J82sIe440jkNMcOxPYCvegpllzwbUPxZ4LPhXKOU61Si6njHxklPKiieRWoSpPCLZ2ObMMfUqAJnpk1jMz/xK6j47njlnYM/IN9MifSINoCTTYu2TO5FVyqwaJHjDmcnZ537s0zTOAoAbsADLAewzJ9cAmdfzqWW+ONnE7itqhzM1mh/OuteZ14DCl9RLUxYf1TlpkqApFX8ddSlTPjG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoV7yfsuZX8CrJpLoOsC9bGZQ6EeAhi6LBKZxn3aOpM=;
 b=SscxGfbWBS5hLh0rnfDbKZVkqg65ThpH/lU+cuyZXYQc/xShJ2xddMYPCpWSTj05yncOJDQYAEQpPo84s5IfHvxqSd0xXf2t7ihlkNwwRvUOH40ssRpV6MIsOF7LhXlg0hJDg5JeqlQtf9pdLe/UkS+C2+W6O4Uc7rs9C8A8JO4o4SSUKy1BMESRCuQoNlJHzHA8NaJ47RjSorQdmH0JUynKEgmJtRDfw+B/6JQMsM3pObk0Ip/8KtIK4wdB0H+Is3PbeIEhoqR6X1Xil23bMXpKDC1hsIG5iVVzlxZsWmS0f483+6VapapIqdBCcTnm5w6oYU6rLno1ytrBe+hqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 06:52:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 06:52:28 +0000
Date: Mon, 28 Apr 2025 23:53:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 17/18] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aBB3f7VZRfOEKJKP@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-18-himal.prasad.ghimiray@intel.com>
 <aA/3nrQgNq8uGaFZ@lstrano-desk.jf.intel.com>
 <a40ab94f-0a71-4092-8410-cca3c5f2bc99@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a40ab94f-0a71-4092-8410-cca3c5f2bc99@intel.com>
X-ClientProxiedBy: MW4PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:303:86::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 949cd45a-7246-4b87-b6d1-08dd86ea6839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6SKM7ZT98KQ9XLdt2zFNrktX8slDDcnfR39yUg3WPV+EeG3/CgEnKKKn3Rf0?=
 =?us-ascii?Q?kZHx9GegXqCOnOFKvJVVM65vKJYAGW20hCst5tN2ujKauQcZFql3Udc/12XT?=
 =?us-ascii?Q?Rkn8/W9DoS7BENFibkZ2Ca2jt3h2ukyA33LamvY71bXp2ZYeBiXw5d4VPnlq?=
 =?us-ascii?Q?U4DygpKr9SjWxUSXcXPTpyrLBKhwuEyxiWCtaX8wRLiA3bluWaNyxYXq2tef?=
 =?us-ascii?Q?Z0CJaYUMGBQKJFbLdWmwyz20g5CZacGwd5fkoMO59gWvTqG1A16nG4PGoThT?=
 =?us-ascii?Q?T5SLAzKY+35H18rIgULCVVI9Nzwqdy26hCC+Cppug6dnnmr5X13tIFjAq8ak?=
 =?us-ascii?Q?Bto4Fd5XHfCNyr41fM9o5KWfbVNDsQIdUgpz73cYfO8xLfqUOzE/nP9YgXxE?=
 =?us-ascii?Q?gGmuSt03wYT2yJ87gzlbcJgqlgkQSvNzPQw0t/as0JUES85Xu7NI4iHKTbiL?=
 =?us-ascii?Q?Et/JfJpu880a/XwZnCBDPwunZD/NL+Yl/jv7sippcPOHxbKw+1pkGZnWQk4T?=
 =?us-ascii?Q?cqX5dsZLRSPNFt297H9o/RoZuUjm2yszZsWr7YB4sx5WOd0eNd8RiAlkRZ02?=
 =?us-ascii?Q?uo3SaSyPvHk7Zs3bbWbPP8G+S2WdOwZ3o+OvIT5Q01KRcWpDrgX70HaPfmwy?=
 =?us-ascii?Q?cqP4R325hoQ4unttruEvE7ZS4BkaqGrbROdxsg/C2N1ak3A19DoYTASnrXBa?=
 =?us-ascii?Q?G4/rjfUYI27aW0LR87lJJywHPmXNDfTgGCVlp6N6hzW/DHf7Pad5qsGY7JBv?=
 =?us-ascii?Q?m7+j4p5lk0lbAif441fa0acfccfV33WM2y8rTgUX2uc3Ang7vKPtWAYjJMKS?=
 =?us-ascii?Q?jqg5KmoUa9O+7Y42yDSD0nwVlyrbFxg5wQ8kybB9VF+6JN1/qx3uFMszkNXV?=
 =?us-ascii?Q?q1BfPuPJpwsbG2lY9PAQzY5F1S0QVy4GdgAM0eUmG76khTkxuav6VmctvLV6?=
 =?us-ascii?Q?bk1H+mUQwIbruanu4BCmtJUvFyGLnz0mp6xFLrTCRJwCXlRGivvh7M65wigu?=
 =?us-ascii?Q?ecBHt4BbL2Gm+BSw5BB+I/eJCam6mBMN0rf8fKDRbTC+OOHg/vrIFIWNHYX2?=
 =?us-ascii?Q?5sH11IXKL4B5cq5u58E3za3s4Y9SB/zfYp+ir1d01SZ2rAe62LImIcqfYDZT?=
 =?us-ascii?Q?EPBIWWEeADuOOiEOISUuscGHKSaY64jUSekKjrdacjPYP8eE1eedsgOzgEc1?=
 =?us-ascii?Q?MArZkH8ogQh9kRHaY01Ro/YmYfBrJZOi0rpPEPmb0UzcQmlreQsMZxDirzDr?=
 =?us-ascii?Q?W8iPv9Mp8a9D3+vB2vAlTj+vf/OfKtOT7KV05r28hbVtp9m4PIuTIhOuk/PJ?=
 =?us-ascii?Q?b/oidWqkeJeKqHliaQedMUSkrLBZEyVjG2XHztCt1UaVntxRa9Z8r8nh6kZe?=
 =?us-ascii?Q?IQWYGMyQMd55nPTHBFm1KlmZzIBDasABSNPJpowVgv8lsCvtGufP79mk3Vb5?=
 =?us-ascii?Q?z9cCwYOdA7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7IKwnb+XLWKUVN17XCFn6KBRB+Yk3irKwzocqAiNtwhLMYQPDW7047Db/+42?=
 =?us-ascii?Q?/AUT8y58Pgeiy8S79T4u5DjIQ17dp95B4edCqPm1ulVhbYuoqmVubGkma20u?=
 =?us-ascii?Q?V59v6iDj36v8lnqfavoC/DfOOE7p/hN9wOdN+2IJxomfLPC8jvZP5US9XtdH?=
 =?us-ascii?Q?7QIipBnyYyuwyISQXae4gtqQB/6CGx+Sq6aRBmNLXamxV3fIbpfbTS9bNVe6?=
 =?us-ascii?Q?REXF5H6Sx1B9cy/l+qqO7eYDe8PUBY3Y+u+GoUNHyy/bk+SakFnRDirfpYPF?=
 =?us-ascii?Q?TCJxC4Q1VbINJd9nTIHsrEp3I4GeJI+pA7X1G4sERzUdqICRVKyuxrPeiU0M?=
 =?us-ascii?Q?QZtFot8bj6BNsWFfKpbcmyjB/5kRi9fAYixm4HYvmtmIdndGXb/RSLlDuDLj?=
 =?us-ascii?Q?bit/EtePyIOuTHtaLfNA4QeVYoInHTbH9Vdb7xJaJMiCNpTVxUCnAi7fS+Kq?=
 =?us-ascii?Q?udhhfuzJ8PRwTgN0qROoBdzcR/bGaC6k2lt0zdHjPFhDTJxe9lSwpCQnR6fn?=
 =?us-ascii?Q?5j5IBgbDudYSm0mqtiN2/FvaBdDo5G/Ku+uLD7ybQqux3GTe8ogbqgT5s7uG?=
 =?us-ascii?Q?Z04M+OK/GxKVtrUSQwMLpM5WP+2WY5EKTYUfSIzFCNf54rI0bHJW1QHnzdpg?=
 =?us-ascii?Q?qw8JKGHuCjuqlKDTdtf9QZ/4tEIw4m1/mHzFU9A0IlUqrF4SrjTiPSpt/32O?=
 =?us-ascii?Q?G2s3Bx9pY7sqjwwdoaCkUNmfaibiPXtUf2ESpB28qBQN314/1JvhzBcVT8WJ?=
 =?us-ascii?Q?VMnCKdS+0QUQ4H3pRCYtQ4TiGu4JS26yZb18hMTQwWca7UuLuticO4MwC8sA?=
 =?us-ascii?Q?eDICHTxookmKE5HEFmV3WBuK0MkvwTxB8W9ooUBHSJpKH7f9fuw+31N+lBYM?=
 =?us-ascii?Q?plEao4Zt0T/6vkqMQKxcBjOxoYl2c3cZs9DYjjnFUGVoxp3waLdAL+F7w4zS?=
 =?us-ascii?Q?2YroXZwFCGlYKAJYNb0cVXY1yU71zt6P0H432ZICi1yhbdOKXSdS+FGheWiR?=
 =?us-ascii?Q?L7gUBq1xCrGyV8/FwTg3wmlU4aJLno1IgfS/U5myEqPy3pbkmdCHo0MJC9v8?=
 =?us-ascii?Q?DQAM8fLREYaecOhSnigfv7uQgCkRwP/uH7IwNUH3I0UxO3DMaXiYICAdcke0?=
 =?us-ascii?Q?Xtnol8wWwhHbqFRCAoy5h7zANSaTRwLdwFIYMD1X9cjvJLrALbWdtzaI/FUm?=
 =?us-ascii?Q?anuiQ4CQkfQVsz9WFlm/IaQWuJCBtabypmEaN+ZdrvtywH1OrVYiH6AjLkXi?=
 =?us-ascii?Q?snp0obbRyjnCyijSwphfT4qsqjpy9kKvnRMPIlMxZYQM5ijOxG98aNfhAMu5?=
 =?us-ascii?Q?lXruYmtmvnYvhtWeDw5EpHDCWzbHNNJ7zxpXZp4niCfC+3asL+rLy45eEQbf?=
 =?us-ascii?Q?dxUBdp1n9gsUX9AiW8jD0do1BH67crEOYPHVEBVJgtLNTBkuhwN/LJTRL7pF?=
 =?us-ascii?Q?j5/EBx019x52IqNlSvMDn7cXfrKtmsEeTZ5fDUP/1EzSXxvludJriIoAj+gg?=
 =?us-ascii?Q?Du4pDD0FdOjoFhxTcCS1Q5ktiIMNX4pRvnhPkdKlJvpELew26vgznu8so5Eh?=
 =?us-ascii?Q?oF6WuUtsjDTpilvmcARW8gaAHgoNhrKALUR2gnOwgi6b2rW+FWKiZ0MHFRcM?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 949cd45a-7246-4b87-b6d1-08dd86ea6839
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:52:28.7077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB/9GBWXaL4tAAmIh59LK5UFWp8SfeVreg/Jd90rOFQo+Tzv5BP6nVugB6RZfMcILHpzsEJPpa9Z6iRnwMJDkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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

On Tue, Apr 29, 2025 at 12:05:59PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 29-04-2025 03:18, Matthew Brost wrote:
> > On Mon, Apr 28, 2025 at 04:02:23PM +0530, Himal Prasad Ghimiray wrote:
> > > This commit adds prefetch support for SVM ranges, utilizing the
> > > existing ioctl vm_bind functionality to achieve this.
> > > 
> > > v2: rebase
> > > 
> > > v3:
> > >     - use xa_for_each() instead of manual loop
> > >     - check range is valid and in preferred location before adding to
> > >       xarray
> > >     - Fix naming conventions
> > >     - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
> > >     - Handle sparsely populated cpu vma range (Matthew Brost)
> > > 
> > > v4:
> > >     - fix end address to find next cpu vma in case of -ENOENT
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
> > >   drivers/gpu/drm/xe/xe_vm.c | 208 +++++++++++++++++++++++++++++++++++--
> > >   2 files changed, 245 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index de4e3edda758..f3a99ee4f733 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> > >   	struct xe_vm *vm = pt_update->vops->vm;
> > >   	struct xe_vma_ops *vops = pt_update->vops;
> > >   	struct xe_vma_op *op;
> > > +	unsigned long i;
> > >   	int err;
> > >   	err = xe_pt_pre_commit(pt_update);
> > > @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> > >   	xe_svm_notifier_lock(vm);
> > >   	list_for_each_entry(op, &vops->list, link) {
> > > -		struct xe_svm_range *range = op->map_range.range;
> > > +		struct xe_svm_range *range = NULL;
> > >   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > >   			continue;
> > > -		xe_svm_range_debug(range, "PRE-COMMIT");
> > > +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> > > +			xe_assert(vm->xe,
> > > +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> > > +			xa_for_each(&op->prefetch_range.range, i, range) {
> > > +				xe_svm_range_debug(range, "PRE-COMMIT");
> > > -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > +				if (!xe_svm_range_pages_valid(range)) {
> > > +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > +					xe_svm_notifier_unlock(vm);
> > > +					return -ENODATA;
> > > +				}
> > > +			}
> > > +		} else {
> > > +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > +			range = op->map_range.range;
> > > -		if (!xe_svm_range_pages_valid(range)) {
> > > -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > -			xe_svm_notifier_unlock(vm);
> > > -			return -EAGAIN;
> > > +			xe_svm_range_debug(range, "PRE-COMMIT");
> > > +
> > > +			if (!xe_svm_range_pages_valid(range)) {
> > > +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > +				xe_svm_notifier_unlock(vm);
> > > +				return -EAGAIN;
> > > +			}
> > >   		}
> > >   	}
> > > @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
> > >   	{
> > >   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > -		if (xe_vma_is_cpu_addr_mirror(vma))
> > > -			break;
> > > +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> > > +			struct xe_svm_range *range;
> > > +			unsigned long i;
> > > -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> > > -		pt_update_ops->wait_vm_kernel = true;
> > > +			xa_for_each(&op->prefetch_range.range, i, range) {
> > > +				err = bind_range_prepare(vm, tile, pt_update_ops,
> > > +							 vma, range);
> > > +				if (err)
> > > +					return err;
> > > +			}
> > > +		} else {
> > > +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> > > +			pt_update_ops->wait_vm_kernel = true;
> > > +		}
> > >   		break;
> > >   	}
> > >   	case DRM_GPUVA_OP_DRIVER:
> > > @@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
> > >   	{
> > >   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > -		if (!xe_vma_is_cpu_addr_mirror(vma))
> > > +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> > > +			struct xe_svm_range *range = NULL;
> > > +			unsigned long i;
> > > +
> > > +			xa_for_each(&op->prefetch_range.range, i, range)
> > > +				range_present_and_invalidated_tile(vm, range, tile->id);
> > > +		} else {
> > >   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
> > >   				       fence2, false);
> > > +		}
> > >   		break;
> > >   	}
> > >   	case DRM_GPUVA_OP_DRIVER:
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 555ed10dac85..14c01e155cb7 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> > >   }
> > >   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
> > > +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
> > > +{
> > > +	struct xe_vma *vma;
> > > +
> > > +	vma = gpuva_to_vma(op->base.prefetch.va);
> > > +
> > > +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
> > > +		xa_destroy(&op->prefetch_range.range);
> > > +}
> > > +
> > > +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
> > > +{
> > > +	struct xe_vma_op *op;
> > > +
> > > +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> > > +		return;
> > > +
> > > +	list_for_each_entry(op, &vops->list, link)
> > > +		xe_vma_svm_prefetch_op_fini(op);
> > > +}
> > > +
> > >   static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> > >   {
> > >   	int i;
> > > +	xe_vma_svm_prefetch_ops_fini(vops);
> > > +
> > >   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > >   		kfree(vops->pt_update_ops[i].ops);
> > >   }
> > > @@ -2248,13 +2271,40 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> > >   	return true;
> > >   }
> > > +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
> > > +{
> > > +	struct drm_gpuva_op *__op;
> > > +
> > > +	drm_gpuva_for_each_op(__op, ops) {
> > > +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > > +
> > > +		xe_vma_svm_prefetch_op_fini(op);
> > > +	}
> > > +}
> > > +
> > > +static u64 find_cpu_vma_start_in_range(struct mm_struct *mm, u64 start, u64 end)
> > 
> > Ideally we should move this to GPU SVM as we shouldn't be looking CPU
> > VMAs in driver code rather the common DRM code.
> > 
> > With that, then a xe_svm layer wrapper too.
> 
> Sure will do that.
> 
> > 
> > > +{
> > > +	struct vm_area_struct *vma;
> > > +	u64 addr = 0;
> > > +
> > > +	mmap_read_lock(mm);
> > > +
> > > +	vma = find_vma_intersection(mm, start, end);
> > > +	if (vma)
> > > +		addr =  max(start, vma->vm_start);
> > > +
> > > +	mmap_read_unlock(mm);
> > > +	return addr;
> > > +}
> > > +
> > >   /*
> > >    * Create operations list from IOCTL arguments, setup operations fields so parse
> > >    * and commit steps are decoupled from IOCTL arguments. This step can fail.
> > >    */
> > >   static struct drm_gpuva_ops *
> > > -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > > -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> > > +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > > +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> > > +			 u64 addr, u64 range,
> > >   			 u32 operation, u32 flags,
> > >   			 u32 prefetch_region, u16 pat_index)
> > >   {
> > > @@ -2262,6 +2312,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   	struct drm_gpuva_ops *ops;
> > >   	struct drm_gpuva_op *__op;
> > >   	struct drm_gpuvm_bo *vm_bo;
> > > +	u64 range_end = addr + range;
> > >   	int err;
> > >   	lockdep_assert_held_write(&vm->lock);
> > > @@ -2323,14 +2374,79 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   			op->map.invalidate_on_bind =
> > >   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> > >   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > > -			op->prefetch.region = prefetch_region;
> > > -		}
> > > +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > +
> > > +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> > > +				op->prefetch.region = prefetch_region;
> > > +				break;
> > > +			}
> > > +			struct drm_gpusvm_ctx ctx = {
> > > +			.read_only = xe_vma_read_only(vma),
> > > +			.devmem_possible = IS_DGFX(vm->xe) &&
> > > +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +			};
> > > +
> > 
> > Does the compiler not complain for this declaration after an if
> > statement. I though C rules were all declartions before logic.
> 
> AFAIK that changed with kernel moving to c11 standard from c89.
> For readibility we still prefer all declaration before logic. But from
> compilation perspective it should be safe. Will fall back to declarations
> before logic it causes no harm.
> 
> 
> > 
> > > +			struct xe_svm_range *svm_range;
> > > +			struct xe_tile *tile;
> > > +			u8 id, tile_mask = 0;
> > > +			u32 i;
> > > +
> > > +			for_each_tile(tile, vm->xe, id)
> > > +				tile_mask |= 0x1 << id;
> > > +
> > > +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
> > > +			op->prefetch_range.region = prefetch_region;
> > > +			op->prefetch_range.ranges_count = 0;
> > > +alloc_next_range:
> > > +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> > > +
> > > +			if (PTR_ERR(svm_range) == -ENOENT) {
> > > +				addr = find_cpu_vma_start_in_range(vm->svm.gpusvm.mm,
> > > +								   max(addr, xe_vma_start(vma)),
> > > +								   min(range_end, xe_vma_end(vma)));
> > > +				if (addr)
> > > +					goto alloc_next_range;
> > 
> > Won't this cause a problem in xe_svm_range_end(svm_range) below as
> > svm_range is PTR_ERR?
> 
> goto is to alloc_next_range not to check_next_range, there is no
> xe_svm_range_end() here.
> 

Yep, I misread the code here, mistake. Look fine as is.

Matt


> > 
> > > +				else
> > > +					continue;
> > 
> > s/continue/goto print_op_label/
> 
> Sure
> 
> > 
> > > +			}
> > > +
> > > +			if (IS_ERR(svm_range)) {
> > > +				err = PTR_ERR(svm_range);
> > > +				goto unwind_prefetch_ops;
> > > +			}
> > > +
> > > +			if (xe_svm_range_validate_and_evict(vm, svm_range,
> > > +							    tile_mask, !!prefetch_region))
> > > +				goto check_next_range;
> > > +
> > > +			err = xa_alloc(&op->prefetch_range.range,
> > > +				       &i, svm_range, xa_limit_32b,
> > > +				       GFP_KERNEL);
> > > +
> > > +			if (err)
> > > +				goto unwind_prefetch_ops;
> > > +
> > > +			op->prefetch_range.ranges_count++;
> > > +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> > > +check_next_range:
> > > +			if (range_end > xe_svm_range_end(svm_range) &&
> > > +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> > > +				addr = xe_svm_range_end(svm_range);
> > > +				goto alloc_next_range;
> > > +			}
> > > +		}
> > 
> > print_op_label:
> 
> Sure.
> 
> > 
> > >   		print_op(vm->xe, __op);
> > >   	}
> > >   	return ops;
> > > +
> > > +unwind_prefetch_ops:
> > > +	xe_svm_prefetch_gpuva_ops_fini(ops);
> > > +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> > > +	return ERR_PTR(err);
> > >   }
> > > +
> > >   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> > >   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > > @@ -2645,8 +2761,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> > >   					return err;
> > >   			}
> > > -			if (!xe_vma_is_cpu_addr_mirror(vma))
> > > +			if (xe_vma_is_cpu_addr_mirror(vma))
> > > +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> > > +							      op->prefetch_range.ranges_count);
> > > +			else
> > >   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> > > +
> > >   			break;
> > >   		default:
> > >   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > @@ -2772,6 +2892,50 @@ static int check_ufence(struct xe_vma *vma)
> > >   	return 0;
> > >   }
> > > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > > +{
> > > +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > +	int err = 0;
> > > +
> > > +	struct xe_svm_range *svm_range;
> > > +	struct xe_tile *tile;
> > > +	unsigned long i;
> > > +	u32 region;
> > > +
> > > +	if (!xe_vma_is_cpu_addr_mirror(vma))
> > > +		return 0;
> > > +	region = op->prefetch_range.region;
> > > +	struct drm_gpusvm_ctx ctx = {
> > > +		.read_only = xe_vma_read_only(vma),
> > > +		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > +					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > > +		.devmem_only = region && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +	};
> > 
> > 
> > Same question here about a declartion after logic, pretty sure some
> > compilers will complain.
> 
> Will address it in next version.
> 
> > 
> > Matt
> > 
> > > +	/* TODO: Threading the migration */
> > > +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> > > +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > > +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> > > +			if (err) {
> > > +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > > +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > +				return -ENODATA;
> > > +			}
> > > +		}
> > > +
> > > +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > > +		if (err) {
> > > +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > > +				err = -ENODATA;
> > > +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > +			return err;
> > > +		}
> > > +	}
> > > +	return err;
> > > +}
> > > +
> > >   static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >   			    struct xe_vma_op *op)
> > >   {
> > > @@ -2809,7 +2973,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >   	case DRM_GPUVA_OP_PREFETCH:
> > >   	{
> > >   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > -		u32 region = op->prefetch.region;
> > > +		u32 region;
> > > +
> > > +		if (xe_vma_is_cpu_addr_mirror(vma))
> > > +			region = op->prefetch_range.region;
> > > +		else
> > > +			region = op->prefetch.region;
> > >   		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> > > @@ -2828,6 +2997,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >   	return err;
> > >   }
> > > +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> > > +{
> > > +	struct xe_vma_op *op;
> > > +	int err;
> > > +
> > > +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> > > +		return 0;
> > > +
> > > +	list_for_each_entry(op, &vops->list, link) {
> > > +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> > > +			err = prefetch_ranges(vm, op);
> > > +			if (err)
> > > +				return err;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > >   					   struct xe_vm *vm,
> > >   					   struct xe_vma_ops *vops)
> > > @@ -3478,7 +3666,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
> > >   		u16 pat_index = bind_ops[i].pat_index;
> > > -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> > > +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
> > >   						  addr, range, op, flags,
> > >   						  prefetch_region, pat_index);
> > >   		if (IS_ERR(ops[i])) {
> > > @@ -3511,6 +3699,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	if (err)
> > >   		goto unwind_ops;
> > > +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
> > > +	if (err)
> > > +		goto unwind_ops;
> > > +
> > >   	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> > >   	if (IS_ERR(fence))
> > >   		err = PTR_ERR(fence);
> > > @@ -3580,7 +3772,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> > >   	xe_vma_ops_init(&vops, vm, q, NULL, 0);
> > > -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> > > +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
> > >   				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> > >   				       vm->xe->pat.idx[cache_lvl]);
> > >   	if (IS_ERR(ops)) {
> > > -- 
> > > 2.34.1
> > > 
> 
