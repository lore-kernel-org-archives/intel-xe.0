Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B0CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35710E10A;
	Thu,  9 Oct 2025 13:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWIW4GHp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C4110E10A;
 Thu,  9 Oct 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760015818; x=1791551818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2pGr/Ksv4zFv+bOQB6Xxhx9MWGzWHMMyPJkVFfyDlao=;
 b=SWIW4GHpqGgE1eGeK0lChZiXlm986o59IPwTlEuVjLUEGd7MP96UVqhy
 c9VHbczhJMBoa9yRxrOZ8wPGqEn0TU/MEerWcJvv6pI7UHkZQqf2tuplm
 TiQAF6OVCH3kiiSz/hjbprjhTHvUg+jK5hKQKEvCsCHjGPrtfP0r4gTO3
 jB2lQvSWA9K1CM3ePBi6xUc7Mp2Aa/nZIap8wkx2f58IL/zDXetpYUycU
 eRGsfh9johyvGcgO6w2kNOVVie5eYWzqiT9zhX6lCq7METtjO45KCzhib
 dXHP0Hm+/Tusg3UdIM/84+ItuCdghLv+z1Ox79sl61QVgZ4g0fFnqWGua g==;
X-CSE-ConnectionGUID: u7HV1WviSjaavnEwFuKGPA==
X-CSE-MsgGUID: fI0Q0x0AS5eVot+QJRcJPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73651883"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="73651883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:16:57 -0700
X-CSE-ConnectionGUID: VHS88hptQuW1UOEDBfi2Cg==
X-CSE-MsgGUID: awtyFBQQTIGt6ddl6uyT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180527361"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:16:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 06:16:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 06:16:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 06:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFYWx6pR4gAu4mix3lWMd1ryhjo5phKV5mUkcxe2GKyvr1jNUiFdNPqkzXLYPlRfLP7el/OcEd9hWuTHMLkkgEY12gdVPMa2mhVLXk1sy7gTeIhwTFe/HCTdXoCu3UGb5zmUf24UhjOfWY9CkqQCvTqZGAcK3szrnetBZ3sWhx5kwBBSAOj8fXWI3YfEV4wmSA0bX2a59tW+i2CLIBGYGJbRxxb52XE5f8Nr11rsZJn+nf3PfEju+tPU+ScSEF+itvfzkAeyozoqrf3ZRamyZlLmRJ5PnTJRMNLnr9nAgM92uBXIa/AZLLKLReS+RdBCAXJ/2ibQXvKXgJiU+6gYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1Iv9NUIWM2c4uFlbvRFNGep9+uk+FNNt/w4de5hRQc=;
 b=XiC/I/F7ROD+6n3+fkU6A4oc3W8gJ4zA0csSKxLKy7psCGrxEdS0KkYnZ9JdF6FdWrtLG8c24ZE+9rwV9r16d81P+cPrWQnubA8YI08U92RqaVlJCpoeb6NJ+2vyqE0SPimvIITnRcx/9geuVfeeuZBtcQm0fKo5eghnq/3GFhxaKkIbRqJJxmLPBAfzaSJljfWSRUOOEvnJzNKuxs1hapm3wkc331gE92/99JVZ3kwFI8qC9H06mf4NM5f+dFaHxq8rl5Se0w3dM4hoBbbgy3BmsZnqY/y6pMX/iwLKvsOhKD7HxBd2u+rC6eXM5dsiZ7RvueeosWHXY796XTnZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 13:16:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 13:16:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7S5n7kQgACDAuA=
Date: Thu, 9 Oct 2025 13:16:53 +0000
Message-ID: <CH3PR11MB8434564D6F47D0264E1F88478DEEA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
 <CH3PR11MB8434B9D6E594F20EF6491D918DEEA@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434B9D6E594F20EF6491D918DEEA@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7291:EE_
x-ms-office365-filtering-correlation-id: 22895968-592c-482a-700a-08de07361d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UoRPH4EtzV6n7l6Y6S07inulE1PUpncZl9N0hiZycPyuY5PPpfcYyCnCwP7E?=
 =?us-ascii?Q?5inw/N6TZTvNZIQ7cQtYN4kAc/xlT5NC7hh0/Mj30r5F6PcfA+DMvzyenntl?=
 =?us-ascii?Q?2PQ12BuCkHAtUuKju4opkN5nYC8GPLeOLCtvSRuE1CinF2aQd555HCPbH3eF?=
 =?us-ascii?Q?wSbA832+kMGBz/dcVQd8eRpB2JPXQf8FXXoo4yqOZ1L24+7AaAlI5XmEx8Ns?=
 =?us-ascii?Q?RIPHKkJFWzo8YLXo5ZtwtI7N94hteshh9/5xT3FxLbt+D/y7AQxtGsilY8Ro?=
 =?us-ascii?Q?kTcne0hToJjLFOllBxK6vlyLGyf0HPG5LtGd0CpvknZQ0DeiAPfiTP5P8CQz?=
 =?us-ascii?Q?ued6zQ9OUdL0LKxpmY2cJfdj/iBOWCe6K2GhmzRu9gwS5jU1Nt4OHCEihDWz?=
 =?us-ascii?Q?YKyD6hFfQ1zCWdS5cC9+FWzZtQfzc/N4Iv9+4NVC5n3iozbI6lhGJbUSNrVh?=
 =?us-ascii?Q?HZHkveHaaEXrMF+TVaIK6IWtIkacCDDqgXg0Ww5ook3/1cQgYD27C5W53rQl?=
 =?us-ascii?Q?PFdfP193n7QEhjIRFNHI5MRvuNGu365GvvS5Y4m8L/yer1AKl6AqNncRztE+?=
 =?us-ascii?Q?FVapsRtFv20qIjFzulQCOc09SeomsIOTvavNns8uWzIF25DMlNTU8QyaiAvI?=
 =?us-ascii?Q?bbacqV+5mWkQagM3MW8Y0hz3NMBIkTucZAgDlsDyBvJsh3k4yPO4Q3dbvqKa?=
 =?us-ascii?Q?0Efvw2WlinEM8I0k7gVQUFnE0Z91PdA17MyAIxF/MKV9oBjsQ3Zkr7m1lkoY?=
 =?us-ascii?Q?YY2F0AgvcWg/mWU0I+hOwB3tlgj/9U5JpJDkZjcJf4OWCFv7XMtaRGq1CaRG?=
 =?us-ascii?Q?ZCUf9eh770HzftHcQf/G95BKV4yppWxhgSPgTrJQSi0XHBpwuX6tbc306TxC?=
 =?us-ascii?Q?7YxNDfo0lvlmoJChcQnZ9UcTDKh3mst7PwjVFRoG8VC9uBMB8HVYSiQnGJbJ?=
 =?us-ascii?Q?4dE9zfDKeJ+KxgW3ue+dUtexw5PK407iNy1iTV7sr1QtNuOoOwKp1haT5/A/?=
 =?us-ascii?Q?xENtGD9XxH7vnlvwhRvCI287+4xD17Z1/ndLD7MjzAFcU3kZUW//6un2f0Kq?=
 =?us-ascii?Q?cZSJoalFqDn/mD4SElhDobsI2l0ASsnXEu8gsC1MeAW1UBmu9QaEJzf9kW3j?=
 =?us-ascii?Q?7EHR2BeOc8mRxOLrE9du7UWG4kufR2YLUmXD3roP7gaNMAZMVF2hh7Okf815?=
 =?us-ascii?Q?H5Ax15gqviz5CQKZRyJkzxZwY8KYLrFjR/DcKqf029jn3JKnykcmIhtxDJiE?=
 =?us-ascii?Q?Ar4tZcuqanwavfMnN1tVwe9qMZl7+R/cTQAPep2CjU8ChkjOecnvUiCRYQVh?=
 =?us-ascii?Q?0poxoqQwflGd+PRsBwwMXm7nAuWGm3wLqjebrvPFhTq2aT38muBJJKjW1Ai2?=
 =?us-ascii?Q?rytssSg8QDd9uy1qgIXHaiYDz8RzNTCZP/HU8CohhHFuUzODS+sgUSWl20uZ?=
 =?us-ascii?Q?wildHBfWF1Cd8+gpEJzK6Qp+/u41qvNyXAN8QQJwGiCQCs6uj99yRWEZ/zJ1?=
 =?us-ascii?Q?Q1ElKNZJrdE7+/VTbsOuJzlt7QtGAhz8aAhR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zo0CKegr4N/RQMQT61YGJwcHN+O40Z9MNJ3EO2QncVn+Hay9df1mLRZh+3qQ?=
 =?us-ascii?Q?5S/j3QiKTmeigrg0c/rNa6//LranRjC7QxB3AbJOJBx0Z3igU0qquOpvXggC?=
 =?us-ascii?Q?ElAbxXLooGNvZG2EtYW1/IT9Fbww7gYL0OwgE8uVnboLXL+nPCjWMm4H5w9e?=
 =?us-ascii?Q?SUgYjfYs4f6igD65PFAhG+2uSXrwIOf5GUbXpoTVhUj7sMoJUz6HBA70nmD2?=
 =?us-ascii?Q?HPkXgOsJAvpqTSDfhl9OPOzR7bV2KnewjPeAK9iRukAPpohOOuGcXxeG2VHQ?=
 =?us-ascii?Q?kIrMx3+XTppwhP6+53BxpnUQun7x5sFDx5OwLB0qRAxu7iJ90mKCRDnkbaif?=
 =?us-ascii?Q?SP0HYal4Ou1BndLmmBfCDA4hce8yrHaB9ho/S72/UyoMDZpZVcW5ZsUSuENH?=
 =?us-ascii?Q?Z0j1ok90S43hnNWzOFsWQN6dTh+Nca33BaW5BVa4TgKNU4gUgImNnTC9KCok?=
 =?us-ascii?Q?Q2You/WD1GuUPAjvJMnvzr0voxio6Cc3ANvrhOHd8ZgTUeFvVx5Mawvt5ZGp?=
 =?us-ascii?Q?U1wCRbX6+sKJApE67BVPL18pI+1bH2ZGA0yf+7SGEf2fdqa6/tu3Ot2Bximc?=
 =?us-ascii?Q?Uoj/Oo1rn55gSA8CAJzb5JEiVo5FGYHvpk/CC72XUGEuRipDJML8AODxcuST?=
 =?us-ascii?Q?J1PKRb9VGsWWivVLR8Y5wWh7E8v75nrORGDpzQr3aEmBPAKLVBDUlNk1juwZ?=
 =?us-ascii?Q?NTbG4pVC1Bbgq19GOe8XhY3vnpt1fsQCuAaorTBSf2dTbJF51XC5GSK5kIoM?=
 =?us-ascii?Q?FlTRUBhF4UHizVLfpuihd9dvnkeFzzOtolJo2Ido+fUaqSu9xT6DSIoDAvQh?=
 =?us-ascii?Q?vntPSClMF9J7F/iX8PWVOVByXzxXc7RUX2yjQvrVNB8XNBWJ41c/uCb5SxS1?=
 =?us-ascii?Q?OVYMU1Pbtssao/OzdNGN2xGEfE+JoNbBi0WefuCxLiybQ1x2gj/Z2XYDlU/i?=
 =?us-ascii?Q?3tWewfUtbLuj3NI0DBce7Ah7Ia2TQj4AtGj33fy3aC/xSWUCISw6qXDfrYgG?=
 =?us-ascii?Q?IQXiIhBdTA7wu2yGNUHttE61YZW+/pkRFCHSpk0BcitVIgLn7+uVuxETg3zn?=
 =?us-ascii?Q?1QHgyMk2uTJ1dB9CSqsxZsaK3blKBgrgX6VXuGfB8WmAbYGi+y/MTdI8GMmV?=
 =?us-ascii?Q?VAn5asTTVVh91Y0QVhp7StUZnfJ9AII50nySoBRq9TpRKfenoZIaf49ZDMAt?=
 =?us-ascii?Q?n5gR0Eb9s6qdkBdErQtpWo3D+8WHhPnf8/2OkG0zgfL5K+42DxSu2GjalP3Y?=
 =?us-ascii?Q?BwrxpE5RqNDvWqyGFuXRb902ix1A9fPMc+KNib6SA8d5YZBrCHJm3UUw5jMn?=
 =?us-ascii?Q?yTwESGwzx3qCJlLhKsEPWplVI7ktb3cOC/I1sLDU5T1Volzj1I32MYAiS6uw?=
 =?us-ascii?Q?UeEBEM9oNv2Ql7+8wecWg87sbs6qEuxU5hJ9LQdboJfziwu7+oGsXnmcsgDM?=
 =?us-ascii?Q?PWX9X2pbLovVCn0bELj8L/P8sHuLrzAywH+9XocRw11X8j/WxWOJ6DvYRmyx?=
 =?us-ascii?Q?o1smdgG5HOV/2J3pQSHB4CvNLsfN3hyrlmGx5LR2ebtQWu33nV7BhNsHHHZ8?=
 =?us-ascii?Q?haDXetEQlgSQAg5lfrABg3sO9Ds6cV/HIAlBjvtKE73wYSOpvFkkX1XeHWi7?=
 =?us-ascii?Q?Zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22895968-592c-482a-700a-08de07361d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 13:16:53.4937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0U0mrYk1/R6o8rya4Cxwrd77PLVvel+NEaimOX8p56oDQC8V7vwwkOSKHF13fq32rLauCAIdSaZ1nbDY7rDTyYyslLAF87WrAeuuziBP8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
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



> -----Original Message-----
> From: Dandamudi, Priyanka
> Sent: 09 October 2025 10:59 AM
> To: 'Matthew Brost' <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: 15 August 2025 08:40 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> > <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> > section
> >
> > The non-block will become invalid and hang until the test exhausts all
> > memory when LR jobs are tracked in the DRM scheduler.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_compute_mode.c | 113
> > -----------------------------
> >  1 file changed, 113 deletions(-)
> >
> > diff --git a/tests/intel/xe_exec_compute_mode.c
> > b/tests/intel/xe_exec_compute_mode.c
> > index b904dc76b4..316f7322c1 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -320,116 +320,6 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> >  		close(map_fd);
> >  }
> >
> > -/**
> > - * SUBTEST: non-blocking
> > - * Description: Fill the ring and check we get expected errors.
> > - * Test category: functionality test
> > - */
> > -#define VM_DATA		0
> > -#define SPIN_DATA	1
> > -#define EXEC_DATA	2
> > -#define DATA_COUNT	3
> > -static void non_block(int fd, int expect) -{
> > -	uint64_t addr =3D 0x1a0000;
> > -	struct drm_xe_sync sync[1] =3D {
> > -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > -		  .timeline_value =3D USER_FENCE_VALUE},
> > -	};
> > -	struct drm_xe_exec exec =3D {
> > -		.num_batch_buffer =3D 1,
> > -		.num_syncs =3D 1,
> > -		.syncs =3D to_user_pointer(&sync),
> > -	};
> > -	struct {
> > -		struct xe_spin spin;
> > -		uint32_t batch[16];
> > -		uint64_t vm_sync;
> > -		uint32_t data;
> > -		uint64_t exec_sync;
> > -	} *data =3D NULL;
> > -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> > -	struct drm_xe_engine *engine;
> > -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> > *)data;
> > -	uint64_t batch_addr =3D addr + batch_offset;
> > -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> > -	uint64_t sdi_addr =3D addr + sdi_offset;
> > -	size_t bo_size;
> > -	uint32_t vm;
> > -	uint32_t exec_queue;
> > -	int value =3D 0x123456;
> > -	uint32_t bo =3D 0;
> > -	int b, err;
> > -
> > -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > -	bo_size =3D sizeof(*data) * DATA_COUNT;
> > -	bo_size =3D xe_bb_size(fd, bo_size);
> > -
> > -	engine =3D xe_engine(fd, 1);
> > -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> > >instance.gt_id),
> > -
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > -
> > -	data =3D xe_bo_map(fd, bo, bo_size);
> > -	memset(data, 0, bo_size);
> > -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> > -
> > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> > -			       addr, bo_size, sync, 1);
> > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > 0, NSEC_PER_SEC);
> > -	data[VM_DATA].vm_sync =3D 0;
> > -
> > -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char *)dat=
a;
> > -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> > -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> > *)data;
> > -	exec.exec_queue_id =3D exec_queue;
> > -	exec.address =3D spin_opts.addr;
> > -	xe_exec(fd, &exec);
> > -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> > -
> > -	b =3D 0;
> > -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> > -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> > -	data[EXEC_DATA].batch[b++] =3D value;
> > -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> > -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> > -
> > -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> > *)data;
> > -	exec.num_syncs =3D 0;
> > -	exec.exec_queue_id =3D exec_queue;
> > -	exec.address =3D batch_addr;
> > -
> > -	while (1) {
> > -
> > -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> > -
> > -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> > -			break;
> > -
> > -		igt_assert_eq(err, 0);
> > -	}
> > -	igt_assert_eq(errno, expect);
> > -
> > -	xe_spin_end(&data[SPIN_DATA].spin);
> > -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > -	usleep(50000);
> > -
> > -	exec.num_syncs =3D 1;
> > -	xe_exec(fd, &exec);
> > -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > -
> > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > 0, NSEC_PER_SEC);
> > -	munmap(data, bo_size);
> > -	gem_close(fd, bo);
> > -
> > -	xe_exec_queue_destroy(fd, exec_queue);
> > -	xe_vm_destroy(fd, vm);
> > -}
> > -
> >  #define LR_SPINNER_TIME 30
> >  /**
> >   * SUBTEST: lr-mode-workload
> > @@ -570,9 +460,6 @@ igt_main
> >  					  s->flags);
> >  	}
> >
> > -	igt_subtest("non-blocking")
> > -		non_block(fd, EWOULDBLOCK);
> > -
> >  	igt_subtest("lr-mode-workload")
> >  		lr_mode_workload(fd);
> >
> I see this test will be not required due to changes in DRM scheduler.
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > --
> > 2.34.1

