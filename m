Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E5EF3C25E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 13:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA8B10E4F3;
	Mon,  9 Mar 2026 13:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcZ12m2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6110E4F3
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773064463; x=1804600463;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pDp/Jl6QmjDztlWMeT9k9Y1d3lsexHulbUcenQRYCSw=;
 b=LcZ12m2uQHvXTk9MOX2JMQHbVJ3qQOLfYQJrCM9dCkRhrrjJg5yhxuPZ
 wR71Yq1VUH7qQrxb4rA0zYVAfo9oSWVsHDatqbfe9g8y9cPzDt4POKBzB
 u617Dz8+O0ZnDCM7SFJSy6Fkg8Hj83Dz0YF1NO9MQzirTNBKLmmMX682S
 NIiQXxrRSrvU6vaTjp3UKIwvl7l/SzybmA71o60sY+om1LzMUubwyfdj1
 Vpj8een5daEwHTex/GAlNZRbSM2Li9gYDknlNOgSEk3a4jBjgRDHEtHfJ
 VzuG4cPwWsuY8cM0J34DIELzO3gYPGqOwE6z9bbdQupZ4wLdTjDm8fVDf Q==;
X-CSE-ConnectionGUID: Twq2THKwTfmdv+K2b9Ab1g==
X-CSE-MsgGUID: 5LA8+Oe9RSiWy67K0rFerw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74165311"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74165311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:54:23 -0700
X-CSE-ConnectionGUID: 7Vn6HNDjTWy6AM4Omww0mw==
X-CSE-MsgGUID: JfaRUtJwSkiLbKLnNeQaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218965745"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:54:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:54:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 06:54:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAr3Ia1x0jKF92zItWmdNau2PkvaKSQ+eoAOYcX4WXU3tU4rm7zHjsa/GPxGn4ihsLB/t36uy2laPzLbrZL08pPSDj01T/mdRV1EE1g/z0GzRBSCZAXbllRFMSrL0eD3bXxBBsPPw24AFJTz2RtiSKCXCqeteSjl4DTfRuRDT+sq1V8BKjbczzGypNKUmre4vS54KH2/v4Gldv00FiwrFHknaxkNW55cbNELzxLD6JmgbJ9KYRbTKLFCh3rnjLf4FL4cwy+ee73Nytl0pXZflEpbLIHIGfr5i6j3LryIOTBihBqda9d++pzTWNQvwdxSRmxfmJXoRcINOejWTlEm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS4Jj3YUrQ04Z0szAE/4dT8sEbAHY3vXtVi6jNRMP18=;
 b=q/oO/lCgSMJFmku1uWZitlXsl/H4fDjtN5ya2EedcnxsgVapVUweId9h/OKxVeZ5wbAbzPAIcMhIfFUgf0Wu7v46Ch/sO7mGXYxeBmz2NskscBJmiao9V+0rT6/uRU3wT146K0IljVXOUuqsO3VFP3F/s9ga7KQETiClMbNV+UIlNVdbsbIccIU/IAZT9WGzWfl1RJKChZma+YZGIIV8Prgfk23LAQBubtYmGR2dWAENG4hZXlQfBiZT/MTqsnGE1uZeBEPLmDaV7UIrXmJAdlQovSsXBaSF+KsgKInvVopiLAb8072ohOYqcRjuvR9ABo/lduXUa4RqnlY2+NGGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Mon, 9 Mar
 2026 13:54:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:54:18 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
In-Reply-To: <87wlzl9lsw.fsf@intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
 <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
 <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
 <87y0k4wzny.fsf@intel.com>
 <20260306190910.GZ52346@mdroper-desk1.amr.corp.intel.com>
 <87wlzl9lsw.fsf@intel.com>
Date: Mon, 9 Mar 2026 10:54:14 -0300
Message-ID: <87tsup9khl.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d423aa-9e38-49c7-c163-08de7de35b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: /X7XRxAo8PgzyX7qdDpAwGOGM5JG4pbgYbkgTNTOWOH0Gcrzwn/WbkeZ9I855eIHjaDUqub0gd75pB9XTt6HX/VBW1wEba42fEN8VyXXO+2yvG+r5aZkCFBDJTa4/hdv637yS/GoUUu+P5B0VmNEFg0HuxxJa1myhBGqqbjDCkjtK32rmNdOJXxcJmKeq9DUzWabJtnYcXXG8r3qjK6oJkmuRFr07nHWVB6QguXJW8KvKF9xcD3WBWaYW27bIeH/R8SlwxV4D4xp3KdY5uq9aI9Q/hUb0gP7EQa9W37/Ei4XPFZJAgsmYko340GDRIf53CKFE8L3D4hhihuEONXPss12Vtiy0OkgJcEnflV4KYbo+HxZGhPtLRaVMyBeSIEHbbaB+Mmy75LxjUnZ5ft8gSE1Nk2x6561V9jBgrnOY4m6INslxf0bP3Z8rPfVV4OALgGhWvaco6yMHGOHpcsp4ATrMHeskAWW05MKxGTxmVa9DLV0o6WMv05BS6WV+UJ5oeB8RV4iS9N8ap9mkIIzYju5DLqExHI2NjGST7/Aemdg/I9exuypyvYlBRfdjqLJ5oa0dg3W77brBUM2zpZlEfChD3pPm9FBRll3CHHy9kAtf0C8nMjTV/621ECbggOWQC641xbWw1CXTAGmdQKg68mSBjKkxHMD8/IVY47o07J5V/CltlgoP1uzZnwgdIgCpBdP8mcUP7y4PQyY70pRCZIQ7C+qqjwz73TOCKLWjuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Gj+lc9dd4lqlyvqZDo1gryh7lCe2/EbWujmUJMLFF/stqU2fAeEKpkpFpmm?=
 =?us-ascii?Q?bh1FU/SGablDIkT64F7Aggt16PEXNCiam0m4OYPJK2nttnvaa3AKwMgv1s7l?=
 =?us-ascii?Q?Cdw5ynU5TcRqUqjp/xFXPDSDMPQljgxEyQUDuT7kPLPu8doefumnhhPrVbey?=
 =?us-ascii?Q?HaAi2wqZykRGR76j7k+8iRLNzrZpixd2MtBL9WMp9JaGb0IxKEqqxecRfHVa?=
 =?us-ascii?Q?gZolAvRF66jQsl1WUlPUybSE8zDu8ZmdZIG1KTo10ctwJZ/gQvhYtwqZtwC9?=
 =?us-ascii?Q?K/mWnNDLDIlYiLs/kP961ew702kR/cPU1M5p9sNNfSp0T4k6IY7pEcbPq0AR?=
 =?us-ascii?Q?1aWTnj0DYRY2ebRF/981T1Iz2HeCxN6mZSRe9JUue9VsxunrOgRoLCuAkhLP?=
 =?us-ascii?Q?Atp5z9s7amLyDche3upQI2hFVXYS0/b1OvIDbF8zE4TVNyDQkM2oLeHAkCYU?=
 =?us-ascii?Q?fSXB1Otur2j4vyZvMen5iuIX04M2l0LBV+/0b4vKr/Ynu/kHxuk/ZqAuJd32?=
 =?us-ascii?Q?6SfnDRGf7jbcZImU40AKrrUHz7rw7pBz9PR08XlfVDWST/D9flBFwoc5nDvx?=
 =?us-ascii?Q?7ImBU9Tq4tX8xYy95plcle8pKewbgkYnByfPM60slAqOfbSwNmbMHkJh1orL?=
 =?us-ascii?Q?j/oAmh52Q409RAhGHBSUYwMBz+B9/i51rL55NIqvtPYvq5Ph8MXnEwr2ejUA?=
 =?us-ascii?Q?LvJHssesPdU5uoSB+lLl3xWzu521umInAQWZUQzMU60+SbHeepxI1s216GL0?=
 =?us-ascii?Q?ayR1Ui1LJaIht4yQecmzYbfS3lroSOb50yH3s97t+thRMH/vnZU8GW0PdcHX?=
 =?us-ascii?Q?l2WN3etbx/13Vwqgii7a5uDHUUh9vwRnWNuZxEwU3GopiHfZzDWaJevxkoTE?=
 =?us-ascii?Q?3fjUPYP+syc5lkPhmPk/CAaSDHZmsY4lHMbkZkYmgJQYdr97oOtSKnJqm9lF?=
 =?us-ascii?Q?lAXqRRfAcWMXbGKRtMOUsq/No8St7ZzhYJD0pA29XQNZFrRSADLvpzafsrhB?=
 =?us-ascii?Q?6SKYg8lqPYQVSyqdA2Z1cYl/pIhDz9QDKWjSNA2/D/CvzeZNO+U1AzxY+7fM?=
 =?us-ascii?Q?YXzaW24ndbS8isDkU7vIXSLWNY+DSOKo5PxnsTFBHOSBgYOvxi7PaWSjkRCf?=
 =?us-ascii?Q?TjzwK1YnV17ki4fmdmip4UyO9/rLYt18RjFlz+I0keFEVw4AAs/+i4kxA3eP?=
 =?us-ascii?Q?2kEzYH068MuuWUp8tUhqySkB3Q88wXTnh/4LEyk6S+XANLgxC9tnVL2I8u2w?=
 =?us-ascii?Q?khjQQnurhDF8cbdXz9mQ/zwq0fNMlTm+4bD+6AAxrrOGn/AKfwbt848rKM3+?=
 =?us-ascii?Q?xoY1M58gYHq9mAj8TZTOqcV7+Pstg/8gQkPOlLZX9A/iSQkZZDiEx518ITaY?=
 =?us-ascii?Q?9y46BcUeD6u5N8X9VaGzLukJ0RcFMSjYBDTi4ztn/wcaYtZn0miKzWEY53N8?=
 =?us-ascii?Q?974CRfi4Bgh+jJOTvPk6TbJYk9ByzXv8Hmp0blzw+qqzIPeqxaH5tU8/SraC?=
 =?us-ascii?Q?JJgyfGypEUYOiyhJ7YiUNrUWFggDhlhTN8Pg70XGzEGei/hxtOlwznzZsiMc?=
 =?us-ascii?Q?dyTBJeg/UoLvbtoC4BE/sts0ysPf7v/WR9CLqbRsVaccDXoX3+rwtri66tnC?=
 =?us-ascii?Q?FemahBB8oNsITquICVzTvdZ7emU8iXvFELC8/t8vwqhk/eiLTwsAq8B8tVMN?=
 =?us-ascii?Q?tFLuobJafN4bvTqDEcRJ93tynd1MYJaqWDa/2aUz9+aoivUXB0C68cn1sECd?=
 =?us-ascii?Q?T1OQW7xQ2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d423aa-9e38-49c7-c163-08de7de35b95
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:54:18.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSMRFZF7Yp8VPSkX8ldm327a33cP2r2v3cLI/jOCamUUgyIDZm6nd7oVsISB4hD2ONrcHsTX452j9MkAAeibuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Matt Roper <matthew.d.roper@intel.com> writes:
>
>> On Fri, Mar 06, 2026 at 04:01:05PM -0300, Gustavo Sousa wrote:
>>> Matt Roper <matthew.d.roper@intel.com> writes:
>>> 
>>> > On Fri, Mar 06, 2026 at 02:28:25PM -0300, Gustavo Sousa wrote:
>>> >> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
>>> >> The KMD implementation is just one component of the workaround, which
>>> >> also depends on Pcode to implement its part in order to be complete.
>>> >> 
>>> >> v2:
>>> >>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
>>> >>     to SRIOV VFs. (Matt)
>>> >> 
>>> >> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> >> ---
>>> >>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>>> >>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
>>> >>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
>>> >>  3 files changed, 33 insertions(+)
>>> >> 
>>> >> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> >> index 66ddad767ad4..a83cafbe03fd 100644
>>> >> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> >> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> >> @@ -452,6 +452,10 @@
>>> >>  
>>> >>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>>> >>  
>>> >> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
>>> >> +#define   CECTRL				REG_GENMASK(2, 1)
>>> >> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
>>> >> +
>>> >>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>>> >>  
>>> >>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>>> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> >> index b455af1e6072..3c8692f9b8cf 100644
>>> >> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> >> @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>> >>  	return err;
>>> >>  }
>>> >>  
>>> >> +static void xe_gt_wa_14026539277(struct xe_gt *gt)
>>> >> +{
>>> >> +	u32 val;
>>> >> +
>>> >> +	if (!XE_GT_WA(gt, 14026539277))
>>> >> +		return;
>>> >> +
>>> >> +	/*
>>> >> +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
>>> >> +	 * does not apply.
>>> >> +	 */
>>> >> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>> >> +
>>> >> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
>>> >> +	val &= ~CECTRL;
>>> >> +	val |= CECTRL_CENODATA_ALWAYS;
>>> >> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
>>> >> +}
>>> >> +
>>> >>  int xe_gt_init_early(struct xe_gt *gt)
>>> >>  {
>>> >>  	int err;
>>> >> @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>>> >>  	 */
>>> >>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>> >>  
>>> >> +	/*
>>> >> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
>>> >> +	 * as an entry in gt_was[]) because we would get the hardware already in
>>> >> +	 * a bad state by the time it would be applied.  Hence, we implement it
>>> >> +	 * as an OOB workaround and apply it early to prevent that.
>>> >> +	 */
>>> >> +	xe_gt_wa_14026539277(gt);
>>> >> +
>>> >>  	return 0;
>>> >>  }
>>> >>  
>>> >> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> >> index 80b54b195f20..03a0bf0aeb6e 100644
>>> >> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> >> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> >> @@ -58,3 +58,5 @@
>>> >>  
>>> >>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>>> >>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>>> >> +
>>> >> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)
>>> >
>>> > I don't think it's right that we have both platform matches and IP
>>> > matches here; that's not something that should usually happen because
>>> > the workaround is either tied to the platform (NVL) or tied to the IP
>>> > (Xe3p_LPG).  For device workarounds, the handling in our graphics
>>> > workaround database can be a bit confusing since what we're looking at
>>> > is really just a proxy/placeholder ticket for something that was filed
>>> > in a different database originally.  Due to how the databases work, they
>>> > have to slap some IP release on the proxy ticket, but in this case we
>>> > don't need to add a match for those to our driver rules; just the
>>> > platform information is sufficient.
>>> >
>>> > That would also mean that this should probably be an XE_DEVICE_WA()
>>> > rather than an XE_GT_WA() and the workaround function we're adding here
>>> > should be renamed.
>>> 
>>> Hm... But are we meant to apply the programming to the media GT as well?
>>> I thought the issue for this workaround was observed only on the primary
>>> GT.
>>> 
>>
>> Device workarounds operate on the xe_device rather than on any xe_gt.
>> So if a device workaround asks you to do something with with GTs, you
>> need to extract the relevant GTs from the device.  Novalake is
>> single-tile, so in this case we'd do something like
>>
>>      struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
>>
>> to grab the primary GT if that's what we're supposed to be working
>> with.
>
> Or simply loop over GTs and only apply to primary GTs? I prefer this
> because it abstracts away the assumption of a single tile/primary GT
> (even though we know this applies only to NVL-P and is unlikely to be
> needed in other platforms).

Hm... I'm thinking about simply keeping the same function (renamed) and
call site in xe_gt.c, replacing the check with XE_DEVICE_WA() and
applying only if it is the primary GT.  The reason for that is that we
need to apply this workaround early, and I am not sure we have a good
place to apply it on xe_device.c code.

We had issues when applying it as a regular gt_was[] entry, and we would
probably run into the same kind of issues if doing it afterxe_gt_init().

--
Gustavo Sousa

>
>>
>>> So, should we make this a device workaround and add then make sure that
>>> we apply it only on the primary GT in the function that implements it?
>>> 
>>> We will probably need to rework device OOB workarounds in
>>> order to make this change, because stepping information is not ready by
>>> the time device OOB workarounds are matched (i.e. when
>>> xe_wa_process_device_oob() is called before we read the stepping
>>> information into the device info).
>>
>> I guess we should just move the device stepping determination earlier.
>> Figuring out the platform stepping only requires information from the
>> PCI config space so it should be possible to do before anything else in
>> the driver (i.e., we don't even need the MMIO BARs mapped yet to be able
>> to determine the platform stepping --- and in theory there could be
>> device workarounds that need to be taken into account during the very
>> earliest parts of driver initialization).
>
> Yep, sounds good.
>
> I'm also going to need to make sure that xe_wa_process_device_oob() is
> called after xe_sriov_probe_early(), because of
> FUNC(xe_rtp_match_not_sriov_vf).
>
> I'm wondering if it would be a good idea to have OOB workarounds being
> checked lazily because of these ordering issues.  Not sure though, since
> it would require more storage if we want to continue caching the results
> in the bitmask (it would need an extra bitmask to check if it was alreay
> evaluated); and also it adds some level of unpredictability, since there
> would not be specific point where we would know workarounds are all
> checked.
>
> Another option is making sure we raise warnings for anything that is not
> yet "ready" to be checked by the time a workaround check is done.  It
> appears xe_device_sriov_mode() already contains an assert that would
> cover that (although we could also have one specific for
> xe_rtp_match_not_sriov_vf, to be safe), but I don't think the other
> match functions contain that yet.
>
> I think I like this last one better.
>
> --
> Gustavo Sousa
>
>>
>>
>> Matt
>>
>>> 
>>> --
>>> Gustavo Sousa
>>> 
>>> >
>>> >
>>> > Matt
>>> >
>>> >> 
>>> >> -- 
>>> >> 2.52.0
>>> >> 
>>> >
>>> > -- 
>>> > Matt Roper
>>> > Graphics Software Engineer
>>> > Linux GPU Platform Enablement
>>> > Intel Corporation
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
