Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00628CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D510E1EB;
	Tue, 29 Sep 2026 19:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqQwTyq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEB210E1EB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790711933; x=1822247933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3yv2Ezu5Aonl6hPdSYdt8/3f3Jvi2a6Tjz11HCYAYOM=;
 b=aqQwTyq7VpByA60kCdzpmegeVWligTHunFPHmr2Ft1ZdTBuBNXrKH5wv
 bRgGQD9c0kBoBnKMD9qQhdsTVa2qe9vflq7ks2PcbMxr/8e7PfJoIZdc9
 w5F3xA1C8CONtOMd15pRWK3cIu20SpkA4uncdlTiNGQVuX6Dg26tDH4O2
 J7myLgU2hYrqAQdHGpcD0TCXjXcR4HzBM+/fkqSVfVIYILO46TqBjMIAd
 lpujOhurub9LZEndQ9z4LXKhr2IT9bP77xO79iuw3nko8gKWY2I+q0m9Y
 RvB17k2pDHQvZy0rUsvFV1Qa3o0eG8+uAFBZgLZc+q7K4tp7fwXOp/WfF Q==;
X-CSE-ConnectionGUID: gii7NonrQiGZoUIEJBv42w==
X-CSE-MsgGUID: rNLR3+xqSom+XVgW7hOrDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108930733"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="108930733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:58:52 -0700
X-CSE-ConnectionGUID: Qk8jV6oyRh2k7hxIWbtTog==
X-CSE-MsgGUID: dx2anyFmSPKgzSG4VigiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="280222985"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:58:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:58:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:58:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzWHEimZSVTLvzbCsYeJNfxxzDVHxhyeMxtE1HacVXGuXG/ebIyQ/Isi/2xhK3Rjj0pWiz/RHaoVpOjFsXvgOWoCExLYQuhM2uLm1licszHP+hNGElWZFJRztdoScx0IBN5NiSfPA3w9Oed8qj7wDRT98vDG2Y9sUfwaaWJEPUqCsMbQYcIJMc2vMg3iEADBhhVL3H3h+5Ns3K4lZp/u8OUmW5eB5rumcFPuHHPN9evwtEZFbYGs4lxZoKv0vqzU+CtUku4zF/kXOHiLimrAAa7UPvUUAROz5ocCyyl7aBh6AOLOCsnbQAa3Az9MrEyV1wqo9trFZVNPr9v9+K0XAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJORXO4j+wLEfKXWpdWz4W+e1iNVkzsum43KtFNq4NI=;
 b=AZxnZc+DMcRz1oU5M6g3Fn20XlndtE+82D8EbFk7t0Jni/GoAZQUtnQiz5nWqxZR3DmMWCAXslAEi+cC+OtkfoKY01tevs16MU7cTq+sMJs1pz+7bvU97P/nWoqQFvHdipuB9ucL/SbA6YRWgEG6miQJjvZW3LS3PkfsbdGNAnc7gkXzKBjzn6TyXoIg/7DPUeeQqEhVE7HPJd42LgJ99mQBf9ib+JdV7Obuzb8iBXATeU9KXzu64y4RhGoafJcqlsF7314PM1D+LsTMF74Q/DowkA5ZRZ1qAUgUpQOfOoHXQLBOPFOj81HeU3A3WP15W7mXZauri/E/Ot73TXurUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DSWPR11MB9822.namprd11.prod.outlook.com (2603:10b6:8:4e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:58:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 19:58:50 +0000
Date: Tue, 29 Sep 2026 12:58:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Force non-compressible memory reads to 256B
 overfetches
Message-ID: <20260929195848.GN730887@mdroper-desk1.amr.corp.intel.com>
References: <20260923210802.297468-1-daniel.charles@intel.com>
 <677c0fa4-b9a2-4fa7-8e57-04b235d5e5b3@intel.com>
 <20260924150422.GG730887@mdroper-desk1.amr.corp.intel.com>
 <731a8c07-333f-43a4-90d6-8f2fd86a498a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <731a8c07-333f-43a4-90d6-8f2fd86a498a@intel.com>
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DSWPR11MB9822:EE_
X-MS-Office365-Filtering-Correlation-Id: a30390d4-c9f7-456f-12bb-08df1e6414ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ybth0SuTW9Ct+x9XorWL3byr3I+Xx7mEbZIwPHy/zq9wqlIyxrT0VGPELrKasU2wBYY6ceJhyV5j9GT09gI5tgpZf5wdzCsEgTQkc2Y38ShTBMUPbGRR/zXtF9Yub42LtF2sdb2eX91Thy8RinUXetMeYBZovaQED94ZVSmsC1kcnqVZ0biV/98QOXShJAwlfhoZ+7GwWZGBtkSAu4r07f4K3eA+hGshohY0zAkXpI91T9jTuljl2dXlM6h5e3IY2j4N4kgC5eshYZGeModDBwnVFrZwPLG9K2WsrlcFnDxyJ++qmpA75yZkshWnU1PnKw0Kqu6gNzr55Nr2W4pSygsPiA1x/7blnZVTvXJ9Rv6kSbxDvHKZ4pa1W/bITC09vplXtt0HjvCqsW6x6T12poZ1f1hol1bc2WsrDw/5hQNHGTFFk1gUDHj3wwixfbQ7yiXUVzu37ttNCmUFFaRIxPQtETMSd8qE+8eXnEfmyYI0PRmBf4bJqCiCbShIo14Ap3YaC0rksla3GPQhPPvCnM55cj3CiY6OYWQNUTQEl2SOB5pJJpJB5joeioMH78OwWdJhAY/lp/2i3ZvOrtUD76tcYinlaNwSG4K/KjK0uS4Oj53/BOl/E7N5zx27woAOUJtGBPAU515nXgQGwFHRoldX+4LOTtIJ89wSDt/tm70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZsGBux7NDGjsT5P0jOxRI9811M3rXWsSFpp5f9ZQBIl7sjQGxGkri63G0f/?=
 =?us-ascii?Q?fmtbwxMP/6RfH8wuF208raK5iYitppR7vUjjoCzmglTeWEG88tkHoHHC3cUr?=
 =?us-ascii?Q?qC3yUXIzaJ+gSMyQjp29z3Z7D678VH1LKu9woMQcYygXWMAo/EJ6k7vwJ8Lj?=
 =?us-ascii?Q?jRx0leEsHWi0lOdaxIRj5GkgiKYR9BgMC9JCw8nY6rhYb2smsVQAMhvI06VV?=
 =?us-ascii?Q?tCqiDB3+4pcRSFSzxZG7KqO6iYGUhcxPyTUM/JmONd6RqHJCm8mCMsx2r0Pm?=
 =?us-ascii?Q?7DjPH2HyVGUdfHnmsplaW94JUWkzs55YjPd79Nt+nGk1p7Rid7CUQlluaPfp?=
 =?us-ascii?Q?ZytjC2GvAfgnb+V9f/01QFHbXnNu0jwG7KRbw6X56A1485dfnEWs3o2Grt/v?=
 =?us-ascii?Q?kofVwekbMJgG3ZUQVGvgazGzTH3EJ1KHCBXd7hqKMnbdM49lNLdQ+mY31dIi?=
 =?us-ascii?Q?t5Rv9vDJ1vk4RMNi8oS8ALcjJPq1G1rBMBlnGrM61EyaTOjllEJcTRCRcGpV?=
 =?us-ascii?Q?NHDwUZsueuejFHS4gZyVtgswSX1S05Xra9cl2OzYJNF/LFvgGkPVgWJ85lmX?=
 =?us-ascii?Q?f56/PNz7M0oBPTw0mrYu1NBp9ZOd6TRxPUBWMx6DnolDPBnMVMj9Kc2AFetq?=
 =?us-ascii?Q?kwRC0HSoBzdpSmc5V9Je/3TKA0/ftxzKtFVUxTWERq6dJKxPoaABmzm1VKnc?=
 =?us-ascii?Q?TtrViIWgn+F+GDQ3m1++LIVHDfBt9jAjfNnjeN8zsy5YgCGLPvmPzSHe+JXu?=
 =?us-ascii?Q?5jAyTDcVZ1GR+lENCsKSu1CWdHmUT2yrUZ85ZWF+074aWWzAxKLxSzLYqmk8?=
 =?us-ascii?Q?FiZ+BnMdmNYHmbRYpBgTJYtMddi3jB9Fk/WZVLw3NuRGApMsb0eGPIurtzvJ?=
 =?us-ascii?Q?RkOiAWUXeE5JehQrwEfxYZTi2hbsmnmDDyURkBh8Ku/fxK6ULpHBQq29HNQW?=
 =?us-ascii?Q?ma2NwKD/qx4d/bwZyfcj6kYNNWT+F9q8JVfP01+5GZcfbKf06Io96uuAdVxa?=
 =?us-ascii?Q?fvRosi/9Y3wsFi4xIFunKkqRhMAPr8i//vj/DBhdiIpYagZogA6HxbIfQRFD?=
 =?us-ascii?Q?usGuaqm55MyQ55yueii55NbpXjluk9O6wwNyF+PsU2yROFH8piuP+zfcB2++?=
 =?us-ascii?Q?S+z4AJFjV6I+uJYpUdlCIQ0JUdfPBi3mNhoEE2i8rtckxsXTu91CzmBtQ69J?=
 =?us-ascii?Q?oFAHA3bcDUB2hwofzN92NT1MUAuNBvWNnvMha9wyXS4yyMzfZ1g0qC4NN3gh?=
 =?us-ascii?Q?+P6gH2808/4dtJWymMb8G5vUZqoEs0pHKE3LM/HoXYc2WMjf0oV669m3hr1R?=
 =?us-ascii?Q?53xynq7nqf2u30HZSSaT6WYck3NvsaDhy5XbT/aFfmAuhRZCoEqOCQyf2AW6?=
 =?us-ascii?Q?bBaAD0qGMSDa2218KMBqGweve4D4qVSjgGeYySu0sG+jTxgVrKDdU8IuJTRk?=
 =?us-ascii?Q?iFCnivvthzTc5Bc1SG982mGbY0gLyyeeV5uESw0I67u1tYUvBiNCmL0s1+YH?=
 =?us-ascii?Q?04uGbX37ZO896kDxnSkWcB2AmyFJg1Mx9ToXwhGZ0NLGYZnST9bMvdUa3x/h?=
 =?us-ascii?Q?0p6BiYKZTwVEU8UVxwpA4yzp7UuEbRRdCaSEDI7I0Wx9nOWKVj+s4iLmOBHG?=
 =?us-ascii?Q?hTHRxcvCxpEkA9WN62V5xlpHNwjDDt2kNqe1rBe/Mv6wmWCXiq7R7r8ULVxM?=
 =?us-ascii?Q?HtBtM3Pm8Kw/Dz4KEu3jXeh/uGCz91E9svTLNdo8Erfs/mPm0yFvDMXKiaHM?=
 =?us-ascii?Q?J7wC5FiuOBV0oUYIJ6/Wjd29UVgdkqY=3D?=
X-Exchange-RoutingPolicyChecked: aT90FImspjG4WbGZ3TIPxpGpJxzACY0zW2zBJ5HJSDaGfrXBJ0ic+IM2CeETJiB07XgrqUswReRKxGWnanbyTlVICjC12lJ+a7+N1CxgXWZndluzlZzI+Uj7ZPRAAtrXFc8sgiFCDDYucb4SKGB7sXyLyiQV+h+ZM4pdOCmSTUTF5JaNkFpC7TezJreVQkhXf8rlbsyte4deNjdjeEh3ugAln9cvD5QR2ioO+FILnPbhVmfn1TscBtJI686QmUFoRb0ivktFEEhZeh5LcTOy+zOGDKYjV9xBWXavdhRO0xUIEy+Ye/cs51x61ISLUyJjtGyZaWQZTP1ghey2Na8Xdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a30390d4-c9f7-456f-12bb-08df1e6414ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:58:50.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APheCjcW++XwowxueuzlwoMz1zJY+M3lxUdl1Z5Y/5Yp1f2lFzIoEZQt+BiQKjDKHxlKnlXkCS21p3qIz25ATM1EDoFNv5OTv3OSX0iA/ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9822
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

On Thu, Sep 24, 2026 at 05:35:46PM -0700, Daniel Charles wrote:
> 
> On 9/24/2026 8:04 AM, Matt Roper wrote:
> > On Thu, Sep 24, 2026 at 12:13:13PM +0300, Lionel Landwerlin wrote:
> > > On 24/09/2026 00:08, Daniel Charles wrote:
> > > > Add a tuning entry to set bit 14 (NONCOMPMEMRD256BOVRFETCHEN) of
> > > > L3SQCREG2 for Xe3p and later platforms.
> > > > 
> > > > BSpec: 72161, 59927
> > > > 
> > > > Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > > >    drivers/gpu/drm/xe/xe_tuning.c       | 4 ++++
> > > >    2 files changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > index 2e059cb36c82d..7061b035d3c12 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > @@ -468,6 +468,7 @@
> > > >    #define   L3_SQ_DISABLE_COAMA_2WAY_COH		REG_BIT(30)
> > > >    #define   L3_SQ_DISABLE_COAMA			REG_BIT(22)
> > > >    #define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> > > > +#define   NONCOMPMEMRD256BOVRFETCHEN		REG_BIT(14)
> > > 
> > > The BSpec page says bit14 is named MEMRD256BOVRFETCHEN, the bit you appear
> > > to want to modify is bit 26.
> > > 
> > > But the documentation says it should be 0 and I think all software want it
> > > to stay that way, otherwise this might trigger pagefaults.
> > The tuning page has had the same guidance for all platforms from Xe2
> > through Xe3p:
> >   - Set bit 14 (MEMRD256BOVRFETCHEN) to 1
> >   - Set bit 20 (COMPMEMRD256BOVRFETCHEN) to 1
> >   - Set bit 17 (MEMRDOVRFETCHDIS) to 0 (already the hw default)
> >   - Set bit 26 (MEMRDNONCOMPOVRFETCHDIS) to 0 (already the hw default)
> > 
> > But in Xe3p, some of the register bits were restructured and moved
> > around.  Bit 14 has changed from MEMRD256BOVRFETCHEN to
> > NONCOMPMEMRD256BOVRFETCHEN, which seems to basically be an inverted
> > version of what used to be bit 26 (and bit 26 is something completely
> > different now).
> > 
> > It's frustrating that they haven't updated the tuning page (72161) to
> > make sure the names given there match the new register bits on page
> > 59927, but I believe this patch is doing what is expected --- ensuring
> > that overfetch of non-compressible surfaces is enabled.  On pre-Xe3p we
> > needed to set disable=0 via bit 26, whereas on Xe3p we need to set
> > enable=1 via bit 14.
> > 
> > So I think this patch is correct.  But we may want to ping the bspec
> > writers and ask them to update the page to eliminate the
> > confusion/ambiguity.
> 
> BSpec writers were contacted and agreed to make the change to eliminate
> confusion. The patch was intended to address this based on the information
> in the second article
> 
> Thanks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I was about to apply this, but I noticed that you sent this to
@freedesktop.org instead of @lists.freedesktop.org.  Patchwork, CI, and
the fdo mailing list archives surprisingly all still managed to pick it
up, but lore.kernel.org missed it, which means anyone who obtains the
mailing list via 'b4' won't have seen this.  Just for completeness, can
you re-send to intel-xe@lists.freedesktop.org so that it's visible to
everyone and we'll have a non-broken References: trailer when it gets
applied?  I'll apply it immediately once you do that; no need to wait
for another CI cycle since there won't be any changes to the patch
itself.


Matt

> 
> -- Daniel.
> 
> > 
> > Matt
> > 
> > > 
> > > -Lionel
> > > 
> > > 
> > > >    #define L3SQCREG3				XE_REG_MCR(0xb108)
> > > >    #define   COMPPWOVERFETCHEN			REG_BIT(28)
> > > > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > > > index bcec40ca2d35f..a9bd3f8969a54 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > > > @@ -100,6 +100,10 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
> > > >    	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
> > > >    				   BANK_HASH_4KB_MODE))
> > > >    	},
> > > > +	{ XE_RTP_NAME("Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches"),
> > > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED)),
> > > > +	  XE_RTP_ACTIONS(SET(L3SQCREG2, NONCOMPMEMRD256BOVRFETCHEN))
> > > > +	},
> > > >    );
> > > >    EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
