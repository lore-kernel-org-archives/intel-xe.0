Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AC3C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 00:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0F110E6F5;
	Wed,  9 Jul 2025 00:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKOcInND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A50210E6F5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 00:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752022466; x=1783558466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wZO3qYnUsdNjsFL+EO4ZbvGHZvbA74zXdC3s7z6E1Uo=;
 b=RKOcInND/B+kTVUuGtr2OR36mxqsWDkPsGpTA33L1kWUnPy+iIhpo0pn
 QLWcnBhThx51xHQNGeCTHQpIaYis/GBBCovlHznyO0lmAnBwem+XJQhkb
 4LVJjsZHciF4hl3+6Wpm5bW5mf3fZk/LQ118EwNJmS709hwV2N5xaLa/y
 NxiiF9CukMa9w7kCwPtduvMrMpgSnoXCHijFzyk/uLL3Q1jnZGHT3obx8
 rZLq0f+oe16U/PYuVRy/NAD3RpdlBR1mcX9iF3AnLOAfKBhvOLthxgnb5
 vS2SRsyz6FLCpiEGdUr7ONA6y7/aV7OvDNJD8e4KI1Pk5XEKDROcbOnzv Q==;
X-CSE-ConnectionGUID: gp4V7xDCTSKF+qZLDOaTKg==
X-CSE-MsgGUID: pwjyGctMTZOy8e19IJvtzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41894362"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="41894362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 17:54:22 -0700
X-CSE-ConnectionGUID: GmyNK1l7RW2q6OQ8ZEFUqg==
X-CSE-MsgGUID: TawR1b0VTk2wS6F+Y9nGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192817320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 17:54:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 17:54:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 17:54:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 17:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFbbxLYccNT6BAlwlHg7jgQB35r0pl7LqikZg9Tjk7OOuSEcuBDINKFMbKYbv6GSrzy4OHJ1eAXbL+8qIoWwGPmGFz4gOG2VBzTRFA9Cks/7C0VYSy5eGa9mGZQsbTRTySpCfBb8raZFIrpsqfSwZLkg/kl2/rIs3dLOPuovYCuvma/8MLQ/bjibiQWL8z5rm5yGHfClWKTQ3bfPHk07O+n2O7mZrg1GbZR/o8Qi6MtROfx3owWI2Pz9usn1LoMiDfLIphWI6VmhJSUodHBTnhhAk/B8ylWWJrf0Ojn3YTml094gURhBMFJ3FGJEOcrzHjdg4nLz2Mp8KnAamnlRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC/CDuG1aYyHXcvUbELbc1E6NjdB1dQor+nB1ePUxmw=;
 b=Yt2NXxgOM1hGZRNGu9lChT7XoZe+0tFMGSMy0Z2+RZNuuTNSNGl41eDLGBnSspt3kZRzWBrt2LMJyyVMDYPMz4bANinR4J75uoNu1uA9WdrLxuP3mCp0cNEung/QmPAjabC+7B8Q7bPlID6+qmaRxMgnEtEyijRgwVIhDIBZM29FltroLI+607xsbX5B343MZo2dMboicGYIastE6owECnPWHYsfEqTE3OWxPCyDZDEJxQ7j/T5rezgrqvSeZv1K2kU5yuPr+rpIR1NBrcq72XgFBvfV+3gY7OVIMm5sEuHjL4DuUFCZAnU7RXat0RiJ1LL5cWSF4DZkgraUMTmniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 00:54:12 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 00:54:12 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
Thread-Topic: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
Thread-Index: AQHb7uLePwpI+otToUW+u0AU+xcel7Qm1eCAgAHUcoCAAE8Y4A==
Date: Wed, 9 Jul 2025 00:54:12 +0000
Message-ID: <DM4PR11MB5456F0D25EC2CBD52A81E0DDEA49A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250707015825.3522467-2-shuicheng.lin@intel.com>
 <1094c4f1-3273-4832-b282-7489d938eb25@intel.com> <aG16s9ngmKE4xR0t@intel.com>
In-Reply-To: <aG16s9ngmKE4xR0t@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM6PR11MB4722:EE_
x-ms-office365-filtering-correlation-id: 73de4ac9-f224-43d3-9ab8-08ddbe831efc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?P1q7nQ2EiEiONCVU8lsgXzg26EG2KA5zs+oKRnxwf7eVgCbwwZvat+zmrC+v?=
 =?us-ascii?Q?ZYzlft5Fo2YjOsS/NH2y76n7z/RSWmTKXmo7l6djhnJVS0ex95f/ITso+tXS?=
 =?us-ascii?Q?1Ass/MvZJK9rtrtI2I5QS+bA05G0SoEhPgzde48Lj48iLSyAsaoS28lbw69v?=
 =?us-ascii?Q?foJ56OFVSvEMy7vAoDG4rls9gwwHGfSjEyKqC12DiThG5+03skuQYZ+tiUiR?=
 =?us-ascii?Q?aXHzGS3M1+PERzzjInqSnfq2oHgbAYp4sgxJBUrQftddc+4IkSkvCNU+Bbjk?=
 =?us-ascii?Q?hoWSyl/BVvP91bhaysRoOKfYuVQx3rnIdI2u3XlP/OV0d8m8tBjy3AdsT8eQ?=
 =?us-ascii?Q?e0d3GLmhBhdFxG6mi/xBEvp05gXqDPAda0hp4yQY4B4puyswqkXixz7hHVSD?=
 =?us-ascii?Q?+yF37Ey/ACd/WivA7+GVNsfDBo4pkUXKl+X98fKIJ2OHce7kclo/b9RVhNaW?=
 =?us-ascii?Q?vYkskEgZi+W05Xr/nrc4FRmgn8S5Fr5GQrd373dn5OMpPeB01FR4EsHHQRpE?=
 =?us-ascii?Q?HUfyMN4SVST4vNW0xwOfRmT/dz8+d2B2d9Zv/RHa9Yd8Rlr87Yo8lKFZRt9W?=
 =?us-ascii?Q?c7Qp/jTcFBYEyFcRfReeIwlcfcm2VnTPXqys8xar5a8CJftF5pyCvwOY+vcO?=
 =?us-ascii?Q?9YJgA7I+W6+DdeBCp28WLHIKz3Wq97mAgh25lFT0D2ZsjlSDs7JbgDm9xgln?=
 =?us-ascii?Q?nJJId9KdIjkL45gk1X3Y64uNcnayQU+uwrdEQXU3CidasF/7wjGtBPgYVfht?=
 =?us-ascii?Q?jFnYa8Sf7Oqa8DTU9r1Ej1cltcQKh+LuOYm0YHzCFq8Fg2HLyNlv2O3bBFK6?=
 =?us-ascii?Q?+sPAHpl0gyuHqJHH4uvam366mjVX0/RUdg8wXM54tbPTE+wVkOMG+DCGt3h4?=
 =?us-ascii?Q?rwlpsXDC41ITLA2ZH/uf5j70SopUXVL4mVQPk9VVBl+jEk2p81CQ1f/uKT42?=
 =?us-ascii?Q?VJE31muOSULTJE+7xSmX1pCITmftA7n9DhloWutVVYjgOdSjXhapDFT06Seq?=
 =?us-ascii?Q?KS374nr8ANoxop+uSfdMUveBNV5/ID6/rfU5Ld/KE/aXOTdnzipwgg0Q8FVT?=
 =?us-ascii?Q?VbQATC2S2gB0SZFQjEJSrL04BhmUv9AcsteYOriv/8UlnaOK+4VG5hgKM/FL?=
 =?us-ascii?Q?x4QS3agi2ORi+wy0HAHmW9Es9NFqB14duW6a/oB4rBtFy7u37C9wggQAXnp5?=
 =?us-ascii?Q?zme70ZQAg6jYu/pXzIz+pAQte/mcgZlrNrS4Ei5euU9xeX3UHDqaISvwUtxX?=
 =?us-ascii?Q?KIZjug+jk4+k5XP7we3vJW5FDhrVXTT1/l8WKEtL9/k0/mJmPxyH7P9w62mA?=
 =?us-ascii?Q?xrZ3FxMTKtj3MMAlFZPHOeoF9mOf/XLTE4cQuo4CkCMDSoeFIGrLxdzP7zTe?=
 =?us-ascii?Q?RcZizD5djtVvcuo7vxs/liBYgFR1cxWTQzc9+Pw4pW7vdVm/4Cecg2Rumclz?=
 =?us-ascii?Q?v8rQ9cV3OS0KUmdfnXFSJNpmgaiqL9+Ft9p40S/YAuBT/yQG3qinBQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QwSq9ccxVmFN+3nr2WVZNgBPz4GBTGeBTkd6fXLr0vacCjYAzSRmLW8yBKQS?=
 =?us-ascii?Q?wr59ohA3hDjkHpumoEfb/hCEIMiLysZhMsHSjOZDImCPUUTua2Cy/QTDoJcu?=
 =?us-ascii?Q?FS7NBlW5fnuLSVhxYIyoqZVmId+yEdl/4bRv1H6dp6jayEINFgfzgtRwMt99?=
 =?us-ascii?Q?4uZqsEqjHMSbycEneKKD37UWYkUXyRRCqPw3GWiulHbeOShpEl+01+uMvaM/?=
 =?us-ascii?Q?F9OaOx3NKZrLBhnivMohmj+7f1u8UY1lDqzeT1d39VYjF06SruPsw0GgQ+hh?=
 =?us-ascii?Q?8pkpsmTJ2fcmBFLcX3PZa/3xuONPQS0Pj9tSQ1bjPdTBQ2iTprvQxcgGP/4p?=
 =?us-ascii?Q?7IGYxirJ6GyOqjos04m/S9n3Ju02H9WlQfgkp6xq9B/wSnyd5tf7yplx6FTv?=
 =?us-ascii?Q?nzp/qzzOkVtRJznY46RJ5tnreNtLUL/7cppMu2EaZr5bu+rWK7IQe/eIZ9qc?=
 =?us-ascii?Q?MkHgXbXC+iPng5IhaLkkiahx/bzWD9uoMSy/YdQllRR+107j5NtvPqottkFm?=
 =?us-ascii?Q?pvH4XTg/KtXwgMfzlYB/b2vEOJsS97P6zsFKow1bl8CiaEB0fpzdrn8PDrL5?=
 =?us-ascii?Q?bZidWgKEQhnWi1lk5itk1A706TyU80hTcMkWKfO2SdMnlgHGpWtwepdrxxEl?=
 =?us-ascii?Q?dTFQGo6UMQaPaP2ab7UGRalRG6O1HoQJiFp8L/H66EcXQIkS0u7o2XQOieTz?=
 =?us-ascii?Q?JaiZ7u3c8W4V2Y75/GJOvap7sO8Xk4NUNzNyWxUhmJcF0KJHPlyoSGdrOpTx?=
 =?us-ascii?Q?8qlxcQRfAACl+oqs5ldimcWGhyvwyP4cGCdOAkzAlky2V1gXfyr0SHec+1oV?=
 =?us-ascii?Q?l3jKTpGTCkpQP9eNmXAxTp4qebGFhT+936e6M68FcQHfe4Z9478VQO+xRRtz?=
 =?us-ascii?Q?7CFuAdtsaxUpSYAglG9hR2x0FBIP+PlY2JQDjfQPJ1VZK/WYXgfEczX6wcJU?=
 =?us-ascii?Q?k0O99nFAjfPc46QgAQisZ47EH9d27/Y/noD9DSel8+UdxBqtgmcMZBnu4VuV?=
 =?us-ascii?Q?dbpRsBj/ldlSF4IC5nS1krLX4PnxFGBaH03KAW1fgpsX6IRW7clxKKYaWIxV?=
 =?us-ascii?Q?EpqX7wB7NOo2O718LZbMAavVFYy6k7qrS3JZCI7SBEBRpSwpVgckmTYlrUTK?=
 =?us-ascii?Q?1aqcFDL7l9W122iSoRsrJ6a4vzzf/qB4lN01umHuwpoqRoVGzt/5Hkskd/rO?=
 =?us-ascii?Q?lt2V+CQ548K3+Fanvy+G5vf5n0Qr0QWCQHuPTCAe/mdyPFONAkGLUi+MwHN6?=
 =?us-ascii?Q?g85U+zQEylnYZleM8fnu4/7kYIiU/NOEtK6QDypK8lygZ3GdnbXIrUxfyVdn?=
 =?us-ascii?Q?ZrX9IEaD2JhR7iRPBwAcorG/ZFulnzm34rh02BHdEvrwFvdIoQ1fi2zHohFA?=
 =?us-ascii?Q?5qB85BYHgFP/WHjji+Ddj6cJtN+1OcvUXtBpkijLzPHFi4/fwQ6H4HLrO5Zu?=
 =?us-ascii?Q?X4ME5M6HXm1mFBfE63OJphDCOw/SzvH4+vWyM7QKH95xBfLe+ZLn+fa1Xhev?=
 =?us-ascii?Q?BmLQa3OaRaC90vabCpJDowvO0h/jm68m3o2VtlcYDEW7cSEpy6XCUxepyMIl?=
 =?us-ascii?Q?QmY8W+mdljpdDfZPShxe8EJlGDKrvQpRdsWT/SRM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73de4ac9-f224-43d3-9ab8-08ddbe831efc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 00:54:12.5910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9x/2byWpc8KumeHbk5fGSOfb8raHM+ehfTJz9/I20VQJN4hE9XSYDMgi5tVOYXXItDERnGucOaQ7fbWFqRk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
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

On Wed, July 9, 2025 4:08 AM Rodrigo Vivi wrote:
> On Mon, Jul 07, 2025 at 09:11:41AM -0700, Daniele Ceraolo Spurio wrote:
> >
> >
> > On 7/6/2025 6:58 PM, Shuicheng Lin wrote:
> > > xe_bo_evict_all() is called after xe_display_pm_suspend(). So if
> > > there is error with xe_bo_evict_all(), display pm should be restored.
> > >
> > > Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >
> > If you look at 51462211f4a9, you'll see that before the PXP changes
> > were added xe_display_pm_resume was only called from the error path of
> > xe_gt_suspend (even though xe_bo_evict_all was already there), so I've
> > kept that behavior when I added the PXP changes.
> > That pre-PXP behavior is still present in the 6.12 LTS kernel, so if
> > that's wrong it needs to be fixed there as well.
> >
> > Looking at the history, it looks like the patch that moved the call to
> > xe_display_pm_resume to before the evict_all without adjusting the
> > error management was this one:
> > cb8f81c17531 ("drm/xe/display: Make display suspend/resume work on
> > discrete")
> >
> > Given how different the code is, I don't know if it is better to send
> > a separate patch for that to the stable tree, or to update the fixes
> > tag on this one and send the separate patch when it fails to apply.
> >
> > If you want to go with the former, this is:
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >
> > But please also get an ack from someone on the display side to make
> > sure this was not intentional.
>=20
> not intentional. definitely a bug.
>=20
> Instead of removing the fixes tag, I added an extra one. And pushed to dr=
m-xe-
> next.
>=20
> Shuicheng whenever you receive a notification that the patch failed to ap=
ply in
> some stable branch, please follow up sending a backported version directl=
y to the
> stable mailing list.

Thanks Rodrigo. I will monitor the mail and send the patch if need.

Shuicheng

>=20
> Thanks for the patch and review.
>=20
> >
> > Daniele
> >
> > > ---
> > >   drivers/gpu/drm/xe/xe_pm.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index ff749edc005b..bcfda545e74f 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -134,7 +134,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > >   	/* FIXME: Super racey... */
> > >   	err =3D xe_bo_evict_all(xe);
> > >   	if (err)
> > > -		goto err_pxp;
> > > +		goto err_display;
> > >   	for_each_gt(gt, xe, id) {
> > >   		err =3D xe_gt_suspend(gt);
> > > @@ -151,7 +151,6 @@ int xe_pm_suspend(struct xe_device *xe)
> > >   err_display:
> > >   	xe_display_pm_resume(xe);
> > > -err_pxp:
> > >   	xe_pxp_pm_resume(xe->pxp);
> > >   err:
> > >   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> >
