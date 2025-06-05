Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1413CC61CE8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 04:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F310E00F;
	Thu,  5 Jun 2025 04:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+dAj1Sf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5218010E00F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 04:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749097128; x=1780633128;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O2iwodV0XO0baIXnLYCwU5OKiZ4fuUfHX7vfcBVWPYA=;
 b=b+dAj1Sfz2ahnnVBixn3O39NHEaEY+nY8OjUj2aMZxWry4YB2E26adr5
 92ECY5gDqwKOsmNHQVgMwFMsbCC4nE9frpB1dfZDCkn8D8RyjwCaQFCqj
 R0BGImD4flW0bxtmA64f1nWMNzGooLWafbYURop5sf4Uz+3pXkgpL0GC8
 fC2xy2UjLPG2/68+E9xKVDeiF9vlwB7WSiOYvH4JRvCiTh5THloVZkD/x
 wkytpnHQvtgpj9yHei3mXhFrp76Pi8VLEemNtTYU8oPUmx/v/sZM413Br
 j0WChukGIv0MuME7YqrgVqtcPOQKZP/DU3W6fbKl8Ky321wxvHU0Emtx9 w==;
X-CSE-ConnectionGUID: /WXhtfRxTiWPRFsykTPgZQ==
X-CSE-MsgGUID: Qmids4zyRhCDNoCEHdzXqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54861892"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="54861892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 21:18:47 -0700
X-CSE-ConnectionGUID: DtnvHDDdRYuMY4NvaapinQ==
X-CSE-MsgGUID: COSGBX2SRUyuFFudUFrM5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145259727"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 21:18:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 21:18:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 21:18:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 21:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep4/IvIruYpuyLncEo+pw0D6GiZh7mGA0Mm3F0j8HmUAmioLKW9ctpHBvSjXGLA8/8oH+s3EGdinsnrEzjgZgbdngXbaKXb/cHhsy+xgwWF0cXdK8AYqlMqN3/hDad8NaWHcKjlMy2vQO3D9gqoB+CZiuw0tKZXo3ddoCwThVJ1xW9hraPR7RUfZ1Vy2DJCQz8FQiPypITKSSEyDfqTATPgueK52psSLZefti4sLOTStRND0XOB1USJCwcVvbvXRuBLroTs39L+2fDwwsmgNsMYN8M8c5bDHbzeluHPCwp+SImCxc4QYAOsJ7/xnB6tzZEj9NohkB9V7gKkIEBubZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqotGgBae0/EPWyGiZgePyYsQnNOKO+YHRgpk2Oltsg=;
 b=eVmCyOrrnyIpMBnUTSHC45apAJe0kSUlU1N7HmzINhjFMZt0aai1XhuG2A5qJMt6Z20RXUj+ntzv1Fvq7j5wR5aMZsCKdK2/8oAfauWRmu1kZx9rpJ+w+WEameYiLGDt4KN2Oqe73WUZE2+zO8Z2nz+73QxVYSirOQ+9vGAkuzXZ4ddLkynIMLRh0N6K6f4ZwWvPFnKR8Gs3qkrS/WtCQMxqHo2Nosv9z9iyCEj1ZLVtl9GfJE6Ig5m3y/OUVwxB2w0FPLhcieu9x1miEPWiOQGRpC8KeN5qTDicvA6pwomjL4I5fta2r8KQAAWSa2N/1OluQWFWerg3aZkIal7GJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Thu, 5 Jun
 2025 04:18:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 04:18:43 +0000
Message-ID: <b25c35d3-f7bd-44ef-8b57-698fe836a2d3@intel.com>
Date: Thu, 5 Jun 2025 09:48:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/bmg: Update Wa_22019338487
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-4-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250602234415.2015921-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: c77ab30c-de93-4ea9-2a20-08dda3e80eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9mcnpOblc2THVEdnF0L0pJL1owMDhRbEYzUXZOUzJ2SXg0MU15aVZ2Q1dR?=
 =?utf-8?B?MW96aWZaRzZtMFVsaXhYUHNQVTkrcEttVExQTFBaN2k1VFV2K0hnaDlSdlRM?=
 =?utf-8?B?S3MxQWxnWTFtWEZEMGUxdFhTY09pWk8zSkNqdzQ2QTQvN2JiaFQ5YURHRDRI?=
 =?utf-8?B?bHZ5bTlzalYwQXd3eEg2MnhnM3RmUlFGMVhhSHB5N1BJL3NqTFZiVTNCTEJQ?=
 =?utf-8?B?djFCSFJOL2NNQ3ltOFRKdDB1K05wYlhTdzNvRXVLcjRSVjF6cUFreGVQMEMx?=
 =?utf-8?B?UVAyTEtDdS8vMUUySE1aZjVKVEppRENtZHQrck1OZFBEcHZNMVBtQlorYmQr?=
 =?utf-8?B?d0t4MjN6K1pzRFdWUFFBdDdqVzdrNFR6MkVDRWZ5MHNVVVNLNzZ2TFNNdEdZ?=
 =?utf-8?B?SWViLzNCeE5zU2hoYTY4RG1lSUpYdmhiaGFTSDBMQ0RVa0ViWVhzNTRoMDgy?=
 =?utf-8?B?YlRGT3hBYU11Yjl4QlZNbUQzRHM0bTY0UmpiM0pCQzk1LzFHcUo1MkQ3dGpn?=
 =?utf-8?B?MVlmQUlLMGc1QVlNL2grRnJ5ZVhEUGVZeU5Mb1JkSU9yK2xla3VVZm5TdE1l?=
 =?utf-8?B?bEdlRC9ETWZFaFBOeERqc1NOQkFhSXZYQjg5VHA0cjVRbHJKcVd3UTV5S3kw?=
 =?utf-8?B?ZU5XU1V3ZGdHcHIwTzZ3ZzhoLzUyNDZ6YU41VnZjSkFZZjFMZURQNkd2dlRa?=
 =?utf-8?B?OTZ2L0hMY1BEV0s0QTErMFV6UHRZdzB2ZWkyVDh0L2xpekdiLzRCQlhORklt?=
 =?utf-8?B?emM0NTZGaU9NQnNDWTFTUHRGU0c2alI0aTc0b2JGWUNLSm8vRERpd0hHRTcy?=
 =?utf-8?B?QUdCSEFrMU1WYUNBRWFCdkxUYk9TNTg0YVVQdiszbTF1UHdiMTFUTVVQY3Nx?=
 =?utf-8?B?RzZjS2VhM1l5Mll3SWRaRVNFeVpmUnpDYWZPVXpLeWttSEQ0S3VRMkErMlJw?=
 =?utf-8?B?d1FPTEpMaUZ1WmhuMXl5UW5CNTlpRForSlk5WlU5MGhPaUMwUS9XOE15WEZE?=
 =?utf-8?B?VFI5bTlaK1NnQldEQVdJblo1aFlEaXhMUEsvWk4vS2F5NlRldFFhaEk5SFpj?=
 =?utf-8?B?aGs1MzNKVWFSTURuR3BZQnM2MEZkclQwNkVlZ3MrNG43b01MZXhGUHBiWDVm?=
 =?utf-8?B?K2NJQWh4eUxLaEVZRWNZYzhvTWxxcTRkSXRJM0themdiMEFyTUp4TjVhYnhC?=
 =?utf-8?B?UDlQd2NabzlaMnpzejNsTVoxcmFCQTBHbU4wdnpyWGlmeGY3VHFtVkx1SXBz?=
 =?utf-8?B?UTRSenVObXNQYXhScVRkalkrTVk4K0Z1K2VFM21Kd0V5QmZyS2xqR2Qya2dT?=
 =?utf-8?B?MEZ4Nno4Y1FYUHAwYXl3Y3lNd3pheGRxZUNHbWlmZkxkL2VCVWZ2ekowd2RD?=
 =?utf-8?B?N2o4aEdHbzMzNE95allHcVBGZGVEUFAxMEpiOVBQb1M5bDJtdzdmTkJZM3l0?=
 =?utf-8?B?UU1xaWdmR3ZhdXJMTER5MmJBZGp3VEVzUEprdGlkYVUwK1c0dTg1eHpKVnFp?=
 =?utf-8?B?Q2dXNE9Mcm02TzJVVEZBZEhEQzZWVDRvQWxUUkMybXMzMi9RMDYrTFlaMjBt?=
 =?utf-8?B?eHhROFVYRzNZaW16NEw2bVdDQ2gxNmtnTUZzNXVyS2R3VDJrMVF6YThDSDl6?=
 =?utf-8?B?Z1hYeEp0VjRtSzRrNmp2bGpaSGxNMWx2QktDbjl3ZHpZRTlUSEpqU015K2Zp?=
 =?utf-8?B?WmI3MlNnTVVvaW5CNG9sVzV3a2tGb1B4Y0xsQ1NOeUxYUXpaaXRhVFlYcE0x?=
 =?utf-8?B?V2N3YkFkL0tNZURrTm03MXRybk9GOGFzMmtHNm9UclYrdktyQk14VDVia1Bk?=
 =?utf-8?B?dG1aQkxDL2xvVFY1Znp1NEhPUWl3MURwU0JhaW4xMzFENmdnZDBqTmRYa0x6?=
 =?utf-8?B?Nm9TTEczSjJJRlN1VlpqVTIwNWZyTFZKcEdjUDd3cGM5bWlLZE1MVmpVUDV4?=
 =?utf-8?Q?B3p7z8ObWFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJGTzNDQUlPVWFLeStxUmJKUyttTC9CK0JEdEdFUXNDVkJPMWVOcldIZVY3?=
 =?utf-8?B?QzdTRExkVVlOd3lJS2VUU1dLbXd1ZlI4ZnhkVW9oTHBuVURzVTFqazEzNDNQ?=
 =?utf-8?B?cm5YYnRlaUovelFEamJsKzNsdVlCMHJkUWkzWnhXSjg2S2x2ck5KS3ZiNHJO?=
 =?utf-8?B?ZjAvdmpPWWpBVjVGL1JFUGxOVi9FbjFaTE9TRlJzc2hJZE53SXdoZzR5OGJM?=
 =?utf-8?B?TUV5c3ZacFBTVXBZK1JqeXRzT3NXL3gvWVFIaTRZNXlyWElBUkpac2tWKy80?=
 =?utf-8?B?Y0pSWmJ1UFZyaVJvTWJmdUdUV1pXeThzUFhzbTNVdUlNYjdMakU5WkNzQ0lJ?=
 =?utf-8?B?SlVQN0d1Q3lOZjdEQVFSVm1mZm5oNWM3emQ3ZWM2WC9BeVRzVlB1RngvdXB4?=
 =?utf-8?B?S3QyUExSQk1QWTdsdG1yanh6WGkyYzl0S2RXV0FUeDNFeHQyOFAyTUFBVVFK?=
 =?utf-8?B?aDVrL05JZ0RhN0ZTU2tkamN2K2Q1Wmc5YjJUNXpOMFV5S1ZWekY1Q0FBQUNN?=
 =?utf-8?B?dWVZY3hjQUo1TzNkL2lkSkZsSXdMUzJwbHNvYWhOUGtmaU84dlNiUFFsaHRk?=
 =?utf-8?B?ZExUNEN5dnpUd1RUSXgvVEZjYTYraTlMSWpqdlY2UzFVRXpRY0VTanV6MnNN?=
 =?utf-8?B?VFhRei8vR0l4T2lXaldyNE5DMytoUWhyVEVGTDlGWm4xdTkyTjBjZ1JPUTRn?=
 =?utf-8?B?b2pLdFBBWUEyTXpwZEpFMG1MRlcrNHlRZ2o1Ly91N3I3QlZHLzIrNFg4UkJJ?=
 =?utf-8?B?WTdhb0ZjYnM4VkdTZkRTeGU3cElxSUJHWVBiTXJ3SVk2bm14eTZsTU1PMlhw?=
 =?utf-8?B?MEY3dnp1TmM4djhBZ1F6Lzl6ZUw5V2EwZVBQcEQySkZIV3JqcnA4R3JZdk1p?=
 =?utf-8?B?czVveitaOUVndzIyTXVIa0EyVXBCaVowTDJDWHpRdWFvN2I4V0FBNENET2R4?=
 =?utf-8?B?bWx0ODQ1aTZyU1JlbTQxMkNoU3djWVY4ZEVoa3FhdXFZVXRWaFNGeHdwS3ZX?=
 =?utf-8?B?L0pMM2t4STdFeGJLMG0yWVpFaExaQ2IzUk5zYUZjNjd0dGFmSG1qYmVicVB5?=
 =?utf-8?B?WE9EVUtFMElMY2VoaUZzQUxHV0IrNXRZVy80L2dHZHNEbDIvVE5XeGpOSkY1?=
 =?utf-8?B?QVk2NkQ1Vm4xbWw2aUUxajU5ZTdpUm51TnYzdG1acXFxbUtTOHJuQVBRMk1l?=
 =?utf-8?B?OVhLdDh3b3pycHhRYWpKZ1dIeEZtTGkrZWo5US9sVGJqT0s5UFkwOEI4MHFw?=
 =?utf-8?B?d0o2SUpuRTRSUC80Vk5EcUFzNDRXUTRSYno4RjFWYUh0VjZUQWhWVGVVd0d2?=
 =?utf-8?B?cXZTdkZIU1VhZTRUN0lXdjlNK2FLSzRXS09ldjZqOE9iendMeUg4c0RST2JB?=
 =?utf-8?B?MVY1NHpyKzFQSTkxMERBNUladTJOa29WY1RFYmlPcFZKdHZjNzA3K3VxZFB3?=
 =?utf-8?B?ZHJyZjVObWJzMERuMGZZd3BidzNob2d0dHZUMG42VXRQMzFQbFdOYmI1WURC?=
 =?utf-8?B?c0U0aFdLU2phazZESFlheU9kZHFtWWNnUGVMdmpiaXhZR2ZRMUlGUXVyVStp?=
 =?utf-8?B?NHo1NUUvUVQ2d0JyNmZBR1VBS00xeEdhYVZLYVI3cjV4TmhRUHl6Um9VZHpj?=
 =?utf-8?B?RFZncTArUmwzZDB4SkVUVUxMNG5JUGdicDBiWVdGdG8rRUI3bk54V0FZUERW?=
 =?utf-8?B?OC9qTlphVVN4cUJUZkNkOUQvVk1HWkxzZEpSRUZyR1R3Rzg4UFlhTWl1dEFs?=
 =?utf-8?B?R0ZIMjlwTVVDcHJpZVhwRkRueGdSTFdwSzcra3pHczFDN0NFbEN2VGp1cEdF?=
 =?utf-8?B?ZXdORzRsVjFSRlBXRVZ3YS9nb0F1N0lnYXF4WTVrTjNSVTMxa3NyQThKNDJ2?=
 =?utf-8?B?SVdXMXo4SEJNRXFiUDg1L3R4a3dQOU02djFvUW5ZMEVXMGo5b0pKaFJ1MDlw?=
 =?utf-8?B?d1U1bHlnM3NwS3JVcEIwOVd1Sy9zNEd1Ylp0K0xJMkNiazdJa1c0ZG1nVFJE?=
 =?utf-8?B?K0kwNjR3Zm5JbUpTR2RmUHkvMVBId2JoSW9JSk9CdVhwVTRJWStBRFQ1L2Zq?=
 =?utf-8?B?cGVhWi8vRlFYWHVTaUYxWFZ4Wm5DSlBDdUc3KzBVVmdDWmRVNldCMEVOblN4?=
 =?utf-8?Q?YsW0nHsmMXypZUtlxIKor5qll?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c77ab30c-de93-4ea9-2a20-08dda3e80eb3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:18:43.4152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /03FHXWp6OD0/piQaNrs3grJGXmlD/AOFqzZK2UKm4bqhnTCgmyOwLwNiTGNiCUfstmSG9qM2Q4zOacNlX669A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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


On 03-06-2025 05:14, Vinay Belgaumkar wrote:
> Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
> GT actual frequency is limited to that value before performing the
> cache flush.
>
> v2: Use generic names, ensure user set max frequency requests wait
> for flush to complete (Rodrigo)
>
> Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  10 ++-
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 122 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
>   4 files changed, 134 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..f703aa03eaaf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -40,6 +40,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> +#include "xe_guc_pc.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hwmon.h"
>   #include "xe_irq.h"
> @@ -1000,16 +1001,18 @@ void xe_device_wmb(struct xe_device *xe)
>    */
>   void xe_device_td_flush(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>   	unsigned int fw_ref;
>   	u8 id;
>   
>   	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>   		return;
>   
> +	xe_guc_pc_apply_flush_freq_limit(&gt->uc.guc.pc);
> +
>   	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
>   		xe_device_l2_flush(xe);
> -		return;
> +		goto done;
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> @@ -1034,6 +1037,9 @@ void xe_device_td_flush(struct xe_device *xe)
>   
>   		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
> +
> +done:
> +	xe_guc_pc_remove_flush_freq_limit(&gt->uc.guc.pc);
>   }
>   
>   void xe_device_l2_flush(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 793df3486d1f..12ab1eb619d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -52,9 +52,11 @@
>   #define LNL_MERT_FREQ_CAP	800
>   #define BMG_MERT_FREQ_CAP	2133
>   #define BMG_MIN_FREQ		1200
> +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>   
>   #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>   #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>   
>   /**
>    * DOC: GuC Power Conservation (PC)
> @@ -647,6 +649,25 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
>   	return ret;
>   }
>   
> +static int wait_for_flush_complete(struct xe_guc_pc *pc)
> +{
> +	int timeout_us = 1000 * 30;
> +	int slept, wait = 10;
> +
> +	for (slept = 0; slept < timeout_us;) {
> +		if (!pc->flush_max_freq_limit)
> +			return 0;
> +
> +		usleep_range(wait, wait << 1);
> +		slept += wait;
> +		wait <<= 1;
> +		if (slept + wait > timeout_us)
> +			wait = timeout_us - slept;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
>   /**
>    * xe_guc_pc_set_max_freq - Set the maximum operational frequency
>    * @pc: The GuC PC
> @@ -660,6 +681,12 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   {
>   	int ret;
>   
> +	if (XE_WA(pc_to_gt(pc), 22019338487) && pc->flush_max_freq_limit) {
> +		/* Flush still in progress */
> +		if (wait_for_flush_complete(pc) != 0)
> +			return -EAGAIN;
> +	}

I see possibility of race here. Another flush may start here and while 
flush is in progress below code may end up setting up frequency higher 
than flush freq.

Regards,
Badal

> +
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
>   		/* Might be in the middle of a gt reset */
> @@ -872,6 +899,101 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
> +{
> +	int timeout_us = 1000 * SLPC_ACT_FREQ_TIMEOUT_MS;
> +	int slept, wait = 10;
> +
> +	for (slept = 0; slept < timeout_us;) {
> +		if (xe_guc_pc_get_act_freq(pc) <= freq)
> +			return 0;
> +
> +		usleep_range(wait, wait << 1);
> +		slept += wait;
> +		wait <<= 1;
> +		if (slept + wait > timeout_us)
> +			wait = timeout_us - slept;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487)) {
> +		if (pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
> + * @pc: the xe_guc_pc object
> + *
> + * As per the WA, reduce max GT frequency during L2 cache flush
> + */
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 max_freq;
> +	int ret;
> +
> +	if (!needs_flush_freq_limit(pc))
> +		return;
> +
> +	ret = xe_guc_pc_get_max_freq(pc, &max_freq);
> +	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
> +		mutex_lock(&pc->freq_lock);
> +		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +		if (!ret) {
> +			pc->flush_max_freq_limit = true;
> +			/* If user has changed max freq, use that value */
> +			if (pc->user_requested_max != 0)
> +				pc->stashed_max_freq = pc->user_requested_max;
> +			else
> +				pc->stashed_max_freq = max_freq;
> +		}
> +		mutex_unlock(&pc->freq_lock);
> +
> +		if (ret)
> +			return;
> +
> +		/* Wait for actual freq to go below the flush cap */
> +		ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +		if (ret)
> +			xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
> +				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +	}
> +}
> +
> +/**
> + * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
> + * @pc: the xe_guc_pc object
> + *
> + * Retrieve the previous GT max frequency value.
> + */
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret = 0;
> +
> +	if (needs_flush_freq_limit(pc)) {
> +		mutex_lock(&pc->freq_lock);
> +		if (pc->flush_max_freq_limit) {
> +			ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
> +			if (ret)
> +				xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
> +					       pc->stashed_max_freq, ret);
> +			pc->flush_max_freq_limit = false;
> +		}
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +}
> +
>   static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   {
>   	int ret = 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0a2664d5c811..52ecdd5ddbff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>   int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>   void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
>   
>   #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2978ac9a249b..e3a815976bac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -31,6 +31,8 @@ struct xe_guc_pc {
>   	u32 stashed_min_freq;
>   	/** @stashed_max_freq: Stash the current maximum freq */
>   	u32 stashed_max_freq;
> +	/** @flush_max_freq_limit: true when cache flush ongoing for BMG */
> +	bool flush_max_freq_limit;
>   	/** @freq_lock: Let's protect the frequencies */
>   	struct mutex freq_lock;
>   	/** @freq_ready: Only handle freq changes, if they are really ready */
