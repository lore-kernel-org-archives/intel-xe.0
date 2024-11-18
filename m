Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FABD43FE3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 07:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DC810E1CA;
	Mon, 18 Nov 2024 07:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAmhYL97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822110E1CA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731915465; x=1763451465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I4niNt/rDTavdq+8oDQ80uybYP1rBObjSaQj+aDDaDk=;
 b=eAmhYL97KN243fL46gHYxtCVVp+N1giZ9H0HhimJfeAd7wgg1r3TsDtC
 kN+jAsWdd5seRwxF6Hu1P3FP4LW9+68zqr7HPB97pbrW3cl5d7xAWWk3C
 WJD6uR8ADQjRYgFPR3nfpElmTBD2R+7eMW/O6rafvZ8N5Fnj+uf2VpHHv
 eduBOcLgqsazYZ9s9LgBPG/JkUaP6uJfBSK/NdFZ5X6FlA/TB5BQtvX6O
 qkvvLG13D4mhJH7WHN2TcYE8hvYoGAQ0gXbF42TJikKvigTqal3RRM11s
 zWNt7/+SfQwvwoJKxhBIVyx3U8mGWjvsHjegLZkhZiBD5b3YxCLKw5t4L g==;
X-CSE-ConnectionGUID: OLSFngpuQ66q2lLDuHhAiw==
X-CSE-MsgGUID: W2Vc0nTNQlyzJsj/J5XcYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43243018"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43243018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 23:37:44 -0800
X-CSE-ConnectionGUID: 73NLZOknQD2Fv+6MAMBNEA==
X-CSE-MsgGUID: wVkTRS+mSw+3XbuCA1x21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94228893"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2024 23:37:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 23:37:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 23:37:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 23:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0DcIMYIEjjaJBVKRQcrf9g5OeccHmH2iCVsmpd/TlzbWUGUIX1FnOQV1X3pzLOM66iGeNbv6KrPBC9FfDcb9ifGMwbmQbnZV108SCl7eZv2rSxBrPHmmf/021qgT4LgqlExRt27Q/nyvmShOFCt+zKBTiu97smLk8g5PmXYeOxT/AC0Ze6KxZYkSh5bIgEeOsJac01b5yvkLf+zsX+KKnPZILscSYoz32M1qC7YsN2BFCQ9EtK3QgjaLbpJEMVrF90d0cvgT97hYoYs4+WLmR1J5yKvVoPgT5GP4iAuC3lSvVMk9JL4DRgLZToyjoJdPPPhE2loYyg583438xhvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2p+2hKV1TAbIMqmzFW6ggR6j2ptgkp8JVSsKQ3xWsc=;
 b=eO9ZCAg95lF8jtgAum5FxclkVmqHJs+xKFGZmQLNXx00Vi3WZYxyoinyEHL2IBgfpp8shgcSBoOz7NygAGDLdvmJ2IVE4Vu0iKTYHAjbSYNC7mx+GhY8nI6bM2m/nuTtOTg4Zzhe73l/SgpkZlXnkye4l1Gz1WnvVxSk/iHGGGP58hPBCPtFxrDzHEgTLOVMS2miyVbY6tMoNE+VPHOsV2980FCgAN4NZGcmq285W8rnf4UCy6jz+QCSIDZWP7ZnTFcWnhE6e4WIMnDolb/IP1ER4jV7FB9cnEES/Tm6NF7t3n/SdH1klhW68Nbzr4CUjD2bOLr/cy6EBaCjhACpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Mon, 18 Nov
 2024 07:37:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:37:40 +0000
Message-ID: <8ceea4a6-96d2-432d-8375-73d968d068c4@intel.com>
Date: Mon, 18 Nov 2024 13:07:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe/guc: Expose engine busyness only for supported
 GuC version
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-7-riana.tauro@intel.com>
 <ZzaR7I1G+kuu/SCx@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZzaR7I1G+kuu/SCx@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 158c05b1-ec02-4155-ed97-08dd07a3e19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU9yZUhqTFBTMFBscnBUWUtyUXRPdGk3T2pQRjM0MjRtNWlydzVWSXBoQk5O?=
 =?utf-8?B?a1NieEpieDNqclJYQzluZm43YXBmbDBqaFZlblNBZUxHRDZLajFQeHlTbWlY?=
 =?utf-8?B?UGw3VEdqcHM3ZFM0UktaM0g1L2JmVFBBbUJtcUg5dCt4a0QzUTgwemo2QkR3?=
 =?utf-8?B?MGVRa2pTZ1dQMm5GRUJuOTJzdms3Q08vWURJdytFclZjR3ZJbFJrRUw1aXUv?=
 =?utf-8?B?a05peVdmNER1Y2FqTzB4cFdFRzBwOWZlSUFSOTJpMzNsclEzemxla3BoeXNV?=
 =?utf-8?B?ZEhrem5ocmZ0d1U0Q3hic0RGM2JIUng3Mm00N1pZODVTQnNhWWU3aTB3Q3U1?=
 =?utf-8?B?VlNSQjQrUmM4K21sRG41dWVUZzFSWUk2WDFWcitlRWZ6WmZtSTVORDRoSURT?=
 =?utf-8?B?d1YyN0FLSlNhQ1M2a3lBcElFamIyWFMvTHVPYkVSUFBIQmFId29NMjgvQXRN?=
 =?utf-8?B?cUdwM29BcjVJMHVKcVlCK2lQQS8xKzJLK25FaXQwUUlqaFIrNVN5ZFVqNEFF?=
 =?utf-8?B?aEgwUTRuZW94bWUrNEdDNHZ1Q2FSM2dDcDUyazBwcE4yZVgwL1I3d1I0UVRD?=
 =?utf-8?B?bzF4dDlISzhMSVFJSjJNejBRaWU4MUxud2ZvU1hzcGxyMDF3d0ZIc1dGbWhP?=
 =?utf-8?B?WThXL0VkLzNmK3VvOTdnQWZreE95TWNyYWR2MjFmc20vQmdCVXhmQTFERHQv?=
 =?utf-8?B?cnhucW54NGZzcmJvRW5sNnFEaGd0bFNGdlk5WXZ3WlJNNHhQY1dkSmZZQVpQ?=
 =?utf-8?B?YWhXV3V3RllCRitwYzlTWGI4eW5SbUF4TjR1UDcyYUN1Qkh0UmwxNG8xeDJP?=
 =?utf-8?B?eXlIQ2hONXhDejhKekVlSnp3ZFl6dHJTekdjNko5NFIyVzk0RDZlOGVwMmZE?=
 =?utf-8?B?d3Zid1BJRjJrNERWUjN1RzJmNUFGZnRqQm83a2RwV0NUdTBsUXVxZXcwSDd2?=
 =?utf-8?B?QkcybDkrcDd6bGdiOFZ5TURtVUl5ZDM2QnJCQzhJeElmTXkwbXlzSUJLOHV1?=
 =?utf-8?B?czB0YlA1ZHhDaEJqM0dqaTFFaFl1dkNpRWhqV3QyVkZkdkRNTDNSbWNORzA0?=
 =?utf-8?B?ZTdRUTdBQitZSzJCWUhJdlh1SDNpMkFwNmE2MS9sTWpuUmxKRXhSQUlnaDRE?=
 =?utf-8?B?bW40NDd4d0JMb2cza2FCb3RPbmFXbG5Qa09XVm10eHhHTmtGT01nN3VoVGZv?=
 =?utf-8?B?dXluNy8waTJNOFdFbk55S2xOOFlHcVV1UlJwTWt6SG9kTFlWSWV4L3hhRW5Z?=
 =?utf-8?B?NmpteEl4SDNwengxdkFoSEJwRW5OcUtWWXJ2WCtBcFFUdmdOa0hBRHF4M2J0?=
 =?utf-8?B?ZDNRdkZxOWVPY2U0Q21PY1o2d2l2TzFkZVpGV1crVnQrcElvYnE0a1prK1VS?=
 =?utf-8?B?Rzl1UXNZZkNDWGN3M3RkYlM2NWhzY1NyUnYybE9kdmdoeGxDRW5kbXlWOS83?=
 =?utf-8?B?QUs4NVhlb0tvOStDRFlPaW56T2RrUUxpUTJDdGczSlVMQjRoRmc3YnRQNS92?=
 =?utf-8?B?bEdua3U4UkZtRGdFZ3kyM21ZT1RZNTF5NEQ5K0VvcTcwRjYzM1dqTUZPUEtx?=
 =?utf-8?B?ZXA3ZStXek1MOFRRRUdmelZQUzhOUnpOOWhNeWZVT3hsM1p3SFI5OFJTc0Q3?=
 =?utf-8?B?alBhd29oYm5jVG52WTlNUW5nUGI1dVM4dlF2STVJLzBFN205Z1cyVDZzb1Bp?=
 =?utf-8?B?RjRyUkd6N0xKdHFpQUtQYmpXNFdQUG9EOGtiWnRWb0pCeU94VkpPbmFIcmRY?=
 =?utf-8?Q?lbbywbri4PEPxOxr89wKjpwpUWLzm4GAElLeqId?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2lkRkUrdTU4aUZxcnRXeDY0WVQ4NzUwUHVuY1A1SmdWYjhxWmtXTk9adEdS?=
 =?utf-8?B?eEFSc2hVb296TVJVS1N1RUd5VE1MeC9CYXhFODRHT3JoTkxVeUJmSkhxajds?=
 =?utf-8?B?MkFHS3ZVeVcydzZRMkEwanNCOUVtQ2w4MlpOVG9MM3JaZFBIa2lkak5vV01F?=
 =?utf-8?B?cmVBN0t6TnBDTjFKZVdqQ0IzTm54WjcyUTFDOHY1aStKVmkxeDZtTWczZVpl?=
 =?utf-8?B?R2RrR3VhRGFtOUVIYWg0b3BLZUVxaFVBTld3VG1ZT1hsR0ZNV0U3dFIyTmlj?=
 =?utf-8?B?bnRENVA5ZVpHTGk4V0JyOGlhZHh5amh3VGJJSlBsdjlkRmJBVzUxRHZiNDU5?=
 =?utf-8?B?d3lHMjN2QmlVOXVVaExsbXFCSVdrL3FYNGRUWWZhc0k3aTZIQWtndHVuYVEx?=
 =?utf-8?B?ams2ZWJwQUduUUR2RVJHTE9sUG90ck5VQkVwZmljMi84RnV0djRGczRHTXdz?=
 =?utf-8?B?SVNCR3pVZkZYdHUvU2FKWS9oSTQybFNEdklGUm5CM0o0REhocXRYcFRqNjlP?=
 =?utf-8?B?WXkycXl6bklLTnJWMVpMbXJYZGp5VGV1bWFWUHFWUjZuTko5bWQzQWpldHQx?=
 =?utf-8?B?NDltaDJDaTRyZXBoYklySjNUVklJdmMwaDZSWkZSQmlqcmlOM3lQR1d2U1Rl?=
 =?utf-8?B?RzgxZWo3a0ZlZnYreXZkN1k4bTNWSzdWVmkrbnlNR3kwNzZwUkFjQnQvR0pG?=
 =?utf-8?B?Y01jZ1ZpTEhPSXFpc2RtL3U4ZFVrYTFPZWs4OHhjYlFCcThvSnFGNDNlbGdE?=
 =?utf-8?B?L1laaW5VaExheGEya3hKQzZYNE94OTA1Ung1bnhjZkgzcmNXdFMyNnR0MW5Z?=
 =?utf-8?B?Kzk1YzBwWHZZOWEzT0FUbUErdktkSGI5QldpaTNVQVBvNDBLNm11bmhVYlpI?=
 =?utf-8?B?cXVheVNtS3l3Mmx1R2VVNGJGZEZBY0lYZzlsbmhnR01xU2FXQkRGSzZrbVNx?=
 =?utf-8?B?N0lvREtqS2dOUGY2aThkSnNnK3hqckJPeUVCS2FoT1FtUVQ4TklNZ3ZZN2wy?=
 =?utf-8?B?YmxSYitRbFByNGJ3ZDFFYTNDeVI0WWE5OUJOQytUK095cm9Zb3l4TGVXSXlm?=
 =?utf-8?B?U2tJQXk4QUJVN01Pb2trUTNsZVRJazRkV2pWYUlKamcvUHFXWjZWREtZTk84?=
 =?utf-8?B?NGlQRzZnUC9JK2NjTDdZQmIrRVlKRkJCUi9DRG9aa2QrTzJ2VjcwcXpqQk1R?=
 =?utf-8?B?VGw0dlJDVVNYRlMzUU9uK1NUT3NDdGRrb2dYUjVjdlE5cHBVYzJESHJmZ3hl?=
 =?utf-8?B?cEc4TFZ1Z01UYk5KckVXbnNzbGtXREQyeU5RdWtJQTczci91bnFvWTNUbHI3?=
 =?utf-8?B?c0hQd3BMNStuLzRpY3c3UEhKSGlHNXAwVVcxSTgyNWJLN0I3bUlubFBhbE0w?=
 =?utf-8?B?K21nMmw1NzdkSmhRRk5kczlmSjJuS29qSFM2RGs2VUt0d05jbDQ3NXA0Rmpt?=
 =?utf-8?B?M2dZUVh3Tll4RWgxeGpxUyszUENTcVlhUUJsUnV1WGFId3ZaMXl5dVppSC9m?=
 =?utf-8?B?YkR3QXhuM0xOQ2gyS0hpWVcwU0dGck9VbzdWaTAzSURXa0p3dmxROFJEdCts?=
 =?utf-8?B?c2NrN1EwRmpuV2tzZ2dMeXFwWk5wQmU1UWt2dDhZODZNMW1RLzUzeFNBREJl?=
 =?utf-8?B?UThSY0MwREd3bFN5cFg4a3g4WkdnM2FVMXlQcmpibHhkMUwzai9WcHdxRXQy?=
 =?utf-8?B?SE9DSFBKRkpGOXBhZFZMTElDRWk0NGZSUnk1RFBqL0l5cUFLUXRaWElaRXNu?=
 =?utf-8?B?SXB2Z1dYS2htSThaWGd3V3RmRVh5K0p6Wnc1dFJ4anJEaG9JL1ptVHRxZHBH?=
 =?utf-8?B?NUcyejQ3WDM4V0JCRzJqZ083ZzdoWm9YYzA3K241S292c0FvQTNQNEpVcUxz?=
 =?utf-8?B?enJTMXVWZHFRZ1hRS01YaVorNTF3UVBLd1Q2NCtCRkxBd2xSN3lBQUxiSHFV?=
 =?utf-8?B?c3EwczAvTXIxbzNDa2g3TW56Yy9aQUtSaUh2bHZqcFAvSWN5T0J6KzVoaWVp?=
 =?utf-8?B?L3RBTVQzUmJocWhlOXArUFJCcVhEM1Z6YW16b1UyRlE3MEpPRXBub0hPcmFS?=
 =?utf-8?B?enFSeHNjQ0E1Qkp2U2RZQy83REhWMlRodnVQRjJ3bVp6T1JNQll2QlBXajlS?=
 =?utf-8?Q?Xip60IR/iqkeoSzNj9Cj7LFfG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 158c05b1-ec02-4155-ed97-08dd07a3e19c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:37:40.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQZMu/2HGLXN+FIlaDE7Nbxswqu2/z/higtD59pPsnzCrFnGgxFveN91ivlcrX9jYo8wi1iEOZeaN1u68GhnTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
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

Hi Umesh

On 11/15/2024 5:42 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Nov 13, 2024 at 10:25:48AM +0530, Riana Tauro wrote:
>> Engine busyness is supported only on GuC versions >= 70.32.0
>> Allow enabling/reading engine busyness only on supported
>> GuC versions. Warn once if not supported.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
>> 1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/ 
>> drm/xe/xe_engine_activity.c
>> index 7a2ae09d23de..fc34dcf3057a 100644
>> --- a/drivers/gpu/drm/xe/xe_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>> @@ -236,6 +236,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>     return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> }
>>
>> +static bool guc_engine_activity_supported(struct xe_guc *guc)
>> +{
>> +    if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
>> +        return true;
>> +
>> +    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>> +             "Engine busyness not supported in this GuC version\n");
>> +    return false;
>> +}
>> +
>> /**
>>  * xe_engine_activity_get_active_ticks - Get engine active ticks
>>  * @hwe: The hw_engine object
>> @@ -246,6 +256,9 @@ u64 xe_engine_activity_get_active_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     return get_engine_active_ticks(guc, hwe);
>> }
>>
>> @@ -259,6 +272,9 @@ u64 xe_engine_activity_get_total_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!guc_engine_activity_supported(guc))
> 
> Hmm, not sure my response to this landed on the ML. Sending again..
> 
> If GuC is an older version and UMDs have implemented the new interface, 
> we could return CPU time in ticks here so that UMDs will still be able 
> to use something in the denominator instead of a divide by zero. Busy 
> value will still be 0. Thoughts?
We could do this. But shouldn't UMD only read total ticks if they see an 
actual busyness? Busyness % will anyway be 0 even if we return the cpu 
time in ticks

Thanks
Riana Tauro
> 
> Umesh
> 
>> +        return 0;
>> +
>>     return get_engine_total_ticks(guc, hwe);
>> }

