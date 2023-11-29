Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BE8C10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BB610E6A2;
	Wed, 29 Nov 2023 22:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6F10E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297365; x=1732833365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+dTnocr2dR02O8KNX2uVr8uLOp4+wg1HRh6ZA3y5nks=;
 b=CGL1/yZSzsJh+y2AWk/H6Vm20TN1qn3cqLtQUTzvf4kc210u07ttZfo8
 bjuwLmmpBoKVrM6R+sRSIYH616x9ZpY+2XV2FUeRDK9MzDNZIgRybbmZT
 6KTt4mP2503eRkItL5DJMK8RvmpmRQ3IunwfsWZv2nDE+JNhuvrWu6wOQ
 MLpyRz7ZMesAFi1FOeTz7r3ZPluc7vWx84HnhnIqafycsfKqAxEuj4Q78
 1jy2bbKZ5eMgUMvBqAnnoC16gjEauayEMFL2vIcHuD+IpjTaIafb1fkpZ
 GyQ8rHFcBQ+LfVckwDEZMuwXK7xIejnx0++OyMCYj3trE5arp9PNep9+g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420135"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420135"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891953"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891953"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxTgg6mZ9+WIkBfyDV0a7uBZwHVqpYtWVa5RROHjuEDF1EFmyzRak/4Vtep9JcvEUnjsJyg0wDduXyT4oJr4pFe5NA8lxKLL41AiCkS+e8iTCiqGvDB2D0HQRa1GNwt0az7Na/Dn+NxoQYzOmJQtKe2jNuoVUt0wvF9DnK8s/2De8m9fIXWNHllPD4nNaUOT/hvqZ/YAq7jheMZnlZq3+qnqM2YtGH5+7U2kHywzUYUjTMbCbzlkZ6OJbOxKNyy8BSJp2swxPaUF+Y49vLW7xO5mfjWAR5IygCslmxSQMzRtwymENOoScqIUqoDGJKilPIdA+8H1Xd/9XPDDst9MlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viJqsd7uxwAk6p5/Fu0ifLoR8zW8Lb3p3jloFHmyjSo=;
 b=YUW8uPJcdJPZDxVp2PZXGBIt8tz3l/Cbe3flXQIERsgoLyZ59zerERQrqzoOiKtgi2YGG+k3aaBp8zn9wMafJT01wqtmAPWlFJCNdXFB3ipZVr9EytTToeQpc1hoGGdZcLoV+Gej1LbNBaKbrJxPgkXzwFLTyR0YoMVa5+hUfYV+qqaYOzdM3dc21WVbQYpFGj1EadKn8BThn3/cQSNxiG4nqFfeqi8CTq7Dn78N5PU+TSvzWJxx5T2DXOTHrk9Hokj1cYIXnL+G8ESvnVBU3R/ubq2mk7YNoSEypPgDz685Q4LUk1FB9IoVWAKcr5y/4UPnyp+vzkF7ZysBhsH5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 22:35:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:53 +0100
Message-ID: <20231129223508.1189461-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dab86f-e8fc-4936-d176-08dbf12b8c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dk3jxg8I0fiXST4ehBCQTz2tyCbk5BOGuanjJX3qmU01FF8dLWPUyJ4FDNfIYmoyt0zI78+ydszZV88DexkXa7uw2mKeFRfUqMS7qj7wU3Zl1Arg3andBp4Ic0xkx4V7m4H2oaksg6BaNwmGyNRNZpA1OIPPYcnhzn0OG0+wzRW/3p8YRVqwv9zMPLMYbDpWeGpusZNortrnsHGbkLMCBhLFgTVSzV9VrareJ76YlI+rQgJXhbBbZOG9X7OW126/pmm3cfNGUxTTyXEiEo5/vsLViTWH2YOZwwsJbi4uJcfvRrqtIlP44iPGiJVzgkzINIwDcF25SyvEcYIHLjPC2nmHcA4csYXQeorcRVjMD6Jw8ZfXKBdHSSaG+7SzLuoor0s1sACMj4EzxukMo1ww0brAk91wCfVBXhRecTUxWxhiqGrRGyaWXs0nI30MMK/7WazSJeI3MnTLKTmj0jQ5pCCaWv/8qLrzXCVZEGSwsSvDIUZTACrc+6JU/UDp2wFUUo0OiXCakQtwmJ+E4K9iaAvm7DkiiCuipOwgxOcmFrzMYcQQ5K94LhdUUhwAdNT9ur2VgYkBP6anuizoCzViMuog2quDOfjDA1ym38hB7kODxQw2BqXFX7ak1MRtsC5q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82960400001)(83380400001)(478600001)(2906002)(6486002)(6512007)(36756003)(6506007)(8936002)(4326008)(8676002)(6916009)(41300700001)(38100700002)(316002)(5660300002)(66946007)(66556008)(54906003)(66476007)(86362001)(202311291699003)(26005)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1EwSnlHK2xxblp4TGZzZXBlN0dTajBDS1g5RS82dGRmeEx1aTE3MVZ2ZERw?=
 =?utf-8?B?dndUWjNWd1M4NUkyT3YrNzQwbVRHbm1HMTE4NElsZzlWME1sbWJtSS9NNXIz?=
 =?utf-8?B?TzdyZ3FOVW94TlN1VUx1NnErOGpEMW9jTHA2Z0tEOWplempEZUM4d3JLMkdj?=
 =?utf-8?B?aGVMSkVmU0owTXRLZlNNaXM2K0lXYklSempISXpBVStwSXV1RnpndVltdXU4?=
 =?utf-8?B?QUJON1l4WWN1dTdaWFNJNWVMcjdGWGpJN1J2cVlCUDk5TUNRNm9QZWpjckxq?=
 =?utf-8?B?WmkxVVlkT1ptM0hRZEJob3VIWnhORHZMYVpzWEZwTmVGankvUXBPT0tUZ0dQ?=
 =?utf-8?B?bWx3QW9xWlJ3a3FYT0RNMTA5NVZveDJFT1BRdEczYVdSZkVxWlFiZnFrOFhw?=
 =?utf-8?B?VHF6bk9kRW9hbkJqblFPRWdOZTdzaXNNWXhoWFVqbThDVlBSME12SGVtc0hP?=
 =?utf-8?B?Yk5SWGgzcnhFQlNPbG9qV2tkMUt5YVZyMGdVSTVFaEYwcXR6MElYeWY3SnVq?=
 =?utf-8?B?UXhQak92Q0RVN2krYkxGRE9vemVBaGo4YVRGRy9iaG8weUpjK2VGYzRhdlpo?=
 =?utf-8?B?VTV6OFRoZkxlMEt1KytzM1NZakJva2ZCeis2Rnc2blpKSTB2YkQ1emhVMkJy?=
 =?utf-8?B?UzJUcHJCQ1FiSFRnQzJlTkY3YS9aSk5ycysyY0djbC96YmpSRU42YVlRSWxr?=
 =?utf-8?B?YzhZc0ZTY0dPUnRqWUZKUTlkV2dlTW5maTJjOG5uMXZTRW1kTS9hSUNrbHBw?=
 =?utf-8?B?a2R2U29zZFRwRkhLT2krMHYzZWdrUGowNGJzVU14alZFZ08waGh3cG9xbVR0?=
 =?utf-8?B?aEZwUEloTTFUKzA0YTNxMVR0RmZtSHpTeGZUNUNnZ3gzRUJ5dzVaeVpqeEdh?=
 =?utf-8?B?RWE4RDFkeU9heVptYkVBaFVmT0tRd2RlQ29NdmdvaU1zMHRVMnBucEMzRm1y?=
 =?utf-8?B?cVpSdUcvWlA5UXV5Zmo0Tkx6U1VhWTVwQk9XaUl6WGI3b3ZSNDVNeC9ZOVZk?=
 =?utf-8?B?UGFpMHBmalFnR0xmS1VsM0dVaVUrQWN5dnV6QUlFUktONktDaUR2Q21SVnVm?=
 =?utf-8?B?QktUVEp0a0prSVRuZEhjdWkrb1gxZGRMY2FLZlRiTG5iNnZWb3FvUi9oR2Za?=
 =?utf-8?B?SHRJcXpPNkI4QVRONG1RckNOMi92aVR5b25ROEJRQmdReU5tOTNjaHI3Smor?=
 =?utf-8?B?b3ZSTkJiOU9tSkdvTVQ2TWVNcUJWeUlhTmNkK3BQUiswYmgzaCsraHFkWUdw?=
 =?utf-8?B?UXhsV2ZOc3pWcExNSUF1QURZbDJwYmlCRFpqY0V1dm5MOUtoSk5naDUwY3Q4?=
 =?utf-8?B?eFlGZDQ2ZUFsRFZiMWVxdDh4UC9CNmpxVXNuZDJ4V0cyWWdIN0VEM2VXN3U0?=
 =?utf-8?B?Q2t1TjU2aEFHVDFmL3psRTJmV2N3SzlhNTJ3ZnVLdWNrejQ3V3NGQ1NJWWNL?=
 =?utf-8?B?QnlwRytOTE9IMjNrZHFNTWEreGxsajNJN3RGS1lNQXM2WVlRUXdaZ1RCR0c2?=
 =?utf-8?B?RVBrNzJkQ3c2YS9CaitaSjNVNEhlbFBqcmdUdDExZVRxamc5RG4xZzZ1ZTJ4?=
 =?utf-8?B?WjZSMkJKM21VUENSZ2w0ckIzWWdVMWZYcVJaZEtiaDFxN25WOWx5UGdJSFVa?=
 =?utf-8?B?USt1NENMUzEzQ0FBNUhwaVNXU1UrNmdFVzZUNnI2dmJkZWkxYjVzdWhsbXJu?=
 =?utf-8?B?NFQ3US9GbGFqZHdsSStSVVpZMEpERzlEYVhHaGVaNFNham1jV0srNEhqKzM4?=
 =?utf-8?B?ay80RVV5THlxZkVsMTVVUjFMUHlCdkNQRDkzWFhPNzhjUFp6MDI2T0liZm96?=
 =?utf-8?B?dDZ3cWZ6NDQxSGpuYVdVWDRjSy9XbXVGQW9ONnBCSXhKYnZzY2M4RnJXN1d4?=
 =?utf-8?B?MCttNjFmYkwwM3p4UkpRT0JqSy9aS0RDZ3IwdHA0Wi9TWUFKTW5mdTlERUFp?=
 =?utf-8?B?YTRyVFZpcXgzbU82Q2VyVENSWTRrSmlPNGZCbjl4ZUdjVlJiMU9iUndoQXVX?=
 =?utf-8?B?V3UzY08xbjhYOHpRWlVZWWQxdS9xT0NsWWhyREFwOTlUM1VVaUw2TnhBalVB?=
 =?utf-8?B?NlZhZE9way9hYTVicGJYR1p6bDQ2bGg0ZGRzclB2R2l2QTBERnZqRklWQ0xy?=
 =?utf-8?B?MG9yU0xRNVRUcjBSOWhUNGdLaWpJUXM0WlNDdzA0eERMc21vOVorU3RBYWFU?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dab86f-e8fc-4936-d176-08dbf12b8c7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:54.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXw1SGIzF2GonafYXR3htEvNm3wHukZeT5YVeN+oZdMgZ6mf68MpvJ79lD0/NtBrQYBukc7Gs0rCTjEU0NzMcrNEzaSP7Fe100NiEW4P3Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 08/23] drm/xe: Map the entire BAR0 and hold
 onto the initial mapping
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Both MMIO registers and GGTT for root tile will need to be used earlier
during probe. Don't rely on tile count to compute the mapping size.
Further more, there's no need to remap after figuring out the real
resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9769d56988ece..d1b59021c9712 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -300,7 +300,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -314,9 +313,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -381,17 +377,17 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
 	int err;
 
 	/*
-	 * Map the maximum expected BAR size, which will get remapped later
-	 * if we determine that we're running on a reduced-tile system.
+	 * Map the entire BAR.
 	 * The first 16MB of the BAR, belong to the root tile, and include:
 	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
-	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
+	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
+	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.43.0

