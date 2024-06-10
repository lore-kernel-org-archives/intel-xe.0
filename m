Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479CC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 19:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEF810E36F;
	Mon, 10 Jun 2024 19:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Quyj3qwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2010E36F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718047929; x=1749583929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j4pNaTgdeQ4o3mXmGQgakoAa1NpqM/cJOi8EDpZCsgs=;
 b=Quyj3qwb9zm1DfOJbbEM7W/Hjib5YVXzFxPknKik89H5Iwj3s/+N1H2V
 FeAVquc1fe3zdufmbDoKrUOGkcmEvHUIX8WuXBYJoQx4OStGJFIHTvFSt
 S052mRbIBhzIDH/OPhOKL+qonzOEl8kxnDqdMGxC+kaQE9tVw60pWQ4G/
 SNdPQU1tD/tQDSONJt4CUkirssyCsyJh2zC8YUZsXRiDhLiOl2YtkqGno
 WVgz8KCp6m9/50AhfiZXVDHAiwwXS1XKJJtcl8ABLAlKj9Nyjcqqg1FQX
 KCnKRo/DKODY428YU3dm2oH13R8FAW2BXBV+sTjTMT7Xpcilz1QniqZ19 g==;
X-CSE-ConnectionGUID: rrs1xbtATTe6E+5folpc3w==
X-CSE-MsgGUID: r1/yeO0oSHuzhMEZoB8qzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12005549"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="12005549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:32:07 -0700
X-CSE-ConnectionGUID: 1KsFzrUgTzKFIexOpwukBw==
X-CSE-MsgGUID: Aw4LjF7ATj+RJzK73YF3Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39833283"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:32:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:32:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr1i8Fl1K3pASyLqWHNveU7f1vhRD33fObAOnT90ZoZGgBdaK8jHLnTUG0NYGV9fZgV5ST3ao4QS/hZjzKrIQLrkTHsx3dSrEcWl7DCQtA2+GWHT6MM6VHJjjymUs5fC7iAGiUomT62nS7q3OfMilACiKKtFPOdckZp+qScZQzxXjiUu85gOBGUKre52XrxDTWr1+ia2/8Uhid7VeIaYa6/Rg8LqFlwigPOFnh7/beBKRb4Zelcp4v02uC2FC2CDRiJ2FP+iiV2p+iLw+yQHyUzja7QVAKXbh3jdSNkgJWW0LC17NIYKwgR1R2WvEL1KhvumizZUtJorNG5jFBLygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMNpXh57RHTrkAWdMqNVwSWHk0CcIDzoYanf+6GoEzE=;
 b=lrGBbMCNLWhAJLyJwfRFPie39GkomkLpEBXC9bGIrcSHCiFr8jyMEjTCgTcizRYDo1YJkw8IWXuwWqoKFGuoa8mnSog8wd4rwylL/9zfsjUZ/wH9uDWqu2Aoc8SGTeC6HPNcoHQ/mtlMLmGt4uOPQxh6x1C3GwwTdAuPqV8OycPkBen7XVLPTt93Jhaq1g3WSAPyUYir8rVvFAlQQabfPdo6f5Giz0JJeVHBhHz/SzzFdOAAb4esJhBQKUDFXOw4CXlMbcTE2MeTRMZXdhdFvLwpoMsDvFgEFWtyk4zHIoxePIyKxzvXti53FlttI9+PA+8muZ2+ckcGiOzNXY3mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:32:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:32:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Thread-Topic: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Thread-Index: AQHau0EX1Iu9LZ3+e0CEErXobqPO3rHBTVaQ
Date: Mon, 10 Jun 2024 19:32:01 +0000
Message-ID: <CH0PR11MB5444C7037501C9DAD6F6C563E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-11-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4751:EE_
x-ms-office365-filtering-correlation-id: 1c9fe479-bb06-46f4-4a5f-08dc898400b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?N0yeGHjf/eh9Ta4n0ipporRXtvzaGuf96FpfbC51lk0oDk5cLM17DrtelDiW?=
 =?us-ascii?Q?J3Cqa5oBM1z2nIrkFwXVi/UtSUorg7MrmMYDiCcqmVtzpfblDp43gynIB+S4?=
 =?us-ascii?Q?OFjobiBKBEia7H4WfQG1h/olNUTa4NizfsqUbd7ytmkP5glOBRBKH1ndctha?=
 =?us-ascii?Q?2jjyA4iKBscBK81oLEvcIXfmbcVnxUFN5uT6oMGAkgp2zn1zA8V7+Car0xE/?=
 =?us-ascii?Q?b63PEs3/BB78gskwM56vN47KoIiDIaN/9j2jgMF7D73P+rvHbamZrprQXAGB?=
 =?us-ascii?Q?je8u+6C4Fvy3Pq4capF3+Qh32Nzj0dwCR4k+CcNEVjnuOIhDzX1qFwvRnhWg?=
 =?us-ascii?Q?t3dPF/aF9RKjf8keBMUgaH0VvEhUS4Wul3ggx/X5KuIUXvSS0HYML7vomewF?=
 =?us-ascii?Q?4Y8xKUfS3GlkN8J4OkNibktV+cHpGwJWTT2SbBR8PaiBr9l9xnbfwGE9txOr?=
 =?us-ascii?Q?JiQjPSQle12vmk4lBZLfOubYdwJ2BcEhhQc4C+9z0/7kBoV2v9AnaanoX43E?=
 =?us-ascii?Q?MnL9S4R9DIJEM7GAXMfPpcAvhRka8xe6dgVhUnT3nRoL+kiYWP4/54r7edoI?=
 =?us-ascii?Q?CEDyAsTxnp+mIE02WaUHZ1T5LBll2R5437zfk2m/2r9G9NBQnaNGWj4X+dL1?=
 =?us-ascii?Q?XSrm9G6za+2C20atQuHPjQZ8ZL18CU99Wqxqi6TX0U8BYkFjVyuKJK66cNFe?=
 =?us-ascii?Q?P3boUycWptOCRSb3GiUFnTeMAt6UJ3RuuEUzqsDniKWgRLgu1TB8Lus7nhII?=
 =?us-ascii?Q?oyArOviCXK6v9zfXGu1yvFhzxpwtpl4/4Ek6/av8NDiKpxDR+M0PnSG9yJu9?=
 =?us-ascii?Q?Mg04m3Q7KtYr8BOs9M2L9ZJwdcbDrydAAQi5kMx5UZ5gP6Z5wbXjiiPBFx9s?=
 =?us-ascii?Q?hJB9NOMM56AbHuiwcymAA7SGwzVi7EO0QwtbKTAAWTLRaY4wolBO/eJumA4a?=
 =?us-ascii?Q?qnXbGW0B5BTRv6gvJz9YxAxgZw4HA/C0BN/5ayjfJy8Q4b7Pcz2b77gv0PM+?=
 =?us-ascii?Q?cWsbqJjKvGprsSs+AL5Q80gDkBIxiDy9C/7sYyMwGkbd0+lhT6DCEQbCGlUd?=
 =?us-ascii?Q?lOb5c+NFiBnqFNR2pMzIrv4qFVmqbDuWM5ob8HktDeXMJ7AkkkEQezqB6T8j?=
 =?us-ascii?Q?aKvbDTOso9kLKe9+qY9GUgLSmqj/aw04etezP+qVszxCc2XRCbEkInsHH0df?=
 =?us-ascii?Q?CcUujXgGL8G6CrmNoXvJFabEt7oionsRHKVRfraBw9Uodvwcr6UZ0CgMxotU?=
 =?us-ascii?Q?crVsqvjsdpoc9yDltrQ7Uaucm4DtzAklZbTiKl+i65x0qI8ncu34toaQu7K6?=
 =?us-ascii?Q?x9RPogTSuGDbIdq8CMrYzV0gey+g1k2reGnf+fhDzO3hM4kLrtnUz5YRlZ7V?=
 =?us-ascii?Q?xjYbQLA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?quZd0pDag1BdXM9Iyu0UugNWrl6090pnAwmc8DWA1Vfstl3mPbNlSRM0GFJr?=
 =?us-ascii?Q?e3L4BTaq6lSioWNc7vbYHog4a8YDEoOQvD8zdmDlAZDqUUyN4QuXozQU8YXO?=
 =?us-ascii?Q?yrW4P5zfQnUjtNdx0lAm7XZakUO/LzvVmy8VH8oNi3EIBEpcW9s8UMHoaSg5?=
 =?us-ascii?Q?3vB8EUMC6u6fBx6/2plXmh1xDnOhp/fcQkcer7MqqUknnUaEnvWJlYgUMk3T?=
 =?us-ascii?Q?RGbGbWbmkzt5ymtxuHfP5eTHUG9pQ9y+ud/4/qjKv9JfQGFLvQqPQKjrIzhR?=
 =?us-ascii?Q?VbC6djlVg3yiGMEKdMcLMHK1x42zWOO+5qwWw2r69irlN1HD8GboJwEv8Keq?=
 =?us-ascii?Q?ilseZMOkBaq/nYK4nsm9yNeqd+YmYSoJqhiHZRlDRolT588mSixU3Eltqqzi?=
 =?us-ascii?Q?kG23v3CDCKqjRxdBpxMFPNMFNDlyAOl8fITe/ExqBxEyO3JKAC7O//Hnxlpi?=
 =?us-ascii?Q?ZwzK6drAtKbf++H7S20X/b5JrH0r0X+V/B3vuNO9ravsjijE6TxUICdhqFUY?=
 =?us-ascii?Q?M7S+PGDoO9XE2aDzUzETqjUh4BUNyoPCprOJw7pntMTQULTOcVyAin1skx5r?=
 =?us-ascii?Q?NP95z/ENMOyq3c+Hc1BFsBfnBp03qzexBT+T0aaaAe2MP8GiXtgMT/dR2NqD?=
 =?us-ascii?Q?a+hLOUL6eckv56xjrpu4GoxmXkuqIdtHAlAYKq8H2zwB+l+vH4ZAXgJ+PIEp?=
 =?us-ascii?Q?pzvcQT3EdT39UNLhY2Oit32Xps7cAU1nyJ+yHcBoiq5kmCrs1D9U4RFobIWX?=
 =?us-ascii?Q?kWF0WSfRPlb7WPhgcqZxpiaisAeBwOUgWVbkUe+gxPF7lKUkKJ438QJFIPpj?=
 =?us-ascii?Q?cLRgqDQ9++ylSOFVbjVYvN9whJt4x+ql82TRfbA41JxUBJC8t9wgfjbwpGlp?=
 =?us-ascii?Q?SADBL1n3fJHRmcgVvQDvXyN23c6ENoBfxOYKaBgGwo4QNYKHjDKsIEPfFs6E?=
 =?us-ascii?Q?nLmUBzgJwAF7QCwzYj1MsltfTGLjdXm7TLZK275bNQsbSN69qG9OZKPHmm7p?=
 =?us-ascii?Q?0mKA1OpZyoOlTD1Z+xuwT/MzQlDktuB+2J4qXaF6dxupY4kodO+7Pm8sNJDt?=
 =?us-ascii?Q?rXRgfasSTdHSibFN7CcK09T3UuU60Lwoue2CPZgEQFFmaUipvGiSU2EZeUoo?=
 =?us-ascii?Q?6thxwwdWiPTYXXhMkz/x8iowMpHxY0NFVIGtD+ijqICYpjs5iKKva5hmkTu2?=
 =?us-ascii?Q?X92UFFEOnd7JeJhN31ajyLti9S7lGV2x5ZM5bte3ICGZXYpcCffI9xchZAr0?=
 =?us-ascii?Q?OejYBxDfXGdN/0MCCGP3TMkEsGifqOcqF6nSXGy6QGoXzcmTJwf3AXXvXAf/?=
 =?us-ascii?Q?ayBqHx/rm1LrK2OhlQgQ9xADcN4TMGwUT80bDWTyaES8a8D1NrCrex0Y9mRS?=
 =?us-ascii?Q?mQQ6Ep9BM9mIJS6YzwQ9Sz0JrBZxGXABpJh2zxWCiZFMzzfjorvJG1oK0MCu?=
 =?us-ascii?Q?EVH8XOe3wnXafmT4lx4HbrcQtBVtb9aMYra+Z2IeL6x3TGFi8kp9Au+PTfNo?=
 =?us-ascii?Q?kJJU0Ww2k9/46pZrMOQuOEqTlmaCqv9IZ6qANBwygDFHLyWch5y5Ct+sittg?=
 =?us-ascii?Q?Cv+dVu1s9VpGxXogdndzTYQe2YxBTSIunomDLJcc1+opaYDIbk9q16XsEs8M?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9fe479-bb06-46f4-4a5f-08dc898400b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 19:32:02.0032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: So7LJfdKGpvVcXu2N4BreMW3i7Iwif9fTcESc8rq1WppT7VGJ54+cC3TOOfaKlgA8H3TyNU3ln+uHqEw5Foh7VnVDbm14D8811S5gKzdj7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if jobs=
 have timed out
>=20
> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> scheduling enable needs to be toggled to properly sample the timestamp.
> If a job has not been running for longer than the timeout period,
> re-enable scheduling and restart the TDR.
>=20
> v2:
>  - Use GT clock to msec helper (Umesh, off list)
>  - s/ctx_timestamp_job/ctx_job_timestamp
> v3:
>  - Fix state machine for TDR, mainly decouple sched disable and
>    deregister (testing)
>  - Rebase (CI)
> v4:
>  - Fix checkpatch && newline issue (CI)
>  - Do not deregister on wedged or unregistered (CI)
>  - Fix refcounting bugs (CI)
>  - Move devcoredump above VM / kernel job check (John H)
>  - Add comment for check_timeout state usage (John H)
>  - Assert pending disable not inflight when enabling scheduling (John H)
>  - Use enable_scheduling in other scheduling enable code (John H)
>  - Add comments on a few steps in TDR (John H)
>  - Add assert for timestamp overflow protection (John H)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 297 +++++++++++++++++++++++------
>  1 file changed, 238 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 3db0aa40535d..8daf4e076df4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -23,6 +23,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gpu_scheduler.h"
>  #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -62,6 +63,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>  #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> =20
>  static bool exec_queue_registered(struct xe_exec_queue *q)
>  {
> @@ -188,6 +191,31 @@ static void set_exec_queue_wedged(struct xe_exec_que=
ue *q)
>  	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>  }
> =20
> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> +}
> +
> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> +}
> +
> +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +

For parity, should this also have clear_exec_queue_extra_ref?
It's not a big deal if not: I don't see where we would have use for such
a function as of present, so we can skip making a function we don't
plan on using any time soon.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *=
q)
>  {
>  	return (atomic_read(&q->guc->state) &
> @@ -920,6 +948,107 @@ static void xe_guc_exec_queue_lr_cleanup(struct wor=
k_struct *w)
>  	xe_sched_submission_start(sched);
>  }
> =20
> +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> +
> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *=
job)
> +{
> +	struct xe_gt *gt =3D guc_to_gt(exec_queue_to_guc(q));
> +	u32 ctx_timestamp =3D xe_lrc_ctx_timestamp(q->lrc[0]);
> +	u32 ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	u32 timeout_ms =3D q->sched_props.job_timeout_ms;
> +	u32 diff, running_time_ms;
> +
> +	/*
> +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> +	 * possible overflows with a high timeout.
> +	 */
> +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> +
> +	if (ctx_timestamp < ctx_job_timestamp)
> +		diff =3D ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	else
> +		diff =3D ctx_timestamp - ctx_job_timestamp;
> +
> +	/*
> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> +	 */
> +	running_time_ms =3D
> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> +
> +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
> +		 "Check job timeout: seqno=3D%u, lrc_seqno=3D%u, guc_id=3D%d, running_=
time_ms=3D%u, timeout_ms=3D%u, diff=3D0x%08x",
> +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		 q->guc->id, running_time_ms, timeout_ms, diff);
> +
> +	return running_time_ms >=3D timeout_ms;
> +}
> +
> +static void enable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +	int ret;
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +
> +	set_exec_queue_pending_enable(q);
> +	set_exec_queue_enabled(q);
> +	trace_xe_exec_queue_scheduling_enable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +
> +	ret =3D wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_enable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret || guc_read_stopped(guc)) {
> +		drm_warn(&xe->drm, "Schedule enable failed to respond");
> +		set_exec_queue_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +	}
> +}
> +
> +static void disable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	clear_exec_queue_enabled(q);
> +	set_exec_queue_pending_disable(q);
> +	trace_xe_exec_queue_scheduling_disable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +}
> +
> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_q=
ueue *q)
> +{
> +	u32 action[] =3D {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	set_exec_queue_destroyed(q);
> +	trace_xe_exec_queue_deregister(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +}
> +
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
> @@ -928,9 +1057,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *d=
rm_job)
>  	struct xe_exec_queue *q =3D job->q;
>  	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
>  	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(q));
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	int err =3D -ETIME;
>  	int i =3D 0;
> -	bool wedged;
> +	bool wedged, skip_timeout_check;
> =20
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -942,49 +1072,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  	}
> =20
> -	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, lrc_seqno=3D%u, guc_id=
=3D%d, flags=3D0x%lx",
> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		   q->guc->id, q->flags);
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q=
),
> -		   "VM job timed out on non-killed execqueue\n");
> -
> -	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> -
> -	trace_xe_sched_job_timedout(job);
> -
> -	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
> -
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
> =20
> +	/* Must check all state after stopping scheduler */
> +	skip_timeout_check =3D exec_queue_reset(q) ||
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		exec_queue_destroyed(q);
> +
> +	/* Job hasn't started, can't be timed out */
> +	if (!skip_timeout_check && !xe_sched_job_started(job))
> +		goto rearm;
> +
>  	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> +	 * modify scheduling state to read timestamp. We could read the
> +	 * timestamp from a register to accumulate current running time but thi=
s
> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> +	 * genuine timeouts.
>  	 */
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> -			xe_gt_reset_async(q->gt);
> -			goto out;
> -		}
> -	}
> +	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
> =20
> -	/* Engine state now stable, disable scheduling if needed */
> +	/* Engine state now stable, disable scheduling to check timestamp */
>  	if (!wedged && exec_queue_registered(q)) {
> -		struct xe_guc *guc =3D exec_queue_to_guc(q);
>  		int ret;
> =20
>  		if (exec_queue_reset(q))
>  			err =3D -EIO;
> -		set_exec_queue_banned(q);
> +
>  		if (!exec_queue_destroyed(q)) {
> -			xe_exec_queue_get(q);
> -			disable_scheduling_deregister(guc, q);
> +			/*
> +			 * Wait for any pending G2H to flush out before
> +			 * modifying state
> +			 */
> +			ret =3D wait_event_timeout(guc->ct.wq,
> +						 !exec_queue_pending_enable(q) ||
> +						 guc_read_stopped(guc), HZ * 5);
> +			if (!ret || guc_read_stopped(guc))
> +				goto trigger_reset;
> +
> +			/*
> +			 * Flag communicates to G2H handler that schedule
> +			 * disable originated from a timeout check. The G2H then
> +			 * avoid triggering cleanup or deregistering the exec
> +			 * queue.
> +			 */
> +			set_exec_queue_check_timeout(q);
> +			disable_scheduling(q);
>  		}
> =20
>  		/*
> @@ -1000,15 +1134,61 @@ guc_exec_queue_timedout_job(struct drm_sched_job =
*drm_job)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret || guc_read_stopped(guc)) {
> +trigger_reset:
>  			drm_warn(&xe->drm, "Schedule disable failed to respond");
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> +			clear_exec_queue_check_timeout(q);
> +			set_exec_queue_extra_ref(q);
> +			xe_exec_queue_get(q);	/* GT reset owns this */
> +			set_exec_queue_banned(q);
>  			xe_gt_reset_async(q->gt);
>  			xe_sched_tdr_queue_imm(sched);
> -			goto out;
> +			goto rearm;
>  		}
>  	}
> =20
> +	/*
> +	 * Check if job is actually timed out, if restart job execution and TDR
> +	 */
> +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_check_timeout(q);
> +		goto sched_enable;
> +	}
> +
> +	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, lrc_seqno=3D%u, guc_id=
=3D%d, flags=3D0x%lx",
> +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		   q->guc->id, q->flags);
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		   "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q=
),
> +		   "VM job timed out on non-killed execqueue\n");
> +
> +	trace_xe_sched_job_timedout(job);
> +
> +	if (!exec_queue_killed(q))
> +		xe_devcoredump(job);
> +
> +	/*
> +	 * Kernel jobs should never fail, nor should VM jobs if they do
> +	 * somethings has gone wrong and the GT needs a reset
> +	 */
> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_check_timeout(q);
> +			xe_gt_reset_async(q->gt);
> +			goto rearm;
> +		}
> +	}
> +
> +	/* Finish cleaning up exec queue via deregister */
> +	set_exec_queue_banned(q);
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +		set_exec_queue_extra_ref(q);
> +		xe_exec_queue_get(q);
> +		__deregister_exec_queue(guc, q);
> +	}
> +
>  	/* Stop fence signaling */
>  	xe_hw_fence_irq_stop(q->fence_irq);
> =20
> @@ -1030,7 +1210,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  	/* Start fence signaling */
>  	xe_hw_fence_irq_start(q->fence_irq);
> =20
> -out:
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +
> +sched_enable:
> +	enable_scheduling(q);
> +rearm:
> +	/*
> +	 * XXX: Ideally want to adjust timeout based on current exection time
> +	 * but there is not currently an easy way to do in DRM scheduler. With
> +	 * some thought, do this in a follow up.
> +	 */
> +	xe_sched_add_pending_job(sched, job);
> +	xe_sched_submission_start(sched);
> +
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> =20
> @@ -1133,7 +1325,6 @@ static void __guc_exec_queue_process_msg_suspend(st=
ruct xe_sched_msg *msg)
>  			   guc_read_stopped(guc));
> =20
>  		if (!guc_read_stopped(guc)) {
> -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  			s64 since_resume_ms =3D
>  				ktime_ms_delta(ktime_get(),
>  					       q->guc->resume_time);
> @@ -1144,12 +1335,7 @@ static void __guc_exec_queue_process_msg_suspend(s=
truct xe_sched_msg *msg)
>  				msleep(wait_ms);
> =20
>  			set_exec_queue_suspended(q);
> -			clear_exec_queue_enabled(q);
> -			set_exec_queue_pending_disable(q);
> -			trace_xe_exec_queue_scheduling_disable(q);
> -
> -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +			disable_scheduling(q);
>  		}
>  	} else if (q->guc->suspend_pending) {
>  		set_exec_queue_suspended(q);
> @@ -1160,19 +1346,11 @@ static void __guc_exec_queue_process_msg_suspend(=
struct xe_sched_msg *msg)
>  static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg=
)
>  {
>  	struct xe_exec_queue *q =3D msg->private_data;
> -	struct xe_guc *guc =3D exec_queue_to_guc(q);
> =20
>  	if (guc_exec_queue_allowed_to_change_state(q)) {
> -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> -
>  		q->guc->resume_time =3D RESUME_PENDING;
>  		clear_exec_queue_suspended(q);
> -		set_exec_queue_pending_enable(q);
> -		set_exec_queue_enabled(q);
> -		trace_xe_exec_queue_scheduling_enable(q);
> -
> -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +		enable_scheduling(q);
>  	} else {
>  		clear_exec_queue_suspended(q);
>  	}
> @@ -1434,8 +1612,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc,=
 struct xe_exec_queue *q)
> =20
>  	/* Clean up lost G2H + reset engine state */
>  	if (exec_queue_registered(q)) {
> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> -		    xe_exec_queue_is_lr(q))
> +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>  			xe_exec_queue_put(q);
>  		else if (exec_queue_destroyed(q))
>  			__guc_exec_queue_fini(guc, q);
> @@ -1615,11 +1792,13 @@ static void handle_sched_done(struct xe_guc *guc,=
 struct xe_exec_queue *q)
>  		if (q->guc->suspend_pending) {
>  			suspend_fence_signal(q);
>  		} else {
> -			if (exec_queue_banned(q)) {
> +			if (exec_queue_banned(q) ||
> +			    exec_queue_check_timeout(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			deregister_exec_queue(guc, q);
> +			if (!exec_queue_check_timeout(q))
> +				deregister_exec_queue(guc, q);
>  		}
>  	}
>  }
> @@ -1657,7 +1836,7 @@ static void handle_deregister_done(struct xe_guc *g=
uc, struct xe_exec_queue *q)
> =20
>  	clear_exec_queue_registered(q);
> =20
> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>  		xe_exec_queue_put(q);
>  	else
>  		__guc_exec_queue_fini(guc, q);
> @@ -1720,7 +1899,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *=
guc, u32 *msg, u32 len)
>  	 * guc_exec_queue_timedout_job.
>  	 */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
> =20
>  	return 0;
> @@ -1750,7 +1929,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(stru=
ct xe_guc *guc, u32 *msg,
> =20
>  	/* Treat the same as engine reset */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
> =20
>  	return 0;
> --=20
> 2.34.1
>=20
>=20
