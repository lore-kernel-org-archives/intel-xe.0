Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF68606A332
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqGcxbNu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5373E10E225;
	Tue, 10 Nov 2026 15:02:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3897B10E229
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794322915; x=1825858915;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pMTe/zqg14LEYi1wpbbAq7I8DlSk3W3qMA0KYPXfkLE=;
 b=VqGcxbNu2MpTQu3QR6da6gqL496F2PtLtfUFRP3aFt92XLeQ1kAOEgJo
 GEi5BBklXE9IKAKTjX+Pk2lUUOYa3BMwLWosHBEN/ZEhfXJjzxoisHdnl
 vpywhHuAfL9moEn2b+YEZEshsxrXjdwOGM0W5vmoeU4vcRPBUiHQMZo/V
 eOdzsBrEYj5lTHhh162EkxSkkhXy3s7LM1aN4BVaeECmk6CfUP/W56RL4
 SonIQVNJLw4JBSfk4SFLxR9MUzjkuPsVcI5HUAtjuhJ+QjXCfJnbUeZzv
 8CY6X1YeSnqXv/8DYxie3QtnEVtcdXIggm6qSJDZ6JrInAJLodOpWizti w==;
X-CSE-ConnectionGUID: tzsZAYPATTGARd9QUvx9zQ==
X-CSE-MsgGUID: PjjpqFZaQ/uDeRgrWEBJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3071027"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3071027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:01:55 -0800
X-CSE-ConnectionGUID: 25xZm04pQb6JQQw9Toxdww==
X-CSE-MsgGUID: lZDOruC1QfSviCeL/N3AfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8169967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:01:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:01:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 07:01:54 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:01:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeE/z8T21Ch9Nrv7hR5ic63RIlqccrCLR8r8hrkLcxyB7xQF2iywyVfx3Qk+3xrY6qLToX6kgeJ0HUwkbkczdDh/L6a/q3qEC9IXqj2tUb+7N+AoP2kg5g2vUIYBiHAQWPDreiqx5BABT7jGSzcL+n8+irp2dDL+FZ3s7q3wAXzheukkLKv6usMkifxzEY/20Fbe05TWenS3mXDZhvdAL1G2DMLRnUkST4SkglvRozIlY+mgjmq7wmOID4SoV22y7jQNAmSHiEZYCTVre7YW2iz/3ykf6+Goup1IF1+jT7rUj+8ipn84X4uRHaTUzfkMmaleW4Xsz7IqYIOvzevWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhOWmFgsSV0S+8Fk8a+HGgUwQBgI4z3VCU4XKvx2API=;
 b=fWilYGlT7xzfBTAEx8zqEq7Wy7MgoVRQIRQvp/qnErDcyxV5b+D7K8kJQwdYh2mri7WDb6OpF1htz+qkYQdJWeD1jSd45yEfz2jsTJy8k1790iwtRJMda5QFDcx24cYovOg4Mj7dx4gqNDjvaUaB9+yMeqxXrvQIoL6hOoDiqeRay5sGzWfkrjf96Do2oZelaamgrbOv3yXDs13A3kWCripDo1kyND+yeOGpllpNacRjaTB5aqHLk6X5wVvNnhsrzck3i20L851S6OtbKd+zadNqK/Bp2QqmyuyVhi4nbN41vYDiDvcUhN2tHnkyeEa6TEIOfmzvor6jd6zgDogO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:01:51 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:01:51 +0000
Message-ID: <de3b077f-49d4-4c5e-b3fb-dc95279e85a4@intel.com>
Date: Tue, 10 Nov 2026 20:31:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/cper: Make software CPER emission
 atomic-safe
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261105085348.1467925-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: a84348ee-b1fd-4201-2dc6-08df3f3b8ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261102123227099003|261021121427099003|261021123027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: ySR5byUrZVkIlag4Vxg8tEvDJSYtxAH4FtdjCK0C+roXQwI7A6Ngopt3h6XjO+V3zK6Q22uVFibOgADXMrs7jwRJq7NfKagV7FB4g5CixYLWsV3BVV0Csb24KeNMnkHDYR5+mxWzomb0YjfApCZ0OmzibFBj90qIYAeA960kI+CK9VuH/js/7+h5J/Gw+kfzGql35p7Ek9WQi6w+xIHp2D2nqmaRbj0XEi9gdJXN9Mi+9vTiHDmJdjV63pcYm10SuW8tpKFZZDqAyeHE5X7yf5v+kDh+CCFP9yQlVUqZ1LVNUc08Jk8QRFGz8f3z6yLb6/hhALYF31r/TFpRI7ybVcGI9kdAjrRprE3wHzXvrVfrHaEqsTj7hG86ZTKOwFUQbhhy7u5jNIkJ5Q8YEyTDrJPQrF+P38ww69dPoNdwQQv5o2X8iV5/t/QMd+EUUKS68HH5nSWTZNsFgW+0W29xq0nQkqM+sAqt+DWjVxq0ze1aBlHk1e5ikGsT83hiQOUmzmmtPB5kYwYJAyRIT2N+q+dt374bNJSsplkFm1HTehhairiV1WDtu8s2Pr2w0K8UKF+jovRYjcb15pCEGSla5q8bY/WJOOALTZ3YmFitXCyyfFpaFpPDj+lzHL45HeolcsniDcsQvBp0cch+g/6AwBiZQwpa8P/3wZv1v9xgxtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NPRlRRMHMySkMzZGlhanpOOCt6d3hERGtKTVlhcU5tTkcrNmtXaUhENkov?=
 =?utf-8?B?YnIzNVlBQjBVQkRvTC9LV01zanZkQS9TZ0lxZlkzNmsrKzl3WXpDMW83WXRQ?=
 =?utf-8?B?aDdKVmhSUmFIcmxtcFU5Q1hJWDc4Zk0rckl1aXhnbG9QOTZiQnQyeEVnUVkw?=
 =?utf-8?B?UU9ad0VzamtkZk1GZTJaNGI4VC93QTkwSUkrZUI4QlhpemZYY3pmMW1MTldt?=
 =?utf-8?B?dGw2ekt4MWpFMEttdHZxRVAvSDI4SkVZc2ZQMVo1YndxVnRiN0NFTXlQY2ZE?=
 =?utf-8?B?UlNhVnlxbVloVDN4RXlCSFZNcmwrZGRkNGRWK1ZzK0MreHNjSzZGcHFJb1ps?=
 =?utf-8?B?cXFWZkMreDRScmp0RzRFZGdkQmFQM0hZVXovSUliYmx0MldjV2lSK0RwK0JQ?=
 =?utf-8?B?aVV5K3dCaE5uWXRxYy8zck94Yy9aN0Y4QUJJVFlSR0VtMXFUV2p3dnkrVE1N?=
 =?utf-8?B?SEZVa1V6ZFQrOEFwck5BT09qNE1zcUJhZ0REUEdhS0xZK2c3KysvbW9TR2h5?=
 =?utf-8?B?WFZkb0E5aGdJOGJQMW1Id1drTWJsVGFISnZlWFZTTkNxQnBMV21lQTk5NUQy?=
 =?utf-8?B?aDdISXFURmFZaGY1RlV4MWhwL0xjR2NTVjRUUkptdk0rME40d0FvL1ZON2lL?=
 =?utf-8?B?U1JrRjlhZjNhVjQ3Y2NwSGZTZUR4VjZkQnlza1p6cDJpWEJ6aHRLUFRiWk9C?=
 =?utf-8?B?Rk1YSjk5NFJVUGJpUm5laXJzUW5pL2Yzb0JLNzEvWFNBS2pHU2VjcnlmRUNj?=
 =?utf-8?B?R3FTVGluVjVwMmJscU5zbUp2VTlQWUlQUUhoMmFWQU9QenRoRnluVm1QY05H?=
 =?utf-8?B?U3QwcVBVR2V5Q28rVkVhRGV6NUVnQWxUYnJlSHNYRTR5Q1hJc25ERERKZWhw?=
 =?utf-8?B?dHU1Z1BVbGN3TTdSaXZXaEtNdU8rWkRrMjJOMXhBM3A2WVdoQjZjZmNyUXA0?=
 =?utf-8?B?VjU2T1ViWlpaLzZFUnFPQ2N4SU16RytRenlkZGdZK2NmaE52SnRGYUhOZGh6?=
 =?utf-8?B?ZGxSS1BQY2ROYkdPeVRQQ2NZaGoxbXJORy9CUm05b3ZFdit5cVhmNEdxTndU?=
 =?utf-8?B?Q1kxUFM1cTh5WEFUN0Vxdld6MmF5K1p1TGZtWkxqcFVrb0t0Q0NMczhNb3FP?=
 =?utf-8?B?ZmpYNi9FRlUzUnpKN0w0NldaTDdjeXBrRXpXS09CcHhqNFBkVlJvamtqV0Qz?=
 =?utf-8?B?anpTSmpVNzVnQk5QcjFGYVJlN21nZVpBbERMaTFYQnpQK3d6M0pDWmFCRjZk?=
 =?utf-8?B?a3lXekRaSG1UVVJFcGdLS0JZL0h2bTk2NVBmSThqdE0xaUpEdEliV1NzOTdo?=
 =?utf-8?B?UTA1S01oSTdmT1BKS3J2ajZsMGJKTWRaelVYc1Nrb085ckVSVGpxUFNIei9J?=
 =?utf-8?B?UUV1T2k0UlNLR3RaR3hrd1JpZEVlakNaTzhLZkpVdjBxaGJqSmNBZWxIeEpY?=
 =?utf-8?B?ZnNScGNiTWxQcFJLVzVkblBocXc5MnZ0YktPbVE2SEhHSlA1cXJjWFdmOG5w?=
 =?utf-8?B?b1BlTy9zd3B1aHRzUlBnNzVvRGp2OEQrOWtEdGZ0UXFkd0J5MWhmcHdaM3VC?=
 =?utf-8?B?SGlNS20xZ3FHNTREemJYUGRhYzlGWnpSZWpYcXlKWEJxdzVzYUx0ZXRlQVIr?=
 =?utf-8?B?alF5WnVqRHZqNEMzV2tMWGZ1QVFIWkZXUWxJNDJFRDlPVzNTSDMvUEZRMU11?=
 =?utf-8?B?MUdjaDR0WnpqNUg4bTliSGVCRGpSVjNHUHR5cGxwTEcwYjE2YThxdjFNeE9h?=
 =?utf-8?B?UWpRbnliSVNaOWFFd0dlV0lXRGpVekJ5NFQzSTFONEY4Sk80a0g0U0k4Y1F1?=
 =?utf-8?B?MlB4M3Frd0Z0UytMQ1c5V013NW1wV25JYWJ1M0pDdVJvcHMyZDdHaWZFTitN?=
 =?utf-8?B?aXhsZW1SRkxKVERWZkpwZzc2ZUxvUVlveEp4VVdKWVFzeVhHUnBnTU1EQzVs?=
 =?utf-8?B?aFZ4Ry9DN1JmcWl5dVNHMy9sU1VBdk1KWTdoNko4d3U4ZzBvSGhoeitZUXpv?=
 =?utf-8?B?WktLdU9KdTkraW9iQmJmZzdUeDVBcVllQnJhTFV3TVM5OEgxaUhxR3RTVUdN?=
 =?utf-8?B?cVdpSUkzZXpybkk1RUx2S3p6RnRuWmpVTVZrczJKQ0xSTjFmdThMdmR4V2M4?=
 =?utf-8?B?ZExwMFQrK3AvTTEzbE8zNnlJRzFvOXROTFlWaGEreUliTE5ub0JiRzdNRnRX?=
 =?utf-8?B?RlBnQ21mTVdNNFBjaWhITE4zbkh5YXlVb01wZzlHdkkxRUJJNXcvbHdiT0xI?=
 =?utf-8?B?NWgrS3FWQ0N6dHZtdzFNbEFLYlI0SDVsUFhFS1NFL0NmZzl6UHNqbnZTZVEy?=
 =?utf-8?B?eGE0Mk8yejhhaDB2K0M0bXpEd1RxRDJVenBVb2VmWWJEaTk0S0dQUT09?=
X-Exchange-RoutingPolicyChecked: 5WiQZh48R28QrP7EwIv5CJREorJ2UzLlb6CZhWpQUDDXaYgnghsBOPLGTq3evHtZzqH5aUn+M3jmFqCRy/+yNXlZ2AvFKqo57T2Zl4qfJFABTocXPpaLjVS5OChENBtT+e3wDdfm3vCJizut00xnzxhsQeoEBqNaegzhMP+jcUCiJM7TwfzefEltAJ1kZPsADFKvX4Fl3BhknYy0ywFOQWKpzI/efWRkvJSNkfI1Y/VnVsmvpipBVf0pwht6XBpog7o4Qny2QuaoxA+kiuUJZgWmO4ZFviRn6x6QEpre8xUMAaXmTjj+zWxX3eNZKWqpE7Ke15rGP2TCjhFGhz/p6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a84348ee-b1fd-4201-2dc6-08df3f3b8ce2
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:01:51.0118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQRBlMS419zft4jZtifp7biE+Oos0f0l84r/22B9REBiGUZpJIY/f4KasYeQr2acyduRrTcY7jQE/Spmah+oAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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


On 05-11-2026 14:23, Mallesh Koujalagi wrote:
> Use GFP_ATOMIC for software CPER records, as software
> SIGID logging may occur in atomic context.
>
> Keep hardware CPER handling unchanged.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Handle atomic context when SIGIDs are logged. (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 9510dcd1754c..8c683e320194 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -173,7 +173,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>   			     const guid_t *notification_type,
>   			     const struct xe_cper_intel_hdr *ihdr,
> -			     const void *einfo, u32 einfo_len)
> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
May be bool can_sleep or bool atomic?
>   {
>   	struct cper_section_descriptor *sdesc;
>   	struct xe_cper_nonstd_record *rec;
> @@ -181,7 +181,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>   	u32 total_len;
>   
>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> -	rec = kzalloc(total_len, GFP_KERNEL);
> +	rec = kzalloc(total_len, gfp);
>   	if (!rec)
>   		return;
>   
> @@ -228,7 +228,8 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   
>   	cper_init_intel_hdr(xe, &error_class, response->timestamp,
>   			    sigid, response->value, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0,
> +			 GFP_KERNEL);
>   }
>   
>   static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> @@ -275,7 +276,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
>   
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
> +			 GFP_ATOMIC | __GFP_NOWARN);

Why __GFP_NOWARN needed here?

Thanks,
Badal

>   }
>   
>   /**
