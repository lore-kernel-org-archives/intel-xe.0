Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B017FC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 02:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B3810E8D8;
	Thu, 30 Jan 2025 02:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAP+wlHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40710E1ED
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 02:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738204590; x=1769740590;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ln8wQv2W7vBD8qOkwVjkW/t+5MCHsicn8cSBkfn1sc4=;
 b=QAP+wlHhbKt4Elt5nvcyP+3/zv1ItjRKjn3vGEcDgixO7nq/4DdUrgnD
 gkys6TjD7vqdCF652zRzI7E3vbVP41N4o+LONYuJvGXUATBhn1tJb67R3
 ycdFgBzAO1iokVrOCUmmErkMTwr0FO+mGW2NXLhA2f5f/yxYrCHtf79RT
 YgaRRckGyb0O+I2DZCSBkXMWI0z+tyFJDGejy/LYsxw1qowzsSZ7JfpEs
 pjQrL00HNSVAvPYzHx5uGVWZUoj8V8gp7P1BNNX/qtQugDgKYJLhG8KI+
 G5PqmJ46zfv3/pRr+p31xEymOmDs0m6ME8nb49LvdOEvuOFh2Ml4qIwbX w==;
X-CSE-ConnectionGUID: 0uV99S6oRTOBy0A5L+Q17g==
X-CSE-MsgGUID: PghjC0CFQ2KNBj1l78pTGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38847163"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38847163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 18:36:29 -0800
X-CSE-ConnectionGUID: JbbYDcA+Rp6mY5U8gQBqMA==
X-CSE-MsgGUID: ixaOrKVuRDuSOgsssdvelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110115774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 18:36:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 18:36:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 18:36:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 18:36:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZdN/CRmUcGO0fOwhLuuM8rNy3DMQHrECpMDtfpjz97ae1Wa12F5QeEt9PUvUHDMH684rjPNdYw05Mwjq4Q4s/tJe72N0VJT2u9eeR+4/un4DAXr+Mka/pih+4cGkgv9h28/r+gExCn7/cyaoyVQKKOxaykrlA568qp9dEYFVCKsPeWx/7Khmr3iG0eTmeDMYk4Y1Kne0O8wW5X5orwS0tL1TChiyTcRmo4cyrTuUPfwzTBM9pDk/ddTtsi+a1khT3tFMjBpgP1joUGLjiAL+anMxvrJyIXNno87V3jAIwwb8OzFnrtmuB+qD4EPeOT5aYi7ndOTq2t6BFFy87abAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBuQ6bRqPjuvTB4LDgJeSR4Vn9kCvUQYYI51DD8L3QU=;
 b=ADeOxL2S6wwQhii4Mh/60Uzk/ZJU8k0BssAIqWfuHiJcqGFbsmiqgjhkCzBeHCdwgMmQPMvxon4gVQpIzG+ubqlCl4ypqEUa+/jHVVK2+wBa+oLYVhVyHuUpIDNKPHVTxahd5/pMdyba+4bknV53Hosk6Aae/+Mi1u0EKAZI5+yQg2folTDOch310Hzsyd0iANMGWnnXImAZfFR5e20F5CG7+1Y3AyNUDvfYg5Ajkd7IKrIiZ13m+R6L+vsUOev8rvGksfrJqM5KYxq8aFBn8HZij57d63wNbvrRYaGQxmkPoDCkHqAZ0m8iLW+z0a6oXd+GmB+mdAAERxN/CU0wQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 02:35:56 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 02:35:54 +0000
Date: Wed, 29 Jan 2025 21:35:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>, "Himal Prasad
 Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <Z5rlgedsHPm6lhSw@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5rHtFUIbLNRfBfk@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c31b7c8-4f35-4300-5f21-08dd40d6d123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?86HepDtgXLkvCzmZmCCqYygg3X39AerQU0MnpvDZj1JsEe0uxINn0LxCWU?=
 =?iso-8859-1?Q?5sC8sea7Mrn9phRXuqklVLkDtekWqoHSRDCSaAPTh8RNrkEGZsKBBN3neD?=
 =?iso-8859-1?Q?g0yj+0RetMgziHXGPJ5eVibwLzByPXp8mJ95S99BLLsvAs446NV5NQ2E+J?=
 =?iso-8859-1?Q?IG+Pi2wlkqyCn4UTSaTbbdaO5+MGFkDFW9+sNEq5WrwcVjm59aPF5O8Q8D?=
 =?iso-8859-1?Q?iaIvWgQF8VuOCoqOw/ESHq3T64Lfkja+llO+4PfX+8Ml+/WGDG6RFHbqSI?=
 =?iso-8859-1?Q?w6fQDJLF2Hi6jwQZFl/jh/QDRVkDc7WduyGDuOOqHFD3nGdF3nfxNdtr8C?=
 =?iso-8859-1?Q?ns+cpbTijaf/lavCspCJZcgZRjDcBaHxY3VEupJcFS9XT1xNCAHYAG0Axf?=
 =?iso-8859-1?Q?XeSTX9HTTk4y1wvdfACxMveYDA4XWXtLZZeJFTk5pV9y82XJk6GjlTcGmM?=
 =?iso-8859-1?Q?JpQJjZYNOtr+phEOrGwc986PCH0VyXHq45rmgjygxE/Mhbh2CNT18i4Th6?=
 =?iso-8859-1?Q?bizaGE1F7WlveJ6IqbRyH34OyoAK9l1jMwUMBr+mrReHDTL2SDPCllQnnE?=
 =?iso-8859-1?Q?nuIq+azkfvhYEAPWTIDvRE9TVNx0NGJya/7EddG6VKoRIh97NpXKeXecSZ?=
 =?iso-8859-1?Q?suzk3xcJjw7xMWtrO2AlF+rZG4L+vruWHDfZjfqfzd7pS0BWLi8DCp1Ii4?=
 =?iso-8859-1?Q?3XMSiC8UD9QkZo9xXbVvIgbTBW0NUUv6JHzAsQrwBPmHLDtbvKPz0d82Du?=
 =?iso-8859-1?Q?BnyIEE6opXdZgjt9QUNUZcmIzFrWBpCvons6hYcNiQtDx1E3dhfUTAx8sn?=
 =?iso-8859-1?Q?itw482VysYy1lo8wTPcuow2NNvXw4XWP5CoFRdY5sEvh8qDrlrND7yM0V1?=
 =?iso-8859-1?Q?s+mmc0sAhVL4vLmNdGgxBetLevASKQhnETSWwmZJXz4glcQHgxnq/HdMKt?=
 =?iso-8859-1?Q?4FyuFVQU7vv0dSUV8cyBbvCVK0pRT07mWGXMEgQeeaubAD4rZw5NV5FF4W?=
 =?iso-8859-1?Q?8+tBWcR3adMnbDOXM6C3gBJZd++mVFx2Fk/0B2IPrIxCjIIfm8Fqmj2gIB?=
 =?iso-8859-1?Q?OBuW2mIhldBFqv9oqQA30tnePPZZaft+W0w4mfew+kv+XmxjDz5UxQgjnK?=
 =?iso-8859-1?Q?O7vbUTNzB+UaVQJ42havix/YvGMjJ8KEZiH6SfwXtlZj+/tiNCW4kcbukE?=
 =?iso-8859-1?Q?6jn9zT8RSNT6JfTmjV7TukYX/6Xmn2fm6FjmrNg8Cc2HP4drPg0kwc4uF6?=
 =?iso-8859-1?Q?OZGvai1u2jfZnGfzt/pVzYuNRwJHkHugh7zXUXZ+gN+ciuSP/Liz1eZYSv?=
 =?iso-8859-1?Q?2qYIRh4F00HGME3/336XjCBmADSaLhyOKQM+vjuL5XwWK4ejdqJfV15R7s?=
 =?iso-8859-1?Q?HiaMAbAYw9kT/dqkE0kjucKX18uhADrLGBMHOzWTk7nxDBryxWHlZdd+G3?=
 =?iso-8859-1?Q?zSp4RwF60DrTFHFA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vHlB93jD5hWFp2SM0DGB+9eOtfsGKlvart82RlTj823eOBbzpcq+5FxGd3?=
 =?iso-8859-1?Q?XSL2Rz+W2iXLsUWxoei7DSBZ9H3RI/7a8G6JLjt4ziT5mNl7/tzHlkoRiz?=
 =?iso-8859-1?Q?nasB+5wBZr1tTKFj9uuHcuVGAVVwcsQvBHk4qgt4hc3CQJnG7sETkso2+e?=
 =?iso-8859-1?Q?/yedx3WZ/x1PGdsFe60H+sD0IJ7BHGQ/3C0Tn/yBPE9I4qY41puJLquG93?=
 =?iso-8859-1?Q?ql/ZNl0LMpPnySRorthjfbSqDjN3mRufUH0D9dPlmwcVn1EE0ScwU7oBjR?=
 =?iso-8859-1?Q?zHMjmL8zcaR76gEJCxk16KPbB3H9LL/2Z6Fa34isgov6pdiKgLzyTGBujC?=
 =?iso-8859-1?Q?Ohs4dl1U9F5/6eKArHhgQ0u4pH3JSFTxG0wzval52xIGqwclMm3yrn09O6?=
 =?iso-8859-1?Q?S+6FbIFGSj1NrYKL70QPw8DCAnMbznokM6GVs1bEdo/YjPbm4NkWref6Z5?=
 =?iso-8859-1?Q?itW6QhqKa4LV5KsrtWaFvz38QwkCTRXBblYIRfF+j904vD2JGzd9IfdZYr?=
 =?iso-8859-1?Q?sNIcaFc+Ye2RMoPNdydO8zu2OVuOmOBir4JSp7VGFxXZEa4bL2qgSLePCM?=
 =?iso-8859-1?Q?/EVjmA832EkBemCza4cwntwDooy1cJ2ZDXQ9QHGpb+7gALh7jSXlmzjpxk?=
 =?iso-8859-1?Q?+1eqtMhn300wVVRenPgKqUO0GGC9ZCfWYdz9E80G1Sj4cxeVM5VZL0rvJb?=
 =?iso-8859-1?Q?jihABXk3zzTJqjLP3+EQAfbaCHwq00uUepguDDbIAkMjmdSj7QPwEwN3o1?=
 =?iso-8859-1?Q?oVvXNHDEcB6RDA5BoJEtrpsIdW8FETqh187lnZhyi0mqm/ad3pZBaAWu65?=
 =?iso-8859-1?Q?xiz+Gl+QLz5HAzaobHh6RawNU1ndbLCTb3UmBr/AQb2v7ZWkrNdcCWTn8M?=
 =?iso-8859-1?Q?mEhK0wO8SV7Gdv1WQY0dznEwhlbB5WqCCtCcbxNyZ2ZTDeFjiUA5xIoNP8?=
 =?iso-8859-1?Q?ea4TA0lwCFBbkbT2VAlzOTtIE2iPGCKiXx8mciieG/+okwDdK61JXXVBJm?=
 =?iso-8859-1?Q?+HdPJPprCDYolfhcHQJgRNTtaWdqfHN8we4cKPwQ8PgtcicfjGQWF1IXEm?=
 =?iso-8859-1?Q?ezBYfvV0mQFRqNuuyg1HhINMamVFXN/avkq50eSS9q6vTVWBmpCC2vPwjP?=
 =?iso-8859-1?Q?IdpBWUuKzbS+jeFkYN7eNMsjiSo8RDsO05SmHsXi5sAzK+8M6Q/Uez8OBR?=
 =?iso-8859-1?Q?jRpHcHJiwnYEmPiuktemZa94YG02P3jLCWczuNqrhaVnP9b1ywzyKD50yX?=
 =?iso-8859-1?Q?MSvwEXyl2npw+TSgMjhiYJZ11CuLFnTKJ5QUKngHzBmLSbygyWjzvd03LE?=
 =?iso-8859-1?Q?CS0YhqtUbQV6lcem4ZA8vq8TrFIHWuGbApdMis79ZF5SefgPe4BSBqEDo6?=
 =?iso-8859-1?Q?0L+fEJ78/gaL0Y3x/Rf7Ir7reMxq+RpNOlPuwkwt2mmZ0TbwPzk1K9EOpB?=
 =?iso-8859-1?Q?L4aG3snasf8kCo6kVHT9Qm4Uwm8L4rs27kyoLIvCTTQK6MMCR/jCKLjb62?=
 =?iso-8859-1?Q?IW1tyw4YmcUHYh7Aw0vjTlVSr0/fpeCoPp6WGouuY0c/DSqpRIcaPvBM7c?=
 =?iso-8859-1?Q?9QNovStS9FH5OZArHYAgtjXwytAlPc+Sa8Uw8X2Re4v9pa1/aNf+rC59OZ?=
 =?iso-8859-1?Q?BqU1SHSNSxhTzJJ02tzndxclPl4iYAtb+NSyuGC90XE8Mm19/NkCz/bg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c31b7c8-4f35-4300-5f21-08dd40d6d123
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 02:35:54.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrUULh9QTFwHAaqGwNleAp7THWsZczkZ23b7G4TSJwFL4RxQkwXTq7gMwi2qJEPJ98hOtWd931DJhX930j/NnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
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

On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
> On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
> > GuC provides support to read engine counters to calculate the
> > engine activity. KMD exposes two counters via the PMU interface to
> > calculate engine activity
> > 
> > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
> > Engine Total Ticks (engine-total-ticks) - total ticks of engine
> > 
> > Engine activity percentage can be calculated as below
> > Engine activity % = (engine active ticks/engine total ticks) * 100.
> > 
> > v2: fix cosmetic review comments
> >    add forcewake for gpm_ts (Umesh)
> > 
> > v3: fix CI hooks error
> >    change function parameters and unpin bo on error
> >    of allocate_activity_buffers
> >    fix kernel-doc (Umesh)
> >    use engine activity (Umesh, Lucas)
> >    rename xe_engine_activity to xe_guc_engine_*
> >    fix commit message to use per-engine class(Lucas)
> > 
> > v4: remove forcewake as engine is already running
> >    when reading gpm timestamp
> 
> + Rodrigo
> 
> Sorry, I think I mentioned offline that the runtime pm get is sufficient for
> reading this register, but it's not. It does need a forcewake of the GT
> domain.  At the same time, we cannot use the xe_force_wake_get because of
> the lockdep issue you mentioned and also I assume that xe_force_wake_get may
> sleep and the event may be read from irq context.

I don't understand this statement entirely. force wake get cannot sleep.
It is based on spin locks. It should not be issuing any lockdep here.
It is quite simple flow with minimal or none interdependency. Remember
that in i915 for instance it exists and lives in the middle of every
mmio read and write call...

> 
> I would check if we can add a helper xe_force_wake_get_if_active() and just
> use that to bump up the wakeref.

I would prefer to not complicate things...

> 
> @Rodrigo, @Vinay Any thoughts on this ^ ?

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Thanks,
> Umesh
> 
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile                   |   1 +
> > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
> > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
> > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
> > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
> > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
> > 8 files changed, 451 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 328aff36831b..7e93461c60bd 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> > 	xe_device_sysfs.o \
> > 	xe_dma_buf.o \
> > 	xe_drm_client.o \
> > +	xe_guc_engine_activity.o \
> > 	xe_exec.o \
> > 	xe_execlist.o \
> > 	xe_exec_queue.o \
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > index fee385532fb0..ec516e838ee8 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > @@ -140,6 +140,7 @@ enum xe_guc_action {
> > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 096859072396..124cc398798e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -358,6 +358,8 @@
> > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
> > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> > 
> > +#define MISC_STATUS_0				XE_REG(0xa500)
> > +
> > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> > #define FORCEWAKE_GSC				XE_REG(0xa618)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > new file mode 100644
> > index 000000000000..088209b9c228
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > @@ -0,0 +1,317 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +#include "xe_guc_engine_activity.h"
> > +
> > +#include "abi/guc_actions_abi.h"
> > +#include "regs/xe_gt_regs.h"
> > +
> > +#include "xe_bo.h"
> > +#include "xe_force_wake.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > +#include "xe_hw_engine.h"
> > +#include "xe_map.h"
> > +#include "xe_mmio.h"
> > +
> > +#define TOTAL_QUANTA 0x8000
> > +
> > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> > +	size_t offset = 0;
> > +
> > +	offset = offsetof(struct guc_engine_activity_data,
> > +			  engine_activity[guc_class][hwe->logical_instance]);
> > +
> > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
> > +}
> > +
> > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > +
> > +	return buffer->metadata_bo->vmap;
> > +}
> > +
> > +static int allocate_engine_activity_group(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	u32 num_activity_group = 1;
> > +
> > +	engine_activity->eag = kmalloc_array(num_activity_group,
> > +					     sizeof(struct engine_activity_group),
> > +					     GFP_KERNEL);
> > +
> > +	if (!engine_activity->eag)
> > +		return -ENOMEM;
> > +
> > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
> > +	engine_activity->num_activity_group = num_activity_group;
> > +
> > +	return 0;
> > +}
> > +
> > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
> > +					    struct engine_activity_buffer *buffer)
> > +{
> > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
> > +	u32 size = sizeof(struct guc_engine_activity_data);
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_bo *bo, *metadata_bo;
> > +
> > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
> > +						   XE_BO_FLAG_SYSTEM |
> > +						   XE_BO_FLAG_GGTT |
> > +						   XE_BO_FLAG_GGTT_INVALIDATE);
> > +	if (IS_ERR(metadata_bo))
> > +		return PTR_ERR(metadata_bo);
> > +
> > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
> > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_FLAG_GGTT |
> > +					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +
> > +	if (IS_ERR(bo)) {
> > +		xe_bo_unpin_map_no_vm(metadata_bo);
> > +		return PTR_ERR(bo);
> > +	}
> > +
> > +	buffer->metadata_bo = metadata_bo;
> > +	buffer->activity_bo = bo;
> > +	return 0;
> > +}
> > +
> > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
> > +{
> > +	struct xe_guc *guc = &hwe->gt->uc.guc;
> > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> > +
> > +	return &eag->engine[guc_class][hwe->logical_instance];
> > +}
> > +
> > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> > +{
> > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
> > +}
> > +
> > +#define read_engine_activity_record(xe_, map_, field_) \
> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
> > +
> > +#define read_metadata_record(xe_, map_, field_) \
> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
> > +
> > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > +{
> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
> > +	struct guc_engine_activity *cached_activity = &ea->activity;
> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct iosys_map activity_map, metadata_map;
> > +	struct xe_device *xe =  guc_to_xe(guc);
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u32 last_update_tick, global_change_num;
> > +	u64 active_ticks, gpm_ts;
> > +	u16 change_num;
> > +
> > +	activity_map = engine_activity_map(guc, hwe);
> > +	metadata_map = engine_metadata_map(guc);
> > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
> > +
> > +	/* GuC has not initialized activity data yet, return 0 */
> > +	if (!global_change_num)
> > +		goto update;
> > +
> > +	if (global_change_num == cached_metadata->global_change_num)
> > +		goto update;
> > +	else
> > +		cached_metadata->global_change_num = global_change_num;
> > +
> > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
> > +
> > +	if (!change_num || change_num == cached_activity->change_num)
> > +		goto update;
> > +
> > +	/* read engine activity values */
> > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
> > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
> > +
> > +	/* activity calculations */
> > +	ea->running = !!last_update_tick;
> > +	ea->total += active_ticks - cached_activity->active_ticks;
> > +	ea->active = 0;
> > +
> > +	/* cache the counter */
> > +	cached_activity->change_num = change_num;
> > +	cached_activity->last_update_tick = last_update_tick;
> > +	cached_activity->active_ticks = active_ticks;
> > +
> > +update:
> > +	if (ea->running) {
> > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
> > +			 engine_activity->gpm_timestamp_shift;
> > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
> > +	}
> > +
> > +	return ea->total + ea->active;
> > +}
> > +
> > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > +{
> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> > +	struct guc_engine_activity *cached_activity = &ea->activity;
> > +	struct iosys_map activity_map, metadata_map;
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	ktime_t now, cpu_delta;
> > +	u64 numerator;
> > +	u16 quanta_ratio;
> > +
> > +	activity_map = engine_activity_map(guc, hwe);
> > +	metadata_map = engine_metadata_map(guc);
> > +
> > +	if (!cached_metadata->guc_tsc_frequency_hz)
> > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
> > +									     guc_tsc_frequency_hz);
> > +
> > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
> > +	cached_activity->quanta_ratio = quanta_ratio;
> > +
> > +	/* Total ticks calculations */
> > +	now = ktime_get();
> > +	cpu_delta = now - ea->last_cpu_ts;
> > +	ea->last_cpu_ts = now;
> > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
> > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
> > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
> > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
> > +
> > +	return ea->quanta;
> > +}
> > +
> > +static int enable_engine_activity_stats(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
> > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
> > +	int len = 0;
> > +	u32 action[5];
> > +
> > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
> > +	action[len++] = metadata_ggtt_addr;
> > +	action[len++] = 0;
> > +	action[len++] = ggtt_addr;
> > +	action[len++] = 0;
> > +
> > +	/* Blocking here to ensure the buffers are ready before reading them */
> > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > +}
> > +
> > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct engine_activity_group *eag = &engine_activity->eag[0];
> > +	int i, j;
> > +
> > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
> > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
> > +			eag->engine[i][j].last_cpu_ts = ktime_get();
> > +}
> > +
> > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
> > +{
> > +	u32 reg;
> > +
> > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> > +
> > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> > +}
> > +
> > +/**
> > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
> > + * @hwe: The hw_engine object
> > + *
> > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
> > + */
> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
> > +{
> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
> > +
> > +	return get_engine_active_ticks(guc, hwe);
> > +}
> > +
> > +/**
> > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
> > + * @hwe: The hw_engine object
> > + *
> > + * Return: accumulated quanta of ticks allocated for the engine
> > + */
> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
> > +{
> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
> > +
> > +	return get_engine_total_ticks(guc, hwe);
> > +}
> > +
> > +/**
> > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
> > + * @guc: The GuC object
> > + *
> > + * Enable engine activity stats and set initial timestamps
> > + */
> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> > +{
> > +	int ret;
> > +
> > +	ret = enable_engine_activity_stats(guc);
> > +	if (ret)
> > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> > +	else
> > +		engine_activity_set_cpu_ts(guc);
> > +}
> > +
> > +static void engine_activity_fini(void *arg)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = arg;
> > +
> > +	kfree(engine_activity->eag);
> > +}
> > +
> > +/**
> > + * xe_guc_engine_activity_init - Initialize the engine activity data
> > + * @guc: The GuC object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_guc_engine_activity_init(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	int ret;
> > +
> > +	ret = allocate_engine_activity_group(guc);
> > +	if (ret) {
> > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
> > +	if (ret) {
> > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
> > +		kfree(engine_activity->eag);
> > +		return ret;
> > +	}
> > +
> > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
> > +
> > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
> > +					engine_activity);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > new file mode 100644
> > index 000000000000..c00f3da5513d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
> > +#define _XE_GUC_ENGINE_ACTIVITY_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_hw_engine;
> > +struct xe_guc;
> > +
> > +int xe_guc_engine_activity_init(struct xe_guc *guc);
> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > new file mode 100644
> > index 000000000000..a2ab327d3eec
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
> > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#include "xe_guc_fwif.h"
> > +/**
> > + * struct engine_activity - Engine specific activity data
> > + *
> > + * Contains engine specific activity data and snapshot of the
> > + * structures from GuC
> > + */
> > +struct engine_activity {
> > +	/** @active: current activity */
> > +	u64 active;
> > +
> > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
> > +	u64 last_cpu_ts;
> > +
> > +	/** @quanta: total quanta used on HW */
> > +	u64 quanta;
> > +
> > +	/** @quanta_ns: total quanta_ns used on HW */
> > +	u64 quanta_ns;
> > +
> > +	/**
> > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
> > +	 * per the quanta_ratio. This remainder is used in subsequent
> > +	 * quanta calculations.
> > +	 */
> > +	u64 quanta_remainder_ns;
> > +
> > +	/** @total: total engine activity */
> > +	u64 total;
> > +
> > +	/** @running: true if engine is running some work */
> > +	bool running;
> > +
> > +	/** @metadata: snapshot of engine activity metadata */
> > +	struct guc_engine_activity_metadata metadata;
> > +
> > +	/** @activity: snapshot of engine activity counter */
> > +	struct guc_engine_activity activity;
> > +};
> > +
> > +/**
> > + * struct engine_activity_group - Activity data for all engines
> > + */
> > +struct engine_activity_group {
> > +	/** @engine: engine specific activity data */
> > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > +};
> > +
> > +/**
> > + * struct engine_activity_buffer - engine activity buffers
> > + *
> > + * This contains the buffers allocated for metadata and activity data
> > + */
> > +struct engine_activity_buffer {
> > +	/** @activity_bo: object allocated to hold activity data */
> > +	struct xe_bo *activity_bo;
> > +
> > +	/** @metadata_bo: object allocated to hold activity metadata */
> > +	struct xe_bo *metadata_bo;
> > +};
> > +
> > +/**
> > + * struct xe_guc_engine_activity - Data used by engine activity implementation
> > + */
> > +struct xe_guc_engine_activity {
> > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
> > +	u32 gpm_timestamp_shift;
> > +
> > +	/** @num_activity_group: number of activity groups */
> > +	u32 num_activity_group;
> > +
> > +	/** @eag: holds the device level engine activity data */
> > +	struct engine_activity_group *eag;
> > +
> > +	/** @device_buffer: buffer object for global engine activity */
> > +	struct engine_activity_buffer device_buffer;
> > +};
> > +#endif
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index 057153f89b30..6f57578b07cb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -208,6 +208,25 @@ struct guc_engine_usage {
> > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > } __packed;
> > 
> > +/* Engine Activity stats */
> > +struct guc_engine_activity {
> > +	u16 change_num;
> > +	u16 quanta_ratio;
> > +	u32 last_update_tick;
> > +	u64 active_ticks;
> > +} __packed;
> > +
> > +struct guc_engine_activity_data {
> > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > +} __packed;
> > +
> > +struct guc_engine_activity_metadata {
> > +	u32 guc_tsc_frequency_hz;
> > +	u32 lag_latency_usec;
> > +	u32 global_change_num;
> > +	u32 reserved;
> > +} __packed;
> > +
> > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
> > enum xe_guc_recv_message {
> > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index 573aa6308380..63bac64429a5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -13,6 +13,7 @@
> > #include "xe_guc_ads_types.h"
> > #include "xe_guc_buf_types.h"
> > #include "xe_guc_ct_types.h"
> > +#include "xe_guc_engine_activity_types.h"
> > #include "xe_guc_fwif.h"
> > #include "xe_guc_log_types.h"
> > #include "xe_guc_pc_types.h"
> > @@ -103,6 +104,9 @@ struct xe_guc {
> > 	/** @relay: GuC Relay Communication used in SR-IOV */
> > 	struct xe_guc_relay relay;
> > 
> > +	/** @engine_activity: Device specific engine activity */
> > +	struct xe_guc_engine_activity engine_activity;
> > +
> > 	/**
> > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
> > 	 */
> > -- 
> > 2.47.1
> > 
