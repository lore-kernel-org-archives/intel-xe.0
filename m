Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9CCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 11:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D008710E2B4;
	Mon,  2 Sep 2024 11:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N93OfwdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D710E2B4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725277891; x=1756813891;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ot1hK+2WpMg9pUuTu0Vp6hnOTnK6/V7mAfEbUlDeqB0=;
 b=N93OfwdXIvgXomPUK+7lXNUtmUMcV4cXkaSje0u3QV7mbC2NEMMWaBYn
 24Dh7KLPm6XIlIxcanQKfAq8Dvj+puLKdwi2kDDV1qgAbUDRbEcLIqIu0
 vrae4yXgA3B++MrV31Tr3LvDfIIIonu9RKynF2K+KXBmh26LEmj0mwYuV
 XcgpA0ct3udWmeRDRysbOtJXYGOm9P9hreqBG3DxKAZoU3ywq3JkDw8AJ
 XfvaGGcEjq4lnmsapl/5b2y+t7Gl3l1Pisf35O6408yNQtnDuuif+NHtf
 PRDjF4TQZxMTKbU5cPC67thVrSas2tCybHE/nhEolRpv02B+OMWUWClaU w==;
X-CSE-ConnectionGUID: 3v6tgUCKQyeHHI0JCDb9RQ==
X-CSE-MsgGUID: 2/s9Mxo5QUKpsInQ4iqhwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23370783"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23370783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:51:02 -0700
X-CSE-ConnectionGUID: XVBwd0sGReqmaeX7eSye3Q==
X-CSE-MsgGUID: YGUM5q2FQKG2PJBXY9idng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64221175"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 04:51:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 04:51:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 04:51:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 04:51:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 04:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXHUOud0tnrJHQAqo2uWfeh67PczQpCjg16qIulGLcVxZlqzd0IbSNUXQvHyu4cCvb5KxAw70Ck24RwKkhgugEvXpL5zTYLfbnpAlHRzN4sFlIo14YT+e71kgDbhAw68SHtFuGlnsvDKKP6eDKvrYiICifPxf7Vs+OrjeuqvRPkiuGcqNTqkkxfH1pzHXYRqCjZp92/c0y4eTnshbQc+HzMD4rAOuqLbZIZ2bzxmM866p2llgDevkt+OHhkouT/4EbWHCPzlOZcsHfCNbHnhRSLiWA6gngZZzHEiuEy16rRRAwlumxfKZ9i6lXYHp83uMzVMcZhEJmswTWimS2TQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBIZ+0f6VxKd3s8apSE5V/4Jc1ozbdB425tIAckhqbI=;
 b=G1P4E0FosNRjVZw/CX7C90s6/tJQPVeD8NoZ8IzYOxI6rE+mT1D1oIF006oDnvYJysVW6i+yvtwOiTbHRIC0sCMJKfARXlBDABGWIlmDy4tImp4RhZt3mz1NQQKmKyyF9hrfG27xVIrmmqGFCVGOJwCEGHFFhs41yq3Ub2EUCvfR2iziCxvrdjGYBpyY535KQw31bM0dknDXc0/PonGEQvPH2w4e2k9e8heooAs+xw4CO89hbHe7QMid2MCp3iH5i8266jTzyKDSkkeE6MpuMsLn66pjvZomChbZUr18PerAki40Cu9inmyDImSkIQqrcZs7Td03p3i6qeKAFJQJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 09:36:29 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 09:36:29 +0000
Date: Mon, 2 Sep 2024 11:36:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Add thresholds to the VF KLV config
Message-ID: <20240902093626.zxdmaptlljt535cs@intel.com>
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
 <20240830132100.1704-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830132100.1704-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR0P278CA0087.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::20) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bea329c-563b-43fc-8cba-08dccb32b916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJ3RG1vRVFUam5BSmxpSjJvbEtFNlZja0EzemF0M0FSdFRaaTNvZUNrdmhY?=
 =?utf-8?B?NW55RHJpMW04NkF6N0FUQkpnOFRLaEVmbTJCdlBva2QyNFFPRzZpZ2M0SzFK?=
 =?utf-8?B?MURaUENHWWk5T1BXZmpFTEZJWXVaVU5TcHdwcHZ1eTZoYmpXRkx0R2UzSHAy?=
 =?utf-8?B?aXdHNWZtTlZvd3NYamZHdmVZeUtyS2VYUnc2YTU4Y1o3cTZLUG8waTZmdCto?=
 =?utf-8?B?Slk3WXlueEpDTWdiZVV2SzJNSnVYUkk4cHA2MUJURmx1alV6TGRvOVAvN3li?=
 =?utf-8?B?VkJVbWZZTlFZbGNQdXJEelp1ZFVyL1VuTzFxeGVEb05LSGltNmJLTTBJRTN4?=
 =?utf-8?B?bG9wOW9HTjZzbW5FdEhzTVp2cWJlWkVIQnRxTWFDNTMrNmM5d3I1WFJ1Ujdj?=
 =?utf-8?B?NmtJa3pqZXR6OS9HaFBReGp2MUdOTUt1VVJ0TWQ3TWxrK0s4VlFldE9pZng1?=
 =?utf-8?B?bWRTZXdlU2tnVERyVUNTeDZQLy9rZ0RVMExyeUV5YkNQVnIyRmdWNEtsUXh6?=
 =?utf-8?B?dFErMHNQM29tR2dJTnNlMTA3QTU3bzF6V09HVTVtWU9sMjNTVzF1NEordzds?=
 =?utf-8?B?T21rbXNOVFRnOEM5QXRST2JEaUpYYkwvT2RmdFNSeTF5cVB6cExLb3FyUFJ5?=
 =?utf-8?B?a2VrUWRzMm9TL3FSSDlqNmZVandma29DYnhUajc2U2FST2tCaTdydGxjUjFh?=
 =?utf-8?B?NEVqeldTZTVTS2lNZzRXZlI0MnlMSENxUFIvb0ZQb2JzaEJRVi9YZHByMzRR?=
 =?utf-8?B?M0FVSFFhWmh2dlgyNmR3N0MzakdkeFJvcU5RSUxtTTBFb21QOEoxbWEwN3g0?=
 =?utf-8?B?V3hERGxRZ1EwWlBqZ2dIQXdQdXdlVXB2cy9VbXZIUWJXM3RJV29mQnprNzFa?=
 =?utf-8?B?eWQ0L0JrN21kNEJUSjRFUjFKTDY5S1VmM0FDZEs3VTQ5enV4MG9Lb3lQNTUv?=
 =?utf-8?B?aS9CVnovbnBWUXZVK2pVZXNCdU5vRXJCemhHUWc1Q1BqQVltdEEwU0lXV3Y0?=
 =?utf-8?B?QkROYWI2cXVqWm9Wc25oTUw5dExYZFRGSDFoMU0wQ0FZOXdsc1Nyc3BjS25F?=
 =?utf-8?B?V2pZWEhFVDFPd2NjTFBuNnZyVHZNdlYreTEzY3F1RmNLUERPOEVaMWlXbmJQ?=
 =?utf-8?B?MkZSRk45dFJXaU01ZTNnb2RibzNsYVc1djUvZEtvcWJZNEc5WG1BNUpLcGMr?=
 =?utf-8?B?emVRS2Jwb3M1WHBHRURUa3dYQ2JRaVlpTnNyZGFKRHB3OGc2NDFoa3E0SnJU?=
 =?utf-8?B?TnF1Z09SbEc4WXJyT0JUa2ZFdFJzMGZvSCtBNFp5MmY3eEQzWUxJQTFtanBq?=
 =?utf-8?B?UjNwU1BVQjdKUlFHK09IYUJBSGVZMkFtYnBtMklheWhwcitsWGhpdXVEZlJE?=
 =?utf-8?B?c3c5NnU0VjJoQW9tTHRYekZUUFJNeVpzSmgwN3pvdm1Scm1WbUV5cWRmbUQy?=
 =?utf-8?B?WmtEL3J2Qzk1cVl5d08zL3pWUDVhdldDcUtXSWJjRmdlT09wRk9vK3lrRWVs?=
 =?utf-8?B?a05SaHZzbFZTOWNjTklDMFdFcWU1S0s1MFlmNloxUHVMRU9DSGs2WGlCUkcz?=
 =?utf-8?B?R0JXSG1FMmhzVHhPUE4vUzE1K1dVMUpncmJLRXAvR3VTbW9TL01RWVJQL29k?=
 =?utf-8?B?VDBCSXdESkFVM09jRml3ZGJ4OFBLVWU3L3JHSTN0ZjNCbU40MURKaHVMZklT?=
 =?utf-8?B?UGNjRnc5dllvNkxEaVJiNFhaRGlFaE9qL1JTRGlKSmVwNHBxdzEzZThORTVE?=
 =?utf-8?B?b2ZaN2YrVVYrOUZBeFExODlvRnFMRVBBTjRrYW82SUFCYlpFS3VyaS9xTkU5?=
 =?utf-8?B?U1FueWVqVlNJRHVEay8zZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFoQnFYOFJ2U25wRjd3VnEyWjlkZ0tRN3dmWmlrMWZ6OUlTNG90THB3cnlV?=
 =?utf-8?B?bmpKYjBlR1FMMzkzSjJ1TGwzb094L2l3QW5vUkw1YjBSVjROeFdreHprdGhZ?=
 =?utf-8?B?emhmRFNYS2hnMTBkR0I3T2F4Y0FjcHZmYWhpZTcyUjI5a0ljeGJmbzFobXlV?=
 =?utf-8?B?QVFUUUMzVVRuOWJYUEZncWZYQ1VxeXd2VjFmbGJVUkx0enFxeVl3SjhSaE5J?=
 =?utf-8?B?UHZWcU5XNWVLYmtueFdJUUcvdVF2VXUrTU9oalVZUFVScUhOUm5ieTYxS2ln?=
 =?utf-8?B?d0xUU2ZuaXE4TUk3RDFSbk4rQzRWOXBPanlCQVAwb3c1STE4WCt6SlJod1Yv?=
 =?utf-8?B?NDFCQUU0dGpCYkhSSGRwWFJwNWlta2UyNzlsUmlBTWFqZ2pCcHpRcGtBVkdW?=
 =?utf-8?B?emZtUlBkZEw2MlMwUTdwd3VoaklCZjV6cjUxdWZZVzRkNHM2dlpuZlU2Z044?=
 =?utf-8?B?cUhqMDdGK0J2UmtvWllYd21ROW52ek5PMFNLYkE4QmZhRXdIOTZjRzZnK3N1?=
 =?utf-8?B?VDR2RlpPdGxlYXdRazEvOUxxTXQ3SlhZcEsxaUphbC9BOFVKbytSUDdmY1cy?=
 =?utf-8?B?R1U2NXFXekpGMHVkRGErRXJRV0hTL3hWSkc4SEFlb3VwalFGWVN2TVo2Mndh?=
 =?utf-8?B?ZWJ1QjhBSENWTWhsWGdwY2lxVm4rNnQ0VFZwN09VcXV4WnI2ZUlTOTNJUERD?=
 =?utf-8?B?OXRUTC9iSTRNV2R2aVdNZ0l2RGJVNUFaVWJQanVhcFRiNE5kV2ZjWnp1RUh2?=
 =?utf-8?B?UTUvUXR6YzJzVW5FSFlReE1aTjZwd3dSMzBJcXZYUFIwekIyY2trYU5RY2ND?=
 =?utf-8?B?bUtZZUhCcDU5OTREVjRLbi8zUFdzVXFhWkNMWmZyVGZOTjgyRFd4MllsSnU5?=
 =?utf-8?B?WWlRV2NDT2FZdzZYcXBob0dCOGlGUWs4TGIxb3NKZk1IY1l1cFRrMG03TEYw?=
 =?utf-8?B?VkhiRkNGbW9JQTVIck1tRi9HeEpUcWphZXVvSklLR0R2M09INC9GY05pckNh?=
 =?utf-8?B?QWV0WHZ2KzhDQjBoeGNJcURCYksyb0hMcmhIWUF4dVRGb2pRaXdRMWRxTHZG?=
 =?utf-8?B?eUNMN2RzWm10L2ozcGE1aHhXQ3FTYjhPbjZmWnJEQ2FETGVrZWVEa2ZtZC8x?=
 =?utf-8?B?ZTU3NGhOcWtSdjBSNkQ4TWVaenBPMUZYRThxQkU1UERxU0k1WTZvNXlmajFn?=
 =?utf-8?B?U3dpcTJpNDBMYVRFcXU2SklwT1VMZktNVmV3b281SU5MNHpKWG92NWpFcXMv?=
 =?utf-8?B?Q0tjcWF6NW95SVpvSWVtLy9zNWtGdnh6K3ZhNkNRUFA3MjRKaFhYcjNVTHRT?=
 =?utf-8?B?QVhoSXVNSzN4TG9PTjJOTTdZdURMd3RKVjNhV3VEVnhtaEhSMG1Fa2haclQx?=
 =?utf-8?B?RzBZdXk3V3BuQnM2OEZrOS9waVZXcFdmc0VUWWdHV3ZweFdqWTAwaFk3OUx4?=
 =?utf-8?B?azZCczZZRXU0SkRZUkJoNWdmZkVLQ2JjYWRVSG5SMitJTmcxSm1QRDVkSHNO?=
 =?utf-8?B?blUzWlhJa3RXWGZTWkpzYSt3VGIwcGszb0V0d3h2L1MzM0I1emdLOUIzNkJ6?=
 =?utf-8?B?Qm5seDZjaUdqR0lyZC90TlFvZ0J6bm5MVkJNVE12dnlySFpJYnlLaXorS29m?=
 =?utf-8?B?dXRaMEFxYUViT0VUZGdEQ2pqT21DR0E3YTdjOWJvUndCREUvODJzNkRsVHk1?=
 =?utf-8?B?aFYyU0dRUkJZd25QT3NwclA0KzV4b3V0bjR0ZG1yWFJuTWEwUm9lblp1dmpx?=
 =?utf-8?B?cjg1VjBneG5GK21SeGJqZmRIb0lsWGpxbDNnYWlwR1VseHpCcVVRYTRsL2JS?=
 =?utf-8?B?VjdxVVVhWmNuUXM0SVBzenRKM0E0YStJUU1rWklad1B1QU9GU2puZTJyd25p?=
 =?utf-8?B?MExDU0pzTXRNZEpwZzhrT1plUytGS04yRWQvT0NvNDBTR1JHZEUwQTdtZzc4?=
 =?utf-8?B?U3hGcXpCRXVDWFRqeFpkcko5L2Ywb0JuU2N2QjFlWEd2OEN2RVM0WWlremhw?=
 =?utf-8?B?dlQ5NFVqSUV4UUFRNGFjSlVOZ3YxTEo2Y2I0aS9EeVRDTFZnMExZNVl3Q2Vs?=
 =?utf-8?B?UHErVHlJTk1HaXlaNFBKNWlZT0lQMkFXR3Rkb1pqbGRBNENCUzZvbVVKM2lB?=
 =?utf-8?B?aDBndXA0NURwdE51UTVUcGJYeXJscVBtN3ZIQzR4MWE0Mmd1TGZ3enZGUmxZ?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bea329c-563b-43fc-8cba-08dccb32b916
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 09:36:29.5076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV9dWsjPgimoqVZosnUVCzOlsJWYTx5+rSsJRRmg0OPQaophs5hysCfVrID63SVN3QnslYFlvtm8CTNsnBzZ1WQrxt/RIlAmnLUpWGadr8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-30 15:20:59 +0200]:
> We are pushing threshold KLV to the GuC immediately during the
> threshold provisioning, but those configs will be lost during a
> GT reset.  Include threshold KLVs while encoding full VF config
> buffer to make sure the GuC receives all of the config KLVs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 497af3949b19..151eb69ab4ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -277,6 +277,14 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config)
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>  	cfg[n++] = config->preempt_timeout;
>  
> +#define encode_threshold_config(TAG, ...) ({					\
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> +	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +});
> +
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
> +#undef encode_threshold_config
> +
>  	return n;
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.43.0
> 

-- 
