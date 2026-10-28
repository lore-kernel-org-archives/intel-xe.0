Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE14606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIn0lYJN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F28710E0D7;
	Wed, 28 Oct 2026 17:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92110E0D7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793207467; x=1824743467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=WHBwEU7Km8UR+fYrOem8t56aKz31juOUO0FzCVLQz7Q=;
 b=kIn0lYJN4yG5dz6FXBpVs79CHmacDyzSqvb/2tD0x2K0lbL9G+g7C1GU
 szQyKu0Ncgy7jbfNJuPYGRkGGpLyONHE0+lfANso+zvu9x824j3/bbjFk
 mvhWevtEWzDLI46orHowejXqfo5AMOIecCrmhJqAad0hAY/Gg//AKtK98
 XvW5dlsnccE3K1yRqD8/17nzmu4+1kZxbIGPybEsIpARqAIB1QqRjMlys
 eqdw4rygzHisy+LwPhNZRJXBWCcXEmSngozDI0WAvEjCyUgc8Lo4NXAFz
 0JohRdBB8jwebFPFiNQfzmgkpz0ApSlwTBDDxifVt/cYjqN2NqWwgk7yc A==;
X-CSE-ConnectionGUID: KY+nIESOTkWYnGRmEX1sKQ==
X-CSE-MsgGUID: yoztqX5GQqaf8OkQN93hNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1828831"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,217";a="1828831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:11:07 -0700
X-CSE-ConnectionGUID: 2bPfoi2GTW66RW1+4MP+HQ==
X-CSE-MsgGUID: dwP5TfpBReGBs3QC26J7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,217";a="5002790"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:11:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 10:11:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 10:11:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 10:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1bHE+vfvCaq6rLmXMZDeCmc10vLEVnTY4Y+a1Men+ChATY7TNCj26jUqQpDvEHn5MSFFi8MnNpiBczgv3oUxywCOr3Ia2Fl62PC6m9xZkeoQ2niEDJ0Rvn29GK0X5cBQWlathPqwwzMNG8dyLJGBTMVD7YycnxDVyHQpIVRQb9wcQjyyU2aRpr6DKxbLEmUihl/z85CCkz+yb0SKh7gt84F3ej9+YgKS+d3mS6iaaORlT3CpS7yAaRPuy+zKtHdPmijscYI2h2uY5BhSKAoOSIisruSMxOOabwv24zLYo+7KYv0A1iEMgBemvYPyHsHM07kxgFXOeC1bHJsoO1ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPHT4IsNfdz89WH8xffOzvfuB0r9VlhC08RCaL4iscQ=;
 b=d+Oiuw6Cal18V2da+iAK+vfyNtEfCSysBIB0W8uwZqo4LRAMgrQoZ2iW80UC3JuNjJe7PkS0m9zXSfiALW7mTZI0avtzivnDTP/TGYSpefnnWVuPFfqPv9M+aWodr2racnMVFTbMA/Yc+fauzFSSNX1/oH8VvlIVR9573GqdTgN01QHJR4FRB8gz7Xx8oLfrl/OB5NX2GYzfNyJ6dWueMnoq80+DTrOk5JJxMW5gJzp1y7wHWbnPr3xRUQLsTk27VqhPrvtYwkteI7YdaTpPAQA1r4QN8QtUdc+OwnA13o4yKgluKiwiH9XwniJTS1fjTPF3QGPnW7E5w7IOWaQWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:11:02 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 17:11:02 +0000
Content-Type: multipart/alternative;
 boundary="------------7z4RKPsNOzRMqT8gbhZ1tHjL"
Message-ID: <e7671d5a-5656-4ce9-9128-d36c31a68697@intel.com>
Date: Wed, 28 Oct 2026 22:40:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich
 <dakr@kernel.org>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1> <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <at-XhFGST5C3lFTu@ashevche-desk.local>
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 474e4ab4-fe3a-4709-a387-08df351671a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|13003099007|8096899003|56012099006|4143699003|11063799006|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261021123027099003|10067099003|261022105027099003|261022075727099003|261009223327099003|261009221227099003|261009220027099003|261009221727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: OcH92So1loHsNU605D3HCyqGfCquSDnSyP+nt5FCApzixzv/Kpc60lBmlHK7LBGfW94z8f10Ttt19SUQKDiYxcMZwTjpEBt6pFcalGqkydBed+2gHhSjEIPt3FP4YAsTL7YOTO+XCxt8iojGrQKcVg/AD6mwtY2gFG+8zrrOiqFH6+lpL+q8pXfyPFQkjU9cizEmbsAaVEKMqdHIheGfPTEZTLuzbx2/sZkurdkiFTAy0jdNJHKL7LEs7dKB0CPRa8I4+IBrQh2O+KGKlTS5epf0FYFSOkfV6V6EKLQedVPirn/LjK+E/ng5Swd5qBPsLoEs/Nki0/ik+WCPKJgkAiX1KZ/9fnkXIcqz6t51rrrlTOI5BLNXg+6dn+vo34Gj6OT3PBJ3bjDecrjuFAQt8Ks3PeqA6iUkVHVNkNnnBIIrfdm+ZWHhJK++2cd/eLt4RxKA+gBYp9Cc6r7nxMGMpDOwhrj/FDPTavHcILwKjcqTDupabyXDIPD0gQE6hYlMPCV3kPUv3cHeVv/w2x625kkeYlLy2AcUKGmrMFiNWU68hn1k8aC20akYaVtCPrcfOp+dHl6DkEIVqmnPl7IQ+OLkKHmwr+O6dut9j6Vhai+DYDrpLxm/eJHI1f0H92Q3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(13003099007)(8096899003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261021123027099003)(10067099003)(261022105027099003)(261022075727099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGtsTzlSSVVPa0s5N0ZmOXo0VldrSzFGQkVEQUsrU0V6a1lvZWd4Zm8xZFo0?=
 =?utf-8?B?ZU1EeDNLSjZxdHpzK0VRbHFza1dPMnRTZzlOanlrYkRud1BYMFlWTzkxaGND?=
 =?utf-8?B?NXB6andVYmhwM2VXb1RMODhUNFBIODBWaTA1Ujk2TWFlWnJ2clFJZGNRM2Zu?=
 =?utf-8?B?eVdzK2ZwMTRzbWV4MG9JS083a2RaeXc4Y2dXRlNhd25hTXNqTzZJVE5rVWx1?=
 =?utf-8?B?dGFuL1IvMDZHdmRvM1lZcXNaVUx3YlpZZ2tTNWdKVlBYNkcyRTMvS0tuYWlE?=
 =?utf-8?B?T1hMbWFXdkc1aGwwbWRtSkJkdm94L3ZXT2VZMkI2R1NNU2Z5L0NITEg4ZWhY?=
 =?utf-8?B?bWxndEtGV3JFUHhGMDhsT0t4ZHh3VDVqb1JucFFmcnYrSmc0UWFWSnRvc2Nh?=
 =?utf-8?B?bWZuVGU0NTNRMDN6dW9aVlcvbE0zRlY5VHF1NWF6SFVkcU1Qa01ZSmRkb0xv?=
 =?utf-8?B?R3dkcXpqTGgzKzMyTGQwRjIxOFBETEh0YUozUzQ1Z0FzbEVqVHNRQ05hOHVq?=
 =?utf-8?B?cUdOUmM5Ym9LZG9FSEF3dGpIYnp3cTk5VGk1OEFwSFFSMjMxM3lLZXc3dWYv?=
 =?utf-8?B?bllqRTRPNDYxblFFU1JXM2FkUTA3MGNXQ3g1azhFSUppRGg2ZHpLN2U2U3lp?=
 =?utf-8?B?RTFzNkJpK1RFRi90UGNRT1N0dGhFWVJUYkJucFhMUUwrNTFGZ2F0R3Q1UGs5?=
 =?utf-8?B?Z2pYcDhKWC9CSnFqYnYzZ3NFMEtHazJwU2s0UHZ5dG5PUkRrclljMUlHSjJ1?=
 =?utf-8?B?Ym5KNmREb0JNTXltaVhjWFNmU1ZJVllXb01ZU0dMOUVVOTk1S2t1TGlMLy9O?=
 =?utf-8?B?WW5QaUdrcGpwTUVrTDgwaVlyWTd3dEU3Vm94UWd2dzRLb2xQMUxkcTZwWWNi?=
 =?utf-8?B?UjJOZFlxckJ5VS9sZFJJbmphekhKNzRrRFVLVmpmRUVza1FkWWZxaVdHYlNV?=
 =?utf-8?B?Q1MxV1c0T2VzWkYrTnlGdGZEWUV3Mk5YQnc2SURkV0VISWFJRmdiN3BqaXNI?=
 =?utf-8?B?S3ZhdWhobk9XSGlnOTZHY1F4VmE3Z0EvL1NtOVJtaEgrZEVrSVFpMXB5NTZM?=
 =?utf-8?B?QjBzWVhvRFN6NHNWenpFeU51MlVXZXIyT2E2YVRMbXJKZTNxTWRjM3ByaE9p?=
 =?utf-8?B?L0FIVjVObXI5ZEdtdnBFR2RjZzFrOWF5M3Iydkt1cmNOcWdEQnViNDJQcURZ?=
 =?utf-8?B?T1RSWi81cEYySnd5SEtILzduNkJnMWh2R1JqbUlEaDdwamRtaE93TnlSbE1U?=
 =?utf-8?B?eHhZNkRFY25aaG5ad3NScC8wMWpETHVSMkFObnBMU3hueHdEVHVHcTdUQXF5?=
 =?utf-8?B?VXppeGpDL1RxUkJoazY0SExIUE5UZkNUdG1SZ2l1MWRiSllRWndhYUphZitl?=
 =?utf-8?B?VWcxT3VrNm5PdWRqb3FGZ2tzMjV0bkpTSHdkdy84MGdlbjJyRVdWdElGR3Br?=
 =?utf-8?B?M2dKcDZseFhWUXJzWFpoQ3pYcEUzd01NYzMzeFVpeUQrNFNUQ2VUV0J6SFFG?=
 =?utf-8?B?akt4ZUFLZExyTFFVNjViTUx4b2tLQWhoMEI5cmtRclk2SGlnZ3BFeHVUV3BW?=
 =?utf-8?B?aXozdGR5OFptYlRWc3p6L0JFN25KRXNrVXhRamJQcnNJdnZHMkRrZmFydnhq?=
 =?utf-8?B?b0hPcEdzZ3N6UmRUL0psSUxaeGdmNHRUMFI0SFpvaUdrOTc1M3hhOFYxQnZ4?=
 =?utf-8?B?bUxTMitUUk9hSnd3UDhpYXhaMGR5cm9SWUlaRXF6blNXSmpLS0R3elREQkFD?=
 =?utf-8?B?NDc3WElJdi9wbHZ6dE8xY0RjRE9sdzBmSjV2M0ZqM05pVElqZkxtMmNSenV2?=
 =?utf-8?B?VXA4RzlaN1lCayttMTJONm0wcnpIZE1TYnhwbWg2STZLU2pNTmFRMCtqMDFH?=
 =?utf-8?B?OWtidnJSZzNEWm5ud3BRd1FXd0pUaTk5bVhnY2lyNnVOR1BTWUYrRlpCTHVF?=
 =?utf-8?B?dlkzOVlUZWJkLzRoOTVnMFpoNzl6SE5KVlhSWjJPVldSeDNQOWkrOWFxOFZN?=
 =?utf-8?B?dUpDVHE3aFpkeUdzUFJlZlUxZVhZQTBSa09HMGVHSWZCUmIxV05Dc2sxMGFm?=
 =?utf-8?B?dmpLRGZqTmt6K0h3YWNlcXpydXFFNzhJR1Z0TVBFRmlLUDZ4SElhM1JJZndm?=
 =?utf-8?B?YWJ3dnJGOVFaUmUyMGdiZ2NnNGhGMGRMMDFNZ0pyaDV0a01DWlR2N0wrc3p1?=
 =?utf-8?B?bXZqUUltc1Z3eVpsdDZyVElFd0ZMSmIrcWtzWmdaWXFjb0lEUHRVN2prT2pP?=
 =?utf-8?B?ZzdrdDJGSk1ZeWY2c2lkbitCNzdkWjdRVDFUWUpwbkh1eTJlbnJybzhjOTZu?=
 =?utf-8?B?YUNubEx6dXZwMU0yUDZKTi93N2tUNitkUlhpRmNvbzVqdUJpNWJIdz09?=
X-Exchange-RoutingPolicyChecked: q4d82PINW9KbFRXYfHX02+9R4lgVcoLHbtBAs2CsW3fs2fkvzqq11afCRyeU7pfty5hf9KN5eGUwdSVm79GyM687XEntSEjTg/T0Mu2ZR2tROvVtM79ph7wI2i+LarAlKj34JN+cBlgUvCJr2jxd/g0Ve7GZqiJnWusuaS+lGpKosRbLXkUkhWG2NgKF9WYQ44iCJdVDlHWvt3uBUokrCYkCwuIu6bFNKBeQrK9iJs7ch1fcfhAfmHyq7YknYmRcp09Yklkl8YOcJmy30pX4bP444yYu+O0FTNqXzakPAzyoLQrWnyzychpr2fovKzTZKkCPdTRqzau7Iq70hjYJBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 474e4ab4-fe3a-4709-a387-08df351671a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:11:02.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTU8ZTdhHp7WHMG8BEButrEZn9lNr3PHafsw2oWbVvSTiL5lg9j2PncouTOEc1VeFstgKNPDj/UXL/G4NHgoGM7akZ/kpCRsNSPc+CwIzlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------7z4RKPsNOzRMqT8gbhZ1tHjL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,

On 10/26/2026 11:40 PM, Andy Shevchenko wrote:
> On Mon, Oct 26, 2026 at 12:56:39PM +0100, Heikki Krogerus wrote:
>> +Andy
>>
>> On Mon, Oct 12, 2026 at 06:46:47PM +0530, Vivekanandan, Balasubramani wrote:
>>> On 12.10.2026 17:16, Kumar G, Naresh wrote:
>>>> I was investigating this issue earlier in sometime and found the root cause
>>>> in software _node_notify_remove().
>>>>
>>>> It is a kind of ownership bug in driver/base/swnode.c
>>>> sofware_node_notify_remove(). when a manged swnode is mirrored onto a
>>>>
>>>> second device(which is exactly what i2c-core does for the adapter's own
>>>> struct device), the old code does an extra
>>>> set_secondary_fwnode()/swnode_put()
>>>>
>>>> for every device that tears down, not just the true owner. this is a
>>>> double-release/UAF risk. The following fix solves the issue without changing
>>>> i2c adapter registration flow.
>>>>
>>>> The following code patch is suggested/provided to @heikki: waiting for his
>>>> inputs on the same.
>>>>
>>>> Fixes: 151f6ff78cdf ("software node: Provide replacement for device_add_properties()")
>>>> Assisted-by: GitHub_Copilot:claude-sonnet-5
>>>> Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
>>>> ---
>>>>   drivers/base/swnode.c | 18 +++++++++++++++---
>>>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>>> index 84a77ffa3dc4..2efcf12b4c21 100644
>>>> --- a/drivers/base/swnode.c
>>>> +++ b/drivers/base/swnode.c
>>>> @@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
>>>>   void software_node_notify_remove(struct device *dev)
>>>>   {
>>>>   	struct swnode *swnode;
>>>> +	bool owns_managed_fwnode;
>>>>   	swnode = dev_to_swnode(dev);
>>>>   	if (!swnode)
>>>> @@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
>>>>   	sysfs_remove_link(&swnode->kobj, dev_name(dev));
>>>>   	sysfs_remove_link(&dev->kobj, "software_node");
>>>> +	/*
>>>> +	 * A managed node can end up mirrored onto more than one device (e.g.
>>>> +	 * a bus core copying the fwnode onto a child device, as i2c-core does
>>>> +	 * for an adapter's own struct device). Only the device that actually
>>>> +	 * owns the fwnode releases the creation reference and detaches it;
>>>> +	 * every other device only releases the reference software_node_notify()
>>>> +	 * took for it.
>>>> +	 */
>>>> +	owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;
>>>> +
>>>>   	/*
>>>>   	 * Drop the device pointer mirrored onto a secondary software node in
>>>>   	 * software_node_notify(). For a primary software node the core owns
>>>> @@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
>>>>   	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
>>>>   		swnode->fwnode.dev = NULL;
>>>> +	if (owns_managed_fwnode)
>>>> +		set_secondary_fwnode(dev, NULL);
>>>> +
>>>>   	swnode_put(swnode);
>>>> -	if (swnode->managed) {
>>>> -		set_secondary_fwnode(dev, NULL);
>>>> +	if (owns_managed_fwnode)
>>>>   		swnode_put(swnode);
>>>> -	}
>>>>   }
>>>>
>>>> Given that,
>>>>
>>>> Is this rework still needed once the core fix landed?
>>> We don't need this patch if the limitation in sharing the managed
>>> software nodes is fixed.
>> The below patch actually looks more correct to me compared to the
>> swnode patch above.
>>
>> Andy, I'm sorry to bother you with this, but can you take a look.
> Bart is in Cc and I believe he recently proposed some fixes against driver
> core, but I can't say now how relevant they are (at least all keywords sounds
> very similar).
>
> https://lore.kernel.org/lkml/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/
>
> Ca you give a try and see if it resolves your issue?

Thanks for the pointer. I tested Bart's series 
(swnode-dev-notify-balance v2) and the crash still reproduces

That series makes sure a device drops its software_node_notify() 
reference only once.
Here the problem is different: Xe creates a managed software node on its 
I2C platform device, and i2c-designware reuses the same fwnode for the 
adapter device. When the adapter is removed, it also drops the managed 
node's creation reference, so the node is freed before the platform 
device is torn down.


Needs a decision here that, do we need to go with suggested fix/change 
at swnode core? or Xe side patch where uses static software node approach?

>>>> On 10/9/2026 10:12 PM, Balasubramani Vivekanandan wrote:
>>>>> The kernel crashes when unloading the xe driver on CRI:
>>>>>
>>>>>    Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
>>>>>    RIP: 0010:platform_device_release+0x80/0x90
>>>>>    Call Trace:
>>>>>     device_release+0x44/0xa0
>>>>>     kobject_put+0x9b/0x250
>>>>>     put_device+0x13/0x30
>>>>>     platform_device_unregister+0x29/0x40
>>>>>     xe_i2c_remove+0x80/0xa0 [xe]
>>>>>     devm_action_release+0x16/0x30
>>>>>     release_nodes+0x3d/0x140
>>>>>     devres_release_all+0x96/0xd0
>>>>>
>>>>> This started after commit 0f485f88656af ("drm/xe/i2c: use
>>>>> device_create_managed_software_node()"), which attaches a managed
>>>>> software node to a platform device created with platform_device_alloc().
>>>>>
>>>>> Comment above the device_create_managed_software_node function cautions
>>>>> that the software node created by it should not be shared or reused as
>>>>> the lifetime of the node is linked to the device.
>>>>>
>>>>> But the DesignWare i2c driver which creates an adapter device as a child
>>>>> of the platform device reuses the software node as its fwnode.
>>>>> (device_set_node() in i2c_dw_probe()).
>>>>>
>>>>> During module unbind, when the adapter device is deleted, it drops the
>>>>> reference count for the software node and frees the software node.
>>>>> Later when the platform device is removed, it tries to dereference the
>>>>> software node pointer and results in use-after-free.
>>>>>
>>>>> Instead of managed software node use a static struct software_node
>>>>> passed through platform_device_info.swnode to
>>>>> platform_device_register_full().
>>>>> But we have a blocker which doesn't allow to use
>>>>> platform_device_register_full() simply.
>>>>>
>>>>> Currently the driver is using the two step alloc/add sequence while
>>>>> creating the platform device so that i2c->pdev is set before
>>>>> platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
>>>>> can run before platform_device_register_full() returns.
>>>>>
>>>>> We can fix it by removing the dependency on i2c->dev in
>>>>> xe_i2c_notifier(). It is using it to match against the right adapter.
>>>>> Instead of using the device, use its parent to match.
>>>>>
>>>>> Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
>>>>> Cc: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>
>>>>> Cc: Danilo Krummrich<dakr@kernel.org>
>>>>> Cc: Heikki Krogerus<heikki.krogerus@linux.intel.com>
>>>>> Signed-off-by: Balasubramani Vivekanandan<balasubramani.vivekanandan@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
>>>>>    1 file changed, 15 insertions(+), 30 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
>>>>> index b82caaff80d7b..c54a2375f07ef 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_i2c.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_i2c.c
>>>>> @@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
>>>>>    	{ }
>>>>>    };
>>>>> +static const struct software_node xe_i2c_adapter_node = {
>>>>> +	.properties = xe_i2c_adapter_properties,
>>>>> +};
>>>>> +
>>>>>    static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
>>>>>    {
>>>>>    	u32 *val = ep;
>>>>> @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
>>>>>    	struct device *dev = data;
>>>>>    	if (action == BUS_NOTIFY_ADD_DEVICE &&
>>>>> -	    adapter && dev->parent == &i2c->pdev->dev) {
>>>>> +	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
>>>>>    		i2c->adapter = adapter;
>>>>>    		schedule_work(&i2c->work);
>>>>>    		return NOTIFY_OK;
>>>>> @@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
>>>>>    static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>>>>>    {
>>>>>    	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
>>>>> +	struct platform_device_info info = {
>>>>> +		.parent = i2c->drm_dev,
>>>>> +		.name = adapter_name,
>>>>> +		.swnode = &xe_i2c_adapter_node,
>>>>> +	};
>>>>>    	struct platform_device *pdev;
>>>>> -	int ret;
>>>>> -	u32 id;
>>>>> -
>>>>> -	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
>>>>> -
>>>>> -	/*
>>>>> -	 * Not using platform_device_register_full() here because we don't have
>>>>> -	 * a handle to the platform_device before it returns. xe_i2c_notifier()
>>>>> -	 * uses that handle, but it may be called before
>>>>> -	 * platform_device_register_full() is done.
>>>>> -	 */
>>>>> -	pdev = platform_device_alloc(adapter_name, id);
>>>>> -	if (!pdev)
>>>>> -		return -ENOMEM;
>>>>> -	ret = device_create_managed_software_node(&pdev->dev,
>>>>> -						  xe_i2c_adapter_properties,
>>>>> -						  NULL);
>>>>> -	if (ret)
>>>>> -		goto err_pdev_put;
>>>>> +	info.id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
>>>>> -	pdev->dev.parent = i2c->drm_dev;
>>>>> -	i2c->pdev = pdev;
>>>>> +	pdev = platform_device_register_full(&info);
>>>>> +	if (IS_ERR(pdev))
>>>>> +		return PTR_ERR(pdev);
>>>>> -	ret = platform_device_add(pdev);
>>>>> -	if (ret)
>>>>> -		goto err_pdev_put;
>>>>> +	i2c->pdev = pdev;
>>>>>    	return 0;
>>>>> -
>>>>> -err_pdev_put:
>>>>> -	platform_device_put(pdev);
>>>>> -
>>>>> -	return ret;
>>>>>    }
>>>>>    static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
--------------7z4RKPsNOzRMqT8gbhZ1tHjL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Andy,</p>
    <div class="moz-cite-prefix">On 10/26/2026 11:40 PM, Andy Shevchenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:at-XhFGST5C3lFTu@ashevche-desk.local">
      <pre wrap="" class="moz-quote-pre">On Mon, Oct 26, 2026 at 12:56:39PM +0100, Heikki Krogerus wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Andy

On Mon, Oct 12, 2026 at 06:46:47PM +0530, Vivekanandan, Balasubramani wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 12.10.2026 17:16, Kumar G, Naresh wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
I was investigating this issue earlier in sometime and found the root cause
in software _node_notify_remove().

It is a kind of ownership bug in driver/base/swnode.c
sofware_node_notify_remove(). when a manged swnode is mirrored onto a

second device(which is exactly what i2c-core does for the adapter's own
struct device), the old code does an extra
set_secondary_fwnode()/swnode_put()

for every device that tears down, not just the true owner. this is a
double-release/UAF risk. The following fix solves the issue without changing
i2c adapter registration flow.

The following code patch is suggested/provided to @heikki: waiting for his
inputs on the same.

Fixes: 151f6ff78cdf (&quot;software node: Provide replacement for device_add_properties()&quot;)
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Nareshkumar Gollakoti<a class="moz-txt-link-rfc2396E" href="mailto:naresh.kumar.g@intel.com">&lt;naresh.kumar.g@intel.com&gt;</a>
---
 drivers/base/swnode.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4..2efcf12b4c21 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
 void software_node_notify_remove(struct device *dev)
 {
 	struct swnode *swnode;
+	bool owns_managed_fwnode;
 	swnode = dev_to_swnode(dev);
 	if (!swnode)
@@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
 	sysfs_remove_link(&amp;swnode-&gt;kobj, dev_name(dev));
 	sysfs_remove_link(&amp;dev-&gt;kobj, &quot;software_node&quot;);
+	/*
+	 * A managed node can end up mirrored onto more than one device (e.g.
+	 * a bus core copying the fwnode onto a child device, as i2c-core does
+	 * for an adapter's own struct device). Only the device that actually
+	 * owns the fwnode releases the creation reference and detaches it;
+	 * every other device only releases the reference software_node_notify()
+	 * took for it.
+	 */
+	owns_managed_fwnode = swnode-&gt;managed &amp;&amp; swnode-&gt;fwnode.dev == dev;
+
 	/*
 	 * Drop the device pointer mirrored onto a secondary software node in
 	 * software_node_notify(). For a primary software node the core owns
@@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &amp;swnode-&gt;fwnode) &amp;&amp; swnode-&gt;fwnode.dev == dev)
 		swnode-&gt;fwnode.dev = NULL;
+	if (owns_managed_fwnode)
+		set_secondary_fwnode(dev, NULL);
+
 	swnode_put(swnode);
-	if (swnode-&gt;managed) {
-		set_secondary_fwnode(dev, NULL);
+	if (owns_managed_fwnode)
 		swnode_put(swnode);
-	}
 }

Given that,

Is this rework still needed once the core fix landed?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
We don't need this patch if the limitation in sharing the managed
software nodes is fixed.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The below patch actually looks more correct to me compared to the
swnode patch above.

Andy, I'm sorry to bother you with this, but can you take a look.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Bart is in Cc and I believe he recently proposed some fixes against driver
core, but I can't say now how relevant they are (at least all keywords sounds
very similar).

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/">https://lore.kernel.org/lkml/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/</a>

Ca you give a try and see if it resolves your issue?</pre>
    </blockquote>
    <p>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks
      for the
      pointer. I tested Bart's series (swnode-dev-notify-balance v2) and
      the crash
      still reproduces</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">That
      series makes
      sure a device drops its software_node_notify() reference only
      once.<br>
      Here the
      problem is different: Xe creates a managed software node on its
      I2C platform
      device, and i2c-designware reuses the same fwnode for the adapter
      device. When
      the adapter is removed, it also drops the managed node's creation
      reference, so
      the node is freed before the platform device is torn down.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Needs a
      decision here that, do we need to go with suggested fix/change at
      swnode core? or Xe side patch where uses static software node
      approach?</p>
    <blockquote type="cite" cite="mid:at-XhFGST5C3lFTu@ashevche-desk.local">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 10/9/2026 10:12 PM, Balasubramani Vivekanandan wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">The kernel crashes when unloading the xe driver on CRI:

  Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
  RIP: 0010:platform_device_release+0x80/0x90
  Call Trace:
   device_release+0x44/0xa0
   kobject_put+0x9b/0x250
   put_device+0x13/0x30
   platform_device_unregister+0x29/0x40
   xe_i2c_remove+0x80/0xa0 [xe]
   devm_action_release+0x16/0x30
   release_nodes+0x3d/0x140
   devres_release_all+0x96/0xd0

This started after commit 0f485f88656af (&quot;drm/xe/i2c: use
device_create_managed_software_node()&quot;), which attaches a managed
software node to a platform device created with platform_device_alloc().

Comment above the device_create_managed_software_node function cautions
that the software node created by it should not be shared or reused as
the lifetime of the node is linked to the device.

But the DesignWare i2c driver which creates an adapter device as a child
of the platform device reuses the software node as its fwnode.
(device_set_node() in i2c_dw_probe()).

During module unbind, when the adapter device is deleted, it drops the
reference count for the software node and frees the software node.
Later when the platform device is removed, it tries to dereference the
software node pointer and results in use-after-free.

Instead of managed software node use a static struct software_node
passed through platform_device_info.swnode to
platform_device_register_full().
But we have a blocker which doesn't allow to use
platform_device_register_full() simply.

Currently the driver is using the two step alloc/add sequence while
creating the platform device so that i2c-&gt;pdev is set before
platform_device_add(), because xe_i2c_notifier() needs i2c-&gt;dev and it
can run before platform_device_register_full() returns.

We can fix it by removing the dependency on i2c-&gt;dev in
xe_i2c_notifier(). It is using it to match against the right adapter.
Instead of using the device, use its parent to match.

Fixes: 0f485f88656af (&quot;drm/xe/i2c: use device_create_managed_software_node()&quot;)
Cc: Bartosz Golaszewski<a class="moz-txt-link-rfc2396E" href="mailto:bartosz.golaszewski@oss.qualcomm.com">&lt;bartosz.golaszewski@oss.qualcomm.com&gt;</a>
Cc: Danilo Krummrich<a class="moz-txt-link-rfc2396E" href="mailto:dakr@kernel.org">&lt;dakr@kernel.org&gt;</a>
Cc: Heikki Krogerus<a class="moz-txt-link-rfc2396E" href="mailto:heikki.krogerus@linux.intel.com">&lt;heikki.krogerus@linux.intel.com&gt;</a>
Signed-off-by: Balasubramani Vivekanandan<a class="moz-txt-link-rfc2396E" href="mailto:balasubramani.vivekanandan@intel.com">&lt;balasubramani.vivekanandan@intel.com&gt;</a>
---
  drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
  1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index b82caaff80d7b..c54a2375f07ef 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
  	{ }
  };
+static const struct software_node xe_i2c_adapter_node = {
+	.properties = xe_i2c_adapter_properties,
+};
+
  static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
  {
  	u32 *val = ep;
@@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
  	struct device *dev = data;
  	if (action == BUS_NOTIFY_ADD_DEVICE &amp;&amp;
-	    adapter &amp;&amp; dev-&gt;parent == &amp;i2c-&gt;pdev-&gt;dev) {
+	    adapter &amp;&amp; dev-&gt;parent &amp;&amp; dev-&gt;parent-&gt;parent == i2c-&gt;drm_dev) {
  		i2c-&gt;adapter = adapter;
  		schedule_work(&amp;i2c-&gt;work);
  		return NOTIFY_OK;
@@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
  static int xe_i2c_register_adapter(struct xe_i2c *i2c)
  {
  	struct pci_dev *pci = to_pci_dev(i2c-&gt;drm_dev);
+	struct platform_device_info info = {
+		.parent = i2c-&gt;drm_dev,
+		.name = adapter_name,
+		.swnode = &amp;xe_i2c_adapter_node,
+	};
  	struct platform_device *pdev;
-	int ret;
-	u32 id;
-
-	id = (pci_domain_nr(pci-&gt;bus) &lt;&lt; 16) | pci_dev_id(pci);
-
-	/*
-	 * Not using platform_device_register_full() here because we don't have
-	 * a handle to the platform_device before it returns. xe_i2c_notifier()
-	 * uses that handle, but it may be called before
-	 * platform_device_register_full() is done.
-	 */
-	pdev = platform_device_alloc(adapter_name, id);
-	if (!pdev)
-		return -ENOMEM;
-	ret = device_create_managed_software_node(&amp;pdev-&gt;dev,
-						  xe_i2c_adapter_properties,
-						  NULL);
-	if (ret)
-		goto err_pdev_put;
+	info.id = (pci_domain_nr(pci-&gt;bus) &lt;&lt; 16) | pci_dev_id(pci);
-	pdev-&gt;dev.parent = i2c-&gt;drm_dev;
-	i2c-&gt;pdev = pdev;
+	pdev = platform_device_register_full(&amp;info);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
-	ret = platform_device_add(pdev);
-	if (ret)
-		goto err_pdev_put;
+	i2c-&gt;pdev = pdev;
  	return 0;
-
-err_pdev_put:
-	platform_device_put(pdev);
-
-	return ret;
  }
  static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------7z4RKPsNOzRMqT8gbhZ1tHjL--
