Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27759CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 06:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784910E26F;
	Tue, 30 Sep 2025 06:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYtMcKSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4D10E26F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759213593; x=1790749593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rMcQVuFa5si4Z8rE90SF1yL1NpdJ5XUtkd7Rx45q6WU=;
 b=PYtMcKShuhJvzIt6qQVL0Sdg6VWQWaucdfXOePlw+z3+8QgdedZPBKzc
 4aehV8TFKhyfMXJ/4P2g41pM32JzT93GOhSOM36XlZkxVkhaKl2cokKFY
 1yjpNEPZDJRIwenQ5cAIFwc1JEWE8LQA5Ug1PBt1Tfg1nObQJ16/H9Oe1
 jlaALwlc9EQUkoit1ytLJrmws/+Gu9jBfvKv45cqnErLKwGOoJbXt0YGK
 bRxs3JbNhRz2b284p+/ak1it//Va66etVkeBwmye3uiXzM+/QIAhGneA2
 NkcwaEdF73WO6zyPtAGE4WSl+jIi3wyPdZ2a0K/P1cH3MdeI/uzQvDaYV A==;
X-CSE-ConnectionGUID: ReFq+nb+RDuE9hVGkiXxQw==
X-CSE-MsgGUID: G5vq1yU6SsmVj+6IMVLgNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72141604"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="72141604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:26:32 -0700
X-CSE-ConnectionGUID: THR/DIV8R7ONMB2Lkoiinw==
X-CSE-MsgGUID: vfxVQnPPQzKDjeoeP9lZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178462743"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:26:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:26:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 23:26:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK6tr02Eyexf4OlD7Z59ysUhsPahAP2no0o6/QlzPsAvNyO9/xt6IDTqP+ytr1TSIXIPyMDb3SU/y2a/Xo+njNyiBTJuSMJ01APnHsnLLtQ5qxl380yms3dwFQvrpPwn2/nHaiZQLYoFIszaA3MawMHErOTGLyV6GezRTiWbZicQPlDStOGFJzYsyiRGvqFple6aRprDa8YhPvWLd2td0PQ2Un7traDHbg7S7NUmyPNoE7rIUPkLZCVxCrnwf99Fw1mVAufnFkMiTDg+2iHRm1VQui9DHpWJjiqFnJPE8SUhiCSIoK4Xq7UJ9SH0BY6tpFSeAcwPjo0by1DHNLcKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePug+WXm/R0RjGXZn+8R5/Xv+eHyuMVizdgidh521Rg=;
 b=Rt+N84HGK98/TemuCdArRHq0MkBe0uvraMCtsm31LDYPVGIGdYBDSi2y/8ImhRrvLBfUlNW80fEu3m/uPn0nPWoQRV8ELYIHm/gd9YQxWv5/5VC7yARky4MruDGuoBwDDlD30spq5rYOZb1uqh6jV95xSJPBWA7qvn/XiDC+iQQ/B5k8r9yhRCbtMt2Xfb8Xo/UH1NxgnZhcn0pqQx3py+WNTVUYNdzfNOeDscW+3kYjFOXHkSd39+lBexDwL3swI7V+l0oOsDSqDlhcZOV1NnTFKw0Wq39wYhzA26ffYmgKsnQtTp+hNZFOeGBfhl0iy8n+uMyteyhOpG8v4lQBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:26:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 06:26:24 +0000
Date: Mon, 29 Sep 2025 23:26:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 26/36] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
Message-ID: <aNt4DU11RxA6+nU9@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-27-matthew.brost@intel.com>
 <bc6ca30e-99a9-4371-9560-658ba2306b56@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc6ca30e-99a9-4371-9560-658ba2306b56@intel.com>
X-ClientProxiedBy: MW4PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:303:83::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 6799e2a8-9f59-4a33-489d-08ddffea4722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gWWwvNDG1qX5V6H43IfSlPVKIR0wQzeh40wtU0e5h9ET5xg/XdkNaE43oi4H?=
 =?us-ascii?Q?5pUdKTMiQ7naLFOwH1fi/QcX+FHy8fSIJ2KOBMbIeZ2ZFr4NxD/jRHW+247p?=
 =?us-ascii?Q?8Z9HMibCpFrV9oZsqoouzOZFGdYa/ZC9pXQHXIPmpZO857zJp29VRbhpEdOj?=
 =?us-ascii?Q?01mWl2+ZWVqpgvO6fjV+4DaOO7lmUn+CV8V6Q1ypCJZGLO0DCpQgnancKv9P?=
 =?us-ascii?Q?9SMtzkbGLsBqFmx/WWwbrRIiGU8hSb8J1lghSxq4eBmoBCRp5mQUzepNqWwQ?=
 =?us-ascii?Q?Xb+Yon9HAjz8CrLg5hyX4Wd/jyMdTt4gGvKB27gUSdGc+bOvBX+br4fDDjB3?=
 =?us-ascii?Q?6yRN3xZ0aFQ5WXPYWSKeHVtDgbd06/RtB2cZVpq7gFxarvLEX8Jwfmbh0HGu?=
 =?us-ascii?Q?PgXjC4cgk+rSGh9m6IMYo7ALz1+/NVEObC1vWgFAfzCaNQc0FCLZSe/Wos79?=
 =?us-ascii?Q?Gqq7aoGSw5Bi2wSRh3nHq64+IcDCcN7oX76O6F9OKvYHz2dfdhPEtlM/KM5h?=
 =?us-ascii?Q?e669lipGAZgTTHmRvOJnVO6O4kWfmJQI7qtMFCG04fhVvPTjItkge8P6S0wU?=
 =?us-ascii?Q?it4+pbeIDQBpkcfG/hrbrIsVxfLD8nPkzH1CVfT12V+pasJ3M/+WtknZr755?=
 =?us-ascii?Q?DXCyKEPkWKixKw/r8MEx4BuZvvD3Gk2ZOzPG3JYwpZkOJFp18zfn2P4mu8UK?=
 =?us-ascii?Q?vMMSG/5Ciu1j3GBQVt7SVw2K22aUd0IlNCszJ7fXECd7F8TnO+c+jxPrayUr?=
 =?us-ascii?Q?4E1pXibSc6HFO8GxApAE7L0E43A0IojxDdy5gFimsBvhPImeQKIDgEzk1nOy?=
 =?us-ascii?Q?zGYAh7D3dXdHLqElq4keBjuqudPTMTco6yztXCp/sVLJ4EhMeRgupDzW6Qoy?=
 =?us-ascii?Q?dBCFMhOmYbRG74xDB57bF9O66u/okmspFP7pFBt1/BgUnctQJlphQ4Q1nK9N?=
 =?us-ascii?Q?Fa+sMehjPvOR6X/5arYmpiEISer9xToo40viJXRGfw1hfSYBvnLZgXD7WdBA?=
 =?us-ascii?Q?a+iaM0pxmL6pC/UaFLvSe7tdWAEpRlz5Vn6iO7VJ0UyqflqogBd26xh7HvDF?=
 =?us-ascii?Q?i5ACwikqyuytr/Gc8xN0p1gk7ydy9LIBoFKrc9baLrG7qbRuWy2ZBTvGuAsK?=
 =?us-ascii?Q?tZVoRqUxorM+z+DRAiaYxALzO1rdgkEqGSIg3FytQq3A44VYcZo+pMMk0dlW?=
 =?us-ascii?Q?5GkJWEmQkpLuPEwb3ui1vPyHcRA7g15AORJGbdUcIhICVgbdsIPUWUY3rH9x?=
 =?us-ascii?Q?mvzAs5xQ64tA/xNbpwkBBXK7u7Jpj3uUoRwxbaYUd748IA4oO6NoYNaU6DWb?=
 =?us-ascii?Q?dsp+Mu5uBUYPGB9eg+47D/2O8dWzVnQxHZXMmkoBk/+TGEMcJrDAJLXwSS5B?=
 =?us-ascii?Q?MCP09jku4/e8JxlBgKgjKpEO2TeCUt1pF6d4el49rxChFRWCX8esbmhQJTum?=
 =?us-ascii?Q?9IQJ8ne9C97mF9yMGtMdK4uFcK11I0MS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0mjOdibltvDkM9CQk4HnVeSs9s6Yceijrao3NiTtpRtp/l/2he0nAHYgPl60?=
 =?us-ascii?Q?nOZLi5ZieZGq4YHXZhJ8fe9LDYIeOM6Ll1M9DCebM7kqt6+8Jn80cTBzm1tK?=
 =?us-ascii?Q?EiZpwH3ITGHU1732HgkVWWjA90ltDMFD+evYUDpPHBqDAw3RZpctXdP0Y7NH?=
 =?us-ascii?Q?By8E3TU8K1Xt9JFdWihw+ZTUKWFeaLdgQ3uVaxYfZvN8vbgcuWUfRgJuGI9U?=
 =?us-ascii?Q?GRwyWJfCOnESaAklcajMZqgJepMw/ZZnMs58KNKC6BpN7YWYZhiHxTyl/TaQ?=
 =?us-ascii?Q?0j5ZXe2HkOAWQhmOJTwS8VDbQ7yN/4OsH17ENF8XDUST3geUpQWgFc88qBNZ?=
 =?us-ascii?Q?v0rL146qX9ffQ536fU9Amzeevhn0C2DQrjZ+Kn1RJG6aVO9hkoFBVQcej7ti?=
 =?us-ascii?Q?aQ23l+YjtkdOosLeY43MzJTo1MpNttmw8gPemCbdQUfR5VKcjivT5cLeEKFD?=
 =?us-ascii?Q?7jCFPbfDp9tXQ69DAGEYEAGSk9pVK+lRW425NGU8dmt/8ji8fRFCuFpmbNtq?=
 =?us-ascii?Q?aMkzucgcUASpD0aP3bK6SrQA0i2IzMvNC+S/63fTn2GG6R26KIE3fI2CIz40?=
 =?us-ascii?Q?TZ45xMAZ972JPA1roWKxv1XSfMoamgPUe/L91RjDPQyTDJ+3N7IZoLmtPAiU?=
 =?us-ascii?Q?giZ79/yD3gRQ0G8z3msLCBCjf69vO3i4xmForR7ZOEJCTlUi2qHm1GBcLTrS?=
 =?us-ascii?Q?sktsFnx38T6Jl067cqhUYF+aXVMo6UfXgN4t7/gxuE7SckJezO7G3VxajG1g?=
 =?us-ascii?Q?zjm+DhgtbdFYJR7NBPeNf433QDXNLS8oYysmIbkzDzRXhBcqmOJdaeRCEqxV?=
 =?us-ascii?Q?OEaVNSVIxSarpoqp7nQ7Q2G4Mu772r6LIpOA2SBDDTrqYhfmCPjVvEqxoGqj?=
 =?us-ascii?Q?IPEBoFQ4u44Gi1oaG6K8yQkaRzP4qSuFBrrDDeEEreLRnu12Z+Zmv6J2xiLJ?=
 =?us-ascii?Q?XNi/03fspclv2sydVAhRfse4nn7u3y3GlJMmrj7rH08xTCW8PYnJiL7SWQPQ?=
 =?us-ascii?Q?10MSgMjCq4tKiDUNNoYGQtNvSSvKrpEbCIJBteTNCZK02z00qLzpy0i+mjOl?=
 =?us-ascii?Q?EslYUIINfRMG38DYUrkR9Z/r8iXccxjWUoOudlQyvwr7XSBE0q6NaPdI8a9e?=
 =?us-ascii?Q?VkqIMVGoxOwxC7KSpmsAbt5J4c+qcqiLtxB72V7oIVlHV1Wm4ulSE3dMUJiL?=
 =?us-ascii?Q?10uCm2cho+Sxj3PYiTMvwuMPf8gpQKgIuv2wxPKrM+AqfpSyAfg1THf5T+xn?=
 =?us-ascii?Q?AxRf/OzsNlST2drENaawAxFpxG4LPAdpqIde0iPSdpP7Uf21PSzc8LOsGHqG?=
 =?us-ascii?Q?3CdLuSJLe6VdqHyxB4QB8zpy1A9ouLIyIBQSVpHY1Y3vF6BdhH1lE8vQ0DvK?=
 =?us-ascii?Q?EhYNtTOVXgdPPXQVb7ZJPb+Q9Owo990ezBeIzdhKyq+pfWkZFkekADV/X2pn?=
 =?us-ascii?Q?wqakiFwKwlkm28SwGrm95sfYZVEYEIymH2DVxzUWcnpaIC8TLppMrUckIfIE?=
 =?us-ascii?Q?l7N6n+X8p2l7JSNgVuJri1pKcihVDZA4dNC9sm+byrI6ShxJItN8t9F98CKP?=
 =?us-ascii?Q?91pxrXwbrZyo5KDtcasyC9eM7tqy76Ksd6UvmwEps4VuqmGMPpVI1J4lPW6B?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6799e2a8-9f59-4a33-489d-08ddffea4722
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:26:23.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51KNqD30ItTxhARPAGP8xOeE54WfkFs+vfzuEYo9VHER3uQN6+Np2UB7MmKPB8M10PkZ2VGdzs10G5MNjBRRqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Mon, Sep 29, 2025 at 11:49:42PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> > they may contain stale or invalid data.
> > 
> > Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> > resubmitted by the GuC submission state machine.
> > 
> > v3:
> >  - Don't mess with head / tail values (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 ++++
> >  drivers/gpu/drm/xe/xe_guc_ct.c      | 59 ++++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
> >  3 files changed, 54 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 35de8977c6d0..cb3e9f6e83fa 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1214,6 +1214,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >  	return 0;
> >  }
> >  
> > +static void vf_post_migration_rearm(struct xe_gt *gt)
> > +{
> > +	xe_guc_ct_restart(&gt->uc.guc.ct);
> > +}
> > +
> >  static void vf_post_migration_kickstart(struct xe_gt *gt)
> >  {
> >  	xe_guc_submit_unpause(&gt->uc.guc);
> > @@ -1265,6 +1270,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  	if (err)
> >  		goto fail;
> >  
> > +	vf_post_migration_rearm(gt);
> > +
> >  	err = vf_post_migration_notify_resfix_done(gt);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index fd6e731c0395..25efc1f813ce 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -500,7 +500,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> >  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> >  }
> >  
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -508,21 +508,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  
> >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> >  
> > -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > +	if (needs_register) {
> > +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> >  
> > -	err = guc_ct_ctb_h2g_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_ctb_h2g_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_ctb_g2h_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_ctb_g2h_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_control_toggle(ct, true);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_control_toggle(ct, true);
> > +		if (err)
> > +			goto err_out;
> > +	} else {
> > +		ct->ctbs.h2g.info.broken = false;
> > +		ct->ctbs.g2h.info.broken = false;
> 
> if CTB was broken before migration, shouldn't we leave it as such?
> 
> IMO it should be cleared only by a normal reset, that involves CT re-registration,
> not just by our recovery, as GuC may continue to ignore broken CTB
> 

That is really bad situation to be in. If this occurs, we'd supress a
GT reset and broken wouldn't get cleared until another another side
affect in the driver triggers a GT reset. If we clear broken here -
maybe this happens sooner? Idk, either way is not great.

How about a WARN_ON if broken is set? Again this isn't something that
ever really happen and if it does we likely have in the KMD, HW, or GuC
which we'd need to root cause.

> > +		xe_map_memset(xe, &ct->bo->vmap, CTB_DESC_SIZE * 2, 0,
> > +			      CTB_H2G_BUFFER_SIZE);
> 
> now it's better, but maybe we should introduce
> 
> #define CTB_H2G_BUFFER_OFFSET (CTB_DESC_SIZE * 2)
> 

Sure. I think what we really need to do in a follow up is add a bit
kernel doc describing the memory layout too (e.g., like we have in the
LRC code).

Matt

> > +	}
> >  
> >  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> >  
> > @@ -554,6 +561,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_restart() - Restart GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, false);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_enable() - Enable GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, true);
> > +}
> > +
> >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >  {
> >  	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 0a88f4e447fa..b1cba250c51c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> 
