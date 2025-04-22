Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08376C369D3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 16:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B88F10E1B0;
	Tue, 22 Apr 2025 16:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkvy29oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA39E10E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745338674; x=1776874674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LQUBpDTIjPeLKA1YN1vKk/7gDFFAaeArvdnz/3oe6MA=;
 b=jkvy29oUeQaiEmUrEttzARoRwYOUTseU07FwIi6wo0R3CZLHB6uzrqB1
 7Xq2T0zYP0zaxhb7DSpjMLRrPj2ZMCF93oJwq7dj1ngpcYx4i53zvk4NT
 oowFdx74lsND0RP/tY550gGlTIRArA/F94mDQzRpjqYwLB71/RVjhF6gO
 aI6076zlmuHc6wFXEatpUWmW6ubnVEWi4yKWxzM2o6gO0NmIGfbtUi70D
 gBes6xi9t2y3mC8PuLU2Q2WHM+3BhGF6DQiWc6an1Ak0HwAoaleXTTGX5
 UlBvMOFNx9l2YkdZ1GfPU5ydjxEHr6cqh9y/W8AdtxPnnwQXDEO8I9M7U w==;
X-CSE-ConnectionGUID: hee9XkySScyRtMUfpRR1Bw==
X-CSE-MsgGUID: 99h0hpiJSriytf4UJ/oD1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69397951"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="69397951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:17:53 -0700
X-CSE-ConnectionGUID: 60riOHF2Q5SdIlwMDCiuyQ==
X-CSE-MsgGUID: U1zr/ftgSze0rJ1/Gycwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163017866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:17:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 09:17:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 09:17:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 09:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAodqOjXYnNLopCADJc6SL96UE3C0ianOTKg3dCD2mhcm3JflVWedGwPfjmdHxRM4zXnhnGz43peEYD/x/+MlWgkMYsFZczTNZOBuotM6dDgmk9ta+yY/O8voCnyU7PZuCteEj4XDOYG0ZJ3iLSqPLoP/ZdgS/KPFvvLcNCqYKm09opWauu47eQcfJSyeX1QfFp26ZRRHvZ+fGc8qy8mYSNrbm6mOxprybmtAgSDv12loxBho6l250GeILpuvBdh+rcuH4WQB780qfjzO8pKJRuiI+ZV1A0uU7KM/LBDExa1xHtiRiHRvRBjCbo5bWKejKl0Lm2pgKUjJQj2HkKz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRWIpEoxg3+9Ahy3XLdr4AO3BkBlfQmF53y2szrp/2c=;
 b=EgJ7y/hyejnGcHOFExBUotKPUUU3kidsMG2VjLqxvuKfryi02US20+/Bx9j5ck/1N/FUQEAQJMwdFF9OQNtBYjfQdPo7/1o41ia0ZTGPpyhMylBJBOYB3666UgV+g3lTfhtrJrud2ASEJ6cf8wTrA7r3DgJz0wHsKwkGV793Q03VIFhBR+wOx0+BtZqOieSMcpZqKZrsHLlbjOkw1+nTFXIldtMWpT1ah+J8RUEjhfL81EgB0QSP4McJ3toP+KeKOPbUyVPaK1Ynv1uVPiFbQ2q2T9JBYTtEPWErKHEjqHR2xInhrn/hYlGodP8nAUqRXq/6tMemfR4HiVHJgh9oPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5887.namprd11.prod.outlook.com (2603:10b6:510:136::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:17:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:17:47 +0000
Date: Tue, 22 Apr 2025 09:19:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Message-ID: <aAfBfC+bddXdtExw@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
 <e25bd47bce1167d576a42b231cabb26a7ca102be.camel@intel.com>
 <aAe3HHTarmhI7zAj@lstrano-desk.jf.intel.com>
 <0a38de6386a7a98817852f697ca95c4faa5f1a6c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a38de6386a7a98817852f697ca95c4faa5f1a6c.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:303:8e::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: eea25cac-7d68-4c6c-b3de-08dd81b938a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HlZeE8taKsNzkMmB0cEI+ymVqHZEIEM5BTiXKRoPWSUD5+Ri1AeEhW35db?=
 =?iso-8859-1?Q?E+ng4ilMiTY8Dv3cl4hTLJmt9DjJF3y1qvNj2dnZutcSMgbrR+ah5uNOF+?=
 =?iso-8859-1?Q?rDyutCz3zS4O4Xm/AkJRrGarLbXnDPvttFAEEbpI4IgecUgs1Xe+PiGfRc?=
 =?iso-8859-1?Q?j0TjrwXPIraK4GtYV7LAQz3aa662zV4bL7Fl1/6eZSUwqCPMReMEAvZPkU?=
 =?iso-8859-1?Q?//6t0joxL1vsXm0tVe2qYxGK455d6gEjuvqCRLHqBics2DYB8p218VzmDS?=
 =?iso-8859-1?Q?ErkGg7kS8Munx/NW9M9GmWK2ESeV2PiE1dlYPFIivAAE07S1ELhR1zPi7H?=
 =?iso-8859-1?Q?x734SRV/8RZ/Tnx1Zt5EwNZocrC9uE52d4RfuoRKJ3b43fy94zZc4AlyLs?=
 =?iso-8859-1?Q?oprPloqWA3B2u1JXxHYQg3LAfsAvOpluOKT1vDB5y6QQns6m5ccCkbeF4v?=
 =?iso-8859-1?Q?/HZ6bVeaMW65Z0hn/VMUc9AzCdVzvJPMBPEr16swnxo9AQ7F88ahm1uMRg?=
 =?iso-8859-1?Q?szG+E5+fUdoKYKeYxrbVj66nBbudq3geJEEV3HVqRCxH03EKqau+YSx6Zq?=
 =?iso-8859-1?Q?2A9hnPprq7XUFH/jTiXVe7UREC0/QNCxxQkFSN8RiY2XGL3sLUxWp4AlOq?=
 =?iso-8859-1?Q?vWAkySGE4P+eDuHiPGgfmYGd+po96oMyq3gQNHlfYMQCaubz3Bi9BdKfBl?=
 =?iso-8859-1?Q?WDcFCWyNihkcFV9ISqcQdYuvb2kfNYGWoNHWpEBw0EG2f7qsScvw/uXUtP?=
 =?iso-8859-1?Q?H28snZlaPzFMtplZSmpovUhVVhKM68KDcRJRjGswF53D0S+6W9C77b8AFF?=
 =?iso-8859-1?Q?p7mSj8WEgDxVd+23aXZ4RwdbMhA5jUFrtd24nQLM67+yOvd20e7llOzE1r?=
 =?iso-8859-1?Q?PGepoAtgerWtXf/rIUUCn1yE9SCVHit87KoloJCZ8Bhk4uuIJI+Fq2LXLw?=
 =?iso-8859-1?Q?QgoOuH3wVQb3OuzmjTXyc5zEBaB32xghXioplRCnqr5ajVAUndHgWFHyax?=
 =?iso-8859-1?Q?hDw4I8byLNxVWXTxbQY5xQTOYEqUWqUdBW/g8+K0ILNVF8ZV+gGuhiNzAt?=
 =?iso-8859-1?Q?l1WdRVygMn8diEdcLSDXzPZIm2X/UKio+hSxgy6XY9pxnvIRAvAQbIpoMY?=
 =?iso-8859-1?Q?fY5uwIbDJUtF71f0MKxYQgKi7Cyy0xxXZHtNKkm0yp6rRxGev7Ty3SDF2L?=
 =?iso-8859-1?Q?IKVH16OG75/K52TbpJdjYCRKTh+FO2FqB2TQv/FO7RufL2N/YCYoZPwq2O?=
 =?iso-8859-1?Q?6hjnfhLUBsIDEO7n2eFEIJuTD7Hr6ClMOfW1GC5wA1VrV/lAaQbaMJEouh?=
 =?iso-8859-1?Q?vrY/pU0kgtBqTdqG2N9CxZnDnOJl9rbtnVJ8Fy4imDYg3wmaDx05xDAdxJ?=
 =?iso-8859-1?Q?NYRwXavxwzC34ubRYnNbNt5FbNkdG8C1kzdcSvolQ0LI3A9yjdZJeuegZu?=
 =?iso-8859-1?Q?kUwEDJyuQBilfFfvIK14abrx/WR81hJR0elXk8A+P6dCSXVjVAVdkSuP+A?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TwJcbr4vHvzVLOftI/RFKd5JoFUrvjpQrgNeJ1N2PvnRiHQd8ZGOjFhacI?=
 =?iso-8859-1?Q?MFTYwD6zErHFMgNk7tWfe2KBPJjXdHtxC2hgoC3yhugBGq9Q07TyP8bgP8?=
 =?iso-8859-1?Q?UGEnsSGmtoV9knw+4b7kEuMa41CuahPFyRwatIVQ0xmDVEElq7H6ti4Naz?=
 =?iso-8859-1?Q?p6CpvgnjFIs57wWbV+wvlq51AgWS4u6VGqkdx9D4VPwPhC/XpOeIqigQ6R?=
 =?iso-8859-1?Q?UUzwy+Uz3aqINfL9DkuyD/n6F8YV1k/Yf9DnouwruYPqkmH9qOLMm2+vKA?=
 =?iso-8859-1?Q?eXSDqJeb5927wvIvzfB/KDvp+kSaCNLNiOGUo/KgOJ1JvbGqnrRPfGuM7q?=
 =?iso-8859-1?Q?WdZAqr3eDXjc1rrjaRdU3SbEw4ACswLPBBCe0tx83g2heLqx7dDJ5TUryD?=
 =?iso-8859-1?Q?76j0AvCusA0aJXNEf7W25TaJA9wQI92ydjOgrr+7hNnrwxCUevfitiGlDk?=
 =?iso-8859-1?Q?uQq7KiSmF3EN1CyGJnXg3v82HpnN9t0QNjIjMheEf7Eey7z4iKbM1Eqi3p?=
 =?iso-8859-1?Q?mTajNkbEwUQzl/3Axa3z1SpGr6+UQTIRRE3L67USrTm0TOaljmJSxRotly?=
 =?iso-8859-1?Q?3cPJ9DKHsG30HbN+5xeXGKmmKOiFaBe0D+vRetPdK/Wv038cCI71Rpupu4?=
 =?iso-8859-1?Q?6YUcyRyJjMNvIRP2IDLVfpDxJmWOO32+4hVZQVlvn1IY6EffgBmtPQYWX6?=
 =?iso-8859-1?Q?RczRoNZ+SFRdsOAEaY/ICVOCxcJhPCjiEFruwpxJuR5jemrkgsKRM/jR4+?=
 =?iso-8859-1?Q?l8m9qVyWDQFv8jWMugVOSelzyFqmuNQ5ljRagjsCIqwL67HB1nfSv9v79O?=
 =?iso-8859-1?Q?NxkNhVEVyAGN8EZ4I2FBjrn5QpvXzm/H8CRURVCSry/rtWKEoERWsgHL7G?=
 =?iso-8859-1?Q?zWleg0FeyYLMN9U+pi0uMo6zwNfTtY2scx9uhCb9ZS/QYO/1sQOa4Yagpy?=
 =?iso-8859-1?Q?IW+1yLl7Gpy7HY9MZ0CEXmKijHoPCOyrwH0itNZNZzRpyFNglzBm/iXlnt?=
 =?iso-8859-1?Q?YAqTgd+aQ4l6jnDy85VTWV5BikpZO+vR4UK/OcFznMsjj0vgznHM2LMIlo?=
 =?iso-8859-1?Q?uK7Ve19VItrOjRRpkv7f1Pv4iI+NZO4VyOoYKGdVADCzRAmsTsawjP/8de?=
 =?iso-8859-1?Q?zOtrljTmrtgdWx71Ucz1tGcQvdbRC01w3MT32rcI/kk+KgyQdlBRA9REZy?=
 =?iso-8859-1?Q?tF3tgi6V7iTk6ITe0rwGPuPJatiYrbCIOGFB8Y/shmW96TxXJbrJb1Syho?=
 =?iso-8859-1?Q?fUek8QfbnMBPaIRwaTwdNypElRCxPqpZXURHjrtWALWX38gR3564t8LAdL?=
 =?iso-8859-1?Q?i0RkhIuQGeWR14nFtCNFAslxZyewdsMdDGYSybu8HGmyYccPNlhJ9FV7H7?=
 =?iso-8859-1?Q?AUVC8TP902JYcht4CmXeRzyhoGbueVoEXrzvHpUid9vyHU+0xdUaM0uLjD?=
 =?iso-8859-1?Q?DBj5knXd3ZZ//pF2AOWjIrdQlcfosU0uijWdWS+Np4zmTnJz8tP5Laq2+x?=
 =?iso-8859-1?Q?v5+wf8E14MyqkFKOZlXm2R9kKNFiy53ZE0kdShT37BwndUbNgAMlxfY53a?=
 =?iso-8859-1?Q?E7/+jtEf6hqf34tyJ3ugUW6IxnWgfvkrCoo3OBbCnfyq4Ha1rHN+Sx6WJX?=
 =?iso-8859-1?Q?QCl4gidAZ1ygmyqpxxLWK/fxKqs3EtEo4Sf51PKY2AHRmcfx1YFsuMtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eea25cac-7d68-4c6c-b3de-08dd81b938a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:17:47.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FlUAqlL6gA0blDDoCIs1M7FKuBDe6PHmPJyIgKgcxwCUHaVT1nAk6TzV/SpP2/G5VeRjuQWzjDpgN99Ah6d+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5887
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

On Tue, Apr 22, 2025 at 09:55:05AM -0600, Souza, Jose wrote:
> On Tue, 2025-04-22 at 08:34 -0700, Matthew Brost wrote:
> > On Thu, Apr 17, 2025 at 12:24:17PM -0600, Souza, Jose wrote:
> > > On Thu, 2025-04-17 at 11:19 -0700, José Roberto de Souza wrote:
> > > > On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
> > > > > This commit introduces a new madvise interface to support
> > > > > driver-specific ioctl operations. The madvise interface allows for more
> > > > > efficient memory management by providing hints to the driver about the
> > > > > expected memory usage and pte update policy for gpuvma.
> > > > > 
> > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > >  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 97 insertions(+)
> > > > > 
> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > index 9c08738c3b91..aaf515df3a83 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -81,6 +81,7 @@ extern "C" {
> > > > >   *  - &DRM_IOCTL_XE_EXEC
> > > > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > > > >   *  - &DRM_IOCTL_XE_OBSERVATION
> > > > > + *  - &DRM_IOCTL_XE_MADVISE
> > > > >   */
> > > > >  
> > > > >  /*
> > > > > @@ -102,6 +103,7 @@ extern "C" {
> > > > >  #define DRM_XE_EXEC			0x09
> > > > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> > > > >  #define DRM_XE_OBSERVATION		0x0b
> > > > > +#define DRM_XE_MADVISE			0x0c
> > > > >  
> > > > >  /* Must be kept compact -- no holes */
> > > > >  
> > > > > @@ -117,6 +119,7 @@ extern "C" {
> > > > >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > > >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > > > > +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> > > > >  
> > > > >  /**
> > > > >   * DOC: Xe IOCTL Extensions
> > > > > @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> > > > >  	__u64 sampling_rates[];
> > > > >  };
> > > > >  
> > > > > +struct drm_xe_madvise_ops {
> > > > > +	/** @start: start of the virtual address range */
> > > > > +	__u64 start;
> > > > > +
> > > > > +	/** @size: size of the virtual address range */
> > > > > +	__u64 range;
> > > > > +
> > > > > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > > > > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > > > > +#define DRM_XE_VMA_ATTR_PAT		2
> > > > 
> > > > In my opinion we should drop DRM_XE_VMA_ATTR_PAT as we can already change the PAT index by unbinding and binding the VM with the wanted PAT index.
> > > > Similar for DRM_XE_VMA_ATTR_ATOMIC and DRM_XE_VMA_ATTR_PREFERRED_LOC, we could have those properties in vm bind uAPI and if needed to change we could
> > > > unbind and bind the VMA with the updated attributes.
> > > 
> > > Ah and if it is chosen to move forward with those I think would be nice to have drm_xe_sync so we could synchronize the update of this attributes with
> > > previous submissions and future ones.
> > > 
> > 
> > I think we should have extra reserved bits for a sync interface so we
> > can add one if needed but the way madvise is currently implement it is
> > completely synchronous as all it does is update the KMD's VM/VMA
> > bookkeeping, it does not update the GPU page tables (it can invalidate
> > them though). A subsequent is expected to be issued if you need
> > immediate page table updates.
> 
> So this need to be better documented in the uAPI I had no clue about that.

This is WIP and hasn't been really reviewed by the KMD team yet, but in
general agree more documentation is likely required.

Thomas and I are on hook to review madvise, will consider what it would
look like to just make part of VM bind.

> What do you mean by subsequent?
>

Typo...

s/subsequent/subsequent prefetch/
 
> I think that only updating KMD bookkeeping will led to issues that are hard to debug, UMD could expect that VMA in running with a set of attributes
> while it running with other.
> 

That loops in why DRM_XE_VMA_ATTR_PREFERRED_LOC, DRM_XE_VMA_ATTR_ATOMIC,
DRM_XE_VMA_ATTR_PAT are only expected to set on faulting VMs - madvise
invalidates the page tables so a subsequent GPU access would fault and
pick up the correct values. A subsequent prefetch would populate the GPU
pages to avoid a fault. Also the first two attributes really only have
meaning on faulting VMs too.

Matt 

> > 
> > Matt
> > 
> > > > 
> > > > > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> > > > 
> > > > Mesa can make use of DRM_XE_VMA_ATTR_PURGEABLE_STATE but not the other ones, so you will need other UMDs to land those.
> > > > 
> > > > > +	/** @type: type of attribute */
> > > > > +	__u32 type;
> > > > > +
> > > > > +	/** @pad: MBZ */
> > > > > +	__u32 pad;
> > > > > +
> > > > > +	union {
> > > > > +		struct {
> > > > > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > > > > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > > > > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > > > > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > > > > +		/** @val: value of atomic operation*/
> > > > > +			__u32 val;
> > > > > +
> > > > > +		/** @reserved: Reserved */
> > > > > +			__u32 reserved;
> > > > > +		} atomic;
> > > > > +
> > > > > +		struct {
> > > > > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > > > > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > > > > +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> > > > > +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > > > > +			__u32 val;
> > > > > +
> > > > > +		/** @reserved: Reserved */
> > > > > +			__u32 reserved;
> > > > > +		} purge_state_val;
> > > > > +
> > > > > +		struct {
> > > > > +			/** @pat_index */
> > > > > +			__u32 val;
> > > > > +
> > > > > +			/** @reserved: Reserved */
> > > > > +			__u32 reserved;
> > > > > +		} pat_index;
> > > > > +
> > > > > +		/** @preferred_mem_loc: preferred memory location */
> > > > > +		struct {
> > > > > +			__u32 devmem_fd;
> > > > > +
> > > > > +#define MIGRATE_ALL_PAGES 0
> > > > > +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> > > > > +			__u32 migration_policy;
> > > > > +		} preferred_mem_loc;
> > > > > +	};
> > > > > +
> > > > > +	/** @reserved: Reserved */
> > > > > +	__u64 reserved[2];
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > > > > + *
> > > > > + * Set memory attributes to a virtual address range
> > > > > + */
> > > > > +struct drm_xe_madvise {
> > > > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > > > +	__u64 extensions;
> > > > > +
> > > > > +	/** @vm_id: vm_id of the virtual range */
> > > > > +	__u32 vm_id;
> > > > > +
> > > > > +	/** @num_ops: number of madvises in ioctl */
> > > > > +	__u32 num_ops;
> > > > > +
> > > > > +	union {
> > > > > +		/** @ops: used if num_ops == 1 */
> > > > > +		struct drm_xe_madvise_ops ops;
> > > > > +
> > > > > +		/**
> > > > > +		 * @vector_of_ops: userptr to array of struct
> > > > > +		 * drm_xe_vm_madvise_op if num_ops > 1
> > > > > +		 */
> > > > > +		__u64 vector_of_ops;
> > > > > +	};
> > > > > +
> > > > > +	/** @reserved: Reserved */
> > > > > +	__u64 reserved[2];
> > > > > +
> > > > > +};
> > > > > +
> > > > >  #if defined(__cplusplus)
> > > > >  }
> > > > >  #endif
