Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A19EED615
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 15:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE8F10EBD3;
	Thu, 12 Sep 2024 15:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5kiP8lD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75DD10EBD3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726155570; x=1757691570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PIlacwWC6qkyH/To4u5V3kqqV38TYM1JcaWu/OmDdYQ=;
 b=M5kiP8lDfN0UXvQYiFemYCV2YQctfhULSre2txxYMU/p0SzSDlfc2hmY
 SSzzMS5OwrO8GFpw+bZFgc1G4KqYsaPRCLbQZJzcBOLJVEMjnXPS+oDT0
 wV0lk95mR3cSXJtUSX1r73ocsE9fJ+jpt8+5VNPPaFEuldEB3fNCaIG1d
 fCuGnhBNbbJc54R7Pyj5cT2Z06Lv9oLaFf/gSixGttwtqT2uPcUSIQOv1
 1U3n4p3xKb14JnbwahDFy4VaIfhB3fj6imoEy5vtqr2WgzOBoa071a2Cz
 pqDto3MQhuOc2U/oOoe16Plz8Qs/jAu3dTpZDjuM+3+CrwRQFpk3FyfgE g==;
X-CSE-ConnectionGUID: iDqGgys3RFSCW/KFogWmkg==
X-CSE-MsgGUID: 3YkxD8nyShSX3AViCcVJBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24891809"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24891809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:39:29 -0700
X-CSE-ConnectionGUID: Latfu8egSE+UVYn+n2Ps7A==
X-CSE-MsgGUID: hEn/VccfTpCwvJDX4qeUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68001487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 08:39:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 08:39:23 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 08:39:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 08:39:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 08:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPPrvVTcHK7Ni+AnpxTv6W9P72+7olouoZ1+Ay2qcjog+J/l0/F++xZ90r5yMfrLkU4l1B3HJAHbdIxyjaijhvWMoV2jRgzmFazhc+cLFEwxcUT4qeJIz7x1rMJjioEBDdp6iG2hOFsDE6qU224IRQBuvruKPitfqBU6/pe2QcsORyVpfCMrv7yZ4unCP6qb6rTz+8AFgkYD7rWMhW/9aVzJlwlRCZLQNPu4tK55wSWSI6d8X5Oxvmki24xBBatI5lLaRViSioskKAwFMzX+etXAw9Z59GjKCz553SIc4S9ljgXgfkOxGlhJEAxpQb+Cq+FAebOGrEQw8a4YAR4i3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIlacwWC6qkyH/To4u5V3kqqV38TYM1JcaWu/OmDdYQ=;
 b=jHvr/tO9tKQG/rBuCf5K4XyPtV1eWO0f0+3aqAdZxgv+Pv5FTtewwHU3RjuYItv09LhZ+lE4HB89MJZfXbnTu0CpltZOeR9JSgEsmybudLAPfJegrodjtY73Y+0fiEn0c7O5jZur4Stw1b3hyKCdDTZ+iZAPuh51/4OVoauXxXRpEXqaBXHEigyGTcEMDE9xA4uiKFDGhc5624Bv9h7+fUwvv2qpGMnwuRZD5GL36JxND4Y/g+V+ioHr7mMzKL8Ou6lTxp5JTVyRSHm4Q6Lc9H01g+yVA/KF2VvSE77Yj0LaH5eruXv1OPpeaWonLIiPC2CVAxRlegD6G9O2RyJmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 15:39:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 15:39:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Add a parameter to xe_bb_create_job() to
 append or not batch buffer end instruction
Thread-Topic: [PATCH 2/3] drm/xe: Add a parameter to xe_bb_create_job() to
 append or not batch buffer end instruction
Thread-Index: AQHbBIWTfMTh09cUnEaMhsumwNnXlLJTac2AgADg/gA=
Date: Thu, 12 Sep 2024 15:39:19 +0000
Message-ID: <edd238877cb8b34d9bc1914c8180a39b921b29dd.camel@intel.com>
References: <20240911200218.130219-1-jose.souza@intel.com>
 <20240911200218.130219-2-jose.souza@intel.com>
 <87jzfh39ga.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87jzfh39ga.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6440:EE_
x-ms-office365-filtering-correlation-id: 68b961d5-fa85-4916-2412-08dcd341111a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODErOUo1SzZnZjJqRFBZVUFNSmxvaHArUVBNK1FqeVEyb1FOcExzZi9xd05r?=
 =?utf-8?B?d3BFQlFNMlhtdHd0VzNEVzZvdTRmdVFVS2YyeE9mL1lMUjRnU3pEK3A4Y0dZ?=
 =?utf-8?B?QS8xb0ZvTXdFT1BVTEQzUDNmS2NCNG9Fay9SS0g4NnpUNndkam41WWZvbzFl?=
 =?utf-8?B?UnRlbk05RDJPbGsxdVp2OG1VRFJ6cVlyWDg2SDRqaVltdDA5dlZGb2FpV2Yw?=
 =?utf-8?B?K2pRN1ZyMHNDTHlYWUovYmJpUnFrNEhLZ2hYRTFrNXByMTRhYVVkU3drNmVu?=
 =?utf-8?B?MytrWU9MbHczMWNObDBndUpmcm1NRktXTTNmaW1zRTRXOU9xUTQxQk91Ymg1?=
 =?utf-8?B?ckNEbUFzR0pUdElwWEkxR05IS25PWFY2UllNbmxWZG12VDJYZXpGaWtxNU4z?=
 =?utf-8?B?NUlzS0Z2VGJmMXhrOXVsV0Rsd3doaEhpcDc4UWNSWmdmMDdaSkFXTDR3Tzl4?=
 =?utf-8?B?dUpmZHJDdEtHWVg1Yy95RzMrc0RPeTNnMVVkeCsyczVsVW9xNHc0eFI2N2Fx?=
 =?utf-8?B?WmVOSXdLd2RpYXFwQldqVlkyRGkyVG5DWjJNVS8yUUlldnNEVk5xR00raDRH?=
 =?utf-8?B?cXpaTUFHelhWTU5qNDc2SmxOWlhSazJXcFJDeFM0MElCNnNFM1FQQktFUUd2?=
 =?utf-8?B?OHQyYnZ0UkFpbkFoVUs0R1drc3cxNFg0d0h4QmhoOTZaL1kzRWRweFBMR0V0?=
 =?utf-8?B?N0h6VGxhY3NRSTd2Q0xjUzZ4Y2QwemFnRjduRFlWUlpyYXVpNXorODlrNXc0?=
 =?utf-8?B?UkxTb1EzVG16dmxTN21iTkhjUWdwMjRuelNaWlBLc0s1R3NiUUFQcmdUaVBH?=
 =?utf-8?B?YnQrSlN0QmZ5Z3BhVEJBM2VxZDQ1T3VqUEVYVDdNZ3dTcFZLeHdQOEpaU0o0?=
 =?utf-8?B?R3hlUnV1OEhoZlFuQjdqaldpc2lWM29jU2M2WjlPN0M3UmhLVG5sd3hkNldr?=
 =?utf-8?B?UDlaSmtjcjZJeDFJZzh0bDFhWlY4SGNGMG9PVjE3dmVjRzVxaXVaRHYzdjhU?=
 =?utf-8?B?WnlHa3FZcmQvZ3dTeUZ4VlZhNHFrcXBQVjNLUkhMbnhGcE14cmp5Sk10cG1B?=
 =?utf-8?B?VFhRb083dnZwSy9rNGlHd08rUkdVdUNrSGdMVy93UzArVEx4K3ZJRllUTkNG?=
 =?utf-8?B?QVllVVhhZU51RkhMUzM2MThoMDJjTmVEQ3VxanFDdEd0TmNlOWlOQXZxcGVS?=
 =?utf-8?B?Qi9TSk93Mzd4VDZ2MWp3cUNScDRUeExMYTExaWNodCtqd2EyRDRQR290anNi?=
 =?utf-8?B?ekRWM3ZQdnpsQVpvNkhPK1A0MDMvYWFMbFZFRFN6OEtzeUxIdWNuYkVrWnNt?=
 =?utf-8?B?WURES2FnT3phT3c0MVp3bnZwZ01ZS0RWMFZ4emlSTjBHbmhiVENPUUZQczFN?=
 =?utf-8?B?YW1Gc0RFSE94bUJNbjZkYUcyek9RRDU3N3k1dVk2ZENuajlneWFaKzk4ZU9o?=
 =?utf-8?B?WUlqWmNBOVlwQ0ZNck9QMGJCeUgrWHJWcFZZaFprMlVmemJEOC92eGhGTTdx?=
 =?utf-8?B?NU5BN3oyM3Z3WUdzOXFMMDU4WkpHTTFzM1hqQWtIWG5QOFZDMm9qY3dZRVZv?=
 =?utf-8?B?OTdTckN4eG5TNUs5R09jNVY0MEtyZU1kY1BzNGlidXBaUW1OZmFhaHpXYjdR?=
 =?utf-8?B?dWZDckQ1Z3BUYlkySEJZUWVVM1pEcnB1Y2RsanltcWRlUkFzZ2k1alU4Mllo?=
 =?utf-8?B?TUozUkpsb2luWFltQ1plTUVLWEdDbXdpZ0RvZXVHNVgzU2VLSnRwTGJydzVy?=
 =?utf-8?B?Q3ZUdVVrRDU1Ly8zaUM3dHk3TjBKZjEyZHkvSy93QXBwK09VWW51S0RUa0tp?=
 =?utf-8?B?NGJxYWJCS1lOS2dpQkRlOXJNSTJuZHovc2lzam1xdC9UcXIzY25RbUNGbGJF?=
 =?utf-8?B?OHhYaVM2UkpFUXc2OEEwWlh5ZFhwNzdGbE9IOE1CWlJ4QVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnpZZ2ZJMGxJSmhia2V1MThWVGJQaUppcUMvendZalozVzV3K1hGUjQ2Rjhj?=
 =?utf-8?B?ZjdlL0VyUWhKNzlnd05KWWFzZ2lMUmtaSnFWaUgyL2Y1ZmZDRGN5ZkRSV1N6?=
 =?utf-8?B?cGcwdjRYcXdGSzFGTU5GM2hKOTl3dGV3Z0pHQzZlaG9pS1VuQ2tWVUxRWjNu?=
 =?utf-8?B?c3VzL2p6ZDlTNGNiM0dMR29OUWkvQkQrUFN1elJLc3NmazJEYTRtYU1iVFRC?=
 =?utf-8?B?ZUdudDNYdHFacEFsQzN0T0pxb0hYSVNkWDVnM1NWMzFTMlNTYWpmVzV3OEdr?=
 =?utf-8?B?UXdISEJuSytaWUZDMzdyU3N1YldTK2lTTFhNdURjSVlxNFhFdVFZTEsyV1Bk?=
 =?utf-8?B?bWQxQnhFa1ZkK0N2TnIwblpCMU96Q2JkRFBUYUNPVnFwNHVRUlJqUlFEYld5?=
 =?utf-8?B?OXBEbkVTVHg5N2tnZ1lBeWNGdTZwcnU0TjIzQ0dpUWxtRyswOFFkdk1uTlFZ?=
 =?utf-8?B?cVA2R2o3ZzJ3THBVbUt2RHZpbXdpV0R5dWlCdDdJemJ1aTI1Tml4d2pMZXBp?=
 =?utf-8?B?QlNJVHFqOVJ6Qzl0aWEyZXpZdDFFNG54MFZKcE9Bc2FBYlNwMlNpeHFQek1o?=
 =?utf-8?B?MTZMMjlvL21xcTR5Z3pBRGkxNUZKaktEbnUvb0tUV3A0blpyV0UxcUtIV1dl?=
 =?utf-8?B?SDkxWXRObDh5NnBndWJsdSsxRVFZb0ZhODFvbnZKUmtVWXdmZEJwUEhwUEg5?=
 =?utf-8?B?UEtjUEQxTy9zN1Eva0lkdHRQOEhaMnRhMkxMaDUzTEdYMnJVdzh5aUVyZXU1?=
 =?utf-8?B?YWpvS2dKVzUwMzhjRWNFc0UzcitPNkErK2ZNQTN1SjNnamY1cW5lbElpcm1h?=
 =?utf-8?B?WW1Rd0VSbVBVMDlYa0w5c1ZzbE5CTC9LUnpWcUhEYWRTNnVnVzUyeTYwcEhK?=
 =?utf-8?B?UjRtdjNyeDI1bmlzcUtaZmxtYkc0RVFmaGRoYnROVEwyY28ydDZUSjhENjlN?=
 =?utf-8?B?WHpRTk1VWTFTTmtqUkNRNWhQOGdpcVQ0NTJGbTZ2N0pWeVFCNndhYVBrdWVZ?=
 =?utf-8?B?YlRKRUtBaTVGQ1o1aThTbnluSHlVc3UxT0cxOUNCYWdERktoMmFLNGJ1aGt3?=
 =?utf-8?B?d29TWW55N28rUG8xTm9TQ0FvVVRmTTBGWVJ5bG1SUFhqaGpCRCtSQWp5Qkk3?=
 =?utf-8?B?MDV6QnVKRUEyWjRqRDBJVXJzSnc1dG40N3VJQzVoS2ppTWFNWDdhRUFXeEho?=
 =?utf-8?B?V2pSelhxSWRmRWpHRXowaitzRWROSGpuaDIvK21tVVdmNk9kdFllZmFqWVlB?=
 =?utf-8?B?NkluNDFHRjY2QzRiRHhEZmlPMS9pcExBNFlKbDk1RFhTK2VuQXVGRlJUbnV6?=
 =?utf-8?B?Zzgwb2RBaXg5OTI4VFAxUWkwNFhsWFovaE5IQ0N2SU1MYi9CcmN3SzExY3dD?=
 =?utf-8?B?RFVScTBGblJDb2c4QTRWTDFoeEt5aXJtWHVtampSbzVrTGExQ2NnaGlGclhT?=
 =?utf-8?B?QlZVamxvOFlOcURFODk1MWExdjcyaXQ5WngwVHQwdnRNMEFKT29XR3FNY2pT?=
 =?utf-8?B?MHppM0x3V0RjcVd3ZkI3bGRTU08wdmNMVlVsZWRNNDk0bmdMRnlPVjNSQ3l0?=
 =?utf-8?B?WXl0SUdnOGcrdE9OQkZsOXJza2o2aU55QUN4bWk0b04vNm9KQW9LOERZUUNR?=
 =?utf-8?B?cU56TWdvU2hkU1RTeVNYVC9Ic1krRUpZTGdkZVh6QjlRdHhlUlJKYVJXYTVM?=
 =?utf-8?B?bDFHV0svSUYyZ2pXZFh1SXhiaXd0aENGZy9Db1FGOGNjSFdXTTFHQXJiVHc5?=
 =?utf-8?B?WGlSejU1c1VBT3RyL1FBSmpCRnF1ajUyYUgxeDMyUmRMNmF5U1NuaUw3a25x?=
 =?utf-8?B?OS95VkUwaVMrd3ExVnh3SzArUTR6SnBPZzNpMkNXL2FWall3OGdGbDJ0bWZ6?=
 =?utf-8?B?czM0TU9KamJYOUg1bWN3YmZxQ1M5aytSR1hFc1R0aG1COTJjZHFTRW9aaUM2?=
 =?utf-8?B?aWc3VlI3OWc4ZVE5TWVsalFmR3FkNXNvV0VNNjdKeHZaMnJYOVBjbWVVYzlI?=
 =?utf-8?B?YW02ejMvTDRmZDhlSXh6SityNFpGaXRFUHFlNHRpNEJZcUVMVy9WSTJMS0Qv?=
 =?utf-8?B?TmkrSXNOWnM4SmtHOVFuU3ZsZ0ZGbURxRFg3NzU4M28vdkRKaTV5NjRHTk5D?=
 =?utf-8?B?ektLS0pieWhIZVVteVpuUE9PcUhLYitpREVCZXVONDc0QXBPdGRJN0wrRVhE?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C830A81A9F5C1F43B44DBC1AE225944B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b961d5-fa85-4916-2412-08dcd341111a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 15:39:19.2952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXxfhkl3E+J9apZ1MrwOalfLIbavadY29a/XBiBX1Tzom02pytaxQD/h4VgJJnJY76Ra1YT6ThxXtxHIdFYYjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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

T24gV2VkLCAyMDI0LTA5LTExIGF0IDE5OjEzIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMTEgU2VwIDIwMjQgMTM6MDI6MTcgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gDQo+IA0KPiBIaSBKb3NlLA0KPiANCj4gPiBUaGVyZSBpcyBvdmVy
ZmxvdyBoYXBwZW5pbmcgaW4gT0EgYmVjYXVzZSBpdCByZXVzZXMgYmF0Y2ggYnVmZmVycywNCj4g
PiBzbyBhdCBlYWNoIHN1Ym1pc3Npb24gb25lIGJhdGNoIGJ1ZmZlciBlbmQgaW5zdHJ1Y3Rpb24g
aXMgYXBwZW5kZWQNCj4gPiBldmVudHVhbGx5IGNhdXNpbmcgYSBvdmVyZmxvdy4NCj4gPiBUaGF0
IHdpbGwgYmUgZml4ZWQgaW4gdGhlIG5leHQgcGF0Y2gsIGhlcmUganVzdCBhZGRpbmcgYWRkaW5n
DQo+ID4gcGFyYW1ldGVyIGFuZCB1cGRhdGluZyBhbGwgdGhlIGNhbGxlcnMuDQo+IA0KPiBUaGFu
a3MgZm9yIGZpbmRpbmcgdGhpcywgdGhpcyBpcyBpbmRlZWQgYSBidWcuDQo+IA0KPiBIb3dldmVy
IEkgaGF2ZSBhIG11Y2ggc2ltcGxlciBmaXgsIHdoaWNoIGlzIGp1c3QgdGhlIHBhdGNoIGJlbG93
IChpbnN0ZWFkDQo+IG9mIHlvdXIgdHdvIHBhdGNoZXMpOg0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iYi5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JiLmMNCj4g
aW5kZXggYTEzZTBiM2ExNjllZC4uMTQ4Y2NhZTI2NWI0NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2JiLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JiLmMN
Cj4gQEAgLTY1LDcgKzY1LDggQEAgX194ZV9iYl9jcmVhdGVfam9iKHN0cnVjdCB4ZV9leGVjX3F1
ZXVlICpxLCBzdHJ1Y3QgeGVfYmIgKmJiLCB1NjQgKmFkZHIpDQo+ICB7DQo+ICAJdTMyIHNpemUg
PSBkcm1fc3ViYWxsb2Nfc2l6ZShiYi0+Ym8pOw0KPiAgDQo+IC0JYmItPmNzW2JiLT5sZW4rK10g
PSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArCWlmIChiYi0+Y3NbYmItPmxlbl0gIT0gTUlfQkFU
Q0hfQlVGRkVSX0VORCkNCj4gKwkJYmItPmNzW2JiLT5sZW4rK10gPSBNSV9CQVRDSF9CVUZGRVJf
RU5EOw0KPiAgDQo+ICAJeGVfZ3RfYXNzZXJ0KHEtPmd0LCBiYi0+bGVuICogNCArIGJiX3ByZWZl
dGNoKHEtPmd0KSA8PSBzaXplKTsNCj4gDQo+IFNvIGp1c3QgYXBwZW5kIE1JX0JBVENIX0JVRkZF
Ul9FTkQgaWYgaXQgaXMgbm90IGFscmVhZHkgdGhlcmUuIEFsc28sDQo+IE1JX0JBVENIX0JVRkZF
Ul9FTkQgY2FuIGJlIGFkZGVkIGJ5IHRoZSBjYWxsZXIsIG90aGVyd2lzZSB0aGUgY2FsbGVlIHdp
bGwNCj4gYWRkIHRoYXQuIFRob3VnaHRzPw0KDQpnb29kIGlkZWEsIHNlbmQgdjIgd2l0aCBzb21l
IG1pbm9yIGNoYW5nZXMNCg0KPiANCj4gUGxlYXNlIHNlbmQgdGhpcyBwYXRjaCBpZiB5b3UgYWdy
ZWUsIEknbGwgUi1iIGl0Lg0KPiANCj4gVGhhbmtzLg0KPiAtLQ0KPiBBc2h1dG9zaA0KDQo=
