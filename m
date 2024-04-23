Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7710AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 21:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366EA10F257;
	Tue, 23 Apr 2024 21:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PU7ZIHPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F111136F3
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713907521; x=1745443521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k5oOXOxC6jsiMUafimrT6H89oBQ+2osglN+xHOeldr4=;
 b=PU7ZIHPQsRjG7MhJqyRLhdhZEjGitoGqvp3j35Nw57z0QFXAP9OxMcW8
 ClbxRO6e1pcEQrzhAQ77PlNeiQnTcb0J2IuobpIAVexMDezI1fiOtRjGo
 4VaGxWX2FyjDzlW5d9oqvKoBJ6Bpl3Wj/V4rc63zpXgEXA556JpzYr82r
 WxkGw3AbtGH/mJfhpl4WeWnkrWqb7s+mQckiXa4/mTzOdQmmSr1Zw5HzD
 vsCqvYg8kMSxFuspatoSB8+oMoKTRXIiF5cahgwdelxOL/cCJsikWRR/F
 YTzKtf0HF5nJgjGmoIrk/5ZGb6/zvbVkuBi11MfumXaMBZj070j672lCL w==;
X-CSE-ConnectionGUID: pZVGHabSSImo3U7frVCdCg==
X-CSE-MsgGUID: 53aau+HvS5CRNY9jJEbMvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9381705"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9381705"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 14:25:21 -0700
X-CSE-ConnectionGUID: 4waC3Bk+SOylTi4E0jwZjQ==
X-CSE-MsgGUID: HMdsG11RT7aXgBR5PKIwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24375779"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 14:25:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 14:25:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 14:25:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 14:25:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 14:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX01YgrK/haBI7wl4VOOBbVIUMUavckc2/Xyuu+bEKZNd6iduwUezlukj1LTD9D1Al9viq4hlqSugC9BvG5aPXV+BqYR9M5+Mk0nZI3gddHIa1bY2Q2u4voMVZNN305eLx5LHw2UMGvvrGE/8Qj+EchS5cBg4QNyzE2EY6Hyhwck3ywFbWiwis/aILaTlR+lVssboKSdKGVVBkXZcZy2emi1IsiWygBNEhyBMVVmSZ7Iu8DSdXlOwSBU7F0+1EApdFEAhsIcSAzESbuyePWBOk31jDFDxaoF9cvWmKf585tBWhLsd9c1EQ7FF4xsvXCVc9YYQCcD/EGcIG6Axvnh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy6XskDdwXwfuuNPCssxRgUAOGgBK0pIXGx1p47ZzQY=;
 b=ZNUvXzoPCb2+Lc9+iMckTozwU/cRBb7Oc5DExQ5Hg9kQopOkeWK1M/RrbBz8LIYAJzaDniVT1zqGS3hbJgXIqQ4a4dSu7Iu4pW1jdWp1C2296w4CXQid4mOz3JOTIFrCJYigrwjxUfmit5BQCVCL3TCW1eNir4Y5pxvRAPTtJctwOkl+hIirpQZjqtYw8HGVH+mRZGdKjtlJSy2h3WWqhwd+8xztnBdvbdjK691AbQnd0HXt58vW44/F+nXpBy1fqNs8lskaOYa+KVouDyXOsSyDG3pXwwAdwwpBqfRscsX8qW2aNaI0DTELT0lJzXMryJpubWhBzUMDSlCmopKxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Tue, 23 Apr 2024 21:25:18 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::4da0:902a:ae47:afc9]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::4da0:902a:ae47:afc9%4]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 21:25:18 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Add reg read/write trace
Thread-Topic: [PATCH] drm/xe: Add reg read/write trace
Thread-Index: AQHakd8vMyp9c0BlrUOvsadDGY5pMLFvepaAgAbqEZA=
Date: Tue, 23 Apr 2024 21:25:18 +0000
Message-ID: <DM4PR11MB5971E5F411F81A5E4F651D0C87112@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
 <877cgtwp6o.fsf@intel.com>
In-Reply-To: <877cgtwp6o.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: fe7eee82-a0fa-48b4-6b1d-08dc63dbdfcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?aK72XBe7KK9NG7ZijxnuVGJfTrs+3IxRDG3eTTxNahnOfW5TMaec0WrFGjT7?=
 =?us-ascii?Q?WQVOKy6Gkk56QgQMEg7P+diRRsKIFzABz0Y9WLW5n1o1BbUgGQBMHRnlD1zh?=
 =?us-ascii?Q?5KbuptuQuAcpgwH7htRtIye0cZ/c5i7L7uk3S6APQ+rCt7ihcmZLVmYf7ur+?=
 =?us-ascii?Q?gcrgYJD4rH9qeOPcWYjPAswkwYLrDeCPjkd2jk9UgWJ0L+gnmlmVeJ4jabyh?=
 =?us-ascii?Q?37NhPJHxwYi+OxBWDQh0lkLUzafkntheLqg0mByVMllGuLTGNPi35R3ihCLo?=
 =?us-ascii?Q?pydIVIV6ft/bKU/54rqMZqtrddG2R5siBIn8hAjJq1UDsrvXde2gln0kqkH6?=
 =?us-ascii?Q?kzwnbugT+78WHt1FFZ8E8s1xVNCp7cq6JWMT27wraVfmMKEr6Z08yZAj6TEK?=
 =?us-ascii?Q?nvhLbGYHiVXb2+vVi9zmN6Hrulwc/nliZFae6PsqTCu95Wn7Z9dgJrJl7ijl?=
 =?us-ascii?Q?7ntdh/AKI3sU+c0xyE9OokuEidDiEwOFlPii16efkxj699z7Rje6XApuM7Ep?=
 =?us-ascii?Q?gexGQrRbXbwnw20tDjt0xhhRPP3dhVrhCbltk9C33kHsoWK2YRgFqwjjDQ8Z?=
 =?us-ascii?Q?ZHXBpbTYDjhhkmX32nKzDehplTXlfETiN40uzcw2cgWfSm2hCQP9iLkX/1tH?=
 =?us-ascii?Q?q9DEKYXanjjSPnQFvkLcrP649cbhUyxxIBjuuuEnhXXL0vje1DcElnT1qzub?=
 =?us-ascii?Q?yjwsjgJC1W3nG/OeeR8hyrGlYhDY7xkSiIpyjNSRlbe/Kd6f3SWIDAAnzxYg?=
 =?us-ascii?Q?2x37V3w8va7L00Ow2LmEmCMzM4hOmxYaZq/EyuJNUZV7VC5hHkCfXbIBKHAz?=
 =?us-ascii?Q?2+OSjD5zZYqiVEPIr62RKO6s1nsgY79u5zR0WjQkVN7Bqb3RWwtZxM3QP030?=
 =?us-ascii?Q?fBLYrA8plJUlmNC6N22OULyzJFR9L5ODnX8AqTZsEsak4z0WpY599dFpXLUP?=
 =?us-ascii?Q?NohjrXyIHN9uj/G3NWET+KcMnPWB12qaYPMAwvjD9zCE4Mum5Ph/n9aNDQ7N?=
 =?us-ascii?Q?heGPbr/zQhDyJHjdaF9EmrpTGSXsXcrSxirMicE80wNcwW5MeVMXnfYdSzkC?=
 =?us-ascii?Q?+9V/Q4EIbrfJTPpWWZC0lzjvetmObTIm69fKPB2uEVXk4fJQc5T7jROMPuz7?=
 =?us-ascii?Q?ps06wJZnACPxap7sT5/trDWLyQlvmftn/6JqS1oAa7BVl8rUA+nC84j3MfPh?=
 =?us-ascii?Q?qr4MUKTc582uYYbqDKn8/S7t07+QWcm7lqpOWpDz8r9bdHUS/b9NWg7zhbq+?=
 =?us-ascii?Q?+AKMhikyR/H86k7ANq6YExGDx90ejuGiA1LYKkL1VQxgiVpRFXFIioukyGGU?=
 =?us-ascii?Q?DJ9jahHYMn7vV93tPIeXcMQEbPsJdMEQyGTc/GspINzcuA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CrDgAkSXyHW8tYLhs1I4YiyXqcbi4fxKPwSn4VHOGtvHHP9bH0BaAwNw8kRp?=
 =?us-ascii?Q?LFKDORCCrqKMmtsruejB584lqlPDjolphDeuEiI3ZefaYAmF7rM3bt/PSxTK?=
 =?us-ascii?Q?MVd3rPtIfnENFMNxTYJ98svQ1lmxt2S0JlQEYC04TvZCUGNX3GLz9DiwCy4C?=
 =?us-ascii?Q?YxvBcIoO4suwcF2NSJRHOJiQv1Om/FVU6D7SNqny3yY7d2bcP0RPaWEPu8U8?=
 =?us-ascii?Q?wfOpRbzadh242iVXc50iAZBz6DK/TpyV52oqVHzyx8BXgP8MV8rqrQArn1AG?=
 =?us-ascii?Q?IGp5DlenQjjgPfTa/wrWSINmaquQ2JToFTgSPbNY1r0PNZGI5jeDYTb7EvNt?=
 =?us-ascii?Q?wy7MS6JshnYHM0QTfZsAFkRKsT7nr5T0qWfHkh9Tv8fsJDYUziJ99tewaGW9?=
 =?us-ascii?Q?PBt6oQj3j+wpf+2P1UEmMZIdXyvcXcAYbBKLCDnZiLIU9jjR793WoQHQA5FM?=
 =?us-ascii?Q?l2S1gcFQaSLajv08GPXaMd06P68wyKrOpmVqqdiQbivi1Isn//yMBO7buimv?=
 =?us-ascii?Q?Z3cUpTTnIe98u2p8U3hLLu///2+u/3nRbTKivJ2pAXz8Acctci7zGmMoUnCJ?=
 =?us-ascii?Q?6T35NctdA7WVFq8GXVzm0QjjlqJKXfLBLT0ZrRuTZFO9DbJGss4zjziziI2V?=
 =?us-ascii?Q?K9tsUlWjzWI8GoE6voW2icHYHaqu9u02Wg+Bb1FP+h+6LAHuykSER5qsjz5C?=
 =?us-ascii?Q?v/sEqriuCC9ZQKCTUWcTAzCpfXc3dhFWq0RR/JL+CCeOlz9XzAhy5chHmo/Z?=
 =?us-ascii?Q?3yE8SioWjAJXFvI5FGnNvzlU8UNFSIIkcLXI+Mbv5KkxLUBnposAMufGjtW+?=
 =?us-ascii?Q?p1gDj7J9mko3XMNZibYPruoLBhv1BPkSKN/IemrDi0AEK9352uDhm+hi8rHr?=
 =?us-ascii?Q?aceVpx6TF44/FUFVN3CmYv+txQHdjZU+SK1mw+XieBtWy6yIm6qDneiWb43N?=
 =?us-ascii?Q?Ptc0W7JXqbQeM2SSiPTgb0Uio8q7DFiifTUVs67A538A+iqHQdV4miC6aI2Z?=
 =?us-ascii?Q?X2xxhL9Y1ZhD0jMhjBZZniPtbDLegoaoddy3mT03JkhVUjco/ywwvkATd34N?=
 =?us-ascii?Q?RIfTKQoAgQNrr1K39v/SUZbIHr7Ogo8EsRKrwBstsVI72XKV1tRULN9ckZq8?=
 =?us-ascii?Q?f3mlDw7hxYKZks2aXLj24VW16TsVkBzVbw6B9pReTUH58LY/n1qU4B70v5h8?=
 =?us-ascii?Q?3GahdZlU68cUa2nMwnBPkfKW6q/KQjXbU65nUvmdJxeEX8w0Fe56kt1NW+SX?=
 =?us-ascii?Q?lNCkpxePxMjyJeqvZa7mEwKRwvkLsOA/dmJh4z7AQ+XpuipHufrtyPFvCHx+?=
 =?us-ascii?Q?YotGuJueqYI71RVCeTak0AmwDW1n5U+AgRzjVvHir2oi7cl8bmRs+c7+a5Aw?=
 =?us-ascii?Q?CqZnw6/YIiSRujOSrlXLqAZqvRt1LRfTa8qACwmKYW508f0L4lousYzV93oj?=
 =?us-ascii?Q?YwgCqS58mYpAMrRUvtwGELVNwwTOjU5p9hjWiyZDlGL0c0nYXujGTve3KRcX?=
 =?us-ascii?Q?ECIo7Aarz5ZHD5TeP1ulz4ovya8JDKJl+Mko/O028QAOPyyjiZTF5Svw0q0l?=
 =?us-ascii?Q?iP9ADb6u50jZnK2NGYYlAV9aFKG+QU9Z2Z5V66jSq5rdipv+eEu2tpSlosD5?=
 =?us-ascii?Q?1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7eee82-a0fa-48b4-6b1d-08dc63dbdfcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 21:25:18.3149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yi8TwuBxS9W2mJBn/Fu+zmqkhwpX/urqPc4/VN+h8AMn+krqzcKXEL/FCMJVQm9LRwLvrV7ldD3KPU06x3wRWDByL4dgDObjRPwsw5niBUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hi Jani,

After this patch the following will be the main trace declarations
xe_gt_tlb_invalidation_fence, xe_bo, xe_exec_queue, xe_sched_job, xe_sched_=
msg,
xe_hw_fence, xe_vma, xe_vm, xe_guc_ct_flow_control, xe_guc_ctb, xe_reg_rw

Would it be ok if we can group them like the following.

xe_trace_bo.h : xe_bo, xe_vma, xe_vm
xe_trace_gt.h: xe_gt_tlb_invalidation_fence, xe_exec_queue, xe_sched_job, x=
e_sched_msg, xe_hw_fence, xe_reg_rw
xe_trace_guc.h: xe_guc_ct_flow_control, xe_guc_ctb

Does this grouping seem ok?

Regards,
Radhakrishna Sripada=20

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, April 19, 2024 4:46 AM
> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; De Marchi, Lu=
cas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH] drm/xe: Add reg read/write trace
>=20
> On Thu, 18 Apr 2024, Radhakrishna Sripada <radhakrishna.sripada@intel.com=
>
> wrote:
> > This will help debug register read/writes and provides
> > a way to trace all the mmio transactions.
> >
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c  | 20 +++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.=
c
> > index 334637511e75..659c19d4f0a6 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -22,6 +22,7 @@
> >  #include "xe_module.h"
> >  #include "xe_sriov.h"
> >  #include "xe_tile.h"
> > +#include "xe_trace.h"
> >
> >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > @@ -423,21 +424,29 @@ int xe_mmio_init(struct xe_device *xe)
> >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > +	u8 val;
> >
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr +=3D gt->mmio.adj_offset;
> >
> > -	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> reg.addr);
> > +	val =3D readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg=
.addr);
> > +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> > +
> > +	return val;
> >  }
> >
> >  u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> >  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > +	u16 val;
> >
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr +=3D gt->mmio.adj_offset;
> >
> > -	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> reg.addr);
> > +	val =3D readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg=
.addr);
> > +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> > +
> > +	return val;
> >  }
> >
> >  void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > @@ -447,17 +456,22 @@ void xe_mmio_write32(struct xe_gt *gt, struct
> xe_reg reg, u32 val)
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr +=3D gt->mmio.adj_offset;
> >
> > +	trace_xe_reg_rw(true, reg, val, sizeof(val), true);
> >  	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.a=
ddr);
> >  }
> >
> >  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > +	u32 val;
> >
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr +=3D gt->mmio.adj_offset;
> >
> > -	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> reg.addr);
> > +	val =3D readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg=
.addr);
> > +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> > +
> > +	return val;
> >  }
> >
> >  u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 se=
t)
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trac=
e.h
> > index 2d56cfc09e42..41d778dd43c6 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -621,6 +621,34 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> >
> >  );
> >
> > +TRACE_EVENT_CONDITION(xe_reg_rw,
> > +	TP_PROTO(bool write, u32 reg, u64 val, int len, bool trace),
> > +
> > +	TP_ARGS(write, reg, val, len, trace),
> > +
> > +	TP_CONDITION(trace),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(u64, val)
> > +		__field(u32, reg)
> > +		__field(u16, write)
> > +		__field(u16, len)
> > +		),
> > +
> > +	TP_fast_assign(
> > +		__entry->val =3D (u64)val;
> > +		__entry->reg =3D reg;
> > +		__entry->write =3D write;
> > +		__entry->len =3D len;
> > +		),
> > +
> > +	TP_printk("%s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)",
> > +		__entry->write ? "write" : "read",
> > +		__entry->reg, __entry->len,
> > +		(u32)(__entry->val & 0xffffffff),
> > +		(u32)(__entry->val >> 32))
> > +);
> > +
>=20
> Btw xe_trace.h already has all the makings of a catch all header that
> has to include everything to get stuff done, and then all the places
> doing tracing end up depending on everything. Change some innocuous
> header somewhere, and you need to rebuild the entire driver. We have
> that in i915, and it was slightly mitigated by separating display
> traces, but it's still bad.
>=20
> It might be a good idea to split this up to xe_<feature>_trace.h files
> instead. Failing at that, maybe stop adding new stuff to it?
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >  #endif
> >
> >  /* This part must be outside protection */
>=20
> --
> Jani Nikula, Intel
