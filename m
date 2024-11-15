Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18396D6DDD7
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B2310E06D;
	Fri, 15 Nov 2024 07:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVr1AJKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001E210E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731654766; x=1763190766;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vBPy9PorjCoO5r0us4k5WZc3geaiknaKCEyIEQletPg=;
 b=nVr1AJKXQDw0qj3qdDxrd1poqoWwEioXDPJx3p5gnqAk4uPmW/t2psxK
 2/aUb8qRb+vIwxw/lGU+LrtlDmhrb5yngvI/zVNrSZqZgAkumKk5BZLr3
 B5S/D1L4JoodPfxVFLvRN59QwWxnb7cqut4vELE5tGHgUK0ZzsELI3CTH
 2toOk2jjCTXi0bStuzc6sPkv66XGg1KyWcKEzwsLEZsB7kguG0Dade5Lm
 IbKlLvbbwkx7H7+RM0GhobjAvGcVPJUgWReLgfTu5LIHSDwxhTQS2Pmfd
 Op8AuOM7mbyuNx788AF2VIFjFdSV2fBLtRXDsDeGIeMSUgUp2+pwY3/K1 Q==;
X-CSE-ConnectionGUID: f/2pJ0cqR3in6aL72awuOw==
X-CSE-MsgGUID: nKQYcMuWQsCfUb8oK/Ukyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34519463"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="34519463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 23:12:35 -0800
X-CSE-ConnectionGUID: 7JKHlITHSsCU8Xu+zwHtDg==
X-CSE-MsgGUID: K7bpx90XQTmLCD1T10ULpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="111752035"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 23:12:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 23:12:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 23:12:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 23:12:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlEJabQGUdnG85UIrwFqdg8OUwLIRB96SQhkYpA+mROByXvaQFL0ci7/ihE/gWsDPaRwmnPnv02V4cB20Hi5B0bXE6Rd7zGDzPvtJ8JTsw8Qw1nPr8QnnCjW4qKWSPeC/KP+aDdDjS9cXn7gQrbSeOB0+yIy75rgU6Bt510PLrkHYk3Wg20G2DT5jL9kQpxmjWcBeFbwD+EJSoDb2ImuyOi8XAiEcFf1FetNUuH4wXhBZyIz2nz0OXADU/LnsBDB7ceMpEr9+XAsdFQ1hl6EBKJGLqXMF9ve0J1zNsLdUCHK8dZzs9BP05ZaZqybqY5cWThxZ7FW2H+AWx9zEhmaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSAny9UmkD6Pz7AVzKP3RIKW8xOxYUXmMpausdGaLS8=;
 b=gbAnRiIjUg4PslHvJbucXwgPO85kDsZm/Ay1fDgNcYWIouB74C/ccOzF97tITRag+x7+oSE6P0Zm6eFc2z4Aekq8YJ1vtnzy9Yuwx8SoYsarwIucH3MQn0OUGd3+Denjkc8jh9fTrjhe9nqXjNJSanKULqDd60Ezeww5TKakdLLzKFvBC9Nrg/Q7/10poi5urjkwqkHsdOrYcTNlCwHgD5elQw16taJSJbHyKgQTTzXt1VNkmu+IniMD9ItWFVsDV9zWdZfRzCgZa9H/PXU/INLwKUWajGNgWw95QBolNl0xkuI5CQJJtJ8Rx7VVWY9vh72MSAW253TGyZkYhTQXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.19; Fri, 15 Nov 2024 07:12:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 07:12:26 +0000
Message-ID: <0309deb3-0280-4c9a-bd45-5be94b578108@intel.com>
Date: Fri, 15 Nov 2024 12:42:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/xe/pmu: Add GT C6 events
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241113232700.151910-1-vinay.belgaumkar@intel.com>
 <20241113232700.151910-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241113232700.151910-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ded0519-84cf-4bba-9d3d-08dd0544dbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzFiaCtlNkhvRGdYdFFyWnMxVUJWaHo3ak9qMXMzUFQ4WFdEYUhUbEVvQXNQ?=
 =?utf-8?B?NnN3MDRpd0ZWeGdVeGZ4SkZZaVZnMXAyODEzVmlZdnYyaldoaEk1VmVHY1dy?=
 =?utf-8?B?VmhiekpIdFc2YUhSck1ueFFmeGdHVjJzL2VDZlVhb3NkRHVuYnErdFZvOGc1?=
 =?utf-8?B?djdZUWFka3NSNCtBK3lLQitDaHE4bUJ5UXFyK3hUNHBpUkNXaGtpalEzemJk?=
 =?utf-8?B?UTZEdm5BZ3FTb1RGSDRUamRoV3dMSENqQ3EvVnFnY1JqQU85dlM3S2VuNGcw?=
 =?utf-8?B?V3kzaEU2VWJ2WEpMZjhlemExamsxOWNmTk5jNFBhWGtGNmdzWVBROUYzS29U?=
 =?utf-8?B?NzJ6Q1FWK0d4S1FkVDJNUmVSWldjYmd3ckh6c2w1SGhidlZNbkw0eTNNZE54?=
 =?utf-8?B?QW8yd3NaRStKMk9xbnZ3RkNZWGYvVDB5dmp0dkNyc2dOMzBMRm04b3ZkRlJ5?=
 =?utf-8?B?SHp0anAzaVc4OUUvQzVHUVRMK05QY1FRMklpVG04M1BiMHNRbkVFVDkwRjlZ?=
 =?utf-8?B?akR3TTh1dzlUc1BzK3QwN3YrV2ZvQktSQnBWYmQ2ZzdIUVFiMGNTK2dOMzhw?=
 =?utf-8?B?cmFQT2lKb2pRYmM4UmN2b2pqWEt6ckFLd2MyeEpid1ZmV1JVaFg1RS9GMDQv?=
 =?utf-8?B?OXpwaWRTZnl2MzNuUHlWYVNGejU0bklJVXQzRVB0aFd1YXFrWFRjMjF6K1dC?=
 =?utf-8?B?WHB6WjViUmE2U3YyeTJhTTFRQmxpTHY3MkVUSm9TN0k3ejh6alNmcEloVDNU?=
 =?utf-8?B?Qzd1djJYYjBmTTVLb1pSQjRjcHRzdUszdmFtVUcvZHZDcFNZSjJJT2JZdUtW?=
 =?utf-8?B?QVpVWU1TckJndjR6dmpFMlY0OU5HR3hENE11ZDlVMTlNaENEdDc3OFdpRm1w?=
 =?utf-8?B?dHVjWmFJbnlpVkh2ZmxVcE15d01MSjVkVjVuU3ZoRmRMaGJHYi9vZkI0aTJt?=
 =?utf-8?B?Zmo4ZDlVdmVVY25DOXNaSDhhU2JHTUF2WVc5ekpRVWk1YWlqL2NlRWJRS3Nu?=
 =?utf-8?B?TFhRMFJJTERGNFQ2QkVETlNIM1J5cUZFaWJTRWI2MWVPZEl2a1JKcVVyTzd4?=
 =?utf-8?B?Zk1sVUUyZkhtL1NXZGJLMVVEOHNhaWNPWGJtN2Y5ZTVlMG1aV3ArLzBiWDFo?=
 =?utf-8?B?a1Mxa0lGM0E5NkhWRjJjU01ZOUlYRTBoc1VLMDMwVDgrZ2NqY00zL3NINnoz?=
 =?utf-8?B?eWZvYTlIMWpjL1g2LzFzb1RObXUvb28zRGY4UmI5TzI4WnQzMVRwNTgyTjZ6?=
 =?utf-8?B?SStFNjhhd29iNlExNHdwc04zeWN6bWRmczB3c3NPdjV1Q3dhT1g4NU4rM0Fm?=
 =?utf-8?B?N2x5QnlYbEdTS0hraFpJR2NES1VzM2lzMVcvLzBWVnQ1Yk5STUpNTEs2VEdW?=
 =?utf-8?B?bUJUd0pXSXAxVERIUlRnbDlSN21jVERrdjM1MlJwNzRTMDd3VThrV2lSZGhK?=
 =?utf-8?B?RG1DZjVNSElrSTladFhncm9QdmtzcG5UMEVlNEk3N0syOG0rWW9oK3UxZ0No?=
 =?utf-8?B?M0RsMVJyLy9uMndOMGZUVEptMW04OTVIU0ZQajMzTW55U1Roa21XdHRYVUd3?=
 =?utf-8?B?Skh3eDk3TTRPaU5HM29wSEdvR0Q4U3VENGtxczlrWEZkWVh1Z0lMZlFiWUUr?=
 =?utf-8?B?QkllQzNmNUh6dUd0blYwTVZyT0laSy93VW10dXc3bVFzb1kvYmlJV3RnVzdC?=
 =?utf-8?B?Uzg2dGZybXhLeW85S1JlNVVsNFlWMEtCQzh3UkI1OFU4ZjlBQmp6bE1LK2M2?=
 =?utf-8?Q?jMjG1cr+99bJmdz5G04AgOmfhLp0xAYxiekJUE6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlBmMzNSQWFadUcxdmFCUTRWYklNbkFHK2lCUUd2b2kwOGZGVmg5Q1JrK0w2?=
 =?utf-8?B?ZUFiSVExV0Z1UlgrcmZMM3Rlbk9zVUtUZnZBQko0bnlYckxQYXBkS1JIVkYx?=
 =?utf-8?B?QndLT3hqR1dUZ01XcWszdzR2Um5mMzEzRkJKQ2Y0L1ZzS25qRVoyRzFRMGVj?=
 =?utf-8?B?Tnc1MjZmcE4zQ3Z1cDBMZ0FBMW80Z2lmY3RKRDNHVWJ2aWFrendnckJ4OURJ?=
 =?utf-8?B?cjFlMjZOZzRFTks1OWlVSHBtajJBYkJhYlhpQXlkMmszUXA5b2t6akJKTnVx?=
 =?utf-8?B?MDBxS3hMNU1ZTE5CSTlLelQ5YWpncHZVNzg1Q3VEL0dHamVucmhuTmNpdUpE?=
 =?utf-8?B?OCt0WDh4by9xV0FsQlhOa3RTeUwxZVlXVDBZL3orNDRTbzhCRko2QkxaVWZ0?=
 =?utf-8?B?ZlV4Z3IrRmVkckQ1ZEwzQkYxcWJnOVRIUWhpSTdBZUFzSWEvc3dHb2RHMVNj?=
 =?utf-8?B?aEwrNStVTC90MG5UVVlETTk3d1RMQjF3aUpsZnhva1E1aEVEOFhCRStkOVRH?=
 =?utf-8?B?bDZvZDNQcGErRW1zakV0bjIvbmZnZlpTUlB3aUxWMUZvbklNb08yN1lzUGNs?=
 =?utf-8?B?YWFHZGRVZTJmaXJEVnBxZUp5WERrOXNzQS9MaUorb25DTjMxVlZVOXowaWxk?=
 =?utf-8?B?NjFJQXhhbXdUS1ptTHNydmJzYUt5MkZ0UkZ4N2pudkhIT0FBRkZJS0I4R0Zn?=
 =?utf-8?B?aE9rY2dNbU5ydExyU3FXRlQwNElmTHBZL0hBdjhxR0k4ckU0WDVYSktta0Vx?=
 =?utf-8?B?ZERZeGNqVTlRdXJWS1R1b3ZKcm0vdUZTdW1CWGZJRDI1cy8rbllwaHh2OXJt?=
 =?utf-8?B?SHhqS1JUd2xPZ0VETzZjb0dpQXdLRlFqTUY3SENKbkRDVmYvQ2dyczN1SUhE?=
 =?utf-8?B?eENrVHYveVpYVEpZQXMvdGxVbG5hVHo5UWpKSkJDSmxoTkViSUdLbmY4SVNh?=
 =?utf-8?B?Z01RTHBrZGxpdmlrRmxMYjJVUUdVREtRekUzQ2xXU3U3UWZZQm1yU1JMVHF0?=
 =?utf-8?B?Ynkxd0p0YTFoV0s0N1FINGdmelVWZ3huYjY0YTY1VVhwdVJxL2Y4V1JNU29O?=
 =?utf-8?B?cDRpVGdrSyt5eHhyb1hZellPa0E3WFlkc2F0S3pXNTd6dGJHUnVnSEh0aHVO?=
 =?utf-8?B?YStkYWFxbjB0eGhiNHAzclpleEZxME9ZQktUWG0yNnBBRjJGcjlDTzRGeDJp?=
 =?utf-8?B?UkZQRzY0TjFaNkFuQnMxeWNBanRVcEcxZEhLVThaT1BRZTVHU2VnMEtKNnRs?=
 =?utf-8?B?MEQ1RnZsbm9odFkrM2NRUFJ5TnMzcVIzSGkwY0FFU2JMUlIvTFZ5dWZtQkhk?=
 =?utf-8?B?VDZUd3B3VzZ0ZE1TQVdJWWpMazdRV2FBNlhVS0pTSFc3bzM5ZEdJUWxqRFV5?=
 =?utf-8?B?NEdDWHdsU2FzWXFyQ09KcWFtSjRPbFVtVDlKeFM5a014WElMbG9yOEdvSS9n?=
 =?utf-8?B?UjROT0FiWmVGRFh1b0Nzc25GeEpKdVU4LzQ5ZGxrc1NxaEg1c3E3dTBKRXdD?=
 =?utf-8?B?S0pSRHYvTkVqM2g0LzRRYkRuWEVxUG9aUlE1RkFZajJvWTEzM1lRcEkreFJp?=
 =?utf-8?B?K3FPS2t4OEVzN3JuSzc4NGhRYklkTENYc1dDZWxwV052cjJseVBOYWFYbGhr?=
 =?utf-8?B?VGtrRTQvNk9zUVUzWWYzTUNZaEduSnFDZURpK1VUaFRyVk5VN25wbGp2Vkdt?=
 =?utf-8?B?azN2anRHV0FWajdYMjZWbGQ3NU5ZKzJUOGFTWjJMV2lnM0FiSUdtVU1KVGg1?=
 =?utf-8?B?UXhmY1RnbjY3bVFJTUtQUVRScVpiOW82ZDdrZmlieFUrWXFJNmxZK3BkNndZ?=
 =?utf-8?B?K3oxSWN6N3JmTktIS0thOVEwT3hlZ212cmRLdWwwU3lTRlhwMStWTDA3TnVW?=
 =?utf-8?B?bUNzeXJhSFN6bEp5NFluTURVb0pUek1PRG9tV2Z4L2o5emplZ0o0Uk1uNk12?=
 =?utf-8?B?RVRTc0NCLzVKckRsZ0xoWFFlcGdCdmt1cGZpc25LVXN6TThXbFlQWU1QbWVH?=
 =?utf-8?B?aFZnY2Nob0NzRVE2UndaSTVQZ3h5bDFQeS9YWEFJb1hENjAxNGZmUDBRTG5s?=
 =?utf-8?B?OVFQamZYTnh4Q1llTGxmem1oZHdGZWFLN0lGZVN2Q1c5WUJSVWVjM0RWRDZR?=
 =?utf-8?Q?IZhjQ5tjHNiJ4Q5Z1cXnxAzy5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ded0519-84cf-4bba-9d3d-08dd0544dbab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:12:26.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhRCNkFBynSK+mjHzJWCXwMiAFHdv+81VMF8e6QAVF+tColmZFmSdkrcSvOeDdrBUCXqAjSJtNhM0CKu1+BwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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

Hi Vinay

RC6 needs to be renamed throught the file to C6

On 11/14/2024 4:56 AM, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Sample usage and output-
> 
> $ perf list | grep c6
> 
>    xe_0000_00_02.0/c6-residency-gt0/                 [Kernel PMU event]
>    xe_0000_00_02.0/c6-residency-gt1/                 [Kernel PMU event]
> 
> $ perf stat -e xe_0000_00_02.0/c6-residency-gt0/
> 
>    Performance counter stats for 'system wide':
> 
>                1907 ms   xe/c6-residency-gt0/
>         1.907581788 seconds time elapsed
> 
> v2: Checkpatch fix, move timer code to next patch
> v3: Fix kunit issue
> v4: Fix for locking issue, fix review comments (Riana)
> v5: Add xe_pmu_disable() function to reset enable_count
> v6: Change rc6 to c6 (Riana)
> v7: Fix another comment format
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>   drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>   drivers/gpu/drm/xe/xe_pmu.c       | 221 +++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>   drivers/gpu/drm/xe/xe_pmu_types.h |  59 ++++++++
>   6 files changed, 296 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a68..fd18bbce99da 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -877,6 +877,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_idle_disable_pg(gt);
>   
> +	xe_pmu_suspend(gt);
> +
>   	xe_gt_disable_host_l2_vram(gt);
>   
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index fd80afeef56a..47b5696c7137 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(idle_status);
>   
> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +
> +	return get_residency_ms(gtidle, gtidle->idle_residency(pc));
> +}
> +
>   static ssize_t idle_residency_ms_show(struct device *dev,
>   				      struct device_attribute *attr, char *buff)
>   {
>   	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> -	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>   	u64 residency;
>   
> -	xe_pm_runtime_get(pc_to_xe(pc));
> -	residency = gtidle->idle_residency(pc);
> -	xe_pm_runtime_put(pc_to_xe(pc));
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	residency = xe_gt_idle_residency(gtidle);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +	return sysfs_emit(buff, "%llu\n", residency);
>   }
>   static DEVICE_ATTR_RO(idle_residency_ms);
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 4455a6501cb0..795a02c9d89c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
>   
>   #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 2bd98c91ab0f..199344154408 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -11,8 +11,11 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
>   #include "xe_mmio.h"
>   #include "xe_macros.h"
> +#include "xe_module.h"
>   #include "xe_pm.h"
>   
>   /*
> @@ -22,6 +25,8 @@
>   static cpumask_t xe_pmu_cpumask;
>   static unsigned int xe_pmu_target_cpu = -1;
>   
> +#define FREQUENCY 200
> +
>   /**
>    * DOC: Xe PMU (Performance Monitoring Unit)
>    *
> @@ -31,7 +36,9 @@ static unsigned int xe_pmu_target_cpu = -1;
>    * Example commands to list/record supported perf events-
>    *
>    * $ ls -ld /sys/bus/event_source/devices/xe_*
> - * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + * $ lrwxrwxrwx 1 root root 0 Oct 25 00:19  /sys/bus/event_source/devices/xe_0000_03_00.0 ->
> + *                                                           ../../../devices/xe_0000_03_00.0
> + * $ ls /sys/bus/event_source/devices/xe_0000_03_00.0/events/
>    *
>    * You can also use the perf tool to grep for a certain event-
>    * $ perf list | grep rc6
> @@ -39,8 +46,30 @@ static unsigned int xe_pmu_target_cpu = -1;
>    * To list a specific event at regular intervals-
>    * $ perf stat -e <event_name> -I <interval>
>    *
> + * For RC6, following command will give GT residency per second-
> + * $ perf stat -e xe_0000_03_00.0/c6-residency-gt0/ -I 1000
> + * #           time             counts unit events
> + *      1.001153792               1002 ms   xe_0000_03_00.0/c6-residency-gt0/
> + *      2.008338100               1007 ms   xe_0000_03_00.0/c6-residency-gt0/
> + *      3.009887054               1002 ms   xe_0000_03_00.0/c6-residency-gt0/
> + *      4.011383318               1001 ms   xe_0000_03_00.0/c6-residency-gt0/
> + *
> + * To verify this matches with sysfs values of c6, you can run following command-
> + * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
> + *   sleep 1; done
> + *      2348877
> + *      2349901
> + *      2350917
> + *      2352945
> + *
> + * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>    */
>   
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>   static unsigned int config_gt_id(const u64 config)
>   {
>   	return config >> __XE_PMU_GT_SHIFT;
> @@ -51,6 +80,35 @@ static u64 config_counter(const u64 config)
>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>   }
>   
> +static unsigned int other_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
> +		break;
%s/RC6/GT_C6
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return other_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>   static void xe_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct xe_device *xe =
> @@ -70,6 +128,10 @@ config_status(struct xe_device *xe, u64 config)
>   		return -ENOENT;
>   
>   	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
%s/RC6/GT_C6
> +		if (xe->info.skip_guc_pc)
> +			return -ENODEV;
> +		break;
>   	default:
>   		return -ENOENT;
>   	}
> @@ -116,6 +178,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	return 0;
>   }
>   
> +static inline s64 ktime_since_raw(const ktime_t kt)
> +{
> +	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->event_sample[gt_id][sample].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->event_sample[gt_id][sample].cur = val;
> +}
> +
> +static u64 get_rc6(struct xe_gt *gt)
gt_c6
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		val = xe_gt_idle_residency(&gt->gtidle);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake) {
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
> +	} else {
> +		/*
> +		 * We think we are runtime suspended.
> +		 *
> +		 * Report the delta from when the device was suspended to now,
> +		 * on top of the last known real value, as the approximated RC6
> +		 * counter value.
> +		 */
> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
> +	}
> +
> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
> +	else
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
>   static u64 __xe_pmu_event_read(struct perf_event *event)
>   {
>   	struct xe_device *xe =
> @@ -126,6 +245,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   	u64 val = 0;
>   
>   	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = get_rc6(gt);
> +		break;
>   	default:
>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>   	}
> @@ -157,6 +279,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>   
Do we need enable and enable_count. We don't seem to be performing any 
actions based on these.
>   static void xe_pmu_enable(struct perf_event *event)
>   {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>   	/*
>   	 * Store the current counter value so we can report the correct delta
>   	 * for all listeners. Even when the event was already enabled and has
> @@ -165,6 +309,31 @@ static void xe_pmu_enable(struct perf_event *event)
>   	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>   }
>   
> +static void xe_pmu_disable(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		return;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == 0);
> +	/*
> +	 * Decrement the reference count and clear the enabled
> +	 * bitmask when the last listener on an event goes away.
> +	 */
> +	if (--pmu->enable_count[bit] == 0)
> +		pmu->enable &= ~BIT(bit);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
>   static void xe_pmu_event_start(struct perf_event *event, int flags)
>   {
>   	struct xe_device *xe =
> @@ -190,6 +359,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>   	if (flags & PERF_EF_UPDATE)
>   		xe_pmu_event_read(event);
>   
> +	xe_pmu_disable(event);
> +
>   out:
>   	event->hw.state = PERF_HES_STOPPED;
>   }
> @@ -291,6 +462,7 @@ create_event_attributes(struct xe_pmu *pmu)
>   		const char *name;
>   		const char *unit;
>   	} events[] = {
> +		__event(0, "c6-residency", "ms"),
>   	};
>   
>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -477,6 +649,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>   	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>   }
>   
> +static void store_rc6_residency(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
> +		     xe_gt_idle_residency(&gt->gtidle));
> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
> +}
> +
> +/**
> + * xe_pmu_suspend() - Save residency count before suspend
> + * @gt: GT object
> + */
() has to be removed
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +	store_rc6_residency(gt);
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>   /**
>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>    * @arg: Ptr to pmu
> @@ -498,6 +697,24 @@ void xe_pmu_unregister(void *arg)
>   	free_event_attributes(pmu);
>   }
>   
> +static void init_rc6(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int j;
> +
> +	for_each_gt(gt, xe, j) {
> +		xe_pm_runtime_get(xe);
> +		u64 val = xe_gt_idle_residency(&gt->gtidle);
> +
> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
> +			     val);
> +		pmu->sleep_last[j] = ktime_get_raw();
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>   /**
>    * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>    * @pmu: the PMU object
> @@ -533,6 +750,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>   	if (!pmu->events_attr_group.attrs)
>   		goto err_name;
>   
> +	init_rc6(pmu);
> +
>   	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>   					GFP_KERNEL);
>   	if (!pmu->base.attr_groups)
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index d07e5dfdfec0..17f5a8d7d45c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>   void xe_pmu_exit(void);
>   void xe_pmu_register(struct xe_pmu *pmu);
>   void xe_pmu_unregister(void *arg);
> +void xe_pmu_suspend(struct xe_gt *gt);
>   #else
>   static inline int xe_pmu_init(void) { return 0; }
>   static inline void xe_pmu_exit(void) {}
>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>   static inline void xe_pmu_unregister(void *arg) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 4da96b8fadd1..3718bfe7621d 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -10,6 +10,8 @@
>   #include <linux/spinlock_types.h>
>   
>   enum {
> +	__XE_SAMPLE_RC6,
> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>   	__XE_NUM_PMU_SAMPLERS
>   };
%s/RC6/GT_C6
>   
> @@ -23,6 +25,28 @@ enum {
>   #define ___XE_PMU_OTHER(gt, x) \
>   	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>   
> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
> +
> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
> +
> +/*
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/* Global PMU mask to track enabled events */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
> +
>   struct xe_pmu {
>   	/**
>   	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -65,6 +89,41 @@ struct xe_pmu {
>   	 * @pmu_attr: Memory block holding device attributes.
>   	 */
>   	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 *
> +	 * Each engine event sampler type and event listed in enum
> +	 * i915_pmu_tracked_events gets a bit in this field.
%s/i915/xe
> +	 *
> +	 * Low bits are engine samplers and other events continue from there.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @enable_count: Reference counter for enabled events.
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @sample: Current and previous (raw) counters for sampling events.
> +	 *
> +	 * These counters are updated from the i915 PMU sampling timer.
%s/i915/xe
> +	 *
> +	 * Only global counters are held here, while the per-engine ones are in
> +	 * struct intel_engine_cs.
> +	 */
Comment is taken from i915.  Right now there are no per-engine ones so 
can be removed
> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @sleep_last: Last time GT parked for RC6 estimation.
> +	 */
%s/RC6/GT_C6

Thanks
Riana Tauro
> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>   };
>   
>   #endif

