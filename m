Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3DEC05052
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 06:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FE189A1A;
	Fri, 18 Aug 2023 06:11:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2EA89A1A
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 06:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692339113; x=1723875113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=963cbCps3FmW+e8nQTuqcac6sNnBT6/+08risBHt0lE=;
 b=YSKGr/f3+FBoK2Rn1zPs3HDDhMQRXO/qRY2Wy7dUyAIWlchOU3y1JXgY
 5yg958/4BagLR6JtYUXoJUTmC9L800JrAQLhfExXc+QJAZe7pCUC4FzFe
 c6ilTpCW1qVN9VwRA+OQiEJVD1rTi0UVM5aj/l4QX1KICceCJCj3TFzPn
 34c+WQHt1tXyWhgSZgxv6pktBNvOQOtt00eiCSmj6NNn++D/S4vu35/we
 cgPaV24WPSkbUG8orcercvBN8lAg5nNtcdUeRS7RIlsBXw/eY3eOpksep
 uyoJLlrqmfIzcm+jnAkBf87jKmDLd23F2hfidxkBoxT85+rM24PZ1qYyO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375801827"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="375801827"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 23:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="1065618783"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="1065618783"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 23:11:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 23:11:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 23:11:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 23:11:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 23:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNuAEEG3auLpIM7gO8hpZZYV5/sOLjd65vKlXT+GCq5FS+uGnXFQDC/F/olr995ywjKZvw1252L1bJMH2IxGmQEP2xtOc5JWt0SJNklw0VWyHke+yoRuZsIsS37BHsZ014vuIoww1k5+44p6UXTsha/8odWqLASpkoI2ol9XUVR8a8isYk96LFJcY7jRWJ+wzEeT76kgdKJIiv8m3VErd+Ded5vijL8xM4xVvJh3lAbY+S+k07NvGs7OPhDGusi5cKa9L9IW6VFZMxX++ALXXWVdQZn8PB+5rN0GKyFMf5rrJl/nFRM8pN63ZQN4kVT7z3XxSqpusjo8KusLMkvbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWc8GvzFtjN7Ew5LSKdQ+Wn/iJoW4L04nnfeE1258jQ=;
 b=W+YXvn0mVrinat3y3L+ONAWe+tDSRLHS3aZKOcg00aUE4ElIgot75QmW3Af0r25h6sVkiFPgWTuI9UKFPop+TI6nqyidnAm0CvGpVA9uVKyyNKXd2Bje5B/MXoPkWQxVY0Tbbo4mnFMXd/IBxZaTzzUGmSxghKHghBKnSIdjamHJYi8IxnC/VyTLAXfhwEAeOfHhIE9V8rhlUYaZWdcW9cm8A9CMe75Xs8/9ReQGbV2DitUeXPje5UV12RDH4x4e9/AsBKUcSAG9RL1aTq7UxMLaZnbb8gNFwK5d0N9ep1FlCvfH4Cb/4tB49vU3gGzhUNdzChXXgSEifInerUzIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 06:11:46 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 06:11:45 +0000
Date: Fri, 18 Aug 2023 11:41:33 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
Message-ID: <ZN8LlSjG8edNqKJi@bvivekan-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-4-lucas.demarchi@intel.com>
 <ZN1Naiw9LLTxVVLR@msatwood-mobl>
 <ogbz7rqkordg6ogfy4efgnboux47bcrahds6hyestku2f6hdzk@6cqh6le33vfw>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ogbz7rqkordg6ogfy4efgnboux47bcrahds6hyestku2f6hdzk@6cqh6le33vfw>
X-ClientProxiedBy: PN3PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d91829-5e8e-4604-d63c-08db9fb1ffd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXSm1szMqxNA5Jw2Ukrytiq2e/j51pzo16FucTj68E8nP7xWz98hFqo5Kp3FPRcI5nCbNMbWZm/l9iklM+O1FWUBYGrQzspH5OMmtJVa7uqBkN0O92EpNyA5Cv4MQ3ZlhqJ0mbYPObk5iU8RB+1eIrebND/0rgGfYfWb+PPMjID9Cu/9gIRDVraBfNYmxZpWk/khUHLwYQY10en8gE2jaNZBzzTUiQxVoqnXOhqsT9NxgrmUZpH3sBBZdkFUL/1q2ands5qXa6nl3dE5uM58yu50oMKsYgY2s21pQ68omhQbHFUBZzT5CnOptefZyqzcPkaSZhuHCxyizxzX37o4Uxcch2KlYyiZPGDYpROAx7NuqZofDGOVlAnGvd5GQKtz+Rnsv1pBDmvyamACxGjkHWFswIRIqIibNYXaEaDWMCixtlf4SFgUvcR8xCO7X+dN+1PfB3jyvHRJNhYiy2oXUXZzmzxptgKwqnfjyKBTaVGsXCKR0bTBEQ9PxY5JbrrPgIndeble1qlc2pEni8qYQMAr2LIAtaRS4g8Fp6KBpnjlq32ktZ9TsoPvbIHX+1IA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(86362001)(82960400001)(33716001)(38100700002)(5660300002)(44832011)(66556008)(66476007)(478600001)(6506007)(6666004)(110136005)(6486002)(6636002)(316002)(66946007)(53546011)(41300700001)(9686003)(4326008)(8936002)(26005)(6512007)(8676002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c216WVFsOVBVUXhiTnoxdXQ3M0toVE5ndmRERnpNUmJhdEFYWmhSZ2Zkd1Rq?=
 =?utf-8?B?KzZqTW1vdElIY0tXN2sxbzcvektPcENiUmhDSFJoSlpuM3VqdmN1a0NGZG9E?=
 =?utf-8?B?ZDUvOWpXZWZHTFh4NVBXdXQ5bjF3SGl1dExtK2dnV3RhTEkxNGVqNEU1NC95?=
 =?utf-8?B?VFZ3Z3FPV01UaWc5a1c3Y3JnM0NGQWFJWlg1TExIYzR4akxMQU1UaWpWbURT?=
 =?utf-8?B?S0Y3dGZweTRXMWFBRGp4ZWtoUk13UzA4MktyL09Qa3l4VUhaY2RWMG5jdnJ2?=
 =?utf-8?B?Mm9WOUcwTzJuWVFGZXZ5NnQ2TEhwdFROR1pCa2NJQW9KcWJscUVxd1h6Q1VY?=
 =?utf-8?B?MCtMcSswQ2VwRldRKytFbkFMMWNUTUxodW9Rck9BbURta0drbUsvbk9PclJY?=
 =?utf-8?B?V0RwUEZsQUtyMER0MWFKWFI4SHJzeFg0bGZRZmdJUVZzVGM1aEFiT0dLWEJu?=
 =?utf-8?B?c3pmNVRhVmpwZUdxZDl2NlB5TEJPUHd3RUh0Q3RIMER5UlVOSE93TFFrdHhI?=
 =?utf-8?B?OVpmMWJqOXpwdnFGalozWktlc3VDTmpDRTJRQ2ZEWkEzTDB1aGdXcXF3L0RK?=
 =?utf-8?B?NUNsejY2NFc0QW1TVXdSbGFZeTZDUGpqRzhJQ1FCUysvSUNJQWk2a3hzb2xF?=
 =?utf-8?B?RXV4ZWsxS1prR2tMazlWajh5US9MRGFFekxDNVZQQ1VtRnFCc3RpSDlZVXJ0?=
 =?utf-8?B?S1d2N0tReHhRU1J4Q1pJQ1FQNjNyL2pESGNVTWxIV05qSk8zdlVqMXU1NThi?=
 =?utf-8?B?LzRSQkxvSk1RU2thcUw5Q3FmeDhGUWZoUVlFUHVYWXlMQU5hT1lReG9ySGw5?=
 =?utf-8?B?Vk9laWxlNERQMzRvK2kyTkZ4WlRpRGl0VDllT2NGUmE0c05mOExVYjdSVGpt?=
 =?utf-8?B?WGcrMDFBSkNneGRtMGY5SlBKTEwyMGlkM0x3NXFXeXVpUVgwNHlMSVhpUkpq?=
 =?utf-8?B?MEZGZXllNncxOC9aWmFEMzQ3ZjhTQVpMY0d6c0R6aS90aGk2cnFPb294RFQv?=
 =?utf-8?B?bzNlUVZ6LzljSFB5cm5GTm9VTDVQcUpCSHM0bmhzeTFUTHNnY1pLSVFFc0ZC?=
 =?utf-8?B?RHNjeFIyaUF1NWNjZDJFQStPTmhoM0x5SmZBUWErbjIwZG9HYjJCdUQ4WFRq?=
 =?utf-8?B?SDREMm9ZUmNCVjR0NlJTSUZaVE9KNUxrV3ZkNzZnMTkxV2FmRGx6NmdiSWNK?=
 =?utf-8?B?VnFpU2orbUxrT1hlWGg4Vmo3YXV3YlRSZXJGcWJvVWVQOXZ1WVVnMk4xekVl?=
 =?utf-8?B?T3p1WlVnS2xheVFkV1JNMEtEZXk5OUY0TUZidTBoYlN0c2xneHNzclQ3NEZh?=
 =?utf-8?B?TkczdWgwZTM2WDFzYitDdFRXUWtWVENMeTlnS0RkKzVsR0Mvck5JVEJoVmFQ?=
 =?utf-8?B?UUtOT2ZyNUsrajV5WGhjTGNOQVZLcC8yTWc3RHF6UVVMSXM1K2NDREtLWUFp?=
 =?utf-8?B?ZnUyc21uTG9IQ1VZbnAzaFA3c3FXdXREQ1A0K0NVWkxsUlJrY3oxS0pjN3li?=
 =?utf-8?B?VkloOERCUHkvWCtTTFlLSnNMYkM3aXV1UzR1UmxtM0dmQ3ZET3JEMXZBeGZz?=
 =?utf-8?B?UUFoTXVGZ25JVzBRbXNuQ2pvamVRcG5WRTBXdVRwVjZmVGZZZmNZVVhSbnNx?=
 =?utf-8?B?SzR4cm40Z2NCZFFqWGVEdXRjdW1RUUIwMS8xQTU0NGhCRjVpZzE2WjRVTm8z?=
 =?utf-8?B?ZXdDVk9say9CbXltZGo5dXN0VkZBbWdmaE1GSGFLMjhQQ21GWWQ0YkdIRllQ?=
 =?utf-8?B?aDdUbzdEdmJUN3NqbHNKTVREN25mQ3J1emJ5N2Y3MmV1UXpHbTlLVzArMnox?=
 =?utf-8?B?aUdhMHpaUE5NQWRuUy9BSWxtZXJ0eWc1YVFGam1VdmhVMTd5SG9GdndGV1Bj?=
 =?utf-8?B?c2hqZXF6U2JSMUJKOWcwcWNWZUdvUUlIV3NsOG94QnhnUStQc0ZWZjdOWFZv?=
 =?utf-8?B?MTNJT3VMTkJMRjJUOG9IKzM3T1VJRVorT0lRMWVUTXY5NHl3akpzcTAxRVpZ?=
 =?utf-8?B?UE9NcERzN2t4OVIvUER3dFZTUVA4UGhwSW5lUEUycmNmMTczL3ViUnNLRWRn?=
 =?utf-8?B?VXY3bkhib0FxeFpkWkJhaGpQaVo3OWVNK0J6dVg2Z0Ftdm5CcEFsYkNiRjh3?=
 =?utf-8?B?RkVhT2pxd2ZHa1NhUUJxeEMxN2FNdEgvdUMxWDVVYTh1UHJRWllJdm5XeXBG?=
 =?utf-8?Q?pfjRQTAUQRU+LiRuDQVxVV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d91829-5e8e-4604-d63c-08db9fb1ffd0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 06:11:45.7078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfCFmatfHsbuU+hXzk9fvK3FYLmp+4t6e0GmfrAVngLp0TXkTDz/aLAKYJz2ghl78G+05LbroTMcH90cbJz7N4GRwqA/g9+BnmntPNy6Cg1qimG1O0Rs0/qtx+hy2hvJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/15] drm/xe/xe2: Add MCR register steering
 for primary GT
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 17.08.2023 07:47, Lucas De Marchi wrote:
> On Wed, Aug 16, 2023 at 03:27:54PM -0700, Matt Atwood wrote:
> > On Fri, Aug 11, 2023 at 09:06:06AM -0700, Lucas De Marchi wrote:
> > > From: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > Xe2 uses the same steering control register and steering semaphore
> > > register as MTL.  As with recent platforms, group/instance 0,0 is
> > > sufficient to target a non-terminated instance for most classes of MCR
> > > registers; the only types of ranges that need to consider platform
> > > fusing to find a non-terminated instance are SLICE/DSS ranges and a new
> > > SQIDI_PSMI type of range.
> > > 
> > > Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
> > > for some Xe2 SKUs.  However the lowest bits are always valid and only
> > > the lowest instance is obtained via __ffs(), so there's no need to
> > > complicate the masking with extra platform/subplatform checks.
> > > 
> > > Also note that Wa_14017387313 suggests skipping MCR lock acquisition
> > > around GAM and GAMWKR registers to prevent MCR register accesses in an
> > > interrupt handler from deadlocking when the steering semaphore is
> > > already held outside the interrupt context.  At this time Xe never
> > > issues MCR accesses from within an interrupt handler so the workaround
> > > is not currently needed.
> > > 
> > > Bspec: 71185
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> > >  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
> > >  3 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index ad7ae6a28caca..5bc6c7fa4759f 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -145,6 +145,7 @@
> > >  #define   EN_32B_ACCESS				REG_BIT(30)
> > > 
> > >  #define	MIRROR_FUSE3				XE_REG(0x9118)
> > > +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> > >  #define   L3BANK_PAIR_COUNT			4
> > >  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> > >  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > index 9eb7a6a1348d6..ef9f4044ca1fd 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
> > >  	{},
> > >  };
> > > 
> > > +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
> > > +	{ 0x005200, 0x0052FF },         /* SLICE */
> > > +	{ 0x005500, 0x007FFF },         /* SLICE */
> > > +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> > > +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> > > +	{ 0x009680, 0x0096FF },         /* DSS */
> > > +	{ 0x00D800, 0x00D87F },         /* SLICE */
> > > +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
> > > +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
> > > +	{ 0x00E980, 0x00E9FF },         /* SLICE */
> > > +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
> > > +	{},
> > > +};
> > > +
> > > +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
> > > +	{ 0x000B00, 0x000BFF },
> > > +	{ 0x001000, 0x001FFF },
> > > +	{},
> > > +};
> > > +
> > > +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
> > > +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
> > 						^(4200->43FF reserved)
> 
> This is intended so we have simpler ranges to lookup on every mcr
> register access. Intention is to keep the table as small as possible
> without causing issues.
> 
> If it's reserved, there shouldn't be any access going on and we can
> coalesce the range with the next ranges. Explicitely leaving out the
> rsvd range would benefit debugging as it would automatically create a
> warning when accessing such a register, but I'm not sure it's worth it.
> Matt Roper, any thoughts?
> 
> > > +	{ 0x008700, 0x0087FF },         /* SQIDI, MEMPIPE */
> > 8700->87FF is SQIDI only, to include MEMPIPE entry extend to 887F.
> 
> ack
> 
> > > +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
> > > +	{ 0x00C800, 0x00CFFF },         /* GAM */
> > > +	{ 0x00D880, 0x00D8FF },         /* NODE */
> > > +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
> > > +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
> > > +	{ 0x00EF00, 0x00F4FF },         /* GAM, GAMWKR */
> > GAM starts ate F000, EF00->EFFF is reserved.
> 
> same reason as above, we don't care about the reserved "holes"

I guess the above range was calculated without using project filter in
the Bspec. After applying the filter for LunarLake, the range turns out
to be

 {0x00F000, 0xFFFF}, /* GAM, GAMWKR */

Regards,
Bala

> 
> thanks
> Lucas De Marchi
> 
> > > +	{ 0x013400, 0x0135FF },         /* MEMPIPE */
> > > +	{},
> > > +};
> > > +
> > >  static void init_steering_l3bank(struct xe_gt *gt)
> > >  {
> > >  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> > > @@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
> > >  	gt->steering[DSS].instance_target = 0;		/* unused */
> > >  }
> > > 
> > > +static void init_steering_sqidi_psmi(struct xe_gt *gt)
> > > +{
> > > +	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> > > +				 xe_mmio_read32(gt, MIRROR_FUSE3));
> > > +	u32 select = __ffs(mask);
> > > +
> > > +	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> > > +	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> > > +}
> > > +
> > >  static void init_steering_inst0(struct xe_gt *gt)
> > >  {
> > >  	gt->steering[DSS].group_target = 0;		/* unused */
> > > @@ -280,6 +323,7 @@ static const struct {
> > >  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
> > >  	[DSS] =		{ "DSS",	init_steering_dss },
> > >  	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
> > > +	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
> > >  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
> > >  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> > >  };
> > > @@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> > > 
> > >  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> > >  	} else {
> > > -		if (GRAPHICS_VERx100(xe) >= 1270) {
> > > +		if (GRAPHICS_VER(xe) >= 20) {
> > > +			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
> > > +			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
> > > +			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
> > > +		} else if (GRAPHICS_VERx100(xe) >= 1270) {
> > >  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
> > >  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> > >  			gt->steering[DSS].ranges = xelpg_dss_steering_table;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 48fd698ff62aa..d4310be3e1e7c 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -55,6 +55,7 @@ enum xe_steering_type {
> > >  	LNCF,
> > >  	DSS,
> > >  	OADDRM,
> > > +	SQIDI_PSMI,
> > > 
> > >  	/*
> > >  	 * On some platforms there are multiple types of MCR registers that
> > > --
> > > 2.40.1
> > > 
