Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61030D2FEE1
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCFA10E5CB;
	Tue, 27 Jan 2026 20:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4sFTqA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB9A10E170
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769546874; x=1801082874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HvampuqJNLq9fe7UAgTzpbqxSVuhjIm3rjTQ8bw4rsA=;
 b=K4sFTqA0YLqCmuqD4u2ZlUSFELjSw29Jxc8+woXLjsR/+Z7b5ZrsZQXj
 WW0XS32qZaA0Ll2CnrKR3ghGte/jOY2AkA7BSdaUY0nDxVWEWkjg9aye8
 S2V8fqfQGx5Balfq3dRsJtvRX+kbcVbV/KwTU3cS/ATpdmgCWYI1xngEn
 5ux3j6Y4sQWXIvU+2Tx2/7L3+iGv7qrHFwzC43EpsfrZ3ccOWpojeI0YD
 Fm0HtCtGROnKj8Ub7uGDX8bs5C/T3hqClW5XBRoCJphDZBaYt+ZI9Tmdt
 BDrpQl+qMRA6wE6JAvrdgHgbJXaxw6Pv/xoVKaJmVDsg5dQWoEIHdICii w==;
X-CSE-ConnectionGUID: eu3n06xOSQW9bueyY+03aw==
X-CSE-MsgGUID: ZQ21fZpkQoy/hvfbUxfQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81064981"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81064981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:47:54 -0800
X-CSE-ConnectionGUID: pAgsfcOWQV+1xYTyyueCnw==
X-CSE-MsgGUID: x+2ST0fLQ7GAccM7ifZgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207682964"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:47:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:47:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:47:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp/RPDy3nNPbEgB7fvHGKtaad1oljrkf/ZHHc4tQI0QdLHJ9Xx9iLXWYFNGQJz5cKnrhkRvoDlQF9Wt9svsEPlWI91lP7vGePbzT6dKEnrChanS4H9vxy4gt6gcASq1w6P1IHVuEWZJdJdeR1B+A4EhStEyVdCg0wjBwZ7eGNZt5QaitilDcQSsIK5njq1OCQxwzAcZBECmBbflPJdeAJ1OQ9Gv+6lFvvuo6GiYgLdHH/hLO8bwImFHcHxb1YFbiTwJ1foQnbIzkOcYtGhqbqATJaUYdyzTSEIfRqwngwV0Jt2tqNP4i2b45i+tepCgyLmN8ZoSRc7AXYVdiU1cKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6xq3kt7GmbB4oLxTcVYS8cDKTmRCcZbTnPHB8LAeLI=;
 b=EZoKjB0MvABx9vmFI2mF4V1rW3Kyi6jY2rK928Jb8T1uVDmej/5jOqHiMFC/Wny7g3C30kgcyRNYdwOm5CSiu0H02CBMt+Ajo7hCdM3Srsm4tovM/uqNtgGTa994Ta87+EdxYsWer8E8HyOMcbAna/vcsF+wjuSrc3gkgWKJBQopacwzeqjwLk4Shn1bwEXoEG1gjv1y+49sywFkYDStvkNA+4YOVdRw8hDtbd4uRQmQeG8WqqSdETmlXQmk1Gk/88ehZhQPi0xN4br6lU3uVnIiG09vC3aZkmv0Bab43USaKZ7RJ+NU91o32P3c4TD3EYYUlIBYgqfFu9HFrPtpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 20:47:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:47:49 +0000
Date: Tue, 27 Jan 2026 12:47:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <priyanka.dandamudi@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aXkkcluQPykwySPx@lstrano-desk.jf.intel.com>
References: <20260127115713.869000-1-varun.gupta@intel.com>
 <20260127115713.869000-3-varun.gupta@intel.com>
 <aXkghJIl8V/3lh/d@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aXkghJIl8V/3lh/d@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfcacb1-bc2a-4bbe-5af5-08de5de5551e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1+Z4CuHemlphW+YGY903nevLYNBeeFq4wWwBUiHFNDgt6ZaEBNeuqEjpRy6I?=
 =?us-ascii?Q?bMYuP6TrjYmWDrN/nmeU/jxfYX4l2KuuQjkw5zEnCqh/nlzw/tYobS8I7+PX?=
 =?us-ascii?Q?Ii4liPBwFwulU+pPCzk+KgQEXAFE3pQXVyyAmDbAMmPwPBSOyJiz7Uyurfaz?=
 =?us-ascii?Q?20ZEkWg3yV/EvDi8t0pydKwksptYKi4TfpdcKKSFlvEePuRh3KQCm+y1nmk4?=
 =?us-ascii?Q?6lFIY42UwxKv53KwT+H3XdT5oMq589tWioOs/MBokXUaHmquBu76KkxBdQzm?=
 =?us-ascii?Q?XTRghDd1h01QX22X20yrBEGqC5IY91rOl1INO9hWHtWUaJvqyBJM6OACg3qc?=
 =?us-ascii?Q?UAGe6OzL2L6J7c852tGpmLkuIin3gwwqHZFC2jlUMO4egmlFhbc/MrIZcI+w?=
 =?us-ascii?Q?DDbp6WsPjba1SQFu1w9FRQwzTifrPTKowCCTIb6/tDsqI+Buss+DUxNKppQW?=
 =?us-ascii?Q?/A34gNMmUX9BOQThcujZ1Fb//G40Ypr05ml5zpLQ/curMmZxd+sPQyOklFiu?=
 =?us-ascii?Q?7zHANDChc6HKjQg/3Sl1l8u3yHcna5xO0q1fAC8tXajBKLaZ5WLb+DmVYGQ8?=
 =?us-ascii?Q?lCQYRhKLN93I31WIQdqQP0XxhRMnVuDqX8dIdEcDicsNp4OiqZ+G+fELBpSw?=
 =?us-ascii?Q?qWQTWoCPE/BOHIksO3a0nYGh8+NfjfbWnoI3VrPMJtOmAFk2Fu+8a29ONba0?=
 =?us-ascii?Q?TIiWWWFwuoNpMnRDPILKoFQmgC9M37TF4nOEihe0Q/atxxt4jeXTVVrrBrPg?=
 =?us-ascii?Q?oTi/aTdjrtRyG5smOBMVkxsnjZ/FVFs4kJgA8mI+Kdgc7NZyeV/8O+AGWP1U?=
 =?us-ascii?Q?Kp/DizCWA2iUS2G7LmkrpN4kLldbVadPsx27uHAFGPNDmKAp6+CqW4W+3cgS?=
 =?us-ascii?Q?+uoOAxvLVkuBlh6ICk3spUrUnUHSHh5MMuHdtfOYGXxd6/5kgUlsqj0w3gbo?=
 =?us-ascii?Q?YEtY8OT8deaP/3LKplwd7VlK3KFUu+55WwFJAaj7m3GokdrVT+Z4kzo/slnd?=
 =?us-ascii?Q?xx06AE+NJW8LtvZ0iMMy5AEVqvze5lU/N3TAph8JuSnexKSHUjw9f13h4yWi?=
 =?us-ascii?Q?AQ62u+us43sCD5AcnvpEYNz6CKx6sFSdvYIcGitx9waAmPCSED09YC6a+mqs?=
 =?us-ascii?Q?zYZWGsLUClIDFaM5Ovn3Y4jCik6gjl+a2pQ3mAzBY1LurpOy2ScnmUXa+T+1?=
 =?us-ascii?Q?aQLItv2saPqfgcC97nQV1+9rS+I0IErJbHPdLmiU3qJ7rz5l0shzJsjaN0Fy?=
 =?us-ascii?Q?yzr7Xc2BT5OH5ekbedVYhO0mrjnhj/T+B5aE7vQv5yiGnPtVSgj/5+uuWhpx?=
 =?us-ascii?Q?xSMWplvvKTNLjqqtgF58zeH7/e8EC+77nqePMDg6KZj0rBmGi4c06r0/eZ7h?=
 =?us-ascii?Q?h5VOJMKd7MShpQyZhkwYe9BhGknwqpyWmfVH5rQdGWX8BbiIYsfDuNftEMBe?=
 =?us-ascii?Q?l/R3U0W7LPtnfk+Grw+rzNV+djUI/pcQi8CgdIOCrGv7MxQ/9EP6D6YUXN8X?=
 =?us-ascii?Q?3DaBtzY0bHF/h2AmwaBZsdsWbcKEJ9ij0lQpcHmONNU/sC9d+VUyx/iCFQws?=
 =?us-ascii?Q?nLQbxzaB7TcmuicJDVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mn/T1EOwfeqxEKL5rYfzVtTW24m0+NrYwr8Pt/OZRva5G2dhVwmMVkMYYUhi?=
 =?us-ascii?Q?pNyhVYJhSBAmwpzbnLUg+Zs/0G5d5xy3MSrF+JcAPeM3Oq/xzRHL56yyjKgW?=
 =?us-ascii?Q?k7sDhmImprFHvquOahrl+pr/SIBtqEVCzf/R8DVYX6B5XO1Kp9Z/Pv9NG1g3?=
 =?us-ascii?Q?4froBFGDDnFXlSoHdMrNeyXSnsF/tJI4ar1XNw2wUM9hD/F8kNTVo1yOgLeL?=
 =?us-ascii?Q?JtsSt131U0zNR+9TNTJTbwNO/IUVARG53CYQIImlpoz68ykjMA6fbRZioFf5?=
 =?us-ascii?Q?DQQlC0AqOcutyPSz1hV7RT68XG5sqZxuqS3No8jqFPFzFvv5D6r9hKCHIl9I?=
 =?us-ascii?Q?wL5pfWtWGpuU/9bw8YcfB3tIdA4GYAcNIHju+42KH3LldX3pJoyFPnH+Y/rQ?=
 =?us-ascii?Q?8ZlTvaM5fTeqBX996u2QJpZQjNeohJp3XsR9uoDPbk4MdvgUZjyOK+FHszXq?=
 =?us-ascii?Q?gR7PnKNNV6XXccoCuH9g+zAl89QmnVy8mdnVJq4lLa6wyCUC55H2vQurVhta?=
 =?us-ascii?Q?ar1Ox/Hg3WE+OAgWdCyno5c/uVKI+J4SwAOHv//1Ye+eeB7kEIJhqVVfo0DS?=
 =?us-ascii?Q?G8B3T8fYyQSUojTKtG1hCd9+CLZtBc+FUsLgLphLUGKTWxegYIFIwuavfEFD?=
 =?us-ascii?Q?qHhyay31IM83iFtAA5+cKo0i9VO25r3v4Z45q4q8wVDjlLfbics2r8PEMJzf?=
 =?us-ascii?Q?fT/ysl6JnBmih4pLZzIXtnv1vTnDly5FUKqRViKBOO5ug9Iez1tzS8sPyw7k?=
 =?us-ascii?Q?LF6eLE5w7W/lkU0fnM3o3d1Ae2cJiIW99CudOnWiamZbFXhwwLuhIr2oBvZx?=
 =?us-ascii?Q?TyvRA6L7GX9+iBGEThZCE9UWUa4vuaF55kQ66XWN0eFicndWTwk7rjG9jQ93?=
 =?us-ascii?Q?eABSTLrqMFzyR9koFDqOccqk053ep9ODp2XE5BU4/TNwsHqlczRADflvroFK?=
 =?us-ascii?Q?aCDItEPy/pCqHwMLcahHoK/bG9wQyNEP4hCFtDazXWXuisViP+RXUCZmqlRT?=
 =?us-ascii?Q?8NCXq74bEeaV2bL5xaw3KjtYeMtrK1rULAX/hmYCWzVSzOQ4hJf2QZZbtgBR?=
 =?us-ascii?Q?2q/31jMid859MtGCP/9x6VE0nrO5JozkYWow7m0O8aygbebrBMC5MT41Fs0b?=
 =?us-ascii?Q?PHzGd4qXvqFzWSKl0ObrA7m2XemRLCBu2pRMI9YQBHB5YwJxoTtw0q8IG2tz?=
 =?us-ascii?Q?TBbfMamebAvWcR9v0wcmCv4HfZrRuGecdRGURnVr4urouuR+b7pU+WBKhtvF?=
 =?us-ascii?Q?IrAjmNc13R+AfLwUH5JDjYmw879x0Qs7w8k1g0g/JpsJb0Yus+c7hlpVogvL?=
 =?us-ascii?Q?WS4Qcb509k9N7DQ7hr/SaMyjUCMsVGp3BvK8dGqOLlsdAyRuZIEKduiCym/9?=
 =?us-ascii?Q?EhEX+D+51MB59y4KFpHSJCc+C62kvIcySMl8bCfPy4TeI0yAhFrf2YBaOscI?=
 =?us-ascii?Q?pZXnJHPgLNPXSK055XSoxshgvZTNg/kqihYnzsGxf8pjWQZTu0EKQjsTD+c4?=
 =?us-ascii?Q?SbHTcq3v40j9VGU/r1IZzLGdCxorAkLbgvMJK/wRsWRYMkL7CTHe3p0NqCbm?=
 =?us-ascii?Q?u7qhFJKgQJ4mD/n1GHdw/dCPbGvp7kX3qQTyiJxM3otKe12l9Baf9zEHGoov?=
 =?us-ascii?Q?jfAS3Bs7Gm6MavK8LnMGTFS8vx49RoGsB20Is+cJkax3zFv7fysJKXEuPT9U?=
 =?us-ascii?Q?qODporKyqtQMcaAFNUdvTfnTNyRbGS0WE0Nt8PRvTASWO0MpgXvc2bkI/lDl?=
 =?us-ascii?Q?qf+yOTYjUGHZRIXTJ5MnMF531uMCHXY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfcacb1-bc2a-4bbe-5af5-08de5de5551e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:47:49.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qq4ir1YeYMii4u3kqVQgpJJQ1lpKk/KgE+bLo4TycdE7NICZjMsXyZwFG22RFZ19xLdiV6SvGgI1lTIusJF/PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Tue, Jan 27, 2026 at 12:31:00PM -0800, Matthew Brost wrote:
> On Tue, Jan 27, 2026 at 05:27:13PM +0530, Varun Gupta wrote:
> > Xe3p prefetches memory ranges and it notifies software via an additional
> > bit in the page fault descriptor that the fault was caused by prefetch.
> > The prefetch bit should only be in the reply if the page fault handling
> > was not successful, which allows the HW to avoid generating a CAT error
> > for prefetch faults.
> > 
> > Based on original patches by Brian Welty <brian.welty@intel.com> and
> > Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> > 
> > v2: Changed comment wording from "repairs" to "handling" for clarity
> >     (Matt Roper)
> > 
> > Bspec: 59311
> > Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
> >  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
> >  6 files changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index fb2904bd0abd..340d0831b752 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >  	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
> >  	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
> >  	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
> > +	DEF_STAT_STR(PREFETCH_PAGEFAULT_COUNT, "prefetch_pagefault_count"),
> 
> I'd break the stats change into a different patch.
> 
> >  	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
> >  	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
> >  	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index b92d013091d5..82e578726088 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
> >  	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > +	XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index a33ea288b907..b1b7cea26212 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
> >  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
> >  #define PFD_FAULT_TYPE		GENMASK(3, 2)
> >  #define PFD_VFID		GENMASK(9, 4)
> > -#define PFD_RSVD_1		GENMASK(11, 10)
> > +#define PFD_RSVD_1		BIT(10)
> > +#define XE3P_PFD_PREFETCH	BIT(11)
> 
> s/XE3P_PFD_PREFETCH/PFD_PREFETCH
> 
> Then...
> 
> #define PFD_PREFETCH	BIT(11)	/* Only valid on XE3P+, reserved on prior platforms */
> 
> >  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> >  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> >  
> > @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
> >  
> >  	u32 dw1;
> >  #define PFR_VFID		GENMASK(5, 0)
> > -#define PFR_RSVD_1		BIT(6)
> > +#define XE3P_PFR_PREFETCH	BIT(6)
> 
> s/XE3P_PFR_PREFETCH/PFR_PREFETCH
> 
> >  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
> >  #define PFR_ENG_CLASS		GENMASK(15, 13)
> >  #define PFR_PDATA		GENMASK(31, 16)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index 719a18187a31..b6c12e563067 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >  		FIELD_PREP(PFR_ASID, pf->consumer.asid),
> >  
> >  		FIELD_PREP(PFR_VFID, vfid) |
> > +		FIELD_PREP(XE3P_PFR_PREFETCH, pf->consumer.prefetch) |
> >  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> >  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> >  		FIELD_PREP(PFR_PDATA, pdata),
> > @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> >  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> >  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > +	pf.consumer.prefetch = FIELD_GET(XE3P_PFD_PREFETCH, msg[2]);
> >  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> >  		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> >  	else
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 34dac4280b9d..97d93ed616f9 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -223,6 +223,12 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> >  
> >  static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
> >  {
> > +	/* Don't spam log for prefetch accesses, just add to stats */
> > +	if (pf->consumer.prefetch) {
> > +		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT, 1);
> > +		return;
> > +	}
> 
> I don't get why this counter is in this increment here.
> 
> I do get why this function aborts though - no need print a fault which
> was triggered by a prefetch. So I'd move this to the call site (e.g.,
> supress error messages there) plus I'd rename PREFETCH_PAGEFAULT_COUNT
> to something more meaningful - maybe INVALID_PREFETCH_PAGEFAULT_COUNT?
> 
> Matt
> 
> > +
> >  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
> >  		   "\tFaulted Address: 0x%08x%08x\n"
> >  		   "\tFaultType: %d\n"
> > @@ -262,6 +268,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  			xe_pagefault_error_account(&pf, err);
> >  			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> >  				   ERR_PTR(err));

Missed this - also if you want to leave 'Fault response: Unsuccessful '
for prefetch cases, I think that is fine but at minimum also include the
prefetch bit in the info message. 

Matt

> > +		} else {
> > +			/*
> > +			 * Clear prefetch bit - only needed to suppress CAT errors
> > +			 * on unsuccessful handling.
> > +			 */
> > +			pf.consumer.prefetch = 0;
> >  		}
> >  
> >  		pf.producer.ops->ack_fault(&pf, err);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index d3b516407d60..4837f2b40079 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -84,8 +84,14 @@ struct xe_pagefault {
> >  		u8 engine_class;
> >  		/** @consumer.engine_instance: engine instance */
> >  		u8 engine_instance;
> > +		/**
> > +		 * @consumer.prefetch: fault is caused by HW prefetch.
> > +		 * Echo in response to suppress CAT errors on 
> > +		 * unsuccessful handling.
> > +		 */
> > +		u8 prefetch;
> >  		/** consumer.reserved: reserved bits for future expansion */
> > -		u8 reserved[7];
> > +		u8 reserved[6];
> >  	} consumer;
> >  	/**
> >  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > -- 
> > 2.43.0
> > 
