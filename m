Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1EECD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 17:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648310EB90;
	Mon,  1 Apr 2024 17:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmMAK3iz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BDE10EA3D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711993200; x=1743529200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hvbw3JTlO3ofb/SwES4dn7WEbDtEdWy9dJFNQ/ANlAA=;
 b=lmMAK3izXvzcSUWvp6UZzbq39jtUUOv3SX5NrI4xSCXEeCF47XitJgJO
 cGItKWuAum3RCRk5F0FayZMoU/ZpdfQPRE5ZFIKmoKJL0m1kHL5WhNJXF
 JpvA1jZ8rnpGT15J0/BLnDqldHrnMTKiLPc210cfBfOihV+hw6SR5KhR1
 G8mdoAQafMaaVU9pvDkizGQLDihqCkBzJ/szr4fl/eFcyVW+Ol4q2vfSE
 8yJuDD+mw5MQz3XbK9dE4Lo4SPuETVCEmOzKzIkjOKZsfX7cz56p+jc3x
 dasIfnK5CQiuikQX0LoWJQge2TrKxETxGEGqwsn/DFDVM6mxaZrJ5b+MI A==;
X-CSE-ConnectionGUID: BS26Jxc6RKGOmwlrcKr0sw==
X-CSE-MsgGUID: 7eeJa3wpT0+NQxZR0lLHJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18580696"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18580696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 10:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17855939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 10:39:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 10:39:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 10:39:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 10:39:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 10:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RB29PU1rmVLbrWo+I4GfuEuJrjCHU2RZzBSzEiz7uL7TVEhqv8fiFYMgxLCNzbZIBduhgZHf/jJCi5pUUCSohUkS5yf9LFGK2sLZ00OxEidnCXuUQhB8THhJd3ao+0MiK5NjaCAk5aNBY8iC+f6AcjiudD6WQUEyV5n7tkI6qA9/Qr9mo9+ub4S9aUxTgnEi8vnGWHw3Lhzc6T9iuo8m2lS4fltVeqBNbXSS1zMQOPfcvDoqwKdAIReAxfgO22W5ucR+uTDi7bTLHeluqks6qGfntqoWF0dzR1Vl/7vpP1I57A+JD9e+HBxZxjeQye5wss+uiw+fqbDIDDgB6xaR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJqKHYvcLdii7iBtiuOYYvZpNYhSp4OZAS+eM9X2Pso=;
 b=CT2+wPdGkzJSLxMzwMojcYJG72qcBpGE+j9go8zHuSzDps3L0KjTweSsK9p7SzuVvm3/zHQ6QppobyN9TxVFgqIbQw06d2wNSqX5O0hLos4bj7WPcHhl9TgXgn2oS2Mu+cKgkchnIVPBPgM0+fy4ZQZh+/TAcruXWtJkt6qkOecFbpr1CtwjpOZz77exLz47quuVRNjsYjzWrmgPNsJALGisY++NirYIe29A3VjDZq6dokXnbG0lNWO76xaJbc9h1LWTsTnCeLIeNyBMHEMDbiOndUT0TjooeX4jsZAYCELZgPyfhjQztMWBmuiNq4vOt6qJj0p7x0H4gXHBnkZflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 17:39:51 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 1 Apr 2024
 17:39:51 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Chehab, Mauro" <mauro.chehab@intel.com>
Subject: RE: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Topic: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Index: AQHag52eNekFIIWaZEqEJrIYt+hn07FTnF7g
Date: Mon, 1 Apr 2024 17:39:51 +0000
Message-ID: <SA1PR11MB6991B4FB8CF189CCFEB5E28C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6805:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JV8XBeU5NVfSQSh1TBQV5tHG2sqtHKiM6SAIvEWv3NTePCYVeO8CXi4/GlFEkd2xr/CankpVoqF1I9CDYpvcKPuDp3mBUZ5vNXlFnOW/Kvjr4fr9lr+0Igo3MjDY7VNMcacFhzx94aFErzdu4DU1qCKenil5+XHSserXjXu6CSYk9zk4tO7kvGZD4V9ueS6fBhrcAR6xPia0zAXyWSmO6zxb/nB32UgJjIrILeFX8A9w8FwdFFltwIW7fqm54WRQjlJZq31bzGcRC2VSBB4PgToy4WfO4OzLjdZeacFjcv+UwvBFot3/pPl7SoXYec0yzIPtFgXLJXsVzPlts6YmFfSJCQvPLlGfhNBC5pQN4QuByvdweKiAGqZWvu8arjDXlQ989do+6vQDL53gUGiGO4FK/fkAMUtFzm6+d9AXNHmzF/5GyOPo50gJglnouDwmWAVIOxWKAjz70aj+PXslijuAfoFzQRhNrjjA1lyaAkiU1KBSr2Lru3INwcAlbUI7+h3q3YHCeRLPwPNppNzTMZKbJwTSAKLBZJ+B8vDd11MAwzi4jpLv3wNmICul7BaxyEsOrv0bD39HEY1QcvX+sIhEXtXXWkg+UnDbiIBRWPcJ/bKu3a7PFmfdmeuC/sTVBRKu87VISdqntcU8WGdDipA7PTJGVgbGxyctdN8fxjA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?12ZH++R+pK8F8m/JjBMZDb+usepX61Uzax44x2y9RItuvKC1nadeqBk00l39?=
 =?us-ascii?Q?gAJ59kPJdXT9nQCrCWJKZXWYnDdfaOBiYYN9mEWY4b4WXJejQ4cl87H1v9qV?=
 =?us-ascii?Q?1rPGT6Rp7qS95dqEhaA+yAvK+TB2ecXvVSC8t89JOZ2dES510QRevgbPrYqI?=
 =?us-ascii?Q?2YRwOT+RKo2bTzJaOxJ64bKzTclXD7CYxt74Wj4/cRDuArtyTvDZeySusDLq?=
 =?us-ascii?Q?U14BiLdD6/OOgCZ+zeAhI1JAqMiVLp2JmWyS/2XQGVCJiLGirI4R11/vmY1X?=
 =?us-ascii?Q?Ur9+j/ED047xYmArGW6R2uKnAUaTu6bMq6zkxP+FjR3BVdwY9OATaqRHpMms?=
 =?us-ascii?Q?aaZin3VK4TeSj+H/H8j2xAr+W8J13K3Kdsm8qN/RhY7LKwKWGCGLQ2KfTwlo?=
 =?us-ascii?Q?6Gyj/dujjpxuuRD+rUIMxBqNfRRKbJOP4+LjA7fCZqxl7ex96SGl4wgstwWm?=
 =?us-ascii?Q?lmWoeo9gqqgPwuCXHtmCQ35akRYUdOhKaCrVT42o+Z+tXDBgsriq79IgPXiL?=
 =?us-ascii?Q?5lom5QBcoaE0s4nBIes2sVYB4nfqe0TzcCz/wEMjB15yH4YxjNntZBJk8s1c?=
 =?us-ascii?Q?RmPSF8KbiFgWhDyH9eZhm42NvhErp2IVbQRjW6481cWC1OKSCYn2Q1v4qWzR?=
 =?us-ascii?Q?eIeTIPAJhByQJwI2WS7X5RNc+Gy4AaB3eHLnN0B2PWNv3UmBmdG4PUD7cf74?=
 =?us-ascii?Q?MaVpXnLJjiJ6nKLb6Of2ZjNpQTMemRfqMM0YwuvoaA0dnTlP2qNwfJSIKTio?=
 =?us-ascii?Q?9HJQPKTygxefixhcXkXiym5GnZ3aQo7j/YWEOW6ztIbX6K2roLoUnh3c6iev?=
 =?us-ascii?Q?oS+EGzEfuFKApoNlL7rTnn79fskrQc9y81X2LPqfHFOyZXNQJ5tjjgTNUbvW?=
 =?us-ascii?Q?jDMfLRZHVbabXBhlvs20G3ZefeGAiszLcPSgiizbHzR/l9KUhjwYCcKJcS8k?=
 =?us-ascii?Q?96jc+oaSSYjsd089ct86QphoPzkTB+Gj8WXVWPTsUEplQa+bq+4caAYTycfi?=
 =?us-ascii?Q?EaOzoL3lEgCr8g1pQnTbzVk6U23HLziSbyAumV+SaxcsDXyyT/GoJftxyFJR?=
 =?us-ascii?Q?ey1CNvDUh8jJdhYQ5/y+tKpQ1P9UqAgpkgjc/2k7dmVZ7oIWliNDq51VgcAH?=
 =?us-ascii?Q?9pI/NFWtOM++o3HVTazmqiaueMi2xWRXtWbHZHJD8l5NT0OCy+QSosaMtaC/?=
 =?us-ascii?Q?i252Pzp4BE8IiHnhf6DM3BCaCSN5SnMzGB7fuLQPfUWI9r+TRtrUnPz/6GOq?=
 =?us-ascii?Q?/n531TOLLlWJoN76efkyAXJfSVP7WpA9GRGUX0KCywLPQKblGclm3kFEmu4Z?=
 =?us-ascii?Q?quuj2dDk59hbleWPcd+fYdK0IMinMVcQ6zn/Ui9L8YmqOiQ8eljqFIo3NjXB?=
 =?us-ascii?Q?xkej984q9Va57ql0i0ofxWyhBcQgyMYom6is+XLp2fBtqz1JnHwmuFc2Yqvu?=
 =?us-ascii?Q?barAn6DSBElfaFi9Gh9+phsUe5fYq3yEtBSshOPjXGsv04HFum3YVHgui/zZ?=
 =?us-ascii?Q?GUq+U9DYtcdHo9YzyYw/MsDULVj0TOhG0hZEDRNp5IqGimu5KZM3XCdXqv4I?=
 =?us-ascii?Q?aV+V8pIe4BCKfO1Em8s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb03d4-4121-47f7-4ffa-08dc5272bc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 17:39:51.7061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KtAOVFv+mXvm9HMMCvJcG0zRBe7nmW5Aaq4AS+KuSpVcdhNjlliwgdHsY44dm1sYmeTgYtp3h7gBwIG9hBmAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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

Hi Krishna,

See comments inline

Cc'ed Matt, Mauro

Hi Matt,

When I looked at this series, I understand your concerns. I commented on th=
e design of the helpers. The idea is:

1) create small helper such as create and map a buffer, destroy a buffer, c=
reate and fill a command buffer, submit a command buffer etc. hopefully tho=
se small helpers can be used by legacy tests

2)  behaviors such as rebind/invalidate etc will have to be part of the leg=
acy test. It can't be in the helper functions. So with helpers the legacy t=
ests can be simplified a little bit but not much. With this, we won't lost =
the flexibility as you concerned.

Thanks,
Oak

> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Sunday, March 31, 2024 3:00 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> Subject: [PATCH] lib/xe/xe_util: Creating the helper functions

[PATCH i-g-t] prefix so patch can be picked up by correct CI

>=20
> Creating the helper functions which can be reused by many tests,
> as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> are used this helper functions.

Please separate the helpers and applying helpers to existing tests as separ=
ate patches

You can also create one patch for one helper function. Smaller patch is alw=
ays helpful for review.

>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> ---
>  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
>  lib/xe/xe_util.h                   |  48 +++++++
>  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
>  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
>  4 files changed, 282 insertions(+), 329 deletions(-)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 050162b5e..17cd45e45 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
>=20
>  	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;
>  }
> +

Please add document for each helpers

For example, for this one the comment would be: create a buffer and map it =
for both CPU and GPU access

> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement, unsigned int flags)

The function name is wrong as we don't have bo for userptr and system alloc=
ator. Xe_create_and_map_buffer

s/bo_size/size

you also need other parameters for gpu binding: uinit64_t gpu_va; define a =
flags for gpu binding such as GPU_BINDING

> +{
> +	struct cpu_va *data;

Shouldn't use a struct. Struct cpu_va is a concept in the existing test. It=
 doesn't make sense to introduce this struct to helpers.

The return of this function is cpu_va which can be a void *=20

So when you remove struct cpu_va concept from helper, the caller also need =
some change to drop struct cpu_va, for example, you will need create and ma=
p command buffer and dst buffer and sync object separately, instead of crea=
te them together and calculate an offset. I think it is okay.

> +
> +	if (flags & USERPTR) {
> +		if (flags & INVALIDATE) {


INVALIDATE is a concept in existing code. It doesn't make sense to have a I=
NVALIDATE flag here. Maybe call it MMAP flag

> +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ | PROT_WRITE,
> +					MAP_SHARED | MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data !=3D MAP_FAILED);
> +		} else {
> +			data =3D aligned_alloc(xe_get_default_alignment(fd),
> bo_size);
> +			igt_assert(data);
> +		}
> +	} else {
> +		*bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> placement,
> +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data =3D xe_bo_map(fd, *bo, bo_size);
> +	}
> +
> +	memset(data, 0, bo_size);
> +
> +	return data;
> +}
> +
> +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> +		if (flags & BIND_EXEC_QUEUE)
> +			bind_exec_queues[i] =3D xe_bind_exec_queue_create(fd,
> vm, 0);
> +		else
> +			bind_exec_queues[i] =3D 0;
> +	};
> +}


I don't think we need this helper. It just put queue creation in a loop. It=
 doesn't help much.=20


> +
> +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t=
 bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags)

Please make vm bind part of xe_create_and_map_buffer, as commented above


> +{
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	if (bo)
> +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> bo_size, sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> +				to_user_pointer(data), addr,
> +				bo_size, sync, 1);
> +
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +	data[0].vm_sync =3D 0;
> +
> +	if (flags & PREFETCH) {


You can also drop the prefetch function. In most cases, we don't need prefe=
tch. So it might be better the caller just do prefetch by himself. But I do=
n't have a strong opinion here. If you keep it, I am also good.


> +		/* Should move to system memory */
> +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> +				bo_size, sync, 1, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +				bind_exec_queues, fence_timeout);
> +		data[0].vm_sync =3D 0;
> +	}
> +}
> +
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i=
)

Parameter of this function is wrong.... you need:

void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val) where bat=
ch is the batch buffer's cpu address, dst_va is the gpu address where you w=
ant to store


> +{
> +	int b =3D 0;
> +	data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data[i].batch[b++] =3D dst;
> +	data[i].batch[b++] =3D dst >> 32;
> +	data[i].batch[b++] =3D val;
> +	data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +}
> +
> +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_exe=
cs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags)

I don't think this is a good abstraction. I think we can create a few small=
er helpers in stead of this big one. This one is not flexible. I think Matt=
 had this concerns and I totally agree...=20

You need small helpers to:
Create a command buffer
Submit command buffer to gpu
Wait for submission to complete

See below

> +{
> +	int i;
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> +
> +	for (i =3D 0; i < n_execs; i++) {

All such loop shouldn't be in a helper.=20

> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int e =3D i % n_exec_queues;
> +
> +		if (flags & INVALID_VA)
> +			sdi_addr =3D 0x1fffffffffff000;
> +
> +		insert_store(sdi_addr, data, 0xc0ffee, i);


Make a helper function to create command buffer/batch buffer, and fill buff=
er with commands

> +
> +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +
> +		exec->exec_queue_id =3D exec_queues[e];
> +		exec->address =3D batch_addr;

Make a helper to initialize a exec

> +		xe_exec(fd, exec);
> +
> +		if (flags & REBIND && i + 1 !=3D n_execs) {


All this rebind behavior doesn't belong to helper. It should be part of cal=
ler/tester behavior

> +			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +					exec_queues[e], fence_timeout);
> +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> +					addr, bo_size, NULL, 0);
> +
> +			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +			addr +=3D bo_size;
> +
> +			if (bo)
> +				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> +						0, addr, bo_size, sync, 1);
> +			else
> +				xe_vm_bind_userptr_async(fd, vm,
> +						bind_exec_queues[e],
> +						to_user_pointer(data),
> +						addr, bo_size, sync, 1);
> +
> +			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> +					bind_exec_queues[e], fence_timeout);
> +			data[0].vm_sync =3D 0;
> +		}
> +
> +		if (flags & INVALIDATE && i + 1 !=3D n_execs) {


All this invalidate behavior doesn't belong to helper. It should be part of=
 caller/tester behavior

Remember our goal is not to make the existing test as simple as possible. D=
ue to the design of the existing test, it is complex. With helpers, if we c=
an simplify it a little, it is good. But don't try to simplify the existing=
 tests as our goal.


> +			if (!(flags & RACE)) {
> +				/*
> +				 * Wait for exec completion and check data as
> +				 * userptr will likely change to different
> +				 * physical memory on next mmap call triggering
> +				 * an invalidate.
> +				 */
> +				xe_wait_ufence(fd, &data[i].exec_sync,
> +						USER_FENCE_VALUE,
> exec_queues[e],
> +						fence_timeout);
> +				igt_assert_eq(data[i].data, 0xc0ffee);
> +			} else if (i * 2 !=3D n_execs) {
> +				/*
> +				 * We issue 1 mmap which races against running
> +				 * jobs. No real check here aside from this test
> +				 * not faulting on the GPU.
> +				 */
> +				continue;
> +			}
> +
> +			if (flags & RACE) {
> +				*map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> +						0x666);
> +				write(*map_fd, data, bo_size);
> +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> +						MAP_FIXED, *map_fd, 0);
> +			} else {
> +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> +						MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> +			}
> +
> +			igt_assert(data !=3D MAP_FAILED);
> +		}
> +	}
> +}
> +
> +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> +		uint32_t bo_size)
> +{
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> +			sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +}


Please make a xe_destroy_buffer to destroy a buffer created through xe_crea=
te_buffer. The vm_unbind should be part of xe_destroy_buffer. No need of a =
separate helper

> +
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues)


Please drop this one along with create_exec_queue


I will stop here. Let's improve the helpers in v2.

Oak

> +{
> +	int i;
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +		if (bind_exec_queues[i])
> +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> +	}
> +}
> +
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 6480ea01a..aa1b0dcc1 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_=
t
> bind_engine,
>=20
>  bool xe_is_gt_in_c6(int fd, int gt);
>=20
> +
> +#define USERPTR			(0x1 << 0)
> +#define REBIND			(0x1 << 1)
> +#define INVALIDATE		(0x1 << 2)
> +#define RACE			(0x1 << 3)
> +#define BIND_EXEC_QUEUE		(0x1 << 4)
> +#define PREFETCH		(0x1 << 5)
> +#define INVALID_FAULT		(0x1 << 6)
> +#define INVALID_VA		(0x1 << 7)
> +#define ENABLE_SCRATCH		(0x1 << 8)
> +#define VM_FOR_BO		(0x1 << 9)
> +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> +
> +#define MAX_N_EXEC_QUEUES	16
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define MAP_ADDRESS		0x00007fadeadbe000
> +
> +#define ONE_SEC		MS_TO_NS(1000)
> +#define HUNDRED_SEC	MS_TO_NS(100000)
> +
> +struct cpu_va {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +};
> +
> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t=
 bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags);
> +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_exe=
cs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags);
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i=
);
> +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data,
> +		uint64_t addr, uint32_t bo_size);
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues);
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 3ec848164..e8d82cc69 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -15,6 +15,7 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include <sys/ioctl.h>
>  #include "xe_drm.h"
>=20
> @@ -23,15 +24,6 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>=20
> -#define MAX_N_EXECQUEUES 	16
> -#define USERPTR				(0x1 << 0)
> -#define REBIND				(0x1 << 1)
> -#define INVALIDATE			(0x1 << 2)
> -#define RACE				(0x1 << 3)
> -#define BIND_EXECQUEUE		(0x1 << 4)
> -#define VM_FOR_BO			(0x1 << 5)
> -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> -
>  /**
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] compute machine test twice
> @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *=
eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr =3D 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
>  		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		.num_syncs =3D 1,
>  		.syncs =3D to_user_pointer(sync),
>  	};
> -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo =3D 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	int i, j;
>  	int map_fd =3D -1;
>  	int64_t fence_timeout;
> +	uint64_t placement;
>=20
> -	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
> +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>=20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	for (i =3D 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> +	if (flags & EXEC_QUEUE_EARLY)
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> n_exec_queues, eci, flags);
>=20
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data !=3D MAP_FAILED);
> -		} else {
> -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> -				  bo_size, vram_if_possible(fd, eci->gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data =3D xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> +	placement =3D vram_if_possible(fd, eci->gt_id);
>=20
> -	for (i =3D 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -#define HUNDRED_SEC	MS_TO_NS(100000)
> +	if(!(flags & EXEC_QUEUE_EARLY))
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> n_exec_queues, eci, flags);
> +
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> flags);
>=20
>  	fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
>=20
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> -	data[0].vm_sync =3D 0;
> -
> -	for (i =3D 0; i < n_execs; i++) {
> -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr =3D addr + batch_offset;
> -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues;
> -
> -		b =3D 0;
> -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] =3D sdi_addr;
> -		data[i].batch[b++] =3D sdi_addr >> 32;
> -		data[i].batch[b++] =3D 0xc0ffee;
> -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> -
> -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> -
> -		exec.exec_queue_id =3D exec_queues[e];
> -		exec.address =3D batch_addr;
> -		xe_exec(fd, &exec);
> -
> -		if (flags & REBIND && i + 1 !=3D n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], fence_timeout);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -			addr +=3D bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -							 to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> -				       bind_exec_queues[e], fence_timeout);
> -			data[0].vm_sync =3D 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE,
> exec_queues[e],
> -					       fence_timeout);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 !=3D n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> 0);
> -			}
> -			igt_assert(data !=3D MAP_FAILED);
> -		}
> -	}
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> flags);
>=20
>  	j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>  	for (i =3D j; i < n_execs; i++)
> @@ -264,20 +132,12 @@ test_exec(int fd, struct drm_xe_engine_class_instan=
ce
> *eci,
>  	if (flags & INVALIDATE)
>  		usleep(250000);
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>=20
>  	for (i =3D j; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>=20
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
>=20
>  	if (bo) {
>  		munmap(data, bo_size);
> @@ -492,14 +352,14 @@ igt_main
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
>  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> -		{ "bindexecqueue", BIND_EXECQUEUE },
> -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> USERPTR |
>  			REBIND },
> -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> USERPTR |
>  			INVALIDATE },
> -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> USERPTR |
>  			INVALIDATE | RACE },
>  		{ NULL },
>  	};
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 40fe1743e..7b2fef224 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -16,24 +16,13 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include "xe_drm.h"
>=20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include <string.h>
>=20
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define USERPTR		(0x1 << 0)
> -#define REBIND		(0x1 << 1)
> -#define INVALIDATE	(0x1 << 2)
> -#define RACE		(0x1 << 3)
> -#define BIND_EXEC_QUEUE	(0x1 << 4)
> -#define PREFETCH	(0x1 << 5)
> -#define INVALID_FAULT	(0x1 << 6)
> -#define INVALID_VA	(0x1 << 7)
> -#define ENABLE_SCRATCH  (0x1 << 8)
> -
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *=
eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr =3D 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
>  	          .timeline_value =3D USER_FENCE_VALUE },
> @@ -113,14 +101,9 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo =3D 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	uint64_t placement;
> +	int i, j;
>  	int map_fd =3D -1;
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> @@ -134,144 +117,19 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data !=3D MAP_FAILED);
> -		} else {
> -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		if (flags & PREFETCH)
> -			bo =3D xe_bo_create(fd, 0, bo_size,
> -					  all_memory_regions(fd) |
> -					  vram_if_possible(fd, 0),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		else
> -			bo =3D xe_bo_create(fd, 0, bo_size,
> -					  vram_if_possible(fd, eci->gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data =3D xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> -
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXEC_QUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> -
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> -	data[0].vm_sync =3D 0;
> -
> -	if (flags & PREFETCH) {
> -		/* Should move to system memory */
> -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> -				     bo_size, sync, 1, 0);
> -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -			       bind_exec_queues[0], ONE_SEC);
> -		data[0].vm_sync =3D 0;
> -	}
> -
> -	for (i =3D 0; i < n_execs; i++) {
> -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr =3D addr + batch_offset;
> -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues;
> +	placement =3D (flags & PREFETCH) ? all_memory_regions(fd) |
> +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
>=20
> -		b =3D 0;
> -		if (flags & INVALID_VA)
> -			sdi_addr =3D 0x1fffffffffff000;
> +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>=20
> -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] =3D sdi_addr;
> -		data[i].batch[b++] =3D sdi_addr >> 32;
> -		data[i].batch[b++] =3D 0xc0ffee;
> -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> +			n_exec_queues, eci, flags);
>=20
> -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> flags);
>=20
> -		exec.exec_queue_id =3D exec_queues[e];
> -		exec.address =3D batch_addr;
> -		xe_exec(fd, &exec);
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> flags);
>=20
> -		if (flags & REBIND && i + 1 !=3D n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], ONE_SEC);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -			addr +=3D bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -							 to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> -				       bind_exec_queues[e], ONE_SEC);
> -			data[0].vm_sync =3D 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE,
> exec_queues[e],
> -					       ONE_SEC);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 !=3D n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> 0);
> -			}
> -			igt_assert(data !=3D MAP_FAILED);
> -		}
> -	}
>  	if (!(flags & INVALID_FAULT)) {
>  		int64_t timeout =3D ONE_SEC;
>=20
> @@ -286,22 +144,15 @@ test_exec(int fd, struct drm_xe_engine_class_instan=
ce
> *eci,
>  							       exec_queues[i %
> n_exec_queues], &timeout), 0);
>  		}
>  	}
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> +
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>=20
>  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>  		for (i =3D j; i < n_execs; i++)
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>=20
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
>=20
>  	if (bo) {
>  		munmap(data, bo_size);
> --
> 2.25.1

