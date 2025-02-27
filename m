Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA586C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 19:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9552410E00B;
	Thu, 27 Feb 2025 19:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brOXZysK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E99E10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683096; x=1772219096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wGN0eIL6jOFNgIep8QiQlRM7Z2OJHR6frlSijawrlZk=;
 b=brOXZysK8etXQMu3OKz6te8ZQAf8kW6YBoL0bJPixGE1MOwIP7Trrjn7
 6pu19x7yDZhJHlmu2uA5MrBLlPm1bjtZEHylg/EQTHZkb9Zbh3op+mSsq
 Z0uZb/2306+XH4jS8/E1ojj4sNUsYX3a5bDTGGiWALcPBQhrqlQIlm2Zy
 E3HtJMHlrDZmjfhscbU3SMlcyGemJlRPNkh8kgT4GQfte2AKMH747B37Y
 zXc+S5AMo46VW0jZ8ufhjOZ+P5Cmqo0h8p8FZq7pAcQiAIVK799EIxcxe
 Bht2iZnbU8YlsZ7295q292P7Gfwc/Xk2DUbSRSPRUoOnN5cecoRTQYPD7 A==;
X-CSE-ConnectionGUID: VnBw0WW7TB2yafpWZiwZxg==
X-CSE-MsgGUID: iDWqppo4TxC4Ql3UCh7cBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52579822"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52579822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:03:57 -0800
X-CSE-ConnectionGUID: XETTKO0JQWiX7sxhWz6m8w==
X-CSE-MsgGUID: OHhYahWTSOqdoJ7lJA5r1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="147937058"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 11:03:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 11:03:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 11:03:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 11:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySoiW4Uilu0qSeZ+NyMS9EftCLsr1EymMy7fwz6R5NLVE4LClQ+BFcearCv7EtivxoR2x85E2QoRCz2KvsfWtqNyInumcd1Iz4i594WDAne//dxSpurH1U2A0u7zh+hvHN12VXD6MF1tuQuP22tSRB1TbejlnHZdhwt7tODqBFgANDGU3Db8CAR3/nATtG7x5XHtofRPiUsk9FKUKlIOeiUpyyZXRWL2ZF0sPtBxBbthBsqIbLBCrYcanPoIhyjeOHl4ySRaMr4bDMKWI2rkHqWAWmwI55lO8AkUhcTA9RXwNRCfOpQWZRm4dNBsOCA5SfQqdYCOdoT5pcfjCZbyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st5d4oKDsOWDU/avyHls9KtRUTtJ+Ls/a2Wkig1OnCw=;
 b=utnxqeMhEHhGl4HFa/m85dwaSEpZA96TrLa6rydBCoveMsQuxh1z6Nri8RlimPb9e/gXh7sfqjMETv8WmqlNuEpOtbS44Pk+0ypwvD39MHhPfl8JTRtni1WxIAmv1qx0Q6s5tE/MKz7JhmIZiXcqjL4Wglh8GAPA3A0rb0x7UfVva2cspHTPRH8xNS+I3tzrimAkcIYlTXKhh4nx+fccKSEE3P/xcyepH+tg/W9WZHOWQlxXWyBAHlZL3/bMxTfO2osgnAjGyhEOdNfsaQW8l+tT5S7Z/KVd9GxOFROBE140r+QMmxBr+oDXNhml/b6MFc2DPAMxjgU1InCQGQkaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 19:03:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 19:03:38 +0000
Date: Thu, 27 Feb 2025 11:03:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <20250227190335.GQ4460@mdroper-desk1.amr.corp.intel.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
 <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
 <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
 <j2cqfbthxacfqelnons5m7ltaaqkdqdrzkbuhvx6wpdexpvpt6@hmlr7ey7otv6>
 <20250227173501.GP4460@mdroper-desk1.amr.corp.intel.com>
 <6lbuqhssdm6y3vptiwoyhxapzs6oek2nueph6nuqtr5mpqglmk@6pb6cgmjfkmc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6lbuqhssdm6y3vptiwoyhxapzs6oek2nueph6nuqtr5mpqglmk@6pb6cgmjfkmc>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d4e673-0b8f-456e-0956-08dd5761712f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3DL0Dbi4bytBly3J2Hnb6KyyNw/mbHAD+2AEVOeq/FpOP4DNQ1jScp04Q3m2?=
 =?us-ascii?Q?2EfgG7hceaQQkNUej8bqpo3qfS8nbdL9jYV7/0vPZ8YoEhOjRAJ0pbNCrQrd?=
 =?us-ascii?Q?nKrn6gcNgZ66VfMX21WWr59GDU7Twr8ir6aq1nBqtl4tKRIP0avViKvQz3fB?=
 =?us-ascii?Q?J5BVI/xKzbDZd22umU0X2TW8VN5VbsvsNcM4P7KP6WbOSTnte9cISVy1U1EW?=
 =?us-ascii?Q?Zn3XZW3Bm2aCdFbWAcxilafVrCxAdGKbYg+lBxLyvT/Tr21KU+qTsjnrZsPX?=
 =?us-ascii?Q?E2cx1zAGuNeR5XVTJ0BHw9iWv/jG/z4/EPCCNctF0wP02vcnipyKwDLkruKa?=
 =?us-ascii?Q?WmyUUgBUqTeL8fRYIkeXeA0Zpc1M+FQGxd4l0CqoOLK098VbbCVm7Tsq0+WT?=
 =?us-ascii?Q?bdvO9esfyOTaLILIVpeqUNk/2lSOsGvkPWGsurjOLx52z27DsAQgJvXts0RF?=
 =?us-ascii?Q?nfsLnmcGrNWqWB66+uqaXRDt8zlHk99oO6leDvVe3+TkbUvL/DeVYB3atjKL?=
 =?us-ascii?Q?+GBeP8PvAi5oBFIeVNkHyhEBxDRvrV1D5Zr9dCyEY5Gdct2GlI1NW3UDkuuB?=
 =?us-ascii?Q?6jwzm9UbBJiJMRrmFKWvZHmQNbstJF9yowfEdnrhofF49ynN5THNQ54+iREd?=
 =?us-ascii?Q?u6tcpIavZN73V6U7g3jVrzPyXDVCiXK1yzSoJxW578sRCA1Ix1fNENCbuWiq?=
 =?us-ascii?Q?mxiNVSkGCf4sXN4OLzMY7+ATwiyzYs5ppy/3GlaaTEs2+9l8pl+BJe6A6psQ?=
 =?us-ascii?Q?fRkRHuaSPyrQHf/ZzqkeXtjNgNw+BxuxDn9wUniVr6IzfQXePvmjT/Hr2WWL?=
 =?us-ascii?Q?x68yVYLEVY73QsH7jLD3qWZldshoHTsB5Ls3vLCaWoZV7POTzj2udxgELAkr?=
 =?us-ascii?Q?PWM1YhGo+WSTTOALv1pvds96jwJW3E9GnW/pbX8QYHsWFm3aDNsLnhabFwzT?=
 =?us-ascii?Q?Dw62xKDNsvji2r+u2gn1IrxgNgHQn6YtBA6tG/e/MxgGSLIVpqTauLRupxeV?=
 =?us-ascii?Q?xDJUiyrUwCEcf99aToSBPq7eAtz+98XniFKR6H6Lv5Z+WQxFvn3m904yCVyf?=
 =?us-ascii?Q?DOZPfD/3x+KTzOic83K5akcWueby285bwYQyDxR1L6ve79x6ZtcNS26/UzWk?=
 =?us-ascii?Q?vaRprmohLzUfXyu8+Xzuk9h3Ly8p4OST//5bxqVIWN5Id6xeR2f6Us4PnEqN?=
 =?us-ascii?Q?uexDlhHam0xF8wMtz7UQY45U+hpTssSF3VI5SIsgouXIOgIo4WA3+IGjSZAC?=
 =?us-ascii?Q?FfZO0YhPylP+L7sPfjFAV/wNLrIZwhTVeucCZnIS/nzX8u/GQ6lB+hTXpcLu?=
 =?us-ascii?Q?0+N0ZbVIWzlQw/kHE4Ymjj7jZ2Lt1/rUeXD00J+F9jwwzMx9DOpL1D5m4Jqr?=
 =?us-ascii?Q?mfhEtxXWtjmnaRO919TApxpNTCIx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?70XM6zQrqMxb1HAXVcwRzOic2eD9QPR8SuSwDpMP+2RdiMoqgtzodYUhl/jE?=
 =?us-ascii?Q?oLZXV+Gtii0aRQ+js9itxVOFLqtLI7y6Ay/p0qmzS6wI1Fr8pWIcIi/kEqqf?=
 =?us-ascii?Q?Snlwocp+T6QxeHzjUpbxqafcl/iaE86T82FRT+Hwq4xCzhCBvShMrJa7Dd+V?=
 =?us-ascii?Q?qM/+lGdHGNnolbJu6hsORTFCZo6CJIrlB0tj4m43SlsV17pSVUrq2O2JGVb0?=
 =?us-ascii?Q?wtGwBPYy0LI9UVUVfJwoTS7IGg1Yi15Y4bMrfQvSM9GJNVNRQV1nfLHHUaEB?=
 =?us-ascii?Q?SHg4NaVtuPowrSxnJcx+UbNGclFW40zS0EjYFV+OfdJw3OAynKGc5jhYLKSO?=
 =?us-ascii?Q?4khWsD94LoltAUw6Ncu6yMu1Us3LY31FRxVc0Ja4o+MDAZ7qWU8juizkCovX?=
 =?us-ascii?Q?akWxUUw5ETTLhJwLFL9IR5P0LlbFR/kP7nfBss3Jm5yAmcyNb+aTmF3wCgJ7?=
 =?us-ascii?Q?lFVUhS4Kc/R4aIeV14bhDtYKqLMDqO3MgYfiEvuiz9Swf7IO7Vw/DqxyZjEe?=
 =?us-ascii?Q?mNmyA4GWa6gUJ1ywV1Ph6DUBelemq82VrYFhxLtnlXfFq4rbhZP3nA8AMEgB?=
 =?us-ascii?Q?99gAcBLL9dT/XBdDRejBIU46t+r70g3jueHMl7oVo9O18PaNfuL/d7+i0usV?=
 =?us-ascii?Q?sF97e5jxlGkdhJ1T243aGGSSp9pf6e6Rbnl224gpsk0ZlV+4vYNZ+np6WaEE?=
 =?us-ascii?Q?MzLVqzpl+fDnMcXS+EhLtY0ZHS4S3XWm71yw4ci5VMzFNpldT6CsAv+w/+H0?=
 =?us-ascii?Q?31S17zhqh5dy6GtH7hcQ4zyyRubYLwRru5z9l2n8dmFBF2F6COaJ2/EjMx1O?=
 =?us-ascii?Q?9D1QqO2xt1BQDGCPGTEetsrJ9wF86WjEjdSOX+AjPLSVyxMhird8nYWYSAnF?=
 =?us-ascii?Q?5kZlm3mfIa9mGAebVLpNZX8Souw8MKvu3Q1BokldFLEzyraWOnQg5FplOArb?=
 =?us-ascii?Q?HRrc8vbEzNXIWAKpjNsCfmypObDr0BYJtnAf6HtvsiyWNo7a4j7d0G6cpl1t?=
 =?us-ascii?Q?HqE4/IO9GhosN8boxVWa+rLfkAboNLRLVjoNeVmTrZYKQhTkS579Na8ngRDa?=
 =?us-ascii?Q?h5HPbSUX7bQpKkevzh8E6Fw+2u8uK0jwSF7lIWSXNrbhhs8f5lDZPEdOO/SO?=
 =?us-ascii?Q?AVxZ9D/hwhsS3RHrUrgtuDPK+HmWIpBDW9a5P0+1azl5eC81JHNd37SAGdVF?=
 =?us-ascii?Q?YfdtE6DnPr3ZlZlCzcr9VVpVavTQbeM53RDlFFiXpbrIfZ8lW10+XaizyVN5?=
 =?us-ascii?Q?knzkt71fsoTuWl/h0WV8ZM0KcIW87kEt8Mvoow3Ng9cbReV8+Goo2Z7acfNA?=
 =?us-ascii?Q?bH22KqlV6z4njfn2h8Nma501IGPeMmSicGQfsgZ2mAZ6YCuurDo5TkLPGLvj?=
 =?us-ascii?Q?z99yQXVE+8atzb+EFh9m1AOxgrThyL0Wl2krO4KTjVnXtUTRyIlbBDtcQkt+?=
 =?us-ascii?Q?jpjGqFbRWDQPbM+/stSrn+gOSYHZMTh3NMq78ZmoKbzBj8VIbxUY31OVDwsH?=
 =?us-ascii?Q?Rb9Zi0MIhu0vq77ubQGTT+lBlxCo/c09XFwCC8hIYdnls96oIFtXAurmNBAp?=
 =?us-ascii?Q?SAKiRPQ/4gUgOendBpw6AHlACITDCNRTuQ2GtZJsFO5DsL0TScxz+zVCkOrr?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d4e673-0b8f-456e-0956-08dd5761712f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:03:38.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbdrEF1hakGQZ8OD3lKVhqvqhxdGawbfxIWDdByyVcGsgj6Js8X0lkKJW0rXUiwECN8CsZh43+aBJrPrNP9afN1iERZXqBCtFZDKJSdVsnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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

On Thu, Feb 27, 2025 at 12:38:18PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 27, 2025 at 09:35:01AM -0800, Matt Roper wrote:
> > On Wed, Feb 26, 2025 at 10:47:52PM -0600, Lucas De Marchi wrote:
> > > On Wed, Feb 26, 2025 at 01:59:44PM -0800, Matt Roper wrote:
> > > > On Wed, Feb 26, 2025 at 11:20:16AM -0600, Lucas De Marchi wrote:
> > > > > On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
> > > > > > Any rules using engine matching are currently broken due RTP processing
> > > > > > happening too in early init, before the list of hardware engines has been
> > > > > > initialised.
> > > > > >
> > > > > > Fix this by moving workaround processing to later in the driver probe
> > > > > > sequence, to just before the processed list is used for the first time.
> > > > > >
> > > > > > Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
> > > > > > should be present while we see, before:
> > > > > >
> > > > > > GT Workarounds
> > > > > >     14011059788
> > > > > >     14015795083
> > > > > >
> > > > > > And with the patch:
> > > > > >
> > > > > > GT Workarounds
> > > > > >     14011060649
> > > > > >     14011059788
> > > > > >     14015795083
> > > > > >
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > >
> > > > > Cc: <stable@vger.kernel.org> # v6.11+
> > > > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > >
> > > > > The version in Cc stable is because it's what matters for officially
> > > > > supported HW by xe.
> > > > >
> > > > > We've been using the reset domain to decide if a WA is an engine vs gt
> > > > > workaround. Although I'm thinking if it wouldn't be better to simply
> > > > > drop the FOREACH_ENGINE processing and move those workarounds to be
> > > > > engine workarounds. Matt, any thoughts?
> > > >
> > > > That's a common mistake we've made in the past --- it doesn't work.  If
> > > > you try to put a bunch of these registers onto the GuC's save/restore
> > > > list as happens with engine workarounds, the GuC will throw an assertion
> > > > and fail to load because it considers them to be outside the very narrow
> > > > set of register ranges it's allowed to work with.
> > > 
> > > but that's a GuC issue that we would try to fix? at least for new
> > > platforms. if the register is in the mmio space for
> > > that engine, why would GuC do that?
> > 
> > No, that's intentional behavior.  Just because something is inside a
> > register's MMIO space doesn't mean the GuC should be re-programming it
> > on resets.  The proper behavior for re-applying workarounds really comes
> > down to the register's reset behavior (whether it's wiped by resets or
> > not) and that's based on the sub-unit of hardware it lives inside, not
> > where it falls in the MMIO space.  If the KMD asks the GuC to reprogram
> > something that it shouldn't be, that's considered a KMD bug and the
> > GuC's assertion is there to catch that.  It's a safety net to make sure
> > the GuC isn't accidentally touching parts of hardware it has no need to.
> > I might be misremembering, but I seem to recall that there may even be
> > some hardware enforcement to prevent the GuC microcontroller from
> > touching such register ranges on certain platforms.
> 
> I have to disagree here. It's absolutely necessary that it be *at least*
> at the reset domain level. You can't add something to be programmed on
> gt reset if the register is reset together with the engine. However the
> opposite is not true. For me it make makes total sense to add some
> registers there even if the current hardware happens to preserve them
> across engine resets.

These are two different things --- conceptually you can restore a
register more often than is necessary due to the hardware's reset
characteristics.  But that's completely independent of the security
policy about which subset of registers the GuC microcontroller is
allowed to touch.  The platform architects decided that the GuC can only
touch specifically whitelisted-ranges of registers (this is a different
whitelist than the UMD whitelist we control with the driver).  That
security policy is enforced by the GuC firmware (and possibly by the
hardware as well on some platforms, although I'm not positive about
that).

If we had a way of saving/restoring these registers without using the
GuC, then sure it would be fine to stick them on the engine reset list.
But since the KMD doesn't have visibility of engine resets at the proper
time and only the GuC scheduler is in charge of that, only the GuC
firmware can save/restore those registers.  And by extension, that means
that we shouldn't be putting any registers on that list that the GuC is
not allowed to touch.



Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > So no, unfortunately these do need to remain "GT" workarounds, even
> > > > though they need to be applied to registers that have per-engine
> > > > instances.  :-(
> > > >
> > > >
> > > > Matt
> > > >
> > > > >
> > > > > thanks
> > > > > Lucas De Marchi
> > > > >
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > > > > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > index 650a0ee56e97..d59c03bc05b7 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > > > 	if (err)
> > > > > > 		return err;
> > > > > >
> > > > > > -	xe_wa_process_gt(gt);
> > > > > > 	xe_wa_process_oob(gt);
> > > > > > -	xe_tuning_process_gt(gt);
> > > > > >
> > > > > > 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> > > > > > 	spin_lock_init(&gt->global_invl_lock);
> > > > > > @@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
> > > > > > 	}
> > > > > >
> > > > > > 	xe_gt_mcr_set_implicit_defaults(gt);
> > > > > > +	xe_wa_process_gt(gt);
> > > > > > +	xe_tuning_process_gt(gt);
> > > > > > 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> > > > > >
> > > > > > 	err = xe_gt_clock_init(gt);
> > > > > > --
> > > > > > 2.48.0
> > > > > >
> > > >
> > > > --
> > > > Matt Roper
> > > > Graphics Software Engineer
> > > > Linux GPU Platform Enablement
> > > > Intel Corporation
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
