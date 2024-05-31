Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B71C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5E10E008;
	Fri, 31 May 2024 16:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHcVhNaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977B10E008
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717172431; x=1748708431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=il8LULj0AfPB392b527esmf2K4PftnsVN2F1+4q0FAo=;
 b=BHcVhNaD6XonSlwifynqsxr2OMKwzzTXRUDL6VX8ORwOHRqJVzz8a0HC
 3GGpxRs0eTdueMTK7919pIBQZmtgK/GV2DQkmwBNIML5rIu22igxMrxhD
 FtPTmG/5QeUZrkTSj/xh2xZ35BKW61stXwkcx5cjDwicBtZtJxk8afvSr
 QT/N5LP5E9OM2CNDh5ioXPhtiTkrB+VfxIlaw83cPaf7cZ98vjXqpnm81
 flI3Uw3lSXjpOVEF719k6xcZJ6FtgGygQLW2wAmTwP5Iy/1GTSnaLBCyH
 jlX5m2dsAsria8sn6ALCwy76CMYPH/V8VDhJ1ks2ic9fJo++J72OzKG5s Q==;
X-CSE-ConnectionGUID: jtdvsZkrQ02G5xjbzc50qw==
X-CSE-MsgGUID: U/4DWbZuTV2Pt2fkMuiXpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25126229"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25126229"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:20:30 -0700
X-CSE-ConnectionGUID: nroYYzR7TTyG9dYylDLfNw==
X-CSE-MsgGUID: tIshYGEOTTyu5ZYF2iVs3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="41125474"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:20:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:20:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:20:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR6dxD3E6Uyjo62QMYeb84beOG+3XJpSJvOxidEnYLQsIKx336Zh3UU6mb1SVeAb9JJnq5mEDb1NXfv4FPGPcnBNzrWZ1e2lzilVdMzsovXxXwufKnPInxuLCT3Jm0jc1FEwUtruNUUF1+jJHsFjSQqmS2ZaoJdn8JHQBwfXd+1MhYDMFJ4rT2aHtyAk0vEtfnH4CfX3FvrM0rbxygVOAj96PGD6/wiI6Hx2IZrDxxERQGGo4JM19Wee/Ehua3Rwlii1ro+a98spmLaeQK9PPFG+A6hMEKipsYuexWimrKRdz76z8dUbfl9ld7epdIjPBPW29auM2rIfiniJyDrAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NREecT8C/vkcYGOi1Ls+/yU2L5sO9IP+dyBS7AEasiM=;
 b=UxJ2jlUNoah3/AvvizUiPGHnUqngwVLHpGyy9XF9X/Szb9IebxvL94CPkvIZaphrc2yRLps14htdaQD70jE6eYF3ZzRZUO5BazzQW9raCkspIFKAatctHG3ajhShLMtlUCugPpINAouMtDsY3YqI6ULjcbarvZ+eVl/8aP6hBI2E0zp5A1NtuQm6OBjW5TAOrdpllgBts6QOK86KT7k6ESU105KbA1KhrGoDteIrQ2DVQr7knUPVLPROVOsXtkVYdqh/8wbz8Jll4ybhla+9dvtJ/IBg51m2d/WdECXZppY7G7ZJANLNSy93/kbh/b5zK5C372MOQLKBidac+s1gaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 16:20:26 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%3]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:20:26 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Topic: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Index: AQHasykfIsGvi7iSpk+TPtbYf0ZunLGxhHJg
Date: Fri, 31 May 2024 16:20:26 +0000
Message-ID: <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
In-Reply-To: <20240531070717.1904762-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|CH0PR11MB5234:EE_
x-ms-office365-filtering-correlation-id: 1bea0ebd-b5e8-4d04-16ea-08dc818d94e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?fj1HK1Lj09lagyx7VLUNPiwdGDPfVkYi6VovpPeNPIhFbTsCwyqW5lMbDJ2k?=
 =?us-ascii?Q?7ORp0KNmkHgv3s47qVq1gt6bWkuraHo31p4rcUUuMTh4r1tp2MdpsSoZTObn?=
 =?us-ascii?Q?W6Ik3MZeko+yolu3JWVEhnBt+vbcjgKisLgH2lPn/S+zAJhHqVLccwzweelc?=
 =?us-ascii?Q?uoh9cN/691J9LMGGyqS8gJoKsjVOyrAjXk/QMuhHmNWN95d0N4w9RZ8dfXTo?=
 =?us-ascii?Q?8NmohVUSIqHzXUE9CBX0GHaii5gueJtFNNqztyLEFNMAMCbf7e8cF/AmEWBV?=
 =?us-ascii?Q?LKo+PgOxqowloX7w36MrZ/jXxEYAl0Kkrm+dVFtXdub3cHgXgZwHlxDlg/gq?=
 =?us-ascii?Q?LK8mxZPO3Rbw7F/47ENjc5Kq4pH3zeBlOtx8jFx69JDaxw6SvpsprowQn+fZ?=
 =?us-ascii?Q?57RaKbelTEhK19/7uzHZRb67SR4zZex5n58KgbKbhxTwYqUNqcRpE6zxWFgW?=
 =?us-ascii?Q?tYUEWQpnAjKYt4kGLjlt0bVZvhWM/YjhC6pu02NxUkoO4lYrmXHkGziLufvp?=
 =?us-ascii?Q?lvlIShUwKHiA17XHbdPhiIjsHmvQN7Q3YqfH9rOBnWHZozP0Invw8pRtIYVh?=
 =?us-ascii?Q?oIZCJJm779X/mwxC2wdpJ9PzioodW7ocZAUPgxZkO18cFTpz4gVQkq5daQLP?=
 =?us-ascii?Q?pQC58mcTOfhJOrfJvk9NYkQF67gxdt5jsc1HF2PV7veYreySURR3x2FkJkHk?=
 =?us-ascii?Q?Fk1/RpMOx+CTH4enYFgpoJXpizhpEaTIEMkOY3GNpvfjGGiEAoyOjXeTePtq?=
 =?us-ascii?Q?Am2jnFbEY8ZiqRXaNb70KmYC+p/GDD5MEq0WuTtHB1bFJmK9+TwgSTlzPWdQ?=
 =?us-ascii?Q?sxeKLViZAi92mnUI4JGoMq9xTxZsMIdotZV6YBsevJFKGiovNumeumtYV6av?=
 =?us-ascii?Q?xm0lhjzK7BLbek2atps/kZXX1BNKI/WEafUmhHuIbVkxi/e9Pe07UvxVghIa?=
 =?us-ascii?Q?v/tK/K3v7TOMsW0esONjG0pDYJdEZWsJNIHgU5zn+GWtk73tJ9nXtJ6aA3TQ?=
 =?us-ascii?Q?CpEc37css6wuo1m31qOiDXtMK6WNZpEFf4KnF+lj0bWkwhivtDO2QoAe0Mdq?=
 =?us-ascii?Q?V7dnjUDXWYWgdKUEYxdOElBDxO9pUAA9o2mTuhuWV5WbotwJVx/zAYvC91W4?=
 =?us-ascii?Q?NTCAg2ODplSOK6WCq0CcVumLD0jHZBilkRYcVBVJBaE0bKCaTaAGepQqhyt+?=
 =?us-ascii?Q?OqjCqXeHUXTU0Xviwtokh2sON4PT+0mPN0ylQCJ+GYn5SJ/WcI3ZX/7TxJ+L?=
 =?us-ascii?Q?J2RPaxio6r/AKS2PNIj2ZuWqizXSpSbOsrj7pj4yT/xjdv18lkCp/24corSG?=
 =?us-ascii?Q?IpppHt26CA8OpPtN858yDTrmFgcp+pCDP+3yxEr36Nm3Rg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vVMGag2WT2SRI1DiWQPuv12/p2IgmdUutwm20nAQfXdYam4ugzyD3ewERDF4?=
 =?us-ascii?Q?4bbPx9ccwalK+OkGWy5uQvq4AuIs9cNmu6oek7G2ySnCb7c29LI4SFLMnydm?=
 =?us-ascii?Q?2QQYBqV6eojnJO6tmFM2P15qEowGqyjTBgcc1hMW1eZ9tX5Zv3SUfwBnGOgr?=
 =?us-ascii?Q?WEebjhf9Ua1sJxOtAwXmm8s+x3qUSkEipsdhezMAEWw1C/JfhyOxnFH4TPNX?=
 =?us-ascii?Q?BbxH3soGp5F8k8W4K9lVSaZS13736fhAZWO1K/CKUcRXkkXnDyEv23zS8Tca?=
 =?us-ascii?Q?KFv50rik+jwMTzU/utcHP8O7XgT9QWE/qduAq8ZvYj96qsHnm/m8/pSf0DU8?=
 =?us-ascii?Q?OJxuYgK3e7nxW86TDQiwBEh2X5KubkgBcQlZuuv0Bip//tl65BD9WMiNpeJL?=
 =?us-ascii?Q?WvzALCed+auMmiDFRDs8q0uEUATMh5RHZRd0IXh+OP25KZ7rUpeo8qChFZWK?=
 =?us-ascii?Q?fxz4Qqt6csyD4LporBAe32+ub2Yn8sJ8PyXt4/U7pt3zX5BmSI+iPNuHEoXn?=
 =?us-ascii?Q?MeNRX9p61r3HiflkWN77gies55STNIdubGMEwryeMzY5o2elufxFrLs5xFN9?=
 =?us-ascii?Q?3qoAtV/FLNdzx7NujZ5jjmggG0nE6T/iuYP/sz0KmGsxcUe6lsC1k8yJDX1G?=
 =?us-ascii?Q?TN5h7JEkoOX7P89/qCM9N8kbc/Ifg7rF1kXCSCE7WzHhsZgvS4Vb025BM9nU?=
 =?us-ascii?Q?JMov3oIerWvYn1D0UiOumSc2Nc3SBkXNBhYpYcXxIwKHtjJ5VVHx72OcQAca?=
 =?us-ascii?Q?S/vjcIRhxOaPVuFji75iSaMUYpfkcmm52Enz8aIIa3Lp+lGstDAevljd2Bzr?=
 =?us-ascii?Q?BlsebwPZ8+9D01epq10N08h70zmZzAWCVWfMMTsVAcr80IxCDVquGkkWCevO?=
 =?us-ascii?Q?S1R78arBZcAIlrxzYTN3JPWchrCssqau7js+DsR2Q7GLdQqWKFdJw65tnR/2?=
 =?us-ascii?Q?XxGdGBABUfKs3bLmyI9Tsrqx7poDmT4GS7a3tgBvOpEbAcB6oz4CBAWWdz7Z?=
 =?us-ascii?Q?I8AAXMr7IW9gAnpvcezl2oehYH9F6YGzHsXhiNEfk6hF0y4BomWXb4QUepiC?=
 =?us-ascii?Q?eM4NX4pR0yYXbQ75e9nWOxOmmOECu4ONoffvNSuiZoVixiL3x83Acpdx1t/L?=
 =?us-ascii?Q?slX93UelGL2wn0cnF+BJB4R2U0/HFBiF8p6kiDxoWaJ+/UwrWL8236/R1uQb?=
 =?us-ascii?Q?3lvbSskK4itm+aQh/a8JQ6pAYpWOm1+GRLrmPnh0OA98A03ZLCdvSftD7pnA?=
 =?us-ascii?Q?SEr7XMVb7wAnze5EJaWUEjiSMLbK02DvYIltKnjieRpcpQpYSayYPzJxadJh?=
 =?us-ascii?Q?DLbuwrS8jVfwqScAzxqfwtHtligHRGbwPO7Kq7P8gem8xVtvFyJ0qXXUJ8N2?=
 =?us-ascii?Q?y7bjfe63TGirCUdfe8x8LUAoEFSU/4irgyoF+Nv/mJurwA+CydIdtjWJE5Af?=
 =?us-ascii?Q?TTZRLG/aW+vVPDEjpLw77pCilagCyWBZ96rFJO7IlB0LLsZbgzAGyDCtffqx?=
 =?us-ascii?Q?QefuCedJywnsw6ROOkT6NSa8JRtKkLbwlEsnjmP+kr0wI7E55iOZxmRL+AaF?=
 =?us-ascii?Q?QPmhzngy2x/OpU6Aov4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bea0ebd-b5e8-4d04-16ea-08dc818d94e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 16:20:26.8077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOun3odQ4VIkafmoD2ULlAseXKGiC90lrm0yot5fDYPlUirM2cJ4crFllAEdpN+iRC3bI+dViQGbd1+e9doiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

> Overmapping the identity VRAM mapping is triggering hardware bugs on cert=
ain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 54 ++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c index b882d32eebfe..2d92ec27981c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -69,7 +69,7 @@ struct xe_migrate {
>
>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */  #define MAX=
_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK)=
 + 1) */ -#define NUM_KERNEL_PDE 17
> +#define NUM_KERNEL_PDE 15
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @@ =
-136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, s=
truct xe_migrate *m,
>       struct xe_device *xe =3D tile_to_xe(tile);
>       u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>       u8 id =3D tile->id;
> -     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->le=
vel;
> +     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->le=
vel,
> +         num_setup =3D num_level + 1;
>       u32 map_ofs, level, i;
>       struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
> -     u64 entry;
> +     u64 entry, pt30_ofs;;
>
>       /* Can't bump NUM_PT_SLOTS too high */
>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +160,12=
 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrat=
e *m,
>       if (IS_ERR(bo))
>               return PTR_ERR(bo);
>
> -     entry =3D vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pa=
t_index);
> +     /* PT31 reserved for 2M identity map */
> +     pt30_ofs =3D bo->size - 2 * XE_PAGE_SIZE;
> +     entry =3D vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>
> -     map_ofs =3D (num_entries - num_level) * XE_PAGE_SIZE;
> +     map_ofs =3D (num_entries - num_setup) * XE_PAGE_SIZE;
>
>       /* Map the entire BO in our level 0 pt */
>       for (i =3D 0, level =3D 0; i < num_entries; level++) { @@ -233,7 +2=
36,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_mi=
grate *m,
>       }
>
>       /* Write PDE's that point to our BO. */
> -     for (i =3D 0; i < num_entries - num_level; i++) {
> +     for (i =3D 0; i < map_ofs / PAGE_SIZE; i++) {
>               entry =3D vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SI=
ZE,
>                                                 pat_index);
>
> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile=
, struct xe_migrate *m,
>       /* Identity map the entire vram at 256GiB offset */
>       if (IS_DGFX(xe)) {
>               u64 pos, ofs, flags;
> +             /* XXX: Unclear if this should be usable_size? */
> +             u64 vram_limit =3D  xe->mem.vram.actual_physical_size +
> +                     xe->mem.vram.dpa_base;
>
>               level =3D 2;
>               ofs =3D map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -258,2=
1 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct =
xe_migrate *m,
>                                                   true, 0);
>
>               /*
> -              * Use 1GB pages, it shouldn't matter the physical amount o=
f
> -              * vram is less, when we don't access it.
> +              * Use 1GB pages when possible, last unaligned chunk use 2M=
B
> +              * pages as WOCPM is not allowed to be mapped on certain
> +              * platforms.
>                */
> -             for (pos =3D xe->mem.vram.dpa_base;
> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vram=
.dpa_base;
> -                  pos +=3D SZ_1G, ofs +=3D 8)
> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +             for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
> +                  pos +=3D SZ_1G, ofs +=3D 8) {
> +                     if (pos + SZ_1G > vram_limit) {

I'm afraid this patch wouldn't take effect on platforms where vram_limit is
1G aligned. Even for the last 1G, this check wouldn't be true.
Should be if (pos + SZ_1G >=3D vram_limit)?

> +                             u64 pt31_ofs =3D bo->size - XE_PAGE_SIZE;
> +
> +                             entry =3D vm->pt_ops->pde_encode_bo(bo, pt3=
1_ofs,
> +                                                               pat_index=
);
> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> +
> +                             flags =3D vm->pt_ops->pte_encode_addr(xe, 0=
,
> +                                                                 pat_ind=
ex,
> +                                                                 level -=
 1,
> +                                                                 true, 0=
);
> +
> +                             for (ofs =3D pt31_ofs; pos < vram_limit;
> +                                  pos +=3D SZ_2M, ofs +=3D 8)
> +                                     xe_map_wr(xe, &bo->vmap, ofs, u64, =
pos | flags);
> +                     } else {
> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | fl=
ags);
> +                     }
> +             }
> +
> +             xe_assert(xe, pos =3D=3D vram_limit);
>       }
>
>       /*
>        * Example layout created above, with root level =3D 3:
>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
> -      * [PT29 =3D PDE 0] [PT30 =3D PDE 1] [PT31 =3D PDE 2]
> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> +      * [PT28 =3D PDE 0] [PT29 =3D PDE 1] [PT30 =3D PDE 2] [PT31 =3D 2M =
vram
> +identity map]
>        *
>        * This makes the lowest part of the VM point to the pagetables.
>        * Hence the lowest 2M in the vm should point to itself, with a few=
 writes
> --
> 2.34.1
>
