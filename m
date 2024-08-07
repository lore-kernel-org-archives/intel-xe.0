Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E67C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 08:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4DF10E45A;
	Wed,  7 Aug 2024 08:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5HWOORJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5177C10E45A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723019214; x=1754555214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=95/IbZb7WaZ6MffQrDA80sj0wWEH71/dV69PDt/v0BQ=;
 b=C5HWOORJiWwAA2DgjoNY3pALV4N7U8mJai/2jmK5n/EKGQtpMnJu3s6N
 eR1FN402ZTbs001crbWu/XVjg+GlGm0AVse6Wb1scvWCUBEjP6CpF0JfC
 luaPWzHJq57aAIebDdQVaBrhLRxecEfUnZOxWr7+vxOC9Q+wqTobBtMO9
 Y9T2dctvlx4T6+q3AYFREM1KMM8DMaqb3mOILq5cVAhGJRts2yGjy/TVH
 Hef0lqNYvujszcN/yRhwEjv12Lzb8j7kW7meNbIe+e+urkzMQfAEYaTF/
 0WPLqkSkPyH9BTqcchoDeBp6EdxowAmg6ENK/E+HdtutGxHkqscZiLs4G g==;
X-CSE-ConnectionGUID: EjDvT+MeRvuscKRo37zz0A==
X-CSE-MsgGUID: B6fXdWgLQI2KNZl3BPBQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21047996"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="21047996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 01:26:54 -0700
X-CSE-ConnectionGUID: JMYEurVtQI+KeTLXMe06oA==
X-CSE-MsgGUID: m7HRSYvjSGqBU2dq99XsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="57469723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 01:26:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:26:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:26:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 01:26:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 01:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0vZ2SgRITcbO8toDleiD9SzB9fJGw4rdyb6KnCwcXxn//IHEMLGoEwpL8hpXKdkpnzjxruByy00Jdcc+TjDY/j5oeUMLeHwiDAzdO5DmYqjZPk5rOgO2cowkPo0xGXDMugQFHvqW5/aFFI8xMzireEpgpJxI/Ju1pDN8CsUWZ0K0/BvzAxWq2ZE2O+DlBiJL4mMx09ns3KolMqbJlM5pStdYUKsOaUjMwTrYNfW1rBypCTRBmCvcnL/oPTCw5kKtZeKoAiRSmM5ryz0Zg7ELYnMW+K2C/l+C4tRR3IK5T+TcX5dnpnikuUc7J/pKt699+G0cJVISpaKc8NF+us8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhhlFcBddRyp6KqaUCgiaOK7sG2UnZs6mz7A8NIk6d4=;
 b=ObKupHUzX4eOidmC3lSjmxc9z6TdB6oVGT+JuIligqEajahjKB/GWi/VrxH73zY14BY7Xq2dF4HLxN7zSlqzKbPYKZnow4922UKmUYz9B/siGgJfNcC80uSiT248UCb227fC+l4fis5CnaApMXl5RM4AmZb3iQb94ddWNlSIexlhFrYv4dcHzhMOdXO3dwba085CaH6Ko2CGQRGsYC1RGArKwciPkqXTdixygUgTR9WI42lMMnfMpseiYvDmUO1du3PYC1EDcGau0R0m457AAmIk+pG+Y9PgLLDt28EuIBmSaRLl4lVgloZzGDvsW8qqDWp9faOMz2qZ6T7QoPBY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 08:26:50 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 08:26:50 +0000
Message-ID: <e80c76f4-c405-4595-9086-df0c65279ed4@intel.com>
Date: Wed, 7 Aug 2024 10:26:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
 <20240806194510.13044-2-nirmoy.das@intel.com>
 <SJ1PR11MB6204957D8FAC83421E7F3FD481B82@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <SJ1PR11MB6204957D8FAC83421E7F3FD481B82@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA0PR11MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc22b9f-325f-4989-c367-08dcb6baaf82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU85emNCeUhtbDJHSHdVUWVzSlpxcG15ZGR3bFBWd1cxZEVzQWs5L2NGUmVT?=
 =?utf-8?B?cnUwMXBmUkh4K2tLZUdNMFJrU0hKdmVQOXRTaEQ2V1hKL2xNRnMyMEY5NU9H?=
 =?utf-8?B?R3h0VFZCb0IvcTl0bzI5VSt3S1lzQU9qNk4zNHREOVZJT2c4cjI3d1Vsdzlo?=
 =?utf-8?B?eW9iTVErZmEzZHNJbFowaFB2eHlaSzNGdld3N2szbi9LVTZETGpneXFZQ1RF?=
 =?utf-8?B?L3BPMnZ6a1BKcHJNZzF6R1U3QzBTUkZGaTkvbFE0ZWdYUVdzcGlRUXdEaHBa?=
 =?utf-8?B?YkoyMk5kL1NDUTV5cVA3M2FLRzJOeDh2ZkYzbE02dGxNUGQ0WFR5amlNRlhW?=
 =?utf-8?B?V1F0VERFRTE3a01aRlBrREtpeGQrSnBKKzJlS09LYW9OcVo5MGkvcEFBZ2E1?=
 =?utf-8?B?b2MzdVdZcGViUzNvWnpMbjZRK2ZJeEJmRHBhR2wyUUVKUXFCcVdBczJma28v?=
 =?utf-8?B?ZHlhbTRPa210MjNDTHJjZ2R1NFJnTHF4MEJCUklkYzNiVjVhWlBaUHdvaEVW?=
 =?utf-8?B?UTRQQU81YlBWeWFneWQ5bXpSSmhDSkFUSjRJd1k5NFgxbEtpcGFRcy9lZDVi?=
 =?utf-8?B?UkJpVUZsMm5iVWVydXFqSWdJbzF6LzNWM1NkVkx2dXNtdVFaemFBNFVOMTU5?=
 =?utf-8?B?a2wvVFdjbWlNeWVqQUxnajZ5NXNJNkliSmV2cVFRL05BSEV3T2N0MU9Gc1ZY?=
 =?utf-8?B?UDh4N2VTWG5ZL2lIU3R1VDh4RDJzVGlLcEhMSkVOdml2eTkvc2s4V2VUa011?=
 =?utf-8?B?UW50NUZBYk5zZ3pWMVFtZG5SUjcwUmRiR2tMUGs0ekk3bk9QN2FLY05wU2sy?=
 =?utf-8?B?YlkxbnJiTHpaT1o3Rkk5YStLTE40c1RkbDR6eDQyL3pzS0tsRnJCQi9xWXE0?=
 =?utf-8?B?Rm1KaEg1NGhjU0xTWCs2ejJlZkdIYjdPU014WXhEUXRxa0ZvNjZFLzFhc05I?=
 =?utf-8?B?alFGUHAzMHVZTktjb1ptQmN1djA2a0srTlhRcGRyRnd4MkpMZFhyVWtUa3Bm?=
 =?utf-8?B?OFpubmI4NmxXWDQzMG94OGM3ZGxqZ0JLTXVkTXJKd3dKanBRZDQ2dTM1NUtF?=
 =?utf-8?B?RVNEdWR5Mmc1NnZMdW45a2w2ZW9oeFJsMiszM2NSR2U3NmRrd1dUSzJ4VmtQ?=
 =?utf-8?B?aWpUdzVnNFphbHM2SXNQRzZweTRPdVJQRWVkdkhUMzJCT2J3dGxBQWh5KzUr?=
 =?utf-8?B?N203dTgvUCtqVkc0amdQVmt6bFpLbmN6SXEvb0MvUDdBSVd2SnptNjRwU21z?=
 =?utf-8?B?TGJlUW1ISllIaWt4R3J6TExVd2dnL2RYSHRMb01YTHM2aVhabTV1Q2QyZ1g4?=
 =?utf-8?B?REZZTWs0bnZYeDFaek0vNVVoVkxvR1B2WlRqbHl4MndqWHlTUVNyR1Z2RVFU?=
 =?utf-8?B?eURUT0U0eFpya3owTCtBdUdrZnZlVWhaK0tjbFVGaStoN24yUmlNU05NUDNI?=
 =?utf-8?B?K3JuTG5oMnIzNERMTXJ0cG5kSVZ6cURlTjk1bGlSWDhjRE9qcHpuQUpVUWtW?=
 =?utf-8?B?Ky9pN1VnMWZkN1Z0WTV6ZGxROCtuU24rUnowblpCVzBmZ1ZwcXlacW5rR0pK?=
 =?utf-8?B?dkhCYUMwUTRwT091alJGK0dFSnBDREhVVjM1YWc2VXRGQVVHSUlwenJ4alhI?=
 =?utf-8?B?ZW1kazdJNEVCQUlXYnJrS3ArY0JCc2lqYkM4UG45Mk81K0NtZFFmaktRWkND?=
 =?utf-8?B?dWxmVmt5QWtyMExKeGVEbTZWNmhyRSsxRVJIQU9KbXVkMkFEbTlpK2Yyb3ZJ?=
 =?utf-8?B?TzZ3dU5sTk9icVYvU2svQVM4SkorMHE3SGpCdUt1My9tcVloWW0rNjJOLzQ1?=
 =?utf-8?B?Yy9jVStQa3BYSHl4VThxdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVRhMExGWitZdGo1WUgxVFFLSUdidHJDenpNdGlBc2RiMlVuZGhIOUoyeEwy?=
 =?utf-8?B?Z1licG9ORldUSjF0bnYxbEt4RmF4Q3NaNUFMbGl4UTF6b1NUUVpUWHBKb211?=
 =?utf-8?B?S0tld0pCUDNMeFZ0UUtZMjA1STBCcHRJNjNnUnpaWVJZRnJSQTUxd2RjaHdT?=
 =?utf-8?B?STh4VmRTUGxuZ3pUeWQwdlV5QVdNQ0dWZ2R6UU5XcG1oOUc3bGtvSWtvelJk?=
 =?utf-8?B?Mll6MUpFd1hoUTJsVjlyd3VqSFdGdWhVWmZDSWRaS25IYXpaeTBOQ1ZicnVk?=
 =?utf-8?B?U2grdDg2enJzK0gxb2tuTWJENEJjbVc4Zzk1bzdrNzEyNkp4Z2w5U3RLS0g0?=
 =?utf-8?B?VVArZE5yVXNVcGN2SHVKWFZKNzkrd1ljbHNEa2hiT0FkZTRmdm5Wckt4YjJo?=
 =?utf-8?B?Nk0rRjNLekd4VEFUbmdNdFBSVFQ4QWdrRzR0Z0NSajdUejdsYVgwZStVOU0x?=
 =?utf-8?B?cnk0TWVYMjRHcEpLdE9xbm96bjVKbjBTNUVGa3JtN0FidWpueGVpd1pieGV0?=
 =?utf-8?B?TG1KcVZZQzJUcVo1VGFMWlovMVR0N0xXclVYaHRkRlFSdFg5eWJBVTM2NUZj?=
 =?utf-8?B?QWRReDhrak9jWUUwSTZvZjk5Wlc4NmZUL2RETkFZK29aTTFmbVBWcHE5STdm?=
 =?utf-8?B?VTJnTUJEOGcvajVLQlZVak5yZnVGUEczTktwcmYvVExWZkluREplb1M0VTBy?=
 =?utf-8?B?TFVRdmtRWlFpVkNtV1V5eGV4NUttR2REelVpVzJYMkQzczlBQ2pYYm5LODVn?=
 =?utf-8?B?RjVrVWFQb20zL2xHWG9USlpqWTB2NVVzMGFzRHREUk1lL2J3Vmh2YkswL2JY?=
 =?utf-8?B?KzR0OGNCSUk5NXVMbjNEWU5iY0VMUk9WS2JqbkVUU3d3WXQxUlBaOVFmeG1Y?=
 =?utf-8?B?VmR1ZnhCc0x5NnRHTFZtaTZyMTY2RW1ERUVHSHpVd3FUV0drYVMxV2RNQVoy?=
 =?utf-8?B?V1U5RU5NS2YrSm9CcHp2WXFIYWhzd0NzeUFYYzM2UmV2TkRyNW8wWlJRYTNk?=
 =?utf-8?B?TWVTU1A4bGlXTUgxVmV0WkJ2VExqZUdnTFlTUnd5Nk5aOGJkSzZmM1IxaDhZ?=
 =?utf-8?B?eEhBYVoya0JxRHBza2g3T3JSays1SVpDdUFTOXFFSC9lZ1hhWGZYUUJpbmQx?=
 =?utf-8?B?UHE2b3NpdmkwZUNNdWpGblY2aDRnL0dsc21yL2hSeHpRUGNtN1U4THM2MXRU?=
 =?utf-8?B?NnE2OGZyM3poQzdkUXE0Tis0N1lVWDFGdDcyZnJmTnNhc2p3NEJ1eUZwSjVi?=
 =?utf-8?B?Y0tsWDBrNzFOQ2t2ZTkvT1ZQMldSM3NNcDQ1SWl6dnFqSVVncEZ4SWJHbExh?=
 =?utf-8?B?cWkzWC9CUThYTlhQZlBORXVsNmtEdWkvd2N1NTRaT0g3T0hSMWNBZkpDR05o?=
 =?utf-8?B?ZFE0cGNZaU85bWw0bDNsQkFQczM3bWVsNjNnYWEyNjN2b3YyWmFPZ3NrbFNJ?=
 =?utf-8?B?OGFsTUxFY0FiWEEwRkdwcGtYTTNVaEkwclNYOW4zcnFCdmphdjVEakNkaHFu?=
 =?utf-8?B?S29kV3ZqcHRQOHZuWG1iK29QQ0k5ZXJlWkZkRTd0aHVnVDIwUnk4Nkc1R05V?=
 =?utf-8?B?QzVsYWtTYU5JSVkwOWlvTmQ4eUxMVWQ3VlRoWTBrV2I5VGRIc05sOXNIcnlV?=
 =?utf-8?B?emR0eG02TXVnMlhRYjdrWG5aRHdRWnBnTjVCMWl1cFF1ZWdwTXQ5Um5Gcy9h?=
 =?utf-8?B?L3BPekhMMUdQdnQ1bW5OeEUzVU9pb2gvblBvS05CblhGemJDZ1JFS3BZeXN5?=
 =?utf-8?B?bnBwazFXMnlLdmRQc21SdDR1dUpwK2ZXMEs5RE11eDdQVHJFR3hTSm05YS9J?=
 =?utf-8?B?dnE4eTVXVnFwNmR6TVp3T1dENDh5UVpjbitsQ1JCZVdLNWxhdzdQMG04U05j?=
 =?utf-8?B?aGxENStIUW5zQnpSVkV3dkduQnJnc3JSbUhyOTliZzhlMXVqOW5RVmdZVk1x?=
 =?utf-8?B?UVR6Vk4vTkV2Ukk3ZWNNTTFlcWdsRmRzcWE1R01xQkJhOU1kVXlpTFVEbnlu?=
 =?utf-8?B?Z045ZlNTS1dRNzZVK0c3TmNZTDdOOGNYck9wRjRyRnBVSGFXRG9BNzZncSt1?=
 =?utf-8?B?dGV1dy9yek5kdHI2aXNRODIzZEtyYzR6YkxkcU9IT3FDMGt3OEJ2TmhRYklz?=
 =?utf-8?Q?JqfgZQz0/8nURCuzsB0/+XJXq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc22b9f-325f-4989-c367-08dcb6baaf82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 08:26:50.6676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qc+PPWZB2jR0J83k/GubCEzkTyFZc5v+KSviVO9ssVdD95rV9NHa+w0PUJSzHF5mZMe7BwvOqjyfpyyfPAfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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


On 8/7/2024 7:47 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirmoy
>> Das
>> Sent: Wednesday, August 7, 2024 1:15 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>
>> Subject: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
>>
>> Add stats for tlb invalidadtion count which can be viewed with per GT stat
>> debugfs file.
>>
>> Example output:
>> cat /sys/kernel/debug/dri/0/gt0/stats
>> tlb_inval_count: 22
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_stats.c            | 1 +
>>   drivers/gpu/drm/xe/xe_gt_stats.h            | 1 +
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>>   3 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
>> b/drivers/gpu/drm/xe/xe_gt_stats.c
>> index cc69d748e8f6..adb5a9aa6bd3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> @@ -15,6 +15,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, enum
>> xe_gt_counter_stats id, int incr)  }
>>
>>   static const char *const stat_description[] = {
>> +	"tlb_inval_count",
>>   };
>>
>>   int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p) diff --git
>> a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>> index e83155ab1fdb..11b8ed17f9d9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> @@ -12,6 +12,7 @@ struct xe_gt;
>>   //struct drm_printer;
>>
>>   enum xe_gt_counter_stats {
>> +	XE_GT_COUNTER_TLB_INVAL,
>>   	XE_GT_COUNTER_STATS_NUM,
>>   };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 87cb76a8718c..e3cdb0e041af 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_trace.h"
>> +#include "xe_gt_stats.h"
> nit: include alphabetical order
>
>>   #include "regs/xe_guc_regs.h"
>>
>>   #define FENCE_STACK_BIT		DMA_FENCE_FLAG_USER_BITS
>> @@ -213,6 +214,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   			gt->tlb_invalidation.seqno = 1;
>>   	}
>>   	mutex_unlock(&guc->ct.lock);
>> +	xe_gt_stats_incr(gt, XE_GT_COUNTER_TLB_INVAL, 1);
> Apart from above nit, LGTM :
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>


Thanks, will fix the ordering in the next version.


Nirmoy

>
>>   	return ret;
>>   }
>> --
>> 2.42.0
