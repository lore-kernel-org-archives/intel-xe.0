Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC88CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5110E4D7;
	Mon, 22 Sep 2025 17:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWnIk+i4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CECF10E4D5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758563896; x=1790099896;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3REACltFD63fZ+jehNCGqcbkS46E0xonXqEqaRuki5w=;
 b=lWnIk+i4k5Wt+YOYokr4EYr2TcDS3vx6bk+hXSoCqS8UOQLlK3pYEVx+
 LOshOhWKTPuZE4ecGliTi0Hu5GnVvSv27yBKoIW2PjFYXahkH28TtX8pv
 o0BL5jl6vFh0eMP5I4TsnaBHK1Up5SqFpR/q/ycfzlaZZZzCb8XmwpdTW
 etWw9RUQDLXJSc7gcpMmIvXdEQyWktFRhAuGIluR8DLwS+krv46Me5wRQ
 ubFnmClWFAvFlmLNl3OyuU3z3BA8Hz8c7nQpL2Qmoqcq6ddx2xmI74J9I
 FCEbq2JD7WyN9cySvH0D0n7ldSB8QvXmYRon/kPf0XqqfqrC7vPk/i1to A==;
X-CSE-ConnectionGUID: qUUTDMhZTrKT1FrG2XBcrw==
X-CSE-MsgGUID: A7SZOdhBRHq1s02bfHmO1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72257727"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72257727"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:57:56 -0700
X-CSE-ConnectionGUID: qYNv1E32ReiNtot0QovuTQ==
X-CSE-MsgGUID: I2WSmfvJRkWpNEUqInFJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180930131"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:57:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:57:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:57:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khcyVv1Wtorkzhm0khUuxxM/rDNrDsZjt2pH8LkeBeznu9E5SQ67BhOtJCFrSVbek1PuxyabouIZJGRvSKkh0mtPu/AkJncFokzEhjQEEAOSTEmGYy3RdRbIRzDWCXcEa/tgGbfa7appnQJITb1S3JjJXcyzW7TVEptRMl3DrJv9APClDV3KPteNh5nRVY4PNCG7D0F5u0C9DZhPZC0mrDwtCT5M7exa+3c5TMVkfUN7gPT7QqcoSVyy+MV1WwZnGhcAXrOWj4hYMcnLS+uJSZYiEbYuzHUt9hNp1nC8nhnc7U7ipkDHXex5BSiYWJ8a0R8ChOo7bLwOhKUYPsOOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnaMiE3ydw0kFAldiutjjGcx4lXLM6QQZB/d8PrihCg=;
 b=vfuGU38OJOktSyLIJhbUQ0ylZDsAdHnDqhQjEa81bIgxxR6kMYjpKN2smJ1vXQU8aIPd58t5cJPUuqO1gkB9nAWHEgEcwJj8ivOCaARq5B0IdnIptSB2/HXd6GdRGGvqNPJ8HfhwNBh7xCA15AQkG6/CDNEIW8FNbvNuxgtKKmAXBGxq5HnmjpCWj2sTjrVZ+nG6H5DaTnFPI/dyOLMwjN7kXXxDS/CXysbUjZIXdYT0At7SuzajGUnLvqwBEjIRHv0UgC8BdvTbZJQLSZ/heBixLpMufGbJQYnS/JGwcr2GgUQyD2VZ4rDN9/0AH81LVRWgtPHQ3zXm702ripHpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:57:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:57:52 +0000
Date: Mon, 22 Sep 2025 10:57:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/vf: Post migration fixups for CCS save/restore
Message-ID: <aNGOHV+r8mP5tIZ+@lstrano-desk.jf.intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
 <20250918073002.15242-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918073002.15242-9-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3af215-9805-47ea-a7e5-08ddfa018ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDg2SW8wK2dOWkgweGtaU095MmZhZFZaZUFMdDVia0hLb1FzUzdRK3E4UDdR?=
 =?utf-8?B?cUdtT2dQMDltSkhhS1liT0EyMmNPNnk0UDNoNGUyWGhuR214UHZhRVJmU2c0?=
 =?utf-8?B?ZXk2MzFTV0x1Y29zWnNsWkgwdS85bURUSFlkSStkMURKVVdUc0pJTnYyVEFn?=
 =?utf-8?B?TDA3OHJBM0o1aDI2eEs1MWYvQnZvVWJKR0Uxd3prQlB0Tzhubm9Ub3JSbCtU?=
 =?utf-8?B?TUlaQnp1TzB5RTNPalR5RndhZ0JTTk0ySmIwT2Z5NUxteE43bS8zUE85MGVL?=
 =?utf-8?B?RnlzdVg4UlV6OTIyMXJWelFFNkhxaVVNTjQ2OFJwMnR5QzlmaVlFU1NiNXBw?=
 =?utf-8?B?RXJsOE1sdHNrOVBrQk1GeHdIa1pCOUhSL3hYS2tIa3dpeUJWallLOGJPZVhX?=
 =?utf-8?B?MURJOVM4eTh5a05Ea2xibXVRVngvcmlPVUdVSllIMzBlZFNrK0c1ZVh4VkJF?=
 =?utf-8?B?aVQ0d2VsMDNNbW1mSkFHenFTQ0xpaWxoQXhJWGRCUThLeHo5YnMyWHhYajFZ?=
 =?utf-8?B?N1h4bTdTVDhYUFhyS0lqOFdRS2VNb011ZElQbWxwSjBVejdjY1RtSHRhYlJG?=
 =?utf-8?B?bWl3Ykp4aEtNR1VqalBvV0NGWlluZGYrWGdvNGx6alFvWnliL1pieFFLejZv?=
 =?utf-8?B?U1dsV2VhUUhGcFVBTjVOZWVNTVpJMWhBanY4UVVMOEVMek9SZlZrUUZoYm9l?=
 =?utf-8?B?bHNYV2k1a1NjUmtSVUVIVFlJekNQZDZiNm9iS3pDVVIzWHBUYjE2bXZkR1B6?=
 =?utf-8?B?QVVRdzZIUVpVN1RuamhzdFc4dTJIbmRtVmFEYVVwcUhzeGZlWXlMZ3JMZ0tG?=
 =?utf-8?B?dUI0Ym1EdVZFMGNUc09NQ1ZjL1crRnZVVmRJclFla0N4aEJGdEE5dUJUYXRw?=
 =?utf-8?B?YTFjSDJHM05idkZ5VTFWRE95K2Nab2NlWmxnRlVNR0pwbkpWWnZNdVlodGVo?=
 =?utf-8?B?Uy9uQW5jL3RvMjM5QmVpc0lTZ0h4bUE3dVBVRndjNU8vcWk2bGRkTXZBblNq?=
 =?utf-8?B?NndZUkE4ZW9NRGlpVkFnS1pDVTJScjZoVTVCZXAzZ3hTSFdXd1E2SFFmTzhZ?=
 =?utf-8?B?Y0k1ZVJvN1Erd1JxdXRtdTNOaVhPTS9nRGE2VGNrTFJ2NVVQWXhuNzBPZVhy?=
 =?utf-8?B?ZGhJeTJyKzNYQ3NOdUlnNWpYV3VHRVozZWtGK0QrSWphMGVGb2FOZE9Tbmhh?=
 =?utf-8?B?cDNrWU9hUUQ4RmdDV0ppYjhOUVQ4b0lSbjJ4aG9MOTFGcm1uZEtwU2RXeURQ?=
 =?utf-8?B?dEs1V0FKVnl2NVQ4ZitnUTJUWE5QdzJrQlpuRW84cHNYenNkQWdWSm1WSVZQ?=
 =?utf-8?B?VkExVVp2RURVT2NtU25GQXVONzZWeGwrZFBVcjM0Wm1veW1HUGZCTjV1N21l?=
 =?utf-8?B?T0lEbHRRQWdYeitzcXBkQUIvSEU2NHpPZDRJOHM5ZVJ1RHd6Q0p0RmRXUkh6?=
 =?utf-8?B?SHRkSmZkVVdZN2VBZEZzbkdrWDUzMFkrZThZWjIyZVpiVEl2aUdPVi9DS0lU?=
 =?utf-8?B?SDhVV3RSUEtjRWdnK3Z5MDBCeWlyS3BaYjdpQ0NzMUVMaVVTMTVsNnJ4dU54?=
 =?utf-8?B?L0NVSFRsS2cxdzg2TmZsL1c3RUNvN3k1cGhINkxOcEJ1eU1weGdEU0FpY2xI?=
 =?utf-8?B?UktIMVdjemVoU0dWeW92eHdMK3hPa01COEtpcXFYdWdMeDc4UXFCMXpXSjV4?=
 =?utf-8?B?em1uVjY3eGhrejUxM0E1SVRLMkFVRVJjNWJpMnNORHptbXpOR2xUbmlQSzBj?=
 =?utf-8?B?RDBDQzNld0wrRklCak1CdUtaSnkvUUdWaE9HVDVCN0pLYjdyWXdPb29pNGlB?=
 =?utf-8?Q?5Fi5nihPpHDywExt5DDgiwZTZrD6wcDGcLyeA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXJGbWs5Ym1hS2pDOS81Y1BmcDRKczdjQ3k2OHovVUNoanduMFliSk5VUmN2?=
 =?utf-8?B?WDJHQ3IwNGpoaCt4bEIyZnVqMXJxbzhlenZTUEgzeXdTeG8wUTh1bXlSWmYv?=
 =?utf-8?B?T1VlYzJoZ2diMmYraVA2WmZ6dFBQWGFodlZhTEEvcUhqTjF5MEFoVlFLdTI1?=
 =?utf-8?B?Rm5naE5XR29TazFFQVNGM0xWN1BvT0d5ZmNxSDA5TDNiNitRN3FTcVZDTEQw?=
 =?utf-8?B?NitIMUZKcHZQSml0MWNFYlJ6YzY2d0lVYUZFeE43V1RxZmtST2NDTTB4QS9Y?=
 =?utf-8?B?K3A0b0cwT2MwVW42UFJ2eU9RcS9NdWZTMTNKdkU5Y0ZyUi9xeDViOVFNN3VN?=
 =?utf-8?B?NGpHbHhmeGJFWXE5aCs4d0dKak5TbFNTWmhQU0N0MnZpaFg0dm5uM0tEYW0v?=
 =?utf-8?B?MWlyVHdySFJXZVpvODUwVFpWemdIUjZVdEc3Njd2eHRRZ0R1RXhybm1FY1pj?=
 =?utf-8?B?NTFEaFhPQlY0SEJsV0d6aW16c2Z0RDFLbnV2RTNtRWwrZ000dTMyaENmOEtr?=
 =?utf-8?B?aS9ld1FWQTFYNFJKR0dmRE92M2Z3WklqdGlzdkNBN29Za2t1RkdaamVhaFEy?=
 =?utf-8?B?cjNmM1VsT054d3ppV1RTcTlmSFlqQTlURXNvNHJGMC9Pc2Jwc0s0ak9hVitP?=
 =?utf-8?B?L2JqdG9tMW15a2MxcnVKVUF2clFsZndESFUrZE5tYUZnbHYvZjUwbUNwMzJD?=
 =?utf-8?B?Y0crcHRvQWU1YTdLRXNVNUhmeHF1alVRd014M1F3MzZhTGFCYURDa0Z5UWIz?=
 =?utf-8?B?ejdNdlJzSnE4SElkWHdjaHNXM1J3em9uMi9uWkZkdW9pckwzbnltSGdQb1Nl?=
 =?utf-8?B?SUc0bm96STFJSjVIWVl2emU2RmtBODExSzNFOVd0VWJWVDFwbzB0Ui9CM0pu?=
 =?utf-8?B?V0dUa1FJU0xJUmw1ZnBzN0h2SjJhV0p2alJLbVMvYnFzTlZLa0p4STJsQlkr?=
 =?utf-8?B?U1JuOHJ0c2N5NWVmd2FYenRHQytvYzRrTXFUNjMrTHRQcDVyeWVuY2luT0ls?=
 =?utf-8?B?SG5tOTFqTUdTbEk3eHNJN3dzem5kNnVTQUdZbkZGb1gzelhGdWpTYTZJMU85?=
 =?utf-8?B?K1UyOWpVZ1RDdFZLZndoRERKMGZVQm5IQkhkZW1EQlQzU0VGUTZ2REkza2xa?=
 =?utf-8?B?VUwrT3RZRkJyZ1BCbnlYVG9Dcy93QkRXSUE5bU00V0hvTWZhalc1bW9leGpK?=
 =?utf-8?B?WWMrNzJtbmJMaFA0SUJWTjJ3akFOWnRuR3BTWVN4NmZsUCtEOEJUVVRGQm84?=
 =?utf-8?B?emNlVjZpMThrQ1YxVnFNOTZ0bzJXYTJaMTFPOUkrYnd1ZkkwTW5RTExuSlJv?=
 =?utf-8?B?TndoUmdnWUNnc1NTMFFkZXhrcDNXRks2RENzd3AwRW03akprTDFTTzkwYmJD?=
 =?utf-8?B?bUNPb2szVVdEa05mOTNqcUhjeGM3Q1luTW1LOC9JWHlPZDZYNVhtem5mb0Nx?=
 =?utf-8?B?QjdRZ3F3YUZOWVhmQ0w2NEVSOTVleHRWSXB2R2JobFRlZlR2S2NDblBnVE42?=
 =?utf-8?B?VndtYUdnZ3cvdG9YZXdCR2NSMEgrdGJ6Um5OMVFHNk5vNTVoYjN1a1NvOWI1?=
 =?utf-8?B?RzJxcmU1TkpMaktLUTNRNCtaSnRsczBMdGNCVGlmNmlYMngvTFVvKzlEV015?=
 =?utf-8?B?YldFa0FIbmV5Syt2Um12QVVDRTVTQm5DMWZkQ2RaNnFCSCtveVdseFJSTGkv?=
 =?utf-8?B?TXhQejN6cDZheWpyU3Y3T0paczluRXg5ZGN4bzBIL0ZFWFpnSElhU1JrOENr?=
 =?utf-8?B?UDV2RENZUVlIaGdJa2oxOHNLdU96emwvUmVJb1dka3YyTEk5dU9NQzBHVWFG?=
 =?utf-8?B?WUNwdjIwMjJNa3pXaDZqdERZcER1VzJ6SC9hZmhtckN6NzF5Syt5Vkt3Qzk2?=
 =?utf-8?B?ZHFIcDc5ZHVzK0QxSEtUbXBXMUFsZk1pUEFadHVGYms4bWVyVzlud1ZYS2k0?=
 =?utf-8?B?dkNwMUFWK0VVRnMvbUNDOGlQMVU2VVFqbUNrckhCbjJTL2ZjeEJ2NDltcHRp?=
 =?utf-8?B?UGpjRDRMRCtDT1VIRUIwT2NGVjdKelVKa2FQOWlIL01FT1NaTXpUSHdLS0dV?=
 =?utf-8?B?UFYxOFkyYi8wV29Zb29mQWJja3g5dm9UVWFyZ0F0S0RVR3JmVUVBQkNQVW1i?=
 =?utf-8?B?TGNxbmhtMFRYMnN2bnFFUVV6UXlCdXhJem1wT1NhNDV6Sm9wZ28rNXBVU3U1?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3af215-9805-47ea-a7e5-08ddfa018ca4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:57:52.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGSteGH7QlQyxRnGyp1C7UKMQYhj83X/r5Vm2s19wCjGmeHXUkGZuibR6zVEPMRQpyzIG8xKzy4YCOe1diNcQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Thu, Sep 18, 2025 at 01:00:06PM +0530, Satyanarayana K V P wrote:
> During VF migration the GGTT address can change, so GGTT-based references
> must be updated post-migration. Update all GGTT references used by the CCS
> metadata save/restore path so the ring buffer uses the correct addresses.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

A few things. This will conflict with my series [1]. Since VF migration
with active jobs has no chance of working with the upstream code I'd
rather pull your changes into that series. I need to rebase / fixup some
minor bugs, when I do so I'm going to include your changes in this
series into that one if that is ok with you. 

[1] https://patchwork.freedesktop.org/series/154627/

> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c     |  3 +++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..e218022d42c7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -368,6 +368,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		set_bit(id, &fixed_gts);
>  	}
>  
> +	if (IS_VF_CCS_READY(xe))
> +		xe_sriov_vf_ccs_migration_post_fixups(xe);
> +
>  	vf_post_migration_kickstart(xe);
>  	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 8dec616c37c9..c9f21656a3cf 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -175,6 +175,10 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	u32 dw[10], i = 0;
>  
> +	lrc->ring.tail = xe_lrc_ring_tail_on_init(lrc);
> +	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +	xe_lrc_set_ring_head(lrc, 0);

One thing I’ve found is that the GuC really doesn’t like when games are
played with the LRC head/tail pointers. I’m not sure if there’s any
caching on the GuC side—I didn’t look into that—but I did notice that
the migration code can fail when the pointers are manipulated in
non-linear ways (i.e., not just moving the TAIL forward sequentially).

I think it would be better to simply write new instructions into the
ring and move the TAIL pointer directly to the new position.

Also, since we’re already at this point—the old BB has already executed,
right? If so, I’d assert that xe_lrc_set_ring_head ==
xe_lrc_set_ring_tail, which would confirm our assumption.

> +
>  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
>  	dw[i++] = lower_32_bits(addr);
> @@ -408,3 +412,23 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  
>  	xe_pm_runtime_put(xe);
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_migration_post_fixups - Fix GGTT references post migration.
> + * @xe: the &xe_device
> + *
> + * This function is for VF use only.
> + */
> +void xe_sriov_vf_ccs_migration_post_fixups(struct xe_device *xe)
> +{
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +
> +	xe_assert(xe, IS_VF_CCS_READY(xe));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
> +		ccs_rw_update_ring(ctx);

Again this is going to conflict with my series given VF migration are
moved to a per GT worker. This likely needs to be to vf_get_ggtt_info
and called exactly once under config->lock if the recovery argument is
set.

Matt

> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 0745c0ff0228..c09e3a48618e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -19,6 +19,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
> +void xe_sriov_vf_ccs_migration_post_fixups(struct xe_device *xe);
>  
>  static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>  {
> -- 
> 2.51.0
> 
