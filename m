Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FF4E9A053
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E5410E72C;
	Thu, 19 Feb 2026 18:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSnP63o9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D86B10E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524438; x=1803060438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oxiPMTrEvdDtGX+nyK5dkvchPlsaAfAzwVaY/+frRbo=;
 b=SSnP63o9JgmkTQjrrAYUSJoZmNXtjYBgcDaTme5SVD2IGj8Xo7HZNIph
 OVQqyL92SyVUl+aDFYJoB5TRZx44wwnxmyRTmB7CzuhCMl+y1eJQkuOmY
 vdQKezvIn7OtXZW51G7BbwSQe+Y5fY1mcDLII/B1V9qw+UW6X+UwgKeeD
 DpxWz5Y/UqJoO+wF0eieITggM62mjrHdTwSDCqFou+QwDpEeeJ6whCR93
 hds6iw59R8UZF/ccor9JPMz943HM8tDSlAcHPQpL7CRF2yQu4sCwXGgIl
 sOzP2kJOWR569r6mlpK78hwwGfJuD1AxEVqw6HeFOFSRKLGFKIDlH50py g==;
X-CSE-ConnectionGUID: bnuVTZ25SI++xyL6dnuyJQ==
X-CSE-MsgGUID: stHJcANzT5KWfD4oM2wAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482899"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:17 -0800
X-CSE-ConnectionGUID: RSfz1LCjTmO/ydsaxrDFYA==
X-CSE-MsgGUID: jweJup5RTsKrlXNqF/fpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214456443"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:07:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 10:07:16 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:07:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u95mlTBrBvwkRvfDlfLrfiHz4dF3QR2zOlgpm56U0TLWwwfIzF+M/k0dQc3REmUx2SIKoiu/xwLqlSlI6jrIX6nxI5JdiRj1+CWzPQx23RKsJz5ZHBGn1J/qvzHM/74by3WzIByhuECbE+Y75v4vy0rPeqFhc3bLO9ZAh9zxuCB70r7K4UW6HhpUA5cM+7VWfKHm/+UllqGR9WExtj6usXnLfxtxR2W2fekSrOAYppT0IaVTu2sf2IxZVW6kl1b6hHDu09z/obnrYZgEOg/ciEwDN/YE0rflZolK2QE5Y4yC/UGE4Cs7l9QIZdJyvT2KS1Y7nnu1yCWx5oJtIb9QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qSgAejrHqJh8QBohOoQV7TaKFvfwy9MsyzzjeXFWU0=;
 b=nbrmnRXRt4KctZDW5CrOthkOxjjsQYLzzPi/T2nH/12t4woiBJJcA6mgAmL3IJkVfQo9Ue/NKqwrYkqMlXLSCvDkBkVlaGeFkcQ3KL4pKG2Q6AWIZUV0CBsvDS2GRO93+bjb+mxbvQMi7j0PkRpmxKyqv9qg3MFwPZ57eH4VHRGSRrBdrCBh1Z2Dyk+6gsFLz1M67t4gpmEv0X171mMyywLG1GA0fbwSXYnjJPXCWKgu24nrAx7urIOpqvi0LeBBg8JPdZQluqZYE1Uw+ypY+o4KmcFmeWfVHoeNBWv4uOiNZGfsshqlCdFsXa+fiMpd/PDQ2mKIQYxg2F6fN0fPWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 19 Feb
 2026 18:07:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 18:07:14 +0000
Date: Thu, 19 Feb 2026 10:07:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
Subject: Re: [PATCH v7 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aZdRUIH5lijBsHTr@lstrano-desk.jf.intel.com>
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
 <20260219105433.2234194-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219105433.2234194-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0333.namprd04.prod.outlook.com
 (2603:10b6:303:8a::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a440898-df14-414e-19b5-08de6fe1b628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dmk2fuy88KVupBbanz5mAtpFX0oS3/C9lahdgOWweADeIDELACSKnhvWtn?=
 =?iso-8859-1?Q?Ed8uXRKD8WM1n0EaY+yTp0qgs0t1KSWsgCG0b7oJgDjKaE3uQKZJgpnLj/?=
 =?iso-8859-1?Q?xwAvpP95qP4yY4Vwm2Rv4vGE6CItv8FacopeSwZl5oLdVgNAc5Id17WyWj?=
 =?iso-8859-1?Q?VIqB8nXqF44+cbj8BLlZa/REt5jUh+DvYhPctsksN2PYAqYT0K+Sxn5w+Q?=
 =?iso-8859-1?Q?mZqvzGG5kA7Bghbf76sXkbW0T07eNG6btdslqzl8U6g5EswYCaxQKJQMVQ?=
 =?iso-8859-1?Q?lZgWaPdvPrVqo34prvFoEmG3Sg4O6TOo4VkT2ogTgzag2mOrz1mslxDRVi?=
 =?iso-8859-1?Q?t9NLCyrUZ7GkiFo168pWVftTQU2ZoVjNtLyMb+kAwbHtRQaSt/OdNJwnmX?=
 =?iso-8859-1?Q?h7cEze0eenKFVNn1WdvD9fpJwNY+v1W5OeLkGj6UB+JViG2Q8RhSZ160NN?=
 =?iso-8859-1?Q?IQNrgWPlEvLgUArGFNPLsrnCNLM0lIYhJMjKzX4IQH6IjYQ+7vHdlqA6We?=
 =?iso-8859-1?Q?XaKElbLR77HB92zIwz7ZVxN6e7h7+CxvKtkM1diBzFDxumEHvuqBNYPYNB?=
 =?iso-8859-1?Q?BGE2tXaqFEcDfSi5WCMb+hh5UYO+9uVIO6ulCZxi5ahMaik/3g6GCSgddm?=
 =?iso-8859-1?Q?Cx1hXyxgtuH0xxhNgq1r0ZEe3qfk5/lLGv+eEyY1ryCP9OMKaLt9tI5adO?=
 =?iso-8859-1?Q?rig32lKfaxLpn1aEcCZPNhHDaazpjh1ALAvF/6F1J9Bi4mXiErFXxH2qux?=
 =?iso-8859-1?Q?GX1CkgLOB2ddgrREu69SrcObjLymPegsuSpbTcF4GU/R4dRh7TV9jE2gu9?=
 =?iso-8859-1?Q?qpURj2i4oFWxB+OebLHXOulKeQix7mYcRRkS9Vl/G5FJI8mv1W5Hy6kXQO?=
 =?iso-8859-1?Q?9z+n2L05AC3JSZJo8mSqgMzDk9vPfj0Xcl9r8g2AG+XMVjEw6FC01Rnkw0?=
 =?iso-8859-1?Q?FRPnz/nTq9btum0IVn9z9FpGO9eH/vDcuO0DLfO9EoFM1FZe1ZJURlXCOn?=
 =?iso-8859-1?Q?yihlXMqOBrvcxI+kxDkUFn0yxA80ygaKmQLF4oPMpAUdMdantiPkbrE4ii?=
 =?iso-8859-1?Q?r/lljiow32KfrHlV2fnaqxCEKT0kubLAa1vTnB2rC50olA1tLLOfjX8Y4/?=
 =?iso-8859-1?Q?4v1ClosceBRmmG1Obj86nA4b6YsRvjegxwbbb1akn1YqdhL+xmaXXhTloY?=
 =?iso-8859-1?Q?JaaaHuISwh2WSwImtr+/w8qMpALq1YimoEcqitqvoEmTUk92HVdyJbiqeU?=
 =?iso-8859-1?Q?l7KR6AeEq3+Kwy9F4n5f81F0usCykqSKaX5lUiMMo2xX+Oe2We+6hs4Uta?=
 =?iso-8859-1?Q?EwIyQuqZsTSIFOd9F+h6h5Xri+0myiRrmKplm5U2RhveBW/Qctd225n1Ub?=
 =?iso-8859-1?Q?I/JAsJyNgTKpfSbTdKvAr3zeFeUQuERnKcLD+HOGHH7yogcDtM1YFVfOpm?=
 =?iso-8859-1?Q?UNOiA3LQ9hx/5hxeBsuq56/FdRKJquSYjtXUXPhAnpsnhur8sVQoDjz+Zo?=
 =?iso-8859-1?Q?woBaGK9H2ExdumfBsS7OPVvnyuC0BmF7dH8u1lIN2tSTzPyIYqEkAXC/rh?=
 =?iso-8859-1?Q?FvMnCD55oaov0uBmQNbAX2iGZcFGakStQ49XLPMtH8YmMrW7I3Vu7q+w22?=
 =?iso-8859-1?Q?NWj8nCys9O/ew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kQWrWWNCBbtcOGA0BjRArycdoRPzDwY7Y+fra5D8in8rVmSY5RhmXWCmbg?=
 =?iso-8859-1?Q?8uvz+U7msebyXhtiO3GjSw8TOYLfvObeySLADOyX8HWktCzMAkGZ+5rkWd?=
 =?iso-8859-1?Q?E5PmxyfJMz1zglp36TCmk1qROc+2bXTZCENZJN80Uds93nYtqi4cBRIj+p?=
 =?iso-8859-1?Q?i9jxlX7XhZt2YSV8ghE5ZRZaB6Q4PKiT+wL0wmZYXxzt8ZXAtS2DSL1Q/C?=
 =?iso-8859-1?Q?YPVD+4aYqRCwtYXTsAqn1PidMR4lR95c69Luf0Fw6hMRnztSrTRf/ozTwg?=
 =?iso-8859-1?Q?KX/O2N77NUKVC5Z280vX2l9b5yREEBAJL484ixcQn8zpEK11wihE1Zhv4a?=
 =?iso-8859-1?Q?AyKrmLMslHHNZWABU1I/lCaG4BlSo9K/oVEVCWc4OeNwgYOOrpLD0yu+c6?=
 =?iso-8859-1?Q?1HiDqq/5huVRTBegVkg75LSid6dUDgQPLL5HjJr7X5ecwo63SOB88Zlg+1?=
 =?iso-8859-1?Q?EEoC9wbtDF43EVWOqihjZFiH6iEwybGyxGZMBCUjJO/CqEmdqlNZUIMpJY?=
 =?iso-8859-1?Q?9o52W0gAGFtv3m+FomStgd5y1pdJuZbquxonIA3RDyv8UQCSsG7puENekq?=
 =?iso-8859-1?Q?NWiUBL9dTN8HdHWgWkEzlja0/uTnDRiwLbLVcIbFL5g7gBP3UVqL4+4AHZ?=
 =?iso-8859-1?Q?fOOv1m5Rg3xdDSQPOSzKXwUCHmhYuaN+0y/NOJB3HAshyg34QPZfD97a7K?=
 =?iso-8859-1?Q?wirOMM3sroNgGZqLhS6JUvz0rPOcTnv7KSWbgl/AQ3dvt2+ljddSV9qk2E?=
 =?iso-8859-1?Q?atWSVJzL8LuDYbHaNV54wnc9JWD8z3jnJNkQo3Srq5corEkGteq1aV38Sy?=
 =?iso-8859-1?Q?AT59URAk/2+ZEztg17xEY1pKKjMeHp85slweriY/alZ6oXlv854MRJpBTz?=
 =?iso-8859-1?Q?KBzWZ2GJCv9zTgOMsrnoDnsUop6RM/3V9nZBNEfZdLRH7MNb5keHF/ktKK?=
 =?iso-8859-1?Q?B3DRGMhmy4rL0GJrnS8LPJklAhO3GBKrxqyT4VL52XsH1ZvsfUpAG6xjHY?=
 =?iso-8859-1?Q?mNrB7kAyfQXYjsci0ArdMazBRDuUO16eHPGYP+7qSF7BtQzvAFLHXJF/1o?=
 =?iso-8859-1?Q?uONJbmwpNnjd1z/bZxhhoz4WLUyRZb2hWjJItMVTxQTVOmU3W3LrBKomTq?=
 =?iso-8859-1?Q?LnesSQ2+8E2GRaSlqIlFqdLux8f0WbNp6p5PDWQXfr5yFAx11cB9Q/eT7S?=
 =?iso-8859-1?Q?I55of8mLO8JoCUjJsHFxjHOqWWthgThefbWhY9PDKhMV+1NeW9A5hAwlFn?=
 =?iso-8859-1?Q?AWQjHgz3vgxTqvCYnL1x91R6FIFWcVDoqvNjjbKqIB2h7e/9LPA+gtO15K?=
 =?iso-8859-1?Q?mC6ca3n6SHOS1K+SDlHvQL6H9bZrtSJMEhlwDvp34U5IQQ9gX2i+l5Riub?=
 =?iso-8859-1?Q?wug2gVlPV5Fd9Y5h4iugUUr4U2RfhtVNAv75KpZqkMLljklGVnMgUcUAn/?=
 =?iso-8859-1?Q?lXmF4XseX5nqgB/iA9rWjtozR6ai3dms6S/P4Try4sNFRXDdwRKS6qVWNH?=
 =?iso-8859-1?Q?V3zD11DvcfB/kVOqft6I2wh4//tAOecQJZLCpOrrVzBIbSkVHTOossEJ6t?=
 =?iso-8859-1?Q?GAflhCfmlwrAtTZ111naQ+0p6h6DNhzdS5fVKuY8UuTVcXLn71TRZdonRs?=
 =?iso-8859-1?Q?FyF+6VhTgrumesUy4vIe46g98427mUfZuPrFMcCAJ94ZdRmqJjKHfXSsHI?=
 =?iso-8859-1?Q?ZECTva4cUjMjrNJYefR93bxHznuBfL8w03+bUVZcpv0xB2uj3s4mgB4/1Q?=
 =?iso-8859-1?Q?eH7EOMp6GHfCbj4ovy9EBeJk/ZbPzovoD436H5TrnV6oS2G5qwnEwjJNFb?=
 =?iso-8859-1?Q?PPTxcroWWSJ4RCOMbNe8KTT+WhebfF4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a440898-df14-414e-19b5-08de6fe1b628
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:07:14.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gp+E9BwwlG3Zg5STWQtoTD0j7n80nLASjT1tH2yx2f0lwmV6GvXXtF5bCC0gdg4o5jc8SYnDMx9WnxImkBzPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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

On Thu, Feb 19, 2026 at 10:54:36AM +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(), which is
> used for both allocation and deletion paths.
> 
> When BO allocation and shrinking occur concurrently, a circular locking
> dependency involving fs_reclaim and swap_guard can occur, leading to a
> deadlock such as:
> 
> *===============================================================*
> *    WARNING: possible circular locking dependency detected	*
> *---------------------------------------------------------------*
> *								*
> *      CPU0                    CPU1				*
> *      ----                    ----				*
> * lock(fs_reclaim);						*
> *                              lock(&sa_manager->swap_guard);	*
> *                              lock(fs_reclaim);		*
> * lock(&sa_manager->swap_guard);				*
> *								*
> * *** DEADLOCK ***						*
> *===============================================================*
> 
> To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
> before taking lock and SA is initialized using xe_bb_init() preventing
> reclaim from being invoked in this context.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> 
> ---
> V6 -> V7:
> - Dropped R-B as some release sequence is changed.
> - Dropped xe_bb_release() and used existing xe_bb_free().
> 
> V5 -> V6:
> - Updated drm_suballoc_init() to drm_suballoc_insert(). (Maarten).
> 
> V4 -> V5:
> - Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
>   any more (Michal).
> 
> V3 -> V4:
> - Fixed some nits (Michal).
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas &
> Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/xe/xe_bb.c      | 59 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_bb.h      |  6 +-
>  drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_sa.c      | 30 ++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      |  2 +
>  5 files changed, 132 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..b0aceaec2685 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,51 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +/**
> + * xe_bb_alloc() - Allocate a new batch buffer structure
> + * @gt: the &xe_gt
> + *
> + * Allocates and initializes a new xe_bb structure with an associated
> + * uninitialized suballoc object.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
>  {
>  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_sa_manager *bb_pool;
>  	int err;
>  
>  	if (!bb)
>  		return ERR_PTR(-ENOMEM);
> +
> +	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	return bb;
> +
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: Suballoc memory pool to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the specified
> + * suballoc pool.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
>  	/*
>  	 * We need to allocate space for the requested number of dwords &
>  	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> @@ -76,22 +111,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>  	 * is not over written when the last chunk of SA is allocated for BB.
>  	 * So, this extra DW acts as a guard here.
>  	 */
> -
> -	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> -
> -	if (IS_ERR(bb->bo)) {
> -		err = PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> +	if (err)
> +		return err;
>  
>  	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>  	bb->len = 0;
>  
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
>  }
>  
>  static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..231870b24c2f 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,12 +12,12 @@ struct dma_fence;
>  
>  struct xe_gt;
>  struct xe_exec_queue;
> +struct xe_sa_manager;
>  struct xe_sched_job;
> -enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..333af7b57ae9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -25,6 +25,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb = xe_bb_alloc(gt);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
>  	bb_pool = ctx->mem.ccs_bb_pool;
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> +		xe_sa_bo_swap_shadow(bb_pool);
>  
> -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> -	if (IS_ERR(bb)) {
> -		drm_err(&xe->drm, "BB allocation failed.\n");
> -		err = PTR_ERR(bb);
> -		return err;
> -	}
> +		err = xe_bb_init(bb, bb_pool, batch_size);
> +		if (err) {
> +			xe_gt_err(gt, "BB allocation failed.\n");
> +			xe_bb_free(bb, NULL);
> +			return err;
> +		}
>  
> -	batch_size_allocated = batch_size;
> -	size = xe_bo_size(src_bo);
> -	batch_size = 0;
> +		batch_size_allocated = batch_size;
> +		size = xe_bo_size(src_bo);
> +		batch_size = 0;
>  
> -	/*
> -	 * Emit PTE and copy commands here.
> -	 * The CCS copy command can only support limited size. If the size to be
> -	 * copied is more than the limit, divide copy into chunks. So, calculate
> -	 * sizes here again before copy command is emitted.
> -	 */
> -	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> -		u32 flush_flags = 0;
> -		u64 ccs_ofs, ccs_size;
> -		u32 ccs_pt;
> +		/*
> +		 * Emit PTE and copy commands here.
> +		 * The CCS copy command can only support limited size. If the size to be
> +		 * copied is more than the limit, divide copy into chunks. So, calculate
> +		 * sizes here again before copy command is emitted.
> +		 */
>  
> -		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +		while (size) {
> +			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +			u32 flush_flags = 0;
> +			u64 ccs_ofs, ccs_size;
> +			u32 ccs_pt;
>  
> -		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +			u32 avail_pts = max_mem_transfer_per_pass(xe) /
> +					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>  
> -		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> -					      &src_L0_ofs, &src_L0_pt, 0, 0,
> -					      avail_pts);
> +			src_L0 = xe_migrate_res_sizes(m, &src_it);
>  
> -		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> -					      &ccs_pt, 0, avail_pts, avail_pts);
> -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> -		batch_size += EMIT_COPY_CCS_DW;
> +			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +						      &src_L0_ofs, &src_L0_pt, 0, 0,
> +						      avail_pts);
>  
> -		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +						      &ccs_pt, 0, avail_pts, avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +			batch_size += EMIT_COPY_CCS_DW;
>  
> -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> -						  src_L0_ofs, dst_is_pltt,
> -						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		size -= src_L0;
> -	}
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +							  src_L0_ofs, dst_is_pltt,
> +							  src_L0, ccs_ofs, true);
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +
> +			size -= src_L0;
> +		}
>  
> -	xe_assert(xe, (batch_size_allocated == bb->len));
> -	src_bo->bb_ccs[read_write] = bb;
> +		xe_assert(xe, (batch_size_allocated == bb->len));
> +		src_bo->bb_ccs[read_write] = bb;
> +
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +		xe_sa_bo_sync_shadow(bb->bo);
> +	}
>  
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..c7ee952e8914 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -175,6 +175,36 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> +{
> +	return drm_suballoc_alloc(gfp);
> +}
> +
> +/**
> + * xe_sa_bo_init() - Initialize a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
> + * @size: number of bytes we want to suballocate.
> + *
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
> +{
> +	return drm_suballoc_insert(&sa_manager->base, sa, size, true, 0);
> +}
> +
>  /**
>   * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
>   * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..50218b0d1404 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -38,6 +38,8 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
>  }
>  
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> -- 
> 2.43.0
> 
