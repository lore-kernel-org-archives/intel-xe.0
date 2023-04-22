Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0584C77B61
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 00:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D5010E1D0;
	Sat, 22 Apr 2023 00:17:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9B410E1D0
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 00:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682122669; x=1713658669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zHvesPNVfBhqysjw9vwEKlqe+DPT9hBzWklbzws+QPU=;
 b=nO1MRxURtkYVTF06/4fclvig7q//LECsGJXAcbOg5GBGzLlUNj9M74tR
 3kMZItWWx5ciofSdmJrIJv1HUkBOSug06lIoFFDQM0XNF0wD4p3p2ruG4
 Zwn9ZuTOA2kvzLvHdkvMn6gZ0gOix/ZOu6XtebZ0VQRMoGj/bZnFIcy8F
 IBqMhzws2cSiaj2cw3gIN5/4kYlIH+y1BOzRYUSigXcc7DF1gQ6aiLOFX
 ErZ7JSm+p+F+dMBlIuSz9k1XUT4Uto+LPqC9+lUCb86uUi+es+yI/rjN1
 sE2gVEFCaTO2bbJC0exMByWC8c4o7qbvsFPBYFa9WoNeKNacnvE7Demez w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346128854"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="346128854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 17:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722937206"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722937206"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 21 Apr 2023 17:17:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:17:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:17:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 17:17:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 17:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdSdNhnL5VpB9Qa7mu/8Bzs0GMfGkxNX/nIrWvgenfadaB9zWLNzPC/osHiKCM3FGtE2o7KLVhl95u5B/O1O6UOiPn5xAhUI31As9GUc60zxdD9cxh4oVA65y/GRe3x3vfZCRvY9SOBsXiZUFm8CNW6/TvOdZWDYepdLQjkDFA328HPx4Gu8cDbV6hOwAY0LQnIfWnQ9vPcvKwrkdPG9VYUND1DlNq/pdhihokN175L4A/NQm4iRWFio5ke9h0rFhd1O42Q86m34yE9a22xvgg7YL5mxZeACIgr7VzWPlg5bcP5S543LVdg4LMev8urTKQOPAQkV17L9F11BMPnTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4q8KnM2I0/v+fHtYTRkioyY4hB9KmKb7wlVASgUonU=;
 b=B01CegD7DXkPWk1JE+UjsrEQInqRZ2CVAk3SS/smMeb9dUtBvWawx/8iYqcVjrv+aoSsdCZVZo70LeOzNdqGGBkc3OSXxtOVmNPGRFr9B/SA/H7JMw9ncmOYIkX2mZqi6rjWpCHGpiw48bMuM1pHZJQ7rG7BwWUYoquT5lrtm0H3qKAEjYaMa/vEE+A2Z5UsvQ6+s29pU9k4otmp5XzTQo5tHEGX/gzpvkSj7Eg2/fuXxRV13LsrCY32un41k2eA1ci8o8wsdPlJpdX7aWVKfZsGow94h2yBh3SksYra+OzpewaPqf5xuANWe5aAS6Rjdyymv+bZHO0bmMw25ucItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sat, 22 Apr
 2023 00:17:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Sat, 22 Apr 2023
 00:17:39 +0000
Date: Fri, 21 Apr 2023 17:17:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230422001736.GS4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d20355b-4177-4797-ddea-08db42c6fb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PhKEYgK409MiYejsVVqQ/sAHXPud9ml7SbmUSOfB6iD/CLld1eJa1o+U02DarTcAkkXj+B7oTBpC9MBEskCZuOYjhzS9SmLuDpjWRR9WjacPZL/NLH5YTIA+P6I1VrqR+A/pmRmb0cJrqOZETdcCod/3/Wl1EKqohKFXNjw6hgGeg7oHfUMBpWkXRWsNHzeIOahWR5lNSb+lsYk9XbgBeEay/4HYxUTqYYWaTVSXCSijd8vjyJ1DzKN5wAH+77LZUOVT7Z8d1McrU60sEnHuQA62LvTD5HTvkZmtJ8haH4MiVphsDelA61CfHI/5B10xafKDBYjfADe/5ULSGZU8/p97XPKOy+DzMEjLW+lWeS+eVcEoPtmTM5NRtS2d3MCgVjhA+Eua4wcX250lYbL4lrmx4kRyekWhkbaIk85lf4fjWKqaRvH7/SMunePJmmkLbMFHCRSTnuqJ6m2M/ZMcbmtOYcN0ez2eGjZXtJqQmZRe0R8HmEc5hzC7S9+FOgx/jmsqkS4sZswC3tvm+aZA4XkMvXYXh12Tl7oTzykEJXNLXJxdlmhS+NvWBboXGOF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(66556008)(4326008)(5660300002)(86362001)(478600001)(6636002)(6506007)(83380400001)(66574015)(26005)(82960400001)(186003)(6512007)(1076003)(38100700002)(6862004)(8936002)(8676002)(316002)(54906003)(6666004)(6486002)(33656002)(41300700001)(66476007)(66946007)(2906002)(30864003)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqqRiHEnyIh6uKgfg0TacZ9TFhEBo9BouZNKJJNkAQRCTzH4qs+iup3+zSOq?=
 =?us-ascii?Q?JCIK84ZXtk4sfUR94PXf0OI+1N2ItMWZpqho4dSVIdi3JzTFmOqPNGHOFQjf?=
 =?us-ascii?Q?0bpOpSyh15ZiWS7JVC/Ebyg2BdiGiWtoRuYULwtPKo8iz/hiQJA+LcB4yQ1q?=
 =?us-ascii?Q?eLwvM5OOetgAmBnbBzT7cnFCOzdrLozBexDPZbiabkapzKRBimUv4+mKSjqL?=
 =?us-ascii?Q?9C3AOZsIDQpx6RqhLMVotJS69dkuP+MStPahTze9BYdbovmXLndGV9BJU4Yn?=
 =?us-ascii?Q?TxrvCXnO5kcloVf90lKfjPBRFlMH8LpxpD0UXgWIT2AxrjvQdP38RyUQcrTM?=
 =?us-ascii?Q?nLp1lWpoC93o6GTlK38FbRoU8sk3Zb24uvsETDWYyMV0S9NlxwY1SWownU7+?=
 =?us-ascii?Q?ASMBCe2yYq1+Iwz+IipL9Hw+L5ZO6HEiLrnRa8PgFN0cmLmtCZK6rdh36IM2?=
 =?us-ascii?Q?saK6L76IoZ/dSoHfPd42VXWoDzCwl4/467Zz0PmPT9KZIKsDK11UfiDtOf9g?=
 =?us-ascii?Q?+UmZblu8TryxFHXtdHb2UiT4y5c5PYXT3cMCuuHLUoG9djK0ao7azWXKYapq?=
 =?us-ascii?Q?3sHaVl9gyyhA18fxpIjq5+woZ4edr2MT1efLqhLiy0IStr9yr4ptOs30n/tp?=
 =?us-ascii?Q?AeqrPYQrkJsdGYnQQZS4ByvPIMBvGc9GK55mf2kotcXoIUjji0MaF88wDRdH?=
 =?us-ascii?Q?/UEX6QJIOSFHTmIzatSKOvegbPN5NBvfEArnPQ55iUlh29z42MZXUej48637?=
 =?us-ascii?Q?BOeIQOWuBJdDAMLy8O79aO37YxFA946bh60dEQJCo31A4ZRu0FtrlpzTsgQM?=
 =?us-ascii?Q?ZkO6HLQ3OC9usIMLdjVLzuQ67FzxPtVrb+YLk3DHFHbQUcRl+TLV/igx+YUO?=
 =?us-ascii?Q?XkX3HTyJvoGYsmeh8rifWRxc2J76InJYulqSJdB3BamV+451wx/tKjDIqI4S?=
 =?us-ascii?Q?Di7Y4JhOrHwXEJiF9aL510fJwBTKTfqwYG01GB2rV/U6q62mmnPn51DEENVL?=
 =?us-ascii?Q?my1WaV+HuRDLcvBEKAbP/oxhsmb4gqgxZpjZ3fBaV+gLmdfw45rwwBKOREav?=
 =?us-ascii?Q?xAS1jH5UZqhbKmaIMJkuVrukGl9UQHNrI5jb9aBz9JBH2LamQORUa691TABi?=
 =?us-ascii?Q?IrACKauuywWVLRbaZ1Js+w3Aw0FzpwIPDyudsC5db7LNUx/4PGabuTT8npfK?=
 =?us-ascii?Q?PkmH/ehGOYLVsdBslrGgZ8b+c3bm9dQFdFyfSGrbv7TXkWFhwMKSVhYb0rFR?=
 =?us-ascii?Q?u/beRF36z1t2wYScJcKn3wuYj66qm6GRhlKJM7HelgoA29VC8Fvpq/0Rhtyr?=
 =?us-ascii?Q?mMg3Q34SCaVvYtpijB1Wk6MGoCXMmqUecjoz45AZmbDQEwQDZ4rhdymOCn81?=
 =?us-ascii?Q?r3WVLo6gI3hMjSvOph49wZu7I9j9xI8CpcqJTS4uVA3zNe8T+3o0fGwru/uN?=
 =?us-ascii?Q?q56aSTJ0ykP8ax/vv8lyQSSbJWOvmvnJg/xdYcEV6DgUtjrBJ4UE90iTxN24?=
 =?us-ascii?Q?0lK2IPe4hWfBi/MqjPvxuIGYlBYs2A5FYhENUDUfX7JlJjM/oZJGh0/DwsLz?=
 =?us-ascii?Q?CgUJZL8Mw9CWuxXrc88mWuvTbaE5rd9ISfadqcAeECOg5wjh3MxvEpOtATIn?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d20355b-4177-4797-ddea-08db42c6fb73
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 00:17:39.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f06I7NEs/baoBsTxZUY4ZFxbx+LKpkU3ZigVmBnbzwYChBw/Z/e1pl5oirN3etQIO2gMZcnLvc/DxMOy+cG3rdc7D14rioxC5zgEQcKuQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/17] drm/xe: Drop gen prefixes and
 suffixes from registers
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:50PM -0700, Lucas De Marchi wrote:
> The defines for the registers were brought over from i915 while
> bootstrapping the driver. As xe supports TGL and later only, it doesn't
> make sense to keep the GEN* prefixes and suffixes in the registers: TGL
> is graphics version 12, previously called "GEN12". So drop the prefix
> everywhere.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Nitpick:  you also drop some infixes (e.g., the "GEN10" in
GUC_GEN10_SHIM_WC_ENABLE), so you could title this patch "Drop gen
affixes from registers."

...snip...
> @@ -216,7 +214,7 @@
>  #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)

The "_TGL" suffix here seems unnecessary since it applies to all
platforms supported by this driver.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>  #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
>  
> -#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	MCR_REG(0x9524)
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x9524)
>  #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
>  #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
>  
> @@ -226,21 +224,21 @@
>  #define SSMCGCTL9530				MCR_REG(0x9530)
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>  
> -#define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> +#define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
>  #define   DFR_DISABLE				(1 << 9)
>  
> -#define GEN6_RPNSWREQ				_MMIO(0xa008)
> +#define RPNSWREQ				_MMIO(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> -#define GEN6_RC_CONTROL				_MMIO(0xa090)
> -#define GEN6_RC_STATE				_MMIO(0xa094)
> +#define RC_CONTROL				_MMIO(0xa090)
> +#define RC_STATE				_MMIO(0xa094)
>  
> -#define GEN6_PMINTRMSK				_MMIO(0xa168)
> -#define   GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
> +#define PMINTRMSK				_MMIO(0xa168)
> +#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
>  #define   ARAT_EXPIRED_INTRMSK			(1 << 9)
>  
> -#define FORCEWAKE_GT_GEN9			_MMIO(0xa188)
> +#define FORCEWAKE_GT				_MMIO(0xa188)
>  
> -#define GEN9_PG_ENABLE				_MMIO(0xa210)
> +#define PG_ENABLE				_MMIO(0xa210)
>  
>  /* GPM unit config (Gen9+) */
>  #define CTC_MODE				_MMIO(0xa26c)
> @@ -250,9 +248,9 @@
>  #define   CTC_SHIFT_PARAMETER_SHIFT		1
>  #define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
>  
> -#define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
> -#define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
> -#define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
> +#define FORCEWAKE_RENDER			_MMIO(0xa278)
> +#define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
> +#define FORCEWAKE_MEDIA_VEBOX(n)		_MMIO(0xa560 + (n) * 4)
>  
>  #define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
> @@ -282,12 +280,12 @@
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> -#define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
> +#define SAMPLER_MODE				MCR_REG(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> -#define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
> +#define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>  
> -#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
> +#define HALF_SLICE_CHICKEN7				MCR_REG(0xe194)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>  
>  #define CACHE_MODE_SS				MCR_REG(0xe420)
> @@ -295,27 +293,27 @@
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> -#define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
> -#define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> +#define ROW_CHICKEN4				MCR_REG(0xe48c)
> +#define   DISABLE_GRF_CLEAR			REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> -#define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
> -#define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
> -#define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
> +#define   DISABLE_TDL_PUSH			REG_BIT(9)
> +#define   DIS_PICK_2ND_EU			REG_BIT(7)
> +#define   DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
> -#define GEN8_ROW_CHICKEN			MCR_REG(0xe4f0)
> +#define ROW_CHICKEN				MCR_REG(0xe4f0)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  
> -#define GEN8_ROW_CHICKEN2			MCR_REG(0xe4f4)
> -#define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
> -#define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> -#define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> -#define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
> -#define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
> +#define ROW_CHICKEN2				MCR_REG(0xe4f4)
> +#define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
> +#define   DISABLE_EARLY_READ			REG_BIT(14)
> +#define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
> +#define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> +#define   DISABLE_DOP_GATING			REG_BIT(0)
>  
> -#define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
> +#define XEHP_HDC_CHICKEN0					MCR_REG(0xe5f0)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  
>  #define RT_CTRL					MCR_REG(0xe530)
> @@ -335,23 +333,23 @@
>  #define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> -#define GEN12_RCU_MODE				_MMIO(0x14800)
> -#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +#define RCU_MODE				_MMIO(0x14800)
> +#define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
> -#define FORCEWAKE_ACK_GT_GEN9			_MMIO(0x130044)
> +#define FORCEWAKE_ACK_GT			_MMIO(0x130044)
>  #define   FORCEWAKE_KERNEL			BIT(0)
>  #define   FORCEWAKE_USER			BIT(1)
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>  
> -#define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
> +#define GT_CORE_STATUS				_MMIO(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
>  #define   GT_RC0				0
>  #define   GT_RC6				3
>  
> -#define GEN6_GT_GFX_RC6_LOCKED			_MMIO(0x138104)
> -#define GEN6_GT_GFX_RC6				_MMIO(0x138108)
> +#define GT_GFX_RC6_LOCKED			_MMIO(0x138104)
> +#define GT_GFX_RC6				_MMIO(0x138108)
>  
> -#define GFX_FLSH_CNTL_GEN6			_MMIO(0x101008)
> +#define GFX_FLSH_CNTL				_MMIO(0x101008)
>  #define   GFX_FLSH_CNTL_EN			(1 << 0)
>  
>  #define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index facb1f0a55b6..835d413ae186 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -57,23 +57,21 @@
>  #define HUC_STATUS2			_MMIO(0xd3b0)
>  #define   HUC_FW_VERIFIED		REG_BIT(7)
>  
> -#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xc1dc)
> +#define HUC_KERNEL_LOAD_INFO		_MMIO(0xc1dc)
>  #define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
>  
>  #define GUC_WOPCM_SIZE			_MMIO(0xc050)
>  #define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
>  #define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
>  
> -#define GEN8_GT_PM_CONFIG		_MMIO(0x138140)
> -#define GEN9LP_GT_PM_CONFIG		_MMIO(0x138140)
> -#define GEN9_GT_PM_CONFIG		_MMIO(0x13816c)
> +#define GT_PM_CONFIG			_MMIO(0x13816c)
>  #define   GT_DOORBELL_ENABLE		REG_BIT(0)
>  
> -#define GEN8_GTCR			_MMIO(0x4274)
> -#define   GEN8_GTCR_INVALIDATE		REG_BIT(0)
> +#define GTCR				_MMIO(0x4274)
> +#define   GTCR_INVALIDATE		REG_BIT(0)
>  
> -#define GEN12_GUC_TLB_INV_CR			_MMIO(0xcee8)
> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
> +#define GUC_TLB_INV_CR			_MMIO(0xcee8)
> +#define   GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
>  
>  #define GUC_ARAT_C6DIS				_MMIO(0xa178)
>  
> @@ -82,11 +80,11 @@
>  #define   PVC_GUC_MOCS_UC_INDEX			1
>  #define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
>  							       index)
> -#define   GUC_GEN10_SHIM_WC_ENABLE		REG_BIT(21)
> +#define   GUC_SHIM_WC_ENABLE			REG_BIT(21)
>  #define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
>  #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
>  #define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	REG_BIT(9)
> -#define   GUC_GEN10_MSGCH_ENABLE		REG_BIT(4)
> +#define   GUC_MSGCH_ENABLE			REG_BIT(4)
>  #define   GUC_ENABLE_MIA_CACHING		REG_BIT(2)
>  #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
>  #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
> @@ -94,7 +92,7 @@
>  
>  #define GUC_SEND_INTERRUPT			_MMIO(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> -#define GEN11_GUC_HOST_INTERRUPT		_MMIO(0x1901f0)
> +#define GUC_HOST_INTERRUPT			_MMIO(0x1901f0)
>  
>  #define GUC_NUM_DOORBELLS			256
>  
> @@ -108,13 +106,13 @@ struct guc_doorbell_info {
>  	u32 reserved[14];
>  } __packed;
>  
> -#define GEN8_DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
> -#define   GEN8_DRB_VALID			REG_BIT(0)
> -#define GEN8_DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
> +#define DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
> +#define   DRB_VALID				REG_BIT(0)
> +#define DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
>  
> -#define GEN12_DIST_DBS_POPULATED		_MMIO(0xd08)
> -#define   GEN12_DOORBELLS_PER_SQIDI_MASK	REG_GENMASK(23, 16)
> -#define   GEN12_SQIDIS_DOORBELL_EXIST_MASK	REG_GENMASK(15, 0)
> +#define DIST_DBS_POPULATED			_MMIO(0xd08)
> +#define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
> +#define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
>  
>  #define GUC_BCS_RCS_IER				_MMIO(0xC550)
>  #define GUC_VCS2_VCS1_IER			_MMIO(0xC554)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 89b51857fd3d..e6b81bcff91f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -11,23 +11,22 @@
>  #define   LMEM_INIT				REG_BIT(7)
>  
>  #define RENDER_RING_BASE			0x02000
> -#define GEN11_BSD_RING_BASE			0x1c0000
> -#define GEN11_BSD2_RING_BASE			0x1c4000
> -#define GEN11_BSD3_RING_BASE			0x1d0000
> -#define GEN11_BSD4_RING_BASE			0x1d4000
> +#define BSD_RING_BASE				0x1c0000
> +#define BSD2_RING_BASE				0x1c4000
> +#define BSD3_RING_BASE				0x1d0000
> +#define BSD4_RING_BASE				0x1d4000
>  #define XEHP_BSD5_RING_BASE			0x1e0000
>  #define XEHP_BSD6_RING_BASE			0x1e4000
>  #define XEHP_BSD7_RING_BASE			0x1f0000
>  #define XEHP_BSD8_RING_BASE			0x1f4000
> -#define VEBOX_RING_BASE				0x1a000
> -#define GEN11_VEBOX_RING_BASE			0x1c8000
> -#define GEN11_VEBOX2_RING_BASE			0x1d8000
> +#define VEBOX_RING_BASE				0x1c8000
> +#define VEBOX2_RING_BASE			0x1d8000
>  #define XEHP_VEBOX3_RING_BASE			0x1e8000
>  #define XEHP_VEBOX4_RING_BASE			0x1f8000
> -#define GEN12_COMPUTE0_RING_BASE		0x1a000
> -#define GEN12_COMPUTE1_RING_BASE		0x1c000
> -#define GEN12_COMPUTE2_RING_BASE		0x1e000
> -#define GEN12_COMPUTE3_RING_BASE		0x26000
> +#define COMPUTE0_RING_BASE			0x1a000
> +#define COMPUTE1_RING_BASE			0x1c000
> +#define COMPUTE2_RING_BASE			0x1e000
> +#define COMPUTE3_RING_BASE			0x26000
>  #define BLT_RING_BASE				0x22000
>  #define XEHPC_BCS1_RING_BASE			0x3e0000
>  #define XEHPC_BCS2_RING_BASE			0x3e2000
> @@ -43,8 +42,8 @@
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>  #define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
>  
> -#define GEN7_FF_THREAD_MODE			_MMIO(0x20a0)
> -#define   GEN12_FF_TESSELATION_DOP_GATE_DISABLE BIT(19)
> +#define FF_THREAD_MODE				_MMIO(0x20a0)
> +#define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>  
>  #define PVC_RP_STATE_CAP			_MMIO(0x281014)
>  #define MTL_RP_STATE_CAP			_MMIO(0x138000)
> @@ -90,18 +89,18 @@
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>  
> -#define GEN9_TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> -#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT	0
> -#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK	0x3ff
> -#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> -#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
> +#define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
>  
>  #define GGC					_MMIO(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
>  
> -#define GEN12_GSMBASE				_MMIO(0x108100)
> -#define GEN12_DSMBASE				_MMIO(0x1080C0)
> -#define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
> +#define GSMBASE					_MMIO(0x108100)
> +#define DSMBASE					_MMIO(0x1080C0)
> +#define   BDSM_MASK				REG_GENMASK64(63, 20)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 02021457b1f0..ac23731bc8fe 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -60,8 +60,8 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	}
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		xe_mmio_write32(hwe->gt, GEN12_RCU_MODE.reg,
> -				_MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
> +		xe_mmio_write32(hwe->gt, RCU_MODE.reg,
> +				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>  
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
>  	lrc->ring.old_tail = lrc->ring.tail;
> @@ -81,8 +81,8 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	xe_mmio_write32(gt, RING_HWS_PGA(hwe->mmio_base).reg,
>  			xe_bo_ggtt_addr(hwe->hwsp));
>  	xe_mmio_read32(gt, RING_HWS_PGA(hwe->mmio_base).reg);
> -	xe_mmio_write32(gt, RING_MODE_GEN7(hwe->mmio_base).reg,
> -			_MASKED_BIT_ENABLE(GEN11_GFX_DISABLE_LEGACY_MODE));
> +	xe_mmio_write32(gt, RING_MODE(hwe->mmio_base).reg,
> +			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>  
>  	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 0,
>  			lower_32_bits(lrc_desc));
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 77a210acfac3..53d73f36a121 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -49,14 +49,14 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  	if (xe->info.graphics_verx100 >= 1270) {
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>  			    XE_FW_DOMAIN_ID_GT,
> -			    FORCEWAKE_GT_GEN9.reg,
> +			    FORCEWAKE_GT.reg,
>  			    FORCEWAKE_ACK_GT_MTL.reg,
>  			    BIT(0), BIT(16));
>  	} else {
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>  			    XE_FW_DOMAIN_ID_GT,
> -			    FORCEWAKE_GT_GEN9.reg,
> -			    FORCEWAKE_ACK_GT_GEN9.reg,
> +			    FORCEWAKE_GT.reg,
> +			    FORCEWAKE_ACK_GT.reg,
>  			    BIT(0), BIT(16));
>  	}
>  }
> @@ -71,8 +71,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  	if (!xe_gt_is_media_type(gt))
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
>  			    XE_FW_DOMAIN_ID_RENDER,
> -			    FORCEWAKE_RENDER_GEN9.reg,
> -			    FORCEWAKE_ACK_RENDER_GEN9.reg,
> +			    FORCEWAKE_RENDER.reg,
> +			    FORCEWAKE_ACK_RENDER.reg,
>  			    BIT(0), BIT(16));
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> @@ -81,8 +81,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
>  			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> -			    FORCEWAKE_MEDIA_VDBOX_GEN11(j).reg,
> -			    FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(j).reg,
> +			    FORCEWAKE_MEDIA_VDBOX(j).reg,
> +			    FORCEWAKE_ACK_MEDIA_VDBOX(j).reg,
>  			    BIT(0), BIT(16));
>  	}
>  
> @@ -92,8 +92,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
>  			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> -			    FORCEWAKE_MEDIA_VEBOX_GEN11(j).reg,
> -			    FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(j).reg,
> +			    FORCEWAKE_MEDIA_VEBOX(j).reg,
> +			    FORCEWAKE_ACK_MEDIA_VEBOX(j).reg,
>  			    BIT(0), BIT(16));
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index cde80eb09d07..3417cc7e0291 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -185,12 +185,12 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  	return err;
>  }
>  
> -#define GEN12_GUC_TLB_INV_CR                     _MMIO(0xcee8)
> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        REG_BIT(0)
> +#define GUC_TLB_INV_CR				_MMIO(0xcee8)
> +#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
>  #define PVC_GUC_TLB_INV_DESC0			_MMIO(0xcf7c)
> -#define   PVC_GUC_TLB_INV_DESC0_VALID		 REG_BIT(0)
> +#define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
>  #define PVC_GUC_TLB_INV_DESC1			_MMIO(0xcf80)
> -#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 REG_BIT(6)
> +#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
>  
>  void xe_ggtt_invalidate(struct xe_gt *gt)
>  {
> @@ -199,7 +199,7 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
>  	/* TODO: i915 makes comments about this being uncached and
>  	 * therefore flushing WC buffers.  Is that really true here?
>  	 */
> -	xe_mmio_write32(gt, GFX_FLSH_CNTL_GEN6.reg, GFX_FLSH_CNTL_EN);
> +	xe_mmio_write32(gt, GFX_FLSH_CNTL.reg, GFX_FLSH_CNTL_EN);
>  
>  	if (gt->uc.guc.submission_state.enabled) {
>  		int seqno;
> @@ -217,8 +217,8 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0.reg,
>  					PVC_GUC_TLB_INV_DESC0_VALID);
>  		} else
> -			xe_mmio_write32(gt, GEN12_GUC_TLB_INV_CR.reg,
> -					GEN12_GUC_TLB_INV_CR_INVALIDATE);
> +			xe_mmio_write32(gt, GUC_TLB_INV_CR.reg,
> +					GUC_TLB_INV_CR_INVALIDATE);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 4186f7f0d42f..0d4664e344da 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -541,8 +541,8 @@ static int do_gt_reset(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_FULL);
> -	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5000,
> +	xe_mmio_write32(gt, GDRST.reg, GRDOM_FULL);
> +	err = xe_mmio_wait32(gt, GDRST.reg, 0, GRDOM_FULL, 5000,
>  			     NULL, false);
>  	if (err)
>  		drm_err(&xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 60a2966bc1fd..1b7d00284535 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -14,16 +14,16 @@
>  
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
>  {
> -	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
> +	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
>  	u32 base_freq, frac_freq;
>  
> -	base_freq = ((ts_override & GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
> -		     GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
> +	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
> +		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
>  	base_freq *= 1000000;
>  
>  	frac_freq = ((ts_override &
> -		      GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
> -		     GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
> +		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
> +		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
>  	frac_freq = 1000000 / (frac_freq + 1);
>  
>  	return base_freq + frac_freq;
> @@ -36,17 +36,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  	const u32 f25_mhz = 25000000;
>  	const u32 f38_4_mhz = 38400000;
>  	u32 crystal_clock =
> -		(rpm_config_reg & GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
> -		GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
> +		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
> +		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
>  
>  	switch (crystal_clock) {
> -	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
>  		return f24_mhz;
> -	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ :
>  		return f19_2_mhz;
> -	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ :
>  		return f38_4_mhz;
> -	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ :
>  		return f25_mhz;
>  	default:
>  		XE_BUG_ON("NOT_POSSIBLE");
> @@ -74,8 +74,8 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		 * register increments from this frequency (it might
>  		 * increment only every few clock cycle).
>  		 */
> -		freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -			      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> +			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>  	}
>  
>  	gt->info.clock_freq = freq;
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 5412f77bc26f..aa04ba5a6dbe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -177,8 +177,8 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
>  static void init_steering_l3bank(struct xe_gt *gt)
>  {
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> -		u32 mslice_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
> -						xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> +		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> +						xe_mmio_read32(gt, MIRROR_FUSE3.reg));
>  		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
>  					      xe_mmio_read32(gt, XEHP_FUSE4.reg));
>  
> @@ -190,8 +190,8 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  		gt->steering[L3BANK].instance_target =
>  			bank_mask & BIT(0) ? 0 : 2;
>  	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
> -		u32 mslice_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
> -						xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> +		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> +						xe_mmio_read32(gt, MIRROR_FUSE3.reg));
>  		u32 bank = __ffs(mslice_mask) * 8;
>  
>  		/*
> @@ -202,8 +202,8 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  		gt->steering[L3BANK].group_target = (bank >> 2) & 0x7;
>  		gt->steering[L3BANK].instance_target = bank & 0x3;
>  	} else {
> -		u32 fuse = REG_FIELD_GET(GEN10_L3BANK_MASK,
> -					 ~xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> +		u32 fuse = REG_FIELD_GET(L3BANK_MASK,
> +					 ~xe_mmio_read32(gt, MIRROR_FUSE3.reg));
>  
>  		gt->steering[L3BANK].group_target = 0;	/* unused */
>  		gt->steering[L3BANK].instance_target = __ffs(fuse);
> @@ -212,8 +212,8 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  
>  static void init_steering_mslice(struct xe_gt *gt)
>  {
> -	u32 mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
> -				 xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> +	u32 mask = REG_FIELD_GET(MEML3_EN_MASK,
> +				 xe_mmio_read32(gt, MIRROR_FUSE3.reg));
>  
>  	/*
>  	 * mslice registers are valid (not terminated) if either the meml3
> @@ -329,8 +329,8 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (xe->info.platform == XE_DG2) {
> -		u32 steer_val = REG_FIELD_PREP(GEN11_MCR_SLICE_MASK, 0) |
> -			REG_FIELD_PREP(GEN11_MCR_SUBSLICE_MASK, 2);
> +		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
> +			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
>  
>  		xe_mmio_write32(gt, MCFG_MCR_SELECTOR.reg, steer_val);
>  		xe_mmio_write32(gt, SF_MCR_SELECTOR.reg, steer_val);
> @@ -448,9 +448,9 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>  		steer_val = REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
>  			REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance);
>  	} else {
> -		steer_reg = GEN8_MCR_SELECTOR.reg;
> -		steer_val = REG_FIELD_PREP(GEN11_MCR_SLICE_MASK, group) |
> -			REG_FIELD_PREP(GEN11_MCR_SUBSLICE_MASK, instance);
> +		steer_reg = MCR_SELECTOR.reg;
> +		steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, group) |
> +			REG_FIELD_PREP(MCR_SUBSLICE_MASK, instance);
>  	}
>  
>  	/*
> @@ -461,7 +461,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>  	 * No need to save old steering reg value.
>  	 */
>  	if (rw_flag == MCR_OP_READ)
> -		steer_val |= GEN11_MCR_MULTICAST;
> +		steer_val |= MCR_MULTICAST;
>  
>  	xe_mmio_write32(gt, steer_reg, steer_val);
>  
> @@ -477,7 +477,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>  	 * operation.
>  	 */
>  	if (rw_flag == MCR_OP_WRITE)
> -		xe_mmio_write32(gt, steer_reg, GEN11_MCR_MULTICAST);
> +		xe_mmio_write32(gt, steer_reg, MCR_MULTICAST);
>  
>  	return val;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d18f2e25ce56..4e9e9b1aad02 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -278,7 +278,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (xe_gt_is_media_type(gt))
>  		guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT.reg;
>  	else
> -		guc->notify_reg = GEN11_GUC_HOST_INTERRUPT.reg;
> +		guc->notify_reg = GUC_HOST_INTERRUPT.reg;
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>  
> @@ -317,9 +317,9 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_GUC);
> +	xe_mmio_write32(gt, GDRST.reg, GRDOM_GUC);
>  
> -	ret = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_GUC, 5000,
> +	ret = xe_mmio_wait32(gt, GDRST.reg, 0, GRDOM_GUC, 5000,
>  			     &gdrst, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
> @@ -362,7 +362,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  	/* Must program this register before loading the ucode with DMA */
>  	xe_mmio_write32(gt, GUC_SHIM_CONTROL.reg, shim_flags);
>  
> -	xe_mmio_write32(gt, GEN9_GT_PM_CONFIG.reg, GT_DOORBELL_ENABLE);
> +	xe_mmio_write32(gt, GT_PM_CONFIG.reg, GT_DOORBELL_ENABLE);
>  }
>  
>  /*
> @@ -575,7 +575,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  
>  	guc_enable_irq(guc);
>  
> -	xe_mmio_rmw32(guc_to_gt(guc), GEN6_PMINTRMSK.reg,
> +	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK.reg,
>  		      ARAT_EXPIRED_INTRMSK, 0);
>  
>  	err = xe_guc_ct_enable(&guc->ct);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index d4fc2d357a78..6a723bda2aa9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -450,10 +450,10 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		u32 flags;
>  		bool skip;
>  	} *e, extra_regs[] = {
> -		{ .reg = RING_MODE_GEN7(hwe->mmio_base).reg,		},
> +		{ .reg = RING_MODE(hwe->mmio_base).reg,		},
>  		{ .reg = RING_HWS_PGA(hwe->mmio_base).reg,		},
>  		{ .reg = RING_IMR(hwe->mmio_base).reg,			},
> -		{ .reg = GEN12_RCU_MODE.reg, .flags = 0x3,
> +		{ .reg = RCU_MODE.reg, .flags = 0x3,
>  		  .skip = hwe != hwe_rcs_reset_domain			},
>  	};
>  	u32 i;
> @@ -478,7 +478,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>  			guc_mmio_regset_write_one(ads, regset_map,
> -						  GEN9_LNCFCMOCS(i).reg, 0, count++);
> +						  LNCFCMOCS(i).reg, 0,
> +						  count++);
>  		}
>  	}
>  
> @@ -557,11 +558,11 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
>  
>  	if (GRAPHICS_VER(xe) >= 12 && !IS_DGFX(xe)) {
>  		u32 distdbreg =
> -			xe_mmio_read32(gt, GEN12_DIST_DBS_POPULATED.reg);
> +			xe_mmio_read32(gt, DIST_DBS_POPULATED.reg);
>  
>  		ads_blob_write(ads,
>  			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
> -			       REG_FIELD_GET(GEN12_DOORBELLS_PER_SQIDI_MASK, distdbreg) + 1);
> +			       REG_FIELD_GET(DOORBELLS_PER_SQIDI_MASK, distdbreg) + 1);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2f98544736ae..10c3a442ecd9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -414,7 +414,7 @@ static ssize_t freq_cur_show(struct device *dev,
>  		return ret;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	freq = xe_mmio_read32(gt, GEN6_RPNSWREQ.reg);
> +	freq = xe_mmio_read32(gt, RPNSWREQ.reg);
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> @@ -588,7 +588,7 @@ static ssize_t rc_status_show(struct device *dev,
>  	u32 reg;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	reg = xe_mmio_read32(gt, GEN6_GT_CORE_STATUS.reg);
> +	reg = xe_mmio_read32(gt, GT_CORE_STATUS.reg);
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	switch (REG_FIELD_GET(RCN_MASK, reg)) {
> @@ -615,7 +615,7 @@ static ssize_t rc6_residency_show(struct device *dev,
>  		return ret;
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
> -	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> +	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  
>  	ret = sysfs_emit(buff, "%u\n", reg);
> @@ -745,9 +745,9 @@ static int pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	xe_mmio_write32(gt, GEN9_PG_ENABLE.reg, 0);
> -	xe_mmio_write32(gt, GEN6_RC_CONTROL.reg, 0);
> -	xe_mmio_write32(gt, GEN6_RC_STATE.reg, 0);
> +	xe_mmio_write32(gt, PG_ENABLE.reg, 0);
> +	xe_mmio_write32(gt, RC_CONTROL.reg, 0);
> +	xe_mmio_write32(gt, RC_STATE.reg, 0);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index a1c3e54faa6e..55dcaab34ea4 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -84,7 +84,7 @@ int xe_huc_auth(struct xe_huc *huc)
>  		goto fail;
>  	}
>  
> -	ret = xe_mmio_wait32(gt, GEN11_HUC_KERNEL_LOAD_INFO.reg,
> +	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO.reg,
>  			     HUC_LOAD_SUCCESSFUL,
>  			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
>  	if (ret) {
> @@ -126,7 +126,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>  		return;
>  
>  	drm_printf(p, "\nHuC status: 0x%08x\n",
> -		   xe_mmio_read32(gt, GEN11_HUC_KERNEL_LOAD_INFO.reg));
> +		   xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO.reg));
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4b56c35b988d..620b6008c272 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -110,28 +110,28 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 0,
>  		.domain = XE_FW_MEDIA_VDBOX0,
> -		.mmio_base = GEN11_BSD_RING_BASE,
> +		.mmio_base = BSD_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VCS1] = {
>  		.name = "vcs1",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 1,
>  		.domain = XE_FW_MEDIA_VDBOX1,
> -		.mmio_base = GEN11_BSD2_RING_BASE,
> +		.mmio_base = BSD2_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VCS2] = {
>  		.name = "vcs2",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 2,
>  		.domain = XE_FW_MEDIA_VDBOX2,
> -		.mmio_base = GEN11_BSD3_RING_BASE,
> +		.mmio_base = BSD3_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VCS3] = {
>  		.name = "vcs3",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 3,
>  		.domain = XE_FW_MEDIA_VDBOX3,
> -		.mmio_base = GEN11_BSD4_RING_BASE,
> +		.mmio_base = BSD4_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VCS4] = {
>  		.name = "vcs4",
> @@ -166,14 +166,14 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 0,
>  		.domain = XE_FW_MEDIA_VEBOX0,
> -		.mmio_base = GEN11_VEBOX_RING_BASE,
> +		.mmio_base = VEBOX_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VECS1] = {
>  		.name = "vecs1",
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 1,
>  		.domain = XE_FW_MEDIA_VEBOX1,
> -		.mmio_base = GEN11_VEBOX2_RING_BASE,
> +		.mmio_base = VEBOX2_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_VECS2] = {
>  		.name = "vecs2",
> @@ -194,28 +194,28 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 0,
>  		.domain = XE_FW_RENDER,
> -		.mmio_base = GEN12_COMPUTE0_RING_BASE,
> +		.mmio_base = COMPUTE0_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_CCS1] = {
>  		.name = "ccs1",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 1,
>  		.domain = XE_FW_RENDER,
> -		.mmio_base = GEN12_COMPUTE1_RING_BASE,
> +		.mmio_base = COMPUTE1_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_CCS2] = {
>  		.name = "ccs2",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 2,
>  		.domain = XE_FW_RENDER,
> -		.mmio_base = GEN12_COMPUTE2_RING_BASE,
> +		.mmio_base = COMPUTE2_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_CCS3] = {
>  		.name = "ccs3",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 3,
>  		.domain = XE_FW_RENDER,
> -		.mmio_base = GEN12_COMPUTE3_RING_BASE,
> +		.mmio_base = COMPUTE3_RING_BASE,
>  	},
>  };
>  
> @@ -254,14 +254,14 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> -		xe_mmio_write32(hwe->gt, GEN12_RCU_MODE.reg,
> -				_MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
> +		xe_mmio_write32(hwe->gt, RCU_MODE.reg,
> +				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>  
>  	hw_engine_mmio_write32(hwe, RING_HWSTAM(0).reg, ~0x0);
>  	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0).reg,
>  			       xe_bo_ggtt_addr(hwe->hwsp));
> -	hw_engine_mmio_write32(hwe, RING_MODE_GEN7(0).reg,
> -			       _MASKED_BIT_ENABLE(GEN11_GFX_DISABLE_LEGACY_MODE));
> +	hw_engine_mmio_write32(hwe, RING_MODE(0).reg,
> +			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>  	hw_engine_mmio_write32(hwe, RING_MI_MODE(0).reg,
>  			       _MASKED_BIT_DISABLE(STOP_RING));
>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
> @@ -379,7 +379,7 @@ static void read_media_fuses(struct xe_gt *gt)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
> +	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE.reg);
>  
>  	/*
>  	 * Pre-Xe_HP platforms had register bits representing absent engines,
> @@ -390,8 +390,8 @@ static void read_media_fuses(struct xe_gt *gt)
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		media_fuse = ~media_fuse;
>  
> -	vdbox_mask = REG_FIELD_GET(GEN11_GT_VDBOX_DISABLE_MASK, media_fuse);
> -	vebox_mask = REG_FIELD_GET(GEN11_GT_VEBOX_DISABLE_MASK, media_fuse);
> +	vdbox_mask = REG_FIELD_GET(GT_VDBOX_DISABLE_MASK, media_fuse);
> +	vebox_mask = REG_FIELD_GET(GT_VEBOX_DISABLE_MASK, media_fuse);
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
> @@ -421,8 +421,8 @@ static void read_copy_fuses(struct xe_gt *gt)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	bcs_mask = xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg);
> -	bcs_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, bcs_mask);
> +	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3.reg);
> +	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
>  
>  	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
>  	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
> @@ -546,7 +546,7 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
>  	drm_printf(p, "\tRING_MODE: 0x%08x\n",
>  		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
>  	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MODE_GEN7(0).reg));
> +		hw_engine_mmio_read32(hwe, RING_MODE(0).reg));
>  
>  	drm_printf(p, "\tRING_IMR:   0x%08x\n",
>  		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
> @@ -574,7 +574,7 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tGEN12_RCU_MODE: 0x%08x\n",
> -			xe_mmio_read32(hwe->gt, GEN12_RCU_MODE.reg));
> +			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
>  
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 98357c1f109f..a93838e23b7b 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -155,7 +155,8 @@ int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_si
>  	if (!xe->info.has_flat_ccs)  {
>  		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>  		if (usable_size)
> -			*usable_size = min(*vram_size, xe_mmio_read64(gt, GEN12_GSMBASE.reg));
> +			*usable_size = min(*vram_size,
> +					   xe_mmio_read64(gt, GSMBASE.reg));
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e09c6242aafc..67c63facdbf9 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -512,8 +512,9 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, GEN9_LNCFCMOCS(i).reg, l3cc);
> -		xe_mmio_write32(gt, GEN9_LNCFCMOCS(i).reg, l3cc);
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).reg,
> +			 l3cc);
> +		xe_mmio_write32(gt, LNCFCMOCS(i).reg, l3cc);
>  	}
>  }
>  
> @@ -531,7 +532,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	gt->mocs.wb_index = table.wb_index;
>  
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt, &table, GEN12_GLOBAL_MOCS(0).reg);
> +		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).reg);
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index c4b3a2045299..5a2665706912 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -31,7 +31,7 @@ static const struct xe_rtp_entry register_whitelist[] = {
>  	},
>  	{ XE_RTP_NAME("1508744258, 14012131227, 1808121037"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(WHITELIST(GEN7_COMMON_SLICE_CHICKEN1, 0))
> +	  XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
>  	},
>  	{ XE_RTP_NAME("1806527549"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 918e819e7c91..5e61b6e61f3a 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -85,7 +85,7 @@ static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
>  
>  static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>  {
> -	dw[i++] = MI_BATCH_BUFFER_START_GEN8 | ppgtt_flag;
> +	dw[i++] = MI_BATCH_BUFFER_START | ppgtt_flag;
>  	dw[i++] = lower_32_bits(batch_addr);
>  	dw[i++] = upper_32_bits(batch_addr);
>  
> @@ -202,9 +202,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	/* Wa_1809175790 */
>  	if (!xe->info.has_flat_ccs) {
>  		if (decode)
> -			i = emit_aux_table_inv(gt, GEN12_VD0_AUX_NV.reg, dw, i);
> +			i = emit_aux_table_inv(gt, VD0_AUX_NV.reg, dw, i);
>  		else
> -			i = emit_aux_table_inv(gt, GEN12_VE0_AUX_NV.reg, dw, i);
> +			i = emit_aux_table_inv(gt, VE0_AUX_NV.reg, dw, i);
>  	}
>  	dw[i++] = preparser_disable(false);
>  
> @@ -246,7 +246,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	i = emit_pipe_invalidate(mask_flags, dw, i);
>  	/* Wa_1809175790 */
>  	if (!xe->info.has_flat_ccs)
> -		i = emit_aux_table_inv(gt, GEN12_GFX_CCS_AUX_NV.reg, dw, i);
> +		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV.reg, dw, i);
>  	dw[i++] = preparser_disable(false);
>  
>  	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 31887fec1073..9ce0a0585539 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -65,7 +65,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  	}
>  
>  	/* Use DSM base address instead for stolen memory */
> -	mgr->stolen_base = xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
> +	mgr->stolen_base = xe_mmio_read64(gt, DSMBASE.reg) & BDSM_MASK;
>  	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 27cf1330facd..43912312cfba 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -33,7 +33,7 @@ static const struct xe_rtp_entry lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  /* read verification is ignored due to 1608008084. */
> -	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,
> +	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>  						FF_MODE2_GS_TIMER_MASK,
>  						FF_MODE2_GS_TIMER_224))
>  	},
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a7d681b7538d..f402d56c675c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -105,7 +105,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14011059788"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
> +	  XE_RTP_ACTIONS(SET(DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
>  	},
>  
>  	/* DG1 */
> @@ -134,7 +134,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14011006942"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
> -	  XE_RTP_ACTIONS(SET(GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
> +	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14012362059"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> @@ -197,7 +197,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14015795083"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
> -	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
> +	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
>  	{ XE_RTP_NAME("18018781329"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
> @@ -221,7 +221,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  
>  	{ XE_RTP_NAME("14015795083"),
>  	  XE_RTP_RULES(PLATFORM(PVC)),
> -	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
> +	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
>  	{ XE_RTP_NAME("18018781329"),
>  	  XE_RTP_RULES(PLATFORM(PVC)),
> @@ -241,42 +241,42 @@ static const struct xe_rtp_entry gt_was[] = {
>  static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_FF_THREAD_MODE,
> -			     GEN12_FF_TESSELATION_DOP_GATE_DISABLE))
> +	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE,
> +			     FF_TESSELATION_DOP_GATE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("1409804808"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_PUSH_CONST_DEREF_HOLD_DIS,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, PUSH_CONST_DEREF_HOLD_DIS,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14010229206, 1409085225"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("1606931601"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021, 18019627453"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("1406941453"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> -			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1,
> +			     FFSC_PERCTX_PREEMPT_CTRL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  
> @@ -285,8 +285,8 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> -			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
> +			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> +			     RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  
> @@ -295,8 +295,8 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> -			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
> +			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> +			     RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  
> @@ -305,8 +305,8 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(ALDERLAKE_P), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> -			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
> +			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> +			     RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  
> @@ -366,7 +366,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("14015227452"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("16015675438"),
> @@ -405,36 +405,36 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("1509727124"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("22012856258"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_READ_SUPPRESSION,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14013392000"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> +			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> +			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("1308578152"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
>  		       FUNC(xe_rtp_match_first_gslice_fused_off)),
> -	  XE_RTP_ACTIONS(CLR(GEN9_CS_DEBUG_MODE1,
> -			     GEN12_REPLAY_MODE_GRANULARITY,
> +	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
> +			     REPLAY_MODE_GRANULARITY,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("22010960976, 14013347512"),
> @@ -445,14 +445,14 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("1608949956, 14010198302"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN,
>  			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("22010430635"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_GRF_CLEAR,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> +			     DISABLE_GRF_CLEAR,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14013202645"),
> @@ -465,13 +465,13 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("22012532006"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>  			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("22012532006"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>  			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> @@ -507,7 +507,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("14015227452"),
>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("16015675438"),
> @@ -526,15 +526,15 @@ static const struct xe_rtp_entry engine_was[] = {
>  static const struct xe_rtp_entry lrc_was[] = {
>  	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  XE_RTP_ACTIONS(SET(GEN11_COMMON_SLICE_CHICKEN3,
> -			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE,
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
> +			     DISABLE_CPS_AWARE_COLOR_PIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("WaDisableGPGPUMidThreadPreemption"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  XE_RTP_ACTIONS(FIELD_SET(GEN8_CS_CHICKEN1,
> -				   GEN9_PREEMPT_GPGPU_LEVEL_MASK,
> -				   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
> +	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1,
> +				   PREEMPT_GPGPU_LEVEL_MASK,
> +				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
>  				   XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("1806527549"),
> @@ -552,7 +552,7 @@ static const struct xe_rtp_entry lrc_was[] = {
>  
>  	{ XE_RTP_NAME("1409044764"),
>  	  XE_RTP_RULES(PLATFORM(DG1)),
> -	  XE_RTP_ACTIONS(CLR(GEN11_COMMON_SLICE_CHICKEN3,
> +	  XE_RTP_ACTIONS(CLR(COMMON_SLICE_CHICKEN3,
>  			     DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> @@ -581,7 +581,7 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
> -			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE,
> +			     DISABLE_CPS_AWARE_COLOR_PIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("16013271637"),
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
