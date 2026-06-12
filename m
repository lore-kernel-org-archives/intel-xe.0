Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE95CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D510F5E0;
	Fri, 12 Jun 2026 17:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSFV6Kjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052D210F5E0
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285311; x=1812821311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PTnLYBh+eYBC4Wkk+NlEhYQHG0ts2Cj4Cv+ZsAm7BL4=;
 b=TSFV6KjtbEQ3wJJJCbcfi7sdefSHZdmSH8ns0VelsjercsdFAn3KrBR/
 yOQXuZFXtYcEY8Qsdg1NqbC+fm5STsBjL7CPX0FX4Q++YGcNAx/nBoRIS
 PgGhUJ9yWTf8O02b4XlvSuPrgQAw0ChtSgmA0byJTD7E9jaRr5z+L8dfI
 jOOSRPCccw6T3miYD3DI89EGj8t24Or8RmeSw8mH54MeAoHmF/4nF/0QJ
 WT7GOig5CQ5puVIWIBtQpN5blX94rgppVCaCKkmrHomN1aKi6zLVvhjPn
 /L+nW1uV16+GvVlxwuwH1lShrHYbNO7B8nF5vAl5O950+qssDwpFZNkAl w==;
X-CSE-ConnectionGUID: UCOYXEl+TyKxYJldWSZHUg==
X-CSE-MsgGUID: ebl5GpToRbCyGfEnLz/kWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93613558"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="93613558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:28:31 -0700
X-CSE-ConnectionGUID: 1q+k9zSTQEy636K+dfLchg==
X-CSE-MsgGUID: ADXq2xuISJOKe6r6vQoAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="277071831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:28:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:28:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 10:28:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFR3Dif7EvrfVIx5kYMO2oE0YCf9E3m4IJRZ/EpVlatCl3k1OwYFfd9xqTdGl0CZvSH0Ks/+4/ocFsi9v3NN9hgtA7nr9FN6lbpXhHBBvJaq93VBbMdq9Mrg0qPwC4VUP1sfNQu8rokUc2Lz0i3TRCOjPtln6V0x10fIUGacEeHzkSTCCuOcS83ihar72scmIek0rk9GQfWru/ppjSgkBped7V1PEheEvG/18n+G3WtzJEhDyIk29LayaPIhoA4yGvZo6+RugB0jQBNwXMs7yP1oPOJWZUW2aYKRHU/QDCzM3XA95kKfUXkpXwtF5EjEMEZRL+9UFwRjZtj80uqGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7QxB7AGy4LjlZXO5mr/VGYgz6WKR0ESCfbMjL1pQ80=;
 b=DyWxm+BxgzCqhxZA4u241lg/3sI9gmSAEs7RjJnNQtMYlqTXDr0FuH/BI8ZJeT9yZKGKzlzstLXP9ZXx+KmaHwNWzZnfb/h4fCwxSuZ+IDoi6lpckckBAWSfwgsLyyCvFVtRcIcQTzz7/lxUo8Qiz/aP6cpto8QgU4pDCMhw8vLRAQcLGP+BaTSl/eU5jUZBSU0aEB9KiIBuHlCUHAdZbx3dFkuAGbIgKHEt+rbHthY/w16Q4ZCMYcGHOZE0VfML+d+dTTE1CJXCjWrUU1dxY+GJl58zZHEPme0SvfJAFfW6aAG3QZotuFeIXXxgpCCHxJxtD+TbMaRZEHiw4GeNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SAWPR11MB9572.namprd11.prod.outlook.com (2603:10b6:806:4e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Fri, 12 Jun
 2026 17:28:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:28:25 +0000
Date: Fri, 12 Jun 2026 10:28:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <Uttamchand@soc-5cg1426vcc.clients.intel.com>
Subject: Re: [PATCH 1/2] [PATCH] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Message-ID: <aixBttaQIeDTFyaR@soc-5CG1426VCC.clients.intel.com>
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
 <20260612032745.179673-5-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260612032745.179673-5-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: MW4PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:303:b4::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SAWPR11MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e399e24-7954-40f0-9659-08dec8a8024b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: X3TSIKLH6q5GxrMV75EOeI8Zle/YFJspoeTx9NQ0qSI6uMRzTlT9w2sOCRWbCGzPCkY8mAn6IzPIxf2geYMh3vqONK3OMVEh9wXrZszRu71j5JT10vTwPGNrcXLmpr6bTTF5MqPnfpKn+aDz5KLMtH2Yzdu2uEh9TDhWtr3BAfmpOnn6k2dXf1fYAaS5m7Bg7J0NPv9OZYKN/VfmKf+EPRiXgty1FI3Xbe+72N5Dzl68O32X0lEw2NQ0VcFpN42lD4dPafWEgpekf1uIsgaGRpS82ZzKuJFcNnTUxmJeuy6fOh5rLhfdVdt56bFvXpFb2GxcXl0/CA8WzMLf4eIfXxSe1PcZPHia/nPZHdkceMU6sMxj6V1RPMJYBm7apUt2BbjWqdbJ5VeGqSJTtQ2EjVBex5KI+MNOuKhRwRbMeag6CmnR1EtGvmCHg/pTspLM2oB/hilkK+BjNyQrq1ukmIFQfpgRE7Ri/gSfQ/uzsJk47CE8gYUzeACLOOgMtfA3uo97OuH39HsqlZXnBeuOA2tpvVlgKQrtg4wLc9KCzMDLjD8l5yyEtISCRQ9I0e5oCeAc8372V4442VWOiZtMdXtNpghdtTCB/nLAw8O2GvRZ+xxY9GhZiHuqDRwEqT481c36TIYUE9YL8CodT8DsT4N2IPmGHN6/3IsyoQwNSbXNgQN/slQJ6OYQuwQNw8wD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEtNQUs5RzI5eHFnb0VSNWFQY1kxaEJvODBNMGNGem5uZytmeE5YTHJWdjJF?=
 =?utf-8?B?aWxqYnArbG1vTVhGbFBvcnYyNGEvS2RETkdmb21yV2dRVURJeUVCZzU5NXY5?=
 =?utf-8?B?WmdTbnRyRWlyL1hXS3hmcCt1RXczaEUrQ0RIRndtVDRVa1d6NDR6M0hHaHRv?=
 =?utf-8?B?NVUreUdIMDlWODJtRWNsQXJoNHROUlkrNVI3cVVHZlRFOVgvVU1kdEVRcWk5?=
 =?utf-8?B?WXlvYU4xbnZzZDI3SzAwalluSGlZTGdtZGNKbzB3Mk8vdGNqVjhKb1ZiTm9u?=
 =?utf-8?B?QnVCbkc1Rnp0WGlaSWtpQUQrYUUrU3B0TzRjSkRXQ2Q3RFhLZkVsUlRGUTUx?=
 =?utf-8?B?bkdGWXlBd01qQWR6bmRzbE9WUTVMa1FNaHdLWDJPVHRuYlc2di9nRllUN2tS?=
 =?utf-8?B?TWVWamVZYlFWNW40U3dUNzM5U2RLa2FmbkVhdExwMWlObkw3a01zc0F2WlBD?=
 =?utf-8?B?TVVkd2U4bE56bmx3TlBuUU1yOWErT3dabHlxenFyMWNBalFIb0F4K21YVGlK?=
 =?utf-8?B?MnVYK3k3MXVIM05jVzJ6d0Yvc3F0T0wxekk4cXF0Y041Sm0ya1VDcU1YRExD?=
 =?utf-8?B?RmhmQjdlbEtvYmhiK1A3aVB0VFRUVnp6VHpUOE5KYXBMc0FUbTVwcjlSV1c3?=
 =?utf-8?B?TEJNRjArWWV6YlIxV09WSTg0UkJhZ3pneEZacURGaWQyTkE3SjRpNmh0Vjd1?=
 =?utf-8?B?a2RjM0pkMGg0ckpWb0ZrNGFFcVo1cWZjTFoyNGdCNVpMSkszUm42ZldMWVRw?=
 =?utf-8?B?ZCtqRWdTOXZkOVFNanM3d1dCZCtsaHVHRG43RWxrYjcvVnBJUU9QTGtaa1dD?=
 =?utf-8?B?aStSbWtxaXNzbEdrU05mRVNlSllWV1VpQWl3bW9LSkVXZjNjMG1MYUZudzVY?=
 =?utf-8?B?ZjFGVXgzdWkxaUFrbGFWdWprTXIvcUcrVWhtd2l0WHFsb2JraEIwQVB0bFVE?=
 =?utf-8?B?eG9ucktmUGRBdmZJdExyY29BbkVJMW1Xb1ZNU2d4cTQ4VFJZREpuNXJSSWk0?=
 =?utf-8?B?WVBPRE53cGZ6UkkvUVpsbVFSa2o4WUhMcGpOM1h2clRocWhFL0JCQzM2b2g4?=
 =?utf-8?B?WEwzUkFKU2ZkK3pmK0ttTmMzd3UwVkdFamN0TXlwRVFTNWxLUE1IK1VpVXow?=
 =?utf-8?B?ZTErMzIxZkF2VGRjclo4YjlDNXJLOTFNSHFTbmZyV0RHSEZZaUZldUFicEdK?=
 =?utf-8?B?WTJFMDA4SWw1K3d4NERhbnFWYUxyT1lHZy9uRXk0K0ZxREw2cnpJTkJVenUr?=
 =?utf-8?B?azR5dWJZdkdWNFBUS0l3MGV6eFJyVVhlQ1lQOEJIWWtvSUQySkFVSUVrOTkz?=
 =?utf-8?B?U3RSbUplZTByNU1nWW1IZmRqSG9Qcy9yYXNZdVUvS05SVm1OVDNaaXlWMTBL?=
 =?utf-8?B?NG5xVGJ6WWxERTNnZlp5NElQSjJKN3M3MWI2dUdSRlFIeGE2Qko2KzlHbzhP?=
 =?utf-8?B?eU9xVU01VVNDOHREdXNnUFhTY1B0OVlVbHNwTUlFUlNKRUwxakxiTGpjNnJZ?=
 =?utf-8?B?dGFUY0JMKzFsR3RjT3VaN1Fid2RRNUx5TEZCbmd3dW9KV1JrK3FwbERLZEFt?=
 =?utf-8?B?dWlTejRodllxNE51YktqbEFTcmhwSEd4a0I2K1ZZaGVPSEVMaXhid0czekVF?=
 =?utf-8?B?SHdRc1Q1dFUxMkdjNjVqZU9Ucnl1M3M0MGljRmx4Vm5tRHBYOTQ1WFQycFZy?=
 =?utf-8?B?WVlQZm5SMFNDclQ1R1VML1hjeEVmMDJiMXlySHZGTGQxb0FpUXFiMGE0Mkoy?=
 =?utf-8?B?cHArYXA2U1dIWTVLbzBSajZnZjU5bi9rWFVRNlI2SjAydlJMNW85M2VoWDc0?=
 =?utf-8?B?TFJvYXJSdzRHSkJNSEgzSGRrQVptcFB1U200ZzhUZjBtemRCQng2bzZKU3R4?=
 =?utf-8?B?LzJQY0JXKzE3WkpJM3ppZTN0d0VWSno3aTBqc3FMNVk0eisvR3FPS1B6VEwv?=
 =?utf-8?B?WDF4REw1MHY2RUxiWHgvVTYxSEk0MllHM2VDQ1VubkszOEU1cDZWTmNqOWJk?=
 =?utf-8?B?ZkVqUTQ5TGMzWmxIRUowaUsrQUpvc3dhQlhFZmE4M2Q2ZkFLcnZFM1J4cmQ5?=
 =?utf-8?B?ckt0NWJFbno5L1NrYkZva3BieVRWK1dsTldZdkh0djNMcVFLY3ZBU3lhRzdP?=
 =?utf-8?B?SlY3L3VobTdGWklDSWVYNmUvdFNTYVh0NUVtVXpiaXM3amhCK3NCRHE4RHBo?=
 =?utf-8?B?b2sxdWcvSGpxcXM1b1VnMUtsVUFLYnpYR0h1TFlFbld1U2hCd0Excloyd2VC?=
 =?utf-8?B?Y1pMUHN2RTJZQm94akthUEdhamhVUlRnRWtiNHhYeElZOWxtZUZSNXV5djVU?=
 =?utf-8?B?MUVCMHlabVM5czBOdDlHQkdNbUYzYTNFQ2hRNVRnUlZjWFpGVnFhbmlabDlk?=
 =?utf-8?Q?0VfuM/C0mDf49/M4=3D?=
X-Exchange-RoutingPolicyChecked: hC+WjON/mgDUIHagkO1r0SbjxZN2OICLDrMYMbnDjYR2y9U7NhVeZLJy1Zj82IyDITU8Tj+E2zmKZg0iTYDcNiVwJUBeFcZpRC50FU9pOOR25HLmNrFxJyG+ro8viEgsyvDEr+xt8DmK+2q5EXoqofUdyyT9bNnup7F2ugUrOuqDDn2uoLrCpDlQNO602q1lUtGvzyMsQkjvi5rQCksQo9uWaK5lO6XshyeehLh/n5AfWUzUWBsfX18ypaDymmny9Osxp/rtFcrTiI4Wx2n2A5PntpP8KhidZPZ7NYSJFvbyOoDhy70VsJ87fe8SHP6hNzZhM92FkAyYZjHRNr/ogw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e399e24-7954-40f0-9659-08dec8a8024b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:28:25.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogoiS+8ykYNYcjSBo9E1QHnAvLGvbWPf8WY0rxng4X7vZOuuUXA1/zP3jrviWFIbGGAqNgWLl3oyILL09y0S38urni/Gqy9umiyoeTGt5GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9572
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

On Fri, Jun 12, 2026 at 03:27:47AM +0000, Gajendra Uttamchand wrote:
>From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
>
>Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
>switched out between check and read; LRC stores a sentinel while
>a context starts that must not be treated as a real timestamp.
>
>Fix: Check the LRC-stored sentinel before and after the MMIO read;
>return the LRC value if the context switched out to avoid TOCTOU.
>
>Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
>canonical sentinel.
>
>Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>

Hi Gajendra,

Thanks for addressing this.

The patch looks correct. I think this regression was introduced when refactoring for multi-queue, so please add a Fixes tag to this.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

With that, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>---
> drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
> drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
> 2 files changed, 28 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index a4292a11391d..e284c008c126 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1096,7 +1096,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
>  * store it in the PPHSWP.
>  */
>-#define CONTEXT_ACTIVE 1ULL
>+#define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
> static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
> 				    struct xe_hw_engine *hwe,
> 				    u32 *batch,
>@@ -2720,21 +2720,34 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> {
> 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>+	u64 stored;
>
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
> 		return xe_lrc_ctx_timestamp(lrc);
>
>-	if (context_active(lrc) &&
>-	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
>+	/*
>+	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
>+	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
>+	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
>+	 * otherwise accept the MMIO value only if the context remained active.
>+	 */
>+
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>+
>+	/* Context is active: read the live timestamp from the engine's MMIO register. */
>+	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> 		new_ts = reg_ts;
>
>-	/*
>-	 * If context swicthed out while we were here, just return the latest
>-	 * LRC CTX TIMESTAMP value.
>+	/* Re-check the LRC-stored timestamp: if the context switched out while
>+	 * reading MMIO the hardware saved the canonical timestamp into the LRC
>+	 * during context-save, so return that value instead of the MMIO read.
> 	 */
>-	if (!context_active(lrc))
>-		return xe_lrc_ctx_timestamp(lrc);
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>
> 	return new_ts;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 0a3a611391ee..7be5e3da8bc8 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -9,6 +9,13 @@
>
> #include "xe_lrc_types.h"
>
>+/*
>+ * Sentinel value stored in lrc->ctx_timestamp while a context is starting.
>+ * The hardware hasn't yet written the real CTX_TIMESTAMP, so this is not a
>+ * valid elapsed-time sample and must not be used as one.
>+ */
>+#define XE_LRC_CTX_TIMESTAMP_ACTIVE 1ULL
>+
> struct drm_printer;
> struct xe_bb;
> struct xe_device;
>--
>2.43.0
>
