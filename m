Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9D1D19502
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 18:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64710E247;
	Mon, 26 Jan 2026 18:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxyNuLK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CA710E247
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769453339; x=1800989339;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x+e8Y6mO9MLxESAVX11RWvzb8XUnsYBIyTlqwjCVBoE=;
 b=ZxyNuLK3WA5qOofgdVnf9SluvlWOP92Clfn+fX9oLhVine6Oi+Q+Rfwl
 qVzQUzvsKIKOY5f5OK1j/2D+6q0fzNbOmQZXikNMXjGBf1kTtlTL9SghF
 GGAbxwQMIdejCH4l59Wu7qsoE9MWmSF6MDQj2PSfnIa0pN80POjOp7fOm
 Kj9+4r9truJSNlhpHQBtFWM8m6SYP5Y2ETIkjIfvlomt4J8VZEBVLZVpb
 xOdd20Q9qijxCAQxQlN1bGWFYAG4bEIqhXOhmy223PQcF3S7wwgTjzyuf
 UFlG/ycWnfDO/laqsKyG9TMTlaGP+YtBgUffRWSStrviiauuGvPmXFByg A==;
X-CSE-ConnectionGUID: P503DVozRIe7CSIZ+CMQjQ==
X-CSE-MsgGUID: s3On/YgqQ7Sd0pteOWFpYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96100157"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="96100157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:48:59 -0800
X-CSE-ConnectionGUID: 8sj8vzsCTaOHYY0X8r6soQ==
X-CSE-MsgGUID: WW1DQmRVRQum+8qv3coKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207811143"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:48:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:48:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 10:48:58 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:48:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rpz0ubA3nS+x2avsZnyA/Cis7J7yDAbWegtqRRR+UESnvxa+HJ+7wzz4nxXhJEeq947TB0hwWjZclXap5127gXifGUPxVpV1mr7YNHw5mS2Z7YhzXecyD2/w2gTwaYqcckRcZaOvEUcXTlB2kKrSl07YcJe+XhNzuKXMxVBBR8rcKk88lJK8odkBD2J94rLkpvEDfcSRp0A+G1YvOh/YXCu6bHng9lqZsdgUEf0RyIHBcgNYRHVH/yCn2bOoTg+fZpu1D3HKtopZFc12QXhPYT9v/DjGtDNobs8nz7DBgQ2qnmzDkr3wMs1rqhIRNP8VAj4/cKfil8g7waX2iBzx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgqUiyOX24cKvL74Xjdy1OM2EhhUL8FX4g/2WcC5EsA=;
 b=fYTnInb9yTwSQXlJv0s6hczNGYRYyo1qeHy03ZlEqq/2CIutNYEIxclMtDzhtbtCLxMf67sNrZPCfpAY0cack7rERI7gLZWuIRodzeSCaNBlOEgzrUwfUigQuJx5+b2xomk4gNF0+IiGNBJDKu0Jhwj4OzY/shR6VeBjfUP3X6PGRkFxRQp5KqDhBJkK9r2nRaFAYcqamrxpdVxhtQrAqSGxFoMEECfxOcMVe3wYcESz1brm21Cj8+WTiJt7eXKnCxgTQqoBvH9TO6MDyuXIyyDfkiL/xdYzyCRLLxXMprYZfzMPFUFFjqk3Jwz6lizytHP+0hzWnxSQTw9JZuBWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 18:48:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:48:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/3] Fix nvm aux resource cleanup
Thread-Topic: [PATCH v4 0/3] Fix nvm aux resource cleanup
Thread-Index: AQHcijuaCeotk17sF0GMOWiCk4A1xLVkr/rw
Date: Mon, 26 Jan 2026 18:48:55 +0000
Message-ID: <DM4PR11MB5456523D9A7F25AF5A98FF18EA93A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
In-Reply-To: <20260120183239.2966782-5-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA0PR11MB4623:EE_
x-ms-office365-filtering-correlation-id: e87e6e15-3aa4-4cd2-a6c1-08de5d0b8f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XjO4CkCNxI5ng284Muxa+u6ZYZCKSevntZYUfkrZjk0/QSmMQgKTeU0mvN2t?=
 =?us-ascii?Q?udaMij0q06GOlnNu5OZE+SVPkKxPUBAed/CmAgXXPg1eaevAKlBwjg180d5q?=
 =?us-ascii?Q?Nqql4ufWgx89DFvcR4zfphC7+xOuoMipI8NcOqiGZ6ttkUBJrzxqaNMikkE/?=
 =?us-ascii?Q?MW2qI9XOya82JosKGR5qj9tKfm2PIvTe6O/TKMLQmGzgYIFWNFF4Y/HbErh0?=
 =?us-ascii?Q?/WzCxGSRdPbRgA8y8QFylOfKsIxtkvUF9HEBJFvKiWcoY6JQxd9XSeXByy+W?=
 =?us-ascii?Q?oYDbLo99iLIibVT1XmVUyqdUf3hnctmF/weTbFtZaBmE3C6DkmV3xYWv3CNx?=
 =?us-ascii?Q?Yib/OSg7ZSZX1nZhi/7Dr6KoPJfH7AZR+H6MudR9wITTpJbMe1rwRjZaxv+j?=
 =?us-ascii?Q?059Dn/aYUl5tWuZQKpEwTMY3vdxFXMlGN/0qtZ6E9AenilQk3ojjgl6I+Euh?=
 =?us-ascii?Q?VdyO3uSPVawvbyF4pq8levhIqhNR1KdEVYUrXjW7RAJabxnPpxOX2Td9Y3rd?=
 =?us-ascii?Q?Imm/CJARg9XehSu6aU+t5Oul+XEaDkAlEEPep0eIzndSJRfnYrzpbTtS3WBc?=
 =?us-ascii?Q?hNL3MSMIdYP0Zz+g2UgedzNaq/n42sX56pSqhrWzpNEaIRcPb09AGFBBzZ4f?=
 =?us-ascii?Q?Ssu35EZaK3mgWoV2RikumsN6bzvYOzuIWoKK9pE6aDmcOFHVjCJgfb8yX09F?=
 =?us-ascii?Q?kSFbkNfwwAGyCh0rT3xhkmQZnmQMRAk5VfI7wW6Wy8Ch1Ne/G7+jpbNylzDW?=
 =?us-ascii?Q?5JsdxVEpCng/1ZCY5yywftI4U2Adf+tSs7Wsc21td2OLKg6Lczwm/xP80zeU?=
 =?us-ascii?Q?LJ+4aKT+0jrYsJP2J8KhF6caiw9v6YxWnQngjIwmJFdz7gCEUw1EtoaNLtib?=
 =?us-ascii?Q?07TpzHk8JsF/hg1bmrEzxYB+679YhaDAIzpE4gw7/a36jYDqOuwkP7kKZ+PQ?=
 =?us-ascii?Q?zkUlg6cqqoyj+hwq//oiQzjg+jaTUXdRvZ61tVVfE84IW3METZgDnoMzULAq?=
 =?us-ascii?Q?3uXzuvkZQM+tC0ni3kR8YXrHqJ84jNEiZ/HZS8ZeqsNC8Y5X/K8c8iDORkKC?=
 =?us-ascii?Q?npl6wJbELu6fNDYGWadpPxzBIkMgPMosIdspRUaNGAueqMUA6aFcQ5/+CJ9F?=
 =?us-ascii?Q?xl/bmMShgFu3x1Oga5tkKDoBqt/u02VzqVDOBu6Zkz8SLFRKvw8Snw93wPWI?=
 =?us-ascii?Q?PByZM9BlItxmMmq/V9oHx6fQcinbzOmjhbpcnw7dcaiEY0tO3occprPvKS/p?=
 =?us-ascii?Q?eyDVHuenOCxTLeNkihP/TViAuPxfDlh82UFaOnFT3mptOf6Ux8LcDnLPJQjm?=
 =?us-ascii?Q?Qj1N/ctCovQoG2RXb4mcEh+82ZYwq6dMhL2zA/UQAtGKzzsxvYHfxI5K8jMU?=
 =?us-ascii?Q?le3BcfZknjxTEDpdn7AQbbYbb9ecII1tbMiC2w8qGsTcIjhECIIPdyDoS3xm?=
 =?us-ascii?Q?IzYRFlGqm9/qNW4bwth3i3BDfFpWED8YPTpwUw3Gp/t1djLbGnZZuiD8ZkK3?=
 =?us-ascii?Q?1CJOU+vQceqH3BLUGQJtkc4KqM89L6Z4qn5uQyeC7wdJbc+dHsEdFGCv8API?=
 =?us-ascii?Q?DxBo1Nfw0meVtoQGASk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uu/EOsrhFH+yaqC/oJlC05xOPQTQgb5pvavxeOguPtF5FkcvP0nU22vv67X9?=
 =?us-ascii?Q?XL+QMjCJCcSCR3b/VJRbXI9ICMf1gi/qKLN8JFgKEEnCTh+YV85pdZtzppeu?=
 =?us-ascii?Q?2/PsC6VpkDzYvVYr58F4VKeP+ocPN2kTPirsFyfoGfCnnRybN6/OGiDHneag?=
 =?us-ascii?Q?TyR/iR62lZxFVHWCONBko+qLOuM1kVXdMvqydqEvU5bdGSS9vvlpMN6+V5Pf?=
 =?us-ascii?Q?Y8L63N5ASR0Xt5bmXw7mqmSpbfqhvLV7HvozdvwOsVt4Cr6IuNL2Pl4bf0KB?=
 =?us-ascii?Q?0B+hVpGXuNLoV9wQF3i31KVFoKf1I1qXadYCzrwPaaZab7ZYdOVxdd/aAZv5?=
 =?us-ascii?Q?zLZ//fFbmKG41ZWH+7eHOjAGrcSF8sR0Kw7znluq/pGb+zJtENvNglnVxlVz?=
 =?us-ascii?Q?3Ya+7aBqeTrIkBhSst7OjfPBCidLJUMYyZq/juLyhwmnZ/gSLLkSIAhcZKs6?=
 =?us-ascii?Q?xwYUrRr8Hx+L1h8A/VU3isPE1tiAvA9UUZz7VAFG0gDM3hAvO6LZ7E7xV9Rl?=
 =?us-ascii?Q?vMpmJMTucjN1IukwawX0g5SHUelJVEMqCn8Gq+m8Ot3I+/lgxOLaiT7ySqLP?=
 =?us-ascii?Q?lsZLxa5KtAf8XIDzz3W42/scuSeL0eL2jiWkV/T73WWW/IXrYRtsAkIqnQEW?=
 =?us-ascii?Q?WkY/WQcFl10Vm1ors24PObWPeC5Z4zv7p4YVNsXq2z1pr0IkmOtcrR4qEQQq?=
 =?us-ascii?Q?OveXFuQnNd3IFwfIbO7Jw+UoEoctRa92CiSS1XaY2j+YcWfd/T+1zVjKtCgb?=
 =?us-ascii?Q?/iUE1vwQ7BWgbPUqQmssdZFVBQKKk6XL4WSjOvcRYIZ3p9KNsULU7ZvakCnw?=
 =?us-ascii?Q?f5eytR4R+VHf8MztG8bJcgnizHS9ODqRipskgNTkV5KQS/5BciLam+PEENUp?=
 =?us-ascii?Q?wP5m1/woXzPlx2UUM7kt06571OtCmuRzLdvnyOjnLRyQ4AjogIMCzvsSM+HY?=
 =?us-ascii?Q?FIKq7lTDdkIzTQaIkZei31ZJ5akHHtKrIx/i8w4QcN6el10pe95fj+m3TQsg?=
 =?us-ascii?Q?BoLsZrCLnLXOPxKmv6zOVov7yUBLPyTdZ9hRRNYDFEr7JxbbUczqiycr0Y/w?=
 =?us-ascii?Q?aYy24Gfn2S6phNBjHT5B7f/IPF228J9N6dGraJPOL9bAlQjTibKEnW3Jk0rC?=
 =?us-ascii?Q?ChLKQ6a9iO0PH1DqhAMcdOl/xq4lLK+pGKPI9p3f1+QrjF1s6aO8bjkdY0Vc?=
 =?us-ascii?Q?XSap/VarPdJD9vFqjo35kraYO+0QofQqDPnnB8qvGYPBKxOxPs13SEwinOac?=
 =?us-ascii?Q?ZuLw9XJpD+YQfY08GW2NgVPr9smsN6r8VI8dfCrMR31eV5HvExI8YOz7n2XT?=
 =?us-ascii?Q?TYEtNzupgxBURqirN6o8pbr0UBVUSwYmQEvmNI2nOVTUKscUKhdVuDyxX1kQ?=
 =?us-ascii?Q?bxIHjdGMK0JBpPVu3SvDvoiDrDkwnpOY0/RBdEYepq1Aj6RR4Xyedr+harcf?=
 =?us-ascii?Q?y+jAOzxalhfv+Bo28n3jcjgh7L7jZeNwR0z/OxhAJICvPyuNK0D9cJi7VLz0?=
 =?us-ascii?Q?Gym1qgyh7q+F+TazGLRoxR74SXB7ov0HBza4Kk/8R5b4oV4Izg4zpIxuKV8U?=
 =?us-ascii?Q?WYPG6cFvYJ2tvmZKX6eeDyiafk4+mOgbcBnZKJDF8VgRR4LpMxfZS23AYKnv?=
 =?us-ascii?Q?uf8ihzlKBDwu5HGmTeZ7cu5IBvGp1MBx/pQwujZ6OqH23WhscnXXA2RV7UIW?=
 =?us-ascii?Q?lpktj5d1kYtgQK5lj7x6nnRq7gzfE1IEh+t9PIlHo9NRxguUr0r2luAtRz+h?=
 =?us-ascii?Q?JByBm3Wn4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e6e15-3aa4-4cd2-a6c1-08de5d0b8f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 18:48:56.0132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fACO2K72QSlkzgBJrwbEurkYxU8LJQWZ+sG7RTM/n2VFWV+j4/IqL0tkyQg4tn6Dtoro5Rac6kM0JyuUwDF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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

Hi XE committers,
This series has already been reviewed.
Could you please help me review and merge it?
Thanks.
To WA the patchwork patch apply failure, this series was sent twice, and th=
e latest patch link is: https://patchwork.freedesktop.org/series/160376/

Best Regards
Shuicheng
On Tue, Jan 20, 2026 10:33 AM Shuicheng Lin wrote:
> -----Original Message-----
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Tuesday, January 20, 2026 10:33 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH v4 0/3] Fix nvm aux resource cleanup
>=20
> v2: create patch2 to "Fix double-free on aux add failure".
>=20
> v3: drop goto in patch2 and create patch3 to drop the clear of xe->nvm.
>=20
> v4: re-send series to fix patch apply failure.
>=20
> Shuicheng Lin (3):
>   drm/xe/nvm: Manage nvm aux cleanup with devres
>   drm/xe/nvm: Fix double-free on aux add failure
>   drm/xe/nvm: Defer xe->nvm assignment until init succeeds
>=20
>  drivers/gpu/drm/xe/xe_device.c             |  2 -
>  drivers/gpu/drm/xe/xe_nvm.c                | 59 ++++++++++------------
>  drivers/gpu/drm/xe/xe_nvm.h                |  2 -
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
>  4 files changed, 28 insertions(+), 39 deletions(-)
>=20
> --
> 2.50.1

