Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D59C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3EE10E369;
	Tue, 27 Aug 2024 16:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTGLN7u7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878D10E369
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724776713; x=1756312713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OGJjsQ2y5kZKqcmz2+8z8bZIg0scWspsyonAiSaQYUk=;
 b=iTGLN7u7tKHwdaIzhQLnh2XrcolBbLu+ChIS/L03ZnN1/ahfaxrY5Kkh
 9n4BKeywQz6R8rqW5u4dZhb2CEn3T22KzohfKLHWWbJZnOwErtdAZ/p9O
 Zxoxme5Xp2SQXsbPptbIx4zZ+kCtYqh96OmIdHHRzblkM9Gzkb1OYL0XU
 pRoxhWW5SDyViAJJRfeJTp8YERPKE1/Kz7gt8kIxmOvb53nvhCDxoc1GV
 pprDDdYLXAX6VVlkq1ZDuVKHerC6T5stW+GgxRn3tHYB8xMhvlSheFDlQ
 UMKCb2y+KaBRldzusbZZCo73MmTs4lnx/B+JYL3c89tWDHQqSW1jzFHEt w==;
X-CSE-ConnectionGUID: /p8sw3fPTemn8oF+eZb7oA==
X-CSE-MsgGUID: /WBZgNvOT0aXCeFhg1e2SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45785325"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45785325"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:38:33 -0700
X-CSE-ConnectionGUID: a1OypuizSMK+tSRzbmj3fg==
X-CSE-MsgGUID: us318+EdSjeDB2n/7FV0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63634918"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 09:38:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:38:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 09:38:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 09:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtorL273693xCkUtURzunTt7pke7zFTv+bsKS0hzfMoEA3DAtkZ+z7oG9d5jVjmYYfZSEF166a3fbi5GJ+gIAFvki3lMh0y8c41MSHf7rG0zQOX/qVKUk9sACF2iM/W3jMjedwrZ1JQddCn2LovNPqqFV4RgHWaGUJfYO/+LSEWxqeAr4jPMw2vsVuFYXS8/E9Ax8V0mNF9Ilk3mvkSuq7KFUB5QIm0YzkzSqS8MhOb++36mAMqHadWY4Qb7SCNqYmvpuyw3LQ46z4/k14iQaBzczNPsoUSO/2rGKz2I6zt1omCOjES+tlUuaYw6BbLGBe8G7coslpFnC5n0zdYAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLete/BiN9WH95bdEPNlBzqvaAFxkemnD4Ez7bgOrxM=;
 b=C9qaYUytXoFWCcAJrSxvK5XBFOH1RDq+bENm7Zs5Y85Fql5EAVWjzjDH6201HZ3rHSBH5MMfbNoQVmpz1t7ubsqi3jDzNihdbwmhoflP09IvjuH8RHARZ18QljK1Z6b/hVM0N+20bY9+W4ky5cP/ur6U2cq8Zkw1vKbNAG4PYCB4vUxrLaob25RRhrJLBp9kcZDGNC8l+z+Uzk0tfOJGnEuJEet9NB/LMuzZH2yq10Wm1xW2Z5fziPaDFua/acxDoJyh0NAGRz4e7FnN3GxZDQCyq0DUiF3uV5pYNgAH6rTvDYyPAuy8oerznANibK0jMjCCAzajP1dRmuWv38u2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 16:38:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 27 Aug 2024
 16:38:27 +0000
Date: Tue, 27 Aug 2024 16:37:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
Message-ID: <Zs4AtRQAyYFECBIn@DUT025-TGLU.fm.intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
 <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
 <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
 <Zsy5p5w8nqMmIwwU@DUT025-TGLU.fm.intel.com>
 <5977a4c4584f1ea755364253f3ec872f384808b9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5977a4c4584f1ea755364253f3ec872f384808b9.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: f7979d90-ad4a-492f-0e68-08dcc6b6ad80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Fkp2VHRCr9KV/w6qDIEC+0dUA0QRgwNW3G2zetwnAGPHZyVIICKtZs80i8?=
 =?iso-8859-1?Q?KZeY9jhEZjjhTcI07G22DZF2Brkef+hxAO5kYbjBVwZytX4uJb8BKoE2JM?=
 =?iso-8859-1?Q?nT32hZvOKM1gDylvjo5Ctt+Y6grSpyySxYahey6C6BGeSzwkSaQeAOJkIA?=
 =?iso-8859-1?Q?rdOGBznCC2PL7UEoasTBwbTurIi4NWbAG4iyqTVsh7fefIP/I7/xZHAAvd?=
 =?iso-8859-1?Q?mRSd9J7KTmlxAfDmmC/NortaAtdta6BaXKDHC8cfB7zO2PfCu1CmefTgSZ?=
 =?iso-8859-1?Q?PjNv6ff69JlIRRcKs8Ss7EccLNCOdPJnW8/khCHxGNoZAcnLRORY9m9qkQ?=
 =?iso-8859-1?Q?0XDRpAZZbktfWrDW7L8DThAVi7GASUFBnApyAhKMLSSK8FNF9hxOGH8X13?=
 =?iso-8859-1?Q?MaVlgxADT0gXtzlD3KJauWFslzPt0KFwzZOsp8Ew5FOrTjU9bWN6ARfhfj?=
 =?iso-8859-1?Q?kzqau282pDXBbgCcTHYOvOUl7sTqzhftvDtF0RF4nuro8ozGG9BQN+9mve?=
 =?iso-8859-1?Q?+nyxAlaZTbsZsql72/F2NX/z3d/V4TYiSbIlR33RdyFXPDOH1/oVWMopBF?=
 =?iso-8859-1?Q?LYn+Hy/NRj4qQsCWHLN7DufZGg1jwW4pEh8DLZ9odNz5EO0lJOvRgkGTAO?=
 =?iso-8859-1?Q?RSSLGdoHjWBOFmiACR4xo51tECcp/7inOjTrYviAjBsa57wmQnzPkM1sFV?=
 =?iso-8859-1?Q?DUxHq6DwpxB5Pwz33LkymCRPYmoE6Tr6A6uMiYuLLCryIimuJs1iMw4btG?=
 =?iso-8859-1?Q?qhY2WTZLPwNWqh5rT58rcRPAlK3VO1ySybZvSE7yz8PrIE/SWj+ToqsjgT?=
 =?iso-8859-1?Q?n/PPbDli3ao6LarX0uG++61aHs207CBoui1V9ZMMfuTf5PldbcuI417Qlj?=
 =?iso-8859-1?Q?HKBiXZSVxuIMMLom3qoOz3UEiEEJV+4bZEzUz6Iw8/6rmB+YuGcUMiVX0e?=
 =?iso-8859-1?Q?xGb1Qe7A+mYdk2l11BsMFdkPPx2BjMpOcqEoaLmsy6MiqMEsWt8TZcZxlQ?=
 =?iso-8859-1?Q?jXiBQw5w2xEg2Rv6Eo8dp2Mpzagibtjiq7KqGs9+RUHVyMnKrH6oIn0rNA?=
 =?iso-8859-1?Q?+6UWgSx/qssMJKr+fD5VWHQ7tSoMxHJ6mVAFgK8wg7b6SeIsc1tHDRq2ql?=
 =?iso-8859-1?Q?OLbyPRMnia0moqy0K/fV1bMyp8sDEqGWdIWbgGuHrETCwvytZQV5FsVLM4?=
 =?iso-8859-1?Q?LwBl/d/+BiKpSMa7ABvS1myRYof+Vz3zxNcQUb4LpNWcDWo9DMC6v4I34u?=
 =?iso-8859-1?Q?ET0PTB7zbekcaBWWAT1yEVIYvq9mgYSfctY4q274ZBgmnZgJgsVE3pvjAd?=
 =?iso-8859-1?Q?1mQlaGj0F5md1nkUbx3ylLVoiRg9oFBOCUenuenChAyYaL/1p69XB6kl+G?=
 =?iso-8859-1?Q?S04ymsjMWgTO/0WzY7da62m4wlvQmGMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BFAvqCgP/kOGMGwF8sEXdi++mpIovTkskRCvgs0IBDfkDxWb6zvc1FII8d?=
 =?iso-8859-1?Q?W4OBYte3APcTnQ9LCFspyMHaGVFY+coSpoV3Pj8yh09HjMU/efVgXRH+Al?=
 =?iso-8859-1?Q?jZY06nCzGzPon2kkCUgpb/6zBKmK4+Nvxpx3hyJV1akfQTmxaP9xgfleOG?=
 =?iso-8859-1?Q?wdhKKl6iUNiJbxhw355GHXi/fHu4ORUo6+fKelYeP4JZKx71RRFNYqZSMs?=
 =?iso-8859-1?Q?zuQzGqqLQQWoXL7lHl25k1Ex4jS+9yu7xrRLvBkZ7kotmJjX54PGQIGffF?=
 =?iso-8859-1?Q?UtHsRHTvSmCYcKV20wsaJTdO9gPcCptL7ColA2KrOHGfjMTcbrXtd54Edn?=
 =?iso-8859-1?Q?ia/CiaC059ZZOJ1qVOXsvQo3U2K8OabN5EUrHoWde6vzttKdvjRDGDgx+5?=
 =?iso-8859-1?Q?nFssYzxnUEMB8pG8McbN/x+HeQ9ry0AO2TFmwiHA+S+RyVhhgVsF/a9Fh8?=
 =?iso-8859-1?Q?+HIxXFT+DRFAHScqrkTBoXR08vech5izpu+r94CDh45H3EPkS1p1SY6fmW?=
 =?iso-8859-1?Q?n5Cqkg4IOa8WrOQdea/Ccs2XvVLNNg6euKbyL36zGxTsiL5SDesw7/S4En?=
 =?iso-8859-1?Q?lACbN6NSCHvgMR8ZnPmkWeJwOFFER76afxWFUhw9f40hsjj06kTThqqKpj?=
 =?iso-8859-1?Q?6TmfAmC2GaeKeDCb1vEnFg7tyDYyHag8f/CJB4XM1/lZCRY7f9LdArVQub?=
 =?iso-8859-1?Q?QfNPOAv3h0E8QqOzJd6xAl/imlvPxfC98bqLKKJj3AV132mJ7RWUmDIXPl?=
 =?iso-8859-1?Q?+MNrdvHibOWJe2jeO7hT8PUbv3BFf2FR+5qlbstg0POEQo8jlFEjT0akMq?=
 =?iso-8859-1?Q?yVWa3QOQ6DQgR+OAM3TLgxdke8OTzuKAysRCMxSSA6nVke14je1CebUYTB?=
 =?iso-8859-1?Q?5hITVrO/yaxEvUh5Zu2olGJKGkeqXyq7yDC9F2LQm0e7iP+Ijx1YV0lM7O?=
 =?iso-8859-1?Q?btZExPxmmVf5GKh/f++VJBfFrEfPxe9oIeYfMw2ETrGdBj6YC6Ml3hC9GX?=
 =?iso-8859-1?Q?uM/IcwzIAahe0ednA+cMnookZqzdnTToLGLAt+ZqCgQZSXToLhKkTZlw+D?=
 =?iso-8859-1?Q?4/ZAFYVNVtQqSbCSEoWGifIeNKk65KDSq3nwvZ8YPHv/qDfAeImUpTr+eu?=
 =?iso-8859-1?Q?re89kjIffS4fNGL7qfKaCsCgcJcg0MYMYcEbcYVooA3+BGMIbDPZ7h2wZG?=
 =?iso-8859-1?Q?CEHSUnGoA6vNYz5XliUrRYhc4ieO6q11e/qo5bRjHGU+QlCCBNwCvtF6kN?=
 =?iso-8859-1?Q?UH0qwCOozpWTL4QkfkiBzoWPijVdIpEf5XiAnubJ6jpXiaNQ5DB0PyayNg?=
 =?iso-8859-1?Q?IRuJygfgzocpGM8UlN7W5DfuhhdzOIumMUhAYQxzxJl9tfEkel/UTGBgOD?=
 =?iso-8859-1?Q?Wc7yeHZNRXUU2GCXrbPHZ0V53Weyqk927MbFg8refLaelYSy5ZPPcMiAhj?=
 =?iso-8859-1?Q?0FYLs+yR9Rzuqwj10pPToSwlHM3jShw+HT3lsjh7ExVWZAoI759GVXgWI4?=
 =?iso-8859-1?Q?eQUAhZ5uo++NVt+XDzGGXGOD3MyYDgyuGx9lYLHO8AKoY9zcQ6R0wO3VBw?=
 =?iso-8859-1?Q?Ji49WgjzE5RHNF5OIB6haOhLt5myNWcKYH6UNXhG5Kp+Lq/SHIa36HO9KT?=
 =?iso-8859-1?Q?ZNm9vdzH2Vv7ifYIkLKzpmsy3wk0VNUNXv+GI3OedmaXYEpkQJE+MVfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7979d90-ad4a-492f-0e68-08dcc6b6ad80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 16:38:27.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZWIfjxJsPG6I5TKPhRWLtRYc3uRRtTzMFm9N9t5Tns0n+FYYuEn4mo+Tkat82cWrrMM1sIarWI3hyWrI7u6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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

On Tue, Aug 27, 2024 at 11:35:33AM +0200, Thomas Hellström wrote:
> On Mon, 2024-08-26 at 17:21 +0000, Matthew Brost wrote:
> > On Mon, Aug 26, 2024 at 10:36:24AM +0200, Thomas Hellström wrote:
> > > On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
> > > > Hi Thomas,
> > > > 
> > > > On 8/23/2024 11:38 AM, Thomas Hellström wrote:
> > > > > Hi, Nirmoy,
> > > > > 
> > > > > On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
> > > > > > Implement GPU clear-on-free for pooled system pages in Xe.
> > > > > > 
> > > > > > Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by
> > > > > > leveraging
> > > > > > ttm_device_funcs.release_notify() for GPU clear-on-free. If
> > > > > > GPU
> > > > > > clear
> > > > > > fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
> > > > > > 
> > > > > > Clear-on-free is only relevant for pooled pages as driver
> > > > > > needs
> > > > > > to
> > > > > > give
> > > > > > back those pages. So do clear-on-free only for such BOs and
> > > > > > keep
> > > > > > doing
> > > > > > clear-on-alloc for ttm_cached type BOs
> > > > > > 
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > > > While this would probably work, I don't immediately see the
> > > > > benefit
> > > > > over CPU clearing, since we have no way of combining this with
> > > > > the
> > > > > CCS
> > > > > clear, right?
> > > > 
> > > > 
> > > > If XE/ttm could do clear-on-free(data+CCS) with GPU all the time
> > > > then
> > > > I 
> > > > think we could
> > > > 
> > > > skip ccs clearing on alloc, assuming only GPU access modifies a
> > > > CCS 
> > > > state and on boot CCS region
> > > > 
> > > > is zeroed. I think that can't be guaranteed so we have to clear
> > > > ccs
> > > > on 
> > > > alloc. I agree, there won't be much
> > > > 
> > > > latency benefit of doing clear-on-free for ccs devices. I will
> > > > still
> > > > try 
> > > > to run some tests to validate it, I have done that for this RFC.
> > > 
> > > OK, yes this would probably work. Do we need to clear all CCS on
> > > module
> > > load or can we safely assume that no useful info is left in the CCS
> > > memory at that time?
> > > 
> > > > 
> > > > 
> > > > I've discussed this with Ron and it seems there is on going
> > > > conversation 
> > > > if there is a way to avoid ccs clearing if data is zeroed.
> > > > 
> > > > Let's see how that goes.
> > > > 
> > > > 
> > > > >   So the clearing latency will most probably be increased,
> > > > > but the bo releasing thread won't see that because the waiting
> > > > > for
> > > > > clear is offloaded to the TTM delayed destroy mechanism.
> > > > > 
> > > > > Also, once we've dropped the gem refcount to zero, the gem
> > > > > members
> > > > > of
> > > > > the object, including bo_move, are strictly not valid anymore
> > > > > and
> > > > > shouldn't be used.
> > > > 
> > > > 
> > > > Could you please  expand this? I am not seeing the connection
> > > > between
> > > > bo_move and refcount.
> > > > 
> > > > Are you saying release_notify is not the right place to do this ?
> > > 
> > > Yes. At release_notify, the gem refcount has dropped to zero, and
> > > we
> > > don't allow calling bo_move at that point, as the driver might want
> > > to
> > 
> > But this patch isn't calling bo_move - it directly calls
> > xe_migrate_clear. As far I can tell this function only touches TTM
> > owned
> > fields (e.g. ttm_resource and ttm_tt). I would think that should be
> > safe
> > as there shouldn't be fully released until release_notify returns.
> 
> Yes, hmm, I incorrectly got the impression that release_notify called
> bo_move to do the clearing.
> 
> Anyway as long as we can clear using only the struct ttm_buffer_object
> base class we should be safe.
> 

Agree. I think to be parniod and safe we likely should drop the BO
argument from the clear function passing only the required TTM fields +
add comment no gem BO fields can be touched.

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > do some cleanup in the gem_release before putting the last ttm_bo
> > > reference.
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > > 
> > > > > If we want to try to improve freeing latency by offloading the
> > > > > clearing
> > > > > on free to a separate CPU thread, though, maybe we could
> > > > > discuss
> > > > > with
> > > > > Christian to always (or if a flag in the ttm device requests
> > > > > it)
> > > > > take
> > > > > the TTM delayed destruction path for bos with pooled pages,
> > > > > rather
> > > > > than
> > > > > to free them sync, something along the lines of:
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > index 320592435252..fca69ec1740d 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref
> > > > > *kref)
> > > > >   
> > > > >                  if (!dma_resv_test_signaled(bo->base.resv,
> > > > >                                             
> > > > > DMA_RESV_USAGE_BOOKKEEP) ||
> > > > > -                   (want_init_on_free() && (bo->ttm != NULL))
> > > > > ||
> > > > > +                   (bo->ttm && (want_init_on_free() || bo-
> > > > > >ttm-
> > > > > > caching != ttm_cached)) ||
> > > > >                      bo->type == ttm_bo_type_sg ||
> > > > >                      !dma_resv_trylock(bo->base.resv)) {
> > > > >                          /* The BO is not idle, resurrect it
> > > > > for
> > > > > delayed
> > > > > destroy */
> > > > > 
> > > > > Would ofc require some substantial proven latency gain, though.
> > > > > Overall
> > > > > system cpu usage would probably not improve.
> > > > 
> > > > 
> > > > I will run some tests with the above change and get back.
> > > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > Nirmoy
> > > > 
> > > > > 
> > > > > /Thomas
> > > > > 
> > > > > 
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_bo.c | 101
> > > > > > +++++++++++++++++++++++++++++++++--
> > > > > > --
> > > > > >   1 file changed, 91 insertions(+), 10 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index 6ed0e1955215..e7bc74f8ae82 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -283,6 +283,8 @@ struct xe_ttm_tt {
> > > > > >   	struct device *dev;
> > > > > >   	struct sg_table sgt;
> > > > > >   	struct sg_table *sg;
> > > > > > +	bool sys_clear_on_free;
> > > > > > +	bool sys_clear_on_alloc;
> > > > > >   };
> > > > > >   
> > > > > >   static int xe_tt_map_sg(struct ttm_tt *tt)
> > > > > > @@ -401,8 +403,23 @@ static struct ttm_tt
> > > > > > *xe_ttm_tt_create(struct
> > > > > > ttm_buffer_object *ttm_bo,
> > > > > >   	 * flag. Zeroed pages are only required for
> > > > > > ttm_bo_type_device so
> > > > > >   	 * unwanted data is not leaked to userspace.
> > > > > >   	 */
> > > > > > -	if (ttm_bo->type == ttm_bo_type_device && xe-
> > > > > > > mem.gpu_page_clear_sys)
> > > > > > -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > > +	if (ttm_bo->type == ttm_bo_type_device && xe-
> > > > > > > mem.gpu_page_clear_sys) {
> > > > > > +		/*
> > > > > > +		 * Non-pooled BOs are always clear on alloc
> > > > > > when
> > > > > > possible.
> > > > > > +		 * clear-on-free is not needed as there is
> > > > > > no
> > > > > > pool
> > > > > > to give pages back.
> > > > > > +		 */
> > > > > > +		if (caching == ttm_cached) {
> > > > > > +			tt->sys_clear_on_alloc = true;
> > > > > > +			tt->sys_clear_on_free = false;
> > > > > > +		} else {
> > > > > > +		/*
> > > > > > +		 * For pooled BO, clear-on-alloc is done by
> > > > > > the
> > > > > > CPU
> > > > > > for now and
> > > > > > +		 * GPU will do clear on free when releasing
> > > > > > the
> > > > > > BO.
> > > > > > +		 */
> > > > > > +			tt->sys_clear_on_alloc = false;
> > > > > > +			tt->sys_clear_on_free = true;
> > > > > > +		}
> > > > > > +	}
> > > > > >   
> > > > > >   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > > > caching,
> > > > > > extra_pages);
> > > > > >   	if (err) {
> > > > > > @@ -416,8 +433,10 @@ static struct ttm_tt
> > > > > > *xe_ttm_tt_create(struct
> > > > > > ttm_buffer_object *ttm_bo,
> > > > > >   static int xe_ttm_tt_populate(struct ttm_device *ttm_dev,
> > > > > > struct
> > > > > > ttm_tt *tt,
> > > > > >   			      struct ttm_operation_ctx *ctx)
> > > > > >   {
> > > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > >   	int err;
> > > > > >   
> > > > > > +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> > > > > >   	/*
> > > > > >   	 * dma-bufs are not populated with pages, and the
> > > > > > dma-
> > > > > >   	 * addresses are set up when moved to XE_PL_TT.
> > > > > > @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
> > > > > > ttm_device
> > > > > > *ttm_dev, struct ttm_tt *tt,
> > > > > >   		return 0;
> > > > > >   
> > > > > >   	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to
> > > > > > clear
> > > > > > system pages */
> > > > > > -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> > > > > > +	if (xe_tt->sys_clear_on_alloc)
> > > > > >   		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
> > > > > >   
> > > > > >   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> > > > > > @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
> > > > > > ttm_device
> > > > > > *ttm_dev, struct ttm_tt *tt,
> > > > > >   
> > > > > >   static void xe_ttm_tt_unpopulate(struct ttm_device
> > > > > > *ttm_dev,
> > > > > > struct
> > > > > > ttm_tt *tt)
> > > > > >   {
> > > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > > +
> > > > > > +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> > > > > > +
> > > > > >   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > > > > >   		return;
> > > > > >   
> > > > > >   	xe_tt_unmap_sg(tt);
> > > > > >   
> > > > > > +	/* Hint TTM pool that pages are already cleared */
> > > > > > +	if (xe_tt->sys_clear_on_free)
> > > > > > +		tt->page_flags |=
> > > > > > TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > > +
> > > > > >   	return ttm_pool_free(&ttm_dev->pool, tt);
> > > > > >   }
> > > > > >   
> > > > > > @@ -664,6 +691,7 @@ static int xe_bo_move(struct
> > > > > > ttm_buffer_object
> > > > > > *ttm_bo, bool evict,
> > > > > >   	struct ttm_resource *old_mem = ttm_bo->resource;
> > > > > >   	u32 old_mem_type = old_mem ? old_mem->mem_type :
> > > > > > XE_PL_SYSTEM;
> > > > > >   	struct ttm_tt *ttm = ttm_bo->ttm;
> > > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > >   	struct xe_migrate *migrate = NULL;
> > > > > >   	struct dma_fence *fence;
> > > > > >   	bool move_lacks_source;
> > > > > > @@ -674,12 +702,13 @@ static int xe_bo_move(struct
> > > > > > ttm_buffer_object
> > > > > > *ttm_bo, bool evict,
> > > > > >   	bool clear_system_pages;
> > > > > >   	int ret = 0;
> > > > > >   
> > > > > > +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > > > ttm);
> > > > > >   	/*
> > > > > >   	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation
> > > > > > path
> > > > > > when
> > > > > >   	 * moving to system as the bo doesn't have
> > > > > > dma_mapping.
> > > > > >   	 */
> > > > > >   	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> > > > > > -		ttm->page_flags &=
> > > > > > ~TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > > +		xe_tt->sys_clear_on_alloc = false;
> > > > > >   
> > > > > >   	/* Bo creation path, moving to system or TT. */
> > > > > >   	if ((!old_mem && ttm) && !handle_system_ccs) {
> > > > > > @@ -703,10 +732,9 @@ static int xe_bo_move(struct
> > > > > > ttm_buffer_object
> > > > > > *ttm_bo, bool evict,
> > > > > >   	move_lacks_source = handle_system_ccs ? (!bo-
> > > > > > > ccs_cleared)
> > > > > > :
> > > > > >   						(!mem_type_i
> > > > > > s_vr
> > > > > > am(o
> > > > > > ld_mem_type) && !tt_has_data);
> > > > > >   
> > > > > > -	clear_system_pages = ttm && (ttm->page_flags &
> > > > > > TTM_TT_FLAG_CLEARED_ON_FREE);
> > > > > > +	clear_system_pages = ttm && xe_tt-
> > > > > > >sys_clear_on_alloc;
> > > > > >   	needs_clear = (ttm && ttm->page_flags &
> > > > > > TTM_TT_FLAG_ZERO_ALLOC) ||
> > > > > > -		(!ttm && ttm_bo->type == ttm_bo_type_device)
> > > > > > ||
> > > > > > -		clear_system_pages;
> > > > > > +		(!ttm && ttm_bo->type == ttm_bo_type_device)
> > > > > > ||
> > > > > > clear_system_pages;
> > > > > >   
> > > > > >   	if (new_mem->mem_type == XE_PL_TT) {
> > > > > >   		ret = xe_tt_map_sg(ttm);
> > > > > > @@ -1028,10 +1056,47 @@ static bool
> > > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > > *ttm_bo)
> > > > > >   	return locked;
> > > > > >   }
> > > > > >   
> > > > > > +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
> > > > > > ttm_buffer_object *ttm_bo)
> > > > > > +{
> > > > > > +	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
> > > > > > +	struct xe_device *xe = xe_bo_device(bo);
> > > > > > +	struct xe_migrate *migrate;
> > > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > > +	struct dma_fence *clear_fence;
> > > > > > +
> > > > > > +	/* return early if nothing to clear */
> > > > > > +	if (!ttm_bo->ttm)
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > > > ttm);
> > > > > > +	/* return early if nothing to clear */
> > > > > > +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	if (XE_WARN_ON(!xe_tt->sg))
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	if (bo->tile)
> > > > > > +		migrate = bo->tile->migrate;
> > > > > > +	else
> > > > > > +		migrate = xe->tiles[0].migrate;
> > > > > > +
> > > > > > +	xe_assert(xe, migrate);
> > > > > > +
> > > > > > +	clear_fence = xe_migrate_clear(migrate, bo, bo-
> > > > > > > ttm.resource,
> > > > > > +				      
> > > > > > XE_MIGRATE_CLEAR_FLAG_FULL);
> > > > > > +	if (IS_ERR(clear_fence))
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	xe_tt->sys_clear_on_free = false;
> > > > > > +
> > > > > > +	return clear_fence;
> > > > > > +}
> > > > > > +
> > > > > >   static void xe_ttm_bo_release_notify(struct
> > > > > > ttm_buffer_object
> > > > > > *ttm_bo)
> > > > > >   {
> > > > > >   	struct dma_resv_iter cursor;
> > > > > > -	struct dma_fence *fence;
> > > > > > +	struct dma_fence *clear_fence, *fence;
> > > > > >   	struct dma_fence *replacement = NULL;
> > > > > >   	struct xe_bo *bo;
> > > > > >   
> > > > > > @@ -1041,15 +1106,31 @@ static void
> > > > > > xe_ttm_bo_release_notify(struct
> > > > > > ttm_buffer_object *ttm_bo)
> > > > > >   	bo = ttm_to_xe_bo(ttm_bo);
> > > > > >   	xe_assert(xe_bo_device(bo), !(bo->created &&
> > > > > > kref_read(&ttm_bo->base.refcount)));
> > > > > >   
> > > > > > +	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
> > > > > > +
> > > > > >   	/*
> > > > > >   	 * Corner case where TTM fails to allocate memory
> > > > > > and
> > > > > > this
> > > > > > BOs resv
> > > > > >   	 * still points the VMs resv
> > > > > >   	 */
> > > > > > -	if (ttm_bo->base.resv != &ttm_bo->base._resv)
> > > > > > +	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
> > > > > > +		if (clear_fence)
> > > > > > +			dma_fence_wait(clear_fence, false);
> > > > > >   		return;
> > > > > > +	}
> > > > > >   
> > > > > > -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> > > > > > +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
> > > > > > +		if (clear_fence)
> > > > > > +			dma_fence_wait(clear_fence, false);
> > > > > >   		return;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (clear_fence) {
> > > > > > +		if (dma_resv_reserve_fences(ttm_bo-
> > > > > > >base.resv,
> > > > > > 1))
> > > > > > +			dma_fence_wait(clear_fence, false);
> > > > > > +		else
> > > > > > +			dma_resv_add_fence(ttm_bo-
> > > > > > >base.resv,
> > > > > > clear_fence,
> > > > > > +					  
> > > > > > DMA_RESV_USAGE_KERNEL);
> > > > > > +	}
> > > > > >   
> > > > > >   	/*
> > > > > >   	 * Scrub the preempt fences if any. The unbind fence
> > > > > > is
> > > > > > already
> > > 
> 
