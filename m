Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38583E6BF31
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 17:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD27110EA33;
	Fri, 30 Jan 2026 17:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ8b3bl9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8E10EA33
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769794488; x=1801330488;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5AzoLHst39dKmyDQbUojDGNWQNmGgilCq3IXE4yTpbs=;
 b=IQ8b3bl9K1Gl1z7b5lXw7Q8TAPfCnEOMtYvAsr/uVofyo2bubq9MkQk3
 HCn5W35Cs3JZpxhZKQOX7QGgjiUXPvxwgwOc8xreKkq40CL304X0+MgQg
 AsF/33gH04ioPYLR0J7cF3BJNWomquPG6PQKpjphTu7knvJ1dYllP0RVM
 +W08JnaWsbBqogtNDaJ9iBlEc4LsUW14uuTgWRhxoFzgsv3eV9T/yUY7k
 cp/2MqSrCizoDgj/mwDdiGC3XLnGl211ulgJZjIgelQoYoD4QfF8R037F
 RViTiGmT5oIZuuRn6pGh4XnUIVVtR4dwHf4ihof4KdOKx5naP5NGX+HlW w==;
X-CSE-ConnectionGUID: dDuzfZMITGOUcY9WnRA/Dg==
X-CSE-MsgGUID: xFiLdToaSCmfgq3BR900HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81364750"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81364750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 09:34:47 -0800
X-CSE-ConnectionGUID: 3La1nNXsS9SrqeixMpO/Vg==
X-CSE-MsgGUID: Jyz7LQEHSya8wH0vTtveEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209016042"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 09:34:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 09:34:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 09:34:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 09:34:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqsQp0zvBuOjcolIJNOJjNgksqJHP4vKcwB0DJZGsKyfjiWh2OwYsRD9uv8dfduIAKxiQcT34uyj80RjuJjtl1ToGe+w28I5cOb8CgjUc+jTb+8cYM7obpHOwSzSOSpNH7XYXbtHuCrvW4wfZMI0UcORaJWXY1l5mfPOKMnKMuCjLL2K3ys64b1GrJMj3IdD0Dp+/lz9ep2j/UfpUiJc+9M1E4WW5V3ju1G4oDZTS+ez3ru36SM8GQ46bzCQ4K4qW4I5eqFzikmg8rrcNOUurEuHrd+DngG45mZQCGoKYY8szFjmtYKKjKV93R9u5vSRN+YIwC2TgKx81cWf3uP/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb4htKyGvIJT40i8dSKYwMufR5OAxkBLCcd8Ju2yEfA=;
 b=RHgFdexmk4D7p/sVLH9iGSAbtf61jsHVEncRUSFAd7z1JKIobiDfPUR7WaQoavG5SHPan97CM8y8t43TRdWaRQOGIPXJ7cSmTlQTXearYaMcGtc/qhT8oyZHhCWDu0IcJQh9qcZmfQ6vthtgvPdgdRUxMLsheOxgrNLsLLk/CHaaH/cj+OCl/LnISNziutPEz5jG0g+Hlwv6ra6IsulRSV9bvKh594UPW5KNK9RGjB/Gppi6P3QAluSvMaMivk1/8SBXjUVVoXDKQX9Qi4Y1BEuq2vb3XRVvhj7yHVNTfScZPrYZ2Ou4yIBjMuUS39lFYAOBY0eJUxFk7rOyRAz78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 30 Jan
 2026 17:34:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 17:34:42 +0000
Message-ID: <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
Date: Fri, 30 Jan 2026 09:34:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
 <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 35489f1d-67cc-4b35-aa9a-08de6025da14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDN0bW5KZ3dnWFRMSGkzVm50VkFKam5mNGp4aFdZRDdSZ3VjNWE1WXI2WEdi?=
 =?utf-8?B?cnI4U2s3N09pN2FXN01IM2pWRHVrbGhuK3dUUkpiQ1JEakZyWFovQkRZOS91?=
 =?utf-8?B?RVNTRWZ6TUVURTROUmluMXpkUnpNY3dFZmR5eDlsT000SlNmb3J2RVJmdnRE?=
 =?utf-8?B?ZkFwNEhoL0Q0U011bG5hWjh5eklKdFdhY3Q0R0ZRVjJ4bGJYcnJVQ2xmYlND?=
 =?utf-8?B?UDNDNFhQK044bVIxT1hza2NlY1lvVVQyY0NOZFlOei95REVpOUN1TkxIeFgv?=
 =?utf-8?B?OHNFL0I1VVJvd0M3Sll4ay82YlZDeWFnUy9Yd1I2eW1nWHJaOHN6NVpxR1Fj?=
 =?utf-8?B?WHN3bzdRUXV2MzhjY0wwcHpMa1FubXFvUk4wOGRseUQ4eHM4K1EyMERMVmNZ?=
 =?utf-8?B?aEd0NHRPMkxsblpjRFBMWU5PcHBYdnpkbk1hblhPS2FDcTBPTTVCelpyNysv?=
 =?utf-8?B?NE9hZkIvbE81bk0ydFM0V3lFTXlzc2ZLMmNaTmJKTUJyR1QxUzJ3ZjBNd1hQ?=
 =?utf-8?B?SWRhWGwzOGh1S2t4Sk8vVitxbGlpb2ZpZEVDdkJSWlRyR2I0ZXNFcWhudW9z?=
 =?utf-8?B?U2JSUSs4Y0UrYTh1NGNGQWJlN0kra1hTNG1EdlkwQjNFdDE5VUFNVEVJNDhB?=
 =?utf-8?B?dDIrc290djI0aUZiMHJzSUdKeWR1ell1K2lLV2RlU0Y5c2RuZGh1YUdSdnZ6?=
 =?utf-8?B?VUU3RWo3b2xwaUNCN1QzQys4ZFh5YzZFRkU0dkVMQ3F5MHZTS2xXbjZsZkhm?=
 =?utf-8?B?Z3d1MHA5N1hacnY1NkRJWk5oWW5JUmN3RFBBUk1Zb3prVGNycy9rNzJ0RnFa?=
 =?utf-8?B?NHhuQUQ4eXhkVit3TUNGRzYrZWJ3ZS85QzhjVUlzNGpZaExqOWh4ekp6QTdy?=
 =?utf-8?B?SXRxY2N3Z09QTUZweHdtTW1TQllOK2FWeFhIbFpEc256dVBRWEZwVEVsTG1O?=
 =?utf-8?B?eEdkblFVNmpzRkdoMnFWdXVIaGR5cGVSbVVDTTZDRjVCMStEY2tMQ1ZQMlpk?=
 =?utf-8?B?QmkyUUNKd0ZmMDJHRjZlT1JrOWFMblliUTdBaDZlZi9ya2dLNGs0cm56eldx?=
 =?utf-8?B?b3cyc1ZmQmhuZlFrY1hlaXJmR3poMGdiTkRWOGk5eU9TT3BuaWNiVEVJQzY4?=
 =?utf-8?B?RS95Z1NFS1Z4aExKOWNrbU9sWHRSQVRZYm5FeUc4b052NUd1bnQrRUJSR2JY?=
 =?utf-8?B?VUNJQXZ0VlZvZ1pPdjNpVmFvVDhEYlkvSzZOdm9qZEsvR0d4ZzJEUndkdU05?=
 =?utf-8?B?QWJDUlI3QzBtWnJXS1gwaHZUK3ZPT2I4MWVSTlVoUGNYSjA5K1lLWlBoKy8z?=
 =?utf-8?B?OXhjZjcvVlJZK3NrYm51NEk2RWIva2t5Y0VIdXJsQTJjS1ZTUVdFdjEzYTN1?=
 =?utf-8?B?eVJXb2drdWk1MkZlSzYwRkwzSzFQZ3VZd3JBdVlXTGxTUk9taEQzZ1JpOU5R?=
 =?utf-8?B?bUY4bmpyaHNmZDNWZnBFOERub0lJUGJ4MXU4Z0tBTEFYQ1F4T0RCVzR0d0RB?=
 =?utf-8?B?NW95NVFBRk83OWZoM0lDaTVhYUJ1aDY3ZUpNUG9RL2k1SFdlNjM1VHVlQTcw?=
 =?utf-8?B?WXJoNlhUNHBMV2ZWQ21qUUVQNzRLVWVwQWtPZllCQzVLOEVEQW00L2ozUTNo?=
 =?utf-8?B?Tlg5WU96RDZYUmd2UWdoNTJrRmgvOW44eEI1QlJQdmFVU0VTcmFFRnJUNDRj?=
 =?utf-8?B?WG9BUzJLOTlveExsWDhSWDNUYmRQVHd2SlVBYmZIczF5Z1JiTHhac1JFTVJj?=
 =?utf-8?B?QVZpOXdibEdOVmx5L0lLTWl3RitTN0xBK24rRUtmSjYwWmFqWEJEMURBYVBM?=
 =?utf-8?B?bjExYmRLN1RNRDEveDRBdGV4Snd2eVJvellwR2Qva2hKc1lKSEpmaHNHdVNT?=
 =?utf-8?B?cnVsTmZyQWNucHlldkNLNC9PVmZKM25RT3J3dHZ4YUtjWDdJR254eFJicDZV?=
 =?utf-8?B?amVGYlNDR09xdko3RVZ2Wm9LWjlqRWZ2RURxYXNHM2pkeVFhT09ZelZSVW0x?=
 =?utf-8?B?S2VPaE55UmQxNUpOVkJ4RDNuZ0lSZjlsby82TkIzeEFpeTJIM0xDL0ZiQmxl?=
 =?utf-8?B?ZlNpeFNZRTFRZm5mQmpBVGIzSDhCN0tlSmJ4blE4VjNCWEdIdWdRSGlnLzhy?=
 =?utf-8?Q?HvNo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZiRXpDYUNJZmtnLzVXc2RLcWl5MTJXVG9XUXp0R1hEUkJDcVYwdHE3cnBo?=
 =?utf-8?B?aWFJbEwxaTY2K0VyMkNISjg1SzF6OUFHOXlpL2VnbWRIbkJMeEhwTUtyZktS?=
 =?utf-8?B?aUoyLzlSaDVNM0dvREdDRXkzQUFPTzdwNXBQNWljRkhiUTFUbUtvWUFUQ0c2?=
 =?utf-8?B?eElWNEpPK2EwbHFYcWNPelIrRXl4RjkvTFNvWTZ4K3hkN2lVeDlxdTlBcVhX?=
 =?utf-8?B?UVU0NGMxUDFNYWRzZ1AydXJ3SkFEbFBjM3hDZXlQUElWNm4vSTVqN2ZnbzZh?=
 =?utf-8?B?YlgwKzVHUElsbHBWeDRsbnIrdDBkMlVWM0NCYXF4ZWdPTVNiMG1WajJkcHpt?=
 =?utf-8?B?YTRyS291TUZ2amx2eHhnNWhkYlBYRmpRdDJIYzVxaFBPUGJaM0JhRGNsM0Uz?=
 =?utf-8?B?bHNFZ0xxSzJBbnVvK2kxMkluQzloeW9oVW9sZ2szeTlZVkhrd3ZJUW4vTlBw?=
 =?utf-8?B?Z0Nhd2ZSV1R2aXB3L1JIVEtQeFVqdWJaOEJtMjFqczNORXlRYTc4SHk1V081?=
 =?utf-8?B?RTlkeU5FRlczaEk3M21IdjBUTEsrS1VKRm9sTUFLVm1KVnk3V05JYWRUZ1Jj?=
 =?utf-8?B?SFBzdkIwYW9VYWJRVFp6S2RnV2RiRWxMVnFXZEtScjFTL2FObytBMTBMVWFW?=
 =?utf-8?B?cnhySjV1Ukc0cFFLb1Z5WW9oNGtqaXpWM3FkQkF4b0d5ZU9EMm5jSGx2ZFNJ?=
 =?utf-8?B?MFh2cUdIcm9qbVhPNS9IV05USERFK3hCR1JSNWVwRk9LOWJpSU93M2RBbzlz?=
 =?utf-8?B?bmtWeHVaZEdXakM4UjRDS2h3cVloZit4T1VQRjI1SElwZWpjMm9pdldTZjdC?=
 =?utf-8?B?Sjh5UVBhNy85NHFydTZhNkNtTmFSUEY5RG1Ycm5wa1A2M1MzcVlKNGJDVmly?=
 =?utf-8?B?UjUreDNIdWZ5NlI5WFN6dFhBSnlra2R2ZjI3OTNmbmhSZkthQ3E5VWNaR2Vx?=
 =?utf-8?B?WFlxZDkzQXk5eW5kcGZXV1ArN093MFFUeEJtR1lvcUFPWXhrS1pqb1VJSHRD?=
 =?utf-8?B?L29QZ0dOYzl4SWVSLzc5NWg5eTVpdDkyQVlJRnZLRkRQcTFPL3lIdnJjbndB?=
 =?utf-8?B?b1gyNm9NcEZtRkYxR1U2VG9haWV1UDVmWlBHMUgxR0JWWmJCeGx3L3dKNzE5?=
 =?utf-8?B?VmtMTWk1eXNXekJucWN0S1JnSnVGd016RDlSdVhwbWRRczdIRXpIT0pleHBC?=
 =?utf-8?B?OVFwOTNLa20xcU9MR0IzQUZMVjJBVjFEZmJBczN2YnM5RmNHUWRmdEpHbFk0?=
 =?utf-8?B?bUJubFRGdzB1ZFVpRjlLTldrVXlWOGVsVDhOSnNrckl5STZCVmJmN2p1aCtG?=
 =?utf-8?B?ZFFHU2Zad3dXMjBwdHN4cW91QTd5QzF4RTVoWVIvclg1TTlsZWVGMXhPU1o3?=
 =?utf-8?B?UXVvR3RJQXJtU0Nta1J2ZGpEZXFFNmRjcUI0RnkyZXZrVWNLejcvY0E3RWV2?=
 =?utf-8?B?VER1a0JxajBrVkE2TkhIaXkveHVQVUticU9DeEZPcTRtZTAzakEwRUhNRkVw?=
 =?utf-8?B?aEhSUEpkNWFjYTZXNHM0Z3NkNEZtMVM4dXZTTVNTUHpiOGlicTBhZ2FQUXpG?=
 =?utf-8?B?T0RnQ2FCci84WnZyNjF4Z2oxbDZuUTJmdXNla05uY3o3VGZGMU9xQ3d3Mytx?=
 =?utf-8?B?SmNHR1BrbkFVSmhVbmFhUlgxTVY2RllERllKWmpSRWVWNWxDbDlxMnEvVGZw?=
 =?utf-8?B?VUx0SnhwTGFuRUwxdTJPYUk4TTRiTDViRDNiZ1g0VUlWU1NMaUtnVFIxaU5J?=
 =?utf-8?B?L2xmN0dZOXJ1S0E4dnpJUW1RN3JZNXJqSUxaVVhaNngwdWg5MEhuVlE4c2R1?=
 =?utf-8?B?N3BMU24xZE1hbDYrYmdBTENBNGFSaVQxNWhzRjBEa211THV4a2dhWFBKRmtQ?=
 =?utf-8?B?WCtoZm4ya2hMOHFCL0JHS0k2MmY4SkxkS1crSXhsY2NjL21hcmJGVVhvYVhh?=
 =?utf-8?B?OWVqS0l6bHN6b1p5WkNnaEhiWThJd3c4aDFITjRiQTR6NURnQnJ2blR0aHVT?=
 =?utf-8?B?bGs5QjhaMU5WMGRLcWo1K1Rtd1RnUzBJK3NnbnpLK2ovMnNvbGFhOURINjZU?=
 =?utf-8?B?WEhiY2NEL0Z0OGFzZzYxeEliR2hnT3FrWEkwUzdoZWk5dzhIb25YNDNmditQ?=
 =?utf-8?B?QU5UVXl3SVlyMFFFL1hCcUc1SmtnUndLeUQwWFM3azUxMm5mdjQ2ZC9jc2tG?=
 =?utf-8?B?NjQ0Rm5pb3NCdG9BMGU1Q2F2RlY4Vmkvb3BIM1NHTDQ0V0JVZ1Y5am96ZjZU?=
 =?utf-8?B?YWNYNGowU0M2Nm5Uc3cxQUNwRXUyOThnNXhrUnAxMUpCcmlwV1JvQkloUFJT?=
 =?utf-8?B?RHlqZmVUU05JU3paRnJBN0tGeVc4ckF4VjBSVUcvemplZFJtekQ4V0k0czNY?=
 =?utf-8?Q?qgVa+7c4wIvdYv58=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35489f1d-67cc-4b35-aa9a-08de6025da14
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:34:42.5210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJqcKAy3/yGlq9cgbdt250PajHWusJngxkQb4zXOmocMZlEUTFXC6XpXGJBMm8VVu0n0LOtNKZMCOGzbAZmopH0W6wbRlbxAn6/8z3cyRXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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


On 1/30/2026 7:20 AM, Nilawar, Badal wrote:
>
> On 16-01-2026 04:10, Vinay Belgaumkar wrote:
>> Dump forcewake status and ref counts for all domains as part
>> of this debugfs. This is the sample output from gt1-
>>
>> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
>> Media Power Gating Enabled: yes
>> Media Slice0 Power Gate Status: down
>> GSC Power Gate Status: down
>> GT.ref_count=0, GT.forcewake=0x10000
>> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
>> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
>> GSC.ref_count=0, GSC.forcewake=0x10000
>>
>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 46 ++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>>   3 files changed, 71 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>> b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 76e054f314ee..197e2197bd0a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>       return __domain_wait(gt, domain, false);
>>   }
>>   -#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>> -    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>> -        for_each_if((domain__ = ((fw__)->domains + \
>> -                     (ffs(tmp__) - 1))) && \
>> -                     domain__->reg_ctl.addr)
>> -
>>   /**
>>    * xe_force_wake_get() : Increase the domain refcount
>>    * @fw: struct xe_force_wake
>> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake *fw, 
>> unsigned int fw_ref)
>>       xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>> acknowledge sleep request\n",
>>              str_plural(hweight_long(ack_fail)), ack_fail);
>>   }
>> +
>> +const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id 
>> id)
>> +{
>> +    switch (id) {
>> +    case XE_FW_DOMAIN_ID_GT:
>> +        return "GT";
>> +    case XE_FW_DOMAIN_ID_RENDER:
>> +        return "Render";
>> +    case XE_FW_DOMAIN_ID_MEDIA:
>> +        return "Media";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
>> +        return "VDBox0";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
>> +        return "VDBox1";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
>> +        return "VDBox2";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
>> +        return "VDBox3";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
>> +        return "VDBox4";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
>> +        return "VDBox5";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
>> +        return "VDBox6";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
>> +        return "VDBox7";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
>> +        return "VEBox0";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
>> +        return "VEBox1";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
>> +        return "VEBox2";
>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
>> +        return "VEBox3";
>> +    case XE_FW_DOMAIN_ID_GSC:
>> +        return "GSC";
>
> How about creating static look up table.
>
>     static const char * const domain_names[] = {
>         [XE_FW_DOMAIN_ID_GT] = "GT",
>         [XE_FW_DOMAIN_ID_RENDER] = "Render",
>         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
>         [XE_FW_DOMAIN_ID_GSC] = "GSC",
>     };
>
>     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
>         return domain_names[id];

I was trying to make it a little more dynamic where, if something 
changes in the FW table, we don't need to update 2 locations.

Thanks,

Vinay.

>
> Thanks,
> Badal
>
>> +    default:
>> +        return "Unknown";
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>> b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 1e2198f6a007..f7690cb34ef7 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -19,6 +19,17 @@ unsigned int __must_check xe_force_wake_get(struct 
>> xe_force_wake *fw,
>>                           enum xe_force_wake_domains domains);
>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>>   +const char *xe_force_wake_domain_to_str(enum 
>> xe_force_wake_domain_id id);
>> +
>> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>> +    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>> +        for_each_if((domain__ = ((fw__)->domains + \
>> +                     (ffs(tmp__) - 1))) && \
>> +                     domain__->reg_ctl.addr)
>> +
>> +#define for_each_fw_domain(domain__, fw__, tmp__) \
>> +    for_each_fw_domain_masked(domain__, fw__->initialized_domains, 
>> fw__, tmp__)
>> +
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>             enum xe_force_wake_domains domain)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 52436dcb6381..8e36202f1a4f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>> gtidle->powergate_enable);
>>   }
>>   +static void force_wake_domains_show(struct xe_gt *gt, struct 
>> drm_printer *p)
>> +{
>> +    struct xe_force_wake_domain *domain;
>> +    struct xe_force_wake *fw = gt_to_fw(gt);
>> +    unsigned int tmp;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&fw->lock, flags);
>> +    for_each_fw_domain(domain, fw, tmp) {
>> +        drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
>> +                   xe_force_wake_domain_to_str(domain->id),
>> +                   READ_ONCE(domain->ref),
>> +                   xe_force_wake_domain_to_str(domain->id),
>> +                   xe_mmio_read32(&gt->mmio, domain->reg_ctl));
>> +    }
>> +    spin_unlock_irqrestore(&fw->lock, flags);
>> +}
>> +
>>   /**
>>    * xe_gt_idle_pg_print - Xe powergating info
>>    * @gt: GT object
>> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct 
>> drm_printer *p)
>>                  str_up_down(pg_status & GSC_AWAKE_STATUS));
>>       }
>>   +    force_wake_domains_show(gt, p);
>> +
>>       return 0;
>>   }
