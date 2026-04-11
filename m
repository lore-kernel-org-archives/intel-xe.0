Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14086F45A1D
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 05:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8CC10E18C;
	Sat, 11 Apr 2026 05:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihDzIqDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0C610E18C
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 05:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775885506; x=1807421506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l1rlidbuqKjiE/RDQPGeYBYwxa2xgi1lR4WhaYf+Q5k=;
 b=ihDzIqDVNZk097AfIYckSF/iXiGqkOTnbUS/rn8EOFhCXFLoHC79ROL7
 9UqLpqmCrDHhbhG4sJ61/1Fn2B5QJR+lybiFEDlRdUym49Y4E1Rcd5jTv
 XONlTay+2q4aC8hwd3WaDnTgDDvam1gP/1WsZBak4kBN37XcsSgtXr6gw
 HIxplUa6wBhOMDvriV5/j7QsLlgU/1Wqrvu5fJCRheHu9qVuRCkQEDjDh
 y8Z7cv9ybI7Q8hNCTBUtxdud2fI+Mabm6K563wZHSJ2xpYpleU4w1NqfN
 5PoRm7GtBDTP6R8jzW7mpMfwjCyVx+uEyvuHxOcBTjDgyFGCYiGOBnVhW w==;
X-CSE-ConnectionGUID: fHm7ueQPS9SFiDcTYhV8jA==
X-CSE-MsgGUID: uVklgd/uQWqHbmwTyCpVWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79489128"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="79489128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:31:45 -0700
X-CSE-ConnectionGUID: 9vkpwhdaRcytF/SIdn3hrg==
X-CSE-MsgGUID: EwInFx1dSje9ntj3LnSXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="229169771"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:31:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:31:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 22:31:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2eO3Szp04Z5+k3BhtTQz97IXWlUmKXpmyxwZX8auHys3PQSZOlJTE5Z9260eeDB7Rg+bXLo39B3jNDSu+XiiyaWeS3m/vmxB4qhAfKnVwvgZcV1zz0OVXgVCIOL5mRIW4lloC4ZER+nNoiGj70pLQUk6jkoHTdFMn5A5GZpIkzrSRrhp6jZZDIKR/Mt+S/DG4ls9pVhQ+8sUxvEMy8ahyEOAYgHW4H/q4HzTaO9bxKyXVJNUxyF5ZuzGQU18MqbvkKY4dzJzr5SmpESa0mhs1El+oSLtQAZDmiZHBhyDoOF6itthPUMrn/hEDJb3bkU0yPclSkvoaD+fNFPbi1fXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R/tpY4/ohSwWMGhkP4ZvU3e1nX647/F8gzDkNJ1swo=;
 b=I2fSpU0Anywl1ngXpWZm5Z80qYIaLPmGhPx16fnszW1kD3LxcKwhElKM+nMAYXI3sXWTExF4RFWvxEWp0h4ZyBsuRCCPPiDuhnl/LqwVjeosN9fWHu/8zfYKK8TRtg0a1O9ZVSkOFG/pd8p3ncvSk9ft8F3iYGVrOSCbbzPVQO7YEYfstx/npX4PfSZ3l1gLkUQIjjEiTjNV5E4DW+QSDcfpUIr6gnTUPJadoD8uFA9qZVXEEPpMILo1h0x1RUUGzpPUqu2pPAD9ViNKZNDPLHjqf/cvoMkr9XnVUEz6NygLDSmdfLfwDGT3P5f4zC/4BnfwQh9TguqjYMz6lIJ/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB8809.namprd11.prod.outlook.com (2603:10b6:806:46a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 11 Apr
 2026 05:31:39 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 05:31:38 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2 1/4] drm/xe: Fix stale and mismatched kernel-doc member
 tags in header files
Thread-Topic: [PATCH v2 1/4] drm/xe: Fix stale and mismatched kernel-doc
 member tags in header files
Thread-Index: AQHcxgTuULKdPs7tZUe8XX2aRPsa2bXZVymA
Date: Sat, 11 Apr 2026 05:31:38 +0000
Message-ID: <SA1PR11MB8839EA2482DBCD86D80F54EEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
 <20260406203122.3392365-2-shuicheng.lin@intel.com>
In-Reply-To: <20260406203122.3392365-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB8809:EE_
x-ms-office365-filtering-correlation-id: a33ba6b4-bb0b-4eeb-4118-08de978b9af0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: f70+YD+zPNP/xdVMdIdkQ2DlBTsBdPsX66DfP2zfxME4l3K7C4OrHOjLKYhlHwe6LBbn/gzrmg3OGb5le7WzM3sHziqagJSW60JtxLwJQsi7viMLWnOad/4ZFn2i/QlNJvIsHzcg9u0EiKRKmi/pNvSARHqGRUr47pzVLTj0kT9V706qPimb2z68IP/aGGj2WKL6LPnHd448JFYTACAmargFC5dv7eaKG2B6ZIeHNzAnSJ4aqFWjLDj06yLOEzGlDyll1Px4Bhq4L9w7MatlovJ9F5p/SDJHuD2zSgpX9UbIg7Vr8GbXPqdQZ14OFBieurHWYEzsG7fu/lYDyTrnM3iHffe/yi6mBUItRs2Su+rDcetvC1IMybn2rZxG+AA4X9Bks3/qHBrOKnLtc0Mu4mwrzPl2rm7+aXK8IBTKY0gWbQmr2Oz95B2wrgEPMSCSgsFcaluq3rQYfEPyG6KGJpLqgw53Ot8cyO+TXITgMdt38An0TXl+LNgo0jTvUGFthzJsMi3CTaN9h5tDDq8c+/XXoawCoR4UjnJfHLilQq6WeD7YqhIkTxafux/LB8YatQS/kcFjNgXDRJVskdMOInjfla5bZzmj7+VytO1WJhES42B8bYOJ6NdEx3lVwjiJ+XQVIIJaUVfRJe0rTUDz385OsBZo2Vy6OJ9e+ystyoj8f2rdO5gUvju4JEYBN5mpOykhizaDi97URCDj3k+GQVUfT1nqwFFIivutGA7jdt69tDDOT27JG+v3lsugiRKXG0wh3/1yHa8BpKAcnnKPv51u3rgK4mCleiJflGqOjWc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oh8uV4kTwNLa1BcCqCTwPKiEML5SEOV2zjtpQioe6MsZ+511ZXqb0s4E5Ubo?=
 =?us-ascii?Q?YJmmQmY7iqgNqgbxAI2e3Pqk3zN/rnfErbifSY408Zby+vFvAIn3F3OXrdn4?=
 =?us-ascii?Q?TcN4AX/fh+OWQANFkKSn9NfamJzwoCH2Cfq83omhpYIcJ7hgUR/Twnv7X9Bq?=
 =?us-ascii?Q?CRwoH+8wB5ehLYlMYBFVB5uf28h6mQcC9mZ3EW53ZHNpN7hjM2vFw/++qnCI?=
 =?us-ascii?Q?ajuuCUlLOW3Lk3VjCTldcnss+CrhYTbBTiYdOtKIr0No7c4QkBboj2ZxEym4?=
 =?us-ascii?Q?Yc6WCwCMCpzZcydBqQ7YlHpcAiEaHD66iXCAz35lj5dVtx6uO5bfEKCWgRdB?=
 =?us-ascii?Q?erTp+Env1ghwQC59Lp10G4N9LlxpbDWi0wmtywGERBZvVIn2n3A2ANU28AbI?=
 =?us-ascii?Q?qymRZ+UADXHMUrgGDRtPMhq+8LnJf+axzvTTkOF0+INcPQmpE95ANBwvy1Ai?=
 =?us-ascii?Q?AP1Hh74T4TKjTzUrFe6zBnc/ydoKige+WNe2s5b3ZwM3X3PViybpkRF5GSgg?=
 =?us-ascii?Q?78qIsvgQAOzU4qriCCGuoGT+wXVAPhtFpmbcouxNwp4OGlnJZ/T5I66V2vj4?=
 =?us-ascii?Q?QZLvGFZYada+XkbzuWxoshpFtmEFP9cqRCScknmY6RV8RNgHrq3YAdl0sJGX?=
 =?us-ascii?Q?cwmtmkTrcbrL7ztPK4BfY/ajchLhVBWu6HxKmhAzokuOUE3sURm3xP/JGght?=
 =?us-ascii?Q?P9q4HbwPNeamlqfG3hiuja0M3NaOQ8DLCgLfJME5Y2zu99jfvp3XF2zAUiwi?=
 =?us-ascii?Q?mTTzxqX0UwbyzQY154Wu91egSdeMp2ubSmnYuKK6dMNYl+2DcXenWRRMHEy/?=
 =?us-ascii?Q?QMUdZTmnrJ2MlV6qhSV+f8bsXhRlBcpdvVq7AxUq+0F29eGXrsiT2bjz9bMK?=
 =?us-ascii?Q?NHLHz2irXGQerB+KI//AwVv9+ru39XY/i0S43pIGpsR6D9JJjXOjXRIvcjJZ?=
 =?us-ascii?Q?F23hoDgl/9u+YQo5L2ooFhY11OKF1whp5dYSvXtCCYPBQFY3rJGJqdKnLgFt?=
 =?us-ascii?Q?UogWx831vYWxMm8dttSoOaYEiUEFQjkeAwg+GitiakOcfPVbB/oyEgHvDPUy?=
 =?us-ascii?Q?VtWUSglWHgV4EtP8O96mdmJX53y1a8x3VeBDdxWw38CP5gXmshuwaNp7AJVt?=
 =?us-ascii?Q?c9NJdmrydjEfAqjkGZgZ9VK7C7BaQlYsFJyRi63pvsLR72YQjTgwgmbTLxNm?=
 =?us-ascii?Q?M+0BKZEqsUt5em4kyAeTPvWunDx55hgOxirQ+/YG2SJL1T7fZHpEPJAGzUpK?=
 =?us-ascii?Q?kHGlKJXFN7rr5ATYW+pcFoIhMZBojvzBZ2tNOO2T+ybBZpkZ83gHFIjO/mDo?=
 =?us-ascii?Q?DadcB86nCHoawMz/mLRDH5YluTFXAUJIdcDU0EudSIk+CkmkO1SwMFkqjRhS?=
 =?us-ascii?Q?49DN7o2WgLGVOxfZ2f0GP9gkap5BdvCvwVK4M1jCmB8z/ZRgmOxlkSvsvZnq?=
 =?us-ascii?Q?I2cJalPw1TT/pGgZsDzAPX+z6A8P0uKVxBJFAQQdUx9VOrcv/MAzt1PpGrmq?=
 =?us-ascii?Q?AmlQWxGCqtCr2eCCAWhVOa17NLc8Po59yUySsq3SfEGXWR/vWcFuMIBtJH0F?=
 =?us-ascii?Q?si9Fe3/VsByzHsHhDvYBHImnQT7Kxy1O71yIn1OlM37znpFykq9pigy4cV0h?=
 =?us-ascii?Q?Nw6AssB91gIewOJVwsCCNFPR3j2VPJ5EPPEa4j/BFFWIJQlH8fkDTbhtZG4d?=
 =?us-ascii?Q?8aGwP0QXNOk5gjhihCyYeSQO9oMYISHEf0UrLnoFIq3VOoVkrIHyyfF3qhx2?=
 =?us-ascii?Q?k/xlV23RxQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XMqx3HRya1LXiBQYcd0dZ43WfPCz513qjE5PPtx9p/853aJ823CttISqY5I6C6sb1Eh3qPbz5tqi2H2jSJmcV/ASVx6C9KFKAtdrH51A4UvQxRrCmZC5SttLO0/1/9W7G/KvyKqBSF/bFqZnqSrDlFeGnwhDituf9ucJZml8ugQKDZ/7FfkZxPvGiTJCxPx+iSIX9csmxSmRfdqTMtzFnkbPYkzGZxxPGV0qEIEbM39Te4CtUA8TGrnnTyCVTM/5zyiz+okrn6yMXQMPrYOwdKqiw3i9w/nsV3P8+Ge8xy8uuXNG9hN6WL4FJ/5mpUwIvlUleq37CcOGxobOl8vxog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33ba6b4-bb0b-4eeb-4118-08de978b9af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 05:31:38.8248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+xAjgsfVIK7jOZ+t/W/lgVvR17/07X8TXS9NXMQyc1aOA9PCFRstktWBf5FUiE0ZXlx1rnKrZxYPiWY/QNxbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8809
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

On Monday, April 6, 2026 1:31 PM, Shuicheng Lin wrote:
> Fix kernel-doc member tags that do not match the actual struct member
> names, which would cause warnings with scripts/kernel-doc or produce
> incorrect documentation:
>=20
> - xe_bo_types.h: @atomic_access -> @attr.atomic_access
> - xe_device_types.h: @mem.sys_mgr -> @mem.shrinker,
>   @pinned.external -> @pinned.late.external,
>   @vram_usefault.list -> @vram_userfault.list,
>   @usm.asid -> @usm.asid_to_vm,
>   @usm.pagemap_shrinker -> @usm.dpagemap_shrinker,
>   @vm.xe -> @vm.xa
> - xe_exec_queue_types.h: @last_fence -> @tlb_inval.last_fence
> - xe_gt_sriov_pf_types.h: Remove stale @migration doc for non-existent
>   member
> - xe_gt_types.h: @info->engine_mask -> @info.engine_mask,
>   @multi_queue_engine_class_mask -> @info.multi_queue_engine_class_mask
> - xe_guc_ct_types.h: @ctbs.send -> @ctbs.h2g,
>   @ctbs.recv -> @ctbs.g2h
> - xe_guc_submit_types.h: @valid -> @multi_queue.valid
> - xe_hw_engine_types.h: @sched_props.set_job_timeout ->
>   @sched_props.job_timeout_ms
> - xe_oa_types.h: duplicate @format -> @bo
> - xe_vm_types.h: @read_only -> @invalidate_on_bind
>=20
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h          |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h      | 12 ++++++------
>  drivers/gpu/drm/xe/xe_exec_queue_types.h  |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  1 -
>  drivers/gpu/drm/xe/xe_gt_types.h          |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_ct_types.h      |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_submit_types.h  |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h   |  2 +-
>  drivers/gpu/drm/xe/xe_oa_types.h          |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h          |  2 +-
>  10 files changed, 16 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_=
types.h
> index ff8317bfc1ae..0bcd9178be9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -66,7 +66,7 @@ struct xe_bo {
>  	/** @attr: User controlled attributes for bo */
>  	struct {
>  		/**
> -		 * @atomic_access: type of atomic access bo needs
> +		 * @attr.atomic_access: type of atomic access bo needs
>  		 * protected by bo dma-resv lock
>  		 */
>  		u32 atomic_access;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 150c76b2acaf..2b3fdebfc692 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -276,7 +276,7 @@ struct xe_device {
>  		struct xe_vram_region *vram;
>  		/** @mem.sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
> -		/** @mem.sys_mgr: system memory shrinker. */
> +		/** @mem.shrinker: system memory shrinker. */
>  		struct xe_shrinker *shrinker;
>  	} mem;
>=20
> @@ -298,7 +298,7 @@ struct xe_device {
>=20
>  	/** @usm: unified memory state */
>  	struct {
> -		/** @usm.asid: convert a ASID to VM */
> +		/** @usm.asid_to_vm: convert an ASID to VM */
>  		struct xarray asid_to_vm;
>  		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>  		u32 next_asid;
> @@ -315,7 +315,7 @@ struct xe_device {
>  		/** @usm.pf_queue: Page fault queues */
>  		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
> +		/** @usm.dpagemap_shrinker: Shrinker for unused pagemaps */
>  		struct drm_pagemap_shrinker *dpagemap_shrinker;
>  #endif
>  	} usm;
> @@ -337,7 +337,7 @@ struct xe_device {
>  			struct list_head kernel_bo_present;
>  			/** @pinned.late.evicted: pinned BO that have been evicted */
>  			struct list_head evicted;
> -			/** @pinned.external: pinned external and dma-buf. */
> +			/** @pinned.late.external: pinned external and dma-buf. */
>  			struct list_head external;
>  		} late;
>  	} pinned;
> @@ -372,7 +372,7 @@ struct xe_device {
>  		struct {
>  			/**
>  			 * @mem_access.vram_userfault.lock: Protects access to
> -			 * @vram_usefault.list Using mutex instead of spinlock
> +			 * @vram_userfault.list Using mutex instead of spinlock

I've been going back and forth on this, but just to keep documentation vari=
ables consistent
I think better to use @mem_access.vram_userfault.list.=20

>  			 * as lock is applied to entire list operation which
>  			 * may sleep
>  			 */
> @@ -584,7 +584,7 @@ struct xe_file {
>=20
>  	/** @vm: VM state for file */
>  	struct {
> -		/** @vm.xe: xarray to store VMs */
> +		/** @vm.xa: xarray to store VMs */
>  		struct xarray xa;
>  		/**
>  		 * @vm.lock: Protects VM lookup + reference and removal from
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 8ce78e0b1d50..2f5ccf294675 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -214,7 +214,7 @@ struct xe_exec_queue {
>  		 */
>  		struct xe_dep_scheduler *dep_scheduler;
>  		/**
> -		 * @last_fence: last fence for tlb invalidation, protected by
> +		 * @tlb_inval.last_fence: last fence for tlb invalidation, protected b=
y
>  		 * vm->lock in write mode
>  		 */
>  		struct dma_fence *last_fence;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/=
xe/xe_gt_sriov_pf_types.h
> index 667b8310478d..6296483c44ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -49,7 +49,6 @@ struct xe_gt_sriov_pf_workers {
>   * @service: service data.
>   * @control: control data.
>   * @policy: policy data.
> - * @migration: migration data.
>   * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 8b55cf25a75f..7351aadd238e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -136,7 +136,7 @@ struct xe_gt {
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
>  		/**
> -		 * @multi_queue_engine_class_mask: Bitmask of engine classes with
> +		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
>  		 * multi queue support enabled.
>  		 */
>  		u16 multi_queue_engine_class_mask;
> @@ -355,7 +355,7 @@ struct xe_gt {
>  	/** @user_engines: engines present in GT and available to userspace */
>  	struct {
>  		/**
> -		 * @user_engines.mask: like @info->engine_mask, but take in
> +		 * @user_engines.mask: like @info.engine_mask, but take in
>  		 * consideration only engines available to userspace
>  		 */
>  		u64 mask;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe=
_guc_ct_types.h
> index 5da1ce5dc372..c81996f8915a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -134,9 +134,9 @@ struct xe_guc_ct {
>  	spinlock_t fast_lock;
>  	/** @ctbs: buffers for sending and receiving commands */
>  	struct {
> -		/** @ctbs.send: Host to GuC (H2G, send) channel */
> +		/** @ctbs.h2g: Host to GuC (H2G, send) channel */
>  		struct guc_ctb h2g;
> -		/** @ctbs.recv: GuC to Host (G2H, receive) channel */
> +		/** @ctbs.g2h: GuC to Host (G2H, receive) channel */
>  		struct guc_ctb g2h;
>  	} ctbs;
>  	/** @g2h_outstanding: number of outstanding G2H */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/x=
e/xe_guc_submit_types.h
> index 5ccc5f959bb3..7824f61b1290 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -138,7 +138,7 @@ struct xe_guc_submit_exec_queue_snapshot {
>  		u32 primary;
>  		/** @multi_queue.pos: Position of the exec queue within the multi queu=
e group */
>  		u8 pos;
> -		/** @valid: The exec queue is part of a multi queue group */
> +		/** @multi_queue.valid: The exec queue is part of a multi queue group =
*/
>  		bool valid;
>  	} multi_queue;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe=
/xe_hw_engine_types.h
> index e4191a7a2c31..0f87128c6529 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -79,7 +79,7 @@ struct xe_hw_engine_class_intf {
>  	 * @defaults: default scheduling properties
>  	 */
>  	struct {
> -		/** @sched_props.set_job_timeout: Set job timeout in ms for engine */
> +		/** @sched_props.job_timeout_ms: Set job timeout in ms for engine */
>  		u32 job_timeout_ms;
>  		/** @sched_props.job_timeout_min: Min job timeout in ms for engine */
>  		u32 job_timeout_min;
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index b03ffd513483..acd78bc14822 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -159,7 +159,7 @@ struct xe_oa_buffer {
>  	/** @format: data format */
>  	const struct xe_oa_format *format;
>=20
> -	/** @format: xe_bo backing the OA buffer */
> +	/** @bo: xe_bo backing the OA buffer */
>  	struct xe_bo *bo;
>=20
>  	/** @vaddr: mapped vaddr of the OA buffer */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index a94827d7fbec..61ef881c4ac1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -415,7 +415,7 @@ struct xe_vma_op_map {

In the same patch that initially messed up the read_only docstring below, t=
his vma_flags
added has no docstring. Since this is more of a "since you're here" request=
, it's at your
discretion where to put the patch change.

With the 2 changes above,

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

>  	unsigned int vma_flags;
>  	/** @immediate: Immediate bind */
>  	bool immediate;
> -	/** @read_only: Read only */
> +	/** @invalidate_on_bind: Invalidate on bind */
>  	bool invalidate_on_bind;
>  	/** @request_decompress: schedule decompression for GPU map */
>  	bool request_decompress;
> --
> 2.43.0

