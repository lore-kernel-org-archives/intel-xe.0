Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3847C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5F112649;
	Fri, 22 Mar 2024 17:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1EsdPHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F97A11264A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127607; x=1742663607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zv0oUUJhOmpl3j5eyexfq3H7HOJrdiUbOVG1D5CXkXs=;
 b=I1EsdPHUesit0lOFEaLsUEQt3QJXEAuMl0gUhMjnrAFIh6HTAosxb3RC
 Je1WM3WGoNhvPGjoQKfXDTTAiGDULzTi+LJyAMtTJsHLIXVAgoHvdVgwT
 vGvG4paIoYnDpJ56XApaV2IApReADMbrRok3QLO1BuDvXcxoL0BjQree3
 qglNTbTsjF9bUX2G4dg0XBKgBvgyzgAwWKLmNZMWV6o+xdCVbZPWcXgV4
 z63854XzXvR3idJup8Q4xS7vF8C2OC5n2KEGj2SUFd8mfUksjZTZtj5cz
 QZK5aKeCUO4FEPxcT699KSL45yWvGAMr2vN6UOFlzZKLN2uR8TyWbgKpU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6395596"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6395596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19540155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:13:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:13:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:13:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:13:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E13HSu6nvfwSGHWDaYoDXe6zFjjbNF7HA46+/10/X6ganeLQdtXClo7Kc3aj9v9bpmCXQAxo3Xngh4zqFm+tE7mIsvDpd4Qcf+2CixyAzuch2DxopUvffqM3O1Dy5DKOpc6Hr2/xHVyZoncKuagYwqfrLbIoPHo/ohbeg/MGSeX2P3Y5cX8pAOPPq8iDNGsHww0NWfrD2ej35Th3Pg6l59T4U0dbQe4te52dykhF948lUQI8MeBF4MifFX66MG7qKKjm2BncFW3FWke3Fcv0FZri6BLcRla/8kqttDRowHp8XT3taDoKY1W+UfhPRNafJPW686tVSL0S5EYdCa12gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW6FQWapB39F/sQAMnq0lp3rzWm35S5j3bhFqGFemFA=;
 b=Tt2nKSg66YfH1zY7R5cDVUWTKpannmFo2yL6N3KBpcde8JKZKjpTXJf2ijSSNBuR3J3F2ZWjU9gHMbEq+hP/HUawESOFZEuTuLqshjIG4lHutCfmYB/42q8ujQwDjhPG8tKwAis7xkiCfrlN1Nq3KW9AwhigdnBWbjJCXJm7WNN3ZwDQUCRClHbjIedePOLpIgm7TZlUC4mFl6CkU71bhfZaFtlVZ4JYf0e5arIHnZXi/NY02dEEiLEAI5bWNlYNBNcgtFyUFDKW+pjcvuCx2uxsppfxgn2wWxcBz341yFlCpUJd14UIHnHhLBXsjZYiSC+4Y8xbuNJuNKjayUqClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:13:23 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 22 Mar 2024
 17:13:23 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 04/30] drm/xe: Add struct xe_vma_ops abstraction
Thread-Topic: [PATCH v4 04/30] drm/xe: Add struct xe_vma_ops abstraction
Thread-Index: AQHacRatLx/LwNaqw0K4Nn0UIcxfLbFEFjOA
Date: Fri, 22 Mar 2024 17:13:23 +0000
Message-ID: <SA1PR11MB69917805F72378BE8EC2E9C692312@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-5-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6846:EE_
x-ms-office365-filtering-correlation-id: 249a2b7b-78b4-4e2c-9733-08dc4a936191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70VCBeCNTCPynqBlnIGtkV+h+QNVBWZaM7KjcHaFOOVrtb9JbkJbnqO7b3OMN5owOVRNqNdBlMrinZ3D56Fdz+LZUblMN6izPqZSegJQLnJRdLFxzhPE30VRIijr6SEysrgomhB4kW/iHJeOgq8yUqWQ6zZKv6UITqqhKF/gCkI6ViGhZSxLjZecIsMYc/wuvnWrSPVTSP1uxNvQUo98NRNTG1nDHPR0n9+0lUYozh5D5iqdImgrlDHU1RO7L/qsU3atcKdixINkgduuspP7zydS8MNiQVY6TH7n3B9rnUnWSu6GDj17MW8PFkhe6xSQV94FY4rowvw/99xh/m+32L5uk6Z+1E4l5nR2zLH3JJLEn0AvFBjNUpMNZ60tr+oPYMWcBZifXdjQ6ecdzUyyfKkw3wThLBVL57q1NVsylWJVUiwiiHvuW6Gyllmmknoy2WRoInM3VGGCmN6MsiHWbh0OBmBQjdTKv9Bz/pynAuDpPZb+GyvxqjTiF9I/4DIYjHQ4/xQ29zd1mVtZU5QuK1BeYq+OrGZZY7oOUJC6+vh5jdJbU36IMZAiAe35lwwo/Y7LCcsRDH2NDn/auiAgjkKqiWL19xCS17CqyTpKFhdIInpZ+K9GtkakDLD6bwjpbKh9f9oBjqmqryO+3uSRwlzx6UC1cMhiDO9g9rtXTPnL7hOSx8fa9AxxUEHbikLeoEHvZGBtw8kx8yGYWMGntx2akdCGM+BiGuz42JcVDWM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VcpGFZNqrg5tlXwS8JgCJZKHJoALRKEaQOmTUfr12F29bPZBLDH0RdTgf6vD?=
 =?us-ascii?Q?7GoU9FJQgXLPh8hIvmMu0r8m+3v/Hc44ImybDj/frxM5lHhO7SsV5ghyapPN?=
 =?us-ascii?Q?Bv+/PstHAojpSY68aTcn6tTBgdMYX8PtFfw1byl3r6XanXdLRP+dooljw4vQ?=
 =?us-ascii?Q?xNvvjhkVz1f6n7swh+zMYT6StlgzfrJqTpG1gs1wurdz+l+fSEDHVimra0Rf?=
 =?us-ascii?Q?6P2HeWPsEkeg2D/1k+iK9rJsmSI2AUw5ntUhxLwXvYoogR3aa3ibmf5Vr4oz?=
 =?us-ascii?Q?9FGdF+F5Z0u8j/0b3Eu6cRKqWT5Wo3tFN5DUZlgS3MG97fjmMUjiliofjcUo?=
 =?us-ascii?Q?vXRVou5pyylb2+Ueq0M9jadfuc5rZbtK/5lDGv+IAdJ7ZI4ihSGxRKzKRlEW?=
 =?us-ascii?Q?APhy+mgBnlEsZYckC1xkECssPNWFS9LxLl+1U2j6A+T4TcuHuwyxJtYJgK93?=
 =?us-ascii?Q?5k1VJQOYbqPaiqHUn+eMXx/KYsXA2/wKjr2NkqL7+1aGLPw7haiuCqUBjJOk?=
 =?us-ascii?Q?19/whADmYFnggtpQzo7L4wpDa8QRZbeACm5wQPIKXjzA6/y1/bUnHgTjrsrt?=
 =?us-ascii?Q?+cRioU68YSNptdJL4GWTx5YVtdACRz3B8Q5lu3KiaFOyN2L+Cb47KObXEjEi?=
 =?us-ascii?Q?7Fw//po6lSHRFJVKKtal2F9mpz1kLyZ0a/6yTAjkpsW5E8pVb/JfMWs9iLI8?=
 =?us-ascii?Q?/iimoFpu6oS5Bv4RtfSOAWzAGFbdQ2YFMwtLtLMRiYM6pujNYaEhT6aQzMxM?=
 =?us-ascii?Q?Ipe2Cp3f/KKMwpXPtpEYA3rteWDtC1BaKbtaWpcwxhle9AoKVuRDkXMjDceO?=
 =?us-ascii?Q?0F9HxhxyalB89MJt9SXPCMFrvyrA2yKSNi5ilvWWI1YVvy3xYlE5JaG6g+I0?=
 =?us-ascii?Q?zkMmbuOlboqzTcPeremN1mwbNTIsrulfkVGOOqVB0EyXkzE3wczt725NJGZo?=
 =?us-ascii?Q?4A0l7kJSvhLQCLndQCU+maL3NJUzmInAPDezQd9Ya9e33TXuZ+B1zDL28Hcl?=
 =?us-ascii?Q?NrbxyVuKx8xh3auJUutPo9dgNJSSmqQEOrEU/1hoZ/+Gy9zEV9Kr3p7GlP2Q?=
 =?us-ascii?Q?5U1LOCsT79N4ERIi9zDvZJwI1+AgDBU+dhk6rlubE6JMvwMau35IiYQEz2Sa?=
 =?us-ascii?Q?Y5LsdarBrOzGORThSDIpSdq/K75hZBNkkbdj5m4z56tVW4CU5oG0nKGWRYn3?=
 =?us-ascii?Q?aqORM/v869LchzjUFDSEnQvrO7G4g0AdQ6KMsj2b0tLbMeQEQd4DEdSO/ZdH?=
 =?us-ascii?Q?MPVvWIhayahdHDTSLd/LlQ8zc3mc1+9XvAUcCekl/QyyeBSfCgAw8zWGIeVQ?=
 =?us-ascii?Q?PWbhWjJsor1Y7V4Iu6Ffr46+7aDDfFf3pTZ1bavcCCpqSC4vVgI1ThcEz2d2?=
 =?us-ascii?Q?Dcc5jPPrIp72CvcCeLihVKBUuNtoHSz1vyYfEFZGnzpQDX1p05/2ajaR99lm?=
 =?us-ascii?Q?Bhf1KZMHUNSc87MptDEV3+AEevvatlyuhRnZ9YZu9YJT7A5F+VTxAOlBUQ8G?=
 =?us-ascii?Q?GLlP52ZBXup/mPYHV9wjK24VsBOdslUTT40Tz6vD6iY10BhDtFyMTmenIq6w?=
 =?us-ascii?Q?4dAGmeH2TNX/HtN66eI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249a2b7b-78b4-4e2c-9733-08dc4a936191
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:13:23.7132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51/mj+OgTNAEWtPcqua59HiEODln4iHHoSSi88YFl+CGTlLzEHeQJoYkByBZP9P0tFcJWTBB1UsDes1xH7UWrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
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

This patch lgtm. Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 04/30] drm/xe: Add struct xe_vma_ops abstraction
>=20
> Having a structure which encapsulates a list of VMA operations will help
> enable 1 job for the entire list.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
>  2 files changed, 28 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 70a5ba621e4e..e342af6b51b1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2305,7 +2305,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struc=
t
> xe_vma_op *op)
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queu=
e *q,
>  				   struct drm_gpuva_ops *ops,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
> -				   struct list_head *ops_list, bool last)
> +				   struct xe_vma_ops *vops, bool last)
>  {
>  	struct xe_device *xe =3D vm->xe;
>  	struct xe_vma_op *last_op =3D NULL;
> @@ -2317,11 +2317,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op =3D gpuva_op_to_vma_op(__op);
>  		struct xe_vma *vma;
> -		bool first =3D list_empty(ops_list);
> +		bool first =3D list_empty(&vops->list);
>  		unsigned int flags =3D 0;
>=20
>  		INIT_LIST_HEAD(&op->link);
> -		list_add_tail(&op->link, ops_list);
> +		list_add_tail(&op->link, &vops->list);
>=20
>  		if (first) {
>  			op->flags |=3D XE_VMA_OP_FIRST;
> @@ -2445,7 +2445,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
,
> struct xe_exec_queue *q,
>  	}
>=20
>  	/* FIXME: Unhandled corner case */
> -	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
> +	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
>=20
>  	if (!last_op)
>  		return 0;
> @@ -2775,7 +2775,7 @@ static int op_lock(struct drm_exec *exec, struct xe=
_vm
> *vm,
>=20
>  static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
>  				  struct xe_vm *vm,
> -				  struct list_head *ops_list)
> +				  struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op;
>  	int err;
> @@ -2784,7 +2784,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>  	if (err)
>  		return err;
>=20
> -	list_for_each_entry(op, ops_list, link) {
> +	list_for_each_entry(op, &vops->list, link) {
>  		err =3D op_lock(exec, vm, op);
>  		if (err)
>  			return err;
> @@ -2794,13 +2794,13 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>  }
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> -				     struct list_head *ops_list,
> +				     struct xe_vma_ops *vops,
>  				     bool cleanup)
>  {
>  	struct xe_vma_op *op, *next;
>  	struct dma_fence *fence =3D NULL;
>=20
> -	list_for_each_entry_safe(op, next, ops_list, link) {
> +	list_for_each_entry_safe(op, next, &vops->list, link) {
>  		if (!IS_ERR(fence)) {
>  			dma_fence_put(fence);
>  			fence =3D xe_vma_op_execute(vm, op);
> @@ -2818,7 +2818,7 @@ static struct dma_fence *ops_execute(struct xe_vm
> *vm,
>  }
>=20
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> -				     struct list_head *ops_list)
> +				     struct xe_vma_ops *vops)
>  {
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> @@ -2829,12 +2829,12 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>  		      DRM_EXEC_IGNORE_DUPLICATES, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		err =3D vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
> +		err =3D vm_bind_ioctl_ops_lock(&exec, vm, vops);
>  		drm_exec_retry_on_contention(&exec);
>  		if (err)
>  			goto unlock;
>=20
> -		fence =3D ops_execute(vm, ops_list, true);
> +		fence =3D ops_execute(vm, vops, true);
>  		if (IS_ERR(fence)) {
>  			err =3D PTR_ERR(fence);
>  			/* FIXME: Killing VM rather than proper error handling */
> @@ -2992,6 +2992,11 @@ static int vm_bind_ioctl_signal_fences(struct xe_v=
m
> *vm,
>  	return err;
>  }
>=20
> +static void xe_vma_ops_init(struct xe_vma_ops *vops)
> +{
> +	INIT_LIST_HEAD(&vops->list);
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file=
 *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> @@ -3005,7 +3010,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  	u32 num_syncs, num_ufence =3D 0;
>  	struct xe_sync_entry *syncs =3D NULL;
>  	struct drm_xe_vm_bind_op *bind_ops;
> -	LIST_HEAD(ops_list);
> +	struct xe_vma_ops vops;
>  	int err;
>  	int i;
>=20
> @@ -3156,6 +3161,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		goto free_syncs;
>  	}
>=20
> +	xe_vma_ops_init(&vops);
>  	for (i =3D 0; i < args->num_binds; ++i) {
>  		u64 range =3D bind_ops[i].range;
>  		u64 addr =3D bind_ops[i].addr;
> @@ -3175,14 +3181,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		}
>=20
>  		err =3D vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> -					      &ops_list,
> -					      i =3D=3D args->num_binds - 1);
> +					      &vops, i =3D=3D args->num_binds - 1);
>  		if (err)
>  			goto unwind_ops;
>  	}
>=20
>  	/* Nothing to do */
> -	if (list_empty(&ops_list)) {
> +	if (list_empty(&vops.list)) {
>  		err =3D -ENODATA;
>  		goto unwind_ops;
>  	}
> @@ -3191,7 +3196,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  	if (q)
>  		xe_exec_queue_get(q);
>=20
> -	err =3D vm_bind_ioctl_ops_execute(vm, &ops_list);
> +	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
>=20
>  	up_write(&vm->lock);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 79b5cab57711..cc3dce893f1e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -355,4 +355,11 @@ struct xe_vma_op {
>  		struct xe_vma_op_prefetch prefetch;
>  	};
>  };
> +
> +/** struct xe_vma_ops - VMA operations */
> +struct xe_vma_ops {
> +	/** @list: list of VMA operations */
> +	struct list_head list;
> +};
> +
>  #endif
> --
> 2.34.1

