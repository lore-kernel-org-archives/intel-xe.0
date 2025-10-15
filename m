Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3433CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 12:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154110E7A4;
	Wed, 15 Oct 2025 12:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMh3uElG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A8410E7A3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760531111; x=1792067111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+0tGXudYPdlGOVCt+31vXjWnWsvaQI50YRdz3q+8MJw=;
 b=dMh3uElGK3nyJM2xYwewCkJL9GF8VTFkHBK78myQoNYPw1ceItYaZl/2
 HLid7NwJ6jKpQpba9vlESm+bd5vz/Ik+c9wK/RMhei8jE1u16+SaLo5Gm
 kH+saBd5EOY+suEEMSnizJDGKBY9TaWnuczxkD8YKu5UkR+dncFLUtZO5
 F0OqktClb81v0UFvWNLLuM2xb7GBwA0CG0w0h/FkslntVntQOymHCemwX
 r+9ZlAyQQ2RoGfTFbFzbFnFOOWMAyNF+k/sb8vZGs9FUAYuvuTFzvsBCn
 56sLJ8QsV16GFykUukYL9zHVzZnWw8WgR5fc3BTbfEfIcWJ+8vfpTBqug w==;
X-CSE-ConnectionGUID: jWNznmLFQEepuRbt3Kx82Q==
X-CSE-MsgGUID: c+HmieEPS1a/6LQ2fCp5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62855813"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62855813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:25:11 -0700
X-CSE-ConnectionGUID: BXmjaON9TsmSwDPefClpvQ==
X-CSE-MsgGUID: slJUKcRwQt6//IyK1z5THA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182620932"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:25:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 05:25:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 05:25:09 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 05:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anSEoxYMpTPl8WX+S2lGnYhALE25MHRWEbBLXE8h2IKvKOL899CH+l80tsgw26TUFKoe7gBhXiRDqRcH9MLaKmn9a9o4T/L8uP7HixKcU7aAnu5P2Nwtw4tAXOTkq7sf0A6mraisnfdxFFU5a2Rak+cRcHC0XhHJvLbkCfLJZ6U7Ghrkn/tG+4jGm4o58v640V1h0f819zcMgPLdQI+tTQ1pD5C86uY7PCKmY/myPcaVcTk3TYv2mOI7cR3KbkUAEgr/zdzX1U//n3c65JdPtp+mwDHHRzGjcjs+J5fCkyGDksbKOJuq4m6nWHv0T1NgbZdVvZiSDPhE8di8k/BCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hAw2dBo9oM5cg3bFaHHbywN6l09UXoYVZ9sKKR+OuI=;
 b=D1U8ko266fysYsGJI+RGkG3Pqek2sWclSdmpR4D02dT6jD1uVjf/oNXrISjTwFl+U3PgpZV1FSiOApv2/0l9f1QwFBrytcHEYslCI1ZEa8/VTwaTq3pYi0m5SPE2o8ZrV31NT5AxY47VbU81uaRa8lPLDOAj6VXt0eg/OPi/rMFWcOHiEuKerVD0W57dbH5SjHo0EtitVAeKejcmf2iH0/UkqW7bUSZ+Drer7Kxjoj0G4ehGwtO0xxo0frX+qUzHf4P/lUm2qJWGVW/rv+lAQnOW2vTKQOeDz4ZT1x8wDki4KmhjxKdbwTXEshbieTCn1k6vVp6swjTGsmPsto6qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 12:25:06 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 12:25:06 +0000
Date: Wed, 15 Oct 2025 17:54:59 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 08/23] drm/xe/xe3p: Stop programming RCU_MODE's fixed
 slice mode setting
Message-ID: <aO-Sm_zf7QqHYn6r@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-8-bfb74f038215@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-8-bfb74f038215@intel.com>
X-ClientProxiedBy: MA5P287CA0134.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aab378d-b9d9-4737-e98a-08de0be5dfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3NhNUdKSndrVHVHdHAzNC9tekdDTnU1YmZMelF0Wm1hSFNhOVFuN3BDbjFu?=
 =?utf-8?B?SzFnVVJYZFI1cER3ODZtY2xDaERLT01FUzR4NjZVek9XTjlkN05pM2o3aTZ5?=
 =?utf-8?B?S3g5T3FjajFtODVMdWhueFViRU9zNmJZRkR5YUV0YzBpQVdXZGowajlCRitT?=
 =?utf-8?B?VVphNktnUHVPQlBZb2ltOUR0cHlmMy9mWEc0WWViMm5xTzFoUXg4TEJHUFJG?=
 =?utf-8?B?OXpPWXF1Y2RjaVkwaWh4OHNOKytWRHluRVVnMUI5d1B0Q0hpdGdjK0NnUUJ0?=
 =?utf-8?B?WWlBZDBKNmVxaEJQeTlISVd0NVp0ZDZNZFRjUTE3a1JoRGlKbDQ4dEhEMll1?=
 =?utf-8?B?bEVITEpEaDA4aXRhaVh1RWIvdmdkaVV5RmpzUFZiTVl0K2daZFZIY3FLUWZ1?=
 =?utf-8?B?Uy8vWFgrUWhISXlzNFNoOTFpOVBBa0xHNkhXaFRRREtJQklQYzNrekp1TURl?=
 =?utf-8?B?L29JWE05U2QvbjQ3K24xczNsVGVRVFJVT3lrT3BmaWljRkNSREQ0T2R3MGNr?=
 =?utf-8?B?ZzNuYU5uVnIxNWgxV1NzVlR1NHdYemZtMVIzblRydWtlVy9GQTJVamVrQlV3?=
 =?utf-8?B?dWJ0VmR0VW1GQWVmUDJiK21WR2xSYTM3VEtlVTQvSXJ5NFFpRGpkT2ZNcnJ5?=
 =?utf-8?B?YkRFc2hGS3ZJZWFnZkJHMkdxRThoMlIraTVLZGtWaS8waDFrTUFTa0VMdWZ6?=
 =?utf-8?B?LzFHZXd4YzJBOW5neWUzQ3ZwOUkrU21iVHBVYjZJam5ZRFVoNFBqdVRIeGth?=
 =?utf-8?B?RVZPemdSU3RUMnNGeGVpeUVnL1NWd3FYY1R2V0lKeGpPQ09uTm9jOGRMUG1z?=
 =?utf-8?B?UDdNR1FEZ3VNRUYxUFU4TldtV1VtM1ArRzh5T0dnd0U4cHNjZFRmS29obER2?=
 =?utf-8?B?a3ZvSXFwN3FtOVVUd25WRnFvZENUUjA4MUllaC9ZQ3doZXF4UUxZU0NOVnVk?=
 =?utf-8?B?NXd5dFRpcXY5Z3F2azNQUkNkWmdZRUFxY2dIeUljZER6YUIrOE9aWExOV3pj?=
 =?utf-8?B?dFR5OFNTS0JNU1VEdFJZUVRVTithZUFna0Z6K1RWTlEwT2c1UHBPNHZhbzNv?=
 =?utf-8?B?L2cxQVZaZTlpZ1BFVzYvdEtralF6dUFISDdMYk40enJBVWZWSjM4ZHdYdnIx?=
 =?utf-8?B?LzY5UDQ4QW1mSVNNVnp2c1g2ZnpjbFUzd2VXNnV6emIzTEprQ0VQUkl3WCts?=
 =?utf-8?B?TUZZbCszbGxqSlpXSXBiTkVUQUEyTGZZb0VtWVNWZWR2TU9LUzgzRkQxUDNL?=
 =?utf-8?B?cUt6L0dqZTZjRkl5T1BLZWQvRGsralYxVHZUVkJjekxZR2JsQ2RPQ0VtdmVP?=
 =?utf-8?B?SDFQbUp4cGM2OFViTDNFdmRiQWFKcUczZVBtaHFUdnV3NWxLbWtRbU1TckNT?=
 =?utf-8?B?cW9jeW12eEt3S1hFSjRjVjRySjl0dkMrQWFxMi9nbkRVVTFMZGMza0c2dG8r?=
 =?utf-8?B?SGs1V1d2cWVETWdSS2ptek9hcGpWSWxVeWlJdnV1andRLzBwOVBTcmx4S3po?=
 =?utf-8?B?aGxWTldaRVZJWGo0NWZJdWI0Z1Z2UlBLQVIwT3dLdHgvS0gxUnBUcEgxUXBs?=
 =?utf-8?B?QXBZQWkzS0xzTnp5MVBaODV0RDQ0dmd2THZuVW45T0dWUzVzVVVCZVIxZDVN?=
 =?utf-8?B?TS9YREpZRGtOek9xSHBYNHFGS2ZFemxWc0xVSmdXZTJmVHp3SnBBdmV4bkJZ?=
 =?utf-8?B?aUl4TmtqQkpUQ0JTTUZ1aFlFTnMwOU5QbGhZZCtPcldOMXNlMmpJTmszbDZx?=
 =?utf-8?B?SFAyc1hEMTVNeUdjM1B4QmptTU52cStnYzRiZHZzWkIzczc2Y3RCN08xc3F4?=
 =?utf-8?B?VUkyQmpaTUdESXJDc2lsRmdBUFppOUFVa0VsaTU2Z3psaHBzWUR1TkJEYU1M?=
 =?utf-8?B?MzF2czc2ZVpDTDBTRFhRc2lIZ00zb2FWVGtCOWhiL1B5SWtxVThHRElJbndL?=
 =?utf-8?Q?umS0eo3PE3Ycyn2RVRkXYf1Z9BawR7BF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG5YQko4eUl3T3RNTkh1T1FyMGJCalZoOWVmU0E4aExjNkZMUlNUbllSa2xo?=
 =?utf-8?B?VklGOWEwdzRtSlppNk91SlRyaUQ4T3VNUkpOdUwxalQyVDJyODVpKzZVWDNV?=
 =?utf-8?B?L3hnbENobG9vTU1RODN3VTg4SmtkU1FxQlVKbVJWSmR0NmJCd1lsZEFHcnRn?=
 =?utf-8?B?M0IrWmdzTzVCamRUamVveUpOUTBicFJ5TWx0YzNqelcxQy9zbE0zOEFqck9v?=
 =?utf-8?B?dXNHa21FUUVzUzFzclZIUkw4aDJjMTluaFNEWXJ0RGt4ZElGNUlDcFFTUm1P?=
 =?utf-8?B?SWtGUGFuNzdoL0YvSTJuYkUvdnZ5WTZFOVBzbzA0WFhla3Z2bldQbWVoYTZh?=
 =?utf-8?B?S1BNUSt0dFBtZDE5NmZCZXlHOHJDaU9LR2xhZDFqa1o4VkpuZUNkZTVEL3ZR?=
 =?utf-8?B?Ty9ZeHpFcjFQTUVRNDBhV080SU9tU3pEdzlneTdrTDl2TlB4OGZZQTEvSk1R?=
 =?utf-8?B?ZEI1ekNmbGFrUGNJMlZOWkRJK2ZxS0YvOHBPdWJLUmQ4Tm55a3hMQTBhd0hS?=
 =?utf-8?B?c1VhMzFac3EzYnZjOE9aQTVZTkNCV1BVOHUzK0dWY0k0NkFteCtwMXlVb2Nu?=
 =?utf-8?B?dnY4Y0JRT1p6dTB1dklwQ2N1cEZzTVcwR0Z1QWFUamNYZlVsQ3Z2WUl0cURE?=
 =?utf-8?B?OXIvdHh2MkthVGVNd0RJOEVPRVJ3VStVcklyUWNWV1pJTzVLSkZvdERiaEZW?=
 =?utf-8?B?QmVQSkFpWTVBSytXNmgvL25XOTk5NVM1SU1VZXpzQXQrQ0cvTWtqbEZTUStW?=
 =?utf-8?B?aTY4M3R4dXVjVUtIdGpqT2FiQzVuSWJnenc4MFRxa0pWenRnS011R0d0Ymt5?=
 =?utf-8?B?ZytrQkFzRjFXWlpsZFVpZ2JjTkJUeEZPdnQ5V2NFaXlkWDl0RUJaM0xkQUp2?=
 =?utf-8?B?NmJCUk1CVlczNWUxNitsNEp0MXJha1N5N0lQS1pReUg2NUNYOVB4ODUzdXBB?=
 =?utf-8?B?OGxXVHlJVGM5UFpySnhEVUFnRkpvZHVVeDE1aDhuTTd3aWpwSkNEMmpYQzUy?=
 =?utf-8?B?OGpoUUpXYWlFMlR4cTY1MmRWVGF6cklxd25sOUtySzhVQlNJRUIvWkZpZkYy?=
 =?utf-8?B?RlZCNjFLUUdaMXVTK2F4VFp0UUxySTBhSVQyZkRiSmlDV21DaE5xNHhXZmtE?=
 =?utf-8?B?OEM1RFllZzNCazhhdVcyT0lKQ0FzWm9KYTNRV0NScFNheklVTXpMRS9GK3kz?=
 =?utf-8?B?elBvNGNvU0tsQS9rY2JOZXA3Tkh5ejQzNzc0TG9kZGZtSWFwR0ZjN0ZKMVhC?=
 =?utf-8?B?UXBqcXg5eGVDRmo3TSs0S3RRSWwzMzdhMWgrMVZ3SG9MZ3d3cHZyMjk3b3pz?=
 =?utf-8?B?d1ArK2JtMUlMVkVsbUliODF0UHdVQzhIZXdLTU5vUjFzeC9PRTFEeTh5aEdC?=
 =?utf-8?B?ZVJRaEJicDYwd1hxM2hrU3RFNElQc1NSVDQzT3VSdjlSRXRaWHNJWFBJS29L?=
 =?utf-8?B?YnJnVmdueHB4Mm11ZFdnQTVQNGhDVFRBV0JsbVlweTd1WEZuU0c4M0U3Ukd4?=
 =?utf-8?B?TndiWlJMemlOT1N4amRFdUU2d2cvT0FtQ2RHVHFDUnBHRGs0Ym5mdWJSZFAz?=
 =?utf-8?B?OEFsRndONVEyWTV0bDE2WnR6NVJiZ3Y0bGduTm02WS9PZHRteGlWSXpqbkY1?=
 =?utf-8?B?NkpsS1krME96eWlPVUEvSEZKOHJGaHNoMUpuejNGL2FNMGkwUmVHSC9LNWN4?=
 =?utf-8?B?N1BranJDUFZHQ0tiYUc0KzFyNHJJYnNIbWtPbnE0S1pqRjN4TmE3KytRRHVn?=
 =?utf-8?B?Ti8yUlNqN2FlWHNtbVFjdnlNcGxodVpFZDhNMmhZTElNQXJ0RzFnWlg1MXpX?=
 =?utf-8?B?YzZxZmRGa0FNRXBmQkZLdU5WN1d3TXR2VVh5NU1xUHhYQ1pVZGdndVB3ajBh?=
 =?utf-8?B?c29BVG94MUpONmFITXlGUXovbEIzZ0VFcW1ESUFTRU16TFEzY0h6MGlINlhW?=
 =?utf-8?B?eWxoU0ltSXhYQ2cyK0tVNEVSNXVKLzVOL0c4bGFOVTVaNzA5SzcxQjEzcDE5?=
 =?utf-8?B?N1VOWDRXcklGMkhNa01lMnVtenFFckZwSEYrdFFkV2ZybDdMRGVob210eFFk?=
 =?utf-8?B?NzdTSE9MVDNpWUJWT21aVU45L1g2cHFFODFyaStUMzRDRXhhOXAzT2U0QTJ1?=
 =?utf-8?B?dktCK0p2TkllL0lINWFTTTdtVHQ4c2pleDZGZXdiak5xV09SYzJGaDZwRzgy?=
 =?utf-8?Q?G/bnzvWilYoVhiltaFdviTc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aab378d-b9d9-4737-e98a-08de0be5dfc7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:25:06.7251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA1S5DyS7nkOyIcKxPLIawGyDBY/oo/GDsWUFW6RUiSgQdsFD2s/DBJ9UrnScQREcyq2C2BU0bsouewBeYL9m/bEAUz3bt50SJWbhCN2iDHLbGMXsyGWq+izqEJZvfu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

On 13.10.2025 20:24, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Since the hardware load balancing is no longer supported, the
> programming in RCU_MODE is no longer necessary.
> 
> Bspec: 60382
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1cf623b4a5bcc..5544d91c21e8e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -349,6 +349,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>  						 const struct xe_hw_engine *hwe)
>  {
> +	/*
> +	 * Xe3p no longer supports load balance mode, so "fixed cslice" mode
> +	 * is automatic and no RCU_MODE programming is required.
> +	 */
> +	if (GRAPHICS_VER(gt_to_xe(gt)) >= 35)
> +		return false;
> +
>  	return xe_gt_ccs_mode_enabled(gt) &&
>  	       xe_rtp_match_first_render_or_compute(gt, hwe);
>  }
> 
> -- 
> 2.51.0
> 
