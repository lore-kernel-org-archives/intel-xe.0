Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B0EED606
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 13:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A00010EB9D;
	Thu, 12 Sep 2024 13:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIH+P89K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24810EB9D
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Sep 2024 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149458; x=1757685458;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g3UklVQoHbVA4we5o6rMBp45ZM8enUbOPyJj5tIYFzE=;
 b=kIH+P89K4aYSl0k5qFI750ynpTwSH/1UCshmnR/lKXo+d7hoU0gwmj/H
 XH9a1HXSEZGvforPmdvOL8TX42MpbOr0r66Dec4Jr1IxaUAxo8Gw2H1/n
 otJy3VyL/q+UX1cCcRlFojfbRb5YTv1KyLnkv7vHfqKwPlz8M3MWFY498
 d1yVpwX/mv7OIpcVlnfVZOHP7H7d7nS4E5e2PrlXvkBE8gN6yBxZ/ABRX
 gW1fGc7VCaDLRkpDB2LmmAdxadH+ILyNOC36e+ms1G3UWJ6eEbaNR1gX2
 MO7M51QmoWhTYrvLL3cKbUa1cavHgcGAgJ0aXaHLQipU6w9RvWKOPWele g==;
X-CSE-ConnectionGUID: xNmqzV+KQZa6aYX1uLRJYQ==
X-CSE-MsgGUID: 1IB/q9qSQXSHAQPRrqGBAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="47513954"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="47513954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:57:38 -0700
X-CSE-ConnectionGUID: h7KXaQvSSHSXeTjIvC+VjQ==
X-CSE-MsgGUID: ycn6ZWt/S1iSY39QUdtBgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67546859"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 06:57:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 06:57:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 06:57:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 06:57:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 06:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn/s/vHvw7Hfnn1rwS8j3eCHTHNQjWSbuyzpB+a/QpIubTds1AtPavSNGImt8bAnUGF8olf2o3YT/QSIc7Gh2UNV1nvrlWn7Wht8YFFUzgh9mK3aDVaUth/p6PSeAt9sPF7co8NA4VPFGjeGcaImI5Kh2BkB2IHprgMdjaw2tFtUz5flBUFvm+bO5t4bgd3Vzuu2qPwgT86c9fSnDD+xmvfLPGmfDIoNgJBmwYT8NLee/PeDeavvVV/gQGQ1qzypFgYO6kEZyn2EVAu2bTqPIEoXL6eGLgt6SVTeDNBRV06iawW23cOiwKq6fs8eQODARmd7sr6DDzzo3g6JGC+3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxazeBQe6pBcku5w7azEUA+SIv/M8z/geIy5XKxQo18=;
 b=nMWXXFSQnQZ9rjXMAkZE1ve9Qu6psJiTbjkNBHCtUPqeWTLGxhEVB9YlDorXnu5+z11N78tTOaldYTkAnw3Y7US4G4ahFVDm4IejvuE0TUPpCEarGuwLWeYLPJx6PVykWnaBYlUvnHIbAyg8hC+fEfA9k+tLDdC9Pn2lcXjocELXdygboAMuoIi6TdCF/UT8hlFJqdAujLU93TaUTLAuecBOsyAR2i5AIwXdFmYBl+6BMPXJMg3+4J8NHNWYsTksKklfZNaw+Am4IBd8UAwDq1MFkBAQvTULvJrpTD9qZXxlP9jkl3NIyyptHxvhVuc+Nj2JmCCoi8nqjI/7EgYXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 13:57:33 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 13:57:33 +0000
Date: Thu, 12 Sep 2024 09:57:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Intel-Xe@lists.freedesktop.org"
 <Intel-Xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <ZuLzSMH_hBl9RWdv@intel.com>
References: <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
 <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
 <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
 <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com>
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e6c21a-deba-4279-8e9c-08dcd332d957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VElz3lJXPZ5Cl+RjdM2rOIhh/7w1gnOrJCy/FbPJlDv6J4NlJWl2ITEBDm?=
 =?iso-8859-1?Q?AKdN4e8L0MLBPLb4D6ImCOi/rYfLLTjAS3lpZRv1QvQdi/vHL2Jznp3KXL?=
 =?iso-8859-1?Q?cXD5tk3gfhtNAYNgrMOK/J3xXvndTxKK5uNgt349U9DRNr5AQNc4wXvCkm?=
 =?iso-8859-1?Q?J3ckCvCoBEziQmsyLGjiBSAGH0jkAuj8DdcRVhPR898hYkZ80eWoOP0ejH?=
 =?iso-8859-1?Q?5cEtDaL0BF2nqdrvwXgnpd/C/HBUbDdkU1Yol4wqjydSWkNEk+Vx5fC5wK?=
 =?iso-8859-1?Q?y/3TrtBNYeULvVm6PsRje0c1Z3xpntRpqgZOb1HfVFQfOjkDvy17F7Xqv3?=
 =?iso-8859-1?Q?3wn7Nr4lSNCv1wf9kcu0upRFvFXj2yr18bglZ94eaisLf5RPxBxvDEMoPo?=
 =?iso-8859-1?Q?s/eBrelHvCkjFTk11Eh7/hYrJnFPRqJv65qt8hiutpuFm6kS4QM+Hgcq4U?=
 =?iso-8859-1?Q?NfXuZBXmq4UihSAwEKfYOWfRZSILXPyQ/rlNDXP8ffo3MHp+mM9ZkLOvBi?=
 =?iso-8859-1?Q?eB867ZePYGsbzzL+zCIQdClVjBVPkBcruZt8lbok1v9RJIbvv7wKZAqNKw?=
 =?iso-8859-1?Q?B6eAj+EIVTPXUydbaiRiu4hP9VwHOj/zbb2QUz9o0LR41JXWevE7rcwUhO?=
 =?iso-8859-1?Q?RNKWPbyi6VpJvM+uEcftJh/CxlCuoEplV+0+fFVgcfp3hXlGp/OLDqjwe1?=
 =?iso-8859-1?Q?BnvedxDUCa4dVEnbY5aesvQdwlXX1Sp8i/1SjLAsxJr4lWUmkyIJncjejS?=
 =?iso-8859-1?Q?GmTnIZa1ggCmgeLBtMyscxEj/xmzna19IIBrFvYe9cJinaWH3CjPf7c5kg?=
 =?iso-8859-1?Q?u1gYp9sFNl44+C15Np1tlMa+V/pjkOSOzk9+VIvrZ6cOlRvcFz1ihZElvw?=
 =?iso-8859-1?Q?1p2y1vfativPrDGnSSae/4SrLUq2O8h3fs1UJ6Rb4onu3WuT+gyFKrbmgy?=
 =?iso-8859-1?Q?WlkY/67wep1qHur9dUma+2kXTZ/6L1Iee2UCXMvrsg+uC/grbDXX/fZYWf?=
 =?iso-8859-1?Q?iVrjHcxOwpl3nKR/DX4CLjtZ/+eBs3StiVkieiMl0yF1zRUJ6N8K9ouBYK?=
 =?iso-8859-1?Q?/+GLpAD2kMGftJpvnjV5XimcaYrh5LUTGpbhSzOqzdAETQywodS1uK2rtM?=
 =?iso-8859-1?Q?g9Df99tgl0sgxzUCDLM8TEfVp2TI92prn5MGZPf/XdZKosaTknTdGGQ05B?=
 =?iso-8859-1?Q?oPjhqeBdt7H3eq2fwR2fFH192C/NTZe8wb7JZucimCFbj06HIoXdL84/XT?=
 =?iso-8859-1?Q?0B3Xy94f1gBEE94lQF3zftYT1U9W55tY/FXItmXPlOXLTleKUgIOpNuEaP?=
 =?iso-8859-1?Q?2dV+F3cW7bohCnS/bR1AutsQcdtRqMAmZca2gVeIBtthtWJwjNAl/aZ87C?=
 =?iso-8859-1?Q?FLs3pjRovrfXZCd8y1uPLDdcezY59YoWF3fS8gZI60236qysT+nNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mPABjKOrOvN0KFNMR1GWXQ3ZdXT7d6vv5FLlndj6Y1W3I+9K7sXjyL8Be1?=
 =?iso-8859-1?Q?CVeZ5eopMIY2eHBXRaA0ypR0ov34YcMdk+hpPLLLrMnfNMswvKB+qCLgWU?=
 =?iso-8859-1?Q?0FM5pZIQawXO2hoN6AaRGTW+cvYyARnAfbGS8qZ9APmIm0BYjn1MVzgala?=
 =?iso-8859-1?Q?ef+w09WwJdztPFcqf9p8NTpgdkMFrztST+ur/AHbuqJUXw/K00D6RK2cXu?=
 =?iso-8859-1?Q?KdWvjYu/Z86JplHKzuvjpLMQ19yA5wUsInuqgVCdR+x6a42F6bHTYB2iyC?=
 =?iso-8859-1?Q?ERmF49WFt7FEuiJNjBatjgIdEbebadzoULn41Wd7TQMA3VcoELFv/Kvy7W?=
 =?iso-8859-1?Q?v4JHoFd5O/GCE+DdGKPt2pE45eZOb0YMSZgA7ZpJEZizSVE93WhGvoZVjv?=
 =?iso-8859-1?Q?bXAAsOGnJBdo2H7bp/ZRT6iRnq3SqK+pDGMHAmdxwMJ3RrZMMAz61kTiSG?=
 =?iso-8859-1?Q?KAktqK1ZysVsfuCPJly5HXvKB1QG6/qKErXD2oaNJ//SICt8eXfu+HVJPQ?=
 =?iso-8859-1?Q?IlgDD3SedX3/0oHZAQ74NP6QE3aI6iF6AvGp1lrjtVGDsCu85sHG452rCK?=
 =?iso-8859-1?Q?TtssVJaAL0BU2/CGD5q9JoQ9K3iAJ2pbQrGCo+pNTRj+rRlOkWfPZIVsPJ?=
 =?iso-8859-1?Q?SbI3d4Qg+ZYSNXJaynLEdmEkEqPuv2aj2LBtX4HgrbniAN0GV6hYaiVnHD?=
 =?iso-8859-1?Q?beSWBD+Hea/pFLwXecv+SHwzghOhIC9dsF6450HO8Iyq/kXA6eWWHhuRdR?=
 =?iso-8859-1?Q?HPEWf0A34q/iEytB2N9pNpEc6KdC8I00G6Spqg/ZewGYz74y5jesPsKVRS?=
 =?iso-8859-1?Q?W4u4qfl4vV5cxaR1HNiASnAqAFCVTyktYSEKbPBdwS2dmzzDL6t01SS57i?=
 =?iso-8859-1?Q?wnwRkT7Xh6DzdOgvE+pvSC0rSrveh7DWoR9TtVj0W3smGMLv9nWTDl09/1?=
 =?iso-8859-1?Q?Bn8FsPLxZzBNFVdobJv80s6SdZlG7B/BS2rDNWnO0roJMkisK9B5NyScz4?=
 =?iso-8859-1?Q?Gj6zp0/0n61BrneRQfvj5Z340QUZuobX4CGadXFqtNqZtL/MX8+PLO+1X5?=
 =?iso-8859-1?Q?ND/gSbxZUDBAPuQ23sXm4VJ3nx9hD1B04KvFv7gP8q9NSBu4JmuNR8ZtA1?=
 =?iso-8859-1?Q?np7/ghMEsIXZlZFSj6MtMOwV7V8LJn1CrIlei8LUP6r0UAVaAfn6vWIhG+?=
 =?iso-8859-1?Q?i13jEsoxtMcd/V2F7JYwBf6K7z3o4+6iDIFTSHfJERGNjgi/5QmP7HYdrl?=
 =?iso-8859-1?Q?qIos9TqrFgjUxISxrt4fj0NiQ8dGtarXo2ppLF3idp5KyueX6RhvnIxqfp?=
 =?iso-8859-1?Q?OTqRnL3mAEQ6f1gECmWxDEwz4Uj/MVKNJNm5XMf2FfXbM0ueo6MTgi0S/w?=
 =?iso-8859-1?Q?ANPyBhxrU2CVvAKCxA1JofUqr+pfw1MextEG0ZVZzLUd0tc2PxsDfOp52b?=
 =?iso-8859-1?Q?oBCqo0tIChFkYtu3Bxd4q9ZyirrsTFxVtaVhX7UPUgvWfmcViVhP3FEKc+?=
 =?iso-8859-1?Q?Rs1ahaf0ksJ3QdlwQbZeqceRSdc7Vhavv6ucZLKfzw7agy5jtqRhC+1/6s?=
 =?iso-8859-1?Q?t4QapE7ggKQ9XCWbRamMjMxwNEY24xB5l6NBTDw6L5ZDtI5xElK4x4NYcC?=
 =?iso-8859-1?Q?elwy/gKWFhZMjTSUEt/yZgEaEMfbZszaPQLIoKv54Ayr2gg5PpYEuiQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e6c21a-deba-4279-8e9c-08dcd332d957
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 13:57:33.4928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKcYLmUJwrNQfNsu8uuxm0IaOSCVgHf4B+hao25tUumLkvDJ0j2x8jvJVDBTklqQy5y6rcDPLdSQmWeDfyin8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
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

On Wed, Sep 11, 2024 at 12:59:54PM -0700, John Harrison wrote:
> On 9/11/2024 12:54, Souza, Jose wrote:
> > On Wed, 2024-09-11 at 12:35 -0700, John Harrison wrote:
> > > On 9/11/2024 12:30, Souza, Jose wrote:
> > > > On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
> > > > > On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
> > > > > > On 9/10/2024 12:43, Lucas De Marchi wrote:
> > > > > > > On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
> > > > > > > > On 9/6/2024 19:06, John Harrison wrote:
> > > > > > > > > On 9/5/2024 20:04, Lucas De Marchi wrote:
> > > > > > > > > > On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
> > > > > > > > > > > On 9/5/2024 18:54, Lucas De Marchi wrote:
> > > > > > > > > > > > On Thu, Sep 05, 2024 at 01:50:58PM GMT,
> > > > > > > > > > > > John.C.Harrison@Intel.com wrote:
> > > > > > > > > > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > There is a need to include the GuC log and other large
> > > > > > > > > > > > > binary objects
> > > > > > > > > > > > > in core dumps and via dmesg. So add a helper for dumping
> > > > > > > > > > > > > to a printer
> > > > > > > > > > > > > function via conversion to ASCII85 encoding.
> > > > > > > > > > > > why are we not dumping the binary data directly to devcoredump?
> > > > > > > > > > > As per earlier comments, there is a WiFi driver or some such
> > > > > > > > > > > that does exactly that. But all they are dumping is a binary
> > > > > > > > > > > blob.
> > > > > > > > > > In your v5 I see you mentioned
> > > > > > > > > > drivers/net/wireless/ath/ath10k/coredump.c, but that is a
> > > > > > > > > > precedence for
> > > > > > > > > > including it as is from the device rather converting it to ASCII85 or
> > > > > > > > > > something else. It seems odd to do that type of conversion in kernel
> > > > > > > > > > space when it could be perfectly done in userspace.
> > > > > > > > > It really can't. An end user could maybe be expected to zip or
> > > > > > > > > tar a coredump file before attaching it to a bug report but they
> > > > > > > > > are certainly not going to try to ASCII85 encode random bits of
> > > > > > > > > it. Whereas, putting that in the kernel means it is just there.
> > > > > > > > > It is done. And it is pretty trivial - just call a helper
> > > > > > > > > function and it does everything for you. Also, I very much doubt
> > > > > > > > > you can spew raw binary data via dmesg. Even if the kernel would
> > > > > > > > > print it for you (which I doubt), the user tools like syslogd
> > > > > > > > > and dmesg itself are going to filter it to make it ASCII safe.
> > > > > > > > > 
> > > > > > > > > The i915 error dumps have been ASCII85 encoded using the
> > > > > > > > > kernel's ASCII85 encoding helper function since forever. This
> > > > > > > > > patch is just a wrapper around the kernel's existing
> > > > > > > > > implementation in order to make it more compatible with printing
> > > > > > > > > to dmesg. This is not creating a new precedent. It already
> > > > > > > > > exists.

No! no big dump in dmesg.

> > > > > > > > > 
> > > > > > > > > > $ git grep ascii85.h
> > > > > > > > > > drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
> > > > > > > > > > drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
> > > > > > > > > > drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
> > > > > > > > > > drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
> > > > > > > > > > drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
> > > > > > > > > And the list of drivers which dump raw binary data in a coredump
> > > > > > > > > file is... ath10k. ASCII85 wins 3 to 1.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > > We want the devcoredump file to still be human readable.
> > > > > > > > > > > That won't be the case if you stuff binary data in the
> > > > > > > > > > > middle of it. Most obvious problem - the zeros in the data
> > > > > > > > > > > will terminate your text file at that point. Potentially
> > > > > > > > > > > bigger problem for end users - random fake ANSI codes will
> > > > > > > > > > > destroy your terminal window if you try to cat the file to
> > > > > > > > > > > read it.
> > > > > > > > > > Users don't get a coredump and cat it to the terminal.
> > > > > > > > > > =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Lucas De Marchi
> > > > > > > > > They might. Either intentionally or accidentally. I've certainly
> > > > > > > > > done it myself. And people will certainly want to look at it in
> > > > > > > > > any random choice of text editor, pager, etc. 'cos you know, it
> > > > > > > > > is meant to be read by humans. If it is full of binary data then
> > > > > > > > > that becomes even more difficult than simply being full of ASCII
> > > > > > > > > gibberish. No matter what you are doing, the ASCII version is
> > > > > > > > > safer and easier to look at the rest of the file around it.
> > > > > > > > > 
> > > > > > > > > I don't understand why you are so desperate to have raw binary
> > > > > > > > > data in the middle of a text file. The disadvantages are
> > > > > > > > > multiple but the only advantage is a slightly smaller file. And
> > > > > > > > > the true route to smaller files is to add compression like we
> > > > > > > > > have in i915.
> > > > > > > > > 
> > > > > > > > > John.
> > > > > > > > > 
> > > > > > > > PS: Also meant to add that one of the important uses cases for
> > > > > > > > dumping logs to dmesg is for the really hard to repro bugs that
> > > > > > > > show up in CI extremely rarely. We get the driver to dump an error
> > > > > > > > capture to dmesg and pull that out from the CI logs. Even if you
> > > > > > > > could get binary data through dmesg, pretty sure the CI tools
> > > > > > > > would also not be happy with it. Anything non-printable will get
> > > > > > > > munged for sure when turning it into a web page.
> > > > > > > I think that's the main source of confusion on what we are discussing.
> > > > > > > I was not talking about dmesg at all. I'm only complaining about feeding
> > > > > > > ascii85-encoded data into a *devcoredump* when apparently there isn't a
> > > > > > > good reason to do so. I'd rather copy the binary data to the
> > > > > > > devcoredump.
> > > > > > But the intent is to dump a devcoredump to dmesg. It makes much sense
> > > > > It seems like an awful idea to dump hundreds of MB to dmesg.  When we
> > > > > talked about printing to dmesg it was about **GuC log** and on very
> > > > > initial states of driver probe where we didn't actually have a good
> > > > > interface for that. And the log wouldn't be so big. If we can already
> > > > > capture the devcoredump, what would be the reason to dump to dmesg
> > > > > (other than the non-valid "our CI captures dmesg, and doesn't
> > > > > capture devcoredump", which should be fixed).
> > > > > 
> > > > > If any sysadmin have their serial console flooded by such garbage there
> > > > > are 2 reactions: 1) someone got in control of my machine; 2) something
> > > > > went really bad with this machine. It's not "fear not, wait for it to
> > > > > complete, it's just normal debug data I will attach to an issue in
> > > > > gitlab".  And I'm mentioning a serial console here due to that
> > > > > cond_resched() added, which is only needed because you are trying to do
> > > > > in kernel space what should be in userspace.
> > > > > 
> > > > > Oh well... looking at this the main reason to use ascii85 I can see is
> > > > > because we already have parts of *our* devcoredump using it, and
> > > > > userspace relying on that. That's new to me. Let's stop bringing dmesg
> > > > > into this discussion.
> > > > > 
> > > > > > to have a single implementation that can be used for multiple
> > > > > > purposes. Otherwise you are duplicating a lot of code unnecessarily.
> > > > > > 
> > > > > > And I still think it is a *very* bad idea to be including binary data
> > > > > > in a text file. The devcoredump is supposed to be human readable. It
> > > > > no, it's not. devcoredump doesn't dictate the format, it's up to the
> > > > > drivers to do that. See their documentation.
> > > > > 
> > > > > > is supposed to be obtained by end users and passed around. Having
> > > > > > binary data in there just makes everything more complex and error
> > > > > > prone. We want this to be as simple, easy and safe as possible.
> > > > > > 
> > > > > > > For dmesg, there's a reason to encode it as you pointed out... but
> > > > > > > no users shouldn't actually see it - we should be getting all of those
> > > > > > > cases in CI. For the escape scenarios, yeah... better having it
> > > > > > > ascii85-encoded.
> > > > > > > 
> > > > > > > What you are adding to devcoredump also doesn't even seem to be an
> > > > > > > ascii85 representation, but a multiple lines that should be concatenated
> > > > > > > to form the ascii85 representation. For dmesg it makes sense. Not for
> > > > > > > devcoredump.  We should also probabaly need a length field (correctly
> > > > > > > accounting for the additional characters for each line) so we don't
> > > > > > > have an implicit dependency on what's the next field to know how much to
> > > > > > > parse.
> > > > > > The decoding is pretty trivial given that line feeds are not part of
> > > > > > the ASCII85 character set and so can just be dropped. Besides The
> > > > > > output is already not 'pure' ASCII85 because the ASCII85 data is
> > > > > > embedded within a devcoredump. There is all sorts of other text about,
> > > > > > including on the start of the line. There are multiple ASCII85 blobs
> > > > > > in there that need to be decoded separately. This is nothing new to my
> > > > > > patch set. All of that is already there. And as per comments on the
> > > > > > previous devcoredump patches from Matthew B, the object data can many
> > > > > > hundreds of MBs in size. Yet no-one batted an eyelid when that was
> > > > > > added. So why the sudden paranoia about adding a couple of MB of GuC
> > > > > > log in the same form?
> > > > > I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
> > > > > HWSP and HWCTX").  Probably because I haven't seen that commit doing an
> > > > > ascii85 encoding before, otherwise I'd have similar review feedback.
> > > > > 
> > > > > Looking at this just now, so I will also have to balance the previous
> > > > > users and existing userspace consuming it.
> > > > > 
> > > > > +José, would it be ok from the userspace POV to start adding the \n?
> > > > > Then we can at least have all fields in our devcoredump to follow the
> > > > > same format. Are these the decoder parts on the mesa side?
> > > > > 
> > > > > 	src/intel/tools/aubinator_error_decode.c
> > > > > 	src/intel/tools/error2hangdump.c?
> > > > > 
> > > > >    From a quick look, read_xe_data_file() already continues the previous
> > > > > topic when it reads a newline, but the parsers for HWCTX and HWSP
> > > > > seems to expect to to have the entire topic in a single line. But I may
> > > > > be missing something.
> > > > Sorry I'm not following up this thread.
> > > > Add a '\n' where exactly?
> > > To break very long ASCII85 streams across multiple lines. That will
> > > allow the devcoredump file to output via dmesg for the situations where
> > > reading from sysfs is not possible.
> > > 
> > > This patch is adding an ASCII85 encoding helper that is more friendly to
> > > output via dmesg. The patch does not currently change the existing
> > > ASCII85 encodings of VMs and hw contexts. However, the intention would
> > > be to update that code to use this helper eventually.
> > It will break the parser and I don't think we are allowed to break it at this point.
> The intent has always been to add compression as we had in i915. That will
> presumably also break the parser. Although I'm not seeing how a debug log
> parser counts as critical user space that must not ever be broken.

We shouldn't be breaking the current userspace tools. Any change like this would
need to be synchronized between all the current decode tools.

> 
> > What I can suggest is add another sysfs with a coredump that skips the binary dumps so it is readable by humans.
> That will just lead to confusion and problems with people sending the wrong
> file. This needs to be kept as simple and error-proof as possible.

Perhaps it is time for us to convince devcoredump folks to accept
multiple files like nvme folks were asking a while ago? [1]

[1] - https://lore.kernel.org/lkml/1557676457-4195-4-git-send-email-akinobu.mita@gmail.com/

> 
> John.
> 
> > 
> > > John.
> > > 
> > > > > Lucas De Marchi
> > > > > 
> > > > > > And again, arbitrarily long lines (potentially many thousands of
> > > > > > characters wide) in a text file can cause problems. Having it line
> > > > > > wrapped gets rid of those potential problems and so is safer. Anything
> > > > > > that reduces the risk of an error report being broken is a good thing
> > > > > > IMHO. Robustness is worthwhile!
> > > > > > 
> > > > > > John.
> > > > > > 
> > > > > > > Lucas De Marchi
> > > > > > > 
> > > > > > > > John.
> > > > > > > > 
> 
