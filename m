Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F994C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 16:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096B6112854;
	Fri,  3 May 2024 16:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv/4z5yO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65B9112854
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714752106; x=1746288106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vx3bjDLbgRB2Ma+4BTKbWRCYolc8Jrr7bqgL/6cS0KE=;
 b=iv/4z5yOjWaYHFNfnNRYpDiKwALZ/sBd8vqJCnyoyAp3TNZcU/R5V/Zx
 SAuvg39k4FIGoAuBNAGQJWuHxYE+Lrt9GamdBO7mUQMIZF1KCZQiiuhk3
 kXpu8pCN1fD+zrsOJj6YuMyfRKqc9xbzjoiuuYWCI7/cj0tGkXfWAFSL/
 oAaqD0X2oz9fVBt7ocfgNLDrVbaDAd3BSDdhwpAmLSzmxeC0UdO9olDSG
 ar61iOwTDG45kSk84C5E195yzCXUSJqJ1/MVE5eiWHKt2PodKs1tSL5Kg
 9R+O7r2aQbIo6biZoo2jXGusDWXyleIySvZUYpgaDUvNqAFPqlmfUavwz w==;
X-CSE-ConnectionGUID: Vkgn9ZVoSq+RCuagge+jVg==
X-CSE-MsgGUID: +LgAh8zBSSiTAKjHfSUYNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="33075307"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="33075307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 09:01:05 -0700
X-CSE-ConnectionGUID: aYT5wsBcT/m4Vfl7cqsHuw==
X-CSE-MsgGUID: sJIGQ7bURzy7I5hagxY4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32289433"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 09:01:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:01:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:01:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 09:01:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 09:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiHwa4NYPGOR7ItLWjcvo6hltKi3jFFwKgMiK/yQIeUTyB1EX0g0/58IR3aP1S6SSe8CtjsLOFZTEvSjVfvqjpsPL8XRf/6UIS3eoMgUosN4h6oFut4Cn/lIeTRUy3gbNV0J0CLy03I8t3eUuxvS7FMiUths8RWf+0CNcs1uuNBDxukwzhaMFCSC2lk/87600Sc/Xv113b3SF+W3G/BuEUIdi5htu9Mpjq3OkIPIMxXRbqNjt7jRDjC7MhtwJqA4PvFepXvsObO5hhdbUmuXO3a6fI1k6/7BydBXtg0NE8vv9zmOXD6IO5P14vWLXzCrujrK5noAzMADlr/bnp1Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae+snh+i5RhNIkRBoDQOVYZ3iBwZW4xB8nX7yDoFR2I=;
 b=a3+fdu5LOZ52RJ2mmJYSMzOhxa/R22XUmlxcby9kp8vkFsbD7UvczDc1pF+RNxo+TfI1//N4CDtVb6EmW8qZLD829WgI2vZ7UH3fxvj4d6SuT8hRxyAx2N/Wr++BxoVRhNFP//hSSjQNVxuqgfv248dlDTJslDO+vqueALCzUO1NL17RQ+QAPCLk22pbiDs5paCz63LlBAP/UB3V5Pnd/tRn7s+lAKVEUkw15JHZPsjCSl/YncTaMwLMlY53gOWXcvRY/EHpauGD09ZJrlKXm50+eVw0uOdbh3Bvu4fq6CjiNGYIUgom4xtUmL53Z0Dqv4Cj+W2uGlfAuWal2dshwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.37; Fri, 3 May
 2024 16:00:58 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7544.023; Fri, 3 May 2024
 16:00:58 +0000
Message-ID: <fb91cdda-f59e-4aa8-a9d4-bee6d8f30154@intel.com>
Date: Fri, 3 May 2024 18:00:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <20240430162529.21588-6-nirmoy.das@intel.com>
 <SA1PR11MB6991BF7C2848F2FEE0D0F0CE921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <SA1PR11MB6991BF7C2848F2FEE0D0F0CE921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2757c1f8-4407-4032-e9d6-08dc6b8a38b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2dGcEFadndNT2hRRmJZaXlmb1ZxRzMzSHlIVXZoRndJQkFWSEhJbk9OdnEr?=
 =?utf-8?B?Q21hU0dSZ0loaGpjYXVMSGVqQjZTeEZuU3ErMWhYbGp0TXZGRkVGS2ZxVEZ0?=
 =?utf-8?B?dTVUazcrRDg4NmFUQmxiQ3Q0cGhWeXpyU2xBOUtBU25IeU9aUncxOTgvSHFR?=
 =?utf-8?B?cGtkek00Y0kvVU8wMXU3Z01jVHA5Ujc1TGUvbXhPOHpEaTN6UzZsd1JCUFk1?=
 =?utf-8?B?M2dXN290NHREdUZDOXBrVTdmdjF2Rk5jZlpjdHlnWFdJUnJOWTRyaG5oWE9x?=
 =?utf-8?B?SjFJOG1IYjk2ME9lSTl6Q3Vmb2l4bE5nTHFkNm1BNENNbHdUQXdmUHdyeXFm?=
 =?utf-8?B?THowK2VydG13SFdCRE9wY3JWYUtLdDUwWjMrRHkxaTVhZVNQVVh3cnAza3pq?=
 =?utf-8?B?TXo3bDdBNjJUNnMyTWNqcjRPUFBwY08wd1huNUZEbCtJL2hWT1E0RE1wUW9z?=
 =?utf-8?B?MUxoTE5MT0srekZCaWhBR1BQWVROVTI3UUFzZnhMOHZyS0JvMlBjYmNMWlU5?=
 =?utf-8?B?eFI0dSs0VFc1RVpabSs5SjhGcE5sL3dyN1JkZ1A3c3NiSFhpLzE4QWtxNGlN?=
 =?utf-8?B?dVM2cHBhazZsd0IyRUhGbUFmV2ZFNldGZENKbzlXKzBPUEFqRVh6K1luaWVM?=
 =?utf-8?B?U2l4NEFnMDlRSEJ3cGVlUS9lUTNoaFdMUVg3RnZLVXJTc08xU0U4Y1F3eUZ3?=
 =?utf-8?B?WTNaMXNtbmxEUi9Oa0RZWkxnd0xubnpiUG11QUVBZVEyL2tYSkM5STBIMjZF?=
 =?utf-8?B?NDU2TlBGck1tbkl1SDkvTUZXd1VON1hYY1UxQnRCRnY5MHA5bDhzMkxuVVBG?=
 =?utf-8?B?aGRjSURjOE5wU0tyN3RGNXd5V0tkYVF5SnZYWW1WV3FmVVNSeEYrVWprQnJw?=
 =?utf-8?B?SG9mcGVVVVVScjdHcm1zLzNndVFKaFE3QTZucnN0emVuOUduL3pHaG5zVHJG?=
 =?utf-8?B?UGtNL0N3aFJaWmprYm9BV3V4VGc0OElQUi93YXc1dU9TWGFEYXNNRC83ekhY?=
 =?utf-8?B?NFR2ckhGYWV1RFhHT1RiRld6QmJmOXhRUUtqOUpXS2M0VGlWWFV0eFhyQmd4?=
 =?utf-8?B?MExvUG92clBhd1IvUWRwbm5MNUR4QVRnNGtINU5JQXVlTDR3U2xZUGp3L2M5?=
 =?utf-8?B?cG9xNTRva2d3YjRQRkREcW1mWDY3MEZEUzNBbklidXJ4V3pia0FKTE5rc3ZN?=
 =?utf-8?B?N0hmeGYxZGNkRDliM0RWZ0s5SFVBL3d1R0l3Rk9jWHJ1Z3FQcWx2V0ZkNUEr?=
 =?utf-8?B?ZkV2V1Nta1lQMDJ5aURVTzZ4OGlsUkVZekxscUVIbG9YTVUyUCtTRE1aQWRN?=
 =?utf-8?B?RHNCaFpUSm9HWndFOEtuQlM2V0o0bXNVYk9jOHg2VHdCN0Zic1Y2aklpMVI4?=
 =?utf-8?B?OFY2d1l3MlpnbTVBbkg0VVNWZTU3SDRFM0lPd3UwSnkxaXdIS0lwcHR5NVRW?=
 =?utf-8?B?V1pmeFlZVXFrd2QxU1dLMTAxM1liRllmQUswL25ybU5qRW5CdzhJWGJOdmhy?=
 =?utf-8?B?RHVmbnpaNkFlYk9PSDNTM1BVYlFvQThqUExoVk9oaDBTeS9uNXBnYk9lYkk5?=
 =?utf-8?B?MSsydEE3cGVZZit0QitKUitKWUNiS29hRGhXQy9oM2xJVXpoMUd5bjJFeU43?=
 =?utf-8?B?SUFmRGFIK2tzYWczVXYxRjNLRUdFeEg4SVppY0FXaW4wZHR3K1cxNUUxSlhC?=
 =?utf-8?B?UDNNYnYzRzdjWHpSS2xhMU9HOGNDS3Q2dmVVVGVNRVNXSHZHNnZKQjB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2Q5QUpKWE9YcjIzR09iV3dCTUZkdTJhbU9TQXNJZUlKT2grUEFNUGU3RnNB?=
 =?utf-8?B?RE52cVM0UWcvQ0Nlek54amdreFNmTjNwWHRQajdjQWRWNEd4aHUrQkNPOVNC?=
 =?utf-8?B?N3pZQVczWUFSYTNib0dpTTZCK2QwbU43WlY4V2djeUljVEVESXJzTm5tUFVW?=
 =?utf-8?B?dlFXd2VJSkJzQ041aDlUK284Zk1RTWVBN1JKVWhxcktlZmJhR0JyY2pmNnZm?=
 =?utf-8?B?MkpaZnpMRUQxR0pwVXZUaE9hK2UzdkhzMVlnQXdWZUliVDNmbmxGS3dTT2lp?=
 =?utf-8?B?d253VjZrMVUxVTlQa2FvV0FBZjlzYjJYSE84cFY4UmRGd2NpQXVuMFN4QVRU?=
 =?utf-8?B?SHFNMk0yRVFuV1RoOU1RTXVjNE9Ya1BvUjdDcXgxSVloS25qV0Z1YUwzbmEx?=
 =?utf-8?B?UG85STEyRGI3ZTRPVUtldFV6bXJrWmpYdXFDVmxIdjBuSTlXQ3I3dGZSNmxw?=
 =?utf-8?B?dFNaWjdDYVluK1BnbzJ0UGg3WmE3cWpkZE5NK3hsOXhwNWx3eUVTZklSdnVZ?=
 =?utf-8?B?bjlmclBRaVpsWDAzUGhHRCtBRjZvek5pSGxuNWhud2J5dmQ4aG5BMnkzc0dw?=
 =?utf-8?B?MjZqWEJSd0JiWDVHVnhSOCtOV3NZdFcxdU5xcnYzcit6d2oxMmxoMDRHUmd4?=
 =?utf-8?B?dGppY3JrOC9KN09MVmNvbi9XejdWa3dpQ1JPSE5MZ2J3akFHUTc2eUxZZGIx?=
 =?utf-8?B?Q2pJb0ttcnlrSDcwVmNmd0lHL2RIMkVxN1poN2w3a2ZCb1p1dXh1cGxTTnBT?=
 =?utf-8?B?YjJremU1NU12RUI2Ry9aS2Fsa2FiY21zMEsyM1k3MDJUVEE5KzlNZitCSDlJ?=
 =?utf-8?B?T0pZZVBUTUxreHZVendPY1c4Z0xlaWE3dkJlbVF6Q2JnZ2d1UkFZZjZLZitF?=
 =?utf-8?B?UzlWN2ZmajBQckdzNXZGV25idGVuNHNBZVpqSkp0a3VUUGNrR2RBb3dJWXlu?=
 =?utf-8?B?ZTRFWDZFZ0tKcnBYM3hLRk8yNk1Yc3hobDYrVFpycVVMRktOSEVLVWJ1RWFH?=
 =?utf-8?B?WDNPRkFVbzJkcmkwd2dKdXJqbE1jL3dRZW1ibWd2cDZVSHdia3hsUWhKNTlH?=
 =?utf-8?B?ZGZjS1FIenVaVll4RFVEWWl2bTdXYWd2cjNJU1dZd1RaTXNwTFgwR28wcExY?=
 =?utf-8?B?UHRHam5VeHJCNzFUd3ozZXZ6OHNPTXB0S3JEV3pJaXBIRk93N0UvYmRKV2Nm?=
 =?utf-8?B?TmY5ak1JUGE1YTBrTzlwNW5OOVlqUXVxZTFYOVFnQVhzdEFwV2RscjhSZy9U?=
 =?utf-8?B?NVFGVURmNFl1VzA0NTMzYTFSdC9GQlpudUtTb1Zxc3NvS1pIUWcwQkI3SDBF?=
 =?utf-8?B?VmNUanNHaFFpMTlkTjNBaktCTStwYWVWMHcvOHY4NVFQRis5cC9xS1oyWUFw?=
 =?utf-8?B?V1NUdXhpRWl6MldSTUpLOTB3UmEzOTNObTRnZXNDK1VzTW5kaWthdndwWFhN?=
 =?utf-8?B?MmJVa3ppNS9hdDBib0JkSnFIUTdPdlJBK1pSOXFicm5xWm51bnlzRzYvUEg5?=
 =?utf-8?B?ZGJraEJFdTlpdGZYWjZKRkdlVzF3S2g0cHA0U0pmanJnVTI5ZzB4OSt2eHlG?=
 =?utf-8?B?YUVTOWsvY2JZdmlWbHJRYkVaRFJ2U1VYVzdlTFgrWTA4WFUrckhHN3ZwbHRQ?=
 =?utf-8?B?TjkxQnQrTWhNQ21EdTVuaU12ZXZYSkxYendkcjMvU3B3aU52a09uU08rRTVJ?=
 =?utf-8?B?OXB3WW9WU1N2a2RLU3VkTzdINVU3cnJweE00T1FtdmthTlhmVC8xVVdGMkRI?=
 =?utf-8?B?d3ZXcGRTVmJOTU1ubmlhYUhrSlNEVnZ5ajllS3RudlRCOXFKcVdpTE1wM2pJ?=
 =?utf-8?B?R3RNdWJpNk5uNDhpdjBaQ3U5ZzlWbzhLN3hOYy8wV3VEWU9xdnM4dUZ6dnBK?=
 =?utf-8?B?Y2VBM1NmektncHVtREdSMGpGQ2hoaThidDJ1NEZ1eUVUdGh6RGRtbi9UWERS?=
 =?utf-8?B?U0psU3ZWeTFQTmgyeTBYKzhxTmRJOGU2QndKQVBIbjl4ajNSa0pYMGo1RUl6?=
 =?utf-8?B?dHhvZ1BMNGtzcGlUYVdweHF6a0RlUEV0OGpOZWFlNS9KVkpYWkdlL2liTHJZ?=
 =?utf-8?B?S2tYc3k1dC9KTG9rdXc1ZjNueWk1djFmWklRRVVzZFErdUoyMExSdW54c0t3?=
 =?utf-8?Q?dLdV39gQiwWawdwhSIKhqyh60?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2757c1f8-4407-4032-e9d6-08dc6b8a38b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:00:58.3557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGxrXGMaAlwutmvVufmcwAcZvNA8dHR3ALvS2O1Nez2A77M/ERqS/PsPsQXZlZa7kFp+y/VUlOkduOyvKBhYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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

Hi Oak,

On 5/3/2024 5:39 PM, Zeng, Oak wrote:
> Hi, Nirmoy,
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Nirmoy Das
>> Sent: Tuesday, April 30, 2024 12:25 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Mrozek, Michal
>> <michal.mrozek@intel.com>
>> Subject: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
>>
>> The default behavior of device atomics depends on the
>> VM type and buffer allocation types. Device atomics are
>> expected to function with all types of allocations for
>> traditional applications/APIs. Additionally, in compute/SVM
>> API scenarios with fault mode or LR mode VMs, device atomics
>> must work with single-region allocations. In all other cases
>> device atomics should be disabled by default also on platforms
>> where we know device atomics doesn't on work on particular
>> allocations types.
>>
>> v3: fault mode requires LR mode so only check for LR mode
>>      to determine compute API(Jose).
>>      Handle SMEM+LMEM BO's migration to LMEM where device
>>      atomics is expected to work. (Brian).
>> v2: Fix platform checks to correct atomics behaviour on PVC.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 37
>> ++++++++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c |  2 +-
>>   2 files changed, 35 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 8d3765d3351e..87975e45622a 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -619,9 +619,40 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma
>> *vma,
>>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>   	int ret;
>>
>> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -	    (is_devmem || !IS_DGFX(xe)))
>> -		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> I think below logic can be moved to a separate function? I am also good if you leave it as below. But I think a separate function is better
I was thinking about but I think we should do that, once it gets more 
complicated with madvise-like options.
>
>
>> +	/**
>> +	 * Default atomic expectations for different allocation scenarios are
>> as follows:
>> +	 *
>> +	 * 1. Traditional API: When the VM is not in LR mode:
>> +	 *    - Device atomics are expected to function with all allocations.
>> +	 *
>> +	 * 2. Compute/SVM API: When the VM is in LR mode:
>> +	 *    - Device atomics are the default behavior when the bo is placed
>> in a single region.
>> +	 *    - In all other cases device atomics will be disabled with AE=0 until
>> an application
>> +	 *      request differently using a ioctl like madvise.
>> +	 */
>> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> +		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
>> +			if (bo && xe_bo_has_single_placement(bo))
>> +				xe_walk.default_pte |=
>> XE_USM_PPGTT_PTE_AE;
>> +			/**
>> +			 * If a SMEM+LMEM allocation is backed by SMEM, a
>> device
>> +			 * atomics will cause a gpu page fault and which then
>> +			 * gets migrated to LMEM, bind such allocations with
>> +			 * device atomics enabled.
>> +			 */
>> +			else if (is_devmem
>> && !xe_bo_has_single_placement(bo))
>
> Note bo could be NULL here...

is_devmem checks bo that so I left it out.

>
> So userptr and system allocator don't have a bo
>
> Userptr can't run into this case because userptr can't be is_devmem
>
> System allocator allocated memory can have devmem backing store... so seems the logic can be:
>
> (Is_devmem && ((bo && !single_placement) || !bo)
>
> But we don't have system allocator for now, so your logic should work for the current code.

Yes, default for userptr is AE=0 hence I left it so and planning to 
change that when we have madvise-like ioctl.


>   If you write as above, then it is future proofed. I am okay with your current writing also - I just need to change it a little when system allocator come into picture....
>
> I do feel the logic here is getting complicated, hard for understanding and maintenance. Let's follow up the other email thread to see whether we can simply default all allocation to be NO_ATOMIC, and depends on compiler and UMD to set atomics up.

I will keep track of that.


>
> As of now, Patch is:
>
> Reviewed-by: Oak Zeng <oak.zeng@intel.com>


Thanks a lot.

Nirmoy

>
>> +				xe_walk.default_pte |=
>> XE_USM_PPGTT_PTE_AE;
>> +		} else {
>> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +		}
>> +
>> +		/**
>> +		 * Unset AE if the platform(PVC) doesn't support it on an
>> +		 * allocation
>> +		 */
>> +		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
>> +			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
>> +	}
>>
>>   	if (is_devmem) {
>>   		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f1357e2a3b10..d17192c8b7de 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -888,7 +888,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>>   	for_each_tile(tile, vm->xe, id)
>>   		vma->tile_mask |= 0x1 << id;
>>
>> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform ==
>> XE_PVC)
>> +	if (vm->xe->info.has_atomic_enable_pte_bit)
>>   		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>
>>   	vma->pat_index = pat_index;
>> --
>> 2.42.0
