Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1ACE8D7A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA710E6D5;
	Thu, 19 Sep 2024 11:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlPO0KHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C958D10E6BC
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726746945; x=1758282945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iTW6rZqEDx5LpE4+PIBSJ96u7ovd1slvVQYpW20UIVU=;
 b=LlPO0KHrNAS0587LxATxgwextDq6NEOmfOYb+ZXaQIfqdvWM4hpHAB4x
 h7PfvpRmCGxtNPtzbr6TT8/WIbXNMaLiTEz1IkEaLFdf1SR6cVtEZTmHa
 AWtIJkj5V0g/TDsC0Y1RfgPYG8r4FP7lUJ4TkaFBMLw2TdwIgs+Y4cwRd
 zOvW2tWtz3tktT8m5D1tO/NJkCPRBk4N3trk/2D6DyKZRpFZPSTD/c82X
 gENKej3yOd+tTSyevh3pZ03xr7wSlE4jjo9+9zNJnCswHKp7GCWUSviE+
 Dzwnz5Unq8CVpgVompWVFINxRATdPWNesQCzYkBF7JMA8tiv4HsOkIkGs A==;
X-CSE-ConnectionGUID: AYAE+AqXRSmDMRL764bEVg==
X-CSE-MsgGUID: fey3cDmpQ+KHy4+OMnfBjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25530906"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25530906"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:55:44 -0700
X-CSE-ConnectionGUID: NcGqatTDRxexkIIE7rbQaQ==
X-CSE-MsgGUID: J4W6xbCURtSQ1lOYFjQKow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70200258"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 04:55:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 04:55:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 04:55:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 04:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HA0XHFGBEtMy5XGQmWqMrH1HXp+2gsT4lVCbFpwCsozoMSoy4FUgkwz8Oo5YcO3ECIlMs6tbGqtj5Z2lWQpWv3oSBgvSmkCssdTlw9I0yycNxJWWFbzFsdDzmH4WbAb9h9lDRlpvGKpRAms92PnUUFKpTwi9I5jYBaIey66HI0L2RAV/Sp1EGIZyE462zh0zQQMPEfsrWf97Kh+CMOcaV8HPlmWuis5KTaLJiK0ILYhcUpGqtTRNozxhGG1Xtt7MYHOC4nxM9W+4mIHHG8aOOqOsCbmCAPy9OcASTqWj0nJJS01eIf79JoCUO5yzMASZn775twzChuKgRt/DZ/5u9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN8U1GtPuHJO7IpB0TjsXj/fsYUmoi26R1tYtwgXsIU=;
 b=vK2SyAvNiQu46xIwkC2498fB9d0rhH35WifwCE2VsUBJRwoKdxYaGl3AentHRx0iyanSr3EshdLlkmo399yohYKVYrY7vLOfbf0+C9qU+rdvrotBXHUs4U7p+NQdfqn7R9HUsIHzoKQLRhZIxqp1hXUbd/2OIe/KDNYsXUIL8OnTLZ/NXhTHKRGORJwJ1GVwZ5bW6JXuAXEgNCbnXHey4384ucga0hZPthl3kvuGta+OZrMqItQwkkgZpVUZb5sdO2Ldq0pscJnqT60ZjuKjQ+ze14+KPMvEDPkV2OXhho985Awa+7yCm9foWhgPugYZF7XA+Z0fjIOlZcZV4ojxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 11:55:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 11:55:39 +0000
Date: Thu, 19 Sep 2024 06:55:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
Message-ID: <kyebnlz3e5oa2jys5doywbtf6d5vuy3zlvfpyf42sajegrkzyu@xop4wwa5hddv>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
 <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <fmn7yawuj6t2o6iwlwftyrxyjefkx2sicow6ynpb3evsdzluwi@vtamjjybuavm>
 <ZuveeB0xRivXDe4H@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZuveeB0xRivXDe4H@bvivekan-mobl1>
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 556aa5c5-e7a3-4dbf-ce62-08dcd8a1fae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0rK4g/mfGp6/1Wn8QEIH6cbeWqYEbggOqWPmNX9WH6z5fHEOrkEnofy8Klv6?=
 =?us-ascii?Q?66YOOo2PHStRJHp21wkeskx7yvuaGFud6qVhTwZdV9ZUery+CLc4FcIkgl9U?=
 =?us-ascii?Q?GPMzZ1pwWP+juesTKqPNc+RyjJcvZUJy9FJKHe49E1fUFW1yAQacQnIvKSJz?=
 =?us-ascii?Q?RVruMZNu0DWXQ53LrniBYMbHDKZ9L5YUpqvvyL4X2c5z5oKYd4wEoJARbzJr?=
 =?us-ascii?Q?8qaxXgTi5bIlQZjKE3I+pL26qAiY5buUIIlUNl3XRyUnRv8KIjITP4LJEV2J?=
 =?us-ascii?Q?ogKcml/EuJ7+n7memFYHwAiJKyJRY+Q68MECqcGvYfFuj7Do5fibo/GOD3+v?=
 =?us-ascii?Q?BRVXjFZ9nIFs54qWo2aTSOnXwZtnn4w9rFjaTceEIc+t3YuBjB7nRtlZ0UP+?=
 =?us-ascii?Q?OEFLbUKvW46/tXdanaMaGUuDtq7BhnHmFexobJg22fK32YOHhkqr0QvR/G6T?=
 =?us-ascii?Q?5rAJSNE+YAdAv2+PrC6bDPpuJGgTZwkgbkTOgKLeWUD0/kiEhFY8mR2N2+Ed?=
 =?us-ascii?Q?WDxXReJdoTGswxQkZ6wDBJLgi6FnMqJ78RK9CEsg5pPuHrGQ78Q/i/NzVboR?=
 =?us-ascii?Q?QCg58bFhzs+3Z6W8FqYedfxqXs8jG2rMgUS6/ewvZnSsLkeXpZkWVBHfs6zd?=
 =?us-ascii?Q?T2O1CV1IciONMXDlsbwqQTokUzSspvI6WVwFOUaYtN1D1ObqlV+xRpLif4dQ?=
 =?us-ascii?Q?4ipLTQs+qxMUAf+TaC+1A0ducPaIZsFhocsRcXXkGSVWPBpcM8nYdBuRMYl/?=
 =?us-ascii?Q?IisZWkC5qaDYUBW4WsKf3nuqvmIBm283nX/0o/sT4MS9SBkmiDiDAwmixwvF?=
 =?us-ascii?Q?R+MmNbN8BH+gUkdsET9ghvKTQb2cITYTT4bL0fAyuu+1cZ+DzGQWVXY7wUaF?=
 =?us-ascii?Q?8l2IAHjcE/DgNiRSq8r6JQa/h3aImR6CA82O1CenGHX/Xy9DBcsUJlXoJyi8?=
 =?us-ascii?Q?Vs/3CrRBoT0Rj6tJGhtAWImitFP4X19L92JCZXV3t3l46aQSePHIPTvBrHrw?=
 =?us-ascii?Q?jqSDMr2tbbZK4BZbF5MOqcRDkKfp13MGbUb55maIEAsgHAB6d6c0wKrD0y2C?=
 =?us-ascii?Q?F1VjIuz1TgkD5U4BzjPnS/bvyf3oAbIIFyjyU9Fj4bmR2JNNYK0eTgNtvj9Q?=
 =?us-ascii?Q?ypWkpXJQdMSC8iWkCllzV9D4HJwWPJUza09AzI7U0wmmyMusyqTQEjM6vfgT?=
 =?us-ascii?Q?Pwi1C8n4BxkPAWCArhIJ5l+YqGG1Vv1/rWNtaskAw5yYuRax/g/p7FVnmV0W?=
 =?us-ascii?Q?ZIvvTilYCQZENvbHxOdZ1I3FLSXVLbgf1zn6b0DG0LS5rb2zgiY8oVmZdQFu?=
 =?us-ascii?Q?Z0tdhehAOo/siR7qswO13BZegtq9Lifi7MzbPvfSbDJpHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNMywVzd3f5lbBxfCfiOBUUfmrLPhAFPKPgqD38tO+D09TAA8yJyHzccyZYS?=
 =?us-ascii?Q?szyr16QijiwdNWHXqWaUBYOw0jgRpMYuaZzb4t8r1ZplIc8wF2sv9P68t4Od?=
 =?us-ascii?Q?WZM5uyzJKSiDvXDsAOtITxXgsloqrQYtwdWIjex5X7NC101+dGUockugx95C?=
 =?us-ascii?Q?uwKAjepGAibcoMT4PPje4uLhFzMzF29LAAwcce3xFI0EL1lQuBEaAVTtfvz1?=
 =?us-ascii?Q?IbyyBwQda+71cCw48IFezJcsQv3ydELs3UCPqYgVLcnfZVX2MOC7bb3GPTgB?=
 =?us-ascii?Q?JIX9dyd6uzUMa8hoMeJz6LKJKfB8zkyUFpXpgZTn69Il7HkXxI/FBLngkC3m?=
 =?us-ascii?Q?OYAOpZfkSuBkXMOGjB1t0DEcOILdZfbo4o7C/5LeIva2ItTu7sXHzdTwifne?=
 =?us-ascii?Q?hG7T15ksgDohAo7v1GsOUCR7THcBBb/tkCayv6Ey1wqYN9Q2V9y/Assvz7zB?=
 =?us-ascii?Q?uwkbtlFRooPoIwCNv7uifBLapTl16WdLHDFbiaLoxTRNll3jArYKmDuQSVjv?=
 =?us-ascii?Q?+ueIdnVe8KJCWC46H8n0X1DYWgX//gIGqZUaKB9ZR8kSfLIwuZ0Eru5sm7LV?=
 =?us-ascii?Q?NQwpPPcalBzquu+VWaV7J/CuC7PTlbeLUnHJ2vfTcDy/zPy6zsyuXlVxiGFm?=
 =?us-ascii?Q?kMVkkGLC01PtURykUmyzszMEDUwudT7qDK9aIm+AvNlOvN+IbdriVAFr99yp?=
 =?us-ascii?Q?YDA4IP9MXK1PsWFDpEGLOwhxaGHxeGbvbV2Uz/y8fpm9jsdblqswTg7BhXL0?=
 =?us-ascii?Q?YPwlxX/FlduKXv5kZdOe92tTIZMGok9GLd6ZJ/f9Fd+r/b58J7UHdFwqhYPE?=
 =?us-ascii?Q?WCKibLCE6a7A2mz6ZMCD6ScFnLVONoA389MQw4ab9GMN67pGQ1ygXlI907Ob?=
 =?us-ascii?Q?XPprvipm3cyiXa4w+4vhDAUEldfq1mQgFzPF7YbTLuf+DgXmyhTPt0pHRh2u?=
 =?us-ascii?Q?eatto/nG1LdRo0vvkQsfOIF9Iq3QLStq3nujNmZs7SpzOMzq+gm6+qxOsi7N?=
 =?us-ascii?Q?wMwWZonN1YxwonzHwspKQLdw8fJVDECX8RWtzIaI93i7cY11MMZiWA6WE3jS?=
 =?us-ascii?Q?MZfg3GpCPcO+fEHJrMt5k4asMHad41R6HnMhyC4yy/3TL6grTiKsS6LPAzEz?=
 =?us-ascii?Q?g0nmsTeD47fZbghWOmoT6eTIk4zZxt7ZDrx7ElYaG8Y3E8gOa2d3wdFmf+C/?=
 =?us-ascii?Q?Am/MVtFD/AfjHeVsAF7nkPBix3a9jDbsMPrEcgVcQDn3Q7Db7zM6+vKWENMl?=
 =?us-ascii?Q?A2jMZ4J+8W0B0et1jzLQD0KY65f3vsBFFUzNpUPLsRY3EX7TVmZ5eYtz5nHZ?=
 =?us-ascii?Q?Td8uf+wyYgALarGvzM+sCZarG5gbXqpWjFRRAfwytLU0nDmxW43nqtXiTpkR?=
 =?us-ascii?Q?bxiPMxtdC3kNnv68fhYTzt8NeiQhxl/z7tOxtcpepPA6afFMCXtFS2M4ui4D?=
 =?us-ascii?Q?W4/xuC+d72w+mqb0DPcIcmfaoVEUubuXg6gc0wMCRzfhLYniOc2ZITzr6DLX?=
 =?us-ascii?Q?Gexxj059gh+OsgoB4CLRW/Gna3LYJbs1TkexS8D4eRrKH7H1FT0iOg+a8bdb?=
 =?us-ascii?Q?njnVBGDrn2tnszrESjggQnYkAuU691AqxsWyl60wiNDoRKfkh9g98Z16qcfn?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 556aa5c5-e7a3-4dbf-ce62-08dcd8a1fae1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 11:55:39.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egKyVQ1qiDQQNqT9G+32m2uIkbjMYPGniiR9XlwqW7iiyvbGWwUV17SfIjW1F1cTw3sqtR4c9A1HMOr2dR5rduDLUFMBT7yPP3BfAQnvz9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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

On Thu, Sep 19, 2024 at 01:49:04PM GMT, Vivekanandan, Balasubramani wrote:
>On 18.09.2024 15:43, Lucas De Marchi wrote:
>> On Wed, Sep 18, 2024 at 11:11:10AM GMT, Upadhyay, Tejas wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Vivekanandan, Balasubramani
>> > > <balasubramani.vivekanandan@intel.com>
>> > > Sent: Wednesday, September 18, 2024 3:33 PM
>> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> > > xe@lists.freedesktop.org
>> > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
>> > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
>> > > Marchi, Lucas <lucas.demarchi@intel.com>
>> > > Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
>> > >
>> > > On 18.09.2024 15:09, Upadhyay, Tejas wrote:
>> > > >
>> > > >
>> > > > > -----Original Message-----
>> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> > > > > Balasubramani Vivekanandan
>> > > > > Sent: Wednesday, September 18, 2024 1:42 PM
>> > > > > To: intel-xe@lists.freedesktop.org
>> > > > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
>> > > > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
>> > > > > Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan,
>> > > > > Balasubramani <balasubramani.vivekanandan@intel.com>
>> > > > > Subject: [PATCH] drm/xe: Decrement client count immediately on file
>> > > > > close
>> > > > >
>> > > > > Decrement the client count immediately on file close. It is not
>> > > > > required to be deferred to the resource cleanup function. Otherwise
>> > > > > there will be a small time window, where there will be a non-zero
>> > > > > client count even after closing all open file handles.
>> > > > > This affects ccs_mode(xe_compute) igt tests as these tests try to
>> > > > > change the ccs_mode immediately after closing all file handles, but
>> > > > > the driver rejects the ccs_mode change request as it sees a non-zero client
>> > > count.
>> > > > >
>> > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>> > > > > Signed-off-by: Balasubramani Vivekanandan
>> > > > > <balasubramani.vivekanandan@intel.com>
>> > > > > ---
>> > > > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
>> > > > >  1 file changed, 4 insertions(+), 5 deletions(-)
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > > > > b/drivers/gpu/drm/xe/xe_device.c index 4d3c794f134c..3bccea6212ff
>> > > > > 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > > @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device
>> > > > > *dev, struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
>> > > > >  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>> > > > > -	struct xe_device *xe = xef->xe;
>> > > > >
>> > > > >  	xa_destroy(&xef->exec_queue.xa);
>> > > > >  	mutex_destroy(&xef->exec_queue.lock);
>> > > > >  	xa_destroy(&xef->vm.xa);
>> > > > >  	mutex_destroy(&xef->vm.lock);
>> > > > >
>> > > > > -	spin_lock(&xe->clients.lock);
>> > > > > -	xe->clients.count--;
>> > > > > -	spin_unlock(&xe->clients.lock);
>> > > > > -
>> > > > >  	xe_drm_client_put(xef->client);
>> > > > >  	kfree(xef->process_name);
>> > > > >  	kfree(xef);
>> > > > > @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device
>> > > > > *dev, struct drm_file *file)
>> > > > >
>> > > > >  	xe_file_put(xef);
>> > > > >
>> > > > > +	spin_lock(&xe->clients.lock);
>> > > > > +	xe->clients.count--;
>> > > > > +	spin_unlock(&xe->clients.lock);
>> > > >
>> > > > The file_close here is sychronus and serialized call with respect to
>> > > userspace. Any settings done through sysfs post file_close should not required
>> > > this change as far as I know. Would please explain scenario better?
>> > >
>> > > In the current code, the client count is decremented in the function
>> > > xe_file_destroy which is not invoked synchronously from xe_file_close.
>> > > It is called when all references to xe_file are lost.
>> > > References to xe_file are held during creation of vm and exec_queues. So the
>> > > somebody might still be holding reference to xe_file while xe_file_close is
>> > > called. Therefore the invocation of xe_file_destroy might be deferred.
>> > > As of result, driver might see a non-zero client count even after all file handles
>> > > are actually closed which is incorrect. We can defer only the freeing of
>> > > resources to xe_file_destroy but the client count can be immediately adjusted
>> > > in xe_file_close.
>> >
>> > If whoever has hold ref, might still use ccs, why would we allow changing ccs mode in that case!
>>
>> if the file is closed, there wouldn't be any submission at all. ref is
>> kept alive for the data to be available for updates on the sw side only.
>>
>> but I'm wondering on the value of this client tracking... this is so
>> uncommon that we maybe should rely just on the list of open files being
>> empty?
>
>Using this client count also blocks changing the ccs mode even when any
>display activity increments the client count. During module load, fbdev
>initialization increments the client count. ccs_mode change should be
>independent of display.

hum... so also kernel clients? But I'm not sure it's required for kernel
clients as kernel itself is aware of when/if it's changing.

>
>I am thinking does it make sense to confirm if the all ccs engines are
>idle before attempting the ccs_mode change.
>@Niranjana your thoughts?


I think the problem is.... it changes the number of CCS engines. What
happens if a client doesn't have something active on CCS, but was
expecting it to match the value from a few seconds ago, before someone
changed CCS_MODE.

Lucas De Marchi

>
>Regards,
>Bala
>
>>
>> Lucas De Marchi
>>
>> >
>> > Tejas
>> > >
>> > > Regards,
>> > > Bala
>> > > >
>> > > > Tejas
>> > > > > +
>> > > > >  	xe_pm_runtime_put(xe);
>> > > > >  }
>> > > > >
>> > > > > --
>> > > > > 2.34.1
>> > > >
