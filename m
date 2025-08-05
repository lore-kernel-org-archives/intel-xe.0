Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE0C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C29710E6A2;
	Tue,  5 Aug 2025 14:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBDqIZfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC17810E5B7
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754404249; x=1785940249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DAtfYdrnL2+F/cAVmkEpPdgvAcyGy4vqXnPPSseuB2w=;
 b=NBDqIZfp7SYYBQ4gKHcygYlV9GAW5TqtkRkrUFKUKwBjajfW2Zsgvg3/
 ER9Zypz7B+Ia9wgQCJG8ll70BmSJM7PcmyTKfbM+3pp7L2RTnJPfmRvrr
 ADZZvYNqTcSRVKMhfVHBNNHFcsI22xih4xJW68YLxD1Gg23gRn4Z/xxR5
 4EFnI4k4UjF6eRv5xUccrMspBRDMtnjqxBDSXU7h6mzgl7xWt7pxqoFCo
 cvS4x8fNGYmq5d/5yXTIdKryuZKFkAxS4oB+rhPwMUJ9G/LuErFEzHw3J
 ZLmwxMytS3FUtGKrQTQ3/dvkOdBoPIrSsBXimwe5Zg4o3vz8mSsNhJrdo Q==;
X-CSE-ConnectionGUID: 8aX1JH4kRwuQtuzsRbRgOg==
X-CSE-MsgGUID: cJaPC7S9RqGDppqudDnvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="66968131"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="66968131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:30:49 -0700
X-CSE-ConnectionGUID: JVg8R1CcR820XIqrhcT0JQ==
X-CSE-MsgGUID: SQGE0lYMS/ONSTWrMAOswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164518194"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:30:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:30:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 07:30:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUOpNHyUYYUoouW20JhhNKwHiX9fy4zxFdVw8IzI7EtktMnOOf3kJVi/Gy94aFIRaCERiJfXV95VTpUelqeSoEx2CTa1SqJtAN08i+pgPewDjHixIaCNcc+9cfZ2JF60fyMmNKwtwf8ygTx2o+OSXMY7o5q5QNNUTR/H+EE+XVzsFlAiKr07r/xaoD+dHTPl+nqzokRzuMlkMAFWS+FNo/Vy/48vtjgtQWCHmOyld4i4GyDaEGTm/T0Sq5ic6vdtfr5VQGo211/aBTgWQ/f5yEkA9g9QI2dwBywkbn63W8uMSFjV2oTcIC3AVepr3wTXcnXCmjV+8HhFD7uusr3ISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFyqRL4YEOUqB5/28W4lTBzSEFQjrmTJi7v6CJCOuuQ=;
 b=cFzBuJw42/3GN1JNI2CbQFotO/On+n8a13dhCtcSj1pHY2IUL1M6ZHMIaJQgpwjsbx+6QDr9kjbT0nn6gYCSAoEjVQlTnSmjEq7dEodLG0RV80MTRMfnJ3CYSI2Z02ZUbgTcj2vE1OchhH9oXmYdUzRiDJ05PJj5PqcatVzssCheN0Xvwm7KDgpOdChD0qZ5pJ6yUlT/U1QMc+UFfPVT2FRQhKnFCdsHzdilYpvsUitoTbT2moP8gWa34GqIpQZQMWvIiAY4NiWai9LExKjYRBbwPuVrLYTQlgo9t/npYsEvf3Ew52/LYEdmwOJLBtU2PJOz2mGDXkARaqb+jD1nTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 14:30:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 14:30:18 +0000
Message-ID: <c352ab94-58be-4e5c-8bf6-76444b34cff3@intel.com>
Date: Tue, 5 Aug 2025 16:30:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] drm/xe/configfs: Rename configfs_find_group()
 helper
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-7-michal.wajdeczko@intel.com>
 <auhnqzxjtfo2pnczckmzuhk5b3ydpuwyayroxsa4s6ydkg4vzk@l7fp3c7pf4b5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <auhnqzxjtfo2pnczckmzuhk5b3ydpuwyayroxsa4s6ydkg4vzk@l7fp3c7pf4b5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bee3367-f71d-4210-4717-08ddd42c99b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3lvWGR3MXV4ZVdxd3JpWUNzWEliNDNReUcxdjFxczR6eWxXUms0M2hxb09o?=
 =?utf-8?B?NW5uR0RQSzVhalFxT1VDRGF3b1c3dzlNMkFXbkVXU2xhNFNJblRDcGlJbEdW?=
 =?utf-8?B?Ym1DWHpBYVFRa3ZUUFRGcUR5a0tjUnhvU04vQkQzS29Pb0hqc1VNM0FCSjhw?=
 =?utf-8?B?aTVBMlVNL00yeVZtUS9JV1lRaGJaOEdEU1grcGdzZFBKYktFWE16eTNacmxI?=
 =?utf-8?B?eG1FSmFSSjFIWll0bjhBaDF1RGt6ejVRYW0zZEF2S1JETzJ5S0VLTlF5Nitl?=
 =?utf-8?B?WHRDRTRWMXI5RkdsL2pIZGRRRnlFV0ZoK01Tb1hCdHdvbmVtbTNDdXNOd3gx?=
 =?utf-8?B?SldqeUFLdEhSd0lEUXB4a2FsckQzZit4QXZicjFjUThRU2c3bVUxNDlqVkZt?=
 =?utf-8?B?VXBnNTJHRnBWbnBEU3p6MHNqUCswUDNoYzFsbWJKUi9Qd0E2RkNEdS81dm93?=
 =?utf-8?B?NFF4aGRDNE8zODM3TmJKZ3RmVjlGTm13N2NmTmF3blZKOFlsMk4zN0xMcndD?=
 =?utf-8?B?TlJteFgzSFMvSFJhTWJEZlJCRzhLMGt6TEVZNVlzQ1M1MENWTzdrY1NTQmFn?=
 =?utf-8?B?SDR2YzRtS0ZqamFiUWwvdzZ3d2xJeFRhaWlQbjZPKzRVNHdJdG9FWEhMQi90?=
 =?utf-8?B?cWE4bzJaUHpsbzliM2owT1N6eDlleDQzcFBpdWY0dmhVUWIyRFpYZk9HNUEx?=
 =?utf-8?B?ZXlqaDNxSHpsa29IRzBrZC9KVUxmNEgyUlNSRkJNR28zaHJLUmdxOU5rc2Rk?=
 =?utf-8?B?SlVDeFkyelFwVkV3RzFleUwxVFNyYnpvYWdraEVZdXVQZXJ1R2piOGNFeW1n?=
 =?utf-8?B?aGVYL2VyS2RMYWFsalVRNzhDMTZKRTRSaVZEcCtqSWxQRjczTXNnOWR4S1Z5?=
 =?utf-8?B?aUJSbUpYeG5qdVhnNHZaV3pyOEJEVTdYeDFlZFdQemtzbzM5L2JjbjErbEdG?=
 =?utf-8?B?OHU1RUY1SWVla3FiNTQ0a1lqMExmZTdiWjFWdHczT3NudkFkSy9XQVlDTjdv?=
 =?utf-8?B?WStBSDdnRUwrSlBzbG5qdWJuSkRneSttWlVlaVN1VmVpamlJR3kxbG1Zdmxt?=
 =?utf-8?B?L0l4OUNTbnAzaTNLQVFUY29vbldPUEhxdFU2b2dCYktZd3hFUUdpajZpeEw2?=
 =?utf-8?B?bTVFZ1hwdTNiek1zMjJYVHBSUEd4WUJXOTlKbXNPRUdKZndrczl0OEl3UVFL?=
 =?utf-8?B?TDNlUk9zbHRIdmdLdFZFelZGL3QzVmtoKzhqdHFBYUZsS1I2eXR1UmZmaDhB?=
 =?utf-8?B?WDVVNXlrcFBpZy83L2J3S2NBZ2Zia0NacnpsN2I0WEd1eTRBM0dJRTVPNU8v?=
 =?utf-8?B?KzB6MERFUHU0VU9NK1JsZkdrVDdBalJPeTYxazYxUUJPL0l6SlliNFhtZzA3?=
 =?utf-8?B?STVqcTBubUFsMkZYV0xmY0xhQmZOL3JhQTNURUluRkNNUWZ1TVc0Z05lTDVn?=
 =?utf-8?B?QzNsNmEzbCtmaUI1WkhDZ1lnNTRaMXl3dEZLNm42RDlkYVZXcVRLaW5NQXJS?=
 =?utf-8?B?WTNZczFsdTZaNDZMZ3VrWEM5VDVmdDNHekFlRXI1SXUvQkU4djM2dE4rdHdG?=
 =?utf-8?B?blZRRGdFbzIxNGZHYUQvbFcrRVNESEtCUmhSVU5SSnB6d29jRVpHRHdWNTZx?=
 =?utf-8?B?cW1mOHRKdXFpemt3a3FaalhDYkRYU0k1TG1GOW5RZWFPdXpQMXJJSExzWUZt?=
 =?utf-8?B?YUtla3Z3Y0dSWFBoTTQxaWdMWDNUV1BqMXNyNG9DMHdFLzFiU1FQU1pGUk1Y?=
 =?utf-8?B?TTZ2bEZYZ2dJejdjdXRyQ2VxTXRWUk9LY2JuWDVYTExuc1FydDM1ejFXbUZZ?=
 =?utf-8?B?Y2VTZ3JRL1NOSWVwNFFCUkNCU2tWSWF6MjJPOGlQbTk4NHZLU0ROWTdaaWRW?=
 =?utf-8?B?ZkJKYTFzOEZyczFwVE5ia1FxRFlaQjJMcEEycHRoNkxzZ2hjWkpmYW9OaDlX?=
 =?utf-8?Q?CgAmHYymtYU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWN4SlY3SDMrNStCRCs1U25PM1VXM2d6TmxwN0dmTTFWSDh5cEJQN0x1cVhu?=
 =?utf-8?B?RjZJekJJYXdsMTh3eUpFZ2pVRjhkYis5RnVPTUF6Z2NKQ3hJeDdJNzVhOUkz?=
 =?utf-8?B?R0JTQVBRVHhQaGl2USs3VDV4UWZDT21Td2xQZzlQYUhWWkVxb3pIZ294RmFF?=
 =?utf-8?B?aHEvcWMvTDdjRzhxRE42TjZ2Z25IazEwdGZMSTBTaURLQjR4NFpoWU1sTHFU?=
 =?utf-8?B?YUpzUThUYWdYK01RMXE4Q1RWNHdzNkM0K3JSTEVBVHRmSDNGTXJVcER0cmZn?=
 =?utf-8?B?L3hwRXpEdWZ1R1IvRmhNYkNLNUw5bEE5bFlWaml0M1RudCt0VzI2Q3BXNnRU?=
 =?utf-8?B?eHlSdk10Q0t4elo4NkxFZVZzY0pkS1RBa1BkaG9Md01TNVJBVXkvUlRySHpt?=
 =?utf-8?B?SlRlTk5OckVxdHlFa2NCTnFvSXlML0hidkJPUWM2WWZHUXNXb1FYR0FhNXA4?=
 =?utf-8?B?dTFOS09LRlRRN1A2Q3E5c2srM2VjS05NMmEzY1dVRGI0WGpIbERaUExOdEIy?=
 =?utf-8?B?STFsaTRpMEsxVHk3dGFKSE1iUDJUYUxVWDIvT29mdURwVVBUMllHMkcrMnpN?=
 =?utf-8?B?ZitNTVliaFd4SnEyNDhPa0NNT3FRSDFaU01DVFB5WFFyN3pMbFFLYjZhZ2U2?=
 =?utf-8?B?dm5NRllTZER4OUcyUlZRV1prTERZLzV1Q3ExRU1xY3pKYkVyaHZQMmMrekE3?=
 =?utf-8?B?NG1SRTVqT3IxUDh5ZnFIWis3aUw2VlRvVzM1QkJtWjFwamkrcDRJMTVRcitJ?=
 =?utf-8?B?M2VKTjJZZWlSSGsraWJoMjZ0NkdscDEzUFRuajVGN2ZSdUE5cW03MFlDYXFU?=
 =?utf-8?B?VVVvUjdCMUZuYTEvVzVJREN0c0NaMWlsdkF5a0o3WjFvNGErMXZzRU5GclFV?=
 =?utf-8?B?ZmZySXZ6VjVKaEVNRkg3a2NGNVpneUxYQ08xSUFFVE9lUHBzWForekwrQUNm?=
 =?utf-8?B?NFdHS0RMM0Y5amltM0Z6YzFwRGpkRmNGeWVRdjl4bklIdTFpMy9pS0Z1WCto?=
 =?utf-8?B?ajg5eHl2N0JMcFh3WlFEK0ZUZ2htWkU3NUcyRnJUejc2UG50NlJIT3dpYUdu?=
 =?utf-8?B?WnYzbklhVnhDWnpsZjRBM2RpK2RnVFVtMXVMMGM2SVpZaXNvellHOWpSYTI3?=
 =?utf-8?B?aEdMM3pMVHk2aFBJb2tVcncrTWd2ZkhCTVhwajJZdDNCMjRZNHZyNEFHV0x3?=
 =?utf-8?B?bHlYeDEyR3lBK1B2d01aS0tPMEV2STVKSG04V3ZIdU5UblBRWG91ZVJwRms3?=
 =?utf-8?B?aGlLVnFLVmFXNzZEWm5VSWFYYU12a2oxWXFpaUwxQ0MzWldYUGRlWnhESTlX?=
 =?utf-8?B?dUhwbkh0MnpuQWpoUk5zbU1FMHpsQS8ydW9HZWN1b256dGhmaVVqd0JzdnVD?=
 =?utf-8?B?eURIUVNvNGtPWmwyQ2ZZcWp1NlBERktNdWZ1Z3lpbGpFcStRSHc1Rm04NGVO?=
 =?utf-8?B?VmdtWEpsemJQMlhWR1pjdjdWbTg2ZGNONkg5ZGxaamxZbVdZdnJzY3lFRThM?=
 =?utf-8?B?bUcrZmRIQjhPQVliQk9oMmJOLzU2UFNHZXRZKytPczU0eUZ5VkNxV1dseTRp?=
 =?utf-8?B?OWFSWUFmd01Da3hHZlhtc3ZMRWtOTWVKQnZkcE1SU0tuVUhqK3ljR1o4T0hn?=
 =?utf-8?B?RmN2bngyNWJGRC83OEh4d3g0QXluZlgzaUE0bEVxUVRGZTBpbllFRmJVMEVl?=
 =?utf-8?B?VWJJblNCeENnVnlWdzFCbG44NWlwTk55TTJjVi8vTThyQ3JWMGVDeGJReWlT?=
 =?utf-8?B?REVIM0NSdHJMcmZHNHNFY1NDS2FSMmVOc2FjZ2VKc2pibURLbU45WU8weXA5?=
 =?utf-8?B?bjQxaVNzTDhCMTZUZHJydUE4R2pWWTRkYzJGNHpsSGVvRlZrQ2hGUUJPelN3?=
 =?utf-8?B?Y2Jjakg0S0dMc0Z3bkJrY1FtVmZ5dzU2Y0RLdUxsVGpNdGFrWXU3bm9RUXd0?=
 =?utf-8?B?RmtpWnZobjlwblVwNkNoSjlsbnQxMEtWWnU2YUpoWmFxbjIyc0IySlBqN1hB?=
 =?utf-8?B?VVUzQlJ2SDZ0R20xMTg4YTYrb2c3OStEM2FUWnluc3RiME0rOWk3THovSG8r?=
 =?utf-8?B?TU9qM0ZpeVh2WGhYSnhtNERQZnFNZEw4Tm1MRWNBcGdYTFpHZTg0Yy9tSGJW?=
 =?utf-8?B?S0pHc0tLL29tZW9wWUVrQ0NPYnBsRGlJS1dYTEhwQmJBTTdwRXdnd3NpR2l6?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bee3367-f71d-4210-4717-08ddd42c99b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:30:18.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esC4/JA5R1DCHCV9msvqY3uWg3atPUA+Yb7xBzy2Yrrevp+UjP4zmnZiPk6cTPTGvOcVSQOTxUHkQkVziUsAtoNlSwmuAB/s7dOyREbci/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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



On 8/5/2025 3:14 PM, Lucas De Marchi wrote:
> On Thu, Jul 31, 2025 at 09:33:34PM +0200, Michal Wajdeczko wrote:
>> This helper name shouldn't suggest that it iss a part of the core
>> configfs API family. While around switch to use different helper
>> to release a reference.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index d69b5f248e59..acdee616d118 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -309,7 +309,7 @@ static struct configfs_subsystem xe_configfs = {
>>     },
>> };
>>
>> -static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>> +static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
>> {
>>     struct config_item *item;
>>
>> @@ -334,14 +334,14 @@ static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>>  */
>> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>> {
>> -    struct xe_config_group_device *dev = configfs_find_group(pdev);
>> +    struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> 
> looking at this now, I think it would make more sense to call them,
> differently, which would affect the previous patches too:
> 
>     struct xe_config_group *grp = find_xe_config_group(pdev);
> 
> and:
> 
>     struct xe_config_group {
>         struct config_group base;
>         ...
>     };

I was assuming that one day we would like to add some config
groups that will target "tile" or "GT", unlike simple "device"
as it was introduced today, so we would have 

* xe_device <-> xe_device_config <-> xe_device_config_group
* xe_tile   <-> xe_tile_config   <-> xe_tile_config_group
* xe_gt     <-> xe_gt_config     <-> xe_gt_config_group

but I guess simplified name works too

* xe_device <-> xe_config        <-> xe_config_group

(I can rename, but no earlier than 2w from now)

> 
> but I'm ok with what you did here.
> 
> Lucas De Marchi
> 
>>     bool mode;
>>
>>     if (!dev)
>>         return false;
>>
>>     mode = dev->survivability_mode;
>> -    config_item_put(&dev->group.cg_item);
>> +    config_group_put(&dev->group);
>>
>>     return mode;
>> }
>> @@ -355,7 +355,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>>  */
>> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>> {
>> -    struct xe_config_group_device *dev = configfs_find_group(pdev);
>> +    struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>>
>>     if (!dev)
>>         return;
>> @@ -364,7 +364,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>     dev->survivability_mode = 0;
>>     mutex_unlock(&dev->lock);
>>
>> -    config_item_put(&dev->group.cg_item);
>> +    config_group_put(&dev->group);
>> }
>>
>> /**
>> @@ -378,14 +378,14 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>  */
>> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>> {
>> -    struct xe_config_group_device *dev = configfs_find_group(pdev);
>> +    struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>>     u64 engines_allowed;
>>
>>     if (!dev)
>>         return U64_MAX;
>>
>>     engines_allowed = dev->engines_allowed;
>> -    config_item_put(&dev->group.cg_item);
>> +    config_group_put(&dev->group);
>>
>>     return engines_allowed;
>> }
>> -- 
>> 2.47.1
>>

