Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD6CC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 21:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F210E465;
	Mon, 23 Jun 2025 21:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5xHgPQk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADF410E465
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750715198; x=1782251198;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W1L1NPZIYVy6/Qzm5954Fgl8dzgfTk4s3FXjctoHp34=;
 b=S5xHgPQkv0kbjxObm+dTptiB4ofO8vUOF3993yxG2MiM/MSP4ieu9nKw
 Fg9Teos8jQksi4u7fnTKep+kTxQJv4a/Bh7JYyiZCVFcZHl1actPUeYrI
 ZEgKlJZhE3D7TgzfBXwbz8uFu62vn/8SEx6XRY+9HCpDW5+wk0EBw5XJb
 czdaVCWx1xu8rUR3VTkBlXYutXnBLlhgW8XC4xutGCxcTDHe0G61SMGBP
 Cd1236J7Oxawq6h6nwVySDUfzDbPG2FHcA9Iwn1y2atRcAH8kENuhJizC
 Z91aS45+iSidBIdXwOYe5aLLbYAGgD6Hf9y0NjXUuAqbRJMseDo4lkaDQ A==;
X-CSE-ConnectionGUID: unOMFLb+Qymeu+AT5ANYBQ==
X-CSE-MsgGUID: PWad3XPETum8VSlDbh+JqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70504280"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="70504280"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:46:34 -0700
X-CSE-ConnectionGUID: 7voHsnm2Tj6ZhmcTqykTVg==
X-CSE-MsgGUID: I5k+ffPLQ2CczKUSgskYhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="155727819"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:46:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:46:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 14:46:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5axT/iVqUpJNS5P6+QbHr2hUz84hSbbb0vHPiTV5SpJecEvnSavGRzwQBsgZ3T0H2lTIrioq4Wu8K6XDytKyonkgfbkd0zFhB3FPKun0yHb41D/En2akYkHBOIzSzBgMfJKorl+COJIwPrqNvx0hGJFmBWt5UnkIKV2tMqOptjsCLFnFf6VeMXniyHH5a9kMYySmrcrF9WvOvHKPZYb30rgcAoxWknxBJr11dx5bXsEoCm0gE4HYJaFGBFfvIJ08hkfKytAdM9XFrFbLvTm1N4jXxzvbYqYAe+FE9X9Xho4AQgaBAfIfgTxAWGGhrD3JKDjjIOyr8cSVbf4EPalDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s874+XZ02HjO1kdLPqrEt3hiNjD0Fp+2NPEkEDk1yf0=;
 b=P39e0vfrpGeKHmItmonf8cBtrnMca52Owrvpg+TMJll37ZVEr8XcpVdvNjv8bBcNkmKmqMXyFUZLurDiOHFcMyoxYtaUWRt/RvQVcxYwas53v8Zi5+BduWhtBSRH8TS+l8HSj7TpY95ZrZcEu+q1M1U0PWQpz+LoqzslTRQTElepK9HGutjpzfKq15xfm7DUl3pbPju/vS7JIffOcLwrCnemyp1qoXEshqaKWvyWnyc4qKJaO8bYBR5qLZBITUeT2cEHoTClNhTLOu16nfP532xyV1tcvxnjbgNI/Clszp4+H2td0TMHlFw0OQHNGvOGb9rqn4e0s8jrT53M6vNrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 21:46:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 21:46:29 +0000
Date: Mon, 23 Jun 2025 14:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Message-ID: <aFnLmAeQe78KFUOv@lstrano-desk.jf.intel.com>
References: <20250620152446.239699-2-matthew.auld@intel.com>
 <aFWIS3/rlAWSlF6K@lstrano-desk.jf.intel.com>
 <530d502e-165d-41fb-9ce8-b6bbbbb8107a@intel.com>
 <aFk5dTinjFYcZKjt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFk5dTinjFYcZKjt@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7cb65d-947d-4c78-b67e-08ddb29f6964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?V8F9OQQd1mcnoUcDmSVCKWVrY3oMVdK+ybniuu8tBFIVLBMvbFKfgJzoMF?=
 =?iso-8859-1?Q?e+i7PmgrCc3C4A0Iu6+FmR/GA6hGerUiSBVSpWqbIBFZn/y3YXQZ78TTH+?=
 =?iso-8859-1?Q?9nh0efX1jjao219JtoLndKWQztHNBEh6v9ynxVvCtgjRJ7J+5PG1XWqg9i?=
 =?iso-8859-1?Q?0ocP/LtioWU6QffcxhFkn9ZQYniP3FqIyjEu7/cL1v83bi1ce8crZKodWG?=
 =?iso-8859-1?Q?OZo7gE2Q9BdRlIQKEAFREHte+rqcFnRjJr2b/VZEQdx4jasJLdVQHLgR4Q?=
 =?iso-8859-1?Q?qDb1rrSBo7j3YVQGTS+IlmwUEiU9DRvuKat3BVAFvStnhd7gMPO09NgLfY?=
 =?iso-8859-1?Q?+NWFMDK/KejJFR1gBtOqjDNnBNMfn29MpMrp2PN1GV2RjgUPou+XgjZQHi?=
 =?iso-8859-1?Q?raXES31anRJdyr6XcMoj/wMXFsTU1+rPixh4uJFbtYuG+Eni5iG8eS6qL0?=
 =?iso-8859-1?Q?3u/9HgjCoEHv0zCI+StI8XEF91znvx2H7WeLXlj1b/gW6aoxKkGRjvX9fb?=
 =?iso-8859-1?Q?tFnwnPD6ifGOkGth4qaLaYVZ/n3TxxE8VDcYVTzgAtnyPIBE+nrGta/FGq?=
 =?iso-8859-1?Q?7Jxce3JwkvS+iOdVfxowXxr9UIenN8mYwNSbslMgJsgP+lXXuHtkydAc+W?=
 =?iso-8859-1?Q?SGtyoRh/cY+OUcjJi7D12vSXmXMNzebK3C9OP4zzDFi8wig1uCVyVsZ1+f?=
 =?iso-8859-1?Q?S6ZuNxeyX9pj6jb+kcbBr6/r4HWRGrrz6yZFqgtyZiAYrUrk0m6McGL1fM?=
 =?iso-8859-1?Q?bHmik6CxmgwhruXaHn09VzopvKPHvb0F0N/1V+dIPEXgSxf++y06b3sDRq?=
 =?iso-8859-1?Q?dTNoRGj6aqy2/cpblSrNWtSZzbRoPOjdoJaHklHz6VJD0yipXPgqV1sZFl?=
 =?iso-8859-1?Q?FUjEl3R+YK6hXAhBef9xxLetIWUmrQkHQuPbdNhK1XBgaa5y7X5W5wW4Vx?=
 =?iso-8859-1?Q?Yv16P0MfFgPYYiNmkqnOcmqLdjhadNIxL8n4e5Df/JKYrpkMS2bAwsOPl4?=
 =?iso-8859-1?Q?hwpjD+MXh9kFsrKfrhdOt+5v/GLkWYfFNWzmRxSPmVSFaTsORxagaFofme?=
 =?iso-8859-1?Q?+5o0YQuqvlU4wqIPndzpLqsS/rxAmGjsP6iiytkJN5sQXBxbY0v3xtixVP?=
 =?iso-8859-1?Q?ETwhr3sIqnJ4geeG7+tmngy+ySsjbqQRgOdAsFlOoV45G8l0fqda1276MI?=
 =?iso-8859-1?Q?EJWpy3OdWbSae6cydGmc7h4TfEghXIg3H/NBgssr6v12tcDtA22xICe8L4?=
 =?iso-8859-1?Q?U0lAllu/wocP9KVDIFgJbiQZxcNkwQLjwGx0CERtxca7HZK9vjtQYoSzCb?=
 =?iso-8859-1?Q?Eu1tuXmRHGbEWubt5hccn78aHfU65dDJPmwNPYLqP+iPf/CrBaMsIIZhs8?=
 =?iso-8859-1?Q?SBcax0g6R7h1209XwMz6+s1BvhtHCxNdY43cbo0cT/y3hcjQ0pdy2wA/ky?=
 =?iso-8859-1?Q?MGeEIC5fNnrGwMhJpErFiki/b/33umj9M7BlXvW5nIzCsW5MDcbpApXLVx?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ekthp7TOVZpxL34XrsyjUfEIpC3plXyJ2pAY2KCvMbLyESX2l95B9jNriT?=
 =?iso-8859-1?Q?HBGqMK5HgkHjbV/6gD7eCuPPLh5cKdhQSGgCIzyF1VwsY5iHzHc2sKfPCr?=
 =?iso-8859-1?Q?k8SF7rHX39nXqXassgG1syoqgTN9BUlS/RmE68pYBA3dkjOcwfujFWuGTi?=
 =?iso-8859-1?Q?oII7264KpDfSUkPAhK+JmgnCC1Cfw+AzEEdVKN2UdK4QH7G0qTtO1kk1UR?=
 =?iso-8859-1?Q?SA+h9zRDxDiXHzovxfp6Ymvt8bn8z1uwgqckJp9pC/QO4TURttsDazeUpC?=
 =?iso-8859-1?Q?7gnQsw18SViuUJfdT8nHqO0Q+Tj+eq21VcZwmRVSgEDcPABhKRzRZtahk6?=
 =?iso-8859-1?Q?6qHASKnKL8bSOstfchV37h4AplYTL1xWm2V6J8F6QTD42a8GL/z2JwaFI1?=
 =?iso-8859-1?Q?zJZPNjCW9pX9SXrCTMn7KHz4ItSIVzHIdReQv97X38VX+HZUn6O5aEBR87?=
 =?iso-8859-1?Q?uabSrN6HTkx+MWGhaCFUoKq9K/iIBRVvk8vsXoZRvRAfKSJnzBo71mj6+f?=
 =?iso-8859-1?Q?t113w0k9Th/LkxX5u7FJY6jvUyr6RWd/XFu0lKg9A0NL539uShXaOdzoPT?=
 =?iso-8859-1?Q?B/xf9C/XI3ugiOsWsopEcvADkWQ+OvfqdIjK22kAv/x2bozRmBqtIMyf8A?=
 =?iso-8859-1?Q?Emmy4quIq5SnGYjTOBgLSZjPtmFw4XTaHV1kf5pZbk0HqORFtGFrN9oTpc?=
 =?iso-8859-1?Q?5QIZ9YxtZRA8wWTqgzj8i8s0AgGDjV75URoyepY+BEiCPt0Ik5+cMkhvV3?=
 =?iso-8859-1?Q?2B5rGCLkZwio/lROLSBqALdFjCiFagUe4DVOCIc62mRg/fgJ3Huz0Y7VYa?=
 =?iso-8859-1?Q?fchfNYc40orFhlh62QT8Krx4RMpIQA9CCjmMngsRcXf0jhKUHffHx9pgcR?=
 =?iso-8859-1?Q?3uHLjEL9N6J0uK9YDqMCyLeRY9PZfdU6LyV4gou1nnPW5Jmr5JO3GcDqBy?=
 =?iso-8859-1?Q?FJ1OvQu6CnPhptxRGUHhFnOgXw3dS8hS8zBlkOeHNnbXEexdmzn6WuMFT4?=
 =?iso-8859-1?Q?wKQ8F95x118NlvQ9QoROy5sx075ziOfIqGQ/iAPDM62TUeHkvI/VfvNAi0?=
 =?iso-8859-1?Q?b0IhTgWg/4B6wrEv4wLvyItc/a5tEyTyqFmnoX9O9hFFuaGl+ot5xLYYVx?=
 =?iso-8859-1?Q?2AR97mBcPw40JtP7uUB9aRce5Qd2/Bs3iEZSzBW1wbm269rCCLjYu2d80N?=
 =?iso-8859-1?Q?qso0dyVx+KmfUIw04LgvVIjvslrVz+CT/5hZlQPbFB15DyC+praIahKSMY?=
 =?iso-8859-1?Q?PZ4sT8BgZmoQ6T3s5vAbufPHXBK/N0W5VTG96VXIEnKU0JQ6H3DFSdYkkW?=
 =?iso-8859-1?Q?F5x2wVbcGKO88KR/vZGZND4thCfqjtRnAVasfgGoEkuYG91Qz62l0ppH+v?=
 =?iso-8859-1?Q?C508yF2NR+QONcxwOoNYZYAg9h/3ORdW9KcWZCyNP7TriRN1OMvz0Z4HQy?=
 =?iso-8859-1?Q?XyU0n4ZnhGRLmpes4bWYtvzfdVmzw7pqS/PTXE5Jq0TX5bfBp/HOJg1Oz5?=
 =?iso-8859-1?Q?BEYmv/+MOZEMsy7x5QIGQ+da5T3x+Q076WenR5D3Cpb1n4lpxm0EEO4Im/?=
 =?iso-8859-1?Q?go4nnZtYS5Y6qfWqRFliOQhUOfvJ/8qFVvyO/sOQwRBVsQ5L1ws/2WHqhN?=
 =?iso-8859-1?Q?M0y2gosk1mJiMdBJ41xuRVBNM52RHwSiAUmfVAASd49VwLQwYRp+690A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7cb65d-947d-4c78-b67e-08ddb29f6964
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:46:29.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFp5ZWP7SrM9UArgd5ogMXojV/7vJIzDatZT44JJsPWVJybXjMWGUPsSr8iEXMfmJOBtQDse4f8pXiseRnmjuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
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

On Mon, Jun 23, 2025 at 04:24:37AM -0700, Matthew Brost wrote:
> On Mon, Jun 23, 2025 at 10:33:13AM +0100, Matthew Auld wrote:
> > On 20/06/2025 17:11, Matthew Brost wrote:
> > > On Fri, Jun 20, 2025 at 04:24:47PM +0100, Matthew Auld wrote:
> > > > When clearing VRAM we should be able to skip invalidating the TLBs if we
> > > 
> > > For copies, we always program SRAM PTEs, and need a invalidate?
> > > Maybe mention this in the commit message.
> > 
> > Yup exactly that. I don't think we currently do vram -> vram in practice so
> > I didn't bother with the copy path. Will tweak the commit message.
> > 
> > > 
> > > > are only using the identity map to access VRAM (which is the common
> > > > case), since no modifications are made to PTEs on the fly. Also since we
> > > > use huge 1G entries within the identity map, there should be a pretty
> > > > decent chance that the next packet(s) (if also clears) can avoid a tree
> > > > walk if we don't shoot down the TLBs, like if we have to process a long
> > > > stream of clears.
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
> > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
> > > >   2 files changed, 16 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 8f8e9fdfb2a8..a76363740a12 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -896,7 +896,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > > >   			goto err;
> > > >   		}
> > > > -		xe_sched_job_add_migrate_flush(job, flush_flags);
> > > > +		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
> > > >   		if (!fence) {
> > > >   			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
> > > >   						    DMA_RESV_USAGE_BOOKKEEP);
> > > > @@ -1119,11 +1119,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > >   		size -= clear_L0;
> > > >   		/* Preemption is enabled again by the ring ops. */
> > > > -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
> > > > +		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
> > > >   			xe_res_next(&src_it, clear_L0);
> > > > -		else
> > > > -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
> > > > -				 &src_it, clear_L0, dst);
> > > > +		} else {
> > > > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > > +				 clear_only_system_ccs, &src_it, clear_L0, dst);
> > > > +			flush_flags |= MI_INVALIDATE_TLB;
> > > > +		}
> > > 
> > > What about the if statements for dst_it / copy_system_ccs? Do we not
> > > need to set MI_INVALIDATE_TLB there?
> > 
> > You mean for the copy path? We unconditionally apply MI_INVALIDATE_TLB when
> > doing any copy.
> > 
> 
> I was looking at wrong function (xe_migrate_copy) - I thought there were 
> a couple more calls to emit_pte here but on 2nd look, nope.
> 
> So patch the LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Hey since you are here. I noticed in emit_migration_job_gen12

> > > 
> > > Matt
> > > 
> > > >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > >   		update_idx = bb->len;
> > > > @@ -1134,7 +1136,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > >   		if (xe_migrate_needs_ccs_emit(xe)) {
> > > >   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> > > >   				      m->cleared_mem_ofs, false, clear_L0);
> > > > -			flush_flags = MI_FLUSH_DW_CCS;
> > > > +			flush_flags |= MI_FLUSH_DW_CCS;
> > > >   		}
> > > >   		job = xe_bb_create_migration_job(m->q, bb,
> > > > @@ -1469,6 +1471,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> > > >   		goto err_sa;
> > > >   	}
> > > > +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > > > +
> > > >   	if (ops->pre_commit) {
> > > >   		pt_update->job = job;
> > > >   		err = ops->pre_commit(pt_update);
> > > > @@ -1667,7 +1671,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > > >   		goto err;
> > > >   	}
> > > > -	xe_sched_job_add_migrate_flush(job, 0);
> > > > +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > > >   	mutex_lock(&m->job_mutex);
> > > >   	xe_sched_job_arm(job);
> > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > index bc1689db4cd7..b5548e0769f4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > @@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
> > > >   	return i;
> > > >   }
> > > > -static int emit_flush_invalidate(u32 *dw, int i)
> > > > +static int emit_flush_invalidate(u32 *dw, int i, u32 flush_flags)
> > > >   {
> > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> > > > +	dw[i++] = MI_FLUSH_DW |  MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> > > > +		MI_FLUSH_DW_STORE_INDEX | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
> > > >   	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> > > >   	dw[i++] = 0;
> > > >   	dw[i++] = 0;
> > > > @@ -411,13 +411,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> > > >   	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> > > >   		/* XXX: Do we need this? Leaving for now. */
> > > >   		dw[i++] = preparser_disable(true);
> > > > -		i = emit_flush_invalidate(dw, i);
> > > > +		i = emit_flush_invalidate(dw, i, job->migrate_flush_flags);
> > > >   		dw[i++] = preparser_disable(false);
> > > >   	}
> > > >   	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
> > > > +	dw[i++] = MI_FLUSH_DW | job->migrate_flush_flags |

Just noticed this part. Do we need to ever invalidate the TLBs here? I'm
confused why we would. The first batch emits the PTEs, the second does a
copy. Why after a copy would we have to invalidate the PTEs? The next
job should invalidate the PTEs after emitting them.

Not blocker as this is existing code but maybe in a follow up we never
invalidate here.

Matt

> > > >   		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> > > >   	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
> > > >   	dw[i++] = 0;
> > > > -- 
> > > > 2.49.0
> > > > 
> > 
