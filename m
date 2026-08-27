Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2882C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E010E426;
	Thu, 27 Aug 2026 16:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJCV7q0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1202110E426
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787847615; x=1819383615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kFkU4f677pz2ghn7lxC8h9bmctm6dDa6quOk/Oj/i+o=;
 b=GJCV7q0iT6NzK46aeW564zKvNSeo6VqNZAFhUrxYc9aE7+9gVVczIDGQ
 RXU0YoHRbHDWW1P3IgJQPXjbj5nf1SBgjf5Pf1RwFeCOfmb2duhI4rv3Q
 jvPVB+Gf1KV2F2xVIWmglPznFpszzU7fMXmOxG703og+EYq1jnQNSM1vI
 NC7pAa//AM2ahSgBYMKmV5eI/BZ/sc0YJY47Q1ypxqo1mI6ooCuNBjDlW
 hsm+Aavibt3NkKYHdWBpXOlAhtsp2pZLu+79tRJW49Z8ntPGXwXt2jxnU
 dAcL+jpg2mgwQkHSm4uHqiDW22svOp8MfpOWRM0ovoUx+HbMb1mjLqaKR A==;
X-CSE-ConnectionGUID: 9uyxA0ikR4ugpCuHCZXzvg==
X-CSE-MsgGUID: noIstKzTRK2wZ916bQyHiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92038405"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92038405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:20:14 -0700
X-CSE-ConnectionGUID: 6B28/xJxTV6Tlpc33r0adw==
X-CSE-MsgGUID: SNPzYKknSeaDHXl23cJmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264159132"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:20:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:20:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 09:20:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmY9I+qCrEOe8AJyaPumUggmZDlTM2s7UArgU8ttSw18Bad0EUeHP9Rq2hULrrQlnI0eDAScs9A1X/EZ6Z58JY4C+42SNQ4FPVF3AF5Av4MoLF1YsGJEgT14odPzdrv0OuyO6HEj9rFGD6xSocDSRWE8NY7qM3QIL3O9NMOKu/8Y7Z/EzxJvC38HQCtx04b2Wsc66x+uooUOkRdfYL1m7iOm1nfRqAOSBoN4uH3wr3cHDV43yNDQLHBTmpckUEWe42rLxZgq8lj7vueR/Ro3AkzlFiWd6W18WGkt5mO0hA9oJfR/AlQ9dk5v8vrHpE4Y6wv9FE2Cx5JKJuy57u8VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN8BfQhuKF6vV4Oub9MU3H2xvmp6PF5RrLNoa8z/7/A=;
 b=PZ7DsmRNozXqlPrYx8HBRpeQSZOPnkuKDX6aaIX6DE2DYopW02kaEoKvSG3J30MyanPnnPrkcDo1KZ1iNXn2a1/l90St3hhFAyRs7d3aNXn0e3RDHosLz/nYRwzAHivyspQGIUh3TEedzNRQ6BTr7D6dL1b9Bip4jJQMBYJDHGPHXtUWNkh9q8PfvLrkyupmQdraMlUuiZdCHQzqSQR3LvrHQ8WK5hQ8zl+tSec0D4uOfbh6Um0re4EkGzLlCsBwwRUFFMxAuBQKzjXgPVkEy/M5mCdW2Sp5KmQ+LmxYbjWvqqTq4oHiHMNzLuRyjVqLDusYu2zEfGVOs1sk8OJAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 16:20:10 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:20:10 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
Thread-Topic: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
Thread-Index: AQHdNOPefkyiRt2ObUCS3pDbgsfgxLav+CiAgACgLACAAM1JAIAAqB2g
Date: Thu, 27 Aug 2026 16:20:10 +0000
Message-ID: <DM4PR11MB54565CC96CAE42FB1C25434EEAAD2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260825224819.2182540-1-shuicheng.lin@intel.com>
 <ebc4797204a5aec94f122094e2fbe2fb1d0536c1.camel@linux.intel.com>
 <DM4PR11MB545658D01D36A23A72096175EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
 <ao/Psuvcjjxkt8iH@gsse-cloud1.jf.intel.com>
In-Reply-To: <ao/Psuvcjjxkt8iH@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: thomas.hellstrom@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB8393:EE_
x-ms-office365-filtering-correlation-id: 7649a7ff-6333-49c0-9b79-08df0457112e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|4143699003|6133799003|11063799006|5023799004|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: I0NzMT/Lihbn1RP5qxB6bEjEuHDfbr1BgvbvyiZX++mra7aWfYj3QjWmgsVFbkqnCBRrSiIC5o3Z1Z/bSptFG5JN+KRXrPptrMGbUi+68dkm/vbSIZTdFdTh1KFBc+aXq4jfarBdCNuiD3oflFvcPzi8J9u+fkzS7kVnpxJ+lIm0mBtFgOKgWVu7oq1Ne4Mz0JiMQZP0lQZrAPwsNkQn7WeYthG9PpVe7tWrqzn+U+zy2yGw0pCmDlIO4kNnKSWEkaSxq6raR0eqy/I9+5DyBfZt/+wTZBSUwKUiPWse02jHfAbmAjPbIl8RSPBDNkOwnhDpi+fXP0wnMFqJ2CU2gKNbQTyxfUq5djfs57RW7ZTqiJd63uTx6RknXhOy+swJxoywmjiufZER6At0L/t6xdp4N3RAlR+DqChsBuHCn38e4WOxOjlQ6agku2RCA44MXdGenhFVuaYBfWuP2NeHNIZQd3ce4sVPiNUmvs5YbLdBTBH5sF57xmUsQ2MAp7hbw6twhALb6mUl/vXABfJ2nyxFSQemjQSZ2E6+08VXdtmd/ypSVGrFcHTYUe1mVXs7iqWb6/E215RH75hkQmBIoqnML12NiXmUV0E5rloH9Pb76JB7DThXoHQvrhkNTKUfwc117WrkOKQg7y8Y1N0Cq8xPGi+GfDpzgiifu/gpY/eTQB5o0n91OXhUVdivjrNQos3v49xqLdN7ss97dsfLQs617BhChntaNDQDjC5bIlI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LLWYR1CCfVoaluqTQlAyFp9eADLlxb6lpyOKXEa0Ywyw1o1Y5IyDnXzi0J?=
 =?iso-8859-1?Q?9l0uoM1XgU4Ql57ncXp7PzQbMxTxnFecoAgvVRxlDfIbJyp2F5pp1lIoc4?=
 =?iso-8859-1?Q?/ief7XcCuBs5r1ZWtkhWONZFeBf/WpvkssIfgyzFH2anKSY5QjPesheqG8?=
 =?iso-8859-1?Q?slE5vL903MOp5+vrjoM0NvwJShdPOHIk+TaBfBrxl/uvVPQtTB5W6+hElf?=
 =?iso-8859-1?Q?QiHIySg5FfMbygEb9dGlBKCvBECgCkMj9LuxJUqhBGJ0G7DZc+xsJtKkvI?=
 =?iso-8859-1?Q?DmZLv/L5PYprnbTGCisvA+kuCZ5WqfIMDy8Qtzd61spykK1nHJVxWCxTpt?=
 =?iso-8859-1?Q?2u+HH7jyW08PJZ5iabJ8/t7u1c1L87XqfmiZdiV4VfUOHRGlpRMQAtt9aZ?=
 =?iso-8859-1?Q?DaMzvzKrTTdbcUzobdXFvrhHPJKoJcpmoojgRLMhG1Oa23puAM3sF/d06Z?=
 =?iso-8859-1?Q?caFRQUBT2JweWf1ucC2mnTVxNj7VvHMRoRzWDEfuBEtlVqCNbqCi0uQUsF?=
 =?iso-8859-1?Q?yRSpDsMhIicmDIWLJzdnkkvVAu0q1nWR3isytYehUntNzOB3y/Ct7drer3?=
 =?iso-8859-1?Q?OxuO6mPxJx0s0z62UYC+q2tB74FgjBdW8TSkDi4QfDAc/YFaIvfAtnIlPh?=
 =?iso-8859-1?Q?Uyu4X5DzQMYHpzagDxNCqbn0P22PI7N4ofl6o/lw3lQGpFqr/g8fRXQ4CH?=
 =?iso-8859-1?Q?pF9d4dju+qfaFdG3UMg3hAQfO3NuXiUHrs81ZeMdfGSY3uuxNOynJHTvab?=
 =?iso-8859-1?Q?tOL3ZhK9UfP9sppYqTKgcyT3DdR95mFZp3humzxutkjqNPE/mTLahkwJ8t?=
 =?iso-8859-1?Q?fgfdy80wrZW6LjZMfvlF4iaKCK+V5IfuyOL23eQKNHPsPqIqHWI99JA/eD?=
 =?iso-8859-1?Q?Qkml+r2LeMH68s2ytRtm4bVsXb0yL8iqhtrK94rtgIU6sO7H2InkdqEcxm?=
 =?iso-8859-1?Q?GJB6Pwuu3JsX/fRbC4cJa+VIdPha1izk4MuK4hn/iSCPmmkW/LvOAHeiR3?=
 =?iso-8859-1?Q?aSzKlyCdtNT26Jk5on40OwG4VZ6s6hgVxB+bwZbuh4wheXRvCz0GOi6pm+?=
 =?iso-8859-1?Q?0xGqd2psW+kEFIJPnVPhoZT+JkGFBUSIYHJXnqTHQmzUYa1auXhqF/rADQ?=
 =?iso-8859-1?Q?6xs/lie7v3Su8ZfN9wil5XuVu4eELkny4OjJUa6ybMZ7Goa1sz9m2HYM1j?=
 =?iso-8859-1?Q?U3aUNMEAfDi2/LrTI/F63qnETwlOG3adPm9Xyc8ix/DuQmrpuv0Tcd8QpD?=
 =?iso-8859-1?Q?72VcgEq1L1dp266xd71FJOG3XTGlJBoIJLIyuJ5cbJs+G8DRGYJj38x9Un?=
 =?iso-8859-1?Q?0kwvmd4JYLcrtJJxl1DYm7dsObkheJJypYAsFiajSP+UB6uzRdxzl4/r86?=
 =?iso-8859-1?Q?Rwsomcmeh4v+6HmPWJq3xfbze+T6XGw/CViI5zNl+V21V84cQSPB19a0Kw?=
 =?iso-8859-1?Q?57FdPAlsrePjtDreJkUxI1s9ma6CpM7EE+PsvtTFCImx+AgvLLBppSuZGQ?=
 =?iso-8859-1?Q?+ggmRs2WNn4SMocMPtGWYYXXsjbNjAsII0Jl/q7QlesMo+Q7uFHL3bIebY?=
 =?iso-8859-1?Q?/asReGMrn+h1/zCpIQGPGhHKUBWF8eCU6RBt/jWpsX4HgR3hqS+ZYf1W4m?=
 =?iso-8859-1?Q?ABiuBjvH5JnSS9rLdo8Zt+pw2BwQ6jzkGGmtzgd6UrZOw6Vd3U8lGKgLZZ?=
 =?iso-8859-1?Q?qR8p60X7S3azP/TcslvdBL/ShCz02KV0xVKEUFk8pP16LxbYOCTYc7Iqlv?=
 =?iso-8859-1?Q?FZ3eBmYT8y6w3SXZACFKwb2LXu3uSRlfdvjSmlHo+wvTjROr3RzEBEj55B?=
 =?iso-8859-1?Q?QO5kJ5fooQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FMn7LcjBnd8wljKz9d5HanepJeZleIesAcPm2IFSxRRg7JDYOJpDeGMmd/xhXtrfZtFQ2OjVtl5MDExtDoFh/7lXcmkX9ewpeKIwf/N2aHj731NG8zpGGdSzWRW7nx4qiqETlMUrqG1RgwdvJtqa5sMW57uQb1FqsTrwjEUbpAoUYklS8mOcJztMIMqZ1v7awMlPZ3tDsHyKu2AxQDh86Op9PloP37tUQdkFbxYxg4FzrmFCKKhP8A1E3fXlulbDt1CE0gCJKRncRyPgtd0bRAlKhOQDF8CHE0mV/QkiNdvC7teYG0sUIQFde7Obo0UT4CEBXW44nWlclMzV72MqOA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7649a7ff-6333-49c0-9b79-08df0457112e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 16:20:10.6417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AobdJZy61s35cDr/et7q1qpyN0ku8uOr4Bd31Gh7A1nBsvZ1lVCAKcaYZ8vP5fQymAP9iEw0XDkeIu6SiDSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

On Wed, Aug 26, 2026 10:49 PM Matthew Brost wrote:
> On Wed, Aug 26, 2026 at 10:10:38PM +0000, Lin, Shuicheng wrote:
> > On Wed, Aug 26, 2026 1:01 AM Thomas Hellstr=F6m wrote:
> > > On Tue, 2026-08-25 at 22:48 +0000, Shuicheng Lin wrote:
> > > > xe_bo_shrink() only took a runtime PM reference for the System CCS
> > > > backup case, and only after the purgeable branch had already return=
ed.
> > > > That branch calls xe_bo_move_notify(), which reaches
> > > > xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and submits a TLB
> > > > invalidation over GuC CT.=A0 The non-purgeable branch reaches the
> > > > same code through ttm_bo_shrink(.allow_move =3D true) -> xe_bo_move=
().
> > > >
> > > > When the device is runtime suspended the CT is disabled and the
> > > > send returns -ENODEV, tripping the XE_WARN_ON() in
> xe_bo_trigger_rebind():
> > > >
> > > > =A0 WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> > > > xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
> > > > =A0=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> > > > =A0=A0 __xe_shrinker_walk+0x174/0x410 [xe]
> > > > =A0=A0 xe_shrinker_walk+0x56/0xf0 [xe]
> > > > =A0=A0 xe_shrinker_scan+0x10c/0x1e0 [xe]
> > > > =A0=A0 do_shrink_slab+0x176/0x7e0
> > > > =A0=A0 shrink_slab+0x137/0x990
> > > > =A0=A0 drop_slab+0x7f/0x130
> > > > =A0=A0 drop_caches_sysctl_handler+0x9c/0xf0
> > > >
> > > > The invalidation is always issued for a fault-mode vm; since
> > > > commit 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo
> > > > cachelines
> > > > manually")
> > > > it is also issued for a non-fault-mode vm on hardware with an
> > > > optimized
> > > > L2 flush, which is how this surfaced.
> > > >
> > > > Add bo_needs_invalidate(), mirroring that condition, and use it in
> > > > xe_bo_shrink() to compute needs_rpm ahead of both branches.=A0 The
> > > > reference is then held across xe_bo_move_notify() in either path,
> > > > and is not taken for a bo whose mappings would not have been invali=
dated.
> > > >
> > > > Shrinking can run in reclaim contexts where the device may not be
> > > > resumed, so a bo is skipped when the reference cannot be acquired.
> > > > Have
> > > > that skip queue the shrinker PM worker:
> > > > xe_shrinker_runtime_pm_get() is gated on the needs of its own
> > > > backup pass rather than on this one, and on DGFX it returns before
> > > > queueing anything, so without this a scan where every candidate is
> > > > skipped makes no progress, reports nothing scanned and returns
> SHRINK_STOP with nothing arranging a wake.
> > > >
> > > > Also gate the System CCS term on !xe_tt->purgeable, since
> > > > xe_bo_shrink_purge() frees the pages without a GPU copy.
> > > >
> > > > Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU
> > > > is runtime suspended.
> > > >
> > > > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > > > Assisted-by: Claude:claude-opus-5
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > >
> > > Nice catch.
> > >
> > > I wonder, however, can we skip the TLB flush if runtime PM is not
> > > available at TLB flush time (runtime_pm_get_if_active()?) Assuming
> > > that if runtime PM is not available, no contexts can be active and
> > > they will flush TLB implicitly when becoming active?
> >
> > Do you mean call runtime_pm_get_if_active() in
> > xe_tlb_inval_range_tilemask_submit(),
> > or lower down in xe_tlb_inval_fence_init()?
> > I'd prefer that too, as it would simplify the code. Two things stop me =
doing it
> here.
> >
> > First, the PTE zap also needs the device, and it runs before the flush.
> > xe_pt_zap_ptes_entry() does xe_map_memset(), which asserts via
> > xe_device_assert_mem_access():
> >
>=20
> I agree with this - the zap is not optional for fault mode, it probably i=
sn't for
> 'xe_device_is_l2_flush_optimized'.
>=20
> >   Assertion `!xe_pm_runtime_suspended(xe)` failed!
> >    xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
> >    xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]
> >    xe_bo_move_notify+0x1b3/0x450 [xe]
> >    xe_bo_shrink+0x20f/0x2b0 [xe]
> >
> > The zap isn't optional - the pages are being freed, so the PTEs have
> > to be cleared either way - and xe_pt_create() uses
> > XE_BO_FLAG_VRAM_IF_DGFX(), so on discrete it is a BAR write that needs
> > D0. Skipping the flush alone leaves that behind.
> >
> > Second, I can't find the implicit flush in the code.
> > xe_pm_runtime_resume() only calls xe_gt_resume() (do_gt_restart())
> > when d3cold.allowed; otherwise xe_gt_runtime_resume() just takes
> > forcewake and does xe_uc_runtime_resume() - no reset, no invalidation.
> > That doesn't mean the TLBs survive, it may well be a property of the
> > power state, but I can't confirm the assumption by reading the driver.
> > Do you know if that is guaranteed? Thanks.
> >
> > >
> > > IIRC It's not totally clear whether this would work for "has_ctx_tlb_=
inval"
> > > hardware, and if so we might need to add something similar to this
> > > for that hardware.
> >
> > My understanding is that it falls out for free if the check sits above
> xe_tlb_inval_issue().
> > Is it right? Thanks.
> >
> > Shuicheng
> >
> > >
> > > Thanks,
> > > Thomas
> > >
> > > > ---
> > > > =A0drivers/gpu/drm/xe/xe_bo.c=A0=A0=A0=A0=A0=A0 | 62
> > > > +++++++++++++++++++++++++++---
> > > > --
> > > > =A0drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
> > > > =A0drivers/gpu/drm/xe/xe_shrinker.h |=A0 2 ++
> > > > =A03 files changed, 72 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c index 2eb5d6aac523..274ff97d8542
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -734,6 +734,32 @@ static int xe_ttm_io_mem_reserve(struct
> > > > ttm_device *bdev,
> > > > =A0	}
> > > > =A0}
> > > >
> > > > +/*
> > > > + * Whether xe_bo_move_notify() will invalidate the GPU mappings
> > > > +of
> > > > @bo, and
> > > > + * therefore needs the device resumed to reach the GuC.
> > > > + *
> > > > + * This mirrors the condition under which xe_bo_trigger_rebind()
> > > > below calls
> > > > + * xe_vm_invalidate_vma(): always for a fault-mode vm, and for
> > > > + any
> > > > bound vm on
> > > > + * hardware where the L2 flush is optimized. Keep the two in sync.
> > > > + *
> > > > + * Context: Caller must hold the BO's dma-resv lock.
> > > > + */
> > > > +static bool bo_needs_invalidate(struct xe_bo *bo) {
> > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > +
> > > > +	if (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
> > > > +		return xe_bo_is_vm_bound(bo);
> > > > +
> > > > +	xe_bo_assert_held(bo);
> > > > +
> > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
> > > > +		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo->vm)))
> > > > +			return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > > =A0static int xe_bo_trigger_rebind(struct xe_device *xe, struct
> > > > xe_bo *bo,
> > > > =A0				const struct ttm_operation_ctx *ctx)
> > > > =A0{
> > > > @@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > > > *ctx, struct ttm_buffer_object *bo,
> > > > =A0	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > > > =A0		return xe_bo_shrink_purge(ctx, bo, scanned);
> > > >
> > > > +	/*
> > > > +	 * Moving this bo out of a non-system placement makes
> > > > +	 * xe_bo_move_notify() invalidate its GPU mappings over GuC
> > > > CT, and
> > > > +	 * System CCS needs a gpu copy when moving PL_TT ->
> > > > PL_SYSTEM. Both
> > > > +	 * need the device resumed.
> > > > +	 */
> > > > +	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM &&
> > > > +		(bo_needs_invalidate(xe_bo) ||
> > > > +		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
> > > > +		=A0 xe_bo_needs_ccs_pages(xe_bo)));
>=20
> This is a complex enough conditional that my current feeling is to just
> unconditionally set:
>=20
> needs_rpm =3D true;

How about keep the XE_PL_SYSTEM check?

	/* Both the invalidation and the System CCS copy need the device. */
	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM;

@Thomas Hellstr=F6m you wrote the original code, what do you think?

>=20
> In practice, on iGPUs where the display is in use, we always hold a runti=
me PM
> reference. It would be very unusual for the display to be suspended while=
 the
> shrinker is running, at least as far as I can tell.
> Let's drop this hard-to-understand, likely overengineered conditional.

I could only reproduce the issue with display disabled. And the CI machine =
that hits it has no monitor connected.

Shuicheng

>=20
> Thoughts?
>=20
> Matt
>=20
> > > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe)) {
> > > > +		/*
> > > > +		 * Resuming is not allowed from all reclaim
> > > > contexts, so leave
> > > > +		 * this bo alone and ask for the device to be woken
> > > > up outside
> > > > +		 * of reclaim. xe_shrinker_runtime_pm_get() is gated
> > > > on the
> > > > +		 * needs of its own backup pass rather than on ours,
> > > > and on
> > > > +		 * DGFX it returns before queueing anything, so ask
> > > > here.
> > > > +		 */
> > > > +		xe_shrinker_queue_pm(xe->mem.shrinker);
> > > > +		goto out_unref;
> > > > +	}
> > > > +
> > > > =A0	if (xe_tt->purgeable) {
> > > > =A0		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
> > > > =A0			lret =3D xe_bo_move_notify(xe_bo, ctx); @@ -1369,28
> > > +1417,24 @@ long
> > > > xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> > > > ttm_buffer_object *bo,
> > > > =A0		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> > > > =A0			xe_bo_set_purgeable_state(xe_bo,
> > > >
> > > > XE_MADV_PURGEABLE_PURGED);
> > > > -		goto out_unref;
> > > > +		goto out_put_rpm;
> > > > =A0	}
> > > >
> > > > -	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM
> > > > */
> > > > -	needs_rpm =3D (!IS_DGFX(xe) && bo->resource->mem_type !=3D
> > > > XE_PL_SYSTEM &&
> > > > -		=A0=A0=A0=A0 xe_bo_needs_ccs_pages(xe_bo));
> > > > -	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > > -		goto out_unref;
> > > > -
> > > > =A0	*scanned +=3D tt->num_pages;
> > > > =A0	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> > > > =A0			=A0=A0=A0=A0 {.purge =3D false,
> > > > =A0			=A0=A0=A0=A0=A0 .writeback =3D flags.writeback,
> > > > =A0			=A0=A0=A0=A0=A0 .allow_move =3D true});
> > > > -	if (needs_rpm)
> > > > -		xe_pm_runtime_put(xe);
> > > >
> > > > =A0	if (lret > 0) {
> > > > =A0		xe_ttm_tt_account_subtract(xe, tt);
> > > > =A0		update_global_total_pages(bo->bdev, -(long)tt-
> > > > >num_pages);
> > > > =A0	}
> > > >
> > > > +out_put_rpm:
> > > > +	if (needs_rpm)
> > > > +		xe_pm_runtime_put(xe);
> > > > +
> > > > =A0out_unref:
> > > > =A0	xe_bo_put(xe_bo);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > index 83374cd57660..fb6ec77972a5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > @@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker
> > > > *shrinker, long shrinkable, long purgea
> > > > =A0	write_unlock(&shrinker->lock);
> > > > =A0}
> > > >
> > > > +/**
> > > > + * xe_shrinker_queue_pm() - Ask for the device to be woken up for
> > > > shrinking
> > > > + * @shrinker: Pointer to the struct xe_shrinker.
> > > > + *
> > > > + * Queue a worker that takes and drops a runtime PM reference.
> > > > Shrinking can
> > > > + * be called from reclaim context, where resuming the device is
> > > > + not
> > > > always
> > > > + * allowed, so a caller that needs the device resumed but could
> > > > + not
> > > > acquire a
> > > > + * reference uses this to have it woken up outside of reclaim.
> > > > + The
> > > > current
> > > > + * scan makes no progress on the affected buffer objects, but a
> > > > subsequent one
> > > > + * can.
> > > > + */
> > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker) {
> > > > +	queue_work(shrinker->xe->unordered_wq, &shrinker-
> > > > >pm_worker);
> > > > +}
> > > > +
> > > > =A0static s64 __xe_shrinker_walk(struct xe_device *xe,
> > > > =A0			=A0=A0=A0=A0=A0 struct ttm_operation_ctx *ctx,
> > > > =A0			=A0=A0=A0=A0=A0 const struct xe_bo_shrink_flags flags, @@ -18=
5,7
> > > +201,7 @@
> > > > static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > > > *shrinker, bool force,
> > > > =A0			xe_pm_runtime_get(xe);
> > > > =A0			return true;
> > > > =A0		}
> > > > -		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> > > > +		xe_shrinker_queue_pm(shrinker);
> > > > =A0		return false;
> > > > =A0	}
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > index 5132ae5192e1..86d2a322cadd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > @@ -11,6 +11,8 @@ struct xe_device;
> > > >
> > > > =A0void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > > > shrinkable, long purgeable);
> > > >
> > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
> > > > +
> > > > =A0int xe_shrinker_create(struct xe_device *xe);
> > > >
> > > > =A0#endif
