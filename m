Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78460FB3CF7
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 10:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC65110E0D2;
	Mon, 30 Mar 2026 10:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqjPAlAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210D310E0D2
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774865192; x=1806401192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKoftAxSrsJEebWIqvtjJ6CU+uSXewG0Xhwo91frc5s=;
 b=FqjPAlAuBTb2PEUG7RB3fwUziPVOmUrFsNen1qkLx/pi5QxxOwNwEa0B
 NDu1Aqq+FXYgJ7qv1M3wQnwmBooYqw8FpmSaKdVHfU4165mDoT3IpmGMy
 2fDk9mA1bJ/HMPyTqz8k4AAiK8NUQvOvimdo/3zWsjqYWwGQg19XOMJhd
 k76MiZWSQHsazeItnN90lWm8Kkze+OQ2lQLdQlkGy1fQr6k8mMLtMmYLu
 jNfRxNqB1pdfdm6ma7xF3zvAw+VJlyPykk6EP33DmXSZl4QN/I9zV/NSb
 Nh0hWiyUPoAM9LG/s7M1+GIdOZMK/WEh4s2DCbc0dk3g9ZrLUtLb0H67C A==;
X-CSE-ConnectionGUID: c07ijwWsSYq0v0tZK2OeUg==
X-CSE-MsgGUID: Q/DjvFgwSOWpf2XqGCzz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79456454"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79456454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:06:31 -0700
X-CSE-ConnectionGUID: SrI9aZH4TTaY2XsHbwx09Q==
X-CSE-MsgGUID: qMf5RZa4SYW+Prcyq7bFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230927751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:06:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 03:06:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 03:06:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 03:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq8uxoFJ/cuw0HhKn7ZDpj57ppJc/IIOzn41GJoHXST5yr17R9oZfdA4+5/ic7fZjw9tkYBh8quWhSPOb79kC8Z2wTnf5w5iiAJ9Fj9hCbHyxMWShkE/fCffxSvXbQ5/P9iL1a7bOSSoahXcQ82V/e5HwFd6sb+VkfubF1FLSVgLpQu74JglaGrY/YSh63HyRbWlHtF1ZUhuI5qJ2LT7VV9yfJBBZq8vAxDnVf3F6r7p7TzDPTOzqA8iCWM163Y++eibI3BMwhRUa8S6UQZ1j+wQaG9SPokR2UK6mDlw8ky0m8cStiE6bZo0WoWBi94bNzooaaYbk/97wEG8X8sdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+T4ZwDCJfioZLjYjd7kQSVI2yb+03tCriICo7utfKE=;
 b=ejjudCXNrNqx8XQbgJ05BpqyXC6jpcxFHybpRl2mPaVzDmrejj2fqKGbQ5PCBYuGg/ptTYRFRI2JR3IIo76yEc1k8qvR66ftSSIGyRXDfD4Q7eGhd7wIUbnaizjIZ0wAJ6r6CbQYoFu3e3x5MrPKkHnTxsf8kGKPPEXVH33dQ/OGvtD7tk9omsTyvw0PScrB2PnlJ91hGBdyVT+xxnoZ0F4pttmo8dQJFL1+H1MUG28LjZb5gjUpcRJnv2qj7AwQBUBmGcFJc3SDOO5ooLym7tPiM0bhR+93+6uM7rATWt5xG+8seqiaNYMUflxeovSTs1GnIOfbTSbxETap4b+ksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ5PPFED9C9AC99.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 30 Mar
 2026 10:06:26 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 10:06:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Add Wa_14026626235
Thread-Topic: [PATCH] drm/xe: Add Wa_14026626235
Thread-Index: AQHcvbv+0brsQuqu80WjhDdP4aDkwrXG3YxA
Date: Mon, 30 Mar 2026 10:06:26 +0000
Message-ID: <SJ1PR11MB6204547CC4533FBEBA5319348152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260327080719.2136248-2-nitin.r.gote@intel.com>
In-Reply-To: <20260327080719.2136248-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ5PPFED9C9AC99:EE_
x-ms-office365-filtering-correlation-id: 967ecb29-20de-450d-d64d-08de8e440125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: z+f6LhqKrX4SQXIdSzJPj/AZx3PBeXFKs6eS8gQ0HsTN84I89n+sdFbMLxwkQBesfqDKqzfQbG+Rp5sJw38UZJybjSF1pqZD0YqhPY9T3py6ollYk6uZjC8N7oWsUYNInM5+4MQaP4g1QRdzIjcE3+CWV6nR8+QKQW+ZzSKuSpRXxsBt4CmIC6R/PR98623DdRk5ZHDic4CW777vPl6xtfb+I1sp30e+T1L22S/trojWz9T/ShwT62h6X8QbGcKYQ7k55cCJS5Lr+eW175A23RjWZNa4GYrgkfpgKSumwUxjZjpWg5kI6SspLjNPfnNkAvMKh/cXXIhWc35IOKxGWDhmikZVSRMoI06KJxOHuOBFXIDtD3MB+yRxm+OSmifW5ADySDWwM/8mM+fkg1SHn2ApWHmtunwQS7SLYksvv/yF+MYFvfeVy+NdTvpevjAvRpzp2waFKYjb/DreudBOtYGyrcJZk4wmJCBqtDIOneBbd+wFRf6/xVQw26GaUbAyxE4MD94BHijsOXjJElIoLIGzUgzo8ydsjHSGoYUgZsraj9IpJphDJkuw5A/daj9+VSpdr+PHdg9fWLGPiRJNeE1F3NiAXLd6+DIqEq2H3CL0czshf7CAXEpjPMWx+r/4hiLCZiX7Oaj1qrgDHZwf8rNvFrd0w7TVL/L/P8rDBR/mhuxmAbAAFsnjEYZpfsRr2myUZYGhAk5gP48IKuwjPev2FKXOP88825aG6a1zspl+Yn1fi7qWtGEL/rnp0B+RKYJ54GjxUKEkDaVLFj0r47LNlhiXWjwskWuJSSg/qdk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7bQ6ukOspOy8QhkcGxqItpBmC11S0sIII37Q5wvMkFMo13xUvYEmh1sNWV2N?=
 =?us-ascii?Q?7Vh4rXYtj/z6kk8m1PJYkagQdbzKhLwO15Ew1mQm1f4DtnLLpZLXECW1H1Ec?=
 =?us-ascii?Q?9iJytb9jIVf/wY9+uZA6K+ArkOb+Gq5GTg0jgc31Y4J2HYNypZOWzxu2MQI0?=
 =?us-ascii?Q?jZiUs8vE33WyZVn6KRosJVR5c0tmyO/HGURZIqFJFClKzRahzgscoeHINmxx?=
 =?us-ascii?Q?Ti/tTsVuQqMfsQjqOEaY3xDQcaGRTTGwG27kWLy729Nx1+nUtfLZfKQY8oN3?=
 =?us-ascii?Q?oSyOIxonj7w8I1Foo68imhfRXL0lgo/Pwj2NPcqRAyM6RMmM9gss1iQwh57u?=
 =?us-ascii?Q?GdaHj9ocXx7xiuCcFDFRAYw0AIQTyOyzvW/WdTenb7FLqhxkzpM7K00afJKG?=
 =?us-ascii?Q?/WEU/jlI/oGCFPO7M4HLpXrK59Vfuff83M/MYudTBNO2hT+VTFd3o9jUED2k?=
 =?us-ascii?Q?HmSUf/1TsVi66hloRtQhz+QVZnyI3eONQmb2v9Rv8IYfckj6emR69UNJ/zJ8?=
 =?us-ascii?Q?QnMu0PNERu+ygokk4QgxJZR1IOX+luISFgNwPqpojLpxQgbfG/Xiq894qFck?=
 =?us-ascii?Q?MrnI4t1D+X0++vCkhp7GMBDb+P7sxrIYV6z+rLipoida2N88FCdSyiweOeWP?=
 =?us-ascii?Q?DXLhX5l1ppxnP0F/S5YbMUAIYwZYbFaz3m7AgKx8UWzdJcDtvfrzUixeOCMH?=
 =?us-ascii?Q?QTajiOfOaep957xEO4QMcfj2JvbW6gvqPg0VFXc6w9yjfvMzZCrwkv1xoUxO?=
 =?us-ascii?Q?DyYkHyKrVF6ngsxlFLIOL6Pc4RItYgvbHhOYCOZxhQn6K+Ep5dtF85LHSV2e?=
 =?us-ascii?Q?93GaUMhesZ2M7FPs2sWjXowsAyb4xmHmL8Jp1mct50ocBqs+oT8Ukx58/hxo?=
 =?us-ascii?Q?ISr3Mp+doETP8bTpTHDmdjf731gNDa/IOG9UUWyLhqK5vKkcuE7HIYkzVQn3?=
 =?us-ascii?Q?d2soG5wYA4CwTOhJOXcQkw4Srx6s4jbvpD8pNx/P8XAOq1PqVJxjgkbEFMne?=
 =?us-ascii?Q?jQATBLeWBARXb2677h2k4RJ+Nsm8U2n+LCbleLYoOwUh83QjJkXDDvpudl2L?=
 =?us-ascii?Q?r7zSTtiulPU1cD3C/WubKE/JhGYvCAoq43a+K8fRboboCpD7rtUU0XUyTYiM?=
 =?us-ascii?Q?0bKw2+B4py/Osu0I4mBLROO4Q1XR+W89x1PBU1LvfUj/G0bApL4fSAP/fCYr?=
 =?us-ascii?Q?BFDrWzMkvgvUqY0r+FVvkVW144MBiPM8rKu7i4nRO4+85/MO0mhdhfIgWZ9t?=
 =?us-ascii?Q?WI//yZpVWmDuFInJF21po+rYAhLLrwjVDTvVqECMCZF4qWsIUAhOUk3cTLpl?=
 =?us-ascii?Q?gvsQ4El90mBqa5YIGG7YPdSXskNYdIsWdKwadlFlTXGHOQjz33VfX9c703hQ?=
 =?us-ascii?Q?UmZIwByMinYQ/k+S2vf5XaQAsdlhjGfaDazqjomoy00oCRzEzWJylvJWXTXT?=
 =?us-ascii?Q?8vRlz5CmoncdY8HQ5ub0ABBdnYEnbTG2npeuN4fxHdykfd7ggRClZAWgf9tj?=
 =?us-ascii?Q?o/VhtyQSIo4vmwYt3yKVRqrtYVXQIL6LajrUpjmDn7ozlEHIJUEJBoW5cNEC?=
 =?us-ascii?Q?hT64kFAmEhPPNvS5KhPWmRwaq1RV/3yEKCpmUDv5zZJm7JhpD1C17LO6kWBh?=
 =?us-ascii?Q?Vh0G0PyhhZknfvuYj/ROkJW8zbwUctY9LeOEfBgK5i3i+aTVXJCtJFPb9VYr?=
 =?us-ascii?Q?C9wkD8GY8wubxW7/bKb0UvkU2PzoAjznDzfLF5PTBuy+HJWF8CndYyE4UEJ0?=
 =?us-ascii?Q?UrEtI5GfgAEW6LBM4fi7EUH34O+qjeCigBJj1Ohsf4WroXjZIOTXLRHUo2IH?=
x-ms-exchange-antispam-messagedata-1: Zj3UOgTrczvIUA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JDtzpveBztMhfeOD4yISo4Ofz6JV/g0zvAiOifKG+KH05kZo+5MbSXj610jbjxLEdjjbLRFLC7WuWKgpqe65tnxE6lAvRvFPptODJnnXRSagmy16lGGrQ0ETHrgVSfPM5mabVv6epGR0Tu7WTBRcVDsNP1bosaIvfA5HqheRM1FVTZ3HRlUlbvY42jYoOwvqpRimOX/5darvodubIZi9ECI71MAsMUtJVz4g8ZaNl7/n4YNFg/k+SaRoiNqs62mb1La7oUK/RhE3+6T4H+ha0GWzjmvY6XFxAUhmw/JEUeJLkoVpRZFop2JJ1b9ufGdko1jp/Oss4u4n3UA2v8DlGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967ecb29-20de-450d-d64d-08de8e440125
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 10:06:26.1210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCCzygNWHwyNMS0wO0ozeY50x0fzngeTeR+rUqu+5a4L8LlFamrJSZ3kiIYHNzS8sYXAZGScbMH1eYqIhfOjQtAya9YePc30LaO7Pv2ZUJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
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



> -----Original Message-----
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 27 March 2026 13:37
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Add Wa_14026626235
>=20
> Wa_14026626235 requires two changes for graphics version 35.10:
>=20
> 1. Clear bit 6 (9th on state change mode) of PSS_CHICKEN (0x7044) via
>    an LRC workaround applied per render context.
>=20
> 2. Disable preemption for the render engine by setting the GuC
>    preemption timeout to 0. This prevents the HW from halting in the
>    middle of a 3DPRIMITIVE command and inserting a flush.
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 8 ++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
>  4 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4ebaa0888a43..db45d7908ebb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -167,6 +167,7 @@
>=20
>  #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044,
> XE_REG_OPTION_MASKED)
>  #define   FLSH_IGNORES_PSD			REG_BIT(10)
> +#define   PSS_CHICKEN_9TH_ON_STATE_CHANGE	REG_BIT(6)

Name should match Symbol in spec!

>  #define   FD_END_COLLECT			REG_BIT(5)
>=20
>  #define SC_INSTDONE				XE_REG(0x7100)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a145234f662b..d2bb574d422b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -12,6 +12,8 @@
>=20
>  #include <drm/drm_managed.h>
>=20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "abi/guc_actions_abi.h"
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "abi/guc_klvs_abi.h"
> @@ -44,6 +46,7 @@
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> +#include "xe_wa.h"
>=20
>  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>=20
> @@ -531,6 +534,11 @@ static void init_policies(struct xe_guc *guc, struct
> xe_exec_queue *q)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
>  		     !xe_exec_queue_is_multi_queue_secondary(q));
>=20
> +	/* Wa_14026626235: Disable preemption for render engine */
> +	if (q->class =3D=3D XE_ENGINE_CLASS_RENDER &&
> +	    XE_GT_WA(q->gt, 14026626235))
> +		preempt_timeout_us =3D 0;

I think      .set_preempt_timeout =3D guc_exec_queue_set_preempt_timeout, a=
lso needs similar handling?

> +
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |=3D
> SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 546296f0220b..fe9ca153b33d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -789,6 +789,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("14026626235"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3510),
> ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(CLR(XEHP_PSS_CHICKEN,
> PSS_CHICKEN_9TH_ON_STATE_CHANGE))

It looks like default value of this bit is already 0.

Tejas
> +	},
>  };
>=20
>  static __maybe_unused const struct xe_rtp_entry oob_was[] =3D { diff --g=
it
> a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 80b54b195f20..3f2582568171 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -58,3 +58,4 @@
>=20
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14026626235	GRAPHICS_VERSION(3510)
> --
> 2.50.1

