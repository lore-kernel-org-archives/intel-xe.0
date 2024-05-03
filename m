Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1147C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 16:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D56112033;
	Fri,  3 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mER/Hnck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23E112033
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714753834; x=1746289834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H2uIWeBh8InT3VMpsJ/W+fyQlyiZGvuoTlsvTQYEVo0=;
 b=mER/Hnckb9rQBjoSipzDhXAwseurR7eZ8yaCCYpCiWQw7yi55Yv3Hkm+
 oYrCnlZ+xIRbLE3z9hOtFN0sodxbSVcmrnmwR7uq0CNaDH/FV6cnE6iE1
 C+x4TVshPowPppKv56CzDxgRPYRKkw/cIDB6SioowvxLneu6GA2nxCM+d
 yTVcLh5F9ToPEHSWR6cX/xYvBhzm9JHY/pwfJrWdfxieeXDRErqq6q4HC
 Lf6TAmOXKa5aL4wUbngaoOsfkgUKGsdSbu3UpZm0ghvNBIQjutYj02YkZ
 F/huwngHVMtt3UHTKQ3LAajxaCS/2+O6wDxk8kSgVNeHVTL2QzfdbW9S1 g==;
X-CSE-ConnectionGUID: G/d+vfvGQWaU0EPXMztJYw==
X-CSE-MsgGUID: oiL4OLr8SH2o2ulFNnCPrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10414511"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10414511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 09:30:33 -0700
X-CSE-ConnectionGUID: 1jkUuxM8Q2moV03/OBIGIA==
X-CSE-MsgGUID: LNwL1V5FRtC4HklPef+i3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32302111"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 09:30:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:30:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 09:30:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 09:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt5YYKhjPF74mNxnxlygRvBM8oVovtqPNfVlNHTNnJB/kv4iU/RipPcZUttUp139mOnq+hZ0YX1/R/BNMsBC9u5BGToFNdwWChA4IGBGp5E6rRlobjyiw4+yAv0oduV22gDdcQWOfodEjBYINixAEU68fJe2Y7lcrYv/Mke23wNdGApI7yp2qew4B6sO1AKeo6vcwmz0beqXl6LYCSZbp1yZ2aW6RyWha0wHPZ6rKqlN3ffj/a5cCc5lKZT/s9mGbYnmvm0RIPjsUgj7mv5699uJPqIDc3t5YdCqEHHXJP5/CbN/EkxrGYfKh+WiDi/aw21YhR3MC28C4aZOHMvoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/TPWlIhLe3DVBSb8syMz7240DGAlMcNFr+Zl7YIUgs=;
 b=EWMSx7RIgLuC7/Iu1uu4o4XLauj9Yy2VFW3JCeFeK5s26O0cNpAX2FmtIa995jSAaJvzPDIim8/oKI3lLG0V1zRc7wDnkH9+1xKxgMGU3Mqc8ymrV/vcMRAoW4kCi+9QTRcauJWViNdxI/RX+dK/jODopto9Dtpl59YvNpf3cdVmvGPid1SgjT/tPeSiWElpKEk8bxH3YELdDH+rhWuMc4hQy4ifLgl5f9WACqkRtnBz8rsOijBvv83n9ryhhGrCRF4YpmRN2fxICWAXB9pZTM11i7Eohxz1fw8Ky2fuzAoYjYNmzHKr4wiJNDFMaW65SFKcyP0FTgFqI0DYizMRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.34; Fri, 3 May 2024 16:30:30 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7544.023; Fri, 3 May 2024
 16:30:30 +0000
Message-ID: <46377113-3299-4650-95b3-86942d34289e@intel.com>
Date: Fri, 3 May 2024 18:30:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <20240430162529.21588-6-nirmoy.das@intel.com>
 <SA1PR11MB6991BF7C2848F2FEE0D0F0CE921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <fb91cdda-f59e-4aa8-a9d4-bee6d8f30154@intel.com>
 <SA1PR11MB699133227DCB28AFB23C72D9921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <SA1PR11MB699133227DCB28AFB23C72D9921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CH0PR11MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: e039ed8a-3557-4df4-8757-08dc6b8e5926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1RRdVhnOVB4ZS9ZMHBzd0w4ZUtTd2xxN2RYOG9mRGtLdEQvbWs0MnFocmV5?=
 =?utf-8?B?dktyQXRDWVhQYVI0dVV4SmEwak5QY2Ntb2c1Lzl1eURWS3hvQlhPMEFJUXgx?=
 =?utf-8?B?NXBhNjh5b2NwZkVWWDF0MWpCMnNlTkpOMVpocmV0WUpMeEUrMHhLbE8wSXVP?=
 =?utf-8?B?amw5eGZXRHUxbFh2aFpUd2pYVnRkcW1aSWJVRmd6djBFQVJuYjlBUnEvSWR5?=
 =?utf-8?B?QkVtMURrUm1pOWVEaEJqaVBrZ0REU1BGZmZLOFJ1VWprM3NhUHpmajZCZ3pY?=
 =?utf-8?B?SXIwN1Y2eUhZcHorMjA1bG9sZWdNcjhxZk1EVHRUQTZnc2MyYTgzRlFDUVgr?=
 =?utf-8?B?M0hTcVdtZDk3RzBkNG9lUFBFL1BlZk5pYy9KQnQrbzl2SXNnbXdRTnJNNEEw?=
 =?utf-8?B?UUlwRFU1UzVscFhVR1lGc1lhNTJidTQ4UTVWc0ZFa0ltM1RlWTVxNDk4TE44?=
 =?utf-8?B?M0grY1BHKzZqZDUzMGVPWGNpdjRVTDVLQk1NdW5OSENBYVZUZWZwVHdDRUd2?=
 =?utf-8?B?aUN6Q1hIcE5ONEl1MzJUVzRxL1poTGlXeVNYbGVUYTQreFhGdXMrdWlKbHJX?=
 =?utf-8?B?Mi9HcTBKUnk4MFhWTHVnRVM3SDlmaXpKMGRvV1hkbDRLZE95blVjcEhibWo5?=
 =?utf-8?B?M0N0M3JnUGNJZGN4Tk1TQlhQVEZOZ2ZpZnhZVnpienNiSVVJUi9ESWZrdzhh?=
 =?utf-8?B?RkpPSnE5M0ozQ2JGMjRSWGRMT3NxUnBnZTh2b254QWtFblM4Uzc0NkhMNU9s?=
 =?utf-8?B?T1NPcDV5djNrU0sycjVmMUZEeFZWNUxxODJVOE0wQ0xtYStiUk9EazFlWFd6?=
 =?utf-8?B?VjNmOWVlQ1VkYzFIVzBsRWdEQnQ4S3d0TUg1c0pnWFJqTDVxTmYyZzhTUHcy?=
 =?utf-8?B?blBidTk4d0tIaVRPUmNkbXFmUEFucTkrYUNzQkZKYkx2ZlRVRmExUjdzYlFr?=
 =?utf-8?B?d0t3VFUrVlJIeUtUTjB6NGUwdmx2OWtiQ0YxWllKdzJEbHZnR3BlZTVmbUxr?=
 =?utf-8?B?RTJpVlNuQUpRaHJhMFY5ZlVtc1BLbHd2cDB2TzNRZXUwdXI2SlI2Y1NNOVBR?=
 =?utf-8?B?NFlPeVdhNzdDYWJDM20ySnRNVitoSHNEWUNCYVBUcUE5OUgyZUZqMll0bWRR?=
 =?utf-8?B?dlo0cHBBNy80TlM4YTN1L2l2TnVuOEtTdytoWGpoUTFUbW1wL3p5dFBReWVU?=
 =?utf-8?B?T21ZaCswMmF6NGloY3Rxb2plRkM0SXVrczcxQU1VeDJscGNrdDJ3TkRzL2N5?=
 =?utf-8?B?TkkrZHBRSFlVd3FzQ1Z4L2oyc1MrQVlHaFp1Q2o5eU9iblJRQ2V0bFlvRWpF?=
 =?utf-8?B?OE96dHQ5UW5jQWNnV1ZmVlRUQW14U2RHd2YvVE93Z1YzY0ltQm4vUFdRTXNG?=
 =?utf-8?B?eHFMYnpsQzVJc3dVSmh3ek5OL01uMHpVZkVUeDBXUVo3WFFENDNTTTJpcW5U?=
 =?utf-8?B?cjNJY09NQnNUWXJ6dFg4ZjR1dUtHMDdJM2FsWDVLVWg3RXpSMHJOQ0RMUFpZ?=
 =?utf-8?B?SmRpQit4Z1VmTnY3M3lDbFAxdEl5WEFvZWprS3ZiTExFelYwSkNaQzFoUW9J?=
 =?utf-8?B?RjRCd052RHdxeDFleEhOd0h6b2NEUTFRK2JhVkpUazN0MCtUWFkzZ1hJM3N2?=
 =?utf-8?Q?JMsqfnhpSex9yb5jVkwIoItK27uWq7OJ8DuTthAbQWLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEQrVm5UZkhDbE5abHdqbHZkeFBhQUc3dUF5Mlg3c3FGa25ZMUowM2VJOVVT?=
 =?utf-8?B?WVlSK1N3ZFZpV010dlhISkFLSDd6ek1NbFl3bkhzRnJLWHpDQS9FUy9qL0tH?=
 =?utf-8?B?WlhWaVNSUHo0Yy9hOGpmcVM3N3NBUkNpa3BpUmxOdmRvTlRrajhhdHhJK2NZ?=
 =?utf-8?B?Ujd0MTJuL3VTa0NLTGlITjRDbzR0RXA5VkxOdUZYb3dTODJIMkQyeTlpV1Nk?=
 =?utf-8?B?UVQ2MGJ2OWhKcXFlRlBxZjBzQU5BM3k1b3UwODZlRkVwRmtadXVVR0Y1VXNn?=
 =?utf-8?B?Q3Y0NnMxSDJXay9SVmNMOGZ0RWkwL2tHMnhWcWJoNk5yZ3B3S1N0ZWV3R3Nl?=
 =?utf-8?B?V3d3Rkpzemg5Zk5JUFN0WFhhcUtEZm1OWTk3M1I4NEk0cEJRYzJoUm5wZDJr?=
 =?utf-8?B?ZWtEd3V1OTdtY1RvQ0doZmdpUDRQanJFNEJ4aDN1cFRqd29nR0tCSkM4VTlQ?=
 =?utf-8?B?RDhYSHRoRy9leHpTVjQ5VjA0WVVDQjZwMVNjZHRsVGhibUN6MmRZdG1zME9L?=
 =?utf-8?B?Qm5XTnQ4Q0lDYTRLYTVualFtOVdia3RGcG5wY1hkZ2d4V2ZoTFZQY2xqYURR?=
 =?utf-8?B?ckhaVERBbEhZTHFuc05KNzhCb0VPVWlWaGFrRXhqTjZheC83OGFiV2llVStk?=
 =?utf-8?B?aTl3aURxZStDalNRUTkxc2JPZDlobk12alhDNzRiYUNMcVN6Z3JZaDRGc3V0?=
 =?utf-8?B?VG9sZXIzMVB4REFZbkd0TmpqeiszUWVxTDVHYmJQaFhrMHJsKzRKQm9PZHQv?=
 =?utf-8?B?Ukg0bmt1U3dNNk5mays2NndNeG9FV2hLTWFsb1FrY2Z6ZHFjem1CRE5VSTlk?=
 =?utf-8?B?NkRJcWJYRXpGWWtQdHQwUDlqb1VPUU8xZ0JWRWgreEVXRXM5YUZZVE4yWFFW?=
 =?utf-8?B?bVY2UVovWCtRampJcEJnREoyZTJBS1FWbkRabnMrb2djZkNNUml0bXFPU0JN?=
 =?utf-8?B?NVhRSWM1Uko2UURkaDdiWXUyNWRKT3dwMlFtNnBJYWEvZFFtd3cxU0Z5U3JS?=
 =?utf-8?B?M2RVWW4wREpCN0FSZWhkMHFMTGRtK2lZcTBpeHdONmtRVlFWOTJtNnRBWXRk?=
 =?utf-8?B?MloyQ2JmWkZXcE13T1dGMjQzWG4yREM1NlNzMG4xbHpCYUdCamgxM1k2MzY3?=
 =?utf-8?B?WEw4T0ZnaFFsS0sxeUFEUkhxOU1yTnAvNzEwSWh6VUJvUnBnSXlTSEplVTkr?=
 =?utf-8?B?cFBWa0tsS2NlZVdYM3dNWXN1QVd2K3dNT3NKV3VGK1ZHVUZJR2VLQmNpQXh6?=
 =?utf-8?B?S056UUJkTWRueE16Mmk5VGhvWUo0K09jNFp0aEMxQ1hIOGlTWmdGYkpzQjdC?=
 =?utf-8?B?OU8rcTZEVjRWNmZpSFg2QmRNSmRlTkd6NDVVd0NBbXNxZGw1dlV1UHB4emZt?=
 =?utf-8?B?cWpob1BCdHNyQjBFQ0xwampEVFV1UWQybThMTmlrandJdk0yYmNDSlVEUlpo?=
 =?utf-8?B?SUhUSU16K2o0bm4ydlZUZDVsUUJZMTYzL0hoelZnbFB0cFFlUTFSU2huN2Jz?=
 =?utf-8?B?K050TUkwbXQvUktvSTBBUCtPd2RNVEdvVDBVMnh1bWc2OUdGb2xnZ0tsYmpD?=
 =?utf-8?B?TkJSK0lxMWNJRXlQSFlkanRPdU9FcHRMZnU5Z3RZSWQzd0UvTE1jSHlDeSto?=
 =?utf-8?B?WW5FMnRneDNhR1piOTdIbUowSGtoTnRCYTFDZjJBRS90dUhhVUF2QWNGbHdy?=
 =?utf-8?B?TE9CSy9OSmNZbi9qcGpTRWFDVGpXckhpWk5UL3dad0Nub29xV1B6RHRyTzFu?=
 =?utf-8?B?OGxUWkxkem1TcG84c2VvNlZKeitlUW41TWs5YU5kTHNZeDFsSXJOS2lJUGdM?=
 =?utf-8?B?aStabk5ReDdlSnlET3NLNkZVM3EvSGhHWXRreWtmZHN1bC91V0d3UjFwS0dJ?=
 =?utf-8?B?MXFlZnJHSGhaWERFVklzWkpPVyt3Q1VpQ0x3RHR4V25Bd2pUN0I2U1dFSGpp?=
 =?utf-8?B?SFhtRmZzeWZrYlNmYWsvR3RwREFYL2UrMFByYUNHbEd2V1JjekRoR3VWM1Fv?=
 =?utf-8?B?L2g0Ri8xaStqaklJZnB1dlRXRnVkOWNlT2xtMFNYeGIxOGJWVzlwTHVMU1BX?=
 =?utf-8?B?ODVncDFCbTJRdy9aRUtuaG9pMlBVbFV6ZWlUUlVrQzd5UDlJdVFjeWlHc0JF?=
 =?utf-8?Q?083M5wTqphXShW2dWKb4H337Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e039ed8a-3557-4df4-8757-08dc6b8e5926
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:30:30.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AYZ12LeUAoxGSofH5cXGJmF6b0NL8c3n48wPCM4iaqww189/hNGdxBMNuqaZDFkspnFxaemERzXpFDgDmLg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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


On 5/3/2024 6:11 PM, Zeng, Oak wrote:
>
>> -----Original Message-----
>> From: Das, Nirmoy <nirmoy.das@intel.com>
>> Sent: Friday, May 3, 2024 12:01 PM
>> To: Zeng, Oak <oak.zeng@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Mrozek, Michal <michal.mrozek@intel.com>
>> Subject: Re: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
>>
>> Hi Oak,
>>
>> On 5/3/2024 5:39 PM, Zeng, Oak wrote:
>>> Hi, Nirmoy,
>>>
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>> Nirmoy Das
>>>> Sent: Tuesday, April 30, 2024 12:25 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Mrozek, Michal
>>>> <michal.mrozek@intel.com>
>>>> Subject: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
>>>>
>>>> The default behavior of device atomics depends on the
>>>> VM type and buffer allocation types. Device atomics are
>>>> expected to function with all types of allocations for
>>>> traditional applications/APIs. Additionally, in compute/SVM
>>>> API scenarios with fault mode or LR mode VMs, device atomics
>>>> must work with single-region allocations. In all other cases
>>>> device atomics should be disabled by default also on platforms
>>>> where we know device atomics doesn't on work on particular
>>>> allocations types.
>>>>
>>>> v3: fault mode requires LR mode so only check for LR mode
>>>>       to determine compute API(Jose).
>>>>       Handle SMEM+LMEM BO's migration to LMEM where device
>>>>       atomics is expected to work. (Brian).
>>>> v2: Fix platform checks to correct atomics behaviour on PVC.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 37
>>>> ++++++++++++++++++++++++++++++++++---
>>>>    drivers/gpu/drm/xe/xe_vm.c |  2 +-
>>>>    2 files changed, 35 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 8d3765d3351e..87975e45622a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -619,9 +619,40 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>> xe_vma
>>>> *vma,
>>>>    	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>>>    	int ret;
>>>>
>>>> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>>>> -	    (is_devmem || !IS_DGFX(xe)))
>>>> -		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>> I think below logic can be moved to a separate function? I am also good if
>> you leave it as below. But I think a separate function is better
>> I was thinking about but I think we should do that, once it gets more
>> complicated with madvise-like options.
>>>
>>>> +	/**
>>>> +	 * Default atomic expectations for different allocation scenarios are
>>>> as follows:
>>>> +	 *
>>>> +	 * 1. Traditional API: When the VM is not in LR mode:
>>>> +	 *    - Device atomics are expected to function with all allocations.
>>>> +	 *
>>>> +	 * 2. Compute/SVM API: When the VM is in LR mode:
>>>> +	 *    - Device atomics are the default behavior when the bo is placed
>>>> in a single region.
>>>> +	 *    - In all other cases device atomics will be disabled with AE=0 until
>>>> an application
>>>> +	 *      request differently using a ioctl like madvise.
>>>> +	 */
>>>> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>>>> +		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
>>>> +			if (bo && xe_bo_has_single_placement(bo))
>>>> +				xe_walk.default_pte |=
>>>> XE_USM_PPGTT_PTE_AE;
>>>> +			/**
>>>> +			 * If a SMEM+LMEM allocation is backed by SMEM, a
>>>> device
>>>> +			 * atomics will cause a gpu page fault and which then
>>>> +			 * gets migrated to LMEM, bind such allocations with
>>>> +			 * device atomics enabled.
>>>> +			 */
>>>> +			else if (is_devmem
>>>> && !xe_bo_has_single_placement(bo))
>>> Note bo could be NULL here...
>> is_devmem checks bo that so I left it out.
>>
>>> So userptr and system allocator don't have a bo
>>>
>>> Userptr can't run into this case because userptr can't be is_devmem
>>>
>>> System allocator allocated memory can have devmem backing store... so
>> seems the logic can be:
>>> (Is_devmem && ((bo && !single_placement) || !bo)
>>>
>>> But we don't have system allocator for now, so your logic should work for
>> the current code.
>>
>> Yes, default for userptr is AE=0 hence I left it so and planning to
>> change that when we have madvise-like ioctl.
> Not only madvise
>
> What is in my mind for system allocator is here: https://patchwork.freedesktop.org/patch/588534/?series=132229&rev=1
>
>
> As you can see, there is a case where xe_vma_is_devmem returns true while !bo.

ah yes, I see what you mean.


>
> Anyway, the code seems good as of now.
>
> Oak
>
>
>>
>>>    If you write as above, then it is future proofed. I am okay with your
>> current writing also - I just need to change it a little when system allocator
>> come into picture....
>>> I do feel the logic here is getting complicated, hard for understanding and
>> maintenance. Let's follow up the other email thread to see whether we can
>> simply default all allocation to be NO_ATOMIC, and depends on compiler and
>> UMD to set atomics up.
>>
>> I will keep track of that.
>>
>>
>>> As of now, Patch is:
>>>
>>> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
>>
>> Thanks a lot.
>>
>> Nirmoy
>>
>>>> +				xe_walk.default_pte |=
>>>> XE_USM_PPGTT_PTE_AE;
>>>> +		} else {
>>>> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>> +		}
>>>> +
>>>> +		/**
>>>> +		 * Unset AE if the platform(PVC) doesn't support it on an
>>>> +		 * allocation
>>>> +		 */
>>>> +		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
>>>> +			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
>>>> +	}
>>>>
>>>>    	if (is_devmem) {
>>>>    		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index f1357e2a3b10..d17192c8b7de 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -888,7 +888,7 @@ static struct xe_vma *xe_vma_create(struct
>> xe_vm
>>>> *vm,
>>>>    	for_each_tile(tile, vm->xe, id)
>>>>    		vma->tile_mask |= 0x1 << id;
>>>>
>>>> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform ==
>>>> XE_PVC)
>>>> +	if (vm->xe->info.has_atomic_enable_pte_bit)
>>>>    		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>
>>>>    	vma->pat_index = pat_index;
>>>> --
>>>> 2.42.0
