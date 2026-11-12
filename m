Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C94606A88A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfGgL3qb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2162A10E56B;
	Thu, 12 Nov 2026 08:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842D10E56B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794470580; x=1826006580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L/J6WrA3Q4NmB7+ETal7h5QB+0S219r8ss16GpqLG/E=;
 b=MfGgL3qb+AaC9+LOVOW2dRFit8u62FcS36zSBsj8W7WkZEoPlhkt4MsG
 w5gEeMHtA6/2L/IFJruvi+v6xzB3tELadtTOHQZJg0a3YvAI89FXeGua9
 HWyRZj1OgdtQOpadrz7KMnJJbo1WwCmEsgfX0LIZwRSJFQxUiqkzIUtCu
 7sfGvkUc9QN74sQ78q5M4jwky0maTHrGDMS5V9Y6zkGDG8F06BPAYFCGa
 RYSfyLttEJ0L0AKDDDKPKBkgTNITtw17NXSw54BTJVOxV+/NCIqPSljWy
 IgUAClmr2LgSporrfXisBPDZrlZ4RvMYD/qDGraaPUj0x7bYsfaNKnB0+ A==;
X-CSE-ConnectionGUID: uisciFMGQlGkYMAdBXUDCA==
X-CSE-MsgGUID: GaEj9sq/S4yKs3Ckgtx/7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3143947"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3143947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:02:59 -0800
X-CSE-ConnectionGUID: kCChtuWJT7mI87Z/J8303A==
X-CSE-MsgGUID: ftUK58DsQ0qOZk4K/+d1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8483066"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:02:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:02:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 00:02:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xV3tCcJcRTim4uknqcfMeAqJxGjqz1okB13xt9R80TWTlIeOGObNqV4FhE+bbTrHwvtvcb9Dcfu3a4KVL2W5ZpsXNNqMLXcNmLAO2VNqCD0L6+dQ+Wr5ROkAf2jspjZU7riGKFp3g0janHlr2UIUuOKHpsW2f4eN1o4cmcsHIvci1eBga9xRwPqHpcIoSaHBvzVmMc6U4aqfuhXmm6niukiNd/nWB1Ls0MjxgcY1Ue/oMbZiJvYprIjlw0pp4Z/bm5wAR/0XdAUOBcGFjB82QrjUVjgt3OAkHqExEG/St+M4/Zo81yMsv0k7whGAuvMRfnacxvre8MOC1y2eDSG//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkDqigUiAOF5XjiAaYu6uY5AI5SnryUnpMGqzeiPKhQ=;
 b=Wsixb02WdjA2aQfg1dW+WloDoNcWG5CWpEDehEFP8X1O7ICe3Lfdo7eC7YNqADIFvAIvNhzYrXTPErTFaqaBGz/o8EycZAw1E0Jv5hAu687u1xjjcJkUr8yJHg3kqgsJrvcDTLXCQT3sJ752qx/F4A8rUtkEAMTy3utUPec+pFh2ThDpBxh0SIAw1mrn+z/+v7+P+1xWgl2nKj0EEIbixss6WZ7tPPDpZFcFzH2ob0Vjb+1eoZgD8UnQSi8hrRtkvWcuX4+nzH5Mc8YyQst6Nl5iDtklCP46M1/Wy+VBZgmWDeKKNtAcdTiZC0rCYJav6ff/zv7ubU/fZle0Bo/s3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS4PPF3D6E0544B.namprd11.prod.outlook.com (2603:10b6:f:fc02::1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:02:50 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 08:02:50 +0000
Message-ID: <65388db5-d08e-4abc-ae5d-3adf0e0413a7@intel.com>
Date: Thu, 12 Nov 2026 09:02:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: "Tauro, Riana" <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <aravind.iddamsetty@intel.com>,
 <tejas.upadhyay@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
 <20261106073921.1512530-10-raag.jadav@intel.com>
 <a4f08719-fe86-4805-ab89-aa372a76a9b8@intel.com>
 <034b563e-dbd6-4bcf-a8fd-696d58027d9e@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <034b563e-dbd6-4bcf-a8fd-696d58027d9e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::11) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS4PPF3D6E0544B:EE_
X-MS-Office365-Filtering-Correlation-Id: e91542cf-f687-4188-ef9d-08df409358a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003|3023799007|10067099003|261022075727099003|261022105027099003|261022113327099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261026140227099003|261009220027099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003;
X-Microsoft-Antispam-Message-Info: PatGDVVJce6LfByoQxtdDfJdk/rf1SX1zmow634w0iPIfPze199ZB2CZloGTziLX4r+fFAbAAiqckvmLN2y+PgS9tiI9L/Ze59ezFTqNX063tW0VlA9Q1G+moFMc/teaaFMEH+PQyX38iaMBR/kcRnBpW0sR6IXdt2URGkiDhehH+ueL6OJcEJW/CR7CBleoTrvKJW7QSmjpUySdjaxZN31PoHtUJHqlH/DKBHZLyZNex17vtvlpfcukYe+whYT+sEke2dGte9ez2+sXIrCrAw1oEqSYNvIC9eaSefeZxVlW3AVTZIh1g25nJRM3S0TiPZ8bYJCVXNfpfzt4tcm9iXA6XEjtBad/ZJOCKFeDtd1dkTB81seWP5lC/0/kzSsYDoYaBBtvxKJ75hFd6ZVUsssegnnnXwc6FnS0EfSxbFWvwPLGVEIgxC5a/5IF+Re9Mmb8X67OXbEUcRHnuvGOyJbPAOT5+slbhEGc0JJpl6TFUQby+rBoY75L3WPFCF9asQze/kWwl/15bucdCy8/TFRHRvKDNEDzL7OBHSDLahT8XHly34FoQMHEvCfInSG+/7cOsATdPrHhWt5IIbqs1gIsLBEdqoQUlE2TI/5ECh0OPwY8uFxNov4p6gRINRG0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007)(10067099003)(261022075727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkgzczBuUTdWNkhVWXlkS3Z3ajY3bmlCTXdrMVNHNUt2SFozOVVYNnlYWXJL?=
 =?utf-8?B?U3JSb0huNmlNYU5MNWNMT3FnZHlNZWp0WWNHZ2dKZXlVMk8wV09yRzRWNjdz?=
 =?utf-8?B?Q1pyblEzQXpUWFo2c3dHS0QzU09DUmt5U0x3cFNsQVV4eXk1Skw5TUduMzFQ?=
 =?utf-8?B?cThvZVkxK1ZXSnp0U3VNNktiUTF2SnMxeDJHeVNvUjdRL09WY2p0YXlpU1hs?=
 =?utf-8?B?TGtPeVpZWWpGZE9jUzlIeVhSSjBGRFVScmV0UUZybnFuZU5PcEhhNlp0VmdP?=
 =?utf-8?B?bDY3eWR2Z1lMNyt4cjRTM2JGQ0hQUVFaT2NBb1VESTkxREtORGdRd1gxclVp?=
 =?utf-8?B?TnJ5aTBFY1drQVpmaXlGb1MwalJXK20xcWtSUklkYkNIUEMrUmxKcXp1TWJ4?=
 =?utf-8?B?ajlzenhpR0RvOWV4QUFzaGZJVStGcmpJY3VTNWd1UWN4R21ndHZpbjNhZi9Y?=
 =?utf-8?B?VGNXUjFlOHl1QkNzYkJhMGxuYWVxRVVMbS91L3hBZE0ycWtiYlZDQ0hlMXNK?=
 =?utf-8?B?dGxmZjlVY21wZDNqbVA1OXJ0MGdMN05MNm5sRG5pZFBRV1lEOWZwT2ZubjFR?=
 =?utf-8?B?RlJSVEw4ZUhBb0RJRTdZNXdJZUhWZjF1MGNhVnZudG14RHU0VXIvaEd1a2R4?=
 =?utf-8?B?bnhPVHpKMWVDSFlpWGg4MU96Y283dmd3dHBiZmdqaGo5U1BDSmE0NCtSeUF0?=
 =?utf-8?B?L0lCZmJQNSs0dEgrUS92ZHF1SFlKSUliVFRNZjZjQkUyRFFGWU1IMGpTa1Iz?=
 =?utf-8?B?RzZEcloyUVhWZkRsbUxhRWtHSGtOYzlmU1N0UmpSeDNsa3hZZG8rdDNmSmpG?=
 =?utf-8?B?L0U5VTMveEsvWFRTWHRyTmY1NENKOWREMlhrQ0VGYlk2Y082Rmt2SWxRREQr?=
 =?utf-8?B?c0F2anRDRHduTHNCZ2lSdGRzaDJYZytPY05SL1pCa28weVhkaklYQjFLdCtH?=
 =?utf-8?B?V1dYNnFpN1prUXg5MG9SMi9rOHFNaVBRT0NnYjNGVWZHNTUxeThjU0lyL2Vq?=
 =?utf-8?B?Q04rUkw5UEg4QWJSd1ZPU0N5ZUlycDRLcnZrclZLTDBpR3M5b3RkRjUxQmhv?=
 =?utf-8?B?eHcyaG16U2NnT2NoSjVINmdwNStmemliNGs1VHhJUjIwcDErZ3FTaVRGWUNK?=
 =?utf-8?B?aXlRYXRzM2diWTAyd3R2Mm1tbWpuWWhrZDh0ODBkNWVJaTZXTWQ5Wk1ZZ1NV?=
 =?utf-8?B?STAzNWFwWk1kTGFpUFBYSEp2c3NUdFFjcGJ4TWl0RUpsV05UeHE2WDhjZXlC?=
 =?utf-8?B?b0UvS1lzYjhDeFdXcFlXcDBSVlRoWnpESkNXbFdYRG05R1JFNlBhTGdIY2Iw?=
 =?utf-8?B?R2dyN0xIZk5xTVVQNGZhZzVpcFNSazRxWUtBbUN3bXhkdmwydFE0OXljQUd5?=
 =?utf-8?B?QkU4Wjg2ay9LY2RaeDM3eDFzVnZzNWlFVENuNHFnM29GMEZUd2dya01wNVZ5?=
 =?utf-8?B?U2pHeWlGdy83UFRpMlEzNW5PaHNLS1dYSDlFU251QXVBMHp3QlA5a09nZG9h?=
 =?utf-8?B?bE5mTEJpM2Z6dWI5NkdZZDA1bnZ1RmRraHBTMGpTMHk1MDgrZVZhRDg2VzZa?=
 =?utf-8?B?bFdjNUduMUcvbmlkeSt0dS93RitLY1gxV1RFZis3RitxVW9aRmcwTk9lRTFm?=
 =?utf-8?B?RkJOS0dLU1ZwZGc5Z1R4cXgyc1EwNFc3RVJpYkJlMUs0Y0UxcGNZeUFXbGxK?=
 =?utf-8?B?aDM1S0E0NTVZcW5uNDBSMmMrRnpoaEpaaFVDc2pBOTZZbms3MEdXY1VoMTZV?=
 =?utf-8?B?RElWNFFVN2ZjNW9mUmxzS3pIWElPejV2MVo1dHlJanpQcFhCaXBtUHV3OVhT?=
 =?utf-8?B?ZmRKaVV3N21YaDA2WU1uand5cC9vNW0xY0NuU3lJVlQ5ckR0RElRYzBDZW9R?=
 =?utf-8?B?Ny9XdWxWeEowZWxYb1ZpVDdqQk50aXZKbnZjYnhhZ1lvcW1mbHNydXltY2p3?=
 =?utf-8?B?dTNEZlpuSjZxNmZrUzVNaFNIMHlvVmc0RDB2ZVl1SnJObUVTby9OZjVwNkl2?=
 =?utf-8?B?NUZaRWR5THI2MjB4bGRzcDF6Y1dDOWZSN1NiZWZWOHhEbnlRbjNMM1dSczZp?=
 =?utf-8?B?VkVjY1Y1Q1dqUHQrbndZY1pVc3ZUanFqbVpWWUpURE5wdFZHSnNtd2FPcFdM?=
 =?utf-8?B?ZzBmRG1UMHlEU3pySm4xY1ArMldtU2JZQlZuSlZYSDlWbzQxM1RNRFdvMFA5?=
 =?utf-8?B?TUp3Z2FNaHZYTnFtc1lxRERzUFN5L0tyYjBpUDdCSEp1L3VmcjUzMGhNelpw?=
 =?utf-8?B?RXRoQytoektjNXFSUVROdWgvWWRIQXA1UVVzaGFlSkl4MUV6bmRmVkttVDZw?=
 =?utf-8?B?Myt5OUxBamdDbnA0TFQwQVA5b3dxNjk0aDRHUW1LT3hJYWkxR1dlQT09?=
X-Exchange-RoutingPolicyChecked: rQH5x15dNgL5hBLVgKGRKsCW/5X2utZ8xBEQWUcNl2ifP3NzAhDuYu1Rn7nq4W6uHNP+rjaVQxyfS6PqjDYJBkXVZSjOnrhJExoU1NfMT9iXYsPN43oQABccM2bw9YUW4zhmwq8jrhX3yOCWtShkdBJd2FdV9SVpKHK/hD56qH5IrqbSAjnR554CBpIwwSiUZsy3LC+Md9JSCTr8E4HU79TYYptbbVcYScwNKa8JiukjcpVMM9+O10oGw1vRKea0RCgyKUjDpB6jnuoRtAYcJT39sj5LJrYTolJHtLaLfzslzU7WNSRiwSGSH4gaUkRZ5BobxQ/VlFKYxeABZ6OguA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e91542cf-f687-4188-ef9d-08df409358a6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:02:50.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21nHpOzJWXJFiDEmR6uvFAhQbWuGEdH0VaTB5qstarVQYJl14ObI5JW5SCudh0yUpnXE9DzhWwymqX/tNVjBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3D6E0544B
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


On 11/11/2026 06:03, Tauro, Riana wrote:
>
> On 06-11-2026 19:02, Laguna, Lukasz wrote:
>> On 11/6/2026 08:38, Raag Jadav wrote:
>>> With bare minimum pieces in place, we can finally introduce PCIe 
>>> Function
>>> Level Reset (FLR) support which re-initializes hardware state 
>>> without the
>>> need for reloading the driver from userspace. All VRAM contents are 
>>> lost
>>> along with hardware state and driver takes care of recreating the 
>>> required
>>> kernel bos as part of re-initialization, but user still needs to 
>>> recreate
>>> user bos and reload context after PCIe FLR.
>>>
>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>>> Tested-by: Lukasz Laguna<lukasz.laguna@intel.com>
>>> Acked-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>> Reviewed-by: Riana Tauro<riana.tauro@intel.com>
>>> ---
>>>   v2: Spell out Function Level Reset (Jani)
>>>   v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>>   v6: Add PCIe FLR documentation (Daniele)
>>>   v7: Refine PCIe FLR documentation (Daniele)
>>>       Introduce xe_pci_reset_skip() helper (Lukasz)
>>>   v9: Add 'Xe' prefix to document title (Rodrigo)
>>> v10: Update documentation to include PCI Error Handling (Lukasz)
>>>       Maintain wedge reference on FLR failure (Lukasz)
>>> v11: Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
>>>       Use 'PCI reset' in logs (Riana)
>>> v12: Refine error logging (Riana)
>>> v14: Early return on survivability mode (Riana)
>>> ---
>>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>   drivers/gpu/drm/xe/xe_pci_error.c    | 139 
>>> +++++++++++++++++++++++++++
>>>   2 files changed, 142 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index d99881c6e1d5..6dcaec224338 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -535,6 +535,9 @@ struct xe_device {
>>>       /** @pxp: Encapsulate Protected Xe Path support */
>>>       struct xe_pxp *pxp;
>>>   +    /** @flr_prepared: Prepared for function-reset */
>>> +    bool flr_prepared;
>>> +
>>>       /** @needs_flr_on_fini: requests function-reset on fini */
>>>       bool needs_flr_on_fini;
>>>   diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>>> b/drivers/gpu/drm/xe/xe_pci_error.c
>>> index be58fc9e22dc..129cf3395f16 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -13,9 +13,55 @@
>>>   #include "xe_pm.h"
>>>   #include "xe_printk.h"
>>>   #include "xe_ras.h"
>>> +#include "xe_sriov_pf_helpers.h"
>>>   #include "xe_survivability_mode.h"
>>>   #include "xe_wedge.h"
>>>   +/**
>>> + * DOC: Xe PCI Error Handling
>>> + *
>>> + * Xe driver registers PCI callbacks which are called by PCI core 
>>> in case of
>>> + * bus errors or resets.
>>> + *
>>> + * Currently both Function Level Reset (FLR) and bus error handling 
>>> callbacks are
>>> + * supported. Both wipe the VRAM and resets the state of all the 
>>> hardware units.
>>> + * Therefore, the contents of all exec queues and BOs in VRAM are 
>>> lost, and the
>>> + * hardware needs a full re-initialization. The way Xe driver 
>>> handles it, is
>>> + * pretty much similar to system suspend/resume flow with a few 
>>> notable exceptions.
>>> + *
>>> + * Prepare phase:
>>> + *
>>> + * - Temporarily wedge the device to prevent userspace access
>>> + * - Kill exec queues which signals all fences and frees in-flight 
>>> jobs
>>> + * - Stop the scheduler and all submissions to GuC
>>> + * - The fact that FLR is needed is because hardware could be in 
>>> corrupted state
>>> + *   and access unreliable, so skip memory eviction due to 
>>> untrustworthy VRAM
>>> + *   contents
>>> + * - Remove all memory mappings since VRAM contents will be lost
>>> + *
>>> + * Re-initialization phase:
>>> + *
>>> + * - Recreate kernel BOs due to skipped memory eviction in prepare 
>>> phase
>>> + * - Restore kernel queues which were killed in prepare phase
>>> + * - Reload all uC firmwares
>>> + * - Bring up all hardware units
>>> + * - Unwedge the device to allow userspace access
>>> + *
>>> + * Since VRAM contents are lost, the user is expected to recreate 
>>> user memory
>>> + * and reload context.
>>> + *
>>> + * TODO: Reuse FLR callbacks for bus error handling.
>>
>> I agree we should reuse the FLR callbacks for bus error handling. I 
>> think it's a natural next step.
>>
>> Aravind, Tejas, are you aware of this? Page offlining currently 
>> relies on the driver reload after SBR, so it will need to be adjusted 
>> for the in-place flow.
>
> yes we do need processing of the errors post sbr once these are reused 
> for pci error handling.
>
>>
>> Today, when we're informed about a bad page that belongs to a 
>> critical (pinned kernel) BO, we can't offline it right away and we 
>> request a reset. slot_reset() then re-probes, and xe_ras_init() -> 
>> get_offline_queue() reserves the page before any kernel VRAM 
>> allocation, so the BO lands elsewhere.
>>
>> With the in-place FLR flow:
>> - the offline queue isn't reprocessed (xe_ras_init() is probe-only), and
>> - even if it were, pinned BOs keep their placement across the reset, 
>> so the page still can't be reserved.
>>
>> *For VFs this is an immediate problem*: there's no SBR on a VF, so 
>> the recovery for a critical BO would be a VF FLR, which follows this 
>> in-place flow.
>
> For VFs do we need FLR for critical bo or is it wedging?

We'll need VF FLR.

> Either ways this needs to be handled even for 
> https://lore.kernel.org/intel-xe/20261106071944.2693854-17-riana.tauro@intel.com/.
> We can take this as a separate series as this is only GT.

Sure. I didn't mean that it should be handled in this series.

Thanks,
Lukasz

>
> Thanks,
> Riana
>
>>
>> It looks like we need to reprocess pending bad pages during re-init 
>> and relocate the pinned kernel BOs overlapping them.
>>
>> Thanks,
>> Lukasz
>>
>>> + *
>>> + * Current implementation is only limited to re-initializing GT. 
>>> This needs to
>>> + * be extended for a lot of components listed below.
>>> + *
>>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>>> + * - SR-IOV cases which need PF and VF synchronization
>>> + * - Re-initialization of all child devices registered by Xe
>>> + * - MM corner cases
>>> + * - Display
>>> + */
>>> +
>>>   static void prepare_device_for_reset(struct pci_dev *pdev)
>>>   {
>>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>> @@ -147,9 +193,102 @@ static void xe_pci_error_resume(struct pci_dev 
>>> *pdev)
>>>       xe_info(xe, "PCI error: resume\n");
>>>   }
>>>   +static inline bool xe_pci_reset_skip(struct xe_device *xe)
>>> +{
>>> +    return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || 
>>> xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>>> +}
>>> +
>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    int err;
>>> +
>>> +    err = xe_survivability_mode_is_boot_enabled(xe);
>>> +    if (err) {
>>> +        xe_err(xe, "PCI reset: device in survivability mode\n");
>>> +        return;
>>> +    }
>>> +
>>> +    /* No guarantees by PCI core */
>>> +    err = !pm_runtime_active(&pdev->dev);
>>> +    if (err) {
>>> +        xe_err(xe, "PCI reset: unexpected power state\n");
>>> +        return;
>>> +    }
>>> +
>>> +    err = xe_wedged(xe);
>>> +    if (err)
>>> +        xe_err(xe, "PCI reset: device in unexpected state\n");
>>> +
>>> +    /* Wedge the device to prevent userspace access but don't send 
>>> the event yet */
>>> +    xe_wedge_get(xe);
>>> +    if (err)
>>> +        return;
>>> +
>>> +    err = xe_pci_reset_skip(xe);
>>> +    if (err) {
>>> +        xe_err(xe, "PCI reset: not supported\n");
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * The hardware could be in corrupted state and access 
>>> unreliable, but we try to
>>> +     * update data structures and cleanup any pending work to avoid 
>>> side effects during
>>> +     * PCIe FLR. This will be similar to system suspend flow but 
>>> without eviction.
>>> +     */
>>> +    err = xe_device_suspend(xe, true);
>>> +    if (err) {
>>> +        xe_err(xe, "PCI reset: failed to prepare\n");
>>> +        return;
>>> +    }
>>> +
>>> +    xe->flr_prepared = true;
>>> +    xe_info(xe, "PCI reset: prepared\n");
>>> +}
>>> +
>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    int err;
>>> +
>>> +    err = xe_survivability_mode_is_boot_enabled(xe) || 
>>> !pm_runtime_active(&pdev->dev);
>>> +    if (err)
>>> +        return;
>>> +
>>> +    if (!xe->flr_prepared)
>>> +        goto out;
>>> +
>>> +    /* Unprepare early in case we fail */
>>> +    xe->flr_prepared = false;
>>> +
>>> +    /*
>>> +     * We already have the data structures intact, so try to 
>>> re-initialize the device.
>>> +     * This will be similar to system resume flow, except we'll 
>>> also need to recreate
>>> +     * kernel bos and restore kernel queues.
>>> +     */
>>> +    err = xe_device_resume(xe, true);
>>> +    if (err) {
>>> +        xe_err(xe, "PCI reset: re-initialization failed\n");
>>> +        goto out;
>>> +    }
>>> +
>>> +    /* Unwedge to allow userspace access */
>>> +    xe_wedge_put(xe);
>>> +    xe_info(xe, "PCI reset: done\n");
>>> +
>>> +    return;
>>> +out:
>>> +    /* Most likely the device is unusable and there's nothing we 
>>> can do about it */
>>> +    xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | 
>>> DRM_WEDGE_RECOVERY_BUS_RESET);
>>> +    /* Drop local reference */
>>> +    xe_wedge_put(xe);
>>> +}
>>> +
>>>   const struct pci_error_handlers xe_pci_error_handlers = {
>>>       .error_detected    = xe_pci_error_detected,
>>>       .mmio_enabled    = xe_pci_error_mmio_enabled,
>>>       .slot_reset    = xe_pci_error_slot_reset,
>>>       .resume        = xe_pci_error_resume,
>>> +    .reset_prepare    = xe_pci_reset_prepare,
>>> +    .reset_done    = xe_pci_reset_done,
>>>   };
