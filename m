Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C8D46BEB
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5F10E752;
	Wed, 28 Jan 2026 18:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRYrfqOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C39B10E754
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623769; x=1801159769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aWUFa7DTP6ZmBf3xmQ2bwZLRuRPR8FfaOZZ4teV9N9w=;
 b=HRYrfqOCexx20ZQ/hGb7AgJIZdNyAEYv2I+V+isAdAoG70j6cHaDfYuG
 p8+HkZ+o3mnYGXMOOoN66j235VBm6eRdWQ42O9hp5GGd90eW65IcDUsyy
 d9hl5aehLZ031QggR9yUVrcIPlYNZcnB6VbKOaUD+lCD7eOBIKmP2Kv7G
 zovTrWBCVo6FKRSpWFW5JE6q20Sczb3nfattdS1pM1wEE2sM/pqAer8lN
 J4p04a6z26YpTZ0nRxwRby9ooaG/CfqGcJ0Xrsfe4MmCnyA32VDx8RpeB
 eKyJNyoc7MPlep29yNNo11psq+YHsza+GA9MUmmNhCrAXuvAnFpGkAsj5 g==;
X-CSE-ConnectionGUID: PlAJM9/vT2Cl9GqLIKVf2A==
X-CSE-MsgGUID: VkEY8ajjS3WF6qCL5NnN7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81162895"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81162895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:29 -0800
X-CSE-ConnectionGUID: rIuQ9NCOQkGHGJyAeJO8oQ==
X-CSE-MsgGUID: c3/hC8TlRsKr95FBlF9yoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207572845"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:09:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 10:09:28 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:09:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K81WYrI4KYI1FpngNtrkr0G9QVbXnng/SkKliXs/4VQRU8mo2h/gA4DS0BWVv0NvATJX4aHpz/ckd65ZF7DyVBuRF8qb5sTsD7jJSaEzxaoo378sIehiPtdu6WZXf28CtpFmVGG1fP2V/XudRYv3HMTWElhkTpjJHWjaJH/Nix+vGnnA4ySrhnMJ3KqJLI9gFvnHae6OFkO3mZ1LObJT1WBu/eL7RI3yG0tmSytXreGd8u8+QGfgaLQ1AlwPiW3Kubw+46Co6gK0Ks8z6mWncgIjzVk/KqcYIl4TctlSUsS7mafDqQRr07YK6uzpyoTmWuS+enxTuCiX/PQnWF7Vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pDGOcUZ5X6QLicS0u3MeWjzkxEWJFz2LnzHZMXeJGA=;
 b=qyHKOYSGU7FDah6kMrvfEw84ZjuyNsdlI+LA8TgAYORvkGBcOMKrWpplGdCcdpZ2VmbutK36T9iYe1PRgnDeUwo2LP8FA1EKMard7xsRf3VWk4tqCDgfb/QVUeWyaRD3AGBBVs/wBZf2jU5K/PlxJU0pRF93gB/MfUJDI05MACE2c+uPSbIXO3E7+QLcj9mQTcmSDaGqFWZWZas5BH/rm5tVswyaoweF8od6gtQKz1G+/0/l7vYqmdaJuz+HwfiDTBvMBeJq5Wi4vCygRoFIgqz5+hgXvRSBc75ig3EeJ04/Td9E6JU0floL4X90XFtKtBBPBcICP153aH5tHlkcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 18:09:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 18:09:26 +0000
Date: Wed, 28 Jan 2026 10:09:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/12] drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
Message-ID: <20260128180924.GT458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-9-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-9-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 287e2570-875f-4a4e-a121-08de5e985f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlkxzK0fQ7CnaMa/RTJdo+nNUR8w5jCruBmfgm9yth+laK2I6xMzUmB6oo9g?=
 =?us-ascii?Q?wfnw4jxSJNehecLC8D7KBprVNZChp1XykodQHJyJNa3vEHH2kopU/cVxUDil?=
 =?us-ascii?Q?2mhPUud31TPSFVOQ9kKL4o59FDefFM/xEV0SML1tZ3MEYT5J4jrXeGxZVzYQ?=
 =?us-ascii?Q?gjW2u9vYuoejVIBfYmvtIrng19RVob/4Jnheuufp4lOqHYk/hUZxI11Q3rhq?=
 =?us-ascii?Q?mVHvX5XcVMiz0ckQgH2yoqyx/OGNw9xoDu7qubYN4qIXZ1uJerDXRf3ouzMk?=
 =?us-ascii?Q?Usy2RF0/wn7uwMd6Od23fZMCb7drPZKsy7mcoJ7WKHGqt7ngCso5h9Ul8io8?=
 =?us-ascii?Q?+SdBrLy6LH13dYTyNQSDEOa3hdzuOjCuilBAht00a4Cwk5+fiEJkAijIr3A3?=
 =?us-ascii?Q?rVei3zu7Pn3MyFVS3N/krMXLgMwtTeRGDrcrQ0BbJ8L3lPt/GkdaJGuG5Xic?=
 =?us-ascii?Q?RGB+YVusLqQsksjPMLN1pA8v+06WLzRuYIGsT7oVZNUyhod5LWyWI3GuGjiX?=
 =?us-ascii?Q?RGs3J7G9vvlcfUV7KPtynAcU/E8kgBPJi9SlfW0NP5n7mqyOhzRFb3dpZ4wD?=
 =?us-ascii?Q?6p0aojQVanx6bFf8Tq4/hJodI/y5sAOAoBktjJQrQ7ZqDH7gD95Rgsv80Ba3?=
 =?us-ascii?Q?U4Tmc6CloGBX1rRD855k5+8JyE7RcVVc7VPAVE7GREiUIe/j49zMe7Einclj?=
 =?us-ascii?Q?wCerWpt+Msg8IpQAkbgoINd481gxcuX9V+apUijCFSw2cCh1E4Mvv5TeMS1R?=
 =?us-ascii?Q?/vnlqIBtw4skFbsKuixQQ35Yrvh6i0t9jmaaRj5FwfvnGsgqwYYEh5z17oH3?=
 =?us-ascii?Q?xFgxptPa7c9OfPgBKm3OMjYpgJuNwKdemFvylTVS2McqLWKLiDqqiE4pN9z2?=
 =?us-ascii?Q?Jjkp3N3rghHcmTAdGCVAypLBzbRyjoaLuq/+pHYjVZnw73i9xJJoMAItiklC?=
 =?us-ascii?Q?nU/z5VbKBdW5u6mB1x1AKYUmiTslE4n7hH15CxhK8rTZtqccGBqQHrWOPLTP?=
 =?us-ascii?Q?ArMyZOBqKFDAKauJwjCHuMRPYAr27PBL2TkWcU5Zii53tfxHebo4MmKhPsvH?=
 =?us-ascii?Q?bYVZdF66qksnMPxgOE57tG/yRoS7zvMY+/tWIVYt/mgfrAHWS+g4qxE47vUl?=
 =?us-ascii?Q?38Va3PmSoLJuHB6hTHtCO7Mxy12HcSx+RWh+k/EELb+KdAPusViokqWxBFoy?=
 =?us-ascii?Q?+/icPalh4QFTneVf4DAQvTgXGgP6NMYEM/QXVsJo+OwDXmTeekhM+xV/AVDc?=
 =?us-ascii?Q?7/bF/0JDpCF+RwvDX7YEgF7u7ALW2w40d53YOdgQ/0Tpb4f+Ewmawp23HOce?=
 =?us-ascii?Q?FU+hBcMB/eGOonVdOswGS95jtESTPW1yBJfUGW9KGDKxnD8ruBuJqVe9sLD/?=
 =?us-ascii?Q?4kuA25rJ3XfffTEAwXXXCaJ6LgfXUHOUMJlC41OGJ9mDfamhOlzw7f09Lg+T?=
 =?us-ascii?Q?P+rTupsJji6v8NNjPlLw0mprohEqniPKJNjCau7+vt2SEFZctnr5eLszVGYq?=
 =?us-ascii?Q?J1MPp7XM7uOk1GmZoJqJtPuEOOUV8cBqiOXbGay2rEmZ6lovwEjDyD1fgci5?=
 =?us-ascii?Q?hW8oFASJ4ZkZIep0QJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6/fB9TRf0WsUcNnbJ+WOEPPJjrK9ZfR1JJYrME//5QSvnPuPPkfCiH6pTNd?=
 =?us-ascii?Q?UQpq6RAk+oyefrQ2q90vCneNvVLAYcrcnSbhpGI1FsAu5/xcpxcxAr/iqJSF?=
 =?us-ascii?Q?7ZvMCARL5wPapQMjtmoMe4hK5bZmkMxwKNlQnaG2p5s95MLqhC1/VvmzbB9i?=
 =?us-ascii?Q?i1d0qh5EhqIPYK1z4GKZVFqxxtZ0RbfzqISPBMVOqTQ6M5J+dzgKnNf27pxJ?=
 =?us-ascii?Q?kgZN6nECrSVnD8j5dJPsfw5vCDsbsONDHVM7tWfrR/yFPPcT3ClKyT5HQjwf?=
 =?us-ascii?Q?4UnFs7xWlVyvMcHbdereFxCn0/t+iwmY64wTP5OoV+QGAG5vR9mBOfxxeuGv?=
 =?us-ascii?Q?3XODdW8aOuqVrDvAt0IEgEBhp2uV5ucWpJ5r90BC9g+C8dC3tbRW07JdKN2c?=
 =?us-ascii?Q?JZ9Lht/e0ih8bZ/JlVLGHALYvxkLwdzOdEJMviGidiUS8HUBh/ZgNL6WQ3sx?=
 =?us-ascii?Q?zAo4sE8MbhXx7GqQq40ix7TcD7ZvwD5MfcEkEAxbS7aAB8jL/ibPbNH30Fiu?=
 =?us-ascii?Q?aImwULruhlgrZcsALoT2pn78sKf/yEYmJffktQVNDpU6dSyWCOF118nDI1Zk?=
 =?us-ascii?Q?pl4UYWuK5sSY/IYfXddLAE95XtuVnu5tnUXKCaYdgT0DGHKhOugfeRjAJgC4?=
 =?us-ascii?Q?oVCLrTlWhlQFLPi2VtGvXtJTNvk/v5gwz2UWXr2pYdkz+R86LG6IHaqCFGcO?=
 =?us-ascii?Q?YmWmkM5FfZ4uSdsRpor9Q2ZlAz+UPMjvrWXXBDXT2v5+bd8MOL9deA1fzQ1p?=
 =?us-ascii?Q?z9R1adIONC5bbZQUQuUMRE0fuKdTObj66xKm8LWO/P3eic9Vf+jCMsR+16aD?=
 =?us-ascii?Q?vN117TcrLI3ZLMUgixPh87/sYaF17zs7xT3IRlG/y8l3vzA/0nA2pFYccE+E?=
 =?us-ascii?Q?GTrB+D9gOb3wQAyGI48iI8irgif/kI9jX0Kh4hlp1jd/Ugsjo2S2vk1tTC24?=
 =?us-ascii?Q?W8w0majgT5TBLB1nYR7lV1BvOr/dr1A1IkTdfWypFKkum+J/Aows4K9ZL3HD?=
 =?us-ascii?Q?UYF4l5YRilRYJpnZ3IJvWXCmFN+R0QpZPCWOeVvhTTOE1q8gXhPGD8GtK3Kv?=
 =?us-ascii?Q?s6aGx9Hdnw3+e6uToacbc9ZONVMyTvmpZ7Q2/PuolxBQoLwDbmF42NPKDXhB?=
 =?us-ascii?Q?u/ETTYZuvOzcAfR1+/TU+aL4o3wM601/kzL2Jg5PbbpXPP7Ldusd4GYhE5dP?=
 =?us-ascii?Q?34znoVUgDzvm1RLsBiQNRpv5Sfu+vYq3dR/2bakJlPx1FJe2DVJSLwiH5q1n?=
 =?us-ascii?Q?0HbymkTxyWZP098+f/HxpS3qo45aG30b7YgwfUsVleF6T+Cp08yHrUfSvg7Y?=
 =?us-ascii?Q?8uH/PrdZVejr1M5NUM4hCrSRsnF5rmm0uDtFKq+1MQerv61du6Gr1yKdNVFp?=
 =?us-ascii?Q?imhlCqjf60X2joCZQDvsAPgmE2KYgQXj0MiHNYmRGmC6d37EYLM9CBUhSb3W?=
 =?us-ascii?Q?kQ6dkcbjCMNABaooMRRym4tykrEMICe7/V1SUDfxeOoKjCVZcdYcgyVeTx87?=
 =?us-ascii?Q?xlfqF/m5k2r4yhKGYnIKX6Ukh97L/yFH1myalLols9bWD4Y1HxWZ9g73+wFR?=
 =?us-ascii?Q?90ACRFT5zRnC9dxeldo2dhc+YkiSzqtGEi3JFsNfE1DYuDeAAOSeueKaohEd?=
 =?us-ascii?Q?1r6zWK3o+3BboE18KoNENvyVDrin3AEJFbo5wKqhQQAOn1BoAwfKeyf1sHRU?=
 =?us-ascii?Q?pJ+uauddS07nKOR147c9FNjC7hEEDvohNzfsPHz7YygBVM1RZRQFKZDrkMUr?=
 =?us-ascii?Q?fHfL3qVIsDLICJuI3MpFAApkMl3Taf0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 287e2570-875f-4a4e-a121-08de5e985f84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:09:26.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3LM9dz465hFRiAQC4EeIRgxLwF3zfiPeRSFaTWGcMC5X0kw/TvIbVr2ofRMYZDW4Su7s9wxVVTqlPOdKKriiY6Anir6+6htWf7CVGRhbBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

On Fri, Jan 16, 2026 at 07:12:17PM -0300, Gustavo Sousa wrote:
> Use KUNIT_EXPECT_EQ() in xe_wa_gt() as reg_sr errors in one GT do not
> impact the next GT in the test.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 49d191043dfa..2bf6fab015cd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -55,7 +55,7 @@ static void xe_wa_gt(struct kunit *test)
>  		xe_wa_process_gt(gt);
>  		xe_tuning_process_gt(gt);
>  
> -		KUNIT_ASSERT_EQ(test, gt->reg_sr.errors, 0);
> +		KUNIT_EXPECT_EQ(test, gt->reg_sr.errors, 0);
>  	}
>  }
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
