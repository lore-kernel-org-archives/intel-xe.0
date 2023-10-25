Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AACC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 23:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDEA10E5FF;
	Wed, 25 Oct 2023 23:52:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98110E602
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698277973; x=1729813973;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Amtqvfsho+QIA2XrN8pOyJmsal01mML4zeCTnsrDHSo=;
 b=fgn/gfBFxLgCMDvsZ3ENAvFY6NjAPMSoFezeWZvbKj8C+9DoRKo4s/W2
 xgQEQzs5T0ggLextY7B8QpojaWFqkUBbeoV9x8M20pRK/gYctW5wF/RkH
 M+ZCuoQY0/KUKPiab7HAF7GJ85KXOmacfmuJf/x5S9YSS1Vf5d1a7y0mn
 AypF2a7+1m7PL5hmQb4H/WnrQRdjTr/B09pAv/VJe5Bvqz7/vWPjaleX8
 kO513XGZRQ9Ry/e3MX2GIXGoHB2ELxmDy+Qa1004m8uXc1bhNKa5M1aNH
 9B1xRlCSoTC/VtxAzZApaqzYd2faqp5/yCrc9bY5I0ROPdMSYSdv/Dxt8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387248427"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="387248427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 16:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="6729991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 16:51:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 16:52:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 16:52:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 16:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c82OrgXA6ZEMqbWbJKQCDD6SOGESe941GP3HOCB+UACFjGvFUO7vVrgcuFsxIv2pteoqomDJHlLwtzowFDsNVNDR+4EnqyleJk0yvNIx4GNc/syoXM+02LVnJPNr7sVC2UOZWKDFAH/A37v1Kgl/3PmrPccvVsMcQD2cZC2ovVId5Z0ibOWTnXCgRiHZIaF24h5/qsbVgBJCSSDeeb60MCSCPsGJEkKM7T09oqh7GDpSInCHU2QhxtwYwSeHx47U54Mgv1/HwRdL2nN1JK4Rzo8hzCYehTtD+4OKwX9IuiY3LQALxgFFAsSrUhsAj47+5Fm7HCrI90a4MG47Ec3Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzC+T016zCy7m/3cCSg2Oqhkwpf69CZ4q05/2Dm/pEI=;
 b=S56605B4LP+TsF2ExfYJx4P6DB49s36nv17ClAM9pwfBGOeDwr5DzYkeYUXYvNn4Elm7wQf+5lg/8sdcBLNWSs32D3gAE7n9GNGfm49tvVIFVdQTJi9wMHzeXD9ci5NOXtiUslVvxCEr5WfYUfEvkVwyTRPDtQpzxsxUzC5CTR7aDRnuIf0Tyi/tlFWKOIux+rMtaSojJph8U9wscbS9EccVGjGq6QvurbUufl7nNGnwqy1X3gZgB3gHpbhKVzc3QG63YWWjcmqgpYyfjSIw35EHfbKPr+VRSsqZ6lCC2nDLXcyoJ4dyZwimxYSPsJlvK1lx3yEqY/kCXiQ2n7ap6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 23:52:47 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6886.034; Wed, 25 Oct 2023
 23:52:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231023204112.2856331-2-matthew.d.roper@intel.com>
References: <20231023204112.2856331-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 20:52:42 -0300
Message-ID: <169827796220.180662.481341454951153833@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV8PR11MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 25df8fad-b568-4bb3-21a3-08dbd5b57d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jo0/ESxrp8oMT83l2325Pj2txX659g4ntpQe0YE0qzQkX+1WcAWkGpIcwwELJJ+HVymJIuxcZeW4Fp1SmDLKNTj2xMieswOGs/qiov1dTEEH/k6zik1S1RJ++kiWx47Vv2EgLJKpGKWrB43qs2Nsi3f3Jr7fc8m4N/cvS6R1kIaLGQXCxGevaiBZmAyL1gaN7qmkg55AGKFVj2u+hxOTdg8SmXUE8Wyvdk87xya/2BNGjIM35VRxXPot/cKfx5noeGyYyhebiIXDAAFMD0oFRgjCrCE1cqgdKWSXhnXtfBGW3BGj3d9Ef3Jqi8hoVLWqWn8aLq0NYqB44SsEN5YT5nOjnprUyc6sk8w64MUAE+/+tj163I8QACITk9o8LQa6IRySBKje8naY99osvq318Iwe6bR4+eei+ln+6i0MO/rrhLxOocbBfdsPJyMpEMnoIgYuQm3u0Qu7qKlCjI3kwcP9dFkDNdomEaf7XyUkoRwVlB5+qP1ZuuR1lJcW8sdsnJJOEUvbOh4b8y0nH39kiVeuQkDjJKKZa9HuSeG8QvhQrX/4TI17pvNi6HvCf5Wh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(8936002)(8676002)(44832011)(6486002)(4326008)(86362001)(2906002)(478600001)(4001150100001)(66946007)(66556008)(316002)(66476007)(5660300002)(26005)(33716001)(6512007)(6666004)(9686003)(83380400001)(6506007)(38100700002)(82960400001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9qbTdwSjJNVnA0WVBFVEtLNVNseGt2T1VWalVhNGhHL1ZoTzdQSjVkUzZ3?=
 =?utf-8?B?SEV6QWdVUjg2WGpFWi95MGxwQVVMMDJVajgwUXJJb1kwc0FTRm5TajYxT0pS?=
 =?utf-8?B?c2tsdE12bExJNVZCT0UvYm01ZFFJRmtoRENicTh0ZzRjZmxtREtZU2NCYXc1?=
 =?utf-8?B?bHZpRmliMHhLRTlPcUc0OHREWWcyV0NuNysvWFJvbmZ0NmhGM1pOdzQ4b25n?=
 =?utf-8?B?WFgwS0xpVW01WDFJNVJTOGkyWlVFeFIyU3VmbHZIOXVRUnM3WTVGZlhqQU9N?=
 =?utf-8?B?Mm1aZGJqU1hJUTlVUVluWkFJak5ETUcxVmdTbS9oczZTSG90bEZ1eUdjQWZ3?=
 =?utf-8?B?Y0ZKclZqRy9IemRRMks0QmZ5alBnQU5YdlZUeS8yZjFOUSsvMjdPZWlPTE5T?=
 =?utf-8?B?MEY2R2h3cEFCSDkyVXBURkJDRHAxZ2ZRMTUwS2tKLy9wSnZHRmNSS1h3cGtj?=
 =?utf-8?B?MEpFYlRmamZBRjRVM3RQU1FHTHJ5NU9rTWxkeTlXakpIYkVNdEV0ZjQrejRm?=
 =?utf-8?B?RGQ2SjhMWmVueUFQdFBxVnBhTVRmRThNajlZakJpZHZENFJLWk5veFVTUHI1?=
 =?utf-8?B?UjV2TFlibzczTDROSm1ENzVLcFNQNVgxM1hsZVQ4Zk5lVHlBNmJUR0dSMjJP?=
 =?utf-8?B?eml6WFdNSkRpSjFNWGJhRUtJc2RxNVFnNERIeHNDeXV5Q1hpRmxhUEJhYlFw?=
 =?utf-8?B?TUk1NmZPSnZ1bHhzZzdnVU13dUtxdHAxOUR6VXBUaWp3aFVCVmRDWFg1NjFW?=
 =?utf-8?B?Nnc2NlhGdVFkc0krU2ljR3l5aHduNzYrU1p6V0oyUWxUVEt1SHJXUFJuVmdB?=
 =?utf-8?B?ak1hbi9CZHJzZHRpamZLSmI1K25LTWtVWDU5dUJaTjZCVDdndkwra2w3UlZt?=
 =?utf-8?B?dUdvQkdUZlJLTGpOcXBpbndIWWl6RlpLaE0xOG9aNkhPTmdSdXVEeEdtb2dx?=
 =?utf-8?B?Rk5zb0hEMFBzY0hMYUlKdkw4OE1pL1N1cHFZSjhBd0sybndMYjRkSnpINnJH?=
 =?utf-8?B?bFpmWGxCcDlTdHJ6N2dCOUQzM0tjVWdTL1V3N1hNMi9waXFObEEycWVwWG1w?=
 =?utf-8?B?djh1QWs3eWNxZjVvU1F3TmxnMWlNVUpPOVl3YW5Cek1vMXV4VzN1VVZTV2hr?=
 =?utf-8?B?dVlsRUgzTWRRb3c4QXFmRitFWHVKSDdyUmczMjNLeEVtSHY0eG90alQzQlBO?=
 =?utf-8?B?U0ZFcEkwK0tzYWIvSFRTL2J5MFkrcUdyQXc5THhhMnBKZ2pvcDdHVlZNSmFo?=
 =?utf-8?B?Qis0NHhvaTltZ3p0NjNUK1NpZGo4clFDYzRLM00raFl4ZVZ3RXNEKzBXdFd4?=
 =?utf-8?B?UkFsUDVDRFQySTh5Vkt1OGFzRDQ3bk5WZ0VPZjI1VWpLYzNHa2czZVdMSWFH?=
 =?utf-8?B?c1hSeTRwb2FkSmRtNTF1aDJ6azhlNGhybi8zclBIeVU2eXNaVEtYQkZiVWpj?=
 =?utf-8?B?MVVUbm1UM1JhMW1KekxsRzdZVzJ6RzVXczlFdFo5T2xUOVQ3UCtlMlRsNmRu?=
 =?utf-8?B?bS8vTk9KOTA5eW9KZnZ3Qm9qcUJJcDRCMlM4REpUK0kvU015Vloyc0ZKQ2tT?=
 =?utf-8?B?ZVBoRkdycnpmL1RoUHlmand0Uk41enM5cDRrbTFONXQ1YVR2ZHl5SjNWMnNX?=
 =?utf-8?B?VS9xRDR3OEFoOHZ0QURpVU5VZ205ZEpqazNpdEhrZyt4RWJtMjIvSlNzNnpQ?=
 =?utf-8?B?akVtK2ppdHR0anRERnJpRnBiV0pQUGlaVlJMQjVCZVhlV0xld3VTaWQvQWts?=
 =?utf-8?B?UmlxS29JbDI3M3kzVi9lWmFScVd0QTM1NGV1ZWU2RndMOVlnbGtTcC9IL25R?=
 =?utf-8?B?VWtOSDgzSEFCclJhNXZlZUlhbU04KzBITDNTdGZCY0NqNTdKeTFxcDMrbmpy?=
 =?utf-8?B?ZjR6cXNZUXlsNHUxUDBObGhiTDN0UGNsZWdPSFFyVEUyVDgwOVU0U25JZFJN?=
 =?utf-8?B?ZTBiemZ0RURDWWtYNlRkVFV2QUtIdnZtYmpsV3ZxT2puTHVMQ3U5bml0UW1D?=
 =?utf-8?B?VmNLdUtwVU1qeVV6OU0vdWFsRndXMkR3Rnk3ZVNqQ1VvUW1VUHM0YzVSMk5s?=
 =?utf-8?B?bTRaMzlyNXJ6VWJDZ0s2eFF6VHJCazUwYlF1ZGhtUGVmb1NYMEd3WVl3b250?=
 =?utf-8?B?NU5rdmkrNThSbWNoT2tiNHV3RHMzemdsRjlESkNSdjVRcTRma3lyZWNIaDkw?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25df8fad-b568-4bb3-21a3-08dbd5b57d3f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 23:52:47.3227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk01bdFhTCScuiVKPlsgaP63QYkVKlVI1IJHDUrNI8uKwq6M1d473ezDSyCpnXW+Pxy3f6Vd+3FoExkBqPKAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mocs: MOCS registers are multicast on
 Xe_HP and beyond
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
Cc: matthew.d.roper@intel.com,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-10-23 17:41:13-03:00)
>The MOCS registers should be written in an MCR-specific manner on Xe_HP
>and beyond to prevent any other driver threads or external firmware from
>putting the hardware into unicast mode while we initialize the MOCS
>table.
>
>Bspec: 66534, 67609, 71185
>Cc: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++--
> drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
> drivers/gpu/drm/xe/xe_mocs.c         | 23 +++++++++++++++--------
> 3 files changed, 20 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index cd1821d96a5d..397e134a4f79 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -43,7 +43,8 @@
> #define FORCEWAKE_ACK_GT_MTL                        XE_REG(0xdfc)
>=20
> /* L3 Cache Control */
>-#define LNCFCMOCS(i)                                XE_REG(0xb020 + (i) *=
 4)
>+#define XELP_LNCFCMOCS(i)                        XE_REG(0xb020 + (i) * 4)
>+#define XEHP_LNCFCMOCS(i)                        XE_REG_MCR(0xb020 + (i) =
* 4)
> #define LNCFCMOCS_REG_COUNT                        32
>=20
> #define MCFG_MCR_SELECTOR                        XE_REG(0xfd0)
>@@ -79,7 +80,8 @@
> #define   PREEMPT_GPGPU_LEVEL_MASK                PREEMPT_GPGPU_LEVEL(1, =
1)
> #define   PREEMPT_3D_OBJECT_LEVEL                REG_BIT(0)
>=20
>-#define GLOBAL_MOCS(i)                                XE_REG(0x4000 + (i)=
 * 4) /* Global MOCS regs */
>+#define XELP_GLOBAL_MOCS(i)                        XE_REG(0x4000 + (i) * =
4)
>+#define XEHP_GLOBAL_MOCS(i)                        XE_REG_MCR(0x4000 + (i=
) * 4)
> #define CCS_AUX_INV                                XE_REG(0x4208)
>=20
> #define VD0_AUX_INV                                XE_REG(0x4218)
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_a=
ds.c
>index efa4d25424b8..88789826e781 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -473,7 +473,7 @@ static unsigned int guc_mmio_regset_write(struct xe_gu=
c_ads *ads,
>         if (needs_wa_1607983814(xe) && hwe->class =3D=3D XE_ENGINE_CLASS_=
RENDER) {
>                 for (i =3D 0; i < LNCFCMOCS_REG_COUNT; i++) {
>                         guc_mmio_regset_write_one(ads, regset_map,
>-                                                  LNCFCMOCS(i), count++);
>+                                                  XELP_LNCFCMOCS(i), coun=
t++);
>                 }
>         }
>=20
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 19a8146ded9a..21972bbef8fd 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -10,6 +10,7 @@
> #include "xe_device.h"
> #include "xe_exec_queue.h"
> #include "xe_gt.h"
>+#include "xe_gt_mcr.h"
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
> #include "xe_step_types.h"
>@@ -491,8 +492,7 @@ static u32 get_entry_control(const struct xe_mocs_info=
 *info,
> }
>=20
> static void __init_mocs_table(struct xe_gt *gt,
>-                              const struct xe_mocs_info *info,
>-                              u32 addr)
>+                              const struct xe_mocs_info *info)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>=20
>@@ -505,10 +505,13 @@ static void __init_mocs_table(struct xe_gt *gt,
>         for (i =3D 0;
>              i < info->n_entries ? (mocs =3D get_entry_control(info, i)),=
 1 : 0;
>              i++) {
>-                struct xe_reg reg =3D XE_REG(addr + i * 4);
>+                mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i,
>+                         XELP_GLOBAL_MOCS(i).addr, mocs);
>=20
>-                mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.add=
r, mocs);
>-                xe_mmio_write32(gt, reg, mocs);
>+                if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250)
>+                        xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i)=
, mocs);
>+                else
>+                        xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
>         }
> }
>=20
>@@ -542,9 +545,13 @@ static void init_l3cc_table(struct xe_gt *gt,
>              (l3cc =3D l3cc_combine(get_entry_l3cc(info, 2 * i),
>                                   get_entry_l3cc(info, 2 * i + 1))), 1 : =
0;
>              i++) {
>-                mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMO=
CS(i).addr,
>+                mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, XELP_LN=
CFCMOCS(i).addr,
>                          l3cc);
>-                xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
>+
>+                if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1250)
>+                        xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), =
l3cc);
>+                else
>+                        xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
>         }
> }
>=20
>@@ -569,7 +576,7 @@ void xe_mocs_init(struct xe_gt *gt)
>         mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
>=20
>         if (flags & HAS_GLOBAL_MOCS)
>-                __init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
>+                __init_mocs_table(gt, &table);
>=20
>         /*
>          * Initialize the L3CC table as part of mocs initalization to mak=
e
>--=20
>2.41.0
>
