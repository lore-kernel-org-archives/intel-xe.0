Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3242EC2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 19:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACE610E280;
	Thu, 20 Jun 2024 19:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUWBZdWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D3910E280
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718910916; x=1750446916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IcG4I6eKBD0KJEFceW0kChgHNeCTImw8PjY6j6wKuug=;
 b=VUWBZdWlgWg9ebE30WtDVj+5c4BzMGS53wwCylnvBH6tmvP+osjycjWo
 JVbKwhqs2G/HCQpd76ljjpQwhJju2lmh/+RvHf4tDnrX+NE3KjmHkkpx7
 9gCTfa5JvTT+lcVdJMIjcn0m8g+dS2HF86AkYi4pnK8XWMC490DczJBTL
 KVM4IpbvXcmqr0k1Xk86Zaw/a7zsOhjKEYV1WGug76wEHQYcds1dEWBaG
 AIJO6ZBY2bsfECov2eGPnmZs7Ad8v6C2+2MYurVpXymtlFEY05I8d4o41
 cN/ijukfGMUrUhsndPm7XwzJH56OToef2N5JLbjhcMrmQpV2n9Hi90Wap Q==;
X-CSE-ConnectionGUID: jLF+nlonSTmuHmZgM88NYg==
X-CSE-MsgGUID: KtUlQXliRZeCfFLUiCYIeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19696694"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19696694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 12:15:10 -0700
X-CSE-ConnectionGUID: MafRSPs1RgeAynoPzegAzA==
X-CSE-MsgGUID: iTFQTWxFTyCoWNFbNYYG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="43030942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 12:15:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 12:15:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 12:15:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 12:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7/tTeH6ayzrI+3MX1eUS2N6+uC9q8fCKmH13as53hjIVYzvW1/EBi4xZ2DjkjT/EAuQjtjf0tVGfVlW4XklUHX6446weRc3YFnD8D9cZGtRIcFSGYzimA4iI7/TWiqpHk+nAEBvuNCpaXlkdWcO7+c0xWwroHxNoUgG9GmWRvsacze7Rdd5cMPRMzH0diUO5n0rPvik75hzBhYuRxodqd5JKA2mQPNKznHm+j5SHg4/4hHaG17oH7V7x9CY8dQI0aqOgVCMBUYiNMXQoIPEYqnUn7s1TwTx0YchP4qAr9Ms1BZDdnqucEMTfxGPN+hM1TGZYVQPamkIM840kSJ1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUQUPyb6wYYoSfmSQ0AT8ifx2rD1HNVJGlu3DM7f148=;
 b=iQov2lWSTR2y8VfjvxFKV2M0Rxsr8XcKj9nXtgMTr3M3fqPuHw3Y7iKeC4NePDDmS6Bi/AwMiGRRYlfzf536vEEPzJ8lJj2G1eIiCYTQSOKHtrF6/MBev/2PPFaRSJhCpx8kwZl9t676np7G7n53JiNEGwhUzErfTc/OdwRVZKoPk5Es1zKErWnoFkolZS9FRdjUjX9JP8h6SbCM6jBMmdqnTehKyMG/zEFBlxDPwLnLemfbRuF9GUQxMc4bVtw0wPNQCaXGFudUy9RNeTdcect32AW5MNa1NlzvSlqaGYDT6baqwDM0gbEB+cO8wspIiU2gBdJIOKI0NKhpYYJDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 19:15:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 19:15:06 +0000
Date: Thu, 20 Jun 2024 12:15:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
Message-ID: <ZnR/uGMcxOETqhsm@orsosgc001>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
 <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
 <875xubtu61.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <875xubtu61.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b215aba-d5f2-4620-859f-08dc915d4b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzZPS1pUQU83STd4NVp1UTdjamhLUkxHUEFTWTRLNE8rSnIveS9FQ2dGaWR0?=
 =?utf-8?B?M2k1SjA0T2VyRGdZR2R2Y0pnL3NReWFyVFRRR3N4VWJPSzBiZXJmK29YK3lQ?=
 =?utf-8?B?M1Uzc3p2Nys2aStOZzIyWjV4TnhsNzF3UWxwR3lkZHU1dnE2UzJFaFM1bTd3?=
 =?utf-8?B?ZWFBcnlOdHIzZjJjcEI0c2xnazl6cnNtSkVrVmZXcERlZWFHMDg2OGYzNTds?=
 =?utf-8?B?L1NTTWtEakFGWWRIWlV6a284UHUzT1lPL3lqY0pWS3VrbUhELzRsVUk4bFN5?=
 =?utf-8?B?UmtHUTNCb1NFSFNnR3puNk0rQlNHMUhNd3RvV09pK2dkTUVDZXRqdjJOZEFz?=
 =?utf-8?B?ZitmQmREa2JtNjNlM0JUbWEwNHdqdlB5K20zc1pHR2ZCZ3VXOUVzQmVOR2o2?=
 =?utf-8?B?SVovdUxKVVpMUlVnaW9mVTRaN0lhYWIrbDQxdFF1VGpXL2R3Y0ZiZUZHV0JE?=
 =?utf-8?B?UHNRU3E4NkhlZTVETm5PS2hiUHl3b2h4em9HVE9tYnJwQ3RjUHpvcXMwVWRL?=
 =?utf-8?B?dzAvaGFaV1Ric1QrQnQ0Tnl3RlZ3WFZ2Q09sR1owa09TVHNBSE4zWEJ5QTZj?=
 =?utf-8?B?YVNjL3MxTGR2UTlLV3kxdDUzYTZmUEtYU2JsMng4UXhFQ1VGRDBZd2cyU3pL?=
 =?utf-8?B?V0U3bkFWb0FMbTFtWEVDSUpLS0RzVVVhZFJsazkwSDVpWjJqLzVwTDBQYzdj?=
 =?utf-8?B?eDZGNlZJaTdBTnc1OTZacTY5WTBVRHIrTUY0WUpnb2tMWGw3NUlka3k0OWRO?=
 =?utf-8?B?azhtQjZYNnpyL3grUTF6czRGQjlPTE83UlQvWExPb2RXb1BDNXYyNmloaGov?=
 =?utf-8?B?WUN4N0JWQlhaWjBZclR5T0JXeGV6b3NpK2F0eTdjWnJpeCtLUXNEdlJHQmw5?=
 =?utf-8?B?aTN5YkNEeHhxb05UU2FoOUZIcTliYkhGcW1aVHF1Y1J1dkIySjBWSUMvMTdU?=
 =?utf-8?B?ZWZhSlhra08vd0FiL1BuU1A1dUZZWThLUWdFaHpyK0MwOEdUMFo3aUNFTFcx?=
 =?utf-8?B?cUNWd0Y3cGJwUFIwVDh4OHNWRmJIb3A0dVJQSHFRY1ZPbUExRmdtQStxQlJr?=
 =?utf-8?B?YVFjYnVxcEI5ZXhBZ1c3a0RGMVFhcFpUSStTVVRsRnRpL1B1UTdNVXpubWJt?=
 =?utf-8?B?OTIzTTU2bTd4dnJDaGU1MnpCVHJQMWVrTXhEYXBXN2xsYnphb21VaXYzTUEr?=
 =?utf-8?B?NktzcUpQRXd1VDJKR2I1SXNocU9OZGpQL0VENm95bUxMMjNKRVJRVXRDN3JV?=
 =?utf-8?B?cjRWSEgrMVd5RG44WWlsRVk2ZFlVb1FpL0ovZXFGajJBTEpYWEYvbHdlc3gy?=
 =?utf-8?B?VTY2cDlXQVdZWVJCQ1V2dHkyd0lYQlBRVWkxQ3hldFBwTTg4MmZtcHhYVHNq?=
 =?utf-8?B?dGhMMUw5SUhRTGhOY1dOQW95bHdWRmtiMzZMZmJOLzBqZXZZWGQwM2o0bnhj?=
 =?utf-8?B?OXlnaGQ2aGlDVnhJUVcrNHhOSUM4UUtXcXJsbDFuUVFsVFdlK2U0YU1BaUZY?=
 =?utf-8?B?bmNIR3JZQnIwWHZzUXpINk1RNGIvd3M1Ly9HeUJzRVp0eFEzZXhsQTRKRE91?=
 =?utf-8?B?bi9TUmU2Ni90enJENUJzQ0dHVjV1UkFBdTJudHVGTG1HdVlTalFSbkd1b3g3?=
 =?utf-8?B?WmZ0eXIzdXJkSlFqdFpSZUtoUzdVb3diZ0ZEdmpTUlhwWDZidE9rN2NXeTlK?=
 =?utf-8?B?andxOCtwSDU5RzVBemhiOWZPaEZFUExSeUxsVW9HVWVTc2gwR2xRNitQU3Ev?=
 =?utf-8?Q?7CQfINAgYwM/Ys5Y1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXk1R3FlNDBWeFBxOVEzN21ES3JNVm84Mk5wSDBiZDBmUFlGbk5TKzJ1Qklz?=
 =?utf-8?B?dHBFMEE0dzNiQmx0bGZHM0lRdGlsQzVYSFRnSlZvSG12U2xCaUdaT1FZb2Jn?=
 =?utf-8?B?NGY2dUNlUFN0azNMRER5cm81ejBoenM1d1ZPY2w4SERWWW9SVHR0a2RpQ1Rh?=
 =?utf-8?B?OHQrVzNPOGVlSWw0NHR6WkQzUkZMUHZiWlJ2a25WdG1ObmVGSE9naWlua1Z2?=
 =?utf-8?B?NURES0pCZ1JGNFpTNEt2VTUvMUUvc2o1WG1zQmM5YTRERVFZNXpoMHl0Q0x2?=
 =?utf-8?B?ZTJxN3BhY25MaWE5UGJ0VUNPRXNLS2RZQVlwNUROTitwWlVMSzRwSnladEc0?=
 =?utf-8?B?ajFIYmFRK1dhNTdXWGVUU0hQT25OcGpldEMrbjNCbEx1YWo3ZE9qeHYyVCtX?=
 =?utf-8?B?aFE0VHlmZEtMRnRhTjVLd2c3TzJjay92Z3JRaU85RlkzS0VrbHhsMHFpRmJr?=
 =?utf-8?B?Z1J0Q252RWhzVGt2Q2gyMUdKWHhVK0hjWTAwdTcyQXFacGxUMVZVT3pLbFpE?=
 =?utf-8?B?WmZ5R1JzVzhmKzRoUlR2NVhtYUdtU0NEbDVZV2lqQnFPTThCQmZFcVl5WnJm?=
 =?utf-8?B?UEpra2M1bzduSExqL0R3bmdVb1FHTkd0WmtwWnpoci83TnZRbGVGbkVsb0tU?=
 =?utf-8?B?R3RhcDY5ZmFSV1ROR1F1LzkyZGQxRnN0T09BNyt5bllpc3puVWJGcGdzK1NJ?=
 =?utf-8?B?U1dJTi9EVG9wZTlrWkpDU1ZCUU1IZVlqdFhYNi9qU29GTDg2c0t0WG82SjZ5?=
 =?utf-8?B?cUN3K0kzaktBZVNoTW9PK3o5ZW1ycFdHU0tVcFFhWGR2OU4zUHN0SXNqQkN4?=
 =?utf-8?B?alEydHl4czRWZEkvMVQ2aGNEcUhQZTdDbHNycDYxMmFIN29KZ0t2THJJNmhi?=
 =?utf-8?B?WGVLd0NQNnk3OWZNd1UrelgwWDZtUk5nUFpOS2xLNmFRZUVXUVVNVUVraTlF?=
 =?utf-8?B?eGphK3EvVUpiK2pXQ0gwbEgxTDFNa0pNelpMRGI2OW83NGFJQnFSNmZmUVFM?=
 =?utf-8?B?cVo1dmZIczM5Wk9mWEJuMnd5ODJ4amFwVHZVZ2FuVk8ybTlxUEFaWU8rSzBC?=
 =?utf-8?B?U3d5NHB5dmFGL0ZPOUFoaWVBWnFSTDVpMEVjVy9YbXBtS2d2VXJSVWF4UEEy?=
 =?utf-8?B?L3hQb0d4QUVNZDB3RVRwTmpWWHF6Sko2eEZtRm85VEo3THEwUHU0MGJCWHlX?=
 =?utf-8?B?VExHdEgyeEloU0FXRXIwbmIyNWNESTJFcTFkUTVqNDNUc1V6UXdzQjFnNHh1?=
 =?utf-8?B?OFA3ZjFnOUxJSGcvM0pTNlVHenR5RTNVU1FSeXlSVENHN3lQZlV6MEJIRmxK?=
 =?utf-8?B?Q2xIemZKZ1dVdnJlUVg0L0pOMC82eWhRRUVUNVRvRTNJTGs1a2srVU52UWJN?=
 =?utf-8?B?SzFiUktZNDdzeGlnWnFXK0kvWmU2UHhiMmVEZ2ZZK1hWeERTQ3cyZEtNVGtm?=
 =?utf-8?B?QTYybENNdjd5OHF4WFVNdEdLMmVhQU0rbkhHcWlzYkZONzBnbTZOTk9LR3Nh?=
 =?utf-8?B?NFhhbUNWYmV6eTh1SmJuS05ZeTlybm5QM1YwcGtHUEorN0NYZTZacVJqYmor?=
 =?utf-8?B?TmcyRFhPM21peFo0T0VmMVNLQ29pRjZ4WmxhQVdjZGJoS2xsbWZzbHFZNVlH?=
 =?utf-8?B?QjltVE4zK1o4NU1Xd01iUzR4engzYWZPY2IvUnllUHNrQjlzYWVjOHZkNldQ?=
 =?utf-8?B?WHczelphZ1VMTDRYaTVJZHJsZmwvenZVYkFQYUdLM202c3BjT251Z2Z5Wmwz?=
 =?utf-8?B?cElaQVZjUWtRZVFIb1NlMkhRa3FpMEwxWXZPRTI1VjFVaDN6RFhhYlZIZUlv?=
 =?utf-8?B?U2E0Z3l2V2wwd0syZnF1b1crZDB1YVlReWRkZmo4ZkYvVERxVE5lTXhnSElN?=
 =?utf-8?B?bmQvZDRCWHQyUzl6dG1BUVN5M2Q1czYyYkJZR3VWS3lLZ1RJZEdGcUpRaHo5?=
 =?utf-8?B?N3FZa0VNTlJ6Q3pFR1Y0RG5JdmlXU2lhQnJJMkROTUxhNzBNanFDQWVqeUk4?=
 =?utf-8?B?YTYvSDB3Z2NyWTUrOVc2VGNCbGt3cWFSV0NnOGtUQnBES3hONUY1Ukt1K0pt?=
 =?utf-8?B?L1A5WjVJQnExenVZbEI1cGZ3Y1hvUmlNaHI4M2lDSnUwcW1ya0g0Z1RDNVFF?=
 =?utf-8?B?WmN3NXpURlArSUFFRlg1WGJTVTFobWRyNlJDTkh3WFVJNmp3NWk4WkN2K1o0?=
 =?utf-8?Q?Ka9jb6HL2dNjrEPv0JHMq8M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b215aba-d5f2-4620-859f-08dc915d4b7c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 19:15:06.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vR/WFy/QiOCQQfhCSRBvPgzuiRJQc2nhCgxjQtVsOFd/QGgjtkDu4Dl7Bm9DsrhbD0xmug5agrLHtROVgbHYpNwkJYBx8loyPkZpjJ5JeTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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

On Fri, Jun 14, 2024 at 08:34:30AM -0700, Dixit, Ashutosh wrote:
>On Thu, 13 Jun 2024 22:50:39 -0700, Riana Tauro wrote:
>>
>> Hi Ashutosh
>>
>> On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
>> > On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>> >>
>> >
>> > Hi Riana,
>> >
>> >> There are a set of engine group busyness counters provided by HW which are
>> >> perfect fit to be exposed via PMU perf events.
>> >>
>> >> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>> >>
>> >> events can be listed using:
>> >> perf list
>> >>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>> >>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>> >>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>> >>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>> >
>> > PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
>> > Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
>> > to change. Why are we re-posting these old patches again now, without
>> > including the planned uapi changes?
>>
>> The uapi changes were dropped and there are no other upcoming changes for
>> Group busyness. So re-posted the old series.
>
>What happened to VF busyness (which is why I thought the uapi was going to
>change)?

There are no plans to support group busyness from a VF, so we are just 
exporting group busyness to maintain parity with i915 for Native/PF 
behavior. The only change would be to expose the counters in ticks 
rather than ns. I still have to look at this series to see if that's 
happening.

Regards,
Umesh
>
>>
>> Thanks,
>> Riana
>> >
>> > Thanks.
>> > --
>> > Ashutosh
