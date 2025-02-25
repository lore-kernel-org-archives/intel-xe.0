Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85CBC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 20:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD3610E05D;
	Tue, 25 Feb 2025 20:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpvyaJSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E49410E05D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740513956; x=1772049956;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vBTkjyRt71NpiB7jltBdYyI6d0vloFYXdxirDmKMtJQ=;
 b=KpvyaJSHN18q927hwmghsNgz3OtkcnPoRClKUpiVRW3ksDqKtJWBYnkG
 Ek1dP4XIry9fJ+ru11yTgUY4uPLK0A8yK5tfyCab/Yp86lwi5FKN0XEPb
 IhjhypmWZ2sAGdoQnCLP0IZK9VHQimGunLHJ+d71ysulw94Lf46SulKEV
 onzUx8TlAn2fM2SVf7VtueFTElb9V4PjfeAmKvoL7vFxVnP9ycafNGxbU
 Ssd4to/9gBk05e8rlhHgL4U8VtwRd/dctd6P4MhTET7oEGCeHQDz8FY9l
 mDKVDBCLziC2grVcbqUCBiJLRglC/GSmX8akk63JpyX+z73k3YagCzXUE Q==;
X-CSE-ConnectionGUID: T50VkPhSRby6AjVF1v7G7A==
X-CSE-MsgGUID: tE5bfxVqT/SQWnROCwCv/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52760978"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52760978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 12:05:49 -0800
X-CSE-ConnectionGUID: ozS1WsEGQNOS6957bUKW+g==
X-CSE-MsgGUID: 8V+7np70S8uiq3Dhl/gETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121427094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 12:05:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 12:05:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 12:05:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 12:05:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bV8qngnFYvUFUkZs8aY1se0tJ0c2Pl6t3j37O7q4vuRC/86tBbVOOOTEDiNfhRGUlSAntnNw1ueeWwlrl+0rnk5ywIybfEr9OcA+SNsunYeFXNST2FSdeNqmoZEwfAvSiZtjF9NrRZ8T9+d0ppPYISpjHAW/wZAvclzTVdBB5bsS4jSkdbvnTbmDkyk2B/8H8nGpLArq/deoFf7r5+H04e3jcoHeGUqMnjsAvbkDqSDDvvgCunqhkgDQ7EKVmo2S1+lt8vOlz+bxHIOwK2gaF/GV4LgjcogYHzH0qGVogNOX+pBFsjf2J+Pd6zEjEj3Ln20IKf7Zd5RbIkx2z4/bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/Hw5yfsf3RSxV9CQXtYPe89i9GFkHv6l5XpH7M7h28=;
 b=Oo/mRlHeNnYrlSzGrx7KSbRnivUuwI0x8H/DZqvAkPHkFhVcPQBojnB5TUBuU876sTbEfm1X/ullDewFASLVcWciGLdeWSUA4eBArluZGnzeSJIrcB5otmVr36U1i1pSdHdUPGHRy/QMOFFTTYskOjYxzrBugDghy3DMrvlu15nAHDK97m+7G3cUEA07H7I2jatDi1xW3NqKmhniKZv6XOH5IBvkKZbamvOe58kdNtatdfkJFWgwl1wn0we90C1wxbGSZKY2AP1SAeLJT0PMT2yADRne3TOe//jdQY/drtLd8QPcYxdMjV3wWYm1bGwOxgKzyVRnz+H3aTAJVY472w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 20:05:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 20:05:15 +0000
Date: Tue, 25 Feb 2025 12:06:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z74iu8n7Xe/mz6Uh@lstrano-desk.jf.intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
 <20250224170109.3078314-2-matthew.brost@intel.com>
 <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
 <Z74Bo0no06PmV87O@lstrano-desk.jf.intel.com>
 <4267074055afdb298914de6658b64f89e55136c5.camel@linux.intel.com>
 <Z74Yrv/yHUyooxHW@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z74Yrv/yHUyooxHW@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0311.namprd03.prod.outlook.com
 (2603:10b6:303:dd::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff30fd0-5f2c-49a8-a38e-08dd55d7b80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?78sLwXrcEIbgbM8Nv3lCxH3yjH07QpYK5tC+PxBkljpwJ6DlorsbVVJHOs?=
 =?iso-8859-1?Q?tQH/2Qk0VW+kR3zptwWGCVpq/HUZZdYaYYV+60Fw0NKf9qD7c9zG9bccix?=
 =?iso-8859-1?Q?M5b24BS6SShhkwpyEzdFd5CIEoUAXaR5MlVDjvtm2ysAoBYSzbZoEmqdEO?=
 =?iso-8859-1?Q?91HfbsHDioMzus+CHDjawWwUEtUAg4ysjn3UpYRGCvrg87IcYFKX2aJqt+?=
 =?iso-8859-1?Q?3w+pVaMTFerwy24wFMTfEKZr+to0VL1waaskCC4QCOOTaGYypWWy1S5eBY?=
 =?iso-8859-1?Q?Sg1sSrY3ivm6/1TUiyRtRHVeh8rxSxQKQB02+dNBGtAH9tltfTcTNMZWAG?=
 =?iso-8859-1?Q?aLsVpMOLC1oojS2Zf7SfFW5d7zYK9hTIjJJXHxGCOCifRBQJ5S2qg2YEgD?=
 =?iso-8859-1?Q?xcjY3rMUAqiJ2YRsAYY/MnoQZZbCd+tPBzE2oxpd3cZtxgRHZMEFu0cAZd?=
 =?iso-8859-1?Q?hKpIqbD9DJZrXDApY0tZm2NvRh6T/CmwHjblFhz9jtlBWBhYoWnN5RVw/8?=
 =?iso-8859-1?Q?Wxj7eX3kctx5lCguXfnwCBnyO2O31FsUkKw/pQBSYQKzpsf+xY6iuBgf+2?=
 =?iso-8859-1?Q?vnQqU7BE8or54H61r9NzEF7vKNnSqBx6LkizR/54DKgk9zTe8+SsDifsD3?=
 =?iso-8859-1?Q?aufHqXd8lN4Rkn/K7UYnSwuRhCFrVSPqVC1WVEg1OPx1FEPhWW9zgpthfA?=
 =?iso-8859-1?Q?5DPWlcR7XAqGNTRaP9C64/5GSnkwvicXBKk4FMsLAk2AoCRrDGRfApUGbM?=
 =?iso-8859-1?Q?7dyHEi/kIQrncwR7rwV5zbbdIhXjJg/jqXbOlNnkQNNAcTw7shg2SR3dBm?=
 =?iso-8859-1?Q?Q7eDBJDkGeV8jZMcbiLi0+Gn10jRr7PMyAXM68/UqOYesU5lFU7qiLVwHn?=
 =?iso-8859-1?Q?itbB/MXNg4/nluOxB0jGThUu29qof6jhyOdMvYvXmu9wKkTZGhK5eVoHZ+?=
 =?iso-8859-1?Q?LRWOQFkA89+1r2/REBpvbxJFMCYud4CLq3EwiPCwtDcfjuUGKEB/kt8B4j?=
 =?iso-8859-1?Q?LIUff5P4jJsUt0VVgdc2ZHnK0d2PKmAetHkmJ7NEyps4zFOpZ3Gio/iQFp?=
 =?iso-8859-1?Q?oCis1/5a15J6in8GW0Hps3991WiCAFfAAD67SIXuLzvAWEFct8gtNkHO5Z?=
 =?iso-8859-1?Q?tIx4qOwSlvOVsxoFBUntJ62KM0xB+HOYRpBex+MXVt/YVGcBPBnuk8E/jL?=
 =?iso-8859-1?Q?SIp22ey4LmLRl7hCevoVqyEUjZt0Ey5G0oACjZfqVuV4c5V+vVlcIDJiYv?=
 =?iso-8859-1?Q?tqvL7EVqT0Nal7XcceZp1lCxObc0bgUGY308wElQ0jt0yLYfVNMfrU+jaJ?=
 =?iso-8859-1?Q?rCUJlfEMcSUbwps40+/rMc97VpJ1GjQEHJpLYVc0vTVAnweB40kjb1Frg+?=
 =?iso-8859-1?Q?QSu9rvPons93+Ph6WeY5vzi3+teNMRWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BcbvVt9YMcA8QhmM2WEpxjbC4fYUDSqBncOp7xxZenm+HuI2OLRCd16m1U?=
 =?iso-8859-1?Q?GXvtOcogIDEfvavovFG3aa35vh2hUso6uY1WmU3mP34zK4L5CjnEj/g/8n?=
 =?iso-8859-1?Q?TIbXdrCn0BFD94ke2zcUCZP92gbKRuyfDBXyutxSOWWXDRze0SgcKb8q37?=
 =?iso-8859-1?Q?eZZ2WzyIc5QnZwuvX+3k6cghOPSmb9OrWRv9gPTPXeTWSEjf5oALzXwZ3D?=
 =?iso-8859-1?Q?AACb1Z/ymUn97km5BWQSqvxTaVGP9sM4Q59R3WltOEsQB9Lf/IOPMh1mo3?=
 =?iso-8859-1?Q?hTNk7Twl9GCXjQWlhKuUEDRHhWGRZ5KAbO0R23EXmESOZBgnlVtFxBaNoA?=
 =?iso-8859-1?Q?L8uJ2/0Rt6hTcHczU+xIyRv/rfWyJi0JN9YkotGOu4gKZGg7u5CWOyE2C6?=
 =?iso-8859-1?Q?WwOaslbU2mL/PTUBe8Q2x85Ofq7tQ4/xP5ePmhR/H/gBtO/P7462GthiWs?=
 =?iso-8859-1?Q?YC6KnUXi3jIEHY4gb3rU4WdIddQgSF6oNeDwzCrxmJiYgjn5tp0AOQLKjf?=
 =?iso-8859-1?Q?YbHSmOHrZRQmoby5kOnXV/beAfI4e15VDAoAaTwQoWwTRC38n8kn2cGLHY?=
 =?iso-8859-1?Q?PxuOOlsac0n3oWHrQnBxywoltKeptLwgx2DBDpcrQjEkM5aTQxbUAbMxOd?=
 =?iso-8859-1?Q?sbSlQ6x3xhuvvBxq1jFisN+BG9dTu7PRvJUKfPShxaD11hzucTa82TZFzR?=
 =?iso-8859-1?Q?g939c3/h4oE8jxGvwIhb9BzEDiQbAFtkp3suwNkL+roxejnw9PzHCUyMEc?=
 =?iso-8859-1?Q?IvAueeIFDfEBuLWJj1w4NEGBO/3HFe+C6LR7N6ADbbDKjImDqB3PkzmDyA?=
 =?iso-8859-1?Q?RLU3hH7i9h3/4CN+bQLA5gyTRW3cTKrRyyQ9BaVZT5stLTUIDTzN++omX5?=
 =?iso-8859-1?Q?szANswjyEDjfUKWQ4rbCfHtRzfPhswOywNf9wrmG/G23trDXX/1zfIc7Uo?=
 =?iso-8859-1?Q?mGzGZCZE8eOIAvamRBCif26uaAJhCkktf7S0y0jTPJspeOBavQSNmIkAWg?=
 =?iso-8859-1?Q?zq2bFOuitfaOsMTmvXVwRGkCxypho3h+3tJSHLW6co3g9LRMGaEVb0pTrN?=
 =?iso-8859-1?Q?vWED4CZfoTNM8xZTIP7OffB9w8MC0xeQ9NQAoSy5w6ZATVcQ41X2omBD0g?=
 =?iso-8859-1?Q?4em4dkbZJvMMyk+r7Ho7IYGumMJoKqbh16C1wo8QVku9gO2EYlPcySYKfH?=
 =?iso-8859-1?Q?ig0nhfSy9IBqAZmf+dXeFX+hhzGJgwpjBWGAKlDTdItK9foL45/ul+Sy73?=
 =?iso-8859-1?Q?SoIrYfCKIsMRNbCZC5YerbmvavB9l7rpJWxU7sILR2BsxDKSwbd5HCVG9p?=
 =?iso-8859-1?Q?QSMqT5vNYbx4dHSPYC9vj0dJiQjzeLc9FHUmML8TgjqfUzE9Bn/Lb8n9KR?=
 =?iso-8859-1?Q?FfnmQTP9P/Cu+KrNZ6CiIvjBkRm7gxxZKt++lW41j3rlDGaaNosOaBbAxD?=
 =?iso-8859-1?Q?0pRTcXecV/kKof8FFOFuL3NIpC2eoccFH/88MVIm8SlykkPznBssbP5xWl?=
 =?iso-8859-1?Q?v3PqTNWflMWWQu+pIHFjPfBLiPIsE7x1VZJ9XSHnBpF2rtWGu3pbcvgEaI?=
 =?iso-8859-1?Q?RAixuqVMhYK3BwDAmIkPNRKFC1L6fvvX0h4rOpEYlae08VXyUNzFkjiSzx?=
 =?iso-8859-1?Q?ljollqBSal5o4Cn+99udJdt5gDylNax4oX2Cqfap5atOa+pECrxS8DqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff30fd0-5f2c-49a8-a38e-08dd55d7b80c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 20:05:15.2310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkeNSvAgDFy6W3hxI+BuPynH1eMiKgB6aoLOKuG/lZOzwXbwyhCjqzuzvossqSD7jmuCWcT6uOdrLBWcXNLXYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
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

On Tue, Feb 25, 2025 at 11:23:26AM -0800, Matthew Brost wrote:
> On Tue, Feb 25, 2025 at 07:56:36PM +0100, Thomas Hellström wrote:
> > On Tue, 2025-02-25 at 09:45 -0800, Matthew Brost wrote:
> > > On Tue, Feb 25, 2025 at 03:30:54PM +0100, Thomas Hellström wrote:
> > > > Hi, Matt,
> > > > 
> > > > On Mon, 2025-02-24 at 09:01 -0800, Matthew Brost wrote:
> > > > > Always wait on dma-resv bookkeep slots if userptr invalidation
> > > > > has
> > > > > raced
> > > > > with a bind ensuring PTEs temporally setup to invalidated pages
> > > > > are
> > > > > never accessed.
> > > > > 
> > > > > Fixup initial bind handling always add VMAs to invalidation list
> > > > > and
> > > > > wait dma-resv bookkeep slots.
> > > > > 
> > > > > Always hold notifier across TLB invalidation in notifier to
> > > > > prevent a
> > > > > UAF if an unbind races.
> > > > > 
> > > > > Including all of the above changes for Fixes patch in hopes of an
> > > > > easier
> > > > > backport which fix a single patch.
> > > > > 
> > > > > v2:
> > > > >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > > >  - Support scratch page on invalidation (Thomas)
> > > > > v3:
> > > > >  - Drop clear of PTEs (Thomas)
> > > > 
> > > > This was what I actually meant.
> > > > 
> > > 
> > > Ok, I presented this as option and it wasn't clear to me this was
> > > preferred.
> > 
> > Well, I think the more special cases we can get rid of in the code, the
> 
> Sure, not opposed this direction.
> 
> > better? Or at least, like in this case, split out what's common with
> > the vm notifier into an xe_vm function and call that, making it more
> > clear to the reader that we force an invalidation.
> > 
> > > 
> > > > https://patchwork.freedesktop.org/patch/639489/?series=145409&rev=1
> > > > 
> > > 
> > > This patch is doesn't work.
> > > xe_vm.munmap-style-unbind-userptr-one-partial hangs due the error
> > > injection always firing on a single user bind, so we'd have to fix
> > > the
> > > error injection too.
> > 
> > I have a follow up patch that splits out a part of the notifier like
> > described above and calls that for each inject, also invalidating the
> > userptr's seqno, and that fixes the above problem, but then the code
> > hangs in 
> >
> 
> Ok, that sounds good.
>  
> > xe_exec_fault_mode --r once-userptr-prefetch
> > 
> > but that's a different failure mode. Apparently the prefetch code
> > doesn't repin an invalid userptr and returns -EAGAIN forever...
> > 
> 
> I see the issue, we only call xe_vma_userptr_pin_pages in new_vma which
> the prefetch code bypasses. If the error inject messes with userptr
> seqno it makes sense this would start to show up. I suppose this needs
> fixing too.
> 

Something like this shoud do the trick:

@@ -2299,8 +2299,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
                        break;
                }
                case DRM_GPUVA_OP_UNMAP:
+                       xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+                       break;
                case DRM_GPUVA_OP_PREFETCH:
-                       /* FIXME: Need to skip some prefetch ops */
+                       vma = gpuva_to_vma(op->base.prefetch.va);
+
+                       if (xe_vma_is_userptr(vma)) {
+                               err = xe_vma_is_userptr(vma);
+                               if (err)
+                                       return err;
+                       }
                        xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
                        break;
                default:

Matt

> Matt 
> 
> > /Thomas
> > 
> > 
> > 
> > > 
> > > Matt
> > >  
> > > > /Thomas
> > > > 
> > > > > v4:
> > > > >  - Remove double dma-resv wait
> > > > > 
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > Cc: <stable@vger.kernel.org>
> > > > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > > > single
> > > > > job")
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pt.c | 21 ++++++++++++---------
> > > > >  drivers/gpu/drm/xe/xe_vm.c |  4 ++--
> > > > >  2 files changed, 14 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > > index 1ddcc7e79a93..ffd23c3564c5 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -1215,9 +1215,6 @@ static int vma_check_userptr(struct xe_vm
> > > > > *vm,
> > > > > struct xe_vma *vma,
> > > > >  	uvma = to_userptr_vma(vma);
> > > > >  	notifier_seq = uvma->userptr.notifier_seq;
> > > > >  
> > > > > -	if (uvma->userptr.initial_bind &&
> > > > > !xe_vm_in_fault_mode(vm))
> > > > > -		return 0;
> > > > > -
> > > > >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > > > >  				     notifier_seq) &&
> > > > >  	    !xe_pt_userptr_inject_eagain(uvma))
> > > > > @@ -1226,6 +1223,8 @@ static int vma_check_userptr(struct xe_vm
> > > > > *vm,
> > > > > struct xe_vma *vma,
> > > > >  	if (xe_vm_in_fault_mode(vm)) {
> > > > >  		return -EAGAIN;
> > > > >  	} else {
> > > > > +		long err;
> > > > > +
> > > > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > > >  		list_move_tail(&uvma->userptr.invalidate_link,
> > > > >  			       &vm->userptr.invalidated);
> > > > > @@ -1234,19 +1233,23 @@ static int vma_check_userptr(struct xe_vm
> > > > > *vm, struct xe_vma *vma,
> > > > >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > > >  			struct dma_resv_iter cursor;
> > > > >  			struct dma_fence *fence;
> > > > > -			long err;
> > > > >  
> > > > >  			dma_resv_iter_begin(&cursor,
> > > > > xe_vm_resv(vm),
> > > > >  					   
> > > > > DMA_RESV_USAGE_BOOKKEEP);
> > > > >  			dma_resv_for_each_fence_unlocked(&cursor
> > > > > ,
> > > > > fence)
> > > > >  				dma_fence_enable_sw_signaling(fe
> > > > > nce)
> > > > > ;
> > > > >  			dma_resv_iter_end(&cursor);
> > > > > -
> > > > > -			err =
> > > > > dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > > -						   
> > > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > > -						    false,
> > > > > MAX_SCHEDULE_TIMEOUT);
> > > > > -			XE_WARN_ON(err <= 0);
> > > > >  		}
> > > > > +
> > > > > +		/*
> > > > > +		 * We are temporally installing PTEs pointing to
> > > > > invalidated
> > > > > +		 * pages, ensure VM is idle to avoid data
> > > > > corruption. PTEs fixed
> > > > > +		 * up upon next exec or in rebind worker.
> > > > > +		 */
> > > > > +		err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > > +					   
> > > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > > +					    false,
> > > > > MAX_SCHEDULE_TIMEOUT);
> > > > > +		XE_WARN_ON(err <= 0);
> > > > >  	}
> > > > >  
> > > > >  	return 0;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index 996000f2424e..9b2acb069a77 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > > > > mmu_interval_notifier *mni,
> > > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > > >  	}
> > > > >  
> > > > > -	up_write(&vm->userptr.notifier_lock);
> > > > > -
> > > > >  	/*
> > > > >  	 * Preempt fences turn into schedule disables, pipeline
> > > > > these.
> > > > >  	 * Note that even in fault mode, we need to wait for
> > > > > binds
> > > > > and
> > > > > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > > > > mmu_interval_notifier *mni,
> > > > >  		XE_WARN_ON(err);
> > > > >  	}
> > > > >  
> > > > > +	up_write(&vm->userptr.notifier_lock);
> > > > > +
> > > > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > > > >  
> > > > >  	return true;
> > > > 
> > 
