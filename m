Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977E3CA0EDC
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 02:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF710E077;
	Mon, 18 Aug 2025 02:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0E/MSf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED50C10E077
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755483551; x=1787019551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pn9nEgdv/yzUInGxEDB/q7EGX0b27P4LAIrCQx54nG4=;
 b=F0E/MSf2oM3U5EaSdpZSQs20pBs4WBRO+3VHK7lAYoQmsw4AY03RtcmB
 BsOz5xm0pPOAoR4qqq0ERp+XOdwBWV3622zDSlX2RujhD95Y5gfNzJAdO
 UiSY/GuAr+agnV2oEPTlUHgd2hcZJme9mVfLaChflIWz3C614X2jfguOl
 mbFku+7hJtboSmWYiQqvJgIH0WtjKC2xr82EQ8adrpkLmi8qSNAantHFA
 BSBCG6fAoTGpEzEBcMritvaXnqH99CZETpsA2eBuF1nC97Ofcqlk9Uo0r
 PYTA+v7L6M198nc1dlVjp1TZ+mtQStKdka06KdKKCaz7PmshIigwh5Z98 w==;
X-CSE-ConnectionGUID: hPjGOhNSRGe18fQEsWll8Q==
X-CSE-MsgGUID: euKM7sYkSBO305HDwSqM6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57848422"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57848422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 19:19:11 -0700
X-CSE-ConnectionGUID: QhO1kgICTACKCOF1FnC08g==
X-CSE-MsgGUID: aV5ii+TTRFmsPyJ2n4XK6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166953918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 19:19:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 19:19:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 19:19:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 19:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9hD8gO80HVXNn5uWDOHDxBp8dQhQwrqWXnriili1nnBIJOuxsM5nwFJSQonD/wLugMZVQ/Bcc0XnA3C2XL0o/Bw3+Tl81wn3Epv2j8Eej/SxjhF/hrFV9+8bY63C6xAmdLDlKi+ZXl7ptVcM++OcSEtlcfaeLehX2+3BnsAqNzHOcjhKOAK96LqXm1Lzluk1/OMdRagiJjuTT+bv7uke5YS9Ky0h64HI5L3BXZDiKTvABV7ugBZcKtoYZizoLLomYCrMWf1WgAwuUDLr7hb3e51ajhuc3XJXa2nben0tp7/mbiGFqxxStpcaoXoe1BqSAxmljLAsJBOnfg3+u43mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lngw52w70nJNza3cOCTrhqW0jx9I4fXMAQnQxWzmMeI=;
 b=CE/wrBmjPLFmvFNoOZj4Tc/YcTPrO3IVKEiADFzAlgFfgykEQWpTmnFBLPEobRiNUNlyzBklxKpZBhRu4bYemcowUR2M7M9rKW2+hvIQHzGStFYP4nO1nB1duZ1LYtnelowmTv7EGOgxBQiYhhpX2lN+7HCCmuj2/tLeOEtcRZcoiwRbUthMDF+lhR+iTpfs0z9FAwyTZmfalFCRsXlY54p14UsPohpxhcSHv4czorioww9e2nBRDkfuRfetbN4KOa9ebQRNFftI0v0y6ONqfx2dB+/FvuktIXOs3jmFW3oaaVTMY2cuzv+RZAyYuUUldsJyUMwcTkzlBoO349TUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9509.namprd11.prod.outlook.com (2603:10b6:806:47e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 02:19:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 02:19:03 +0000
Date: Sun, 17 Aug 2025 19:19:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [05/15] drm/xe: Introduce an xe_validation wrapper around drm_exec
Message-ID: <aKKNlAaWwUpdxJDU@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <20250817140518.GA2581807@psionic12.psi5.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817140518.GA2581807@psionic12.psi5.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8763e5f8-3c67-4d9c-cecc-08ddddfd99b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xJ/sXS+s/N0YdOSUIm06GiegC4WfQZI/INBZDoE2lLEJHcG04E9WcH83X/?=
 =?iso-8859-1?Q?sedNC5Lnj93oqHomPBbPXruwx1+bjM4bJHImdB/0PsFS0HyGghZ3dP1R3t?=
 =?iso-8859-1?Q?qxRDVAz3NvUCMDoe7QS8jnnm4HZHeE2HJdRdxY9f+szJwsm64vUyG28AZt?=
 =?iso-8859-1?Q?w+H5MRPi9oWie19ccxFaT4iMLiCwVF0BliTF0smUVUskssmcPHqQ5YzLSZ?=
 =?iso-8859-1?Q?ebdyOnWDcZA8f3Qk8irUUXbDSYDw/xqo6eoyCeMh7G71BsIT/ssoc+WTbl?=
 =?iso-8859-1?Q?qDwd2TjydVVaMPUPX3TFZp4EwKLXBDgSxY3jAfSvb4+HhDnJwz2IW7/Xy1?=
 =?iso-8859-1?Q?N9epxQZ8A4eJBW7kdk7v7i1R4Hj6E0M4DB3/1w7dKX9nOxVSzyTUlKrOHZ?=
 =?iso-8859-1?Q?Vnuf9ozCATqS+ApYR/8lwWhEOcobSVEAgIwX07pFumWVX/t3nKib9KSoAR?=
 =?iso-8859-1?Q?61pCvaxh2PfB+JY2pmIOowyznEmvDkZvjao2jqfu9FIoLzmZ74+PUFQHiz?=
 =?iso-8859-1?Q?3USJcUoMe/2ILf83l693qJOeiKrUsu53shXmq9OWCTFbIXHIgJgp4ucp6J?=
 =?iso-8859-1?Q?hOfo2zk3Gu7AXkIdHUD9pcqKejKnmjX90olwgd7Ggmkzd6IFT4qxKTWP7T?=
 =?iso-8859-1?Q?klyRths2Lq6lMkpLxN5yTdhSLCEVSFxBh3BG7iC+lGAo/vlzlm2MSfxuZH?=
 =?iso-8859-1?Q?oZ8FckOVsGBfCACr9BCwfoROeXey72X/UwB+eIR49T8wwFU/ccbb7bU5LR?=
 =?iso-8859-1?Q?P8y4E14RXOK42YXmQvPQBPVJ4bQ8Tpi/iQW4F+/lC+dAqK1lWCkarT4gLf?=
 =?iso-8859-1?Q?B/RwdEsuZGV3EywS7N4ywTbDnadxKBIwE4+gKh+1KvXaMo7kom61yWhobD?=
 =?iso-8859-1?Q?Vkvy+8dOL1EmlFRdGwJ0aQpXzAj46PzNUvimxTHZkl2LJG55Efi7Guofrm?=
 =?iso-8859-1?Q?uh/OBRc0SRgAbaURWOR+GaISm/jy59QT4kAoTSF6Xhj9c2CP5HS9zkh9dG?=
 =?iso-8859-1?Q?VWhecZRYOZZWEJC6kanf347QFok5SZNevzCmILJsiuhCbNkV81nbeYsNSB?=
 =?iso-8859-1?Q?Yg+tFLTe2OeHma3JHhwQuKEmgRAcYuwqqEeXoIzZnceBdrNw8iod6Stxjo?=
 =?iso-8859-1?Q?xxCIUXFYklJ46gbqJI7xjtRQII33Zamx6YXKuAnQD1TwGZSbrIMYYqTkAj?=
 =?iso-8859-1?Q?yIqI8KM9P5GC4MIPYUJEZWkI7NazvfUzM8P459R9K/gBxO1nYfh+/zMQZm?=
 =?iso-8859-1?Q?1jDqmQUZReRl8nTwknOB3hZmuCvE9gAlX94f+ob06qLMGtLGeODKDn5YOz?=
 =?iso-8859-1?Q?1LxVxWCzam4GF5HdBv4XnH6wZ92ZecxXMoLCbjkomp0NS/lXsV+tXvrsj9?=
 =?iso-8859-1?Q?KRo+V47b3v5a8DeelSy/7P5uvfN0HASt3Ajbh1JTR53btgUpgz0UA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nDK5FM9bjfoDGSKUOHXsNVWHQY8mBgMfn/KaycTeFsLscHmYOTq6BMC2mz?=
 =?iso-8859-1?Q?VUBBJ81df+/+dRghSoSRs5eNYNN0kX7NzMvNf+uE03LG41Nh9yraprGcJC?=
 =?iso-8859-1?Q?QcmwJbF2Y6atgj9BUXrpWbLBYymopCP8nM97E4T8I/TrHNqkN/i8RP/Qqe?=
 =?iso-8859-1?Q?DKmPG8V8WQ7DhUQXvA6IfG2lerWCtQ7tjxM5ipzWflZ8hXrgneaB1EMx1I?=
 =?iso-8859-1?Q?uy32L62j2CXyCAnIZhFNorOX3hH7NmTqu4lKU/pquXwrja5yeySsy3Dq6m?=
 =?iso-8859-1?Q?6CeieVy+g8jR1nmAKZGvL4Bd+6WtbHKg3dU6KVAn5x0rhjFLmqwD/8QqKI?=
 =?iso-8859-1?Q?S437/joq3YbGA/0u2hNm5byZGGAySZtD2DP/nXDrppsZGKALFfWevZ8ykn?=
 =?iso-8859-1?Q?me2L5CgnSkBtFzCr7V/bGKFbMZluzrS1fmP7ULgyPpl9PHuQ+k5LIaxAHt?=
 =?iso-8859-1?Q?q7CM+IsOtAv3W7UNDKjjZaErl03uPaT+WKlmIdrfTxqb8eONlWN953BjXD?=
 =?iso-8859-1?Q?yTyBfUWVp1NWv0AAuDNEDO6j7mhm0ywFWfCWajE2oDZL1BtFpaVxiWtYYI?=
 =?iso-8859-1?Q?LtkJNTxL2OT5SNb/scc0KAFRPEm2L9LdFIexfKEtlz2S8LaWs989Pr3ebC?=
 =?iso-8859-1?Q?w9Q6h0oRNBGMBfdhZsrQSqY2Ch18YULNlJMa2lCnt3HcARffvwnJX7Vtr8?=
 =?iso-8859-1?Q?Yt7NQ0kd3C8RzR1AWN2XbEWBRLVQU+AP8bOPbZq7QFSEmhf8Vy1v7pl5IZ?=
 =?iso-8859-1?Q?RbHew5hHwqULxocIQRPV4HIv2N075x9pHs9QckYnV9huzmaDP+xi7nH/mV?=
 =?iso-8859-1?Q?XZ1x5KPd/jPovsFnO7OxUxo4giN5rw5ljuw7IaGx9UtTuyF6Si1Y8uEXp0?=
 =?iso-8859-1?Q?aD62qXqr8bcXeCXdOJ452YqvsEJFuYR/xt3tE+JechhN2UI1MSp5H+jDo1?=
 =?iso-8859-1?Q?E9TeH6EXA5RLsBkV8/OQpvGpIpzLepKQ34BiLCpryMMyaKV060jBrMW/xa?=
 =?iso-8859-1?Q?jccpj93szJt+daN5L0CiCTJxwjlSLgCacOpXYFYoOMuJQVZ2GZlqfT9kvw?=
 =?iso-8859-1?Q?DZRs1rFO+IYS4/GIoWMYx64ozfgHJsdvajn1kQEh6LBpOedPmheCc5gnhN?=
 =?iso-8859-1?Q?KZyVkx+abMs2WfTsRhV3QumP9t73Jj0NNRKrZsDRuP1l5H5cGtKe+EzKqC?=
 =?iso-8859-1?Q?pX806wEbkibsY0KWHd6IVimA+JOkv4tfgwlrPJWdCQaEBc81fV9ilb/jPU?=
 =?iso-8859-1?Q?u64c7d8UFhqSEe9k4sXFEJHXm+tRXenrCtQrSC/+g9Q73sTNM4zXKIoWpi?=
 =?iso-8859-1?Q?q9efA0el9CYgKrYMhIxbcC+wINMgIK+q1ETwOB4ZRVPUYXyqUpLQ5TXd2K?=
 =?iso-8859-1?Q?dJLPk9AEDQRMb6St9tVe4EhdI3Eix3zMXINRDW4WrJizLpCOEKHeEB5Sco?=
 =?iso-8859-1?Q?z/NzR9xTAl3r91qYcwR5jEToHmTz682CxF5KGgrKhNDkmyFcksPoaHSyBd?=
 =?iso-8859-1?Q?MjemP5sP0H+tr1/qgie0xCS9NArRSi1PjUmiks1UoFx27Jj1gFdbqiITAt?=
 =?iso-8859-1?Q?qpfFriIoeEx0xvP4CSBYHeqIaAz0fgnVP3Ckss1rkskY/zX1q6KBIYvxaM?=
 =?iso-8859-1?Q?Nu9yMTrn3Xj+VIWC5FrXdMaztc6aZfwNmMAIPYa3TwmMy+SyfgAWgIcg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8763e5f8-3c67-4d9c-cecc-08ddddfd99b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 02:19:03.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLJ+wJpdoL2QunZGz3EmLrjx8KFZCoMe0sY4WfzUSJbNB4SPjSJP8XwNa9DXbzjgHQfwAfEPvb0rH/1nT31Oug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9509
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

On Sun, Aug 17, 2025 at 04:05:18PM +0200, Simon Richter wrote:
> Hi,
> 
> On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellström wrote:
> 
> > +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> > +{
> > +	struct xe_validation_device *val = ctx->val;
> > +	int ret = 0;
> > +
> > +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> > +		if (ctx->request_exclusive)
> > +			ret = down_write_killable(&val->lock);
> > +		else
> > +			ret = down_read_interruptible(&val->lock);
> > +	} else {
> > +		if (ctx->request_exclusive)
> > +			down_write(&val->lock);
> > +		else
> > +			down_read(&val->lock);
> > +	}
> > +
> > +	if (!ret) {
> > +		ctx->lock_held = true;
> > +		ctx->lock_held_exclusive = ctx->request_exclusive;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> This can fail if DRM_EXEC_INTERRUPTIBLE_WAIT is set, ...
> 
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> > +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> > +			   bool exclusive)
> > +{
> > +	int ret;
> > +
> > +	ctx->exec = exec;
> > +	ctx->val = val;
> > +	ctx->lock_held = false;
> > +	ctx->lock_held_exclusive = false;
> > +	ctx->request_exclusive = exclusive;
> > +	ctx->flags = flags;
> > +	ctx->nr = nr;
> > +
> > +	ret = xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
> 
> ... causing an error to be returned here, which...
> 
> > +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> > +	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
> > +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl);
> > +	       _ret ? NULL : _ctx; }),
> > +	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> > +	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
> 
> ... causes a NULL pointer to be recorded for the scoped guard here, which
> is then passed to xe_validation_ctx_fini on scope exit, causing
> 

Yep. Thomas and I agree [1] this is a bug.

Matt

[1] https://patchwork.freedesktop.org/patch/668295/?series=152882&rev=1#comment_1225697 

> Kernel attempted to read user page (0) - exploit attempt? (uid: 1000)
> BUG: Kernel NULL pointer dereference on read at 0x00000000
> Faulting instruction address: 0xc008000014bcf2a8
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA PowerNV
> Modules linked in: xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat x_tables nf_tables nfnetlink br_netfilter bridge stp llc overlay binfmt_misc mei_gsc mei_me snd_hda_codec_intelhdmi mei snd_hda_codec_hdmi mtd_intel_dg xe joydev evdev drm_gpuvm drm_buddy gpu_sched drm_exec drm_suballoc_helper drm_ttm_helper ttm drm_display_helper hid_generic usbhid cec hid rc_core drm_client_lib drm_kms_helper snd_hda_intel snd_intel_dspcfg drm snd_hda_codec snd_hda_core aes_gcm_p10_crypto crypto_simd snd_hwdep cryptd xts snd_pcm drm_panel_orientation_quirks ghash_generic ofpart snd_timer vmx_crypto powernv_flash i2c_algo_bit snd ipmi_powernv gf128mul mtd ipmi_devintf configfs ipmi_msghandler opal_prd at24 soundcore regmap_i2c ext4 crc16 mbcache jbd2 dm_mod xhci_pci xhci_hcd nvme tg3 usbcore nvme_core libphy nvme_keyring nvme_auth mdio_bus usb_common
> CPU: 24 UID: 0 PID: 2438 Comm: Xorg Not tainted 6.17.0-rc1+ #1 VOLUNTARY
> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-9858186 PowerNV
> NIP:  c008000014bcf2a8 LR: c008000014bd5724 CTR: c0080000141a0248
> REGS: c00000000fa0f4a0 TRAP: 0300   Not tainted  (6.17.0-rc1+)
> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88002844  XER: 00000
> 
> CFAR: c008000014bd5720 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
> GPR00: c008000014bd5724 c00000000fa0f740 c008000014df9200 0000000000000000
> GPR04: c000000023340000 c000000023340000 0000000000000031 fffffffffffe0000
> GPR08: c00000002d0075a8 fffffffffffff000 0000000000000000 c008000014d8d3b8
> GPR12: c0080000141a0248 c0000007fffcc800 0000000000000000 0000000000000000
> GPR16: 0000000000000001 0000000000000000 0000000000000001 c0002000084dff40
> GPR20: c000000019230308 fffffffffffff000 0000000000000000 fffffffffffff000
> GPR24: 0000000000000000 0000000000000000 0000000000000001 c0002000134ab000
> GPR28: 0000000000000000 c00020001333e818 0000000000000000 0000000000000000
> NIP [c008000014bcf2a8] xe_validation_ctx_fini+0x20/0x90 [xe]
> LR [c008000014bd5724] new_vma+0x32c/0x400 [xe]
> Call Trace:
> [c00000000fa0f740] [0000000000000001] 0x1 (unreliable)
> [c00000000fa0f770] [c008000014bd5724] new_vma+0x32c/0x400 [xe]
> [c00000000fa0f860] [c008000014bd5abc] vm_bind_ioctl_ops_parse+0x2c4/0x9b0 [xe]
> [c00000000fa0f920] [c008000014bd9dac] xe_vm_bind_ioctl+0x1344/0x17a0 [xe]
> [c00000000fa0faf0] [c00800001349ca58] drm_ioctl_kernel+0x100/0x1a0 [drm]
> [c00000000fa0fb50] [c00800001349cd88] drm_ioctl+0x290/0x690 [drm]
> [c00000000fa0fcc0] [c008000014b1fcdc] xe_drm_ioctl+0x74/0xd0 [xe]
> [c00000000fa0fd10] [c0000000006ec654] sys_ioctl+0x594/0x1020
> [c00000000fa0fe10] [c00000000002c020] system_call_exception+0x120/0x240
> [c00000000fa0fe50] [c00000000000cfdc] system_call_vectored_common+0x15c/0x2ec
> 
>    Simon
