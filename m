Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43FDCCF9EE
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 17:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFB10E4FA;
	Mon, 27 Oct 2025 17:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuw1LW/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26D510E14F
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761585260; x=1793121260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3F2LsBP+igOMCkouOGu+x/WDMaHRySkiI6C+lzsUGyY=;
 b=cuw1LW/8qL1woZz4kn7orCajVSiCI91wR6fbANfooawuqZ2zu0DGEg9C
 btLlRIaR3xgw2fylM8aolwujqluoYoyL+NddhVsVOj8j/X6ol95GD+UZT
 BFBA9OnvKAiKypdcjL/swp1axIbWEGFnMWYpZ9lLKBHcthOwpk0yz7Gwp
 ukVXewOyAaXatwDNgN+r6fshGHdXYdN6F4PG1KRX7szQIhaA9qYkkRSNO
 Ejhnt5RS4YFDq1bTB3r09gMdETze7NQWDUrn11W8tDHDz7wN59r8EgY0t
 UdE+E2yAdnnF4w70kxHg4AvkHkQ/p2NR6fgOF4WIiYr9NgHIN4maVCxpQ A==;
X-CSE-ConnectionGUID: /2wDypciQkSOns+PAfbPJA==
X-CSE-MsgGUID: LRNvsw1sRzO7gvgQfXoYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73960291"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="73960291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:14:20 -0700
X-CSE-ConnectionGUID: kdu9vCCvR2Sn8NiQLi4V3g==
X-CSE-MsgGUID: Xlbt3k/wQASCfJHdTrKaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190232746"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:14:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:14:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:14:20 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGYtRd2u7MrkrwOJGI2Q8DBLbqw03pebClFiEcG3fHZho8scz4qA9SnR6JgNDMMhn3wk3wxIN7SiAtW4QKi+PRiHXxCC+kbaIkil7rVGnFFUBfchHXXhtjH8mwsaQGtnlOvEhARUJtu/rzbcr0UfLOMT745NMDqbHvqILieFTeGENi7XWlGZf/AK23VA8VX91s0/VEbLXYgAQ1VTINa83ZQ35VUWqeB31J1sLZcD3zUia3VwwjRGu8Ds0fkAy/ClJdRaFCOYNK+uxWPO+Krq8mJUt1gdm6JLqOh0v1Plh58HmN7au58IvlBXsDwbxqnSgNQgqqBYb6oen2oZ//FnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F2LsBP+igOMCkouOGu+x/WDMaHRySkiI6C+lzsUGyY=;
 b=P77hWE+qIN06YFrQ8jN09qMqQnTyNE2L5tC0XBxUx5QY9O8PgM7K7l5y2VGImY+eI0gEG8oQYAPxryCuU/2Mixz9hra3mIf13heUeHaxDQHJ8WUplly2d18I5PXJ8O918Z2K8Xl0HlREzdZmPjk9fqqNEIHF/5Mk1Gy0UwP3f7lly/UgDl1Z36CtL8rTOVx8942vOsOjIUoe4PLuFTFOiARaz60eFsDYolijTDdUV7U1UeOTp7qOnUhqpqpNvjUppghmIIVIhGppy7v47kWDTk5GTc06SABGq649PpD+ktK9nW0zvfTqJdPz/hMIrHsmInwOefeqpF96JJevR4Ha7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:14:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:14:16 +0000
Date: Mon, 27 Oct 2025 12:14:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/14] drm/xe/pf: Take RPM during calls to SR-IOV
 attr.store()
Message-ID: <tnx3o5b3cs7mdomtmlqwkriow2ohmufqlhjdjl5tpfnobq6au7@2yoki3ea2o3i>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020182414.576-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b61d75-db9c-42e7-572c-08de157c426c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FS28AsQrR125xM5JplcOXpG8Ft8MlzCpYMkZOmNPxy/CeNJ/p+3E6oX8tXl9?=
 =?us-ascii?Q?WEzdzLRa4gqv/ePMTdPC98SUuqHQser0DsgXcm8C0l934MnKTY5orQvoXXgu?=
 =?us-ascii?Q?nJu0jXELmN6leYMQ12cvU8mYTXcpJHI7Sfu81uAuhHpHsEjj3nehnAH011bu?=
 =?us-ascii?Q?TOAXoUzDpk9hs0b+cFIORXEFQP55Wjq7Jrlinyl4JddwtYdL4BZac5KFWhNu?=
 =?us-ascii?Q?4h0wVqEsEoBPKIip4OvhbX/kfJ3H4AD5qeS8O4bSoLGtrhdySv/uB2SCPbCq?=
 =?us-ascii?Q?w61QkKFyjGyz1DJaMtRbmmIwWKqIYd30LtRSaTd3Z79I+w4EYWx/aI4QAxX+?=
 =?us-ascii?Q?asOtxaav1lFAUU7AixlEz138sPiRFO9pf8fkWqJlHn1B/Urf458Hg66OGDCV?=
 =?us-ascii?Q?JrdcrzwnB4SHfU1dPikbZDMXXXlXfDIu37N6dKYU00qDtBpRo647NkZdCLNR?=
 =?us-ascii?Q?tuiRlVMpGf814L7jwHhG9MUB/UqJW17SN3JTWoWMrhPWO0YHVfxAduSu35VB?=
 =?us-ascii?Q?FuzNH5vjHiuKMIGSUIIFcxmjttV7qagBfH+bkk2ZOTQBL9BhtTBPhFr00KJn?=
 =?us-ascii?Q?cSL4K2uUjkq6Wz/KTt6D0a5Wp4U9+be3fRdYPDaB6H8KRhWSJP+18OEp2s4X?=
 =?us-ascii?Q?CyXaHJYCFBPxfwy6AIzoIXOzjmYeGAXZUN0cXHzWtb1UeB3SYAyKCciskYWQ?=
 =?us-ascii?Q?NFUJue7e0idNZ8Q2qOL2ANePvhckUn1V7IhebZptnLkhZ5PlBELfENrNxkGZ?=
 =?us-ascii?Q?+qZHieMxBACquc50Z4TchaUVM86OEIJsk3eWO8OgFAvOpr/Jyno4VlAnAuCO?=
 =?us-ascii?Q?OShfzjDzr7uZp5zOisPasF1kwXQdccelYcr3zw2/yi8OCCf3jf8eF8Z6+d+m?=
 =?us-ascii?Q?bv8yWFxIURaXaXAeWt14OUY8ARXJ3UV2oWJGApdY/Z5UCt4u315QVOL8Bodr?=
 =?us-ascii?Q?a94hBYvFPg6Dm6HvU43AyCS2wF/Crh6C4WIhJt0W4cRNOoF7fzs1aMn40GAk?=
 =?us-ascii?Q?+kXtgvpOTaEpNX5Xw7Ddb8iGj9NEkwycxEhyZcrevfuYgPCvYWPQ0AojbdSa?=
 =?us-ascii?Q?S79YV24vWMlA+CHTbgmKENHIJhh6pv8vEwVhf+LXPA7bN0GGSd49WE+MS6x2?=
 =?us-ascii?Q?mKKp4/ECKYSXT0uT6qhfNp/DOGRUG+OOeIAlr/VeKZkgAMdSQ9zX/zQ2ZAP7?=
 =?us-ascii?Q?3fDkw48g8v5cNjKcQ/ojeeM6bI1q2qXaUbrCUadYtrd2Tcg/Xvy0fqVXkviD?=
 =?us-ascii?Q?TJvALs7NqfAiuyA5QoJ03SQyswN4auA1+7QzGdj0pxkwqGqf9rNWbNRDCt1o?=
 =?us-ascii?Q?/XmFBLt0D+zzcOInHrh2/Z9ih22TLZeyll1r3wnABHrvg+kSnjJUDC4QGSVg?=
 =?us-ascii?Q?+q3zhkKwN155GguyJL+Qz5csc9VaKHrh99DrLcbAMsHkUVyJfgXMZBRsUWr+?=
 =?us-ascii?Q?RZyTyKwf8oLjwAl2gtacNTWE/wP98+iW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u7qBPQaiP0+DRXCAVVRyypiKJje/0O/e2yNJPn3Ln9PX58w2OPjswcOnKOFc?=
 =?us-ascii?Q?3UjGv41EWDK8KYITmydmSQondQUmzusQhHMaSoWz67JzcW3DXlCkDEzqPXQA?=
 =?us-ascii?Q?0jMXgmBfdjrtKXC9KASUcGZ/MOMMwvYlRP/sKskQ7xmfAv5L4cZPAMGgkxOb?=
 =?us-ascii?Q?qT7rZ/+REIQMlzX8hPucDQb9roGkJ7OrqmVLlNySbjWg16AfUDL7B6hgnLE7?=
 =?us-ascii?Q?5YxLtPV85CQkF+VEfHGlsEjCbypvmEr1mw85rDBPrpKnyuGplP6Lswp3bcYI?=
 =?us-ascii?Q?9zM/TBzFAJpu5QdV44K0eDk0DMd7JN4IaKC+6qyzmDai4/XkDrsB6+gh/R23?=
 =?us-ascii?Q?YNUiqUR7f+aZol03TEmFEgALWDGcYx8xOGad+NPd4CVv9sA6VWJTHqs7CfHO?=
 =?us-ascii?Q?Qsw65TAVRB/GnD33GpLxAh53NmBuz2w93u8h0vzYnzMWvb82n6g50gBlPoBI?=
 =?us-ascii?Q?AXC+LDghyrFLuIAe0M0mnOmjy7dcHtt357G7laDs5fWF/fijjOR8WjDRe5Hx?=
 =?us-ascii?Q?YVd6Dt96ungrbWh3aXfbl8O32X1R7nJkINWVrbTYnVzk6RB4gVcAuLhWceBe?=
 =?us-ascii?Q?xsiNY/Ya7PCILUc8yKUN9CX42j++5tg61LiWvoViSDIwO2ZFynhSrPtYwcPf?=
 =?us-ascii?Q?GpHxYPrds0laOLxb0rSiBKEUsTV0mnjv03+7I8KAHyfNCWL8dY3izL1dJz7R?=
 =?us-ascii?Q?wgIGsmk4x8Y6BZbqV3Sjxb4tJyJtT1aHLrsAJjenUB/ggi+ihW/3sErfIV94?=
 =?us-ascii?Q?KOplrzcsipGoFW+ucM3Y6uWWi0M37Vnd3iGZ+Yj1UgmwL9WCc5K7FnOrMOSt?=
 =?us-ascii?Q?SGIVKaZALBiQTgOZ1jtD15w+dM2bvPLiwTv9pMKnvdsbQ6IvskeJciMVpxrm?=
 =?us-ascii?Q?/xdAK+tR3MamcB/YhLKzT34Is/NwSkxj1xshc8fqupt29+d500AU4aKnLthC?=
 =?us-ascii?Q?PUhvOGWn0b4yAYrkXykb3YvN0RLYVvJSlWGisjAZeK8RZHFdx0OUNhyXM1zk?=
 =?us-ascii?Q?ItAtEtdJswCujrpEmmbjD69GxvkRFFK/Jwga1aI/e8AOwBc66nn7VAn/vYla?=
 =?us-ascii?Q?WbrDSfZZGirdDHHGf1AsVgx+zPY8x0c9Fwm/QwZIfQ/JBleOr/9RmZ/eIk/W?=
 =?us-ascii?Q?3KeaoULzW6vR5CXNpfKlFlQv1RSUbaPsPS6IxAMZHBjKzUzT+dhaN3YOfj5T?=
 =?us-ascii?Q?coZP2fP0yhZlMvtvqoxXHB7syK4Gie2V4ux24l/tAMVi1GJ2DcUGEJXnM8bB?=
 =?us-ascii?Q?Zc05xPXQsY/nrbkD6D31s5lPN8LANOJrJFSYcs/tCWT45TFq75LWyrsXxKt9?=
 =?us-ascii?Q?SGX1/iZRW+6s/HcaWZcQAYQHBaIP1SAXJhGyFraD30Z4XU2WTgpKxdlYjWgc?=
 =?us-ascii?Q?mY0FJVTrx5e5WKT1Pm0Uuq/LXksJ6PMUwYqM7NiUjDSm51Y3fHFvxnkIPu2K?=
 =?us-ascii?Q?y3KbAEt/SLDGp8VMfdLKJvaNx+gYaVMqf5NMHh7O048PCVPIzeuu8Gstfdft?=
 =?us-ascii?Q?s435t8uONZVrZgG9d49XFTvPPG2gUrb/beQhQJMU3fJapqwGg5D4aCHdrhVz?=
 =?us-ascii?Q?B7wArLSejZfAxx1wBSsCyEZM+ZJAi2vC93wkJpTlH481h4hUWGQxdH8RR1KD?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b61d75-db9c-42e7-572c-08de157c426c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:14:16.9453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYfDgw4Zxte+m/+vKMV3/cCRK4S4F9rqgP/JXa7QLwUy8Gosx+7HBpkzZLXQJp4C6aTpaZdbGeMqRF9hg1jAk36JIQDo73YhI+2B0ny+4AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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

On Mon, Oct 20, 2025 at 08:24:02PM +0200, Michal Wajdeczko wrote:
>We expect that all SR-IOV attr.store() handlers will require active
>runtime PM reference. To simplify implementation of those handlers,
>take an implicit RPM reference on their behalf. Also wait until PF
>completes its restart.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi
