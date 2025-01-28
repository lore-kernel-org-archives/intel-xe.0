Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E187C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448A910E0C2;
	Tue, 28 Jan 2025 23:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ju6sLsMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEFC10E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738106936; x=1769642936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iKRxRdjGUZYonrpLdHhyjAd3zsm3l23xoXlNRh2/lFE=;
 b=ju6sLsMoaFHzwgX5cLrQBZCPpVN4pCHmxGYpBNbK3yzKEvVWg6NYmzNO
 N+Kllh4Mnye1E1LDZyWZZkBLbmZMqU/ntkunUEFsKq3mWD9b7Vf7B9vLt
 qXqsJVevA36KrJkaBFFWII6Dsw7rVy/tCg9xHxioDb7wmNbPciCZ4meFk
 f9T8JFvlxy78zG7zAdi9g43ddmcMBfzw4YrD1TCYlIURA0s+w++hwulVl
 Lh/Gg0JnpXMoxLw+sDAPJdq9MDkikS8ZG3ZvL7x14X386jh+doSfcoQcM
 nIGsNk93/LWJyjhxZ8TAizzSrkHDNOMIPcrCSa2d6HcOCx5593oUWwNn2 g==;
X-CSE-ConnectionGUID: xaLltqO8QeWw8yeApHqhJg==
X-CSE-MsgGUID: l7+uYazxTNGLpqtaSAQ8MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49996613"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="49996613"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:28:55 -0800
X-CSE-ConnectionGUID: mYEr1g4dQgygRX3HIz7rwQ==
X-CSE-MsgGUID: OG8u5a/KQo6ubgf8TKEfkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="108759245"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:28:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:28:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:28:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnOl0TZ5adF/2qS0d4xxJkBa675HQUnbiQQdRtDOHighK2jA5pi86bgbdLkG1Hu9AvJ2WIY26ld4CO9Q+8uSXNvAA0duPBQL3VrTzr5ohr727ZopLbl62mUU9L1VtM0LLGbFIS0hl0nwbxIeygzJonhWdmFiUqecLAr6dyF1d1vjnSZ+Rjmn60v+N+ArKd/mvxxGRnYO4E4CdgW1CqfRoJe9bMME/0pa5kBxX80tY3ulqgGOaQ1CsFbVT8ch1Hrd6zh0Zx33+8jbChMOBMwyi8r8h4PuQ55pekHheR9K5zD8N39SFAo5bu57nuZfstrM4fCIdILvjhCjwRkPcX8G/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qomwo4nkz0enRScQPAKNHrkX01PBcH0zESISWDoL3Rk=;
 b=J3ITWcDn4lk2LjQrwcEPGIM3l4C0+PmUydvZhXgKDPsIIRWL64UF8U3oHpPgFg4C8prmimYW5pVkyyZe8y/I/AfDl9Vu+XXvMTbPQSZLNF0fr9lEQBtPCGycfcQ8QLTV3xvJiG4CRWs/KOruu3zCWyopODlZLOwYD1bfI7rX+1RzAkuLi/Qpvv0J9wObSDrNXFxyEUNPVA2mxiyihimfd693535pq4VL9lIUiOTWqETpJegKnCrcGgj0dz5UqWq26mZagU9hG1INFEwYYyOsrZMtCRiV1+jh+1kIK7r1xeXhwIbIZVoAFbqgNHRmJ6TnP4TSDTG5FEURXZYUSAMIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 23:28:25 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:28:24 +0000
Date: Tue, 28 Jan 2025 18:28:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Update the PTL pci id table
Message-ID: <Z5loFT6G6wglxC_L@intel.com>
References: <20250128175102.45797-1-matthew.s.atwood@intel.com>
 <a140e73d8ad03f4e5a00a679a3fd102756c87d2c.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a140e73d8ad03f4e5a00a679a3fd102756c87d2c.camel@intel.com>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b4c421-322e-4874-7e6d-08dd3ff375bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2rjlK6UQ2aMxLY2pnox3dLfWQYwddRxxbpwuzGquut8uhbL6WBEctNZnMrsn?=
 =?us-ascii?Q?kC1vNXhG7vhQ2IOQOAHGyB3wD+kE814Nq/lfCqpEnXhAiLnEjBCPFMM1lqoT?=
 =?us-ascii?Q?LwGJvATAv2vYrG0tnAzRl9Z78ybagWjoqnjEv2JCASjGwdU4VhEf5K2jUdn9?=
 =?us-ascii?Q?VXk3pJ5inq9il/xtp9Qs0t5U+S2bhqlpb3RJooYEg66sMsvZl9ByVSkqncOR?=
 =?us-ascii?Q?NGhkCI3us5eqZh0MYUMLgDpbGu1pMgx1yRWN+kWiyqLj+MwSgEHP2WSjBezJ?=
 =?us-ascii?Q?DJqwIA44X7tSV6H8h7pja8NCPCpnfironkAFHdTTj8PfJJbHQjMgU2pSU1qa?=
 =?us-ascii?Q?6OqUrNLfMrAqbP9PB/0ZIkh71b/V8n5BgUZlSP3jog1JDBtg451ij48ZEsix?=
 =?us-ascii?Q?KbyTNjWnhmh27QFtmgWvPK390lRUaAI1Q1tCrnL7F0Pg+L1qyRc1nBGEsI/4?=
 =?us-ascii?Q?EnqxvM9viPbERxOR8pJDCE0mpStv8bL4YetnJm2/roSEazlPMYjDku9lmg62?=
 =?us-ascii?Q?FshAmbGjSwn54p6IzlwXoc2oqAjzwRUOwSA3EjccxAB39urFeFbbCmNSvirv?=
 =?us-ascii?Q?FP/GCGC0vZadElel4XC4gFuSwVMx49EF5ODQedBc8y8mlAD8UosjD8UBnaZu?=
 =?us-ascii?Q?ef0mR1wIO4+ER3IB8quuu8AR8W+froLVhjsb/DfYgTUXW0+v+EPCodWapy9b?=
 =?us-ascii?Q?JuHxycYe824lzzBmLI3ayDZS/rmoluvwPQlEYGw17ZVtl7DZVEDPO9Iu6UMz?=
 =?us-ascii?Q?fO756QruWqUYv9ecOKwLAy2eI3ZNgVEFF+FGUWC6XGRJwsm7QzqJgzyLRKI7?=
 =?us-ascii?Q?xYCn7NAIldAPp8xyw4ozZP2B+BWoykRAwA9O0u/3VSVk/F8O/31qqoF6TkgR?=
 =?us-ascii?Q?g71FhmR6RTfVZAwKlRGDT7N63DJk0TNGqL8YE4JuE2vF2WT8ISXpSXQ1Ap7k?=
 =?us-ascii?Q?vfNz8dVRjlejK3642MjoaUeHM6ak2w0jb6DOtRKgrXZ0a2jvBrL7ngbvpomV?=
 =?us-ascii?Q?u3qywZ/PSt8qkpIoCJmMAwNbqrMEOfToRKvFDGCvnepbw4tiBSs+wuw0Qnwz?=
 =?us-ascii?Q?IstwuCUvwP0WOIAhy/Lj04a7Xwajp4tY8EcJTEjArTWyVCdqIwyTfe7UH/9a?=
 =?us-ascii?Q?fKRtyPgrXZDMwAMweDMdYlEq6MDRvA0yzdB4fA5Rv7wDwRjFzCNh2ztqe9xu?=
 =?us-ascii?Q?9G8yLNCXC2vDDN9DuDNsB0QhGeZfyY+ZKt6c3fPy1xRVXbgm0opoSDaEf1yK?=
 =?us-ascii?Q?gmOtf7MMwwJqSmDd1ulpPGAv1uzjSbJpd2tqLEaaKtnB8GUiihShjadgaSfI?=
 =?us-ascii?Q?wNe4MQ97vEBTHWuULupXWjOowhD8UGr4KJzYveOPPt93FeayNizERsf5GQAp?=
 =?us-ascii?Q?lOBCTxokQz2U7CxZJMUqcwzKVgNR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yDwNDA/aE+bj2muwZ74AkXpjiLlb7wSfaelGyrb/ZQnw1ttHtXMI4LzeLkYo?=
 =?us-ascii?Q?UE6sxb1asQjO2Y59lCIJ074BcM6eAOzheIOd4Li/lrMXomtN6RAoO9JCXKEZ?=
 =?us-ascii?Q?Kh4BXtcyBmK9k//HhYr220vkZWuZi6GwJO8T+PATls9qV1DhpNuyFWNSh75x?=
 =?us-ascii?Q?28HUPoiSRaqUIsc4kjm4wxAiZ9gUd2OMOdpqWKkTjN/iQFvvSjnyy0MW31B5?=
 =?us-ascii?Q?bigThD9765qaI0inQinr5xkQO3mZbCpWCo3ge/R2TLFwdD66otYFWrBerPa7?=
 =?us-ascii?Q?BmSQT+wldUnTBYSKV0rP1YpxCl1ZILrX2fEuKU8GEVM39OdOGwpVFFCXTJLc?=
 =?us-ascii?Q?PwRupZ5eJ4XZ4MLcAUfqkRKKJxtdZB7t2vxc/8R7w6vpfdrXMbTe6B+eBZY8?=
 =?us-ascii?Q?lWIUdvk/SduJp2VMj1RY5AWG88eg1M71v53pdhogtgEcflHTMWgzJnQTTEmH?=
 =?us-ascii?Q?UyDZq9DxvWIseVWn8bXsRtlW0VCAEf6e2FRwDGIkNR4WLesFTIe/zh+hMfms?=
 =?us-ascii?Q?3QqHf7+51Bggd13MBHIdDdOa1AUyonrnjQr17J3FqE5gpiCjFpGIsrNyZJyC?=
 =?us-ascii?Q?uKQUxDvWBEIizUKhOql0tlivDhBODIWQDtl+uF5jIPL7lHmvTg4DG/j95jfk?=
 =?us-ascii?Q?AgtJUANuHQpT81YX6onv53OAQB/vO5c880YyGByaBr8Qen+11q9+Wfu2b+7h?=
 =?us-ascii?Q?Of+ZtpMRdRtsZnD8yOYueuEDnJ+ny5rUt0HbBiXiAphli0Y+k85nX8TZN7dq?=
 =?us-ascii?Q?CCkCBKN750obcEAYIotIIydrs10muSgN1g45AkR1fLChhF0xZ84/qCp3NcI/?=
 =?us-ascii?Q?Xtw7nLVuL9/IaTAzdPiHoIoWHEtXQEIVfh1evsmbS1chfsetdKuamjMiZk7B?=
 =?us-ascii?Q?tfMF/07clbSxd4j2QAkIaD73fL39WKgC0JaD4TKqpNkRIVMZ+2g3/27EgDlF?=
 =?us-ascii?Q?undOZIvHdzbRcCdKAmXuHZkxJDFaOGg444X+/L+K58oO8j7VNHbT1U1VmwPZ?=
 =?us-ascii?Q?YTr2W3URcm3L0M1vjeDJg+OzPmmRc242cHAsadeir6HCkPk6m1Fa4+FltEqe?=
 =?us-ascii?Q?KcT/VXUr47yc/Wo/TQ+sk5l0Tawy/78mbZfj9EreOc0V0gOtUbslpWxGS4bm?=
 =?us-ascii?Q?77Tq7wpUtHT6ZX/M5XFW8o7TfzZ0AeCw3PlVKjT/ySspqGb7A3GHOxmbkqp0?=
 =?us-ascii?Q?VczLVgzclw3cr9ZdgYlo7IunvuDcrMBPuIeB8SREfvuKuNqaeajPnvZUNBaW?=
 =?us-ascii?Q?dFyV7APMcTXmpe7aUqmHPs4aCe+ZJv1xZPnoR7jLvXpO7o3KAgGpyohrRzG5?=
 =?us-ascii?Q?qCWiufqeqLUmv5kAsjKbI4Us6n1tl10tw/G8856mYs1QUp7KUEMIUgv4R10q?=
 =?us-ascii?Q?iVnmw6Sk8W1YW+ac8zAUalOBeyEh3dCd5CDRLrM65iU9x3ZYIwof1Wd2It8/?=
 =?us-ascii?Q?BOu33bT3srDj7w3Xl7eBc7isHUIBM9cxnb3MM+PRyHkY+U9R8QgGm47elU+E?=
 =?us-ascii?Q?GqJIBnZi7RuKUEh1LU8tAfAjB9ewafSKOkJiywFdd/f3uxn3u1Q00sdy3Hx1?=
 =?us-ascii?Q?SSgjNq4nhs+xY1dJpLjhH0U4HM1YXcvguvhbrz0/2R2VG0Iei3Q49RGf6ZlF?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b4c421-322e-4874-7e6d-08dd3ff375bd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:28:24.3973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRU65b+tACu4KEi40Lzas7jzDefOh3RnWv2liFQ2jSbImdhOymbo6mCp5Qvj6VNZdn2OzpI2XgPN7l0WeGwXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

On Tue, Jan 28, 2025 at 10:51:50PM +0000, Taylor, Clinton A wrote:
> Matches current table in BSPEC
> 
> Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

pushed to drm-xe-next, thank you both

> 
> -Clint
> 
> On Tue, 2025-01-28 at 09:51 -0800, Matt Atwood wrote:
> > Update to current bspec table.
> > 
> > Bspec: 72574
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  include/drm/intel/pciids.h | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 9c3a339e26af..70b75e31edff 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -856,12 +856,10 @@
> >  	MACRO__(0xB080, ## __VA_ARGS__), \
> >  	MACRO__(0xB081, ## __VA_ARGS__), \
> >  	MACRO__(0xB082, ## __VA_ARGS__), \
> > +	MACRO__(0xB083, ## __VA_ARGS__), \
> > +	MACRO__(0xB08F, ## __VA_ARGS__), \
> >  	MACRO__(0xB090, ## __VA_ARGS__), \
> > -	MACRO__(0xB091, ## __VA_ARGS__), \
> > -	MACRO__(0xB092, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A2, ## __VA_ARGS__), \
> >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> >  
> >  #endif /* __PCIIDS_H__ */
