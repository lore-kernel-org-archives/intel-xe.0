Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEABCD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5310EB78;
	Fri, 12 Jun 2026 21:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv6m0Y/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051D810EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781299823; x=1812835823;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u0gW10q5K3H1G88sX8Lhqa5Ze2/4HqUoBlFkXB/jqO4=;
 b=Lv6m0Y/vIbGHIVAzuPkXhRG7/L719JhfFrJxwM87x7b397yDqgLQtwe+
 spXycll38mocl6brMcooSfT5gw1od/Hd8zW+MDgPkE1LhU1llqntv2biS
 BYZMwn2VAGeMaiUBUszOUwzaf45En5Rx0ikL4Lw9IBvlHrhh1cMOIU3YV
 Gyzn5OuXDenVukoFefF2qhVx8ivnb+40Jvpr4jIX7ATLPg16EgGpGZcPf
 o+HhvCK/cPZICAEdoBpYZGPNiPJqeYoSpF1Rw8+kVL+S7j/0IWQIb1+d1
 qlF55jB7CfewAXpa4Nc+F7euW/W000Nx7thUvqPLJuFzz/D/NV4aCL2XG Q==;
X-CSE-ConnectionGUID: Tm0LixFvR+asSUxRJBNJyw==
X-CSE-MsgGUID: O2VZQIEvQqa6ruhPYen/cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99716375"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="99716375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:30:23 -0700
X-CSE-ConnectionGUID: uya1T8cQRb+hN7Seb8zqqA==
X-CSE-MsgGUID: rEL9S0wUTyq4AfZwZwSV7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="243995440"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:30:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:30:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:30:22 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF99bi7Nl+dr9vlGkmxP8l7efSMmu0jDJn0dQy0AnznDSehnPOm/d1lmjbEfj8gIV9hIitbPx2FedguJoLxXZALk9LwC1QUUpsDX9jKZJYF41W6CsiQC9JxOp7m6gVnSifRECXkPzmX+ayOk2S6UoeD0BdNGcI1MCc2P/C8akvQFTJkE+m3sFSJ7GLQBJijDOgwBm98cp8ZPmRiOLLwgsvqdXxnew9uKcXzUiipRNieMjXlXx0FLNZ5FBvx2MfRuQx2JyLJKaRQMDOvltLN3q4nkXuqx+CoBK2QgUDX8ze7LPkI545+2/stgXm9X2Clw9FKwySmTMrC7X7/YAkV5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G/HA9zsGU3kFxT5jl5d05KvTf9hVKJePIr2pE2hRT8=;
 b=ThI+N1JqhvXMmlM3tRQnJy6v0CkUL+jDwPpwZEmSM3gNq87HCKAdeIeQgpfzYkhBb6JL3qIg6pIlGTzZzLOclOS4nkdMu5F8KVCA4SS1w4hLxjGxpUSsRGqGt1YRKXhkwKxud63ArxATB7XOJtd07Lwj4WZD7r6gTLoJET44X37OGrcdfrR+v0Qa037da1m1AlqxZ4i89u8Q4QhXZlBd2n2Bczwdik3ZnGv1Ur+ox1toa6o+U10+ambPjpvttvwe84sOQ+x3wvXyR1GiYUf7tgERVVgvgKyIiVypVlIrls2yvVey7kj73k/lWC+6AB6gOyUgiGqb/OGdFe3ILWg3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:30:19 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:30:19 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Topic: [PATCH v2 2/2] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHc+jDx4LNh9MotF066RMmK1AZx/LY7b/4Q
Date: Fri, 12 Jun 2026 21:30:19 +0000
Message-ID: <SA3PR11MB8046A95D156D3F2AA3018E6F86182@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20260612060120.3795183-1-matthew.brost@intel.com>
 <20260612060120.3795183-2-matthew.brost@intel.com>
In-Reply-To: <20260612060120.3795183-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|CY8PR11MB7136:EE_
x-ms-office365-filtering-correlation-id: dca33990-12cc-4f8d-8c0a-08dec8c9cd79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|10070799003|1800799024|42112799006|11063799006|6133799003|4143699003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: CCG8/ssnuo9asc+tFRdGhdIKx8LKjOpVlvhrpbytO1vjLuXAlR5cyUqOy+LyhU7LuntRge/zlsSyDVi1G28l87QowPLy0A55Rf3A+bHMAI4hNzGIFBlfaD6EjxRxhlDjq5cmD3M3SXeD6sq1yeVntV5I60FH5YwivY9DssRafkmGcwmHRf29L36nGZvVpEd7g/fELfyw41wTTSoA1kOXs8ot4FOfenoTWoJSexXIsgYZ5AtWopqy1ktFptEKCkc/IrytzzRJXczrGmottp7/p49BRJpPnYX0HMqYAJ2VKAASfc0uDPQXlAcvPHAmbxtntojD8Q9mSXP79HZ0KWmJpavB37urmnzR4oB7dvGDwxh6kbN+CcBJQxtjwoRhek68ZZzFv6WlihV8h6tcq27Zkr0X5ZM3chg1X1JVObDVC7MgCz7PT1VB/L8l8hzRVBzWvtMo+9tMSZs+uiRABq979+saE574x4KrC5PSPRJj65rO10VxUeOaj3fMZoJS2OnvGL8kdReKQfTlPmbcip4HCgQOGfaQG/jUjizB+FM+dMob2dPlQcdebHXDfLfSuki8a+scngn8Pda9u9t6HyZqU1aWqewinco6FvQOUnZiz7lo8M1B6LxeUzXZjgDl9GRIsWniN3aawIFaewiva/TKP/WBWJeVKgRebehcGFgJWw8pW3DXTO++dzE5mLvlsLAS5wMkounWETYGKAZe/XHLbFtk/A8MZfCxDZMieACbkj4W+QISTqUo3GCBA3cEOy6l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(42112799006)(11063799006)(6133799003)(4143699003)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W04Z+LwW0A10+JpaboCk8hjHMvxJRCZSAH35b55/gL6qjg28mH281FdVyrVR?=
 =?us-ascii?Q?hiXG4n8sI4oVHJPcherPjhYj0nw8lorSVk3vfH9pf+MtKXPJGAQ2l12Iz3uP?=
 =?us-ascii?Q?eOyJfoLJN1QGWyWcutgVYa2/yZYoFGt0x2bPf0/+ugRGt8g36v4eZCB5j1ek?=
 =?us-ascii?Q?vyba0m3ej2moq+CRysbNQ6ElFqx7cutbUBpqFaWYv0q3c8G6Q0j9WE4ffWqJ?=
 =?us-ascii?Q?rgpdqHPq2l6Nh1jduZK0FJk+9+26unZxyhTBzAIpag/hBvRmcA4H57ihPuY0?=
 =?us-ascii?Q?5icZtGJLq6ld0VSS1C79p26uM2nHi+0TmdlJlxJ2au+z7MC1wCKD/CwT20vK?=
 =?us-ascii?Q?UKtIsEy7iQklNMdzCZd3eAHgTqhsoblj2aUzVzlZ8bsXzutAooVcUf1jyxZl?=
 =?us-ascii?Q?pf1/U4fH4/PA4U/R4m6cRRsznEKohA7/CFMjX9uSgDr6XuiDlLQvKWwpwFyH?=
 =?us-ascii?Q?is+RRIKNje9SecFfcwskQZdV0N3qGGQLlk8GVYEfiivy+GUW3i9QtjrEfqkz?=
 =?us-ascii?Q?eNGGDdz0r1P9PoHEdm2fmZcY2e9I9XcFkGWRBdryLM95L4ejUgfGBbpGwEmA?=
 =?us-ascii?Q?Jlz5nAcxx+03uA+uwYkO5qFOIlMdFqOM96YyVdyTiiUekwz2TTt9lHGzT9Nq?=
 =?us-ascii?Q?yqU7jvsA4LmYKzDz+ixl5PhbJUEN8+vHnkpI7mkEU1GIBVGsluJ561SncNc2?=
 =?us-ascii?Q?iTlRlmVcNCXEsZCvNsVYyHb8W8GaCgo0sT7KFUwY5Yqk5QZJGPgHCa8op4ke?=
 =?us-ascii?Q?HSHLAeBUofQQLruBKfxIBMoNhJUPdP2JEhZsFVFZSEn3M2qVeuIX0iVfJWWk?=
 =?us-ascii?Q?j6WfrH/zhsJy59gZKLFBw/Ka5Syu4fRwvJlIFw4n2aoP+s4x/9NFrA+Vbxhs?=
 =?us-ascii?Q?SXsv9AKpTvszxuLlt3eTciJS/UcYiNgf99gIoh5Htl5ZeXveBM/GKizyifiI?=
 =?us-ascii?Q?Ck5+vawHWYgO0sAOnLCFoei3cRElY8Ex4IH/+HqlcERPLHQUPdFG7Wc7OtfJ?=
 =?us-ascii?Q?2L9XJ+1fWDxtK7HAPAOF9I1jlEU16nyVa0uB+Myw9VKk4krKbiH6F6URJRqZ?=
 =?us-ascii?Q?SgawPaEaAVOHbxTexlryC56jcw9/W6Fz6/YapbZzuft1ezD6vLMxwKxdlOUz?=
 =?us-ascii?Q?6WSS4g3cRrNMAoesnOVDd6ZmUzgnS+m45XqsXCWU2qKn5Ywg74bSkxVmsr26?=
 =?us-ascii?Q?Lh8BNpdFmt5nVaZ5Xo6b/6MVxPE60AyZRHwx1rCUfNwSM9d6r0wcbg+BaR/J?=
 =?us-ascii?Q?9ROlLZupwW90zuO3NWEfHdh0L3kX7C+iIchP4/l9EfrvRVU7KT9FgTtNNb8J?=
 =?us-ascii?Q?uzSzdFAiqwSxx8424/8+lV0I7dVlAFm+4Zs4cgp1wWzhVpndUwZ4+p6teS6t?=
 =?us-ascii?Q?4tnOjwfkYucyzKCdJhcopVoqyoCaB9ymIZCJRY342i1qucFkeKAypXLl+PCV?=
 =?us-ascii?Q?zzcFrBINDB6DAYBGhYJZWNYrn/1My+r0vx7Mz1x9qiegM/8B3Px4OppJH+9c?=
 =?us-ascii?Q?PjSNEEQ/5WktHj8TpBby/U7KWMBbvazHh82uK2Uo72MR1iimTeoC6/YtlfGe?=
 =?us-ascii?Q?E0Thj/D0fGzcwKjWExYiHK86t2YBuV5ecyJsS2aGVr/t6Q5hxh60pfCZ/YN7?=
 =?us-ascii?Q?Azq20gBUCaCjcAirL8Z5zGzZpb78fWKyJF1pc2qBo/j+f3+qJEOzGq0OZAgg?=
 =?us-ascii?Q?Y5NGsU5PMn4Y82qWtF80awsdA/GE1vRtwLt6LUrayuefXbb3DNSRrhOHOncC?=
 =?us-ascii?Q?ZFRtyTq3EJKBWiXFv9WCKYr9iiW3WKxArVfm8guoIUT+q5XQ9t52?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OYAY2FPi/qyUUYvmvgMlzRtUoMKC0bQvAPjFvVULwJa3fRlBEK2xhbo7vQ7Fq4CKxPUSw+0+01dcLRo+4DZOA8knrwjBe1O+htn2+OFcI4lFGD7duEumAH/Ds1DH1CD4UtLuG2K7ewdaD07vPBI8/gaeRKUlJIkIYOvWhJfbi9Hqxs0a/7qvwsWSSNAozlM22sziULyCY3mmfWeMZ7CL+asV2rnBhSUimXj5RFlhFblQkXQ6N06YNtXaHqMwbyw/qcPMiMr/tEna6hXaPw5dmdhwmKJr5hxzyHL2lQv5DiIMNfM0Z2eFBChT3W2QFbUroc29noWf6IdPYp0g31ZIaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca33990-12cc-4f8d-8c0a-08dec8c9cd79
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 21:30:19.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Kkzu2HXNGRW9lDQtRvPIw78cbf4AqAdKICymDvpqeWh37KDsL1ecejdz2EVXeiaCkZzQYrvSF/nidBM91M9KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Thursday, June 11, 2026 23:01
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v2 2/2] drm/xe: Disable scheduling early on FD close to a=
void
> CAT error cascade
>=20
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized (i.e=
., only
> one exec queue is processed at a time), which can make it too slow compar=
ed
> to GuC scheduling activity.
>=20
> In this window, GuC may continue to schedule contexts backed by invalid
> page tables, leading to a cascade of CAT errors and repeated engine reset=
s.
> This significantly increases recovery time and can degrade system stabili=
ty.
>=20
> To mitigate this, eagerly disable scheduling by sending a self-message ou=
tside
> of the TDR path. This prevents further scheduling of invalid contexts and
> avoids the CAT error/reset cascade.
>=20
> This change improves robustness and reduces recovery latency in multiple
> queue teardown scenarios.
>=20
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>=20
> ---
> v2:
>  - Fix checkpatch warning (CI)
>  - Cleanup lost kill messages on wedge corner (sashiko)
> ---
Reviewed-by: Xin Wang <x.wang@intel.com>

Nit: my name should be "Xin Wang" in the Cc tag.

I reproduced the CAT error by running 10 concurrent instances of
xe_exec_reset --run-subtest cm-close-fd (with the wait_gt_idle removed).
The dmesg shows page faults at 0x1a0000 (the test BO address) from
vecs/vcs engines immediately after fd close, confirming GuC is still
scheduling against already-cleared page tables.

This patch reduces the race window significantly. However, since
disable_scheduling() sends an async GuC CT message, a narrow window
remains where GuC may schedule before receiving the disable. A complete
fix would require synchronously waiting for GuC to confirm scheduling
is stopped before xe_pt_clear(). That said, this is a clear improvement
and worth merging.


>  drivers/gpu/drm/xe/xe_guc_submit.c | 34
> ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index acf3600a7602..57899128cdc3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1881,11 +1881,23 @@ static void
> __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
>=20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D
> xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +
> +	kfree(msg);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to
> catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define KILL				6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1897,6 +1909,7 @@ static void
> guc_exec_queue_handle_unprocessed_msg(struct xe_sched_msg *msg)
>  	switch (msg->opcode) {
>  	case SET_SCHED_PROPS:
>  	case SET_MULTI_QUEUE_PRIORITY:
> +	case KILL:
>  		kfree(msg);
>  		break;
>  	}
> @@ -1926,6 +1939,9 @@ static void guc_exec_queue_process_msg(struct
> xe_sched_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>=20
> 	__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2038,11 +2054,29 @@ static int guc_exec_queue_init(struct
> xe_exec_queue *q)
>  	return err;
>  }
>=20
> +static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct
> xe_sched_msg *msg,
> +				   u32 opcode);
> +
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)  {
> +	struct xe_sched_msg *msg;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as
> the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time)=
.
> +	 * If an FD is closed with many exec queues, the TDR can be slower
> than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	msg =3D kmalloc_obj(*msg);
> +	if (msg)	/* Not fatal if malloc fails */
> +		guc_exec_queue_add_msg(q, msg, KILL);
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>=20
> --
> 2.34.1

