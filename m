Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0213BC021B2
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 01:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402810EA07;
	Fri, 21 Feb 2025 01:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZxorRwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6710EA07
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 01:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740100462; x=1771636462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p3oBzT2pAwo9OM4jJgbFLlRcJUtVKFx4LrRHvtTjHxY=;
 b=fZxorRwWYkTLFDghCGb7f/TbIg/SaPtL3+3EXxnG6IYNYxIey1VnXHEb
 q9G2AuIytHK0jTzqi72ZPZAa3iBwPShtOhYQzhB2/nnt8xz5+kqappDD9
 ef/OV+z1gcRC3XMsRnT5AlEHShWfS9UXQ8ckhivUdlNZjCt+1cExWrb+F
 rZta97Dl4Ycp6TwJoyDW292J5A1Ld4yrmLTP7iGoyMFdOB4oNO35Tp0EO
 X7Hf6rqZNkQp3NYssGdSuFrgVpyIM6CDDz5hHGbWf92eTp+gJkg1Nn7+E
 Zb5Ufn+zDzGGzlfGyZXxjXuCci7SLYepfauVFUj8+S9r1vmIohZdsn2JH Q==;
X-CSE-ConnectionGUID: x0m3BxKFRSmjydstuIZPYg==
X-CSE-MsgGUID: g6CKPaQcRIenGWHh3iPNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63384237"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="63384237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 17:14:21 -0800
X-CSE-ConnectionGUID: cbrqqTDfTTOZc6K8gAK56g==
X-CSE-MsgGUID: +CIIrtXkSH+y0dWDEnp00Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="146083862"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 17:14:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 17:14:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 17:14:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 17:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8d4CkKF0lQz9cprVd4pHlOjAYYLFTP8ZvObk/fyck1/GZZbskJtSxy4VWFsTIJAGNRlt8K2AmlN7TfU68p8Y4asDUJQ7v/B8OE1IFX5ggADc0r5ltrhD35GHTB+S+AljuD+GhCoHkBLxrzI0kPCK+QI0cuUCam0h9gbeO9ex/5NAoRL3wNI9zvxOPxKa90lgr42Hud8dWkFl2sx/sYnaHc026oDXMxzOw/UbWPCwv8u7DI00aZJiV7ZWOebv3seWgmC6BN14wSbr5ebwuDxUshXqJ/qNzFbiGnnwGoDgASBE/j86GMtHTtYhyvJ/pJqfjx/vIB9jOY+97+ZsGeOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnfEXsHJ1SVFyAh9H69Kwz4yC6A/prVd1TK7r/qhwnU=;
 b=x+6EOPIFQz6RrusHK+Xlu9MMqy7YM9uDPsY3+yqfMeWPIEh9h9smTefdSUPS7jBj9l8Kun9yFBCTPhP0LMwm+zYUgZi+ZI23wyphLd1kS/V6nUUR8BNhDCMAwF6xFI+GKApM4A0v3D5LIgHxqQU/HULwW61E4jYuqQpTiW04aPuYRrsrQE/9OjoiktIKoQ2SYyvysJNylW5flf+/cOLWx1YAN50v5BlPxhEnBOAq2lVXZGm1EjA9w3kRBCEuWxt3M+2F6c9dVOX3yUtoIv4merI7W7Sg60tACdFQm9Omn0zE9lQM88XFVRGIc/E/ztsn0ph6+We28qv6qpHQ3ELZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Fri, 21 Feb 2025 01:14:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 01:14:09 +0000
Date: Thu, 20 Feb 2025 17:14:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z7fTX2X1qrdcv0fb@orsosgc001>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 269ec96d-d95f-474d-2778-08dd52150b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGsrclZvZysrVlM0STlJbldSUkk1aEV2T0svdDhFNjZIRkRiSUJqNnJYMXRo?=
 =?utf-8?B?NTRxK1BHZjYzV1dmNmNtY0NHMDFkam1mNFhhanM1V0RZbk5VZkcwdis2NkJt?=
 =?utf-8?B?d3hjUktsNFRSd0xCd1FRSHlaZ2pLaE1KQ2pCSndMYnU4TGdxS3ZwTnU4TTR0?=
 =?utf-8?B?Q1FiTG5NRFIxSUlzLzhHSkR4R3JVcTBmUU0wSXpCLzVjYlUycGNGV0NEK1k4?=
 =?utf-8?B?VW45MnlLdGlROThTTjNUZ0xWc2RBZmZxdDJIWGNIa1c0aVNKZGV4U0ViT0dS?=
 =?utf-8?B?N2VEVXd0ZW1NaUlIbnNrTFpuTHdjR0N4cml1bU54RkFBcEg5OERvWm1WRVQv?=
 =?utf-8?B?RWJ1eVhTay81QkN6TytOWGdvRXF1K1JQYjg4WGVVeTRSUHhlbWVHK3dRN3lL?=
 =?utf-8?B?bkNhRVkxVEdoMFBGN0Nsb0NnZXB0c0NHS1FPblZFNEJRZ1Zld0RsanVUTDRs?=
 =?utf-8?B?SG9LUTdXMS9aWXVxaW5HbnRrYzF2TUZtMFhFckhDalo1T2FuK1hHcTBqeElm?=
 =?utf-8?B?alJCKzZFMG9qcWdPT3BkK0FyNHo4blBRSExQVGVmN0p4dFdTdTUwL2FjSVF0?=
 =?utf-8?B?czlSL0huRU0ySmJWRHpXTE9nVUNKbHBXaUYwR01uWERocGl6UDZBTGJyWjVy?=
 =?utf-8?B?ZWE1bm9tbTRncXJKZk5sU3pIWHRuYXlWaW1ibzMzUXo4V29QZzJWZWg5RGp3?=
 =?utf-8?B?WnB5d2x0ZHJmS3Nmak5KQ1VCMFpTbnZ4V1VsbS9HQ1hLRGxGdHY5NzVlOWlV?=
 =?utf-8?B?UU1DWGhtc2k4ZWRKMkFvVm1mVkVWK215N3hiZndzTmVIRWl1ZnBtYjFTbWNF?=
 =?utf-8?B?RWYvamNoQnIrOXIrZjhhNDRyZWk3MmhiRE1SZFFRSUVqbTdOelBJKzhMRzRy?=
 =?utf-8?B?YUg5UWkzc1JacDVpaVI3MlhWSnlzWS9SY1I2dzIvVE13NkJZMzBQT0s3R1Bt?=
 =?utf-8?B?ZVFNeklmNC8rb2FmcUw2OVhOSWxra1FkM2JQblRYREIxVGtnMlRTR2pDYkJL?=
 =?utf-8?B?SmQwTGRSUjgvN0tBSVpVaFUweXY1R0pJdURQd0J6ZkV4cm9PZVhnVzF4UEZL?=
 =?utf-8?B?TTBkdzRxZGYrZmVqMjdYYVc2RHR6VURDT1ZEZW9Uc0xjMHpiK21QQmhtcGQv?=
 =?utf-8?B?a3FzdXZmUEtYYktHcUt4M1M0Z2pGbHdYMnNQNm5XUlk1OEZTaHBGeWZseEVU?=
 =?utf-8?B?UFk5ZmhBYUVsMlVMbDdJaEo4a3VmODZZV0p1YW1VbVZhY01VU3l5bnpsOEJL?=
 =?utf-8?B?dVhiQmJIQlRTWU5TcTJPalhqT3FDMHF4SHRPdTVubndocitMcTR3bys0SExK?=
 =?utf-8?B?ZGJkSkx4N1pxa0NQNXdZdGlGYUNFTk5uekVqZDYrcExZTHF0NXd5OURSczFI?=
 =?utf-8?B?TWY0VE1FV1BOcDYxaDI4WXpqeHBjWVFlTE0vQjhJci9DdS9oSnBTS2FsQ2NC?=
 =?utf-8?B?dTBSZ1RPOGNSQklOc096amJwQ213Mm9NekxxZjZSRU5kNFBpTUJNRG9Nd2t1?=
 =?utf-8?B?TStWMTMrU2svK1RXbGVjNmMzMElTR0hlUmJzRVFqOW90bVkxWmFtOUtPdVRG?=
 =?utf-8?B?VjVaaUwwWTlDQkM5WnY4dzc3N0NidExFdjBXc0k0M2ZNdmlub1FaMy9xL2JC?=
 =?utf-8?B?Z0x3Qm1ZMjNsT29YQlhzdEt2OW02cDYwSm1LVDVUaElaUDNrS3JnSDVEc2hP?=
 =?utf-8?B?bTkxS0RGQUVOQmRXOE12VWZVRUtBRkx0WDQwbHF2K2RlY3FrWUVhU0VMQjJ0?=
 =?utf-8?B?NjllR2lpaXRVUG5uOGg0Mnc1OW9mMSs3akh4QmpybkhodnBWcmVqUWx6M0pz?=
 =?utf-8?B?azAyZE53alRDcEY2bW9Lem5rUER5TnFNc2JQYkh1WGZSVE9BR29JaW1KNjFh?=
 =?utf-8?Q?zaLVxT2+ADw4s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWNlb0o1WUhDNUorcWx1RHByTDdmOTlpSVV4c0lOZzI1U3hIdFFqaHRKbW4w?=
 =?utf-8?B?V2lTRk5mMWh2OGVuQ3ZuVVdQdDUwaG9TcVpVUDBtTjlBTWtITnM0bEVZYldS?=
 =?utf-8?B?RDdtT3dEZkgySTB0RkpKcGhYVDI2bU1IWGxrQ3Z2ZWh1QXpmVXk1dCtTYStT?=
 =?utf-8?B?MGw3dDlNSjBDUHN5aGZ3MWx4bi9ML25BM0NsdktocUUxUzh2ZlQxN05YLzBk?=
 =?utf-8?B?a2RhUnhzR2lyV3lZTFlQWEFpeVUyemR6SXRQanc2R2ZNYWt3WE5EL0pOMzRR?=
 =?utf-8?B?MDJKSUhDMmsyeDM4WE4yNnF1OGdPWTFuYTR3cUlXU1B0Q2JXbEw4algyT2tV?=
 =?utf-8?B?MU5qYWxRWDBKNWF2TkorSmFnYmlpc3lYM3AzaU13eTdGSmMwajB5dU9MOHJj?=
 =?utf-8?B?aC9RUXdhUlg0d1dsNm1DdGFqckNIaitVMXJoY1pZSG9wNEl5eS9ia0ZUbEs1?=
 =?utf-8?B?QlExeUgwR0VVemVUUXc5M1VNYmtpd3ZVNjd2QVpsMGNRelduMFZodm9lS1c5?=
 =?utf-8?B?QmpFeTl5WnVRNWIwd05QSXhqUnB6TG5Fam02ZTlmUnFORU9VSXZxbWQ3Qm5i?=
 =?utf-8?B?SkI1YXl2ck1qNk5sejhZNzVXQmdBMG0yVXZuS25JVlg1QTI0OGR6ZXBDVExH?=
 =?utf-8?B?U3V1TnZCNGd3SUFxNzdQNmVTRjVCT0cvRUhaMVF3RjVwWE43OWZ2NUgwc0JQ?=
 =?utf-8?B?dFVZYnBOc1Yvem1UMlhNZUx6L1p3Mlp2TVd4RXQrU3NqRG5YeDZxaktNdTc4?=
 =?utf-8?B?RXNoQVJLM1h6TFM2WmI0S0dacnFhSzdmK2tCb3hVaEZWRWdvcEVqMlBPL203?=
 =?utf-8?B?MjM2bHJkck83UVFzYVlZRlJZaFhYbmhybHVNeUtWa21Za3Fab1kyS3dPR1Zs?=
 =?utf-8?B?Wko4RktIbkZHcGtnd09vN1N6eEVwVHd2TkMwU2xoWFpUSDJxM3dDRmt5REk4?=
 =?utf-8?B?cnhuMTEvVEg4Vjd5NnFNbEN5OVFmSXpVYklaeVBEMndzbE1CblRXR2pocjdV?=
 =?utf-8?B?aVRxQk53L3NVeTNVRVFJdEZFa3Z3SGNJTjloUWtZOEF1aFJjSEU1Uk81bWZE?=
 =?utf-8?B?LzRpTkJmTG53M1JNb0JncnN5UTdnMEdvYlpvVnZrelpST2E0YmsvWUI3cndj?=
 =?utf-8?B?UnNmb05lTmY0NDN2WTlhQmdPY1M1eGVWMXFCZ1NvQ2pvd05TajlwVDhuRHl3?=
 =?utf-8?B?dTEwNGRLVmhwVXN6V0t4S3JSN2lnSCtodUtmcG1lYUZwejEzOHAzWDQxamxI?=
 =?utf-8?B?SFlKNFVsSis2Qk15MGlIaytpbEt6TG5lam5MdkdkRmJSTGZvcEYyMElBWFc3?=
 =?utf-8?B?a3c2MmV1eW5vMUxHb1N5Mk9XUGowRGRqWllFci9UQ1RYU3hYd2xlMTY1SVdn?=
 =?utf-8?B?Sm03Z1hYQmpOMUxoN1RjSnRpNkhnRHhseWJldjd5bHpNNDVERmZYWS9PZDdy?=
 =?utf-8?B?cTFYTXBYV2wzUnUyQXFqL1Q1UXBGZVdtUFc3cnpjZHU1MVpmb0J3UzN2elNC?=
 =?utf-8?B?NHRMTmRDV2p6bld4RUNya0xjcjl4SEVnN3N5KzV4Z1ZhSjhHdWxXeGVwMFBm?=
 =?utf-8?B?a2krNXhhb1RWRWZMc041Q2NTcHJsdStrSmtMaWxucTU3UzF3YVRrOTNiSXNK?=
 =?utf-8?B?eFd4VC9DVjFYVzcrSWRLOC9wYkhCMzVnSmpYbFBoaWtlblFSd2xsbWVFbUtQ?=
 =?utf-8?B?MU40d2VUaUhKMEJvR1BHNVltZXMyL3FEUnRDSFlGdS9mZnhKeTZBMHAyNGQv?=
 =?utf-8?B?TmY3UEx4WjVydDNFM2RjbVBYOC9UUU1iZVc0STZ1UHVrelg2OHF6cHJKclVT?=
 =?utf-8?B?cEJ6Tncrc05VaTdRd3hFZ0gxeGFiWHdoMWxJWXJIQ3RtK2RUWFpQbWRWLzZ0?=
 =?utf-8?B?REpPdjdlcWV6bFE0a09UUTF0dE9Ddk5Pa2V1bXNuZW5VcSs4QTcremdkM3ho?=
 =?utf-8?B?ZmRaclBSR3hFbVV3YzZrajFFbEl0RFJsZHBYaExpMUJlb2ZmNU1TcEhqeVpr?=
 =?utf-8?B?M0pVVTJoekhrelVzR042N1ZpRDdUK3hBdlVyWHloQ1VhL3ZjWE9sdFJHM0R3?=
 =?utf-8?B?L2h1aFNxdEZnRnF2SC8xZTAvL3Vka2hCZzlrMWptZ1pCaFdzanhXOW13U1BH?=
 =?utf-8?B?OEdHZExZVlVXdjRGdXpPUlVuWldiV1BRclRjTnJNQnVtbVh6Ym5tZXZrL0pw?=
 =?utf-8?Q?iLkdKiIsO2huwgiyZdU6b0I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 269ec96d-d95f-474d-2778-08dd52150b5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 01:14:09.6922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnDAHZO3ly5bLKBUmTyg4zfckkcwbJp3BEqIV4881u2n/h59OtNm1hdawHNW/wX3ZaxJi8U083Ua8vufC8nU1FIPoPIuii/4d8Is50TQdjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7904
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

On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>When the engine events are created, acquire GT forcewake to read gpm
>>timestamp required for the events and release on event destroy. This
>>cannot be done during read due to the raw spinlock held my pmu.
>>
>>v2: remove forcewake counting (Umesh)
>>v3: remove extra space (Umesh)
>>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>2 files changed, 54 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>index dc89fa6d0ec5..67693d642f5a 100644
>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>@@ -7,6 +7,7 @@
>>#include <linux/device.h>
>>
>>#include "xe_device.h"
>>+#include "xe_force_wake.h"
>>#include "xe_gt_idle.h"
>>#include "xe_guc_engine_activity.h"
>>#include "xe_hw_engine.h"
>>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>>	return hwe;
>>}
>>
>>+static bool is_engine_event(u64 config)
>>+{
>>+	unsigned int event_id = config_to_event_id(config);
>>+
>>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>+}
>>+
>>+static bool event_gt_forcewake(struct perf_event *event)
>>+{
>>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>+	u64 config = event->attr.config;
>>+	struct xe_pmu *pmu = &xe->pmu;
>>+	struct xe_gt *gt;
>>+	unsigned int fw_ref;
>>+
>>+	if (!is_engine_event(config))
>>+		return true;
>>+
>>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>+
>>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+	if (!fw_ref)
>>+		return false;
>>+
>>+	if (!pmu->fw_ref)
>>+		pmu->fw_ref = fw_ref;
>
>how this shared fw_ref is supposed to work for multiple
>perf_event_open()?

Agree, not ideal, but I don't see an issue. This forcewake is only being 
taken for engine-* events and the domain is always XE_FW_GT. Looking at 
xe_force_wake_get(), I see that it returns a mask of domains enabled. In 
this case, it would be the XE_FW_GT. The return value is just stored so 
that the corresponding event destroy can put the forcewake.

>
>fd1 = perf_event_open( ... gt=0 ...);
>
>	event_get_forcewake()
>		pmu->fw_ref = xe_force_wake_get()
>
>fd2 = perf_event_open( ... gt=1 ...);
>
>	event_get_forcewake()
>		// get the forcewake, but don't save the ref
>
>forcewake for gt1 is never put. 

pmu->fw_ref should be identical for all events taking this forcewake.

>
>
>Or even multiple perf_event_open() for the same gt: we will not handle
>the count correctly.

The count is actually handled in domain->ref in the forcewake 
implementation and note that forcewake is always taken for every engine 
event that is being initialized and hence always being put for every 
event that is destroyed. This code is not refcounting that.

>
>In summary I think this fw ref needs to be per event... an easy way to do
>that is to use the event->pmu_private field, to be populated on init...

I am not opposed to that since that makes it future proof so that we can 
indeed have events taking different forcewake domains, but let me know 
if I missed something here since I think this alone should still work.

>
>>+
>>+	return true;
>>+}
>>+
>>static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>			    unsigned int id)
>>{
>>@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
>>static void xe_pmu_event_destroy(struct perf_event *event)
>>{
>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>+	struct xe_pmu *pmu = &xe->pmu;
>>+	struct xe_gt *gt;
>>+
>>+	if (pmu->fw_ref) {
>>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>+	}
>>
>>	drm_WARN_ON(&xe->drm, event->parent);
>>	xe_pm_runtime_put(xe);
>>@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
>>	if (!event->parent) {
>>		drm_dev_get(&xe->drm);
>>		xe_pm_runtime_get(xe);
>>+		if (!event_gt_forcewake(event)) {
>
>if you group an engine vs non-engine counter, this won't work I think.
>Can we test it?

When you group events, init is called for each event. From the Xe PMU 
implementation perspective, grouping shouldn't be any different.

Regards,
Umesh

>
>Lucas De Marchi
>
>>+			xe_pm_runtime_put(xe);
>>+			drm_dev_put(&xe->drm);
>>+			return -EINVAL;
>>+		}
>>		event->destroy = xe_pmu_event_destroy;
>>	}
>>
>>	return 0;
>>}
>>
>>-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>>+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event, u64 prev)
>>{
>>	struct xe_device *xe = gt_to_xe(gt);
>>+	struct xe_pmu *pmu = &xe->pmu;
>>	struct xe_hw_engine *hwe;
>>	u64 val = 0;
>>
>>+	if (!pmu->fw_ref)
>>+		return prev;
>>+
>>	hwe = event_to_hwe(event);
>>	if (!hwe)
>>		drm_warn(&xe->drm, "unknown engine\n");
>>@@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
>>		return xe_gt_idle_residency_msec(&gt->gtidle);
>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>-		return read_engine_events(gt, event);
>>+		return read_engine_events(gt, event, prev);
>>	}
>>
>>	return 0;
>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>index f5ba4d56622c..07c4e592106e 100644
>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>@@ -30,6 +30,10 @@ struct xe_pmu {
>>	 * @name: Name as registered with perf core.
>>	 */
>>	const char *name;
>>+	/**
>>+	 * @fw_ref: force_wake ref
>>+	 */
>>+	unsigned int fw_ref;
>>	/**
>>	 * @supported_events: Bitmap of supported events, indexed by event id
>>	 */
>>-- 
>>2.47.1
>>
