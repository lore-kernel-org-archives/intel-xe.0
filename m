Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF83C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 17:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B4E10E6F2;
	Tue, 16 Jul 2024 17:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaN3a+7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5C810E6F2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721149930; x=1752685930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8XA/Fj9HG2qfb0E5JKTfbfIl1lUEnubhepBfLhVRIKA=;
 b=PaN3a+7fzb6AYbIb0mFF25msW/Ii63ftrcCccvelp4tySyz1A2QE40cg
 n1F90PZqR0Z755MvLhaSFM+tH7cRbVH6zcDLOR/ZwAFMMKrscX39O/3W8
 9Bpd7u3EXP9SecxJX9CETzi2W5CBd+qPTRVA3VVby+vJCW95Dq4a0XhmZ
 5SK9OjqMlLbiXxVHrxbFQ+lFecAt0XNRG7et+vnC9mofaet3VSjOiVzqS
 WtZEgZGtJq05ffSCIMGqYxlNZK1lPQKbjJEL/39ql1NTWDBm3jJbCX72I
 mvqRZfUxHU+rdZ+Tx1LrmCT1DtqKRJsgQRkqYg7ojyl1KtTr9jNsrZPat g==;
X-CSE-ConnectionGUID: FODf5w3WRPi3jd9Qg/6S4Q==
X-CSE-MsgGUID: M212BJpfTd2SXCJM7woKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18804405"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18804405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 10:12:10 -0700
X-CSE-ConnectionGUID: 5rmM034MQgOcuKej0mXCdA==
X-CSE-MsgGUID: mrr8P2VrT1CLAPJQEBlUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="80747698"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 10:12:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:12:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 10:12:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 10:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E13hu1VSyCVE1hBTQkkc8RXyMQHtqO9wisyV00z4nvmbItEvKWU5UQUlm0OTJNvYya8sF8Wopm76Wz1qxbUPAB7pKmK9yK1ALaO6rDw2RZAYOuRFy9cOsadL9DEO5GcNbsQMrLOWNs16HaftriEfsRLQJwp+UmPer5ZixFmU+5x5FKuqPyRWAJfARExxbex6P/sXMBIsTb45UVFd2X5W6WMxbG4MD0P9/9pb3Ksezm0BhLOGf4wprp65B7x4FJQLgYQ17Al0HIQhHZ2W8+omwnv+Jo8YYvXfrjVhzfE/W93RUJwdDErtM5nS8rwnvZChhYYPFGUaWXR7y9CT2pbkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qELZRc99zBqm3MwNIaCTB/55oIo1IgelHiDluJBQ3E0=;
 b=PkbfJabpwQi+xpbUmcKeEQYpGZr4WT7ODAwjwB/TR56fhF6Iu/k+aektJnHZHoTBE16pe0eqYcHqCdXsTcI88QbAIjDUzLEF1V6kbqtaYRBanhA7THxCK/JoR1cRU/aC0kVUc1iPw8jVXbxadsvr0jHhD4ixJci3+l2V0pTLTnKp6NVqDrgo7uudLn0u+ohB6AP6AI+TWKcNxkACq1HucuLOto2VEhM7T9JJOlyzL6361BRaZbaokopd9Jm4VPq10q+WSfNnJ7AjOhKOZoIZ9uvHFegWDuTh9R3r9RSTTBHCNu0VvYhsfD9WA726YIoMcUqXQbP5qoNPYYULZRb97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 17:12:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 17:12:07 +0000
Date: Tue, 16 Jul 2024 17:11:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <ZpapuLDhpys6Wrd9@DUT025-TGLU.fm.intel.com>
References: <cover.1720718987.git.stuart.summers@intel.com>
 <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
 <ZpAlNwh6Ylyy1GFf@DUT025-TGLU.fm.intel.com>
 <211a86378b581a013c2dd71acd123f833ad7b616.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <211a86378b581a013c2dd71acd123f833ad7b616.camel@intel.com>
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee6e3b8-1ca7-4355-8ce3-08dca5ba6b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Bp3NRdf63oVwSo9NsHZdVV7sfx8iSVKsoLpQZBWvFWGnrbU0ifIQhKGXXt?=
 =?iso-8859-1?Q?uSvTFS0frlbQ1p5P/ALjnLfrECAhfamRykHR91wrNxmJZzN5+LjMtGnGZP?=
 =?iso-8859-1?Q?9vOhindsmucwP7b5FGcEnGD2nXSuGSxdiKs37WrpUkdtuKOigkllvc+f9I?=
 =?iso-8859-1?Q?no/C4qCQJmewDrpMVIUM4hIjSscE7zz0nz4pKIsiVLfOfuBhnbBKUyGpMZ?=
 =?iso-8859-1?Q?2Fnu6nsV2ddDmKdRxF4s1dSYiu/UZAhG5OA6W5/rNs78z2jPu+6m59O4ja?=
 =?iso-8859-1?Q?gdky5URzTiLnztvikbPdhvKTLkSXfHE52w+CTwStncPtO4n6ypM5q2YkmX?=
 =?iso-8859-1?Q?XWN3JSne8bVTVkfkDkHIlz+MnEb4uNnprs5xejj97too3NmfZy3PIZqEpw?=
 =?iso-8859-1?Q?JGo6HCtmj1O85Y3sdeJnwXN47BdmWpAsDP6RbMQuXGfXVGmcoglM3b/rrb?=
 =?iso-8859-1?Q?EFKkwUh6/YhL82RmOC0bBht3tm5qBQHB/+Xqk1pRSI9lbQafhSFb2coDxw?=
 =?iso-8859-1?Q?/Ux7VFSLkHnDuRSv+Y2xBoDiv/TKnZgx838s+/VG9nZ8/Xl7MqmCkZ5dOC?=
 =?iso-8859-1?Q?UqJrrfgcOCFlyqXhnmblxWovnYz0HebbFzLZPikt2dp5aOY8aQw8YYYgx4?=
 =?iso-8859-1?Q?ldwnN79eZ0fCmGjouFC38qky3DyTlDeiW5aLJl5AzTzm7RB9abVJ7jD6Io?=
 =?iso-8859-1?Q?ntccAG0a4ouK3VzBaT/JHaPn2X0kZSMzGf53SE8ceTJtRmxchnEkNArJVt?=
 =?iso-8859-1?Q?UbazZu+V0gtckQq1zCKW+vd57a60+eIb4R/4E2NyJSYpx/dwcx9Vy0Rjcg?=
 =?iso-8859-1?Q?qwCYiMXMczs7mDDX50ghQ52JyA7ZP6KbVGp9miz+/UqpsbVw19Zsxk9o2a?=
 =?iso-8859-1?Q?e+laCFreddCWapMSqprqZQCcEepDnEC6t0GI+Mg37nb+zaDVmN3I2C+465?=
 =?iso-8859-1?Q?1/Cu93N7TPL+UJV70YJwrbm3k18ot3d/WY0CghNrHp6zeBqdh9NKkbyP20?=
 =?iso-8859-1?Q?VvH6mrKFp10c9nc0sOGfstbSUg6CJKgznncMRlJ5+ax9ohgcBzFOips1d/?=
 =?iso-8859-1?Q?B2hQyly1I/8NT2VY8zosq2pbEMyOhbl6ujZWRlAM8yQ+XZLvorg5J1+kMI?=
 =?iso-8859-1?Q?AgdaGZ9aZNGr/KCgocujnrI868i73t+BQcbMH32RSfMyxSKcAqoN2F0CWP?=
 =?iso-8859-1?Q?lkap6TUvL2osefadMc8IBuLk0L7VCWOTd3vL+GYy+aiP61Mqjbqfce+o6o?=
 =?iso-8859-1?Q?7DIySowdkAIqYmPlsTjzKZDbbRQKkXVJ3FFBOWAqVCYWI63AlQRj6AXnPn?=
 =?iso-8859-1?Q?i4zopeBbJgRyr7v61UuNevXcfMC0KFF6IdUdA/+nkRdumg1v1UXVHD9Jop?=
 =?iso-8859-1?Q?4US0d6u6LfuNG6bRu1edY40P5tozDkqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dP3sjwraBFuB9CuT6a+NTT9M/j50Xv0DjBfx3SRnXJ4H5ET1qVAgoeDCZk?=
 =?iso-8859-1?Q?h5n4NHEHhOIax2nRfDird+uVNUSc/qX5BoDpaVVHrJiTsnNQ+oNy0nRRPF?=
 =?iso-8859-1?Q?VdDOeAruwFEeeS36CMSa5zaskmMTP/h7oV89E1ZrFchdKwAjKjIZQKkKca?=
 =?iso-8859-1?Q?hFCEeYGRzSOiMbt/gCx+nOffWAb7LBKGcAgWojGs1T/J+h371WGxCiu055?=
 =?iso-8859-1?Q?ChuwyeZV09NzKlmXzUSHbOEgkKSMaRiLwYtLp8fc0mBzBGsQXpSbiNfKHH?=
 =?iso-8859-1?Q?xQl7o25d+k0Hn0s5tTgH/ttCTFCcWgPk/CpA6x+EEFFgUEpK+b73WPVr6v?=
 =?iso-8859-1?Q?gnybQhlSkZ/lxIIjNKZ/QGXIvmpi0Qtu0MVFPovu5+1NIm1hrBFLg9fivY?=
 =?iso-8859-1?Q?oFo1cIO7UIfe2whAHlQAwbWTUsMoVgz4u0qt85lRQ3WS282ELcITWFYVfn?=
 =?iso-8859-1?Q?jugMuXMpDroau5ZdLkatPOElUm05cjFtd2BHKsNtht5onZkQGolAke1+PC?=
 =?iso-8859-1?Q?bbaG6mlU5YFk6tRNSLfpguUw4kIZ4JdpTHnV5ACrFnxqg4v4IdZs8s3l9B?=
 =?iso-8859-1?Q?hoScXhWGimVov7kahb3nwJhu6+M4k98hK/mFPz6d4PhG1XNMSzkXRbIg66?=
 =?iso-8859-1?Q?XGJkdqFj4w+/FsKuJsakkWAi7EoBF2WS86BJY+trb+BwVFAWA+eXiBh10b?=
 =?iso-8859-1?Q?QpYxY+FjdvdZXXiCD3P0ZZTdbzIFG8bQrpyE8xkbnkqLOifOe5JAbdIa5I?=
 =?iso-8859-1?Q?i6lngH07gc2J4Yo8I6BtyIcELBsM5smhlPzBExGcDnWt43Ejm/4Y5ZJNXC?=
 =?iso-8859-1?Q?ulMIWtFGI19/JTKGMabHo6m9gO6KbBWg6udpz9Ed/JLNF6qgShA2eBGrNK?=
 =?iso-8859-1?Q?kMRgx6pQf6lANCVTZGvfhkuXqGQfkXoZmAH0T4QjDv604V33LM2F/Kqp6F?=
 =?iso-8859-1?Q?Tf6RA47rvG9XbfRTxiZfK5x7xjX/mtXIcxS/zFSdHuMfE5J5Kit6zNFIcn?=
 =?iso-8859-1?Q?3Li9C+VbSddA3KkbK6oYQ0By1owJ5IPOMKieDzrOVseOLdqbuAtgPY4uwV?=
 =?iso-8859-1?Q?jWElSgeZs/HRqef/3RGO22BDiJY12G8h1XuSPhV0HgLlPXOlywtoaq2yAr?=
 =?iso-8859-1?Q?pPD8UMtQu5+2MM/TNSkq6fKUyz7fWTIQshw2iO+5oDzuuxhu5/ctNdXK+b?=
 =?iso-8859-1?Q?OHmVOAS4X+2wvSGDRguLMZkMQczeR+i7YhLfRjSdvvyJe18hpu1y7lifMx?=
 =?iso-8859-1?Q?iZUKwiWCyYYkxF7jzU9WY8wwlIsPPeF3ld0yA7bTTfWNCsLbyzOWfvz2XN?=
 =?iso-8859-1?Q?IAC1SUaA8EMExmBhpI1bBJaqhYS6FJe0us2gqMCZiX1vmgdnwt4wy1f6o5?=
 =?iso-8859-1?Q?Bq29ND+wyDM21T5RgvcybbnXB9ktq2BXgSTLg/eERQi6RgAdaTQvqxJDaf?=
 =?iso-8859-1?Q?MXlEgpOWnFPd2eg79r+FN01DLnM0QXMiMQfXDeE8XM4uzr95VDQofxuQJw?=
 =?iso-8859-1?Q?IIMOBYgczX6+/EP1t91U4EKs3+wl2mskvAMz+gp5jbatELBCeEzVZEnpLN?=
 =?iso-8859-1?Q?XO5hcdfDEHXGMKgeekFmZ5UWDlngOzoqgb5rnhQl6FIR5ZnZU8RlSS75eh?=
 =?iso-8859-1?Q?yZAgYtseNXnOEFdjsgX7Pix0ON1VP0X9oEttPX+WEnlQul6kpqbl1syg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee6e3b8-1ca7-4355-8ce3-08dca5ba6b9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 17:12:06.9743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEuB2ypkv1hogFzlfhRsODXWJKR3v6Z7bvygNPpFAoidiKAskwESOV7l84J2Vnf71iHR9heMHbDtRi/BxRCxnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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

On Thu, Jul 11, 2024 at 01:36:12PM -0600, Summers, Stuart wrote:
> On Thu, 2024-07-11 at 18:32 +0000, Matthew Brost wrote:
> > On Thu, Jul 11, 2024 at 05:36:29PM +0000, Stuart Summers wrote:
> > > Currently the page fault queue size is hard coded. However
> > > the hardware supports faulting for each EU and each CS.
> > > For some applications running on hardware with a large
> > > number of EUs and CSs, this can result in an overflow of
> > > the page fault queue.
> > > 
> > > Add a small calculation to determine the page fault queue
> > > size based on the number of EUs and CSs in the platform as
> > > detmined by fuses.
> > > 
> > 
> > Missing is the G2H queue size update. Adding this patch by itself
> > kinda
> > makes this problem worse as if the G2H queue is overflowed by page
> > faults it is basically a slient bug unless we look at the GuC log.
> > That
> > itself really is bug GuC in the GuC interface which should fixed
> > (e.g.
> > the G2H queue should always reserve the 1 slot to communicate a G2H
> > overflow message). Anyways, to stay on topic can you include an
> > update
> > to G2H as part of this series?
> 
> Hey Matt,
> 
> I had replied to the last series, sorry for the confusion!
> 
> I'm not convinced we need to update the g2h. The main reason we have
> all of these simultaneous queues on the page fault side is each of them
> can be copying data around in a worker thread while the other queues
> are in use. The g2h should just receive and copy to this queue and be
> re-used, right?
> 
> Or are you thinking we'll hit a scenario where GuC writes all page
> faults to the ctb at once and we overflow? But in that case what really

Yes, I want to avoid overflowing the ctb.

> is the right calculation? Is it possible that an application could
> simultaneously access N number of bad memory addresses resulting in N
> number (where N is greater than the g2h size) of cat faults?
> 
> To me this really should be more specification defined where we know
> the maximum number of writes GuC can perform to the g2h before it is
> read and recycled by the KMD.

You are right, the interface as defined is a bit unsafe. They are
working to fix this (been at least a few years now since this issue was
identified) but in the meantime we just need to size G2H to avoid
overflows. Maybe it is just easiest to statically increase the G2H
buffer for now (i.e. make it like 64k, 128k or something) instead adding
a calculation there.

Matt 

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++---
> > > ----
> > >  drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
> > >  2 files changed, 49 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index b2a7fa55bd18..6bfc60c0274a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue
> > > *pf_queue, struct pagefault *pf)
> > >                         PFD_VIRTUAL_ADDR_LO_SHIFT;
> > >  
> > >                 pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> > > -                       PF_QUEUE_NUM_DW;
> > > +                       pf_queue->pf_queue_num_dw;
> > >                 ret = true;
> > >         }
> > >         spin_unlock_irq(&pf_queue->lock);
> > > @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue
> > > *pf_queue)
> > >  {
> > >         lockdep_assert_held(&pf_queue->lock);
> > >  
> > > -       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> > > PF_QUEUE_NUM_DW) <=
> > > +       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> > > +                         pf_queue->pf_queue_num_dw) <=
> > >                 PF_MSG_LEN_DW;
> > >  }
> > >  
> > > @@ -312,22 +313,23 @@ int xe_guc_pagefault_handler(struct xe_guc
> > > *guc, u32 *msg, u32 len)
> > >         u32 asid;
> > >         bool full;
> > >  
> > > -       /*
> > > -        * The below logic doesn't work unless PF_QUEUE_NUM_DW %
> > > PF_MSG_LEN_DW == 0
> > > -        */
> > > -       BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> > > -
> > >         if (unlikely(len != PF_MSG_LEN_DW))
> > >                 return -EPROTO;
> > >  
> > >         asid = FIELD_GET(PFD_ASID, msg[1]);
> > >         pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
> > >  
> > > +       /*
> > > +        * The below logic doesn't work unless PF_QUEUE_NUM_DW %
> > > PF_MSG_LEN_DW == 0
> > > +        */
> > > +       xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw %
> > > PF_MSG_LEN_DW));
> > > +
> > >         spin_lock_irqsave(&pf_queue->lock, flags);
> > >         full = pf_queue_full(pf_queue);
> > >         if (!full) {
> > >                 memcpy(pf_queue->data + pf_queue->head, msg, len *
> > > sizeof(u32));
> > > -               pf_queue->head = (pf_queue->head + len) %
> > > PF_QUEUE_NUM_DW;
> > > +               pf_queue->head = (pf_queue->head + len) %
> > > +                       pf_queue->pf_queue_num_dw;
> > >                 queue_work(gt->usm.pf_wq, &pf_queue->worker);
> > >         } else {
> > >                 drm_warn(&xe->drm, "PF Queue full, shouldn't be
> > > possible");
> > > @@ -386,26 +388,54 @@ static void pagefault_fini(void *arg)
> > >  {
> > >         struct xe_gt *gt = arg;
> > >         struct xe_device *xe = gt_to_xe(gt);
> > > +       int i;
> > >  
> > >         if (!xe->info.has_usm)
> > >                 return;
> > >  
> > >         destroy_workqueue(gt->usm.acc_wq);
> > >         destroy_workqueue(gt->usm.pf_wq);
> > > +
> > > +       for (i = 0; i < NUM_PF_QUEUE; ++i)
> > > +               kfree(gt->usm.pf_queue[i].data);
> > > +}
> > > +
> > > +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > > *pf_queue)
> > > +{
> > > +       xe_dss_mask_t all_dss;
> > > +       int num_dss, num_eus;
> > > +
> > > +       bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt-
> > > >fuse_topo.c_dss_mask,
> > > +                 XE_MAX_DSS_FUSE_BITS);
> > > +
> > > +       num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> > > +       num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> > > +                               XE_MAX_EU_FUSE_BITS) * num_dss;
> > > +
> > > +       /* user can issue separate page faults per EU and per CS */
> > > +       pf_queue->pf_queue_num_dw =
> > > +               (num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
> > > +
> > > +       pf_queue->gt = gt;
> > > +       pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw,
> > > GFP_KERNEL);
> > > +       spin_lock_init(&pf_queue->lock);
> > > +       INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> > > +
> > > +       return 0;
> > >  }
> > >  
> > >  int xe_gt_pagefault_init(struct xe_gt *gt)
> > >  {
> > >         struct xe_device *xe = gt_to_xe(gt);
> > > -       int i;
> > > +       int i, ret = 0;
> > >  
> > >         if (!xe->info.has_usm)
> > >                 return 0;
> > >  
> > >         for (i = 0; i < NUM_PF_QUEUE; ++i) {
> > > -               gt->usm.pf_queue[i].gt = gt;
> > > -               spin_lock_init(&gt->usm.pf_queue[i].lock);
> > > -               INIT_WORK(&gt->usm.pf_queue[i].worker,
> > > pf_queue_work_func);
> > > +               ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> > > +               if (ret)
> > > +                       return ret;
> > >         }
> > >         for (i = 0; i < NUM_ACC_QUEUE; ++i) {
> > >                 gt->usm.acc_queue[i].gt = gt;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 38a0d0e178c8..263a604b76b7 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -233,9 +233,14 @@ struct xe_gt {
> > >                 struct pf_queue {
> > >                         /** @usm.pf_queue.gt: back pointer to GT */
> > >                         struct xe_gt *gt;
> > > -#define PF_QUEUE_NUM_DW        128
> > >                         /** @usm.pf_queue.data: data in the page
> > > fault queue */
> > > -                       u32 data[PF_QUEUE_NUM_DW];
> > > +                       u32 *data;
> > > +                       /**
> > > +                        * @usm.pf_queue_num_dw: number of DWORDS
> > > in the page
> > > +                        * fault queue. Dynamically calculated
> > > based on the number
> > > +                        * of compute resources available.
> > > +                        */
> > > +                       u32 pf_queue_num_dw;
> > >                         /**
> > >                          * @usm.pf_queue.tail: tail pointer in DWs
> > > for page fault queue,
> > >                          * moved by worker which processes faults
> > > (consumer).
> > > -- 
> > > 2.34.1
> > > 
> 
