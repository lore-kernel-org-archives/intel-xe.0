Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1E606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYjwnLSL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kYAoyZAI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11810E200;
	Fri, 20 Nov 2026 07:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313410E200
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159879; x=1826695879;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FHlwwIgz4Xnw38inAGGwMaMzyxshMeYSceskqD/WmPs=;
 b=KYjwnLSLW4bg+9JcMeJ3BUostCD10YxKBEyZSgp4Z9rTNuU49AolwZV/
 rF8fU2gdJzd1KUXZAC9c3J9rO0THyMwPEecHf9CkPOV8RZ9FX2ty8wmE/
 dPXqg/YpzsVIrLBnxM4Er2Bz5uFhQIvt0c2vPXUFs4ANZ2JomYkEqZ79v
 87LhCmPKFsg9V1GibqHf7biP1awWzuOZMleJpxHugD1KuygC2yvVYRNDs
 aNdZOUSq2HBkJFfLcaWVOGL/+0ezZROBakNnV0ZFrPV2NIgdY9vc1JutE
 uZ1rSW/fhwf03Ju26dAdnX0nLdU5Z3zrH7Qz7rOwAu/6dsQOIuzRp3lLB A==;
X-CSE-ConnectionGUID: tNadltJ6TRi0FN9ddpEQSQ==
X-CSE-MsgGUID: zmMTTUzDQ7a7io38Tq78ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3934736"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3934736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:31:18 -0800
X-CSE-ConnectionGUID: jQGG4G7WQ3C9MBJsiek4pg==
X-CSE-MsgGUID: 2rCq/hS2T1KpJZ3/0m+G5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10868120"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:31:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:31:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:31:15 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZhGorpLgrEWZUrB2zAcwywy431tDyz+IY0I9mJ+KjlWhfLv3K/JcsHshL3/L+CN05bbgKxsPQTNyQ2ZWsNUQx3d4UMQx5SLFCg3rNUWqrI8LxTxAGGRnguSUMN6Ntfb9nsbIo+Fe0OMzWQ2LlQFDIdzM9mA3k2w9IUx6cDn1nsTqdjIALw/e0PIGYUTAEW+BsqqFXG9EID1jtlgNaFcBJ7NifRCMeQNcmQV6+SmKe72TuYGSzJOsorXrfKQKE1SA+ulxLGosR3Lx1XDnR1AggpzpT5ATzjBbpkQj8g/IIWcqpteyzc5VrqQhHfgyO7iLnam9d0z0dR1Ydnx+kVz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1sPpMNpPT2aHsUipWto+IOkYzzoRYh0EVPE73PY1Bg=;
 b=IY+3u59ukoz7UgCw81Mb22YiRPQ6EPsBytinygxbK5mea1e7hcShgHSlb1fDJveIgSPJQNAKh7P+shmpoJl5swI62rxIvTGR6JLLBfJAKbtKAtnO2hg7Xn87ez+5vKeihFm1M3GgstkfDrGpVwrvqDnsyq2gDaCBBtrOdDY+ufpZjcfJUc5TA9KhmxH/Esp7bjMFW3QG6+LV/TjZhpw4zjJCyciPKBbg+P6QPdhZZblBV7npblcI66TKRGgdxO2HRRqeaJtRFvqeb3pCohG5YVROYMjCK7XL4/uLeB3ojrl/2ieCK8ivLWemp+q2EZdxyqs4xgvxFMoUvFdR0Yzl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1sPpMNpPT2aHsUipWto+IOkYzzoRYh0EVPE73PY1Bg=;
 b=kYAoyZAIpZdllp4TuhQJ4/7yvXvYP3T2hoFH8FO/Wai7xiIaPVgyiG5empw1tHL+ZJPeQqSQcrF+ZvSdEob6ziX+yx8nPm9HAL8eVdcjaUnXwdH0SpVMXKcSMfR3PF/0gtDpHql7q92laGUMRY5ZLf0Lp/w5IUJ0gfvkX3U48Yo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by DM3PPFB0F355549.namprd11.prod.outlook.com (2603:10b6:f:fc00::f45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:31:13 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:31:13 +0000
Message-ID: <93e5b6be-6087-43a2-b8c8-8607cbcc7d71@intel.com>
Date: Fri, 20 Nov 2026 13:01:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] drm/xe/oa: Quiesce OA streams on driver unbind and
 PCI reset
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-18-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222279@kernel.org>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <sashiko-outbox-222279@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|DM3PPFB0F355549:EE_
X-MS-Office365-Filtering-Correlation-Id: 523984d0-c65a-4ec4-9a57-08df46d84127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261022113327099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: GiexR/DvN+XtvWWtl/62x3MmDXDOs+3LCOXLHatRcFBdReZDT/SZM8b1x48DDckVk9V/U2G+9CS1F9Q3Or7N2IOIP2GmhUWtvzJri7luxPlNSaKkgRnyp7xlweKPf/NQ8M3gOiUcPCJN0okFlxec1IK5HILenrcyGGb2ygMvoaxw2es+2K7dRoBq/XJh7R16QRE4mjmPi9M6eYFwVjDLRqVLG4CP2Dut04knrq/B+hUI+qVQc27pDQW0gY1H6dJUqGMvRQqIR39+KXScotC9NaT34kPMBuBsFtOGK1vFFkLKYKEZKASkQ28JBpDw7T5Oub1d+HOcKbIIK1dqfRbV75NkDtEnR0BrBzmrQIy/FWqKnmKQsDuCA6fo9kzaWKWsHHm3TXjX5q7rC9FX5Ijf1RwEdKGXoxkT9AWLm5/00HvEJ0Xbj8NzHA8tZsXsNagLcRDYCZ6ywpYiMPjpWCdh4ARbF1MymUF+tZhQ/ADMnVw5bpTOJSOAuJcYF8zl/udYk0UXaFqdFkgMjvqawJ/tL3BU6Du6ln0Wz/fqpbk0u4AmvWcf5cDCWS1SGGzAzluoaWPmU0UihQExr1YFuwRRU6kKkUg3IsOWLpIM5ahJWvkaipj9yOAQxT4wCMAlRki/EnAca7QX32kSiS4MWn6WbTL6fnee1oHUBfcFrATDqdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261022113327099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmdCODNtaWlhYlBxSlg3a1gxS1IyaTV1d1ZoaktFWnIraFVsdHJ1ZlRXbGh1?=
 =?utf-8?B?WVY2Mjc2OTJKMU9CNkRieDNtNHNVTnI3V0FpVnc5Y2V2NEhXVHAzUUVwZHNG?=
 =?utf-8?B?d3JnR05aSVUrN2pFSzFLNGY3OFBEeWxVT0Z4ZUc1cE1PMUptY3d4R013cTFD?=
 =?utf-8?B?UW1WcHZDTWxkeXpJcU5zUXo2UUVLMGJ0TmZ1MS9tZHhzWUQ1RTlhMkVvdjRK?=
 =?utf-8?B?MDJ5cFJxRityWmJWQlFQa0xhbXhQRmhnTW9YVU04UXBEOW5rN3B0cE5PR2pl?=
 =?utf-8?B?N3dsa2FWVGJ6V0tONGxaK0FzQmluNCtmb0xLaE1IQ21PSHNwZHVjSVA1TEZ6?=
 =?utf-8?B?ZUVsbzdQYWQ1WlZ0SWpNR1BKb3RyUEhVWXFUY3paUmhLSEs3RU01c2cyRm9m?=
 =?utf-8?B?MHl0UkludlpRTnE1Wk9qbmhDZzJYT0RObVpMVTNyZ3NEU1RaZFl6NDhrUTll?=
 =?utf-8?B?OUIyYUFuSlVNU0NNcTcrL3NEbzdycTZhK3ZHeG5rVWhXV011bGRoUUxFVlp4?=
 =?utf-8?B?NmZEd2Nqd2tlVWdjRTVPbFZOTUliamhRalJVcXVzRHh0RDlFZXpMeWZIaThx?=
 =?utf-8?B?NWJMQ1FkbkdDMlVpRGV1dVFCN21GZlRONXRBa3hGNnRTY2ZhU0FWTTFwakVN?=
 =?utf-8?B?NjNTdVhuMEtxT2NNN3ZJeXRGVGt2eFA0Ulc5VkVKaHJQVTBrcHNuc2N3L0Rv?=
 =?utf-8?B?KzFhSUNmYWI1eHBkUDY0d2k3bWFoU2VzcFp5Q01DcWRKSllhVkdmR21Kd1pV?=
 =?utf-8?B?NnV1SzNldXV0alBnWnp0NVo4MzU3b21MSDMvL1JTT0UvNGNPNjcwL2RjWkVV?=
 =?utf-8?B?SGhINmtLT1ZqTkFjYnRVYTg5UlBJci82bDJNRTJRdEw5Vk1Fb0VqSitwQXpK?=
 =?utf-8?B?Q1doQ3prcXlUWU1oaEJrOGlqSVhvbUVaRVREaWR3NDJyRnd6OG44RW9pSXhs?=
 =?utf-8?B?UUE2dFEwbzVXa1RmQTNESkF1Q29ORmZ5TS9lVWszYWJ1dWtRb2drMlV6aXF4?=
 =?utf-8?B?OFV3UjN3ZHg5TnNHOWxleFNuWTd0a01XQmRnRVV3UFg0NkVtRnU4VjlRNlZT?=
 =?utf-8?B?MkJGZ0pSVnpBT3VkMGJ4WEZ0STI5aTVOS2s2RC9McmhHRHFXNG1iQ0ErY2Qv?=
 =?utf-8?B?emdLMWdoQUszNk15NldWUER2aXVud3V4THpTVlB6U3RKTFhoOUliUVdzMkJv?=
 =?utf-8?B?eFNsT05aQ1k3d1hvenJtaTI3VFJxb1NUM2k5VVQwMzJ2cHZiOVhrMnJkSXZ2?=
 =?utf-8?B?V1JPRGlFdnMreFI4Tlg3M3h6NnQzaW1GVVVVUDgyL0tBVFhDVUNtSS9PUlR4?=
 =?utf-8?B?STFMSkcrQTh1WGZvcFdaSlRGajErVUhhT1RTZ2hmRzFkTlVpczZUVk5tSDA1?=
 =?utf-8?B?ek02TVZYS3o5VzZjSVVjMEVGUUpQOVdaVmhITTJTL1U1Q2hBSzJ3QWNmS1lh?=
 =?utf-8?B?UHBNRUw4L1l5UHhybXlQcXFvanR1TUkvdE1lSk1HeFJ3RUtTcnFwYUtoK2FR?=
 =?utf-8?B?SXlZMFNpeDlUUlNOaUVaNXFlblN3eWlSeWhSNWlIU0I1bldBcXVteTEvRE1Q?=
 =?utf-8?B?OTM3UnJSc3pOcjl3OEJLYzRHVi9IVVg5bEErM0JiOUtYRmxIcklDcU5KaHk0?=
 =?utf-8?B?UGF3QTdsMUtTQjZBM09DOHoyazJwU2Q0MG1IQlFoblI3Ujkwamgyc2tTcm01?=
 =?utf-8?B?eXhkWUZ2K0pPa2xkemc4dktxM0E3UER4ZEdCeGZhWUFxbC9jNnZoK1BSSjRC?=
 =?utf-8?B?ZThKS2FqUlFHeXVCNkdrZHFzZkJ3YTFQa2MxQzNCb3ZDNU54V05nZ2xQeHI5?=
 =?utf-8?B?MFViSldWK0tybnFnVmNzV3hTcFVHd2VuMkU5UTJVdGwwWE15SE1KUVlxWmVp?=
 =?utf-8?B?RUpBbktwQ0hGNExtcVZ5MWZReThUTjl3RXJvRG4vcm1QM3FaN0RBbk84REw5?=
 =?utf-8?B?VlhiUWlLZ2kwU3Y1K1VUTG5QVHdxTStmMHVKUmRidjg2WG9yL01pUUFqZE9J?=
 =?utf-8?B?VnJpdHVVN25JSU1Mc0dNNkw4czVpWWRhWHVFcDlQM1NDUDliZjMrelE5Zy9a?=
 =?utf-8?B?Z3NZWlhCSzBERjhreWFhNjJ5ck15dHlOQStzYlhaNXVVZWREVU01Tnpra09u?=
 =?utf-8?B?RWhJWVozNnRoUmFGelRSanBmY05ER3JDWHZ4QlZGSDJOM3drU1B4OWpvSS8z?=
 =?utf-8?B?Skx5YTVHWGoyNFVJbTRXNjcyaDVGazlLU1BpQUtzRlJTTEt0Y3A0UXNDUW1E?=
 =?utf-8?B?RnJDKy92cTNFSkdsaFVQZkNuUXN5dFFJYW1lMWwxWWs3K1gyU2NFdTVMelp2?=
 =?utf-8?B?ajEwNHRMSUpLbnlLR3JlSHE4NklLdFU1TVBHRUVlR29Uai9mSjFvUT09?=
X-Exchange-RoutingPolicyChecked: nXuvtHi6lth5jc4hpLnZrTU/cD42fhu6Jdsb3JcVtZW7QUfh4DwWyu5QPd8e2Yo7PtcwNyfZ+9O2sULU8yPn3Hq9O6nvp97G4i6+8woSLr8JmReH313yfCFfrOPOV2pJH0ywuMEsi1oqjKnXQtdcaogbICfgh/axT1GR0ijWVbFkd8bOLNiiEHLSC4hDsyyRXR6lgbCsxx9Ny1u2aulbdkFXdgrj0B5j0o8CiKHp1+gFdtqkjYUSN1h7eyB63vidtV3ix4xYkyjI2yNiN0IgwccsYmHopS+UyZYbqxVVIvFh9KjCOCsYhnwwUZN2k8nt4QEE+mtmfyvOsQnYSkOW0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 523984d0-c65a-4ec4-9a57-08df46d84127
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:31:13.3594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPrYd5jMGxCUOWTvH0YbMQBnPkrpmWDDEDLzJ3a6FLIQMmMq8spAqHD4ZlWTIMhaEO4GWp3v8zRaKwkJn8O8LOGo482Z+P2JvHvHFPV/TtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0F355549
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/19/2026 6:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
>    skips ttm.wq flush
> - [Medium] drm/xe/oa: OA buffer BO references can outlive
>    flush_workqueue() on unplug
> - [Medium] drm/xe/oa: missing or blocking drain in xe_oa_stream_init()
>    error path
> - [Medium] drm/xe/oa: NULL sg_table deref on resume after
>    xe_bo_dma_unmap_pinned()
> - [Medium] drm/xe/oa: unconditional drain and batch submit on wedged
>    device in destroy
> --
>
> commit 2b379416db1422398b8cce664304d4acea228c64
> Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
> drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
>
> This commit quiesces active OA streams on driver unbind or PCI reset by
> marking them dead and tearing down their hardware and device resources
> while keeping the stream structure and pinned OA buffer allocated until
> the stream file descriptor is closed.

I'm unsure on the case reported by Sashiko.  Please have a look.

-shekhar

>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 223419347eb7b..0b51bc818ef47 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
> [ ... ]
>
>> @@ -937,6 +959,13 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   	xe_oa_disable_metric_set(stream);
>>   	xe_exec_queue_put(stream->k_exec_q);
>>   
>> +	/*
>> +	 * The OA buffer is freed on release of the stream fd, an mmap may still hold a
>> +	 * reference on it. Drop its DMA mapping now, while pinned: the fd may be released, and
>> +	 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
>> +	 */
>> +	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
>> +
>>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
> [Severity: Medium]
> Can calling xe_bo_dma_unmap_pinned() here while stream->oa_buffer.bo stays
> pinned on xe->pinned.early.kernel_bo_present cause a NULL pointer
> dereference if the device suspends and resumes before
> xe_oa_free_oa_buffer() unpins the BO?
>
> CPU0                                  CPU1
> xe_oa_release()
>    xe_oa_destroy_locked()
>      xe_oa_stream_destroy()
>        xe_bo_dma_unmap_pinned(bo)
>          xe_tt->sg = NULL
>        xe_pm_runtime_put()
>      xe_pm_runtime_put()
>                                        xe_pm_suspend()
>                                          xe_bo_evict_all()
>                                        xe_pm_resume()
>                                          xe_bo_restore_early()
>                                            xe_bo_restore_and_map_ggtt()
>                                              xe_ggtt_map_bo()
>                                                xe_res_first_sg(NULL, ...)
>                                                  <-- NULL pointer dereference
>    xe_oa_free_oa_buffer()
>      xe_bo_unpin_map_no_vm(bo)
>
> Non-MERT OA buffers are created with XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT
> and remain linked on xe->pinned.early.kernel_bo_present until
> xe_bo_unpin() removes bo->pinned_link.  Once xe_oa_destroy_locked() drops
> the last runtime PM reference, a system or D3cold runtime suspend/resume
> cycle will evict and restore the pinned BO via xe_ggtt_map_bo(), passing
> xe_bo_sg(bo) == NULL to xe_res_first_sg().
>
> [ ... ]
>
>> @@ -1754,19 +1786,35 @@ static long xe_oa_ioctl(struct file *file,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Disable the stream, restore the HW state and release everything but the OA buffer and the
>> + * stream struct, the same whether the stream fd is closed or the device goes away, and
>> + * whether or not the HW still responds: all HW waits are bounded. Afterwards the stream is
>> + * dead and any further read, poll, mmap or ioctl on the stream fd fails with -ENODEV.
>> + */
>>   static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>>   {
>> +	unsigned long flags;
>> +
>>   	xe_pm_runtime_get(gt_to_xe(stream->gt));
>> +	mutex_lock(&stream->stream_lock);
>> +
>> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>> +	WRITE_ONCE(stream->dead, true);
>> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>>   
>>   	if (stream->enabled)
>>   		xe_oa_disable_locked(stream);
>>   
>> +	wake_up_all(&stream->poll_wq);
>> +
>>   	xe_oa_stream_destroy(stream);
> [Severity: Medium]
> When the device is wedged, does xe_oa_stream_destroy() stall for multiple
> seconds and log a timeout error?
>
> xe_oa_stream_destroy() unconditionally calls xe_oa_stream_drain() and
> xe_oa_disable_metric_set() without checking xe_wedged().  If
> stream->last_fence is unsignaled when the device wedges (for example when
> a config batch is waiting on an input fence or after xe_oa_emit_oa_config()
> breaks out of its wait loop on wedge), xe_oa_stream_drain() sleeps
> uninterruptibly for job_timeout_ms + HZ and prints "Timed out waiting for
> OA batch".  Then, when stream->exec_q is set, xe_oa_disable_metric_set()
> calls xe_oa_configure_oa_context(stream, false) to submit a new batch to
> the already-wedged queue (which guc_exec_queue_run_job() does not submit
> to hardware) and waits again in xe_oa_stream_drain() until TDR or timeout.
>
> [Severity: Medium]
> Similarly, in xe_oa_stream_init(), what happens when
> xe_oa_enable_metric_set() -> xe_oa_emit_oa_config() cuts its synchronous
> wait short on device unplug or wedge (introduced in commit "drm/xe/oa:
> Fence OA ioctls and mmap against device unplug and wedging")?
>
> drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
> 	...
> err_put_k_exec_q:
> 	xe_oa_disable_metric_set(stream);
> 	xe_exec_queue_put(stream->k_exec_q);
> err_free_oa_buf:
> 	xe_oa_free_oa_buffer(stream);
> err_fw_put:
> 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> 	xe_pm_runtime_put(stream->oa->xe);
> 	xe_oa_free_configs(stream);
> 	...
> }
>
> At that point the config batch has already been submitted to
> stream->k_exec_q and recorded in stream->last_fence.  Unlike
> xe_oa_stream_destroy(), err_put_k_exec_q does not call
> xe_oa_stream_drain() before xe_oa_disable_metric_set().  When
> stream->exec_q is NULL, the in-flight config batch on stream->k_exec_q is
> never drained before OA registers, forcewake, and runtime PM are released.
> When stream->exec_q is non-NULL, xe_oa_disable_metric_set() queues a
> context-restore batch behind the unsignaled config batch and blocks in
> xe_oa_stream_drain() for job_timeout_ms + HZ while still inside the
> drm_dev_enter() section of xe_observation_ioctl(), blocking
> drm_dev_unplug().
>
>>   
>>   	if (stream->exec_q)
>>   		xe_exec_queue_put(stream->exec_q);
>>   
>>   	drm_syncobj_put(stream->ufence_syncobj);
>> +	mutex_unlock(&stream->stream_lock);
>>   	xe_pm_runtime_put(gt_to_xe(stream->gt));
>>   }
>>   
>> @@ -1775,14 +1823,24 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>>   	struct xe_oa_stream *stream = file->private_data;
>>   	struct xe_gt *gt = stream->gt;
>>   
>> +	/* gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal */
>>   	mutex_lock(&gt->oa.gt_lock);
>> -	xe_oa_destroy_locked(stream);
>> +	if (!stream->dead)
>> +		xe_oa_destroy_locked(stream);
>>   	mutex_unlock(&gt->oa.gt_lock);
>>   
>>   	xe_oa_free_oa_buffer(stream);
>>   	mutex_destroy(&stream->stream_lock);
>>   	kfree(stream);
>>   
>> +	/*
>> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
>> +	 * is unplugged, this may be the last reference on the drm device, so let the destroy
>> +	 * finish before drm_dev_put() releases the GGTT.
>> +	 */
>> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
>> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
>> +
>>   	/* Release the reference the OA stream kept on the driver */
>>   	drm_dev_put(&gt_to_xe(gt)->drm);
> [Severity: Medium]
> Can xe_oa_release() race with drm_dev_unplug() and skip flushing
> xe->ttm.wq before dropping the final drm_device reference?
>
> CPU0                                  CPU1
> xe_oa_release()
>    xe_oa_free_oa_buffer(stream)
>      ...
>        queue_work(xe->ttm.wq,
>                   &bo->delayed_delete)
>    drm_dev_is_unplugged(&xe->drm)
>      --> false
>                                        xe_device_remove()
>                                          drm_dev_unplug(&xe->drm)
>                                          ...
>                                          drm_dev_put(&xe->drm)
>    drm_dev_put(&xe->drm)
>      drm_managed_release()
>        ggtt_fini_early()
>          drm_mm_takedown(&ggtt->mm)
>                                        ttm_bo_delayed_delete()
>                                          xe_ttm_bo_destroy()
>                                            xe_ggtt_remove_bo(ggtt, bo)
>                                              <-- use-after-free on ggtt
>
> drm_dev_is_unplugged() drops its SRCU read lock immediately, and nothing
> during device removal flushes xe->ttm.wq for an already-deleted BO.  Because
> ggtt_fini_early() is registered with drmm after xe_device_destroy()
> (which calls ttm_device_fini() to drain xe->ttm.wq), the final
> drm_dev_put() tears down and frees tile->mem.ggtt while
> bo->delayed_delete is still pending on xe->ttm.wq.
>
> [Severity: Medium]
> Even after the device is already unplugged, can a temporary reference on
> stream->oa_buffer.bo outlive xe_oa_free_oa_buffer() and cause
> flush_workqueue(xe->ttm.wq) to run before bo->delayed_delete is queued?
>
> CPU0                                  CPU1
> xe_device_remove()
>    ...
>    xe_bo_pinned_fini()
>      xe_bo_apply_to_pinned()
>        xe_bo_get(bo)
>        spin_unlock(&xe->pinned.lock)
>                                        xe_oa_release()
>                                          xe_oa_free_oa_buffer()
>                                            xe_bo_unpin_map_no_vm(bo)
>                                              xe_bo_put(bo)
>                                          flush_workqueue(xe->ttm.wq)
>        xe_bo_dma_unmap_pinned(bo)
>        xe_bo_put(bo)
>          queue_work(xe->ttm.wq,
>                     &bo->delayed_delete)
>    drm_dev_put(&xe->drm)
>                                          drm_dev_put(&xe->drm)
>                                            drm_managed_release()
>                                              ggtt_fini_early()
>                                                <-- ggtt freed before
>                                                    bo->delayed_delete runs
>
> Because xe_oa_stream_destroy() leaves stream->oa_buffer.bo on
> xe->pinned.early.kernel_bo_present, xe_bo_pinned_fini() still visits it
> and holds a reference outside xe->pinned.lock.  Similarly, in
> xe_bo_unpin_map_no_vm(), xe_bo_unpin() puts the BO back on the TTM LRU
> and unlocks dma-resv before xe_bo_put(bo), allowing xe_shrinker_scan() to
> grab a temporary BO reference.  In either case, xe_oa_release() flushes
> xe->ttm.wq before the last BO reference is dropped.
>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

