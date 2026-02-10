Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B019EA3F18
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 22:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1146A10E071;
	Tue, 10 Feb 2026 22:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFcgitjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837410E071
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770761043; x=1802297043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qtnS6Fi++duMRCGgW2X9f40VIG8NYr4jRqnNeTZnvjQ=;
 b=XFcgitjRTTgaCcvXugd2V5LMjCb7gXSuWyBufdQ1lJL+lwH/aCUXpjj0
 Yy2ssVXq1p6+DPaIHt2fndkE6lCBqQd6Iqj0/EFPiTAFM8Brc6Otv24Ob
 DAi3SIpP1vlJcrF/4vq8HeekwhE6qv26HcGFM6aYNuD29WYnEUgT/ZqVh
 z0HtSSrInEQIQgEgp0xk1H992vR/aqHpuvqJWO6tU5J2gx0WLe9Jjx1BY
 RJBJ5faMI9UHShWzn/cX+NWhSiFMNu7unjZwuXfhJidAkUTTVclrEniEl
 jRIYWcCQub7M7LPcmKnRckVVRiH1pFU3rzPVsXUMs5mJykujplK5ZfoW0 w==;
X-CSE-ConnectionGUID: eCCyc8f4SVevpM7L11SLQg==
X-CSE-MsgGUID: NkRUlqHKRtOnEMEj3NWjeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71111398"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71111398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:04:02 -0800
X-CSE-ConnectionGUID: E/LFKLURQR+XH6PWmJFkFw==
X-CSE-MsgGUID: QuubtoLGQ1yYhItoNbZcJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216554322"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:04:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:04:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 14:04:01 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:04:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzFM+XirZI7QThfI3E0U3pyB4hZAF9au9bagK9Zgwo9MAuofLyxEfVAtKK5H4rMZTy5jH32hv+dRI2FwCS+xCHrOsGV9nXbLXNz95OXDp/8Uhe9BzHZ4Syygq5TA1ukXfzhmFqK9BUXEmyNOgwcfqk4/dW2h/VHM+MreHfa/WJA1zij6s/bb4KjCCsp1CEPeSii2bNBt26/Do2g0TuS70ooobmgO4mTCAML/3UHbavBtO6nVRw5TTGDr+5GwfB7Qv5gnoFOnuUHAfm/4mQOppeUu5ZOxQcYqKHKabfnLyXLPzGrDv1irFSf593fz/ykKS54T0MoG54i84sTpCvdglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUFXKSe3IIrHhX7J60xyE4EPqjK+6wNbZEXF7FoaZ2Y=;
 b=SEu4W9CqWWKbCBjVz0iyW4FZb1sFROE723ZUDEVdzdgrzybFu0evHz3cKSz9TiuyC6zVvcfYHYpB6+3QtUXI5uuKNlTZ57mEnhKFLYooVZgbrTTpwZqhsBgBT/HdZIVSCEF9ZiKnKJM0XiHQfo72lOYMghMzBoxeFpgM9JR4xWpM1ZnIXcvSXVmINajaMNlRlSJ7hRG+jiPna5ZWzf1v8MdgD6kyzL1Qtx7o7qR+HHOHLDwqRLvJjva+IV1ty+T8Rhadynm8voeUfvilP700McgtKzmCWRofYiFR5t+NX1SGRkYhZXINhf20ODx3KJa8d1x2WU0BTpyw9jUp8lt98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 22:04:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:03:59 +0000
Date: Tue, 10 Feb 2026 14:03:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/rtp: Write kunit test cases specific for rule
 matching
Message-ID: <20260210220357.GE4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-1-fa9029586bff@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-rtp-rule-parser-v1-1-fa9029586bff@intel.com>
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f9b53e-df2a-4942-8be6-08de68f04b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Dreqp5IaG1dRISzEeMGcwRaxkMbKbG7jRDp9556pSknpyuoc2UP0QmroxW?=
 =?iso-8859-1?Q?QWr1dnR8uvGMAYg1WK8pu3br0bKRfe2o/MZaxGYfsXq+XMU8fCf8rRdOzN?=
 =?iso-8859-1?Q?IJx+ffraXGM+BFcUsawpJnJE7k4DjgtlatXFqROYht/WAAeSGyrkWT/dGp?=
 =?iso-8859-1?Q?8zTLouUVFndQZVG4CnhfQqwjOXO4Pk1Ln2nah9/6+t9CoAzj+UD91oywTY?=
 =?iso-8859-1?Q?c6beFzxDjMMDHa9VGcNQliZTw/vjUDjb+IqbIkvPMODzeHUGoo8AsTLU2d?=
 =?iso-8859-1?Q?dAMqMMDxPvaTZzDO3UOTYCzQ1vBdjcVTgNu7hPcVovfzW6AUoNDPls1PA6?=
 =?iso-8859-1?Q?WjMR8GyroBa3fVRKLDf2szfQXse1NIw2OnKz+nQHaBxNHd3Hn/OpDgtjJQ?=
 =?iso-8859-1?Q?kVN6SYqIDmjR50PDuf5eBMuKWaojx4mypcpO97IOb9FHdrMrd00dxak+1r?=
 =?iso-8859-1?Q?Ye+hLI0oE9ErlDoCHqhMICFQA68p+N2P8r+ug3O3cy/+vbD7QK32Fd+sJB?=
 =?iso-8859-1?Q?B4VDnpRb2INgiP+6hucA5fNoPRLcYPSjdc3lfYRJkGtfRnrUDpmmpY9eYp?=
 =?iso-8859-1?Q?cYPBE+3q0l8Lv0/oQHP3G02mUrpzvqQsv38/+l9As5cCRGA8kippRMxmHz?=
 =?iso-8859-1?Q?zqlKiUVX8ieRhfdhEcdln1veDH2Ds5cx8MrvhHdiG93PEqQ1fK/WBnCIhy?=
 =?iso-8859-1?Q?0uIQeSCedA+/TBw0VRoEzv+vY528ctmg+EppR/N7xvCW49STU/zze5uuzq?=
 =?iso-8859-1?Q?DH1VvJ7aTCYln0ljBf0jd83EOcuflgnkrpDFxPtlTFw2CctT+WWwINK/a+?=
 =?iso-8859-1?Q?RCe8MqEJYQaTmumex2tPZ6U9dqGpRl8dZ5dL6Q4IrErGaKyz16eQI3QQtx?=
 =?iso-8859-1?Q?kpWlQpnPZQ82hvS/vYgV/amzQnoPT5kOf+Sv6+/P3/b9AyJ04TihLlrHhq?=
 =?iso-8859-1?Q?uAOZHMZHlwMggjM4CxgHyhCqKu5OzOrMcRHZu97ggo/uRWMhcYrICBMdwW?=
 =?iso-8859-1?Q?J4033j4FnhfXwMoFS8EGUxRxkrC4XSnI8K01H8Xot90GBY8JvVjrVHjsdk?=
 =?iso-8859-1?Q?vg8lz+hV50ke1zQldvakoELXVtuqKuiLLDsDsXXL3fFhsi2LOi/kvNcdbQ?=
 =?iso-8859-1?Q?2pqjfqlZc4TjJs3YNbJhJe8eBR6xxqoARUsYGRVFAUTCwZ4kB+5JVC0AiA?=
 =?iso-8859-1?Q?AeeW7K74RQ1vcU7lEWfu5Wv3O0tygXHS7Q0NVm2KlZqtaz2xTEabFd8FrJ?=
 =?iso-8859-1?Q?utkQbiitSpusKU85HwCAgWcRSdbKkoD11PGgzUOkG1iTwcSWIuyKZXQHRb?=
 =?iso-8859-1?Q?jiDq+Pz7XWCIEeFq/OtsbPC5YI+ei9hY3oUY3YihEFHeP4iHHK71Is7oOR?=
 =?iso-8859-1?Q?YUdIJSwHEhRkMivceL4eKmtLDsfDlrlenNnCG7rEPQSLg7kITGiIlt6Q7b?=
 =?iso-8859-1?Q?bVwtllg1BcZy2h457PHjhz7hJkJum4ZIuj7xwqrnW4H0lcPhq3dzwC95e7?=
 =?iso-8859-1?Q?unHaPKhunR8b0t+h2lTTsFkbhJuphxlorj4wVza0lwVRpj0DQnTXoT4vg8?=
 =?iso-8859-1?Q?/mUUb7hK71uYA4FvCi5uVz/Dxyce635I3Fom5FxZmsnaYek1IG8bUNRQGn?=
 =?iso-8859-1?Q?fSOHEwsb8Mav0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x3CBWD9Bk3bQlDoBIlfRdnl5syrBK6Wj85j9+T+C1Pu25l2C7H8Xt7VfBk?=
 =?iso-8859-1?Q?5gPN52B9cCVBCvOFF6Azz2GlcjDnJ0EPBID7J7nM2Wia69wq/Q2529mrtd?=
 =?iso-8859-1?Q?V7crGi4jo66noMQtaC4FtjWxDYGEfhcS/J/r+ZehNFLQqR1H/rruVnLSLp?=
 =?iso-8859-1?Q?2VYA7w656PN4QpoSAG68/58//fZliw8ge0V5or3o6abUDcHljcQrmmt+48?=
 =?iso-8859-1?Q?jm/Bjxa8qsHvtVWZJWSaotc/zmgqrFMf/JR+OJIqOtI0890Eko6r/5zdla?=
 =?iso-8859-1?Q?1Fhe/4Wf0GibanrAbGxd3K9uGAk6yswdCiVNbmPQn+KpXcNfJKcmX/r6Yj?=
 =?iso-8859-1?Q?rU2auqJmHC/EanKmlWyJ0S19Nj6GwkglWQhkxmXUaNdytpknMpVjGPOlvI?=
 =?iso-8859-1?Q?PAgc4q+CtbnV5lx5xpl7qknu628E8iBLkLF5pB6okxkKuemUnfN0lEvHLE?=
 =?iso-8859-1?Q?DKycLe2ZidcEourbLPoi0ImYFhEMyKdV9PM/Hw5mLsT5eeZt4xAVa/zWji?=
 =?iso-8859-1?Q?uYOZopj5pPKWy1opr13Hj9+4GtYkXDasXatBcR5W2ali5Ae0BIe+CFWCsX?=
 =?iso-8859-1?Q?ES+HsZ3Af5XiCs4pQ/rNsG8MmF5wWsoOoLNs9o44Y8TqQ7mHbwzyx92krj?=
 =?iso-8859-1?Q?G6K7OZqVOPur02Tbv6I6cmNJIVNIRy3JNg15x6u08rw6HKLH7fG9KnzmQm?=
 =?iso-8859-1?Q?R/tGlvX3+8i/7AZLWF4KmmRVYwB94GEz5swIwnAvYmpgVexV3elACN5stV?=
 =?iso-8859-1?Q?+scAsMyUGECgfj8JDeg6UT5a9w2hCsJhkNc4juJOLXZf44yyj6D0genYEc?=
 =?iso-8859-1?Q?VN26PJW5cJAbSELah0mYt1A8BPwenVnw2l0D21pd7B4rZVrWWQroLLn4J9?=
 =?iso-8859-1?Q?8Z4nsz3ojl69qcZttq20zw0MAy0B96DN/LkFnFzg6AxdEfZENo1ae2YKjK?=
 =?iso-8859-1?Q?cDtccsCDS5yVa8CULFstrAubUrjP7H7xWPLvXeZQleCy8ZT+VUZztK3e0w?=
 =?iso-8859-1?Q?2LU3PtGW4+N3cNp07fKFWuOD7UbkVWFqA/VA7wz4YJtIE/TaV1MRy4dlDw?=
 =?iso-8859-1?Q?P3y2iGwB1bU0/5HI6hciI06TFPYq6EoDmDMAGNYbFul9vhWWllAVTgHz9P?=
 =?iso-8859-1?Q?ThOrJDGJ8bVJHVSdRrS3qAQVK650Q2A+T+O6ZPxKneaoV8DaptflRRr5Fw?=
 =?iso-8859-1?Q?ljpw2wAHaNGV1nQ4KFv2G/AztTMkqrmnvJ4nfZgHaXUcWV7Hy7XdFJ+ewP?=
 =?iso-8859-1?Q?2s70GBzl4/ihddlEgYkcydTCiUY5dWbmyOCjGfHox2r8D8WxV8zyGu1n+l?=
 =?iso-8859-1?Q?zW5LZ79Tjq6oZINNyyfIxJCANj0jIBA0uvAnJJsEYytFplfsXeFw2Zsdvj?=
 =?iso-8859-1?Q?iZdfRowZO7Mu+51earlxJTTsaX+pigzTU/R1qBZvXlJyEpXAuc1DnUVJ3m?=
 =?iso-8859-1?Q?OKT/0klse4GEynTreJSBP89tamvE1V+dr93y3tS93cK8Ejh1gI44ZRpsWw?=
 =?iso-8859-1?Q?wcNOOxY9+RX0TiJ//E1kG56veK4g9doPQVmlMz1PfUcAhTpoT75ZXcfQeu?=
 =?iso-8859-1?Q?DokLIRhOmxvaj1khrP9NEV52JkPZAr80WPQTr+I4CAnptuMj0hvEQ+uZzz?=
 =?iso-8859-1?Q?Q5FumR7P2RhdxxK2dc0Y4ERx3mtBuJybPjYA0lz1m7ovSaAKjqoNdpxmJ8?=
 =?iso-8859-1?Q?iAXtsTdKFisbdO7I40k0Vg1FXSo58c0A1xDi8gRa69cWowc3AcMeTA7JUM?=
 =?iso-8859-1?Q?K8ltCTM69nNlhUWBeJBTJm6HVWckG/CIxhvYMy8CcvU6Mj4573ANPC96Hb?=
 =?iso-8859-1?Q?76ln+kwylg7Q6HXKI+F2XwKJy8KBdW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f9b53e-df2a-4942-8be6-08de68f04b38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:03:59.8811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4bJobF5FiHs5Bar6f8bA73Jd/IEmauH1OftqrBVIVeRM26RA/RSIyM0emwc1NT+MeOY6GdCPW4V8Vi8IHkXrdhI7w+biuUVocpTvyMVyOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

On Wed, Jan 14, 2026 at 07:49:51PM -0300, Gustavo Sousa wrote:
> The kunit test cases for the RTP framework are currently separated into
> those that validate xe_rtp_process_to_sr() and those that validate
> xe_rtp_process().  In both of them, we also have mixed stuff to validate
> rule matching functionality, which should rather be done in a separate
> test case group.
> 
> Let's create such a group, specific for validating rule matching, and
> also add an initial set of cases.  In an upcoming change, we will do a
> cleanup of the other groups by migrating those cases intended for rule
> matching to this new group.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 +++++++++
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 141 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_rtp_test.h |  24 ++++++
>  drivers/gpu/drm/xe/xe_rtp.c            |  55 +++++++++----
>  4 files changed, 242 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
> new file mode 100644
> index 000000000000..b3a8b75936d1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "tests/xe_rtp_test.h"
> +
> +#include <kunit/visibility.h>
> +
> +/**
> + * xe_rtp_rule_matches - Check if a set of RTP rule set match against the
> + *			 device/GT/hwe
> + * @xe: The xe device
> + * @gt: The GT struct (may be NULL)
> + * @hwe: The hw_engine  (may be NULL)
> + * @rules: The array of rules to match against
> + * @n_rules: Number of items in @rules
> + * @err: Pointer (may be NULL) to set error number.
> + *
> + * This parses the set of rules and check if they match against the passed
> + * parameters.
> + *
> + * If passed, @err is updated with a non-zero negative error number or zero if
> + * no errors were found during the parsing/evaluation of rules.
> + *
> + * Returns true if there is a match and false if there is no match or if an
> + * error was found.
> + */
> +bool xe_rtp_rule_matches(const struct xe_device *xe,
> +			 struct xe_gt *gt,
> +			 struct xe_hw_engine *hwe,
> +			 const struct xe_rtp_rule *rules,
> +			 unsigned int n_rules,
> +			 int *err)
> +{
> +	return rule_matches_with_err(xe, gt, hwe, rules, n_rules, err);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_rtp_rule_matches);
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index d2255a59e58f..c3fea547da32 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -19,6 +19,7 @@
>  #include "xe_pci_test.h"
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
> +#include "xe_rtp_test.h"
>  
>  #define REGULAR_REG1	XE_REG(1)
>  #define REGULAR_REG2	XE_REG(2)
> @@ -31,6 +32,14 @@
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
> +struct rtp_rules_test_case {
> +	const char *name;
> +	bool expected_match;
> +	int expected_err;
> +	const struct xe_rtp_rule *rules;
> +	u8 n_rules;
> +};
> +
>  struct rtp_to_sr_test_case {
>  	const char *name;
>  	struct xe_reg expected_reg;
> @@ -60,6 +69,130 @@ static bool match_no(const struct xe_device *xe, const struct xe_gt *gt,
>  	return false;
>  }
>  
> +static const struct rtp_rules_test_case rtp_rules_cases[] = {
> +	/*
> +	 * Single rules.
> +	 *
> +	 * TODO: Include other types of rules as well: GRAPHICS_VERSION(),
> +	 * MEDIA_VERSION(), etc.
> +	 */
> +	{
> +		.name = "no",
> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_no)),
> +	},
> +	{
> +		.name = "yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes)),
> +	},
> +
> +	/* Conjunctions with 2 operands. */
> +	{
> +		.name = "no-and-no",
> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_no), FUNC(match_no)),
> +	},
> +	{
> +		.name = "no-and-yes",
> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-and-no",
> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
> +	},
> +	{
> +		.name = "yes-and-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes)),
> +	},
> +
> +	/* Disjunctions with 2 operands. */
> +	{
> +		.name = "no-or-no",
> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "no-or-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-or-no",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "yes-or-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_yes)),
> +	},
> +
> +	/* Conjunction and disjunctions. */
> +	{
> +		.name = "no-yes-or-no-yes",

The name doesn't quite match the rules on this one.  We should probably
either name this "no-yes-or-yes-no" or swap the final two rules.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		.expected_match = false,
> +		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
> +			     FUNC(match_yes), FUNC(match_no)),
> +	},
> +	{
> +		.name = "no-yes-or-yes-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
> +			     FUNC(match_yes), FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-yes-or-no-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
> +			     FUNC(match_no), FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-yes-or-yes-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
> +			     FUNC(match_yes), FUNC(match_yes)),
> +	},
> +	{
> +		.name = "no-no-or-yes-or-no",
> +		.expected_match = true,
> +		XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
> +			     FUNC(match_yes), OR,
> +			     FUNC(match_no)),
> +	},
> +
> +	/* Syntax errors. */
> +	{
> +		.name = "or",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(OR),
> +	},
> +	{
> +		.name = "or-anything",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(OR, FUNC(match_yes)),
> +	},
> +};
> +
> +static void xe_rtp_rules_tests(struct kunit *test)
> +{
> +	const struct rtp_rules_test_case *param = test->param_value;
> +	struct xe_device *xe = test->priv;
> +	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
> +	int err;
> +	bool match;
> +
> +	match = xe_rtp_rule_matches(xe, gt, NULL, param->rules, param->n_rules, &err);
> +
> +	KUNIT_EXPECT_EQ(test, match, param->expected_match);
> +	KUNIT_EXPECT_EQ(test, err, param->expected_err);
> +}
> +
>  static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  	{
>  		.name = "coalesce-same-reg",
> @@ -488,6 +621,13 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, active, param->expected_active);
>  }
>  
> +static void rtp_rules_desc(const struct rtp_rules_test_case *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(rtp_rules, rtp_rules_cases, rtp_rules_desc);
> +
>  static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
>  {
>  	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> @@ -533,6 +673,7 @@ static void xe_rtp_test_exit(struct kunit *test)
>  }
>  
>  static struct kunit_case xe_rtp_tests[] = {
> +	KUNIT_CASE_PARAM(xe_rtp_rules_tests, rtp_rules_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>  	{}
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
> new file mode 100644
> index 000000000000..0579c1522424
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RTP_TEST_H_
> +#define _XE_RTP_TEST_H_
> +
> +#include <linux/types.h>
> +#include <kunit/test.h>
> +
> +struct xe_device;
> +struct xe_gt;
> +struct xe_hw_engine;
> +struct xe_rtp_rule;
> +
> +bool xe_rtp_rule_matches(const struct xe_device *xe,
> +			 struct xe_gt *gt,
> +			 struct xe_hw_engine *hwe,
> +			 const struct xe_rtp_rule *rules,
> +			 unsigned int n_rules,
> +			 int *err);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index ed509b1c8cfc..e955df6c22ca 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -30,16 +30,20 @@ static bool has_samedia(const struct xe_device *xe)
>  	return xe->info.media_verx100 >= 1300;
>  }
>  
> -static bool rule_matches(const struct xe_device *xe,
> -			 struct xe_gt *gt,
> -			 struct xe_hw_engine *hwe,
> -			 const struct xe_rtp_rule *rules,
> -			 unsigned int n_rules)
> +static bool rule_matches_with_err(const struct xe_device *xe,
> +				  struct xe_gt *gt,
> +				  struct xe_hw_engine *hwe,
> +				  const struct xe_rtp_rule *rules,
> +				  unsigned int n_rules,
> +				  int *err)
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
>  	bool match;
>  
> +	if (err)
> +		*err = 0;
> +
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>  		switch (r->match_type) {
>  		case XE_RTP_MATCH_OR:
> @@ -58,14 +62,14 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.graphics_verx100 == r->ver_start &&
>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.graphics_verx100 >= r->ver_start &&
>  				xe->info.graphics_verx100 <= r->ver_end &&
> @@ -73,13 +77,13 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.graphics_verx100 == r->ver_start;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_STEP:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end &&
> @@ -87,14 +91,14 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.media_verx100 == r->ver_start &&
>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.media_verx100 >= r->ver_start &&
>  				xe->info.media_verx100 <= r->ver_end &&
> @@ -102,7 +106,7 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_MEDIA_STEP:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.step.media >= r->step_start &&
>  				xe->info.step.media < r->step_end &&
> @@ -110,7 +114,7 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
>  			if (drm_WARN_ON(&xe->drm, !gt))
> -				return false;
> +				goto error;
>  
>  			match = xe->info.media_verx100 == r->ver_start;
>  			break;
> @@ -122,13 +126,13 @@ static bool rule_matches(const struct xe_device *xe,
>  			break;
>  		case XE_RTP_MATCH_ENGINE_CLASS:
>  			if (drm_WARN_ON(&xe->drm, !hwe))
> -				return false;
> +				goto error;
>  
>  			match = hwe->class == r->engine_class;
>  			break;
>  		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
>  			if (drm_WARN_ON(&xe->drm, !hwe))
> -				return false;
> +				goto error;
>  
>  			match = hwe->class != r->engine_class;
>  			break;
> @@ -160,9 +164,24 @@ static bool rule_matches(const struct xe_device *xe,
>  
>  done:
>  	if (drm_WARN_ON(&xe->drm, !rcount))
> -		return false;
> +		goto error;
>  
>  	return true;
> +
> +error:
> +	if (err)
> +		*err = -EINVAL;
> +
> +	return false;
> +}
> +
> +static bool rule_matches(const struct xe_device *xe,
> +			 struct xe_gt *gt,
> +			 struct xe_hw_engine *hwe,
> +			 const struct xe_rtp_rule *rules,
> +			 unsigned int n_rules)
> +{
> +	return rule_matches_with_err(xe, gt, hwe, rules, n_rules, NULL);
>  }
>  
>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> @@ -385,3 +404,7 @@ bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
>  {
>  	return xe->info.has_flat_ccs;
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_rtp.c"
> +#endif
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
