Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E93EC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 21:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B595F10E17E;
	Wed, 26 Aug 2026 21:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m64/GoQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8737610E17E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787778020; x=1819314020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rg34ma/gNfdOqQariGn29aRE56aH+2c7Iizm71ej+Hk=;
 b=m64/GoQzqV7wNLTJ7redIa33Wj6WS+sMfL8CzdM+yxU5m072utI1dFhy
 bgBGSmEosyooAFBmOEN8rH/9KHikefhxS/Ze4M6RNNvmAKhIYCO5wCVoS
 MXYHL5KUbG+YFZHDOWJ9prP8RB4fk9STBV7CZh2RbeokL0ROCrAZ/rEBs
 89OZqsj8eNsDUbtinVhsV3W0p6ARyDd7CDgG9e82/6sK2O6zSAwZV0Jme
 aS80dA4/eIfCbWqXAbhg/sQG9pPDL125Tpwl0wIxMa4IlsrZK4NQoyiaM
 BrbbPVBSWPhTSHYivpOZFqyqRURy6qi//RYPVe45Oi+wXjsedltKGEVqz g==;
X-CSE-ConnectionGUID: t/3bQDNLRjyR/ndvK90jXQ==
X-CSE-MsgGUID: uCqC6LrhQhuqqnt3Yete0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="91951731"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="91951731"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:00:20 -0700
X-CSE-ConnectionGUID: Oe0QybjZSeOqnEOM38g7Pg==
X-CSE-MsgGUID: vV0F6bg1TMCH7tfOUZqYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="263910938"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:00:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 14:00:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 14:00:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 14:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMMOp4LidRVPe1SHHprLJSAcd/S8bYtgupQ6BBbONoCzpJ5+X2s4nC32gJcQBb90eYvy7gS8AFJO7g38fuxkkFDIo7e3e5M1Qt3JU89udvy+3PmUzz930TV0k75ZkFOjWofNxkfKh55ofefF3xIQJ6Yv09X71Xf07if+jNPick+1XiqOtb431zGPAplowgXUzeiqjtB8JRa4ng/7rH2c/maW6/lu9EUIXLRkqAdcezqPpBj95I2c0nwf+bMSRH95q4RrUCf7oQyDVI08DCZZQNVJnwadweasVSh3bR35bmFeYhsWvXjaewTdPOWMpeN6fHDgHX27MbCtspIUFSjAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBJfTjdKxzIVaOPk/31Xe7nPVms1W8Etv7nrf4f0Lh8=;
 b=kRHAsM7/eZFdMbxOslge+fnLlUHjKM/rBlABg3hMXM6AfKuNRmnwK2OQjj7Z/txtoRx3EBMviNDNGQojAqFyfugjvW1cQDg7ztX6jpLlvj/Xg3DxYyagVBjfkUB+0WV5xU9v6y572aO1Fugj2/Bk6HQWKqCGnL6q/GXbrtEGAIKrZSxX9dpdUx54jbENQf49wH2VNno2cUxkHyDA7TYYsBQfVQa2aQhz4Zxn4wQS4Qvkr/HYkJOIFRSzrj6du+m73ZfJ67YlBMYdqxei/ntaHWSPVllP1ANWILxbUaoXyW1KQuQdZg2ZKzTLKmuu7HlaEePeWZjUOOff/dWXVxP05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 21:00:16 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 21:00:14 +0000
Date: Wed, 26 Aug 2026 17:00:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
Message-ID: <ao9T2POk0wXbGf4L@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d4b8a2-8049-4eaa-fc03-08df03b50618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zTl68v8FWsAasx31fEBDBGW02SOW8oZm4R5H31+xFOSPGEvziN/kgjb5ASD8m6WxFnVUxthTJU/P/iNT2GEkYSBjwDWVeG4KPUwps/+5QbcQwHLESUX9lwSLLOF9/BpTY89IswKcDDgmELBAPRe3+9xMLZG2crlsKX1V7OXbjvS880RI4BKUV/sWEW4JgX+QxQIMeKeRA1F/M55U/EWLs2Vn7GbXwvKfdgY2uQcNbZQdwkLkI5W7RW6H4AfCCXawa1WLKQNpNZdixYBjanZeo4nYskjrAU/5HyJrfSKaCi/Ij30tTKLgCMVNznpQo1xOaPR2u9+jvUs4IHHGVUdMU79tF3tzViyo3jaEJUJxPdqTyQniCvT/3Mx2BRZBZPvRDe0iGMMUX4htXD3Mvu3+WVc1GV6YXf76QpW0q+ZElhkR4I+QUcYNyuxw28K1NK+UezDzORKKZs2jNeXxK7JBTJFGLOfck/aCDhSXMSU18dmhj9v9j+U38UKMttNNc3K1IidxfYHit0R0pOQTqO7YjujrM4j/+d/CxDheGh9+TY+pqKUkzQDKCaJQgZZu/UjXtyTJEnYsecgHDOr+CohTtZogUJTm8pTx3SFrm6OdYzAHE573FC2OmJRZUTQQQTcfURCkEhsa8DKrs5V/1vamqo0x0fpPuexqgqYhK+OePu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VZaZgluxjvUGDd3g0awZWlXN+WK2qFiLbl/txdGZ8ypS4riBkCHkAkX565Z4?=
 =?us-ascii?Q?NLA+1ShDBTY6s8Z9LrL2BX8HgKT2lZUCPoPlNMUKhL2I/EGUZTfSSvpZAOWf?=
 =?us-ascii?Q?wSyYUFmvOEImISEfIW66gd0u0w9MX4pCnBRq6jdqrGkFGKYPjWrH7kul6TyU?=
 =?us-ascii?Q?uLQXe2Oa5aeZOgksv1tnxFU0KjvwbhX76q5pEu+Dt3hC5eyaffM6Y77MyWqC?=
 =?us-ascii?Q?XFfg+8a4+vvgka1iPtYwbSEsJ9OuZnUgGvYMEwBKQ9Xy6UfQAYY05twZbj/I?=
 =?us-ascii?Q?6fOXoE9kNVbB3sHNG24nvP7ElvEdq9csLO58TedJgXZrcd1ZNgmucDNpvwOr?=
 =?us-ascii?Q?l8AbBC2Zuwtf4K3nk1d0ALkzF0ug+5pYccTvAfOF6Nfgqbj7iMrsUmq02Gj5?=
 =?us-ascii?Q?B16X8Tu6VJK7v/Io3+ROCNw0EB16ZJjHugnCQ/gFQOnUZejOfJBtpZ94AbUD?=
 =?us-ascii?Q?PvW+QzZMezHPBW5EbJnMRMBWfKnKyEVdZpGsRqH70cmUMcaHa35xvUgX7YuV?=
 =?us-ascii?Q?2qTO69lcjrFk7TqvDXRiPZJpknF+HvuW3MhrcI6PiTAOLPz2B/uKK8V1Ekpw?=
 =?us-ascii?Q?00gLUQ4p80fe+HLVi7HjBjmVwencsSj2F9UJHAgAv/EYir7PwxqL88uueAFl?=
 =?us-ascii?Q?KzNCowziCsotW/Kj+5A5OMiEddU617s+t1gWlLUxwWfe4FwHr9lU3D3EMunI?=
 =?us-ascii?Q?iUlL+BFbP5qJ+A/0fWUcNPoJ6nSC09o9OxVIvL9OMuzPwqMF7DGtwxTqL3ms?=
 =?us-ascii?Q?525nUCjRwvg/p7f4YmPEQukfQTJklm7AkxTPcZjUOldaPD4siKyswm04G05V?=
 =?us-ascii?Q?cPcgSHlyccb+XEXKxZrK03wz4CFrzj8MVeXTxSmOYFnjec2QCFMiUZLU3BGN?=
 =?us-ascii?Q?zbXwbsUekF6WYfM489ueMr3llgivhglt6epWgUp5Asq30YNbe8sDXlSwaXO0?=
 =?us-ascii?Q?+IkmyDdch0ql/Uh8we4k04WW0wmbCD9g5zfVvfQprCnHqjmWRtoUOD48pYEJ?=
 =?us-ascii?Q?FO4Ss9U2/EsV8cAhrCAOq5Cec5BvDlBU1mXqrpeuGI0yhJAld6PyvABFboNw?=
 =?us-ascii?Q?wh9Zygrn82D1FVuN0gvwSypnAd5kqmhg+6YglABLJNmYgr7Bx1e3A5rBAcH6?=
 =?us-ascii?Q?euizCBit/VKrqQmP+C4YeXTkxBuETlXxk39zHdc2v6+ktNYl1SOm6IYidwtY?=
 =?us-ascii?Q?7OUjkAErYd5XHM2qwjJXWCuk1wfnkPoQkhZDhD8te7Procj5EBithKkWFPRi?=
 =?us-ascii?Q?BDhR4ddR4bRUILoltB0a/ApD4g4a/B3qPUHsDCqq8ygEmRDFt8hviUb5uYEw?=
 =?us-ascii?Q?ysIK155+4J2MHZXrsi8B9/CnAjMgB7A9eUsuDbf6UA5eCmWRou6GsBk2+lIq?=
 =?us-ascii?Q?GlmDENCJreF+331T2x7KlJVnC5OrEV+COu9+sqqVE52Pboz9QL5KdwLTspgf?=
 =?us-ascii?Q?2lUtvrc0j3Nyl2J/WV6n0p8uYiMG5NBhH0oc7h/wQsT6w3Y5zOXtDNwI8mnx?=
 =?us-ascii?Q?O1hkmSgeBswy7+uYlAzrbME46IBlIAdQjRSSlq7bGyZOx9TricKlva7UqCUT?=
 =?us-ascii?Q?jrgsmPdVMu/0u+ucWaxDhx67LCBT/PeLvrHKozq2mrvBEfcnXLshM0kIkpHs?=
 =?us-ascii?Q?DYZ4lCymPNE+FeWMYpi0fRL14chxT9PiPjeqcTgoDx1lC1t0y5jE1zfDx3wD?=
 =?us-ascii?Q?WnJuIOc4SEXO4i+WiPjLTH/wcmRgMRrtjjFU5HOJf5ARl4elFHUcJskh21Se?=
 =?us-ascii?Q?PH6I7XTj5A=3D=3D?=
X-Exchange-RoutingPolicyChecked: O1emkaf64Y4fjA5rDbB9g3VUvShIAXwqjOpBra5U9bTP2Pc0sJkRxgDOcDif+SQF9cvMphHxAiPUNkBCUti/ttQ7Z3Gn+xOfE/VFIOOyCg7K4dLc3QLj63eh5rzJdd9/+AARiQ+CH/ITvEtGFAlOoHD2Th2DmTBZfczcRFmcyt2xmdE9j3SgZy2VZfTmJ13ndzTAkZroqvx9W0Zj1BQ0r8LE8xYqxV6As6Up7AE6zFwZcPxYmtgBBFqTE6RsH5hyMiuS7QglN7TOYAhJIh/q/sIzP62mB6sv9tBErfSaRdW1L95G1qnm9Kx1y7sVS0hovVz69N45LymtJEiaYJFsqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d4b8a2-8049-4eaa-fc03-08df03b50618
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:00:14.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxs2G6SmWXGtUV3RAsoJYxkvZadNJGzR4qak5asm1nCg8JZ75UgmRDni8VVcMB4ZnkgA/Rlvmg7bAKtLQZl9Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
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

On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
> 
> On 25-08-2026 19:41, Riana Tauro wrote:
> > SAF MHB errors are collected and classifed under Fabric error component
> > by System controller. For SAF_MHB errors, if the cause is data
> > payload parity error then log and return.
> > 
> > For all other errors and causes, request a Secondary Bus Reset (SBR)
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
> >   2 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index d25d25f77531..586dc28a638a 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
> >   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> >   }
> > +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> > +{
> > +	struct xe_ras_error_product *product = &arr->counter.product;
> > +	struct xe_ras_ieh_error *info = (void *)arr->details;
> > +
> > +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> > +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> > +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> > +					"SAF MHB error detected\n");
> > +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> > +	}
> > +
> > +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> > +			  "Other errors detected\n");
> 
> I think this also should go under recoverable.

The point is that at this moment in time we don't know if the reset will
indeed be able to recover the device.
It is a moment where we are handling a global uncorrectable (fatal) error
and we will return the reset action in a hope that the PCI subsystem will
be able to perform an SBR to save the day and we start everything clean
after that.

So, I believe this approach is correct here.

Aravind, thoughts?

> 
> Thanks,
> Badal
> 
> > +	return XE_RAS_RECOVERY_ACTION_RESET;
> > +}
> > +
> >   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> >   				      struct xe_sysctrl_event_response *response)
> >   {
> > @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> >   			case XE_RAS_COMP_DEVICE_MEMORY:
> >   				action = handle_device_memory_errors(xe, arr);
> >   				break;
> > +			case XE_RAS_COMP_FABRIC:
> > +				action = handle_fabric_errors(xe, arr);
> > +				break;
> >   			default:
> >   				/* For any other component, reset */
> >   				action = XE_RAS_RECOVERY_ACTION_RESET;
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > index 99b2466e2062..73517fd0d415 100644
> > --- a/drivers/gpu/drm/xe/xe_ras_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > @@ -12,6 +12,10 @@
> >   #define XE_RAS_NUM_ERROR_ARR			3
> >   /* Error bits in IEH global error status register */
> >   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> > +/* Bits 16-31 represent individual SAF MHB unit */
> > +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)

Riana, please share where I can check to help reviewing these bits.

Thanks,
Rodrigo.

> > +/* Fabric Data payload parity errors */
> > +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
> >   /* Device memory error categories */
> >   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
> >   #define XE_RAS_MEMORY_POISON			BIT(2)
