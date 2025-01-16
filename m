Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435E4C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD0210E0A4;
	Thu, 16 Jan 2025 23:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxkq6/xF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09510E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068911; x=1768604911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SqeyuNmJcm9SEJnJ0DyfO2Pm4fLugbK3Uvm0g9yl0ek=;
 b=bxkq6/xFaETIUC1PYp9YKemkkjyin2OfkkN2ENFDNadeRzR3IIuUDEjW
 HuNoN7gmXpm0fhUL+Hx1TTecaLTU6ZJeiKp6EyfssoaGRr50BbwKRmczZ
 ycU4QjuSe6NlL9Q+rDUHXz28E+1GU6YvaI6i5m9ZutHk9u5sV2bxOnXdS
 z5vKWe225eTSOL4gPSK9F0nz429aVN9gxnQxkjswE84Ip7JTNXbBB25oN
 PpzTfYTFF5hpXE1oHK+9rWY9KUVbOYiLePcE0E8PntUFMIvMTR9FDY8UX
 sxjir0QrmmHPTCilrERCSeQi19Od+owq5ksWmWHUeyiAh3Z4BhUeBaSkZ g==;
X-CSE-ConnectionGUID: nDIKuXtSSFiqlo8c7FOzFw==
X-CSE-MsgGUID: w6KjZwnKS4eBiDgrbnYeEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="62852812"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="62852812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:08:31 -0800
X-CSE-ConnectionGUID: OiaHEtYXSQWUKOoqrpwBQA==
X-CSE-MsgGUID: +dCHlIXvRR+jpKNMvS+axg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106104554"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 15:08:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 15:08:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 15:08:30 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 15:08:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcI/asuCKkdUg33w/JhbuM40L1fPPH5Gtyv3/cTUHYHjVp/PFfbGYc59wJ/jfRcplTT3BDxgkMwxVcJOH6s2KMZL24JjIvGSfMd0ikxk/s+PsDiz1OeWhEN3H/pFS0KazQOHcjxUsnfBkQaqKHvmBVu4tnUiTUuXfl2Oqoy9qy4QzFKjfFkQTNck5hzgF+woVYul1JYLOhihSsMajE3xrW8vWMmY/4F+pBc0gHBYixTP+IhLfNmflGKyzClB4Upak1yc5KD/r2Lws9b5y/NoFYupBH7aQLWflFpSur4vQ6zkACkdjMS0baTseoLyCIXP9j4KYx779SA/OE+w87wMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZb7OTgsEcrvEnAOfrGzzDHZSHKoGw5+5fQsoK6IOz8=;
 b=zSNhECUSuODyay1xl7htPoo0Ti9CjBNa/yWwE13NLUL8r2o3BmHQhKDMDU30lrTuInLmmlkAeRmNxFoAFXX1Y5M4mTtOsX0bQzwAC7JIJLqyFNBQ8KY3uA9kGBy346wP9j6uefRVVKeeKsL9dZ8TmxnRwf57N8IOyC+vIrRPomUeOVW5efjigYjHlDegimQd2b8+6ng+fne054vEnqDcT4yakC9/e1duxCDGSgMLgDJE0Xa4t5YIRAgm3VsxDHVC+tzsUpSvTDKgPZaAvaysOf6D53ispyTieD0XkDwiA5HvAInAPgyqvoTBcC8PWrbFDof8nu25tMR8dFHVXiNTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:08:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 23:08:14 +0000
Date: Thu, 16 Jan 2025 15:08:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 07/10] drm/xe/trace: Add trace for engine activity
Message-ID: <Z4mRWwviAdl0NxPn@orsosgc001>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106075600.852080-8-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:303:b9::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce3956f-64d8-4625-ed31-08dd3682a766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTA1dTQwTEhFbDI2MXg2bmxXK1JlS0RScXQ5SFYvYnZvL3FIV3JNVFpuNUNp?=
 =?utf-8?B?TzZmeEVYK1JpVFBsaWdHdlBrdVUzaXRvK1dIRk90dXN6V3ppbG93MEw0bVhy?=
 =?utf-8?B?VlZDZmZRTE92emh6YTNxSG5LSmlmUzFCdzlXRFdMcjVvR294UVR6YjZhRkVN?=
 =?utf-8?B?amxYN2IvcWNKeUx1c0J4SGJyYWIzRjJxemc0dGh0SktFdjNDc0VDMS9ZZVR4?=
 =?utf-8?B?dVdQOXdlS0dMai93a0JGUHQ1L1FlQjhoUlQvSVZBVkRSNWFzMjR0amNObEJJ?=
 =?utf-8?B?OGtDZmtIVGhHK3RhVTFOWklZZkp5cGNieVkvdCsyWUkvSXVCRGoxbUg3eHcv?=
 =?utf-8?B?ZGkwa25URzlGWmR5VEtrSm5ZK3RiN1J6UmE5aTBIS0Vrb0FicXNUcDd1VkJa?=
 =?utf-8?B?UW9pSS9SM3B3VjJVVGVWNEF4L2ZBMTQ4cmVYVXB2c1NKd1hpLzIvam5nZFZZ?=
 =?utf-8?B?UjRYaDdEbS9FaXV0akMzdW9neUpjZU13VklzdW1JV0F5YkxrWElMMlhreVVy?=
 =?utf-8?B?ckJ2SERzUm05eGhjV1p6WjRiL0FtSnpiVktYMlI2SmZrcGQvR1BublFSRTJB?=
 =?utf-8?B?Zm9TTUJGVGUrSm5EOEFxY0c5emF3U3A3dE5YNW9RQnJUUFFjaGF4TnFLUkpj?=
 =?utf-8?B?R1lLT1k1Slh5Tk9VckplQU5kVmdGalFZSEM1czNsWlZCWm03dUJYOWdINEZy?=
 =?utf-8?B?YXZNR29SNG5xbkxPdnBIdVg3aGZrMVdPeDQ3akFOQlFyczhRWWhUNTNGMGYx?=
 =?utf-8?B?dWxuZTJVNmhwSTdoeGZLQjY0OXI4NUd2SlZ6dlRoNk03V3M1OUdNL0VlWTJt?=
 =?utf-8?B?eGEycklwWWcyUk9HOHVJemRXZllVdEw2U1p6eWZMditiWStISlJsTkZmaVlE?=
 =?utf-8?B?M3loa2xxMGVKNnZDV0FVQTM3WVlQT25IOXVqYzBKTTQrQktPYUdJU3JtMlcw?=
 =?utf-8?B?cm40WU4yZnhPZmpMWDNhbjR5NURveGRXakVrRnAwNi85czQyKzR0d291VE5M?=
 =?utf-8?B?UzJtZlVkVlFodmRTeEc1VHlqelhFRUdFMU16UzB2dmlWNWY1NlJyWVJUbmtO?=
 =?utf-8?B?SGh6YUZLbmlBT1ZUd2ZGZzZ2QXM1c3NwM1JLQXVlem1zcjhOVmtmUTRiNE9t?=
 =?utf-8?B?WE5vUnNPdFFSbW9aK3lsSVV6bEFrSTltd09JTDFQb0Q3dmNmRzdaUmU4c29p?=
 =?utf-8?B?K1pNalk4WUQybDYydmJsN3ZYcUxlaEVCQytjbGlPR3JVeWFxa2JhajBYaFk3?=
 =?utf-8?B?WGg3SlZwamR6UjdGWEN3TEZ3TVYzZ1J5UGorVE80QVFCWk8yWW5xS3Z2NU05?=
 =?utf-8?B?bmlNYjByU05CeFNtT0VUY1h5RXZ0VGsrSGtOR2FaTEJqdmlxM1N5ZXdKby9t?=
 =?utf-8?B?VXlDbTcvQ3YvRXRlclJWKzI4RXEreTQ5Wmo5bWtKbjB6bER0Y1NBTDZoTlY2?=
 =?utf-8?B?bEpiODhtMUc0cExuSHdWMjZWSCtyTEk0Z0hNM0Zwb2dZQ0pqTlgzUmVqQjJP?=
 =?utf-8?B?MVk1UnlWZDJQeS9Vek1pTkZ1Q29lRXNuN1Frb1VTWEcydDRVM0YxWWVBTlJO?=
 =?utf-8?B?c0ZrR3FUMnpqVmtJZmZaN1YzQXpkZEZXOWd4YmFpZXZSQzl2RGJWbmgyRWpZ?=
 =?utf-8?B?MVhZWHR4TGl3V1BWRHFvRk5LaGpYMEZoRzZ2ZjBsZ1dvblh0VVJPQlhQWU95?=
 =?utf-8?B?OVRDR21SWUdBRFNORno1OHgzMWg1RXAyQTRpQWZOclBQS2VLdlA4T2UrUnB1?=
 =?utf-8?B?MzlDSXNjSEV6UUZVVW52b1hpblpZVURzTkdUQy8vam1KN2xGajYvUW0ySjE5?=
 =?utf-8?B?NnRaOWtUeEd1Vm96OE5XcTJQdnB2Z05xR2xJYXBDZEtyRXk4UGx4NkN6dENp?=
 =?utf-8?Q?NjgvnIIuvJOI6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a24vbHViWGpoZTZrN3pKSWZ6bjdaTVQwNit6ZGgvRlZld1NhSXNxdmZPRGIx?=
 =?utf-8?B?cndoNCtISi9kNDNaTzgvTGRGQ05jVnorTXhIMzgwYW1HemhsVnlHN2NiNHg4?=
 =?utf-8?B?aGNLVkdTRjBMbXlmQ2ZIOW5XaWF6WDVuY0pTbThGeEx3OE9wMitKZGZmSTJz?=
 =?utf-8?B?c3E1djhSN0JwaFMzK3Y2Z053dWFpSHJQK1J3NERVQWdVVXp0NWpzN0Ira3p1?=
 =?utf-8?B?QzlQRUwxeWVBTUpDZmc4U09NVjUvbjJmOXpaRWdYOG0wek9Oc0xIUjVYYy9y?=
 =?utf-8?B?N3Fld3RMNWN4clFCUmZXS0VrUVU0SkUvU0FBV1A5NWREVHBNVC93LzE5N1Fh?=
 =?utf-8?B?UXVxbmtxRGRWaGhhcDRHc2dMcS9BbUJDSHhSb3hpL3FMN3RhYUN0bHhrUmdm?=
 =?utf-8?B?TlRhKzZKTkhKaW1DYnM5R3p6UUhqdThORzRSYi9vaXRZZElvaTErTmRyRVY0?=
 =?utf-8?B?SkdXNTJrNDA5ejhwZjhlV3dUU3Zab3YvKytaSlBzSHYyWU9ETEViVFo3SmRJ?=
 =?utf-8?B?VU9DZVd6RG51b09RYXAzTWdhVDlrSVhKTW4ra3pJSnB3dllGaGh1R01VV092?=
 =?utf-8?B?cGhOOE52czI4S3dRUVhiWGlneHIvcGdTVnU3aUlnaXAxVEVHNlcrR2tzYlZS?=
 =?utf-8?B?Zk9WZEptZDg2WGZ3SEgzMlpuVmswYTFlQVFXejhMeGluN2xGTmwyb2p5eGFN?=
 =?utf-8?B?UjI0VXZiMERTZXNOdTFUQ0tYWSszYnFFakNwTTMyMEw5VUJkWnFlcWgwT1Uw?=
 =?utf-8?B?NHpxMnovckExWkRIenFHNjNyd1FFbG9VNTJGbDhrSjByRGRxQUNlNklnMXVJ?=
 =?utf-8?B?KzZObldqdWRrdmZEbzlJNEc0ajdOZjNTenVGNFUrK2NxWjNXLzNVL0NyNDZk?=
 =?utf-8?B?dEYwS29PblEwM2Y4Wm9mUXFYMVp6eUVSMmE1Vm9xZnJuWTRxeGdjVzJ5YXkr?=
 =?utf-8?B?VGxCci95NHBrMGFjSE5hTFZxRTZLZ1ozL2h3c21iVDAra3ptdkl1RVVvY1F3?=
 =?utf-8?B?eUlCOGRlNUZLQUo2eDBsVDVCc3p0QkZkWkhsMjc3VGRjanZQdEdCZTdyVGdo?=
 =?utf-8?B?aTI0UmhiVm9rNzQ4QVM4Nmd3a0hoSWRtZWhReUZwMVNXZ3VTOS8xdFd6OUth?=
 =?utf-8?B?WWhDYVJEYWlScE41bTdDeTFZeUpBWjdDbXFkVVVIeWwwN291Vk5LR0xaVVll?=
 =?utf-8?B?N3p6WFhrK1JyamVOVmYrMm1VcVg4Skd1Y2hxcUlTVjdmOHRXZGp4akU4REww?=
 =?utf-8?B?b2t2d0FFaDhEVEdoZzlZZTlVL3crN1R1ZHo1VUFoTVZvRlNBeGQ0TnZ0N3N6?=
 =?utf-8?B?bGJzaGF3cjNZb3lYSm9aTlVpdzArajRMUkxmdy8yaDZOdlU5YVZMSGN6TlNt?=
 =?utf-8?B?Y0pyY0RsK1FPWUF4K3ppQWlpaEtNK0xmb0R1b0RvRjFQdDRNRk1yMnErMXkv?=
 =?utf-8?B?bkdZdjBOb0J0eUhYMFZOM2ZwOHpxRkZkRkR3Z2J2U3BUeGc5N1RmQ3hsOU4v?=
 =?utf-8?B?NUFETEdHTGtBazUxMGsxT3JUM1BuUW5hbUc5K0t2cFNzODhMSXFHVXMzSytE?=
 =?utf-8?B?bGFYa3pOK0F5a0NSakJ3Mk8vRXdSR1hpRTBpOUM5MHRFdW5SUm1CQ0xkZjIz?=
 =?utf-8?B?cC9kUnJuWVJpQjNpeENBTXRQNXZtajczckxjbjlVemtoaEZKaDJaU1JWK0ww?=
 =?utf-8?B?a3pERkUxZjJvTUxYYVkySGxSQWxtd0NZaGo3azNtUVJneHhwWkNjNXJuaXZx?=
 =?utf-8?B?SEw0WHNaS01uNTV1UDBWSTNscndZSVBWRVdxL2VLaUs3UFhzSHpyRDA2SGtu?=
 =?utf-8?B?ODFESUhMcmJIMEtqQkpyOCtDQzBUZGljQXR3N282ZDVuYkhBaHpLQncxcFBY?=
 =?utf-8?B?aGRmdzFlTjRCb2N4SWtFRDROVDhVYVUxOW9ZOXc4Y2Q0SFB6V0tieVhWVUpl?=
 =?utf-8?B?TkpLSnN0U1lmUFUzd1JFTGhvcDdCZEhuaG14U2J1ZVBJOG14MGpSdUpxZUVB?=
 =?utf-8?B?aG1SUW85YkZpT2NSZU83aUtzeGRvM2hBWlV4cDZWMkk0V0s1ZGRCZnpqZDJK?=
 =?utf-8?B?OElacHRYcTVaUzRmSzJwYTYwZEFMdE8waGN5WnVDOWREUmhJN2REQ3Bsc2lQ?=
 =?utf-8?B?V2o4MHNVcGFCQ1FVTU1WbmQ5ajNvOXo5SUJLRnBTK0VNZ1RUU2p3dlFwYTJU?=
 =?utf-8?Q?9kwzRtVPhDH1Up1J/ud/jFk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce3956f-64d8-4625-ed31-08dd3682a766
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 23:08:14.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E/DFE4zLq3FizFMFJoRXmOTY4uG2c2Tlmpi0cqek0dW+thir6V7TgINahP4oPRlsGE6MqHsD1BSu8UybMZuO/HRKLgAzQf1TXhR3EVvpWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
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

On Mon, Jan 06, 2025 at 01:25:56PM +0530, Riana Tauro wrote:
>Add engine activity related information to trace events for
>better debuggability
>
>v2: add trace for engine activity (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_engine_activity.c |  5 +++
> drivers/gpu/drm/xe/xe_trace_guc.h           | 49 +++++++++++++++++++++
> 2 files changed, 54 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 687d90873e97..14950b42d1b1 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -15,6 +15,7 @@
> #include "xe_hw_engine.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_trace_guc.h"
>
> #define TOTAL_QUANTA 0x8000
>
>@@ -165,6 +166,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 		}
> 	}
>
>+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
>+
> 	return ea->total + ea->active;
> }
>
>@@ -198,6 +201,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
> 	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>
>+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
>+
> 	return ea->quanta;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
>index 23abdd55dc62..156d429d7e79 100644
>--- a/drivers/gpu/drm/xe/xe_trace_guc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>@@ -14,6 +14,7 @@
>
> #include "xe_device_types.h"
> #include "xe_guc_exec_queue_types.h"
>+#include "xe_guc_engine_activity_types.h"
>
> #define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
>
>@@ -100,6 +101,54 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>
> );
>
>+TRACE_EVENT(xe_guc_engine_activity,
>+	    TP_PROTO(struct xe_device *xe, struct engine_activity *ea, const char *name,
>+		     u16 instance),
>+	    TP_ARGS(xe, ea, name, instance),
>+
>+	    TP_STRUCT__entry(
>+			__string(dev, __dev_name_xe(xe))
>+			__string(name, name)
>+			__field(u32, global_change_num)
>+			__field(u32, guc_tsc_frequency_hz)
>+			__field(u32, lag_latency_usec)
>+			__field(u16, instance)
>+			__field(u16, change_num)
>+			__field(u16, quanta_ratio)
>+			__field(u32, last_update_tick)
>+			__field(u64, active_ticks)
>+			__field(u64, active)
>+			__field(u64, total)
>+			__field(u64, quanta)
>+			__field(u64, last_cpu_ts)
>+	    ),
>+
>+	    TP_fast_assign(
>+			__assign_str(dev);
>+			__assign_str(name);
>+			__entry->global_change_num = ea->metadata.global_change_num;
>+			__entry->guc_tsc_frequency_hz = ea->metadata.guc_tsc_frequency_hz;
>+			__entry->lag_latency_usec = ea->metadata.lag_latency_usec;
>+			__entry->instance = instance;
>+			__entry->change_num = ea->activity.change_num;
>+			__entry->quanta_ratio = ea->activity.quanta_ratio;
>+			__entry->last_update_tick = ea->activity.last_update_tick;
>+			__entry->active_ticks = ea->activity.active_ticks;
>+			__entry->active = ea->active;
>+			__entry->total = ea->total;
>+			__entry->quanta = ea->quanta;
>+			__entry->last_cpu_ts = ea->last_cpu_ts;
>+	    ),
>+
>+	    TP_printk("dev=%s engine %s:%d Active=%llu, quanta=%llu, last_cpu_ts=%llu\n"
>+		      "Activity metadata: global_change_num=%u, guc_tsc_frequency_hz=%u lag_latency_usec=%u\n"
>+		      "Activity data: change_num=%u, quanta_ratio=%u, last_update_tick=%u, active_ticks=%llu\n",
>+		      __get_str(dev), __get_str(name), __entry->instance,
>+		      (__entry->active +  __entry->total), __entry->quanta, __entry->last_cpu_ts,
>+		      __entry->global_change_num, __entry->guc_tsc_frequency_hz,
>+		      __entry->lag_latency_usec, __entry->change_num, __entry->quanta_ratio,
>+		      __entry->last_update_tick, __entry->active_ticks)
>+);
> #endif
>
> /* This part must be outside protection */
>-- 
>2.47.1
>
