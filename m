Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147EEE75448
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 10:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C534C10E984;
	Wed, 24 Dec 2025 10:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lxt/Nmy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9E10E984
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766571195; x=1798107195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uN15/nQmOYLqjM2OADE7d01SWY7yoVZEaddrhZUn4gw=;
 b=Lxt/Nmy6MAj7lEHSedz14gVfn2Gm3AdnEpFTqKIfma1MFhwmOD/yHqU2
 e5vHh+la7yEHoWjRpYlXT1G4wldLESnUxmniAykK239GHYM+MQeGCzfN4
 FAYH2y3wQHkHmvczO98FBxe4cH2jkRPBIPTa8M425kqCBhjZYX8a5NG9l
 OMZGRzl4de7YnfPTUNHV9DqrpJyl8uptD93aH2nphUPhPV7u3DcRlpMBW
 trNcK+ASLD86H6o42YslnWNU67mOcYeVJTULIBFR98v62GhzsiyKRVvHS
 sD+gkU5Cd2CcvW4/leA4OiBKT2NxrOXhJxn2Y4IPVjZezu8aU0dBkFEZo w==;
X-CSE-ConnectionGUID: Mm8mIV8eQNe8kwxGXcJxbg==
X-CSE-MsgGUID: Lbsngg6SSSGRFIBA5ktccw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68569092"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="68569092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 02:13:15 -0800
X-CSE-ConnectionGUID: lDJ8I/FZQjix2WZHq19HqA==
X-CSE-MsgGUID: c5SDN261RZKF1/v7xiMByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="200889783"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 02:13:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 02:13:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 02:13:14 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 02:13:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiz27solUM2yIsG+f7znKGUQJ2meK9cb78cZJdEYkDQZDFtOslXesZfJ6bnOAZtYU8EOQzwYNsKNjPRksE477gcRUpPpEbakbc9ZxHv848/PHJtfQSCKTNsNUtbEG/4zXaWJyOCIpHx2eNpVLSmNjQUmCM0UIGX8MUHIORpQ8Xe++r7huLqzmCPBAijF7u5SpZKhIljYVz3cHB9weXBl+0SVmCCUdYPtNoPjltIybIyqUomMRZiD9p+Y1OD5EPgB/X0JWB8HZgq+Fcmba2viA+/HjqPlYW+3ebw9BbppIoMAUg1/UPegiEYF0DAN+Hr5VrN2neULkyRL3wek3xYh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LnIW5gl3C5+4dI6FQcmdYzSVAQtVeO3HdmNP09X8CA=;
 b=ZL2/+IdfFpeu7tcYMBcppZYLbKZrm3flJ2cDmdiOCSGvmSDrD3/GLfgL43yuFmz/PSIuysEXMiVqKys4g8USkE9dq/z8XzdFyFJkbMhgbevAqugyujHPT/SMjyaD6PDkKhIYtTEnXlthDF4GPmnJr3yDV9jEOVOOG2Gvt0GOJGhDM2can/4f38dD8p4MYvgFMeVmHzK4BiDTPvCwqIHddRY0XhECPp46LD6t95pUNu2p9OPwX8uwntsqClHCntAy+0gjvtNi2fBYq8BBCEqZsEJZHEketWjlHHJRj45ufMaKBYs5kVrymUFAKXuEdfXyJ8sHfpR0R5jb7jWL8559KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 10:13:12 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 10:13:12 +0000
Message-ID: <ba9efeca-6733-4af2-a0fc-77bdbe765ccf@intel.com>
Date: Wed, 24 Dec 2025 15:43:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/hwmon: Expose memory controller temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-3-karthik.poosa@intel.com>
 <aUUE7IXfU2zxyRLz@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aUUE7IXfU2zxyRLz@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 70371787-3611-4a57-aaa7-08de42d50b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhiMGNwVFBkZUJQTnQyc1dXeVlJWk1xdWdtMGhSV2dkRnQ2S3BtUTNXTEUx?=
 =?utf-8?B?b0x3Zkp1SUtaV05ETmJXSmN0L0c4a2J1YU9GVTk3cy9XUnV6bk5xS3BiWkVG?=
 =?utf-8?B?Z2s0TXlZenRBZDhlVVhRK3pOSnN6V21LV2xkVzErSDc4SzNzcHUzTzZMdFY1?=
 =?utf-8?B?M2xSc3VjZFB3dy8xQWFPbitlemFUUnlKMmFudkxBTmF0RCszcmlyY1hCNjdh?=
 =?utf-8?B?eEhIYTFFVm96V0FQcmI2a1VTZHQ1TGdUQURTa3M2bW9RcVVzOHJlNmtRaHpL?=
 =?utf-8?B?VFIzWXpsS2ZuRWUrVk1XL3pMbjBGVmRqcVJuTFp5aVNSOEt4ZTdsamRNQ3Rr?=
 =?utf-8?B?Y1ZHMlZHeUJXUFBuYkNDTHo3UGJ2NHMzaiszbWpEM2ljbVBjOFNxa2s0ellr?=
 =?utf-8?B?d3RvaURaanVCTmQ3djZObmI4bVRzQWdUUXNPV0pFUnVKODJuVWxVK0hNTzNv?=
 =?utf-8?B?TlVkT0UyaTlrNGVTYUk3ckRid3o4ZmdnWHMrSEUwSkw0Vi9aemUvTVlNTDQ3?=
 =?utf-8?B?M21nM2xtcHNQQjNEYVY5Yk1peXRUUitaU2xndXZTeENxLy9UVHZNU1gzQlJn?=
 =?utf-8?B?Y2lDektTMGJzUGlFQXV5UWt4azNSNHZuNmhNRmwrc3ZVYmtGSDJxRElDeVBQ?=
 =?utf-8?B?THNQa1lRUUMzeURFbXdxTStLMytmemxhTjZZZ0dGVUhnTVhiOTA2WW5QQmJV?=
 =?utf-8?B?TlRPcnlIQmVEeFMrYkg2L0Q3dTVVQXE5K2I1M1pnZjY5bGkrbHJ1Y2VLME5x?=
 =?utf-8?B?d291UTh6NWdLdldSTmhKcWhEa1lEMCtwVlFpVXJRZThxclpJSVZpVnBxWmNH?=
 =?utf-8?B?Q1l0cWxMS3ZnK3o0UkVVakJSUnRSMGlqY2R1cjluMlJtamVxZTJQeGNYVHRk?=
 =?utf-8?B?eTZRYlAvL25xclRoWVN6M2VUZkRreFlReFBGZnNHbEFqUkJwSzVhamhNOG05?=
 =?utf-8?B?V29mRmt2MHVUTGN6QnBsdlYrbGlMb05YLzJycHNnV3o2NHJjZVh4UkxzMzJn?=
 =?utf-8?B?QjlKNDcwTnJwQWZ2R0FURVNkS05kd3hWa0w0bFN2VTZ1dmEzUDNmY3F1YmpZ?=
 =?utf-8?B?NlIyNithV016UTQwd1dmVnAyd1ZiVVdaaFJjbkYvZFFpZndOWVVreGgraE94?=
 =?utf-8?B?N2xCVU92U1BTSU9pbU1PVUw3N3NvcGdSYStYSVJRS3pVMGEycHFaWjRxNElC?=
 =?utf-8?B?bkRKNTF5Rk1VZlhwZ3huMTRpb0JUcWlSNk51NjcvT0RYNFlHMzFQUCs3QzJI?=
 =?utf-8?B?amgySE1NWnlBVVBJSG10czd5WFpyd201dTNUeS9vcFZscHo1aGhVZUQwZFhU?=
 =?utf-8?B?eXNxcnBIQUVFYXBsdWtRZXdKSmFDWUUycGxrV2huaGlXMzBQQ25uRlVpQnFQ?=
 =?utf-8?B?VmJGYmdxOTN0ZnFPanN3OEsvNXIzWjJpT3Y4N0s0NHB3RXpIZWFWcUxiakl4?=
 =?utf-8?B?aFZvQk5CMDdvdUJSQlNSK05jakZBWDBrSnRraCtmUmUxeWVPdkRNNVFYbzky?=
 =?utf-8?B?SHl6dnVMZm1QNk1XaXN6ZWxhblp1SWFDU2M3dGFaMVBVa1BtZDRyNXhjSWpO?=
 =?utf-8?B?dEluNHZmM0FCQUhyMEpJWElacmVyOTdwWTJzZ1UrOG9tdjJRSGJFVk42aC9z?=
 =?utf-8?B?eGxiNlBzWUN6bzdpTng3MGN2SENncDFjUS9ZZ3c1N0dTdVNjbk5menlYZ1FI?=
 =?utf-8?B?cUdSd3NwSVV2WmhPa1dHcWlSdjk4Z0pMbXhZcFlhbnVWdjJvcDZlVXdJenNP?=
 =?utf-8?B?YjR5OHhxZyswcmd5bUNwcklub2I4UzNxSjlQU1BVc1BzUnlOUVhLWFNqS1lG?=
 =?utf-8?B?YXRXL3lYajhYVWFzZHUzazVJTWFSZlY1alZHMUFGVW0xa3RrQ2lqbmlFM0VT?=
 =?utf-8?B?NmduTUF6UWJtVkFUdzB0L29oTlhWbElUYmttMmFzQldlekRYS1p0VXo1WWF4?=
 =?utf-8?Q?W/CFJVF8dhXh69Zohx3PqGhFzLv3vkjB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c04yc0tDdExzZ2JWNi96YkliRHVyUUtlWjFqUUtLL2dKYlFNN1ZiQU9xVGhp?=
 =?utf-8?B?RjFnY0pGdy9XdkNHZnZ2MWRhQ2diSUtteEYrYzJ1ZEVOTWloTkd4SXJYRW5Q?=
 =?utf-8?B?ZlkxTWJRQWZpZ3JuL25zK3RmcHlydGNHSVkzYi9pd2NCOXlGZDNRbzNXOGtK?=
 =?utf-8?B?UzVUR0NyQTF3eHBjSHdIcGoxbHNja0YvazFTY3dnTXZBMkg3MllGU1NRcnJT?=
 =?utf-8?B?L1FTbW83dXBqK2N5Q2ZZNnJ4TVRQMnpEZDBxZnBtMmR3dTV6V3l1cmVMMDA5?=
 =?utf-8?B?TnloRlgzYXNoWmpLWCtsK1NYQVJqMzd1WlFWWmxqa2lhWUNKcTlzRE5pUVlI?=
 =?utf-8?B?S1p4TGQ5cVptZktUeS9RTi9IeFZQMVpKK2EvbjJXS3ovMDgzNEFJRUlveS9a?=
 =?utf-8?B?MVcwYlhCU3B6YkE0WWVSeTRISzQ3d3U4TkJBRGloK3RVbUNZRFV6T2VvTld5?=
 =?utf-8?B?THVMSDY4Q3lzSEZLOXUwSm4vdmRkSXdmcmFEOS90OXhvNUVKUXpDNWFEaC9M?=
 =?utf-8?B?ZFdaZnNyOTJRTXNDTENsUUdBVXhYZ2ZucVVnelVsejBtSU9zMkcvemhtYmll?=
 =?utf-8?B?ck55Ny95MTE3aHhIMkVYODZsQXR3TVRmV2twVjhEU2E1Q09FbjNZTkhyemM1?=
 =?utf-8?B?MnErVGdhNkVtTUdEeUJ5NThDYlBMMXpyTjY2cDRLcnlHMm9mU1R5dE5PRjF0?=
 =?utf-8?B?SUhjNjVJQTVSbXRjdkZZa09VTXU1d21oMjUzWUl0aTZJWFFJbTh0QXRPYUhR?=
 =?utf-8?B?cTJ6L2lIczBGemtmZ25SVlpmM1V4K2RpdXdWRFVRN1dmK25wWmFGekpQNkk0?=
 =?utf-8?B?cC9RSkJMUnJtR3FocmxxalgvTTdGYXpHZTA5RHlyRFpYbEk3V2RtZ2t1ZU12?=
 =?utf-8?B?N0orRGRXaUlOWnh4QWdLK05xaXRsQ3VtbG1MTUdlcU9tdlIyK1RoaVdBQkcy?=
 =?utf-8?B?R2xYa1FtTExMOGY1UkhaWURPMXpDdjlSdEdibDQwTS9GLzYxQlQ0cW9oY3VB?=
 =?utf-8?B?ZkFiYXF0U2dWS1lVeWl0VTFqOW5OOStBdU12V3JySzEvOStlbStxeEZMNS9a?=
 =?utf-8?B?QzF1RUpLbVA2L3d6eitZVGk5QXdrQWpFOFhsYnhWeGdSM1NxYVJ5amNRZHhP?=
 =?utf-8?B?MDJITUJBU3dJYkpRZzJYeS8rVGFNeVIxby92b05BUnd6L1ByN2UrbjhwMWdM?=
 =?utf-8?B?R2RDNld6R0xFWlU0WWhyeVNXWVh5OW9FYWFQNDExRzJVNHgyMmJTQ0xSTWxE?=
 =?utf-8?B?dDVrd3BRbktqVTJVenlacWxIb2FXMWFCN2VaOUpDU1RBZnhLTFMwaVhoRkdR?=
 =?utf-8?B?dFYxazZXVk1vam13QlBvQW43N28va3NnU3ZGdS9BU29YZlQ5eWNUaEc1a0Fq?=
 =?utf-8?B?WE4xRUh0OVZDQ290VjlQODZ1a3lOM0RPYm9idlJMR2pIa3B1d292eGh0THds?=
 =?utf-8?B?ditpM0ljZ3o0Mjd3N2J0cEpad1ZjTDB5WE5WZm9tN2dCRHIzQWlvK1VRMlQ3?=
 =?utf-8?B?RUtUU3UvT1JxdWZ1SUoyTTBjV1FRRE9YZkl2WTRUK0dBQTFPWEkrekFlT0U3?=
 =?utf-8?B?QWlLb3pYdHJRS1ltSjJCeWlNaStNWFA0MVV1WGxJMWZZbWpQR2VOdWxwblJB?=
 =?utf-8?B?a2tyRmFzUVJQK0RQN3JyVUh0bE9WdlI0cllWM1NXSmhDS0trR3dZSVZzNjdV?=
 =?utf-8?B?SkZBbGNoQWRHZC94V0RNT051VUtCQXZUN3dMcUhqK1hUZXNNOVF5MlFXN2NK?=
 =?utf-8?B?NXpNeXozWFFYNDBSYStsaUwrZTd4N045UHIxZHdJQUZ4Q3JBME8wQk1GRy9N?=
 =?utf-8?B?WDVVKzRqamRhRllHTGg5RWRKeHlrOWNOZUp3UEk3L1lZdk5xRFRNcTFHZ3NW?=
 =?utf-8?B?NENhbTNmV01JaXBtc2NSWndCbzdmK0RKVHJWTW1PWmRiU2k5SkI3Zkkvd2F1?=
 =?utf-8?B?TmVrc1Yxem5mZUNxM3lIZzB2WnhYNExrdWdad293eUw3TUlQVWRTbVFISWps?=
 =?utf-8?B?cUR6THZCUW1YM0ZBMUxYcGc4UFFNdmZzZ0g1MHFJcFFRZGV3TFJjT1VvMG1a?=
 =?utf-8?B?ZlQ4L05ZdTJhRVg2NUlCT2x4c0dWanYrNkJnaDZIOGY0RVpSNU9WM01xZFpi?=
 =?utf-8?B?Q2p4T0haOEdhSis2c0FqbHJGR3QvdDl5bFVaeTB4bGd1YlFkMDlnaEptRFFu?=
 =?utf-8?B?NE9YZnR4K01QVnBvSE5SelZYTTI3c3dwVG84VVRYQ1d0VHNHNXp5VzgvSlll?=
 =?utf-8?B?c20xNFpmaEkvZmVraFpBRzFFRTU0V0NVVmh1SXJ5SVpPVjJWRUhtRXFuMGls?=
 =?utf-8?B?MWZ6OEtCYnBFMllHMXU3M0xjL1diWW45c3llTXBuWXhPWFpqMXlOZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70371787-3611-4a57-aaa7-08de42d50b86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 10:13:12.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWFU1BBTFnwGq/m23df42MQbp2a6me+8/wEfrchU97Xift0Oqux/V5stBPzEMPKV9l7VNeCCYhWfc78lWMB9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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


On 19-12-2025 13:25, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 05:10:28PM +0530, Karthik Poosa wrote:
>> Expose GPU memory controller average temperature and its limits
>> under temp4_xxx.
>> Update Xe hwmon documentation for this.
>>
>> v2:
>>   - Rephrase commit message. (Badal)
>>   - Update kernel version in Xe hwmon documentation. (Raag)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 94 ++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  4 +
>>   3 files changed, 118 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index c8f211c336be..81f9b5d58850 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -236,3 +236,27 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. VRAM critical temperature in millidegree Celsius.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller average temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
> Same as patch 1. These attributes defer from ABI definition so not my call.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 66a8c3e40027..6d31ad74cd0e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -43,6 +43,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>>   	CHANNEL_PKG,
>>   	CHANNEL_VRAM,
>> +	CHANNEL_MCTRL,
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -99,6 +100,11 @@ enum sensor_attr_power {
>>    */
>>   #define PL_WRITE_MBX_TIMEOUT_MS	(1)
>>   
>> +/*
>> + * Number of thermal sensors.
>> + */
>> +#define MAX_THERMAL_SENSORS    (255)
>> +
>>   /**
>>    * struct xe_hwmon_energy_info - to accumulate energy
>>    */
>> @@ -129,6 +135,10 @@ struct xe_hwmon_thermal_info {
>>   		/** @data: temperature limits in dwords */
>>   		u32 data[2];
>>   	};
>> +	/** @count: no of temperature sensors */
>> +	u8 count;
>> +	/** @value: value from each sensors S1.7 format. */
>> +	u8 value[MAX_THERMAL_SENSORS];
>>   };
>>   
>>   /**
>> @@ -702,6 +712,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_LABEL,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>>   			   HWMON_T_MAX,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -717,6 +728,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>   	int ret = 0;
>> +	u32 val = 0;
>>   
>>   	if (!hwmon->xe->info.has_mbx_power_limits)
>>   		return -EOPNOTSUPP;
>> @@ -727,9 +739,54 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
>>   		hwmon->temp.data[0], hwmon->temp.data[1]);
>>   
>> +	/* Read thermal config */
> Comments are usually helpful for something that's not obvious from the code,
> so no need for tautology (and also in all other places where applicable).
will remove this
>
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>> +			    &val, NULL);
>> +	drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count %d\n", ret, val);
> This is redundant in error cases because the pcode helper already prints the
> error code and count won't be present.
it will be helpful to know the count during debug
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	hwmon->temp.count = val & TEMP_MASK;
>> +	if (hwmon->temp.count > MAX_THERMAL_SENSORS) {
> How does a u8 variable exceed the value of 255? ...
it is not needed, this can be removed
>
>> +		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
>> +			 hwmon->temp.count, MAX_THERMAL_SENSORS);
>> +		ret = -ENOMEM;
> ... and how does it translate to 'out of memory'?

Earlier patch we have allocated memory only for 11 sensors, so we had 
this check,

it is not needed now as we are storing memory for MAX_THERMAL_SENSORS

>
>> +	}
>>   	return ret;
>>   }
>>   
>> +static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret = 0, i = 0;
>> +
>> +	for (i = 0; i < (hwmon->temp.count / 4); i++) {
> Magic 4.
sizeof(u32), will change this
>
>> +		/* Read thermal data */
>> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> Let's not solve a problem that doesn't exist and try to work without
> a cast.
>
>> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
>> +			(u32)hwmon->temp.value[i * 4]);
> Ditto. And you're using both uint32_t and u32, make it consistent.
ok
>
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	if (hwmon->temp.count % 4) {
>> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> Ditto.
>
>> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
>> +			(u32)hwmon->temp.value[i * 4]);
> Ditto.
>
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	*val = 0;
>> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count; i++) {
>> +		*val += (hwmon->temp.value[i] & TEMP_MASK_MAILBOX) *
>> +			((hwmon->temp.value[i] & 0x80) ? -1 : 1);
> Now, this is something that needs an explanation but doesn't have it ...
Signed for S1.7, bit 7 for sign, 6:0 for value, adding comment in next 
revision
>
>> +	}
>> +	*val = (*val / hwmon->temp.count) * MILLIDEGREE_PER_DEGREE;
> ... and the math is independent of the assignment so let's do them
> separately.
okay
>
>> +	return 0;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   {
>> @@ -827,6 +884,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> +	long val = 0;
>> +
>>   	switch (attr) {
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>> @@ -834,6 +893,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_VRAM:
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Do we really need to read it all here?
we can make visible based on hwmon->temp.count > 0
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -844,6 +905,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>>   		case CHANNEL_VRAM:
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -858,7 +921,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		break;
>>   	case hwmon_temp_input:
>>   	case hwmon_temp_label:
>> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +		case CHANNEL_VRAM:
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> +					       channel)) ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
>> +		default:
>> +			return 0;
>> +		}
>>   	default:
>>   		return 0;
>>   	}
>> @@ -872,10 +944,20 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   
>>   	switch (attr) {
>>   	case hwmon_temp_input:
>> -		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +		case CHANNEL_VRAM:
>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>>   
>> -		/* HW register value is in degrees Celsius, convert to millidegrees. */
>> -		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> +			/* HW register value is in degrees Celsius, convert to millidegrees. */
>> +			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		case CHANNEL_MCTRL:
>> +			return get_mc_temp(hwmon, val);
>> +		default:
>> +			*val = 0;
> Do you need this?
incase *val is garbage this shall make this 0
>
>> +			return -EOPNOTSUPP;
>> +		}
>>   		break;
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>> @@ -883,6 +965,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_MCTRL:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -896,6 +979,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_MCTRL:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -1274,6 +1358,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "pkg";
>>   		else if (channel == CHANNEL_VRAM)
>>   			*str = "vram";
>> +		else if (channel == CHANNEL_MCTRL)
>> +			*str = "mctrl_avg";
> The rest of the channels also signify the average so no need to spell
> it out.
>
> Raag
ok
>
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index a3bff76a074d..91e232834482 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -67,6 +67,10 @@
>>   
>>   #define	PCODE_THERMAL_INFO			0x25
>>   #define	READ_THERMAL_LIMITS			0x0
>> +#define	READ_THERMAL_CONFIG			0x1
>> +#define	READ_THERMAL_DATA			0x2
>> +#define TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
>> +#define TEMP_INDEX_MCTRL			0x2
>>   
>>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>>   /* Frequency Config Sub Commands (param1) */
>> -- 
>> 2.25.1
>>
