Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C431FC531D2
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 21:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA0C10E760;
	Thu, 19 Feb 2026 21:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFhR5Kdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EAC10E759
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771536766; x=1803072766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RRko/ruNuD+mBcYh2TS1xD8EoRJgq8TdWB9iqMxla88=;
 b=FFhR5KdwV5e/kYiSPJH8TOVW3y7x/QRTFsy9hUXeLLxTz/RTymXZ66SO
 PHcVc/vFZxhRnWSBKfOcPP12IqmAw1poDXSHKhXOFo88hpZcwToCaXWEH
 0kK8zf/PFPqTzStdQRcOed0agSWVE5YBtqiQ5lRfT3hDzElLl77mb0KR6
 luQNoURvEfLlrhnHEuqbM/9YkNXeCKxG+UJ1uJ2xeCkwjMMDL/XaS81Lp
 wSdDIQWUVXEOho7vNqu3UFjQ5E+EORnd9uqq5kdG8KmpQSabWSoclkGcN
 nwI+CMbDb/dxNUXdxsUzwWW731fGw1cVHoq4qmM3RgfHHmbMlKMuTgxbt w==;
X-CSE-ConnectionGUID: Skz227H/RLWU6BD+10MWTA==
X-CSE-MsgGUID: FGbZ/DBNTISx4VL9SMTHKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71659497"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71659497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:32:45 -0800
X-CSE-ConnectionGUID: 3sllxDPJSjaO8mc0Daz12w==
X-CSE-MsgGUID: AK6lVUreRQ6FlLYMuVKJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="252341902"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:32:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 13:32:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 13:32:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 13:32:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7nf7hQhP1dVesrPqVOWSzuNOTfqPZoyxQmkfiYCo8khzB7eT4i04IK5Jh5jkBMBjbbOh82HiU7n4w2KK2VPZf5SGmNofXhTBxyhlZXGz/z+4DgMlOWd71WTDmL7RlxlS7oUPPXmovK1wbAxqLqbUqEgT89h22pFgMHSB43j1vW8eLqk96LZofGL8a9HsFAgQpik39Hf532p2ddJEn6vtwRvc9t6lwbyE16dhMDEd0GDCJXpd5z1c10fK0HJ1MGcQ4miYjqXiRk1w4uREFNGMfEqdPvTE3pPvOf/38hS9/EfeSbsol25BaztWnqbsdJz0NVZkCtwBWOKRuNLluNMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwS0uG8/MTm2PpmlAcoI0RLqTQz1jIHjPLp3w6+NUGA=;
 b=dnRcZghWHKTfmCErXDIVLjwRphKFMt8Q4V7gLxFAcX0OTatlFzNOOMjVSGXfQWmGi9r98lvKFlatbI2r6sUjUm65vYBy66RoQWpEy3PYm6ZX3oOiWWk9TPwYtOmbEugnLcJ0Ho6C/2cuHYE62ph7RpeM7NijmcnFfPMZ6/cdFxq1I/vRW3d/Sfju7p/GRu29qRQLfdcrt/uChZcS2iQ5CASTihvl4Ege2xKN11sXb2OktyhMpYL1+5G/wJjt5shp3Z4WSeoncJmIjYq8haETujlWzVXSRLo0CyuqxVRQnXI2ezt337mX/3kK3+EsDXsvLgYpWNCybBDzHCWaVDxlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 21:32:41 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 21:32:40 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/sync: Fix user fence leak on alloc failure
Thread-Topic: [PATCH] drm/xe/sync: Fix user fence leak on alloc failure
Thread-Index: AQHcoUGBznP3/WCH/0u18YANQJlGH7WJVWQAgAE0l/A=
Date: Thu, 19 Feb 2026 21:32:39 +0000
Message-ID: <DM4PR11MB54560B49E9ECCD802E05DFF6EA6BA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260219014216.2893391-2-shuicheng.lin@intel.com>
 <aZZ84pd1PREju2n5@lstrano-desk.jf.intel.com>
In-Reply-To: <aZZ84pd1PREju2n5@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB8494:EE_
x-ms-office365-filtering-correlation-id: 011eece6-60bd-48db-16c9-08de6ffe688e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?vdBrVRyoQAizN2o6GGWe9tyW1hD7N52b18+X9DoFyciNEVlRGEkysQu3GFcJ?=
 =?us-ascii?Q?fzHxrtc8TqgpqbXgdvi0sNqVRCBsXGIPGh/3/CaAYD2Hco+S9OYNhruNZOJw?=
 =?us-ascii?Q?pwwL3EXW47DvLNtZqJRISVySYiZOLBtiu+W2/3DtIKnmbANzt6ieF2KHe7uH?=
 =?us-ascii?Q?qatGDSHJp9Gn9k7vTOTYbaOZtCXKbnvCPWUs7s+4+5ELLs4Ch/XJgKRp6VTk?=
 =?us-ascii?Q?mPrQ7JtR2sYEoVwZ5F1vaXx9ImOH98gj5paKYT1Mq44iRfxLyG/tg/5qKwnw?=
 =?us-ascii?Q?dkZdQo/oNQ6+Y6Sfep3Jqh5Wd3L5tZgGxnpKGQ8FMuhIXMksPOyJYAFMGkBQ?=
 =?us-ascii?Q?68yuorvBHoFKj6DYDZ5SEe16MLDL6FqTRv8ShmD3v+ACPn7iaie5gPFhJRH2?=
 =?us-ascii?Q?gMiMh5AuhWEqCK1cV9INPA+nh6A0GGjdIhHKlsoiofv6a69syNyPQqKyEwPV?=
 =?us-ascii?Q?/oMdSp1pUOVGUMVI39p5fI3vB9NiGB276vowKJ0fRgAAxr7Qh9AWPVisbYJ5?=
 =?us-ascii?Q?AGSwY2ilaAe/Ua+lEubgPV50C88cAOTGgLm9Nb+sk37BuVqbWUnT34oqbMMP?=
 =?us-ascii?Q?hIbGECdtup1LCeFMkTCPlw5V3/z+ZRKD61PMJFBZeWfT982c0zY5QRxUfEBf?=
 =?us-ascii?Q?3yCl8+kRBpR295qwoxxtS49Cyhu9uzjRxnkzC9uDOCenK0BJiCMBhAGisIDu?=
 =?us-ascii?Q?oL2FyelO/vVONN64JVSlmrTuV50QPJjuMgKk6w4Ktm9syjptF21bdonbwpvV?=
 =?us-ascii?Q?YwofotNyOCmWnvVLVYz8NfcQQQprxXNwTqb7E7OOsKKfDI3QICubCT0GeH/l?=
 =?us-ascii?Q?9I80LVT3Lkm1Kzl5Te8hAd0rzqN2R+r9wYCmA/AgdggvCJkQoc9CoY3mojFs?=
 =?us-ascii?Q?et9MOX0Rzfp9U2EyL+AHxufuoOP4TUg2PtRZDIV5cotVClOuu13m/ZLiWark?=
 =?us-ascii?Q?bJOuJjul5/o+K6zjbnwXV9syT8bYCrNFJuvMjD7lZ9veH+ZD6fTg3bU5bGwP?=
 =?us-ascii?Q?ft6jsLY28bVAtns7B02x/yEGy8qM8O8VS2WKjheE5/6k1ewDHQOUOd9ordtm?=
 =?us-ascii?Q?tY9wEsW17yXDsBx/3PKQXJIMI5WGSgmq1YPvDkSR8mwAuqdUNV6QdQzcmZP0?=
 =?us-ascii?Q?8ENehtfS9MjM7LQnWz5pmP5j2syqoE7/2g0yH3Z75cFrlPRgYomlgvdAZ0tc?=
 =?us-ascii?Q?F3tBB1SLN1f0z00ifYMXqrdwdf1tXbMDYTBoy6Nhot7UnbfcuBLnKQ6D3/2s?=
 =?us-ascii?Q?RYoDjSQvADYmOjOIurXvA0Ev1U1JIOtlaMa3aA5oRj9ALIfpOtB5A+l3y0xH?=
 =?us-ascii?Q?ItApzGUFInk+t8NO49uSsqUX4QIgadm8EbvaEzJuvNvkS7h/XXFJD0FQKF4Y?=
 =?us-ascii?Q?y89UUIYduVorQkeOYroUgfA2iXXJkZIdgVntJuGQ1QIujuSyqVxgG2cfUAI7?=
 =?us-ascii?Q?PgRMxEBMc6hUcTjJIfDpFAkvNpMZX1zWwPPbho2WuoSy2us6L9gIkb5+uwlj?=
 =?us-ascii?Q?WKSiQtY5dLe8tB91Qx/tilWvTXTHHknXdo7StPyFQhdDghQOIJkX7T5ZMK8P?=
 =?us-ascii?Q?gjIZMXUQMBJUJhCe+0T/kPyqZvtBRD//nzDxyXJJCld3eJoxQfh+02hFiOo+?=
 =?us-ascii?Q?ETDwFbuRupjdz5oUgr+AAZs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MHffBK5/KPx4mqgEDaBaHXoyQlrAa4JGewDt7siL+Eyv3LsrUyl/qpm6lj7c?=
 =?us-ascii?Q?Xp4bp9NpwexbaAOkYDDiUKpTHpDUiozvDIJGxLs3XU2rn8HCfg+qOBGl8wx3?=
 =?us-ascii?Q?9jTQ1XjtJtS17B2U06ed+o0tIDNGTbJdzzuHLy2NwgQd1Pm+rKOAVqVdMp9/?=
 =?us-ascii?Q?14Ah+1QDQ1ywJcEJMVfLklliKbAEz62ioxJbfc04skFbYq4AJLK7A76tsX0o?=
 =?us-ascii?Q?HhKvkZosn/6qcIP8KRvAXLShYDO95azJeVtr6mufXpZaV7OSTcHBT2mAo0uM?=
 =?us-ascii?Q?IMqy5AEjwa8XZG42AsKrsIJ9IaLrqT86H+LUBhdCx2ziSHgUz86pc0OQNRVN?=
 =?us-ascii?Q?8QHmjuPG35trYgadLhPBkF8urrb5Yk/9jGsKWxmaI/wgTkt9t+jA8ouNXZiC?=
 =?us-ascii?Q?jPZCtuFQxkewLlttE9K+QNz7UtyMU9kR9IUdsLED0DvcRVfSHfDGpCnh569k?=
 =?us-ascii?Q?V4Xoifd7LY6ZG0l3Lt+1K/kidlQsd/kZtRqU25g/4bR+bhgipYe5yb+RTdgm?=
 =?us-ascii?Q?pKN6D+6iaaiUw6YqxLiG8u5KhHtyt/tXzbpVAzb7oCLxaMG6jYvqtHdFibcI?=
 =?us-ascii?Q?FfO1HKdsgsa40Ngyh41WWCEgyNWKVv2PWwn/FgqDe3ZH0wp3Femf7AyaHcKs?=
 =?us-ascii?Q?OxIvKS+w3UXhVKE/PtZ4ea0AWSIW6pEb9L9+Au2Pso998SsXvsdfu5hOuB2u?=
 =?us-ascii?Q?9Uekk8ZmjPqY6e/9GNEb9trMxRLW6nlfluc5cmFistT7arM89ucBrn7IClze?=
 =?us-ascii?Q?fhp2CR3W7AaT/bbb81ectjmQ+A2CEw2DI+a+8aqGLhBk1EQP1HuhWiBLiv04?=
 =?us-ascii?Q?2TfbBS8v8QocmdkWndkH18v4yCiit4fVlYn8cb1sftq20Fcj2l2cubQYS5ah?=
 =?us-ascii?Q?VXXI1zwj8Z6YpUUEgsvpb0hhZUks60f8izXXr3UNij0f4CNAdklBjqkQaMXu?=
 =?us-ascii?Q?up9t88g9aXxluiE3N331KWIHybEGLeAYIrw8gNXUPW2bv8ysy1uvoWZ2MAj9?=
 =?us-ascii?Q?rG/oiYICPcv+rXmWqsKNrd6nev2GR+Ov5iwEAV9niUosO6LnwFh9BRDqK0as?=
 =?us-ascii?Q?+unzoRWb7Pi903BzL3Pwyh2ayI9HkPEU4CXU7cmhF+yL2samBs8g2RdCi+MU?=
 =?us-ascii?Q?gdXkmb+OEhegw51q9Ui7oExB6rQ+UELt0XBy+taczKkhExBgxEXYF5q7ycyE?=
 =?us-ascii?Q?8fXRJyGU+9zS27eCbNWBk62AcPaEanQCawiS14Hqx7cU+bZ1ZFmz/QIq9fP8?=
 =?us-ascii?Q?cifp/omSQzteEH3opTRAr4tbY2dasoy9osKOiM8EjZ64bEVlIZIMghf/lsnX?=
 =?us-ascii?Q?vqBpQh/ynmkZfWKBE/F5qZ+BxV7cmeKU0OqP16Titakq9hHJRcydTHWJPAuf?=
 =?us-ascii?Q?TFAdUqIbMsi6CeJykjTdFpsN9Hyog3qnzzaNFO9/olkMmzWoBD58irKe2Lzc?=
 =?us-ascii?Q?pTL5nmuGLka1OzbFtDcwyQpH2eOHGkr3ckzRiAnFMO76S/2d9PfV2Wh38zKB?=
 =?us-ascii?Q?FT+XBPG0qj/kA6DRszqXHILWiHTNzI0HptbkyfFWn37oSKhRIYri09Gxz6iC?=
 =?us-ascii?Q?cDOeAEDvaKyuuBklf/IajSh5Eoilud/xcAYWKWAYTWRGp/j/zgEmPJN2I9m3?=
 =?us-ascii?Q?KeFkmrsrlqgmQcfACnEt+MXIEXD5xlqdxY1pjygh16KEZeMeYys5aowjz+UW?=
 =?us-ascii?Q?NiTc3scdVPc/yRmO1uX9bAJS9QPUoVBDA1gyYq/J4XhJdt1qULqOVwx+eO79?=
 =?us-ascii?Q?ye2AVOzrzQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011eece6-60bd-48db-16c9-08de6ffe688e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 21:32:39.9247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmrQHOPXovQYpbxY3lxpeYu+18ivXV/G7Q2w6I6exjfInzdA90z9I5f/01paVmocwZdIwrVXM2zFxka7pSgW5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

On Wed, Feb 18, 2026 7:01 PM Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 01:42:17AM +0000, Shuicheng Lin wrote:
> > When dma_fence_chain_alloc() fails, properly release the user fence
> > reference to prevent a memory leak.
> >
> > The error cleanup path in callers (xe_exec.c, xe_oa.c, xe_vm.c) uses a
> > while loop that cleans up syncs from index 0 to num_syncs-1. The
> > failed sync at the current index num_syncs is not covered by this
> > loop, so the local user_fence_put() is necessary to prevent a leak.
> > Set sync->ufence =3D NULL after the user_fence_put() call to avoid if
> > the caller later calls xe_sync_entry_cleanup() on the failed sync, it
> > will trigger another user_fence_put() on the already-freed memory,
> > causing a use-after-free bug.
> >
> > Also remove extra whitespace in function call and comment.
> >
> > Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
> > order using")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c index c8fdcdbd6ae7..c5f71067fcd2 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -200,8 +200,11 @@ int xe_sync_entry_parse(struct xe_device *xe, stru=
ct
> xe_file *xef,
> >  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> >  				return PTR_ERR(sync->ufence);
> >  			sync->ufence_chain_fence =3D dma_fence_chain_alloc();
> > -			if (!sync->ufence_chain_fence)
> > +			if (!sync->ufence_chain_fence) {
> > +				user_fence_put(sync->ufence);
> > +				sync->ufence =3D NULL;
> >  				return -ENOMEM;
>=20
> So there are multiple problems in DRM_XE_SYNC_TYPE_SYNCOBJ,
> DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ case statements too. e.g., after
> drm_syncobj_find is called, we can fail but the reference isn't dropped t=
o the
> syncobj.

Yes. Let me fix it also.

>=20
> With above, would it be better if the callers called xe_sync_entry_cleanu=
p on the
> current sync even if xe_sync_entry_parse fails? Or another option is chan=
ge
> xe_sync_entry_parse to call xe_sync_entry_cleanup internally on failure p=
oints
> after any internl state is setup?

Both should work. To avoid future caller miss to clean the failure sync, I =
would like to=20
go with the 2nd option, release the failure sync in xe_sync_entry_parse() w=
ith=20
xe_sync_entry_cleanup().=20

Shuicheng

>=20
> > +			}
> >  			sync->ufence_syncobj =3D ufence_syncobj;
> >  		}
> >
> > @@ -222,7 +225,7 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse,
> ERRNO);
> > int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct
> > xe_sched_job *job)  {
> >  	if (sync->fence)
> > -		return  drm_sched_job_add_dependency(&job->drm,
> > +		return drm_sched_job_add_dependency(&job->drm,
> >  						     dma_fence_get(sync-
> >fence));
> >
> >  	return 0;
> > @@ -311,7 +314,7 @@ void xe_sync_entry_cleanup(struct xe_sync_entry
> *sync)
> >   *
> >   * Get a fence from syncs, exec queue, and VM. If syncs contain in-fen=
ces
> create
> >   * and return a composite fence of all in-fences + last fence. If no
> > in-fences
> > - * return last fence on  input exec queue. Caller must drop reference
> > to
> > + * return last fence on input exec queue. Caller must drop reference
> > + to
>=20
> Keep whitespace changes in a seperate patch please.
>=20
> Matt
>=20
> >   * returned fence.
> >   *
> >   * Return: fence on success, ERR_PTR(-ENOMEM) on failure
> > --
> > 2.50.1
> >
