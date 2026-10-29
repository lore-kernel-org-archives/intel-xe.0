Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6B606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mVVdcwY5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175211224D;
	Thu, 29 Oct 2026 12:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F84711225A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793275489; x=1824811489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IK4OsWnzMW+bY0o3gwEnoFL1Dc9JWIss97sXEpYR39Y=;
 b=mVVdcwY5kMDfiXoYoEgPK8+otB1EuRK8vnXQVHvuPiSEHzvUG71Mpk9u
 Odms0I2gd1muwfyQlhSCdFpWKnxDXIwMDyVitE/MebA/ST1FW5DpG9942
 +/RBpzcr0NmjkkyuKgZGlrcf6pY6QCtd8qcGrF81QcnPUPQf4hsi5qBJ7
 hO6bdr4FKe8jnNKkB/gqieVLEPuztEn9YQzEhX0PgOHd5w0WVwrWzTljy
 2ZaRWShzH5FTmmfVB7BxuzipBHmcsEjnvZttr6R6j2k/DUW1ymKBRY5oZ
 tETWlFi0UkdxikniXeWZQ8O/GMRyUzTMYwFVsgbUYhuHi9BB/FsUBM4AE g==;
X-CSE-ConnectionGUID: 9RWRWB7LQ16OlgnaKC7caA==
X-CSE-MsgGUID: j4TjuMWhQuCrd5kw0Hovqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2049622"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2049622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:04:48 -0700
X-CSE-ConnectionGUID: k7AOeo8YQ8GXIHQtc6xyjg==
X-CSE-MsgGUID: bc+6jnsdRiy0kp5JWxRqXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5525404"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:04:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:04:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 05:04:47 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3/jQG8eGDS/dw1vIBFC+Wi8U2/vewE6wAVxyhP1hBmaCXntj1Aq2basCx4rdoME0R5Qni/myAlHU5xiI5OdbTCpR83Zkc8h32MvbhaWf5WMPnQR2F6woXq6goT6Rc8SYp6BXReEwgXD0eRq6u6Qjc0jaiK7o/sQWIcEmisPD1X84emWO30/ce0JAoGVUX/SqrbL8TP1zWnnxo5Ip27n7QNL9YBY7xTPhE66UzBRWEmEzJ+EcidSAAUjDFB2flt4Bwr8zBJ6PfwQY4YB5Nkpibx5PzGzB5TqDMAn7IbFeSwTvbMtmDzooT74d1FHgTq5fHdfKuK5Frup7UABWbHxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTvFQwN+WJA5NZJ48vKf78fATUiqVR3Vwlt9X4X3e4c=;
 b=bsEDmaGmDziQr8ich12+NhkjWAdFbX1fGgcCVu/DfO8nXg3XVRfZF6mySEYy4Lr4AUoG9bqJ5YSf8tRLMbGiRZYGjugBMfEZNH2hctnJK58us1JrHH3ZOnZOvXFvZM86ojKqw+epzdg2JypZg0ZbvIVloxKcOiyFbLcMe1AazdNGq3uuPB539/qRlun3D9++GwDuHbxf935jRKWbbqHfGbajyybVKgn+6lQHkMspgP6WpMNZqgq2FppAZ7+Y5YAQLzN261v5NSptaTJ1hIpAydF3NxiAJuNs/x9M7AjU+BImnpIz8tPXY/SKEKJ97bCs7wqlBrlQJxCS3JYBOdwfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 12:04:44 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 12:04:44 +0000
Message-ID: <f3c5e4f9-2dcd-4d03-b3a4-5b50e9961f40@intel.com>
Date: Thu, 29 Oct 2026 17:34:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
 <244e9d47-794d-4290-9bdf-d6c83a6f0fbe@intel.com>
 <c652ebce-4e73-483c-8b5d-82dcaf453d7a@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <c652ebce-4e73-483c-8b5d-82dcaf453d7a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0179.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 8679c04e-730f-4e6a-1082-08df35b4d213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|261021123027099003|261026140227099003|11063799006|261022075727099003|56012099006|261022105027099003|261022113327099003|261021121427099003|261009223027099003|261028144727099003|10067099003|261026121527099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: LkFB9sjI31nG89axZlO3372/zFDTDZEoK/1V3NvFk79D1XVIMOzr5S4EGhaBtTmZtm7boSteeVkTCCEbAZQra1DA0IXRHc1/qSr/73dQLjwWMztbwXmL1hwd8/cYNZgLA2z6UP9bYgldWiV4bPIHMy5Csx29SfWqYThshzrPH0u//vrI/eUgq+vDDq//J6xc46OlSXKZByR/v9KQtJZMY0dotsZfT1vRW+5jCLxOXVWqI6gMcd+FaSRVFVybSir3lNBFZ/tp2d7ZG8vxvCN+gA6OGoB8E+eIIzjwBZ1RItlpc0HRx+RtEDxUdYcsZwg7v+5GV9MPAyxN4poSO+45iSnQE/b6cp9x4qzlftZn5vL9RFTO9oakQDX8UnStmgEOpYlzj7Cxv+uOSEKfhubcF3D7wZK2A0SqJvRNpQNeCIgmPkeFcgk2cx4OswwK0hQyRWKhFJIvwvr6zhrVn4Um0joS4VxQc/Jqqo5UUnccb6EaNhluGV4Hh08qEss77SGcmTm+QjBlZhZoMYzpcVdT/omMQdxxBk++vTznOxNWaCGtYN6lnckLtgbkjUScWff7FTxcWd6xfhFwfwyvuBCIUf2hUoUiYaMQ0gv95w9sOAoVsaTwnXTCCprh5iW24IW/AP3/w6rSQUlOQAD4dcyOaWayUqOtG/WfJ7etUMSi/NA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(261021123027099003)(261026140227099003)(11063799006)(261022075727099003)(56012099006)(261022105027099003)(261022113327099003)(261021121427099003)(261009223027099003)(261028144727099003)(10067099003)(261026121527099003)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytoQm1pVFpEME1IbEw0aEJJL2c5cmhGVnhWUGE4ckpvV3NIa2duaXRRd0ZY?=
 =?utf-8?B?SHR5WWUvaXlrTWF2Vy90ZmdycS9ua1dLT3JxVlhLcGh4U2ZGMHg1bTFwYzR6?=
 =?utf-8?B?VWo3T1hKQVB2c3Y2eUlzb1BRdFIzRTMxWXJCa3FqYkk4dUQvZHlxTDQvYjA3?=
 =?utf-8?B?YmRBTmpCK0M3dHh4ZUpaeGcwbStwNnBtMHREcTRrVUkwUXQ1M09HZ2xoWTlk?=
 =?utf-8?B?UHVCY0tzVFZlMm5tZEUyWHh4Z3l3VzFVVVhjZnVwRElPZFpQa2MwNnFndW1J?=
 =?utf-8?B?RGIwYTRMVk93N1JGdWZzaXJ5NDJ2WnRycVFMNnNiZWhWcnRYRm9XWlBBN0hR?=
 =?utf-8?B?M29uaEJKM3djTHg3aUV3eHY0bUxpT3JGcUpiUGo4Wk9Zc0I2dXFIQno5ZUd3?=
 =?utf-8?B?MWRRNDdNN3JCQmNtWjV3ZUVZM3pJVGoyMmxjVTJpZUVqdnk2ZjBNZXF5M2Rn?=
 =?utf-8?B?T1ZTV3hjOU5HdHJtVmRLMFJKWDhQWU9pZWRTWEtoRHJlQzUwNEc5YXAySHpN?=
 =?utf-8?B?QUc0Uk1LeU1QeWJBcXpMTGp6SDBPa3hOUUtnUi9wQ1prUlRvMEhaTHVFZ3RT?=
 =?utf-8?B?dzhuVW55UjA2cUxsUkpkdTNtM1dZdXIwb2pyYzBneTlIbW9EeGFlVDVTVVJJ?=
 =?utf-8?B?a3hGaDQ5UFZ5cjl3OEhQVlRwU21ocUVtQjBZOU1Ha2hFQ040VSt0MTRFZ2Nw?=
 =?utf-8?B?M2dlbXAzd2lwMjhnQ3lPZXZ6WjF1MDIzUFB4blY5M2FoRGVTbnFMb1RNRUIz?=
 =?utf-8?B?a2w5U0QrYkNJYkZGT0ZZOUxmUkpIV1hpRmtKajBGRVFFUVYwcXY1Tm0reSsw?=
 =?utf-8?B?bHY3bTlwSGtGdnFzeW5LRHZtNjNHTDFzeUIwZGVHdm11K1Y4bTlNMnhVZnN1?=
 =?utf-8?B?TW1DdElNK3pRc1JvYTZBa3RsMDVxc04rbjYzR29ldWE1a0VQblRiOXMveG1N?=
 =?utf-8?B?Y1RVOThzbFo0VlVHT3Z2T1BzYVdvOXp4a05RcTNwZ3hIOTBwekhnb3lRSGlF?=
 =?utf-8?B?S2VyUFNVYjY3ODRFVzVYM1A2UHZaRnZYVVRtRGZkOFhPelpuV0JsUDBKUmcz?=
 =?utf-8?B?TnJ4Q1RCZzhOR1pRWFlMaWdUOWt2S3BIaUoyYzhGWEJzMUdSK05GbmNoZFVE?=
 =?utf-8?B?NUdRK2srSGdEeTVFbGNkZjRYUEJIbjB3VHUyZk82ODJYQ2N4cVRSUndTOUxr?=
 =?utf-8?B?eEtUWnVTU0JHeUs5ZlUvZ0F1eHVnVGt1Qk9xM29jbW9QUi9FQzNTcTdlbjBZ?=
 =?utf-8?B?K2FMUm5IOUcrWEdEYVRIdzhvNzBPM1E2YnVkY0hZYnkrbS9ubUVTcEdabHlC?=
 =?utf-8?B?L2hpLzlyTEF1Ky9xaXM3b1JPQlhkaExOMmdiMis1UGsrYmYwOGUvZTQxRlNB?=
 =?utf-8?B?MU1jd3FOTVdGN1dvNXRSMGhlaUJ2R3BjREpyaU9ndTdqNVFPVHBmcVdRdDM3?=
 =?utf-8?B?anhvdFoyM0dqQWtlUmZwM1Z5WUlzUnFlQmRGc2V3Rm1ybkN0TkVWdUt0WFBN?=
 =?utf-8?B?U2FwSkFnOTI2eUxwMGlsakhYdlo5cHBKUy9zVzdsdys4c2JoVC9OUDRkR1Jy?=
 =?utf-8?B?d21DRU4vczc0ODVuODduNFNhbUkzWHpsZVNMNEtDUlpCZEtKckVBaTNsa0lj?=
 =?utf-8?B?dVUvNUZtY3VEaXJScFdLOEFBQmppWXJueGlqV2RBMldHY0dBL2lhSnBCalhH?=
 =?utf-8?B?OGdaRytsSi9ReUxBNjZuM0w2encvK3JjWldmYWpmektGcG0zQmxVWnEzblFU?=
 =?utf-8?B?SVhxMUlucWx4SlM1WjV2L0JnaXA0NHNoR21tZERkUFcrTHpRajA2bVA4Rm1R?=
 =?utf-8?B?eHlsREM1NWpxVUZ2K1hUcUFvQXpJaVNHOEJWTVB1TEJVeDZVVHc0N2NnRVpW?=
 =?utf-8?B?SkZsTkNaSXd1dFBPZ2N4dllBdzkwSkFmNVRQYmtVZWk4ZFlWR3dPRmt0aUVY?=
 =?utf-8?B?Z0Q0WHF4OFJOWS9xTks2WnJlZXRMMGZ4ZUtjUHYzOXRTZGhCckN6WVJvQkhp?=
 =?utf-8?B?K3N3K1dPc2krSlFyelg1SVcxTVRyZFVvRkQzZWh2aCtLeWNrRHhEOEtRSHNU?=
 =?utf-8?B?a25WdDdvVDJpQlJoM0VvWDZENldObENHbHc1TkYrTWgrMXRrL2FLaU1kS1V0?=
 =?utf-8?B?eEUwbks2a0FOLzJhdHhTT0pZVTczN2R0S0VuSW1vMjdweXlaRWVJVVFLQ05Q?=
 =?utf-8?B?QlVpZWk2ekJ1Q3YyR0VMdWNVUXBDNm5YeHZHZEhoYWVMYndqbzdLMmJaZHBm?=
 =?utf-8?B?Q1RkTVBOTTc0cDI5UkZ2dUtaMEpGa3hsUGV5V0VMdlN3MWN3SlpCajlLL0hz?=
 =?utf-8?B?ZUQ0WHRjRzRJa2MvcE5yTGVFbk5ZbHBJdzRrSExqUEhMTW1wT1RGZz09?=
X-Exchange-RoutingPolicyChecked: PPL5eZEyuaj3xa33VZdsBCcaKwVq6pr3yeXQ6Do0uV57u6x9BnW8TnmxfxFruEjJL8grzcJapzdSPJ8X4Vh0cQ9B6daSpzuW9r+sC7WnzLY+LTLJQQ11A4Hqg28k3nfApHAJSDRYI7Iccwf7z4/CYboWz8GzyXJoInf8A/OYzk/jh85Y6PN/QhnKhfdK7HJkRO11Qe0XT8LzQ7M3kDwwMNm3ZRqQdSF35o0fwlf2HAviv2JygxGtAi+gAAcZaWzVHJQygd1uXV3chjzI2exFMr12aAz6bVSMShFvK9Y0m2jFvJ8I3Ke2m5RPnNI9mgOisXrYxfEj9wG1UOcXhND3eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8679c04e-730f-4e6a-1082-08df35b4d213
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 12:04:44.8006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 332fYd4K8rHoJ1ks5FJXOAEH+C4Ll+9NiNBP9dbWvfrmDGqjocZIJj3wguTgg3KGr1bXxz2Ur3CGzK6J9AAHOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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


On 29-10-2026 17:04, Poosa, Karthik wrote:
>
> On 29-10-2026 00:16, Purkait, Soham wrote:
>>
>> Hi Karthik,
>>
>> On 16-10-2026 00:37, Karthik Poosa wrote:
>>> Initialize Xe hwmon fan-control support by detecting fan count,
>>> reading stock fan control points and min PWM.
>>>
>>> v2:
>>>   - Avoid user table initialization during probe. (Badal)
>>>   - Move unused code to appropriate patches.
>>>   - Use xe helpers for dmesg logs.
>>>
>>> v3:
>>>   - Rebase.
>>>   - Refine a few debug log messages and comments.
>>>   - Update xe_hwmon_read_fan_control_info() to return on any stock 
>>> table
>>>     read failures.
>>>   - Avoid returning when num_fans is 0 in
>>>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>>>     initialization is not skipped.
>>>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as 
>>> default
>>>     timeout itself is now 10ms.
>>>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>>>   - Rename fan_control_point_count to point_count in struct fan_table.
>>>   - Resolve kgdoc warnings.
>>>   - Add valid check for stock table fan point count.
>>>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when 
>>> enumerating
>>>     fans. This avoids assuming contiguous fan indices and allows 
>>> masks with
>>>     gaps to be represented correctly in the hwmon interface.
>>>
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> Assisted-by: LLM
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 
>>> +++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>>   2 files changed, 157 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 42acfeb8818c..f2bd20f8b0a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -21,6 +21,7 @@
>>>   #include "xe_pcode_api.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_pm.h"
>>> +#include "xe_printk.h"
>>>   #include "xe_vsec.h"
>>>   #include "regs/xe_pmt.h"
>>>   @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>>>       long accum_energy;
>>>   };
>>>   +enum fan_table_type {
>>> +    /** @STOCK_FAN_TABLE: firmware-provided fan table */
>>> +    STOCK_FAN_TABLE,
>>> +    /** @USER_FAN_TABLE: user fan table written through sysfs */
>>> +    USER_FAN_TABLE,
>>> +    /** @FAN_TABLE_MAX: number of fan tables tracked per fan */
>>> +    FAN_TABLE_MAX,
>>> +};
>>> +
>>> +/* Check if a fan is enabled based on the fan_enable_mask got from 
>>> FSC_READ_NUM_FANS. */
>>> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
>> If this macro is called from any function having no local variable 
>> named hwmon it will break. Should it take hwmon as an argument ?
> yes will change this
>>> +
>>> +/* Maximum number of fan control points supported by each fan. */
>>> +#define MAX_FAN_CONTROL_POINTS    (10)
>>> +
>>> +/* Fan control point index: bit31 selects fan table type; bits30:0 
>>> control point index. */
>>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 
>>> 31) | \
>> Cast to u32 ? shifting the signed enum into bit 31 could lead to UB.
> okay
>>> +                        ((POINT_NUM) & REG_GENMASK(30, 0)))
>>> +
>>>   /**
>>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>>> + *
>>> + * Each fan keeps the latest tachometer sampling state along with 
>>> two fan
>>> + * tables: the stock table discovered from firmware and the user 
>>> table managed
>>> + * by hwmon sysfs writes.
>>>    */
>>>   struct xe_hwmon_fan_info {
>>>       /** @reg_val_prev: previous fan reg val */
>>>       u32 reg_val_prev;
>>>       /** @time_prev: previous timestamp */
>>>       u64 time_prev;
>>> +    /** @fan_table: fan control tables */
>>> +    struct fan_table {
>>> +        /** @point_count: number of fan control points */
>>> +        u8 point_count;
>>> +        /** @fcp: array of fan control points */
>>> +        struct fan_control_point {
>>> +            /** @temp: temperature in degree celsius */
>>> +            u8 temp;
>>> +            /** @speed: fan speed in percentage */
>>> +            u8 speed;
>>> +        } fcp[MAX_FAN_CONTROL_POINTS];
>>> +    } fan_table[FAN_TABLE_MAX];
>>> +    /** @min_pwm: minimum fan PWM */
>>> +    u32 min_pwm;
>>>   };
>>>     /**
>>> @@ -193,6 +231,8 @@ struct xe_hwmon {
>>>       int scl_shift_time;
>>>       /** @ei: Energy info for energyN_input */
>>>       struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>> +    /** @fan_enable_mask: bitmask of available fans */
>>> +    u32 fan_enable_mask;
>>>       /** @fi: Fan info for fanN_input */
>>>       struct xe_hwmon_fan_info fi[FAN_MAX];
>>>       /** @read_power_limit_from_pcode: pcode accepted power limits 
>>> write for the channel */
>>> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const 
>>> struct xe_hwmon *hwmon, u32 uval)
>>>                     (uval & POWER_SETUP_I1_DATA_MASK));
>>>   }
>>>   -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>>> *hwmon, u32 subcmd, u32 *uval)
>>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>>> *hwmon, u32 subcmd, u8 fan_num,
>>> +                       u32 *uval)
>>>   {
>>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> Nit: blank line after variable declaration
> ok
>>> +    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>>> subcmd, fan_num),
>>> +                     uval, NULL);
>>> +}
>>> +
>>> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>>> +{
>>> +    int ret;
>>>         /* Platforms that don't return correct value */
>>> -    if (hwmon->xe->info.platform == XE_DG2 && subcmd == 
>>> FSC_READ_NUM_FANS) {
>>> -        *uval = 2;
>>> +    if (hwmon->xe->info.platform == XE_DG2) {
>>> +        hwmon->fan_enable_mask = GENMASK(1, 0);
>>>           return 0;
>>>       }
>>>   -    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>>> subcmd, 0), uval, NULL);
>>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
>>> +                          &hwmon->fan_enable_mask);
>>> +    if (ret) {
>>> +        xe_warn(hwmon->xe, "failed to read number of fans, 
>>> ret=%d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* Check if fan mask exceeds FAN_MAX and log a warning if it 
>>> does */
>>> +    if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
>>> +        xe_warn(hwmon->xe, "fan enable mask exceeds maximum 
>>> supported fans\n");
>> Reset the mask to 0 so IS_FAN_ENABLED() stays false in case fan mask 
>> exceeds FAN_MAX.
> how about clamping to FAN_MAX ?
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    xe_info(hwmon->xe, "Number of fans detected: %u\n",
>>> +        hweight32(hwmon->fan_enable_mask));
>>> +    return 0;
>>> +}
>>> +
>>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>> +{
>>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>> +    int point;
>>> +    int fan;
>>> +    int ret;
>>> +
>>> +    for (fan = 0; fan < FAN_MAX; fan++) {
>>> +        u32 stock_fcp_count = 0;
>>> +
>>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>> +
>>> +        if (!IS_FAN_ENABLED(fan))
>>> +            continue;
>>> +
>>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon,
>>> + FSC_READ_STOCK_FAN_CONTROL_POINTS,
>>> +                              fan, &stock_fcp_count);
>>> +        if (ret) {
>>> +            xe_err(hwmon->xe,
>>> +                   "failed to read fan %d stock table point count, 
>>> ret=%d\n",
>>> +                   fan, ret);
>> Why not continue for the rest of the fans marking the current one ?
> yes we can continue, you want to mark current fan invalid ?
yes.
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (!stock_fcp_count || stock_fcp_count > 
>>> MAX_FAN_CONTROL_POINTS) {
>>> +            xe_warn(hwmon->xe,
>>> +                "fan %d stock table point count %u is invalid\n",
>>> +                fan, stock_fcp_count);
>> Ditto.
> okay
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
>>> +        xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", 
>>> fan,
>>> + fi->fan_table[STOCK_FAN_TABLE].point_count);
>>> +
>>> +        /* Cache the stock fan table for later use. */
>>> +        for (point = 0; point < 
>>> fi->fan_table[STOCK_FAN_TABLE].point_count;
>>> +             point++) {
>>> +            u32 fcp = 0;
>>> +
>>> +            fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>>
>> nit: u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>>
>> Regards,
>> Soham
> ok
>>> +            ret = xe_pcode_read(root_tile, 
>>> PCODE_MBOX(FAN_SPEED_CONTROL,
>>> +                                  FSC_READ_FAN_TABLE, fan),
>>> +                        &fcp, NULL);
>>> +            if (ret) {
>>> +                xe_err(hwmon->xe, "failed to read fan %d stock 
>>> point %d, ret=%d\n",
>>> +                       fan, point, ret);
>>> +                fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
>>> +                return ret;
>>> +            }
>>> +
>>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>>> + REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>>> + REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>>> +            xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, 
>>> speed %u\n",
>>> +                   fan, point, 
>>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>>> +        }
>>> +
>>> +        /* Read minimum fan PWM */
>>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>>> FSC_READ_FAN_MIN_PWM, fan,
>>> +                              &fi->min_pwm);
>>> +        if (ret)
>>> +            xe_warn(hwmon->xe, "fan %d min pwm unavailable, 
>>> ret=%d\n", fan, ret);
>>> +        else
>>> +            xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, 
>>> fi->min_pwm);
>>> +    }
>>> +    return 0;
>>>   }
>>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>>> int channel,
>>> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, 
>>> u32 attr, int channel, long *val)
>>>   static umode_t
>>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int 
>>> channel)
>>>   {
>>> -    u32 uval = 0;
>>> -
>>>       if (!hwmon->xe->info.has_fan_control)
>>>           return 0;
>>>         switch (attr) {
>>>       case hwmon_fan_input:
>>> -        if (xe_hwmon_pcode_read_fan_control(hwmon, 
>>> FSC_READ_NUM_FANS, &uval))
>>> -            return 0;
>>> -
>>> -        return channel < uval ? 0444 : 0;
>>> +        return IS_FAN_ENABLED(channel) ? 0444 : 0;
>>>       default:
>>>           return 0;
>>>       }
>>> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct 
>>> xe_hwmon *hwmon)
>>>           if (xe_hwmon_is_visible(hwmon, hwmon_energy, 
>>> hwmon_energy_input, channel))
>>>               xe_hwmon_energy_get(hwmon, channel, &energy);
>>>   -    /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>>> register reading. */
>>> -    for (channel = 0; channel < FAN_MAX; channel++)
>>> -        if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, 
>>> channel))
>>> -            xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>> +    if (hwmon->xe->info.has_fan_control) {
>>> +        xe_hwmon_get_fan_enable_mask(hwmon);
>>> +
>>> +        /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>>> register reading. */
>>> +        for (channel = 0; channel < FAN_MAX; channel++)
>>> +            if (IS_FAN_ENABLED(channel))
>>> +                xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>>   +        /* Fan control tables initialization */
>>> +        if (xe_hwmon_read_fan_control_info(hwmon))
>>> +            xe_warn(hwmon->xe, "Fan control tables are not 
>>> available\n");
>>> +    }
>>>       return xe_hwmon_init_temp_info(hwmon);
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 00c4fc7d0124..0349b24a8259 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -83,6 +83,11 @@
>>>     #define   FAN_SPEED_CONTROL            0x7D
>>>   #define     FSC_READ_NUM_FANS            0x4
>>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>>> +#define     FSC_READ_FAN_TABLE            0x7
>>> +#define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>>> +#define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
>>> +#define     FSC_READ_FAN_MIN_PWM        0x8
>>>     #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
>>>   /* PCODE_SCRATCH0 */
