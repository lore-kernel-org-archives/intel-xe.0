Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A9C87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A53210E298;
	Sun, 27 Jul 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkUaL2S6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA95610E298
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753637641; x=1785173641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=canD6+Xc0e7VFLsfWKkHMrYh1OffdCtWyxmglCCXWbY=;
 b=jkUaL2S6t0M5V4GcIrlYuYLDhYxfet3b9/TVJ8Hqnqq/bHnbaYn5NkD6
 6Pct0CoqZVmerXhsKOZtgGc3gHFSTzFcDviLz6yI0xNgb4/fhgGVLr3z1
 kNv3OqTjq+AK/F5nqRK8u0VgGTtaP/y/YwZrndU98/d+84YxzfuZecKDG
 Nz7uNAikstgkXau6TXiUIoF1F9+4DLeaiSfQlWRl2kvo+97bjMwBCuL0U
 zyYmS0LnVg6GaOk6+7TlA9XSEz4lm8C+8S5/aCOmTVWei5KiGT0u+gI90
 BUaY0HOkGmVF9DjqTQLso/36Yc/Y6Wt1spENsK8jKJIkNwQIj5NvGcmVb w==;
X-CSE-ConnectionGUID: bp8jyV57RSGDXtDuCtkf6Q==
X-CSE-MsgGUID: BTEii/MHR82hGte5KiRqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59714939"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59714939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:34:00 -0700
X-CSE-ConnectionGUID: XB6R2738QhG+HmmGBTKoXg==
X-CSE-MsgGUID: xwSYrOaDRZyqypvuUbELxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162291750"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:34:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 10:33:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 10:33:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 27 Jul 2025 10:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdfmhX688DjyBxJpMydkUrYsJ10iWod6MGcK4WREXjuwzOznP6r+etaGXhctBLEXFY12fbfGDQuO/JTPA1iigiVMRCuPirMjWc9ZWSZE3qWJpbDu+IdW6igHTevmQJOKnoKc1ep0FPiCFWA6QzeNPoxAQMEZUYXe+4MTAPh2pGPtu9/q2720m+Z7fSc0XzxuNtk1H3S9TFyOq8+fzOv17PDIuPhXM2DporV/A17ciiGP03+1++r9xPEfRv1yT5ueaoBJY5ylkstBbrbbNtwhbqFOxY725NaScD2NGP56i21xVl7eULJGZiv/ByCT+26RFQu/htxKb5pHaJjUkhrlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Jh1ZnbpgESBwWr9E5eeVX/+gtZSOW67E+90faGCruU=;
 b=Zr/FlKfbizF3z30UI3J4dqm8yU4HsqOxPAc/vpsBk2tK7YK9nLOnxzQM2zFWDTs4NraHYLPeGxeZyWAi01rniPbAz/iUmn46pH5VnpO8RLW1cHKAviS/absU7aUl1uzbQLSQ1pTApo6NWycARD+twgzR2ae3JJ0LbA84VCVDieRh4XQw+/+mpAZMFNIDfBK/3ovj3PVklaS/OAndCnZxIYR4DccFC+cKHNfko6f81ZCD8tNamWjmbKtZFKmmyhQupRtkCz7bcVCH0Z+vk4BgSGpby4WMV2GDmIgz4uc3r/Qx0VwaHgw+KLRPwgsSVCFvOIHiTSDcvg0PsJxs1hShag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 17:33:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Sun, 27 Jul 2025
 17:33:57 +0000
Message-ID: <b740b63d-beb7-4b72-b9bb-56fef5ac95f6@intel.com>
Date: Sun, 27 Jul 2025 19:33:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Fix VM crash during VF driver release
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250726013946.32233-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250726013946.32233-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: dce6918b-c769-489c-af2a-08ddcd33c3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elBsRFZmUzN5bkVMWFZYNEtIUEUyWmNNNUtCSUVNK2dHV1dOVGdPTjdJKzkz?=
 =?utf-8?B?UEFPYlAwZVdMM3h4L1U3NmhreHM0Ykhva3FzbFlubU43WTZ6MGJlYnREVWJk?=
 =?utf-8?B?czh5ZW9uckFqOVdtb2dHUGlMdS9IZ3BxWlBJOW1Ibm00RDh6RHY1K3BQeFRT?=
 =?utf-8?B?MGxZM2hSZk1la3dsR2piNHhFSkZhc0JuOFNxd0FTdEdINVZQT3RUeU03RUpY?=
 =?utf-8?B?ZkljVjNMVVV3eFpjQjBFY2JBRmxjQ3dlNEx1eDBjcXNpenVFWThqaldUeGtB?=
 =?utf-8?B?dDkyeDlRRG1NUmEvY0F4dDBIVFRkcDArL1A4bTZUUU83ZGdPRzFZcklESWJk?=
 =?utf-8?B?eVFyMW1iV0loRE5RZW8rOGlHL0pxajRnSFJST1YxSnJvUnZ3eUdSQUxQNGcx?=
 =?utf-8?B?NnlxRnZ0Rk8rYzRLekJjalN6N01tM1ZyN002QzZrNlY3cDF3emtrSU1nMjRI?=
 =?utf-8?B?c2t1ajBFZFp6bnppczI2SVF1S2tnS2poODJSL0c0NnVNQ1d5VENtdGc0dUh1?=
 =?utf-8?B?V0ZJcHJENm5TMkVwT0l0OHFLNUNVNTJVUFVHclR2aXRGZFhyQkI2dEhLd2Rz?=
 =?utf-8?B?WHlFWWlFcjJNUFZ6cUVSZmU0M2FRUVd5N2g5bzRDYnRLZ3NCZmIvTi9kdm5n?=
 =?utf-8?B?UURNaW1vMUhiMFVSMEdtSHJtNEc4dmEyMWhUc3VSbm82U1AySEc1MEJ0L3R0?=
 =?utf-8?B?MU0yZ1B5YWJnTEpQdlhKWkduWUJ0NVFSZGVWbGlSZFBia3pRSXQyK2t3T2hJ?=
 =?utf-8?B?cTJhNEJGTGRRR1JLRVA3alh2eVQwc0lzZnM4K3EzUTcxTmtQK1FOMzdDME52?=
 =?utf-8?B?VkxocmR2MEtIcWVKdURSOUdQeE92TTBmZ0pISVdiMnMraVZKVVJ1Z2pkd29C?=
 =?utf-8?B?eHpvTCtvc1FrSFVmUENyL2s3V0R4a2MrWUZxdXQwQ2tnRHl2SVRqZnBSSk1W?=
 =?utf-8?B?aVhobTZvalZ2a2ZEMTVUU1Ezb2lheWp0dnExb2hqaFhpRlB0WXZWMTdaVmJ2?=
 =?utf-8?B?cmJ3K2h0NXhxcWpGUzlIMHNabzFPdUpVSnIvdlhGSmYzc1padDErWGdhWms4?=
 =?utf-8?B?YUlINFVkZURNdWFZTDNSQWZlWitGalowT1VkMHh4QjRvZDk4WG1zaTNQTHFY?=
 =?utf-8?B?NEVkcks2a1VUZCtDRFp6VDZzYW96dmxvenRicGZ3V01jMTBqWnBKcEVSazVy?=
 =?utf-8?B?cDJTZDk1ajJNTVhUSDBsS1NlQWU5cG84TmNDc20yTzJoRFlCTHZIeDVsSUV5?=
 =?utf-8?B?eXNvQ3VzRmFLdm84VjJyMnZVVGpQWkNvbmxXOVJidXAydjRUdHZJaHVad1gw?=
 =?utf-8?B?ZDlCQ3E3cmFrdlE1WERwWFpQWWdINjRnS2tYR08weDBTVEZ1WmNYQk5SYnhj?=
 =?utf-8?B?TmFYYTh0aVMyRGd0dVZSUkxuVDJQc0hxcG9kYXNvZEo1cWh3NE4yRUF0MlFk?=
 =?utf-8?B?ZG0xckNVVG9xVHNhekNEV3lRVHNndGtIR21Vd0tzVGV5a21Cem8zbFpCZVB5?=
 =?utf-8?B?ZzkzT0I1SlkrOGtJT2JKNkpRQlRDSnI3TzBxQ3d3SFNKTCsyNE1PU2dvakFL?=
 =?utf-8?B?VHRrcG4wS1JFRFRTOVhFUVZzNUZzVDdnVWlQRTlJTE0xTkE3QVRsVlpNS0VR?=
 =?utf-8?B?RERRRlM2UFhkNnc3TG5oTStoMEw4bkpvZUhORlIvcExLdENPTU5zTS8rWU9p?=
 =?utf-8?B?cXlXbk9IYXhqMitlU3B1SCt4ZGVpNFA1ZG8wK29HclBzQ3lQWDUxTnF6OFBy?=
 =?utf-8?B?T0lUUlVhVXhKdVF5V2V6SHhvaHNRS290TE9uVTUrRzBjcHVxTFFhaTBaZ0ZU?=
 =?utf-8?B?N1J5T1YweWZzR1dhQlNDeGZYdzdlek95dGNZSXEzY1lBei93VlVxUUpHeTRO?=
 =?utf-8?B?UjQyZWwyT3piL21JME0yQXYvWkc2b2xTVFB5UFJDQUo3OTNjQ3J3cFA2eVVv?=
 =?utf-8?Q?2uLqr3bNZRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTJHWWZRZFF3ZDBWcXdqcW1XS1lXQ0JpTzJGcTRJbGhnSnhMaHRYY3drSEJ1?=
 =?utf-8?B?ck1WcmRmUmx3QVlqdStOOStNS2l5Y2FJc1Q0Mk5pb0t4bzNESDQvbjBrK3FT?=
 =?utf-8?B?UzFtSjlGQmVsTW1vclI1ZnhWY3hUbTdRV3haZmZLbjEyd3dMVFc5QnA5Rysz?=
 =?utf-8?B?LzNyQ2o4cERYV01QMTBzczM1bkVlVS91UXVWd050TVJ0U2xMNnBFZG1RdXlR?=
 =?utf-8?B?Yml6K1NuQUxhdDFOTld3WWk2S2FDOVFpSnRXQXYybWNhbGxjSnZ3Mys3YzVh?=
 =?utf-8?B?amhCdkFIY3NBNUNvQURzUzhNeUUvZGxqYzFBL2VaNHl1TzZKSFI3SVd6SWR4?=
 =?utf-8?B?aVZiYWp4azhNVnBWc0IzZnhJY2RmVzkwRVlPNjBwQUZwL04zQ3JRZFVyY1Rp?=
 =?utf-8?B?cmNTRXo1R0hLUVJ1WFJJYkVOSC9kdlFROXFYSWxraXkzQ1BmZ2J3VDluYVRW?=
 =?utf-8?B?UWplVGJMMnNZTHZtemk2bXI2SEJtbjBuaGtpa2prUUxwU21JQzZWVE1XMzNk?=
 =?utf-8?B?akgrNHg1YlEwSEdPYkp5MWRNZ2ZTZWZML2t1TEsxeU9pZUNhdmEzNSt6QmpZ?=
 =?utf-8?B?UkJTc2xhbWoySnJ4UzFnSWtVUWx5UWdBYWNFTmU5RzAxaTAydm5xTWdxRU8w?=
 =?utf-8?B?OXlrbWduNDVFZlhocTEyYngxREtnK3hueXYwNmRPb3MxYkJYbFFQMG1YNlll?=
 =?utf-8?B?WTdUc1k3ZEc3Zm4xZ1dvYkthQkk3V0pTMmYwbUNVamVMeUZBaldncCtjdU1R?=
 =?utf-8?B?ekhSd1JIWWVTWXkxVVk3NHNiL2FyNUlXUUtTVEhiTDVqRUh6a2NKdnBqZll5?=
 =?utf-8?B?djZ1cGxzOWszcDRNTFcvM1d4eUJ2OVUrd1VVNWVhZm9xUmRBSndETFFtUEsw?=
 =?utf-8?B?bXA2NmlqSlJTd3plT3BjSWVBVGVkbExXVHI5R1gvV2R2MG5JNWNzZ01sc1pl?=
 =?utf-8?B?ZCtxWjBkWDJZbDhvR2JXSGFKWTVua2ZuS3ZTQTZ1UDlvTXBMN1dSd09sbEJD?=
 =?utf-8?B?T2F5Qk95a0V5OUtVVGRHT3RMQ3RKTTBUS2VDYWE4ZXh2VXBqT2tVdkhkWlBm?=
 =?utf-8?B?YXFXdm44eWFyZ3FyYXhBaXVLaTFCZittY2p4Z3NmYnVDckF1dy94Uk9GMy9K?=
 =?utf-8?B?MmRWOXJzZ3lRcFBoNFIyakNkRzhRRU90YlJ6WkFBZVBzVnNYOTE2QUpuN0E4?=
 =?utf-8?B?NSsrMDd2d2RDcHFoc2ZZZkxpRDMzMmhyUi93bnZXSTVFTlFBbGZiSndQamxT?=
 =?utf-8?B?MlYwYlpQOXJoMy82MWhuS1krakdQdkVhRDR6bm5oaWd0aEJ6cW84dFRuY2F2?=
 =?utf-8?B?c3VPVDlCNDVGblhqc0N2RUd4Yk9kMFp1c2hhSURaL05tZDVNOXRUaVJmNm5m?=
 =?utf-8?B?TzEvQTZqVlF2VmhaNEFRdHlBaUdENUJTV29DUTZ3WmE0VVpaM0ZobEhwOVdU?=
 =?utf-8?B?SmRBMG9HdUZQZVRJZnZHa1RIa2Rxak0rZ05uVVhWZW1vcWtESTRoZFlESW15?=
 =?utf-8?B?RXJNNGhrWGE1MS90dGJleURjQWhZUE1qQ3dmT3VyNm5iZzdzbnVDeGRSd3Fj?=
 =?utf-8?B?WFNxbnhuMnJKcmd3VThldW5VcTBsYkhLWXd5UE5FaUhIckhLelRmMkxMWXZq?=
 =?utf-8?B?RHI1NnZvbWVpSUUyRm9UTE1tOUxKaUhhaVFKSW5HRmNjaXNEUlhKcVZLaVVT?=
 =?utf-8?B?U2pMK0ZmVFY1dWpKZ2l3WFp2SGtRbVhHTVNqaDZ5b0lLRnd4VTcrdkMrUldS?=
 =?utf-8?B?OTdkellRUzRmZllEemJYR2lhbU5OZlE0L0RQc25wbDlFdnNTTEZLZFFPY002?=
 =?utf-8?B?MjRyL01COE1Sd3NSY3AvQkxrbUc5SWRKSksrcmsrUVgwN21yakpKR09oK1pN?=
 =?utf-8?B?R3BCTi9FdnJ0b3lGM2JJZDAxMCsybEhGOTlTZW9ta0RIUFR0b0lsdFJNNjhX?=
 =?utf-8?B?VHlPZTlxTFpkNWlYTUdvUWtyY3RYOFduanZUMERGN1Q2VlM0V2dpUWlqQ3dD?=
 =?utf-8?B?QlBicUJ6ZTJQYmlFRlVlbEh4NEdiNVU1YzdaRVdaeDh3Q0FzQXp6L09yUVB4?=
 =?utf-8?B?STBDckVVQWdCN3c3UHlBd3hHSzlxS2VtTTVjZ3l3cVBqUmZFVWZpM2JzM1dy?=
 =?utf-8?B?UVR0YkhFSHY3OGUzc0EvNzBJU0I4K3l6cU44SmsxK1FDOHNjOU01UDlEa1hq?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce6918b-c769-489c-af2a-08ddcd33c3bb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2025 17:33:57.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY3EL3z/rvKCLEUIsB1pMpXCrBpm/kQC2qEhzoSKKZaafGKCdR0Cn6ebjCmrmbty3FvE7I5x7a37rmGvLHGt3y6Y/DiYZlkq76Rnrw3swio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
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



On 7/26/2025 3:39 AM, Satyanarayana K V P wrote:
> The VF CCS save/restore series (patchwork #149108) has a dependency
> on the migration framework. A recent migration update in commit
> d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> caused a VM crash during XE driver release for iGPU devices.

you may want to include crash log here for reference

> 
> Update the VF CCS migration initialization sequence to align with the new
> migration framework changes, resolving the release-time crash.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> 

no empty lines here

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c           | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c      | 5 ++---
>  drivers/gpu/drm/xe/xe_migrate.h      | 2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 9 ++++++++-
>  4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8eda36546d3..1ef6eea7df19 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,7 +564,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		tile->migrate = xe_migrate_init(tile);
> +		tile->migrate = xe_migrate_init(tile, tile->migrate);
>  		if (IS_ERR(tile->migrate)) {
>  			err = PTR_ERR(tile->migrate);
>  			goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..ae03440a276c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -400,11 +400,10 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>   *
>   * Return: Pointer to a migrate context on success. Error pointer on error.
>   */
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> +struct xe_migrate *xe_migrate_init(struct xe_tile *tile, struct xe_migrate *m)

hmm, why are we passing 'tile' here? it should be just 'm' as 'tile' can be
accessed from m->tile since it was initialized in xe_migrate_alloc()

and then we can simply return err code, not play with ERR_PTR

>  {
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..a5dfb34fc072 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
>  };
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> +struct xe_migrate *xe_migrate_init(struct xe_tile *tile, struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index af43e04179aa..1752864f7ffe 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -270,11 +270,18 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_init(tile);
> +		migrate = xe_migrate_alloc(tile);
>  		if (IS_ERR(migrate)) {
>  			err = PTR_ERR(migrate);
>  			goto err_ret;
>  		}
> +
> +		migrate = xe_migrate_init(tile, migrate);
> +		if (IS_ERR(migrate)) {
> +			err = PTR_ERR(migrate);
> +			goto err_ret;
> +		}
> +
>  		ctx->migrate = migrate;
>  
>  		err = alloc_bb_pool(tile, ctx);

