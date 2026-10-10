Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFCACA9EBB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 01:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8C310E0DB;
	Sat, 10 Oct 2026 01:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQ1Mhtyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18610E0DB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791594044; x=1823130044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z4qKDtL5E5a85rFdZxeXBiJ/RvEZ4K1exlKFbfDkXS0=;
 b=mQ1Mhtyprf1EEuqn0TR+9ZIBRpb3dHkgvwAJGk9ODm7P6W9h3qWTm79y
 nUn0l4gwJ9PAWY22QIqTaJ4j+ejY0cFwTWmJhpvLirzXwscvV83fZlcqb
 u8xndYewYLwOTG+fGsJy2ZbaECsEaKVVerVjDEbwQFoj+zt3Ee8+P4MHT
 jH+Quw2RoYMCxhOSlhT0vjGK3rmSYn3JGuierwo0IGaAjXhAPI0QSZCa5
 7wXPOO8wqnOLp9ks+hKNYCZLNtIEnZ0CajLAnqQPzJ/b0+wIeEFXOpXeK
 I3G/JlDHjflADKoxt7iOoM0OwoTrIND0C8nQWsBoOOGbQ6hsXfO2w4s7D Q==;
X-CSE-ConnectionGUID: jq7iaChJTvObNBOHIbW5Uw==
X-CSE-MsgGUID: 2IiXR+5wRrSX9b1Rcff+3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="302524"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="302524"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:00:44 -0700
X-CSE-ConnectionGUID: DykOxsb0SCGLSXKTJElvAg==
X-CSE-MsgGUID: m8L93NnkTJK7Mw4kkLBlwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="798601"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:00:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:00:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 18:00:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1eqqpIeIwTt6nuTTYg+LmuZpa2dUJyVww5gly2IrBdhIKIOBhn+1eAUdhNli/y/9nMrR7/Blyb06kX2pufaaQ6hEqX6A8g2sl0VhD4PGFlnI/9nZMPb2Ixyk1GzyBw4XrTdr8iCcBAfq9jX3OSq/YX6CFNAerkTPS3iqFrrZRzyTk5VPvsuykCx508nmeU81JrrndJOIRYx/goBIKuWAFLCyxlGkQ9fpUmpfD4jT/zVxkr2ql0s5QjWzsKV8zpUVqQjZJuL+TFAygPmraLI4aKkq1mu6Nm9VOjHMTOyFHDm+4HoxYmAE/RpOd347QVs71vuDLQRcHHw/F44rYFm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bS+7JMTSZsosx7OKAT6Oclrvsm2KKgc0IEehqU/uyBs=;
 b=FMDylIzbJ3txSOdjKWIi+u0yuOsnSku6GolkrB5QpM7maukR04QtUooXy8NxFv499iojgiPDqB5cb4Oyw4jHgDW+41GhD7WO8shWUM4C2L0bCXXkUWJezW7E+XY4SXxDcXgkwLSqZtyye/khnlbwY92sF4sQtSHqx7wLcbhPeTAclz8e4+s8Vs6ClGQwXEjnQWrkqLgyoYFac0CiO9IzW52lbxz2mHM14uCPXyXtRpT+BUxbrGYoDEnywjZUizEMf+CbPkJ9XuBcqjmwq+VEtSHwnye3KfJDEDN2ElOU7Y65Q15jFz7u7x6cME+mNJmFjTXHE5r2rSQInOVRu56dqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Sat, 10 Oct
 2026 01:00:39 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 01:00:39 +0000
Date: Fri, 9 Oct 2026 21:00:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2] drm/xe/sysctrl: Add mailbox control state to error
 messages
Message-ID: <asmOJrnBwBSFIKBk@intel.com>
References: <20261009064754.3927132-2-anoop.c.vijay@intel.com>
 <askw3y5OdyAvYC/Y@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <askw3y5OdyAvYC/Y@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SI3PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::15) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d7fdab-b019-4943-643a-08df2669e658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PEejV+rDeG7UmhcFQLdSGMeMWAM+RraF8onaZSILI2ZfjEvnGF840K7iolCNDDaal4ANAeeYts59vrXqKJjYm2ax8hWXr9X4/CRizkWboFNF+sGc2HIzadyor9/DYwCDWg8S1aL0AQ5zs/FPt29WgfWkYEQIvEXXCse4H9q6+FWe0GOS3EKWxNzCSlsxGMdKoLCT07h74IzLPuKFGuu0NjKCDJQeH1KXgtE/1nw94UpQjXtpCTHlTsCP+NCbDI0Y4F5YfJi9rOreLUS1DUsZWZ5izKSqz8Ki4xtDTWM0UDYjqXRYFV86ictRxL3O+hDZC3qCKr/hVHEI0OAwm/MEhmCep6Ff+iKdCMoSTaMIZ4/aMBzctwuhGRCLjcPtyAZULCStpZKp8YNwd/VTL68NCw5ynJTAGcFeBELJ6mz6Jr/CFFn0DwbIl65SH/zNXk31tj7K8F4cWSVGIJpU6XIWKTH4yWZl8l+kxxAJcfsQ1mtPIh+qPu8Lg0xMw7JvedlT+LlIFXcTMH0wZWLwqXkrJF1Bj+p5k5o/Y40lhwn+sCQQSF2a5fkDJEwcDGKPBfnTvy5JTosoq0EVmS3OU8+7TG3vELlslhrlN8e34i7aq0ND+kNkuBxu51xrXa9uADn76syc0AKvrkRdH5VQaScideQxur80HkUdpPs+PlS9J/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOX2rHOmn9/emRLJ4DXQ9v1HlPsQk88fG/iWnqHQ9sBekwXqcRAprRDmzTbA?=
 =?us-ascii?Q?7E/MqveiS1Zj77KrkPe/lRm3uyTlJMa7+mtJio0bdnID15f2ARgHJXa+XfSO?=
 =?us-ascii?Q?m5Xi/RL+KfvZmVYsJ6+d671+e3OTGboOuPUFq+SpuCCgR7g5OHH1y9xtIo3t?=
 =?us-ascii?Q?0257r1ye9fdBQzvbW8Ff0i2N4X5UBDrWQ21KRz44lAKtt6BoI+0KZ8KhKIMB?=
 =?us-ascii?Q?bt4HsxEk872zpGTws87M4xEraX6FyA8A1Z+nxz1ToJmPaFaFIevvCMLeaqJh?=
 =?us-ascii?Q?H3Ct8JCUIxydUlT4cAo/VFDx7tWtbBbE1L7TiKmzZD1sLrUp/sphWoMoLffx?=
 =?us-ascii?Q?7Oky7kjLLzAvF7y/NuRFySWMuk9y4gfwKp3YAkPv3GPsbSdC0Ehw36JFZeQp?=
 =?us-ascii?Q?ggihXs24kyM4+vKU5jI/nUpMaKDBUURBcCUpYTbJ+6R48SS+p624kCcc+5VA?=
 =?us-ascii?Q?rLe1cuJOjdIvKzRwCfsHGlV5urGERkEg8DanI3ixVRR1O5CJucZ9zC6tleXh?=
 =?us-ascii?Q?RN+Bmv8qTLurkfmdWAQeBlWY9ugh2fEezo6YBc5iM1csnj2bXBx4G+MIPoyE?=
 =?us-ascii?Q?5lTqo8cAbQ6dlLoNEbT4e5HvJ/8YGxMRGr6tgV104gfcYB7nTY/dgmJM+1D9?=
 =?us-ascii?Q?4Tn3YDGU66xtQvtpyZX9yRERh95wVhYIU6TRXd14apkROnolq2eAPNUqM6KE?=
 =?us-ascii?Q?ivXDJJ6dAZozbhnYe58h/cxjwzR4Bv1vm6Q9nuv4jRLPdnJoCqdDSHaT91cN?=
 =?us-ascii?Q?fxcDoAMZl1VRExb2tKdRKesuhsnF+dylwe6PsjQ4nv8zkZbzq1Vv/DGp1pr4?=
 =?us-ascii?Q?P6nmbbPX/VU88Hz6c0M+s/tVGHWfnxs2ALu52+RrOuDVzTQzgrY7oJbkFUz2?=
 =?us-ascii?Q?s7l1mpLd6MQpvlfKFECbfl1nR+WUn+dy9UbI23UlncH2x8yx3LxB2NQoeZgB?=
 =?us-ascii?Q?0HJUS5PSM8RgYfIBFRzQ8+agRHVIT+m6UyZPabZcS961h5hfuLGSPxOaM0jS?=
 =?us-ascii?Q?XwwCjVOMuQG7z8ramvgtG5s43odOc5maRMDi22baEwBCm0EE/Vn3sWtliURP?=
 =?us-ascii?Q?NKT5tXSc1AqTHH0Jd360jEcx/dC4T3Edpk1NwW5ZPXJyS/pSETOD39X6nPBQ?=
 =?us-ascii?Q?P1yyGJaoa0bizuRMHT4YPAYCOlgfFCVaxwV1TqoujmFzCMa1bJHMjIl0T4Fx?=
 =?us-ascii?Q?wMGAG5FoHw9McMOJ3yqwZpO7iMmO5+CNQKQoclWjKfyyx+33SYUywmsKlpCK?=
 =?us-ascii?Q?7uuLqunZToE1dWlBh3fmK1SmybI9+HiPO5yPnTpIY01/esTBlFTdTZJj2fHK?=
 =?us-ascii?Q?ipEZ4FvPG8Qy9sAdRyZHydPe1y1vu9UpHEZJ1xwrvtllZkie832fexV9MKaf?=
 =?us-ascii?Q?kcBfa0CD/OW6n4xXv32LDJjss35m2ZbPA5ViO39VgR0ZDAl5EFUHFY765dOi?=
 =?us-ascii?Q?iUhfRAfInpytT5eUp22CNKnahLQc23Kt3MrRpwiSdfTsGWRtlMAey5p/7VA4?=
 =?us-ascii?Q?9OzEMhGpACY1T1GEP78HoF22Jo3c4zSLfYvHbwLnoJuovRACpTQW1y/5htSt?=
 =?us-ascii?Q?UMYJUxYr77UdQT/mtWDVPtnBhk6hknD8H12YNQrx837bXeWbGLO3xbbKGo5t?=
 =?us-ascii?Q?v3bVyoVetYgGUGTAPnebqTUDKtI4vLwsCf0lgKZoU27kKlFm/bzs2WtGD2CK?=
 =?us-ascii?Q?74CrOyn1wWOhL6iRe6FaCZh3fU741P6n7CkM/xaE19/SLZY4XJ+FXmbakS1y?=
 =?us-ascii?Q?Y3ycq6sxDg=3D=3D?=
X-Exchange-RoutingPolicyChecked: VbMrvN3oNyULCC/MBN0fAVQ0Wjj0ye7nGfUTbWueOj2P7N7ctsYyFqZfLqNDqs5Cu3Jc9x7Kdln/46NfPp2DKegiClBXKnxBiXjNQWOV0oKlPeGSVUlnBEIa9g9S6/sJeBb5xAWp5pJq/3NPx+DmpveNr5jW7f142d9Gu5JxWhK+/7Ba5fCf5cDwdbQYKpxmtRB1+pZkJ84mp5khYgTxvXk5iHK4Vb3U7BQxJVEeuYjg1oAA1IY03v8SfxHENKvp3kmuNwptdgzqIXTdeGYCfCmhSWcUm6grDXgqfKrDVZwEcXYRy5xOx63bQGPffCt6jsxbA1+ELVkm/w4lY4c0fQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d7fdab-b019-4943-643a-08df2669e658
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 01:00:39.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXI83eRRSYT7YoIE0pXz2+9GXh9YwOVbKj+aKR6ekvvhFX4XYzACTi4y+t3LcncAR+ds+dURRzf8miR/JNxiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

On Fri, Oct 09, 2026 at 11:22:23AM -0700, Umesh Nerlige Ramappa wrote:
> On Thu, Oct 08, 2026 at 11:47:55PM -0700, Anoop, Vijay wrote:
> > From: Anoop Vijay <anoop.c.vijay@intel.com>
> > 
> > Include decoded mailbox control register information in mailbox
> > busy, timeout and firmware error paths to provide additional
> > context for failure debugging
> > 
> > Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> LGTM
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

pushed to drm-xe-next. Thanks for the patch and review

> 
> > ---
> > v2 (Umesh):
> > - Remove redundant casts
> > - Align log/format string style
> > - Drop duplicate frame number in frame-ack timeout message
> > ---
> > drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 ++++++++++++++++++-------
> > 1 file changed, 41 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > index 25425e8bb533..f1a231dfec1e 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> > @@ -7,6 +7,7 @@
> > #include <linux/cleanup.h>
> > #include <linux/minmax.h>
> > #include <linux/slab.h>
> > +#include <linux/sprintf.h>
> > #include <linux/string.h>
> > 
> > #include "regs/xe_sysctrl_regs.h"
> > @@ -36,17 +37,27 @@ struct xe_sysctrl_mailbox_msg_hdr {
> > 	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
> > 
> > static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> > -				  unsigned int timeout_ms)
> > +				  unsigned int timeout_ms, u32 *out_val)
> > {
> > 	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> > -				  timeout_ms * 1000, NULL, false);
> > +				  timeout_ms * 1000, out_val, false);
> > }
> > 
> > static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> > -				unsigned int timeout_ms)
> > +				unsigned int timeout_ms, u32 *out_val)
> > {
> > 	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> > -			      timeout_ms * 1000, NULL, false);
> > +			      timeout_ms * 1000, out_val, false);
> > +}
> > +
> > +static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
> > +{
> > +	scnprintf(buf, size, "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
> > +		  REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
> > +		  REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
> > +		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
> > +		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
> > +		  ctrl_reg);
> > }
> > 
> > static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
> > @@ -128,17 +139,23 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> > 			       const u8 *mbox_cmd,
> > 			       size_t cmd_size, unsigned int timeout_ms)
> > {
> > +	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
> > +		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
> > 	struct xe_device *xe = sc_to_xe(sc);
> > 	u32 ctrl_reg, total_frames, frame;
> > 	size_t bytes_sent, frame_size;
> > +	char ctrl_desc[48];
> > 	bool phase;
> > 	int ret;
> > 
> > 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
> > 
> > -	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> > +	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> > 	if (ret) {
> > -		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
> > +		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
> > +		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy %#x.%#x %s\n",
> > +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> > +			   ctrl_desc);
> > 		return ret;
> > 	}
> > 
> > @@ -159,9 +176,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> > 
> > 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
> > 
> > -		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> > +		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
> > 		if (ret) {
> > -			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
> > +			sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
> > +			xe_log_err(xe, SYSCTRL, ret, "Frame acknowledgment timeout %#x.%#x %s\n",
> > +				   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> > +				   ctrl_desc);
> > 			return ret;
> > 		}
> > 
> > @@ -171,17 +191,22 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> > 	return 0;
> > }
> > 
> > -static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
> > -				 size_t frame_size, unsigned int timeout_ms,
> > +static int sysctrl_process_frame(struct xe_sysctrl *sc,
> > +				 const struct xe_sysctrl_mailbox_msg_hdr *req,
> > +				 void *out, size_t frame_size, unsigned int timeout_ms,
> > 				 bool *done)
> > {
> > 	u32 curr_frame, total_frames, ctrl_reg;
> > 	struct xe_device *xe = sc_to_xe(sc);
> > +	char ctrl_desc[48];
> > 	int ret;
> > 
> > -	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
> > +	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &ctrl_reg);
> > 	if (ret) {
> > -		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
> > +		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
> > +		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout %#x.%#x %s\n",
> > +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req),
> > +			   ctrl_desc);
> > 		return ret;
> > 	}
> > 
> > @@ -219,7 +244,7 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> > 	while (!done && remain) {
> > 		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
> > 
> > -		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
> > +		ret = sysctrl_process_frame(sc, req, out, frame_size, timeout_ms,
> > 					    &done);
> > 		if (ret)
> > 			return ret;
> > @@ -240,8 +265,9 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> > 	}
> > 
> > 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> > -		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
> > -			   XE_SYSCTRL_HDR_RESULT(hdr));
> > +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
> > +			   XE_SYSCTRL_HDR_RESULT(hdr),
> > +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
> > 		return -EIO;
> > 	}
> > 
> > -- 
> > 2.43.0
> > 
