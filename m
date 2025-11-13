Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4251CCD98F6
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 22:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E510E951;
	Thu, 13 Nov 2025 22:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNN04r1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC2910E951
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 22:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763073945; x=1794609945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EYR7DBsd69qOgpFi5PG+keBSQ2cAictNPIVFFwnZVgs=;
 b=GNN04r1EWLBLP+raGxFfpQqWGxEugPDAeXeQDFMAAHXdrH5s4tQPaTtY
 KNhrNS8eAwF1iGEWcIdTJiuZMfJxwUMoA0+lJoZyXeN2gPa8y8sl5IAil
 N5+T5qrgybMMUW8bgwZvodBzIarQBZH3rkg1fXeQkFvvY2CO0s8eNMaNa
 MuyNgqHKeH/ruRans60ghRGCzO3w0cRhIrzTZ9HcpjxU69CNOaI+6Hqvu
 kJ4YAHVQWjVmnGJ8LhF6c4rA/S6ZQA8bn0gDbnP2/y/kH4YsA6+MPAIKC
 vuztHgHssY1j6NmQqk0snZeUybG8/PJSbVBwOZDhXDEoZu57PG5YaEQQW w==;
X-CSE-ConnectionGUID: BbMEr4MkQSaRV3IaCKuacw==
X-CSE-MsgGUID: iDU4ud70QCmZBVSUJMWi6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76627004"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="76627004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:45:44 -0800
X-CSE-ConnectionGUID: zO0RTZ6sQcml0OTeqtz0FA==
X-CSE-MsgGUID: xIs8jYpER6WboQ8VCJnHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="213026355"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:45:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:45:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 14:45:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:45:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vj9cBCTibmWp6orydFn97EquSsgICdKpeZXKidopHwQryW0KcI2VufCYZP0xpXsJRvfT/ixtgxC0D/w1FhyBhInPDUfRmJpaHQG5SfleHqmY25fT6ptJpTBSWHqRc6T0tus5ngmzkFCdbGf7baYuys/AQDMplDbPh8MFh+LfFwYK6A/u6cyxi5BTOJiX56guUOSLUKbAurw9y9dr3zJF6wKuJJi2KsRsqwII368kw5pooinFnYt6aE48Ty57cD7Ekj1W+1gEnj21vOWD/EMh2duqw+vQLofWW3hBohpJ9ecDV01qPuQ5OKh3mKrT9U4bJaj8YkTNWaMIeWTa7dXOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYsi3X3x6Ln5Nb4NVY8obPfg95Bd0vWaHWEKvArHXm4=;
 b=xVFtbOHuvuSZCCPPmQ+s4Adse5Lai0ARviVb/dJl8FidJhnGliYH4eyClylh+4/DOUc6cfeLLdUsd6L+EsDCTUdU27SHuvGWgxeRxHRTSeO2fLYiF21yFME7qfoakR5uUAzmdkPBL15vjdCX4ByesjeZH5Pz+5y+O/odbsbXDbGbh5V+UxxEqRrcyBkgHIPYc+cLlEQzl6yh73LTD6+P3YriyV0yd38z7U7C8ez0k6z8t1hURO43naWA2K3SPiEAbST/+0VGFKOG2NSwzgUZST8EFNsnwBkWGlrQz4Kl5rAup7CZGIvIILhjEopNc/Wp434/rG6VVrTq5jMmx1wmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF5F1DBD8A7.namprd11.prod.outlook.com (2603:10b6:518:1::d26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:45:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 22:45:41 +0000
Date: Thu, 13 Nov 2025 17:45:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
Message-ID: <aRZfkujQB1QV9D4v@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-6-riana.tauro@intel.com>
 <aRTQCoNGUf_D0f1F@intel.com>
 <291ca7a1-51fb-4f28-b1b7-1e4f9d12878c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <291ca7a1-51fb-4f28-b1b7-1e4f9d12878c@intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF5F1DBD8A7:EE_
X-MS-Office365-Filtering-Correlation-Id: a2135dc3-182e-4919-283f-08de23065f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kjuEWQSZNk1JVHY+vLchSrrwBlDWOmNLZz6aO9INvmpeFCIFjVWEJX+vW9Qt?=
 =?us-ascii?Q?MWy4ddWS2bUsyVV67QpIvzW4UryB0Z8xLO5sQkVXYVxR+qrgaAfSeiqgZEKj?=
 =?us-ascii?Q?pyK0ne2UH5wzRn3GIR6X1KW9V3QcK1O62wGrWbW5HbNdw13uYcMvM0BUofC5?=
 =?us-ascii?Q?4HeO+uaQinv/zKeuDpXdlYGfhvtHFxa/cLb8vml68pkwh0JDzRamzYaw/+oN?=
 =?us-ascii?Q?FnOXaKyts4UNh+j6vSU9WpuKVGAAApvPn4oKWgg7rfgWIQpfXGCabdFzemKY?=
 =?us-ascii?Q?IGtwMu3GJ2ckCQ4DXGowFTI6RKMXilv0Zb0U32yPYQzBwMK2UayWP/tJA08q?=
 =?us-ascii?Q?bBc5GKrYg1Fq+bYRbnPABDmQcWEMt7m88Kv0OQlJQ8yqAeHqSzLncaDhsIAe?=
 =?us-ascii?Q?uTNQAwZHzst00O2fMlKBYcv/1Tz2qqd8Pw0qreWuAwnFFKvyuqcQOSN6w//F?=
 =?us-ascii?Q?OPvI4AAq/bOi4vXAieE2RcZkU507tSoe70AxjIzlH9grfQdbulhGMevwHa4J?=
 =?us-ascii?Q?uNryBNoMY14YHPzFVARpKWluxKV45xPNK4eEwALsufmbdZqm499hDK08MqUW?=
 =?us-ascii?Q?p+LX5d8TNPhjiFD1lnILq1pP5VwL/uWXbnlS4lBS0ovP6sEjjRh4YmfHlp+6?=
 =?us-ascii?Q?aXnQWPbnlQ/LkKYszEh49iEN/aLNlOZjZe8ryThm3Ql3Lbbo9CUvmWGUp+2R?=
 =?us-ascii?Q?4nebvSzMKAKun9+moNWIbXdUhR9H2t1XLvBDaYa+vsVB1CScENDvTUCjerE2?=
 =?us-ascii?Q?xsM0JGv0jjnApcvlOv4y1kO1uKkG7xGoyOXmOyK6xFjx1FHYzuu8q2CajbMp?=
 =?us-ascii?Q?vhDeUAznvyxsRSw7rozDFKYlOGksLlSkpNOPiQ6fK/1AV4QfRg7GmqOqN+CS?=
 =?us-ascii?Q?O/ytrJIV+n0G830qHvcdU/dRB2Xpfi9BqTNxAa0m9wHHn5uC6sI3Roje7eo+?=
 =?us-ascii?Q?zYNYN2f+TZ8hO9LLTRtbC1K+azpFAv4AIehpQbvAtWVZFZfhgVnu5I8ZPfem?=
 =?us-ascii?Q?8xQb47WvUnD4keFxfuksOzdLut2IqeA2QcfU3KvG7pQ08mz80dg9/y6ZHxUf?=
 =?us-ascii?Q?Awonr291y81wMx2dDmr0woNQ3md4y2FIdyVZK0AC7Z29EEmuoy2VXS1a9bWm?=
 =?us-ascii?Q?Z2CmzSiBOjR6IJNrgGwZgAM4kXfukKas2X5UeykUutA0UAjFE8gN+eLE6ptz?=
 =?us-ascii?Q?ER7QZDXLM2zxbyOP0FFkhF8JlNwrQDfgbV0XzzUhtaK2oaq9SEFG+lYbfSJP?=
 =?us-ascii?Q?RelJPPAyIlPrPHmqb/1Uj2+fKy0kbEdt6aV/F7O2/ouYwjNjiat8sfQVJ9Qs?=
 =?us-ascii?Q?FaCjwNSGdAhdER1fInnpmByYyUDNY74znJAb4OlAS8Zblk4yQTy7F8XDrL7T?=
 =?us-ascii?Q?DyMXlT8G3SYb96KM4XwImdSAOFDrtM60rD1tEs1m4h6yithE0ERPt9jPWoQj?=
 =?us-ascii?Q?1xwDIMob3GtVakUIzm6KejIG7rWrLR7b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9e29fZOD4y3cjTKi4lQ9K4Hrbyf50+w/vNJVQjIox1QeOJ8kn0oTp6N49aa0?=
 =?us-ascii?Q?lJcOcJ1TRK82MiVVwx0DsFi5aQyKcnQ7gsYgbfOA4/Brvqt8S1dvKThRfjec?=
 =?us-ascii?Q?tEaYzAWS2DFkqxuvIu0CDfNVhv/y3zJ9iQhjskt7L/FJNQ6sDHF0axFH5GkC?=
 =?us-ascii?Q?1/jms5e2vM7O6DmqS68HNmYH4LukfyZt396JJWsGS9AXW3OjIeOKb6Vcqt6O?=
 =?us-ascii?Q?UJ1uVG90TVL4b3Tc3h/OfI8BjeKR553detUTFasQwFKtB2NlWhBlOLGLp1EG?=
 =?us-ascii?Q?wXzy4WBKDI57gBqDEmsqV9nJqFpO+IKu0TSnQxWVmDQFjNcLUqD4TC9gQWqv?=
 =?us-ascii?Q?28NzS6uIwP6+l5dO95cOmabXEqx9PK2IZ3EhP3sz4clkmybFkX8zYbGABErR?=
 =?us-ascii?Q?zwGDBaAXmZhO3b9IKPLztzwumUJQq2D29B1jykV7lUgUeDHbmXHWXY3J1AGF?=
 =?us-ascii?Q?p68HOsdILqFPwvqTJOjpzQ88I03uD2XCKcAexAzgxOYamFfPvctYzm18LSsG?=
 =?us-ascii?Q?STqS8SAULBP+pesRYodIAd3ddFC9baQo14a3ANVAT/PTWYJnhS/iL4rMMQn8?=
 =?us-ascii?Q?o344D1x5Oh6VrPoC8gIk16XqtvCtx9D0OTlicOdxf69lpJ8ER2Pq/GjtzQjG?=
 =?us-ascii?Q?DRKlg/6a7HnCpHR4yf6ZxkfsRHPUdm8dsrTIEjpbxzfVuJ5aZpBnGRabAC46?=
 =?us-ascii?Q?p/whaRLyxqRjuHr76fffIiQvcRgsqkfPKMVWMH5VlfLSnt9cSFAh8QwmoeUY?=
 =?us-ascii?Q?Xn0XSqX7meOyt2rZBqisUguIRwX7fZuJpwTcJL6R33/PgVvdHasro0jlB9vI?=
 =?us-ascii?Q?UYWSNgBKkiqT61BmajzSyv9zkvj/dGINko8j9O0EXkRuOrArGHj/sIw0MTU4?=
 =?us-ascii?Q?1dkouA+NGkx/eOlHADkcjl+sGdNEBWPaAPi2vyQgbCssDZIxgjKUqpkuK6lr?=
 =?us-ascii?Q?8awd+spfaa5tCJErbRiClpI8EioGFE0DntGSCq5MBZLr7CBgrK92/ScwN/ts?=
 =?us-ascii?Q?/G0w7x9Jtyq3M3+i8USTklNGrRXch53A0BCkVw9NE2MzyZxKYQmvRcuWCN5p?=
 =?us-ascii?Q?q4jJCQ/XrCU8Cn27yj3STz5Tru7efg3jBwlWfumIGctf0AHiSwmI1iFvdapG?=
 =?us-ascii?Q?tmVazmpS6Fw/HWRypiLspB5YKgd8twoU/vYc94XFJ/OKw01MBeOaAyUjujKM?=
 =?us-ascii?Q?JykcEojOJQ1jHT4ZJC6yp+03DD40SOmh1G4pv7P3V7TTszNwsriPNvUn1tOa?=
 =?us-ascii?Q?moDpq4DeuenU8UD6gC+pzVpVsS1mPtSt+9UyvsqA61DS3ZKhceekxbpZBO58?=
 =?us-ascii?Q?FlxnVGq3BvnRc5g/rKPDJHGgUCBd8qwaA/xJJNUDLyWKxnwQt5+ZCjl3GJd4?=
 =?us-ascii?Q?rP2FTxz0ppWVk+0zlRLAYheaBVkgfVv1/kd/EirdNN3l4jCxjfjot0rUYX13?=
 =?us-ascii?Q?BBL3KAt/Y4mg9f1ohE5boocuTATktJkC/3eRbughdWTJwZeoSiNzzj37uKXp?=
 =?us-ascii?Q?U4P1YVpsoF2VW9PozkKotEHs7+FrTkYZBeEXR80QavcoHIURMKYfPXMrosbI?=
 =?us-ascii?Q?bjA7vejwgNhVQCFrTELSQVKST8fE8Fftnn7OY3ZBYjvr3o6RLHT580v+ovOY?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2135dc3-182e-4919-283f-08de23065f8d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:45:41.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayYZD15dwW4WXim2xs1xc7oUZz5/40Yvw/9LHHKDBdAmnOgDxghbZq77agC578j8OuJHgs3qtwJNL3wxJnfSMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5F1DBD8A7
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

On Thu, Nov 13, 2025 at 01:56:19PM +0530, Riana Tauro wrote:
> Hi Rodrigo
> 
> On 11/12/2025 11:50 PM, Rodrigo Vivi wrote:
> > On Wed, Nov 12, 2025 at 04:03:39PM +0530, Riana Tauro wrote:
> > > v2 survivability breadcrumbs introduces a new mode called
> > > SPI Flash Descriptor Override mode (FDO). This is enabled by
> > > PCODE when MEI itself fails and firmware cannot be updated via
> > > MEI using igsc. This mode provides the ability to update
> > > the firmware directly via SPI driver.
> > > 
> > > Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > 
> > > Userspace should check FDO mode entry in survivability info sysfs before
> > > using the SPI driver to update firmware.
> > > 
> > > 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> > > 
> > > v2 also supports survivability mode for critical boot errors.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
> > >   drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
> > >   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
> > >   3 files changed, 46 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index 92bfcba51e19..d41f07f9194d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -77,11 +77,13 @@
> > >   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
> > >   /* PCODE_SCRATCH0 */
> > > +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
> > >   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > >   #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > >   #define   HISTORY_TRACKING		REG_BIT(11)
> > >   #define   OVERFLOW_SUPPORT		REG_BIT(10)
> > >   #define   AUXINFO_SUPPORT		REG_BIT(9)
> > > +#define   FDO_MODE			REG_BIT(4)
> > >   #define   BOOT_STATUS			REG_GENMASK(3, 1)
> > >   #define      CRITICAL_FAILURE		4
> > >   #define      NON_CRITICAL_FAILURE	7
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > index 3d9417911c33..d22fdd08d227 100644
> > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > @@ -16,6 +16,7 @@
> > >   #include "xe_heci_gsc.h"
> > >   #include "xe_i2c.h"
> > >   #include "xe_mmio.h"
> > > +#include "xe_nvm.h"
> > >   #include "xe_pcode_api.h"
> > >   #include "xe_vsec.h"
> > > @@ -66,6 +67,11 @@
> > >    *
> > >    * - ``aux_info<n>`` : Some failures have additional debug information
> > >    *
> > > + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
> > > + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> > > + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
> > > + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > + *
> > >    * Runtime Survivability
> > >    * =====================
> > >    *
> > > @@ -95,6 +101,8 @@ enum scratch_reg {
> > >   	MAX_SCRATCH_REG,
> > >   };
> > > +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
> > > +
> > >   struct xe_survivability_attribute {
> > >   	struct device_attribute attr;
> > >   	u8 index;
> > > @@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
> > >   	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
> > >   	reg_value = info[CAPABILITY_INFO].value;
> > > +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> > > +	/* FDO mode is exposed only from version 2 */
> > > +	if (survivability->version >= 2)
> > > +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> > > +
> > >   	if (reg_value & HISTORY_TRACKING) {
> > >   		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
> > > @@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
> > >   	struct xe_survivability_info *info = survivability->info;
> > >   	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
> > > +	if (sa->index == FDO_INFO)
> > > +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
> > > +
> > >   	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
> > >   }
> > > @@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> > >   SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> > >   SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> > >   SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> > > +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
> > >   static void xe_survivability_mode_fini(void *arg)
> > >   {
> > >   	struct xe_device *xe = arg;
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > >   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >   	struct device *dev = &pdev->dev;
> > > +	if (survivability->fdo_mode)
> > > +		xe_nvm_fini(xe);
> > > +
> > >   	device_remove_file(dev, &dev_attr_survivability_mode);
> > >   }
> > > @@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
> > >   	struct xe_survivability *survivability = &xe->survivability;
> > >   	struct xe_survivability_info *info = survivability->info;
> > > -	if (info[idx].value)
> > > +	/* FDO mode is visible only when supported */
> > > +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> > 
> > should we also make the version a file inside survivability_info?
> > for explicit check instead of implicit?
> 
> Are you suggesting that we had version in the sysfs and let the user check
> both version and fdo_mode entry before deciding?

nevermind, I think I might had missunderstood the flow...

> 
> > 
> > > +		return 0400;
> > > +	else if (info[idx].value)
> > >   		return 0400;
> > >   	return 0;
> > >   }
> > > +/* Attributes are ordered according to enum scratch_reg */
> > >   static struct attribute *survivability_info_attrs[] = {
> > >   	&attr_capability_info.attr.attr,
> > >   	&attr_postcode_trace.attr.attr,
> > > @@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
> > >   	&attr_aux_info2.attr.attr,
> > >   	&attr_aux_info3.attr.attr,
> > >   	&attr_aux_info4.attr.attr,
> > > +	&attr_fdo_mode.attr.attr,
> > >   	NULL,
> > >   };
> > > @@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
> > >   	if (ret)
> > >   		goto err;
> > > +	if (survivability->fdo_mode) {
> > > +		ret = xe_nvm_init(xe);
> > > +		if (ret)
> > > +			goto err;
> > 
> > should we really fail the survivability mode here?
> > Or keep the survivability mode with some indication that fdo/nvm has failed?
> 
> FDO mode is only enabled when MEI path to update firmware is not available
> due to some error in MEI.
> 
> If initializing SPI also fails then user cannot update firmware in
> survivability mode. Staying in survivability mode will not be helpful
> since both paths are unavailabe. That's why added the fail

But then you also fail the probe anyway right?

> 
> I should remove failing on mei_init instead. Missed that. Thank you for
> the review comment. Will fix it in new rev
> 
> Thanks
> Riana
> > 
> > > +	}
> > > +
> > >   	dev_err(dev, "In Survivability Mode\n");
> > >   	return 0;
> > >   err:
> > > +	dev_err(dev, "Failed to enable Survivability Mode\n");
> > >   	survivability->mode = false;
> > >   	return ret;
> > >   }
> > > @@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
> > >   	if (ret)
> > >   		return ret;
> > > -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> > > -	if (survivability->boot_status == CRITICAL_FAILURE) {
> > > +	/*
> > > +	 * v2 supports survivability mode for critical errors
> > > +	 */
> > > +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
> > >   		log_survivability_info(pdev);
> > >   		return -ENXIO;
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > index 1ed122cf62f2..d887b443b397 100644
> > > --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > @@ -37,6 +37,12 @@ struct xe_survivability {
> > >   	/** @type: survivability type */
> > >   	enum xe_survivability_type type;
> > > +
> > > +	/** @fdo_mode: indicates if FDO mode is enabled */
> > > +	bool fdo_mode;
> > > +
> > > +	/** @version: breadcrumb version of survivability mode  */
> > > +	u8 version;
> > >   };
> > >   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > -- 
> > > 2.47.1
> > > 
> 
