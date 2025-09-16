Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD5DCAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 17:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9E10E0AE;
	Tue, 16 Sep 2025 17:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BO/RGqsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6267510E0AE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758042497; x=1789578497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d6U9Z2ypGnAKkJSpF08Da+niBDknh8z/ckMCsBuHcuk=;
 b=BO/RGqsbxZW7PG/fsOyrOl/XtChMY5jUm0UJj/Ez1QHKz3VnnI8bcowl
 f9k5t/LXnDdM0fuiXLPzoiBx9xBhQd/qRiI1cFk5uYMrcanuQ/BDOr+aU
 naEfmA/6cP8fOjss/kVca8ZukdvvY7eRrN6rcA9Cca8Gr8+uTX9lB0d8L
 5cmGNKRs0ihIF1e32i8j5kHVFqOK5OmEkaukV2Y4bwdDNJgF9mIJ4bMIY
 OTsecy5sKLKxS0EP+qEsgfZN19WBdfFyT/N2ZqsWxLYNlIV/EoG3K02cb
 xVSy2zIVAda8DC5mkmxLNCFBuv/kIofWnbUbdS/3DoEhfz1nYIJUeTxft w==;
X-CSE-ConnectionGUID: dF0XJM45TuGKV1DIjaIzPg==
X-CSE-MsgGUID: u0Ypr0GHRPiWAyS3r8Kb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47908217"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="47908217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:08:07 -0700
X-CSE-ConnectionGUID: uQ428PnqQRuBKs2Eo3L9gw==
X-CSE-MsgGUID: y39M/Oa6Rey8LSijEVd86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174107276"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:08:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 10:08:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 10:08:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 10:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdIjv8Th7ZPRNVZrxYTT1bSmwyWYQljnatNinVFoy+uON4GsIMoT1xaNktyqOrGjF9gMbaDATGo8THICElzXY9HjVL3dVbY962qyD2mC62EK3CNGenrysPpcLJnabDOGjY/IJhqo9SmqxmeTHRHMYpSFYxxjXZMeAlZPwxKaxqW1BR8yAteMK+h3gr/4oOumOajfKVgVHUOyD+Xr3AFxg+tnK9npNwcDgdeEymdPkvEsVTwRGHmN4T4d7A9/yJ6XYcXc2/2g7znkL6uufU2QcOVKFZIJSbDb+QKxhh8o8IUen+TFI5XnV/MDmoviZb1jsO9J5XlnQ+UtBEmK3ihFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bkHI9yUrHv9LFJ9VsSI0YX7UTlw69H3e99hMDUHBnE=;
 b=TZyvU28ruHdj88IoI5PsRR3HZrJt0ZI+LP9R5RIiSfEfI+Ge7Ag0hFs+AL55HioV1NnQCvB1dy6Dxb+wkUeKqDwi1lzRNRSl14X/r/UFYUHuC6liTYRBJzScxQfcRa5FNbC2PxHM7ZQjozPn1gb2/MKsU9gtD4KoJXttfJxEfyItyj1MhCCzfsMq3UBH7PILT9vrrXH6YbsiZ7/0Ou/ZoLNvMZ8Fo+zpOXhqkIhCdT/ePse8I2SWzzR+K6IeM8tWZqkiu+3k1v9sHIhTg8SrX2pdNPXG/0Y2nnodYGexGT2Ka5grh1RbYOLUUhKI2Iu08cFdRGrh9c/16ap2Z/RyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 17:08:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 17:08:01 +0000
Date: Tue, 16 Sep 2025 12:07:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>, 
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Don't expose sysfs attributes not
 applicable for VFs
Message-ID: <5ys6omq4voskicuocna7d4ka52lsjccyvrq2gzeikcjp4jy7rt@hecvmrlvi4cm>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <20250916170029.3313-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250916170029.3313-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e7db9-9df7-4071-6fb2-08ddf54397d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2EHkbPGzck1wrwMRC/bsFA0fUFz/+v9wfezb99niKE9hlqMdb7M8G6Uv3d3E?=
 =?us-ascii?Q?KxYiMEUXqEDdIklaySEcJG7bv1O+z2sEHpaug57aKYXHO7CLffeizmUcztlu?=
 =?us-ascii?Q?pfcpDaPpRZBgEm0cmxZnsE6hXry4cmgESJUvxXG9MetENcTgbdtbUo7dxqFv?=
 =?us-ascii?Q?n2bUlHGBwYzEEdKO92XdZWH3T9hK6uRSxDwEKoBYLJ9/FawbBgvy+OSC8fqR?=
 =?us-ascii?Q?SKZXE029mUef1nds5GJG2x8WOdCKXh2Z5oQMeeoEtX26l0Ao7SkyL+rmFGNG?=
 =?us-ascii?Q?PO82q5iV+c3Iue1QTvBagQE6agKxvtBUlqK1BeGBgahL58sm9EzAkyS9GeUR?=
 =?us-ascii?Q?dTrKlNiTDXAqJe+rfhVioU9fFDcNfrUCZenlgC5YmM6FQ9jD8KpE+5GZGDYy?=
 =?us-ascii?Q?hFIOX/DgFpAYHZWhl9IbylwpoeBZvJgrnVf1yM0MkUYG0tp6OEoiWWuLuFW3?=
 =?us-ascii?Q?0NFmt67QIm7I9DeK++C82r9WvTNlQ5zYUeQw7deQXVVEHSSkucpJ1cX1ROgZ?=
 =?us-ascii?Q?24sayDOsU/XOhwLyOfvnOYs+9pprCUsMDKmnMWh1ssSlprepsy7Koh8fMiNl?=
 =?us-ascii?Q?Y+WKokEeNwyWlwdxmfnoLkAFR7s+c8W5vrhg9pxzt3rJq3FxIismGhOtIW4U?=
 =?us-ascii?Q?Otz9/kdeMIBog3gqQwML/T9J8Jp/KsgVqBBX7M+GPH0cAdK+tn2z5H41e2SK?=
 =?us-ascii?Q?BJMWDtO5bMJ6/lnazpKjCFAIcWuWsC+LaJNztUkAxb1+53ChyZ6QlXPm3zDL?=
 =?us-ascii?Q?GllEs2EOeDy6bTyNTF6B+MF3E2hE3dBtvlJmOc4xfcW+i9FGOJWW7GLcVokR?=
 =?us-ascii?Q?xRyt59/5rrbNKOe/108VEh0k5u+K0rH7W4TAzptUXXki/r+8dyunmjOlC9NK?=
 =?us-ascii?Q?p1Ws5jAbT6cjD6MKUgM/FksDMIVlNm0cKFU38DyEYOFpNCCEnxkDsLPMlj15?=
 =?us-ascii?Q?LRnv9dWSRWkEMfSMxIDuUV/9ClbpBJAc1cxiMsMGCm+H4J4ZWwrNZj2rrBy8?=
 =?us-ascii?Q?fgCOQZiL64UR/LuVeUtmnSsezL9KtorXuENwVqjDglcqmkyzXbiRoMzJbPAl?=
 =?us-ascii?Q?mYgzo9oNdcEHExm0FkY8s8NV7w2y3uOxW6CWnnjY+5QTDRUuOe8yirqN8tsJ?=
 =?us-ascii?Q?MDU1ldEO/gX8DAi7tpE31wSJ01BYRwQRFxCloz2UmtVKpQ1PoKor7xP1etUT?=
 =?us-ascii?Q?/D9RRce06e1az8hzsAFNu+7aRZBx/ImNdMhQFHUHJY49FaqImLfxOzOCPTDW?=
 =?us-ascii?Q?lPLLwGQhvueDGTW5DHxADHolhbg4hLAUFe02I1LZZVmxI8xVTayR7u2Qsaum?=
 =?us-ascii?Q?iqO3Ch9iXrZ57sUy9y9hV//urwAf4XwB4TCnh0sKgr3OV6KE0qLqyR20Rj7R?=
 =?us-ascii?Q?48A/Os7T1gJtuRo4x1jvbyVpn88v475zneNM4ykg0FyfKcO7a0pSwZcz5Nn8?=
 =?us-ascii?Q?TmZs40UfckY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5OFPy/M5WxfVrs1ukYv4l6U1ZSUZF/jolF3acdl+vswyBQ608+ACN/EW1JC?=
 =?us-ascii?Q?tpss5jtOlVFgeYipkH+gMU1IFgNxI8ragUDdk5cNS3HOYFniwB01S1kRhHEF?=
 =?us-ascii?Q?KQqWk30R4XlrOi6BWstxBWVha/s0ySkE818DJuQ6x8B9oX4/ovRh3xkXaJh2?=
 =?us-ascii?Q?qGjQnvngOxjNu4hfrGlOvfdjPyiCAb87vWBBhEo/ZjFfae3GvOC5MEOapg2r?=
 =?us-ascii?Q?HgkXAQFn4M0ZzESVAu6sP9XN30A1mp8zJgqizrgqZ58PYgGnPVGw2HGGJUYy?=
 =?us-ascii?Q?cdiNM/ADpIYTIRmO1BL3chVEOmZ2SF9A48ut+AbS6XFNlcntrr+5yKVR3et3?=
 =?us-ascii?Q?RtNKFbxHaRxUn0CpGEto7/yGp8M3mTJMNpxKY889h1g9jMtps8o7uZmDDhgA?=
 =?us-ascii?Q?88SZQcA1SIqu7qPPFg92a04/w3Ea0tC0onmJFVfi770Qjdxy8ZjQuM9uICEf?=
 =?us-ascii?Q?lNkpSVe3lUBp4tYqFVcsNCJpfNS9LtLzrNgGBW1MJo6M3Dr8nKoOKvWo/8Tw?=
 =?us-ascii?Q?JVmHu7e28Xfffoap1EpFU3sJTDak958CNK+Yh8UcW8Y5DsVKYT7wAZN1RR5I?=
 =?us-ascii?Q?uMZh7PPwG7BRYQE65Zfk1nq5PI/ZGO68pcZPf5Kl+XUVE+u5XwfPNeNj5sqF?=
 =?us-ascii?Q?ZtxFjudQfxFAf2lsIsH8fr9BBubaKqS+diUlRjreMYumnP3Wf+h13urYPIb0?=
 =?us-ascii?Q?47cvx/Muawep0EB+9+0ekI35+doyrP3hyp4sdsw8oGDTHAZOQKcqk6vYphUq?=
 =?us-ascii?Q?FB8oZybQNZAx8KMxMetnx6OrGePHGz1tHmOvOfySdkoKWt2MoOj4X9us4PYo?=
 =?us-ascii?Q?e8LHk4FCDlZw2Lc5B6EOqW227y3JSWlKIinnkLnXA4fa3WBvmkoL1OwRY7B6?=
 =?us-ascii?Q?GR5I08GpNHCySLrl+V6qdsL60AhcQeodko3raShNf0SAlKVJzjFJyKjVUQI7?=
 =?us-ascii?Q?TZ/17veOTyN5U9+L7/STIjrdZi9Jq02nFxanygML6an3TPGCk447Xm2RnD3x?=
 =?us-ascii?Q?f2qAeCCA3WX0KHjDyuih3inO8TK/jpyjRlqrY7RVJLd3i1XxNco+3AqS2L+x?=
 =?us-ascii?Q?0DZu/44V1KsGjqQ5k6H0OJWnF+5IW78WaGM7gN+p7s6r8rh6BNIQnnJFXHhJ?=
 =?us-ascii?Q?PmOukyu7xxm7yuwz4cQgaqwJ3Vqx0ElcB6sBfCKUBMD7Xs09s4RQ2gNjCsOS?=
 =?us-ascii?Q?Hs9yXj/MuznyROnfavKhgbsT1YlTCHyGPaA+gRCKHxikaETV8qYigDL7oF8m?=
 =?us-ascii?Q?ah2oJdOmAJrcbrBVMTFJzLciJnZzn9JbZb72yz2Ab8tXZvjE5Ag6bPRHB97J?=
 =?us-ascii?Q?1BWslNfz2vfskn/JRViSo1M464DqLP+JBwXKCpUS6lR+HEfmJxALz67tOnp0?=
 =?us-ascii?Q?rS2STNNGhbDd15fmNpfwRE+EKJTFU3ViSRh8vOqyF9kRg6jN2ip3yZffnFsX?=
 =?us-ascii?Q?RFVYBCsmmXgKE+7+L+1j7wa7TCF72AJxCL3LDAn7RqoW5fziGGJDYRTwcHUH?=
 =?us-ascii?Q?/ozm6OrLQ33jbTF44iShBvmpPp7OSkVQg2n2ouNh1ENkDtOop1TqpCLluOPQ?=
 =?us-ascii?Q?gGtQwr8upI2GqxiKCyVA6TNh3hVCy8+purfdKcPti5tmZwl0D6e0huWpF76S?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e7db9-9df7-4071-6fb2-08ddf54397d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:08:01.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81i6kK4cyz50qqpTH2POp5PLZCrje+xhWvir7q3Gk+45NyQVTj/ftitnNikeVpcFPco1ikr7dh9IJBhWobwCsWZ0WUQGwZcjyPjZSKXDBE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
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

On Tue, Sep 16, 2025 at 07:00:28PM +0200, Michal Wajdeczko wrote:
>VFs can't read BMG_PCIE_CAP(0x138340) register nor access PCODE
>(already guarded by the info.skip_pcode flag) so we shouldn't
>expose attributes that require any of them to avoid errors like:
>
> [] xe 0000:03:00.1: [drm] Tile0: GT0: VF is trying to read an \
>                     inaccessible register 0x138340+0x0
> [] RIP: 0010:xe_gt_sriov_vf_read32+0x6c2/0x9a0 [xe]
> [] Call Trace:
> []  xe_mmio_read32+0x110/0x280 [xe]
> []  auto_link_downgrade_capable_show+0x2e/0x70 [xe]
> []  dev_attr_show+0x1a/0x70
> []  sysfs_kf_seq_show+0xaa/0x120
> []  kernfs_seq_show+0x41/0x60
>
>Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>Reviewed-by: Raag Jadav <raag.jadav@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
