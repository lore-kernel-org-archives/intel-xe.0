Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B0F606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nb11MEM/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2CC10E4B9;
	Mon,  2 Nov 2026 06:27:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140AC10E4B9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793600817; x=1825136817;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PttBA4W0qjSqYZpARPfLjMFAjfUf/QG+8g03pH4qGVo=;
 b=Nb11MEM/V+gIkipIXUyUJU7ht1YnMpxVFYG9Z2f9QjdkbX39K1U/9gqS
 r6Eexe/+sFKOgKPaBOhoWm1gKoAcm6qIWl6Jxn220P7qh2qdZ+M2mDwPH
 LBX3l9CEs//cFSCixAS2bKzsS3AYVPkwmEesRInMCAlSGJ5TU3tdn3VQH
 d47rN9BWpZVQgfbLFIl9hRTOqS+ZQ1cWXDGTB6epmrsZORaSScMzCVWdu
 TpQeogGHuKk2ej7iSfF6BOOS0qQCg+6ky+N+SQNkO0AIFQ41uPe7LiWsP
 cwv13vKrhhEnfOPeVAfaP2V6C9ZCOeo0XuuMd5VS+B6Fb3rQhko+Lzkjb g==;
X-CSE-ConnectionGUID: OajrsRpCQbOoxUlJ+BcV/Q==
X-CSE-MsgGUID: DogEPbXpTEqMfWo6mYmVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2275080"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2275080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 22:26:56 -0800
X-CSE-ConnectionGUID: ayYQZOXOQDS8BLDBkJIaxA==
X-CSE-MsgGUID: U4ROcLyORSWWLuiSgnj7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5908241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 22:26:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 22:26:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 22:26:54 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 22:26:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAgH45U3I0KyVRINZ4lS45k9X2LxLVFJes8Fzd4kp21BRLRuI1zcoIXsgnMTlWXjPWCFE8+dsDHZRS6CdYcwlzaKW7pF6ZvUHzNJNh35QrM/+oYLZPryhoXzcmZUram6PElb7nGZSGUVvB3PswMWDZ2qpZUg6+HfLuZ5G9nYT2n6md9xTw8X6kEI+CRPzzeB8kTk1Iqc1bIFucbjn/Da8qqlvVWfggZdyd4hdlyiAcqFHGRJf4YP44sEnSLPddAYFM9695kRkd8f9BBR7uoHN8d+rFhlVO8GK5jXbwsCEePmEDwD0QeHj0pTkHKiQogQURabNdIKxNApUqNuKddREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApatmFrCzPPi9UhGVRDDOmU8V9PhhYEDOtzIRpKAEgY=;
 b=mBirmJ0SPSG44E9D4uWxbIVlGsUnL5QstEk77eWeIR83q8yXQflxxm2umCuTc94gC98tFEVhWWZxvI1UZlcUktzhVxTxQOQW3RDIdNi2qwTGiWT7W7ckbpZhF3FZii7zunLfgJMV/ui8nwutt9C8yNTctdX39rTtGFRGY9B5+5zZfn5c/Ezf2WNLQInenGjjW/VIO4shy0BkZqBcymPz24AB4KDNx6Dd7medxilonZDQ+D/WjY4MfY4pTEoszx65zxzbMNSwgThjyEgumZxxjzDKttL2O3DTmW2lh5t5RZdwDprzfBB52IRjDTguT3APEvo26dIPsMvhzcxa8/LqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 06:26:52 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 06:26:52 +0000
Message-ID: <cdeea51f-79d9-4ce2-bc20-0850e20de940@intel.com>
Date: Mon, 2 Nov 2026 11:56:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] drm/xe/hwmon: Update fan info after late binding
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-10-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::9) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA2PR11MB4793:EE_
X-MS-Office365-Filtering-Correlation-Id: d17bcd2b-76f3-42c5-376b-08df38aa4874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18092099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: SE7U+HMQ7SKai4uCwOvnKYXYMeOWbOx/oFyl1SmkGRdNHMTNI1B28NQof9uA0gEhXd/Jt7Q9mmDgP+1Nh9JubhqQbby/dNHLo5Q1tV+IhJuCH6DI3+Li5QbmNkubE4E8l0oMg1kEa4D55VGJbmhBP5b6xbsEMHnoPqRnn79yHrSm5SvJ0FRBOtB4jzfEcs6HPSQ3BG4WOebtS4pCTj8uYvjWNVMUW1wq/aVWYcWsU0s6ToDYUf7pAbNHXLH0CuMcrofxkQ07dVSKMEVrNbFqXL/McnFW7FvdeKHzmL6LLByJ/2BGYJwbEgEVrXaFI8m/llGS6PPQwUmx1wp45U/VDSM0y+9eaRCcZLqCKIK0sVfMqAU7TdoISA066gvEWEr/jZq+sxxMAxvNh+BF7gKYNZsKtJEwLWaD5/1fW1ojxBNyE+IlPp8YYJDRUajvlwERjA50VervKnKpezuVhOP3h5etQZJfN4574afhrZsMj/0LC3IIzBuhuy5d/u0vFJw6i5u6CtaLE31agSGQ8OoyFiZcxOdA0u/cee7C6DSWs58sSOWuiky7tlslgDXyMVFRTDmHX+aOE62Vx4lOPeNtIIygSf/t74bG0rPTWuMIu9ytSwPskiGzeXuMeOsNOZX+2knjcxqdDaJhZ8F242HIIMDXrOMHdGjkGqDAlc68j3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18092099006)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZXQmV1OHRkSGtoNVlYRk1SN2dGTmE0REpPUTUxQ3JQd2I5WTBBQzhaTmU5?=
 =?utf-8?B?TzFmTWRscjNjNysvNllEeGY1TFE4TXA1M0dHSytlam40Q09wTTZMZU1aQWJB?=
 =?utf-8?B?Q2NOMlpxRXFvbUZnaVg5UUI0UmRVTUowKzlkTmRub3FEbkdyQkN3YlhBcSsw?=
 =?utf-8?B?SkduWTVwcU9ickFrREhWTzZnSDE4RzFuVEh5RlU3TUZhdk1saGtPZXlBMy9i?=
 =?utf-8?B?eUtGeHpmNExLaVhOTGt3bndyemlFNm1adk9CT2FSaWpzWGtJdEpwdDRSOHRa?=
 =?utf-8?B?S2lQTndMRDkvK29oS2IzUytCVFpCZkhPWFAwa3dwWGg1Z1F2UW9nSHJUcnhi?=
 =?utf-8?B?SUxhMlJXWWowNFk2NEIrN0NpS3VEUVNNZjV0MUMxTERaT2RJY2FpZW9zREtP?=
 =?utf-8?B?TE5NbS9ZbldndjQ5UkNzbnpIV2M4MmFGTk9YNkUvQ0J0T3NuaFhsR09OWitM?=
 =?utf-8?B?SlR1MUMvbFVKQ3d6NUs2STYwWmJIbnRkZjlCdXZleUEzd1N0MGlJVXVCc09G?=
 =?utf-8?B?VisvMG1SMGwvWDdZZEJ3UUY4dXZlQVVEQzVwa3F5OE5FVXJ3UHhzR2RJeHA0?=
 =?utf-8?B?ZU9IMHNCTFNXQ2VidGRXVGUwbm9LVGZXejFZS0hvdE1ZeXY0YUF6U0RoL3Jl?=
 =?utf-8?B?akVvODVRdGw5TW5jWUZwSXlNYmJxU1dIbmpxTUVIZWQ4eS81cE5lcjlIRE5L?=
 =?utf-8?B?Q1BjUkVZbHJPREU3dG95YTA4R2lpdmc2YmxiRVN0TUZPT0ZRNXJOcUdwUXJj?=
 =?utf-8?B?WmVRRjdmSzFYaTE0UW5jRnR1TnZ6YlBOdHNya2FrNy92bTY3TG0yQnJac2pC?=
 =?utf-8?B?OUZ5eVRTajdiZkU3RHRHMVJhbENvMXNjUTFZbkp1L0xtYVVQZWtVdnBOMnEz?=
 =?utf-8?B?a0lqdlBrVmJJaC9mQmYvaEk0TytWWGVkdWxraHlkelhscG5JUUZEUVVReEo2?=
 =?utf-8?B?RjhnZm5RbE5XQ3NmSThRdzI2b0phcnkvVXFRaW9SVnhkT01SejNkb0g2QXVj?=
 =?utf-8?B?N2x5bWRxQlNTTEkzUHNCc0lsNlhnKy9NekFzcGk2b29UUmhQZEpuaEw1T0NX?=
 =?utf-8?B?aEYxb2VaUGRZRUNJYXVZUU1LWGFGMERKcHR2elBaWkw1MlpFOHBkcHB6RFpT?=
 =?utf-8?B?d0ZWalowODhGUk5vOGN1dU92RkU4azA4QXlyelN2Nm9XYnV4SkxaM05uL3RG?=
 =?utf-8?B?SDREbi81SE9UWmVGTHgzSXdqaGZ3N1BnQUhoeWczMlNxU1FmWk1nZGUzSG9V?=
 =?utf-8?B?b0F4RXYwZG0xZWNndHNtemUrZktDMDVoM0IxV0U4MGxaa0JISlB4SzRySzFK?=
 =?utf-8?B?d2xiZVNBd2VCa2Q5RWY1bG5Pam0xRnF5alRMU0hPTzBXZ25rQ21VQ0MvaEp3?=
 =?utf-8?B?a2NCSnUydm9seVpSSHhmZzhLMVhVUnRpMEJ4MlovdkpjMWxNZ0QyakVCMkJs?=
 =?utf-8?B?OUNtRW1vamtHR0oyY0w2YWRiaHRZMFJHK1YxcmQvOUVEU296ZVRLVXVvdURE?=
 =?utf-8?B?eVlhWWpiOEY3VkcwR3ZEbUNSODdwOG02RStRNHNnL09XTkxJKzR0V0JNUHZC?=
 =?utf-8?B?NFh3MDl1L0ZncDkzdjZoN2lIdzdNVks0RlJ3N09lTHlXMzd3c0pWZ2Y3Ujk0?=
 =?utf-8?B?azZKNjZ5cSs0V2tRM1BCbmZ1aWN6VWFxRW9sYnRQeXg2WUFScGNNSHRLdUJQ?=
 =?utf-8?B?T2NYVnZyYTh1S3FrNTFQbUVHakJ3SCt2VDhCYVEvTWxMWTN1RG0yZm1Mb0ZX?=
 =?utf-8?B?ZXhEWnhPSjJGNHBMVURBTExNcEFVQ0RaamdsVkkraEphUWNHdkdteFd3bmxm?=
 =?utf-8?B?bmtjdkZUVGZPK2ZZZUg0cU96TGpKUWZ3Wld2akFVVS94eE05R3dsYS9zU2RB?=
 =?utf-8?B?QWh6RFRBNnpPaEQzNlpRUjBjOE8zR3ArQlAwbk11SUZpbGxIcHRKRWZnRitH?=
 =?utf-8?B?ODhMc0tVVEZuY1FQcWFMTnFDR3VncG1JeG1Xb2NDODhCUTBDUHZmU1lVVEpu?=
 =?utf-8?B?bDhhWDJZTWhieWI5c3BkVVNVcklvMjhXTHp1QnJERkRRcXNVZVYxSlRZdEFK?=
 =?utf-8?B?TEF5M3RjcVJSNGpDcDNqeUoyejVJYnJIdXBCSEtKTTJLR2ZaaHJoSkNqQTZV?=
 =?utf-8?B?V05hVmJjREkvTUxuWW9oM1lhWkdWMkdPWnZ0RjNtRXB6eGhWU21GOXhIK0Ir?=
 =?utf-8?B?RVFTUXdCVktuYW5mb3NTTjUzdVczNTBNSlZ3Y3NFR1MyYlFTWmlIYnlHZ0tF?=
 =?utf-8?B?Y3Evbm5sb29MYjQzNXVHcHpqWmF0SW9EUEpabnVTbXFaMG1JQ3dxNEFOeElF?=
 =?utf-8?B?QXZDQ3NkandiL1Jwc2QwbEUwcXhiWGxRTjl6ZHdNY2N5UnRCOXdRbkpkYzE3?=
 =?utf-8?Q?om9xN0NqpCEKJ6cE=3D?=
X-Exchange-RoutingPolicyChecked: ICEGGTqMJnd6seVKKPoqyg3RwoIimln5NiThK+8wnLz2DhVIFLrWoQekNr09tKOZAaVubIPA6tXh0EE6/G0u8Cl8Ha2uoLjV7wgQmRwK77Mj94u8S4b5jiF5N1E5mZlqgpAUXdx4BYlUUXd6uWcTo+6bga9xRsAA7RYa9sGW0qBPl+ZY5VL+s2P5/cuBo9pYxCFxnU/vS9bfq5d09qWMypfLcPE7aX6ITaRqlwk6ksA9vUH0xSwB4xjVXP1STiIba4uek5+6+vu5R6afQczeIbqCOOAXII4xwqp9CIEMG5mTRY0Vpb5RLiYJ2SjL9gNPiqx2S2/R0eebh/ayDn2Lng==
X-MS-Exchange-CrossTenant-Network-Message-Id: d17bcd2b-76f3-42c5-376b-08df38aa4874
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 06:26:52.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01g87DonQK7spokg/PGr3mh4e6Uqb0vA2l0DuOt97WpTsjDaiUatf6PqYl4oNtX87Mo7fO6Uqkm5zvdnApuu/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Add xe_hwmon_fan_update_post_lb() to update fan info after late binding.
> Add param is_init into xe_hwmon_read_fan_control_info() to avoid
> resetting user pwm mode post-LB.
> Call init path with is_init=true from preregistration.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c        | 41 +++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
>   3 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index d9f6cc9c81f6..e91bcacdfe93 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -2068,7 +2068,7 @@ static const struct attribute_group hwmon_curve_attrgroup = {
>   	.is_visible = xe_hwmon_curve_attributes_visible,
>   };
>   
> -static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, bool is_init)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	int point;
> @@ -2129,8 +2129,13 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>   		}
>   
> -		/* Set PWM enable mode to automatic i.e stock table in use. */
> -		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
> +		/*
> +		 * Set PWM enable mode to automatic i.e stock table in use, only during init.
> +		 * For late binding, the mode is already set by the user and should not be
> +		 * overridden.
> +		 */
> +		if (is_init)
> +			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>   
>   		/* Read minimum fan PWM */
>   		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> @@ -3070,7 +3075,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   
>   		/* Fan control tables initialization */
> -		if (xe_hwmon_read_fan_control_info(hwmon))
> +		if (xe_hwmon_read_fan_control_info(hwmon, true))
>   			xe_warn(hwmon->xe, "Fan control tables are not available\n");
>   	}
>   	return xe_hwmon_init_temp_info(hwmon);
> @@ -3258,4 +3263,32 @@ void xe_hwmon_resume(struct xe_device *xe)
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> +/**
> + * xe_hwmon_fan_update_post_lb - Update fan info after late binding
> + * @xe: xe device instance
> + *
> + * This function reads the number of fans and their stock table after late binding.
> + */
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	if (xe_hwmon_get_fan_enable_mask(hwmon)) {
> +		xe_warn(hwmon->xe, "Failed to read fan enable mask after LB\n");
Could we use "late binding" instead of LB as kernel-doc spells the same ?
> +		goto unlock;
> +	}
> +
> +	/* Read stock tables. */
> +	if (xe_hwmon_read_fan_control_info(hwmon, false))
> +		xe_warn(hwmon->xe, "Failed to read stock fan tables after LB\n");
Ditto.
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index 6c6f30208508..7198d7a4a1be 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,10 +14,12 @@ struct xe_device;
>   int xe_hwmon_register(struct xe_device *xe);
>   void xe_hwmon_suspend(struct xe_device *xe);
>   void xe_hwmon_resume(struct xe_device *xe);
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe);
>   #else
>   static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
>   static inline void xe_hwmon_suspend(struct xe_device *xe) {}
>   static inline void xe_hwmon_resume(struct xe_device *xe) {}
> +static inline void xe_hwmon_fan_update_post_lb(struct xe_device *xe) {}
>   #endif
>   
>   #endif /* _XE_HWMON_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..34295418ef50 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -13,6 +13,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "xe_device.h"
> +#include "xe_hwmon.h"
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> @@ -252,6 +253,8 @@ static void xe_late_bind_work(struct work_struct *work)
>   	if (!ret) {
>   		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>   			fw_id_to_name[lbfw->id]);
> +		if (fw_id_to_name[lbfw->id] == XE_LB_FW_FAN_CONTROL)
comparison looks incorrect.
> +			xe_hwmon_fan_update_post_lb(late_bind_to_xe(late_bind));

xe is already in scope here.

Regards,
Soham
>   		goto out;
>   	}
>   
