Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E29C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 06:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531010F167;
	Thu, 13 Aug 2026 06:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J85hfBkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1FB10F1A0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786603265; x=1818139265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JJdkx1+dwiEtXGgCju7Hwydn81AEDmc+Iq7mDQobssw=;
 b=J85hfBkVLIFpqSZ7aVIURjwnKOXmD+4l1JkjCVLAYx9CREnmwtCdMO9C
 /SgJK+p0+WcnW+QIwb1I1yfoXlkcWNCPNBeW+VZ2rEv90DSu5PRhvOe2X
 pWFZ2cfeFiEc1GPo+3TY46R9ZXvR4+guY7OlL8Gp2IYWqUnCZrEvZekQS
 IN2t53cDyVNSEo4o6DhhQDCQuYp/8tjeGD7KFoqtTX9A+TQjv9cUAjA3n
 OkvO0cRgvMRg/fVGax4MuMsTQzSuhCP2yZKNVSb40Hldu60fmR0amUItI
 2vXdUrhwndplE0IPHDTfpXRyV5ulMbTeQ6nMH1DMP0oPrEdDcP2AlWViQ Q==;
X-CSE-ConnectionGUID: jKJzYwC+TH2mBcIxTfBYaA==
X-CSE-MsgGUID: dyLXRplsTECF9HUO2zZj3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97759758"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="97759758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:41:01 -0700
X-CSE-ConnectionGUID: W9cF83hpQa+OLLcOjgQQXw==
X-CSE-MsgGUID: BJEI3Io4S6WdK0iSebaR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="260562281"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:41:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:41:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 23:41:00 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiGZ8l4GBqkv6CI3wYn1/S6tRxOJ26tIltjdI2+SeVUY1B1PiTme6jxQ/3tsF/hikt4cOQT70pOOviWUNa9ShmKCU+POmKYQ41SX/YRy/cuoL3QBrj4o5CtrsGyRdMIF6vflLjZBR4a40lOdLXehznau8NDLjNOpp6PvyXksNk+5xo3nz8P1GTgk1C/jNdfCCPMe9sv3h3WEgVG5zRRbUa0rQnLT1dvXcj30fjkMagqqiiYW6QkGTspZCVP57d5iqsowqXbzTLIgHVgaQBzWRCbrLCmvOla21EPg8/yRWLwtGO3ovuw/BrrPTqsVit/59ybBH/VKwVXUy/4+XXx2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FNsVftHFfwx7coJnOoaG8i3LT3f9kaFRFLGFXioag4=;
 b=opraGrOLGYws97WuRNXS0OjV4rrTW+v2+k2vJwg9FEeHjkVYJG88z/jzAnfflCmU5ohTYz5gunfouyF1lZSGrSdxDNuS+VKzZu3bWl1yO9UBGzVIeTD5yvy81sNKwrSurtji/BfTEpU7iQAwsR7zrlv8HjPRzRXt6O3od2NyA2PtbV3uGdEGQ2/+EVVBn2WHDdYOlnDG1VFWG7IYawTwNIYlvkCQe19FVUrmiTfKiWadBagW5daBWZNtjV0u1nJD3SpVTLaGp6VnrG/l1tNel5idZH6qYPk8Iq0FsBveOC1jfzcgAlE6dxXRYfKlYfmQAWppwD+tjvT/SqBSsZTWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 06:40:56 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:40:56 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT
Thread-Topic: [PATCH 2/2] drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT
Thread-Index: AQHdKZGP8nW04F/pRE2b2OBXyF8Z7LabeZ0A
Date: Thu, 13 Aug 2026 06:40:56 +0000
Message-ID: <DS0PR11MB87189DBB39319D68C06E437981DB2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <20260811133753.1742666-6-nitin.r.gote@intel.com>
In-Reply-To: <20260811133753.1742666-6-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB6807:EE_
x-ms-office365-filtering-correlation-id: 4ffa019a-d442-4218-6d68-08def905d417
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021|10067099003;
x-microsoft-antispam-message-info: 2CDkrmfNKz4EDekRIuj6Bv72vwb0z7xXkwww1GlWQMxqRO5dhwhDXMKjvh5TN9Rh4xFdAm2CesfxIKRSHwSlgcPvbRJ+3a3jMSkBI9sMkhk4nMbFE8zgRD6HV3c/tJ76ArxFC8fg2xOqCrm3isHh6tq3SuLlWfOWTiLegjF+1lWgEoC25wfFE0CUwx99/NDtWDMM5AFaeSqw0i1TzU1lnz/rpcfByJ2wRswQQWwlSAbh5UCq52KgVXzaNrCEYl9pwiC/jn6ZQggATXzoKLwCVLFCVVtx3h3BO5UumP5Jg4Npy8vbvr5p47t6AtBoLjQ5gfhmOqFagDXrr+Ve4gsDe43VpnRpRmk3NWqCeqK1X59i2IPR9G35zXYWz/qt//bwSpOok57bojWDOc+YhivPzAPR3ew1wYoIk8FCEWoStoWAIPuEWVQ785D2UWfXBdpDlWrwpgcnv/MqSgysTMMIq/4H38UyyJiq6OyzpO/r+iZlMzWL8eW31J3tfYtzhC8tqjvwnn4AW6MRxi/ulyURukgAnJZ5YXJQ4FWGmf1dncSP9VMDyS3e44TLS8+JlarnhvzM8FiFbl19DvpayMG/2xWRav2GVfDp3qHx7jPccLXiIcljX2NjuT3Wc6sDqcboC35Q6gXuMVqwAYl771bLbhzY4tTQpLOn96y5l9Jph+d3z80VIkOaaJtDhFyo6UCSo1C+AmT6Js7yAJkRzkDSnIzc+RbTea+db4Z3pC02f9o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?08f7HO7W2ep/BvBDANqjZsKYiuS9+lnQSfc3TH2VkoJQwegs3J8f5/whfpDM?=
 =?us-ascii?Q?Cwlg9HhaftmrRnwUlHzuo7AtfopBhjDYvTL3FOHRsQu+3bl2Z9DJhp4xsfwX?=
 =?us-ascii?Q?xx6VTTdKlqDXqyduWI2JdC9+Ivq8uvUbxtN1HMxZGcCbadvI+/rFq81Er5So?=
 =?us-ascii?Q?Dt0chp2NOL6IfZIZ4EQDZc7Q34aivu3cN4m2Xs1PmLwbuHQSWwaNO91EWKqx?=
 =?us-ascii?Q?mFV982bjUNReZl2o9kYLBQdLpEB9gFpEzz8SZGGV5QOKctjn8cch1lz78E80?=
 =?us-ascii?Q?Dgst3Qxy3WgTOD62iqwAe91uw1H4cTiAYdP/WL0QiQIqJQtXbR77E2w0KeV8?=
 =?us-ascii?Q?XIafrbCd1vAK1+YgVcJspCgybuMrisyp1MH+zhQVC5x7NQw2g3O7UEwumHE1?=
 =?us-ascii?Q?K9g/93qr6evHjCATy31K6KzX7IAod+oqZxQ42X3Dj31bY65hhJ9DF5GA4pYT?=
 =?us-ascii?Q?fTpqn2/jGNcWiIDtqnD51aJuA9a2tcScsah17Bocm25FFoolGGeHUCO/Zq1d?=
 =?us-ascii?Q?7Ag9JGq4DDEFqTZ2HpFnWBwyiIddN+TVFXn26EObbdmUraKaNxOldbjU9nMJ?=
 =?us-ascii?Q?sunNru1mf+dG0ocgk6OUpG3AEnyIp1svv4C/8POEx7E2hzsb0qzT5U+JPusJ?=
 =?us-ascii?Q?VJGezH+XHellTxDVTx40XD5tThPseDw4d5HCIkbp4AQt5kCNiCMhirmisdjx?=
 =?us-ascii?Q?LaSq40hbiO9nm8bW+Tcu3yuquwDJp4kpwHyw4n9l0oA3Pr0vfn7rlw9Js9ab?=
 =?us-ascii?Q?zNc3BRM46Bb9/m2vKdXRGxb/8e+WFhFT3y+pj5Kk09bPSwjrZ94580M92K4k?=
 =?us-ascii?Q?kgk/emfc4eNzAaxnhSNPkkqs+U3eDanWs5/vBu5R6X6a94q23unfacea9zHY?=
 =?us-ascii?Q?QjF05RYEZT9hfz2k3+eggMS5ReJ535gnv6a8AwDqK21Nd9CP2yWtbub83E+7?=
 =?us-ascii?Q?AWfIA0e7Ky0sGDEmlIHYhUKQmtUjGJPiBQzD4Et/onQIgHin4XdRzp34E7Q3?=
 =?us-ascii?Q?Ry/0qex5C62kFLrfPqxsd/I3y7dSf+87cwWo5xb9/RkASTuE8chiAWYwkZ3G?=
 =?us-ascii?Q?q05wjezf64aw/Yl0M63jAIR7p1gzgV/xfx/uC6NTz1Hc9CNJ/zefk4/Kd8GI?=
 =?us-ascii?Q?nUftr0iyy6oJr9Dol9Os+sh/Dl4ZH6s0AgtuRAF03nAiExsEN7W1EmnjXpE2?=
 =?us-ascii?Q?Vs6hNoWtBHKJL5HbpPdDWJ9BVp1C3KyznaUr9s4E7hZ0UusUhJ0yawmxTOOJ?=
 =?us-ascii?Q?jyNlKi7Qv4uWq8o1nx6Qb82ScgZEChOJ3co2mrZt2eYA9xc+NBO7R7a/zoXo?=
 =?us-ascii?Q?eQCwB/SzaHCC7nf/HMbVF3cre6xlEIFb7ltVcJDfQCwH28bOlf5CXWPuGNLU?=
 =?us-ascii?Q?cUDavIe7ywxR1CbYpyC9fpNb0U0w8gM8IbJkPGd4tYe7Xiv0s/27ErWTsEqT?=
 =?us-ascii?Q?nDy8OEkC9Paj3QH3LOy6WLhUIsXNP5OomoGJhbjKDSBwGAJT2xZVSRcgx8iI?=
 =?us-ascii?Q?gPsGfW9gKg2jeZ8KHLBJzJpO22OpwXNLsWw1NZ8rG3IisBwMDrDElxT5ERnF?=
 =?us-ascii?Q?Dao20plZltQAEzPZgxDC7MLEy2UpSHt8onJjYucD/7WH9FA7FKNxOI+NWUY7?=
 =?us-ascii?Q?l8O7vbo77yIgCOs0WVW2DLxlEKiHk4ZQN2zFDoa4gRVPmBbj0HPwObrMbi6P?=
 =?us-ascii?Q?trkYl7hRMcn+BTGnxPosFk1NTyPP87QgJPjrO52sJwpJGwzzqyQP2P1v3Lwy?=
 =?us-ascii?Q?VQMZLcRkNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QD9gqQG9VkoHevxrK3eWa+Rg3LoGmRRRok18zn04VzkhasLWADzAuMnTz27nmE5VLQvb1geI+JhcpuSuuVFdO++QiZvGXA5H++9xBMrYX3fmkUzKPk1ZE7q4QO77Pd0wgr9tDRfIOckT9WrYvuzjBYmte5x47o91rD2ewK+wAijjbyHwpRnPp+6qqO26zqJWJsvqwG04xTXKShOFhCC6SamRz9CwBhBBjVR5yRSED9pDuVIPWUDt6qghBSiAFFiM5qbr9xBZQ/R8BsrwMqnIhv8uksUY68xOwSnedU03XvUKJN28u/RfBfwIg8a1H1kRnCmaYLVzS3nWf8e28zD+jg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffa019a-d442-4218-6d68-08def905d417
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:40:56.1360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdD94QGbRnrWvo/iF1ILHc48EjiqQ0sXa577UmKq6oZzs3gqrnP79frYwMW6y5ro9nMk+FklZGfaPJClvU/RljpBesX5GCMVOLVhGbHWlIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Niti=
n
> Gote
> Sent: 11 August 2026 19:08
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH 2/2] drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT
>=20
> EXEC_QUEUE_FLAG_PERMANENT used to mark kernel-owned exec queues
> that were only torn down at driver unload, so that guc_exec_queue_destroy=
()
> could take a synchronous teardown path for them while user queues went
> through the async destroy worker.
>=20
> Exec-queue teardown now routes every queue through the single message-
> based path (with the message layer gating any HW/H2G work behind
> drm_dev_enter()/drm_dev_exit() and taking a runtime-PM reference only
> while the device is bound), so the PERMANENT flag no longer has any effec=
t.
> Drop it and all its users, and renumber the remaining flags to keep the b=
it
> range contiguous.

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  3 ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 ++++++--------
>  drivers/gpu/drm/xe/xe_gsc.c              |  3 +--
>  drivers/gpu/drm/xe/xe_migrate.c          |  2 --
>  drivers/gpu/drm/xe/xe_pxp_submit.c       |  5 ++---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  1 -
>  drivers/gpu/drm/xe/xe_vm.c               |  1 -
>  7 files changed, 9 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9f3d022a1463..c4213bb9c137 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -207,9 +207,6 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
>  	struct xe_gt *gt =3D hwe->gt;
>  	int err;
>=20
> -	/* only kernel queues can be permanent */
> -	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags
> & EXEC_QUEUE_FLAG_KERNEL));
> -
>  	q =3D kzalloc_flex(*q, lrc, width);
>  	if (!q)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b2276559c2f6..95f75d61a647 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -135,20 +135,18 @@ struct xe_exec_queue {
>=20
>  /* queue used for kernel submission only */
>  #define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> -/* kernel engine only destroyed at driver unload */
> -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
>  /* for VM jobs. Caller needs to hold rpm ref when creating queue with th=
is
> flag */
> -#define EXEC_QUEUE_FLAG_VM			BIT(2)
> +#define EXEC_QUEUE_FLAG_VM			BIT(1)
>  /* child of VM queue for multi-tile VM jobs */
> -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(2)
>  /* kernel exec_queue only, set priority to highest level */
> -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
>  /* flag to indicate low latency hint to guc */
> -#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
>  /* for migration (kernel copy, clear, bind) jobs */
> -#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
>  /* for programming COMMON_SLICE_CHICKEN3 on first submission */
> -#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(6)
>=20
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside fro=
m
> ban diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.=
c
> index aab59dc647fb..524ac56bdcc7 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -478,8 +478,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>=20
>  	q =3D xe_exec_queue_create(xe, NULL,
>  				 BIT(hwe->logical_instance), 1, hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q)) {
>  		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>  		return PTR_ERR(q);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c index f79d0047bec6..75b83687f1b5
> 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -493,7 +493,6 @@ int xe_migrate_init(struct xe_migrate *m)
>  		 */
>  		m->q =3D xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
>  					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT |
>=20
> EXEC_QUEUE_FLAG_HIGH_PRIORITY |
>  					    EXEC_QUEUE_FLAG_MIGRATE |
>  					    EXEC_QUEUE_FLAG_LOW_LATENCY,
> 0); @@ -501,7 +500,6 @@ int xe_migrate_init(struct xe_migrate *m)
>  		m->q =3D xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
>  						  EXEC_QUEUE_FLAG_KERNEL
> |
> -
> EXEC_QUEUE_FLAG_PERMANENT |
>=20
> EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}
>  	if (IS_ERR(m->q)) {
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c
> b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index e60526e30030..5de86a8cf27d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -46,7 +46,7 @@ static int allocate_vcs_execution_resources(struct
> xe_pxp *pxp)
>  		return -ENODEV;
>=20
>  	q =3D xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
> hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL |
> EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q))
>  		return PTR_ERR(q);
>=20
> @@ -144,8 +144,7 @@ static int allocate_gsc_client_resources(struct xe_gt
> *gt,
>  	}
>=20
>  	q =3D xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q)) {
>  		err =3D PTR_ERR(q);
>  		goto bo_out;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index a8c831fbee3b..a54138461f44 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -354,7 +354,6 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx->ctx_id =3D ctx_id;
>=20
>  		flags =3D EXEC_QUEUE_FLAG_KERNEL |
> -			EXEC_QUEUE_FLAG_PERMANENT |
>  			EXEC_QUEUE_FLAG_MIGRATE;
>  		q =3D xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
>  		if (IS_ERR(q)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 9e0176861cb6..cb6db353147e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4955,7 +4955,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm,
> struct xe_exec_queue *q)
>=20
>  	/* User VMs and queues only */
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> -	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
>  	xe_assert(xe, vm->xef);
> --
> 2.50.1

