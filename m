Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDFBC7113E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 20:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7A10E71A;
	Wed, 11 Jun 2025 20:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDe3uiWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698810E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749674209; x=1781210209;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/FPGwmhlDIujEsNtPrnl7r2Y/CJm80WQh6tenIepqUA=;
 b=fDe3uiWz3PwAYr2MxhP9Dus95LE+8h2QtO06058SGUqDu6xhps1Umi/A
 w7ff1aRGD1QUj/2fUPskdaTFjd11j9F1fB7oVlG9LTfSLpKwtF4SweEky
 ZUETee9EBJISfFl0Mi+q7PziIJb86vE88mz0PSnQM5eSu7kb24KLuqKwK
 td++fts0Uh2ju0MMHt8uOhLVrb9nf8jUysO/Xh31dtuinIPE1gJQUrIQb
 VxaH+M+ATYssFYGOErOUNo3jeZCtJwdff/cfOzdAR1j3P/lE3/7a6ZqUE
 65ZpuzuoKw7urJ1HS+k0/4opk5WQ87EyCx94SjpvGbzkRGwVZrrO9G/NX Q==;
X-CSE-ConnectionGUID: tS/3063NRZK4vu3rIV1HkA==
X-CSE-MsgGUID: EczmfHM1TwyYxHqZ5cm7KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51698988"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51698988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:36:49 -0700
X-CSE-ConnectionGUID: 4WL4AE1URgOwrC77jqc+Tw==
X-CSE-MsgGUID: vQwdm2MgSpGl3xi5u5Rp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="148214932"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:36:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:36:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 13:36:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qd/rg1NFtG8UGbvJlMTdMhKwdJxgstOYm0eTI0t2PQ2L36QKmW7fc6b1yDI5V5Isi6k3OFTTXlNUYdD1pOrcoUqj8q5MrYaQZ4oQDgX/W/Ag9m5dlSUT68zvH2pyfH8PBGT+bWqc2oN67PuTAYyCZeYgUxnq/22LrljeALgpPeRvT0prF1MquBWNPXUKbJ/IxmwYOPQ1r8c+NKLJ8rD1649EALdMDcFwhiFFmBxM/HTjLWFGTXznMx0MzYIjS1Nf6m57AJvdHVjpltByk+Dr0ONIgMJ15E8+nJPs2YePzoiBmX7nG4sdRJzBlsDQqM7og6xCc1KmZCs4Z/+bPT/X3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S/OGNrzG/+FgOrlxaL/NztcKTHfMNpluZCcoB32NyA=;
 b=IIbGGFZhXTGKVj3vbYySLCuUCtOxbyYnHHr0bhybiG1MNoDEaP6G5kq8df/CKOXFe7SJwJEzoFqq0u2qWwSXdpdg1/7QMhDqSrXp93HaC9aynbhXeaQ44TbwKIYbch/ItXYEmamKLyVNxw2sUw4VkWyM3PbuTLBubifaUoboeEM8CBKMpr+iPwMMicU9yInkvoGud2+ltFPneZudy3G3oWWfBkzJSE4JN2yNZFoaSo7hXkfbDnYwTiatzki3gPFSl128dpoUYOwE2rsFNcaxS9yn4TY3DxZEUuPLOVS9fXnnmhyadXxsAKgpTUIctEAnP9A8hpdvPZ9gH+QokG/rZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Wed, 11 Jun
 2025 20:36:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 20:36:46 +0000
Date: Wed, 11 Jun 2025 13:38:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aEnpPWcXoY9Mz9oE@lstrano-desk.jf.intel.com>
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
 <7c4a125a758c00a506927cb3549736c1eb9d3886.camel@intel.com>
 <aEnKG6LYzYE7f3eK@lstrano-desk.jf.intel.com>
 <dabadd3dd43fa70ce9a13f5f507bc6b421673d8a.camel@intel.com>
 <aEnUfsBrPnVejB65@lstrano-desk.jf.intel.com>
 <3ba202fdc129e510cffd11d824948eeab8b29e71.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ba202fdc129e510cffd11d824948eeab8b29e71.camel@intel.com>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 311fa596-2cc6-4c3d-0ffc-08dda927aede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qSnB+drnQnQo6mZ2sTsw/L67kvT2BHK3/5xBBwZcQzZ3isZPZ3V4Lwo30R?=
 =?iso-8859-1?Q?NDMly+JMKYQQ19c4gBbBVQL4aO38EFrzLx7YmMWY+IRv5Cr64RgjJp3ISX?=
 =?iso-8859-1?Q?+wn9PwqgUP1xSkG1TTXWjl1FK1Y51Yw6RhrmbgFUdIOh6H/lGZIJiPD8qB?=
 =?iso-8859-1?Q?Vm1KNDNri/fzBquEmyzSFdoHMqy+UWUmmLRbKNHn5j2e8Us/2F2h55mmSH?=
 =?iso-8859-1?Q?rs1CiB1KSH9Bv3jDo0Y1SYrfhHQyX+oqCrgr2fZF0SdPg6oS5Q5F/UeWGR?=
 =?iso-8859-1?Q?R2CbLm4oe/PsMwgfyWGm/M5sAUGOUj9eB21Qh5z0HkQotGmYFKBTLbiZvs?=
 =?iso-8859-1?Q?jrVCXlnYi29jL/pxWsP8PlUQMFarVDvSDIDTM9EYaDZvKb06zKWN5FnVPl?=
 =?iso-8859-1?Q?FcAtd4KhTYqumdtUocPFHHNNC2hiSSG4UAjXvlJ3viNrw8jD/QSseAAqql?=
 =?iso-8859-1?Q?0ebQkl7f7d+IBEDGdV0Do599kp51SE+TxKPw9Nc5YrPRlItGkXSUtkMnjl?=
 =?iso-8859-1?Q?b3cM3EspbzuNt4oGjzWJl/G++eVGJ9jQxulLUEatMjRKmsmgLEucLe/WHw?=
 =?iso-8859-1?Q?GFQv77mSiWtNwNJA+h6sCqJCwIEzc7QOwcJ2fm7pqzi5wzYzUTV0VpFm9Z?=
 =?iso-8859-1?Q?L9hFFcL2kR2qZo6OqImC+foPmIvwT7TVXN08Z7Al1aVt5uI+r7PFzBtXTd?=
 =?iso-8859-1?Q?eUKtv5qUZPvU8Uip0bmwEeNeM0PvDFkVvC9Tk8Kk/Sx6nYRCyaksiznZkI?=
 =?iso-8859-1?Q?0jHe0aMeVOzmx5Dbbp/meMTzAY0uNpAXFWPISL3Ddx9lu/RjzXenKqTFv9?=
 =?iso-8859-1?Q?bp9YQaHvq5oeUz90zbXZkDBMq0LivgvBrP14T8ZVuyn9o7tX1ZlfaNHcTI?=
 =?iso-8859-1?Q?AFJth3kE1pWsk+qrcEqw5pan9cVWaDCHLD5SeYCnd8LnPqya42ZgZI/JeC?=
 =?iso-8859-1?Q?s0BX22stzfZj3nhjOuqXKpxrbcmY0L8djdLgfNZyBkJK8GZ1qDQlC9gToh?=
 =?iso-8859-1?Q?HiOEV1vXfmwrwfUtQu9G1XCPTltq+f3Oz9CgaKgswOgo+eB/JT41YAnEUS?=
 =?iso-8859-1?Q?4HGyVFSdzL6K3cCSI7mR5BLyl9BZcBfj3uhKhfQk3tsDX2R8fQslvnegFi?=
 =?iso-8859-1?Q?bLYWfNhkkLf9QqqrafZlb8dUcM1B2mF3QtsewbZ9xTs91HoE3QAFtPQgPs?=
 =?iso-8859-1?Q?roWSaKHSQY+hEENDPV7n3BxRN9Hf7Plmbs/dvDKZujQrZ4iIIhqel6ftTX?=
 =?iso-8859-1?Q?BxbKvOdJ7BnJvvIHyCZI2qqk0olIuna+x5u5gbpbDhrXRY+9UVb/8bVRZw?=
 =?iso-8859-1?Q?Ff9FEdxJpEqgVwKFEBPXV6Nx3LJzCOYje3FXkBjF8LsG4NAmB4hAMoNRWV?=
 =?iso-8859-1?Q?dQ6nINoMMMsqd+Q9IA13gVgj/JR6vUqJ12HCbJAI75sia41cZHt4MiiGmp?=
 =?iso-8859-1?Q?1u8GYqb1si4gReeqJjg/sBVNAzD9YGyBMi4nNN+uaXWyZ38UHW/sgpP+ct?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2GadLbHZZjIX25r/37UHLJAdgErOdNsRb67kvaUfGOgmqX2uB8aIXMrTkk?=
 =?iso-8859-1?Q?uIfoLUhgAsV0XUPvEBsHXScUYE3CyWEnEEdrrjrtpJRPewxPcXIp07esUw?=
 =?iso-8859-1?Q?sFjFy8uPvCfupcoCjHcGcdKMtCPX7S1rGM83dx/BNlvgfKAJr9JKlbrKKo?=
 =?iso-8859-1?Q?05eaMJ54aOPnUVL9Xk54Z0fMRaEA0AE9heiZq/kxhI4huoGr6uzQZ02yog?=
 =?iso-8859-1?Q?2nXWbcq55VWhUOD+YcUL/pWwzv7tME93VWd+jvzXggwvzaQkJRTRQVtTuy?=
 =?iso-8859-1?Q?ro/bKXwZS8R4ejA88rxaDOddgvqXpzdxk1d0+WygeYzTWx6KJHIbtJib5e?=
 =?iso-8859-1?Q?xedtpnXXjSMJgO8uO6UKdVQUYVhHvsGgh2GMWi2vfgzkRblowIcc+oOEUb?=
 =?iso-8859-1?Q?NnkM0vq/SGMqpCoW9uTWHz2NkJKcjN/eeGIIV92QbnLocQfi8D49zHQ73b?=
 =?iso-8859-1?Q?NTcIFmfjIksOSa90Y1LLE9sLmhcKp2y/gmi9w8EmvtTHXROVs6TXtbmjv/?=
 =?iso-8859-1?Q?mDeVIwZ23O2dtzXzvJaA5ZX4XQQTdLRcy2EkAT839WghlIgu6kqSdFWKWr?=
 =?iso-8859-1?Q?9v7E6rdQdRJ7ZZRHYbkd3Oq2bYxb0Ed9ID1xdUO9ckXmIp3OkGTKzs4f2W?=
 =?iso-8859-1?Q?NZPRMGyeM/SA3vASXPUGvYJBn51r3M4eBuHo8h9wUMfpsruuzbIQlYq2yt?=
 =?iso-8859-1?Q?WgSJGkbDqX+MrSWZhwzFvnAh7c4RKs/3jWrCkaMa/+J0npE75OSKiS0CnE?=
 =?iso-8859-1?Q?g08/CcIav1JszLBTmEWCFV52WfN5x/A0NzTHLuSrLxWQ9t02tDVWzFfQ5E?=
 =?iso-8859-1?Q?OhXoBDytgNaYxyIMCpyc9ZjdGCkI6l3ciFquoi1OPRJqWbel6lJB+dbv4S?=
 =?iso-8859-1?Q?Rzld6NWC5xjA0HH+p+Q1EEtphdjjNjBWFpAozW2EmhgWxiAozcgoXp7MkW?=
 =?iso-8859-1?Q?Ail76hwel9d5rKfgf5h4JXNXnIcW2KYQFfQHBw3HB9cc7EXk8lEXUz+3zh?=
 =?iso-8859-1?Q?OZ5FmkUJc8DPdxyV7RNmUecr2fPgS+dAJYGfgD7a1N8uEWy1vE1ww0t64D?=
 =?iso-8859-1?Q?dKck27+Pm4+LCwRdpbqmFd7G12kl/9T/AF0MuVVXV7RrNgLae0yxjY5Fr+?=
 =?iso-8859-1?Q?baZRMqC+pF00kA80LhKPr487BWZB5/AP5OtfeqxHw7K997BYBLbxJR4q58?=
 =?iso-8859-1?Q?BRcMr0ZTs2n91RUtUxfzO7ydG4jBGt+uD0N4kE7AMXeCDVEvHV7eNi2xey?=
 =?iso-8859-1?Q?eMCjShjuisXS4MqVnrcpGJU6HRaysIOYe84+V984kLOtLI5GC8Y+f77OrM?=
 =?iso-8859-1?Q?kLIQ3UDFVcvyqgiC0ShRLNpu+Uk+Yagpl1liCQZ1lgtImGpXYwc98HBUPY?=
 =?iso-8859-1?Q?xCZTVrEB/j+nkRa3sbSHYrxHU2dEoUBotafZmhNeuhCidcXwt/onXjXViL?=
 =?iso-8859-1?Q?Hmy94d5L9Ok+g9nzF+UUH8J1zR6vrSjxWGIHMDa2tGSeduic6yrTn9zvk5?=
 =?iso-8859-1?Q?8TnyULBWIWNdTnHgd+B9JBU0nPPcsx2QTcquu4pT1yY36XgkoOaykgvqVA?=
 =?iso-8859-1?Q?Vvm5iaY/BeKY4I6CLhtWMRA8oWJvHCEyiQfz493KKCTX98WOfUHPui7y2I?=
 =?iso-8859-1?Q?pZvVp8+hrsc5MVpuHkxiK3EqCqFpsNvyFRJbh9PoeTJdbciw8jehC55w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 311fa596-2cc6-4c3d-0ffc-08dda927aede
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:36:46.1435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvnjdJhF/xsuG54BerbIivd9WLIJfwMIQmUD/hK5RSWKWoW0DJ0yRpdaMpCESY70yt6fV6mb8vXZtc3s6SPiAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Wed, Jun 11, 2025 at 01:14:35PM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 12:09 -0700, Matthew Brost wrote:
> > On Wed, Jun 11, 2025 at 12:27:09PM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-06-11 at 11:25 -0700, Matthew Brost wrote:
> > > > On Wed, Jun 11, 2025 at 11:56:25AM -0600, Summers, Stuart wrote:
> > > > > On Mon, 2025-06-09 at 09:46 +0530, Himal Prasad Ghimiray wrote:
> > > > > > Introduce xe_vm_range_tilemask_tlb_invalidation(), which
> > > > > > issues a
> > > > > > TLB
> > > > > > invalidation for a specified address range across GTs
> > > > > > indicated
> > > > > > by a
> > > > > > tilemask.
> > > > > > 
> > > > > > v2 (Matthew Brost)
> > > > > > - Move WARN_ON_ONCE to svm caller
> > > > > > - Remove xe_gt_tlb_invalidation_vma
> > > > > > - s/XE_WARN_ON/WARN_ON_ONCE
> > > > > > 
> > > > > > v3
> > > > > > - Rebase
> > > > > > 
> > > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 -----
> > > > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
> > > > > >  drivers/gpu/drm/xe/xe_svm.c                 |  43 +-------
> > > > > >  drivers/gpu/drm/xe/xe_vm.c                  | 103
> > > > > > +++++++++++++-
> > > > > > ----
> > > > > > --
> > > > > >  drivers/gpu/drm/xe/xe_vm.h                  |   3 +
> > > > > >  5 files changed, 75 insertions(+), 101 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > index 084cbdeba8ea..0111ee59b81d 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > @@ -440,30 +440,6 @@ void xe_gt_tlb_invalidation_vm(struct
> > > > > > xe_gt
> > > > > > *gt,
> > > > > > struct xe_vm *vm)
> > > > > >         xe_gt_tlb_invalidation_fence_wait(&fence);
> > > > > >  }
> > > > > >  
> > > > > > -/**
> > > > > > - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on
> > > > > > this
> > > > > > GT
> > > > > > for a VMA
> > > > > > - * @gt: GT structure
> > > > > > - * @fence: invalidation fence which will be signal on TLB
> > > > > > invalidation
> > > > > > - * completion, can be NULL
> > > > > > - * @vma: VMA to invalidate
> > > > > > - *
> > > > > > - * Issue a range based TLB invalidation if supported, if not
> > > > > > fallback to a full
> > > > > > - * TLB invalidation. Completion of TLB is asynchronous and
> > > > > > caller
> > > > > > can use
> > > > > > - * the invalidation fence to wait for completion.
> > > > > > - *
> > > > > > - * Return: Negative error code on error, 0 on success
> > > > > > - */
> > > > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > > > -                              struct
> > > > > > xe_gt_tlb_invalidation_fence
> > > > > > *fence,
> > > > > > -                              struct xe_vma *vma)
> > > > > > -{
> > > > > > -       xe_gt_assert(gt, vma);
> > > > > > -
> > > > > > -       return xe_gt_tlb_invalidation_range(gt, fence,
> > > > > > xe_vma_start(vma),
> > > > > > -                                           xe_vma_end(vma),
> > > > > > -                                           xe_vma_vm(vma)-
> > > > > > > usm.asid);
> > > > > > -}
> > > > > > -
> > > > > >  /**
> > > > > >   * xe_guc_tlb_invalidation_done_handler - TLB invalidation
> > > > > > done
> > > > > > handler
> > > > > >   * @guc: guc
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > index abe9b03d543e..31072dbcad8e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > @@ -19,9 +19,6 @@ int
> > > > > > xe_gt_tlb_invalidation_init_early(struct
> > > > > > xe_gt
> > > > > > *gt);
> > > > > >  
> > > > > >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> > > > > >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> > > > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > > > -                              struct
> > > > > > xe_gt_tlb_invalidation_fence
> > > > > > *fence,
> > > > > > -                              struct xe_vma *vma);
> > > > > >  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct
> > > > > > xe_vm
> > > > > > *vm);
> > > > > >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > > > > >                                  struct
> > > > > > xe_gt_tlb_invalidation_fence
> > > > > > *fence,
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > index 83c63fd7b481..3fd2d63c73a2 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct
> > > > > > drm_gpusvm
> > > > > > *gpusvm,
> > > > > >  {
> > > > > >         struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > > > >         struct xe_device *xe = vm->xe;
> > > > > > -       struct xe_tile *tile;
> > > > > >         struct drm_gpusvm_range *r, *first;
> > > > > > -       struct xe_gt_tlb_invalidation_fence
> > > > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > > > XE_MAX_GT_PER_TILE];
> > > > > >         u64 adj_start = mmu_range->start, adj_end =
> > > > > > mmu_range-
> > > > > > > end;
> > > > > >         u8 tile_mask = 0;
> > > > > > -       u8 id;
> > > > > > -       u32 fence_id = 0;
> > > > > >         long err;
> > > > > >  
> > > > > >         xe_svm_assert_in_notifier(vm);
> > > > > > @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct
> > > > > > drm_gpusvm
> > > > > > *gpusvm,
> > > > > >  
> > > > > >         xe_device_wmb(xe);
> > > > > >  
> > > > > > -       for_each_tile(tile, xe, id) {
> > > > > > -               if (tile_mask & BIT(id)) {
> > > > > > -                       int err;
> > > > > > -
> > > > > > -
> > > > > >                        xe_gt_tlb_invalidation_fence_init(tile-
> > > > > > > primary_gt,
> > > > > > -                                                        
> > > > > > &fence[fence_id], true);
> > > > > > -
> > > > > > -                       err =
> > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > primary_gt,
> > > > > > -                                                         
> > > > > > &fence[fence_id],
> > > > > > -                                                         
> > > > > > adj_start,
> > > > > > -                                                         
> > > > > > adj_end,
> > > > > > -                                                         
> > > > > > vm-
> > > > > > > usm.asid);
> > > > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > > > -                               goto wait;
> > > > > > -                       ++fence_id;
> > > > > > -
> > > > > > -                       if (!tile->media_gt)
> > > > > > -                               continue;
> > > > > > -
> > > > > > -
> > > > > >                        xe_gt_tlb_invalidation_fence_init(tile-
> > > > > > > media_gt,
> > > > > > -                                                        
> > > > > > &fence[fence_id], true);
> > > > > > -
> > > > > > -                       err =
> > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > media_gt,
> > > > > > -                                                         
> > > > > > &fence[fence_id],
> > > > > > -                                                         
> > > > > > adj_start,
> > > > > > -                                                         
> > > > > > adj_end,
> > > > > > -                                                         
> > > > > > vm-
> > > > > > > usm.asid);
> > > > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > > > -                               goto wait;
> > > > > > -                       ++fence_id;
> > > > > > -               }
> > > > > > -       }
> > > > > > -
> > > > > > -wait:
> > > > > > -       for (id = 0; id < fence_id; ++id)
> > > > > > -
> > > > > >                xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > > > +       err = xe_vm_range_tilemask_tlb_invalidation(vm,
> > > > > > adj_start,
> > > > > > adj_end, tile_mask);
> > > > > > +       WARN_ON_ONCE(err);
> > > > > >  
> > > > > >  range_notifier_event_end:
> > > > > >         r = first;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > index 18f967ce1f1a..a0c70698265a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > @@ -3842,6 +3842,68 @@ void xe_vm_unlock(struct xe_vm *vm)
> > > > > >         dma_resv_unlock(xe_vm_resv(vm));
> > > > > >  }
> > > > > >  
> > > > > > +/**
> > > > > > + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB
> > > > > > invalidation
> > > > > > on this tilemask for an
> > > > > > + * address range
> > > > > > + * @vm: The VM
> > > > > > + * @start: start address
> > > > > > + * @end: end address
> > > > > > + * @tile_mask: mask for which gt's issue tlb invalidation
> > > > > > + *
> > > > > > + * Issue a range based TLB invalidation for gt's in tilemask
> > > > > > + *
> > > > > > + * Returns 0 for success, negative error code otherwise.
> > > > > > + */
> > > > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm,
> > > > > > u64
> > > > > > start,
> > > > > > +                                         u64 end, u8
> > > > > > tile_mask)
> > > > > > +{
> > > > > > +       struct xe_gt_tlb_invalidation_fence
> > > > > > fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > > > > +       struct xe_tile *tile;
> > > > > > +       u32 fence_id = 0;
> > > > > > +       u8 id;
> > > > > > +       int err;
> > > > > > +
> > > > > > +       if (!tile_mask)
> > > > > > +               return 0;
> > > > > > +
> > > > > > +       for_each_tile(tile, vm->xe, id) {
> > > > > > +               if (tile_mask & BIT(id)) {
> > > > > > +                       xe_gt_tlb_invalidation_fence_init(til
> > > > > > e-
> > > > > > > primary_gt,
> > > > > > +                                                        
> > > > > > &fence[fence_id], true);
> > > > > > +
> > > > > > +                       err =
> > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > primary_gt,
> > > > > > +                                                         
> > > > > > &fence[fence_id],
> > > > > > +                                                         
> > > > > > start,
> > > > > > +                                                         
> > > > > > end,
> > > > > > +                                                         
> > > > > > vm-
> > > > > > > usm.asid);
> > > > > 
> > > > > Since we're already doing the refactoring of the svm and non-
> > > > > svm
> > > > > cases
> > > > > here, can you also refactor this so we have something like:
> > > > > invalidate_tiles(tile_mask)
> > > > > 
> > > > > void invalidate_tiles(tile_mask)
> > > > > {
> > > > >     for_each_tile(tile, tile_mask)
> > > > >         invalidate_tile(tile)
> > > > > }
> > > > > 
> > > > > void invalidate_tile(tile)
> > > > > {
> > > > >     fence[i] = invalidate_gt(primary)
> > > > >     fence[i++] = invalidate_gt(media)
> > > > > 
> > > > >     for_each_i(i)
> > > > >         wait_for_invalidation(i)
> > > > 
> > > > You'd lose a level pipeline with this suggestion. The can write
> > > > is
> > > > quite
> > > > intentional - issue all TLB invalidations to hardware, then wait
> > > > on
> > > > all
> > > > invalidtaions. What you suggest would issue TLB invalidations to
> > > > each
> > > > tile and wait invalidations from that tile - if you have multiple
> > > > tiles
> > > > you delay issuing the invalidations until the prior tile
> > > > completes
> > > > its
> > > > invalidations. This could be cleaned up with helpers but
> > > > regardless
> > > > we
> > > > want the pipeling in place.
> > > 
> > > Ok makes sense. Then we can just pull the wait_for_invalidation()
> > > out
> > > to the invalidate_tiles() piece:
> > > 
> > > void invalidate_tiles(tile_mask)
> > >     for_each_tile(tile, tile_mask)
> > >         fence[i++] = invalidate_tile(tile)
> > > 
> > >     for_each_i(i)
> > >         wait_for_invalidation(i)
> > > 
> > 
> > That still doesn't work as each tile can generate multiple fences if
> > it
> > has a media GT. Yes, we could have helper which takes a fence index
> > by
> > reference by ROI on this low IMO - this is not some crazy a couple
> > 100
> > line function which is hard to follow.
> 
> Perhaps, but we should also be in the habbit of coding functions that
> try to perform just a single operation as much as possible. This is

Sure, hence the helper here which reduces the LoC. Another helper which
is used in exactly one spot, touches stack variables from another
function is kinda ick but that is just an opinion.

> what prevents the bloat down the road. I also don't think the
> suggestion I had here was intrusive enough to warrant strong pushback.
> 

Well to be fair, both of your suggestions do not really work - that the
is the main issue at hand.

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt 
> > > > 
> > > > > }
> > > > > 
> > > > > invalidate_gt(gt_type)
> > > > > {
> > > > >     invalidation_fence_init(gt_type)
> > > > >     fence = invalidation_fence_range(gt_type)
> > > > > 
> > > > >     return fence
> > > > > }
> > > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > +                       if (err)
> > > > > > +                               goto wait;
> > > > > > +                       ++fence_id;
> > > > > > +
> > > > > > +                       if (!tile->media_gt)
> > > > > > +                               continue;
> > > > > > +
> > > > > > +                       xe_gt_tlb_invalidation_fence_init(til
> > > > > > e-
> > > > > > > media_gt,
> > > > > > +                                                        
> > > > > > &fence[fence_id], true);
> > > > > > +
> > > > > > +                       err =
> > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > media_gt,
> > > > > > +                                                         
> > > > > > &fence[fence_id],
> > > > > > +                                                         
> > > > > > start,
> > > > > > +                                                         
> > > > > > end,
> > > > > > +                                                         
> > > > > > vm-
> > > > > > > usm.asid);
> > > > > > +                       if (err)
> > > > > > +                               goto wait;
> > > > > > +                       ++fence_id;
> > > > > > +               }
> > > > > > +       }
> > > > > > +
> > > > > > +wait:
> > > > > > +       for (id = 0; id < fence_id; ++id)
> > > > > > +               xe_gt_tlb_invalidation_fence_wait(&fence[id])
> > > > > > ;
> > > > > > +
> > > > > > +       return err;
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA
> > > > > > without a
> > > > > > lock
> > > > > >   * @vma: VMA to invalidate
> > > > > > @@ -3857,11 +3919,9 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > > > *vma)
> > > > > >         struct xe_device *xe = xe_vma_vm(vma)->xe;
> > > > > >         struct xe_vm *vm = xe_vma_vm(vma);
> > > > > >         struct xe_tile *tile;
> > > > > > -       struct xe_gt_tlb_invalidation_fence
> > > > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > > > XE_MAX_GT_PER_TILE];
> > > > > > -       u8 id;
> > > > > > -       u32 fence_id = 0;
> > > > > > +       u8 tile_mask = 0;
> > > > > >         int ret = 0;
> > > > > > +       u8 id;
> > > > > >  
> > > > > >         xe_assert(xe, !xe_vma_is_null(vma));
> > > > > >         xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> > > > > > @@ -3892,37 +3952,14 @@ int xe_vm_invalidate_vma(struct
> > > > > > xe_vma
> > > > > > *vma)
> > > > > >                 }
> > > > > >         }
> > > > > >  
> > > > > > -       for_each_tile(tile, xe, id) {
> > > > > > -               if (xe_pt_zap_ptes(tile, vma)) {
> > > > > > -                       xe_device_wmb(xe);
> > > > > > -
> > > > > >                        xe_gt_tlb_invalidation_fence_init(tile-
> > > > > > > primary_gt,
> > > > > > -                                                        
> > > > > > &fence[fence_id],
> > > > > > -                                                        
> > > > > > true);
> > > > > > -
> > > > > > -                       ret =
> > > > > > xe_gt_tlb_invalidation_vma(tile-
> > > > > > > primary_gt,
> > > > > > -                                                       
> > > > > > &fence[fence_id], vma);
> > > > > > -                       if (ret)
> > > > > > -                               goto wait;
> > > > > > -                       ++fence_id;
> > > > > > -
> > > > > > -                       if (!tile->media_gt)
> > > > > > -                               continue;
> > > > > > -
> > > > > > -
> > > > > >                        xe_gt_tlb_invalidation_fence_init(tile-
> > > > > > > media_gt,
> > > > > > -                                                        
> > > > > > &fence[fence_id],
> > > > > > -                                                        
> > > > > > true);
> > > > > > +       for_each_tile(tile, xe, id)
> > > > > > +               if (xe_pt_zap_ptes(tile, vma))
> > > > > > +                       tile_mask |= BIT(id);
> > > > > >  
> > > > > > -                       ret =
> > > > > > xe_gt_tlb_invalidation_vma(tile-
> > > > > > > media_gt,
> > > > > > -                                                       
> > > > > > &fence[fence_id], vma);
> > > > > > -                       if (ret)
> > > > > > -                               goto wait;
> > > > > > -                       ++fence_id;
> > > > > > -               }
> > > > > > -       }
> > > > > > +       xe_device_wmb(xe);
> > > > > >  
> > > > > > -wait:
> > > > > > -       for (id = 0; id < fence_id; ++id)
> > > > > > -
> > > > > >                xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > > > +       ret =
> > > > > > xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma),
> > > > > > xe_vma_start(vma),
> > > > > > +                                                  
> > > > > > xe_vma_end(vma),
> > > > > > tile_mask);
> > > > > >  
> > > > > >         /* WRITE_ONCE pair with READ_ONCE in
> > > > > > xe_gt_pagefault.c */
> > > > > >         WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > > > > b/drivers/gpu/drm/xe/xe_vm.h
> > > > > > index 88d6c0ef89c7..acd3fd6c605b 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > > > @@ -228,6 +228,9 @@ struct dma_fence
> > > > > > *xe_vm_range_rebind(struct
> > > > > > xe_vm
> > > > > > *vm,
> > > > > >  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > > > > >                                      struct xe_svm_range
> > > > > > *range);
> > > > > >  
> > > > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm,
> > > > > > u64
> > > > > > start,
> > > > > > +                                         u64 end, u8
> > > > > > tile_mask);
> > > > > > +
> > > > > >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > > > > >  
> > > > > >  int xe_vm_validate_protected(struct xe_vm *vm);
> > > > > 
> > > 
> 
