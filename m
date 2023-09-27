Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31310E810D5
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F0A10E4E8;
	Wed, 27 Sep 2023 11:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5B410E4EB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695815070; x=1727351070;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=uheaXqp13+4jD1+wNJC88b2eFyVQJzVjLn/8rkBGYpQ=;
 b=EAOmlr+uDxcNtLK8LTLM12Z3X+/sJQKPo48XoWbPdP1UIIp07uS3nclO
 FsL7YE7oaRcSfSbIPJ40CAjAE/g1G3T2h/gR/2RgHKJte0fuUouE7vYFq
 idkOea0xQHQKmZZVi1dZ5rb8uDg+rHek2qD5C27FZktM7HmdXLCeHdJyj
 LqiLB+Tj24LAXO+G7epknQDUxgRVGoR6WgIMiX1aaoiHi+b3QghXwq2GM
 Op7G8iXAfqt51T4C4HRW8u8BhQIGyVBays/OcNjcGKz8BCZauxCcgQg+3
 Ocfa7AjCkPEN5eGkhSqV9bB5CAmk07g3GmKAiDXgiSGTDlldwT3SYNI86 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412713164"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412713164"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698846106"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="698846106"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 04:44:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 04:44:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 04:44:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 04:44:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 04:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmstwgAZ9DkpYZXs/jZeeUKsBagqqjA8DfBgn0XewgLqnK+p7LaVjJysde8yX9UcoOw/VNzztYKhk7L3oedbNHY2xytNO7BpRyJFx8taUDBtjKpdnz8fZQ15bp479IkD+znB7pxnGeEYsAd20AhvGvci/DR4V1vFOdn2+XLn/N+Ba3Egpdq5Ycm2fKbpRWwjL3bCGIlR5yawxxU7wuYzfEFH50Gg6xPGEu67a4rkudyAHwFYrfDGPIiWeeWut+Jl5GiISqlb485cpbn1jLZbTFE/doVPuR4fslIZCbBHGTrTa//5T7cVhbGZThVS/2rVttzTdRTFBiwPdjMo9qYMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1GQn4Doo0j+fdA3sdA3x0Qq19Dx7N4XfMM6YallAOM=;
 b=jjotQ9TXAmSkApPWYZoIaDrn5e9mwZ9g6GXhu51quViJ3ACPk3K1uNHHGMCZg7lTzv17Z7y5eoz/G3vEsKARUF0xiX25Nsi0w0W/I9EpUK+BkYVO1eoKjc1zRnhUIG8eb6xZ5QYP28eJo++yv3PFN5os+70mIPlRa+q3FWKv6Z5e+nsYfseWw65yTS5VrV7eMEainJU/yCrXmHGmUmYqS4Pu2zjjLtyYLMxhxOd/BmVg65BqdmAX6U7wm7cArDwvYZrt4skkL+A3oTFXYvUQrgAcROlAAWd7D1Kix/txWGzKzvTk2GtITV2j/G1/mAX+tu83uiiKC40tSaJG8Hg/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 11:44:19 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 11:44:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169576952764.20979.14273723004671478255@emeril.freedesktop.org>
References: <20230926221914.106843-2-gustavo.sousa@intel.com>
 <169576952764.20979.14273723004671478255@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 27 Sep 2023 08:44:12 -0300
Message-ID: <169581505213.2071.9109941742697972219@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: bed935ff-9ea7-403c-96e7-08dbbf4f14ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFW+Yo3vgC3G2ABnUOLrrYOhufuZG+jLf6IuikHLVp0JVd6IucP7EnDuv8ZRQovKYYRX4x6V7PFajgu3sTq4iGJrjl5YLuGnuUDCU2w8+yS5Wsj1hcw/KnW+KU7biAHuvl67f3UnJKYWCbBvjlkRmXizp5emg1Z9vQ5kzNQ/N7iHiAgMyOA8izVjNc+mjDKZReWb7fnC9zioXpAJIWYmExdJvPzRsWstTjn91v2dAnajE5QemI3t+IELq9lA37TKZQmCv0LpPe7N/PEai6sczHjvVRXIxe/ytBmP9Qd+KetOYKgbdaYNgRbDrF4WwHnydA477O9GX21WOKT2uMlqZ1jMWV706i6dSWVvXLSzbnuavF7mfUUOvqXzDMS1FsJ8Hv+9vp0FPXhxZQnPzSojSgiPTU8lKUdrerN4eR7bHaFaSyIziDTRDZ6hySy1SBnxmRJzY6ey5CwNrEFZdYwIgbxrfcD0qB6j3KQN4LWusvAqfOTPev8T9uZ/QRQxFcUhA9AlfAqBY3NRRd+tB/ZziRQngVFhf0/krKl/MfdVuNWKCwA5+skh/eKRV7Uzvvcr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(1800799009)(451199024)(186009)(33716001)(38100700002)(82960400001)(86362001)(66556008)(54906003)(478600001)(9686003)(5660300002)(6486002)(66476007)(66946007)(4326008)(8936002)(6506007)(44832011)(6512007)(316002)(966005)(6666004)(41300700001)(2906002)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJYK3cyNk84QVMxeHJaY3M5K3NTdW1sU3Z6UjZ0QVNIZ0I2WHh1QmNrWlBr?=
 =?utf-8?B?UGlWTURMY0dwdGg1cGxqMENnUW5uUklHQkVDRGVIamU2RmxMOGFXKzFHNWp6?=
 =?utf-8?B?UTZoV1o3UjJHMDFpMlFWZEdaL3RwLyt4anNaUWVGUks5dndVbmdkQmhOZml3?=
 =?utf-8?B?YXpYNGVGUEFvYnJkRnlSK1NWTzZlMEdzVWI4TTROMitpNldzTE1Za3gzcllT?=
 =?utf-8?B?VDdiTmdNSjVEbUgrd1NYV3BXVU82NGRBSFpoNUpBK25hQ0pTK1cxV21WU2pr?=
 =?utf-8?B?RU4xd2hWTEF0UmdsM3dMd25FYWNXdjByamJNV0hsKzFCdkt5SWZ2RmdCTGdh?=
 =?utf-8?B?WncwbjZyV0NjaWRzajMvYWljOWpqYWhhUlF5SGZYSHEzRUI3ZGllOWh5S2JY?=
 =?utf-8?B?Wnl1VlFZVlA0QnlQR09NeWFFaVR5c29wcFEza3Y5WURkSDZ0QUE0ZklUVkwy?=
 =?utf-8?B?empSQ09FRWNhQ3NXaVlzSDkyR2YxN3JMWEFEYUFZaXV4S0xJc3M4emF1aFVl?=
 =?utf-8?B?ZWZxdTdFNy90UU9pT0dvcEZDSlRRUEdzUEpYMHk5N3cxN2QyZnY5aFJUckNQ?=
 =?utf-8?B?ajRHK0l4VzJSK210R1BEdXhHMldSaVJNbVlFWWVNdkV6NHM5RnRrVTFCMDRi?=
 =?utf-8?B?VHZCQ3AyRnVXWC9wTDA1aXNWeGZONncwQXRhL1h6Y2htRURONzg5dWtHUnBU?=
 =?utf-8?B?eEZRQS9FT1JObXROZU5yUnNNQ1AxN2I0aWQ4dlVWV3RSZDljL2hJWkN0UThB?=
 =?utf-8?B?S0VLVWtORlY0REZFNnNFQnNETktka2NOWVMzRithcXExcWVndkt2QWN6T29y?=
 =?utf-8?B?UWxsQ1Q3YzJkUHBxL1JoWWxydEF0VXpTeTlaaDVhTTRzdTdIeWFGM3lGUHBP?=
 =?utf-8?B?bEdBTWpNbWNFeXBra1lzY0c2cDd1U1YrTExTNk4yTVV0WjNTMnpQejVpZ3R6?=
 =?utf-8?B?VHUvdlI5ZTBHOHFUdnUrSm0zZlArNzB1TmNMVHc0REZ1UHBRKzdJcGh4Y2xH?=
 =?utf-8?B?TTNKdVpleVBiOU42Um5uMkx2SWZZQWNjZjRSK3pHRkkrV0IzN3lPVi9zdmhY?=
 =?utf-8?B?emQvN2luMHh3SEc2K3pnUkIxVFViOG05cGplYTZkcFI5R2Exb2FMOTRSSm15?=
 =?utf-8?B?YXlvWjJuYThkL2pBK1o3a2RCUW1xUy9HZ2xFcVdRUUZSa1NHVElRODRiZVg3?=
 =?utf-8?B?NC9lNXBEOTcvTEhEaDJ3bGZGNTFKblJXR09Wb2xEWEpEMldDSlNORHMrSlRV?=
 =?utf-8?B?R2FOQlFpdmZsRzB2cll1Z3FYSUh2SFBwYmc2NEY2S2lrVmRPMFlhYVhTTGZx?=
 =?utf-8?B?UE5uZGNvYnVNN0ZkekFwZGQ5K0hYVUxzdWlMOWVqY3pHNnJtM3phWU5tWDBs?=
 =?utf-8?B?bFpRZ0F0bDNRWUk5bkJLVmxPTlBtTGQ3T3hwd1k0ZG00bEdtck96YjF1VlNv?=
 =?utf-8?B?ckpySS9Tek1haUZIcEFndCtIT2lXMlhIblErU1hRTXBpQ3JpYnZRVzhxbXJG?=
 =?utf-8?B?WmtRMThVdzVBbTE0TW1VL0hGckpDMUM3QkpycFpFNFFCTUIxS0drT3BSQnJL?=
 =?utf-8?B?NmNzTFVkMTltOUtncnBFbzd0TCtSdit5OUxaZm13OXVSRzZLVWttU1JUNWx3?=
 =?utf-8?B?YlI0eTJVWThBVjhRdHFDK2FBdC9ocHhkN3l2RUNsK3hQZ0dPaUluRjY4a2Yv?=
 =?utf-8?B?NEtXUEs2K0NoSzFMK01CS0tTSXZkM3pjdnU4ODN3TTlYSXZUcGtBNm1UeHZu?=
 =?utf-8?B?RVpJcXQvblJCRlAveTBaUklqTHFJUHI3elVKeUxqL1RxQ0JWdXcrZGU4VDYr?=
 =?utf-8?B?OElUb3RsVTdUWGZyYXZCcW5zQ3FIcWprT1RhT2dmcG9LNGZpNDBVRTJWZ3VS?=
 =?utf-8?B?U0pJYmp5QmJrVFpyNDNIU1daeDhsWmptdWIyUUx5cVd5OVBEMGtKaG5oMy8x?=
 =?utf-8?B?dDByUnVPeDdQZnVvbU1FNlVNeWhUd29JYmpoUk1pM1A0MzV1K1pDYlFqcTlZ?=
 =?utf-8?B?SzNCQXdNanVKQmppcWNoZlhUZW1KaXorYVgxTnJnYmRDYmROVVJjRVAzdU1L?=
 =?utf-8?B?UUJidVc0NDJDQk11cERnL0tudlAwUkVkRkc1azNpZGZHTjgwTEdpUWhRY2V5?=
 =?utf-8?B?d3V5ckhhcXRFWUFKN1Q5b2Y2cUxrSGpnS0xDQ3RGcGtMZCtaUFFSbytXcU4v?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bed935ff-9ea7-403c-96e7-08dbbf4f14ef
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:44:18.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AyqKNGavis9ebstd3cibCOW40oLnlb7hEU1UW8jH84nM4jMDiqvYARD8TP1mlOcxAj2UpNVs9zxyVn8lRWaBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/ir?=
 =?utf-8?q?q=3A_Clear_GFX=5FMSTR=5FIRQ_as_part_of_IRQ_reset_=28rev4=29?=
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-09-26 20:05:27-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset (rev4)
>URL   : https://patchwork.freedesktop.org/series/123920/
>State : success
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-396-fc8ec3c56efa5c15b630ddc17c89100440fe03ef_=
BAT -> xe-pw-123920v4_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.

Pushed to drm-xe-next. Thank you all for the review!

--
Gustavo Sousa

>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-123920v4_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@xe_module_load@load:
>    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#597] / [=
Intel XE#714])
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15b=
630ddc17c89100440fe03ef/bat-dg2-oem2/igt@xe_module_load@load.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-dg2-o=
em2/igt@xe_module_load@load.html
>
> =20
>#### Possible fixes ####
>
>  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>    - bat-pvc-2:          [SKIP][3] ([Intel XE#678]) -> [PASS][4] +164 oth=
er tests pass
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15b=
630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-inva=
lidate-prefetch.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-2=
/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
>
>  * igt@xe_live_ktest@bo:
>    - bat-pvc-2:          [SKIP][5] ([Intel XE#725]) -> [PASS][6] +2 other=
 tests pass
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15b=
630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_live_ktest@bo.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-2=
/igt@xe_live_ktest@bo.html
>
>  * igt@xe_module_load@load:
>    - bat-pvc-2:          [SKIP][7] ([Intel XE#378]) -> [PASS][8]
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15b=
630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_module_load@load.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-2=
/igt@xe_module_load@load.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>    - bat-pvc-2:          [SKIP][9] ([Intel XE#678]) -> [SKIP][10] ([Intel=
 XE#538]) +33 other tests skip
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15b=
630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legac=
y.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
>
>  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>    - bat-pvc-2:          [SKIP][11] ([Intel XE#678]) -> [SKIP][12] ([Inte=
l XE#539]) +7 other tests skip
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-c=
ursor-atomic.html
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>
>  * igt@kms_flip@basic-flip-vs-dpms:
>    - bat-pvc-2:          [SKIP][13] ([Intel XE#678]) -> [SKIP][14] ([Inte=
l XE#275] / [Intel XE#541]) +3 other tests skip
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_flip@basic-flip-vs-dpms.html
>
>  * igt@kms_force_connector_basic@force-connector-state:
>    - bat-pvc-2:          [SKIP][15] ([Intel XE#678]) -> [SKIP][16] ([Inte=
l XE#540]) +3 other tests skip
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_force_connector_basic@force-conn=
ector-state.html
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_force_connector_basic@force-connector-state.html
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>    - bat-pvc-2:          [SKIP][17] ([Intel XE#678]) -> [SKIP][18] ([Inte=
l XE#537]) +6 other tests skip
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-f=
rame-sequence.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>
>  * igt@kms_prop_blob@basic:
>    - bat-pvc-2:          [SKIP][19] ([Intel XE#678]) -> [SKIP][20] ([Inte=
l XE#536])
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_prop_blob@basic.html
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_prop_blob@basic.html
>
>  * igt@kms_psr@primary_page_flip:
>    - bat-pvc-2:          [SKIP][21] ([Intel XE#678]) -> [SKIP][22] ([Inte=
l XE#535]) +2 other tests skip
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@kms_psr@primary_page_flip.html
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@kms_psr@primary_page_flip.html
>
>  * igt@xe_evict@evict-beng-small-external:
>    - bat-pvc-2:          [SKIP][23] ([Intel XE#678]) -> [FAIL][24] ([Inte=
l XE#389]) +3 other tests fail
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_evict@evict-beng-small-external.h=
tml
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_evict@evict-beng-small-external.html
>
>  * igt@xe_evict@evict-small-cm:
>    - bat-pvc-2:          [SKIP][25] ([Intel XE#678]) -> [DMESG-FAIL][26] =
([Intel XE#482]) +3 other tests dmesg-fail
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_evict@evict-small-cm.html
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_evict@evict-small-cm.html
>
>  * igt@xe_guc_pc@freq_range_idle:
>    - bat-pvc-2:          [SKIP][27] ([Intel XE#678]) -> [SKIP][28] ([Inte=
l XE#533]) +1 other test skip
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_guc_pc@freq_range_idle.html
>
>  * igt@xe_huc_copy@huc_copy:
>    - bat-pvc-2:          [SKIP][29] ([Intel XE#678]) -> [SKIP][30] ([Inte=
l XE#255])
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_huc_copy@huc_copy.html
>
>  * igt@xe_intel_bb@render:
>    - bat-pvc-2:          [SKIP][31] ([Intel XE#678]) -> [SKIP][32] ([Inte=
l XE#532])
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_intel_bb@render.html
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_intel_bb@render.html
>
>  * igt@xe_pm_residency@gt-c6-on-idle:
>    - bat-pvc-2:          [SKIP][33] ([Intel XE#678]) -> [SKIP][34] ([Inte=
l XE#531])
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-396-fc8ec3c56efa5c15=
b630ddc17c89100440fe03ef/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v4/bat-pvc-=
2/igt@xe_pm_residency@gt-c6-on-idle.html
>
> =20
>  {name}: This element is suppressed. This means it is ignored when comput=
ing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
>  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
>  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
>  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
>  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
>  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
>  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
>  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
>  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
>  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
>  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
>  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
>  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
>  [Intel XE#725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/725
>
>
>Build changes
>-------------
>
>  * IGT: IGT_7502 -> IGT_7503
>  * Linux: xe-396-fc8ec3c56efa5c15b630ddc17c89100440fe03ef -> xe-pw-123920=
v4
>
>  IGT_7502: ac56ba97248b33668fbe771882360bd7b274cc9a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  IGT_7503: 7503
>  xe-396-fc8ec3c56efa5c15b630ddc17c89100440fe03ef: fc8ec3c56efa5c15b630ddc=
17c89100440fe03ef
>  xe-pw-123920v4: 123920v4
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1239=
20v4/index.html
