Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411A606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ypc+ra60
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151E10E2D9;
	Mon, 26 Oct 2026 17:37:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9810E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793036264; x=1824572264;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sNmzZy0FtQZAwFzKXl2NHuSfYVBjmzz85yYnKjOViNo=;
 b=Ypc+ra60FVTLs89hN19tYTEpikdM7FYepGvOv584RGbMwG4RBObgufds
 Vz0EWgdE3mpzVz8Lz04x9/tk5hwEOE+/6UR4mTrRmQh1Ps/tRrA0q49Ql
 KgUw+F6pb8poONjEOqvfpGJmcOMsBozCO8AJAagwdtVpdjdtujcTrdGuu
 f1vWfcxm+2bAUDz2nB+8mNKBXmmviASlesvo7Xvf7IjgFcCcQGtBy6Jhk
 vcaaWluLaKUA8EnmJCExYf/8DsbEA6V3+CX6/sMugS5FuYYMmZZtMp9s3
 CNpf2uJJhINRDPowuYxId9a0uiK559DEcOyOl08J8cI7xWzY+c/09FRO0 A==;
X-CSE-ConnectionGUID: HTxHEsQKTeWYsl5yHSkBGw==
X-CSE-MsgGUID: lYzyTZaOSk+E4VPQvhJr0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1596192"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; d="scan'208,217";a="1596192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:37:43 -0700
X-CSE-ConnectionGUID: LbmU0lavSK+jdN5J14BPRg==
X-CSE-MsgGUID: AfZcczEcTcihFbWjDssftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; d="scan'208,217";a="4188065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:37:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:37:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 10:37:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAyCwFb5k83jOo9zm5M4SnGcPXZZhYJvWnz2uXHKwEzniPeuLzI9xE7DUymOFAcI08SoIDTDiZZ0ZtQx/1fWRIf2v6Ie3x8ssRhvp+yx6EcRMqOuF4F0Zx7WZBUynmh8nPiNkcmVXDUf+NZXTaNDf82kC6a5bGlZcPyoxRA9/xKsN6IJpYBgTed/Bf54wtTs9AN196r8xleK5hzAITrzyBCVOC28Pg1GJZzkqO2Sop+UVzY9ta0QURcpsbL/XS6vd4LHk4PQJf+o4/IBPyXPeAzT4wFmx9pjZIYwufsoJ+nvMoigM9VvMrhFyjdfnZRrplQ9DkWy1jhAKJmTUxR+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y174UquBCYhMHQraAEvyzse3FPKaYz+RgwWZU8hVSZc=;
 b=TACvU3KsxPnvRASjgjVLsySLxWjYG6gzRT9RnIr/leAQFHe8IacvixgUO98wyf0NBPhJQSIp+STcDFmQW8vpyGSGjdQQoTe0L1erg5u7CnOmyMo1QT3zpv8pZBhdNnRAagv3nuYAVHXelJf+UWRwjrD+gITRBZOl/uTmuKdeopQbOhMHJeETihfeWtenZB05CD5MfndkAWJ9PhmHWy35rejpChL52vEkae76JFXaUBLqGKjE7jvLsbyVlUrJIgjmvahq1nk3wNEXUpbJcDINFxJ3778qllOyN0a2e3OVu2idWI2EbQ+NpMXiLXplGi1GeHta2QiGe00fYUvhZhh3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:36:34 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:36:34 +0000
Content-Type: multipart/alternative;
 boundary="------------Y6b9AktIS0A0srpfrjGm2Ebg"
Message-ID: <ebce511f-ee26-478b-9669-66e35e5d3d83@intel.com>
Date: Mon, 26 Oct 2026 10:36:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>,
 <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
 <03767785-851a-4b84-8271-388d33d7669c@intel.com>
 <atrHUMcymdVC9T-l@black.igk.intel.com> <20261023230429.GB6078@mdroper-desk1>
 <a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com>
X-ClientProxiedBy: BYAPR21CA0025.namprd21.prod.outlook.com
 (2603:10b6:a03:114::35) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea8bf1a-505e-4a52-4018-08df3387adfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261026140227099003|8096899003|56012099006|11063799006|4143699003|10067099003|261009223027099003|261022113327099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: Of6rqsSBxlC6MpcDof+10OVhwLOHoHqJnbS1i7qjEaqUXEWBjKwm9BC8trutYyvTJtnHMVxmNzTwzCn560cFujDCgqjklpnoBQUBKPYjp4iYqSMhJIVSaiCdyhMnCf/8R/k8GbvWytXNDd/lkRVuWuwl4I0VyoLBZvbhdk2r1TnW50+44TSQufgCkfF59ndQrkJuNaADgQsWtgnRjbVOVrH+M3zXSy+iYF0Tzrm/LWPtwWpeJhzZmNe/nv/EYtW71pWzIAkfqMTndF+JYByKPefbJTtrkfLBHVxzu0f12l5kNAqiK6C8FipeiigYlIX1F3V8zQUnnT2YY+BNyOFewZbhoqxlZYfNAZmBd6OOkebXS0mgcYau1iJzOTDuxCKA9BMransYcY6KhXxKenDkzD9dwXE9peK/KBKgHDljBZxH2LZckpsNf+9NCprkVYn33ck19yXm4dOsLfV04PWt2Uwk+a1twc4mLyOMwocheXxRcjxOPJJZYN6drd+ulnnQfd+NO9f1XPJXFsqdzz4LJgXV2UktN9qSwbrIHss9b1e5XGdBQJYZgshw5QbrPzarNrvsGcrHdFlNjyfWLV1o3FklT2yTr/PHtQvRxJiWsxQHw8oK3Bzg3k1iUBbIIhfzCNnBSh2GGsN1p3qj0U+Du/p0DZKJFiXT18GbDm4+s/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261026140227099003)(8096899003)(56012099006)(11063799006)(4143699003)(10067099003)(261009223027099003)(261022113327099003)(261022105027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0JnUlVYNUZjNWRJQUdRVGJleWkxVUMyOVY2R2ZKMFk4d3ZLUnl2YmE0NjZT?=
 =?utf-8?B?VGhhWU4yMHJrWlIzd002MG1VZE1YSHp4ZEc4bzUwbjdQeUt2NCtoK05ROHN0?=
 =?utf-8?B?KzduU0ZWd2NGWGRxeU5VTEZpd0hvcEFlUTF6dkdSZnhUVktZdlg0SWxoVGtE?=
 =?utf-8?B?aWxuYzVKc0hQbWNnaFRKYmFjZUdtdGtBa0ZyNjZvRXg1UzlodjRocER6QjFr?=
 =?utf-8?B?OEZFK0YrUmlXTW5xMExwY25qdGRqNlBQUGQwRERjK3B3WCt4WlhXSkpxSkts?=
 =?utf-8?B?ZFhrb0s2T1JJNkhWd3kwcjlvUDRxb0w5RFdpTldvcjZSQUZVUGtFMHhOZE1v?=
 =?utf-8?B?S3oyQWdXZHcrS2hZbVN4Y3pOR1dDNUFOSGl6dzc2dGwzbklTRzRWZGtHZFVF?=
 =?utf-8?B?MUd2Z1hzVWhPK1NCL3VSUGc5ems3azlRQTRTVFJVcTZDRm9rWGgvNmdVTEJ2?=
 =?utf-8?B?Qi9SNFdVK0dKalR2YU52emN5dVRJZVpCam9nSTRVd1NydzdyYTN2UXMrNER2?=
 =?utf-8?B?OG5MR3VrSjl3ZHNKZ0NjWEUvL2dERGZZSlBoT0F5TEo1WG1ZSmp4WkRwNlZp?=
 =?utf-8?B?a0dLSG0wU2d1OWxsM0JWdEs1WFJtTXcxUk9xejRzdW5FWU1Idm9JQVJUcHov?=
 =?utf-8?B?cTlKenBoR3NFQkQ3bnMzeDRCVktuTit3SDJsWUhTcW5md2dpOUVvSTgyZjM3?=
 =?utf-8?B?aGIvL0lqak52UkhYWEsvQWNYRXhTS0lzcW1Wa3FFSnlTbTZCbDFjMFFZTDd1?=
 =?utf-8?B?OXpsUzJrVGxuVkJjSm5qYjliRng5Vis1YW1Uck9iaWFUZ2FYVG9JS29vQUZa?=
 =?utf-8?B?THZ1elZJbzZTcGpMRTJKMVQyK2RxQkVQN2IvV3FoR05oc2oxQ2VRQUh6eXF2?=
 =?utf-8?B?Zzk0eU5EMDk3cDZiMy9laWZkSDl2Vy9YNHlsd2pxbWtLdmttMVNReFovamxp?=
 =?utf-8?B?Qmgzc3lYbEJMZ0t4VXhOZUxpK2x1emxhRXRBb1hFc0NGaDBVQXdsbGJxSEV4?=
 =?utf-8?B?NUdqLzRCM3lwN2c0b2QxZHYraG9kTGZicldZb2hDZThiaG00OVM4OFBpMDk3?=
 =?utf-8?B?QklNNzcwcWliR09Wc0JxNkVFRkZYWnlid29xcVdsTTFWRjNYVUNkc3ZCeGZF?=
 =?utf-8?B?TEw0OEM2WDJHQmk0Y1hrR280WDFncFNOMVhsWWpwanR3WHJaWTQ4TkY3bUtS?=
 =?utf-8?B?ZjFTL2p4c0xyeXZqamFvTmw3ZEptSENYRWIzTFFJcDM2K1YzMUNTdnNkVnRU?=
 =?utf-8?B?RGNOaGJWR1hEbWMyVmR0eklzaklreGgxam13Mlk3NUZ6Ni9uN1cvM3pJZnND?=
 =?utf-8?B?ZHF2ZzI4dmZpMitzQ3ZLdjVHQW1uMjFWQ1pIMFgreHNHQ3RYZ3YvUFp4cVhp?=
 =?utf-8?B?aVlNOHdIcllnb2tuZHFzL3VCb2k3Y0E5cUxFbmEwN0tTV1A2VFFqb0I2dUVG?=
 =?utf-8?B?T1NpZDJjcDFQYmRxRFlyTTFTdldSYjlpdlV3QkgwUjNheWFSajZmeTFVejlv?=
 =?utf-8?B?S1FON1pIU1JIUGhTOTRsSEJFc09KM204aDRvcFNZQ3BHK0pCUUdkY0ZCQXdL?=
 =?utf-8?B?SS82akhwdnZvLzFOWThYc3JnVDM2MG1YZlNoVkdaUUg3QmIvREFjbXVxQXM3?=
 =?utf-8?B?dUl6aGVxVG5zb3NoUkVKZWNBRFpyYlhDR0VBdlBDdHZoRU11T1JySytOSXRE?=
 =?utf-8?B?Vkw2RWMzUVMvT0ZUdXJGa0RUUi8wcEZUaDNRNlFLTGIvVDlLaUdkUFg2b1hE?=
 =?utf-8?B?V08zb1RFcVpUZmxRSkk4TUNRTXNYSUg2amZialE2ZXBoTmc5Y1dVZjdFSG91?=
 =?utf-8?B?TXpDeitJUkE2SjVzd2FSUjd3UUZFdHJ6K2JmTEhxalR2SEdmMEE4U3kxNldy?=
 =?utf-8?B?aGdHRXB4L1FFZ2pmeDIvN3ZmYi9FaGpaOG96OEY4cEQ4MndneTVnSkxlYVVo?=
 =?utf-8?B?Y2tqOFVsZnp0RkNRMiswWEkxdVU1WWZJYnl4RHg4VDFZeXQxSmc5cmI2WUpl?=
 =?utf-8?B?cXhRMGRTa0xNaDM4a0pJMnJNOVduVHlBR3RtcVpsUmNSQkZUTlVESUE5RDFK?=
 =?utf-8?B?SXlkRFhZQnF0L0ZpVW00WERHa2s2V2dYTEVhbGwwcThYVmRSM2VsNkthWnBV?=
 =?utf-8?B?NDk2TFluQ2tsZ0pZVSs1UUJ2clp2L3QyOGo0azhUWE1qUW1ycGVzQzBCRDFl?=
 =?utf-8?B?ZU1VNGhDVnZsTTVWaTNVQU5HS3FYOEZxZEhHRlN5Y2grQUdTMUJrcTRsdFMy?=
 =?utf-8?B?OHhHKzF0aDlhSW1LdlM1UXVCeVEvWUV0SzJMb1VUWmdlbm5xY21ORjNTc3BS?=
 =?utf-8?B?MjBoMlZUZkhSTTFNdEF5alZSZi9iY3ZoWDQ0WTg3OUdiR1ZKVG1MeDg2bXlP?=
 =?utf-8?Q?1ces3WMbuk4r9sLE=3D?=
X-Exchange-RoutingPolicyChecked: wBMKNocNH1TAIxV+nfSY79u5phjk3r2w5ntwxwTkOFRcBXokUmZJYHKucPn2/9ALIDGuGjUabIUzypLXcnaCHAXHfqzhqt3TcuC5RdTrv3fa0fco1FLDfksqkxkUENXaVUbxLR2AwfI34lPdeVQKJw/bpXifbdq3z+1LNJXi05CJC1IsvFuxrWF2++G2+4E4cElX/IOOZ3rrbx27snJOsnM64EUYV7YOZW4MxCJ7z3059XYNMtex9K04JuaOAsSZfAQYibf+EPINHQvc/2+V0Us2wDKTe+l73vFITxu388T85Vrp72pG8Z9VdBpcQTYdViDh57Ss7iMDwmAPiHGNUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea8bf1a-505e-4a52-4018-08df3387adfc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:36:34.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx4pFny8RoVLM2e2Dm5Mwnh7Wc4w/YaZgBBkY+XIzvyqMXVgNpUIUQDbVs79AL00UAiq5zy2Ggiu1sq/T6NZerxVWUwBjqdT9KU2BqoOvUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
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
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------Y6b9AktIS0A0srpfrjGm2Ebg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/2026 10:21 AM, Nilawar, Badal wrote:
>
>
> On 24-10-2026 04:34, Matt Roper wrote:
>> On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
>>> On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
>>>> On 22-10-2026 19:10, Nilawar, Badal wrote:
>>>>> On 14-10-2026 16:00, Raag Jadav wrote:
>>>>>>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
>>>>>>> +	/* 0x674C  platform/8086:674c */
>>>>>>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>>>>>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>>>>>>> +	/* 0x674D  platform/8086:674d */
>>>>>>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>>>>>>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>>>>>>> +	/* 0x674E  platform/8086:674e */
>>>>>>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>>>>>>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>>>>>>> +	/* 0x674F  platform/8086:674f */
>>>>>>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>>>>>>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>>>>>>> +	/* 0x6750  platform/8086:6750 */
>>>>>>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>>>>>>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>>>>>>> +	/* 0x6751  platform/8086:6751 */
>>>>>>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>>>>>>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>>>>>>> +};
>>>>>> This is unrelated to cper and shouldn't be here. I'll rely on Matt's
>>>>>> input on how to deal with these.
>>>>> Agreed, I don't think this is the ideal place either. For now, I'll keep
>>>>> it here and, based on Matt's input, consider moving it to xe_pci.c,
>>>>> which maintains the PCI ID list for the platforms supported by Xe.
>>>>>
>>>> One reason I placed the table here is that these aren’t general-purpose
>>>> platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
>>>> platform_id field, using platform/8086:<device-id> as the name.
>>>>
>>>> Since CPER is their only consumer, keeping the mapping with the CPER code
>>>> seems reasonable to me.  I’m happy to follow Matt’s input if there’s a
>>>> preferred place for this kind of mapping.
>>> My only concern is that we usually don't have device ids lying around in
>>> random components, but that I think is upto the maintainers.
>> Yeah, I'm not familiar with these structures.  If they're CPER-specific,
>> then keeping them in the CPER file seems natural to me.
> Fine, I will keep them here only.
>> But it's also
>> true that it could be easy for these to get out of sync with our general
>> PCI ID list if PCI IDs are added/removed.
>>
>> If a new PCI ID shows up, how do we know what the values should be here?
>> Are they documented in the bspec somewhere?
>
> No these are generated as using uuidgen utility as UUIDv5.
>
> $ INTEL_NS=$(uuidgen --sha1 -n @dns -N "intel.com")
>
> uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674c"
> 9046afe5-9041-5124-8614-92550d9e9da6
>
>
>>    How do these values wind up
>> getting used?
>
> This UUID is populated in CPER record to identify the platform/SKU 
> associated with it.
>
>
>> Are there uapi / ABI implications of these values?
>
> No uapi implications. As they are part of CPER record should remain 
> stable for given platform/PCI ID.
>
> I am considering generating the platform UUID dynamically using 
> UUIDv5, with the PCI vendor/device ID as the name.
>
> This keeps the UUID deterministic for a given PCI ID and avoids 
> maintaining a separate mapping table when PCI IDs are added or removed.
>
> +/* Namespace: uuidgen --sha1 -n @dns -N "intel.com" */
> +#define INTEL_CPER_NAMESPACE \
> +       UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \
> +                 0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20, 0xe7)
> +
>
> +/*
> + * Platform GUID is UUIDv5 (RFC 9562) of "platform/8086:<devid>" in the
> + * Intel CPER namespace, stored in the mixed-endian guid_t layout 
> used by CPER.
> + */
> +static void cper_platform_id(const struct pci_dev *pdev, guid_t *guid)
> +{
> +       static const uuid_t ns = INTEL_CPER_NAMESPACE;
> +       u8 digest[SHA1_DIGEST_SIZE];
> +       struct sha1_ctx ctx;
> +       char name[sizeof("platform/8086:ffff")];
> +       int len;
> +
> +       len = scnprintf(name, sizeof(name), "platform/%04x:%04x",
> +                       pdev->vendor, pdev->device);
> +
> +       sha1_init(&ctx);
> +       sha1_update(&ctx, ns.b, UUID_SIZE);
> +       sha1_update(&ctx, name, len);
> +       sha1_final(&ctx, digest);
> +
> +       digest[6] = (digest[6] & 0x0f) | 0x50;
> +       digest[8] = (digest[8] & 0x3f) | 0x80;
> +
> +       *guid = GUID_INIT(get_unaligned_be32(&digest[0]),
> +                         get_unaligned_be16(&digest[4]),
> +                         get_unaligned_be16(&digest[6]),
> +                         digest[8], digest[9], digest[10], digest[11],
> +                         digest[12], digest[13], digest[14], digest[15]);
>  }
>
If we want to go this way, IMO this logic should be placed in lib/uuid.c 
and not in Xe. But ...

>> Aside from everything else, should we also add some kind of kunit test
>> that makes sure we each PCI ID has an entry in this table and vice-versa
>> to make sure we don't forget to update this table when platform PCI IDs
>> are added/removed?
>
> Agree, Kunit can be added as follow up.
>
... any reason the Kunit isn't enough with a static table? If we add it 
immediately instead of later, we'd be sure to get a CI failure if a new 
PCI ID is added without the matching GUID. Compared to the dynamic 
generation, we wouldn't get the GUID for free if we get a new PCI ID, 
but overall it should be less work IMO.

Daniele

> Thanks,
> Badal
>
>> Matt
>>
>>> Raag
--------------Y6b9AktIS0A0srpfrjGm2Ebg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/2026 10:21 AM, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 24-10-2026 04:34, Matt Roper
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 22-10-2026 19:10, Nilawar, Badal wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 14-10-2026 16:00, Raag Jadav wrote:
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	/* 0x674D  platform/8086:674d */
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	/* 0x674E  platform/8086:674e */
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	/* 0x674F  platform/8086:674f */
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	/* 0x6750  platform/8086:6750 */
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	/* 0x6751  platform/8086:6751 */
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+};
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">This is unrelated to cper and shouldn't be here. I'll rely on Matt's
input on how to deal with these.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Agreed, I don't think this is the ideal place either. For now, I'll keep
it here and, based on Matt's input, consider moving it to xe_pci.c,
which maintains the PCI ID list for the platforms supported by Xe.

</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">One reason I placed the table here is that these aren’t general-purpose
platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
platform_id field, using platform/8086:&lt;device-id&gt; as the name.

Since CPER is their only consumer, keeping the mapping with the CPER code
seems reasonable to me.&nbsp; I’m happy to follow Matt’s input if there’s a
preferred place for this kind of mapping.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">My only concern is that we usually don't have device ids lying around in
random components, but that I think is upto the maintainers.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yeah, I'm not familiar with these structures.  If they're CPER-specific,
then keeping them in the CPER file seems natural to me.  </pre>
      </blockquote>
      Fine, I will keep them here only.&nbsp;
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">But it's also
true that it could be easy for these to get out of sync with our general
PCI ID list if PCI IDs are added/removed.

If a new PCI ID shows up, how do we know what the values should be here?
Are they documented in the bspec somewhere?</pre>
      </blockquote>
      <p>No these are generated as using uuidgen utility as UUIDv5.</p>
      <p>$ INTEL_NS=$(uuidgen --sha1 -n @dns -N &quot;intel.com&quot;)</p>
      <p>uuidgen --sha1 -n &quot;$INTEL_NS&quot; -N &quot;platform/8086:674c&quot;<br>
        9046afe5-9041-5124-8614-92550d9e9da6</p>
      <p><br>
      </p>
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style></p>
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">  How do these values wind up
getting used?  </pre>
      </blockquote>
      <p>This UUID is populated in CPER record to identify the
        platform/SKU associated with it.&nbsp;</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">Are there uapi / ABI implications of these values?</pre>
      </blockquote>
      <p>No uapi implications. As they are part of CPER record should
        remain stable for given platform/PCI ID.&nbsp;</p>
      <p>I am considering generating the platform UUID dynamically using
        UUIDv5, with the PCI vendor/device ID as the name.&nbsp;</p>
      <p>This keeps the UUID deterministic for a given PCI ID and avoids
        maintaining a separate mapping table when PCI IDs are added or
        removed.</p>
      <p>+/* Namespace: uuidgen --sha1 -n @dns -N &quot;intel.com&quot; */<br>
        +#define INTEL_CPER_NAMESPACE \<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20,
        0xe7)<br>
        +<br>
        <br>
      </p>
      <p>+/*<br>
        + * Platform GUID is UUIDv5 (RFC 9562) of
        &quot;platform/8086:&lt;devid&gt;&quot; in the<br>
        + * Intel CPER namespace, stored in the mixed-endian guid_t
        layout used by CPER.<br>
        + */<br>
        +static void cper_platform_id(const struct pci_dev *pdev, guid_t
        *guid)<br>
        +{<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;static const uuid_t ns = INTEL_CPER_NAMESPACE;<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;u8 digest[SHA1_DIGEST_SIZE];<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;struct sha1_ctx ctx;<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;char name[sizeof(&quot;platform/8086:ffff&quot;)];<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;int len;<br>
        +<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;len = scnprintf(name, sizeof(name),
        &quot;platform/%04x:%04x&quot;,<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pdev-&gt;vendor, pdev-&gt;device);<br>
        +<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;sha1_init(&amp;ctx);<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, ns.b, UUID_SIZE);<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, name, len);<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;sha1_final(&amp;ctx, digest);<br>
        +<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;digest[6] = (digest[6] &amp; 0x0f) | 0x50;<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;digest[8] = (digest[8] &amp; 0x3f) | 0x80;<br>
        +<br>
        +&nbsp; &nbsp; &nbsp; &nbsp;*guid = GUID_INIT(get_unaligned_be32(&amp;digest[0]),<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[4]),<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[6]),<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[8], digest[9], digest[10],
        digest[11],<br>
        +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[12], digest[13], digest[14],
        digest[15]);<br>
        &nbsp;}<br>
        <br>
      </p>
    </blockquote>
    <p>If we want to go this way, IMO this logic should be placed in
      lib/uuid.c and not in Xe. But ...</p>
    <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">Aside from everything else, should we also add some kind of kunit test
that makes sure we each PCI ID has an entry in this table and vice-versa
to make sure we don't forget to update this table when platform PCI IDs
are added/removed?</pre>
      </blockquote>
      <p>Agree, Kunit can be added as follow up.&nbsp;</p>
    </blockquote>
    <p>... any reason the Kunit isn't enough with a static table? If we
      add it immediately instead of later, we'd be sure to get a CI
      failure if a new PCI ID is added without the matching GUID.
      Compared to the dynamic generation, we wouldn't get the GUID for
      free if we get a new PCI ID, but overall it should be less work
      IMO.</p>
    <p>Daniele</p>
    <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
      <p>Thanks,<br>
        Badal</p>
      <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
        <pre wrap="" class="moz-quote-pre">
Matt

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Raag
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Y6b9AktIS0A0srpfrjGm2Ebg--
