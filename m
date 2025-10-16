Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B005CCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 13:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606AE10E9E7;
	Thu, 16 Oct 2025 13:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjkhdlyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ED710E9E7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760623182; x=1792159182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YuUl/Lp1wh9biXbJt+qKGok8N+GPCGZQJ4BEIoGWiag=;
 b=jjkhdlyMbVqFV0PbQ6tD21vsVrTNBz0T/Y2L1oibDC5i6Yl/8GK3LvFK
 a2aeUUTGEyoP87IPzlUMl6hYcj2uOHIgqNAvu8jQpdwmTIRH9l+gu7g3W
 rera2BRWVYaJf6dLixLbhs7m0MD+pI+RRVarJCH5uKjvZflpxjao52B8L
 y2odKA9Efeg5CzReF7M0bRcrHJSBWT7HpHXD/B64LtKypzTqOnImXuf7U
 GnmdYwIlWlsmZh7A2wNLyrcoLDyc7IyvvJXSrIPPVZW+9xUHpCFU9CnC2
 2e2JJMy/N+KM8T8qM//KDilnNSLYOfCFvfs4n/hLjObz/tkL5NW2rLwvx w==;
X-CSE-ConnectionGUID: Ns3iV6GKR4udNx6NU3Fyng==
X-CSE-MsgGUID: GaZE7tMxSsGfbqnje3TXPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62025903"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62025903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 06:59:42 -0700
X-CSE-ConnectionGUID: bhi+5CAiSnGiz9t+5bMuNA==
X-CSE-MsgGUID: L5r1qEVnSDqyGYuWD4znNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182868372"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 06:59:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 06:59:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 06:59:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 06:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVkRDRssHAutRbbBzaVSvXNiL7sa6hZW94+BmbbVo/pqotzPzBbf3uvENN913oo87jezgIdxh9M5lA2ACdX7N5wEcpPz8EVYsIX3iuv9eC9doymfU4Zf8VoMgSNYYz5oBkri4HzPoPWnaT7DgOZ8UguyiD9D9Ija0WgxSrj/EfVDk/ss360rl7BCJTyQl49+wVFdw2v+6Jds9sHmwi6XaPOEtc2BEP/E9GDQ/U7GEc4RcHh6P/jLalxNGfeUMEMMWLCaM3FDuBWbAFAgAt7+ibUBpYjEIIQnYrKGWwA5z+qle5TIJQcXckY2dFe5qMmsTATz3XfLYyCMePs8hQ4jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQECXVq7Rlosqfb4DWz2FpK/ozcvzGi3RZkooqvokfU=;
 b=ITw6Tyio64ca0D0HdAg4X5vu8Kv+qCa9rwAHkXhzgfZR0FF/UNJ2qxHJOOQnOWbKx6rogblw4Ihz6gYqAAvW7C1q+xW0cXVLP2n9711G3GKbuuYDn8kF3j2JVRuEujXe8PlF6gR32SJUDwBJi/hJotuzRG4B5kLsdkgRx5NT677Y/DqqGDgiKm5WvMEmGJZlAw7kBhIcL30z7Az622RiTCQwbPv0g+oweVnLmOn5g5jbgtW05J8Z1PStEbxdr5U7G8cv8nPabTcOO/6D5jWQuCiK0F0B1jMws3yrTHkCWjbSkrbbNHSZbq9sJsSogERttRAFotCmO5MblCCd/Aq+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8228.namprd11.prod.outlook.com (2603:10b6:8:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 13:59:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 13:59:36 +0000
Date: Thu, 16 Oct 2025 08:59:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Lahtinen, Joonas"
 <joonas.lahtinen@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Chauhan, Shekhar"
 <shekhar.chauhan@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <q6kh6f3irhjbeamygfujaoiiazksiiiatvbiqfdlfnewkzqfx4@55g5ahohiuqa>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
 <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
 <2c4yb7mcc5r2nbnnb2ncg2kmjhl2vp62da5u3gafh7lz7uudyk@nkeqesrnpbqy>
 <SJ1PR11MB6105ACD99635C212C80B80A5EEE9A@SJ1PR11MB6105.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6105ACD99635C212C80B80A5EEE9A@SJ1PR11MB6105.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf0e151-5b6a-498b-effe-08de0cbc3dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nQWUwoecKFmW7ZaAYfGODHQTXQjuIk9xyUat7ONKmVOUpf4Ti+/sTTxGy4Qk?=
 =?us-ascii?Q?WVB8xhKlOzmQPJz7ZSL1/pB7Ab8jmXVNGaolY9on03fHQ+Zh0ork9AgoyKtT?=
 =?us-ascii?Q?5UWmKfDdG5VjHCFH5yEZol4Sqi7Q7SYjRzvVjC6dfZHkYPiSrKKPvV/9qdnM?=
 =?us-ascii?Q?+VX9zcNauAhcpQB1CCIESJjDtoQx8mSzmSF0I1MuGNeOba1Ws17/mQYY0PnQ?=
 =?us-ascii?Q?D19e58X4lwYVMxr2YCCY7RGnun7wTWD6L80FykrJ/Y0ZRrlQlHybSAcE/d0T?=
 =?us-ascii?Q?EBN3PRAFJcFIiVtOPPdI0OQEWLensyAeCfEh3jCvQzBO623RWRaRcFFb9tIW?=
 =?us-ascii?Q?ZqC2Rcang5kRjrdfmHMS4pqeS9ILkJcKT7f542VCviHq+jZN91dnUeJelT5w?=
 =?us-ascii?Q?IQgo0zU0nMzpeEX0vgTIJfbOwKoEcU3TFp1V/pFSJ3/zD2NK86k49LgQeNEP?=
 =?us-ascii?Q?URw6Ni0L3kg4KMhWE6d2mPYg9LCMebsEGO868/8EnFGIC7kHq+wPuQpBmw1c?=
 =?us-ascii?Q?5L69IC090jOqe/o0C9DDWAXvMtuvUWFqFNIIPzT6aaifEwZ5Y2/vGo/etLsT?=
 =?us-ascii?Q?8zbe5IoSZ5Vn70mCIXCIRj6Q0wUrI5jW7LfIcSp+JBAunHUxSYdWKS9lIm+m?=
 =?us-ascii?Q?54q/Ys5gSwn3FNqHVM5tmahtEpZWzR/wnF0Js7DEIQeYTu2cMd1BYjvJwW5T?=
 =?us-ascii?Q?jJrflgQH1/O9dLay2jkzzzOaABA1tBQ9akTt0x9Q75eZUsl/LZp1J9BYcA9c?=
 =?us-ascii?Q?ADFSoluQLv2tLUheQccWxEmZFi+2PDPmhZ9WNgBUG+8iJ1cctXkOLvIN9rDY?=
 =?us-ascii?Q?OiiHBwst21gnzqukg1JtMpuDlz4svB6UeEZOUVVjyTLiTtg59lbSsz8emg1V?=
 =?us-ascii?Q?GcieKm1M9qYI0Ipjg+Y0uzCLpyz6qnXqveKK8hfPDNMz+S+SfwS+WQ+Sxdgy?=
 =?us-ascii?Q?VfcUSRZmB69Ma8+7/NlAR6xMK4+Tr0+GvJWujLuSRzLbAka0d6hm/VWJKNrT?=
 =?us-ascii?Q?jl6crjNtpdhTmClrSJY7dfx1cg4M7DZb9Z9gIz8zqouSCOyCwV6wpJZgKsDr?=
 =?us-ascii?Q?2ZM2BAHoFPUnlIZoXDXmfSoUGuTQH5O/jAkpe8sV3ONUrPxdMvoa6jDZMqVd?=
 =?us-ascii?Q?+l8N/8ZgoFgfs0sSMiBijF/l2lQH2sm7QTlabIc4psANbEMSw7/ls6uUunp/?=
 =?us-ascii?Q?fsDI8OKQVH49UkDtQwywbn4dUchLbvbB+Z+04okqycOFNaG7o9Wbs5swLOc7?=
 =?us-ascii?Q?/ymQ7WYgqElBg30R0pUmlsuiV1L3bWhlO1IbJdzKJPdHHPciL7yZrvxvLA32?=
 =?us-ascii?Q?3h1t6huw58t4+wiw3jrdPNIqxLZwJy1E/FGVm7dd7k1Ij+VYYFRGoZ963Ink?=
 =?us-ascii?Q?VHcvxtqFgCXUegvXe+Im5XfYt8MNIY/D/19rEoTiwDTBa5aCdcn3hqawzakd?=
 =?us-ascii?Q?2pNEi8M4KEtkAqyohi5GkccDSRJRFbqY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUGpHEkCr7HcrtinanTmz5n8LuH6ifWDtFteRZiNbacuKn7vQWubwhgLSIpr?=
 =?us-ascii?Q?lkX3d2beh/LNVzlc3iK1Rzi8yxbMHzKgn0P1asUtqC4T7caeDm/bLgut/Zur?=
 =?us-ascii?Q?NWcLYJhlKVFeGx9cCnBh0Nc1F10HdX7g2ajJ8S04Gr/xKwLS24AO52/pUmhq?=
 =?us-ascii?Q?c4AWqSr6vJe9Yn5XXetb+mp2fMP0bk6/sFTxfXd3aCCCbBLuoahYmCrrJSOO?=
 =?us-ascii?Q?Lo+Csk/eel1OP7nikdDbmc1C1UbIcMwLlCmJulNjMkYZI3grv9l4BAobg8M8?=
 =?us-ascii?Q?KxN9JT2Jz2qyjrJSXvh3FrDYKDTVK6ghRFerc+Fe09izJTGdMylLtUkJ2DAz?=
 =?us-ascii?Q?H2GK1ojxGCrH3XaYxYKZ7AlECxN3p+O6H48iEIUFisVGSAv63rgd6M7B6DQc?=
 =?us-ascii?Q?VSDpt0qNkbY52CwruWXBS/bgbX5jXigPZHwTMfB6FHJb/lRW0+rvZH1JGNjH?=
 =?us-ascii?Q?+nz/6jIU7F7x+p1D8K1BY9Dg59DfKZnydSB2N3h5ON6HUtY4dREBZHcTmiih?=
 =?us-ascii?Q?t46IkG130gS5wGFGfky5APqfSU0TxfQQZ5dV5y4NBVyKLs/C/zWQi+OixK3A?=
 =?us-ascii?Q?ooHZnN+22DUwD9czepaewawek0tR/pftO2bswhvntKmDbTR0aakfWSTRIBY2?=
 =?us-ascii?Q?bTIB85tnXKxkMYCKxV7eKQoEHLp/TYSnoXHuW0HQk/hPiTscTMecSUCPy48h?=
 =?us-ascii?Q?xUJs480S6WBx+klH0hkaMHpyMISEqfks0xPXBO8dXMyHZZne7hNZ5oCaNmiZ?=
 =?us-ascii?Q?XScsHBZvONMN0UdLgxqlNfC3DISlzqeXlfUYPD+3M9cLTY3hlDJKkqD4joal?=
 =?us-ascii?Q?CFOGLjLkdy+e6Bnah5wG5x4iUx2KftOIuXOViiXCeZOZJwq4uq+KYVnH6GJz?=
 =?us-ascii?Q?D40pPSfebloGG4fD2CLgYnJ3duMkxCHh/ruSwgWRdLuoo4MqTP7OWPjrlirx?=
 =?us-ascii?Q?4uQ/hLqzcU8qdLmhdGdsZOgOJScpLfoW16I/kLVZwgNZsMJfRhcp/uifUw7z?=
 =?us-ascii?Q?sJYbTWr3BnDJRPSg6hL3xdADFsWLGCPOk4uHc0PkWe2Lm+F08wVyAepub02a?=
 =?us-ascii?Q?GNwGezqWDPRl7LWh+fp3eMQPB7MtwDIlb+R83qDJfzZZACy2QBvBIkbis1O/?=
 =?us-ascii?Q?aYtA1DI3CnvBauBuyHCRorWRY3DYNVPYQr6EAo/lFenPxJ8tiMuOz9FFc7H9?=
 =?us-ascii?Q?nSQ2kfSjRFlHWKlgkHnu7V0SJnpRiO8q9ZunTOjQekSdUsTTLeV7H8o3YfMQ?=
 =?us-ascii?Q?ZWs/erIa1RiXjJSvPoAkbhSd+7IUPbHZZKGYc+SaF4W5HJyybiMJ2Jx0yfgs?=
 =?us-ascii?Q?VsuTvh9Bjk1wJi7i/0vHySqs5XkmIQb9m9Lww2CAidkylojSahKTgCzm+jFL?=
 =?us-ascii?Q?QhJVpINGLQ5bUccRRNHM6cg+LwaR51SNhpaLFCSW/ybTOrwb6rLHJHFzwamq?=
 =?us-ascii?Q?U+62/JewXtyVgLuwA9TEKZ3zSvUH9RUAytOG84JxouXuFVfFEYslZiT3/5Ir?=
 =?us-ascii?Q?QN/JcTCeWMdWYnjLOlk4X2521UfGhhsbGcuyqHoI5hXK/V1n+wSVDXXc4wGT?=
 =?us-ascii?Q?qMG2K42os5COO/P2WJ8Edgbyu7F1aRKFVffpoHWfvslw9jvioXV9HTTT4sZz?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf0e151-5b6a-498b-effe-08de0cbc3dee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 13:59:36.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fKw2S9yZ1lxwyHeKI5yqDYHla2NS3ggFwCdDLmSODl7uxfDczvx/VEpHuggl/y+AFXUjJ9P3V5kdgFt2dT2+exhVyO4AFbu9Iu88qxvE9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8228
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

On Thu, Oct 16, 2025 at 06:52:20AM +0000, Muqthyar Ahmed, Syed Abdul wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Thursday, October 16, 2025 11:03 AM
>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Chauhan, Shekhar
>> <shekhar.chauhan@intel.com>; Vivekanandan, Balasubramani
>> <balasubramani.vivekanandan@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Muqthyar Ahmed, Syed Abdul
>> <syed.abdul.muqthyar.ahmed@intel.com>
>> Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute
>> walker for non-MSIx
>>
>> On Wed, Oct 15, 2025 at 05:07:42PM -0700, Matt Roper wrote:
>> >On Wed, Oct 15, 2025 at 03:06:34PM -0700, Lucas De Marchi wrote:
>> >> Current implementation of compute walker has dependency on GPU/SW
>> >> Stack which requires SW/UMD to wait for event from KMD to indicate
>> >> PIPE_CONTROL interrupt was done. This created latency on SW stack.
>> >>
>> >> This feature adds support to generate completion interrupt from GPGPU
>> >> walker which does not support MSIx and avoid software using Pipe
>> >> control drain/idle latency.
>> >>
>> >> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> >> Signed-off-by: S A Muqthyar Ahmed
>> >> <syed.abdul.muqthyar.ahmed@intel.com>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >> v2: Rebase on split mask per engine class
>> >> ---
>> >>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>> >>  drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
>> >>  2 files changed, 7 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> >> b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> >> index 7c2a3a1401424..9c46b5fb81412 100644
>> >> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> >> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> >> @@ -82,6 +82,7 @@
>> >>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>> >>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>> >>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> >> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>> >>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>> >>
>> >>  /* irqs for OTHER_KCR_INSTANCE */
>> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>> >> b/drivers/gpu/drm/xe/xe_irq.c index 103804546b280..ac5524cbe4b9a
>> >> 100644
>> >> --- a/drivers/gpu/drm/xe/xe_irq.c
>> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> >> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>> >>  	if (xe_device_uc_enabled(xe)) {
>> >>  		common_mask = GT_RENDER_USER_INTERRUPT |
>> >>  			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>> >> +
>> >> +		/* Enable Compute Walker Interrupt for non-MSIX platforms
>> */
>> >> +		if (GRAPHICS_VERx100(xe) >= 3511 &&
>> !xe_device_has_msix(xe)) {
>> >> +			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
>> >> +			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
>> >> +		}
>> >
>> >It probably doesn't matter since our execlist support isn't functional
>> >and we only really support GuC-based submission, but technically
>> >shouldn't this be outside the 'uc_enabled' check so that we'd also get
>> >these interrupts if we tried to use execlist submission?
>> >
>> >BTW, is there more support for this coming in future patches?  Without
>> >MSI-X, what's the mechanism by which userspace finds out this interrupt
>> >has fired?  We're unmasking/enabling the interrupt here, but I don't
>> >see how anything happens once the interrupts start showing up.
>>
>> Himal / Syed: any detail missing here?
>>
>> Yes, AFAIU we are still missing the change in the irq handler to get the
>> notification and the mechanism on exec queue creation for registration.
>>
>
>For exec queue creation control can only be supported on  platform supporting MSIX .
>This is for non-MSIX/MSI.
>For this irq handler just need to wake up waiting kernel or user thread and that is happening for all irq lines in handler so nothing special need to be handled.

yes, we will wake up the waiters on the ufence, but then how is this
different than the pipectl notification? Is this part just so
userspace can be compatible with non-msix platform?

Lucas De Marchi?

>
>> Lucas De Marchi
>> >
>> >
>> >Matt
>> >
>> >>  	} else {
>> >>  		common_mask = GT_RENDER_USER_INTERRUPT |
>> >>  			      GT_CS_MASTER_ERROR_INTERRUPT |
>> >>
>> >> --
>> >> 2.51.0
>> >>
>> >
>> >--
>> >Matt Roper
>> >Graphics Software Engineer
>> >Linux GPU Platform Enablement
>> >Intel Corporation
