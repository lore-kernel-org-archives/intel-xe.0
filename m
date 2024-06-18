Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7053C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 18:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696AF10E774;
	Tue, 18 Jun 2024 18:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4LIhezg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101F10E76F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718736911; x=1750272911;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3oI0N4fykUnRzg728Q0fHA6iGQe+VfHhOd1R3Afcu8A=;
 b=F4LIhezgruFo9da9hxdwZ17HzBsh5H/df+ElrC8lEls87arxywFKpxYK
 NFKJsLqFBseKwXiV3Mj22bh+bGXR8Dfy5wpQdN6UtSdOZMlM2/6vE/HJr
 3V2oBBiRI17UdEwmbLbJKu7vauV0mbFFiNGPjI8jJmT82A2gou2xiG/HB
 7tG1VFdugKLXjSUGXA2BN/C97tL5K7LIDAwckJ/KZS0BuwsaWiNRDcFkI
 K6gtPFW4V5GOsFKfYknIWxTTMhF3LprdVfYGJsYrQI9crRySf3bbKfrxG
 ZgKYcFp9Vk1JKQgigrkhnu/153/b2TXePVVLF8WQvlAwsDKEH47j87DAE w==;
X-CSE-ConnectionGUID: rUR1/g0gQkuM0oBFvf4Fcw==
X-CSE-MsgGUID: H8naJxZrTjmbUZW+e8uD1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27042088"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="27042088"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 11:55:10 -0700
X-CSE-ConnectionGUID: 7gBH/S9ISd2VFWQtFpNMyg==
X-CSE-MsgGUID: oVVfAf3hQgi5Qogwt/9TLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41743430"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 11:55:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 11:55:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 11:55:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 11:55:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 11:55:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kA3Gglh4Ek2txjtAsSPnM8a6IhRlcp4WHMmvFzOWv+kVCPdK0mQZCLsJbbs8reBH2iz2BDeIlFQpLBVeDGPNHAriPQGAm8UsIUE4NUyMpB/k4ZGf9wSBZ0AIRyMK9LL/5N5h42cdK74hanEo5w+bz1bU0Kvg8e1cdAk1hg+zzB1NEskhwu2eIV3zbMKI+n1Xbh0uTQzARFOJlMqX/KicTdPJAtZ07ZJ7LY69d/dxOEE3KjvXCxN7BdfFBoGOqA/urTmvN8Z1w+Y8w77fd26WfzZb8So+O+ygIzx82cr0+sOaQEE+1AQtQ/WbJ9luErnHxn7ksugX2IrE8MdVh3Kp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vq1ZayaPBfOGYXLjUE7DBpQFU1oaeGex2b3DeeKKos=;
 b=hIYH1r65/qbEcMMzyZ3s0d8hyyDRIOjc2O09enubzgypnjk+l/8tOMELTYmtEHgeDAuAaRUkBcaTxP/07EDJg0DIVSMqHhfDcjKWCmC7Bz9mrSZ+3FkeyFnHKFRUruckRcILA/KJUNmGeQDRvsNQSJcGADV8k8bIVtdCe0C/5ZfQ01o/s1ES8w0A8v7qWwWv27qxzxgYPrhDk7jvz3dSncV6MlQRKxgZ/hBIYkd4t0u7uzTNp4nJWQyXzclcitBV8HtfLkKy43xqW7ZBqTr92UPc9HqKt+jlgzbRB8iIV2rKBnWNByYEI0xkpDuc2RlwrGi7OpN5HCLlPTn8sPKV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Tue, 18 Jun
 2024 18:55:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 18:55:01 +0000
Date: Tue, 18 Jun 2024 11:54:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, "=?iso-8859-1?Q?Jos=E9?= Roberto de
 Souza" <jose.souza@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Message-ID: <20240618185458.GK2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
 <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
 <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
 <20240618164323.GN2905419@mdroper-desk1.amr.corp.intel.com>
 <8bc380197b6129a458fb177d263ddf4fc7e2dda9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bc380197b6129a458fb177d263ddf4fc7e2dda9.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: faace223-ae30-4ac3-6ed6-08dc8fc82805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oCJAfxw6tHF1FPauDAMWWXYKmvus7Ln9lzTvq9V0YXGtjpu3nnIKy4YmCL?=
 =?iso-8859-1?Q?WeZCY/oSG2uGg1YHPx5IGk/eD8y5RFSXa4Ue1nB9cFwKMb6FeCB6rBFtXf?=
 =?iso-8859-1?Q?kzVt0+Y2vj7GZqvblkik15uNactVPnNzrdfr9caQQlohKnL2O+sx/w0kbD?=
 =?iso-8859-1?Q?AfTgNXiqB/anadGjMntZm0/BmMbpDODVvPGhn055J0NhJG7D6sg2oKCASb?=
 =?iso-8859-1?Q?yMW1AEw19ZKGtWbYd2NoO/+RmAKwqlOC8CAlILV10j8MhjljFBg336OKAj?=
 =?iso-8859-1?Q?PCPtmzjEMP1VVSTbMuAXxZ9niyQ/Hsr5jWa4FrILtIPIYpUSyx5issf8Ak?=
 =?iso-8859-1?Q?LarVPT8wrS7vT+ZRsvexrE1JJpBSwbtgPxMl9NtK5sU7Op7jeoeATMF1we?=
 =?iso-8859-1?Q?MLxc99nmzKkOaFK9I0B9n6pwYktmLdja8dLIBTYPXc4E4/uDLHxoyQTFPx?=
 =?iso-8859-1?Q?tEMkuyK5X7vjF86nnqtKJlDRjZ4+yZy36RHXL9MZzVC3tj/jz3eEicBxqk?=
 =?iso-8859-1?Q?kXHbHAqnKUIWoNFaKYah8gScvkFseEH3WTdR4eTtGFGao4p79M/xRPHTUY?=
 =?iso-8859-1?Q?Su9ZLV/Ci7IZyDaigjmoV3VYif8X2w68tYV54h4Nvhq3WR2CZOHQLr4BRb?=
 =?iso-8859-1?Q?7csF3TQ2v2TUZzR0zLKeUS2wfDIehvciTf3u78ogyJsl6Xr3XmqA7NwRp4?=
 =?iso-8859-1?Q?Q7kaY24Wxa9TZ63twMLxt+5ZYkWB1P90T/Q8jL+Sc2g2kd3xuPRHr5G220?=
 =?iso-8859-1?Q?7yZe4TDcLHA+Uv2ShsLvJxj0f7KD7CQzViMnndgBd9oZ9h3yyzv44NepJS?=
 =?iso-8859-1?Q?yUYUxdr/TUtqULxnRQv50TuVW6903xxERXfY0+h4HZ/md4upQrfogumPVe?=
 =?iso-8859-1?Q?3Pvbaa91Io5BhLEpCWIXzozYWzuehtDe9XOlQ37XBvAlrjtX7HlTeXPe09?=
 =?iso-8859-1?Q?a8qG3sNz2jOrc6LVnIu5kODObRhfxN7xe7IwJA+eWZWz5UftHDNcB86Y84?=
 =?iso-8859-1?Q?0Kw8f+hhTWQsvS7ws600DKOqLzfl5TYM+FsL4VNA7NPQBgBAmc69LUB3C6?=
 =?iso-8859-1?Q?1lNbE55pqEviQMmjV54DLOHQbt42euGPVKAukgPPoyfJnZd+KoAxSZLVHm?=
 =?iso-8859-1?Q?ajBxbhK1+6ZK2Ilms2pSlGSn0hCdVQ+bmipI2dbB3QX6e8iye+wCFXq9Cs?=
 =?iso-8859-1?Q?FBo9et9vveA/ffr8kWILWge3t0oCMQcb+f5CdZlrn867J1gFaQPqNcv/Bl?=
 =?iso-8859-1?Q?pHLr0WbGAdv6LXgiKthKjEV2OUpFPi1x0aGCC9BqQ7te8bUnu5HHGYbb8P?=
 =?iso-8859-1?Q?7RvypRZSElX1ODopleB2Z1z0szCJrYQJ6dlVLYZrKelwlQ4yQogQgT3fAg?=
 =?iso-8859-1?Q?jaPpLbk7Vf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SX4GcWy0v4DJzp230zh7TDzQEdFzkiLqDm0bVZHx0gM+Ba8rPhmpx0IHKU?=
 =?iso-8859-1?Q?ElKf3eM1Bh+/TovNeFhT01z6ebvixZkwla8ZLV0gSIWhcK6uRzatPymtil?=
 =?iso-8859-1?Q?Hp+PV65Q5j+mw5rP9g53UxeH7qwvYYSdJ4NYp6YhDRKThcKQYVr4C6vTCg?=
 =?iso-8859-1?Q?4slqwGFwuFOVszy7N+BO28bQivAW44vlQ/Wq0Xc6wB3LnH0InUsGfiWsTX?=
 =?iso-8859-1?Q?9cn+0iD4kvRmDNq81/QGaMEt/QqL6y6KseeO+PDsf0HD+eYv7NbCXC+td8?=
 =?iso-8859-1?Q?EE16SaFLs0OImYF3hN+hkOLKuYaAzuQjQhxAPu+7RkbGb6XiTrMsg7Uyni?=
 =?iso-8859-1?Q?VjIYBozrd15LWY8ci9BODbSk2BXPQzE4YiUVCXYkTXrxRNHwe7GyUHVR8c?=
 =?iso-8859-1?Q?U9BrQQj1hucBsL4/uKPURRjqhZNbcJ4b1Gd+1FWu4yNFKtHrnt8N9dGOj1?=
 =?iso-8859-1?Q?HuHMry/qMTLCa6gK2nRyIDXltyTowuTAzMp75EuVMEwezxnfvLfSaxglT+?=
 =?iso-8859-1?Q?gXTRdrpRo6ne39SRLVfMG6shYP6RJhqg6cVrmWge0HyDstFZiA3ddAhJj+?=
 =?iso-8859-1?Q?adEIWceRNe+VbLx3ERPUUb1R9RrQ2Ll49ou4C7Av1NpVi1+4WD/TZaKhLr?=
 =?iso-8859-1?Q?yg+I1XWnny1DXatl/+B3ENv26HNgjNEI3/pVIhZ/258PLHuSIBd7SmqJiz?=
 =?iso-8859-1?Q?bGu5OADyVV1ik41BB1J6rZZCG7CGlglj24S+oP49eQLOXle0qrsIvuQMGA?=
 =?iso-8859-1?Q?SOc3MunRuyW/gf8pzDbk6IhWxMGz8kkg0DZFcdnTbozCl4JIaTGalpolmy?=
 =?iso-8859-1?Q?frdWdAxnoB30D4ZKGGuMAuBaTViK5zwaSB+pS3fflkS6RigaClWGc349/A?=
 =?iso-8859-1?Q?er3M5hlcVgu2PJxT2XZimFvcAZM68qHn/f4MTxFzwLCLr1tiBevcgbsW7V?=
 =?iso-8859-1?Q?3oSjx9S1vHkNCkYBEPy6xgMF8uqLKtz0+Dt97Ya1Eia4/txib+cFsJSQQK?=
 =?iso-8859-1?Q?8NFCHC3ouA+xWSzKcF8h8kY7tKeTYYy0kgBl3HkZEjGFUB3jFsSovQiB7E?=
 =?iso-8859-1?Q?sEPYBYCMVafDyvYkX4DoIZ9kkGPs+VT4qLvNcBVnbpkUQqws5gwCH+0sSr?=
 =?iso-8859-1?Q?uKKzY9lKgrMdxNAZZz8lFzrWMzyYnbcmdN9ALkdusMSTZnEOYaeB3hSV9Z?=
 =?iso-8859-1?Q?NFwo5+eHS20Kl/Wy5MV8XPdtAisHt2K8v64D5HVBr94aLx+xl4tiKaVmB9?=
 =?iso-8859-1?Q?R0CastH4MZoMi2p1ldr472qxMJMDIGfzea81rg7miwpOt8RNf0o+UzEHO8?=
 =?iso-8859-1?Q?PyHwgccFXOnZ9AIs1/OJjAjT6VXTdWfVRf4IH+cHb3gHaL3lHFhJl6mA9U?=
 =?iso-8859-1?Q?5Ix/9yR61qpbYcPpLP4khdo6hr+I3qpgpy6xmjuI6IIporjVSJ+NSYyHYR?=
 =?iso-8859-1?Q?pUVq0PLswJM8P8CXaAnX040Z3FzNGK3MdbPw0uHxYCMhQ69+9A6v72mJ2c?=
 =?iso-8859-1?Q?NoFd7JMrzOx9uBsaQRqbIM+eJ7XlgCtDd5QkqruXwbs5yujdl09xxeE20Q?=
 =?iso-8859-1?Q?Hx9XgynqsY7+quqETvszXmbpZSiLSoWRmSsBIAuzFojdZzkJAr/2L7VBiP?=
 =?iso-8859-1?Q?91TDkn6icLkcCH+1zeaxZnLxRU+oxTKXSbXbIBHKXo0A/W17hZ8q/dLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faace223-ae30-4ac3-6ed6-08dc8fc82805
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 18:55:00.9408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6ZLGQjKQD3d+lG1trGqhLeQQ298y/UJ4fDt/o7TC+8gjrrM5D+jojC4+hS+UmNesE8v7b794wyN606stum6LFfnQV1QgMjqe1Uj4z+FmHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
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

On Tue, Jun 18, 2024 at 08:29:24PM +0200, Thomas Hellström wrote:
> Hi, Matt
> 
> On Tue, 2024-06-18 at 09:43 -0700, Matt Roper wrote:
> > On Tue, Jun 18, 2024 at 02:38:01PM +0200, Thomas Hellström wrote:
> > > Hi,
> > > 
> > > On Mon, 2024-06-17 at 13:28 -0700, Matt Roper wrote:
> > > > On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko wrote:
> > > > > Hi Thomas,
> > > > > 
> > > > > On 11.06.2024 14:47, Thomas Hellström wrote:
> > > > > > Hi, Michal,
> > > > > > 
> > > > > > On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
> > > > > > > We should honor requested uncached mode also at the TTM
> > > > > > > layer.
> > > > > > > Otherwise, we risk losing updates to the memory based
> > > > > > > interrupts
> > > > > > > source or status vectors, as those require uncached memory.
> > > > > > > 
> > > > > > > Signed-off-by: Michal Wajdeczko
> > > > > > > <michal.wajdeczko@intel.com>
> > > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_bo.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > index 2bae01ce4e5b..2573cc118f29 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > @@ -378,6 +378,9 @@ static struct ttm_tt
> > > > > > > *xe_ttm_tt_create(struct
> > > > > > > ttm_buffer_object *ttm_bo,
> > > > > > >  	    (xe->info.graphics_verx100 >= 1270 && bo-
> > > > > > > >flags &
> > > > > > > XE_BO_FLAG_PAGETABLE))
> > > > > > >  		caching = ttm_write_combined;
> > > > > > >  
> > > > > > > +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> > > > > > > +		caching = ttm_uncached;
> > > > > > > +
> > > > > > >  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > > > > caching,
> > > > > > > extra_pages);
> > > > > > >  	if (err) {
> > > > > > >  		kfree(tt);
> > > > > > 
> > > > > > To me the preferred method is to teach bo->cpu_caching about
> > > > > > the
> > > > > > uncached mode and then include it in the switch statement
> > > > > > above.
> > > > > > 
> > > > > 
> > > > > but bo->cpu_caching is currently documented as:
> > > > > 
> > > > > /**
> > > > >  * @cpu_caching: CPU caching mode. Currently only used for
> > > > > userspace
> > > > >  * objects.
> > > > >  */
> > > > > 
> > > > > and value 0 is implicitly reserved as kind of default, so
> > > > > 'teaching'
> > > > > would likely mean either extending uapi with something like:
> > > > > 
> > > > >   #define DRM_XE_GEM_CPU_CACHING_WB                      1
> > > > >   #define DRM_XE_GEM_CPU_CACHING_WC                      2
> > > > > + #define DRM_XE_GEM_CPU_CACHING_UC                      3
> > > > > 
> > > > > which will introduce lot of undesired right now code changes,
> > > > > or we
> > > > > will
> > > > > introduce internal only flag:
> > > > > 
> > > > > + #define XE_CPU_CACHING_UC                      ((u16)~0)
> > > > > 
> > > > > but that doesn't look like a clean solution.
> > > > > 
> > > > > 
> > > > > OTOH, just above this new diff chunk, there is already a code
> > > > > that
> > > > > updates caching mode outside the "switch statement above":
> > > > > 
> > > > > 	if ((!bo->cpu_caching && bo->flags &
> > > > > XE_BO_FLAG_SCANOUT)
> > > > > > > 
> > > > > 	    (xe->info.graphics_verx100 >= 1270 &&
> > > > > 	     bo->flags & XE_BO_FLAG_PAGETABLE))
> > > > > 		caching = ttm_write_combined;
> > > > > 
> > > > > so maybe as a short term solution we can keep this patch as
> > > > > it's
> > > > > doing
> > > > > similar last resort stuff and return to 'preferred way' later:
> > > > > 
> > > > > 	if (!bo->cpu_caching && bo->flags &
> > > > > XE_BO_FLAG_NEEDS_UC)
> > > > > 		caching = ttm_uncached;
> > > > 
> > > > Yeah, cpu_caching is a "uapi only" thing at the moment (and even
> > > > then
> > > > is
> > > > only set in some situations).  Given the current design and
> > > > assumptions
> > > > of the code, maybe it would be more clear to add an assertion
> > > > like
> > > > this
> > > > to help document why this is special?
> > > > 
> > > >         if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
> > > >                 /*
> > > >                  * Valid only for internally-created buffers
> > > > only,
> > > > for
> > > >                  * which cpu_caching is never initialized.
> > > >                  */
> > > >                 xe_assert(xe, bo->cpu_caching == 0);
> > > >                 caching = ttm_uncached;
> > > >         }
> > > > 
> > > > If we decide we want a more general redesign of cpu_caching
> > > > behavior,
> > > > that would probably be a separate change from the direct
> > > > functional
> > > > fix
> > > > here.
> > > 
> > > I do think the change should have actually been done before the
> > > scanout
> > > caching hack. We shouldn't be building special cases like this, but
> > > rather fix what's missing.
> > 
> > I think things happened the other way around.  The scanout caching
> > adjustment pre-dates the existence of bo->cpu_caching in the driver.
> > When bo->cpu_caching got added in commit 622f709ca629 ("drm/xe/uapi:
> > Add
> > support for CPU caching mode"), it intentionally left kernel objects
> > set
> > to 0 by design.
> 
> I don't really see a discussion around the kernel objects in the commit
> message, it mentions "currently" in the caching mode doc, but that
> sounds more like a documentation of current status than a guideline.
> Ofc, it might be in the review discussion but I haven't looked too
> closely TBH.
> 
> Hmm. This commit raises some questions. Do you remember the reason for
> leaving out the kernel bos? Was it because kernel bos relies on
> implicit caching mode selection whereas the user-space bo caching mode
> selection is now explicit? Otherwise it's pretty standard in the driver
> to map the DRM_XE user-space flags / enums to XE_ internal ones.

Unfortunately I don't remember the details here very well myself; I know
this patch went through a lot of revisions and morphed a fair bit during
the review cycles.  Adding a couple extra Cc's of people who were more
actively involved in the review and may have a clearer memory of how we
initially settled on the userspace-only design.

+cc Jose, Oak


Matt

> 
> (As a complete side note it looks like the system pages for VRAM-only
> user-bo eviction are now forced to be write-combined by the uAPI?)
> 
> > 
> > We can certainly change the design now if everyone agrees that it
> > makes
> > the code cleaner,
> 
> This is probably a bigger change than I originally though and requires
> some additional consideration of the above.
> 
> >  but I think that the general refactoring and
> > repurposing of bo->cpu_caching is orthogonal to the functional fix
> > that
> > Michal is providing here.
> 
> Generally I think that if something is missing to be able to cleanly
> add a fix, then we should definitely try our best to add that something
> _first_. In this case it turns out, though, that it requires some
> additional afterthought.
> 
> So for the patch
> 
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> 
> > 
> > +Cc Pallavi, Matt Auld as the authors of the original design in case
> > they have any thoughts on extending the usage of bo->cpu_caching.
> > 
> > 
> > Matt
> > 
> > > 
> > > Can't we make bo->cpu_caching valid also for kernel bos with a new
> > > enum
> > > and do the translation in the ioctl?
> > > 
> > > /Thomas
> > > 
> > > 
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Michal
> > > > 
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
