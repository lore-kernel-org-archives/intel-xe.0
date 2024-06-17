Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC4BC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 21:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A453110E4F5;
	Mon, 17 Jun 2024 21:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKYsPDGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051A610E4F5
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718659900; x=1750195900;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LK/LNYmMHkR4g+jihC0qIMMAwlmbtxlzIsXSUO8tHdg=;
 b=CKYsPDGGaKaEmRXWIDDjULJTi78V1D1UT2r7nKUpI1jnODPIirf2G0Hd
 JwzKdoFsMcTZik0S89M2jfo1QcQfvsYqYXuVDaowpJq+m9Vpl5+QzTlPR
 Mk3ObLxg1mywfbgy3ss5sVO305XtKKPZzSOgbNnwyP+0fCI1woblf28M5
 UcWuwoOAnB352z3wlbfVmOYswThIVVLkI3pfjKDwEf8PXVOdFyBtk02Zl
 8naOyibu6hSY5zc+2c8OStJ1t074CKfM1PyaZ9jhRXr53QSqoKZycEW+q
 rI9YfzX2tQ5yIAX2TAF1mYPeua8gvDGk/RqZYPeRYEK4VCusC25Gnt7rY g==;
X-CSE-ConnectionGUID: pIiWtEpcSkyv8asg3UEivQ==
X-CSE-MsgGUID: 9Fth4R24SOiRNEDVGFTisg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19326913"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19326913"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 14:31:38 -0700
X-CSE-ConnectionGUID: DaO2Cg6sTNOleayVjXWtig==
X-CSE-MsgGUID: 1PTAj9CWQWWtAF4QP9L7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41418543"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 14:31:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 14:31:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 14:31:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 14:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2981Ned4dbIh91A7kIIrwAbAWmtaNcSS1ZPZBQoC8KI/hreShZ97MOPnmnUVkV/MnPMEf5fxM11lgrfkkCL/RfogMAYg+v9FFe8wiMunKi60me76l9FIhpmjovxYmPOlkqGimVlWWJ2GmYQGNdwszDpSLmjr9aucjSTh3FgBjQxkM492TU3pWo50YiPyKetgAfwJNlNYK6+6/N//FhEfTu8jN5PEt+/O8UTh4KHy6DcaKK5dVIob/DIPO9dXpWklc30HmsnbAxDRnw2CTyPMbLhEIvA9UQ9hP1aaxmmTBLS+q505tfgnSCctjWqdDegDPCNnuXXUo6wPUrF2Kk9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hhuwc/4UjOiMiknM2WY/F6RRZoxg7VNAkBqm0V/Ggzw=;
 b=d+V0aK4HhZJCzkrlHkU1vZ/oTZwV0usJyymoSmXgNSh7OaODUxOSiyty9AqxV77iuFtGPb1j84D+aSv/Z8Z6R5IGaOTQ0VgxKAqq0vDdWUpzpI2qnOTYg6xkB97AheWHl4HLtqO/mU2nhuOdaNdn7cjJtC0/zzBQTbhqvhD8liFsaYR6k2yl5oFTp5cEbxV1RMMOGw0FYLKDtiDge9h4OWJ+TRQ8MlJyfvbbnFgrtd4jyeDTOEspq/Ess/lqoxfYahm9vCI/crQh5IFkusc/Ouz8TUIUuB5oSwr5mpUAK43McnGYitQGcROQLQl2hiIESni8BaN0+DSGsB8nJVpxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 21:31:32 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 21:31:31 +0000
Date: Mon, 17 Jun 2024 17:31:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v15 00/17] Add OA functionality to Xe
Message-ID: <ZnCrLR1i6ksKiMTs@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <6bee6a666dd0ab8440ca74d692a80788bfb1d748.camel@intel.com>
 <85v82ldew2.wl-ashutosh.dixit@intel.com>
 <8734pp94hx.wl-ashutosh.dixit@intel.com>
 <85sexfd0cy.wl-ashutosh.dixit@intel.com>
 <ZnCQK5ZFiTlj6CRv@intel.com>
 <87h6drz3dy.wl-ashutosh.dixit@intel.com>
 <87543a50eb8056fbc1e9894d2c149bdc818d7124.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87543a50eb8056fbc1e9894d2c149bdc818d7124.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: dec24e07-7583-4600-b1d6-08dc8f14daf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vDB4Sc7y1HH2wlGXLiOrfCijVI13w1ktwT55iYohXOzlI0nv6X5sqKMheX?=
 =?iso-8859-1?Q?XrnVZ1c4I6u6gi98Qt0syYaYjrXBLcaFzIu/IGLjuq9VSY88mJyMV39EZ1?=
 =?iso-8859-1?Q?yT24FDV/1I9xfQwiThOnipvRoxNWaYFH3pWaHJRWkjpTkbtVYX55b3/9Q/?=
 =?iso-8859-1?Q?DcmgQk3f4UYucT4yWSIhmG3/3GT556euDH/CRDRnmOdqlMfRgSgaTQm1j6?=
 =?iso-8859-1?Q?tfY0QX5vq8A/j0Woq0+Slf0yitPbHNun28u9DhUH4rd1Qrn0W7tpHCop5d?=
 =?iso-8859-1?Q?GcXklmT11eRxJdA3Kws3hNviUOcP62IkupY8RsMWxooGjYTgVMdEsYQGtc?=
 =?iso-8859-1?Q?/AWfEqOiojD+5H1JOL5wiXHjHNjPWswrlG79h1G8omx/vZX7LCisW9oTq+?=
 =?iso-8859-1?Q?mW5ZVa0QU2XHypPbK2xU9zHodu5WaNMI14v0q40P0m5uWixd9hb4SZw0r5?=
 =?iso-8859-1?Q?iPgpu3/SMAESfWo/bSw39LEztzXUGdQT7YXlng4gyHkQ2cUXyCNXk0Y5EN?=
 =?iso-8859-1?Q?YB4E0ZZV14uONsOZTbr+bxFgEQiFm+UMALeYs2Ias4gk93dYvl3+8h/P0x?=
 =?iso-8859-1?Q?d91GBMKio0m/uqlmsqmjd0MC23hnP8niHka+dUjquBA6EIKL9TVpzvLZ3L?=
 =?iso-8859-1?Q?lg/bqop3YHy5bPnz1eitF9Z04CKDBI2zf4M67Yq1XDw9oDN7N3EX4aSIdI?=
 =?iso-8859-1?Q?ZG8SvBIlrau0gMJOWwpzREWKHJTEx6hGtXNLOJh+KMyQqV97qxbuK9s05t?=
 =?iso-8859-1?Q?oXcKSHLUqxXtOVzh3FO/MLqiM322GyPrUuFmSKRfG47Johzt/d8EDK/s/9?=
 =?iso-8859-1?Q?llB/wVRrI2GNS6sYBmpTiCgPqOB3DzkifPCsjC6RY+Ig1fUX59pq2vu1SD?=
 =?iso-8859-1?Q?WHhg2eHUzrqT6b++JKHdknMqdNErEMjcD4BSkDfjVGnVwq0BFdtjkVXjEx?=
 =?iso-8859-1?Q?5U+wjN5FmELF8EjCFpROTzSZNBa7kPqwsk2B7LwFF5wKCU+8sfcib1hTF7?=
 =?iso-8859-1?Q?DqS3sKdz58YXNsg6k51THB29w5+wzyq8rUHtibhz8tWV+Bq1kydYgz2/N+?=
 =?iso-8859-1?Q?H5musO5ua95VmLKTuOcOPbx4ybLE4Mqc22PT5f9rgyTULIML6JZPSJo6Wq?=
 =?iso-8859-1?Q?tN4TjvmqMOFDuuZ/3p1bbtqVCOPcH1CSpwm/AdV/ECXIgd61t42pT3k/kj?=
 =?iso-8859-1?Q?1Zlwz6ziu7EQ9MQ35x+Hl/M5Iulfe6wc2vzgPdiz7Cf4TqYj1Mt0ekf7++?=
 =?iso-8859-1?Q?WsCKphRSAl01G0NNM6GizaJC2QBIauRfBbdm/gHrc4QtzzYOSbMqmAPcYG?=
 =?iso-8859-1?Q?Qg2Mp5ZdCDBTCR1fdV8KKbWEmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Sxt8Wlj8G552E5yjnTVTKfxCgWQofTb8SDGGZsDdQI9DBcE8boMFDNXQr8?=
 =?iso-8859-1?Q?Jo18EWTAu1X+HfnjutevoEt0ld8uCPk1a1qdNUiJtFeDYNF1clTZ182NfF?=
 =?iso-8859-1?Q?3RsgsnwqayBMb7fCNsdBKun9zRtUMQ4VXQyOuSWVSrCPbQ8Gdj5Fx8/Dbi?=
 =?iso-8859-1?Q?NgR7p7A1flMz5MpxxWLDO5JwRkLPPtq/W3AQFD9X37FAYoJG+o6EKdY9aU?=
 =?iso-8859-1?Q?7n1U1QQF7472eYV+U9GJV50XupQndllMl23aJP3b+e96CELL+Vqxuc6bTt?=
 =?iso-8859-1?Q?WOV/h2KT5IyHd+pZSLB5rm4+o6w64WaTPBPeryyp3429shPlzplT0pzOOq?=
 =?iso-8859-1?Q?cvf6WnYIBtVtB5EkUcATLPgaDKh8UDE87+PGRoCSiBq6ccaR//b3ZhmIpQ?=
 =?iso-8859-1?Q?L2wannUxVbexvi99GNJntkPC9eSyYqH1golFIijTMoa+1FkDQRr4h/up/I?=
 =?iso-8859-1?Q?hb4zaHpC56rLrBDLZpkExttbFz7qlpAyvLSr+NGVeEHNTxnMfqa2ikiz40?=
 =?iso-8859-1?Q?GsL30yHKopPXLux4SFDXpIptl/EVLrlyqCf5KUlyp0m2YWDX9JnL5r98od?=
 =?iso-8859-1?Q?4VKiePmkOU8l73a6o1ImO6hfwzZsbJmVOaYJmSjGK+l5KnnzfUOEc7Rtu+?=
 =?iso-8859-1?Q?xz2AM3llKUujzxpPPBpnoqZ2TfKcEOKDMPHMtLpopoA73gRXe3balAOOoj?=
 =?iso-8859-1?Q?6xpzbnvLvUdvqgBBhuIh4RcfmJxbCIyq7425s6Gm7L3j+luHZNXKmXmFzW?=
 =?iso-8859-1?Q?yM8qrIIWtxZrMHVqS53rVaxlrcvWDGp4wR3j9VQIcQuF840gHCcyEIG7Bw?=
 =?iso-8859-1?Q?vQltJksEbQuD1mTrZG9lI6tVj9WdahHl54WU5d5J53RaFYBMI+WljQEwf3?=
 =?iso-8859-1?Q?zDISPR+igDot1JOqSvpHT6VQP0jfNvsVMOv2Z+XJ8TKoC2YF2DySkywZhh?=
 =?iso-8859-1?Q?dkv+EqN135YXnn1PEBQbU+bgPXrpstGCmPqWLeuXj4R+Z+vYQPTbAXCjeQ?=
 =?iso-8859-1?Q?kYQGyvKDJb4jtec7gHT3ndT3GgHU2rwArH5peGVto7+8kRP5jYiG6K/Dog?=
 =?iso-8859-1?Q?QKxdX5NmJZYJ/WihZUVjCJxJu6u/qLhYzEQRWA2oXt8a16flemoJ0/rogR?=
 =?iso-8859-1?Q?9Ddyn2XZGDtu7yK8ECypcfsX6nI0kTael1CG6vL6EySAJF5dAFu8e00MWG?=
 =?iso-8859-1?Q?ha/MB5psfR7RAn/dEcSBW93IesOM/U4eUxBpQf33i1bb4X8yqayQprsgC/?=
 =?iso-8859-1?Q?z76TDGNN3ZwAC4YACjj8HxIpsb5YHsYFpwOMGBCMGYrSPIRZTZFh/bVLxo?=
 =?iso-8859-1?Q?+Uz97RkrmM11VOLcOBBDiuxGYm56wwpwvlLR0wX8wmLCpLB7hvuXYXm6i0?=
 =?iso-8859-1?Q?Ytsns/ERSz+uwZl/tS+juRAuRJU36Tl9XYUKsQL980YEFd+se5ccD067x8?=
 =?iso-8859-1?Q?j48VEFsqYp/ixDoK7CMXik3rXzJqFoK5N+2SkM+zkEWali04RY92DGV65s?=
 =?iso-8859-1?Q?LsrsktTT8ZB7BAc0NPRM7NxQVbqXdkQuSwkEfMaIMAmMN9NtkT9RuV93As?=
 =?iso-8859-1?Q?XJ/wSolAT7INQv7wsrbcoFtQgWMdPJ/bvZi+axF9/r8MH9jV/zy6S819yv?=
 =?iso-8859-1?Q?wFBufaB7F5f82MXQgBFZcTKF/7PzVZLThTRgA0v82Tdi/uYiSNEtGrcg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dec24e07-7583-4600-b1d6-08dc8f14daf3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 21:31:31.8502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kbyv2wRsvTqS9Q0cWUdxxX5Wvr5paSKAjinMfLeVlCJIyiimvkMGezQBE+B6UXiRNm/OX93zOBk5n1jSSt42g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
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

On Mon, Jun 17, 2024 at 05:14:28PM -0400, Souza, Jose wrote:
> On Mon, 2024-06-17 at 14:05 -0700, Dixit, Ashutosh wrote:
> > On Mon, 17 Jun 2024 12:36:11 -0700, Rodrigo Vivi wrote:
> > > 
> > 
> > Hi Rodrigo,
> > 
> > Thanks for responding :)
> > 
> > > On Fri, Jun 14, 2024 at 08:12:45AM -0700, Dixit, Ashutosh wrote:
> > > > On Thu, 06 Jun 2024 13:54:18 -0700, Dixit, Ashutosh wrote:
> > > > > 
> > > > > On Thu, 06 Jun 2024 12:56:13 -0700, Dixit, Ashutosh wrote:
> > > > > > 
> > > > > 
> > > > > Hi Lucas / Rodrigo / Thomas,
> > > > > 
> > > > > > On Wed, 05 Jun 2024 07:12:54 -0700, Souza, Jose wrote:
> > > > > > > 
> > > > > > 
> > > > > > Hi Jose,
> > > > > > 
> > > > > > > On Sun, 2024-05-26 at 18:43 -0700, Ashutosh Dixit wrote:
> > > > > > > > Please see cover letter for v7 here:
> > > > > > > > https://patchwork.freedesktop.org/series/121084/#rev7
> > > > > > > > 
> > > > > > > > For changes in later versions see changelog below.
> > > > > > > > 
> > > > > > > > This series is also available at:
> > > > > > > >         https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
> > > > > > > > 
> > > > > > > > The series has been tested against this IGT series:
> > > > > > > >         https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
> > > > > > > > 	or,
> > > > > > > > 	https://patchwork.freedesktop.org/series/130033/
> > > > > > > > 
> > > > > > > > Opensource consumers using uapi in this series:
> > > > > > > > 
> > > > > > > > gpuvis:
> > > > > > > > 	https://github.com/mikesart/gpuvis/pull/86
> > > > > > > > 
> > > > > > > > mesa:
> > > > > > > > 	https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312
> > > > > > > > 
> > > > > > > > Test-with: 20240524031439.106332-1-ashutosh.dixit@intel.com
> > > > > > > > 
> > > > > > > 
> > > > > > > As first round this uAPI looks good for Mesa usage, second round after
> > > > > > > this ones is merged will add additional features and uAPIs need to
> > > > > > > support all Mesa needs.
> > > > > > 
> > > > > > Correct. Copy/paste from another email in this thread, this is what we are
> > > > > > looking at for the second round:
> > > > > > 
> > > > > > * hold preemption (needs some investigation as to feasibility)
> > > > > > * xe_sync for OA stream configuration and reconfiguration
> > > > > > * Equivalent of DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID. I am still trying
> > > > > >   to figure out if this is really needed. See here:
> > > > > >   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312#note_2429650
> > > > > >   Since this seems to be using some MDAPI metrics in Mesa, I think it
> > > > > >   should be ok to do this in the second round too.
> > > > > > 
> > > > > > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > > 
> > > > > > Thanks very much for the Mesa ack. I will start asking the Xe maintainers
> > > > > > if this (and gpuvis PR which is also merged) is sufficient to merge this
> > > > > > series now.
> > > > > 
> > > > > Mesa has now provided their ack for the Xe OA uapi. Also all Mesa Xe OA
> > > > > patches now have R-b. The gpuvis PR mentioned above is also merged. The Xe
> > > > > OA IGT series is also mentioned above.
> > > > > 
> > > > > So at this point I want to check with you if these things are sufficient to
> > > > > merge these Xe OA patches?
> > > > 
> > > > Gentle ping about this :) Can we try to get this into 6.11?
> > > 
> > > Sorry for taking so long to get to this one here.
> > > 
> > > Is the Mesa MR really ready to get merged right after we merge this kernel series?
> > > Are all of the patches there really reviewed? I couldn't make a sense of the open
> > > MR discussions and I noticed the MR is still marked as 'Draft:'.
> > 
> > +Jose: Hi Jose could you please answer Rodrigo's questions above.
> 
> According to Jordan, now that Xe KMD is part of Linux stable we need to follow the same process as i915 for uAPI additions.
> So we need to wait for uAPI changes to land to drm-next to then be able to merge on Mesa.
> After that happens I will remove the 'draft mode' and assign to Mesa bot to merge it.
> 
> But all patches are reviewed.

Thanks for the confirmation.

Ashutosh, could you please send a rebased version?

when applying v17:
$ dim b4-shazam 171817017582.68617.16794933743922778441@a6498e030952
[snip]
Applying: drm/xe/oa: Add OAR support
Patch failed at 0010 drm/xe/oa: Add OAR support
error: patch failed: drivers/gpu/drm/xe/xe_lrc.c:649

Then we wait for CI and push.

in case someone else push that, feel free to use:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > 
> > > 
> > > But once we are sure that Mesa is ready and all Michal's concerns on the latest
> > > version of the kernel series are solved, then we can definitely merge.
> > 
> > I addressed Michal's concerns in v17. Except one, which you responded to
> > right now and which we are not considering a blocker for merging the
> > series.
> > 
> > > 
> > > Deadline for 6.11 is Wednesday next week(Jun/26).
> > > 
> > > Thanks,
> > > Rodrigo.
> > 
> > Let's wait to hear from Jose and then go from there.
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > 
> > > > > > > thank you
> > > > > > > 
> > > > > > > > v2: Fix build
> > > > > > > > v3: Rebase, due to s/xe_engine/xe_exec_queue/
> > > > > > > > v4: Re-run for testing
> > > > > > > > v5: Address review comments, new patches 11 through 17
> > > > > > > > v6: New patches 18 through 21
> > > > > > > > v7: Patches are completely redone and don't start with i915 version of the uapi
> > > > > > > > v8: See https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1
> > > > > > > > v9: See https://patchwork.freedesktop.org/patch/577441/?series=128993&rev=2
> > > > > > > > v10: See https://patchwork.freedesktop.org/patch/577943/?series=128993&rev=3
> > > > > > > > v11: See https://patchwork.freedesktop.org/patch/581239/?series=130705&rev=1
> > > > > > > > v12: Add last two new patches to enable Xe2+ overrun mode
> > > > > > > > v13: Update last two patches after code review completion
> > > > > > > > v14: https://patchwork.freedesktop.org/patch/595447/?series=134028&rev=1
> > > > > > > > v15: https://patchwork.freedesktop.org/patch/595549/?series=134056&rev=1
> > > > > > > > 
> > > > > > > > Ashutosh Dixit (17):
> > > > > > > >   drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream
> > > > > > > >     types
> > > > > > > >   drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
> > > > > > > >   drm/xe/oa/uapi: Add OA data formats
> > > > > > > >   drm/xe/oa/uapi: Initialize OA units
> > > > > > > >   drm/xe/oa/uapi: Add/remove OA config perf ops
> > > > > > > >   drm/xe/oa/uapi: Define and parse OA stream properties
> > > > > > > >   drm/xe/oa: OA stream initialization (OAG)
> > > > > > > >   drm/xe/oa/uapi: Expose OA stream fd
> > > > > > > >   drm/xe/oa/uapi: Read file_operation
> > > > > > > >   drm/xe/oa: Add OAR support
> > > > > > > >   drm/xe/oa: Add OAC support
> > > > > > > >   drm/xe/oa/uapi: Query OA unit properties
> > > > > > > >   drm/xe/oa/uapi: OA buffer mmap
> > > > > > > >   drm/xe/oa: Add MMIO trigger support
> > > > > > > >   drm/xe/oa: Override GuC RC with OA on PVC
> > > > > > > >   drm/xe/oa: Changes to OA_TAKEN
> > > > > > > >   drm/xe/oa: Enable Xe2+ overrun mode
> > > > > > > > 
> > > > > > > >  drivers/gpu/drm/xe/Makefile                   |    2 +
> > > > > > > >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |    3 +
> > > > > > > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    2 +
> > > > > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
> > > > > > > >  drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  103 +
> > > > > > > >  drivers/gpu/drm/xe/xe_device.c                |   19 +-
> > > > > > > >  drivers/gpu/drm/xe/xe_device_types.h          |    4 +
> > > > > > > >  drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
> > > > > > > >  drivers/gpu/drm/xe/xe_guc_pc.c                |   57 +
> > > > > > > >  drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
> > > > > > > >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
> > > > > > > >  drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
> > > > > > > >  drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
> > > > > > > >  drivers/gpu/drm/xe/xe_module.c                |    6 +
> > > > > > > >  drivers/gpu/drm/xe/xe_oa.c                    | 2370 +++++++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_oa.h                    |   27 +
> > > > > > > >  drivers/gpu/drm/xe/xe_oa_types.h              |  232 ++
> > > > > > > >  drivers/gpu/drm/xe/xe_perf.c                  |   67 +
> > > > > > > >  drivers/gpu/drm/xe/xe_perf.h                  |   20 +
> > > > > > > >  drivers/gpu/drm/xe/xe_query.c                 |   77 +
> > > > > > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
> > > > > > > >  include/uapi/drm/xe_drm.h                     |  291 ++
> > > > > > > >  22 files changed, 3321 insertions(+), 7 deletions(-)
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa.h
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_perf.h
> > > > > > > > 
> > > > > > > 
> 
