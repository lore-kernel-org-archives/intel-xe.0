Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69B3C0219B
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 20:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D81510E94F;
	Thu,  6 Feb 2025 20:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAcb+5xT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703FA10E00E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738875194; x=1770411194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7c0igdo7DYoFLGSbxzwlpXyQR6+JdghEKBUZhp2yBGc=;
 b=GAcb+5xT1YLOu1D21afDpBNdl1TltNLujhOA9a75QhgldLV0sstRYjFv
 2+LY7QFCthcziYKRbDmTEAVfR4JgS0Qv8/GiqpnVeij5mx+L3ObiBYcyB
 Q+dvrFyNpuSOpFJJxOmGFVJ10oWYW7YpJ1oEDZNEysO2pyllN55tCm2x3
 gy0mrHI0fhksDryJp/GNr223yfM0//YqGMRXd/X39HelsMKJZeI1eJ9g2
 XcM43Lu72clfwko8Lek7o72qej6SZyW+2EhbIBxuwf9NZxOd2mo2wAtlA
 etkxVB4fk/Fh1VPfoIqxImXUtWjGsxK4CZnKDVCzPFc7loq5n5hCmIkC6 g==;
X-CSE-ConnectionGUID: gCoDAO/DRQOsqg7uD36QMw==
X-CSE-MsgGUID: HdzG0PgRSQeKOAPmA14P6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39620070"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39620070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 12:53:14 -0800
X-CSE-ConnectionGUID: EpuuPyB6QZ+unkj9A2zCfw==
X-CSE-MsgGUID: CxvzU9HDSfSo0KaqN5sN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111757742"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 12:53:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 12:53:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 12:53:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 12:53:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqyoLWKCOwC662nZUldxPEUGVazR0UHE64ICrEnc8XKG4KYC2c/I2P3V1qVaC9+Edd621P1wqzACz3bS0a86wcEprbeDx0um6wonwc9VIHk8nsnKh6c8SQHE+NDbxAxtoaOgkzCe5fNDjrGfyeR4WtGARqqmSQ2ATXhQXxh+DYbEYuDLsxsB3o9N4KLyCCLSoskZykYiCyaci4vC2aS/NiBHmK2ZFlVZtReY7PitVfZ07bzeYq11eaCawXT3aglKmteT583NqF6CL+mVYqzicJi0AkIMIUaPbRK9Nf7eJjrPKU8JpbbALlW7g7EAebQqdjWYKaTeJoPOVJWw1D5LRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psu6ls9s7EI9Dvns4nGchBz9RES/7czMRFKmMRxXE6o=;
 b=bPufYwtE7r++pxfo8utm6PpZozrOYAjHAqIHhVE5o61JsOz0vEPMvF2AHGWYuWc3ruOaHV0PVd94jTw9diQmrmQ4tr0Xr73kmTs1gXse60gFZWBVCNc4CNj169yAzKodvrQG2DzCUveN655g7knCxwoFt6sOjbn0I4C3tF/+AtX6Gw9gkFYZzCPqf/65v065lOgDJLlzNdz0gqPyyaVfJULk3DSFFTgEHx8sDZLkC/lyci339qUc5Q6BadDIJbXn66x1wn0yqYW5Um32YMb5evxsw6GFkNYvRQjEz/5n9Pva9MHe7KZxjqCI9081Q6RcaEz4EjqW2rj3gFazCISdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 20:52:40 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 20:52:39 +0000
Date: Thu, 6 Feb 2025 15:52:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Rename struct xe_mem_region to struct
 xe_vram_region
Message-ID: <Z6UhFUflmeau8zzN@intel.com>
References: <20250203135359.735832-1-piotr.piorkowski@intel.com>
 <20250203135359.735832-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203135359.735832-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MW4PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:303:b4::27) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 57adc989-f2fe-43d1-0ca0-08dd46f031c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tVj5Ebzhbb2bexhyPxgz3xdaDid14YdDRllYWDh58NJNg37oT0H9KWpGgP?=
 =?iso-8859-1?Q?30TSNaj7qN7Ud/zFBf28PuGvgaL/TBGAgAxi4hCRT4Fq3QqyfUg3Uzxbzw?=
 =?iso-8859-1?Q?KWnN085s9TwpNRxYtW2lnRiedOhjKLN4/Zyp7kIps2hi7LhUPEVesPORiy?=
 =?iso-8859-1?Q?i4fNjxogpd+Z8QtDzXI0XSZA5ygp6rMXJGmR7bvuu0WYgrA71FFU7y5kLT?=
 =?iso-8859-1?Q?XHl2/021z9scKiiMYADVt3bVWT2bbNh4fWhJWKhmE+JpwsHgvJwfGI8Qix?=
 =?iso-8859-1?Q?zZOW7b+SZDSUlnJE1d1jHh8zH2Km8AyY5VgHXUriZG/KifQCvUH4xsbf22?=
 =?iso-8859-1?Q?l7IKjiN6Sjcs9h5mZ2m5/0V1yQNp5LelEuagW5b91uvN3iKR94GHEKGeEu?=
 =?iso-8859-1?Q?VFCl/irAAGk59v0IFPXv+SD3pjDf33dLXgFdJMEoW5VZMgdgnGrS6OUPct?=
 =?iso-8859-1?Q?duTzqSbeQlyM6n2/3S5oII/B6slg9YZ3gE9S0aaadOZDw6Zp36i6qoEo2I?=
 =?iso-8859-1?Q?D1Dj2NP2VskjVNQ+4MN79/STAeb8y0Os6zJA1P2ve0iGHUVzJSWOtXJKAg?=
 =?iso-8859-1?Q?FcZO44yucbB/xScXUXBGYVdN3umHJ6SWLpvSGqywKFJ096QfdjXsNtrV+T?=
 =?iso-8859-1?Q?jQtCws+zeLjVZ2d5BW3EWY5CvxMFJP/qIuQ7RO9Akm4Oo4DCd+sro12oBe?=
 =?iso-8859-1?Q?Y8HYxzxhi+a5veI7VxTTzqdG+FqP4zUwq9GR/UtTjP6QFztlqdRs8mHkeA?=
 =?iso-8859-1?Q?R9JXhqJKVUpewY1FOlHXB4aOKvbRxIe6HeyCjEGWH38CvpShyjXN61opBa?=
 =?iso-8859-1?Q?aCETirQrhTtQZ1ZXiA7bfRwGEcXunApdfdTfN5BFUXC1oy6VmjV8AqGMkW?=
 =?iso-8859-1?Q?WlsuESpkOHGZqvnZ4fIWszW2ir8k3Nue+beidPaQXvWh4LWtX+VRd0uHVx?=
 =?iso-8859-1?Q?glYbwTmoU6Y8b47aaGUH6FCjKce4jtmdmlxw+fAFdhD3Krf05gxlYnms5J?=
 =?iso-8859-1?Q?BbrvxBFf9VDVbELYLblNMfzfVYwrYxNXwDI2zYXZ+XptDxHy/LmammHRzE?=
 =?iso-8859-1?Q?tAq1oVCtMnAo3/UoxMScBV28rm02baQaLX/A4gazpnYW83ZHRYc5RlVVBA?=
 =?iso-8859-1?Q?dqwA5b4+A6O76nr+r7wfSkSBFGim0oTVkR5GFM4z++vjaPyR/gvWLy63De?=
 =?iso-8859-1?Q?DgDhm7z+cJBfcXCcb3PwCsZ0FA0FY1TMffqUhpJXNhhoI+K8ouqYRrZ3k3?=
 =?iso-8859-1?Q?T+UIMrefm5VzxTUFv4G18UnbnxvvZ0/4u0ttrf37M2Us1T2Mn2zCu6Y3G0?=
 =?iso-8859-1?Q?O40d6FhEaAYzqX4dn5ZqBupGaQtUTxQCdMli+1hZnQTcS7bvRhKBbaLIMK?=
 =?iso-8859-1?Q?PIp7MRv0zTSjzFxNO2T4WsHBEUPeP87B1WOobCtWGkyKMZU/dT8nShxgG3?=
 =?iso-8859-1?Q?s5JtkMuHnKURLkAs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u4lHxowNXImPYGCZzVOv/vNhPdXmv3bb4dg9uRi51JzOf/0fdfzNH63jFW?=
 =?iso-8859-1?Q?HTOB8YyitVq2+5fitb/alqh+o3T3RGHe3nB7P/n8o3cEtYEHJTPXkda32Q?=
 =?iso-8859-1?Q?yaX+EKJYwygdKIRYqsgDrS9aljpTFO8TLt39KrOv2fMi/bmNZPQgI+4/pM?=
 =?iso-8859-1?Q?V9+DMIRDIgdyTpDn0Viym7unBLC/xhj1p5+9TITccD1ga6pSsKxyEa6FWR?=
 =?iso-8859-1?Q?PSoTXG/yPgpgeHt2spkelXwoSBNro9ajfx0vYPqQv/me7IQsnpCUs9GJWm?=
 =?iso-8859-1?Q?yBXcaDT69cKhTzNrWT8EsM1xrHroL/VQtNR5bhvJgZKBoQ5XDv7MGInbZW?=
 =?iso-8859-1?Q?uA+G4BwNTtZn/ZXbGVqsZM49hkPlhD/UoZQYUnBoIScwBMyehNOzcEm2mP?=
 =?iso-8859-1?Q?CgWgUoWX7fOIEcsfS3FWbSNGiNZVB/sxItbTplk9MvAPo/9LabPqs+cMcC?=
 =?iso-8859-1?Q?g7EZwJnk3leR5rznDsmBGgvrvcxB6kXOovNBbazu6feHbwkVob2ZXkMGnt?=
 =?iso-8859-1?Q?3Fbt0X0yutcll/aHx251MMl6Sgol9O/J7/880P6fEa8WFNwKtP1NRiXSpB?=
 =?iso-8859-1?Q?4bhaayp/O3r7fVIRdQexEzzJrIkKzCpwAozH+hjztqpgt+UuqQ6mRz59A7?=
 =?iso-8859-1?Q?PVQP681Ds2n1t4LjEObPtmVA/5dz+dK8bzqkJVc6loKoFKgDtOLzkpO+Iw?=
 =?iso-8859-1?Q?zVLYSsMa2204RGRaVYz6c0xmA8OZjeY+/+Fpn/+PPz1oGEghnOGPMFCjPN?=
 =?iso-8859-1?Q?+Y6fA/vLyw2ZHjRzeexyjczfBBT3Pnz1Vvgl3kq+89XsmA6N+YKf2I8y0v?=
 =?iso-8859-1?Q?pEDB0DTHLtYHXGZYda1zGQ92cEEzo8T191YC/4DsjrthbXFaXEIBuuRzSR?=
 =?iso-8859-1?Q?p3JZ36L+961KOLUiMWZpmO+1pOy9HcSXePMClbu/4/qRaOZBQ42F2V4rkh?=
 =?iso-8859-1?Q?708eCpzVhhO6wNKbKrHi6wuaXR9bASquF8wyitJvpzEnGYJtVS1umUF5hX?=
 =?iso-8859-1?Q?LbnYzut4CqR1sal7QKcXgXcjnuzuzJPpEld++U0KZguqkdYFgM/7bCDf+r?=
 =?iso-8859-1?Q?l4lquIGjxurxQs68rWZNfSDn65xp0rXUX/wtrM5oVfQLy6VWqiwE++FSwI?=
 =?iso-8859-1?Q?5LEsTPug8NGzrgd0/uo7DaC3QSFSzJ8xvSP015dS7qKip4czxsFeTtBmo4?=
 =?iso-8859-1?Q?Q8hXKV+Adggm6grLbr+WA7zvBYe7T69NzYafU+pWzGIQc5ZKnWIru5t+ik?=
 =?iso-8859-1?Q?Qs0IxFc/RaFwvWOIScvCCO2lyVzxjCT+34mIAj97iMELyltKLPVHFwnfvo?=
 =?iso-8859-1?Q?whtuo0a0tW26SW+VgBajNFeP6GNaTI52Q2S0XUobchXYvzLX0NXlntKk7H?=
 =?iso-8859-1?Q?QyiHhQTf5QyW0IW+20hMrZJil9qCiiVkR/UJcBxJa+HmdtqFt0NWKEw1NV?=
 =?iso-8859-1?Q?xQUvXVkbZVJHIEp7IbcxsXX0p+9icjL9q6jN60doPWGU3nao8wUDyXaHlQ?=
 =?iso-8859-1?Q?56N7YgGpdntPmV9rxz+DdAq5FOOki8hcBU15Hg/nknp+R1icqChBSFgKkA?=
 =?iso-8859-1?Q?i98fu3sjUo3gFuP0D5uKf5NQ9K7JTn5PiFQBb61Rt17zn5DqDkVWVAb0xa?=
 =?iso-8859-1?Q?Y/3RiQbThPCPuzzDrMshJEKFeb5a6czCh4D93i2A1HeLy3ELUSvNDUlg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57adc989-f2fe-43d1-0ca0-08dd46f031c2
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:52:39.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD1wJDq/5vBZmDrSmDTWqiIDiuqZ5XXn0WFFGpadKIcAcprxL79JBR3JZHZkO6cPmgTSrTgWFjXPdPTBNtw8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
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

On Mon, Feb 03, 2025 at 02:53:58PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> The xe_mem_region structure has so far been used only in the context
> of VRAM regions. Also, the description of its fields clearly indicates
> that it was designed for VRAM regions. This struct is strictly related
> only to VRAM.
> So let's be clear on this point and rename it to xe_vram_region.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++------
>  drivers/gpu/drm/xe/xe_device_types.h       |  8 ++++----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ++--
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c32201123d44..095794200438 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -141,7 +141,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
>  	return tile->migrate;
>  }
>  
> -static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
> +static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>  	struct ttm_resource_manager *mgr;
> @@ -177,7 +177,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>  {
>  	struct ttm_place place = { .mem_type = mem_type };
> -	struct xe_mem_region *vram;
> +	struct xe_vram_region *vram;
>  	u64 io_size;
>  
>  	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> @@ -466,7 +466,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  		return 0;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
> -		struct xe_mem_region *vram = res_to_mem_region(mem);
> +		struct xe_vram_region *vram = res_to_mem_region(mem);
>  
>  		if (!xe_ttm_resource_visible(mem))
>  			return -EINVAL;
> @@ -813,7 +813,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  			/* Create a new VMAP once kernel BO back in VRAM */
>  			if (!ret && resource_is_vram(new_mem)) {
> -				struct xe_mem_region *vram = res_to_mem_region(new_mem);
> +				struct xe_vram_region *vram = res_to_mem_region(new_mem);
>  				void __iomem *new_addr = vram->mapping +
>  					(new_mem->start << PAGE_SHIFT);
>  
> @@ -1023,7 +1023,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
>  {
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct xe_res_cursor cursor;
> -	struct xe_mem_region *vram;
> +	struct xe_vram_region *vram;
>  
>  	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
>  		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
> @@ -1163,7 +1163,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	struct iosys_map vmap;
>  	struct xe_res_cursor cursor;
> -	struct xe_mem_region *vram;
> +	struct xe_vram_region *vram;
>  	int bytes_left = len;
>  
>  	xe_bo_assert_held(bo);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 89f532b67bc4..c7c285c6a6c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -69,11 +69,11 @@ struct xe_pat_ops;
>  		 struct xe_tile * : (tile__)->xe)
>  
>  /**
> - * struct xe_mem_region - memory region structure
> + * struct xe_vram_region - memory region structure
>   * This is used to describe a memory region in xe
>   * device, such as HBM memory or CXL extension memory.
>   */
> -struct xe_mem_region {
> +struct xe_vram_region {
>  	/** @io_start: IO start address of this VRAM instance */
>  	resource_size_t io_start;
>  	/**
> @@ -196,7 +196,7 @@ struct xe_tile {
>  		 * Although VRAM is associated with a specific tile, it can
>  		 * still be accessed by all tiles' GTs.
>  		 */
> -		struct xe_mem_region vram;
> +		struct xe_vram_region vram;
>  
>  		/** @mem.vram_mgr: VRAM TTM manager */
>  		struct xe_ttm_vram_mgr *vram_mgr;
> @@ -366,7 +366,7 @@ struct xe_device {
>  	/** @mem: memory info for device */
>  	struct {
>  		/** @mem.vram: VRAM info for device */
> -		struct xe_mem_region vram;
> +		struct xe_vram_region vram;
>  		/** @mem.sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
>  	} mem;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index f4a16e5fa770..a8c37fb4fec0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_mem_region *vram = &tile->mem.vram;
> +	struct xe_vram_region *vram = &tile->mem.vram;
>  
>  	mgr->vram = vram;
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 2d75cf126289..4c52ced4ee44 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -9,7 +9,7 @@
>  #include <drm/drm_buddy.h>
>  #include <drm/ttm/ttm_device.h>
>  
> -struct xe_mem_region;
> +struct xe_vram_region;
>  
>  /**
>   * struct xe_ttm_vram_mgr - XE TTM VRAM manager
> @@ -22,7 +22,7 @@ struct xe_ttm_vram_mgr {
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct drm_buddy mm;
>  	/** @vram: ptr to details of associated VRAM region */
> -	struct xe_mem_region *vram;
> +	struct xe_vram_region *vram;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> -- 
> 2.34.1
> 
