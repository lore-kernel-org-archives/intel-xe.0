Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF1C25B76
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 02:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DDA10E540;
	Thu,  6 Jun 2024 02:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqf27kg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD4110E540
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717642094; x=1749178094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BjTBRNZp16jNHqzNEz5X6TfK+z63b0iPPXuaOjqk/fo=;
 b=iqf27kg5fs7rLJ9gV3sH6E7zDk8nihYNkcwLvGhyumm9wNVVfU0rew4B
 SJy2c6GbILQRvHDiECd39aco7+qM8NjTixPBgSMf3rO2SgNRZeDEKb6b7
 0rbtguV9OcwIg5kIxIjTmXK8CQamiJsq0wV04lcfKTauDyydW+aPhLXN2
 JGyVls3OI4OnP7Gh3sReeqAKBBe9RXu4byXc4l3Xz8B8dwxdQLRSMs+Du
 VQ7DR8GhIUnRXV9ZphyvgmyWvy91IvcsTud5OYfFdN6YK1R5WKl5SS+IM
 BKusuXQq6nz+ftineSZ2H2urerLiIAGVe4bMeoVY+DQwSc1zV/XCFfj6t A==;
X-CSE-ConnectionGUID: JNnY1WU/Se2BlIGwNlMgvg==
X-CSE-MsgGUID: fye34yT8QASg/4DfYGJElw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24945325"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="24945325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:48:14 -0700
X-CSE-ConnectionGUID: aPQjACRNRA2SlQAcAGjcOA==
X-CSE-MsgGUID: 3gr/6Ky2Tjyb1gNUgqRfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37687265"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 19:48:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 19:48:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 19:48:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 19:48:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 19:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e++ddPn1wAhOoCleid4TMVO7/mbDR9UqTECB4sBg25hpeKokVvimtAWPDoBw8ntVEQlrLa3bvzwXa2KkoEq9UaX1q2owQY3LdSneJceFB33vDkYdfeSRtJJpfqayBtaoAYeZWC+oc/DUFeCVd9x0S7UU/rTFo2z/DCev+SAqxDsKQqwmFwRQJcnB6a9ivsMIcunechC7GkCPmhJzdDCgL+bMMkz66chqSAzmUOGtqWkkj0AKbd5gJ+XljTRV3Jz7avMVWK+ch/HpNpM6nYs5AhSIx7hRSxbaYDxbfgeS7iqUss0bKQBhbSEqqgTAiBd4DhXz2xjU9GA7lTs25s/Hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyR9sGgYvOwTOuQ4b7uRslAQntXe9pU5/5jq7p/vMFo=;
 b=nPRsdc3fvX+kqc8U11wIh5UM0/z5C8rGu7ve9AxYzpLggxDdV1TJvA6O7EGZIij7ssQIndRORS5wjTbNlPC3+GsBs2/DZP2AEen6/k7R1IDg04VNaqXZd5iF3ydanxHXJnuu9FwsNTpaNTosOpP2bB19Dw31hy0UGbj9j+IVxvhBkunxLf+38Vo15YaTit38C3TqBFGfiXySJ8uTJMo7ehKJuL5egYUQKQmYADILzUmU9/UPE31wlw+p3oTASrqrkVKdHB0OeK+dChsw4U/ZmSJTNB3rFejHGJE8sOqXbUWz4xVI9Ssyc6WW6GLe9dB/n3QnkwWkzzeCvMgsrL+Juw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 02:48:05 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 02:48:05 +0000
Date: Thu, 6 Jun 2024 02:47:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Francois
 Dugast" <francois.dugast@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Message-ID: <ZmEjMXSuOL36tiQ0@DUT025-TGLU.fm.intel.com>
References: <20240604184700.1946918-1-matthew.brost@intel.com>
 <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmDg8mpQ1J0lF9D7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmDg8mpQ1J0lF9D7@intel.com>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 00447be5-c428-419d-3b16-08dc85d31731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SigHKLO3jsqvGtTLNxneC1Uj/QwFkDlkM7pp20Al5cgCo/+bKUeFsOieXN?=
 =?iso-8859-1?Q?y7ntDUtyi4/AQC5egnO57UeaJlbo/BH7bisPTPKchV5/ELeVHLp2/tlx9w?=
 =?iso-8859-1?Q?yos/SqeVoo35JyiAHAjMnm+VFeCUADu8sFf0iXwKMWaz5omeZU2yFq01k9?=
 =?iso-8859-1?Q?x29yx7xJ36SIdf9J6v49JMCKOMHcq/2+kITG/RHfuIiL/y9GMpoBDjgHYy?=
 =?iso-8859-1?Q?T1RpQOvsED7xrJqVKjjkt2T/T69TtIH8aYE9pry/bQK1LNq/YIKwHPN0sU?=
 =?iso-8859-1?Q?P22+1Me6Ae+UXlSGO4jCOuzaDAGS+gLG+G9tVjHhcUFsFd0ebJum1VRxLn?=
 =?iso-8859-1?Q?2aAna+/iljl86G5BloM2F+mkyEBWGqJWxZ2VL8SahKgoXV6/JaE6AsMsHy?=
 =?iso-8859-1?Q?rCwenOo1YkFirt9Xqmhy73Ct7kCUPYLZHdJZg24ybVgi/5bTEQLIq7UKCH?=
 =?iso-8859-1?Q?4zVCjeQOYkP5IDk6mWMUfybmWq4eWotoz1y7Pl9rT2RvPnHoQkP8RZviBh?=
 =?iso-8859-1?Q?75Do9HQ27H5EWOu0jLAQvK0KHB1Yb+wejd4JU+TjL1IN+zUnX82ylgFasB?=
 =?iso-8859-1?Q?wKrgq/s4pQNJRC5ljwa0E/B3214QlZKoXQtegb1jCMVYYtJ2YOunH+bTWQ?=
 =?iso-8859-1?Q?n0i9pSxysTCAfzBJRXQDe6VPjzU3TkNhP1rNis62FAsTi+yWW+tCmnB39j?=
 =?iso-8859-1?Q?sQttZpboLtagj4vTUNeLsuV0++zGRyYgnAtIJYTpvDZ24aaRLcd8b9WcNR?=
 =?iso-8859-1?Q?3NZ5kbrrNkJKFOJjw/gu+bxcr5aD066pCZb5XQ7L5GJfHgn4NnPdxQq4Xh?=
 =?iso-8859-1?Q?G2lSRfDgeYI//AM3ibWSYqAq+GI8329IeZQKnfM+B+b37kyQoCqiQBhWYY?=
 =?iso-8859-1?Q?tm4hC0gmkHqNotBNcIuSb1OW2wgz+lBfmf8h/ckuGDOqW791hmw+i3oVCM?=
 =?iso-8859-1?Q?aRFKEM5usDIUj2XPoaL2BeiyMsTGzxVKFAmHux6UXpW+SrQ5hlg4V+S52S?=
 =?iso-8859-1?Q?EXpKy8sREhvg8GIFeSSIxruNA5Racnr0Fq16R5iokf++Q/3ImUDZKA4JOE?=
 =?iso-8859-1?Q?bymaP+OayJTih1IDiAc4QNCRZ/NSQaWVqd8tn0hoQis+5q3zn8cO2EZDY+?=
 =?iso-8859-1?Q?rfQ5K+v3kCWLpZpKt86SCJaTEq984+u/Ug+aDYItd4hkA9Mx2WiVQh4IHd?=
 =?iso-8859-1?Q?W4gQi2aJEIGd+LILG3jPiykM1/rIvmk3G1pIWj0XH5ZqQh72toe/mnFRmZ?=
 =?iso-8859-1?Q?SsrSWXoglTJ0Zgz7u7ikm6XVCwMY69wQrhvf5k2YKmFM42HY7eBSeO4e7S?=
 =?iso-8859-1?Q?+nFIYjj4kdTvt8cN595MOC+/PvbVwPas8RtnZt/vQeJNShVRxAFswqliNZ?=
 =?iso-8859-1?Q?s21rCz0omD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sUElb/ap1xsGIU0UmRK5Vmvn1cJSAuq0RCZDPZR67cLY9i+k3WprYrG8D5?=
 =?iso-8859-1?Q?wrhQ+zWTgMd8j05fnlKIeJJH5d/sK/py4sRpTyxKt5IJs0af9rls7100Nb?=
 =?iso-8859-1?Q?NYND9HI39c+bEGfrcLNfb4nYyNM3Qvh6dg/zCy2V9qYSAYOPSzJ+Z2bbXh?=
 =?iso-8859-1?Q?PKdwhpWNgciyUiESUrd2PLSHzRVgr2HS0GhRnbysDqvur5G5YR8cWCVsWq?=
 =?iso-8859-1?Q?09KXkufh0ZvZh8/uc4hOlY3dxcV51i8lJxWwBNCfjWl1ZQbeyiKv2Mqcdn?=
 =?iso-8859-1?Q?Smzpfzyp+3MEH6GNxVkrB6RwF3nPwyL15TCN8B+RozJArx242FjcqZQ5Tl?=
 =?iso-8859-1?Q?i7oe1rqWUmdjmbqf6LIjXMCqaRUnUHqwAQEnjPCy0zZgYZ3Vq6iZNo2GBw?=
 =?iso-8859-1?Q?8pVKNflRhAS8TvzUtK86uzmW+5Objih8ZMlCxoNP4wXKPhqMl/lsAkd15u?=
 =?iso-8859-1?Q?mrtjErF5C8NkWMM51Bksa+GyqgnNSzal2tQuczfeYscDJW4KoOdpg0R+sl?=
 =?iso-8859-1?Q?nTjWP1RjPQcK/E2RiSsd9wbKsWWGJ/srsmqYjLJzR8ABhBRLBfnETtQwRy?=
 =?iso-8859-1?Q?xOiQtZIgoPUej+p2+p6zYdawbLihG5lY6uZJhwqMxy1Dblx+HSG1EG0985?=
 =?iso-8859-1?Q?0lSi/KW/i116EQIseFLUBvdPdWsQP9pP3JVqAZiV05gV8mfmwADXSmVCJU?=
 =?iso-8859-1?Q?oqFo8MGFa5ynAgTAjqxlusmWxXbbwgiz71A6iSDaH2auTKGjsbJ4FXO0B+?=
 =?iso-8859-1?Q?AtEmsiqVqElrmxGzEPfqi8huDaiBRLcJW12ayJ94EopozDKQKAExLwq5fu?=
 =?iso-8859-1?Q?DatHuDuf+0UeONuDMMDBHxDkyu4d5/ynPlnF6z33R0bK0jsM3HqayQu+U3?=
 =?iso-8859-1?Q?byeXvKwnabLhapsu3kHNXp2Xxra3lRNTNlEP2O8lpf65WD7qSbCj4CXiIA?=
 =?iso-8859-1?Q?o8YsIJeKP62SjkxnyEGMzPdYdomF02wT0vsgqpnnnUGVNmi9ndzafLxzy6?=
 =?iso-8859-1?Q?9o8kbfp1aERkbcZrIKPATvuuzkm05s2+PMxerVBxYC7rERfbMp6Fx2FGOi?=
 =?iso-8859-1?Q?gWAXtboWBYL39dre+d3hOGaoFTATQDrMmywaDCDuyhcMJiX5IOVNdE4TN8?=
 =?iso-8859-1?Q?MMm/bhZQ8tzXxxVePW8Hs5NBdSklPsPcfIUiWWDeibkZixhONjkuK8RONb?=
 =?iso-8859-1?Q?TeYeLPSmw9enJ6IPcBja2E0nt+y64iZPA0cXnMHS5wmEs3LsZ6E8Z7B0KB?=
 =?iso-8859-1?Q?9pJk41e8nYiL+hCu+9QrZ0YsGGwdnEtBk4qi2wWRupY/UlqYD6U8BXx057?=
 =?iso-8859-1?Q?kBdwgyi/CzVVAH5oZYzCwslxmW//N0qN1pgHyLTyW9aad+qu3fyY4yizAG?=
 =?iso-8859-1?Q?FLYTEQuCvxVGOQFmXg/Puw8yNgIiPHxxfbj3WYhQdTZPVFfZvzvAXbTEpI?=
 =?iso-8859-1?Q?J+Lf8Zogf8dvzJgqzGKDxUE5/SRhCyR8gW/GtrGkri+UDVacdWNRPyNSEb?=
 =?iso-8859-1?Q?APe+2KfZuDgnvlPaHvMqJkJFREfYH31j0HTTNksLG8nZqK6zus8jnBXKIF?=
 =?iso-8859-1?Q?NBXEqawZ/lrRO2aZgecJsZs1ZY3mkozL1JRGx8A1hrrKrNsUCpjHW/bFtN?=
 =?iso-8859-1?Q?4YyMys7r5yLpebbWE2RRD5x5iBoGQ6rfRuqh+N3VSyNP+YZCehY+gmdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00447be5-c428-419d-3b16-08dc85d31731
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:48:05.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxByFeReZ0fhG0fPe9aqCOicqL1lboPe7OmC6JHY6nvjoDQ+4lV/CGm38QOGpnp8X0mfw/EgWvg1Uz2mnrk0sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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

On Wed, Jun 05, 2024 at 06:04:34PM -0400, Rodrigo Vivi wrote:
> On Wed, Jun 05, 2024 at 09:01:06PM +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > Sent: Tuesday, June 4, 2024 11:47 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
> 
> please prefer drm/xe/uapi: when the changes impact uapi.
> 

Got it. Will be more careful going forward.

> > > 
> > > Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
> > > in GuC backend. Move banned to GuC owned bit and report banned status to
> > > upper layers via reset_status vfunc. This is a slight change in behavior
> > > as reset_status returns true if wedged or killed bits set too, but in
> > > all of these cases submission to queue is no longer allowed.
> 
> This is an uapi change that is in use by mesa and we cannot regress.

Agree.

> We need to ensure that no user space is really using that before we can
> apply anything like this.
>

I don't think affects the uAPI. The killed bit is only set after
removing exec queue from the FD or the FD closing. In either case, the
exec queue is not accessible to the user by the time this bit is set.

The wedged bit is slight could be a change behavior but I'd argue this
is actually fixing a bug. If we set the wedged bit, we skip setting the
banned bit. IMO this fixing bug in the wedged series - when we wedge an
exec queue it should not longer be available for the user to used. 

Now that I'm typing, I realize beyond that all IOCTLs return -ECANCELED
once the device is wedged so this change likely isn't even visible to the
user.

In any of these cases - killed, wedged, or banned the exec queue is no
longer available for use by a user too.

> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 

Again will be more diligent about Cc stakeholders on uAPI changes. Let's
get everyones input here.
 
Matt

> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec.c             |  2 +-
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
> > >  4 files changed, 13 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index 97eeb973e897..4cf6c6ab4866 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  			 q->width != args->num_batch_buffer))
> > >  		return -EINVAL;
> > >  
> > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > > +	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
> > >  		err = -ECANCELED;
> > >  		goto err_exec_queue;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 27215075c799..cf45df0328da 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> > >  
> > >  	switch (args->property) {
> > >  	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
> > > -		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > +		args->value = q->ops->reset_status(q);
> > 
> > LGTM.
> > 
> > Maybe migrating over to using q->ops->reset_status could be done later, and
> > instead we could just check the EXEC_QUEUE_STATE_BANNED flag directly for
> > now, saving the change to reset_status for a separate patch.  That way, we'd
> > have more room to justify this change in the commit message separately from
> > the one made to the EXEC_QUEUE_FLAG_BANNED.  But it's not strictly
> > necessary, IMO.
> > 
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> > 
> > >  		ret = 0;
> > >  		break;
> > >  	default:
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 18d8b2a60928..f0c5f82ce7e3 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -70,18 +70,16 @@ struct xe_exec_queue {
> > >  	 */
> > >  	struct dma_fence *last_fence;
> > >  
> > > -/* queue no longer allowed to submit */
> > > -#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
> > >  /* queue used for kernel submission only */
> > > -#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
> > > +#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> > >  /* kernel engine only destroyed at driver unload */
> > > -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > > +#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
> > >  /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > > -#define EXEC_QUEUE_FLAG_VM			BIT(3)
> > > +#define EXEC_QUEUE_FLAG_VM			BIT(2)
> > >  /* child of VM queue for multi-tile VM jobs */
> > > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
> > > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> > >  /* kernel exec_queue only, set priority to highest level */
> > > -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
> > > +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > >  
> > >  	/**
> > >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 47aab04cf34f..4464ba337d12 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > >  #define EXEC_QUEUE_STATE_RESET			(1 << 6)
> > >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > > +#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > >  
> > >  static bool exec_queue_registered(struct xe_exec_queue *q)
> > >  {
> > > @@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
> > >  
> > >  static bool exec_queue_banned(struct xe_exec_queue *q)
> > >  {
> > > -	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> > >  }
> > >  
> > >  static void set_exec_queue_banned(struct xe_exec_queue *q)
> > >  {
> > > -	q->flags |= EXEC_QUEUE_FLAG_BANNED;
> > > +	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > >  }
> > >  
> > >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > > @@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > >  
> > >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > >  {
> > > -	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > > -		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
> > > +	return (atomic_read(&q->guc->state) &
> > > +		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
> > > +		 EXEC_QUEUE_STATE_BANNED));
> > >  }
> > >  
> > >  #ifdef CONFIG_PROVE_LOCKING
> > > -- 
> > > 2.34.1
> > > 
> > > 
