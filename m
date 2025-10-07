Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BCCCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3C10E6F4;
	Tue,  7 Oct 2025 17:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2yB2DK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B984D10E6F4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759856856; x=1791392856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fkc1H/6u4jUWH2WS76QdrpNp4yvEy0eg6mJ5Hwam3V4=;
 b=G2yB2DK5OG2z9FbiDb48Hw8MdLb5/0SkPIr77RaqjsXn7mXbfqQh9uXQ
 NCsV/vwsqJEtHqgGQKeJDgMT8cnnJwcmGlDpQuH0pCBiG0DYIjiscUrb/
 Gx5V23HorQHFEbm2w+hb6wXAFB3YX0TWQa5ymjoSmfdwpLJ9W6KCWoy3G
 azPYnf7n++bTnNkWAbjKZAyDZQYQx9AL1aEbbGcf6AgaLLTpUKobQXnI6
 uziOnsV/O/YSAosCc0IGp5JL3aVMq+emjNuMKY+H8t27HzFc9ueisXB0y
 DZU1JZhHeIxs+A5D2CTMGDmm1oZ9ucnh64aiTmhwnrHHlrrWacGKCUD60 w==;
X-CSE-ConnectionGUID: QXVB1MxmSXOPaW/4ujH6kw==
X-CSE-MsgGUID: TiWHlhDdS6yte/5EvmDMwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62081308"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62081308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:07:36 -0700
X-CSE-ConnectionGUID: C16C6l5pQdmpfgX9uXtiRA==
X-CSE-MsgGUID: uDNJpvY7SjeXILk7LbY25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184478865"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:07:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:07:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:07:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W29M2qEHTT2k6RzTvPOEDwzxsAb5NnRT0xUcPcf6WuARsbve/+JxuFvHKM2BoXcSLKxQVs8q0V8FiFyI1RYCD2i9CqbLI0UfZ9cssA/zHBDHN+ckjTL9Xd+ttht2bdElh/7IQFBeNlqF9Hc85LYJpLc27YqdKN/8Z+xtpk5zzihi0tVAgGvBndC/r2O9QAMffG9fNJI5D+4dZ9/dGipzOhxMm5EihFxnBIknwi71dK/8i5rkBtrx4pML2iOY81XqbzNrMpSgfvwoZX6wYmBwH7mgWmM8G4sVMmlo+yEA7F/0bD2nwOQGmIzxKKHtfc2/SiLefTCz5CNmsEDVDvIX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1Qb+wRqTHHtinysRD5qqiBva8u/cSI0Ypajd8ZFS3w=;
 b=NjDHNvP+P8heBT8iD5ifdFtBoSjjDF347zwBQ7algaPUGNKUOr5g8ogfEVss02GaOQTyhBI/0sI51GmBGkz729n/Ga2dHn9IVSSJFLZaKvWOsa9B1OPujam9Pn8JqoBoxVeph+4U8kAmFlSmReECF8yv39AGEj4biUyaAtGTlI1oSiQZCTm69Nnvu/2TR9l7zuKiOovWanrQGos1dRNMknFmsjSbSz33+/6eQt440oUYF9Q9nuivmJLCVb9h3OdmJ5VmgSZ5vpPqfleBSXbdXBwD/5eIzdkbgQnqzHj206+EDndIr5aqvWJ15ehp58S1fY5hfjJZqXflMkW+Y3ufcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:07:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:07:22 +0000
Date: Tue, 7 Oct 2025 10:07:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 07/23] drm/xe: Read VF GMD_ID with a
 specifically-allocated dummy GT
Message-ID: <20251007170720.GD5409@mdroper-desk1.amr.corp.intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-32-matthew.d.roper@intel.com>
 <0ce62511-3c46-4d1a-aef9-8c5f5a4f4d0a@intel.com>
 <175940901218.1952.3042709661416045697@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175940901218.1952.3042709661416045697@intel.com>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5da3a9-e45a-499c-7470-08de05c3fb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T943SonlgGMYD3MmgfdGkzr7lr/2GEd2exYtoz0x9j0TV9Bln6mhEJrQ698F?=
 =?us-ascii?Q?8dbj/lQaePH64eM4WFnJ4bgzCnMRLzMVY7qMYHdS2pbahi8VVoRWNcG7aqid?=
 =?us-ascii?Q?emeKuSeaIFWZKF9UL/va9wezg4ouuWXdZXkZXKTo1f21xckQfZgUi58IkAzI?=
 =?us-ascii?Q?HjEC/wKZ6qRuYa1vcbDxiQDw1/SdA/pWoLd4XfTHfTyJa2OEiy3prgNEOFXR?=
 =?us-ascii?Q?MiSYkfBkRCG9fR39AYLmBBvUWCZYiIMiVegT7Ew3ryUrU0+NRht04w/8Y7yX?=
 =?us-ascii?Q?cCZD2Z1QJ5wxQ4xJXbc7m5TZLZ7TYXrwwHdF6x8+qyG9jQctXqIsK0KEySWj?=
 =?us-ascii?Q?9WtZ7pPJ27Uw0yTylM5+yD5MjDAELA3RCvgrfwdRikvytJlMGkYtC+QTnbWT?=
 =?us-ascii?Q?A8qFSORc7uI2yqjsu5VDRxumhvqfb6p6dxUHo+A+8lk6a/7TYkGt48Lv+7N5?=
 =?us-ascii?Q?0OOLcdmyNb0PHWNCM5WAclDyxahTUxx1Qoq/r/LHG72W9C8WBYPfDR6UGmsv?=
 =?us-ascii?Q?2JfGD4vkxHfH6dv8b8jvv6fJnk+szqjmglt8di/COqsx5qz82c6aiYov5XY2?=
 =?us-ascii?Q?yBRty29V84TNVPon9x+7dVJmZ2D+q5LJktM7XdRTbdS77u81H2J4FU61sIGJ?=
 =?us-ascii?Q?lBNq2DqbUMN+13Lau0GQRF+hZkSdYebXAhjKb5tMbVQu0/MBRukV3f7eguY9?=
 =?us-ascii?Q?DKpDI+DhV5le+j0cQdnGuYrSaMhaOKdkB3ZXcHF++jNV8Xx1mHgcDVpfrHEP?=
 =?us-ascii?Q?uBpkJ5oKMBfgUEXn2gZo5HuQz3XhmLrkwC994hv6CAIqhCBYo2Dw4LjRlzs4?=
 =?us-ascii?Q?Qr37ZIyTxbSWr70feXkUbfp66MkmYrn27QUgXSLBiY8k+iYKYzrqetnR2xOw?=
 =?us-ascii?Q?CdPvhg/fRc1cwKR37bfgidJDPj6MoqevotZXCDk3/Qnd8ey2w6D6Ajht6Sbg?=
 =?us-ascii?Q?3L9vjvta88pyhgh5xKN7/k9qUfbkh28F4lVsUHGhlSCco469LlQQ9/eLEIbo?=
 =?us-ascii?Q?MIjHavr20KShx8wHcUC4jyeir5LJQH3JYXQNGeZwWDhoEB0FTjaVC48U3c7q?=
 =?us-ascii?Q?/Z4OrFAVAWPS997B1By+6uQDeceXHMLxI+jGZuJCfSvxcXlcjFQXgDcxd9Rb?=
 =?us-ascii?Q?BgSbOmlVf5K8GjNrbciOSKcJha1yVWfXwucyhAo+R8n+SJScW3YK5hdmASm6?=
 =?us-ascii?Q?icWt6sk0DXdxGTqGcIHNOwNl7jtvKXmvdeXpLixveema4D13cSK+JH7w2A51?=
 =?us-ascii?Q?hueJprbGm4YKhOSf+3WPGMUFKIIgvog0W696GQRr/WQrGIenNus/iCI11Fs7?=
 =?us-ascii?Q?vX0/S5JpAMgEhpg312/QocjRghcJ01ooJ0ZsrYjP0sR2edkX6tuVr1/W0ouZ?=
 =?us-ascii?Q?ki+L4xgBfeY2VhSs1Hulcj/I7CQOcUqpwE6/VdbFcL2ki7jxBfjJbJF2/xdy?=
 =?us-ascii?Q?Yg4VIlSImWOOrRNzz3fGohkOLaDE7yac?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qQpQia58hKui6hvTVqz2RMeST4YR7QuUk8WVXJtGCkplW39ajoFVodLTOwVl?=
 =?us-ascii?Q?Fvn7ccd2ESCj+4OCbbmE/0vS7T5FDyyJvdvSCISIh5zWkhQyxmxqQnstXC7s?=
 =?us-ascii?Q?MlNAe1dLrcCY/eUtdLWRLzl+tkz2kGhNjsSvQ+07l09nNuIjnUBdj3tMI/t/?=
 =?us-ascii?Q?Q84CS9FFjve/5zBsn3abEr9TBMhwNqpBQ/2cWTrOgxLN41L2MiGNum2K6Nr4?=
 =?us-ascii?Q?QBuZBXmhunZ6KAGfuQYeBCDhaBKuDbq211+Xo4HFwzLpEsliFCo2QjvATkzz?=
 =?us-ascii?Q?2K+7j/9Jxo2nH+1bk4W8f8eEzMudyI0M7XSIr6LIwgQ3UDTAjKQlZmzzLFSR?=
 =?us-ascii?Q?d2CLfFmpfMUXPSPJRAk+Pp1/UyA/fKGFyCH5xmiQN2sEPYLJ2Eo5zTMeGv5s?=
 =?us-ascii?Q?zJB6/A2Cm5+NeE5G7qlJgV+oOzmXRzJGZ8RIf6l18Ig13RAT2hKwiVWR2Amj?=
 =?us-ascii?Q?JOY7ov4Cph2MuBEYb7zJiSRBkVO3TOKGrL1cZjmi7FPVLS6qPvW4KhYieRlS?=
 =?us-ascii?Q?+uW0o5qnCIcVYqUssGjDxsl2jQyH09n0aGDCQ/bi0VI5MZnVJM08oIG4f5lB?=
 =?us-ascii?Q?cMCjC8z904DSkKXml4dPNpDLso7cXGRYa3wBPu1CpIATtunjpJEAknMbMQ3Y?=
 =?us-ascii?Q?eTeLRtYcpdKefn1sgY/rtJSNDryUm/jq0d0ui3mXfToo1L77ekLSE0LrTd+4?=
 =?us-ascii?Q?zQmyXFU0prpmTzErfT2J4XiDUJ7k/LY5/SD6QmAZjHvNDh2P1DmQtTC6Y8q4?=
 =?us-ascii?Q?HsD+eQOUXe5cpeKwJHyd8LIOhEUh9b6ye0JtL02xidmwqZZFUweeQaCVg6Gd?=
 =?us-ascii?Q?FnOTLYwcFux7OM8bmya0kGWdjXgUfGBF+HUVyY9/gC9IMVXreh6fXma3tu+W?=
 =?us-ascii?Q?JcxKlyyrMFZ+KVbRe0GeUkHnyY/lO0xb5kN6UrqHdP1elVo+M/tgx8G7CGkk?=
 =?us-ascii?Q?O6S+M92t4rkJ9Qq0x9SKDDlZbgVQAZJixBNvSGTLWkLHSUeNKTvR5zjQRKJJ?=
 =?us-ascii?Q?DPDyVIFH4AR56CAMAAfQmVLwvze1rCs24osuPTNWT7ECc/ZQ9pD8dm6/Q1OC?=
 =?us-ascii?Q?LYTcQSY8ZhUqwx3iApHgFsW28hKz1DxNetcIcBlbo9Z3/F/j9mAwWfDrIA9/?=
 =?us-ascii?Q?l30djnyzdwNkdUekY5OiwjQVtXKN07HyaLfOZDHoRq8SxlCRnQFE/oa5nSLu?=
 =?us-ascii?Q?ID+6o3kQn8fVgNXemEfcr4kB2yj6bC/oPTLpngNxyVEoYrzJMStchECu3RSg?=
 =?us-ascii?Q?IQATmxt/fyVLsXqAn58aNGZCDYyfQOc6ZQLuLgoZHmpa7/L5SHqqR1thg4RG?=
 =?us-ascii?Q?l+IRJthaKA9HllIWiGIQNfEqN1xImBVWrB4UvQGTuLbKHPLHR4QEb0y8OJBJ?=
 =?us-ascii?Q?YBqyGonfYEEEgUVPx9iRfls7PliLEZLXPxO8x80Vipv/o/kOuXEvFcbWpRaU?=
 =?us-ascii?Q?lSwdcy6byR14abkDUYoN3xuHzLDFbxLT7xbQKVJF+Gdw93iSnowqiAcKXtDc?=
 =?us-ascii?Q?Thr+mVEljFs4S1S61zUss5JAM0mT4zqABcyAOPgU3ZwppPATC2D/iKF0enYW?=
 =?us-ascii?Q?GhULCUUT0QHX+yPWYsSZqXBn8aOyepv5P+4f/eM8Z+b9osOXQVu1ZwMwIgQM?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5da3a9-e45a-499c-7470-08de05c3fb56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:07:22.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUmN2udDhnwJNqAgrxnbI/nt8uwirreAffKg+IEDdMIHRU6Musjvehs8/48j2DQ4t/gSFm6eh1QUgl9TEJIGj5rEHdijw3BLJpuxpp9Epb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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

On Thu, Oct 02, 2025 at 09:43:32AM -0300, Gustavo Sousa wrote:
> Quoting Michal Wajdeczko (2025-10-01 07:07:04-03:00)
> >
> >
> >On 10/1/2025 12:56 AM, Matt Roper wrote:
> >> SRIOV VF initialization has a bit of a chicken and egg design problem.
> >> Determining the IP version of the graphics and media IPs can't be done
> >> via direct register reads as it is on PF or native and instead requires
> >> querying the GuC.  However initialization of the GT, including its GuC,
> >> needs to wait until after we know the IP versions so that the proper
> >> initialization steps for the platform/IP are followed.
> >> 
> >> Currently the (somewhat hacky) solution is to manually fill out just
> >> enough fields in tile 0's primary GT structure to make it look as if the
> >> GT has been initialized so that the GuC can be partially initialized and
> >> queried to obtain the GMD_ID values.  When the GT gets properly
> >> initialized during the regular flows, the hacked-up values will get
> >> overwritten as part of the general initialization flows.
> >> 
> >> Rather than using tile 0's primary GT structure to hold the hacked up
> >> values for querying every GT on every tile, instead allocate a dedicated
> >> dummy structure.  This will allow us to move the tile->primary_gt's
> >> allocation to a more consistent place later in the initialization flow
> >> in future patches (i.e., we shouldn't even allocate this GT structure if
> >> the GT is disabled/unavailable).  It also helps ensure there can't be
> >> any accidental leakage of initialization or state between the dummy
> >> initialization for GMD_ID and the real driver initialization of the GT.
> >> 
> >> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
> >>  drivers/gpu/drm/xe/xe_pci.c       | 61 +++++++++++++++++--------------
> >>  2 files changed, 38 insertions(+), 29 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> >> index 0f136bc85b76..969f1dacade8 100644
> >> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> >> @@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev, char *desc)
> >>  }
> >>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
> >>  
> >> -static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> >> -                            u32 *ver, u32 *revid)
> >> +static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> >> +                           u32 *ver, u32 *revid)
> >>  {
> >>          struct kunit *test = kunit_get_current_test();
> >>          struct xe_pci_fake_data *data = test->priv;
> >> @@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> >>                  *ver = data->graphics_verx100;
> >>                  *revid = xe_step_to_gmdid(data->step.graphics);
> >>          }
> >> +
> >> +        return 0;
> >>  }
> >>  
> >>  static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >> index 37ae49f4b648..9fb5df10844d 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> @@ -464,7 +464,7 @@ enum xe_gmdid_type {
> >>          GMDID_MEDIA
> >>  };
> >>  
> >> -static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
> >> +static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
> >>  {
> >>          struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> >>          struct xe_reg gmdid_reg = GMD_ID;
> >> @@ -473,21 +473,19 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> >>          KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
> >>  
> >>          if (IS_SRIOV_VF(xe)) {
> >> -                struct xe_gt *gt = xe_root_mmio_gt(xe);
> >> -
> >>                  /*
> >>                   * To get the value of the GMDID register, VFs must obtain it
> >>                   * from the GuC using MMIO communication.
> >>                   *
> >> -                 * Note that at this point the xe_gt is not fully uninitialized
> >> -                 * and only basic access to MMIO registers is possible. To use
> >> -                 * our existing GuC communication functions we must perform at
> >> -                 * least basic xe_gt and xe_guc initialization.
> >> -                 *
> >> -                 * Since to obtain the value of GMDID_MEDIA we need to use the
> >> -                 * media GuC, temporarily tweak the gt type.
> >> +                 * Note that at this point the GTs are not initialized and only
> >> +                 * tile-level access to MMIO registers is possible. To use our
> >> +                 * existing GuC communication functions we must create a dummy
> >> +                 * GT structure and perform at least basic xe_gt and xe_guc
> >> +                 * initialization.
> >>                   */
> >> -                xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> >> +                struct xe_gt *gt = kzalloc(sizeof(*gt), GFP_KERNEL);
> >
> >nit: we can use __free(kfree) here ...
> 
> Taking a step back, do we really need to allocate this? I get the
> impression that keeping the dummy gt on the stack should be fine since
> we are keeping its lifetime constrained within this function.

xe_gt is a really massive structure; I don't think it can fit on the
stack.  I'm having trouble getting pahole to give me an exact size, but
it looks like it's somewhere around 23K.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >> +                if (!gt)
> >> +                        return -ENOMEM;
> >>  
> >>                  if (type == GMDID_MEDIA) {
> >>                          gt->info.id = 1;
> >
> >it looks that it is still crashing in xe_gt_mmio_init() called from below
> >
> ><1> [146.543510] BUG: kernel NULL pointer dereference, address: 0000000000000028
> ><1> [146.543528] #PF: supervisor read access in kernel mode
> ><1> [146.543538] #PF: error_code(0x0000) - not-present page
> ><4> [146.543611] RIP: 0010:xe_gt_mmio_init+0x27/0x1b0 [xe]
> ><4> [146.544175] Call Trace:
> ><4> [146.544182]  <TASK>
> ><4> [146.544196]  read_gmdid+0x12b/0x2a0 [xe]
> ><4> [146.544601]  xe_info_init+0x50e/0xc90 [xe]
> ><4> [146.544948]  ? drmm_kmalloc+0x87/0x100
> ><4> [146.544968]  ? xe_device_probe_early+0xdf/0x230 [xe]
> ><4> [146.545253]  ? pci_write_config_word+0x27/0x50
> ><4> [146.545274]  xe_pci_probe+0x163/0x600 [xe]
> >
> >likely due to NULL gt->tile
> >
> >> @@ -503,12 +501,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> >>                  /* Don't bother with GMDID if failed to negotiate the GuC ABI */
> >>                  val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
> >
> >... so in case of bootstrap error we can easily return actual error,
> >instead of returning plain 0.00 version
> >
> >>  
> >> -                /*
> >> -                 * Only undo xe_gt.info here, the remaining changes made above
> >> -                 * will be overwritten as part of the regular initialization.
> >> -                 */
> >> -                gt->info.id = 0;
> >> -                gt->info.type = XE_GT_TYPE_UNINITIALIZED;
> >> +                kfree(gt);
> >>          } else {
> >>                  /*
> >>                   * GMD_ID is a GT register, but at this point in the driver
> >> @@ -526,6 +519,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> >>  
> >>          *ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> >>          *revid = REG_FIELD_GET(GMD_ID_REVID, val);
> >> +
> >> +        return 0;
> >>  }
> >>  
> >>  static const struct xe_ip *find_graphics_ip(unsigned int verx100)
> >> @@ -552,18 +547,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
> >>   * Read IP version from hardware and select graphics/media IP descriptors
> >>   * based on the result.
> >>   */
> >> -static void handle_gmdid(struct xe_device *xe,
> >> -                         const struct xe_ip **graphics_ip,
> >> -                         const struct xe_ip **media_ip,
> >> -                         u32 *graphics_revid,
> >> -                         u32 *media_revid)
> >> +static int handle_gmdid(struct xe_device *xe,
> >> +                        const struct xe_ip **graphics_ip,
> >> +                        const struct xe_ip **media_ip,
> >> +                        u32 *graphics_revid,
> >> +                        u32 *media_revid)
> >>  {
> >>          u32 ver;
> >> +        int ret;
> >>  
> >>          *graphics_ip = NULL;
> >>          *media_ip = NULL;
> >>  
> >> -        read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
> >> +        ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
> >> +        if (ret)
> >> +                return ret;
> >>  
> >>          *graphics_ip = find_graphics_ip(ver);
> >>          if (!*graphics_ip) {
> >> @@ -571,16 +569,21 @@ static void handle_gmdid(struct xe_device *xe,
> >>                          ver / 100, ver % 100);
> >>          }
> >>  
> >> -        read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> >> +        ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> >> +        if (ret)
> >> +                return ret;
> >> +
> >>          /* Media may legitimately be fused off / not present */
> >>          if (ver == 0)
> >> -                return;
> >> +                return 0;
> >>  
> >>          *media_ip = find_media_ip(ver);
> >>          if (!*media_ip) {
> >>                  drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> >>                          ver / 100, ver % 100);
> >>          }
> >> +
> >> +        return 0;
> >>  }
> >>  
> >>  /*
> >> @@ -690,6 +693,7 @@ static int xe_info_init(struct xe_device *xe,
> >>          const struct xe_media_desc *media_desc;
> >>          struct xe_tile *tile;
> >>          struct xe_gt *gt;
> >> +        int ret;
> >>          u8 id;
> >>  
> >>          /*
> >> @@ -705,8 +709,11 @@ static int xe_info_init(struct xe_device *xe,
> >>                  xe->info.step = xe_step_pre_gmdid_get(xe);
> >>          } else {
> >>                  xe_assert(xe, !desc->pre_gmdid_media_ip);
> >> -                handle_gmdid(xe, &graphics_ip, &media_ip,
> >> -                             &graphics_gmdid_revid, &media_gmdid_revid);
> >> +                ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> >> +                                   &graphics_gmdid_revid, &media_gmdid_revid);
> >> +                if (ret)
> >> +                        return ret;
> >> +
> >>                  xe->info.step = xe_step_gmdid_get(xe,
> >>                                                    graphics_gmdid_revid,
> >>                                                    media_gmdid_revid);
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
