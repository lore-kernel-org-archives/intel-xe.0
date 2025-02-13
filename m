Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C90C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 18:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB5810E080;
	Thu, 13 Feb 2025 18:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fngnf2tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C262410E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739470099; x=1771006099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FlqfndTEaOtJdh+yqPu2SR9FSkEZzuOeBKnbVrmwDsw=;
 b=Fngnf2trXNO0+LD+8MQDa9bU/f/8KBq+KHwJ7iX5RcqQChrhruF0j4iw
 hN9yklp62Ew0pCyu4rJ6MYNVsof1pxq/LJ8qxcCVXnIaWdEUd0nMMR1mK
 DbZiRLl5/T/8aqAX/3RIRuiF3hp98yoZdfpbLvhYE1db3WDM/U75FhPmR
 eM0/nmZwzkI0bKNjO68rk7Vd8vEwUVhO5i5joClmv2TcwN8eSeh/MYRUa
 tvhdTEtRTSy/vWo+GLQjp7m9Caz8eYv1viyTYUAfwxNTsZBj+4qkLWpCf
 UXAdLIzCAQAkc1AtOvMbvXypDaoyiHD9KYtQqNCB4XSf4b2DlEEYT0Xa9 A==;
X-CSE-ConnectionGUID: YltXpC6pQxaIX8JEaiNYiw==
X-CSE-MsgGUID: 1B+gBa4PS32hGimNbbjtLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51175479"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51175479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:08:18 -0800
X-CSE-ConnectionGUID: h+rHthVfSaar82oec5UJ0g==
X-CSE-MsgGUID: yyIHYdh1RcSlc2Xc1JkWHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113714747"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:08:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 10:08:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 10:08:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 10:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO3D88CReT1zjZx6is28PXmVrLNOzj/wiBNQHAAhrfk9AjeUvuUjmKSOU4pA65s3OQeAVpzuTp+w0Ft59Q2CBteHMUSU0MdBiQ214s1BUmFo+zccYnCrtRzX5LTIRkmmTIzBSvCTCMKWV9gkUTPhPC3BNeDmMbZnHnmqOMrb3OtD2zWzvhqLeg2GN66tgPKrAYl/yRHPX7r3FOOFMuM0nFdsDCj3SBMGH2mFlL3PUy6HChfAMkaPa9yRnB6bDahSBwi57hnuhX70GZDOCD9QrIuenQ5jF/CZBMiJl8nfs1MCQ8PmWjzvTA+DH1B8/aEiVdj3nbVg6L+CIpKY0nsDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wuOik2wJRiJgFFAmzhNRUXLBH/d6Ngw9eYeo9K8rZk=;
 b=aI5YYMiqO436MP3fwfQfeCINXoe270C0izb7oTB8BNBuToJYnMQx/bkINWKJeeN9CUxoM0uKqTSEhhD6bKyJQDzYDmV1Mo/5lqlJRRQT+LDnGm2hqDqeN2CjzhIdfu+ebD6T2EK4FtyQeJsDLtRP+US1ehZBqfuh3mfMasLMn100VrlzrrJIfZBfc3OiEK4EFN2Pp0JwwnwB6x4vqpVAegkBtEKr01mqvzMHxQdc3y6RTzaT9aOjOTjgWTtkJZoFICino7rLHAfkTVpm707H5HYnQvPfq6oeA/g0yjyeT9ZVTjgoWuUL3SzuSCpISZqKAmMwd96Rnwz1ElJ+cS5TJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 18:08:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 18:08:14 +0000
Date: Thu, 13 Feb 2025 10:08:12 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, John Harrison <John.C.Harrison@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v6 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
Message-ID: <Z641DK2lgevwBWX2@orsosgc001>
References: <20250211100952.322303-1-riana.tauro@intel.com>
 <20250211100952.322303-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250211100952.322303-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR2101CA0029.namprd21.prod.outlook.com
 (2603:10b6:302:1::42) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: c6defaf4-6847-41e7-fade-08dd4c596280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0VFRzdVall3SDdzMWZGM0NhZXNGQkJTaDBYTy8vMWlCTmpSU0tKTjltS0lT?=
 =?utf-8?B?LzZTNUI3T09lWlVpVzFjejRha2o5WkJHdVRwczgweGFuSXhCdmMraHZ5emRs?=
 =?utf-8?B?cWZrVUM2ZitQLytOZHhKTk5kekZLdFI5aHptQ09NZVV3K3M4VHl6TmRJYzJC?=
 =?utf-8?B?aGdaUmIwNC8yNzQ1THBvbS80QW8vUWx2RTVlMkgvbExUTjNMMjlNS1VyN25J?=
 =?utf-8?B?WFRtMDlYSFcvb0MwVm85aGIweHJZd200Y0RyK1FraUV1RVFxV1RQUGNZTGdt?=
 =?utf-8?B?RFV2OWpURnFDb2JWU2JvOSs0VVNVM25vNU8wNHR2UmZPYnN5eDlyMkxLWisy?=
 =?utf-8?B?elhiUGhTalRXQklrT1VOcHZGTnlJVU5QbEVnSTVMUnZhdTdoYURIY0w2cWFW?=
 =?utf-8?B?OE5GTUJFYVkxL0NsM3hnZFZnYkdtSUdWYk11OWF0SGEyamZHbDNrSWtPSFVn?=
 =?utf-8?B?SGJqd1lqYVhFR0VrY2xRUWJGSG84Q1NoLzJBNE5KQ2lVRWQySHVLQTBjcmEr?=
 =?utf-8?B?VGVJN2toVFpLTy9LT0RTUUZMa09peTVsMnp3bmQzQXJhdHpnaDBGT1ZKOVhu?=
 =?utf-8?B?d2JjQ1FBaWxlcnVPT1JtalI2aW9SREY0WEowTUM0b2RDK01GbHBSNHo0amVZ?=
 =?utf-8?B?Y2p0U1ZhMzJjeW9SbTBxdkVGZWRCdm9yd2RwSXp3NnlCa3JFYUFJdVZOWE1W?=
 =?utf-8?B?aWJhSGw3aTdCTXo2TjZvVXFCUmlLbzViS0xWV2MzNHFwTGYycFVrQ0VWc2Qr?=
 =?utf-8?B?TUJKZ0tKTXREVXNGcWZrSkFaTzdVakhkK2xoaTdqMDA5V1pvMUt3MCtXOWtX?=
 =?utf-8?B?SUYwUWltUjJhK0VCekxkTHVHVEF0TXY4Vk5QUUdUTS9lWnk2SXBZOUU0ZUM5?=
 =?utf-8?B?YVVNNS9BUDdVK0RYdWR0bmEvRWhHTnUyTHA4UW9sMUZWeXRiRTRFb1RuMm9M?=
 =?utf-8?B?cTZnVTh0R0hHU094S3o3MjJIN1VMaHpOTFhzTjFDTUljZUUyVW0rcU0yVFdh?=
 =?utf-8?B?ajZrMU5wcklCcEVjdDRlUWlSbHMvRUtFckdOelo5YkpDZG9HU0JyOWhTVWIv?=
 =?utf-8?B?MUV0aU1CeFRXZ3FzZmhNblZHUGl3SzB0UllUVzAzK202a0RQL1FJUVNHVW9X?=
 =?utf-8?B?dGYrT0lUOVdBV2pXZjJaeHNDV3VyeTZSQ3JjUGN1end0NDdydTdOSlJGeEJ0?=
 =?utf-8?B?Z1JTc0NXa3lZNUxSZUhHOHNaa0o2SkZ1VWpGbVQ0QXJSczlES1ZraWhoMFlB?=
 =?utf-8?B?R2pDYjJNN1VYbmlPcjZPaUlrN3dQaHBQbjA0bTh1UjNyVnRnMGtJSmVyVi94?=
 =?utf-8?B?cHhxalpBM3ZUQ0pQa1FvaG00Ujl2RXoxYmZQYlhPd0xqZEdmMHpVOFcvYUVo?=
 =?utf-8?B?R3MwbWFqNTdYalhBZkJQTStmM2JMNndUdTlsNXpKZy9zNnNNYzd1QjR5OGRP?=
 =?utf-8?B?eHBzVmZxejhYZUtCcm03MDhUQVRtSDlKVjhYdXhGZENFM0lUb1FvM2NOZjEv?=
 =?utf-8?B?cmJZQk10MVV5L1Q4Z1RJY1ZMVHl0NDB6TCtZL0YyZGdsV1paQXhpZU1GSTBk?=
 =?utf-8?B?R1lxTCs2L0lGK3dDR1lBS0NBM2Y3Qmt6akVudEZQYWxzZG9HNmRvckl3RW1p?=
 =?utf-8?B?ZmJpU1U5Z2ZDREd5dHUxRHAyY1VmQkVuTDlpeDJIa1BBOGtLU0swTi9EYUdj?=
 =?utf-8?B?MFBZajRoeUlwQitWR3M5cFQ0VGF4RHM0MmtML3NLUTdjTEhSOXQzdTJjMnRG?=
 =?utf-8?B?ZXB5KzZiRlIzbmoyK0pVQS81N1cvUnlzNGpYclovZk9aSXZTd01RckVVbk5W?=
 =?utf-8?B?VEdRbm1XMWhZWC9YZ2g4cWoxNnFIUEYrVWpqWnhxRk5vOGxuUVUzc25VdjM3?=
 =?utf-8?Q?SkrCb2H+L5OD+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNpdkJUSTRMRDhubVh6NVRieVM4dkI1Z2xqMFUzR2tVUDNzMXFYeEN6eC9n?=
 =?utf-8?B?a28xblJJNmZMMTdEb21XNjVTWEJzdTNFMTBZQ2psb3VNSzBid3hTVGxDbzU0?=
 =?utf-8?B?NUVlRjVWcGlUNHRtanI2TE5PVDE0dkQ1aWptUEdWQnNhUk5HQkY3TmkyZUNI?=
 =?utf-8?B?SWFRdFRXSkJsSEdYS1F2bmU0ZElHTldhWlArWjc3QkZybjkxRFRqeTkxN2Vq?=
 =?utf-8?B?M2tIMktqa1Y2MGVKMHdYQ0x5VlUyU0lSellJRXk1akZOSWE3SUZrMUpBZ21O?=
 =?utf-8?B?S1hTbkdSY0lKSHdVZHBLMElUMGJkZ3hTWWRLcWhzVkFEVi84cXJJYkZwL3JL?=
 =?utf-8?B?dm5JMHhWZEJuQVFtT1ZqRDE3bW50WWhUcHNlTXg3V2pWTDZXeWRGdkZ3VDNw?=
 =?utf-8?B?bkkxQ2wyMEMwSXh4eld5eW1zZyt6cGp0Z0lZUi9obGUwNmRUSEZ1eWo3WkFz?=
 =?utf-8?B?bmNEdWRJU3VRajZVWm1yRkluQ25Wdk1kT244MEt0NDlnaVliUHk3VzZ1Wk05?=
 =?utf-8?B?TjQvb1pEMlFGWDFIekpMTVYvZjVQY0ZzTWZSM0R6eFViV0JEdmFQeDV4Zkpr?=
 =?utf-8?B?WWVBcEVRcDhCbDZUMUF6aGE0OXdPSEJUeDZMTE9KOVIzU283UnpiSGdOTFpB?=
 =?utf-8?B?YUZxWExxTG9RTTJqVTFNSjRueExaVkN4YnR1Mm5FMlRtZmc1ZzhlUmlQa3hQ?=
 =?utf-8?B?L3d3d3pRVzhmd3ZabUFCTEdwSU5Db2hWUUhLa0taQWFpSWpqYndlL2xQeS9w?=
 =?utf-8?B?Zlh0QWNWK0o5QWpKOFFhQVZPTEo3SDRhMlluWVliM01uR0UzK2NiSEhxa25G?=
 =?utf-8?B?VEVjNUU2bTdkeFJoS0N1Qk9FeSsySWdLL28xZUNHa0pQMkEyMjVRWTN5bWZn?=
 =?utf-8?B?cFpYQjNDMXo1Q0syamIvUVB1d0t1REExTWExc3ZQOWV4aS9hOTFTcVprZFFw?=
 =?utf-8?B?MnBNU2RsdmxaUFJ5ZHNMZWpBOG9RV2tqTEFIODhxUXJ2MndNMWNKYjBJSWNt?=
 =?utf-8?B?RXVRNnp6UW5rR2RCZ0FSMngvNHRZNVROQ0FlR1dDUnQyRlRaRXRoUU1TdEtj?=
 =?utf-8?B?VmJwMk9IRGtpOHNORFBwbTFvYk1Ec3B0MlpWclpSRXJsWGlQOGxRTTd1YkN0?=
 =?utf-8?B?djBSZnk4WkVicGhGR05ZSUppczdsNk52bDNPc0RKYXFXSWc1UE5IVm5jbnBv?=
 =?utf-8?B?UGZjSGh4NVc5OWxqUVJNVDMyQ2EvUUNDYmlaenkwdjVYVTJ3cUp1ejlDMHpF?=
 =?utf-8?B?V3pPSTR2SHg2a2FmSno4KzU0Ti8vQkhXZXoxRzhFZ3hSbUJOdWVQRnlla1FY?=
 =?utf-8?B?ajZqWUp3ZnFMVFdjSFdWdk00L1c5ckF2ZDc5bHpITWM2OFVXWnFobnF1NFN3?=
 =?utf-8?B?am5tUW9scCtUU0c3RDFxY3kyQzB2eXJ5N2U3MXRBRThkMmQ2ODVySi9hR1Nr?=
 =?utf-8?B?VDBVanl3WmIxYi9vTDA1ZjVPdE8yMG84VVFPV1JUOHJNL2gxZkNXUWZraWta?=
 =?utf-8?B?ZlVON1c4ZWpvNWduSkJsS2F0Q2N3M25iaGdFNDFYK1cybDVjclMyNU00RGVq?=
 =?utf-8?B?WENyd3VrV3RseWMvbVN5bkhqT01HMlluQUJpU3ZDbGFxNk9TVkdWaVhOMTBR?=
 =?utf-8?B?SXgveWFkcVZiMU9rMFJyMnp6MTBhaldOQXBmb0JRdUxEZlpsWUxRUDVWR1A0?=
 =?utf-8?B?RURWb3JVQ2xTZEZHdTZ2SGJMYUdDM2d2VW1QVklCRVpsREkwRXlsMTY5Umh5?=
 =?utf-8?B?UTlnZHo2UVBCaUFvNmprNGFQL2xtakNEZ3VTcEZJSjFWYkdCbFRnL1pHaHlU?=
 =?utf-8?B?QStVT3ZDSWFhR05GbG02WXNidk54dnFyaGduNEFLaStFdlBpY1ZFMERhVE9C?=
 =?utf-8?B?bTVudndTYVdsYWY4NHFoc1lnSGgwdlFCRmlrUjM5cnNoWEJQd0oybnhTb0Jn?=
 =?utf-8?B?eDVtK0dGUW5VdDVkcmt3R2xNUmx1OUdQYzdYTkpIR1JnTEdKQ1J5dFMvay9N?=
 =?utf-8?B?MCtscEFWcXZoM1FTZmtkNlZiWW5zQWR1ZnBZMXFndFR5eCtDbFY1RXdQRWdH?=
 =?utf-8?B?S0p3Z0hXZm9xcEh3WGVHMnlCWXYwZWUybnlFUFZxdmU2dVZJdGZHSUYwckhG?=
 =?utf-8?B?aTVZbzNKOGFYYVpBMlhQY25GVE9OVWNBSmVDSGF1UEdwVDdIaUd4N3VGZVpN?=
 =?utf-8?Q?gPUY3k5XtFKd9aGe9cJBh2I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6defaf4-6847-41e7-fade-08dd4c596280
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:08:14.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmqJHZT4qXucvB5pvCboZXhre4h4Cyo6FK6WMBZTMR9MeqtcTwvkhJFNVLZZ2mZfvjpayxJs9kf0ZHJSbYIK6gavZ/8gfXvqkm6RhgOnJoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Tue, Feb 11, 2025 at 03:39:45PM +0530, Riana Tauro wrote:
>Engine activity is supported only on GuC submission version >= 1.14.1
>Allow enabling/reading engine activity only on supported
>GuC versions. Warn once if not supported.
>
>v2: use guc interface version (John)
>v3: use debug log (Umesh)
>v4: use variable for supported and use gt logs
>    use a friendlier log message (Michal)
>v5: fix kernel-doc
>    do not continue in init if not supported (Michal)
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM, 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 49 ++++++++++++++++++-
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
> 3 files changed, 51 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index a424527eddb6..ed4080b7493a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -95,6 +95,27 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
> 	xe_bo_unpin_map_no_vm(buffer->activity_bo);
> }
>
>+static bool is_engine_activity_supported(struct xe_guc *guc)
>+{
>+	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>+	struct xe_gt *gt = guc_to_gt(guc);
>+
>+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
>+		xe_gt_info(gt, "engine activity stats not supported on VFs\n");
>+		return false;
>+	}
>+
>+	/* engine activity stats is supported from GuC interface version (1.14.1) */
>+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 1)) {
>+		xe_gt_info(gt,
>+			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
>+			   version->major, version->minor, version->patch, 1, 14, 1);
>+		return false;
>+	}
>+
>+	return true;
>+}
>+
> static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc = &hwe->gt->uc.guc;
>@@ -251,6 +272,9 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>  */
> u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> {
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_active_ticks(guc, hwe);
> }
>
>@@ -263,9 +287,27 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine
>  */
> u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> {
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_total_ticks(guc, hwe);
> }
>
>+/**
>+ * xe_guc_engine_activity_supported - Check support for engine activity stats
>+ * @guc: The GuC object
>+ *
>+ * Engine activity stats is supported from GuC interface version (1.14.1)
>+ *
>+ * Return: true if engine activity stats supported, false otherwise
>+ */
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+
>+	return engine_activity->supported;
>+}
>+
> /**
>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>  * @guc: The GuC object
>@@ -276,6 +318,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> {
> 	int ret;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return;
>+
> 	ret = enable_engine_activity_stats(guc);
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>@@ -301,10 +346,10 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> 	struct xe_gt *gt = guc_to_gt(guc);
>-	struct xe_device *xe = gt_to_xe(gt);
> 	int ret;
>
>-	if (IS_SRIOV_VF(xe))
>+	engine_activity->supported = is_engine_activity_supported(guc);
>+	if (!engine_activity->supported)
> 		return 0;
>
> 	ret = allocate_engine_activity_group(guc);
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>index e92d2456698d..a042d4cb404c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -12,6 +12,7 @@ struct xe_hw_engine;
> struct xe_guc;
>
> int xe_guc_engine_activity_init(struct xe_guc *guc);
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
> u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
> u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>index a2ab327d3eec..5cdd034b6b70 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>@@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
> 	/** @num_activity_group: number of activity groups */
> 	u32 num_activity_group;
>
>+	/** @supported: indicates support for engine activity stats */
>+	bool supported;
>+
> 	/** @eag: holds the device level engine activity data */
> 	struct engine_activity_group *eag;
>
>-- 
>2.47.1
>
