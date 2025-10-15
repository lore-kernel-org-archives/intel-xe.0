Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B77CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 15:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492A10E824;
	Wed, 15 Oct 2025 15:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACtW46jx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F412110E824
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760540650; x=1792076650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6CIKTPjPB0NlLZtB1v51G5opLA1fS41sAdnsvGLpKDI=;
 b=ACtW46jxrdGTg57wHzs14NJbSXxoxcIcR/WR72M1REyjAGKuZMbbzfCP
 y7cmieBDLo3Bs5xiYgL9Q03MHi/BzgtRUVCSX+d0pvSP5pwWr4cBCNLBo
 9VQDZDt9f/S9TWObK19VOJTXUybYFZ9+tqKKXzyZxzfeKIC1B9cLyflWI
 7sLBcRrncgYk1oE8d+AnzvRbnTPLdvoWrtmNgADGn382WjtwraZPLLAfs
 5w595LcSfK99KilFMs0X1FmioIdnmDWTxRc99Qh6o8b+dPJPwX6h800kl
 FouQsY7USKDRwAzmw6PrSjOI58hpVnt4b0otI3HjV/LRFR9esVz799N8R g==;
X-CSE-ConnectionGUID: j5SKhCrkS8WqSuwwELRTzQ==
X-CSE-MsgGUID: ntKOuZNyQBqE2Wufdx2V7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61748601"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="61748601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:04:09 -0700
X-CSE-ConnectionGUID: mD4XovSOSbe78VXq7W7/SA==
X-CSE-MsgGUID: fVYhXzlRRDGEzlHfqwwCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="212805458"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:04:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:04:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 08:04:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxMPePFN9Rnmeh5YPohQEzKvdSoDXul6vEVbSenhiQx9oS/EjjMJS6eSeY2kNJ3WOPFaTqnoKDHscZMalD6Rq4jYSS3E5Q/3widthIj91eii4As3tFFQyMkBfn+TvX/JaDL4GXSsKBHOXgplNuqBSbmjkl7obKyhiUmQpCiBFAxjxZafRy4VPsbMdFRK/bEGq2E16IHM7n63AJOZcYB9d8fTgOhEiXehM16Xz19LhURSdNOJU1pYBRcGZyx/Bk7JZQOjMBPipa9g2qRiwxBb2tBel9b4WNYhHlM9mjnQUGp4hzMYkZY17vxxX1984lFBzIeZAdgdmuZeBKI769SboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0m3yQfjoj+QxJiHRio7NfTUnYdRx2I6uaBKltyuicQ=;
 b=nP2ERvD0FJXcf33bWdCodeQSqC8jq3pj48wFUgO5T+RzD2KnMW/0S/ahOFJFCnFmUXQ6CLw5uqfIaUpcfTFyKlkwOxEdu44edm35MYVwEloXxQalgFxndCbgadNOXBwCocbdJK/IsoTaGMuRzFCPrJelsDNKYlUw1Oe/K+i20lXkYNbvEaiZPlYxyz8nZR7e1AIgV+MvGxeND2H3GNWg9kZHmgnnFfQzlHC10Knd+JM96ysJlI7FI6z6odsDJWwvmsx3EwJ0B7lmIZZLa4+tyx9p+FrOnmXSP5d+D4jN0LIpZC1uNvvwO6TCww0t5+2a0HNh/nHfoBj8/iBeE3avSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 15:04:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 15:04:05 +0000
Date: Wed, 15 Oct 2025 08:04:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <20251015150403.GJ1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
 <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
 <20251014165211.GR5409@mdroper-desk1.amr.corp.intel.com>
 <77ur4jy56xcjokgp7eko7eckv4y5gfacuqlzgksafo4dmwufxt@ashhsxth75vx>
 <aO9nHrXJWGXcSDiB@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aO9nHrXJWGXcSDiB@bvivekan-mobl1>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ffd384-2910-44b5-b497-08de0bfc155b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ws1upULQM8ie7pS2RDjVsY/PPwUW3NY6To+AlY+F2LUf4hvw96PH6Z+J42eh?=
 =?us-ascii?Q?lQVchG/QW+Pey4PwJr/uVXhHq1IJzLKrO1gehOMEO1IhQdAR6Yx667gtwXKo?=
 =?us-ascii?Q?MaRKnTjYhGjf+QAwQN49ZGuU5+eZxFaWFVFW2hsHQWu32r4eSaPRTQKGJcql?=
 =?us-ascii?Q?IwPtgwE7MZdILwJe3MBwAjyS+Ds0hEQF1ykSrRGhWbBR7g/vXuvvuoeRUD4J?=
 =?us-ascii?Q?dq5o0Cs2zmLOH3Rtc+5jd9xDZnqjKi2UaqB1djs2FxeUa/A0qgEZtrUMPbHc?=
 =?us-ascii?Q?CgTeLH89+YqVo+K5B8NPDekE0VsWo9+3FYLu4JGcWhbNDT0fextMkJ8IeHz8?=
 =?us-ascii?Q?sHwrZ5xwndBD9T3cyJQ5g5fBQ3lL5le3K3QPtGE4F8e0MHh5wEZP3YR06/hP?=
 =?us-ascii?Q?fzq+/ByICbmoZEhVMQIWgWZDSep3Jibpm0uf14ocUbRyo3B88PlYjr9p5t1V?=
 =?us-ascii?Q?aSnSg7IAOz1Iz8tTguOTfFKjWlK3a6aQ1k6CWmxHQCBHqJHPoMdneUmaJkf6?=
 =?us-ascii?Q?zM3wIbjV3N186F5/D+x3AWUgpYXgC5ynguxoUM+vpZFandcjZ3OWx02a4fdp?=
 =?us-ascii?Q?oBr74+I0d6jIyXmtB+NRYrEEYzKvmrlzFNZus/j6qduCtqH3lhmsF+Q/Kp/n?=
 =?us-ascii?Q?MHDYbvdCKlY69uMUtiETLKeJU/Nmb8r36pWY53CSD0rKIeDLOuqnqxfxgUnC?=
 =?us-ascii?Q?67IlmlPameOP7e4AL8DKV08RQerrj1SI6VNnY7WQ1mZ/J0KxkCyM/g9f0WLg?=
 =?us-ascii?Q?7ZaxcHg7OWSzZVQS6ibP5Y0Klrgg3PQ5XKLa7LBEY+3zOcmunRunpqu9UKbY?=
 =?us-ascii?Q?za3XZz4sHRuvC13oswhNokpuUidjBC+wI2rqcDVampabops+PvaC2Q5PJ4eD?=
 =?us-ascii?Q?GoYoK+tBd2Vu9eWr3F18+IlVYgw+lu2zXVSPFwpFEEKpx3/CeriG1dzudScc?=
 =?us-ascii?Q?3VKDyUnPvk6UyxCDwWkHNtKkOcXi8CV+y1ZKlxaMAYJS8XyYjX6L2WlaQfdb?=
 =?us-ascii?Q?AEflyDJ4w/OoinGfXlvDhhqDVs1mI1ERuboFBedMMdvKp7i168YerbVSl7aX?=
 =?us-ascii?Q?ZQMhSjupF7DnY8IFREzApMLouymO19ib+9Q1zks91tThTlAtSRDQXXsAYMH+?=
 =?us-ascii?Q?N/3QPAAyWNp5qzLVryTBSEKvFukVqbrayxcY7ZpeeUjLLhFrZ681rRdX81NR?=
 =?us-ascii?Q?vDX6vk230Kf9ki2AdjSd7CLtA8TO3mExtJHNDUdD8Lxo2VsnWR/ftT6w1cEW?=
 =?us-ascii?Q?oFOV3qqM48OtC/FQmDgMojoq3wmOuJg4ijIpu+vhidP0Jptk+I/nRrSbFQ8j?=
 =?us-ascii?Q?N3OydjWKgzjwvNY+ZDpEpZGbEUswuR4CwQkzT6aIW1bR7TahlzhHecRp1aZ1?=
 =?us-ascii?Q?zgjlilvwRoSGpOB9goKVhH0w2qvXAYlWCT4bhnqDGnFdZAO2zyIWFPNlDRyO?=
 =?us-ascii?Q?jrTiJU+7jUCpvoOkP4AwsTtaHkfJfAxa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSaXnnCGa8PcoMIE6t784Q2yikpgxcEHmQOMayjOrslIkwGrIMsRY0ZoIT0b?=
 =?us-ascii?Q?KSaI5y74VVDywBFE7omy8UOKlcgHNdRZG2Gx9Y/h22BpdEnMCKOLg6C8mJ9Q?=
 =?us-ascii?Q?smRD+2QurAfYY6MAvQYwUWSwrwwnbehOtaDrsskpEyWv3B49fOLLLlc5JecN?=
 =?us-ascii?Q?HYW3QnrNksxTe1lBlt9UygY09yXBdWq0SPV6e4936Fi4BIjUBCiRDJD7eirP?=
 =?us-ascii?Q?mP87C9hki7mICn11aFULn6RA72hFhh7if+O7xjN58+TToRnQ22bsWu/0cBMv?=
 =?us-ascii?Q?a+TkBvoys6yt1ivA9ALK2BdtphDD237mXTrUgULZsJKr2JR7I/pVdr1OZBe2?=
 =?us-ascii?Q?z/duAiUgwLGE4AL5L41chHy99p6d3HklbTzrqJWjKfSCsIoUgc3yd6E6MKW6?=
 =?us-ascii?Q?5ptEuP9oyxCdXcBMRFqec7g18RW/valvb9n7JWax004tjeHF1GVyzUIMeQO+?=
 =?us-ascii?Q?sckenvCKE82bpmTZ5mBmKyLzuv+JL8+KU/4Ibl1qk0zpSE7yaUeQ3HdNST5g?=
 =?us-ascii?Q?+WL+dGJ8AtHjrlwCkfE11a9HkrLzHUb2iWDbAsP2nXe9nOMl3sgnxzO0XQLd?=
 =?us-ascii?Q?Pgd72S+JFVExQXDx2Fb6Nffnx4Tpukoqbeim9fLS0I0ngr/w4XYu+uSdPgSM?=
 =?us-ascii?Q?khk4iseZHoSQA7LU91rjLY6L9YhvSxj4zXU4wGLUR9SHk4qSVr8T78PX7flC?=
 =?us-ascii?Q?4i/JlRK2nJxYLPaa7WjrKYyoOdrbdWE6k+4NAFgO7sMAz48wd2H7tEBck3kB?=
 =?us-ascii?Q?7KEri4FpKvaHcGDn6E2jqA7PYjbkBONADQtTWWXPrYlR210IYMtMjrVw0WtW?=
 =?us-ascii?Q?51Ghijk947B//IRJtJcVz+/OaYlTcD76yG1dTFzTR/XULGmnpm6m89CwkMYV?=
 =?us-ascii?Q?87kxJZ0SOqe8xNium4bC1wJvVN8hGDwaxqbNSM3e9G2AVW1Rnf5IrOJyHroB?=
 =?us-ascii?Q?lBLEEEB00b4UNGKbz0VtunBqjIBxdeWmdSYRQGSNBe1m/KrTx/5B3v7K7oWa?=
 =?us-ascii?Q?oed3FKY4yIHkV/NKN5vqDgQHr9FX4sdSkPrN96oE/Dm98YBu49RYQCK9RkJ8?=
 =?us-ascii?Q?yzKsgOYMDYG0vZueomQgFLWm3ArLjyV+Q4avNsbW+LaaORIOJskSrX7aVgf4?=
 =?us-ascii?Q?8xmTz3d9CpZRWF50wsTPfMF/JQS3VGZ075lmtwGcV4R7dXCF4Z/6edMf6oM0?=
 =?us-ascii?Q?eND2yGGh6uwHJ3JdJ2ln/KlUQnlPu8Dm9FdgNPGey0OIoVSJRQ68FffHRwJv?=
 =?us-ascii?Q?gY55BZge2280mtbehDyoo1j7665b4jh6uJnWfW4yvpDFQx184JR09U6JmZ6r?=
 =?us-ascii?Q?lsyXvtfJ6Uc015RdAFuPguOTq0dqK8kPmIQYR5NWuJsN94J68eHbzINRpLHL?=
 =?us-ascii?Q?sPytqzv+yfde5cNfrm7QPSFPY66mUA2zilxhMJpOtwarg/IqN8bXHZdB0WuS?=
 =?us-ascii?Q?S7K8sD72BwHJLF3H41GSxeaVHIu61vkyiDr7/AuWaBbMqLBavNziyhW45zG+?=
 =?us-ascii?Q?vuLdir2QiPf+CCxWK4p/u3+Z+n+KgjURqB8QQkIHANQyuGVQkrxMdI/LQ/kH?=
 =?us-ascii?Q?BrwKYL75TDeabPtUtWkp2M01VWRhrkGbyGNWyspYyU/jTfzjvXvC5eH39MMj?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ffd384-2910-44b5-b497-08de0bfc155b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:04:05.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmaziG7lclv34f9REcnmcyj8xd9RAs7W8d2+YnCQDkxa5RYppqOjQXg7UstVyhhqF7KmwpUwxtAXSQHnaiZBcG54Wj6c3rzje56BMAh4hOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

On Wed, Oct 15, 2025 at 02:49:26PM +0530, Vivekanandan, Balasubramani wrote:
> On 14.10.2025 22:41, Lucas De Marchi wrote:
> > On Tue, Oct 14, 2025 at 09:52:11AM -0700, Matt Roper wrote:
> > > On Tue, Oct 14, 2025 at 05:28:48PM +0530, Shekhar Chauhan wrote:
> > > > 
> > > > On 10/14/2025 8:54, Lucas De Marchi wrote:
> > > > > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > >
> > > > > CTC_MODE register is removed by Xe3p.  Stop reading that register on
> > > > > Xe3p and later platforms.
> > > > >
> > > > > Bspec: 62395
> > > > 
> > > > Again, maybe I'm referencing the Bspec in a wrong way, but I do see this
> > > > register existing for IP 35. Maybe a possible tagging issue in the Bspec?
> > > > Can someone comment here, if I'm missing something.
> > > 
> > > So looking a bit closer based on your comment, I think maybe this should
> > > actually be a GRAPHICS_VER() test rather than a GT_VER() test.  It gets
> > > a bit confusing since the bspec website still tries to print stuff out
> > > in a platform-based manner, which makes it hard to follow exactly which
> > > IP versions and GTs are actually relevant.  In this case the first
> > > REMOVEDBY() tag listed is what documents the removal of the CTC_MODE
> > > register, but it appears that tag only applies to primary GT; the media
> > > GT is not included by the change referenced.  And then if you look
> > > through the jumble of platform names that come after that, it does
> > > indeed appear that media is still listed as having the register, but the
> > > primary GT no longer appears in the list for platforms with Xe3p IP.
> > > 
> > > So maybe this is another case where we should be using GRAPHICS_VER
> > > instead of GT_VER.  I'm not sure it really matters too much though since
> > > we don't actually use the register for anything, except to complain
> > > about a condition we expect to never show up.
> > 
> > maybe at this point we should just drop the entire thing?
> > It's not supported for xe2/xe3, it's dropped for xe3p. It's supported
> > for unofficially supported platforms, but we don't really know what to
> > do in that case.
> > 
> > So I think it'd be safe to just drop the entire function and now worry
> > about what is the exact gt version. Thoughts?
> 
> +1 from me to complete remove it.

Ack; just dropping it sounds fine to me.  I don't believe we've ever
seen a log containing the warning that this is set.


Matt

> 
> Regards,
> Bala
> 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > -shekhar
> > > > 
> > > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
> > > > >   1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > > index 4f011d1573c65..26052710be8a7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > > > > @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
> > > > >   static void check_ctc_mode(struct xe_gt *gt)
> > > > >   {
> > > > > +	/* CTC_MODE register is removed by Xe3p */
> > > > > +	if (GT_VER(gt) >= 35)
> > > > > +		return;
> > > > > +
> > > > >   	/*
> > > > >   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> > > > >   	 * platforms.  In theory it could be a valid setting for pre-Xe2
> > > > >
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
