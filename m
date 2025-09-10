Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B140CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB1A10E0F1;
	Wed, 10 Sep 2025 21:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvIOsqN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072610E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757539707; x=1789075707;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L7BCw16cZtUFsWAxvgGo3ZAnOYd4Jvtr/IdpXb0Ry34=;
 b=JvIOsqN8I+LxnM9oG8oivzU4biWgi8dFTcGH4yghfIiJfM/NBXCYJ2Sg
 e7n9zeXJ3aUrsvz4lKk/MOJ35Pnk0+ZquDTeJBbMNsRtZq6sKxZ2Ea8Ll
 jvvDW4WOGNuPDdJswllQogrYjkTwzKaFD8B5DidkYRpFg17keiYK2OhNd
 5ZRVgrN1APy64WsEKZ4n/C2Hl+PURfEZDSOwOecOKJXtXANGyKZXJD6zv
 SNMgvA+e+zRn4F82HyO+PMxHiEEihwtWXap4jXbWdaKE4xTL8WIYRUikb
 VV0fJ2l0/XEDqHihpys9ntMaZMgQS4dvKZ9B74DST0oWl1JqSvg3v8Dsr Q==;
X-CSE-ConnectionGUID: qQyuQNJFSMuoNE56Nb7Z3g==
X-CSE-MsgGUID: 3raowinQRWmAP7d2oWU5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82450080"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82450080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:28:24 -0700
X-CSE-ConnectionGUID: mdPQPjScQfmZpcFjfpuzbg==
X-CSE-MsgGUID: iDSlIJV2TceMKJIEoNsYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="172792119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:28:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:28:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 14:28:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONmzrT3XTMvJFE6txIR4/cvYwzJhqm1VlL18n7Mhqt+XK4nVS2JKJdJf0Cz/3nOIYeV9DblAPT4bwH9+R5N0GXLV6evceb8AL8CpZHt1CayH5kVlkcmhiRc6sDBVb2FNf+houDv3nFYg8yChIuCR7tZdYqz2tYnjOlHKf/ZgYJujmnTcitSJQ7+kkYIQpSf/Ws8t183bwKGwVxtDH4w9DAxmw5VHzykyT4IIF754Dpajizu9MkMqnunqsTTBOThZZlHM5XV9eumx8mZ88bq5ITZLkRUdYJAooJrOqnkHTynU25CEiJGcfkNiLX5YACYNQbcSsXoOC5e/XzgBhvWQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCaVvaXtX4LIkVHmq41dc7jIytes8biuYS1/rp7U7y8=;
 b=eGJ8SPBOgK4czO+SgARZgSEnjxIbIErEGOQV/RXZdJpgl1IVwr1FxmsRQtxco7a2Vab38sYbWGXTqBHYss5RFJiMvNvNM2pEYr4Ja2DC2iMI1Z237x8gCtI8kNwa9owN86BU7EKRZ4oDAp0BCidgdTZGWfbpH71e8GK4i8n0kCxkD80m44W1bFMft5P8DMC4kbuNrtPlrgzAu4oemw7HzK/iD3jhvFL0jAVRZXPD3CE+vv2xdCmInblyxL+5SaS7q04Y43MJ79WxFW/6Wb7augJbAfNcTk/qWHyRtdhg1UP+UmfmW7FWsm+zNXV+HWS5cchWlVQs4uK6MmoBO5Sk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 21:28:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 21:28:21 +0000
Date: Wed, 10 Sep 2025 17:28:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Add dedicated printk macros for tile and
 device
Message-ID: <aMHtcsKV3v-S1cU1@intel.com>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
 <20250909165941.31730-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909165941.31730-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 3523b344-94cd-4909-45b1-08ddf0b0f759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bv/ivIpl3jNYZFpib2NPCeko20+BmXC/Sv6eJTBg8Og/cGkaWoNDv/5KlI?=
 =?iso-8859-1?Q?HNPxm0s6WRUF83tQ/dSsA11YmqqHQf5ig0sD8E77uMa3cylrTxIOl+7mVQ?=
 =?iso-8859-1?Q?T+g/pHpWMXNGOzUOTPmdhBrvvTnBLaMV8sg+8vQcp311wN+OCmQUwymo66?=
 =?iso-8859-1?Q?bM8QtRALaiTgnGHKv5D/czNZy3/GvFrcZ5pLiiLJLfT3D4F4xSDCEUe7pB?=
 =?iso-8859-1?Q?Bum+MvRscwVTL/0DwdrKWU67cPPsrYR0VdxeZ7X8I1NdeHtDq4g7O0qK4k?=
 =?iso-8859-1?Q?G6yKuTZRXoWDDk7/VXd1obaGmScLClOIUUrswaj344O/YzWvTQNro6s4vI?=
 =?iso-8859-1?Q?BOCyrH+4rsjBI2yqBnM21cnX1G3KAfcZioiP2XeAKZ6cNcXK/6UuoGhI/c?=
 =?iso-8859-1?Q?4qFDp3SRso1G2zha1e3gfMG6lnoc3NfLIAq1Xzvf7uuL8bgt7FavSgE5bG?=
 =?iso-8859-1?Q?rQiHTeFqDYuMFYAdjfoKJkXR0PPcBcv7JzmqtHSDQh7b1bsztc7g8OnmT9?=
 =?iso-8859-1?Q?s9SBSdAz/g/n3PGFMCh1XlTYGm2x7cwEeknrCP+UFQawwL4KDKThAr6gNo?=
 =?iso-8859-1?Q?/0YoPBc/S7DjtEWnvPe7OnQxeRVLfyRb2cxpCa1ImSgemYxKbhrtBIEWAY?=
 =?iso-8859-1?Q?WKFoGDfnPtIM9+Ua5SXwqFmPyOoM+372cIRZ/u0pslXMA1jeQtRDGpzRn6?=
 =?iso-8859-1?Q?75vsTGzkGJCmoVwUNufPiETsss+ZZ3cRJGyNhDYomU2Wq6wKEjo6pcSDxr?=
 =?iso-8859-1?Q?XIz1k7od6lxLplAA+bNyRthrvlOiUMgbTNxLk6bmVpW8hOHAwcoTdii0C6?=
 =?iso-8859-1?Q?6nBHrlpKJqT6yc9XoClSzqR/PT3SGFYIis2M7DbFhqeii80y34PKD05qGr?=
 =?iso-8859-1?Q?caayQeWj0QsI4E5hQBHagu2L2y5poLeGXY78QYrx/X5mL1IYyq8O/HrWRM?=
 =?iso-8859-1?Q?hcNRPBvtL8xYbk8yol7ls4glFVE+weHSjRhi9187SGt6LE/r+qFIolcj6f?=
 =?iso-8859-1?Q?+24+Mb5SHhevSQP/2RlO0V9F08NoKNrGcdQER8AGP31tHHtvSDhyNdNLNg?=
 =?iso-8859-1?Q?DZU11M4KXECi9f5Jqy1YJDvvg3h/0ecfmP6i5pAKRtQz3lYkSjo9iRC9La?=
 =?iso-8859-1?Q?Yq5tMTPL6pv9clWFgW3Fsg6jouWLvfvJlZZ8nafGmNEZiJCnBsXEmNctRq?=
 =?iso-8859-1?Q?GMUHiEsg0OVi/BsWWtHwKkVaRAQA18cjzIJQVn3Pz618VSe6ry4suG77bC?=
 =?iso-8859-1?Q?uxLixRrfomzeOwk4Ms5+8G6w+IlCL2aHGTHIu/0Gs9OuUy09hqd+yTSShG?=
 =?iso-8859-1?Q?TIj/c+nHqNv4Txt8nuVbsOnVysp5WVG79f14ZihNz9SRQEgwFDX1BqEAbz?=
 =?iso-8859-1?Q?A1WZo7IeIgl22GM2expLysetWuRI+3KnqjJnk9NzQcLaYtURGnzfftdFNz?=
 =?iso-8859-1?Q?nXLlfrgYjCpe8wCX2L35JMNEps5jb/ps2RuT4JL2+dzB9hpiB0wrZpkguP?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oNNkf8P46psQNNnuS1UwBvuEmcgOT1aOv9L2e/2YKDW/+z9g9eV7oSxXtz?=
 =?iso-8859-1?Q?qVu5YBdMW7BdjozNMBGTucsTIEGj9uOepU8B0t4p4O/Pi5KVwgjasDbaYe?=
 =?iso-8859-1?Q?17LGdTc++PpOxKZwNhUWyyQ4Fohbsj0CeVGWeo0/PremKgRwrbXti7c6Dq?=
 =?iso-8859-1?Q?YOG8f7dgkPQTu+qwWFXdunJx0GYVyyYHnM/bE60cmPls2aJyxbTC++nzRC?=
 =?iso-8859-1?Q?9wYCMK0DH2jEOafNyr9khCT5L6VtWetv/hg74v6wRrANlG0KoDiYxlddxW?=
 =?iso-8859-1?Q?nMEMH9uxLTd9ILFb4FZ6ehUY30oOzcpJv1BOULIKQEl/wgEo22ZhwQid/B?=
 =?iso-8859-1?Q?3vEOdZ8jyleyeeWC9q45Auuwi2brPdj/bOHMyb+vOcDsa0Z1TWsiBCnDmN?=
 =?iso-8859-1?Q?PHNp429/NGwhE5vYIYfUcGIfw9A/YPUsndJiz0Tm5w+ZvIxbhqY2mAhCbD?=
 =?iso-8859-1?Q?V2Lwv3Y85tIktx1i1R/BEI/EwWptHQiAVwA7v8Ze/RjlSwRwsu5y3BAlVq?=
 =?iso-8859-1?Q?FN3xwtf3Yk5DuWRfGqzneHKj/eg6qlAJKmLUsF/3RpZ82HQH+cH//H+ESi?=
 =?iso-8859-1?Q?TBZYD+LsrxN16eLRtPHTWQkOoKIGJxl5nczu2FI1xQ3Clobs1zS0WcvhrG?=
 =?iso-8859-1?Q?NC4bRGkFx4KAuV2JIWe9x7BG62C/M43EryPd5nIuTYQ/6tKm+zOHBMAODp?=
 =?iso-8859-1?Q?eg8rgbvhX3B7CwXew3Hx6QJCiLpech2xjpaeLg4miWhMOFtB87nWKqquAt?=
 =?iso-8859-1?Q?OspB76kxTmhABR2trXiw02M+K7waHYuNkktFFaE+NPoLimJvmC7AHIP0xp?=
 =?iso-8859-1?Q?03KflUk8epodwFqnyGVHkfM2tWq5C9jmT5GfWtjv/PlRlbtW3fbS9edHUT?=
 =?iso-8859-1?Q?8CQ4CmzEZrWPron1eS2gZ8Ylk3crvjZ3MY9JY0xIReGL3nYUT58qy57ena?=
 =?iso-8859-1?Q?Ybf2ontDzimZc2OkWNN+gIX1Zo5cly9UauErxivsWoPq/ZTuVHG33gBlF7?=
 =?iso-8859-1?Q?Y/av9fuO9EA7qQIGzqf6Eisk0Wj1QPqqvJC5AiaxZSO0Tp10DzBdTu62sn?=
 =?iso-8859-1?Q?ulXFWG6J9kUBi6FImsuU1eGB3UlpgTnDcYzuBM9ZyXPSs/PflKJ2WaTSfu?=
 =?iso-8859-1?Q?FDvdzMHDGMzvihwypCfawWrz23ulxxuQ88Z6fixBD3bWqskPIssn1MetiE?=
 =?iso-8859-1?Q?15PNZCihb3XO5BRY1mKlj1td+6gVcIe0af4wJB4Mv/xIy2NzRdmprpGMhj?=
 =?iso-8859-1?Q?e56Nm9CreyOJt1VhSItGIB0U+4cQP9zxwWbir178nyrPQ11Gznta91RUOt?=
 =?iso-8859-1?Q?CHrAscmsfLwccHDP0UdkLWj70FRbYbV2QJ/De1QyKiNj22KgfN/CTSC0Rs?=
 =?iso-8859-1?Q?UKFX+L9Rj1C3fnnpHSvrdU1Up/jd56rmXQhi2k9CgKXYRbdgVJ88ObFBhK?=
 =?iso-8859-1?Q?ytM5+uklwQ8qBShj3LRzF8VO/YsJl7gQ+pE9Au/M4nSHkv2exhzfvkv5i5?=
 =?iso-8859-1?Q?3pe1BT/HLv1bqN8aUHyXk8vjHqCnbyFSskKR+Nc+kMfZ5k472be6w/xVDs?=
 =?iso-8859-1?Q?4HLOF+adt8MT+1JECEZ+jBp9DI+SXSIuBlRYDmjBLr4ZJsgxJVoOcdJNfC?=
 =?iso-8859-1?Q?xhzzQloIZrvxdkp0c/jdl7GzNfEwWfr5rROue1J0BfCTXmbqCxYov7rw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3523b344-94cd-4909-45b1-08ddf0b0f759
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:28:21.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq8KT7io4Ke5dArczMVF5QRUaUneibUDPtSYp+zNv+F6NqjnJbOIiuTh1wVTBwEF6A3BCpp2t19FfGLIgV4sag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

On Tue, Sep 09, 2025 at 06:59:38PM +0200, Michal Wajdeczko wrote:
> We already have dedicated helper macros for printing GT-oriented
> messages but we don't have any to print messages that are tile
> oriented and we wrongly try to use plain drm or GT-oriented ones.
> 
> Add tile-oriented printk messages and to provide similar coverage
> as we have with xe_assert() macros. Also add set of simple macros
> for the top level xe_device, which we could easily tweak to include
> extra device specific info if needed.
> 
> Typical output of our printk macros will look like:
> 
>  [drm] this is xe_WARN()
>  [drm] *ERROR* this is xe_err()
>  [drm] *ERROR* this is xe_err_printer()
>  [drm] this is xe_info()
>  [drm] this is xe_info_printer()
>  [drm:printk_demo.cold] this is xe_dbg()
>  [drm:printk_demo.cold] this is xe_dbg_printer()
> 
>  [drm] Tile0: this is xe_tile_WARN()
>  [drm] *ERROR* Tile0: this is xe_tile_err()
>  [drm] *ERROR* Tile0: this is xe_tile_err_printer()
>  [drm] Tile0: this is xe_tile_info()
>  [drm] Tile0: this is xe_tile_info_printer()
>  [drm:printk_demo.cold] Tile0: this is xe_tile_dbg()
>  [drm:printk_demo.cold] Tile0: this is xe_tile_dbg_printer()
> 
>  [drm] Tile0: GT0: this is xe_gt_WARN()
>  [drm] *ERROR* Tile0: GT0: this is xe_gt_err()
>  [drm] *ERROR* Tile0: GT0: this is xe_gt_err_printer()
>  [drm] Tile0: GT0: this is xe_gt_info()
>  [drm] Tile0: GT0: this is xe_gt_info_printer()
>  [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg()
>  [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg_printer()
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: use uppercase for FMT macro (Rodrigo)

Thank you


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h   |  11 ++-
>  drivers/gpu/drm/xe/xe_printk.h      | 129 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_printk.h | 127 +++++++++++++++++++++++++++
>  3 files changed, 261 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_printk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index dcc45628cca9..1313d32862db 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -6,14 +6,13 @@
>  #ifndef _XE_GT_PRINTK_H_
>  #define _XE_GT_PRINTK_H_
>  
> -#include <drm/drm_print.h>
> -
>  #include "xe_gt_types.h"
> +#include "xe_tile_printk.h"
>  
>  #define __XE_GT_PRINTK_FMT(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
>  
>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
> -	drm_##_level(&gt_to_xe(_gt)->drm, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
> +	xe_tile_printk((_gt)->tile, _level, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_err(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> @@ -37,7 +36,7 @@
>  	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>  
>  #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> -	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
> +	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
>  
>  #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
>  	xe_gt_WARN_type((_gt),, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
> @@ -72,9 +71,9 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
>  
>  	/*
>  	 * The original xe_gt_dbg() callsite annotations are useless here,
> -	 * redirect to the tweaked drm_dbg_printer() instead.
> +	 * redirect to the tweaked xe_tile_dbg_printer() instead.
>  	 */
> -	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
> +	dbg = xe_tile_dbg_printer((gt)->tile);
>  	dbg.origin = p->origin;
>  
>  	drm_printf(&dbg, __XE_GT_PRINTK_FMT(gt, "%pV", vaf));
> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
> new file mode 100644
> index 000000000000..c5be2385aa95
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_printk.h
> @@ -0,0 +1,129 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PRINTK_H_
> +#define _XE_PRINTK_H_
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +
> +#define __XE_PRINTK_FMT(_xe, _fmt, _args...)	_fmt, ##_args
> +
> +#define xe_printk(_xe, _level, _fmt, ...) \
> +	drm_##_level(&(_xe)->drm, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_err(_xe, _fmt, ...) \
> +	xe_printk((_xe), err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_err_once(_xe, _fmt, ...) \
> +	xe_printk((_xe), err_once, _fmt, ##__VA_ARGS__)
> +
> +#define xe_err_ratelimited(_xe, _fmt, ...) \
> +	xe_printk((_xe), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define xe_warn(_xe, _fmt, ...) \
> +	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
> +
> +#define xe_notice(_xe, _fmt, ...) \
> +	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_info(_xe, _fmt, ...) \
> +	xe_printk((_xe), info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_dbg(_xe, _fmt, ...) \
> +	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
> +	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
> +
> +#define xe_WARN(_xe, _condition, _fmt, ...) \
> +	xe_WARN_type((_xe),, _condition, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_WARN_ONCE(_xe, _condition, _fmt, ...) \
> +	xe_WARN_type((_xe), _ONCE, _condition, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_WARN_ON(_xe, _condition) \
> +	xe_WARN((_xe), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> +
> +#define xe_WARN_ON_ONCE(_xe, _condition) \
> +	xe_WARN_ONCE((_xe), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
> +
> +static inline void __xe_printfn_err(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +
> +	xe_err(xe, "%pV", vaf);
> +}
> +
> +static inline void __xe_printfn_info(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +
> +	xe_info(xe, "%pV", vaf);
> +}
> +
> +static inline void __xe_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +	struct drm_printer ddp;
> +
> +	/*
> +	 * The original xe_dbg() callsite annotations are useless here,
> +	 * redirect to the tweaked drm_dbg_printer() instead.
> +	 */
> +	ddp = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
> +	ddp.origin = p->origin;
> +
> +	drm_printf(&ddp, __XE_PRINTK_FMT(xe, "%pV", vaf));
> +}
> +
> +/**
> + * xe_err_printer - Construct a &drm_printer that outputs to xe_err()
> + * @xe: the &xe_device pointer to use in xe_err()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_err_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_err,
> +		.arg = xe,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_info_printer - Construct a &drm_printer that outputs to xe_info()
> + * @xe: the &xe_device pointer to use in xe_info()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_info_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_info,
> +		.arg = xe,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_dbg_printer - Construct a &drm_printer that outputs like xe_dbg()
> + * @xe: the &xe_device pointer to use in xe_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_dbg_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_dbg,
> +		.arg = xe,
> +		.origin = (const void *)_THIS_IP_,
> +	};
> +	return p;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
> new file mode 100644
> index 000000000000..63640a42685d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_printk.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _xe_tile_printk_H_
> +#define _xe_tile_printk_H_
> +
> +#include "xe_printk.h"
> +
> +#define __XE_TILE_PRINTK_FMT(_tile, _fmt, _args...)	"Tile%u: " _fmt, (_tile)->id, ##_args
> +
> +#define xe_tile_printk(_tile, _level, _fmt, ...) \
> +	xe_printk((_tile)->xe, _level, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_err(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_err_once(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err_once, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_err_ratelimited(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_warn(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), warn, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_notice(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_info(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_dbg(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
> +	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
> +
> +#define xe_tile_WARN(_tile, _condition, _fmt, ...) \
> +	xe_tile_WARN_type((_tile),, _condition, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_WARN_ONCE(_tile, _condition, _fmt, ...) \
> +	xe_tile_WARN_type((_tile), _ONCE, _condition, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_WARN_ON(_tile, _condition) \
> +	xe_tile_WARN((_tile), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> +
> +#define xe_tile_WARN_ON_ONCE(_tile, _condition) \
> +	xe_tile_WARN_ONCE((_tile), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
> +
> +static inline void __xe_tile_printfn_err(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +
> +	xe_tile_err(tile, "%pV", vaf);
> +}
> +
> +static inline void __xe_tile_printfn_info(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +
> +	xe_tile_info(tile, "%pV", vaf);
> +}
> +
> +static inline void __xe_tile_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +	struct drm_printer dbg;
> +
> +	/*
> +	 * The original xe_tile_dbg() callsite annotations are useless here,
> +	 * redirect to the tweaked xe_dbg_printer() instead.
> +	 */
> +	dbg = xe_dbg_printer(tile->xe);
> +	dbg.origin = p->origin;
> +
> +	drm_printf(&dbg, __XE_TILE_PRINTK_FMT(tile, "%pV", vaf));
> +}
> +
> +/**
> + * xe_tile_err_printer - Construct a &drm_printer that outputs to xe_tile_err()
> + * @tile: the &xe_tile pointer to use in xe_tile_err()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_err_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_err,
> +		.arg = tile,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_tile_info_printer - Construct a &drm_printer that outputs to xe_tile_info()
> + * @tile: the &xe_tile pointer to use in xe_tile_info()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_info_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_info,
> +		.arg = tile,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_tile_dbg_printer - Construct a &drm_printer that outputs like xe_tile_dbg()
> + * @tile: the &xe_tile pointer to use in xe_tile_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_dbg_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_dbg,
> +		.arg = tile,
> +		.origin = (const void *)_THIS_IP_,
> +	};
> +	return p;
> +}
> +
> +#endif
> -- 
> 2.47.1
> 
