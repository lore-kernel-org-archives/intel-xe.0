Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7C8CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5037A11230B;
	Wed,  3 Jun 2026 19:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvPuEbCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E316A11230B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780516146; x=1812052146;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W1IhSWwWC6diAiY82fCYyWEEq2Ulotiar/LHOCEJI/E=;
 b=ZvPuEbCF/TAdflEf6+k2tUxRKOMR1DAWI2G04l3jBe3xVE3chy/iIRkE
 jZtSR/6n19cgQa2bTjtBlHBaLTIDxy8B9SYCs6HiAAA5xtPtQJ2W2jx54
 bx1OwTSHYFEN+fxF/mwxvrDTie1hZju9LT+JJX+ZjllKHFXRLMQjfuKM8
 evrVI9yeVRf5sA7rjqt5L1cuz2jtVMdc8TLmrX/tJIPqiW7FWcm19jb0e
 GLGVSLMUf080vELTEIM2GTlhvrg2XDLV2AixPYLh6C/mXsXmA2AxmE1Tp
 ksEfSiHIEx9L/eC+HcdH4kNYzheA8zzyEKzMQXGVEUz8QYn5C0rXuGE03 Q==;
X-CSE-ConnectionGUID: 0Kd8SDrPTiao79WRo5lEag==
X-CSE-MsgGUID: aMGd5eG9RJWTswtyo699aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81519539"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81519539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:49:05 -0700
X-CSE-ConnectionGUID: 8qwfxEMQSWCkCVKZ4AUbhQ==
X-CSE-MsgGUID: XjCBdO4mQfeeTyNh1dgLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243491889"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:49:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:49:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 12:49:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO3Ycd8vJcKQnmAZ39Xo+1QRlMou4go/TnCz8nkIMPDzSRjWCVSE21NSCKriC/yAqNE6V7yKDTd77CaIPUHq2dWz0OOSM74mEzoHu6fn+GT4BcyZffdIWclf611WPo6XYLj0/y+4aOWAIXd2/JFMuoEZ71h2ebxgBjm+M9MQzT25KK8CCJwEsFrQachWacpvzzUuQ9laE/KXGuCcx0Ah/Bo/TkGMbU/64HX71i+6Fa8FpbxUtMzokpx9Dlbq5UI5ikAksxEZcmNxMqNUTvacTPZMXp85UcYXj5/wMJinuHcZ+HM3upigbU/77yGxzd/BVGb3tpDXxiI8ut/yJAvmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc2NjfNZgafmDpG6z08el63rO0m/J8rzdYOW3cJIEJ0=;
 b=g4wQFxtlrQBkY7JzsprZI9SPZtLJ6HsCDMlYVfUToN+xdPDcAi8ZtXPeZQ5MMY+LHi2bV8mFds/GzrXSPPgzTlG/J88cDeTpHfSP0zjS3vb6itRQXKbvr9H2SfFHIeAOHqwbW8JalYNmyyIeaEkaOfpD0XZhgxkYROtdqt+NSH2nFXf17mxMPGSZVxPFr/7oiA4HMq5bb/bKdI+v0M/Vi8dAKDIA3xDyRloLPyZp+10vH6XSBR327YBIzE/XeAYdXgKFx6NZmRrElAZfGQzHmA3+hJkbYRR45zesmRIZ+qlvpOobvMpPlQ3JiTpf8wOTR1JyXBOfo6VjCcaOROLdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF267298081.namprd11.prod.outlook.com (2603:10b6:f:fc02::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:48:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:48:54 +0000
Date: Wed, 3 Jun 2026 12:48:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
Message-ID: <20260603194852.GF6262@mdroper-desk1.amr.corp.intel.com>
References: <20260603162619.1550794-1-shuicheng.lin@intel.com>
 <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
 <20260603192547.GD6262@mdroper-desk1.amr.corp.intel.com>
 <20260603193607.GE6262@mdroper-desk1.amr.corp.intel.com>
 <a65ce97dbfca5c1bd87c35843b705b9d84caa36d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a65ce97dbfca5c1bd87c35843b705b9d84caa36d.camel@intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: 481000a4-85bd-4f8b-d0da-08dec1a924ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: g1nwwlGNas/B59nJ6SeIB0CLS5fUDhpWe5/aeRuV0/D8FLE6OB5cdIAyVkSJuwMm56+s/c8uK1yl5sOkTK3ciyHwMdqcOWE/msnXlekjF8wJICrpKg71KnnxIicAO8jLNwwLC2sZGVw8isRxH7SHd6dePD1822azgyEi7p9BnoFtzAsKCzLsWKWcnSRR5fqMN6pPkzO+ydf0yPWJpQE8tZfkBgD8lvwU+B3cAWz9TV8XuohqKwy6SM+3TbqFnZkwcS6do5xs8PhyNszK/JFE2s7KAxjzV/RMh+p0D5mcY3xzdo8097dSD5XuZFhnu1xldpvVR+jrQftal00v9BCuXGAPeEd2V9G9qgp5z8JHc4Pm38MEWNBgG7JMvF7yFRU8p7wP+z9m9pW4Egi5hhAV4ZlMHIyee6+TRWl/AvJG/K/UiTy4wjpNdZsbh/JR4iYoU5JLQnAZw/d8JWx792JIPgc2IeSpTxXT8Yt2DrxaI08fSvFHwPWLOfzbi5ytcssKz2IZTksDqZHJ/ai8UjTLmI6dzTJv/VabtPZunbT+DRztLMC9qZQhnOoPC7rVW1RLzBO1Xhjvo5mG2XdPTwDfokdW/pKvPAga3AiQxWm9idnQZNVlCd3gvCTjYQzVKvynXh5MUmyiR43xKsCxJ35M5Za2sB1mgsAedi8rYtQZjLggdIrRS9tSzQBQGS3RXijz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TJ6hyqVsjlFITWXvGKXyxaYEO3RgiIzdWz+MDn4nbOjI2Urcr3pTx8+arg?=
 =?iso-8859-1?Q?xj4Pd622i7QRgQ58lbLOSClzJS+EdxMOtlOJXwZE/OyEMhDPIYCWopejTE?=
 =?iso-8859-1?Q?L/kO8uu4DSD323Rj0L71BOzTLP5MR9/9VAjGpvl4NP9ScLTMavQhKzzjBj?=
 =?iso-8859-1?Q?+CHPIk/hf+aYh1twG+JWiNax7Aj65DxCdQyl9SVVuzpUh7vx3//LsnTFQP?=
 =?iso-8859-1?Q?+xWZJBZMVZ4ID0fYnohNLvy2pgbYjmD08bR59E/hvFgAHOqfZsuNQSHSPo?=
 =?iso-8859-1?Q?pGGhb4t9lthbHTVWkp9CeBTYbNiCKG2N1vd4aycm4WYZubNkLdFV+vFZL+?=
 =?iso-8859-1?Q?YSDrXtTuJWvIhzlDBDjiLu2M35PirMsFTktkG5555uIWURWj2CT6hHib2W?=
 =?iso-8859-1?Q?JOm4BJD9c+0AH36p1Q0eVcs05V1bWJUT/Ra7yMM/fp+EgjPaLSBVV1uq/a?=
 =?iso-8859-1?Q?AyEbJbH1+0Tuph9nEKU8nKpKoLbrZ6Us+U2QSQovPP8Ktfa0hFwxwfFIzn?=
 =?iso-8859-1?Q?AvrkYlAdCUoZOpZQeIjYOuJwCurkvU/ZfULxlXZMQbMZm58+jS8RDLlNPI?=
 =?iso-8859-1?Q?4xKH2ahQGDpUBQ6kpBwfsxMKPM7g5bxBA9Kpuw2kz9QJe7VmwPUWj2dPlu?=
 =?iso-8859-1?Q?m7n1nzyAp36nt5DUbSHn+ByZs76Vw2zQPmECuxQ0Egu9AIsTYcTWF4NbOl?=
 =?iso-8859-1?Q?E9l3wC49Ed1LOLZ+9L26vXjr9mVTlHJYyi+8EEL/9qYbxdIBRzAjt+65ZQ?=
 =?iso-8859-1?Q?4VXz21bwiiSXbwd6xleisI+SNe4oVQYX6qmnfYh1XXYwP84eLq14KjFPoo?=
 =?iso-8859-1?Q?H6HBSfhale/A51vdz8AmJPcLNgAg+FlGKtExprNes1zA8e037EvGWxFhbQ?=
 =?iso-8859-1?Q?3eS4phIoo+H/BU3fr/xDQBxvO5f/oSQwJgD16ixSvDHVBLNqeI1wQ/BN2C?=
 =?iso-8859-1?Q?Zas1K4cJfcnyJYTtbWf/nmhiwwIHQiqRubq0tWW7mpT+4hmLuGPu4/NTmr?=
 =?iso-8859-1?Q?mhz4xm8BOVkMYoFZ5zd826S8yheyGbtE46hDfeD1saNXiHfR8NbrdYG/Xv?=
 =?iso-8859-1?Q?+lmTRZJ/GqJQxX7YxTMfyQSHmdkUH5Q8ixW9bTggOntdG69206xPwHjl1y?=
 =?iso-8859-1?Q?I7BvsrRJDUbTbjbRvWQr+3Fh99D1hbKyceQz9MdFOjNIt9sF2MPZBNJMpX?=
 =?iso-8859-1?Q?omCnS+BMwn0I95FdmYsSksljsihFOZDlftxZpDo7peXhfp2unMllv4fwZa?=
 =?iso-8859-1?Q?tgGieOj3ER5cbRc/u73FJmZwPhksCdu7xALH2Z9p3uxhbEBJQm9olmMZN5?=
 =?iso-8859-1?Q?53iviJCDGKpdOGWf/gwIAQAnrO3dWXYmg2sTqW7bLRDfkIcWZFwnDFFEQF?=
 =?iso-8859-1?Q?qOGwf3myM3n2HByLbTkhoxT54aoArhbEi1vXMJVOb344bHnYye0wh5ZxaR?=
 =?iso-8859-1?Q?V59qjqq1/IEk5t8mlmFByw712a04Ohvn6zVj3JM0scCQfjUcnD9Id1e4pa?=
 =?iso-8859-1?Q?n5DvWpPKVeKOuv9eVp1AXx7M6Lra1o6QUxP9jOD1o6BtAZ3ffRDlDT5K+B?=
 =?iso-8859-1?Q?S4gCwsbsDJvCgjlSTmnK6vmn7Fck0z3+BqzEtF1iB1rLKsEJQUN5B/1vwb?=
 =?iso-8859-1?Q?bvO67yPAEU0ku6QgoXN2E/dfhdWit1H0W2wfmJ9nylSgWkQFiAMM7Uz+6Q?=
 =?iso-8859-1?Q?XhsDL5DHEZ3ZvT/q7EyxOGOtEVqBnKoxLj9VqY5x5iG2H3pa45rJp3j9N1?=
 =?iso-8859-1?Q?7Bg3ZxPK6YcP4OrJ1XarpoAbCyxJGx13/1AFaPToJKgdoOXd1GnG3412Yv?=
 =?iso-8859-1?Q?3oRoTcjObXmQgNurB71KhzCRtfql2OM=3D?=
X-Exchange-RoutingPolicyChecked: LEZd+LggCYZIefe5R7zhTfbEEzx4/gm6tsxpxjNwlnyNSZbWSiqGAljA+nbtXr8lIuBsxrA8f5lwZM5+TyTurH9A+OAEqnfcvKf3C9IHmO3Iy11ohlG5QO3rvkZ5tmX2d2SVVfIZLwqQelw7XJwTg7zezYbFu/de3awdjjCpUvxzgS5UAwOWofTdZVy0S6VjFrhhkyOAPpuCrMC3YU8P7CUeX2ZVID0FPjx/I7Q2RM+bRVnAK1aKyCtIc0fBrbnmU4KsBua+87w/sbLQvTIw6Z0AHwiVgOxTsxTbRUfVimNN8VxbjbT53HN7Eu07x6JnPbIZTUCxKGB0SNHLzYgVjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 481000a4-85bd-4f8b-d0da-08dec1a924ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:48:54.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBW/U6evAuvQi9ByLpudRB8S5bR/5WiIgqroUBljYp5ziDSsXkbZBC1uE9U4qQC8pW3hpBx8zaMZwoi8OELdzPQSJ0tu9pgo2BGUi8NhGXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
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

On Wed, Jun 03, 2026 at 12:41:46PM -0700, Summers, Stuart wrote:
> On Wed, 2026-06-03 at 12:36 -0700, Matt Roper wrote:
> > On Wed, Jun 03, 2026 at 12:25:49PM -0700, Matt Roper wrote:
> > > On Wed, Jun 03, 2026 at 07:18:06PM +0200, Michal Wajdeczko wrote:
> > > > 
> > > > 
> > > > On 6/3/2026 6:26 PM, Shuicheng Lin wrote:
> > > > > Replace the per-platform ternary chain in xe_wopcm_size() with
> > > > > a
> > > > > field read from xe->info.wopcm_size, populated from the
> > > > > platform
> > > > > descriptor.
> > > > 
> > > > we might want to update check_platform_desc test to catch any
> > > > missing
> > > > definitions of wopcm_size field in new device descriptors
> > > > 
> > > > > 
> > > > > Per-platform values are unchanged: SZ_4M for DGFX and MTL,
> > > > > SZ_2M
> > > > > for all other platforms.
> > > 
> > > Assuming the values here are the total WOPCM size (for the entire
> > > PCI
> > > device, not the per-GT subregion), then are these values even
> > > correct
> > > and being used for any of the platforms officially supported by Xe?
> > > From
> > > what I see on bspec 67090 it sounds like the total size should
> > > always
> > > either be 8MB or 16MB for all of our POR platforms?
> > > 
> > > I think in practice we always find on modern platforms that the
> > > BIOS has
> > > already programmed the registers that control the GuC-managed WOPCM
> > > subregion and locked them before the driver even starts up; in that
> > > case
> > > we don't use the value from xe_wopcm_size() at all and instead just
> > > verify that the pre-programmed regions fit into the larger sizes
> > > returned by max_wopcm_size().
> > > 
> > > So I guess that raises the questions:
> > > 
> > >  - Do we need both xe_wopcm_size() and max_wopcm_size(), and if so
> > > what
> > >    is supposed to be the difference in what they represent?  I
> > > think
> > >    maybe xe_wopcm_size() was trying to represent some subregion
> > > that is
> > >    assumed to be "safe" from collisions with other sub-areas of the
> > >    WOPCM in cases where we needed to explicitly prorgam the GuC
> > >    subregion.  But if that's the case, is there a way for us to
> > > probe
> > >    those other subregions' sizes/locations directly to avoid
> > > collisions
> > >    rather than just using an arbitrary small size that doesn't
> > > match the
> > >    total WOPCM size?
> > > 
> > >  - Do we even need to worry about programming the GuC-managed area
> > > of
> > >    the WOPCM anymore on modern platforms or is that a cargo-cult
> > > from
> > >    i915 that just isn't relevant anymore?  If it is still relevant,
> > > is
> > 
> > I see on Bspec 60549 that the GUC_WOPCM_SIZE register can only be
> > programmed by the GSC on platforms with a de-privileged GuC, so that
> > does seem to confirm that reprogramming the GuC-specific area of the
> > WOPCM isn't relevant to any platforms that the Xe driver officially
> > supports (Xe2 and later), although it's possible that it might be
> > relevant for some of the unsupported, developer-only platforms (Xe1).
> 
> That's true, but we do have this code there today. Should we not make
> it a little more common in the meantime? Or we could hold this under a
> debug configfs entry or something so it only ever gets used in that
> case? Maybe we need a debug version of these structures in xe_pci.c?

The motivation on this patch for moving the numbers into the device
descriptor was to prepare for future platforms.  But it sounds like that
will never be the case now since no current or future platforms will
ever use these numbers.  So if we're going to put anything in the device
descriptor it sounds like it should be the max_wopcm_size() numbers, not
the xe_wopcm_size() numbers.

For the old legacy GuC wopcm region programming (which may or may not
even be relevant for the old Xe1 platforms), I don't know if we really
need to touch it at all.  But if we do touch it, we should probably
rename the misleading xe_wopcm_size() and more clearly document what the
numbers are since they're not actually the total size.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > 
> > Matt
> > 
> > >    the GuC subregion the only one that we'd need to program in the
> > > KMD?
> > > 
> > > If we're moving the size(s) into the xe_device structure, then I
> > > think
> > > we'd expect the field to either contain the total size (which would
> > > be
> > > the values from max_wopcm_size rather than xe_wopcm_size) or we'd
> > > expect
> > > the field name + kerneldoc to very clearly explain what subset of
> > > the
> > > WOPCM it's actually trying to represent and what it can/should be
> > > used
> > > for.
> > > 
> > > +Cc Daniele since I think he understands the WOPCM stuff a lot
> > > better
> > > than I do.
> > > 
> > > 
> > > Matt
> > > 
> > > > > 
> > > > > This prepares for newer platforms that may need a different
> > > > > size.
> > > > > No functional change.
> > > > > 
> > > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > > ---
> > > > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > > > >  drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
> > > > >  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > > > >  drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
> > > > >  4 files changed, 18 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 32dd2ffbc796..f44c031e3553 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -139,6 +139,8 @@ struct xe_device {
> > > > >                 u8 vm_max_level;
> > > > >                 /** @info.va_bits: Maximum bits of a virtual
> > > > > address */
> > > > >                 u8 va_bits;
> > > > > +               /** @info.wopcm_size: Size of WOPCM region for
> > > > > this platform */
> > > > > +               u32 wopcm_size;
> > > > >  
> > > > >                 /*
> > > > >                  * Keep all flags below alphabetically sorted
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > > > b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index 3165686e3e04..6b7dd8661f64 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -10,6 +10,7 @@
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/pci.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > > +#include <linux/sizes.h>
> > > > >  
> > > > >  #include <drm/drm_color_mgmt.h>
> > > > >  #include <drm/drm_drv.h>
> > > > > @@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc
> > > > > = {
> > > > >         .require_force_probe = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const struct xe_device_desc rkl_desc = {
> > > > > @@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc
> > > > > = {
> > > > >         .require_force_probe = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> > > > > @@ -243,6 +246,7 @@ static const struct xe_device_desc
> > > > > adl_s_desc = {
> > > > >         },
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> > > > > @@ -265,6 +269,7 @@ static const struct xe_device_desc
> > > > > adl_p_desc = {
> > > > >         },
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const struct xe_device_desc adl_n_desc = {
> > > > > @@ -281,10 +286,12 @@ static const struct xe_device_desc
> > > > > adl_n_desc = {
> > > > >         .require_force_probe = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  #define DGFX_FEATURES \
> > > > > -       .is_dgfx = 1
> > > > > +       .is_dgfx = 1, \
> > > > > +       .wopcm_size = SZ_4M
> > > > >  
> > > > >  static const struct xe_device_desc dg1_desc = {
> > > > >         .pre_gmdid_graphics_ip = &graphics_ip_xelpp,
> > > > > @@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc
> > > > > = {
> > > > >         MULTI_LRC_MASK,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 3,
> > > > > +       .wopcm_size = SZ_4M,
> > > > >  };
> > > > >  
> > > > >  static const struct xe_device_desc lnl_desc = {
> > > > > @@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc
> > > > > = {
> > > > >         .needs_scratch = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 4,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0
> > > > > };
> > > > > @@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc
> > > > > = {
> > > > >         .needs_shared_vf_gt_wq = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 4,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const struct xe_device_desc nvls_desc = {
> > > > > @@ -450,6 +460,7 @@ static const struct xe_device_desc
> > > > > nvls_desc = {
> > > > >         .require_force_probe = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 4,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  static const struct xe_device_desc cri_desc = {
> > > > > @@ -489,6 +500,7 @@ static const struct xe_device_desc
> > > > > nvlp_desc = {
> > > > >         .require_force_probe = true,
> > > > >         .va_bits = 48,
> > > > >         .vm_max_level = 4,
> > > > > +       .wopcm_size = SZ_2M,
> > > > >  };
> > > > >  
> > > > >  #undef PLATFORM
> > > > > @@ -757,6 +769,7 @@ static int xe_info_init_early(struct
> > > > > xe_device *xe,
> > > > >         xe->info.va_bits = desc->va_bits;
> > > > >         xe->info.vm_max_level = desc->vm_max_level;
> > > > >         xe->info.vram_flags = desc->vram_flags;
> > > > > +       xe->info.wopcm_size = desc->wopcm_size;
> > > > >  
> > > > >         xe->info.is_dgfx = desc->is_dgfx;
> > > > >         xe->info.has_cached_pt = desc->has_cached_pt;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > index 5b85e2c24b7b..35acb878c111 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > @@ -34,6 +34,7 @@ struct xe_device_desc {
> > > > >         u8 va_bits;
> > > > >         u8 vm_max_level;
> > > > >         u8 vram_flags;
> > > > > +       u32 wopcm_size;
> > > > >  
> > > > >         u8 require_force_probe:1;
> > > > >         u8 is_dgfx:1;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > index 900daf1d1b1b..783bf37c87ef 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > @@ -48,13 +48,6 @@
> > > > >   * context).
> > > > >   */
> > > > >  
> > > > > -/* Default WOPCM size is 2MB from Gen11, 1MB on previous
> > > > > platforms */
> > > > > -/* FIXME: Larger size require for 2 tile PVC, do a proper
> > > > > probe sooner or later */
> > > > > -#define DGFX_WOPCM_SIZE                        SZ_4M
> > > > > -/* FIXME: Larger size require for MTL, do a proper probe
> > > > > sooner or later */
> > > > > -#define MTL_WOPCM_SIZE                 SZ_4M
> > > > > -#define WOPCM_SIZE                     SZ_2M
> > > > > -
> > > > >  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top.
> > > > > */
> > > > >  #define WOPCM_RESERVED_SIZE            SZ_16K
> > > > >  
> > > > > @@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct
> > > > > xe_device *xe, struct xe_gt *gt,
> > > > >  
> > > > 
> > > > while around, can you add kernel-doc here?
> > > > 
> > > > >  u32 xe_wopcm_size(struct xe_device *xe)
> > > > >  {
> > > > > -       return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> > > > > -               xe->info.platform == XE_METEORLAKE ?
> > > > > MTL_WOPCM_SIZE :
> > > > > -               WOPCM_SIZE;
> > > > > +       return xe->info.wopcm_size;
> > > > >  }
> > > > >  
> > > > >  static u32 max_wopcm_size(struct xe_device *xe)
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
