Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F67E7FDF3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 01:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7042210E45D;
	Tue,  3 Feb 2026 01:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ghk7Y+J1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7850D10E45D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 01:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770080684; x=1801616684;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GTjPNEFh+KobAsIDs/ObVuKK17+FGSvQ88bD4BtJdnc=;
 b=Ghk7Y+J1iD5BlUGQ+Tj+o2mD5Qge9rrYY6kOXIAGs1kLOAFjO3VQnl6b
 DCGgqeqB19DtvB4JdmrQ1cdkfAOoJsXaTcpV8urIl6RkJICzY5TC55078
 hLq0wBAAytSYoLqi6IjC7onEq9pSooaR7ocvR+uJTWSHTeYNyKs9Ln6nf
 xikBBXlXe6JlqVG/0Taq+NbAwijMyYOJ5Lll9ab+xmEBrWN6c9M3uG9cM
 QdrLGvjp0dEm0QtBDi5AUypGgpTAGo92O+U/bGMuqfRhJLN4AGEQRGDos
 ASR5V3U4U6+Xv1DqtNIt0mtzMB6CnnE/6xIP14U1cdoR9OPdfuj6gJ4hG w==;
X-CSE-ConnectionGUID: KB1kiOcPSIGEgH6OEDzsvQ==
X-CSE-MsgGUID: opKhrz6dTOyqni+pfk7YAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="74870634"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="74870634"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:04:44 -0800
X-CSE-ConnectionGUID: gIemqahJQ1iZt1pHcVsKWg==
X-CSE-MsgGUID: sivbT51fShyvKXiAsVH3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214200874"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:04:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:04:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 17:04:43 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVqqJk1QCo9NRyPI4VE/60veuXie6S4YozPPxNi3utyiTEbnVpZjGqPt7CvLFU+ZPYApdcK7Z79ZIVjSbKGcrbDCdLQnjzsn9U+DCo4uGBQ66RkphCCXJgUhNlQBqmIPTo+UMFu6j5QEj6WcoK+779lV/KUVxcBoYlJSUm1tWqawResWyw0dayWdMjHGtF25Rc+K4g9I01/Ff88dWeUT5vNIKuWoXMQePgepSgs50XRd9ezmevQOCw4XH439qgAbhUcbe6IK8oHx6EcxY0HpoI5Vo7ohLZ5dCDRKcj9BisPd6gYSNAeECsJKKqHGUoo8CLzCYJjTvKAN+bofd/qlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M2AvdNOnkjSdWqBb2TkmWtNTPvV8YNtnQYpw23xHqs=;
 b=dMQgnGgV4gTXRvLJICALcMqwGfW4nUo2loaX8m+nS3yvdU97sethjVSOcgdKwpXnw3DMPcotwEMWTrUHTcJWKj6fszkSofqX+sjNim8sh06r0YV3sG8mueP42XBlFbs84rcTxpzNXWqDFGXdhlBwIrZOvgosC+zRob3+gMIWEwjOp4qq3gskcaa+KjXDNYtjuJdJN5j1OSjC9gzDe+HgZlLb3nRZK7+8JTRaal6xsjL/yev8FQhN0BsesginYf/TW+nPPYkt9jLy95iRFY20TRezlpvQn9e5z+/Hj1PY2Pgy9YRmRpfrGm62EVxerttzpI041AkvwqJ2dC5Ji4Ay9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:04:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:04:40 +0000
Message-ID: <761402ad-6d8e-4186-9f3e-6c1c640d2bd1@intel.com>
Date: Mon, 2 Feb 2026 17:04:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-8-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260130210120.2682085-8-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: e6598d73-c12b-4e80-fc3c-08de62c035ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtiQlpEdTJaY1hqQ3llYW5XQ3pQekRLdFRqZ0FWTEpCZE5uU1BXaFNZZG5l?=
 =?utf-8?B?bysxZnFRYTdTVmVwY1dwaWF3MGNJRHdZdjBvMkFPYUFubEh4dUNkNzI1REJV?=
 =?utf-8?B?YktvR0gvUVJqRHNVa0Y0NklFZzk5SGdlOGNzdE9lQ3dtbU42V1lwSnR6elpW?=
 =?utf-8?B?NW1iaDRBNDRZVlRWa0JEV0ZMb2xxWDI0V2pVWkpsOUxGUURTMU0zb1RsdWk0?=
 =?utf-8?B?L1JFRlhhbmpoMFM5ZVZQTlFsRDJ6QXhWSTJ0dE9QcVFtd2h3dFNhdFZwaFZi?=
 =?utf-8?B?dWttNnBTRWVCRVdmYzlrZUtmNldsVHhFSmI5TWZ2bk1KQlJhMUpSRm04OG5o?=
 =?utf-8?B?djhVSk1teTl1ZGRpWVRnYlRqaGFEQnRqSlhCYWJ6SStxaDFRY2FYRHJLa2VG?=
 =?utf-8?B?NTZZYzNpaWV6TzM0VWJaTVc0MkFQNkFKamJ6R0x5WTRIamtScU02bU5JZVFr?=
 =?utf-8?B?dG5VSGowNjZtc2lpcms2WXE3ZGhpWUFDQjNGV2Y2d2VJWkZFRVNsODduM1J1?=
 =?utf-8?B?V3pjbzUxbDdEQ1g4cncrd1cxWXpOc0VXY3luQnNKdGRvN2JCQWNOTDdBNmp3?=
 =?utf-8?B?SGpOczhmOURHVHhxNEhiOVdLbGJrVk9sbzZwelBjYm9qVC9FOEhtUksvblEw?=
 =?utf-8?B?ZFBGd3VBQTdyNUZuRTJqeVRRbmExc2g5SWJQZXkwMGxOQW0rY3hoYm9oeFFB?=
 =?utf-8?B?Y3REUHdWU0k1RWxVa2tMQVFTaHlPb2pPT3RhcCtaeDlXRWpjRjZIcnYyeEIz?=
 =?utf-8?B?bUJSaHVhd0J3eWFGbnROS3JhWUU2Z0hKNElTeHdMc1FtVWVmSHhKeXUxWWkz?=
 =?utf-8?B?eFVzRGNZM2VzZW01VUY0d0JDZHdlL3lHSlBTN0p6dmpBNWdrRENYUHl2SGlB?=
 =?utf-8?B?Mml2MjFtajRIRTF6SDBjWUxQa1pJbjJIZjJ3akRvaVJRMTlONS8zZGhqRUMz?=
 =?utf-8?B?VHJlMFRFWitlK1l1NTlLRWxqOFF1andMMDZ6dFZMN09HMFJ5Q0RBWDRCaDRP?=
 =?utf-8?B?dStGcm05Wk1aRUNwMWxoRXgvWHFEemZnWjlKZ3p6U2VvRjdXNkZadnJLWjNi?=
 =?utf-8?B?MHJKTkZGOUQrSm04U2ttT283bHJNYk9hZnZkWGFER09DMnV3RGl6SWp3S1ZZ?=
 =?utf-8?B?TWtsMmdyeTNHYWlaK3RPMk9NSjk4c25zQWhnalNQdEhtYjJRWWI3TGJxQnBX?=
 =?utf-8?B?VzBVcFdMbWFSbGI0MzNxSWZ3a1FVcnVXSDRHU05DMXNFbjVqM1Mrd05KMnhO?=
 =?utf-8?B?RStjSHAzQmtyTEhmdW8xc3FaZlRqdjhVbGxJOHVqUXRLZ05tajlna2R3VW40?=
 =?utf-8?B?VXVzRnI5TEN1WHVPK3lPUXlpT09xdFhrZXBXcXo0eEticnFNS1VsTHg3SCs3?=
 =?utf-8?B?U3E5ejVuRmZSQncwWTFjY2RnTmZyUlhSUTFMenRISzhTZ09JSWpSSE51M3dB?=
 =?utf-8?B?MDA5dmMyd3dycWxXcGtpdDYyZzZMNlRCVDlqU01ETlNvd0xJVEh1UlBHbURI?=
 =?utf-8?B?cnppL0VUazhwL2lxZjJFMHA1cHorY25yRk5uYlB6REovSlFya09KT3BLNDRl?=
 =?utf-8?B?bHJSbkE5RmR3aC92NEhHTWU0d09JMUlyaWE0NXdXNU11Wjk0bXNXNHRVVmFl?=
 =?utf-8?B?eUVwTkkwZUNSaVhzbDg0Q3I5bGdpSXdkTm5CN0RFRmc3YjBacHNqK1F2ZmJz?=
 =?utf-8?B?YnFTV2Y0bUs1YXFya1RCQkFMZGR4enh4R0UwWGxTOVNIT0ZPWGwxeEdjT1k1?=
 =?utf-8?B?ZXpxL0I4RVZxMmUvUktkNjBQaFdndFQ1Q0JJVjVSSUx5RHYwSGRoRDd0ZTZ3?=
 =?utf-8?B?emcyS0JaZHNuUXIrS1pzWjgrRjA0NzZoL1EwMHRHRjl3bmtPRWxjaFJLdXRO?=
 =?utf-8?B?ZXZDZ01Bb3FuV2t6TENJVHNHbEJkREMvc2F5bzluc2d0NkVoSHZyZ29MOW1W?=
 =?utf-8?B?cnRKS1hraUs4clp0SzNZSktLcU1TQ0xtSStYa3BWd1doREwwV3p4aHc0dWg3?=
 =?utf-8?B?elUvYlZxKzd6YllIdVRzaWRTUXVCY3FuZUVNTzEwZ253ekx6azlPUHZnM3BK?=
 =?utf-8?B?RGJKTDNMQ3JNTFF1Umc3dzM1SHhhUk90TkFhL3doQ1pTdUtjQWg5bk8zSzNj?=
 =?utf-8?Q?Sn1Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkg4RkxOYkxTRWFBZkk1bVBPdnRPbDFYWjk1UmFJdkMxSE03VmtCeHBoTGxk?=
 =?utf-8?B?bWwzOE5lOTZxM2RtU2dZakNmTEVJY2loUFJneGFYVFVXZVNEdmpCRGRoZGdS?=
 =?utf-8?B?QTRJUEZqY3lNT1lmNW5yTGxWZHVVOWNoWllIZWZiR1VKcXcwU0t2Y2VnY3Jh?=
 =?utf-8?B?eFlqUGdXbmJ3eHBqaStmdlVyUy9yZHVOc0RlWFVQeW9hZ0txT3NBQzVNaHkw?=
 =?utf-8?B?L3d4VG5sMFVUMFc3Syt6dzMrM0I5dVIzKzl4K085UVNUR0JObyszVlFQRGZN?=
 =?utf-8?B?eUtQZ3p0NFFwanl1VC9OODNldXdUQk0vNXdOWE8zZVN1RWxmeTBiSTRjVjFj?=
 =?utf-8?B?MHI1Vk1XNGxxaGNwVnkxc2FvOXN4YmsrNUR1L2FsdVBGbGxIWDhJRzJZa2N1?=
 =?utf-8?B?R3dTSmNyVW1NRkw5UEZiNmNxRjA3U254M29uVldaNUE0cVB1NWttZzgwTjJF?=
 =?utf-8?B?V01vVzhKZUJwNVlwNnBHSGNmR0NoOXo3alp5M0cxaG5oZ1lWbERFY2VNbkcy?=
 =?utf-8?B?ZktZdmFzb1hDZmJFVk9tT0UzM2JUK05RaDE0V2dvK04rSDJDZjYvak44U3lr?=
 =?utf-8?B?NGxraldCMzdsN2xjQkNsUzJjYkZ4QWNkNEdLcmE1VHE0a3I0MTdubEYrZ3Vj?=
 =?utf-8?B?djZPTk5ycjhNTkQrRjNzRWNPYWFBWXlmcXp0Qit6RjcrR3dFV0ZXcm1tbjNV?=
 =?utf-8?B?d01wU3YzMGI5Njk1Sk90dWNtTzd4WkU4SzZ5WGFIQzc5aFk5N0drS3JtYVRM?=
 =?utf-8?B?YWJyWFJ6OTZsUnR2NHUzWnRFdCt0d1VMaHlJdEUyWHhpZm1TT2pjOEFHalNB?=
 =?utf-8?B?WFVsRUJXOFFaSnlndzNPZnBZcEhhRWxqbU9lc29pT2dIMTgzTFhwb3RpQ3Fv?=
 =?utf-8?B?NTJVaVgxWmNSejY4YVQvMGRnNVZJMWhiUytPME5vZHhVcVB4dllsVFIzN3Zr?=
 =?utf-8?B?WWhHams0WVhmWnIzQXVpWU00NVV5SHRtQVE3R2Q3cU5xWGhDSWFsK1AzUjE3?=
 =?utf-8?B?R2pROFl1VXZCT2hZYWhLM1lXb0VjMktLK25xaEtad2lmVnd6OEhtU2NycjNZ?=
 =?utf-8?B?RUhKcUpaY01ocEdjdTVUMVVXMUN0dlV4WVlmS1BHNXhlTktqM0o1Y0xUMUVr?=
 =?utf-8?B?T0lPeFFzSCtOeEpUbHFWL1Y0dG1PY2gxREppYkNYc2J6cURxOTk0YWdaMnBj?=
 =?utf-8?B?WFBQUlFKMzVyNG00ZkJFOTFNQWx2MGR0ckFqcmZyVUlCcU9zdnJ5dnpRSlJi?=
 =?utf-8?B?bnQ2S3dkT3A0ZUZyS1A3d01TNy95L1Q3VUNNQWpjQU05VkljWkpCQWhsVm1a?=
 =?utf-8?B?dW9odDlFUmNhbDBML1Rvb2w5M2VpSStuYld2RG5oR0U2cDVKc1U5NzhkSEs1?=
 =?utf-8?B?OE1zOWhhOFZETkZ2ams2b0s4OG9PT3hCdkE5S2kxNnZtT0lZVmZHMWpKcVBZ?=
 =?utf-8?B?Y2pGeE5qUkJuWmFaaDIzbWhYeGJKcS9ybERNakFkRnU3SEF5RHE0cE1pd2hj?=
 =?utf-8?B?NjJVb0JkRE50Ry8vV1YxOXpML3hJanI3Slc2SmxRRlhpNU5SNUF2RC85RVMw?=
 =?utf-8?B?YTgrRUgyUkN5RkZ4azUwODZrcGt6NzFpY1dtM3JkUkhEdldzYlBXUEZib3Mx?=
 =?utf-8?B?TVE4UVRqU2xkdDFqVkdPWUY4eHEwTVpTMnpwa0xSbjdPaDIvVUdjZm5uNWtm?=
 =?utf-8?B?R05UYXlPOGxkRmVrNTJ6VW1VZCtacktqcjhTTWNvT2RHcWVOT28vcy8xeVZZ?=
 =?utf-8?B?UTkzS1NMbDZkcm1CdGZacmRyZVZrMmtZUmtlQzNtTHVja3U4WVI3S3ZibkF6?=
 =?utf-8?B?UjZWeXlFbmJLenVsbjNwTXpNVUhPcWpmR0kvTGFEQnJ3bzJZNTY1Ti9NK3Rx?=
 =?utf-8?B?ZXFlZlBmYmNOQVBRNHp1bzdpQkhPcnlvTWFobkZsdjBTQzlOVHhISlI0MmxG?=
 =?utf-8?B?a2pYWnZhdmt6R3RGcGs2VThIVmtNSUMxRFRwVVdhRGVEMk80clYyeXpnZGpq?=
 =?utf-8?B?Q00xR0JaR0MrRmNadFNYRjd2S0VFR2ZKSi96VDVyc2VtdE1QcDFRRnR1by9P?=
 =?utf-8?B?Sk04RU1OYWpZakltb3ZNRTJDR2NaRDc3L3BZRWEvM3JFMkprMTE1bVFoUkdz?=
 =?utf-8?B?dW8vZXJXYVo4emlPc0tXcEhHSWE4eW10cmZGU1NBMWFIakxJWUJDR0VPaWtH?=
 =?utf-8?B?WW95dEJFWEtjMTFVZWFNc0g5RW8yNkdyYkR4Ym9JNWJpTXFCV2dYTTM3Ky9p?=
 =?utf-8?B?NjBKcGp4V1NLeEVBWDA5YlJvb0dNMXZncDg2RW4xRTYrb2FqdG93WklOQlA2?=
 =?utf-8?B?NExndmZSMTVsU1RvVjMzdTNRM0JVN2xqaDdEMk1aSE1NMEN6RWFGU3VhQWgw?=
 =?utf-8?Q?6CGO+i4qFMHFvJvU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6598d73-c12b-4e80-fc3c-08de62c035ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:04:40.8384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyoxHijqO5fsFI2ZO1xfG0xcTgePKAx27bbFEZ+UZ0+UMrs4Pa1VIKtehYPpLLgARJll7yNZhIpoVZjjDNebrxkOz12MVG1AMwWU4fZfnLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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



On 1/30/2026 12:50 PM, Julia Filipchuk wrote:
> This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

This commit message also needs to include an explanation.

Daniele

>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 779546ec8836..37dfbcc8f028 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -94,6 +94,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   #define XE2_GFX_FEATURES \
>   	.has_asid = 1, \
>   	.has_atomic_enable_pte_bit = 1, \
> +	.has_indirect_ring_state = 1, \
>   	.has_range_tlb_inval = 1, \
>   	.has_usm = 1, \
>   	.has_64bit_timestamp = 1, \

