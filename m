Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF031C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5510E737;
	Wed, 11 Jun 2025 21:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWzsv1Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503310E737
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749676934; x=1781212934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O0aeeBQa2hQZId4F58VDixUrX7O3OWlbGfBJlUjejO0=;
 b=PWzsv1Lf980nQvQKoiH40TQGCfrXvjJ58fdL/yVn2XgZMLyo+7qz5EGo
 zBPJ/ZEZbSnak+7oYWO40BHTSN2u0zunyRYhEEszI5aZ5dws8D2tHhcQM
 HIn4BJTQQvqb+5zTuOVHzj9sXVmoJrd0b4/9Qn7Ic3fhU6oxXpKelYk4L
 Q+rbVMAAuRvlDA8bxNQFF22pDB2ne25WtV+QaWPEfT/yEXFegsgZEKrjv
 XSGhKfKeHpq8Kn5INahK8J+dXKRfyB3xTkQpzBBHdpnTQ1Wvd8IGdj2Hr
 8WIBAui8iEBeR0aFyY8UlkG81uXfR6tC9oIK7zlJMNSiEhpvBqvaOcL30 Q==;
X-CSE-ConnectionGUID: 6sB4iOxlQOiSq+Sdq9bMng==
X-CSE-MsgGUID: kKjGyPqjTreeYNqQIRYuOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74370741"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="74370741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:22:14 -0700
X-CSE-ConnectionGUID: 13MaxxeRRIegsQ/KCoytLg==
X-CSE-MsgGUID: OBTAq1gZQj+/in9zOugGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152203168"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:22:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 14:22:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 14:22:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 14:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqpgA/zHyx496bEarNYrEevYADMkjM85k8Yg9zNJ47XuQC+cVTAUL3LbiayvytOkw949ixDh2b8H5rvOWWv2CobLl+pOA+tRLv3LPSr81QDWAC1Iy3Dlt8R/8sehNMfXX0zPb51SU3Wudu1HOgapeaxDiVugyYw7hziWW1iX6PSAyZfbrW0G0/ZlyD65PEThNzrW5zOuFS8mOJJFywy2qBdxP4y55M22OLHv0hGytQB8rjZQVxNti7FIkAYjhNI0PBCv9hEI9abu+KBZ6buQQWs5erIxczreIFA6deBzTng/LtCXYD0LMvyBt3F9byEB5NA35aQx5n9Y+VSsym5kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt2kmOgG2fbNyw7iworFWphXd2pQyU8XhoyuBxLaMgQ=;
 b=IZEisB3ZTmLSM0n3Xr13i4DVTDI/2+TghkN25jeXYNUGHSSv8RFH/uWVHojiNDAgfJPFeCEOGhmJBHBDVqqmtvoJej8GTHUyRX44BRZ6VtFnnulUgHbUx9CBkIl2Fka+v3yfTpooWMnmhlKQZnYUJf3jK+IjwxTj9rf29BDFSUBN7EKaZB8heycY38+3eT8qRCk5i06H0FdAbkiTJLk7dmOzDgvjBP+arruylAHKGBuYFo4ags8XIvxeyM0L38dMnK/vfLjOMUGyO6azNuKEIk2fQgptLengvkNr4SXO0HfeCdM+c+9iu9FmAy9DvOhJNUOx3iAR/FD+F9wXhAVH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 21:22:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 21:22:09 +0000
Date: Wed, 11 Jun 2025 14:23:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEnz4JgHCpCmXAR8@lstrano-desk.jf.intel.com>
References: <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
 <aEmy8yBp0Ghssyuq@lstrano-desk.jf.intel.com>
 <7ede4886131931de5f9a672fd823d8bac3f374af.camel@intel.com>
 <aEnDbmfEVUEzmk0A@lstrano-desk.jf.intel.com>
 <c99af8b540ab40381b2bc44f78bfc634c27043b6.camel@intel.com>
 <aEnI7t5DTbcfYibp@lstrano-desk.jf.intel.com>
 <bfad428658219de07f8defb4c46b234bdd34c2dc.camel@intel.com>
 <aEnSdmCa64X1OFBP@lstrano-desk.jf.intel.com>
 <aEnTF6zsZXYsARNI@lstrano-desk.jf.intel.com>
 <9abc88885b9bc23dc323d35c343105cdce8ec680.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9abc88885b9bc23dc323d35c343105cdce8ec680.camel@intel.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e88944b-42cb-4df8-b6a1-08dda92e05f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zSgeRNHmVSR8AYMJqzgpz+p4/PRZEeuHoH4g/dBaV3ik1LSpqA0g1YPyUl?=
 =?iso-8859-1?Q?gC5/HmZlrL2/Tp3eR4IiDK1srPT+U/xYwzXoBvX/yKKr0YBVDM1wZOG6A6?=
 =?iso-8859-1?Q?lgDoZOXmuTni5VmWx3vHZ3KJ6ZIVg81v6I6ymdKJlQXwp6RkKpMaNIOZ9V?=
 =?iso-8859-1?Q?hmZqt7AdLrAg5cYJ+7kiB4UNXzV1l50PlLFzY926VEHbCESYgyJ63c/rVn?=
 =?iso-8859-1?Q?1kLT/ePlXt1k0XQLcYLMguO6w1MH6OjJkah+urLmWBzT3Tr/XuGhQqEIWy?=
 =?iso-8859-1?Q?SyaT6DO0snNO0F3L/09L24z/W75hpV30winlwFu3tjJy5ncHJVa93urk7p?=
 =?iso-8859-1?Q?IO4L8oqyj1LbC7ttomRJslAycYjdHuwzflAZ4eX2MheUvbDI6KTL/D70EW?=
 =?iso-8859-1?Q?i6uZIP20uXc/q7REfXxaa9U/ju0RRXJNWHKTjLe9G/EGMO6lU7/ZL7fs6O?=
 =?iso-8859-1?Q?VYCatUnGQOWrGTHEzquZK1bKw7EFTmqP5oXFU3qvhZ6gSH2w0+3AJuq2w+?=
 =?iso-8859-1?Q?yswKdJjDEVWNyGRNFHy/r3mY2RfcKXnlWmvm4VWIooKKCmrsmpLwDaArG8?=
 =?iso-8859-1?Q?2gwbF0DLPb3LCQFl1HlUv037OuhOL/gKZfKQvYcoi3+gC9xSxotxJ34TXs?=
 =?iso-8859-1?Q?tUyliyPYvQKrOH7g5sx59BfabTEgCRYGPXVue+nqStbxgQUgiXHJx0uBh+?=
 =?iso-8859-1?Q?mUhroH5i8DMIQoGK2VOKqFgRzSpXi+yDlKqndgKP+Pqluw9RPbP0j1Ndq+?=
 =?iso-8859-1?Q?8/L4fbW8Pgv7gTltLqqy8+wZvF2zOtj4iBSUXNTm5YnkDFoEUMNmYodtsz?=
 =?iso-8859-1?Q?eSw7NQyFO94CENzGSyqijY5yFCSH2thvjcOfSdMP/21MVE4XD1X36PU4ZH?=
 =?iso-8859-1?Q?6CeB0yilnCzZ8DLGs/UTiiUa+6UuzpBcdS3DM1d0uXGCFo8yrOW+WVbUR2?=
 =?iso-8859-1?Q?IGaeZ+NNdRy325ht8QF6ApLrfAYF4WXX7NRIqkrEpiSoWgFVMTxbdpWjmv?=
 =?iso-8859-1?Q?F97No1i/QgbRuyDQr7x9TfKfBzh6UTseJR3iCXRFCsQrRvkt/Mf4XTtY4T?=
 =?iso-8859-1?Q?xYOw1kAH6aSd3V/yV3OFu/U34+hqpaG1Jp9jTZYaa/2/LDJ+8a0ZORmavN?=
 =?iso-8859-1?Q?IyLadFCxiT6Cw6UE+15WaVeBcKYh3/IRAzi0KvOXWa+RxAcv5bfy1tHi0e?=
 =?iso-8859-1?Q?HIwbInZY2s1qr5dHkjxnOSUjY8qUn6kN36UKzfIJl3Olx/zEMBGrQi+XLd?=
 =?iso-8859-1?Q?SI/IJ14S7jQhVj1CGth1JEH8S2/li/J5F4bhClA94OVRMoCA1uVNOGhboW?=
 =?iso-8859-1?Q?MqhXuOyIgl+Z9re+7ovJMcHC+TwAn4bmS1y6sIOWy2UJEMUCIF8EOkg7sd?=
 =?iso-8859-1?Q?WYg9MLBMVA5EszfNyX1xh6LmAhKkHPNV8Y2CHay6e3Y213/dbbhEq2VTNe?=
 =?iso-8859-1?Q?rGpTl0GsD/yJowXwAZ73zoRu9fSiMwGa0TKny15IGsknTAV+A9cvil4Dv3?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YXyYCSWeIBQElLQsmNc/46E9Cgk5M6vOK6wgSVBHzkWIwz/dyfVT6jb8/A?=
 =?iso-8859-1?Q?eXzIPxBmlE0ZsnaFo8VlzYheewh1H1w+pFXNgpxJG3WEhDXXItL52Qrg/A?=
 =?iso-8859-1?Q?8S0EwrUmvKic4E4faJ+PuYn1FFNOgeeLRQE2+A8+a2fGAG8pzthcqvprZG?=
 =?iso-8859-1?Q?GKmQ7gGI9fVxDaP52riRsUxvRHhwNsq3x3/W5/UvjJNtwpcv7wp9e9EUVh?=
 =?iso-8859-1?Q?7oYT13D3cL0iP7as4zhD+qMtHcfxrbotacj0IbSXdORwwZFjToTPdMweQL?=
 =?iso-8859-1?Q?ig5wKEPtABebzzFRGLE45REfSVlCnS21cukaaYd6MnvO6jAOdEAU2U7y3c?=
 =?iso-8859-1?Q?+8XI2kYtW0Fy5DBBv1g6xSNmCG69u5TE4AEFEAa4LOLM912Zr9LPtePDUw?=
 =?iso-8859-1?Q?Jv4NET+dqqo+SC0ClDq3JwuIuU/tT241VS8kpXqGDJ0n+G5C29WZCnV2nT?=
 =?iso-8859-1?Q?JDQiX/3M3IvBnvSlqXLIi6OPHI7n57x+7VDQRE2Qbx/kIYvteUkWOolnSS?=
 =?iso-8859-1?Q?ton5bVP1JsXn/Tt0E8Itlxvc8ZIaA5UiitSDFZA6TKqKP4m6HG1R8xKkz4?=
 =?iso-8859-1?Q?DzOXMDGjnCZ9zBjhZgEX5H7kdP/OOSNT77gWGX5lxjxPlj25lRiQwt6DTQ?=
 =?iso-8859-1?Q?VwQxguQCRUBtgwHabhzn1kY2l+QFLLRa1ij9U2EDl2WWj10nwvt3KFHMzd?=
 =?iso-8859-1?Q?37dfO63ZIUquNI2RGxw6226RCvoa9d0JsAGVhjhMv/cEIIoLge92LMOzuq?=
 =?iso-8859-1?Q?AlUD7DlMOn9eSUbTEVOoQDV3wE9Lb8mD3NQJuvVx4cEvCo/of2CIepAGIW?=
 =?iso-8859-1?Q?DbvLYEJV7ZnZCGHcrFh0/9MOBFq5+mun8Aad/wV6Ahc9/XV3q4Gv0MxvED?=
 =?iso-8859-1?Q?JfnIZgsBnfcVfW38A9gWwLrsDz6q4hXidZfYmhH0TmyfOm7Mh1FRfaSsl2?=
 =?iso-8859-1?Q?+KTLUTjaGU6zhTU2b19jjM+q4GJAkzwZWbA8qNf4YiWChE57wBH2d4DhKi?=
 =?iso-8859-1?Q?EH6Cb24pqJP5I42yJ1oEKU83s5uztzfI6M23g4h2jLVZHiiMzOkyytcfUt?=
 =?iso-8859-1?Q?6NXbirtu76icW7wkyUuCkG+f5v6IXuSmJNBfdKJ9B10yYQVbO+tRx8Gwa5?=
 =?iso-8859-1?Q?bVnkYI7DXxv5RjrvU2+BmNFYVV3YNd+Z+J5M8UOsA/oLh7k84E2vU2z5aA?=
 =?iso-8859-1?Q?4KRAqi1ll4FAhx3WwPDrPhl/khfnvJfLGnLl40Z2UvH9DY+fFYmL6g6bzd?=
 =?iso-8859-1?Q?k5zXII2hqptOSLt0g6Ao8h6p1VNrR8Ih0jc3zcuy9UQLP9MzaU26tThk9+?=
 =?iso-8859-1?Q?8q7ZkHl6LjspOQmKm3ObQFDPqLKxbnGn6xHv1cCh5r+oWpSHMaNnoEbV8I?=
 =?iso-8859-1?Q?fMSvrcpwSlAg77+P6cNL6aPjkVwyzT8AQdQdXiqpnBIElJL5UxhcHqVCgs?=
 =?iso-8859-1?Q?8HnNiIcuS2GmUG5cpuqwP0LMfSpZnEN8Cz7eiZ2cpZ6gDM9GMsqiXnR+ak?=
 =?iso-8859-1?Q?gWKznrR+dlLKkg0taYiVPG/+cCiniMHIQn3nEdWjr/+WS86yn2C6LXT1v9?=
 =?iso-8859-1?Q?ncyR5ovSkZkvotB7RiKYNrSQQC9QvyH8Mg2hd6HQdwl7bLO89VIonw4xWU?=
 =?iso-8859-1?Q?9pfiqEDNbVkrneRRi14yB8VD0d81wN/Ix67RjB6kmUh5Gb3ak4lTENQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e88944b-42cb-4df8-b6a1-08dda92e05f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:22:09.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc0saY1k6lfRvOPD4DyQYzqMYCOsTPCkF6KM6wdDNS18QsebGDK4pQphNOMYX4N4x6IjeCGfB6Y1huEw/6RhPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
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

On Wed, Jun 11, 2025 at 01:12:13PM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 12:03 -0700, Matthew Brost wrote:
> > On Wed, Jun 11, 2025 at 12:01:10PM -0700, Matthew Brost wrote:
> > 
> > One correction...
> > 
> > > On Wed, Jun 11, 2025 at 12:23:13PM -0600, Summers, Stuart wrote:
> > > > On Wed, 2025-06-11 at 11:20 -0700, Matthew Brost wrote:
> > > > > On Wed, Jun 11, 2025 at 12:05:36PM -0600, Summers, Stuart
> > > > > wrote:
> > > > > > On Wed, 2025-06-11 at 10:57 -0700, Matthew Brost wrote:
> > > > > > > On Wed, Jun 11, 2025 at 11:04:06AM -0600, Summers, Stuart
> > > > > > > wrote:
> > > > > > > > On Wed, 2025-06-11 at 09:46 -0700, Matthew Brost wrote:
> > > > > > > > > On Wed, Jun 11, 2025 at 10:26:44AM -0600, Summers,
> > > > > > > > > Stuart
> > > > > > > > > wrote:
> > > > > > > > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost
> > > > > > > > > > wrote:
> > > > > > > > > > > Clearing on free should hide latency of BO clears
> > > > > > > > > > > on new
> > > > > > > > > > > user
> > > > > > > > > > > BO
> > > > > > > > > > > allocations.
> > > > > > > > > > 
> > > > > > > > > > Do you have any test results showing the latency
> > > > > > > > > > improvement
> > > > > > > > > > here
> > > > > > > > > > on
> > > > > > > > > > high volume submission tests? Also how does this
> > > > > > > > > > impact at
> > > > > > > > > > very
> > > > > > > > > > large
> > > > > > > > > 
> > > > > > > > > No performance data yet available. Something we
> > > > > > > > > definitely
> > > > > > > > > should
> > > > > > > > > look
> > > > > > > > > into and would be curious about the results. FWIW,
> > > > > > > > > AMDGPU
> > > > > > > > > implements
> > > > > > > > > clear on free in a very similar way to this series. 
> > > > 
> > > > So back to this one, what is the motivation for this change if we
> > > > don't
> > > > have data?
> > > > 
> > > 
> > > It is the assumption that in typical cases (no memory pressure) the
> > > buddy allocator pool can find a clean VRAM upon allocation
> > > resulting in
> > > immediate use of the BO rather than issuing a clear which could
> > > delay a
> > > bind IOCTL, an exec IOCTL, or even mmaping the BO (dma-resv
> > > enforces
> > > this ordering btw).
> > > 
> > > Even if there is memory pressure, it is fairly easy to reason that
> > > clear-on-free creates a pipeline in which the clear is started
> > > earlier
> > > than it would be upon allocation thus reducing the overall delay of
> > > the
> > > BO usage after allocation.
> > > 
> > > Yes, there might be odd corner of large clear-on-free followed by
> > > small
> > > allocation where it might be slightly worse, but overall it seems
> > > to be
> > > an easy win - both AMD / Intel have done work to make clear-on-free
> > > possible.
> 
> Ok so basically we think the baseline is going to be better this way (I
> agree with what you have here) and any corner case will be addressed in
> the future as they come up (i.e. uAPI).
> 
> It does seem like even if we don't have a uAPI we could have a solution
> that lets the small workload preempt the large workload clear to do its
> own clear-on-alloc, allowing the small workload to move on to the
> render/compute engine while the large clearing workload does it's clear
> using blitter (just as an example). It's an optimization though I
> agree. And without an explicit user (yet for Xe...) we might just kick
> that can down the road.
> 

All of this depends on getting memory - there isn't a concept of large
or small BOs anywhere in DRM subsystem, or specially clears attached to
BOs - it just BOs with fences in dma-resv and once all the fences signal
memory is return to the buddy allocator. Either memory is available or
it isn't and eviction is triggered.

What you suggest sounds like i915ism that is wildly complex, likely not
possible with a shared code base, and would never be accepted by our
maintainers or anyone in the DRM subsystem.

> > > 
> > > > > > > > 
> > > > > > > > I had a few other comments towards the end of the patch.
> > > > > > > > Basically
> > > > > > > > I
> > > > > > > 
> > > > > > > I should slow down and read... Repling to all comments
> > > > > > > here.
> > > > > > > 
> > > > > > > > think it would be nice to be able to configure this.
> > > > > > > > There was
> > > > > > > > significant testing done here for Aurora in i915 and the
> > > > > > > > performance
> > > > > > > > benefits were potentially different based on the types of
> > > > > > > > workloads
> > > > > > > > being used. Having user hints for instance might allow us
> > > > > > > > to
> > > > > > > > take
> > > > > > > > advantage of those workload specific use cases.
> > > > > > > > 
> > > > > > > 
> > > > > > > We can wire this mode to the uAPI for BO creation if needed
> > > > > > > -
> > > > > > > this
> > > > > > > patch
> > > > > > > does clear-on-free blindly for any user BO. Ofc with uAPI
> > > > > > > we need
> > > > > > > a
> > > > > > > UMD
> > > > > > > user to upstream. We may just want to start with this patch
> > > > > > > and
> > > > > > > do
> > > > > > > that
> > > > > > > in a follow up if needed as it a minor tweak from a code
> > > > > > > PoV.
> > > > > > 
> > > > > > Actually it would be great if you can add exactly this to the
> > > > > > commit
> > > > > > message. Basically we are intentionally doing clear on free
> > > > > > here
> > > > > > blindly because we don't currently have a user for some kind
> > > > > > of
> > > > > > more
> > > > > > complicated (from the user perspective) hint system. (just
> > > > > > kind of
> > > > > > repeating what you said)
> > > > > > 
> > > > > > This way we have some documentation of why we chose this
> > > > > > route
> > > > > > other
> > > > > > than just because amd is doing that.
> > > > > > 
> > > > > 
> > > > > Sure.
> > > > > 
> > > > > > > 
> > > > > > > > > 
> > > > > > > > > > buffer size submissions and mix of large and small
> > > > > > > > > > buffer
> > > > > > > > > > submissions
> > > > > > > > > > with eviction between different processes?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Eviction somewhat orthogonal to this. If an eviction
> > > > > > > > > occurs
> > > > > > > > > and
> > > > > > > > > it is
> > > > > > > > > a
> > > > > > > > > new allocation a clear would still have be issued ahead
> > > > > > > > > handing
> > > > > > > > > the
> > > > > > > > > memory over to the new BO, if eviction occurs and paged
> > > > > > > > > in BO
> > > > > > > > > has
> > > > > > > > > backing store (it was previously evicted) we'd just
> > > > > > > > > copy the
> > > > > > > > > contents
> > > > > > > > > into the allocated memory.
> > > > > > > > 
> > > > > > > > Good point. I still think we should consider the
> > > > > > > > scenarios of
> > > > > > > > having a
> > > > > > > > large buffer workload running and then clearing, then we
> > > > > > > > have a
> > > > > > > > small
> > > > > > > > buffer workload coming in which now needs to wait on the
> > > > > > > > clear
> > > > > > > > from
> > > > > > > > that large workload. Whereas on clear-on-alloc for the
> > > > > > > > small
> > > > > > > > workload,
> > > > > > > > we can get that submission in quickly and not wait for
> > > > > > > > that
> > > > > > > > larger
> > > > > > > > one.
> > > > > > > > 
> > > > > > > 
> > > > > > > The buddy allocator tries to allocate cleared VRAM first,
> > > > > > > then
> > > > > > > falls
> > > > > > > back to dirty VRAM. Dirty VRAM will still be cleared upon
> > > > > > > allocation
> > > > > > > in
> > > > > > > this patch.
> > > > > > > 
> > > > > > > The senerio you describe could result in eviction actually.
> > > > > > > If a
> > > > > > > large
> > > > > > > BO has pending clear - it won't be in either buddy
> > > > > > > allocator pool
> > > > > > > -
> > > > > > > it
> > > > > > > will be TTM as ghost object (pending free). If the buddy
> > > > > > > allocator
> > > > > > > fails
> > > > > > > an allocation, eviction is triggered with the ghost objects
> > > > > > > in
> > > > > > > TTM
> > > > > > > being
> > > > > > > tried to allocate first (I think, if I'm misstaing TTM
> > > > > > > internals
> > > > > > > my
> > > > > > > bad). This would as you suggest result in the BO allocation
> > > > > > > waiting
> > > > > > > on
> > > > > > > potentially a large clear to finish even though the
> > > > > > > allocation is
> > > > > > > small
> > > > > > > in size.
> > > > > > 
> > > > > > So we have had customers in the past who have wanted explicit
> > > > > > disabling
> > > > > > of eviction. I agree in the current implementation that might
> > > > > > be
> > > > > > the
> > > > > 
> > > > > Explicitly disabling eviction is not an upstream option,
> > > > > downstream
> > > > > in
> > > > > i915 you can do whatever you want as there are no rules. We
> > > > > have
> > > > > discussed a pin accounting controler vis cgroups or something
> > > > > upstream
> > > > > which may be acceptable. Different discussion though.
> > > > > 
> > > > > > case, but in the future we might want such a capability, so
> > > > > > there
> > > > > > is
> > > > > > still a chance of blocking. But again, maybe this can be a
> > > > > > future
> > > > > > enhancement as you said.
> > > > > > 
> > > > > > > 
> > > > > > > > I don't think there is necessarily a one-size-fits-all
> > > > > > > > solution
> > > > > > > > here
> > > > > > > > which is why I think the hints are important.
> > > > > > > > 
> > > > > > > 
> > > > > > > Jumping to new uAPI + hints immediately might not be the
> > > > > > > best
> > > > > > > approach,
> > > > > > > but as I stated this is minor thing to add if needed.
> > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stuart
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > Implemented via calling xe_migrate_clear in release
> > > > > > > > > > > notify
> > > > > > > > > > > and
> > > > > > > > > > > updating
> > > > > > > > > > > iterator in xe_migrate_clear to skip cleared buddy
> > > > > > > > > > > blocks.
> > > > > > > > > > > Only
> > > > > > > > > > > user
> > > > > > > > > > > BOs
> > > > > > > > > > > cleared in release notify as kernel BOs could still
> > > > > > > > > > > be in
> > > > > > > > > > > use
> > > > > > > > > > > (e.g.,
> > > > > > > > > > > PT
> > > > > > > > > > > BOs need to wait for dma-resv to be idle).
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Matthew Brost
> > > > > > > > > > > <matthew.brost@intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > > > > > > > ++++++++++++++++++++++++++++
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++--
> > > > > > > > > > > -
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26
> > > > > > > > > > > +++++++++++++++
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > > > > > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > > > > > > > xe_ttm_bo_lock_in_destructor(struct
> > > > > > > > > > > ttm_buffer_object
> > > > > > > > > > > *ttm_bo)
> > > > > > > > > > >         return locked;
> > > > > > > > > > >  }
> > > > > > > > > > >  
> > > > > > > > > > > +static void xe_ttm_bo_release_clear(struct
> > > > > > > > > > > ttm_buffer_object
> > > > > > > > > > > *ttm_bo)
> > > > > > > > > > > +{
> > > > > > > > > > > +       struct xe_device *xe =
> > > > > > > > > > > ttm_to_xe_device(ttm_bo-
> > > > > > > > > > > > bdev);
> > > > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > > > > +       int err, idx;
> > > > > > > > > > > +
> > > > > > > > > > > +       xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > > > > > > > +
> > > > > > > > > > > +       if (ttm_bo->type != ttm_bo_type_device)
> > > > > > > > > > > +               return;
> > > > > > > > > > > +
> > > > > > > > > > > +       if (xe_device_wedged(xe))
> > > > > > > > > > > +               return;
> > > > > > > > > > > +
> > > > > > > > > > > +       if (!ttm_bo->resource ||
> > > > > > > > > > > !mem_type_is_vram(ttm_bo-
> > > > > > > > > > > > resource-
> > > > > > > > > > > > mem_type))
> > > > > > > > > > > +               return;
> > > > > > > > > > > +
> > > > > > > > > > > +       if (!drm_dev_enter(&xe->drm, &idx))
> > > > > > > > > > > +               return;
> > > > > > > > > > > +
> > > > > > > > > > > +       if (!xe_pm_runtime_get_if_active(xe))
> > > > > > > > > > > +               goto unbind;
> > > > > > > > > > > +
> > > > > > > > > > > +       err = dma_resv_reserve_fences(&ttm_bo-
> > > > > > > > > > > > base._resv,
> > > > > > > > > > > 1);
> > > > > > > > > > > +       if (err)
> > > > > > > > > > > +               goto put_pm;
> > > > > > > > > > > +
> > > > > > > > > > > +       fence =
> > > > > > > > > > > xe_migrate_clear(mem_type_to_migrate(xe,
> > > > > > > > > > > ttm_bo-
> > > > > > > > > > > > resource->mem_type),
> > > > > > > > > > > +                               
> > > > > > > > > > > ttm_to_xe_bo(ttm_bo),
> > > > > > > > > > > ttm_bo-
> > > > > > > > > > > > resource,
> > > > > > > > > > > +                               
> > > > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > > > > > > > +                               
> > > > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > > > > > > > +       if (XE_WARN_ON(IS_ERR(fence)))
> > > > > > > > > > > +               goto put_pm;
> > > > > > > > > > > +
> > > > > > > > > > > +       xe_ttm_vram_mgr_resource_set_cleared(ttm_bo
> > > > > > > > > > > -
> > > > > > > > > > > > resource);
> > > > > > > > > > > +       dma_resv_add_fence(&ttm_bo->base._resv,
> > > > > > > > > > > fence,
> > > > > > > > > > > +                          DMA_RESV_USAGE_KERNEL);
> > > > > > > > > > > +       dma_fence_put(fence);
> > > > > > > > > > > +
> > > > > > > > > > > +put_pm:
> > > > > > > > > > > +       xe_pm_runtime_put(xe);
> > > > > > > > > > > +unbind:
> > > > > > > > > > > +       drm_dev_exit(idx);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >  static void xe_ttm_bo_release_notify(struct
> > > > > > > > > > > ttm_buffer_object
> > > > > > > > > > > *ttm_bo)
> > > > > > > > > > >  {
> > > > > > > > > > >         struct dma_resv_iter cursor;
> > > > > > > > > > > @@ -1478,6 +1523,8 @@ static void
> > > > > > > > > > > xe_ttm_bo_release_notify(struct
> > > > > > > > > > > ttm_buffer_object *ttm_bo)
> > > > > > > > > > >         }
> > > > > > > > > > >         dma_fence_put(replacement);
> > > > > > > > > > >  
> > > > > > > > > > > +       xe_ttm_bo_release_clear(ttm_bo);
> > > > > > > > > > > +
> > > > > > > > > > >         dma_resv_unlock(ttm_bo->base.resv);
> > > > > > > > > > >  }
> > > > > > > > > > >  
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > > > @@ -1063,7 +1063,7 @@ struct dma_fence
> > > > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > > > xe_migrate *m,
> > > > > > > > > > >         struct xe_gt *gt = m->tile->primary_gt;
> > > > > > > > > > >         struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > > > >         bool clear_only_system_ccs = false;
> > > > > > > > > > > -       struct dma_fence *fence = NULL;
> > > > > > > > > > > +       struct dma_fence *fence =
> > > > > > > > > > > dma_fence_get_stub();
> > > > > > > > > > >         u64 size = bo->size;
> > > > > > > > > > >         struct xe_res_cursor src_it;
> > > > > > > > > > >         struct ttm_resource *src = dst;
> > > > > > > > > > > @@ -1075,10 +1075,13 @@ struct dma_fence
> > > > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > > > xe_migrate *m,
> > > > > > > > > > >         if (!clear_bo_data && clear_ccs &&
> > > > > > > > > > > !IS_DGFX(xe))
> > > > > > > > > > >                 clear_only_system_ccs = true;
> > > > > > > > > > >  
> > > > > > > > > > > -       if (!clear_vram)
> > > > > > > > > > > +       if (!clear_vram) {
> > > > > > > > > > >                 xe_res_first_sg(xe_bo_sg(bo), 0,
> > > > > > > > > > > bo-
> > > > > > > > > > > > size,
> > > > > > > > > > > &src_it);
> > > > > > > > > > > -       else
> > > > > > > > > > > +       } else {
> > > > > > > > > > >                 xe_res_first(src, 0, bo->size,
> > > > > > > > > > > &src_it);
> > > > > > > > > > > +               if (!(clear_flags &
> > > > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > > > +                       size -=
> > > > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > > > +       }
> > > > > > > > > > >  
> > > > > > > > > > >         while (size) {
> > > > > > > > > > >                 u64 clear_L0_ofs;
> > > > > > > > > > > @@ -1125,6 +1128,9 @@ struct dma_fence
> > > > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > > > xe_migrate *m,
> > > > > > > > > > >                         emit_pte(m, bb,
> > > > > > > > > > > clear_L0_pt,
> > > > > > > > > > > clear_vram,
> > > > > > > > > > > clear_only_system_ccs,
> > > > > > > > > > >                                  &src_it, clear_L0,
> > > > > > > > > > > dst);
> > > > > > > > > > >  
> > > > > > > > > > > +               if (clear_vram && !(clear_flags &
> > > > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > > > +                       size -=
> > > > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > > > +
> > > > > > > > > > >                 bb->cs[bb->len++] =
> > > > > > > > > > > MI_BATCH_BUFFER_END;
> > > > > > > > > > >                 update_idx = bb->len;
> > > > > > > > > > >  
> > > > > > > > > > > @@ -1146,7 +1152,7 @@ struct dma_fence
> > > > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > > > xe_migrate *m,
> > > > > > > > > > >                 }
> > > > > > > > > > >  
> > > > > > > > > > >                 xe_sched_job_add_migrate_flush(job,
> > > > > > > > > > > flush_flags);
> > > > > > > > > > > -               if (!fence) {
> > > > > > > > > > > +               if (fence == dma_fence_get_stub())
> > > > > > > > > > > {
> > > > > > > > > > >                         /*
> > > > > > > > > > >                          * There can't be anything
> > > > > > > > > > > userspace
> > > > > > > > > > > related
> > > > > > > > > > > at this
> > > > > > > > > > >                          * point, so we just need
> > > > > > > > > > > to
> > > > > > > > > > > respect
> > > > > > > > > > > any
> > > > > > > > > > > potential move
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > > > @@ -118,6 +118,7 @@ int
> > > > > > > > > > > xe_migrate_access_memory(struct
> > > > > > > > > > > xe_migrate
> > > > > > > > > > > *m, struct xe_bo *bo,
> > > > > > > > > > >  
> > > > > > > > > > >  #define
> > > > > > > > > > > XE_MIGRATE_CLEAR_FLAG_BO_DATA          BIT(0)
> > > > > > > > > > >  #define
> > > > > > > > > > > XE_MIGRATE_CLEAR_FLAG_CCS_DATA         BIT(1)
> > > > > > > > > > > +#define
> > > > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY             BIT(2)
> > > > > > > > > > >  #define
> > > > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL     (XE_MIGRATE_CLEAR_FL
> > > > > > > > > > > AG_BO_
> > > > > > > > > > > DATA
> > > > > > > > > > > > \
> > > > > > > > > > >                                         XE_MIGRATE_
> > > > > > > > > > > CLEAR_
> > > > > > > > > > > FLAG
> > > > > > > > > > > _CCS
> > > > > > > > > > > _DAT
> > > > > > > > > > > A)
> > > > > > > > > > >  struct dma_fence *xe_migrate_clear(struct
> > > > > > > > > > > xe_migrate *m,
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > > > index d1a403cfb628..630082e809ba 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > > > @@ -315,6 +315,32 @@ static inline void
> > > > > > > > > > > xe_res_next(struct
> > > > > > > > > > > xe_res_cursor *cur, u64 size)
> > > > > > > > > > >         }
> > > > > > > > > > >  }
> > > > > > > > > > >  
> > > > > > > > > > > +/**
> > > > > > > > > > > + * xe_res_next_dirty - advance the cursor to next
> > > > > > > > > > > dirty
> > > > > > > > > > > buddy
> > > > > > > > > > > block
> > > > > > > > > > > + *
> > > > > > > > > > > + * @cur: the cursor to advance
> > > > > > > > > > > + *
> > > > > > > > > > > + * Move the cursor until dirty buddy block is
> > > > > > > > > > > found.
> > > > > > > > > > > + *
> > > > > > > > > > > + * Return: Number of bytes cursor has been
> > > > > > > > > > > advanced
> > > > > > > > > > > + */
> > > > > > > > > > > +static inline u64 xe_res_next_dirty(struct
> > > > > > > > > > > xe_res_cursor
> > > > > > > > > > > *cur)
> > > > > > > > > > > +{
> > > > > > > > > > > +       struct drm_buddy_block *block = cur->node;
> > > > > > > > > > > +       u64 bytes = 0;
> > > > > > > > > > > +
> > > > > > > > > > > +       XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > > > > > > > +                  cur->mem_type != XE_PL_VRAM1);
> > > > > > > > > > 
> > > > > > > > > > What if we have more than just these two? Maybe check
> > > > > > > > > > against
> > > > > > > > > > the
> > > > > > > > > > mask
> > > > > > > > > > instead.
> > > > > > > 
> > > > > > > Sure. I think we do this test in a couple of other places
> > > > > > > in the
> > > > > > > driver too
> > > > > > > and clean this up in seperate patch first.
> > > > > > 
> > > > > > No problem, just wanted to call it out. We can do this
> > > > > > later..
> > > > > > 
> > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > +
> > > > > > > > > > > +       while (cur->remaining &&
> > > > > > > > > > > drm_buddy_block_is_clear(block))
> > > > > > > > > > > {
> > > > > > > > > > > +               bytes += cur->size;
> > > > > > > > > > > +               xe_res_next(cur, cur->size);
> > > > > > > > > > > +               block = cur->node;
> > > > > > > > > > > +       }
> > > > > > > > > > > +
> > > > > > > > > > > +       return bytes;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >  /**
> > > > > > > > > > >   * xe_res_dma - return dma address of cursor at
> > > > > > > > > > > current
> > > > > > > > > > > position
> > > > > > > > > > >   *
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > > > @@ -84,6 +84,9 @@ static int
> > > > > > > > > > > xe_ttm_vram_mgr_new(struct
> > > > > > > > > > > ttm_resource_manager *man,
> > > > > > > > > > >         if (place->fpfn || lpfn != man->size >>
> > > > > > > > > > > PAGE_SHIFT)
> > > > > > > > > > >                 vres->flags |=
> > > > > > > > > > > DRM_BUDDY_RANGE_ALLOCATION;
> > > > > > > > > > >  
> > > > > > > > > > > +       if (tbo->type == ttm_bo_type_device)
> > > > > > > > > > > +               vres->flags |=
> > > > > > > > > > > DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > > > > > > > +
> > > > > > > > > > >         if (WARN_ON(!vres->base.size)) {
> > > > > > > > > > >                 err = -EINVAL;
> > > > > > > > > > >                 goto error_fini;
> > > > > > > > > > > @@ -187,7 +190,7 @@ static void
> > > > > > > > > > > xe_ttm_vram_mgr_del(struct
> > > > > > > > > > > ttm_resource_manager *man,
> > > > > > > > > > >         struct drm_buddy *mm = &mgr->mm;
> > > > > > > > > > >  
> > > > > > > > > > >         mutex_lock(&mgr->lock);
> > > > > > > > > > > -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > > > > > > > +       drm_buddy_free_list(mm, &vres->blocks,
> > > > > > > > > > > vres-
> > > > > > > > > > > > flags);
> > > > > > > > > > >         mgr->visible_avail += vres-
> > > > > > > > > > > >used_visible_size;
> > > > > > > > > > >         mutex_unlock(&mgr->lock);
> > > > > > > > > > >  
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > > > @@ -36,6 +36,12 @@
> > > > > > > > > > > to_xe_ttm_vram_mgr_resource(struct
> > > > > > > > > > > ttm_resource
> > > > > > > > > > > *res)
> > > > > > > > > > >         return container_of(res, struct
> > > > > > > > > > > xe_ttm_vram_mgr_resource,
> > > > > > > > > > > base);
> > > > > > > > > > >  }
> > > > > > > > > > >  
> > > > > > > > > > > +static inline void
> > > > > > > > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct
> > > > > > > > > > > ttm_resource
> > > > > > > > > > > *res)
> > > > > > > > > > > +{
> > > > > > > > > > > +       to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > > > > > > > DRM_BUDDY_CLEARED;
> > > > > > > > > > 
> > > > > > > > > > I see the amd driver is doing the same thing here.
> > > > > > > > > > Maybe we
> > > > > > > > > > can
> > > > > > > > > > pull
> > > > > > > > > > this in based on the flags given at the resource
> > > > > > > > > > initialization
> > > > > > > > > > so
> > > > > > > > > > we
> > > > > > > > > > can potentially tweak this for different scenarios
> > > > > > > > > > (when to
> > > > > > > > > > free)
> > > > > > > > > > and
> > > > > > > > > > converge what we're doing here and what amd is doing
> > > > > > > > > > into
> > > > > > > > > > the
> > > > > > > > > > common
> > > > > > > > > > code.
> > > > > > > > > > 
> > > > > > > 
> > > > > > > AMD has a flag, which is the same test in this series as
> > > > > > > 'type ==
> > > > > > > ttm_bo_type_device'. AMD blindly sets this flag on user BO
> > > > > > > creation
> > > > > > > but
> > > > > > > as I stated above we could wire this to uAPI if needed.
> 
> Sorry I didn't fully understand the response here. So I was saying we

Ok, my bad, I think get what you are suggesting now.

> have a common routine on the drm side that takes a flag (CLEAR_ON_ALLOC
> vs CLEAR_ON_FREE) and performs the operation based on the flag. Then

'performs the operation based on the flag'

Do you mean the clear - that is device specific operation hence in the
TTM vfunc release notify.

> both users on this side would just CLEAR_ON_FREE. Or we can even drop
> that flag and just assume everyone will always CLEAR_ON_FREE to avoid
> the extra code of clear-on-alloc. Then if we do decide to do some uAPI

'avoid the extra code of clear-on-alloc' - The clear on alloc is skipped
if buddy blocks are marked as clear. There is not a guarantee they will
be clear given we skip clear-on-free for kernel memory, drm buddy does
not initialize blocks to clear, or for whatever reason the clear-on-free
fails in the TTM release notify vfunc function (e.g., a kmalloc fails
there).

> in the future we add the extra flag. But it still lets us consolidate
> the amd and intel routines.
> 

You mean xe_ttm_vram_mgr_resource_set_cleared /
amdgpu_vram_mgr_set_cleared?

Both of those operate on a driver specific structure which encapsulates
a TTM resource. TTM allocates memory via a TTM resource manager
abstraction /w driver vfuncs making no assumptions about memory
allocation - AMD and Intel happen to use the DRM buddy allocator for
VRAM but TTM again has no idea how the memory is being allocated. So
sticking a buddy allocation specific flag into TTM is a no go.

We could add specific TTM flag to TTM resource saying the resource is
clear and convert to buddy flag upon block list free, but we don't have
a flags fields in the TTM resource whereas the driver side we do. Also
have you ever tried changing TTM - it is not a whole lot of fun and
I pretty much guarnetee it will get nacked for one reason or another.
That is not something I would personally even attempt to post because I
know better.

> The type == ttm_bo_type_device seems like something we can extract out
> as device-specific.
> 

What do mean extract? A driver side helper? I thought about that but
struggled a bit with naming so left out. Could include that in next rev
I suppose.

Matt

> Thanks,
> Stuart
> 
> > > > > > > 
> > > > > > > Also I think there are some kernel BOs which clear-on-free
> > > > > > > is
> > > > > > > safe
> > > > > > > too
> > > > > > > (e.g., I think only PT BOs need contents to stick around
> > > > > > > after
> > > > > > > final
> > > > > > > put
> > > > > > > until dma-resv is clean of fences). Would have to fully to
> > > > > > > test
> > > > > > > for
> > > > > > > definitive answer though.
> > > > > > 
> > > > > > In most cases the kernel operations are going to be lower
> > > > > > priority
> > > > > > than
> > > > > 
> > > > > It is the inverse of that - kernel operations are a always
> > > > > higher
> > > > > priority as without them a user app can't function (think any
> > > > > page
> > > > > table
> > > > > memory allocation or memory allocation for a LRC). This is one
> > > > > of
> > > > > reasons we just pin kernel memory in Xe compared evictable
> > > > > kernel
> > > > > memory
> > > > > in the i915 (also evicting kernel memory is a huge pain as we
> > > > > have
> > > > > idle
> > > > > the GuC state which could use that memory).
> > > > 
> > > > We're talking about kernel operations attached to different
> > > > processes
> > > > though. The incoming kernel work would be for a new user process
> > > > (prepping the buffer for submission). The existing user process
> > > > IMO
> > > > should have higher priority.
> > > > 
> > > 
> > > You still have to wait on the user operation complete in dma-resv
> > > mode
> > > before stealing memory.
> > > 
> > > In LR preempt fence mode, we'd wait until LR VM is preempted off
> > > the
> > > hardware.
> > > 
> > > In LR fault mode, we can steal the memory immediately.
> > > 
> > 
> > s/immediately/after TLB invalidation completes
> > 
> > Matt
> > 
> > > There is no difference though if we are trying to get kernel memory
> > > or
> > > user memory - this is just how eviction works.
> > > 
> > > Also if we are in LR mode, we have no idea how long the user
> > > processes
> > > which we stealing memory from will take to complete (e.g., we do
> > > not
> > > install fences in dma-resv attached to jobs as the fences could run
> > > forever breaking the rules of fence or in other word breaking
> > > reclaim).
> > > 
> > > This is where pinning of user memory could come in play /w some
> > > accounting controler, likely cgroups. LR mode could pin some memory
> > > to
> > > ensure fast forward progress or buffers it really doesn't want to
> > > be
> > > moved around (e.g., buffers exported over a fast network
> > > interconnect).
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > > 
> > > > > > the user operations (with the exception of maybe page
> > > > > > faults). We
> > > > > > had
> > > > > > looked at things in i915 like preempting kernel operations
> > > > > > when a
> > > > > > user
> > > > > > op comes in (the user clear-on-alloc preempts the kernel
> > > > > > clear-on-
> > > > > > free/alloc). This probably falls in the same optimization
> > > > > > category
> > > > > > you
> > > > > 
> > > > > We definitely won't do that as this would require multiple
> > > > > migration
> > > > > queues and preemption via the GuC is so expensive I'd doubt
> > > > > you'd
> > > > > ever
> > > > > win. I guess we could have a convolved algorithm in the
> > > > > migration
> > > > > queue
> > > > > to jump to higher priortiy jobs but would need some really
> > > > > strong
> > > > > data
> > > > > indicating this is needed. Also with dma-resv basically the
> > > > > migration
> > > > > queue needs to be idle before anything from the user can run.
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > mentioned, although it doesn't necessarily need a user hint.
> > > > > > 
> > > > > > Thanks,
> > > > > > Stuart
> > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > > > Thanks,
> > > > > > > > > > Stuart
> > > > > > > > > > 
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >  static inline struct xe_ttm_vram_mgr *
> > > > > > > > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager
> > > > > > > > > > > *man)
> > > > > > > > > > >  {
> > > > > > > > > > 
> > > > > > > > 
> > > > > > 
> > > > 
> 
