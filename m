Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A946ED64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8ED10E027;
	Fri,  8 Nov 2024 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlG2zxvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5460010E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731109364; x=1762645364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AvCxn+tWt6xbUypK5Zc2NNS9nvWZkuPad16o4++T5kw=;
 b=DlG2zxvxcN13C5Clyj43KWD/CmY9AFqKTnSpTsg8KleQ0/waXaIiL5Ag
 +PFpUcWeKn3didtVvIB1g2inE3hcagGfGMRZTLZjy1UMUMET1qI6w3YmO
 KqhXz262L7gI0weRsj4gYaK4ifEz+MRIrWj9uHCXlbUuvD8RqYhkPjP6s
 BAMvszdIYC2sN/ACEKp22P401GZROQVE3KPSU5hKaX+23o6hppS3IYHUp
 lqWjcYImnbwplNTLQxqTHWV8hm8Ss+UEAoBV2QMCVrQtXv7MR7+lkykaE
 /kk3Y/44/zaTNCsrePujafQ48Mud3pQ7MWBcCqvlr5QFtqdPQJGbshK/8 A==;
X-CSE-ConnectionGUID: ujOae2nHQCCk9pFHjF6E3w==
X-CSE-MsgGUID: v6AnoLOTR/Ggwcc0dOrbHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31173010"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31173010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:42:44 -0800
X-CSE-ConnectionGUID: KFNW4KfOSO6+C2y1KGiGOQ==
X-CSE-MsgGUID: HzuxGiUBSHmcxzQO5zkS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="90621944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:42:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:42:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:42:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:42:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNC5mQZohSTRiAhnxgHPSTv2XOhi8q4DhAug0Wf+K5MR/Hs3ubAagwqpR3zbdLivxp8R6/OJU4isUjIxO4hwGRTpkLoTLucu4oRVy7gkT+JiQfYyfpnmqrQKmdvZGOLl8t6/0MCsgqkYIkRO/qysQNxYHHpizu64iNS1QUvprS1e+NxZaFHvNkB8g0Ttfk4jEM4tY9AOzYqL2+zp4hMx6R3Cmwu6+TLBxPo4w30mYYpoaca2j0VcqQMxgCRyRkGp3jUEkZgF4s6JAXDzg4e+8714iuHVGSohOdBALFhQxMM00R4uxbEepOnpcxoX4aeTSUwf4Z5dTyXKsNwLkxzipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daTNWeFMOtyPw0ZCmiGLeetjtFLa0x6gxlvVrV8+hBk=;
 b=L67o6Tcqh8zzEbmH6LnEjt7oF6GdpLRV4E9Cuz7gd+9aW27OfabAEx9AD2SLgoTjwJphZ3ouXNR0+3zDlRXW6a1qcvsIYhGRG1UyuXsfy0t864tTUhDpLoKMhVncK3sWdWIFw0gdUUe5NawGSKSCnMblscMhZd4SHh62IAhiAsq2RjgFznSmeLGcAWHwZf74COehcaDpyhnxqSTc0qldd5E6vphTa2Ju1gS0NJb7FGVRoPyEtmMNfpAcvNuStgsicvcwaiwzncLx4cAb3K+CdtKrQI1Lnk5NESWqmHg1sR9BEopJ/XqKGOpcqbt+tBADNbrmoro0k215uAED8nYUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 23:42:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 23:42:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/oa: Allow subsequent OA streams to be opened
 on an exec_queue
Thread-Topic: [PATCH 2/2] drm/xe/oa: Allow subsequent OA streams to be opened
 on an exec_queue
Thread-Index: AQHbMjLdUZPJthK920mD0k+AY656nbKuCorw
Date: Fri, 8 Nov 2024 23:42:40 +0000
Message-ID: <CH0PR11MB54442A583206132ABDFBCDADE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
 <20241108230602.2984959-3-ashutosh.dixit@intel.com>
In-Reply-To: <20241108230602.2984959-3-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB8855:EE_
x-ms-office365-filtering-correlation-id: 45f56dae-6375-4152-a194-08dd004f08f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WqfxZEbpCIOS5Yd7GC/jJOhn/0W7REDqp8VGuIQ3VDWq3bPutWNLYZhPqRZc?=
 =?us-ascii?Q?ECTDcHYehBdi5Uh7Ft1k40JtkEF/f53Lk0rwHb2OnyM/t+Ee/aWwxA+1HZ1N?=
 =?us-ascii?Q?jD/IxhMwpCD9gKotE8c0a4L0DicqccAqwyjn44MwHKBBTKrXYoRU2V0/YNaK?=
 =?us-ascii?Q?NNdOgmRBHg2KWLRcWToOVxqNLycR4L/rGYSZ0NqqfFT0X2XU+bKt0w/xwjRm?=
 =?us-ascii?Q?VGiK6A0KeVABhxTkWp69rHsFY+4wg1xR8EVAQg43YNXUf9SuBOm5r3iZTctH?=
 =?us-ascii?Q?ai4jgRMURE1d9OwVWw3ywLwANARJyFrQfsS8e6cLQ6j9zB8AsfiO81OwLO+r?=
 =?us-ascii?Q?apbbmd02exw873SMfsNX+OsWKoyvX/O4aYRQAdBLdnEGa0h4eCVy82Ld4i7W?=
 =?us-ascii?Q?tGZDkj5aMd+i1UIuTGm3rUDwguqw1yURRyq6AmpxZK6h55Nz5c1ayWMpsesK?=
 =?us-ascii?Q?rUvZODPXQRaU9+aa/p2SDOaw2eGJyCUOKmmkr7AaXN7vKmTcTQB4XlgnrSyb?=
 =?us-ascii?Q?vWntqNpoZV0Q1NLf4Xr9r2arayF05nZ9UtYLNfS/WKC5op1oJmM1me0elDe7?=
 =?us-ascii?Q?XwyDRPHp2OT4PcVmiEFu7GKlv342LWnsn+pz7+4hyrfvkcPD3y68mrEFPR+k?=
 =?us-ascii?Q?cxmHoB/lcOQutnnjSzC2Zynwb7O5iGkHSHTR0CMi435Za/pkrJyPHbuAXxyA?=
 =?us-ascii?Q?N2tNEyiF1nvMbOtexaTRKnf7iVso+qczRGskEVwPJcHcEbqhQfbAICjmaoH4?=
 =?us-ascii?Q?AJ5soPA3QGIPL7i41YVzfNlz93KwrIaZ7tU8RAPGVOPmnD6VJ7yVFak36s7f?=
 =?us-ascii?Q?UAc4YViIqk4WdMdINqa8CYw2/W3/8B3nn+MOxDS1DP4AJVpfqfAm//oR1aRT?=
 =?us-ascii?Q?5C7KC7L3y4HMIcAGZBCCR86Qt+/oX6mc+RVSmi+kawN0BPPt3BhGG7wO+JlB?=
 =?us-ascii?Q?7FsdBetoyOwtDE64HZM1TUXkkdComzfAJeJkZi2xcaJXvGKcfPKomtIxrPUl?=
 =?us-ascii?Q?aen6wpLeNXHeLMgRI7QiM6xBIFI3d8d9AWPHHQbmeIOT63x9NBZbeDd/Zr7I?=
 =?us-ascii?Q?51oxm+bDfAcl9IiYngtyNB90Nvoe0TWsS10TU+Lqhg3nhG2Ip6c1KXxZ1W8v?=
 =?us-ascii?Q?6phR4lbtEI7OBrhvNIjlIa9A1Oj8sBI/9uQQ3Dot9I4E2EnopS5iIx9TKiuX?=
 =?us-ascii?Q?FKQQqXyAcaEjGmcGWaqQN0AHSjeEEb60ryUd9kwswEle45t4y4vvpSgsXF0D?=
 =?us-ascii?Q?pZmEvzdxc27qupAaNBvogh/EdVx6cg2aVXxTHxA+Cdzv9Zbr6n9M+SPt0ZMN?=
 =?us-ascii?Q?c6Gin0piaYVq0grpq4X8yJQYi3mYVy9DDtTb4j646nWhmHgkWOPxYD5U75DT?=
 =?us-ascii?Q?yxtl26o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gw7VflY2GYaEHLeOLcsFNVU2J+UApw9RSAjmzxxQ7YMS1sEdvtUgwGs0i/Fh?=
 =?us-ascii?Q?KeNkC/akORju2Ae6aUzbUhehMio2JYyXon+icwzgWtR4MABIXKQf9BsCz9A9?=
 =?us-ascii?Q?rOxnpzurKT0HIaxodtfFqNODomWWSNdm1vV5WZjd9kut1msPnTt6SbJMSQqP?=
 =?us-ascii?Q?ZrkfblXgDJLTx1X6EfUUI6EgT05xIvLMW8lp0GlpHqm7vbDnp1fsPcoVZI8u?=
 =?us-ascii?Q?Af6uvvm+ZdeY+GM9AoP6KfQWEPMLkndd/dRhzoVI4dPRVpWSnmnz/IDyj83O?=
 =?us-ascii?Q?DRxQ7DbPDPQUaZHlAKE6qW5Hoe133uH2hGETBmTtbWCgD+eE1jLpozvX/drs?=
 =?us-ascii?Q?3r+quQ7bChUw8jwUxcGee1FM3AZx8nD0R1wAlkSlwlMZC/v71hxH8Crcrrru?=
 =?us-ascii?Q?1vfZd2GiHo3xPCIV4Jq8ScXSo6794V+4wuzE7eBtLNNkdyaR++kq6wFTUt5k?=
 =?us-ascii?Q?d0swKkkKWUOLuCX6uG2PcZPZ6wk/Rg33/EHPZ4i1lrkrsHsCxqwyCMWwA3Pe?=
 =?us-ascii?Q?hpXJDy9373JCtAL4Xxa4De28+B5noTYd8mNRL6aP/iMegNF8kpC+qkH7jNC0?=
 =?us-ascii?Q?HZkEflErp4+p0L6zQdcPS03DG442kPiwycHmUuGyPMtsY6rbCbSqzZda2fV+?=
 =?us-ascii?Q?RrrnhNbQO+7rMqcl9Rl4t5rgeX1B4cFBD6uu+HkHyGDtYu/WEN/ohS/bLC8J?=
 =?us-ascii?Q?p4dkpjYtgT23KxxuDesMvCf4XWl4lYwdgzeD7xdUXbSjFe2zzGs4GUbFmx1s?=
 =?us-ascii?Q?l+XHpdZucnldzdGJqG/DiWJVEHKXgg7JgvtjsK2hIo/eNtYG7mw2IIBSwsNl?=
 =?us-ascii?Q?/IHO3iAiG+Osnn+gPQTZeemzF/+D91Sfbx7lEGrp5msDd0mFuZp7pxoZrdrj?=
 =?us-ascii?Q?EjJ+hqhzh9XSYFql1icQ7rGxTjVyOnQqKl6w0L+N3EUzzsflT5wSo1TrINnT?=
 =?us-ascii?Q?qZx30hth+6p+UOwjLxinM0sWrm9B1SZTzIuBuRaTyLDjdEue7c2OhOCvv2mx?=
 =?us-ascii?Q?bobE8oxZbxTwzOt+2AsaweUbI3nwyKK0W75EQ8a/PmQB/CUYQLNLTn/UP7AF?=
 =?us-ascii?Q?d0IjiZNXKwHF88+TEqC9kUb2O7oKKLMu8//pm+6b/zMqZUG+LHs7r/Py4S17?=
 =?us-ascii?Q?2xACm3r4aZXQO1G9ZxG4MbLj3BP6sNBhaa6axEP7WStbVaEbVMPKUJb2xLx3?=
 =?us-ascii?Q?D8+zLMxCRRwp/IjAGtTV7xZga17hQjlwaitZArVjS/mLIQwjruDvfKMKjnfH?=
 =?us-ascii?Q?Ggb44mn8rHhOYCeci/YabqJdf0yhQSUi4YMursfVmTr7p5K6Ro50n56ptxsw?=
 =?us-ascii?Q?TMZPZF0RhrvmLbE/ieA20c5Ir2AXJma66LaR3JQ8sUm+9enPUnl25jHxdtQn?=
 =?us-ascii?Q?LucJfurZV13H4jIrFNSA9mU/z/Q9LNJZh9G9Esgdw6Zn63La9ndYEoPty2PT?=
 =?us-ascii?Q?9xNwjIrfCgPTYcM442Q4So/Nn5pT41Nd32iGQOPdY29es8jET59403Dpv4c1?=
 =?us-ascii?Q?MnmAAYL/QW1X9w5tsTl1EYXSVgoefI8O0J+Hty+uKjm1wM+msT/+i0QnFLd9?=
 =?us-ascii?Q?0rH69Kq+M2CMo+4LGKr9VEddSATexjfj/Hwp83vhuGj1s/EE31oEb7jdcWvj?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f56dae-6375-4152-a194-08dd004f08f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 23:42:40.8829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xKC8XSVtjipdlRM7P1llBqr0RPJZv2XBK27M7JDAtT+YfqyypE0mgcWvbSX9BzqZuy2pdqOTx/aZB9gOP6cwXS8tEtYKoP/9AkBBneGMFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Friday, November 8, 2024 3:06 PM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/oa: Allow subsequent OA streams to be opened on=
 an exec_queue
>=20
> The restriction that OA not be enabled on an active exec queue only appli=
es
> to the first OA stream opened on the exec queue. Subsequent OA streams ca=
n
> be opened on the exec queue since this will not toggle the
> OAC_CONTEXT_ENABLE bit.
>=20
> Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_oa.c               | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 1158b6062a6cd..6e3311c22404e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  	u64 tlb_flush_seqno;
>  	/** @hw_engine_group_link: link into exec queues in the same hw engine =
group */
>  	struct list_head hw_engine_group_link;
> +	/** @oa: this exec_queue is used for OA (OAR/OAC) */
> +	bool oa;

Opening the first OA stream sets the OAC_CONTEXT_ENABLE bit.  Would it be p=
ossible
to read that bit instead of adding an additional bool to the exec queue?

I won't block on this, just asking.
-Jonathan Cavitt

>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[] __counted_by(width);
>  };
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index b0692b8ca0a3d..53d2946ea3052 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1915,6 +1915,9 @@ static int xe_oa_stream_open_ioctl_locked(struct xe=
_oa *oa,
>  		goto err_disable;
>  	}
> =20
> +	if (stream->exec_q && !stream->exec_q->oa)
> +		stream->exec_q->oa =3D true;
> +
>  	/* Hold a reference on the drm device till stream_fd is released */
>  	drm_dev_get(&stream->oa->xe->drm);
> =20
> @@ -2068,9 +2071,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev=
, u64 data, struct drm_file *f
>  		/*
>  		 * Disallow OA from being enabled on active exec_queue's. Enabling OA =
toggles
>  		 * the OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register, which changes t=
he size
> -		 * and layout of the underlying HW context image and can cause hangs.
> +		 * and layout of the underlying HW context image and can cause hangs. =
This
> +		 * restriction holds only for the first OA stream opened on the exec q=
ueue.
>  		 */
> -		if (XE_IOCTL_DBG(oa->xe, exec_queue_enabled(param.exec_q))) {
> +		if (XE_IOCTL_DBG(oa->xe, !param.exec_q->oa && exec_queue_enabled(param=
.exec_q))) {
>  			ret =3D -EADDRINUSE;
>  			goto err_exec_q;
>  		}
> --=20
> 2.41.0
>=20
>=20
