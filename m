Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40600E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 22:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2E10E248;
	Fri, 13 Dec 2024 22:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inTDM33r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95D710E248
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 22:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734127389; x=1765663389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8jDIAtRDz/z65RF2p4/kfGTAhwFq5vUDNZov/9AGWbc=;
 b=inTDM33r8zocoT5qbk+d0GqeKQaOQdnlM0OuSrEhU342aGDyPTuvkCV/
 iFVzNU6+O3X/WEIckZ+rA2PL+ebvR4r/tq32WdqLs0ixSGBs+ouXATJjg
 hSD/hWBAKuTP+TJdFW8VxgyVIRqUYVsU//97r0ZKXZdQEQD0dsHrVpvpm
 EQG7M36qw0ivg1CUUViPt1g8cr9tyk8EHbv90KEBdesYhTK0uI2zuvHjp
 b5RRcQtJrWAKDqIQaX1Mt4UzPgheTKRSBtY0TtmuJ0slJxVzVyRPU1I1y
 /c2pHwOQ1FtBWlApaoB/iMXxAMnJLc2ptjOfjN44hxb/W8gun9nJHlGkP Q==;
X-CSE-ConnectionGUID: bjmPCmMvRA2I2NA5pcueEQ==
X-CSE-MsgGUID: rCF7yrJsRP2XmE/QSvpn2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34463368"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34463368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 14:03:09 -0800
X-CSE-ConnectionGUID: pMEQliYfTMmmbqz192EixA==
X-CSE-MsgGUID: bG8OKYvuS1qQCJG3TDgdIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="96554703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 14:03:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 14:03:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 14:03:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 14:03:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS69QnNxKhaQ6HBel1F40qloSe7zZ0w2lR8d4tAVyFqNG/KBauMpXCRnnfHymFt4P7M20xHvye8OI492FYXldqOxfQRXezz/oozVywVXX9dCSP1vgDe0qGy0iOkUjNZF9Wqw9qBx+UquV3My34z+7yb+BcvYG5x6a6XwXqyIIx9grS1j+j9IsCA85INp+O+BSyL70wrM/uaDuTghRtA5qDfuDHiB/bTiICB9sJd0/jBDygBF57rTA9PSbuB1k2afgbJYWkU3/2+6iNMke/I5gzZ29dUiN/nMmbL9BQoDj9Rq1IZA9qapgDml0L5jhorOK4aY1/zjgNvWcN/KR5n2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h84m6yjUPQdkP6OpPAMZVrTOWRoZpUYTPaPaRSo/oQE=;
 b=EO3DM08TEW1QlHQgynSxnfVGBn24AzJOaWsUH4QQSH88peaZATyRUtmIzIVMt5TVoj24jVprvdA1YI/z179COZgNdFT/DPtifJoW18j0UlVDdJVnjxt6Oi6t638wq/z16egCuajIXQ4he4+J+ee6c45zRikU+Sr8mRSMF/Oy90tWMiidJrV7wgH96rTTtkXdJ6LMjJne2bHG5mH3EReOV/FaYCeF95n+JjVrgzp1WkC7Ba8RSZH8MbGM3BmTSCPtw9/2EfpwBq3lXOcHMlkKKp0bif3HydAGaEb16giBcYU83idfuStsdeTcN21SJZwSjk2dDk/YO18Puky9k1ozkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 22:02:50 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 22:02:49 +0000
Date: Fri, 13 Dec 2024 17:02:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Message-ID: <Z1yvA4Zz_WtojAgk@intel.com>
References: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
 <8fa47b562f86a647d36a143a1daf139c59b3e390.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fa47b562f86a647d36a143a1daf139c59b3e390.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:303:8f::13) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db8849f-6da1-43d0-7efa-08dd1bc1e103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xqmAIGw8qpyrZEVjZ78UTygEckmgzp7RQAi+c1VvbIa/0pCaAbB/26UtKt?=
 =?iso-8859-1?Q?5LANPg/Zs+1iGHKslpCbmjyd/KmcvuPcqUmjE4gfQ+XwV3/HlsVXuB3Jht?=
 =?iso-8859-1?Q?v46LNGRsWFqp+hah+HtgG4vtpjSG44jWx30xpZUc9wWu2Zk5IFrPT8VTJF?=
 =?iso-8859-1?Q?SRFUXpVM1/878MkASwClrucFNg+/hfcwHSpLWfaOqeDtijXd0sJp4rijiU?=
 =?iso-8859-1?Q?n8wTSla8ksWz1+kZg7xK7zQD/anNubHpYegPwa1dDFH4RdaC2JdnyrTwMi?=
 =?iso-8859-1?Q?NcVJcwsE5oQb6C0mJIez5U/KxMXnGbv5c/becXjc1oYUTvoxDi/sStglnX?=
 =?iso-8859-1?Q?GqYMA56wNxmW+1kFg28RXa3oEZ6fbfJnbtfabLAtEwMW0FyFwVor8K93jS?=
 =?iso-8859-1?Q?sp/w/ZGjSTp51qsNGog8pIKRL8SIijnQyt91TKYWkbTXiAsmiznRzpabjl?=
 =?iso-8859-1?Q?JepicAtqbY/OUBVGae5xjrHP64IJ8YGyOhqm4SYr950R7fQ8Tvs8Jnuyhb?=
 =?iso-8859-1?Q?Xem9o7HvdIxlIj46xF5R+yJCQF1yMTxJuExe0+O9khW7Eh79mfzFnFeUn/?=
 =?iso-8859-1?Q?sIqr2RDocLEa8+cWgQfipBvTktEoqT3GoUKASiqi/50QMKvRC786xJwzkr?=
 =?iso-8859-1?Q?zaartbCXhJ7/l/QlheFKfiyuKHj4S2Omh9S7HK14gGNC/VbdLaqGoDrBge?=
 =?iso-8859-1?Q?L6DWaoN0hcUmtUCK/STpGWGFNY2upBxydlyYBCRqHJ3Z9syM8kXLq2iwTk?=
 =?iso-8859-1?Q?JmYE0MF1O/JVYQtOJ/G0iyDFk/xuUzBJfwn3YziIa5ssmO+qNjH0m23RhO?=
 =?iso-8859-1?Q?Ok6sIfQDy2aMHgjq6vCny3bjwoy4ya7ihPraBa35epckTrb1H4VY82wfsX?=
 =?iso-8859-1?Q?gk7ojKut2IyhiibQ5RmNaooJr7unUdyPxXwhm+NTHgFdLak7eK1bUFbmT1?=
 =?iso-8859-1?Q?0xZ75czDmYyqrj2fbSCvgV8qEFrCYyXr5wRigCpImn+gj2gPEqs+rmlMaz?=
 =?iso-8859-1?Q?bFQ0J/hIfp3K2Wdgz5mT8O4lvxoCaLokGkTKtlK0BgasjUAjMJKSsY87SQ?=
 =?iso-8859-1?Q?0HOQgIoR+dOVM3nHEDvTr9fChpaeQRbco6AT84QicN6wlyc2IYNKXbulq5?=
 =?iso-8859-1?Q?YYDf028FaVpA9R2DNyj1cFo/jbXymED2L2SK2nm1zG0nkwyZ6/zIXA11oA?=
 =?iso-8859-1?Q?G1sY7/C9N3uJBF3XbXSOnI5pBqdbtMIZ4b5ZYfnNGtLFQFmKXTSiGAbXks?=
 =?iso-8859-1?Q?CdaIbHoRW74KaqDRHM4dkqwqwD2YF70zWE6bmHutWqcfWS9iyv1VR5h6r8?=
 =?iso-8859-1?Q?G6AnaNmIPLe9aAUf30d9NNZrVUPJI854tMfyz7CBnejHu6v7uMq7dRSD09?=
 =?iso-8859-1?Q?Q8rFyIPcnOi45BpUbAGPENFuSNU9RHMzsd3RnsoHvvsxHwtTRyZANzWMy3?=
 =?iso-8859-1?Q?CydaKKivKVFVsRJ7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hkH7UrlvizvMxXWClrtT2CYMG/V4ZDpzjLWMyXfMtEK0/bFUVBrsfYU2hr?=
 =?iso-8859-1?Q?vqj6fgJVTTA3c7IupCOcvgjplPdTYQk7MG/XoNMqsmzKr1MRYO7D/ONe1E?=
 =?iso-8859-1?Q?BDCeeMuA8/RD9zy9TBVgUBj16SuYvlwOo93f5txT8ZaCj1F4vj77HmOlrn?=
 =?iso-8859-1?Q?Y5uXRlpttlCooTxmzegE1q8b1zE1xsutOyRDf9hgUhqQVYMmXsADzPT+io?=
 =?iso-8859-1?Q?XpOwCocIiXiYXdFVF8jEWaQg/7uh80DImkUUKfG4ljgQCOBvLjpDRLRnUe?=
 =?iso-8859-1?Q?oSI/aEiNU88fEAdNhuGDQpZ9mp5krZDVBwD+0LFBdrxyNdaWPwpiSFlJo5?=
 =?iso-8859-1?Q?c0gzZHOlP+Z5x/PBBYKCld9b73KqHttSrJoN+ZO53kN2r86XDLmlbOlCvI?=
 =?iso-8859-1?Q?DHjsOl1934tJ++eSCGsAeVPnc0WZJX16o6xX83XNwO3OAuq9AC1QNb55Dt?=
 =?iso-8859-1?Q?I1ZgVjX3w6SPusfqgSHYeVhxIr2Xr+YEfxak+EEPjFwOio2wh1jpwZuxK0?=
 =?iso-8859-1?Q?2NbVLWp1hfCTmUXX35yV0shiCoV9YQLhT3kcaE2Za1myrzedXuj9kn763p?=
 =?iso-8859-1?Q?Tc2aFat7S5xUEZDaj6dCJf4CYZ6y90swJiXrxSzfgN0dmy60msU5eXrf9R?=
 =?iso-8859-1?Q?bGiGUZmmi6r/371SXyoygugD+t8GDF/eibZ5FRty67bvtcbXt6Wqm/dQZz?=
 =?iso-8859-1?Q?fNcVvaZTSDcYh7+p1pOX/mAAHz7s6V+yipOYT2m3IP2xtsY1QnEbSM/M10?=
 =?iso-8859-1?Q?J1W89FBwx1jZsLMJ4IUoqu5aZjdBTUanq5kYHm2yWGA809BB2CWsn/ljdT?=
 =?iso-8859-1?Q?l6s2WFNgPWDnZ4NVmrmwB6VS9iD19OO3y7jNun39wzQ+J5cfFKe0uocsjE?=
 =?iso-8859-1?Q?ANrGDkFCCCLAWUqYHjIL5+PvHHDHzE0OZ4rvSAGM5dYk9UjunQfz4ow41L?=
 =?iso-8859-1?Q?C9SeEt1AWloFgh6mOa4ydiQiK10C0kHINJ/ucHcnNt4FFzUnHbICJdTP4U?=
 =?iso-8859-1?Q?wNZhPosJ07PjFxlPphBaaBv3vW4/Y3HSLfKlQ5wUFHtv61iWEqZV7ETcEH?=
 =?iso-8859-1?Q?yJ8sw4BHZEe9Ua1a17qsN+Y3zMUtL5QCcVZNkcCYUrqu6Bq9TR5q9Z5zto?=
 =?iso-8859-1?Q?yWc4KlvAxygeNLF+rVZulhc5vMppqgoc4+vcPGMaC7UDi5WsJZpYzQRtVk?=
 =?iso-8859-1?Q?lyKaCY6IWChPvJeHixLDstm38fCIx1aoHIYnKES4gO5uX/2vd7HEQCy9wp?=
 =?iso-8859-1?Q?T2B9uEEKgxXkz+t7ONkn/Lb7JW8KTGRNy0T8cmPQhpp/1N2B8UamUGjOrn?=
 =?iso-8859-1?Q?mq8H9TESaTQ7XG481ljwEXZMT0B43DqXtw70C1S21VwVGTFBkp4A7tzf0o?=
 =?iso-8859-1?Q?1GO/Qm37W8g/6NzKSHLhgNAotutcQIeSXbL3F/zjege/OR7C+5NawuQsct?=
 =?iso-8859-1?Q?uLFKv5z9ajPX6AY7ykTNH7N7TIcn6L+kcgz8e86k692EJuXsviKaJV7WNJ?=
 =?iso-8859-1?Q?/X3HqxQNoMHsGW3klUFeiGOv2l2K6pYzZ5dkkqJ3tR2RywUBgdezG66iBW?=
 =?iso-8859-1?Q?1ZDQN4/e7XFYqCAxOPdTAJYH2P5wYFTbpj5bn3opvgUHjGDFVU6E2q8fDA?=
 =?iso-8859-1?Q?uYKajKOF9p14RIYOfnY+BO2mLwwp2IIPnWvBQctytNdMAdxbtES/buZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db8849f-6da1-43d0-7efa-08dd1bc1e103
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 22:02:48.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: galEVpJhSDL76HarUNpp+ePI/jAdR2oTpukJku/BdDuPmJPq+XDmDA19DmDzV30YVRTBmYOgppMgbXDU6QQIGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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

On Fri, Dec 13, 2024 at 07:26:57PM +0000, Souza, Jose wrote:
> On Fri, 2024-12-13 at 09:28 -0800, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > There is a mesa debug tool for decoding devcoredump files. Recent
> > changes to improve the devcoredump output broke that tool. So revert
> > the changes until the tool can be extended to support the new fields.
> 
> Mesa parser if fixed with this patch, thank you.
> 
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>

pushed to drm-xe-next

> 
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > Fixes: c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info")
> > Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 71636e80b71d..6980304c8903 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -119,7 +119,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> >  	drm_puts(&p, "\n**** GuC CT ****\n");
> >  	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> >  
> > -	drm_puts(&p, "\n**** Contexts ****\n");
> > +	/*
> > +	 * Don't add a new section header here because the mesa debug decoder
> > +	 * tool expects the context information to be in the 'GuC CT' section.
> > +	 */
> > +	/* drm_puts(&p, "\n**** Contexts ****\n"); */
> >  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> >  
> >  	drm_puts(&p, "\n**** Job ****\n");
> > @@ -416,6 +420,15 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
> >  	char buff[ASCII85_BUFSZ], *line_buff;
> >  	size_t line_pos = 0;
> >  
> > +	/*
> > +	 * Splitting blobs across multiple lines is not compatible with the mesa
> > +	 * debug decoder tool. Note that even dropping the explicit '\n' below
> > +	 * doesn't help because the GuC log is so big some underlying implementation
> > +	 * still splits the lines at 512K characters. So just bail completely for
> > +	 * the moment.
> > +	 */
> > +	return;
> > +
> >  #define DMESG_MAX_LINE_LEN	800
> >  #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
> >  
> 
