Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DED606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXGHV3gw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cvGATq9b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5200A10FD5F;
	Wed, 25 Nov 2026 15:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5F410FD6D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 15:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795622188; x=1827158188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0cC3b4zgEFWzJBgG8b9lVzbRvIIT4D5nRWrANTzjXT0=;
 b=fXGHV3gw8jJ73EGXPnACB3kCdu9mtVMKwoXhYbWrVCSPg6PHmtTdbYzU
 Z2OlWmk/BJi8snIhy56IQXCyaIQ0W58amDPcNPHhTgZJWGT6sKHmRQHtk
 tUQ1BPtXHGyDaIxnPleS9KumurXhvhbp/3DBjtswgR+msah8gI2bkwM20
 lLtsb1Ls9sOYgUup7NLjb/dtWWhSxJXbiA6rgcUOeCBVDJ9/B7Ua2Nojs
 /oKpEDjzOLM3ErPdYCOyLFkp5Ws0J62lmOiUs7xMSZs7ymmzUGaO1u6ig
 0Ioc8zmvEnfoqMYMQFY6CD9Mb6byUfsRjy8qK1BucGrPgy/7LWfujmx3W g==;
X-CSE-ConnectionGUID: EfdLo87mQF+dZYEemls1fA==
X-CSE-MsgGUID: 2ZxYSWXKQveaO4rgGz57Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4363798"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4363798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:34:23 -0800
X-CSE-ConnectionGUID: xIX0GDuwS8O90mMgRXFmmw==
X-CSE-MsgGUID: nXOtqAgWQzWo/VCRWutdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11779348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:34:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:34:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 07:34:23 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaRNdGE3erJ9HvK0i5unMDVLT4fSrRV1R/ZEFQNRTxupK1cEXpMtYccGCkt45IgeD3scw4qHkH6c19t4nPkq2W0vom+wlTQqvxCZCzSUoT70u1haoIgUGrt1HHvndJlaVuQoX2Lj7GOJPtKGC5G8GHQKLzp7ThPKN53hzpcKOidrrQZ7HfQoKZJjJGP6Yi5Zfse6DugKkL6M5SsUOp0RqQHpP423QrmkQsk9/p86sj/em/hEYKkMSa2JLMiUc6iMj3AvQ1KS3WgipuW86J2Nh/xbQ/ReDOPcTJa3/jhfszKhiLIaovsnFrvtGC2FHMs9MO1qepIw2u0U7vyDmZKscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzC/CJK+tWBcl1o0Opk1I96Ozo9+qBj2yCSvd38Oxgg=;
 b=c3L7t2WXfghhalahMMWs+Gch5KPRzQYNpfNfX3l4QO7/Z9Sb4CG1x7PVtLDN1+W0arcEMDILl4/QfG5BhMtBRlz7o9iOlRLmwg+WfpoG2NYvoqVB13OJjW4Bironpb6iFdgHazX4VdBVrn2nPz0uFpNa0XIBSL3/yAjy/RGgqHLGUhVU1+8AQbvJ9vSGmF1s8k2wbusOXR4jQtwS3jmo37MSSKVvGQ6gauKEMajLJE4lbVRYrDw4ua2x2+hfwRr64qujYL+Wqkhc8na38/a5vwIxQ6dLUrkOf0RLgGultqcDyz2adVOUGxoXLLrXzmVeuf95RIxhF5LOmqrE4czw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzC/CJK+tWBcl1o0Opk1I96Ozo9+qBj2yCSvd38Oxgg=;
 b=cvGATq9bAK/c8nEDSixV1HlHKUqNKZ00cehgdru9mV4WPTyWuUDXFC5SNvSnmua06NYBb/7Hv78L1iKQ/Aoq126kYTEkGudhf5okp8Kp4FKYywgSAlwcGK0ztSg2kyj9TpIfgl0PGovxvoG5Cw+0dUNqYKvC22dCN2uMpWWAPZk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 15:33:27 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 15:33:27 +0000
Date: Wed, 25 Nov 2026 10:33:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <hiresh.kumar.yadav@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add debug configfs option to force OCODE
 load
Message-ID: <awb_w8MKM7VUJEwK@intel.com>
References: <20261125125011.192907-4-sk.anirban@intel.com>
 <20261125125011.192907-6-sk.anirban@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125125011.192907-6-sk.anirban@intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: ade49e13-1e82-4d32-19b3-08df4b09734b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|260925021311599003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261022115727099003|261026121527099003|261022105027099003|261026140227099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|260925021911599003|260925022911599003|18002099003|22082099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: PaRmbG9UZ2zJpaNxlhhYvUtgJ+hYLvNeWkAPFTV6DuiT2bQW6x5s1etdBR1PYRZdK8jH5CJ98r3cgCoWuw76aF8d1M6BTsAuGJuSgd+ZIQdf0C54oc+a3bvytsPRoKxdnmFGrAhYqusCQPTk9uxvUukjHxUNXk8zlBrcFftJxExK69OHC+283ew5IR2/Q1cNL1dftMTjrM9L0a0i6WHXxQ6qwU2ImOfQPZJbSsLlfdBJouk0HJkTdSoI2L0mccoSW0op3AzADQ+HRKQxriaYSdV5kjvxbxd+fxGYWeql6NffnKwm94z1MKcbVd+dBuv2rEttMTc/cLJVgFZyK0or0LlHuYstTfbQ6dPBBKmnKnsNFvdokWyWvfoQ3q5eEYxVIxL5eVOn9cGXlqD6ev3nc3+LqZVaeOBD5tdQwy8OB/LCKyYrsjKROxJXXSaZtYSklTG8C2QUr8mjCRb6UEc2IAtrZ6Sep6zd32hd0/l52mxFQlXhLF0uI7nJ3IKe92SgLU4zdms8G7e3MxbHdWHleRfyWnzsEIswK+M7KLpLvCkyxnlsDB4B4qzDQjzJ0esllqg+Vbt3dtzU8p5FSq8HOm+xQJ744e04oUCwyqiAf2BSz9uMhURL2eOVzDFI5H+mYWxG3QpbRAUX34HWHD0ZRZawJ4zuiDrQWWaSkqUbFI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(260925021311599003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(261009223027099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?olupXF/0CVnabQ6GOG97eTN1ceSHydlvh5TXigRgcIlYKi4A2kFgaUQ59MFR?=
 =?us-ascii?Q?FqhSDwYa/Od9LBrC71Sg9Grl8rv00KJ2qW6yUuPMdNAVnAAur7ZZB91t45a4?=
 =?us-ascii?Q?sQXPx6471UNwOPp1ab/LuP7ooNcWXLFTTOS0/nbEP/Jg/nNAnVQf5zg58LBg?=
 =?us-ascii?Q?lwVq1IIBLQzWBsy3K4YrOI44HB73hF2r1gaQ4voBEcC7Te3ebY7sSv+bfmVx?=
 =?us-ascii?Q?zm8BsJTWGLQCC39KjTa8HeENnutMkPeWI+2ND7XCPNUhx/YNZqL5FmRSsUu4?=
 =?us-ascii?Q?ZwAo/MXalzlcJu6X0gazsaeUHoy6ufWwOE00QUWQn3lw9z3Z2c1riUp3ETH9?=
 =?us-ascii?Q?BxTK5Hh2hS2j5WZ1/MqzSwHABBBTyCpwr75cGr0MQdC1vfjJN+rwmRGm1oD9?=
 =?us-ascii?Q?HI7VhOYbNXH8sL4RyECmh8hdJdYgLqndSPIBKBKtav1hdph45y2PlDOgCSTp?=
 =?us-ascii?Q?6cFUyRKVo7s3jzOSrPGMxV4aYgCWRBIpZ4UuKa/KXHkXF2PWZnZM/kd+yopC?=
 =?us-ascii?Q?ce8S4EvdsIHJ7FuiDZ1DG6fHyOGSiFlh7BpKDhi3kpfl1vBMz97OEETP6pif?=
 =?us-ascii?Q?1nSRccxXRcSYeivSRmwaRgBWM43aqpqri+d0FSjkZRav1SfkOrFLuuFTmSYD?=
 =?us-ascii?Q?XpBe8FH8vNpS5vRiFJZExD/VhvoYC+eSQNpsMpiZAEsjc6S5ZgECMiBX5AJ/?=
 =?us-ascii?Q?agAr7hUe8GSMIwsIpQSmLP5+82NFjNbvfKIG2jnEk7sSE9vzvlRKawSCBBX9?=
 =?us-ascii?Q?WaC4r69ijvZwkAdMSb7RBzXWa60TuYjMeTHYrLhGn2utJy5F9x2gXYYIbB1a?=
 =?us-ascii?Q?QpOpz8WG0AqlmMkavfAdv8PAsHU0XwcK7F/0KY8+Frq+GMI6ivqReKqJzYwM?=
 =?us-ascii?Q?1dQJmXrwYFV93OZmW8xRgFFjnCLXroQj1pOGwVeTlrds3vMjLlIDEEQaMfCw?=
 =?us-ascii?Q?Gki240HssDvn9CQIYjERHOSIXA5xn1A8UYR9Ol1jPu9661e4qWhMihTYx+1A?=
 =?us-ascii?Q?GO8BIlMyVUHrNTJp6chqSXMVR7Q11/wMNCZmzEX9S0r/d7BifsdyUQLvzIxZ?=
 =?us-ascii?Q?fYxyMECPsQE4fOVTlpYLTBiNxxryQBwBljiK1NpE/pWOwegXcfNzIVjWjl4a?=
 =?us-ascii?Q?YUE6gTbSTaBCQT2b8Kaw9fCR8F9CKZovdiCQrodBy9os/6cCODyZRrFFCiV9?=
 =?us-ascii?Q?B2d5sXCa1xkQOJqT1Zw9LqiOj9x5tedkI4Kv5FMX/SAmIu4EU1av8j2aAniy?=
 =?us-ascii?Q?V7T5yzrLHuZoJhpGOjPFUmVL8njGalAFisnEz1HMMWufCnarM3+XMF/8BC/R?=
 =?us-ascii?Q?VLWtvH8SC2DQqRMnLXT/7skSa5xFi2qNomWoXEvC+WntYWCbfFquKte2AvBn?=
 =?us-ascii?Q?nNKIm4jejPkvTFl2MQCzOlVEOW7ccYQ8WNH49w5GjwHno3qfYq1f5BGIm09W?=
 =?us-ascii?Q?1t/CiR9KwPJcuojrE+q3H4MRhFghcV2R1CEB70ezm3D6SfQI1LndLM7wvA2V?=
 =?us-ascii?Q?TgX+jQ17c4uSLFE0vKlOo6yrgmOlnOTt4zS9mQ0OIVBJIuUffpUrpi4a++tP?=
 =?us-ascii?Q?99kO4xhgCrCK+INMwy0PEEHk7Xt0etk6hPSXcC/yt5V81p98aGSloZ1+LWcx?=
 =?us-ascii?Q?u6sxV3YH5M7qztMkU0YxG3LV/T4cYfgEQFoF7paAoAQHk/S9lIkDKeN0Dq/W?=
 =?us-ascii?Q?Tem4JBac+wiRa8nIRpwS81yLX68OuwJe7NkKbzE2XejxW6JqoJOICw5qWIKL?=
 =?us-ascii?Q?XMZJ4HkgAA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ELKzdU0HBfa/IFvPhJRwz/QDfz7+mnrE3EK73DndeTI2KgfbczKzANc6yoRw4pm20BN/C/6j1xVsfidZuJM17K74hSqDHiRTg4FEFcFD5OLvzVXenWfvVCQJkMe24Niv9kVpmkkbNauw6FEJOxnGqduAI1koUF/nX3kQ0O/kteIxAb82kfqikl1OG9bRkx3RYajzU042SIRvLblguia4Z6bTJrMPtOkb4TrkkMXx/PCX46p5atrNogY0YHi0auDH9fiJOP62Trnj0XaE28PS+GJkGI7PQikwgSi66E1Ezm/MQwaqKjeWhQ0XG/VT8qZpltkk+3YirMF2Q2Prroutaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ade49e13-1e82-4d32-19b3-08df4b09734b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:33:27.3561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dU96khIraTXSx8aYCFRoj/XQ6vTUebSFp1ei73io96bWzyoznIk2tYfCvjR3ouQcVkiF23BdG1CsXJUflfGRwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 06:20:14PM +0530, Sk Anirban wrote:
> The late-bind worker skips uploading OCODE when SysCtrl reports it is
> already running.
> Add a debug-only configfs attribute, ocode_force_load, under the

still uses the old name here, but no worries, I'm changing it while merging it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> per-device xe configfs directory. When set, the late-bind worker skips
> the "OCODE already running" check at probe and uploads the cached
> OCODE payload.
> 
> The attribute must be set before binding the device:
> 
> 	echo 1 > /sys/kernel/config/xe/0000:03:00.0/force_ocode_load
> 
> v2: Rename configfs (Rodrigo)
>     Apply the override on both probe and resume paths (Rodrigo)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c           | 58 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h           |  1 +
>  drivers/gpu/drm/xe/xe_late_bind_fw.c       |  6 ++-
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
>  4 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 2ddd707a6dbd..801b22fe3c36 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -85,6 +85,13 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Force OCODE load:
> + * -----------------
> + *
> + * With CONFIG_DRM_XE_DEBUG enabled, force an OCODE load at probe and resume
> + * even if OCODE is already running. This attribute can only be set before
> + * binding.
> + *
>   * Allowed GT types:
>   * -----------------
>   *
> @@ -302,6 +309,7 @@ struct xe_config_group_device {
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
> +		bool force_ocode_load;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
>  		bool disable_vram_page_offline;
> @@ -324,6 +332,7 @@ static const struct xe_config_device device_defaults = {
>  	.engines_allowed = U64_MAX,
>  	.migrate_ulls_period_ms = 5,
>  	.survivability_mode = false,
> +	.force_ocode_load = false,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
>  	.disable_vram_page_offline = false,
> @@ -429,6 +438,32 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t force_ocode_load_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->force_ocode_load);
> +}
> +
> +static ssize_t force_ocode_load_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool force_load;
> +	int ret;
> +
> +	ret = kstrtobool(page, &force_load);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.force_ocode_load = force_load;
> +
> +	return len;
> +}
> +
>  static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -946,6 +981,7 @@ CONFIGFS_ATTR(, disable_vram_page_offline);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, force_ocode_load);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
> @@ -957,6 +993,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
> +	&attr_force_ocode_load,
>  	NULL,
>  };
>  
> @@ -980,6 +1017,9 @@ static bool xe_config_device_is_visible(struct config_item *item,
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
> +	if (attr == &attr_force_ocode_load && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return false;
> +
>  	if (attr == &attr_survivability_mode) {
>  		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
>  			return false;
> @@ -1240,6 +1280,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%d", force_ocode_load);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> @@ -1288,6 +1329,23 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	return mode;
>  }
>  
> +bool xe_configfs_get_force_ocode_load(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool force_load;
> +
> +	if (!dev || !IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		if (dev)
> +			config_group_put(&dev->group);
> +		return false;
> +	}
> +
> +	force_load = dev->config.force_ocode_load;
> +	config_group_put(&dev->group);
> +
> +	return force_load;
> +}
> +
>  static u64 get_gt_types_allowed(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d726800de26a..3f0d68bfb9c9 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -18,6 +18,7 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +bool xe_configfs_get_force_ocode_load(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index dfff1693bf1f..ad39383a7e41 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -12,6 +12,7 @@
>  #include <drm/intel/intel_lb_mei_interface.h>
>  #include <drm/drm_print.h>
>  
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
> @@ -259,7 +260,8 @@ static void xe_late_bind_work(struct work_struct *work)
>  	xe_device_assert_mem_access(xe);
>  
>  	/* TODO: Compare the running OCODE version at probe when available. */
> -	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +	if (lbfw->type == INTEL_LB_TYPE_OCODE && !late_bind->force_ocode_load &&
> +	    xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>  		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
>  			fw_id_to_name[lbfw->id]);
>  		goto out;
> @@ -557,6 +559,8 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>  	if (err)
>  		return err;
>  
> +	late_bind->force_ocode_load = xe_configfs_get_force_ocode_load(to_pci_dev(xe->drm.dev));
> +
>  	xe_late_bind_fw_load(late_bind);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index c7b3ffc743cf..2762442580fb 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -75,6 +75,8 @@ struct xe_late_bind {
>  	bool component_added;
>  	/** @disable: to block late binding reload during pm resume flow*/
>  	bool disable;
> +	/** @force_ocode_load: force OCODE loading even if already running */
> +	bool force_ocode_load;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
