Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0252DC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 11:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A485F10E14C;
	Thu,  9 May 2024 11:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVxhkY6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65810E039
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715255468; x=1746791468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bzd7yDDZyVZiu4SQTLvrUA2GYSIMgrROSe7iORleGys=;
 b=JVxhkY6YHXYN/rsIgnuWobPbiyn+i2u9l4fXuywMy/5gdOPPq36Ug45b
 QOJ3WY164gY4w7f9VeTLIEae95XIujszuW1yFk8o76e9t0UYVcUtjo3S7
 ImaIYpx67b/zCmbEn1z04l8DskCs45bEB+dRuTiwfz4evPVOBnvgyu1/C
 TSAPnGrqnD8QXVZhW6aPq1RxwbccSLs/4oClEdA6MgA068Tj2N8CVZ5F9
 4cFXtJZ+q5NPjB7d06BU81FkB8eOb++iHetZQBgcYt8x+AiDH3tz+31dA
 tSdxoC8yGoP7TJWWO+w4ioGXjmyxZPSu86v8DlVccuGXt7dme+g58yeUE A==;
X-CSE-ConnectionGUID: t1jvkftjQaiZWbu6pOS58Q==
X-CSE-MsgGUID: I+jAIQ6VTmeayCfqwZjpdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28682912"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="28682912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:51:07 -0700
X-CSE-ConnectionGUID: BVGjGNVWSJucdkJAyEcZnA==
X-CSE-MsgGUID: f878TWp/QtihDLkxiyDATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33772345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 04:51:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:51:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 04:51:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 04:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU2lwzVds+1bCLhdDwRK7mvrJGSnHnAe3hI//Pnz5HKlsdAwZkMeNYtnudISjBL42KPCiGdyEYwlyRENzenyKdzDZ/Xtr0+7zKL9unx+v+oNPC4Ni9/f5dvuvj2qGRYGY9aNJsKyLKxzVqgNKlWUdB7rv4cLfG6PZ3kgiYfT4yXl/iePMOi7QRKmDEZMmq/e82Rk7LGt5WS/ZKHzD6SSYFT5B+o1Klej0bmRdBAwWIwuaSkvb2oUsSdSez0zpTisCNBjnv2kSyqiX6ymk0pfQsZ1wxb9GaAGlk5uWo918XMB2NYJCRMnzLDNlXMk/y8XUcwD7Hi1d+bS3btRj/VOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxHRqSuynvH15+ihIUXqCWZhtk8gTC6GUCiMBqkHDyk=;
 b=cNjYI9A6vzzlCERbaEPiM9jQUuHvQzSWknvKwNRNUEZtx4FfEh+X9RANk1sCuiDGQRkQPzHVEb4zihezCsfwv80osk4JSZU3Ag9nT9+7GIpq/GPAU7IBRDQCpivBTWmkQ/AWXi1HM15GNzLrhcb4hYiUHgIjHbIKW4bGGWj0kl3r3NBldbSarX2Zmi5TDNXxGbw1U3/gELVJvX3w6mQ12LPfhj+UPOxqibebJa1P+Wvx9hR4JjeC2F58JnwWnf1LzLr66bh6o6vmFMjjSpPlz4c+7jdP0mq4cRrOMrgmdIRSNFpLrfHsf3DXg+wrhuRFlq/DpUTjsLiC9msRilJF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.48; Thu, 9 May 2024 11:51:01 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%3]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 11:51:01 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Topic: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Index: AQHanY4DFnvxwGuAKE2PkfB37phZvbGO0xZA
Date: Thu, 9 May 2024 11:51:01 +0000
Message-ID: <CY5PR11MB6211925EBAB2F8D7FB499B6895E62@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-8-rodrigo.vivi@intel.com>
In-Reply-To: <20240503191309.7022-8-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM3PR11MB8681:EE_
x-ms-office365-filtering-correlation-id: 21e4ce73-c082-4bc8-e9a2-08dc701e4c61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?NX8kQLXxzla+MCZOd5WsiFgnx43mm2tiW6sWUlYQjv3yjq7yBNcgRpdU69lp?=
 =?us-ascii?Q?d7JRjz8iCaM3/oibC0d6BvgjAazt1v67jtmTYMSwACcmh5BkLMkHjQ//MLh5?=
 =?us-ascii?Q?SgDFcieLS6loe+KgexXxqZWcvdhOrZVXLCkF0qjHCagzG4KKMHvrZLKCiRgM?=
 =?us-ascii?Q?xIPnsOvfM4yZLEcXOOFiRsCFquldz2TPncqhSf/0qpESeADiQkfyv+BykbB7?=
 =?us-ascii?Q?/d12LFRhz4RiIvr6MBP7brspC0BbEce1MmPB5dBQqsJAWMPuLoQTopcrVMYC?=
 =?us-ascii?Q?yMUmcQpiIM9G0gbkiDfswi4KNvmyY6dB0e9Pwq7IwCkvgi+n8FFgZKyQbBVc?=
 =?us-ascii?Q?Mw/9FykVsNnWz3aUMcD3zC3z5CzkJ4GyLaGogzR+hVqsqryyWzjV1vwnD20D?=
 =?us-ascii?Q?jbrXJBcAQx0oJOrtiav0fXZ8Sow42pm9DaKNeSjhqPWU4Dfpgtb9p/I2hxHd?=
 =?us-ascii?Q?NFHE/gRJPfwU0HH4aAx7mDoYVJMe37uSrEpL1jgkGr9xmUE1YBU3Fs693KSq?=
 =?us-ascii?Q?7fdyLsNvc0bEQTk7VxTH1cspZOandgj5ggcrwzjaLAwx6aVV8Ox3tfMqEUEZ?=
 =?us-ascii?Q?ftzIU5xbTYKyUI8j3jGrR4FfZcV2w9VCbni//KyLFWRVEpkHZjVfK82cw+H5?=
 =?us-ascii?Q?Xizvvxg4WW5+2rKAw/htFF7JOjYBC14rdIP9ojTE/n+lXvFxDORLN79jUifv?=
 =?us-ascii?Q?vnoNat9TNlVMsFoORJaR4yBqAU2q93rQeXUACNRIVe1g5EQYGzlqnhfCc8RZ?=
 =?us-ascii?Q?ZajLr5vJeZc1xUBSxAxrgDGc7Iqu4bOo52vQcvLSpOxKS8M+LEgWgndI29ik?=
 =?us-ascii?Q?B2EeVZpemXkOiGp9EjNgm6yEMeb60WlykF8PM+f4gZ/naRXVQbcirXYOo1aK?=
 =?us-ascii?Q?5ekiqZqs3VRg6x+DStoNzR37q2oOGfv22sfPeFLSWVTynXlQ6Ujjn7DidDqY?=
 =?us-ascii?Q?la03WxtfD79TlZ/StEI6s623i2NvDeIeSsqmj2Wy7q75nqKXBWAqEsJgIrbi?=
 =?us-ascii?Q?VZxzJVwA3Rc8ffp7BrEwt1A9tV5M7wNkJ3skOgBfTtmYz8znFRlAhzX0V5En?=
 =?us-ascii?Q?xcJhMj9jV2hgdpZuZJdk2Nx8QYHxf294mBGjzSHPoJFlA6CHRW15ayMvKFmf?=
 =?us-ascii?Q?6gbNnGQjRm8GNe8LeKySlegoNespMhAc2Q8Gr8sAaDcSM+iUGZS3UEiHJ+Ev?=
 =?us-ascii?Q?61aTqqXK+faF+xDLNMhD8mvYtPPFZA1+26FbTkrL6QJ39BGZZyOirz7AVso4?=
 =?us-ascii?Q?46241JWToCwKTXsGgEDlvCuk/PYu/7fjDVYrkjBpz/kf2VixlbaKkrVWUG7R?=
 =?us-ascii?Q?Txvj/34Z0+AbQOxniW+4cYYhXNYElnV35mBWOn82Rq5s5g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RLS/2FPEzKuNIbPMTRbSESWwErG+YxU7mfdoFeb1Qa6VwhiE0Svue/rfbBMV?=
 =?us-ascii?Q?hciPl2UMgLDs2RjhK/epeh5qJAFLBKdxKculG8AJWtDyJHaGzXJubSG4mch7?=
 =?us-ascii?Q?KxJVDy8ySPwb1BBLPcGwMndCqvHIFtzq0+BjrxM9mhlsi5wNgH0lupawbyHa?=
 =?us-ascii?Q?nVpe5ZZ5ePTmnFt5mGM+T8Bxn5NLFJsMWCUH9E9on0DuDoMsKkF3br7/W+gV?=
 =?us-ascii?Q?37zyTVSJG98hDq7aD5kKeuzTt3gS1GCgnOztq12kuH43jhgktm+rAgq0B1Zm?=
 =?us-ascii?Q?PO4t8ODXn+xhz2tgHOM0pwupM/jBJa8Gn4tK25G26D54+LmOzXpqkFyuK0Sd?=
 =?us-ascii?Q?ifFH6TY6+JSIKRiTF3JNtkyRhcPzR06zGtHfxBIpEu067KKtsyX6VAmv3SGt?=
 =?us-ascii?Q?8hNHozYzHcQjQDTrvBneFOrR/Digw1kllWyHW0rFwAyTQe3SNeY9XPOv7x+n?=
 =?us-ascii?Q?kEI3Lx6kCAeMfWLBa/32mfVADoT0zxz229XsAENAeilRclnxNsTF6Z3c+9x4?=
 =?us-ascii?Q?rkPcO/zCFfSJ2PCuacbRkFDO0MHvB7b0KmOlEsnYk0jdPVgvbGQT1qcYZhqU?=
 =?us-ascii?Q?QlZ/O7Vk2TdW/VCanTFNmmTSQ2u7kd2jNkM4qC/9nqF4186kNuYM9hRC4pSL?=
 =?us-ascii?Q?e0sTcN/Mq6/47NldR99gTC80fFy4jEl8bb99N4Q7UFBWhXzL3ZmnjJvFfhqc?=
 =?us-ascii?Q?OqNrxkL7SeGWNS5nyZr6+V0Q2J4gbSc+UJHLuWxL0FSKLzs9vgZXckvT+++c?=
 =?us-ascii?Q?Vbn7ltAX+V2UHqh6WZ8Ndhw+gNHxmaTbzEVnGPR31WaEhS+219jFgXlNxoA4?=
 =?us-ascii?Q?wfP6ZhYM9YoPuJaFqhq9Oeaim56JU7IPHdln+IgM+RH2ZoVYoIlnjQtICyuk?=
 =?us-ascii?Q?bJE6qf8z9Sa/bZYJLUIi3arWR8T4OHogDbiMDNzNur1kC/RIL2OduzMlp0CH?=
 =?us-ascii?Q?7GKsyfaX/gNjDRlflZP1hpBVHiKUBo6TsUzEX0NpUg+sEjiy+irFgCFxDzKe?=
 =?us-ascii?Q?RGj7oKlMuH06PUma2+00ZKCiOCS/gKTs++HGQP9kgUaZYFeG3XIScxoYPMNr?=
 =?us-ascii?Q?pleuvRNyWbRxvhgrv3mFjqmRBWxE2rWVhJG55KYCs6nq7XLvVeBNS4QsAwIO?=
 =?us-ascii?Q?VY3cSrphTMNPw+zdBP/EOJyWNOZDksDkNw/e0R6OFNP6pcB5LAqwoqBTEWSW?=
 =?us-ascii?Q?+aZ3tgwFdjBbspsEupO9kRrewbanuT8cZnQhByBzH1ENghcSbdgvHpOugLva?=
 =?us-ascii?Q?IBjI/AExQEu3VXED7rJqf4CQX6L41bw1PCjfq+5A4RjVNcsi6gDcgSPufkYC?=
 =?us-ascii?Q?OG//T9my2vTw9tQ6c7L/OLHWbFDOCnOBqWRG1R5iCV0Vw0d31TXO2XsytKPT?=
 =?us-ascii?Q?PP/2DTvRuyi0zrwU8+ZLM7v4VOOANv7VtzY4/AxQQxaONGNYkqgT/+fhTHLZ?=
 =?us-ascii?Q?iRl0+bJKvueBNk1V/2D/6aepVwU/Rt9CrYJXbLGanu7YzHdUt74DpidnkeFc?=
 =?us-ascii?Q?sseA8/hlwA3wa8B/kGP5K9+4bqDUa9CYNsUYxewG95jsohvfyR1SO977fGqS?=
 =?us-ascii?Q?de1TF+r4P9KEEEZ3fzgazJzKevx3w7K90n1oCXaQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e4ce73-c082-4bc8-e9a2-08dc701e4c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 11:51:01.2002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4QXgcoHD+3usWpApaaiVrDQDeCeG+CaRbuDktLLcLtnxX7hV7FTd7H6mb9ISjo8rujfvIv9anY9ni7DDy/4UOoUhxl6U51vHs089EypCEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Saturday, May 4, 2024 12:43 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Dugast, Francois <francois.dugast@intel.com>;
> thomas.hellstrom@linux.intel.com; Auld, Matthew
> <matthew.auld@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
>=20
> Now that we eliminated all the mem_access get/put with its locking issues
> from the inner calls of migration, we can allow D3Cold.
>=20
> Enable it when VRAM utilization is lower then 300Mb. On higher utilizatio=
n
> we only allow D3hot so we don't increase so much the latency on runtime
> resume due to the memory restoration.
>=20
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index f694005db278..104a21ae6dfd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,12 +8,7 @@
>=20
>  #include <linux/pm_runtime.h>
>=20
> -/*
> - * TODO: Threshold =3D 0 will block D3Cold.
> - *       Before we can move this to a higher value (like 300), we need t=
o:
> - *           1. rewrite the VRAM save / restore to avoid buffer object l=
ocks
> - */
> -#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
> +#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>=20
>  struct xe_device;
>=20
> --
> 2.44.0

