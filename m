Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E998FC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 08:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EE510E0A8;
	Tue, 14 May 2024 08:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvvHTkg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16A10E0A8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715675489; x=1747211489;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mDPL0A61NVcQbnRClHyARnwAB/BScxVcsP7s7bfKXWA=;
 b=RvvHTkg2TWvIIsVLDxOBqTsZ58naj3NX2YN23ScQA/TIg+9ZSRF961V2
 DviGCPUXhcjRhM0vTP3W/cI6zRf8AaL56gRWCZdeaM4cVhA6oEfkl8CfP
 02aqs25u9HJxEbeYklxM1u0l2H63ONbxoFaILZiJ6VczVfT73tntVaJhz
 SvVIeQBbr+Hl1Tx730E90zjihMhFWCcLZctZPElTho0B8vRX/bx8LHLb6
 WNVgYgrgeAIbgmbzFJWUDHHupwKvLC5odyhPHxcm4p6Bvu+I0+Nr4WPoL
 q+v/cRV0uTGgxGv4orz08Lvk3285/d3glGOiAellIsb7YnQzW+Smv51+2 Q==;
X-CSE-ConnectionGUID: GWv6iseyTVOo2dYP/Ne08g==
X-CSE-MsgGUID: oQtlTDRJTda6GXI3jx9opQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11496744"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11496744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 01:31:29 -0700
X-CSE-ConnectionGUID: YlW8xAklTbyGjhbuuCdEZQ==
X-CSE-MsgGUID: fG0UXgEgR+eFHVFUW011bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61438757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 01:31:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 01:31:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 01:31:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 01:31:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 01:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/Qk1nd1fWraXNA3qmyjSAgRu1H8/YnXwoLGdVbrovh/M1EZD0YanMws+dXPy3MpcORSG2ceZZwHXIiWGpcnqfRoDLwbMc4DFo55BOSCYFOTwr4go7SPDI/1YQnlPcmfRcAuc5gPIrTjJrnaeYk7G69t06qHXIBcfZ2veRgzKuN9DODEVA5KH0HOmND6PafA7eXkzqlMGogpPeyPsbRDh0DTds9uuEdu8zT2O/TEG9ahqYViyUec7A7m0/zC7dQEMoodnuGeCAreEmBN4hwllNsDC21Cbp3IAyP2tQYeECcuIYmeGW+gBTFOxh5QKZqtb27Eme+OhWhfJAR6NHbIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF4XXMjGvqt/nzqnHzqFK0p6oKap3OhXMGa75IW+C9k=;
 b=nnl8Xt1c7QEi7/NrX0eK0kfiXmkMOq2n31C0eXVJAVF/VWXUnAHvV799Skg8LC9nrBDbnNXOQuKvkjbR7k77L47RJIZKBfZ4xUif/tsKYhIoncVw6StD8cuhHoTACu+OhOfzWQaV+xlqXDejO1A3N1mU1tpzFoR9HDAMIKJCkrIkLWe0YveUoEmEVvUqonzbeiVGyXaeiPTt7dEmzfJSwD3PgFRcFrKkiUEGLounWMmkCFTnWLl5n5lLGJJlr/B64ePp8VPEaREVA53WTlqNaDmzuwYL8WqpYZgJLfiIzqXDYCUTfMRBQzfpkVBBmepgN3y47lDjfBS94Di6vD2pMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 08:31:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 08:31:25 +0000
Date: Tue, 14 May 2024 10:31:23 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] drm/xe/pf: Introduce functions to configure VF
 thresholds
Message-ID: <20240514083123.ig5oyan66lphsdm6@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR06CA0055.eurprd06.prod.outlook.com
 (2603:10a6:10:120::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 9891da01-c375-4154-1181-08dc73f03e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVJUNEYvbExRYXFyTno4VytJdGExNW1QdXB0VTZVTVpXZ3ZyZjJRU3o2MGpa?=
 =?utf-8?B?WUh1MUx5bVNPTHlmejJUb3RuNHo1RUhoc2hUZmxUTEgrSWsxMXBWakx1Q3Bs?=
 =?utf-8?B?YkF3OVRWcHlZTURoRG9scndiY2VKcFhxM0l5QWxXa0RvaFU4T1RkQkppZEZx?=
 =?utf-8?B?SFNBemVHa2FCcUZxMXF3RnRuVlFzbTgySlpLU1BHS05oLzExRmQ4TUgyNTF1?=
 =?utf-8?B?cDZyUkxZQllMdUYxblVBM0l3VTQyZ1lHZ1U0K1pteEZYQ09VQjdXcHdtV3gr?=
 =?utf-8?B?WHNFV3hNYWdKeFVUYTdUeEsyNVpxTnplOFZZODkxQzZhNEpJWFFuTnJHczNm?=
 =?utf-8?B?aFBWSWJValJDSldHTXBhQU85S1hIbE1telJGMDNnV3R5QzNKSi8wQngvMlZl?=
 =?utf-8?B?dTUrdmlBOGhtbXZkNXpWbkpEbEdiRndlUnJEMEZnN0lqQ09ISXdNbVoxTVk1?=
 =?utf-8?B?TG9iVTkzNTZtN3JKSC9Rd1MwRWkxMjVzQ3RRckxOcnFvRGY0VTlhWG5oY1NH?=
 =?utf-8?B?NkFCVnNNd2hPcW12Y3hIQ3pCMUlEYWJjTlRnSWN5QUlWZnorR2xDUXd0YkUv?=
 =?utf-8?B?bjVYSHlCRUNZb01uRWVXMVFLcTdpOVBKNmlqTG1CQURwRmhzM3hjbUlDcHlW?=
 =?utf-8?B?dEhPeHZDcGZXK2t1M2xWelZQUFBmSG5GSjlyMXFKcjFlRlJyUHVUZVp5WFg2?=
 =?utf-8?B?WG5qM0xOTCtzYlloeERublh2NEJFbG1ib2JOTnVwTzNua1pMVk0xSXlkVHdh?=
 =?utf-8?B?dDQ5NmVPaWFIazViMFRqQ3kwaWxvRnhjWWw2eG9NaDVJTnd1b1U4a2pXVHA4?=
 =?utf-8?B?bFI1aGc1WFlEWmExTXJoSFVYUHNJTlowL1FaZ2d5NFRLcVdBWnkxWVMwUUJv?=
 =?utf-8?B?blU5b0J6S0lLdklMUmVYcVlUU2VsdWhDK3FuQU82cjRNRGtoVlF5dEs1ZTI3?=
 =?utf-8?B?b2ZNZmNhdURFM0thUWFXbEFZaWt4RGdkcTJCeUMxazFwRTlJeXVobEw2Vytu?=
 =?utf-8?B?Wkw2WlREdWNKSkkrQmtlSEx6VU9qQ0tGUHc1TWN2VUJhc3VjRDRzMnlhQktT?=
 =?utf-8?B?b1FLRG1sdTQ2Q0krMTFsSEtoRFFxZzRKRHc2a0JrdE8xYkRNWlJIc3RCVzhi?=
 =?utf-8?B?Y2wzNVdYNnhNUE0xdUhXMTREQkRqSGh6Tk82Vm9FcFo2b3hIVHd5Y25oRTFq?=
 =?utf-8?B?T2NiZ0ZHNWlJd0JySGNCbDNVdk40ak5TRFA4QU9Ca3F6TnhwY0FFU3Rnd0ZW?=
 =?utf-8?B?Mm1ub0VIQ1BMZm5YemhoRnlUdXN5S1J3S3NsMTdvVUJyMnd1YjQxTE5zRlZP?=
 =?utf-8?B?cnNIN3ovOXA1ek0xbzl5dk0rTUtwbTdEeWdZL2FQQ1I5VUhzRE9sUFhuSER6?=
 =?utf-8?B?bmxKZnUvOWZXaEZXVmRDTXZnVlE2SnlCSlh5c2ZDbkVvUHFjcDMyVk4yOXcy?=
 =?utf-8?B?bmR2S2EzL3F1MVAraXpxazlCRGhtazBPQi83a1FkOW9OdGZiNWRWR0FJQzUv?=
 =?utf-8?B?TjNVSjdYT044V2U5bnRSeTl0dTdEM1BEMC96T1RuSHRtZ1dwTFRWbitIVi9O?=
 =?utf-8?B?Rk9mZDE1dlZsakUyeTA1blN2bk9jTUhWdUdrdklSQ2d6MGhlcTZJaWxpMGtx?=
 =?utf-8?B?aDZNOW9FY2ZTVzA1Q1lIZFMrY2lBdnZQdHJOMmdhTjYwc3Y2RDhUNkg5NUcz?=
 =?utf-8?B?ejhXSzNNUkdDdW8vNllVYXVtVkt0My9kd0pZNENOa1FOenFOeEY1TzFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2loZDgyMWUyaXlYSHNtOWtJaGw0LzNQckdvZG81QlpHcStCKzJzRUVpbFZa?=
 =?utf-8?B?cmoyTFg1djVybG1PKzMwZHM2Q2dRcFFYYXZHcFp2aU5ON0d2dll6Kzk0ZjdB?=
 =?utf-8?B?YUN3RUdYdGFxYnQ3OUNhbUNwTHFSTDlONW1JZDFwdHBxamIwMG1JZWtJazJv?=
 =?utf-8?B?MXBrNGV0QUluYksxdEF0d3R6bmNlb3d3QXJGNEEyTE1odzRxb2dqTEl5SXZx?=
 =?utf-8?B?UHFWMEpXSDJ3VTM2K3diYjhHaStoRVAxeWxlc3VDZEE0QVNpaCs1RW16Qmtu?=
 =?utf-8?B?NUlEcDNrNmcvVXJWM2RLMFk2VXVTRUZwc0V0Zy82ZmIyTFYwR3BtRGYwcFpy?=
 =?utf-8?B?Z212YVhNbVBzVDZzQkI4SHV6NVY0OUV1VHdwbXFNR0picG1qWUg5Zk5OQVc5?=
 =?utf-8?B?OEpUWmp5cnh4RElZTDR2bE8xMnJaaFF3RThXblNBUnpFNVJHVDIrRFdncVVG?=
 =?utf-8?B?dTY2YWl0cE5OODZEOUgyaVp1aVlraERUaVFnb2x2MmJteHpldHUzSC9KUlM5?=
 =?utf-8?B?MVh5ZU95am9DNkJKMDZRM1FMZnErRmQyZXZaV2xYY2RkYmZKcWlIc0YxQnox?=
 =?utf-8?B?eVllRGwyenN0UndXM0p0VExybkQrNnBwOFhubDdNSlFhNVZ0djUvQ1Y1Znp0?=
 =?utf-8?B?MHZtSy9DZ2ZJSWJvdGdUOHNldlkrL080RG1hbVlSNTE1Ukl6QisrNGttaGZE?=
 =?utf-8?B?WnFXUVFlRjBYQXRmUUVUblluM3I1cHE5QlNvQjZWZlhoK3VZb2dsdEVDV0I0?=
 =?utf-8?B?NHltbXQ3VXIzYzF6c0FOckRsdE9Yd1pLVFlSS2N5OTZaUjZCRldwSEc2WWRx?=
 =?utf-8?B?Z2Z1amY5S3BGbUk2UERnVUlpbXkrallmc1FLdDZaV3RzdUYrUlFJclpmbmtF?=
 =?utf-8?B?OEE4R2FXYVlGMjFVdWNqUWNEWnZ1NkNidzREL3h2Um1sbVRPcG5xNEYwMVFT?=
 =?utf-8?B?V1h2UGFuQ3RKT2hKRlYvVHlVWnNVMjFKMm5MV1dobis1UUdzTlJ3R05mc3E2?=
 =?utf-8?B?MGVBM1owTkoxRW53dkVZTDdVSEhRTkR2cFJZSXFDVGx1RDhyZ0Zvc3BNam53?=
 =?utf-8?B?RmRyZXRsRmozMzlwN0czTG94aFM1QW1oelM1ckNDcmV4R1NnYWJPcE1VdmM5?=
 =?utf-8?B?V1NSdHU0KzBNYS9JVHJtMUQ3MVo5bmRJZ250T210aGdaTnpaTExhZjJidWQx?=
 =?utf-8?B?K0R2QzlBRW1UL3VDL3ZLeGZsUVdBQmxIckJhN3dNV3p3UFlaUGRoM1lnNDJF?=
 =?utf-8?B?T2JFenBNKzRCQkhUOXMrcmxBOXlacXFwalR4UGpuVG9GdWZwN200aXl6L0pa?=
 =?utf-8?B?N29BVi9mMFhKUjh6eHEvUWNkUCtqYi93eHZhZlhMV3FwNlVDWGc2MG1oUkw5?=
 =?utf-8?B?ZWdpWWNxcHA2M0VZRlc0c0tqM3JvdkFBMHVEMU00emordVA4UktHcHZxaS9J?=
 =?utf-8?B?c09wVVNVNFJ6RCtmd3ZJRU1oUUdPaXVoMTV1SlpnMmtMeG8zWklCRlNtSnRV?=
 =?utf-8?B?Qk0wNjdRUDlLSHlORXBOU1dPeXdCSWp0eGtDeXRsWjVhcWpRYTdyNmg1bS84?=
 =?utf-8?B?VFRvYWgydVNiNTRFdmRiQlFOSEgxZ2ZaWXA4elZ6cTJXYlBjRzFsUFJnVkVF?=
 =?utf-8?B?bVArN2xrTVVMNUkrUkJML3ZRZHdTeUo1dzFNVU9JcHhRdlBObXcvUlc3Kysr?=
 =?utf-8?B?ajh6RTVTYlpZMUNGOE1rVkg5OGd4SitPaTBuMkk4WjhtU2xWelZ2RkJzR3Rw?=
 =?utf-8?B?eG1NNHNuMlpaUks0VGF1TU1oWDRHSUZDYjVVbHZOR2l2TWdYaVFmTHhCZ0pk?=
 =?utf-8?B?WnlKeE1yYVBlNmswYyt6ZWc1bC80d3lCQm13a2l4bHZNYU1yOTJ3M09oOXd1?=
 =?utf-8?B?MmlBbmc4Sy9jMjM0Y1M3RkwyYU9QTU4rNGQxZFgxVXZsQ2dOYXJFTTE0SS9x?=
 =?utf-8?B?ZDVzbG9ubFp0RjlVWEVXN2pyUkd4SDU3T2NyeDVYT3JFWkkxSkV3cVU4Q0wr?=
 =?utf-8?B?OVc5S3dFSUxtZnp0QU1nZXRQRzFiVWVVbzZsYjBxY2tWMmRyNkVsVWpvbGNJ?=
 =?utf-8?B?SjFwM0p1MHNtR3NzRFZFRnoxS05BaUxwanBDazU1ZGswdlBPZXdnQytlVWxK?=
 =?utf-8?B?aDhUY21PSmNTdkhQZlFKb0RBSytXN1plOWo5Tm12WitDR0NWU25SOGRrcExN?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9891da01-c375-4154-1181-08dc73f03e1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 08:31:25.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WEBAevagioFfBKY3bBGZGMIqYn/eSRwtnPGMjrMgA3QHROCBNOLJ1L0jmbYQr0XSGPg59Uu0yRfSOsAkwrj7rDN8rTFfvhgwzKOeY7e54M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:10 +0200]:
> The GuC firmware monitors VF's activity and notifies the PF driver
> once any configured threshold related to such activity is exceeded.
> Add functions to allow configuration of these thresholds per VF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 87 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  6 ++
>  .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  4 +
>  3 files changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 7eac01e04cc5..fd35375ccd1e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -25,6 +25,7 @@
>  #include "xe_guc_fwif.h"
>  #include "xe_guc_id_mgr.h"
>  #include "xe_guc_klv_helpers.h"
> +#include "xe_guc_klv_thresholds_set.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
> @@ -208,6 +209,15 @@ static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	return pf_push_vf_cfg_u64(gt, vfid, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, size);
>  }
>  
> +static int pf_push_vf_cfg_threshold(struct xe_gt *gt, unsigned int vfid,
> +				    enum xe_guc_klv_threshold_index index, u32 value)
> +{
> +	u32 key = xe_guc_klv_threshold_index_to_key(index);
> +
> +	xe_gt_assert(gt, key);
> +	return pf_push_vf_cfg_u32(gt, vfid, key, value);
> +}
> +
>  static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> @@ -1748,6 +1758,83 @@ static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *c
>  	config->preempt_timeout = 0;
>  }
>  
> +static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
> +				  enum xe_guc_klv_threshold_index index, u32 value)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int err;
> +
> +	err = pf_push_vf_cfg_threshold(gt, vfid, index, value);
> +	if (unlikely(err))
> +		return err;
> +
> +	config->thresholds[index] = value;
> +
> +	return 0;
> +}
> +
> +static int pf_get_threshold(struct xe_gt *gt, unsigned int vfid,
> +			    enum xe_guc_klv_threshold_index index)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->thresholds[index];
> +}
> +
> +static const char *threshold_unit(u32 threshold)
> +{
> +	return threshold ? "" : "(disabled)";
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_threshold - Configure threshold for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @threshold: the threshold index
> + * @value: requested value (0 means disabled)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_guc_klv_threshold_index index, u32 value)
> +{
> +	u32 key = xe_guc_klv_threshold_index_to_key(index);
> +	const char *name = xe_guc_klv_key_to_string(key);
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_threshold(gt, vfid, index, value);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u32_done(gt, vfid, value,
> +				      xe_gt_sriov_pf_config_get_threshold(gt, vfid, index),
> +				      name, threshold_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_threshold - Get VF's preemption timeout.

Wrong description.

> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @index: the threshold index
> + *
> + * This function can only be called on PF.

If these two functions (set/get) can be called only by PF, then maybe it is worth
to give somewhere an assert that verifies it ?

> + *
> + * Return: value of VF's (or PF's) threshold.
> + */
> +u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_guc_klv_threshold_index index)
> +{
> +	u32 value;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	value = pf_get_threshold(gt, vfid, index);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return value;
> +}
> +
>  static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 5e6b36f00b5b..e8238c1ad06a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +enum xe_guc_klv_threshold_index;
>  struct drm_printer;
>  struct xe_gt;
>  
> @@ -43,6 +44,11 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  					      u32 preempt_timeout);
>  
> +u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_guc_klv_threshold_index index);
> +int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_guc_klv_threshold_index index, u32 value);
> +
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
>  int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> index d3745c355957..7bc66656fcc7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -8,6 +8,8 @@
>  
>  #include <drm/drm_mm.h>
>  
> +#include "xe_guc_klv_thresholds_set_types.h"
> +
>  struct xe_bo;
>  
>  /**
> @@ -32,6 +34,8 @@ struct xe_gt_sriov_config {
>  	u32 exec_quantum;
>  	/** @preempt_timeout: preemption timeout in microseconds. */
>  	u32 preempt_timeout;
> +	/** @thresholds: GuC thresholds for adverse events notifications. */
> +	u32 thresholds[XE_GUC_KLV_NUM_THRESHOLDS];
>  };

With fixes:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  /**
> -- 
> 2.43.0
> 

-- 
