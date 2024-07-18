Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94260C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 17:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6701E10E1FA;
	Thu, 18 Jul 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nik7AeyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13E910E1FA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721323238; x=1752859238;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MbqlxMApDQntjRf3LcbtQraxgULOX0/qnAdgC8Swt5k=;
 b=nik7AeyNsVX/4hvI3tlPtMxkizfQVJyzNYIJ6Kb2/OD1McQDmkwJxCDk
 ykRKU5CpBW9cwMe26ep/KAAUtA7wMIs3qeQp9zSmP90DwtWkOWQFN4x55
 /OWZFqrx6NTlpDEcVcyb9NNjrpHn4M80PrTxQj3OmoczAqpRc8t3YvV2v
 5/U8nQh9JaBCdGGArDEAnrzacelmeuztGgjKBBW6NVD17ZhpGfOKRgzoh
 xlBGLRf3yIDOdFcaeM2yzQeD0W73XnpuNpNYKOUm5iHmFEX4DkI3g7xqz
 MaSot8lVRnNYkAsaIE5H7xBuSED8KfOIbHF9oO8FlIB+CWxu9La+0vD6r w==;
X-CSE-ConnectionGUID: QRaM8o1sRa2VNLd5ltwIww==
X-CSE-MsgGUID: ROGBD0CMSK+QyB1Hn7Ix0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36344571"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="36344571"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:20:38 -0700
X-CSE-ConnectionGUID: +dOqaIiITGuS1eL9QX0GRQ==
X-CSE-MsgGUID: rWN0ebllQS6cRa4rOtwwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51452195"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 10:20:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 10:20:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 10:20:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 10:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMLJPCC0iaVlGgYxYPbxZ0ebiQNMgTsR+K4HzGO1T62jF9Z8IFaeCP2W+9RHBX9SIIV544x1FFRV3PgDpOPxRFXh5DwWe/AChcFD4ch7yKqRv7MGLEUTmbei7zTqgboOZAOnQIlaQSbZE/v4ej/IMypJYU2VKMurDW9DzE4Vl3ZJ+IwcywQQzZkxEUac7sy5lRTu2+aEQBgbAUT1+D4ze87N4G/VjarmqtudP/VwuYvhHS0XUb27zGInXjgflf+YvS4U0F3QByZGo4vMTs37Wky+X2P7yLG1AruPgRMBLbPmH+FcfzumEe1i9nLDdQu7ai19U6KZAFWNmD0kVqRZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkME/iZjOXYa4UJJ6NI9Nxm1GRX0Td4sLhsZZtX5CdY=;
 b=fXZX8U35sCkCx24eXykVcogLd6FxtXImINqgfyJkiJUUax5xewOx/FwURhWJXn7Zr2SAsnqX+oCDxLXpIaFk4iEZTXZXqw42xP5UgwO/yXZzoxUFDh5rtRO1kSq1g+sl57BrlOk8Un14vIH7rDl3Ehu6fehDQjv/gJyowAaAKuE165amRWVe+GJnsTyOyDGwPESAI9G5cteCcd22WpumCPcA2vjIeUl5FYh6VrHYUZjRmR0NCn9SDBIDgDdH1fesIG5NthkVJsP2hXX/oAhuCb94K1We+Gn9O+SE9lHibVr9fPyTAhqCNUPielVsCR+K2RM4suVspR8Ob51wikr5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 17:20:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 17:20:33 +0000
Date: Thu, 18 Jul 2024 17:19:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nirmoy.das@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Build PM into GuC CT layer
Message-ID: <ZplOsUUl15s25dPY@DUT025-TGLU.fm.intel.com>
References: <20240718155245.1481788-1-matthew.brost@intel.com>
 <20240718155245.1481788-2-matthew.brost@intel.com>
 <c91620c5-f7db-470b-b24b-c399bf02ad7a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c91620c5-f7db-470b-b24b-c399bf02ad7a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 874b2f82-061c-4733-ce81-08dca74dee4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?76J3aIUGSc8fOcYWWHdNprMQRpf1QaV1WhnYs5dHsS6ph8weLJMgTL3goNM4?=
 =?us-ascii?Q?Abj+Idr2ltkQZO1Ud3kOobXIbfWqb/Pa6VAy7+btSCC0FkfKUKTFmtXOcOzw?=
 =?us-ascii?Q?7uiDHVpBXMy7ZL9Ogb6tQ5Kx9akX2fQAmb9dMLDg1KFmg4LVWAgP0gKCNNR+?=
 =?us-ascii?Q?Ltza/5piaGL7yq7qAO7CtpYFJ4NzGQBwdZN49mm5tsoIQaK8vwaYjUNeWujg?=
 =?us-ascii?Q?E8KBw1FvXScZOFpUkkqsRz+9lAr+0fBQbIX/wXbVwUnlNN7j7Dqea9k1G/m3?=
 =?us-ascii?Q?y/gLPB3JbOfcthUwIQqWPu9z54AI+GuQPNJq5XVihUPv+q9XGyJ6j9yAbAiY?=
 =?us-ascii?Q?X5073tK0UC5dxf+BvFFVYYWsZtMxDFo9tr6oj3+wyWuuxdij5LOWZRZu9OQO?=
 =?us-ascii?Q?TI+rXS+syHAlWOtcTQkqaeEWFQucz8gaZjYc5hC4gcYPbn7ffisegZkmiYg0?=
 =?us-ascii?Q?kdVBM60DgzYQp9S+aDskBO9oasp7FSIlE3e98bQn4lTPtWoxHA7+c3GxjZlt?=
 =?us-ascii?Q?DoKf/0sd4dEAr1OuT+MOLVbQvsxW407mresGVUjVlkd6i8duJJ+bRwA9aRv1?=
 =?us-ascii?Q?wi4Mx134Ju2GC7Cc2114D/fEOofPfMFR3XEWBIu6h6sirGz3sv1Hdp5YsUcE?=
 =?us-ascii?Q?vRTwgczqZCB5ivlMtFRXO8EjtKe90p1vIRDcXqZh5nzgkZ6fqGl+OvjTsFOi?=
 =?us-ascii?Q?HOpaXjkLrhBOU5J0PFD5bHvR15j/crUFahs4eJRvYy5M3CQuXgYP5MLGQLpN?=
 =?us-ascii?Q?QyNOhFmdpNDe7K6CfR6VOrGZh0+/qhpLA0tFAG11LV4cn7iv+vpH3FGzx6B3?=
 =?us-ascii?Q?nsu7cghi9NWNpT5yFb/FCpvGlzKRB+rpQ0tTXvBpJUJnOuCkjGd4o/sUxIw5?=
 =?us-ascii?Q?hP8VxLvTaj0oIgIJyf8Fy2eRzqzy4wRcclMITBlqROp+M3OfVfgoCpEJoEgQ?=
 =?us-ascii?Q?fFoaFZUIoOrbZQ9cDRYrEhOVP7JXXY8qMQ0YPhal9+bK5vrux9Ixsd1UoAet?=
 =?us-ascii?Q?WuEXznqmDmfyfiIM0d8+47Ln26HhXlZ2uVktTBN6hEXGWlFKSy0r4GMK6fnH?=
 =?us-ascii?Q?oWyN+4DkoJ/rBgQZcuARG3Ak7f90M3t2mlWwzPPFuelg2kiGup/tpVSOe/zo?=
 =?us-ascii?Q?N/0F/QfCZYFus3cXTaU/uUEFYN4sJojc3oyoaBzds7K0eA1FNTGyOyRhc+ez?=
 =?us-ascii?Q?Ov8abnn+uHpsuXRotd28HJxNRfG7BVPGQnv4nnll3eehZDkdG1BFrdlHVR5Q?=
 =?us-ascii?Q?aJYCLPrSgSkk/LeSLUn8JhiAvEQv2/e/tz9GTO43Zs7ApEOnxn4utswRNZm4?=
 =?us-ascii?Q?GA2CsAg6DEjD3hKyEYcj6QBSolUfijhyGmvoWr2PgrQvpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V7hlwQrg6/i1OHelzyayiSl9HPYPAc7/RAKUyn0+bYRsUi0I3oCbGC2lLNIR?=
 =?us-ascii?Q?lPxGB0653v85qXkFr14BMbBa7plBoDdF8M410Qe2gPztmUEZ5bMeyay9oA4B?=
 =?us-ascii?Q?ajpiPxUlGclNszbTvAgx525BKL46XI62tT2+trTAkZtMTn7qDFndcpXqj7qU?=
 =?us-ascii?Q?h5KsAkLdNATxY8v5teZbO7rs01SztIQJiRHJKj7XPQUAPuX58NdJSKwfl0lc?=
 =?us-ascii?Q?Cfljm4u+0pn8KgP4kNdgTswSIlYCP9yeNIJjzKRfySH/8D5TkG7gMT51l/tw?=
 =?us-ascii?Q?vaT8TLLUMuZmtmNI1OSg1sF8T4oqNlIGip0Okoh+iLuYr33amfIlNqXeIsI1?=
 =?us-ascii?Q?cxNYQlRi9yF+Dmv//zY/y8zZte7Dulqy7BZj/GrKg4sIXelNA6x6pyBQtXQu?=
 =?us-ascii?Q?cAHwxlgRGQCO0uFYDiZzNeTB+GtBm/oI16f/O+t6JQl66G6WGFeCihQNDuU+?=
 =?us-ascii?Q?LNbtDGyed6V1yyTeCyYsT+fqPY+JOnXorKcDtWG6IDu8+5KD+KCErO7tsRhA?=
 =?us-ascii?Q?uopDqrz3b1Xu4IQtNJNlsn3it5iG3coyW+oqIwLP1zByxEWgZxhMXZFYWWnm?=
 =?us-ascii?Q?g9683gmZ0VUUtccoG6Dy99FT3nPaSaMz9w0Oq3pUMnQXTlQIk/eSnSqnt/Aa?=
 =?us-ascii?Q?HBrxp06RVvsHzo8v/5+H53QRufI7boTbPz3zY7codaqA/nqUU20CfrFXkM0p?=
 =?us-ascii?Q?WBIKipf+Sd+VNdOOdrHDsW9z1ZebdBY+1v5/aLD9WXrgJZNnjo9NQXWjWKUi?=
 =?us-ascii?Q?Rn/+KLLzz14ecdfF0jpVwLtt9MAeV1MwRrvAF+hJXh/G9klAnbHoq5OCpuvE?=
 =?us-ascii?Q?XOLnZbyU/I/1Fnq3ZNMxgfN+qZ57cUgcXBmcF+9Qeb5DPaIG+7ebX9T79Jpx?=
 =?us-ascii?Q?poDuZG86cG/tMewVkDYmp2/GQiWHVtsyHjpBvtl/0sDg9YEFhLf8rzL0heXb?=
 =?us-ascii?Q?KjSJlWrK7JvZiv8cmLYqx+3+gxqZ1ZSGpDDK29J2dOpf6ThxA/InOUcVjmXx?=
 =?us-ascii?Q?EBGNJE1f17ZnbfUXIT6lCIN6Omcz16Bx3jAFZ+7TKzUIca/ivVO4O1Nq96Oj?=
 =?us-ascii?Q?bKBEi1aQST0z8SW+hY3eM2q2qXkWwUf2eZ+m7COV6+6p8lik2vrcsdB8qgvq?=
 =?us-ascii?Q?vRWvy/+doE1Sb0wxSPkIUgwFoR8kKX+nLbgjQn22gh00FnmO5IgiwPQVSRFc?=
 =?us-ascii?Q?hUqRX4imbHp1MS3EOeanpsRgmhl3TUU6pU+Bq55CdAfGWH/NbIggH7moBp2J?=
 =?us-ascii?Q?zBj2SgIsRa6iE+SbgMRXWx6YYQ9MolUy9BlsOJPAo92lhcVxP+8D3AD9WI9e?=
 =?us-ascii?Q?RGlrn/Bl77HM0MoPZiH7lZeGiXlDMtNUAVlVa/pKXKTTnzM4VVmhqiVzYcPd?=
 =?us-ascii?Q?EMpD2Y71q95kKzMvFdmJf9Mqwpxuq5gt6sYIJfh0wXHo/I+qhg3fCs6lcfJ2?=
 =?us-ascii?Q?oAjV/Xenp8ZYaEik0RirouL+gTy2sywNvOIx3F4OQ3ROPbd541oaa2e0BFiz?=
 =?us-ascii?Q?GcxLf0Od0iPRIjZHk1+bNhz1WfYpdfVXg41EpQzKJ4e1XsS+mEXRhSguRyP3?=
 =?us-ascii?Q?ufVAhl2OS8jRIZXizILfW6MbMdCo6QvXDiel64nWDxMucWTPYY5XEiUMao1k?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 874b2f82-061c-4733-ce81-08dca74dee4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 17:20:33.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7L+zfxQP1P7KzzVggBO1YY4PVGQheTMAvPTMtvu5GXRTyi24aWa0LlOS99XfSI/nXMkGIZmt11gF+I4VpsZdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
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

On Thu, Jul 18, 2024 at 06:12:10PM +0100, Matthew Auld wrote:
> On 18/07/2024 16:52, Matthew Brost wrote:
> > Take PM ref when a G2H is outstanding, drop when it is received.
> > 
> > To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
> > to be held when scheduler messages are pending too.
> > 
> > v2:
> >   - Add outer PM protections to xe_file_close (CI)
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c     | 4 ++++
> >   drivers/gpu/drm/xe/xe_guc_ct.c     | 5 +++++
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
> >   3 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 06cebaffb451..b68ab474e1a0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -101,6 +101,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> >   	struct xe_exec_queue *q;
> >   	unsigned long idx;
> > +	xe_pm_runtime_get(xe);
> > +
> >   	/*
> >   	 * No need for exec_queue.lock here as there is no contention for it
> >   	 * when FD is closing as IOCTLs presumably can't be modifying the
> > @@ -126,6 +128,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> >   	xe_drm_client_put(xef->client);
> >   	kfree(xef);
> > +
> > +	xe_pm_runtime_put(xe);
> >   }
> >   static const struct drm_ioctl_desc xe_ioctls[] = {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 7d2e937da1d8..560f7e4bf290 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> >   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
> >   		     state == XE_GUC_CT_STATE_STOPPED);
> > +	while (ct->g2h_outstanding--)
> > +		xe_pm_runtime_put(ct_to_xe(ct));
> >   	ct->g2h_outstanding = 0;
> >   	ct->state = state;
> > @@ -501,6 +503,8 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
> >   		ct->ctbs.g2h.info.space -= g2h_len;
> >   		ct->g2h_outstanding += num_g2h;
> > +		while (num_g2h--)
> > +			xe_pm_runtime_get_noresume(ct_to_xe(ct));
> 
> Could potentially just grab on the 0->1 and only release on the 1->0? There
> is a device level lock being grabbed in the rpm code on every call, but not
> sure how big of a deal that is here.
> 

Good idea, that should work. Will respin.

Matt

> >   	}
> >   }
> > @@ -512,6 +516,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> >   	ct->ctbs.g2h.info.space += g2h_len;
> >   	--ct->g2h_outstanding;
> > +	xe_pm_runtime_put(ct_to_xe(ct));
> >   }
> >   static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 860405527115..993d0344dc88 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1402,6 +1402,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> >   	default:
> >   		XE_WARN_ON("Unknown message type");
> >   	}
> > +
> > +	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
> >   }
> >   static const struct drm_sched_backend_ops drm_sched_ops = {
> > @@ -1492,6 +1494,8 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
> >   				   u32 opcode)
> >   {
> > +	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> > +
> >   	INIT_LIST_HEAD(&msg->link);
> >   	msg->opcode = opcode;
> >   	msg->private_data = q;
