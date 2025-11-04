Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAB6CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 11:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9410E276;
	Tue,  4 Nov 2025 11:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpShFQQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385210E276
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762256132; x=1793792132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80Vci9DJPkyEinIpl8TpHxXWysKsbEsdH/5FhrEvk4Y=;
 b=hpShFQQVcUNwMKCfrANgo7ldLPeXl1Ru7fjpXeHGV7rEn4mG+eB5tSIF
 C9bUbhA+vqljeRSnZJuDjuS0DXX+A6Em9nuG/OCAwbtxCAdCEOrA8a7bT
 O/qzWM7wmaCfBbFKqiTTO/Db5ith+23RQ1/+ljR3Lo5kPq+FL3qk9QmUs
 IqqqFz41vcz+QgqWhtyRPelXUjbljNuCcJVcrPJAbPbsmf9trH2kyNyZr
 eIc/kChEzkavOMr2vhJ43njzfsUzCscoScm5hJADycVULiUtvvCM1soCc
 ItB8OlMqQ76wycO/fEqI7cMBAMXKUXWGg6znjChhV24wkUb/NR4GbjwJs A==;
X-CSE-ConnectionGUID: rhfPx1MGTiaLyVjXsy8seg==
X-CSE-MsgGUID: A28P6TkpS8C4U0j6sJIPuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68001212"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68001212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:35:32 -0800
X-CSE-ConnectionGUID: zchdIqArRpifqUKxtKGFOQ==
X-CSE-MsgGUID: 5aFb+QpFSC2BETNHvdgh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187085297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:35:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:35:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 03:35:31 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:35:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3DzoCrtKcPYy0SYYJ+BI7Y410Q0TSFaT2jJfx05ppkrqx+B+RGEMwihRdP9j3isXNWZ3sBT4x6GZIz9EPxaxKvpnxojJzi1WkhVYfk0HvxIJv/2V9YTXQQkqXvUuhERtO8ZjmxviguQ+Q0LmSxknSpnSUy9MQLGfgTBl7AhwDSCP2VOc/JIbeZB7vx77GrM2zJjx+xFrJ+RKbXUK0RUJoJpk6NdQasjfNQXRAVDrRQT8ihETfnG7HkmPGzHKTjLBjNyYChptPFdxiCz04gBP/FdukrPrjyP5a+9BowaeTun9i9NkwUOroDx0MSivR8FYZqOfIJR5+9LJgnARSpGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeSNv9yENHDCLqDjHnSkGgCRBKp1Yh731FD0yPXdtkk=;
 b=Qx7wGKxoDRbgj6+HaJg/+O2Oe3gqOh8tI5dqc3bjUOu4lcOA/19YOlb79IRNb3+bIJyG/iGn2kuInzUNgfIRED9fM+gjFY3+h0XtekwQMP62LRQXfi47CFkrWv2ckXJxLQD/Xq5IWIDuQTD9I9KMPg1EqHZ59NkWjvP4GUMZD02ANJD5mh/yl1ree2GEPB8ip87CIHZxxkLUdrja+uCYIxENwDcjE18OL2hLDvpcdumiu/fkAdF0l0BETBio7Yk8ZZwW2uL6u04eLUpZ8vGIxul0j7XmUimDFMnN458D94Glcs1WcfITL5jIGAoveS8ktJuPCVKqwO3tQky4R9ek4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 11:35:23 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 11:35:23 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Thread-Topic: [PATCH v4 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Thread-Index: AQHcTXUEQ0vfz4jM7EiNaIYoE7A7W7TiYxOw
Date: Tue, 4 Nov 2025 11:35:22 +0000
Message-ID: <DS7PR11MB6271E1089DF45A9C203E852CE7C4A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
 <20251104105305.2100460-4-nitin.r.gote@intel.com>
In-Reply-To: <20251104105305.2100460-4-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|PH7PR11MB6698:EE_
x-ms-office365-filtering-correlation-id: 4ce570e1-c96a-4e79-01e5-08de1b963dd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?vW8y++YHpW1pP2lQeJyTx3hsdmK/0V+hpXPTnjjar6KMHFsqfWnsyjPjPRa2?=
 =?us-ascii?Q?Ylko88D4pqOn9BVpRfZjj+xrpbeZBY9mZ/mrAqm66RmaFgwLW6zOQgjTZ7P8?=
 =?us-ascii?Q?hvSFeIqIJfSowgV7m4BuDpnI64y0BK7d+eU6OwzOJbmAXkOUupd3995ByBEQ?=
 =?us-ascii?Q?DVaLPfK8SwehXN6ix/kz6IVpXW9PlLvGyep0V3E4jl92XPF2V9P4A91kHQ71?=
 =?us-ascii?Q?CYaIdr7Li3EOxfkOWqx2T7WYaX3QhGwQ/FDvNUUt9y7ycaCeqm03RZIkNuRp?=
 =?us-ascii?Q?1u/fl4wYjJmAgLw30JlVPZAgtK0/8onNXEmAow1BXJCFT4O2n2+JDDhZNxKA?=
 =?us-ascii?Q?V2GL7IxNWmcgQm0uaasK3C85181Kgp2YyrRXBRByUsd6K1h57WcT3qX8MdrE?=
 =?us-ascii?Q?EZKDqtp5df8ae5HdHakxNDyTcC0LQMvCl2/gHZVgFdoeJ4YWlqaCWplo4oxW?=
 =?us-ascii?Q?6HtXNWO3zK53F6IMh0QGSy5gDWBelACgOG0dkszDTUDnK0CCzOuwgVhMo2eu?=
 =?us-ascii?Q?vPYTlRXRruB5EJIGbjyu7rLMJ0Lz4pfm0U+rVJ9xG0PUinPdOtn+XjNeuQV4?=
 =?us-ascii?Q?cfDEJNfN8yBJYp5tOWCs+TxONTNkOlMKZq1LSFKG/1f1FV/rnznvg7K3y9p4?=
 =?us-ascii?Q?eNxkP8mUibPyYorwPdJSxXjkR21U/HGqarwsoio3fKjmWimuFxxpVk024rW+?=
 =?us-ascii?Q?fnjOp8LQ8Akg5ofs2uBfJ+MNOzd0cQmlyQN3DN225Pt0N9H04/jBDy1ohoav?=
 =?us-ascii?Q?BGhR9C7Nu58WMgEc7DOMmpxiGagQUiSG5yvDPOBruZDIgr7b8iwXLEcfNgtg?=
 =?us-ascii?Q?UsrupxZWrRVItE8K6h72MIvg4EP7WMTO+kPtjCUAR9SA/7ECZRxtRAbCCa87?=
 =?us-ascii?Q?vSPkOtOs+GUmMLXZcuc5D0B7QK6PUbq2Ehd87KnoxWdoHXpmBqiHMMQAJITi?=
 =?us-ascii?Q?nf6/Odf/OVNs7BlW3X/0c23DBKixaLP2ACembWkGcrs38khjxdxzLRkDRYJF?=
 =?us-ascii?Q?TXO03C7yknHsI+d9DFQ2FHHJ6Dsts43i1cSf/mw8AHY01q8ckabMYcLW6Of8?=
 =?us-ascii?Q?2Y5ddpHILaidnuuGu+D6EGYR3+IAAJnQflhOJOFZnkyjPp2Z5gcODN7WaHAE?=
 =?us-ascii?Q?JmmL5kXQBVpssnyt1YVV8onOJsylAq7vlQMaMGHlOZY+Bx5zy7fLhJfWpEMN?=
 =?us-ascii?Q?+pH+woqJ3zI8oGyAg8M1Az7BMZjzcRkl2GQakrg+exN+cp9VzAVKM7Pr5IBM?=
 =?us-ascii?Q?TutZCD3yb9UaqggicPArSkwnZrpKG82tKbV3CDDC9CwYhxW7oIguLR5Fx6it?=
 =?us-ascii?Q?3w2RjDfqwYFS0ft8Afouf2KvrCYAY9+yJ9mJsrjJb1QheIGhm7q+LV0YULX+?=
 =?us-ascii?Q?5S/NbpOEW1sSX08akQY5mCUASTZkf8KX9b+L7ZqBSqtY4LGwol6/oLZd3oDG?=
 =?us-ascii?Q?Edmmkux2PPDIT39yf8GKF7VWHf+5Sc9pOhVkT+VVyg7vHBKWhYlfHc58wu4q?=
 =?us-ascii?Q?OOTtVBb5qP67Imwf8+qyNjz82gFU9MlN5/9X?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/pIEXtbl8DZqnAjdK+CxKO0duXiIakR2FXpSJLjjUmAU4VipK9gPgrXUaqOJ?=
 =?us-ascii?Q?wLOgN5bW+21fPkCzK+erQ8VOYULISdCbAbZo/UQDd3360Nf7rx60I4zxrrFt?=
 =?us-ascii?Q?jTj+uHAQcvUh0oZJQKbHPZXDjSqRApYh/CDAasHd/0KEpZfMM3QoeOwQjHz5?=
 =?us-ascii?Q?d/FfkDXdL2JiF7K9bhCwqcw3Do8Nrjy9bSDp+MwHrNb0eiITC7/Rn/TszZcY?=
 =?us-ascii?Q?ADcqGLJqAGtLTrJRJOmInyXFl+TkwGOrDO0Dv3T+olffGzx+7zV4ru5Bd13k?=
 =?us-ascii?Q?sn2u5s1brr5hGksZLuftqKm2WMecUDCHCsvhw5JmHP0WqHarJ7GfBoegBxHC?=
 =?us-ascii?Q?t9gHKcs0xan6cjYo3eT+dlInsn72PQ4xzRlk4qnK7bEmH2BK+i+9gJeXyYl6?=
 =?us-ascii?Q?RBTePomU/yxMZPLZkDC0BEqedTHHNDxUadNpXoetEL7os5a1cFm56pEJPfy8?=
 =?us-ascii?Q?2djgQC+NYNRgbbzODvkB7OcxGWCzhpcMq9TzrPZq+CpPmd1hvt8VckGrnOz3?=
 =?us-ascii?Q?7ehOsIuoqTqqQFy417c/yt4R6hozCADpHNt3M7rM3MvlytZv3uQvf4+JZkxY?=
 =?us-ascii?Q?cxhtGxH656BUjgi8E1WbcJxIE+b3wGMPRAJg38R1ojObU1VQQqWIcpLOyZ6r?=
 =?us-ascii?Q?AjYvo03YmfVXLMY3wm9pXyP780nmyXhmajVBC49Iy9VOkRoONFVOXERsPD9j?=
 =?us-ascii?Q?U9ZuD4dTUsKwxma1snApWCXDTqQhaXv9Mb5enmTz0/BOlVFqD1tSuTV9WhvU?=
 =?us-ascii?Q?Fk6xZY5hZWCxb9K2kUUi16NAU4YKbHOO3bycDFBahIbqFfnkdJuN4SPanrlJ?=
 =?us-ascii?Q?itxjrje3UrZHZGBpe/O+nkVKmZ0RA9KEAOpvh53ZZxmUVlb8HEyYItNms+IX?=
 =?us-ascii?Q?gt2yXujp8AuEL2yliuQjV++e6wyUCDyyXyJmVXx0U3dmwz5zvHYTu6GDQNxQ?=
 =?us-ascii?Q?7Oo33u2L42zpebfkHVt/wS71WZ1ZVt+bdbfdgqibGNf4esqkRnLjLOtD5j9R?=
 =?us-ascii?Q?I5L6hmv8icHy2sjbqypVMiLmzTatMcaQIUrhzZBg6P85v8drsZSRmubguxgh?=
 =?us-ascii?Q?AscISWnPK+2KcXnPPa1Tc2EbnIkfddFj+2WeqebpusgE2oSMowX2UrDD1gCD?=
 =?us-ascii?Q?2P5AcIKoV7mPtJJ09CaaBZ3b2QjW4xtD5lJWtRpOJ0TZzABPacZarKlaJulw?=
 =?us-ascii?Q?MKbUPvHkKR94yY7b4dnKaoqRyPLWrxawvvesS8jXD47uUutpJPOgWwYClPo0?=
 =?us-ascii?Q?tlciOXvIDeWTm1X+aR+RmhwuYymDcj5jjIwnTrzMn9ngCsRVbiolU8FPrh3E?=
 =?us-ascii?Q?QQbnOMWF64dRIfsyXbgZTIBIH9xDyxV2YAG3bTc0nKdgfHOsKnwHa1XgsU/a?=
 =?us-ascii?Q?COLtnP+3YfvDZIEUX0n3dAuKo8huNPfiAqZ4iZDmplDZiBH2QBHZwm8sq6+6?=
 =?us-ascii?Q?YM0C07LddABToBQjw0rycgh8eca/GCtZfdzM33DwvMt9Igq81Dao5fMZ3W0j?=
 =?us-ascii?Q?T7sCGkDA+y0mV487yZmLwv2TIWBDFCTYxchcX9OXqQrD4d1XLJ0Q8/O18Gjn?=
 =?us-ascii?Q?y7kV47MEDJ34JCALdQ7a5PiAJG8W8a68xNdW3A2V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce570e1-c96a-4e79-01e5-08de1b963dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 11:35:22.9487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzjsCywpPG3yiA+KqF0xpSxaYPAWI1nppbc8occ0qc6yBzS1BkZzc8y8FJrWIGAezKRLiA0sKKiLxFWGq1Qflg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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

> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
>=20
> Key changes:
> - Parse and record per-op intent (op->map.request_decompress) when the
>   DECOMPRESS flag is present.
> - Introduce xe_pat_index_get_comp_en() helper to check if a PAT index
>   has compression enabled via the XE2_COMP_EN bit.
> - Validate DECOMPRESS preconditions in the ioctl path:
>   - Only valid for MAP ops.
>   - The provided pat_index must select the device's "no-compression" PAT.
>   - Only meaningful on devices with flat CCS and the required XE2+
>     otherwise return -EOPNOTSUPP.
>   - Use XE_IOCTL_DBG for uAPI sanity checks.
> - Implement xe_bo_decompress():
>   For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
>   schedule xe_migrate_resolve(), and attach the returned fence
>   with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
> - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
>   decompression when request_decompress is set.
> - Handle fault-mode VMs by performing decompression synchronously during
>   the bind process, ensuring that the resolve is completed before the bin=
d
>   finishes.
>=20
> This schedules an in-place GPU resolve (xe_migrate_resolve) for decompres=
sion.
>=20
> v4: (Matt)
>    - Introduce xe_pat_index_get_comp_en(), which checks
>      XE2_COMP_EN for the pat_index
>    - .interruptible should be true, everything else false
>=20
> v3: (Matt)
>    - s/xe_bo_schedule_decompress/xe_bo_decompress
>    - skip the decrompress step if the BO isn't in VRAM
>    - start/size not required in xe_bo_schedule_decompress
>    - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
>      with respect to invalidation.
>    - Nits
>=20
> v2:
>    - Move decompression work out of vm_bind ioctl. (Matt)
>    - Put that work in a small helper at the BO/migrate layer invoke it
>      from vma_lock_and_validate which already runs under drm_exec.
>    - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 52 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  2 ++
>  drivers/gpu/drm/xe/xe_pat.c      |  6 ++++
>  drivers/gpu/drm/xe/xe_pat.h      | 10 ++++++
>  drivers/gpu/drm/xe/xe_vm.c       | 40 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  6 files changed, 101 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x b0bd31d14bb9..95331285c418 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3330,6 +3330,58 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *de=
v, void *data,
>  	return 0;
>  }
> =20
> +/**
> + * xe_bo_decompress - schedule in-place decompress and install fence
> + * @bo:   buffer object (caller should hold drm_exec reservations for VM=
+BO)
> + * @vm:   VM containing the VMA range
> + *
> + * Schedules an in-place resolve via the migrate layer and installs the
> + * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAG=
E_KERNEL).
> + * In preempt fence mode, this operation interrupts hardware execution
> + * which is expensive. Page fault mode is recommended for better perform=
ance.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm) {
> +	struct xe_tile *tile =3D xe_device_get_root_tile(vm->xe);
> +	struct dma_fence *decomp_fence =3D NULL;
> +	int err =3D 0;
> +	struct ttm_operation_ctx op_ctx =3D {
> +		.interruptible =3D true,
> +		.no_wait_gpu =3D false,
> +		.gfp_retry_mayfail =3D false,
> +	};
> +
> +	/* Silently skip decompression for non-VRAM buffers */
> +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type))
> +		return 0;
> +
> +	/* Notify before scheduling resolve */
> +	err =3D xe_bo_move_notify(bo, &op_ctx);
> +	if (err)
> +		return err;
> +
> +	/* Reserve fence slot before scheduling */
> +	err =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +	if (err)
> +		return err;
> +
> +	/* Schedule the in-place decompression */
> +	decomp_fence =3D xe_migrate_resolve(tile->migrate,
> +					  bo,
> +					  bo->ttm.resource);
> +
> +	if (IS_ERR(decomp_fence))
> +		return PTR_ERR(decomp_fence);
> +
> +	/* Install kernel-usage fence */
> +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERN=
EL);
> +	dma_fence_put(decomp_fence);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_bo_lock() - Lock the buffer object's dma_resv object
>   * @bo: The struct xe_bo whose lock is to be taken diff --git a/drivers/=
gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h index 911d5b90461a..346b50a=
1247c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -309,6 +309,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> =20
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
> =20
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
> +
>  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)  {
>  	return PAGE_ALIGN(xe_bo_size(bo));
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex 68171cceea18..1b4d5d3def0f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, =
u16 pat_index)
>  	return xe->pat.table[pat_index].coh_mode;
>  }
> =20
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index) {
> +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN); }
> +
>  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entr=
y table[],
>  			int n_entries)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h in=
dex 05dae03a5f54..b8559120989e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *=
p);
>   */
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
> =20
> +/**
> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> + * the given pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if compression is enabled for this pat_index, false othe=
rwise.
> + */
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x 00f3520dec38..36a922d0cc3d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2300,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct x=
e_vma_ops *vops,
>  				op->map.vma_flags |=3D XE_VMA_DUMPABLE;
>  			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>  				op->map.vma_flags |=3D XE_VMA_MADV_AUTORESET;
> +			op->map.request_decompress =3D flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS=
;
>  			op->map.pat_index =3D pat_index;
>  			op->map.invalidate_on_bind =3D
>  				__xe_vm_needs_clear_scratch_pages(vm, flags); @@ -2836,7 +2837,7 @@ =
static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,  }
> =20
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *v=
ma,
> -				 bool res_evict, bool validate)
> +				 bool res_evict, bool validate, bool request_decompress)
>  {
>  	struct xe_bo *bo =3D xe_vma_bo(vma);
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
> @@ -2849,6 +2850,12 @@ static int vma_lock_and_validate(struct drm_exec *=
exec, struct xe_vma *vma,
>  			err =3D xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
>  					     res_evict, exec);
> +
> +		if (err)
> +			return err;
> +
> +		if (request_decompress)
> +			err =3D xe_bo_decompress(bo, vm);
>  	}
> =20
>  	return err;
> @@ -2936,7 +2943,8 @@ static int op_lock_and_prep(struct drm_exec *exec, =
struct xe_vm *vm,
>  			err =3D vma_lock_and_validate(exec, op->map.vma,
>  						    res_evict,
>  						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    op->map.immediate,
> +						    op->map.request_decompress);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err =3D check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -2945,13 +2953,13 @@ static int op_lock_and_prep(struct drm_exec *exec=
, struct xe_vm *vm,
> =20
>  		err =3D vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && op->remap.prev)
>  			err =3D vma_lock_and_validate(exec, op->remap.prev,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		if (!err && op->remap.next)
>  			err =3D vma_lock_and_validate(exec, op->remap.next,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -2960,7 +2968,7 @@ static int op_lock_and_prep(struct drm_exec *exec, =
struct xe_vm *vm,
> =20
>  		err =3D vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -2975,7 +2983,7 @@ static int op_lock_and_prep(struct drm_exec *exec, =
struct xe_vm *vm,
> =20
>  		err =3D vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err =3D xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> @@ -3284,7 +3292,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ER=
RNO);
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
>  	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> -	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> +	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
> +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
> =20
>  #ifdef TEST_VM_OPS_ERROR
>  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3342,6 +3351,7 @@ static int vm_bind_ioctl_check_args(struct xe_devic=
e *xe, struct xe_vm *vm,
>  		bool is_null =3D flags & DRM_XE_VM_BIND_FLAG_NULL;
>  		bool is_cpu_addr_mirror =3D flags &
>  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> +		bool is_decompress =3D flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  		u16 pat_index =3D (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
> =20
> @@ -3376,7 +3386,9 @@ static int vm_bind_ioctl_check_args(struct xe_devic=
e *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
>  						    is_cpu_addr_mirror)) ||
>  		    XE_IOCTL_DBG(xe, op !=3D DRM_XE_VM_BIND_OP_MAP &&
> -				 (is_null || is_cpu_addr_mirror)) ||
> +				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
> +		    XE_IOCTL_DBG(xe, is_decompress &&
> +				 !xe_pat_index_get_comp_en(xe, pat_index)) ||
>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op =3D=3D DRM_XE_VM_BIND_OP_MAP &&
>  				 !is_null && !is_cpu_addr_mirror) || @@ -3396,8 +3408,8 @@ static in=
t vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op =3D=3D DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op !=3D DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region !=3D DRM_XE_CONSULT_MEM_ADVISE_=
PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region !=3D DRM_XE_CONSULT_MEM_ADVISE_P=
REF_LOC &&
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op =3D=3D DRM_XE_VM_BIND_OP_UNMAP) ||
>  		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &=
& @@ -3414,6 +3426,12 @@ static int vm_bind_ioctl_check_args(struct xe_devi=
ce *xe, struct xe_vm *vm,
>  			err =3D -EINVAL;
>  			goto free_bind_ops;
>  		}
> +
> +		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
> +				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {
> +			err =3D -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
>  	}
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 830ed7b05c27..87f0c04468f5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -351,6 +351,8 @@ struct xe_vma_op_map {
>  	bool immediate;
>  	/** @read_only: Read only */
>  	bool invalidate_on_bind;
> +	/** @request_decompress: schedule decompression for GPU map */
> +	bool request_decompress;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> --
> 2.25.1

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
