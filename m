Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1113C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8106C10E4CC;
	Mon, 17 Jun 2024 19:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuBM047Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0138110E4CC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652980; x=1750188980;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b+NSUut/y2m2hGkU6dCNE0phJZ6WWZ5xA/F27uJMryA=;
 b=iuBM047Y1nrD/gVV9/9odJ0QeFDT7xPJUnTCDJ8yjkrPDVUrJoB/0+Hn
 jJAw3TnHVWnWQDAZqFEgq4xwKswMH54iCtzPmYACkUmwiK5D+A7uppxVE
 /fOERXEr4zeasXfUIIXLyH3gRTXeAJYlGOF79XWPnbOfaJflMbTOXvnw+
 jfgcUmAzFjmWK8lcAKW3YJFtBiUYYMb1Ryqc3Q04Ecux4Y6ul5JHRaR8w
 bAiG+C+bksx9hH2a1L0pLXicLtyzE0+7p3hhYI3tzXSIvgfdhaMVyc0jw
 20ss/dM1lJa5CneI7phnhLpVKS/hfuxhn3+6XUJ2CTGxooQvaNewPO4IR Q==;
X-CSE-ConnectionGUID: u41gx8GeQLWgHY1uUToteA==
X-CSE-MsgGUID: LWV8Oy+ASN+cRgd3Zj3OyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15368313"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15368313"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:36:19 -0700
X-CSE-ConnectionGUID: tgpoGMjtRr2rn+9RgSPNag==
X-CSE-MsgGUID: Hv10dsnNREeg5RPoaQYlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41982737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:36:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:36:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:36:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:36:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx/9x5TR72QMZlP+TE5l6ej+d5V3P3K1CQ/jzUIlrueScUA8Km2bvou/wd9a8QbVScUfUkHOs4Ibbsgga6TQNfyBY0y9AnRaJbH7RiOFT122XjiMpdhHj1SAuxNr8irRoPotKGXkIIELI9/u/wq+B5WyUdRQ5t0/9ip+vWaUexYEOGYDeDgBqlK9tDI8+W1i995BQyBozlgRcxhVxeGU0jcBQD24dvpfEe6wzsD7svkqxALf3LxS9EcX2NeFYxuPbnzOd20VdjBganaFkgjD0UQVRdT4JavIdFeWRo182G7kI57KF7/8u9Y/VqKt8Phi1akfCflKyXIOHdTsfZSvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r43tza61R4SR2sNjiVwGYMR5jmAo/PsiShMVrUUHEO4=;
 b=VjxMXa21njmXk9DXrWfZ7Fs2FjQvOzDdcDKwvAvKhxtGpFE7t47nn+vfY9fRKyt6Z4gbuRGcopcAL7wZAs7IX7HlqMqbHP3sRzljm1frZOPc+7gMiXlNLDuNEvLKU7PWEE3H0Uhzny4iSQazUzYTq4eWDq8POjV9BwKIG6YYEX8N7B831Lh0tvTrNF9HJOJert2/+p/9gI3sERkBsJci61ZgdvChwC0gW12CFkEzGLKrBua7ww2o3znL2T7TlRNrV6n5Rb6YeGf9KZwrghBVJCITJGSpCV7vDVkHAoTWxdrqoxhpDW5jdHohZwNoLebWlDo9TZSkTzjPHzaDi6Pmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 19:36:16 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:36:15 +0000
Date: Mon, 17 Jun 2024 15:36:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v15 00/17] Add OA functionality to Xe
Message-ID: <ZnCQK5ZFiTlj6CRv@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <6bee6a666dd0ab8440ca74d692a80788bfb1d748.camel@intel.com>
 <85v82ldew2.wl-ashutosh.dixit@intel.com>
 <8734pp94hx.wl-ashutosh.dixit@intel.com>
 <85sexfd0cy.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85sexfd0cy.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d20cc69-e05c-44e1-8f76-08dc8f04c0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TLmsbIow9LDBr04u6LvUC5tfr/eIFuQdTF+86Y+uv68PQozrlp9j1FabMd?=
 =?iso-8859-1?Q?sBG8fDpLIN1sbZNUHPmVQ4c6hLr65RScoY/xQELJKq/PJDP4KkNQcLCZ6S?=
 =?iso-8859-1?Q?YiE0laeHi4u6opgY3x0Mq9ZBzrfOJbocHK39ZTU/AR056SKz2tqzYOnGlI?=
 =?iso-8859-1?Q?5HRBPVd0AszPzbO5xouBmtla503WH/qJnDoLI8v51+LGhidLrq4nXzZ9Bz?=
 =?iso-8859-1?Q?Mo5P2zOictDPvBEYhDZNOaXPlr1NrXYqSFzqktow1r5/F1qOjX7rFKuZJs?=
 =?iso-8859-1?Q?FI57dwCArJvHFvtgmU6mUqk1zIvOH6wR8SVuLqM5Kc2zR5tN+Rl4kBqFhV?=
 =?iso-8859-1?Q?tDjS16wYj/+fmZnNwKOmlqn5ZX8CF4dje+rCeAEVCPPcrfdtpl2SD2vo8o?=
 =?iso-8859-1?Q?G/5y7bMluzEiFXeFYOo8NuaBgzGjbkzdvfb8vy+TLDqarKQ/sKddv+mIFd?=
 =?iso-8859-1?Q?JkV1C0TrTBL0kF2VOwS7PmbP1t1s3lt2YSK7xDuzalLwnQbuzxPZkhhAyg?=
 =?iso-8859-1?Q?N4hm+oQIJ6hg3thMjeJ4etr/wc8xrdet8JC4UIUJoaGKZ//qzS/+CgzvzU?=
 =?iso-8859-1?Q?zgnA3vCB4voFfQI3bcBlIngthF+cMlj0FSDUfFAGYc2NGgHLftgoR83hLC?=
 =?iso-8859-1?Q?aj10boQiZcMLvTcb5Z+3Tp1D99/4Tw/0q4khGlBNE3WPW3W4dglj4GBtU2?=
 =?iso-8859-1?Q?/RU6WuAUelz4DamfiIlaxy94fsKI7Ixq0w8w+YbJlfFal0DAU1B4ixB0iV?=
 =?iso-8859-1?Q?U55GQiN8JlVRZNFJUFKdNqWrCCwi0AOKT5+Dz/+HpFwDrRIQ8X82aicZc2?=
 =?iso-8859-1?Q?gkyiOsyab6eqKYzgC9gKnaxzoSY4oIVF1kqj6YT70xyLPpa4CfcT7hOOZN?=
 =?iso-8859-1?Q?WPt68C71ADsq5Y42K2/Fn2ILeu4UvtQrM4pyS0qccZHiFpuryFn0JdEPoA?=
 =?iso-8859-1?Q?jytBqTPXS+ZpMAuf834qJTs/NVQRa4LUAl8SN1yoEloOb7K6yMiLZzQTJv?=
 =?iso-8859-1?Q?mSlyUvLCwfjjKoDbs2Zx2soaDPPewPh3coDSiAa5z2GpD3IooDYwQ5jqp+?=
 =?iso-8859-1?Q?2nOm7AApuqSFG/cRDVUDfeWUWdlFS07GVOnctB45MSBpQu7OGqI4ZVtF3I?=
 =?iso-8859-1?Q?TVwZ5HPfXUgDWzihMgpk9L2N5nXnFt209KRDp+F6xbct4RfsFH4A4DpdoH?=
 =?iso-8859-1?Q?rxjo4JHxWLkkqBSVl+kBY1xALaYQpf8WDSytBeCOczf5MQPhNa4BLP4MIj?=
 =?iso-8859-1?Q?S1eO6eFznAeDSUS+F/1aUfl67aAwgLqyXu+sJjW2xn710LyRYvNjGOGYOr?=
 =?iso-8859-1?Q?GshHYBRegVH3TmS0ZcseXqlJRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k5o3Ob+tW9K1pSfDd8ciB1XzI9IzCgioDHlQ7rBcKPcPMjICycFvkrVLs7?=
 =?iso-8859-1?Q?BfjXjaaPjHSQgKwNuFC6LdyFsnZSmtaf8QujC/W2As1vPemU7osdQrJCUl?=
 =?iso-8859-1?Q?NVi2JnxWlSvDkdxb9FPJ6QUiFsl7Jj7/QXU1SpOCEfagKD3SuPYSMpZeB8?=
 =?iso-8859-1?Q?qOiNsW5rUhDYdUIXLz81Hm4q7rUmWB8BpYU5tpGX6Lwh19h0zn3+NJXQ0j?=
 =?iso-8859-1?Q?UFO05oSIiPU9Kf3iIjhoY7Zd0RaYYjHPBgIRL1Jwd8l51Z9Ak6+7wh5spr?=
 =?iso-8859-1?Q?6ysKppSwuH7FbtcwE6tuhSdPFzB4aCzXSpl1FEYMdggPM0wWLjI1fOX7Om?=
 =?iso-8859-1?Q?8gTPOicIQxUd61ST/X/dPb4RiD1IWCH4c1O94XCELGIg/wOQLq3//D+d6J?=
 =?iso-8859-1?Q?RjzpNKFOII/eQ5C+nV2YIzYw/0DXatxOPH5OXH6bew8v5X55hdwMRQUpvz?=
 =?iso-8859-1?Q?USkB0Bk+HrEr/qv/LH1RLYr9HPiGUc1S6wfl0j5S4bGe79EOTznfGJV/9m?=
 =?iso-8859-1?Q?4Ny0U8E29Nt7IN+njq/ZogUwP7Ov/ZEfOznSofuIB6HYV3H0zDPCdqqLtR?=
 =?iso-8859-1?Q?azZZmTNRJI8Ipb/R/ZYtsmL7dWQRMDoUpf7ddvhZ8uubkzX2+u/ivFCInu?=
 =?iso-8859-1?Q?+EkfCXBLly9RM8eOJb3MBrixDIL0YRsRz5SIn31fyNJ94G84ioF304PSbf?=
 =?iso-8859-1?Q?g6sLW5Bpip2NYOlzKNw+xYmoH/4hZv5K32gMv1TDwS7Qx24fZODIk6RxHH?=
 =?iso-8859-1?Q?ioU4KGQnMWrXT6y37NcI4GrFlsZoW7CCtXlmtakkReNrT8ViVMFE/yQhyd?=
 =?iso-8859-1?Q?sb3mhKO5Jc7oyzlVXPD4p1XFSV4IHphhh4ubBokHyEshZYdHWbzwK/QXBX?=
 =?iso-8859-1?Q?SpcUnwyO7gDDw1A3QZrQ+AO0Nb7vgFpnhBR1ev1JBgcv/1DFe2s7Bd3Q+a?=
 =?iso-8859-1?Q?JEF7aTIFF1gliWmBHSHmuUNBsevLOkTMBL6Fo9ONCUL3ng6MMB3CPGZWhM?=
 =?iso-8859-1?Q?52HRWAtbv+eZucgPybU7Zh8+MwXEtn8EzBkbWkzFULqsxkO/qpr71HHkQg?=
 =?iso-8859-1?Q?oMmuBuX5CouD94DVRbfE8sowcwz4Y6IZ1gT74/+Mi+qPLvm2CC/QWTDDri?=
 =?iso-8859-1?Q?1epx/sPHsPrmS4O/JnsS+A4cFAGANE3mbyG/yX9nL9ib5ikU550UXvo5aP?=
 =?iso-8859-1?Q?AhMemk6qno/FlHZKJTDkvE0kT5d0iifCLHPseMOk0sM8ZbFjH6kMGof/xY?=
 =?iso-8859-1?Q?hsZFcF1vGsydn4dD8V7Y1bCMbsBmraAEBkQ0SqBtbYfcLGcH476COsOpL7?=
 =?iso-8859-1?Q?ozUPK30mqVgpV7r3TVP6wsaXDken9rkBJncrzvSyujzIJqofdCyh5P7GMu?=
 =?iso-8859-1?Q?+r4dWCThLAb7y7kZ9OEBl5eLnEwl+2C+EEBdHTiyL8zEI50UyZ/K1vVhlb?=
 =?iso-8859-1?Q?6lQ/dKavgipjDq77tqihZPecxNRVyM4UK7gMxQZ/ZPWsclXuiEmE7okr6f?=
 =?iso-8859-1?Q?7Tareh177mK+pcUf9IT3ST0vvdYraF/OhcNl/LLLQjh/bT9JvX8bH2DgKE?=
 =?iso-8859-1?Q?LMztz1R8BCdqJut/uaSH6n/mhzmLEKhEvayCY7Q/wP4ltIwrXYQ60f3fbd?=
 =?iso-8859-1?Q?L0vcXsRnzy/yHMr8LtQcxkZwrPR3ZUEwHbDMzJ5J1fSoKKlgyOk9SKYw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d20cc69-e05c-44e1-8f76-08dc8f04c0cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:36:15.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo6vfkeZLrri4aGZ1evJr8wYNIV/2hSxMgiIegSrNd/NFwy8FKjbbuaAERw1BYI91X2BTeXm2wRZ+XR0uh6qhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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

On Fri, Jun 14, 2024 at 08:12:45AM -0700, Dixit, Ashutosh wrote:
> On Thu, 06 Jun 2024 13:54:18 -0700, Dixit, Ashutosh wrote:
> >
> > On Thu, 06 Jun 2024 12:56:13 -0700, Dixit, Ashutosh wrote:
> > >
> >
> > Hi Lucas / Rodrigo / Thomas,
> >
> > > On Wed, 05 Jun 2024 07:12:54 -0700, Souza, Jose wrote:
> > > >
> > >
> > > Hi Jose,
> > >
> > > > On Sun, 2024-05-26 at 18:43 -0700, Ashutosh Dixit wrote:
> > > > > Please see cover letter for v7 here:
> > > > > https://patchwork.freedesktop.org/series/121084/#rev7
> > > > >
> > > > > For changes in later versions see changelog below.
> > > > >
> > > > > This series is also available at:
> > > > >         https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
> > > > >
> > > > > The series has been tested against this IGT series:
> > > > >         https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
> > > > >	or,
> > > > >	https://patchwork.freedesktop.org/series/130033/
> > > > >
> > > > > Opensource consumers using uapi in this series:
> > > > >
> > > > > gpuvis:
> > > > >	https://github.com/mikesart/gpuvis/pull/86
> > > > >
> > > > > mesa:
> > > > >	https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312
> > > > >
> > > > > Test-with: 20240524031439.106332-1-ashutosh.dixit@intel.com
> > > > >
> > > >
> > > > As first round this uAPI looks good for Mesa usage, second round after
> > > > this ones is merged will add additional features and uAPIs need to
> > > > support all Mesa needs.
> > >
> > > Correct. Copy/paste from another email in this thread, this is what we are
> > > looking at for the second round:
> > >
> > > * hold preemption (needs some investigation as to feasibility)
> > > * xe_sync for OA stream configuration and reconfiguration
> > > * Equivalent of DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID. I am still trying
> > >   to figure out if this is really needed. See here:
> > >   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312#note_2429650
> > >   Since this seems to be using some MDAPI metrics in Mesa, I think it
> > >   should be ok to do this in the second round too.
> > >
> > > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > >
> > > Thanks very much for the Mesa ack. I will start asking the Xe maintainers
> > > if this (and gpuvis PR which is also merged) is sufficient to merge this
> > > series now.
> >
> > Mesa has now provided their ack for the Xe OA uapi. Also all Mesa Xe OA
> > patches now have R-b. The gpuvis PR mentioned above is also merged. The Xe
> > OA IGT series is also mentioned above.
> >
> > So at this point I want to check with you if these things are sufficient to
> > merge these Xe OA patches?
> 
> Gentle ping about this :) Can we try to get this into 6.11?

Sorry for taking so long to get to this one here.

Is the Mesa MR really ready to get merged right after we merge this kernel series?
Are all of the patches there really reviewed? I couldn't make a sense of the open
MR discussions and I noticed the MR is still marked as 'Draft:'.

But once we are sure that Mesa is ready and all Michal's concerns on the latest
version of the kernel series are solved, then we can definitely merge.

Deadline for 6.11 is Wednesday next week(Jun/26).

Thanks,
Rodrigo.

> 
> >
> > Thanks.
> > --
> > Ashutosh
> >
> > > > thank you
> > > >
> > > > > v2: Fix build
> > > > > v3: Rebase, due to s/xe_engine/xe_exec_queue/
> > > > > v4: Re-run for testing
> > > > > v5: Address review comments, new patches 11 through 17
> > > > > v6: New patches 18 through 21
> > > > > v7: Patches are completely redone and don't start with i915 version of the uapi
> > > > > v8: See https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1
> > > > > v9: See https://patchwork.freedesktop.org/patch/577441/?series=128993&rev=2
> > > > > v10: See https://patchwork.freedesktop.org/patch/577943/?series=128993&rev=3
> > > > > v11: See https://patchwork.freedesktop.org/patch/581239/?series=130705&rev=1
> > > > > v12: Add last two new patches to enable Xe2+ overrun mode
> > > > > v13: Update last two patches after code review completion
> > > > > v14: https://patchwork.freedesktop.org/patch/595447/?series=134028&rev=1
> > > > > v15: https://patchwork.freedesktop.org/patch/595549/?series=134056&rev=1
> > > > >
> > > > > Ashutosh Dixit (17):
> > > > >   drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream
> > > > >     types
> > > > >   drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
> > > > >   drm/xe/oa/uapi: Add OA data formats
> > > > >   drm/xe/oa/uapi: Initialize OA units
> > > > >   drm/xe/oa/uapi: Add/remove OA config perf ops
> > > > >   drm/xe/oa/uapi: Define and parse OA stream properties
> > > > >   drm/xe/oa: OA stream initialization (OAG)
> > > > >   drm/xe/oa/uapi: Expose OA stream fd
> > > > >   drm/xe/oa/uapi: Read file_operation
> > > > >   drm/xe/oa: Add OAR support
> > > > >   drm/xe/oa: Add OAC support
> > > > >   drm/xe/oa/uapi: Query OA unit properties
> > > > >   drm/xe/oa/uapi: OA buffer mmap
> > > > >   drm/xe/oa: Add MMIO trigger support
> > > > >   drm/xe/oa: Override GuC RC with OA on PVC
> > > > >   drm/xe/oa: Changes to OA_TAKEN
> > > > >   drm/xe/oa: Enable Xe2+ overrun mode
> > > > >
> > > > >  drivers/gpu/drm/xe/Makefile                   |    2 +
> > > > >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |    3 +
> > > > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    2 +
> > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
> > > > >  drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  103 +
> > > > >  drivers/gpu/drm/xe/xe_device.c                |   19 +-
> > > > >  drivers/gpu/drm/xe/xe_device_types.h          |    4 +
> > > > >  drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
> > > > >  drivers/gpu/drm/xe/xe_guc_pc.c                |   57 +
> > > > >  drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
> > > > >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
> > > > >  drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
> > > > >  drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
> > > > >  drivers/gpu/drm/xe/xe_module.c                |    6 +
> > > > >  drivers/gpu/drm/xe/xe_oa.c                    | 2370 +++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_oa.h                    |   27 +
> > > > >  drivers/gpu/drm/xe/xe_oa_types.h              |  232 ++
> > > > >  drivers/gpu/drm/xe/xe_perf.c                  |   67 +
> > > > >  drivers/gpu/drm/xe/xe_perf.h                  |   20 +
> > > > >  drivers/gpu/drm/xe/xe_query.c                 |   77 +
> > > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
> > > > >  include/uapi/drm/xe_drm.h                     |  291 ++
> > > > >  22 files changed, 3321 insertions(+), 7 deletions(-)
> > > > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa.h
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_perf.h
> > > > >
> > > >
