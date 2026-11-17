Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B3606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m4h3C1oo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UMyS1it/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA14D10E5C4;
	Tue, 17 Nov 2026 12:38:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C79910E5C4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794919123; x=1826455123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WagX7SrZZYYt0Mg/Bsfe+kw+SQILul40dz42WjbLr4g=;
 b=m4h3C1oovUnPozzfN8pvjfnqG5etexA06i9ntfjUR1ABQeiEIs1ZGCDx
 NPZu0BTZHoS2HT/fkX8+L6kWpLfGsu5r0CTS7yNAJSWUHa8XP21YgAYD6
 SlaE6qV1RpBmftHm1Df10dDrqAbSD4hNEs/6jnKmoI3VsscZr2cbWN6kT
 TrNJ/lOtbcoZGx0mq7mO0eKWLZqYkiLodUM0bvCTC3uT/IEbVlvYHQA59
 dRp3sq4nmR8HTrpR/4gcmNLQGhiMDVX+3yA7tvUxt+R4vCxN1bug7o65m
 nXQj6wYKvj6SHP3kd5yfjLEJI5UQLHIJEtluDPviwFe/qXrgshx055HAu A==;
X-CSE-ConnectionGUID: QTn6H2oUQpWNawggzFdqVQ==
X-CSE-MsgGUID: lQQ0nwCyRSeo2sFopwUH5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3553197"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:38:42 -0800
X-CSE-ConnectionGUID: UmLBRNsSQ/iLobGfwMsYcg==
X-CSE-MsgGUID: SL+uTtrYRF25TEi4pK+vxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9888669"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:38:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 04:38:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 04:38:41 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 04:38:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NF/Me2Y3g/8/PSWK5MBNv2ICEgXudAyewVrXBILlqdwIPEOGSlcYwew+6XnwCrxc9JCXGThSs1gr1Vb36uFG4wrJppbnJEg1yX9s+/Be+9sLHigLi2QcXwsScGuNSKBLlBQN2iBfL0ebddj22kxR7AKB7St9SebnznYgRyFSSNZ1I/Ta+FI817oguxyAEcu3Q8KMkUyX0ORAym5rajAQGMXDQWENlKTuabMf3J1udZ35fnNyx5GnDlZ5m68qeHA9lPawBKhzWJcVGZIrzOdApJu4NNdAEu6PhqDafmpAI0qEntdSqewi7QsV1hg0tGZfkCmlkY6OatuKYHaKNhNCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8KFV0m/ROHabjZ8PFKuqUpKBugeTtqTAcs4/Uj+5bg=;
 b=thawdqJ61RAWD+j2fTLAnJaYpJgje91pgH2A+DY/K1xHy+zWhGFz/eEUOzjuUbY9EAsVrus5umH0vOL1OP6Bf8LKu865bwEE+FsoR24IvwUX1SijY6xnPp9l0xrae/H56jtAzeBZPtZR6CYU6f+wkTxQcETaNG91F0K3AcIiaMZfr+1sVP477eo5lbVKi5dfLIEzsEHAS0q5yeSlKDFD6kwtdZLoIpkHScvn5/XUwMnRxn/QOb9o0fR8owDQ7UReOY+yHEW8ybimqLelRw/dFV1Z9SlV39Do2boTgRrQG9Bx9O0JAH07qRdTttAJHNrILlnfLvYg6RXXl8B0Q0kInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8KFV0m/ROHabjZ8PFKuqUpKBugeTtqTAcs4/Uj+5bg=;
 b=UMyS1it/XbNSy97bpSvh1mYwJ2kQNl5SzPfjCHOg0PWafvYkw2c7wOL2MuZWiIGZWEkj5r2fltXZlDalTMLuiQkwxbFOuDrmNpBcwveLGV0rr0lg9OZ251cVYipKI9V8HJhSook/xKFo2Pzsq9TfDb+wOaLVzeTtxh/RCg5obzg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:38:39 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 12:38:39 +0000
Message-ID: <2c5c78c3-9954-4aec-8265-4006fc5502d9@intel.com>
Date: Tue, 17 Nov 2026 18:08:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/cper: Emit software CPER records
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-11-mallesh.koujalagi@intel.com>
 <55e3f454-bdba-4385-bcf2-be08de32e618@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <55e3f454-bdba-4385-bcf2-be08de32e618@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::16) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: b83bdd75-45d0-432d-684a-08df44a7b47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|261009223027099003|3023799007|22082099003|261021121427099003|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261022113327099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: ivJJxELmDS+wILqUcjLI8lWbQIuXBdjHxql0p99dAEPuoFxpuHW+Go+MDx8v/lwWayqzYtr7VZwXBenoxs58kdFXvU16a9tKBxZ6jG+JJKRkq8tpmS0Vd0LB5Lb7VPMVzFxmzJCuKTcPB1pDs+EcoTqCRbYF9eam/3WuLoofhZfXxSDasU+kcPCXMQSqp9/SeytpwYWw37bb/G9VBabOWnaPgGBPhldvjtGnlrwyqGhN3tQCilBXtkVhT9pe91k5/FDT5V7DVEhfwiBCiUj7fR1YtzxPdQqVb+m6tWQLswuFHauwZ45Epqyv6GhJ8qZH4dY0W/weDJF4EYwucS0WY0qmVnx6U2SJXqqFgbJHifIbEcD5k60BYH+7z8R3io9jPdEAQ5jxrswXCUUDKJQ8PKb53X56uXt3eQm3E59C/TK+QNGFTpfxXA9Eq6s7DQqe1hJJMYr7MTY0Iv7d3wXVHp12/pdRrApAUAlSywc7EEmJsC51EvTNYr8Q5L2XMDtsVEqMU5FNq/Bl7+Yae79JR8Lt82dbuI2TsEO2/YQnkUHf0BQnzxfgdKQbKSfzbyGLs86zVbk1xzACecZVZSIRgZshpsnrxyt1J59s/1TWUZiPfs3jO0vHkuBY3iRL+lLPHZfQztki4GSozcna8SoBIEY7KbK8ECSIsffRPBWFNSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(261009223027099003)(3023799007)(22082099003)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022113327099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZLS0d4V1I2aFZGRlJFaWJuMUt6UWljckdIbDRBeWdpSERlV00yTVZzZWJj?=
 =?utf-8?B?OVBuaXFwbm9XWDFONTZUN2VtQ0hRaGVoNjBpMmltK1U4NnMwYmV3d3h5bzg1?=
 =?utf-8?B?bnVXdm9nenFBNmtxU0RzeWNmK3dwYmdZOTA5bmRZZDNBeFJxdUdDQnpnSDNH?=
 =?utf-8?B?Z05nV09HQjhMZy9hTGRmT3pEWjgzS2pBOXltanJBS3I1RS9tYklCd0JVditP?=
 =?utf-8?B?RzZENC9JYzNZTmZLUXJldmU2Nk50T0ROUjc1MFJMbkk5aEVYMWZDQkppcnM5?=
 =?utf-8?B?am5QWDBxUldLUHFOYkhaT3pETnRhMHBxaDlleWJFUXNDM3JveFFFUHFkOGxo?=
 =?utf-8?B?d20zbVA1ZnZvaTVtclFYRnNrd0loQ1pEMFhXUG41TDNBSDBXM3lDNmdjdGMv?=
 =?utf-8?B?T2dFUlYxVDlFeUJJalRCZnBQT2tzb2R4bDRoSjJuY0cvMG55bUVCYlpjNHk0?=
 =?utf-8?B?RXI1QzRGbHV1UkFCaFMzRGVSUHc2Wmxxa2plQkl5YVdXSER0S2lPRThxUWxQ?=
 =?utf-8?B?d0JOelk2aGNTNlBzazVxbkwzVHViMUhhQTFWdU5aSlhUTmhFYW1pbElCb0Ji?=
 =?utf-8?B?cm1BZlNVZ3hqMkx5SDh4TUlabHIzMUJtRVVHNm41VXR5amRBQ25vcTF5QmFw?=
 =?utf-8?B?ZFZJNTZGcXhZV21ldXE5SUlVT1labEdEbmI0SVpXMUxFTzFDYytETThKYlUr?=
 =?utf-8?B?YVB0RktaRHIrQUFHVURsS25RSHEraWVkSTNkZkp6ajZSUjJQbWR1ckVuNkhV?=
 =?utf-8?B?MndjNXEvd0hnbXlpSTlZYjl1dFRTNENEcDU4RWVNMlZUbEtTdk1TWjl2dmQ2?=
 =?utf-8?B?dWt2b05rZk1rNkl4MjNiMGwxcC90dDZvdkZucFBiMEw5eGUrRHRqNUZqSlI5?=
 =?utf-8?B?aHBUSUY1VDNGOSs2Z2s5cFNsV1pTUHIvUmpYcFJNeDBwVUZCb0Ryb1Y3R3Zx?=
 =?utf-8?B?U05EbVFzbmVrTUxUajNsTUNxdklwY3VNaDhHMjJqMWV6REFzdlZjNUpUNFB2?=
 =?utf-8?B?MDRydXIxdndrVHd6bENrL1VMM2ZJRXBBSlpTeU9BV0lZemk4Z0ZHSGtLcGND?=
 =?utf-8?B?VDRKTWdmcFNONjkwZ1dKQzlFMERjWnZIcWxYMk9KL3NzcVdkUTVCVGVVS1RH?=
 =?utf-8?B?TE5VSVBIcUVlRGQwbWk2QUpic3FiNDJqMW4wZEovT2dYRnRzMUE2cHJDanZ3?=
 =?utf-8?B?UnZEcWtJS2VnMEVvWWFyZ0FuWnB2RC9tcitPQUFCc0NrdWFNVkhSZytMdG1N?=
 =?utf-8?B?U1FDNldPV0hqSFdTVUZXaEVNV0wxUmVtRldSL2ZGaTJjT0hQSGcvVStENTVS?=
 =?utf-8?B?dVpsWkYxMis2WDZWUEloR2hVS3NXN3pwKzM0ek1ZZk85c2J4ZFhhdjZzTlQz?=
 =?utf-8?B?MTJCc2VGLzVDQStVRVBUZ1VZUjQ1ZFJOOS9tTllBT0thRk9TNFlOUDZ1NFZV?=
 =?utf-8?B?bnpXQkRJa2VkMENMbEhhMmtTdEdXbUhrOCtFRWNYVGtsUFB5eitBVE40S1VF?=
 =?utf-8?B?UUhEWkJOVC9HNmdVNllSSnM0M0NXTkoyaTNyRENWYWk3VzlqcERuK0dnZ2hp?=
 =?utf-8?B?Vi9hYXVwRlFXTlJLbTdXbDZ4SktIeXJrdVRKQWEzU0sveFJSWm5tVlpGalRY?=
 =?utf-8?B?dTNRbU1QcVo0dHBJS0M1NXBXSngvK3dzY2V2YzgyWFUrL3NyYnZ4SGQwbXhv?=
 =?utf-8?B?eVJFZUNRZXBYT1FMdk5WY3l4VVo0WGRTSHUydUlobFdpdi9KSnE4L1Y0V0Vk?=
 =?utf-8?B?SURjLzdNZzBzMnRWeEd6R0gyenBJOHVvUkhkUmFxYUhyeEhxcnFsUmdBSy9P?=
 =?utf-8?B?OFZyN1psL2I4Z29yMFN2OC9yVlpHQm9tbFpVQ3lOYzVLb1Z0SGlNVFcyWFo1?=
 =?utf-8?B?Rndkb2JIQUovTW5tbmJpWFJDMlFVNkN6OWYxLzhPMnQrVGtVQ212ZXBQS2dB?=
 =?utf-8?B?M0RqWVlFTURPR21tU1FESjIvcHRienFtQXlDcG1UNGNEb2xjcmhWNTViN2sy?=
 =?utf-8?B?TndsRlNRL1pRbXQrdTc3cDBxdjhkQ2NsbGpKL3pBTjByR3Rsc2J5V01zOVF0?=
 =?utf-8?B?NDF3bUFndmtJc2tQck0wejZGMU5Va2s3NFN4SFNDK1NqT3lZNC8zcWsrSjdl?=
 =?utf-8?B?YWhlcS9qNjdkcFh4elBRUGlaeUxqVjQ3dHAwWUlCN3J1dGROdS9HTkppR2gv?=
 =?utf-8?B?OWF2Vk5kQ0h0ZVRuN0FERFVXeUkzRE8yWVR0VEdZTVliWFRGeVY1VmxsUTVq?=
 =?utf-8?B?dmgzN2FMYVg4ZDNsRENYK3Z0clhtbmZvNmtrUllnN2YrckhSbXM2b2t2NWd4?=
 =?utf-8?B?VFlTQ0gvL2c5aUQrQnE1M08yRE9ycW9wUUxvWHhYclJHNjQ5ajZrRWxCamZa?=
 =?utf-8?Q?FwlMOWMiInEBGX4w=3D?=
X-Exchange-RoutingPolicyChecked: XK+BY7/FDctzymKlB2vBFrNw/0/ypECNFuoxSpJAfc9PAUrH8Qy5d8SW1ZF6hjRz6ZT+CZ0JRkqITq9bCS0bq+6/zpVisZ8Kf1NJYVPQ5lSpgts0Q7j3pExOYJ6SIcetaPJnf7y8zZi8be0xyVpyWdHg1fl2ETMNE97CGFM8Np9eEXiyJ/UHMDgJ5SpJ/BfXr2xO07mc6YuzxSzpK4YesoUlmtNzRMRCQb8iwaDX18MsfQe8VWoqSqT2yxNvtJuLsZHoW6JvgB9DJ95DTYofPDXM79GTCsE6f0bYa+gDeFlK0Kn21hQnVJuds6HWuqlgdHUCZTagNkRQ37zAG3h8cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b83bdd75-45d0-432d-684a-08df44a7b47d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:38:39.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiegBB09rOT1ktzUUgvWMuputi9hqoegnjqgQSl+Onk7Bb4VEHYRjAfvJFrex/X2hrgboPFRkFrLR/ppYkQnLza6egTzxc+UAWtewcXcpTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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


On 17-11-2026 01:04 pm, Nilawar, Badal wrote:
>
> On 12-11-2026 19:16, Mallesh Koujalagi wrote:
>> Emit CPER records for software SIGIDs and attach the
>> formatted log message as record data.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v4:
>> - Emit complete message. (Badal/Aravind)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 9 +++++++++
>>   drivers/gpu/drm/xe/xe_cper_types.h | 4 ++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index b23f8bc9f993..5a776aa571d0 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -258,7 +258,12 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       union xe_cper_error_class error_class = {};
>>       struct xe_cper_intel_hdr ihdr = {};
>>       struct xe_cper_driver_error_class *driver = &error_class.driver;
>> +    char *msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> move initialization closer to its use.
Ok
>>       u64 timestamp = ktime_get_real_ns();
>> +    size_t msg_len;
>> +
>> +    if (!msg)
>> +        return;
> This silently drops CPER record if allocation fails, xe_warn here?

Sure, will handle in next revision: like

if (!msg)
     xe_warn(xe, "Failed to allocate CPER message\n");

>>         driver->error_type = cper_sev;
>>       driver->error_component = component;
>> @@ -266,7 +271,11 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       if (IS_ERR(data))
>>           driver->cause = -PTR_ERR(data);
>>   +    msg_len = strlen(msg) + 1;
>> +
>>       cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>> +    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, 
>> &ihdr, msg, msg_len);
>
> if message allocation fails it is make sense to emit CPER record just 
> with header?

Make sense, I'll update the code with when msg allocation failed.

  msg_len = msg ? strlen(msg) + 1 : 0;


Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>> +    kfree(msg);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h 
>> b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 8e90a3220919..0178a5521212 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -40,6 +40,10 @@
>>       GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>>             0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>>   +#define INTEL_CPER_NOTIFY_DRV_ERROR \
>> +    GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
>> +          0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
>> +
>>   /* Section Types */
>>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>>       GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
