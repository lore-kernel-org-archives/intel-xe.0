Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF1CFC518
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981610E043;
	Sat, 22 Nov 2025 01:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiPAQtbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2535210E043
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763776385; x=1795312385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OurgRgrRUHN8MCEh5FTNXEA5p4iLsbbwiXVcVU4fBHc=;
 b=OiPAQtbgW01rfku1q259tuwXE2/nbuOvHJXC9SaTuOa1pK5E9MaZhw3G
 AG9FoVIz444tTQ+yLBrrjTGMNxc8I71sHN6rUHio7t2DPV2aoLQ4eaVZC
 o27d2P+w2jiGyhcqDDh6G8yyv8Wtvv5vbfcn3aGLzXYntipr3mTRVE+P4
 fByiOJior+qFfWu3tFo6f/FhEIqKy7mO8BF1ViiSOYjN4tCy1RiINhSJY
 s+yYvtDlTyKIEUbZB6nhKErS7tolmjOsi8d+hFwS9tG9bQecEJzYa3h9i
 3NQvpSJpkcOUhTHERSZH1dhbd0ce4IFtDIanfJlysM6UKlRQSkq1y4l0r Q==;
X-CSE-ConnectionGUID: MI/CmtqVS0iusbppUdZx7A==
X-CSE-MsgGUID: FEMNv09tTT6j/DDRFIsqag==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69730907"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="69730907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:53:04 -0800
X-CSE-ConnectionGUID: K0vc/7LmTlGBKLyZ1GZvew==
X-CSE-MsgGUID: L8Sa8LaiSe2g3cVfgtqyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191717837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:53:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:53:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 17:53:03 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:53:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxlX0bVTubTgPo3o+YWZFf4nfy3lgxRd3lbTzwMMflSgXSW1SxNq+vatvNKIUbXxghKxgJytaufMnaq3H5x8g0wssuC8BWHhsZQTPAGSZBBgfXXfOVJ9TTXFeNn4Rq06sMJ3cCQT2aG6c9BIgmyHzW2NU9LuOvf3PddiRWH00mzwn0xOz9y2w97Y7Zzm72xDEsTsxfh2ob+f3xyq0PIkgf+3p4ashHRyNZfJQAsy0HHGb9UxJ+ca4nudqS+FDDT2o32gnu3Ppmc1gzpXcoLhk+XBjeh5Ev8G+FcvXowiPsaW1IfHgK1QO6cv5jfTNTLoo8FC8/581dQtPjs1HxJe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Oc/16xTxevMgnpkr3QVkqF0zN/YmWhBS7bmjcx16w=;
 b=ccy+DFkCstxONdPoZOX4uRaysbKVv5Y3kaUTrdphzLPDALngKpiM46ouV7x61fAutCPl6IYt57QH4YQGFwk2Fp/DFXm5IsRJsu++2WAuMjaj9lVSlLXo0p5onOS8TeXga1SOWTs1Eb9JqdMfbU2CSIMp/8plfceS3uDQP3EoZeebkA9rPkdy8gzqAlK1KKZS4pyZhy/U6PRR342UcYqOyqcpuQsHzTf8Id2D3jWXTRhYcKyNg+ZKoz5cecr7RnhuQmNU8tJRQlUofXaUxuZ7E+g+xK71aLCOfibzEiABxIIkZifi7M84IuBCh/CoA/nEalKCf4Ux1+JyiHnlWHQ/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 01:53:01 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 01:53:01 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Topic: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Index: AQHcWGqSOYUmEJIdUU6XDqgaSmxvObT9ZlcAgABVxGA=
Date: Sat, 22 Nov 2025 01:53:01 +0000
Message-ID: <SA1PR11MB883996BF7F0D1553CC028170AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-3-brian3.nguyen@intel.com>
 <DM4PR11MB545681A0612A0F22E4EFF9D5EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB545681A0612A0F22E4EFF9D5EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: 29887f4a-75a5-4c3a-bb41-08de2969de9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?E5CzLK7IihRVA+Vr7gqV9U3l4lNFSCBciCbCktHPXapLnSRa0OWVhWXBf4rT?=
 =?us-ascii?Q?SJNz+QvgnJWUtLFwb7ojOduipnVEH2PpTCyOvhPVOdVv2+qhPcV6InBLatzI?=
 =?us-ascii?Q?p4FIzXJxdTT2SzcwAUagPXkmEaVhGZf9mIP9HI2JUCclByzbmFRjCuBu8iBO?=
 =?us-ascii?Q?9LBBQtkv1q3egpStpbGt8Tp4opsGIjSVqVxLCU7Otdx6pRoDqjUpUdio9b0a?=
 =?us-ascii?Q?CxS1PLb8UcPaRrRAQybFiWfXuEFtHXEPv2dnI7QVNWzDgQZYnxg9AHGef9SW?=
 =?us-ascii?Q?RVOZqhgKzjAGUPrznnzo5ecILlhlPWXJ3NSckuf4m1uAfLLdAMBPo2BfpMnD?=
 =?us-ascii?Q?47zltK2cKxF11IFX1UmHoppXfaJysxi9vKBaW9YS0N6Wnt7hEmGlYS4qjS9h?=
 =?us-ascii?Q?3FrLShGq8ghd/NR8yhLkJUnKjPlUiKyzW1W8cHo+4zMIYKGqEXgb8aO8m6pG?=
 =?us-ascii?Q?ysXhdK2HGT5FOR3lIXnmWIQZHG3je9XAQpGD10cN+ykTcpcXOPQUSUwrKuKu?=
 =?us-ascii?Q?+XOltzdrcvQr9bLiZd64Sm48g3H8DiIgfgfYbn7muNraAT1ux3Ag5BkZbWpA?=
 =?us-ascii?Q?5XVHVV1JtQq1wa/MV7kRHCkwxl7W+HRsXpIRSly/PSF4t5HNgW6FiU+ga73z?=
 =?us-ascii?Q?9I2wEFDhya20Cj3+bZ3xLd2J/WPUByKars0u8Q1FEECrUSW1UCivhS5fxL5C?=
 =?us-ascii?Q?rjYam75BN/gMVvWxYWvCQFmlTvXjHEyTSf8pPFnM9WrBTm1/LFBuynBALZLm?=
 =?us-ascii?Q?3fvm/U1gDQ9buqqJfmWG7ku5OCYd+UGByIv+uw81W7Qx0iI/giYxKlKP4Ccx?=
 =?us-ascii?Q?+4pX9nURFE7QOlX542HmRFTVz0rFYQqOwHgMW62BLdBjN8dOF8TFU66SMHP6?=
 =?us-ascii?Q?PvtzO5drx6XiHhg5tm3ZOKJKC9U4uZSx3A3/5ztoVy0kW159R8gi/+UvvRco?=
 =?us-ascii?Q?8fI9Fc1puRih0Nna+tRqdMHN9qf74KswR+9TDNivo1SJ0JbvHZRJ/JTacMiB?=
 =?us-ascii?Q?3trdrHK5ZztFug0JDqGF426NYLb0r7ZfD+PwuJ3GhbQV6AlWYryupnuT6Yhu?=
 =?us-ascii?Q?OZgVTvjxjAi7Zkh8YZVxXMrPIo0SRDMO0IS9px4HLA1JYQsvon+aaYtNNgsc?=
 =?us-ascii?Q?YSUyH1XcYfY80uYM8/az/h4NiHangFdpwXzieuYE0uGGrdsAJhn4Z9pnYl7Q?=
 =?us-ascii?Q?FuNIZqhTnxKPd5MxLLcSqE23PYdOvLJ0rKiEWLGa0Yoo29TekBkmleUBQzrK?=
 =?us-ascii?Q?3NJiTuFsNFV5f/BLgCoojekqu2/D00BfVG02/AZckqWoQ8wEXyKvFI/GIkgQ?=
 =?us-ascii?Q?seryXKKeTtMreSpwVIsdj5DspXCCft/0hf4gYJdbdtzPk7xtAaI1aYbc2e15?=
 =?us-ascii?Q?b8d094j9NVqvWvhaMTjOsIrQJcc5rGfazXJ5nmDMaPcU42wFDKxa6LE/BeTp?=
 =?us-ascii?Q?YiUtXfc1I5vm0mEQD9Vtmrued3g9ZY4JMNGdL6LiGyLVa1MtD7BKnQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WnbrqHV2n6fTTHJmjurhgqg1QRTeNN1+7OoSaSAT/KqYwcSYVy1MbFVQ/78+?=
 =?us-ascii?Q?mdGCDSE/8Q1y4lzCKGyaZjGNwOb4QgRE43QUWyovt57k9A/fUy1Kd6vowwVF?=
 =?us-ascii?Q?EHeI+NUoUzOqImkQvx5BJwudchbq7DG9qr4rL0XfldmcDfW3znH4lhOvGsDn?=
 =?us-ascii?Q?Bw2z7AjfrAcs5v89Yrir/aBxCjBebAjnCBhC9PCF5J8suD0MHMrbi0Mv1KKk?=
 =?us-ascii?Q?0z4yIoydsrk4FCJUFf5rZWGx/wKJ6IbA7RG3q7lDY1i/TdQYTBzcUhOi8ZA5?=
 =?us-ascii?Q?RUfSE9kFPDRx605dZz2UIYEEsdWL65hr7b54jpPR8e5rVhOihMkTDFFzgWEx?=
 =?us-ascii?Q?awkQo6mAB7Ixy3PSVLH3XnqRQwwzG6grgKHzzkbbaxac4kx2CdhvK5LpdUIf?=
 =?us-ascii?Q?5ygWksmXmkdy/M1c4fUC5kwmQTKEqOHtgdoHePoL6LS3ExYbcT/+PL7+lybz?=
 =?us-ascii?Q?YJjAu6V88wmnJtfHqBM67KDm3r65xZ7p3iff94CF9ZNDDpAwXVOXhT+D5lEn?=
 =?us-ascii?Q?1hYk1Q5YP6iEeOEq8oL4SKbH9gqMzr4VV78f9eD/LyTbajcDrUxqmqS3rhW/?=
 =?us-ascii?Q?ThbeXeqF+VjGe2fZKdT23ksOQEORh2g4S8e9gMns5Rte70YHWjtVkNL1OxOi?=
 =?us-ascii?Q?XBUZWvZyVSrbI6e1kfarS1tC1bav1BJhNFKIIuE+tGaJU70+kGNirOa79RqJ?=
 =?us-ascii?Q?I3TvewfuCABME8QBqdVMxuwWLGfS7YaCHkaiyc1E+g9sABbaIwclnwzLmrD+?=
 =?us-ascii?Q?raPYofGOaUSiAE279wHjUGJULJmK/N4jDKLN3kYrxy73PH/O9EAMTpiH4Oi1?=
 =?us-ascii?Q?mdQZXG4Qi6AbagOhLaMqNCnERlgU734XrcRau7GEVDlfnOvtCE608aHDZLVo?=
 =?us-ascii?Q?moqg9eaewb3Sr6ZN38YrYfcNny4tB/S2gxfIYFdR9WHQJdVl7LCoM0BoEv6p?=
 =?us-ascii?Q?BebXrUNTjqiILWYSKrCv7eh2t2SHa2z5shCouVfIfot6nZzaN74BsxLjhZ3c?=
 =?us-ascii?Q?HY7Sk+5BZpTMpj2Sj/7k7rRtM4nklqtPd0Np1WJ9nFMR2vShjWawnGLQRw9d?=
 =?us-ascii?Q?uadQ2yMM25OTu+B+f06ETEBYgeN/qGSRRTVIa/d1BMQvat9pcsjgiFWgPvCz?=
 =?us-ascii?Q?5mLEsmfGtRCDbYCP9rtL6uHXAZr+l6wMVjLfMo+vrSR9D7hPGl+r7QyY6HYk?=
 =?us-ascii?Q?/vkrf1Irz368RUQ8fPw+vna304yA/8vCGtasAlPYrd1Tqk0PZdyUqPHG2C8f?=
 =?us-ascii?Q?ckrAwlbQuOleolb8AW7mwOG6NwaVHCyBIfea3E9ABnqmMPtsAuVp7r7dRCsu?=
 =?us-ascii?Q?85EIlNAE1bRMlxNkpFqYUSV8uZPaxzCRSxZugTrZ+u8U+3++WnBu1WZzwh6k?=
 =?us-ascii?Q?dq6oAXU33SdQbE7GIlDdPdsvC/bcyw5UQQ+AAeyxnCoWkHRw4YvpPX7AcqmN?=
 =?us-ascii?Q?zAfh++E3tlQeolinM8jem5Gf5qh/wVVUnljLbVIEa1IXi+ASO4LqJz6Skduo?=
 =?us-ascii?Q?nJoEex+4L6MAElSWb0XrPJ57Pbai4kPYXDCkI51/dKhRf3wsCuuIYdsIjOkW?=
 =?us-ascii?Q?rxwNUm8aS7/Rnrxmzp88uZJRUGGyg9dqa3VoPFvm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29887f4a-75a5-4c3a-bb41-08de2969de9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 01:53:01.6123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NauO7osTIWR0JkYdtwlDgUOxMj2r6XqejCmWxn1qhZ/7KAZRTMAbeEsbD+XjfaULcDQpvaCjR+vm59EiIlHaFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Friday, November 21, 2025 9:24 AM Lin, Shuicheng wrote:
> On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
> > multi-step TLB invalidations, so reset tdr to ensure that action won't
> > prematurely trigger when G2H actions are still ongoing.
>=20
> I am not sure should we re-use the SEQNO_INVALID to indicate that multi-
> step TLB invalidations.

My understanding is that SEQNO_INVALID is already used for the
intermediate steps of Context based TLB invalidations patchset [1],
which should also benefit from this? Since fence request time starts
on first TLB CTB action, it is good to reset the TDR on G2H ack.
GuC processed through one CTB action, but we are waiting
for one or more of the same timeout durations for TLB actions,
like page reclaim sending 2 CTB actions.

> Before this reuse, is there possible case that the SEQNO_INVALID will be =
sent?

SEQNO_INVALID here is used to indicate that the seqno itself
is not possible to get normally, so it should be fine to continue
using this value. It is the purpose of the addition of this new value.

The other possible case so far is done by that patch series, when
multiple TLB invalidations are sent per one seqno, thus every TLB
invalidation action except the last one has this SEQNO_INVALID.

> If yes, we should use another value to indicate the multi-step.
> If no, why previous patch add the msg[0] !=3D SEQNO_INVALID check?
>

The previous patch added this check because we only want to handle
the tlb invalidation fence after all actions are completed. No need to
call the done_handler early. We are just tagging this H2G action as
an intermediate operation so that we don't ack the fence completion
early.

[1] https://patchwork.freedesktop.org/series/156874/
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 ++
> >  drivers/gpu/drm/xe/xe_tlb_inval.c     | 16 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_tlb_inval.h     |  1 +
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index f1fd2dd90742..cd126c53faab 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -238,6 +238,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc
> > *guc, u32 *msg, u32 len)
> >
> >  	if (msg[0] !=3D TLB_INVALIDATION_SEQNO_INVALID)
> >  		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> > +	else
> > +		xe_tlb_inval_reset_timeout(&gt->tlb_inval);
>=20
> So SEQNO_INVALID is re-used for page reclaim. And for previous code, this
> else path should never be hit.
> GuC will not set this seqno to SEQNO_INVALID in any failure case. Is it r=
ight?
>=20
> Shuicheng
>=20

Yes. Existing code before context tlb invalidation and page reclamation wil=
l
not hit this path. GuC shouldn't be modifying any seqno that KMD provides
it in my understanding.

Brian

> >
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 918a59e686ea..50f05d6b5672 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -199,6 +199,22 @@ void xe_tlb_inval_reset(struct xe_tlb_inval
> > *tlb_inval)
> >  	mutex_unlock(&tlb_inval->seqno_lock);
> >  }
> >
> > +/**
> > + * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Reset the TLB invalidation timeout timer.
> > + */
> > +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval) {
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> > +	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > +			 tlb_inval->ops->timeout_delay(tlb_inval));
> > +	spin_unlock_irqrestore(&tlb_inval->pending_lock, flags); }
> > +
> >  static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, in=
t
> seqno)  {
> >  	int seqno_recv =3D READ_ONCE(tlb_inval->seqno_recv); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index 05614915463a..9dbddc310eb9 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -17,6 +17,7 @@ struct xe_vm;
> >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
> >
> >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval);
> >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> >  		     struct xe_tlb_inval_fence *fence);  int
> > xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > --
> > 2.51.2

