Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2629CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7998B10E4EE;
	Mon, 27 Oct 2025 16:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3+U8Hpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E210E4EE
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761582033; x=1793118033;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zNrFw/afAzX2om7aeIH9J5AHtADEyA6GOUZzml5qNsw=;
 b=Y3+U8HpkjjNitoDWxfFwjJsIOXrYWfEQkZF4wg9cTVBWqXxjnhNWkl56
 pPO4Z0GkTrpr4elbXgb45FyiipmbEEnev+/PFP5dIAd4KnwpBKWx4jQSW
 f3jmMrmlNAVXtp0o6kkNn4KE23Sez/Yr2w9GkzMJxnBN4qu1W862jUu1K
 omShgXvdIuYUiGV0S73D8l0LxanX/iFAE6oTQHfNqkK+/xy7rz+CSO+H+
 vvKNKkp5sbYIeS20cOiKBVRY3tAf/o1wcqBZWerHUXuHu2kbwkBvjGHfN
 9oFlEkelnOOZ5LP5VXaQej692tEeUGQ4wgf9rLkwZ0SENHKCGpj9LO3xd w==;
X-CSE-ConnectionGUID: E9zJ8XvlRlCc182iLML9nA==
X-CSE-MsgGUID: HdS1nrsCQEea2nx7y35igg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63760890"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63760890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:20:32 -0700
X-CSE-ConnectionGUID: Aspxyl1GRWKj57AkkXzuLg==
X-CSE-MsgGUID: j+uXgpH+QxqWB7loGjBzFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184707798"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:20:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:20:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:20:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QubT3xJBJkuMSJHJXqm3eWlOuK3ScDeDNxAVEWvxR0gGjc/+24zcL2JKjHhc6E5EQD3gAZAJk4fNcG48WsgxU5Ui72Di1Ziyz7hVUSj7LT/r8GK7iXp06cPs/2azHkjwJWToFz9Jt5k6QaA7oC3YFc6ggIR2k+oObLIrzxZ4RL/SiP/Mcuh0Hv+LvPDDSNaONsHtoGxDBBgtB8v/oypYwIYIxxvnTcXFm3znNW0JLYkgFqn4xuaDhSLnjx9saLVScfnUPnEEx1LBSauUXMtlD70YMskuW5cOKlKebAxWpT379cJEU3n0Sd869b+9t/C24KaxWZI8xvjFPhvFfU+36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+FWe3ycSBFogppssiFRPx/BpoiGiBPtuwBaDoAImXI=;
 b=l73nOK3/2rLqz3Bw09WddYkJaq8CehVAqpGrgJhujSI7Gc+X6hEu/DSOCWjlpm30WLCdjWPSTsUmQ+4iIHA1H+ItqDgsRByM+ULcEPdpv/wU0feAhKCTSi+bUYW9uefII3pEFCC1+yoaekSfLZTmZXcpQ7K1CUjZds1WUamxG3szGKaIXkxUrH8j290wptjtFafopwUm7ntcqYphDrNy3jwzkBqhnXpbdu/+tBDvloCZzGP62Li+5S6f2OX486qhcrDAgiRDsxZBpP0OheUTcvFJD8RbU4nSdd/ayblj6CYc8Ri/ObUeAKiOSGfztTRY0Ba90BqfAJ443v0UQwhbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:20:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:20:29 +0000
Date: Mon, 27 Oct 2025 11:20:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Peter Senna" <peter.senna@intel.com>
Subject: Re: [PATCH] drm/xe: Fix uninitialized return value from
 xe_validation_guard()
Message-ID: <bbboai57syvibnijtg5teu3jtd65ade2h5jwza2c6eaouln3f4@jovemuxmewo2>
References: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdf577c-3f2c-462e-63d6-08de1574be3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FW2IiH8YoDfQbU9P4tK0suNCuHzL1vCNCK40LLPC60S+cOiflN4jYVGndY?=
 =?iso-8859-1?Q?9p9j1TcoZWnlyE5q0T5zfGBCoyhb5f/aqzCs3HMnHqbTbER3jUToTPdUvg?=
 =?iso-8859-1?Q?W0L1U2WVGtmBxMnU43yVfRFoxf2cg6Rpb9j9c795hGPDT8cRcreXI5W9ps?=
 =?iso-8859-1?Q?e9RTp5cJkTvlzRsBE6XaTuZaFrxTbgYChnnxu1HlSDc7RGJIpWB7CEYLqZ?=
 =?iso-8859-1?Q?h2ZE+qKevuegrgwy3/EEuZZbd6f27ZGvT+EMTI0pckDLH67vK4oWWlAbOu?=
 =?iso-8859-1?Q?7FxKQtVySiiIM6PC/e38ulr6QLbBySnwIFGGhJ+mXdxO1PZFDUoPozO2tL?=
 =?iso-8859-1?Q?kvZyDENRt9DPrfYykwhIjGujW4YzhSZ6QeuqC2NjgL1uZoq5+E/vUU3NMB?=
 =?iso-8859-1?Q?QKTJNO6WCsTILvUtKODDDsSLu2y9LN638W99UIzK5v5zNb1tlyZwpD/6vA?=
 =?iso-8859-1?Q?p2mnHH3s2PZsnh0pQzu2xdD9VrMZtBnt8dVV3N9eMwodCWwHCn6+C+FYM4?=
 =?iso-8859-1?Q?ixM/OyD4cZo3F+qcMLanTgcgRc7mzKlYLTIzg5sWwHBxKn+djOhec0qiOl?=
 =?iso-8859-1?Q?45v/bnOfFGYAhcfcWnAATBQHwZOnIxcRTEl2VQWbKlz1DdctK066Ah6frq?=
 =?iso-8859-1?Q?Hi8qQ0gjzVIjhf45Pf81A8zfoRJtdeD1/GqTdfUKrWswycxjR62Aijg3vF?=
 =?iso-8859-1?Q?ytCxz8SIO3b8aWJqj7eX2a3xPBlOCYC6fRGwO8estdgJAqntwO6bJ0qU3W?=
 =?iso-8859-1?Q?Th0ii9+Zl6ln3urZVI0oRGuFIUyA8xUSM7HbqCOay9nLtuyoNhfllKxfsw?=
 =?iso-8859-1?Q?lSA+nZt9OnTiTWUjErslj6SkooWrybKsb8X9tv6Yx2KlPANeRfHv4e71E7?=
 =?iso-8859-1?Q?Ys0RT2GDwNF7ZnaUDM4osSl6tg3m0NeH+BitqpZRvz65LM9X7NwgeSKbJ5?=
 =?iso-8859-1?Q?FSHFrgUuA9fn0wskBfL40GEs0tUKb0Py4HRXuMZyG7JCs5ZIPoMJwZC01/?=
 =?iso-8859-1?Q?mwy+RkiQlACwunZ2wWSwt0AxNEDXb+u+XHA/TTYdbSfsF7mfxfYaQOTSTz?=
 =?iso-8859-1?Q?PgfIllk9021Tmi0pKkuNkXGsi9Vvod1O+/EYcD/y0N71C3nhQzQz6LJFt0?=
 =?iso-8859-1?Q?Dj1KE5YB9Mnr/c3ZuWMb/TKinj1/iGmx/9D48u8FmlOhO4mQ6uPUbtEBSk?=
 =?iso-8859-1?Q?vNYAJNdl8BTe6XL2iph49sdNtjrn6+eYzXPLahpfTfrxJMhcTf2l87PkCG?=
 =?iso-8859-1?Q?HCojO9LjJrRRbrzY2+yS3QUIl4z0bvv15Xcp+Z35hpP/KmrCHJs1uI1Z4u?=
 =?iso-8859-1?Q?mVeH+LzGiwyKEOm3BAfCL6Pxy+HVdBij+wtVG9eb4SY9QQTUHc2VJP72Ny?=
 =?iso-8859-1?Q?0dV4Mi+vkoqfz65zsduovH4Zf/4SIT9bKhPorEwqhU8Cqo4cIqNTAeijZv?=
 =?iso-8859-1?Q?KRoX9edT+hYfNWIEIErgWTyAqh610y1YDgJ/xV7W9qcs79gNjZ1NlMGiDc?=
 =?iso-8859-1?Q?/wEKrLXDB7/mfFFeLaVjou?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RdCczH6+gzzKZDbTOhxTfRfMmANKGkQcjbQ5N4j1LHQqx0j8/UPi7KfMPh?=
 =?iso-8859-1?Q?/lg3xJy2KE1nB7KOhmwBmTFORec/7NzmtROluozofALVbHtRSHevtrrnbh?=
 =?iso-8859-1?Q?WjJFULXgJVToZ2xdXtS66ZMgpGMyqKCGQuziXSTwDT76LAeSaY006Gq8cF?=
 =?iso-8859-1?Q?5owlUd582w7eoN7t4e4Nmax7kW8r+Yulz5Gw1YJdYSSB6AICxYsUxZ+73d?=
 =?iso-8859-1?Q?VHyIZGur+c3eLxGQ7js+cdotd2X13yGxoBFf0UYHO+HlNrhLf59jy3/L9u?=
 =?iso-8859-1?Q?cA7Hq+SiU3ahGWEqP25CKbcJERvmSU4czNpU3FthAg335zrz7PsOMvsAvK?=
 =?iso-8859-1?Q?LwYxAHqvgipYvHaPmDeG33BBjHh/9PoAC41FP50kMC02SbBpPhHId0pEiX?=
 =?iso-8859-1?Q?rXI60SqFzVbqgw+HA06QwquNCLrz0a5r8xIVNGJxKXw3GCU/B4CCV0wFGu?=
 =?iso-8859-1?Q?ST6iRInnCqca7XM/cBjyqIwNLb1LYkb4YJxjZf1L4sD5LUQWvfnTUC970N?=
 =?iso-8859-1?Q?5Rlj8BicZ1NMhC1iiYsk0zSeuJqvc0plPUtVA00Q2EwBzrn3qlU7RuErcb?=
 =?iso-8859-1?Q?Gb2HKL/Qb5kZas7cE8+7QjS9U0qNuyVUHGbjT6o7Q/uPFUksX8iCYH6FHi?=
 =?iso-8859-1?Q?8ODI3eCH3v2otfTEpKtf1G9yKnQWIVJQdrhCcq3/IWgY/hNuJwy2Nm1MMY?=
 =?iso-8859-1?Q?P++OWlp6ZP805vaJOYKfFSOPXavmJakKAgLEDNEHAcDSeyUckZJF3pHDWq?=
 =?iso-8859-1?Q?o0pGVr6+WTdrIGc6X8d2iyhQEPdGmgAKqSejLl4CvOdfK1MVfsyrFI/r4D?=
 =?iso-8859-1?Q?l089ol2IpmTn0fgX96eVLURQc58LwDxRtCrnDQsGPOCumNBUkJFp2zgxr1?=
 =?iso-8859-1?Q?JKGomA/1vUu7FArFoYR0dLKH5XmJ7mAb4urKp+w1xl1GIF9ti8mKOjvVsM?=
 =?iso-8859-1?Q?gF2CfjB3d6gobqllsGXFqwPhhcEVvozuMD9twbD1JgmIJZFjxZZCa/51WZ?=
 =?iso-8859-1?Q?asrBx9ryceENFShf3gqPFJ1DII+rOWbwY3hV5+M1LuT5XTi256mCGSAunT?=
 =?iso-8859-1?Q?qfb09OOYHSmWYOCUP1gQOtlzYzuF0CCSWQ9Nk5C3B4wBQC5ZIVRb5yAOne?=
 =?iso-8859-1?Q?eQ5+IFWQ9BxMQ3Fy3A/KQj7jML+IfmUOeZ37np3Fra1vTutsKiVhnEHKTh?=
 =?iso-8859-1?Q?+YDSM2tcFdnEIRaMctHP9x7uwLyeJHTYo/v1K7RdcgNIHNzX1Nreo4r7rd?=
 =?iso-8859-1?Q?OwGLJVITvDGhtNAviObJf5oJYzbwNHK5zPaU0FsKL/fhDoUa2Rg62fnoMs?=
 =?iso-8859-1?Q?H4uIc/T40fiT5adypa5AkYxA33bH2kb/UxFNKGnzBXmPw07rggKrLqGIVh?=
 =?iso-8859-1?Q?8Pe10EwpztYM9ybC8SbU7pMPq67/eKWVlrOrteQ5zBfCge5VuLBV/KQr/s?=
 =?iso-8859-1?Q?uK5uTRIe6v7qsS4o/PBgStpkqfKVqacNMuxeg7l38whYAglYGzyCvsKcT9?=
 =?iso-8859-1?Q?jgzJ3uFlvsgIyEDDQdMoKNMGiBCWmqMxXKdqBo6pq8l/gZItKFpeAmK8CK?=
 =?iso-8859-1?Q?wl2GZno+8JeCFoLLWps+nJP2QA3maPNNI00uC+92+qwGo/yOa7y/h1Y0/g?=
 =?iso-8859-1?Q?KJMCAcfQkF0a5N/wGRsLq8IbvlhM6LKS+mlNOleeRdvmVphPrXlX/0BA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdf577c-3f2c-462e-63d6-08de1574be3c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:20:28.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJLw+knNP1b3ak5VTupAmQQNbxX+j5xMVxCGGW9g8ockPWBOPGhAL8fLsfADrLee9O/cEiyU+c6s78sjicGH0HlJ4WwXrJ2JuV3dDBz9riQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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

+Peter

On Mon, Oct 27, 2025 at 02:12:28PM +0100, Thomas Hellström wrote:
>The parameter _ret is assigned in xe_validation_guard() not
>realizing we're assigning a parameter in a function rather than
>in a macro. That means it's value is not propagated to the caller.

"in a function rather than in a macro" is not very clear IMO.

Maybe expand a little bit like below?

the DEFINE_CLASS() macro creates an inline function and
the init args are passed down to it; since _ret is passed as an int,
whatever value is set inside the function is not visible to the caller.
Pass _ret as a pointer so the initial value proapagates to the caller.

>
>Fix this by making the _ret parameter a pointer.
>
>Fixes: c460bc2311df ("drm/xe: Introduce an xe_validation wrapper around drm_exec")
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6220

Shouldn't this be a "Closes:"?

Peter, can you test with this patch and report back if it fixes the
other issue for you?

>Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: intel-xe@lists.freedesktop.org
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_validation.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
>index fec331d791e7..b2d09c596714 100644
>--- a/drivers/gpu/drm/xe/xe_validation.h
>+++ b/drivers/gpu/drm/xe/xe_validation.h
>@@ -166,10 +166,10 @@ xe_validation_device_init(struct xe_validation_device *val)
>  */
> DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> 	     if (_T) xe_validation_ctx_fini(_T);,
>-	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
>-	       _ret ? NULL : _ctx; }),
>+	     ({*_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
>+	       *_ret ? NULL : _ctx; }),
> 	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
>-	     struct drm_exec *_exec, const struct xe_val_flags _flags, int _ret);
>+	     struct drm_exec *_exec, const struct xe_val_flags _flags, int *_ret);
> static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> {return *_T; }
> #define class_xe_validation_is_conditional true
>@@ -186,7 +186,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>  * exhaustive eviction.
>  */
> #define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
>-	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
>+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
> 	drm_exec_until_all_locked(_exec)
>
> #endif
>-- 
>2.51.0
>
