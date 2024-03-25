Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCA8C6FD1F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0487810E614;
	Mon, 25 Mar 2024 17:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+UY/xau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7190310E614
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711386208; x=1742922208;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NW0ZzmPX0QQArWMpK4pk9uvaIf5Lz36RT/v3YR8leL0=;
 b=e+UY/xauDFewNtt/Ien+zpAaB4NQ/axaXEnpYkl1nWWqzTLqo2sqnni7
 w0yzZhaNXHf3H9mjS+u6LPVI3leXM5u7JsTcc/JUERQvl2q+ToxcgZ5ST
 fLHNCC/KsSRIAXWiqaFHpnKt7cbcwO7N6NMxB7p4ji8pN+kx2GH+YwVEL
 yjIhrCyjmsOGroHwLKV+2DGI22hBJIM2oSz0z9QTYRJgKUO45STyaTV7M
 a093ebU6sNdzzYstr+dDhxXRC9nH6LmkoGxCssSdFF/jOakMeUqHwxK7y
 QMMKMwFpn/2LFl5sLlXIkh+lbepgMwQlhjsmMXNo2ntVlD4uSGcl0Pahd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10182904"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10182904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16355167"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:02:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:02:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfmU2kz2pZCsH9ZDWstkQqPTrPnxRCwAuTNTrjs2OodLcjJ6bNTHv1M97RFTFha/J58T3XmQPg6jzahvAorwOj5OKaGXxoAfjs9zPndTCV/zY8uSm/JqJMdaSgi32KuiBcGYkazaVGiqs78osTILp06InB76GBlOSlka2xfrZb1oAen8BnVESqBaYgrdE+FBk82XC1Q33fAGKIjVzXCsfLgg5LKeoblogm07mXlCUOWKfjgFGwlL058IUH0TevygcCHRq6BP78ALoaRpMaHUnVtawzNTfhXqFfUx9GL6LfNLaQssm3LP1D90v+cxpfV5l/Cda+B5e8XHBUl0J9I0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NriiDVCtoLECx7Zk0tsSQ+f1BQlXvbfawp2V8BpmcBo=;
 b=Y7s6WYRR0LtbPiYoYg8NJCr9fTaAmOYSa2q+I4ugiEDAit+50/A+lxka1zgGNp4Sb/hxhcezjtJbs48vJpkWIRlHzAIEo/onJwwzc1Uipa2+vjqW9qmu454t3EG0hpQXjQJq0VQDVaMAq2RfHakpCGYqERMs+cPIN3qVfw22tQtJVj6MFUCIYdF7Ra+lA9N+BxIlonlgHBG4NmIP2lJyzdddL1FwbBgy0oWPdaReTh6TudqDC60+ETneTOQWN02DK5qDhpqD/Jg0qw63lZy0JEiF8dTGOSHgJ8mx31TVcge4USC+b6L3BwNhh/aW6y0Iycbjrb758sQgWQ2Jjx3DVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 17:02:30 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 17:02:29 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 11/30] drm/xe: Move setting last fence to
 vm_bind_ioctl_ops_install_fences
Thread-Topic: [PATCH v4 11/30] drm/xe: Move setting last fence to
 vm_bind_ioctl_ops_install_fences
Thread-Index: AQHacRasVmvmSKcvD0uzwrgaEQL5lbFIyI7g
Date: Mon, 25 Mar 2024 17:02:29 +0000
Message-ID: <SA1PR11MB699190E3123611C3AF88D9BF92362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-12-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-12-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB4951:EE_
x-ms-office365-filtering-correlation-id: b8ddc2f6-0588-4866-a74f-08dc4ced5b0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hPT9+6wSgKVrneoZxJBOHY9UnOir5MZWRPVyc1L58SMX8JC9oWGH6iwIJPEnzZd+J4U+oJGVu+WhZF9M/+fhwfmnnA+0KpTzjWEaUZKIOEW1Q5z2dbA3HQptXkbmbumfCRSWcKzj5J4IUFDIBOfkdjTvRH0haaxiP7YXBWD7ANduJeIEX6QRbwzQI27C5JfB79TXzILqcVLTo/rhjqVvGlEw5JMiL4xrcqE+FDu8iHCi48fR7fPFC2jWGnKY9CzyrBuNl0buyFBt8dEA7y1sW/fSyKOuC8U20NQdY+Eplw3E5fgbP8/RNYVniAUrGCxNdlljuzgf6l/lb2BMmYjzGiQ6mfe4JbvJf9yQ/JpeqVVDgBLcaj01jkitcr9XhSKCC+LV0l4rYAPRtq5E5UZNhRmOsQcr8jZ6BslwQP3DtKra21Tb9/LTEMPJzGQaL+SNQVFC8hxeKiTBPeYHJQcyNv5BHNJKcDeg9hslabvv5fYbOsd9uMf5CG2heV+ksrhlLlDf3eYkxg1Gy9O9zVWubxF6c4q9QC12o3D7Ngzqpm5yY7W6bT2E730R3FCg21i4V/9I78NXdWBj/XDTma61BaYbqCqxYr3QeVSlLJqghK8GUztdgEHAKaIP9oWDLbxvCpiCWZutqPbd1BJlxJ7/Br0HOzlOVLjlQxfb6Kv+4QiEx5RV734J2DxWwLb9BhppT/YU4Tx1ik9HCM2IgAZgsM4mLv5nGbL5BT33B5iRjg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GDp04KXzM9UJDiObbTV25hSTpjod206AcUbl5oodCowLfQD4CTeMTOgt9RNw?=
 =?us-ascii?Q?fy4inSlH0qKuRFUvULzawoXTCDM7o1YvwGp3VHvHpAucrqf+ExstY4rlGhhp?=
 =?us-ascii?Q?/z7/Vssn651j8zVA7HBCiPjcutBSgjkW7YEIIXnAXVej0aNxKaz6l8bqqhkq?=
 =?us-ascii?Q?J8UdYgZQg7QaZY6P/nrNijghmvYkg7yP6IsEoUIsdBiAT1cAJ2daLm3hoSH+?=
 =?us-ascii?Q?kcAc8TTeybfAc/XvQ3G8rDhT150rbh0nDgo2jK6x7EwhlnBWfZ24lBVSZsDt?=
 =?us-ascii?Q?NUPLX5sGWG+uNmetWzAUsIKs5KtaxFU1XFNJDloEfLsYTbAmqYNr8KhNl/Tj?=
 =?us-ascii?Q?f/WsGpFLnqSh1AbP3w5KC0yErpUbJt8O4XTbdDUXpPbUND2bAKEvgpN37lYZ?=
 =?us-ascii?Q?jsY6y0HVRC802firlP/go9uopbmVBd/EnGR3iDjhgJpwylV5GSiKA31ZjQ5K?=
 =?us-ascii?Q?oRcmOh2vk0HbfmtUc3QqqAUUkEJ2LIATxVczVg9dtFrz5LL5S8y1waIxC3e/?=
 =?us-ascii?Q?F5FRvV0y+L+D8iSV8HpBCbk5q3m21PXrSqGS+7kssF4v5vR5BJJXZz7aEE3D?=
 =?us-ascii?Q?lGRrLNcGWo0atpdJRWD0vf3SJ7JQIPiNiii9wteRDfJCYRWvDmaBdHcpwPvv?=
 =?us-ascii?Q?wp98q3LuY3pGx8oAIZKW2LxEp9DQz3pYrl35iv0TVFg4bna70m8nbs9shevi?=
 =?us-ascii?Q?auBIeyLoaxdeBsOVM5/xUJhd/ekE2oS0CxphQVlsY9/uhs4foxPeviI8t8MA?=
 =?us-ascii?Q?gsZWH3U+09mmFyCyS4cIG9L+LpYcSBSqgehsKArkpNQTf/4xFWpdqGwqd7Up?=
 =?us-ascii?Q?BcOtVygbmlLEcZeCSIVYnOaWUSeeUQ/aqjwA0cuJYX2qBC0vgfv7e9W3hHa8?=
 =?us-ascii?Q?OGo+oRrK/+QUQ1T9u+Nc0/EKtDuLt6Vv+tRQ48x7M8Q2mW5Tz94f5YBudaFn?=
 =?us-ascii?Q?Ko9vzQcD1/i38auGJUMZ3yJiQA8WKiLPYXiWQwJIgq5QHFZMavMxmFZxvLYw?=
 =?us-ascii?Q?41C15NphO7R/1JLkL9/Q8hwisonl5T/gEPMxv6+qwOLTSubLcHRL+xMBmiAb?=
 =?us-ascii?Q?EC5ASe9xU7wDixrZxmeiMF0SLkA1N+cfF1WR1hjKzOPwXqawvrmhF4T4KMnD?=
 =?us-ascii?Q?LQO8HDc/xIKOkWc1zgA+9qBex9uRlJ9eZ/qCwbhi7hljQqJ8o/JCrf7HQPVn?=
 =?us-ascii?Q?7iYMP3VZ/UHj8Rtu1KKh7btPMkdWfBz6oyKhrcihJic3A+F9Sp6XUKaIeqne?=
 =?us-ascii?Q?+wWEBXa5SV7VMjvFRD/BJh5pN8qHiMNKrSJFYJNr4d9O0FIcCbaWBdNb2laB?=
 =?us-ascii?Q?63eBO1Gy8IVRuiBGDL2ATvCcOUW9h0ngAmh6zq/lYjNjBGqOleDsGmMHFJAZ?=
 =?us-ascii?Q?y/7jh8/356z1LqewJmVwZK0jrcRSlSrF2s3dY6cRjaEdRzc3hZwkdkaOZ/iY?=
 =?us-ascii?Q?hxNhZUco0xXNpM9Yvdvtv/7mdcQoaZLVMjXRx3sjZwEowR7faOVG+NWfc8uc?=
 =?us-ascii?Q?tJhMzWSsvb/moShR5IGHYFIl1qkXkHA9a4uHtQo2r1ZIPGtwjUHds9l7VTYY?=
 =?us-ascii?Q?9pfs+tIh3DB7Rk++SwQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ddc2f6-0588-4866-a74f-08dc4ced5b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 17:02:29.8178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o04yuh6ilJ5DW1WcbOOoDp7P+xKWrXvl1nVc3vb0xW5MzxZ+G/u15oMk/PcqLg5bPQOvx85a8cNiQQzTRltGeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 11/30] drm/xe: Move setting last fence to
> vm_bind_ioctl_ops_install_fences
>=20
> This moves setting of the last fence to a single location.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8c96c98cba37..4432531f39fe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1841,9 +1841,6 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> struct xe_exec_queue *q,
>  		fence =3D xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>  	}
>=20
> -	if (last_op)
> -		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -
>  	return fence;
>  }
>=20
> @@ -1853,7 +1850,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  	     u32 num_syncs, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
> -	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -1862,9 +1858,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  	if (IS_ERR(fence))
>  		return fence;
>=20
> -	if (last_op)
> -		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -
>  	return fence;
>  }
>=20
> @@ -2820,6 +2813,7 @@ static void vm_bind_ioctl_ops_install_fences(struct
> xe_vm *vm,
>  					     struct xe_vma_ops *vops,
>  					     struct dma_fence *fence)
>  {
> +	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> vops->q);
>  	struct xe_vma_op *op;
>  	int i;
>=20
> @@ -2832,6 +2826,7 @@ static void vm_bind_ioctl_ops_install_fences(struct
> xe_vm *vm,
>  	}
>  	for (i =3D 0; i < vops->num_syncs; i++)
>  		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> +	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);


Oh, With this patch, I can understand the dma-fence-put below won't destroy=
 the last fence, because this fence is set to exec queue's last fence.

I also understand now, how the last fence will be used to signal the out-fe=
nces of vm_bind ioctl... things make sense to me now...

IMO, maybe you can squash this patch to the last patch, so people don't hav=
e the confusion as I had.

Oak
>  	dma_fence_put(fence);
>  }
>=20
> --
> 2.34.1

