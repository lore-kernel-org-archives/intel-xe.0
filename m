Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBECEB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7071110E635;
	Fri, 16 Jun 2023 14:10:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4FB10E635
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924613; x=1718460613;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pCNprSUxhR4SDSlatoUqtjtSWuF5TqYZTH3p+Uq2shw=;
 b=NojICjAgRsRkqOWGe7LYxx2n9BSRQf34Ria03C9kTwMvfYLqP8FWD5GN
 DZtNXP+WkLKAkNrEOQ1gWHzrFPKpR0IBb4ivWB7IuNeXjdnj3uiXzTW4I
 N1ELZDYkMSqgL3VETK8qY32CQUPlBvzUCmjC38Y1wVp9E/k5epni3lq/F
 1sT5CZyA51rhag6T7n2YjZL8zJNz41W2VWssBVF8QjSc/MSSoL7G6ZPba
 0S39VzyYwkYrtiTyjd1En64s/AiwKtjMEADn+8m0soZbefP+UHpRHWxSi
 UKz1kuTSornjAu6NihRSHlRNrVZKWeqg1NeHS2cA8LSxbQtMa+GWR6XQ+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422872073"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422872073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707111709"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707111709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2023 07:10:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:10:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:10:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:09:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e56s27ad/Uvpvp6MJV+tgT3wSxtr5ZeII+ldx6iT0zdXt6Y2NNltuRToHUo5BUSJOFLytYz3gFz4YDP1MwCIBVaSMGMbZ+FDELw80r+ZiioaxYYn5tbUz20uOxVJmIL8EVHULTNYb155+iukF5WW3v4NqGvjICrnC1O50V8lpjbMlCdLAE3t75DUbafHfnoMV/1ygnXYSIAag4zcfk9/CKW0v5zmEQpZaxW6b5wjNF7Fgzd6+Z6A1xncZmy1KA7RKZsq8Pooe3y7sbwfhR0mr65UdYET+36QlqTilQDaG/nc2lKNMQhGxjj1LP9XdBEzqnp3Jc4ppqfVVjVnNe+1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2dl5cTb6iXdanymg0eJNDVMbENjSFeR5MPNQzx7vM0=;
 b=W4A4jgwMwtvTS/WLTJmIs6t5PgHh6mmtgNRNKaQb7+j2hC/5FJOBuCXhk58uWTXTbaBaSDfo6cG7E0DwP7uhaWCWAJlEgGc7px5w0vgb/s2SoC4Ls/1bx7CUlsycCgFCaVV0phAnJdoKrJwY5ZNn/VVWi9gMIlnv/377bYAD9LrBxJVZyak38MZxSriAh0izTvk6bcIDV/FU5v4Ik9xMGsnpawHaKGnBmeEkzoBr8pnjNBJuvv0XP/r63k6/gm8aaw/EW2wQfPge/wPARK3hc9d5+JF6hvkdk188q80GGFJUUR0K/y5oa+vcgUyXMfbn1TtHyPcIO5E9I0OaIGxTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 14:09:58 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 14:09:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230614205202.3376752-4-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-4-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 16 Jun 2023 11:09:53 -0300
Message-ID: <168692459354.4441.5600736688130021774@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: d22f38ff-82e4-4856-3269-08db6e735de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3zRRYLlAbe6FfhohHOzzFX+g/5W2Y/qcewvDH6yFKyCcy50NlDofaJ77AC8+f8Bi1GVtSMqUdjMZXz1nW+Ez9l74IVRse3KIrtm4dD1zZtY74SRrwtC+YtABRx7fp7cmDQ0L59U/NOYQ/A81pt6huJnqZqC26UO5KdhVBk10bv2IyyTITAQTN8NwCh6koYdppVluRL06kBW+WmN4U9JVxpzO2YCi2tu0NOt3UpCRaEhzjSrIe3xzg3j7TkkBuGxIFesK2SFBWysEbIoHmhA5LKxFVp1rwxVM19x3yTvzJNl8ehhvfNpDK3XpO3JvNHkd1t/bmWwpDzCJJ0SHNCL2ZiuXoMAEVpSMoj1R1g4QbM5CykMsnVK8Yyfu0601GB6yxv7waMsKuz4V3YuTBGiNLEPPxA47MxYJ0NWHOxhppVsP5+cH5Ik8nHaQOqLCQdKijZv2S0UIGSc6ruB56JOHT2a/o0+Sl4C766ZX9X9baxg7+ohT4Y3kK5ML/cp1mKOhoLkOfi9XL+w7uPNOhJx3RbowbAkBLhroZkAipSkhhdjnz+OxdNSpVAEfrx9VNHZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(2906002)(4744005)(83380400001)(44832011)(5660300002)(8676002)(186003)(8936002)(38100700002)(86362001)(6506007)(66556008)(66476007)(82960400001)(66946007)(6486002)(6666004)(6512007)(9686003)(26005)(107886003)(33716001)(316002)(41300700001)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFNM0JwU1NGc2pMM2VPMCtSVDc3dksrVnlaUFZrM0pCK0Rod2lMZk5YY0tl?=
 =?utf-8?B?Yll6eHdyaEFFbGFGZURsdUJ1SHk1Y3dqVlJJL1ZkMElQQ3BpTVJPUnpxMnRq?=
 =?utf-8?B?OFFZN1U5bFRDQTk4enB4NzFiNGQvanYzT3FyZFBnb2RSN1Fnb3BzMmZ1Ylg2?=
 =?utf-8?B?cGxPek9aUTF0NjYwUnJWcnJDMHhaU3hTSkhSVU1HOVkrTUtWNTRsN2NVY1Vy?=
 =?utf-8?B?Q05qK0QvMnF1ZHQwbG5GWWRPZFZuck5PWCtybHRkU3hSdEVvSUZXUVUySlJM?=
 =?utf-8?B?SGVoZG54cVJPemFUdFBtbW9LazBxMnhjMzQ5YmFtKzFkaGo1a3VyV1pLblJw?=
 =?utf-8?B?WGhPalRxbXVYZzhFejdCS3o1UWUxb3JzK3NyRFhMeEdzc20zWE9VYVdmcUM0?=
 =?utf-8?B?WjZuVFFUdmF2THVMbmRDYTVBeWxQN2xnbEw2c2p5ODJHMGNoZVJXbGFqV1hN?=
 =?utf-8?B?RCs5eEpLTEs0azRwMEZWYTEwa3pDYzhIdlVyOThIT2dmZS9EOGJLL0xZZ1dk?=
 =?utf-8?B?ZXcwRVBIWVpXeHUzTjNOanVqd0Vnd3U2WWkxaU9HTTZ6MEpWMThDUzRCV0R0?=
 =?utf-8?B?eUdDUExMc1pHWmFxSHU3ZUlFaGFhYTd3c0dDQ2pqMVZxdU0rbkNxVFJsZGwr?=
 =?utf-8?B?c2FjbjZaWWl4aTlWOG15OHJGSmFoaFVDRnY4bE41ZkYvcDZXeHFCbnNnOERv?=
 =?utf-8?B?SnRKR0VzQk5wM055OVV2aGVWZUtDb3pSL3ZyNjlMRHJEYTAxaEw1SWdWTXRZ?=
 =?utf-8?B?WWFlTjRFcEpNejV6Y29GSWxzYjFPRXhHMWZWT3VNMjJNYXZET3hyY1orU0Nt?=
 =?utf-8?B?NjhNMGlqN1Zab3FXK010Ti9ER3VJR21IeUh4VUNWeDZpS0l3NlNTbzYwRDdJ?=
 =?utf-8?B?QU4zelVWT25pNlZoaUQvbDcxNkJCbnRPbGFhZUlWYjNnN0hYUHpxTlFkeGxB?=
 =?utf-8?B?azltcmNSaTZ6N1E4by9WZitOT0ZVUGFNOEdJWDRJbS9NYmE5aUtMcGYvN2xF?=
 =?utf-8?B?ajJGTmtGTFJaWGFNZWU3b1I3QThNYy9hZ0M4a2pWOVRhbEM2TXo4QmR6MFBj?=
 =?utf-8?B?Mk9nL2NDcjRXWEoxVmowTUZ3bmRRQUpVY01IeEhRVytJTkZkOExmcjZMWkR5?=
 =?utf-8?B?UHlQWlBPMzFOY2FiTVZCK2xYRkRYRVo1SGtlZEZqT2JLTWh5eVVRL0xXUzNp?=
 =?utf-8?B?MUM5aHdiVjlzaWlUWmp5dU83cWVKWE4yak5zTDV6Vnk3aEJ0d2k4UmcvNE9X?=
 =?utf-8?B?eWVtSHdwMmJBVHRnTVZRU2F3Rks3cnkrdTZUMUVFRE1KL0grOEp1Yzd4N1ZC?=
 =?utf-8?B?Vm1PK3JUdmptdzgrMndXZzFDSU1ERGJWWnBOeU9vSHF3azVFb2VRSUNKMm9J?=
 =?utf-8?B?ZVJOMjRGN1pWY0h6dGNCMEVGS3B4L05rYWF6TlU0a3B1bVlITVNjeXY5R0NT?=
 =?utf-8?B?MFZFU29DNFZrelFJTDR6MTZSbStpWllFcytpdmp6YXpucGtuU2l3YjlkYk9z?=
 =?utf-8?B?WGp2ZjNKWXN5UHNCbExhNnQzeUltV1dNWFcxaUc0T1JTK2orM21pOWxiQVRH?=
 =?utf-8?B?NzR1dDRIRFlSWXA0VnI2YTZ3WDhWTm1OMHNhL1YrR0psQld6OW8ybDFRdGZr?=
 =?utf-8?B?c0w0aDRBWGxrRWIycDgvcEdBclppQVEwaGZnQ1Y5UDRCUThHeGIwenBQZ3ZQ?=
 =?utf-8?B?OGZqSitzQnRxa0RxQlZCQWQyWGFnMXhJS016V0xyZHJMTG1kM1BYangwMXdB?=
 =?utf-8?B?Z0krVFBLSUV2Y0JqK3E5VWpVYWJpUFp4ZWJJQWQzdUdlM015S0xzRWJUSXY1?=
 =?utf-8?B?NHp6YUpjYWJsQjBlSmVZaDc1dm5yNEk0eVFPc0ZsTUt4NmEzS2xBcktjWFcz?=
 =?utf-8?B?RUprL0UxYTI0c2Jrdk5BUDNCdkJFZUNaRGs0OGZuZllQRi9KRkEvK0NIbnI1?=
 =?utf-8?B?U3dZMGplWEx2U0ZkclFzSFJnS2dja0NrcUpLVXcrbU8xaHJ1cUVsVm9ERHNL?=
 =?utf-8?B?TFhJL1BpSm12ak9Pcm9yMDg4eklTUkR0NWcwY29TZWNDckdVMEIyV29RWkJ3?=
 =?utf-8?B?K3h4NDAvUFZCbm4veEN2VWRHYXBqWU4wcElYMFZ4YTRxbXVuR0toZmxEZU1O?=
 =?utf-8?B?QnB2ZnU0cjB1ZEhHeUx5MWpJRzhBSTdHbFZWVlRHQWhuQVdMSTBwVElZTmVk?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d22f38ff-82e4-4856-3269-08db6e735de6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:09:57.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgFiNAzLi3zslL9vkaZ7qI8tv16FZ1gKtKdmqxfPiWwKI0dDIuthQU6YV3BIp3KsSnaa0mXeMnWmAodBoPwVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Print proper revid value for
 unknown media revision
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-06-14 17:52:01-03:00)
>If the GMD_ID register reports a higher media revision ID than we're
>expecting, print the media revid, not the graphics revid, in the
>debug message.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_step.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
>index 1baf79ba02ad..371cac951e0f 100644
>--- a/drivers/gpu/drm/xe/xe_step.c
>+++ b/drivers/gpu/drm/xe/xe_step.c
>@@ -235,7 +235,7 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device=
 *xe,
>         if (step.media >=3D STEP_FUTURE) {
>                 step.media =3D STEP_FUTURE;
>                 drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as=
 future stepping\n",
>-                        graphics_gmdid_revid);
>+                        media_gmdid_revid);
>         }
>=20
>         return step;
>--=20
>2.40.1
>
