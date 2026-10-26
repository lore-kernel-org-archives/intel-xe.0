Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C045606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 04:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M30qEUog
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D1510E1D5;
	Mon, 26 Oct 2026 04:08:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6F10E1D5;
 Mon, 26 Oct 2026 04:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792987691; x=1824523691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tc+pFF9vnQr0N1up0GVXA3A9u0VilRjz5v5ju4ObCoE=;
 b=M30qEUogDV59O3mfHuRg5u2kzO5CekbYD82/x3zKUJj/dU/oiIA63lAH
 olZqXq74OSSuTPfn0EPEsShWF+83EuOniA8M/3DMt5LYa6/+mqhrD7hI/
 X+YTzRc9KKSlzz1q6lTamAVmYyPn5gat/X1U2ZdEJK8p9l1gG3ZptzD3n
 iAeB7j0xiHMsUe6vFCUT8zvXHPr2H9ne/aPj5Pc3Ex7O1exYHl0Q8ju5v
 5FissRV88RZMPuz1JnQd8OtBzZra9GNpQXR1tKLGaKPbE+v+EUGMHaMv0
 bS1MdCckTxZ/biCo/l5JRLCRrC7o7RZJakLXBy+L1WxtQob+9QxP/hiAA g==;
X-CSE-ConnectionGUID: IQvlWWakSwO6hX2AzoxiTA==
X-CSE-MsgGUID: v6EHpp3WQq6GbfNUwZadiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1650353"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1650353"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 21:08:11 -0700
X-CSE-ConnectionGUID: FKzE5EOrTLCF/PbJ4aQxjw==
X-CSE-MsgGUID: 2b9TzmM6Q62tWicv0bTDlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4258984"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 21:08:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 21:08:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 21:08:10 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 21:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mee3zGImcG9aBxrX+fTN5cCf8nTh0jbhromNCvc9bqhR+khg69h+pEV57FjYPvQIYtzeqXoUe2FIsRYRe0469EhpbC/TjhzOktOI0zLwebuwKnflokGqK3vnoM/YF+ocviQ+Y1hNakNHQc9CZ4QBapqIbFXUN+AO9z1hdQKNk4G8gkPBYaNuOr9NyGf6tfWEECa37vdYZGp2+/tRG1+xKwqkruVcmLQ4YjR3HyP9DrNhtEv3hxlalyUJkMoCVPDyFhuMFMKEH3rhra0x3HPP5gRJIxBR3PbKaaw7dv8x+mnZeBXZb+zoNywEMUo5hMfQXltkYaHo4m7vSH4Lv3C3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTDqKGYtUcluUDSc7+W03SDZEFvD8IYx8o41BU7yoyQ=;
 b=UyiHbcYAbKtZm4tU0pqz+T1gO5hBM4gOeXxhK4n3NMhM8zR4mJqFId2EFNWdMrAbjxTbHY9ZAXSRYPPC+R/871skfiGH95y4rfw6APj2Pe0/6oWpu3sw6EJ/Y/NrMVX1Jw9IzIJLk3mTnf2IVsglS6TC3vDSghR66c2SOdRO7YqrBdWyYsCwBD2l6UIFb831DQym9hl7jGesUNHo5662c/v2Cv8yfihK/FwAqtLaKy9US2Dr+G7QKiHxvmW0qwXw75lOUdvdnqHcskCAJe6uxCU/ecVAOUPT/CKwV5nbW82n3GP63ZycpZFQzGBq9cpdsaorTC3NDng4XlxIzVxWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by LVUPR11MB9589.namprd11.prod.outlook.com (2603:10b6:408:3a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:08:07 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 04:08:07 +0000
Message-ID: <54047513-fe84-46f0-b372-f92182ba9eb6@intel.com>
Date: Mon, 26 Oct 2026 09:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/display: avoid logging DC3CO transitions
To: Luca Coelho <luca@coelho.fi>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <imre.deak@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-5-dibin.moolakadan.subrahmanian@intel.com>
 <9eff5ff68bfbc955a5bb7be90296939428cd5ecf.camel@coelho.fi>
 <590ce042-4bee-4671-9f22-de2178c32cf3@intel.com>
 <982ce9e453f4b3055a0c76721985f5720923737c.camel@coelho.fi>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <982ce9e453f4b3055a0c76721985f5720923737c.camel@coelho.fi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|LVUPR11MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 948cc2be-49c1-4087-f7f0-08df3316bdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: o3hFwyLFTZIMYic+kiuykh87nH/M2m8Htb4/WFeBrI0TrU6/O4JrkJNA+1GNlVvIBdXC7YhO2hRyFOR8j+Cmr0B3RSuf8iQqh2q2xOTDS/uLXu+u3/ZCy6kAruic2tqnHE/2XqWdsUXQ3s1UzyeODH4Fr9tmwq5lDyKRlybzIo4TQQ+EVDmEBRwh2KW4bujqmbalGOBrd6G/kJKBlSrucJASba8vsyH/xTBJHieWuTEaB37n3mMsGkdMSXp5EBMJeR3eiq8Q52QSIl3WQr0ExQAeaAgqPCIQ6DM5VbXdqAK1W2zxJe+fCwcvZ/X3G7KLV3PoJ6/+HqnY80rMdlF2PXgVsexsGQvgeLWx7Se78MJ73oOfFuCYIzvQzFJRal6HXXHTf1bcg2SnKy9br783y4e5GXsfmGYSaZN4WBON1tZ4RBPZ4DEhgG0KPO5ZMIOrY68bk0AGsOhL70+yN2UQOfu55wa36gi+wWetsUVPEM7swATDtj3KhMDsFXhGgFUNs/RIeqaAR5EvMhfDUOKNqXMNXVA+q5On0uzVneV6QBL2nAB6pslBgw5buZ+c9W8XBa77L+IADoZuIyUG5RGIGP76CU0zkO0gO7daSDXq8fG3SrYuhnP4fyQhgP5fwkXQky10U5KOZtSHTZiTkp62HIH+i4COiVHLIsDHAJIKcrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6440.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0R2WWk2UlIxVm15KzEwUEw4b2MvN3VsQlZDcjdPcXpwR014MitsSk8vNWtY?=
 =?utf-8?B?YlRvUlFhUFZuSytTb1U4dUZQMElsVXlsNDJZdExGVXpiajZhTXM3K3c4OTgy?=
 =?utf-8?B?Q2UxZU84cnhCQlhkRnk5WStkNUVubzRTa2I1cGlhNnpQTWQ4ekNCQmFkVzVx?=
 =?utf-8?B?NkpyeHdBa3RFVDZuVk4rSzFvVnU5TE9wS3VHbHA0c1FXZ1hzSURMVVA2YnJP?=
 =?utf-8?B?algvSGtnL3dXUDdLV05pMnR4L0NGMmZ0WFRjRlVjY2VpQlpEaGdZdVZGRmNG?=
 =?utf-8?B?OG5pOGdUNGwydWZmL2NQanMyNG1oU203anVpUkZObTE0dVl3bW9yNHRXT1Ja?=
 =?utf-8?B?VHVTcDIvcXlCbGpueXhnazRBTi8yVEZOMnEyZ2R6NVpqd09JSmc4S3p6d1p0?=
 =?utf-8?B?cnNScnVxMU9PZ2V5eHdLQXg2SHRXVXFZNjFSMmFHV0RTZ3d6RTBZSnRnM1U5?=
 =?utf-8?B?Z1VMMmFKcFl6ZTZ0ZUhYMzVGYnJBeThjdmQrY3RVVEhmeElMUDNpTkpyeEhX?=
 =?utf-8?B?NzRtaU5ncnZoN09ua1IvM1E2ZGFKTE81dlV6Vk9uL05LcUY4SDhqSG5EazRn?=
 =?utf-8?B?MmFsTmdLQ3I1dW03Q0VNaXZrZVQ5aGZ3VmJYdDFCMFZOSVd2cTZ1Rkl4Y1po?=
 =?utf-8?B?UVNDajh2UThGVThhSEUrc1J2T1hGY0FRWE9MUmFKa1piLzRkVitWemJlbzhZ?=
 =?utf-8?B?M3Z2WXU3OVNsTlhGK2h4MGwzTkYyTHpNMml6TTNTNEp2YlFEWlhMK3FubVd2?=
 =?utf-8?B?elVGSkZ0aXdMbGhBQ2s0eVhNUUJwMkE5eGZoZk9YcTBXdkdQamxWcUJKNnhi?=
 =?utf-8?B?SElyRUdjSC9FbTZJeldWTnZqbHE3Q1VLQWxyVUd2NUdJMFJxSnBoZVFmTnMr?=
 =?utf-8?B?dHNVTVREcWZnR25wSzBjNU5NUHlEdGFDRVYycnVxdkVCL0xLc1VDNUtrM2t5?=
 =?utf-8?B?QW9DWUpEK2V5ZW82dHZkVHlpK0NwenhzM1VleC95LzZ5eVc5a1NRamRZalVM?=
 =?utf-8?B?bDNYTmViMFFhUjU1djZnN2s1NzJjZUtudGM4eHp0ditXWVZkanVWQnVnUDM5?=
 =?utf-8?B?Z3ZscFVLQ3NGQ1Rqa2lEVklBRHVlOGFoUEdONnBrcG5uUUVUQ3pvVFgveFV4?=
 =?utf-8?B?ZlhtKzNCQW1FOGtKNHM4eGVZYi9DSk9QcW1EdEh4VHZtd3BJZVE5VXpoN3dm?=
 =?utf-8?B?N3ZGbzBnYnpxOVlydEcyKzhCd3RWTGtxbXF3cW5ubEx5Rkx5RUY5TVd0R0Q4?=
 =?utf-8?B?dVZ0NTV5dWY1cW9HRzE1OWVqVVlWUDcySit6NjMyQVIxNmZUa0t0N1B2VStF?=
 =?utf-8?B?eXJsd2FzYkdMVnVOMEErV1pZRUlTMXlibTJPNHFFWGI5SWZzQXE2em1ha0VZ?=
 =?utf-8?B?Ky9KY2pCMWcySUlGRU5HYk55OVhqT09iZkFFWDZZak9WUGZPVWV4d1RNZloz?=
 =?utf-8?B?Vi93VkdmNEFyNUNrTlZ2S3dUMmYzdHVhWHZnQXlabUV6L0dwSzdlbmRIbWJm?=
 =?utf-8?B?QVJlK04zRnRLUDd6NUlHMFpWTGlSeDdwclhaMGJvaU8xcjJJampUVXNXQWFn?=
 =?utf-8?B?dE1Ta3Q4NGtSc2NSK1BSb3U1a2JYOWFZUUhIYXc4MUx5eG14QSswRlMvNEh4?=
 =?utf-8?B?S0lwM1dIcWFkbmNBT1VHWjRSSnVrek84U3A3eWF3SS9EaDl4aE5DRXlmbGpU?=
 =?utf-8?B?R3FSSkNMSWdUQ3B4cVZRSFNqT1hhUGtCOXhMRzRnTVVMeCswV2VJNWkwVkht?=
 =?utf-8?B?ZDM1SW5oY2VucVRKa05oODZFdDk3SzB6dit6NVkxckJMNHdPcC9MWVdVVjd0?=
 =?utf-8?B?eTVZaWw2Y2JMUnlQeXFXbUNXQXZTOTVDK1NmV0VVVWpzVnBUVUR6WTQ2YWhl?=
 =?utf-8?B?TG1vNjdBaDVJSU5sUkhLNXhQVGMzSW1JSlhHeWhVSTVaenRBT3dFU0lSZ2ZR?=
 =?utf-8?B?a2JBM2xhL3RBeWJubjRQTkpiQVlHYzdlVkpzVm1NSUlOY3VkMy93b2FSNURm?=
 =?utf-8?B?d3J0VVUrbjFid2M3UjFmb1JEbURoREVHYWYzRkgwZ05NMWE3RWF2WUxic1E5?=
 =?utf-8?B?UTNLaDNOdEZkeUY0a25vOU13QWpKZmpnNUtUYjVkMGJNczVYT2Focmc5YThv?=
 =?utf-8?B?Wmt0Z0RaTDF0TTQwZTRXT1YwY1lJRWNaK2h5aEFBSFZiVlE5NW9zSm4xdkMy?=
 =?utf-8?B?d3JNM1hFdHoyOUtvS25ObE5hZGVkdW1LQ01kVmpnV1UyTE4wQVVzQVhrSWd0?=
 =?utf-8?B?REdvNGgzYjdJVXJ3ZDBFT1hvQndZL3YyRXFSbUNOcklRdnlrd2p5TGlZa1RQ?=
 =?utf-8?B?YUNHMU5iTXZ5ckJkbDJyTnUvWjFzRWVzbnZIWUs2Z1VzU2tJa3Y3UFJZUm8v?=
 =?utf-8?Q?vCgq/t177HHejV6DXgo17F2Qf8JC3VNOEAYBCxZlsrULZ?=
X-MS-Exchange-AntiSpam-MessageData-1: 6No6+pdx5oSw/Q==
X-Exchange-RoutingPolicyChecked: c9EhcFBl7KLo/HYox6M7pWzvsJrzsjo2/27wO2Vuu3FpV21kll8HzdbMlXB+Y9ZZeqS2UxqiRUBki1wZUr0aynYxcFpDuRJ9meqGCnXGkTZF+TOOGfcJ0oUDKKFoYCRUuiEzVuTINnOjT8xtql9cu4uBzblLkAFvwwbgOjHgZiV2/mJWo+odbsRWyA9JYzQm4LjqRj/w0F5CK2vO0EDPeK/Gr8O3O6B7GSKDIpw6EFoR1ZsOXYlSMqHAipuxmGKMMEqpV/cQcrz59wUPAlyabwlC5O7GQHz1RU7rWuhoakVZol/ymnYcQb6o4euOmzskbpxseLKoEF0/E/1VKe5sUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 948cc2be-49c1-4087-f7f0-08df3316bdbb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:08:07.7005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9PJ8cC2AYn4X9DuGf8hp7ks4hAZA0JUphqc9IRXtMBtd/gs7+uY74JFfAg39hp2n4kDorOPtO4IiCCCGK7EIUEsFKGat0pGfsPu1ILjGjhxqMXoj1dXrSgaHe+SQA3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9589
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/2026 3:29 PM, Luca Coelho wrote:
> On Fri, 2026-10-16 at 18:30 +0530, Dibin Moolakadan Subrahmanian wrote:
>> On 10/16/2026 12:52 PM, Luca Coelho wrote:
>>> On Tue, 2026-10-13 at 21:41 +0530, Dibin Moolakadan Subrahmanian wrote:
>>>> DC3CO transitions can happen every frame.
>>>> Logging them floods the log and adds overhead to the flip path.
>>>>
>>>> Skip logs for transitions to or from DC3CO, while retaining logs for
>>>> other DC state changes. Log DC3CO trigger changes through
>>>> intel_display_power_dc3co_update().
>>>>
>>>> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
>>>>    .../drm/i915/display/intel_display_power_well.c    | 14 ++++++++++++--
>>>>    2 files changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
>>>> index 1b60ce2dd00c..53afd791381e 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
>>>> @@ -4,6 +4,7 @@
>>>>     */
>>>>    
>>>>    #include <linux/iopoll.h>
>>>> +#include <linux/string_choices.h>
>>>>    #include <linux/string_helpers.h>
>>>>    
>>>>    #include <drm/drm_print.h>
>>>> @@ -419,6 +420,11 @@ void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger
>>>>    		return;
>>>>    
>>>>    	mutex_lock(&dc3co->lock);
>>>> +
>>>> +	if (dc3co->trigger != trigger)
>>>> +		drm_dbg_kms(display->drm, "DC3co allowed:%s trigger %#x -> %#x\n",
>>> s/DC3co/DC3O/ for consistency.
>>>
>>>
>>>> +			    str_yes_no(trigger), dc3co->trigger, trigger);
>>>> +
>>>>    	dc3co->trigger = trigger;
>>>>    	dc3co->allowed = !!trigger;
>>>>    	mutex_unlock(&dc3co->lock);
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
>>>> index 233465a8306e..6d07643fc14f 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
>>>> @@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
>>>>    
>>>>    	val = intel_de_read(display, DC_STATE_EN);
>>>>    	mask = gen9_dc_mask(display);
>>>> -	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
>>>> -		    val & mask, state);
>>>> +
>>>> +	/*
>>>> +	 * DC3co is entered and exited once per frame while PSR2 or panel
>>> s/DC3co/DC3CO/
>>>
>>>
>>>> +	 * replay is active, so logging both transitions floods the log. The
>>>> +	 * exit additionally happens from intel_display_power_get(DC_OFF) in
>>>> +	 * the atomic commit path, before the flip has been armed, where the
>>>> +	 * printk is a measurable part of the time budget. Skip both.
>>>> +	 */
>>>> +	if ((val & mask) != DC_STATE_EN_UPTO_DC3CO &&
>>>> +	    state != DC_STATE_EN_UPTO_DC3CO)
>>>> +		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
>>>> +			    val & mask, state);
>>>>    
>>>>    	/* Check if DMC is ignoring our DC state requests */
>>>>    	if ((val & mask) != power_domains->dc_state)
>>> What about this log:
>>>
>>> void intel_power_well_enable(struct intel_display *display, struct i915_power_well *power_well)
>>> {
>>> 	drm_dbg_kms(display->drm, "enabling %s\n", intel_power_well_name(power_well));
>>>
>>>
>>> ...and the "disabling %s" one? Claude tells me that they are in the
>>> same path you're trying to silence.
>> You're right, the power-well messages will still be present.
>>
>> I kept them intentionally, as removing these generic messages would reduce visibility
>> into power-well transitions and affect debug ability beyond DC3CO.
>>
>> DC3CO-specific trigger changes are still logged through
>> `intel_display_power_dc3co_update()`.
> But does it really help to remove 1 out of 3 lines of log spamming? In
> this case it will only take 1 third less of the spamming space...

The overhead is not just about the number of log lines, but also the delay
they add to the flip path.

The "Setting DC state 03->00" message is printed before the flip is armed,
and a drm_dbg_kms() there costs on the order of 100 us or more on this setup,
delaying the arm and reducing the time available before the latch point.

The other two messages are on the DC_OFF exit path, after the flip is armed,
so they don't affect the flip timing.We will also retain visibility into the other power-well
transitions.

Would it help if I updated the commit message to explain this instead of focusing on log flooding?

>
> --
> Cheers,
> Luca.

