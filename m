Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B98E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE4C10E2AE;
	Mon,  9 Dec 2024 19:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpO+PXLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978D10E2AE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733773182; x=1765309182;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cFDdayyZ5EDQBT+4Jll2QKYZnDrQ/EeJM/V/J+P42s=;
 b=QpO+PXLNOkl4IlmohEN9aDQ/nJD5YntzGzluDdRr0twmYqisucHfaDhB
 5J3ZIdNQOEnRLEcPRgsYrOkMUvKpjQYtisXfy/L6izU5JWhTc8yWjo5Wm
 SRJVbGlUVH/RuTBOII3/ac3ED532psCswGdgL3mNmVWTDxkHdG0HwYw4A
 PkBf5ENElZZYxJ5YuKQyKxea+jXCIeJKnY3GXwu7z6BixqtBjDneGpNTO
 53NXgcX2m91pzvlHpsb9H5MT/1OD+DsZgYOjAlfUZrB4H7V83yW+6QMbv
 0SEpdafZySZ5XllNsxgKtS1cb1EoJIQL/AOkj1IIyBoh+iAS+X9cVIdFw w==;
X-CSE-ConnectionGUID: nM5RHusVRoKVK5JLSrGElw==
X-CSE-MsgGUID: x6RvCDRsSnG33+P77xcknQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51504311"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="51504311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:39:42 -0800
X-CSE-ConnectionGUID: 6JNOdqr4TzGfFyOclKWn7A==
X-CSE-MsgGUID: ipxgbRp2Q5+HahioBWVJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="99989116"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:39:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:39:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:39:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:39:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2lKPRLu3oS2XNv03Q/BCwVgSjnRhKTjuhiMB0uEhFZqbZb1ZqdR77VmoEm6YK1HeVrC1jzTYQiS3sD5WPezgC3HYa84xzF9a4LzKdXt6oW53fjuj51G4ZfUvIXhAGRzFBDr5O2Xc9ynGI9wjnUSCLreK+/1xjT4TBZLc7VEn+xaQoSLIr3mkwTKErjCLSJeoix+xlz/EVH3S2Lo66WdEY29i+0Uy1amhdONFtAN7ODCEEJwdv/U25WSI+yluygv/ieINZd3ZXCIL3IxsZGU1IhvvC/zVLwhbxbFwkp4ZpiFx8eVHsVBemmr9f20Uz7ETT+Gsp88JM2qvAF0ULZSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXHZidq4Ya8nAvEinN5OMIltFGtYMP7YH+zdF8SoMiI=;
 b=AzDvvG6xJEJ5FUE7sdyH2oXkSfoEePCOhMRgTjOpJhDWZu3Tie1J2A7bzcUGBqey2UgdSGFzscRWXYloVQY/+ZOpSsMveU70WYLeb/gS9oXlIayXTpTISxro7d9JP3d9D1ifsdy8MzLJUrqTuDXLQEFgfwvGiQ3BaIfESrS3nuWCyIdQzWtBd0LXdXnUVhCv7CQCFCZ4IBjpu87ts2Yc1F7eHULLeQ/0QS5irFyi97ue/bcKYYOPgxnwCT+P6IT4bcnKMkBnZ9eyIHt+YoNHV0mrnWdqNY7PZKyg5d5W7hdE1nqI/1vLDw5qpqpGH0eF0DCBBj5s5Xp8Jq0a0Vin3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 19:39:36 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:39:36 +0000
Message-ID: <587f6772-4450-4357-b7f9-3c0e8defb511@intel.com>
Date: Mon, 9 Dec 2024 20:39:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: introduce xe_gt_reset_wait to wait for async
 gt reset
To: Lucas De Marchi <lucas.demarchi@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-2-maciej.patelczyk@intel.com>
 <Z1cB5Wx7AWUUD7L2@black.fi.intel.com> <Z1cEtYgIRzoaVRY4@black.fi.intel.com>
 <hb75rvvovu6r7owm7ly3yjwh7x6nqxb225ode7pe6qfu34pmgc@zxhtb5q3xbyj>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <hb75rvvovu6r7owm7ly3yjwh7x6nqxb225ode7pe6qfu34pmgc@zxhtb5q3xbyj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::20) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cee272-85d1-4b68-c95c-08dd188936c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHlGSVhBOUZ6Nk55YTRUMmVUcmtzbTRrc1U1Z2VITWYxck05MVI4WDJIWFh5?=
 =?utf-8?B?TXdUU21Xb3VnbXAyU3AxejNsQ2xwTnJuSDVYbkhIYm40d01vS3JUYnMxbVph?=
 =?utf-8?B?Y21lUG80Qyt1MTVxMGRTYklwVkF5b3JUMU03anNUa2R3d3hWbzZFUmI4NWFB?=
 =?utf-8?B?T0ZOaU10TVpJMXFTNjZhMGFJTzRSTE5rcFU1Z1VPNldyakNUeFNGbTNNOEg3?=
 =?utf-8?B?ditWbnVxMDJNOVJtUlp1KzlIeGhaUlI5STJLNlN6dlhHMWdURXVMbHY0N05K?=
 =?utf-8?B?dEF2MTJnbVNLV2VlRW9rbVRpMGJNM1A1UlZZOC93ak5QQVN6SGNBQWhwMnZo?=
 =?utf-8?B?Mm5OWkdxSVV4UGtibERQbnNXV1VvbnlhRVhkYVFwa3hVT2RWUHNrRnZGQUpI?=
 =?utf-8?B?Sjc3eGVzZnJudHBvdEl5VDdqcE16R1dERmtiRnduSk1aOEl6bzdtV2xRZ3Ft?=
 =?utf-8?B?UE5hSThmRmthb3dub28vamtnM0t6MVN4d2hYOXBpQU03WS9NV1h3aGFBeVU3?=
 =?utf-8?B?LzQvanVoV1pEL1hLVUh4czFuMHVxOTdabnBpQkd4cmJSYnRTNVBTM25ZSnVT?=
 =?utf-8?B?VlVzbDd4NlNueEVvSEt4aUpEVlJGN21DaU5WdHFJUG9pM2QrdkozZ0RXakFj?=
 =?utf-8?B?RSt2bVo4MG9wZ1dhWjYyMlF0eEpGNnZFS2hXdHpibEVrWi9QVCsxV0RPZjZp?=
 =?utf-8?B?ais5aGt3dCs2Z0l2ZDRqeXBsWGExUk9ZRGduQWJpdVY2SGQ2MDRZUEVTd2py?=
 =?utf-8?B?M3FRQ2cvdHNab2JTZVhPWXRTK2V4dm1XbEIvOTBkN2xhMTVOeFRzMEU2WFVF?=
 =?utf-8?B?ZnlBNXQxTml6WE90Wm5HOG9vTE43SFJ2SnNKV0FEQnRrQmpGVkVWc3RKaUtl?=
 =?utf-8?B?dXZpQkw4dWJNU1E1dmowY01Xd2dhSWdwL2pvZG1BWTlsbm5ONzJwcDgrRWZG?=
 =?utf-8?B?aVlRMGk2Z0hEVHhEVkNBOVZTRGdWTW0rVVRJdGpDeEU1elpiSk84UTdvcVk3?=
 =?utf-8?B?YVVSYzVGdmlMb3RTSEczby90K3ozWkl2cEh1TnBhTjQxRzhwc1I4RkF6RlV5?=
 =?utf-8?B?QTFqVnBWVURTU2ZydUQ0M0l6bkRwQnpFUDhYRDFLdHZRMTdwRzQxL2xVeS91?=
 =?utf-8?B?QVM0bjRTMVBOclFlb2pHbVlBVU8ybFhxNVNsSm4zUjNPUnFTT0liREpKVno4?=
 =?utf-8?B?ZDl0VzhLcVFIN0YwWGZyZ0JFSmRWNnp2cWh3NkpNQ2tESXI3OHhLZmsvVi9v?=
 =?utf-8?B?a2IrYW1KcjZUZTVnZG1XNE14b2NwRyt5d1k4dHplQmpIdkRhR0RLK1NQTXIx?=
 =?utf-8?B?MUFjY3hSZjdmZ2w0ZkpLSFlJVjFlY3RQeFEzTkNXaWtwNk0xRFB0ZUE0UFdS?=
 =?utf-8?B?MUEwSUIyZUxmNTMvV2txTG1ISWVzL29HdjZ0Z1UrL0lyUGxsVnJpQk1LYTE5?=
 =?utf-8?B?TDd3U09hT085a0xOMVE3cDBkNVhDRVByck02bGNpVzRyajFSekw0bXNTTnpy?=
 =?utf-8?B?Y3FMbjIwTlpTcVQyVUNvUHNPZ3QyVWZncEkrd1pDWXpSQUdRUGFFdURmNWlQ?=
 =?utf-8?B?TkNLZ0N3L29wOUYwOWoybi9TMDdrN1VldkpXYzkvS0pnNGR6aXBBUGpSK2po?=
 =?utf-8?B?d29pTjRhTitYRjhMcE90eUJsM0JJVlNrWkh0dDh5SHUvYU9pZlJUaldjVjJD?=
 =?utf-8?B?dXpOWEVTaEpDSTJ5MDJiRXpGNUNlUTJzKzFnUUkwcm5jaXFPVnFiNUVINFBY?=
 =?utf-8?B?V1ZmajJFanFncnI1Qm5BY3MwODJLcjFUdktYNjRPSExhVnJXek5MdFlBMEJn?=
 =?utf-8?B?REtCamVHbHcxM3R4NXduUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhpZEM4MlBxeXRRcmh1bkI3czVhek9ZNjlzU1ZINjRONmlCdStzSlZpOVRX?=
 =?utf-8?B?b0gyVGFhYkg0TFNBRGVTTXRBczhWazJodERMQ042VUtWMjVkQktWd0RFazBj?=
 =?utf-8?B?bjIwNWFmMVdkbXFveHBadTRjcDRidENXeXBSYjBDc3VGM1ZOK2RCZ2JFR1BL?=
 =?utf-8?B?dksxQ1hDZG03NTJGcVlzeWVRWEI0dFhaQzAzUmhaY0FhZVVyV3RRa3A1VzlX?=
 =?utf-8?B?OHJTWkxQU3E5TytFN3BVOVcvRkNqSVIrT2xwaVZiMjh5WXRQS0hJYzlqY2Vn?=
 =?utf-8?B?OU8wbERRQm5VSjJWMHNaOHA0RDIybXhzeE9CaWpHUFFTTVJZU2JMVS92VEtu?=
 =?utf-8?B?ajh2ZTJmaXZPZEtBYXBsWWQvbEhtVmNuZVBxcllVNHRMeDhDeGxMcFNIdFl2?=
 =?utf-8?B?NzMyenlYNGl5YU4yT005T0htazRWN2daQlRxa3hvc21ZSms2Q1BGYW1PdFpH?=
 =?utf-8?B?RzlhZHUwUlp5NFIzSDdQaWxrVCtXSUxnUkxoNDNvVnJ5LzJZVm5tbkcrKzFr?=
 =?utf-8?B?bnNucENDMjQxSnhBMmJUaUpCUG5qcGxWWEprcEZXaXJSMld4OENPSk0vUnF6?=
 =?utf-8?B?WVZPM1FnMkdXMTdXV1BkMmtKNVgrTU8zeDF1Skhxdm15K3JWNUxXeVZUb0Nh?=
 =?utf-8?B?Ui96bFcrcis4bllGU0dHUCtKRU92cFJ2c0E3UWRHZmxvOU1uZlEvVWNmK2hK?=
 =?utf-8?B?b29aOXFlVGpLS3NMb1ZvUFY2ZTRnV3FPUy82Q3hOb0JBb25CS3dIcVoyUlB3?=
 =?utf-8?B?eHE4bmc0Um9xSFd6US9FWmkrUGNUczZCd2VhZDFJYzdhS2tWKzJ1bjMrbUg0?=
 =?utf-8?B?RitsVktTaVVRR2h0N20xc1RJNEpVK3Yra0pmZzZYQmdFdUo2K2NkcHloNkFh?=
 =?utf-8?B?TW85VjBwaVptRW9ONVp3YU13MGtoT2ZWMXhIZGZMU2lEREVJem93VzNlYW16?=
 =?utf-8?B?MXdMdlZiQ2VIY05CSm5lRmhLN3RPR0JVLy9vdENEbXB5ZEJmNUhGd1VwSXlG?=
 =?utf-8?B?c0IrdDdOcmZNTlk3a0RtOXh5ckh1M25CL0NVczF1bFlCRkpxWmlaZjJRQmhE?=
 =?utf-8?B?R2ZiVXIvK1Q5Y2lzbzlWU0tMRkZYNm9RVVVRSytJdGx2eGtMc2k1bzI5S1ZD?=
 =?utf-8?B?T0RxMDF6ZHp2YUxZQ2czYm9STGZVZnRjNVFnRjRWanlPR2JTVGlGeVlMZDlM?=
 =?utf-8?B?UEhtdnpiWUVJRUdRTndOS3lMcFhUa3FSV2lRc0lSRFRFeHA0YkRwT2lFT1Ev?=
 =?utf-8?B?ZmhIMXN3Vk94eVovQzIrVmgremhHTUxLOEVLejMrS1F1N2FnYSswMnNuTjRw?=
 =?utf-8?B?ZURmU1p3aFFEOWFISHNzWlRGd2ErZVRaQ0I5aGhQNFgwdUxXUVZ2RERVeXdS?=
 =?utf-8?B?MmZKaUdSbnE0My9zbm5QRXVyRjJsRm8yZjRQSm5tSEYxbTBLOVFYZlpxdktC?=
 =?utf-8?B?dng0UmZ2YXhvVW1QZTQvT20vaWFpOUwwcnNsQmFDeWU3OTdyZERjYzYveXov?=
 =?utf-8?B?U2RibnJhOThJSEtmY2d0Y09FVGdoS1hhNGZBRWdpWTdvVCt0S2NJMUlLYnFK?=
 =?utf-8?B?RTBGRXVFSnVnNno1ZWZESTJxb2JYTWF4RVI4ZFJmd21WRzk2VVp2MEl2TDBj?=
 =?utf-8?B?eFVBMWRtclBnd3dHZ0d4QVRwaDNxSExmUXpwSDVZVHRVVFBoU1h5UEdXbXNh?=
 =?utf-8?B?WmFVaXBRY2JVVXd3TldkbmZUV1p2UEhYWFEyUjhPRlh6UGM4MWd4M2J3YnlM?=
 =?utf-8?B?R1BLaXVJQ2tud2pxSzkwbEpVemhCRjFzTXRwa054RE4yVDlMdWxPeEJHRlR2?=
 =?utf-8?B?cllJeFFaVzBlQ2NNbnZSRUVkNURzbGR6S3dxRG9hN29RSnZXUTAzMW5hamwx?=
 =?utf-8?B?NDZzT1dockM1OTJHUVNaeTgxMnRmYStvWmZJeDBzQ3c3OS9BaXhOVEdLclJU?=
 =?utf-8?B?WU9CNm1ZWnplKzNBVmRmQ2k1RTZ4cFRSOGNYWWpnejNLL0pnRnhhTm9CNUln?=
 =?utf-8?B?VXhQcVJjNmJPcEdSTDcvbVA0RWl6ZVUxaHhxWkMybGVEMEhCUlZCQmRuWFNK?=
 =?utf-8?B?OTJhT2JHUGFXbVJkUTBORElKNU9XU0NMejNNUnRjQ2xRTmlpY0FyQWJTcG5h?=
 =?utf-8?B?L2twcnFvUE04WG01eFVuUHE0TnZJY2d0bTNGcUptckc5MnNjSlJGRHluWFdO?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cee272-85d1-4b68-c95c-08dd188936c5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:39:36.6258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhqHGqtpt2xMqRA3pAoZA0c2DC6L/JiEOEePkTXuVsXXstnTBbFksOFWBuhceE8q4PmblQBQUCCSM0VMKYFNlAmUoGODWVTtbhi+L7Q7vSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

On 9.12.2024 17:22, Lucas De Marchi wrote:

> On Mon, Dec 09, 2024 at 04:54:45PM +0200, Raag Jadav wrote:
>> On Mon, Dec 09, 2024 at 04:42:49PM +0200, Raag Jadav wrote:
>>> On Mon, Dec 09, 2024 at 03:12:09PM +0100, Maciej Patelczyk wrote:
>>> > The reset of the GT is asynchronous.
>>> > Adding a wait helper to wait until gt reset is done.
>>> >
>>> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>> > ---
>>> >  drivers/gpu/drm/xe/tests/xe_bo.c   |  2 +-
>>> >  drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
>>> >  drivers/gpu/drm/xe/xe_gt.h         | 12 ++++++++++++
>>> >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
>>> >  4 files changed, 15 insertions(+), 3 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c 
>>> b/drivers/gpu/drm/xe/tests/xe_bo.c
>>> > index c9ec7a313c6b..b51434fc5bd1 100644
>>> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>>> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>>> > @@ -266,7 +266,7 @@ static int evict_test_run_tile(struct 
>>> xe_device *xe, struct xe_tile *tile, struc
>>> >           */
>>> >          for_each_gt(__gt, xe, id) {
>>> >              xe_gt_reset_async(__gt);
>>> > -            flush_work(&__gt->reset.worker);
>>> > +            xe_gt_reset_wait(__gt);
>>>
>>> Why not just create a
>>>
>>> void xe_gt_reset_sync(gt)
>>> {
>>>     xe_gt_reset_async()
>>>     flush_work()
>>> }
>
>
> maybe, the problem I think is the 1 letter difference between
>
> xe_gt_reset_async
> xe_gt_reset_sync
>
> that may be confusing/error-prone.
>
> I like the helper, just think we need the naming to be polished.
>
> +Thomas
>
> maybe having this as xe_gt_reset() / xe_gt_reset_async()?
>
>
> Lucas De Marchi
>
xe_gt_reset(), xe_gt_reset_async() would be my vote.


I proposed only the wait helper as I did not want to block under mutex 
for the whole period of time when the reset worker will be scheduler and 
executed.

That could be seconds.

Maciej


>
>>>
>>> and use it instead?
>>
>> Or perhaps reuse force_reset_sync()?
>>
>> Raag
