Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A47C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 08:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1B010E2F6;
	Tue, 20 May 2025 08:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UB4YgMfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D04F10E2F6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747730987; x=1779266987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x58rbpovZRjsNGHHxFrqN5sGFg3YpkPoeIxTp3YWD/c=;
 b=UB4YgMfel+msixqoEaSSeHZabxLvAvnHycPHXkclRcPi7cAcuiZ+JA0k
 b0NgxGsaxfyg+/kL6YTeSUeDq8wxcT25pScMw5RhLARrzcKlMtgcasv1a
 g6m2RnDEA5dRy6cFCXo7rKNZ1HuUuV3UP5dBBq9XlE3d/zLAjM1AkhZiy
 m0OT8jaXTVg582SvOYLfTjQa8TiyAZ+NY66RaRMEEaugR1ML7g0yCX40w
 5FPVL4cRHcvd9yM7cziWqHSkai6QeqpKe3Y+CBg5aj56Yx/6hI9iKZb86
 0gYOzjGlUbmnaUA7nKzVe5Upu6v+Cj0unnPmqr1cFpgXTel5zg1Dgk3XO A==;
X-CSE-ConnectionGUID: /PFQWIKnQa6bm3Lbc2u1fQ==
X-CSE-MsgGUID: 13v358SXRjeZUMTbGirgGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48906439"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48906439"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:49:46 -0700
X-CSE-ConnectionGUID: 0sOPOSh1T8+LdEYGll34dA==
X-CSE-MsgGUID: aZWgOSHERemanb8D2IJUgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144375276"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:49:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 01:49:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 01:49:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 01:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZWVbC6uDXZGZGOLLdWoHS6l+uNwwbuLU6TTnHKFevyy8TS69yOySG2AMjSY35LSg4r3ktsCs+iZzU7Id4L9otItprhtabA1OyFgJ4VAbqemd5/qK6UHUtr+pFhGXSdXl50kKL3jimZzvfyjJgksWjr9A1mRP4ySKifrTWeBSNyJ8EUn3pp5fJBuo50jP2xmHjIDAth8A+JdnS1I0G/H1kjnsnJLIN+ku9p37yYqjrBVdsk898r5cA1oxZi3KcejEjmy/qkaQmudDr52NkRp89TY1ZZKf5HvsPiWOQUK92WCO8c+XVOIHCnE/rzPNUut+B8iWdqywRdSc022p2ulNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwqooedrF2snzoNb1soP4f1cBPgdxnP1EAIaoHQuxb0=;
 b=pCKf9db6uo0y1ZgjusijDE42dCvpouKH5ZxsiF7Tjhrz4E5AUqCF9emviuO57K6MFZ8B8IYDvPorNUpcmN3BSQEIZZszOXgJykss49sk+dNcgB438RCR8VircrnM5Fqb5nZFfxgJs8Y0cKjzF871uR61QR9/zJGrBBq0z0oQKSwajHFHed9dYdQFKpEB0zLOzDJZA+sM4wsA8f4VYf1KDlZuDH2bmQFXXckWIp91cGA9kIQ6SXDrdwd0Bce1B6I0ODuUjQsTmgZoB9HK8YdQIgOmvjeKVNdeskOdyGCK1De3I5U9o0Qvzqq9ddehDP/U5dkj8H7k3WOwOFw9D2qT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 08:49:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 08:49:41 +0000
Message-ID: <222cf26d-d0ba-4047-a07c-7599c07f5a44@intel.com>
Date: Tue, 20 May 2025 14:19:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <dfa4302fee599374c8bffee9e9ce8dcb1598a23d.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <dfa4302fee599374c8bffee9e9ce8dcb1598a23d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0ebc09-cd10-42ef-fda2-08dd977b42cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2VNVWQ2bXY5Qi9vSGxPYjlSM254dldCMGRaclJxSjFRN3dxNGNqM2hiTzJz?=
 =?utf-8?B?OU8zMnpoMk53TFUvUE5DcEc0TDVvc1JxTnNjd0F1eTJJclc1QVhnYkhsWVNQ?=
 =?utf-8?B?K0tLMVhDVUpCdXJ3aFBXUnVnMktLZFlXdjhxc2J3aHZYdHg5cDIwMTcwV2Ir?=
 =?utf-8?B?ZGFKWEsvakRoRmgyMks1ZXNJUlNQdmppczBEYUZEMEUzcThhdUNGZjNGbzlh?=
 =?utf-8?B?TVZpZWJDaWozQnRGcjdnR1RKbCt2YXlMVkZIRWpYSnVWVHU0SXVZTnJhSlBa?=
 =?utf-8?B?VlpmbWxFRlp1NVRHMDlFdFJNYnptRitYT3BBenpkT3BlUWJ3SStNQVpKdktP?=
 =?utf-8?B?eTNwNXZBTStMWWpKRVZrbkxYMnJQdUE2SkxJNlNiVmY5SVh6WlBwZjA2UFhp?=
 =?utf-8?B?SzlYZXJCQWNtcU0zTllJQzlvVm8yUStDWTNNRXVZN0psRzhZYmVIUEQ5SDlm?=
 =?utf-8?B?Y0MrL3Y3Sys0UCsxRERRdG1pMk04QzVtWGhaZmJZaiswQ0htQWczMXNGWVQv?=
 =?utf-8?B?MjJmTnVhRXd2cHBaRlp4by92ZUg1Z2hHUjR5cFAzSGpuU1pHWHBubnpwT3ps?=
 =?utf-8?B?bmxXenVaSFhUL0JMcUFIeUsrd2daeGRhUnJobktTWU96R0xLZStqMExBOTAw?=
 =?utf-8?B?VitPWjFrZ3F6dmFPUWE0ZHdxVlFIL2ovd05JZkZoUW5keDEyVWpoQkVWdEhR?=
 =?utf-8?B?ZGtxWUdDNytLbUF1VW81TXVvMkZnRWVmUUtzazgzZ2pMTGZVTDZ3VkxReFNo?=
 =?utf-8?B?WWdFUFZkT3I3eGpLTmlGUldQYm1yWlpNb1c3OHRkREMvTVhHUjMydnpmcHln?=
 =?utf-8?B?RDdXWFJ1eTRzekY3aENoRm0vK05ETW0wVzJiZjdMblBmU0o0bitxTFlrTlpy?=
 =?utf-8?B?QVFyZ2FWYUVGRXFuYXJ4dUtDY1AxekY0R29PazNQT1NhUU9oWGQzVG1LRk5z?=
 =?utf-8?B?NjdxaTVhVXVrNEEwZ2FMc1dEOCt2OHk2R3JJeDBRQjZ3WFBONDBVOStwM09i?=
 =?utf-8?B?c2tFMXA2cEFURkcrU2g3cnUxbzZxbTZCSUtlTE55OFNvUWVaVjFEcTcvOURq?=
 =?utf-8?B?MUZkc0tRc2loRTJYNkhiQmtnM2JRZUpiekR4Yk1MUGxCc3ZKVUMweVV5QmlM?=
 =?utf-8?B?U1lyek1tK1NYTGdkdzZJTnpzcEdwWjJJakxCMWtXUklQS0dNdm9JNlBLeWNH?=
 =?utf-8?B?TG1FZzZJZnJuSjNGZWZzUnVsT3pRNGhZUVU2SmhuWVNULzE0elBob1FlWVpt?=
 =?utf-8?B?ZHhZcXY1eHkxWWh5UXZxN3Mvc1Q0Q2FEYzkrTDFwSk95akc5ZlFBQmkrWjFG?=
 =?utf-8?B?dnU2NGNwbGF3QW1ZS1FYMy9SUExMMHVtWkZXYjN5WmN4V2dscjFYK2dteitw?=
 =?utf-8?B?RHBEY0FoUzNCbUw2K0ZWWFg0VmcrbElPVmNhT29YV0VURjdnYTNmcFFNTkJk?=
 =?utf-8?B?aS8yT1hIeDRKSmxVME1TbGdYbjR1aXF0VG5MYVNlbXlpa3BQWnVSeXBzZTA5?=
 =?utf-8?B?bFFsbXcxOVkwK1Q1K3JsSnJ1TTFXOHIwYjRNRTJtMXpUWjhKS2MxRy94a3Bw?=
 =?utf-8?B?V25jQnNuTXcydzhlNXJpZ25LVXdaSUVJdlNNb2VUVFgwK251djFpUzNDYTI2?=
 =?utf-8?B?UERrdS9INVV4YmI1cUdCSkZxRzNJY2EzNFE5bGxBbzdHWlZramRMaFc4TUNk?=
 =?utf-8?B?VWVERlJZSnF6dTlsVUpPSjduY2VnMEZ5aGhrbW1yc2VGbFVjR1VJVXBwclZR?=
 =?utf-8?B?cHUyNG0wOEM2L1A1cFVxL0ZPbDFvT0hjZnRKU1ZtcEtnR1ZYTkRFczVZV2lM?=
 =?utf-8?B?Y00wS1JFMzNNZnh4RkJzaG5zRmtzKzlja1VuamYxV3o4Nm55QzdwYjloVTA2?=
 =?utf-8?B?WUE0cUlOYlhDNGg4Rm1uSmRCTkRPa25XcGlzVG5xNzk5SWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2praTJoL243QlpFUDg1UzZWdDN5WEZVYUl3K3AwQXRVbVptbTBMdTAwUUlr?=
 =?utf-8?B?ZXhhK09MbHpWRWZWZjFRMC9GZVZFT05Ybm5BZDRaRGdzRjFBS3QrYlF1eWxM?=
 =?utf-8?B?WTNsQ0ljWXJqc1o5ZStRWVRPWER4Z3ZNZlJZTSt3U1BkM1FEN3JsYnRIN1RR?=
 =?utf-8?B?UHZ3ZEptMUhxdnllUXZMMEJraEJPejQrdWdDUFcwVm1iMTNuRUJDSzJZSzlE?=
 =?utf-8?B?NndQNkltSWdCdDF6VmlmdHVYZllDaytDbXYvV1lDcG1QWTkxdXZZYkFrenFQ?=
 =?utf-8?B?MmtaNGNac0lXRUNBNVBOQ2V6VW9CcUk0UGtuMCtrOVNsN1h3dE5aRnk5c2tw?=
 =?utf-8?B?Y25RTjFINU1US2J5Z1VSaHVUV3ZMZ0ZSSzFGV3VhbUY5YlR6bndrNEVCWkps?=
 =?utf-8?B?bFBMTlhKYzZpNnpXZzdBVlN4L1NyNFNxTlpNS2tjTVdNTmRLK2Q4MUYwSFFr?=
 =?utf-8?B?UGl1QXd1TitIWHd2aEphZTR5eU1uMVJ0ellNVlBiemxqNE9BemZERnQ3ZzdK?=
 =?utf-8?B?bVVsOEJTRDRydG16bm11ajZSWWZTM2ZhTkErdXVtUEVHWENVb3VjR2UxbytG?=
 =?utf-8?B?MDVqQ3YrcU5JbWczOHB6QjBUem5obXhEanpsMXlKVFp4SDNGcFA3SjFYR0cw?=
 =?utf-8?B?ZDhLdDduVXIzeTNKTnV0TlJXcUhBOWhUUytqaUNZZ01TU2lid2Y1UXNiZmtr?=
 =?utf-8?B?TTB6eE5ldWpERStjZkI4Y2ZMN0ZPNFlVSUtPaTNQajhXSmtHYXFTc210UGNU?=
 =?utf-8?B?dTRSdjFSZ0F0YkZ4U1AvK25IOWhKZE5yaVk5bndkZlVlMkRDSzh1SmVlWmVS?=
 =?utf-8?B?Z1ZQbDdJSjlMWDQ2UUJEc0dIQUl2b1RNNThBSktJNlhPUWpGaXVkZ2VnV2F6?=
 =?utf-8?B?QlVWSHpPVENhYUFEWndsRTRkNGhmd1FDVmEvTUM2czFmZnFoTk85cTNIUEls?=
 =?utf-8?B?NE1DRkxmNVlyYjlmZUlQMHhweWtMbmNrZGJjUVhpNEo1Nm9HQXZoSFBvTldL?=
 =?utf-8?B?T2hSVk1tQm1DT1U1c0M2MVpOUlZPSGQzN0RHbjlVZzE4RmpUZ3lISEtmSUVY?=
 =?utf-8?B?dVpSTUdrSHYrUHJNWHB0MVZHeTl2R3lRaEpTUUl3cURieHR0ZXI1VThaMG1J?=
 =?utf-8?B?NjEyWE1WWDlZNndJenVhckRGWU9yQlY4bE1MY1BjMVp5aENXcE9ocWpTbW03?=
 =?utf-8?B?V1lsS0h3dy9UMWVYNjhqMnBuSmg4aDlpQTRSSnVrZUtDZUIwZkUvTVArZlls?=
 =?utf-8?B?ZXZseFp0M214UVQzeFg2b0VlNHgvdzQrdk5pNmRETkhnRFNrS3krRENvVTRE?=
 =?utf-8?B?R2VUNG84dGJhaFBVNnRYTzlMcjRaa0IzZDMrMG03QS92TlZxS3QwZ1dJSHVS?=
 =?utf-8?B?aG85RllIY2JMZmZmbkVCZlNlM1IxNDVMT1BtbmYwNEkreU8rbXp0S3lKN0Mz?=
 =?utf-8?B?bW9QRkE5eUpQeWNFbDlMOFJJV3ZUM2Z5RklUaDBrNzlmSkJQNHJJWm80OWpl?=
 =?utf-8?B?ZWpBZjZGTGNnc0M1cHBBRG90eEdJTUtaUjVKbStRVmc0N29makFDR25QVmdj?=
 =?utf-8?B?cnN6L0JDc3hNK05xY3pRYktCUUc2cWhGUjUvMUtTdWFmM21ESWxtZkYxc1pM?=
 =?utf-8?B?c0ZCWlVFOHIzMVdaRk5pakRPNDZYRFdNWWo2Y0xDQUNyTHh5b2NuNENCWHVN?=
 =?utf-8?B?ZWp4Q2ZoOUxFQ0hRSUwrMUIyd1gwdjRZa3NpcWxsdGV2cGs3NzhmeVl6M1Bu?=
 =?utf-8?B?RWsrRXNnM3JvRW50eVRwYlo4RStSQmN4dCtiWSt1KzBkeVZCMEJQTVh2cU1O?=
 =?utf-8?B?KzFjb0lWK3FkcGdsbnhqMmY5RTNLSk1CN1pOa0x5em5tNmloakIzU09rY0l3?=
 =?utf-8?B?Y2JwMEpCRC8zR3NBWkJvd0pGQXhhMEx3aXA2Z1ZBbzZrejRsL1dlaklhWUEz?=
 =?utf-8?B?UnVETnFwSGZNVnMrd3VZTHZqdU5zK0ZDWDNkdmxZZ3NGZUhTT1VMamxOWmd6?=
 =?utf-8?B?RmZkQ3l6R1l1WUh0QU9lVGtPM2EwUWw0WFpmd09zOFN4cFRrME51aUd5SGhR?=
 =?utf-8?B?RElpY1BudmEyUG16YWxwVzFZeGZQUXg4RVhRZXpNWmxQRndKTWpreXFLc1Rj?=
 =?utf-8?B?STJBeU1xL2hiUGpZSFFqME0yR2R0UWQ1UUVxbVZucU4yN3Z1SmIwZ01tRGtS?=
 =?utf-8?Q?r9Dg+667uO7pxT7B4iHJeEY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0ebc09-cd10-42ef-fda2-08dd977b42cc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:49:41.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nt7matHI65nfhWxubdXIj5sps8zueWrh3b3o9VyW3FpJSa7lfSvanjQDVC+8jSrH4rOFTU7wpPlyLk2ojWl1eZ3QgMzjzbgQZ1U4n/PaRH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
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



On 02-05-2025 19:30, Thomas Hellström wrote:
> On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
>> This commit introduces a new madvise interface to support
>> driver-specific ioctl operations. The madvise interface allows for
>> more
>> efficient memory management by providing hints to the driver about
>> the
>> expected memory usage and pte update policy for gpuvma.
>>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 97
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 9c08738c3b91..aaf515df3a83 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -81,6 +81,7 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_EXEC
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>> + *  - &DRM_IOCTL_XE_MADVISE
>>    */
>>   
>>   /*
>> @@ -102,6 +103,7 @@ extern "C" {
>>   #define DRM_XE_EXEC			0x09
>>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>>   #define DRM_XE_OBSERVATION		0x0b
>> +#define DRM_XE_MADVISE			0x0c
>>   
>>   /* Must be kept compact -- no holes */
>>   
>> @@ -117,6 +119,7 @@ extern "C" {
>>   #define
>> DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>   #define
>> DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,structdrm_xe_wait_user_fence)
>>   #define
>> DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
>> +#define
>> DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
>>   
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
>>   	__u64 sampling_rates[];
>>   };
>>   
>> +struct drm_xe_madvise_ops {
> 
> Suggest using extensions also for the ops, like for vm_bind, since we
> might come up with complicated ops in the future that don't fit the
> union + resvd below.
> 
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> 
> Is UMD currently really using and exercising PREFERRED_LOC? If not, I
> suggest removing this op and invent a reasonable default behaviour
> until multi-device is in place.

Missed this in previous reply.

Default behavior is preferred location as vram (tile0), as of now in 
absence of multi-device support UMD's are using this to fallback to smem 
as preferred location by passing invalid devmem_fd.

current behaviour is if invalid devmem_fd is passed -> use smem as 
preferred location, with mult-device in place
if invalid devmem_fd -> use local vram as preferred location.

> 
>> +#define DRM_XE_VMA_ATTR_ATOMIC		1
>> +#define DRM_XE_VMA_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
>> +	/** @type: type of attribute */
>> +	__u32 type;
>> +
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>> +
>> +	union {
>> +		struct {
>> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
>> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
>> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
>> +#define DRM_XE_VMA_ATOMIC_CPU		3
>> +		/** @val: value of atomic operation*/
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} atomic;
>> +
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> 
> I think the purged state, at least on i915 was only known to the KMD
> (so shouldn't really be visible in this header). Also we should
> probably define the semantics here if
> 
> a) There are multiple gpu vms with conflicting purgeable state.
> b) What happens if we call dontneed and the bo is deeply pipelined?
> c) What if a willneed madvise fails due to the bo being purged? And
> that op is embedded in an array of unrelated ops? Should it really fail
> the whole IOCTL?
> 
>> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
>> */
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} purge_state_val;
>> +
>> +		struct {
>> +			/** @pat_index */
>> +			__u32 val;
>> +
>> +			/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} pat_index;
>> +
>> +		/** @preferred_mem_loc: preferred memory location */
>> +		struct {
>> +			__u32 devmem_fd;
>> +
>> +#define MIGRATE_ALL_PAGES 0
>> +#define MIGRATE_ONLY_SYSTEM_PAGES 1
>> +			__u32 migration_policy;
>> +		} preferred_mem_loc;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>> +/**
>> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
>> + *
>> + * Set memory attributes to a virtual address range
>> + */
>> +struct drm_xe_madvise {
>> +	/** @extensions: Pointer to the first extension struct, if
>> any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +	/** @num_ops: number of madvises in ioctl */
>> +	__u32 num_ops;
> 
> Should we really support an array of ops here given the experience we
> had with rollbacks on VM_bind? Also WRT this, also please see the
> purgeable state above.
> 
> 
> 
> 
>> +
>> +	union {
>> +		/** @ops: used if num_ops == 1 */
>> +		struct drm_xe_madvise_ops ops;
>> +
>> +		/**
>> +		 * @vector_of_ops: userptr to array of struct
>> +		 * drm_xe_vm_madvise_op if num_ops > 1
>> +		 */
>> +		__u64 vector_of_ops;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
> 
> /Thomas
> 

