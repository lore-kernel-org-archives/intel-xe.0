Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EABEC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 20:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088E10E177;
	Tue, 27 May 2025 20:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAUuhfji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093510E070
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748378716; x=1779914716;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FZ2i8J3Uz0BL4GmIGi2iEl+tMzDtjmv/hSI/acWIoBk=;
 b=BAUuhfjiRlzQmr2HsOReB0c1XP/zi1D8wdsISSchK9o61gt/SdDY4PE8
 raSwCcYjUH/4Khnxght131PQcygIDso7ongC9CFO+mYC4NpG3z36qPdrS
 UV+tI57885oWBpHtouR8njCLFuh9dCGkwLKX9jeG+Vsxf6pOHYD1Zj9q8
 zj/jLeYJ1ucky/vfzA//TjOGedSmVPboApcLJwo0e8MyNlcfi7l8MVoq3
 CR8CYnogcWSapKGEXIQZaJnKFmVoL1z/IOM/R/rsgyEEHLfFL2vdnK2QQ
 tdOn5kyjj095cfNROyfZFw8kk2VS0ERDexh0m2e6BM0O8oKjPvCGdeoWa A==;
X-CSE-ConnectionGUID: 4LojQUNDR6iSdAGuVGOYIA==
X-CSE-MsgGUID: jomHilLhT8ePFewy+8WZww==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72925020"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="72925020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 13:45:14 -0700
X-CSE-ConnectionGUID: lvdoFdjpRmuQk6rz+UCpZQ==
X-CSE-MsgGUID: 7iA38NZhSjWiyUBKIlt69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="173949695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 13:45:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 13:45:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 13:45:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 13:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI6mTcH5eGImxRbQM9HLl7Ls72o25qC95mcJ63pvIoDqj1mfXX031XVtCZDoppO7COmYMhrkCKV1Y4PBL1CQAEJch9Ct5jdO/ZuLaAkZsodWc6QEaZmRoJbVQIaNzARD4EJEfqfYhnOiO5r/qZ2aW6Pf/nooyJhjRJdEoj3R81B7PwksBuPkN0Z3kt+EgoK8flCLpj9ZXdMc9cy6ZbXAFtnzuqQ7PDN5F6htJW0AgECUWj8C1NcDo1WD3JFcegjzkK3it73dS2zN6U8WA1vXbO21enbwNxkaZVrGY3OjtXez0o8GvtPeV8Caq/3vp9u6UM/qdM+pAoq7xrFaCzKyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT7ZZhu0/2bAWYmKKG3ZinQ8XuIhZo3iZIZpo3ZtSQY=;
 b=FZv87bRzTgJcK7gDdTGRUd3wGwzTqHSqelPwfXQGcteMEfTdFXE4JbA4JM4BfmrOW3d5DLdcgIlC2UEr+qnHoTcYI+E3SgZSgvQPxmoi6wmFpoviFBXXReZBmgfa+D7qh/j2vkTxaUTXNBRNPMg1F0fAd7U1GVUw3fxEKdk5ujpcvxt4tb6dufekgFlobRdiuwUeIs8ltyz00YXyOffAfL/Ekzj5oX5A8G5v7dibYfQ9VB2+anIXhPMq7Qb6xmHpWLaWK/9n9hAf58TwF/W48BehUdYyoz9/sbuMlmcY2/8PhR6eJ49Ye590dnZu+cFj+kME6IGpCHyv1EmCb85ISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 20:44:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 20:44:54 +0000
Date: Tue, 27 May 2025 13:44:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 3/3] drm/xe/xelp: Add Wa_18022495364
Message-ID: <20250527204451.GV6239@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-4-tvrtko.ursulin@igalia.com>
 <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
 <ilqz74jidondfilqyo5csckrumcahmpqem6nxu6k3rrwuzrinj@kedmnvovvcbu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ilqz74jidondfilqyo5csckrumcahmpqem6nxu6k3rrwuzrinj@kedmnvovvcbu>
X-ClientProxiedBy: BYAPR01CA0031.prod.exchangelabs.com (2603:10b6:a02:80::44)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW6PR11MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe5fb7b-43d0-43c6-b79b-08dd9d5f55e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kMfXy1W5tug7iho93iOFgL05zd7akrwUxh76xqt437VUWgANHhDvzGecdVaU?=
 =?us-ascii?Q?7Al3LzGPW7Fa5dlVdyAWpkQS2mIEk0EPmzkSBBX5w+QVb1xcHtWZIijgdWAw?=
 =?us-ascii?Q?Ys39iCunm37hvAO1eVkPJ7cwL3DqmQX3edJSWSn9rebXaxhxZhSCDDI4z7WS?=
 =?us-ascii?Q?tWHZGyhSlQ/T4QpWkPqCEkttfSdlEMY9cUNnkdCP3k7yPMN4GN7aRVoe+BXt?=
 =?us-ascii?Q?OP94Hlv3hbXLAbMio+zFgN0YnxAVqgPVpv5Cl87pw0fxwzxR1EfzZ/Xict8q?=
 =?us-ascii?Q?8fiHEIoSeG67Fl7C/PSYz8azJzxsKGexnS0b57eDns2j4D/8xaGSbPWYzjqt?=
 =?us-ascii?Q?KaIFWtfmh2Vo2zyu1pksLC31Yu8lDLwFi4XYzoxhxBgjmWAF6FpHfn4c2gRi?=
 =?us-ascii?Q?VptdV4CDI+0cGncM7jfqHr3Gj7QnVzdqNKfDSn8D4YRRZFa+26TEJgOux7pb?=
 =?us-ascii?Q?My86LA2xZGcYJMW2I5uVNISUf+xb/HMZPFXCzMOh2Y/Wj8WztYrzCrGzMZPa?=
 =?us-ascii?Q?KERqLssYHaTbWhqLjz+VndWbCytDovo5Vu/vZhnxIm9UvrxqhR3OiUSQAbUc?=
 =?us-ascii?Q?mz5FoLOVNLHySgOVa+hQO1l04sexI+9kJgBCeU6w4wIYtQ4dKhJgNomrPEDz?=
 =?us-ascii?Q?bun4GFqaadqd5WLrze0R8wlDeUy/GydlsyCoZKfou+sIdoAhRkUkgNbZVauA?=
 =?us-ascii?Q?FFiSxEao1xMXHT+abct1r4mAmH1BY2TyRInY9UhZsiie3ncA+3+3eIJNEO+G?=
 =?us-ascii?Q?VJq9CQCDDJXyZutZbCnZFU18NhN9p32GCh4bgyEw5UO2VgVVEDplHtJWM7M+?=
 =?us-ascii?Q?+sXzBY+eCc9adbMCyuVAng/KqTILjaKtlu0KzbySMg2X0Z8dinOysVR8IU5e?=
 =?us-ascii?Q?ijsFZM0ghHxvf7Hsax+ldPEQfo4UO3Y+PJ6TJC8oywqm16KFIGxJkpcu0tLo?=
 =?us-ascii?Q?rJE5KEGARS0TJBNVaWic+5VCi5mV/BruIosguK0156C/osYy70YAZ+bKrfh3?=
 =?us-ascii?Q?DKJwWvYmlmAu4Z/PQhVkOLpZOSYNqTV38EzrIOnjwbbyKt7UXz30GIXAvAT3?=
 =?us-ascii?Q?nIL5RIL6AlItbYuqg1QJe4RQxSSRAbKUYZ3QPs7UJvejG6DjZgmKIB8ezHna?=
 =?us-ascii?Q?wo18BI1uxjwsLIoxJFbZZn3iO7mrYhvmPQfci6cyc7g0TyDsoItTABXRFJn9?=
 =?us-ascii?Q?kV1385CfWQPDM33ZRdumJ+PyvBSZKYK7Vv5oYr3gFANB/ienSmEwgvdKwQPJ?=
 =?us-ascii?Q?uE8r9UmUvaa5jzkDR/zqyfIA+rkXqU8Z8uzP5npuABJVxSOc9GyTZY8OC36o?=
 =?us-ascii?Q?nLHgRIMfCGKB9fCGgqpL7QzWnNE/27cfbIXIBhRU0k4BSvcamzq/7gsx8x1Y?=
 =?us-ascii?Q?xTctr0ePKjbFFMG5e5VJqAhzLj8CiQ5Bd2TF5o3yy7t2TSQC+tQcOuJuoRpy?=
 =?us-ascii?Q?X7d9UG+sDX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hlI/PvGqDQX9JAvCCw8o0T+/VfagBWvkDVHFXtRq78jOenBdO/J/fhDW9uS?=
 =?us-ascii?Q?nsGQ6G5sqCLHYmc9WYnJSrobWqM/8Eqq6pamTUS6biUjHT8xIw4I9XxDPaYB?=
 =?us-ascii?Q?AAyX0ScmSfCiIAtCZ9dTlxjstK6ZSjA0KLGiCc+fc+RU+j/6vxpv7tr+pMtw?=
 =?us-ascii?Q?Q7yKJISYJg7VLj+TIBQ989qC4aeK51K1zZIT5zf8TeJjkDVpZUWYKPbWlt8k?=
 =?us-ascii?Q?RwfexAIVoITPzSoAAFsjA8wzo6YtOaz2IrdQUA/Am3353vJAqNQnEoa2mmnF?=
 =?us-ascii?Q?Lx9g+ZeYiOSZXMDqk8tuMYPIYvZp2zWKZS0GiFuAePj9JErv9IeZc6/zpFba?=
 =?us-ascii?Q?ZrO4o59O5tJMtIod0qEoaY7qPPr7kURLGaAoIRKU2olhKgQNV/2mNAKgluei?=
 =?us-ascii?Q?N1l1pJqmzHrRJI11sR4pJ+ff6JluJpK6jZBS6p4nB0zRXmT+dR22BocVqnmj?=
 =?us-ascii?Q?4aPF3W6pQgEKZYYWJd70+krXuyU3osyNjI8x36m95IR2WLFUXhpBx7fmdv3p?=
 =?us-ascii?Q?mcX1vi4Ges2TE0tQ5b7XN9gSjzzEd4wPkB8xsUemMfpFIn+zp5HC0ajcL69V?=
 =?us-ascii?Q?X42uSo89zrLt9eyLVIiejUrYWM9FezHFiBemZGY3zLkdb/ABDw/xgVjJyL+E?=
 =?us-ascii?Q?rVxOq+xIo2JcurUagcKH3EuDYwq1N4yGs/bdm511DNa8sdwZmyzyqDXglRPj?=
 =?us-ascii?Q?kVFmT3Pdu3sBFJ+hpr0DVRvOJfaeKAM9cE6BH7dHUIcJICopiwzIRmz293Cd?=
 =?us-ascii?Q?iPxScrrZ7qByPHIgwHXW6K0y8F+nTGb5764RuLVsDn1vBLmTVkg1/2oyIzp2?=
 =?us-ascii?Q?jxOTJibQDzrmfKWo/3wrXZOpdvWrSqwE7kR+if4Sq+oAv0ulqI+qpBuc6oHQ?=
 =?us-ascii?Q?KMlqdz2Rd1Ou252TW+uaxZLf3Awf8/mv2uqJgQZzP5XxVLcklC4PxRRf8fCG?=
 =?us-ascii?Q?aEqoTlSf3VFtZVGlZPvy/KQyB2ndg254MZqF1hOXA598l65fluFKSSWWJpWV?=
 =?us-ascii?Q?in0Vv17POLoTWwk+aH6J5Lgg8G3gVNnibK7UIqz78cprU/48uBUUuijhjqaO?=
 =?us-ascii?Q?q9WigZM/9kSze2JrKC8mkDkjikW6xkKQeWt+TC0N0+C3kljJP27YROlfHwDI?=
 =?us-ascii?Q?SDP7s30AeSRqkseUNXMEy/f/lnqobWLjMR4FO0kalaURY5KcllN/rKPgTyTQ?=
 =?us-ascii?Q?P3jT9uEnF5MnPHnVNJ8P30zBJMET/Z4vRFWfGQb+LJrp+RRP6HjtxgnXZ4mW?=
 =?us-ascii?Q?jIbxC7FkTE7P4Pso7mxeVYU8Jj/L50pisBoBiTr8nxVLQPdU8A+NHoA7NGRq?=
 =?us-ascii?Q?zXmsxcZykIEMOb2zK7GZVKf6/sKui/hlJjfXx6Wms+A2xmGm2yQEq72xNqZE?=
 =?us-ascii?Q?72Eh+TUODfZeBRDxzlIm+kCEUL3W3pbj7Y23rRTSU0ZmXezsLbQtTKUqv53f?=
 =?us-ascii?Q?yXomfoAyYBfwnQYKBi7oP0bLKnh8b8pQ8kRLFJgOlUe6OaHCoJi6h/DScTv2?=
 =?us-ascii?Q?kNuWgfW+U2y7mFHjf+nknZD78K6WcZ9Lxja30WQAHq5gx5nyHwyhggZHy/Bq?=
 =?us-ascii?Q?5hvGhd4VoFyg+8Co8eAR/Hc1zPyca13WTFoow4xOUx+8AKGOft6K3ZZkcyaf?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe5fb7b-43d0-43c6-b79b-08dd9d5f55e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:44:54.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zQgGSFFuUTDPK5e0ieKUedKlifm0Z0xWCgek+KkUU0z5tHEaBOUwTr+eHnaKD8mVqE+cKWoK8U0xLI3i0DWFfwesp5boDw8mPnlXSKkSfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
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

On Tue, May 27, 2025 at 02:05:02PM -0500, Lucas De Marchi wrote:
> On Fri, May 16, 2025 at 12:06:50PM -0700, Matt Roper wrote:
> > On Fri, May 16, 2025 at 08:44:12AM +0100, Tvrtko Ursulin wrote:
> > > Add Wa_18022495364 as a context indirect workaround.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_lrc.c              | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
> > >  3 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index d1d2592e010d..94d778d5425d 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -112,6 +112,9 @@
> > >  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > >  #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
> > > 
> > > +#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
> > > +#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
> > > +
> > >  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
> > >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 6022068ce6b6..9a07fc6d78ab 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1028,6 +1028,15 @@ xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
> > >  	return cmd;
> > >  }
> > > 
> > > +static u32 *xelp_invalidate_state_cache(u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> > > +	*cmd++ = CS_DEBUG_MODE1(0).addr;
> > > +	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > >  static u32 *
> > >  xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >  			    u32 *cmd)
> > > @@ -1037,6 +1046,9 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >  	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
> > >  	cmd = xelp_emit_restore_scratch(lrc, cmd);
> > > 
> > > +	if (XE_WA(lrc->gt, 18022495364))
> > > +		cmd = xelp_invalidate_state_cache(cmd);
> > 
> > This is another one where the official workaround description asks us to
> > use the per-context workaround bb rather than the indirect context
> > workaround bb.  This register is already part of the LRC, so which batch
> > buffer gets used determines whether this extra write will happen before
> > or after the standard write that would have been part of the LRC
> > restore; I'm not sure if that matters or not from a functional
> > perspective.
> 
> Does it really matter considering this is a masked register? Doesn't
> that mean it could just be implemented as an LRC workaround ?

No, I believe this register bit is a "trigger side effect immediately at
time of writing" bit so the goal here isn't to just get the value into
the register in general, but to actually (re)write that bit an
additional time during the context restore.

Reading the internal details that aren't in the final workaround text,
it sounds like the underlying issue this workaround is avoiding is some
kind of race between RCS and POCS.  So in that case it seems like the
whole workaround probably isn't actually important on Linux where POSH
and the POCS command streamer are never used.  


Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > +
> > >  	return cmd;
> > >  }
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > index 9efc5accd43d..a32f5ee9e917 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > @@ -1,4 +1,5 @@
> > >  1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
> > > +18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
> > >  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
> > >  14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
> > >  		PLATFORM(DG2)
> > > --
> > > 2.48.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
