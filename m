Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F5EC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 15:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6C10E4A0;
	Tue,  4 Jun 2024 15:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZjJfKzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71510E3C0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717513258; x=1749049258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zOkZJ9r5IY8PszfHPlaE9TeiJsYkGqgxOp5DeY4LY6M=;
 b=iZjJfKztXSSgGnBrCh1CVUZo3/X6BcDVA4QjVs8yFSbFuGy0hqWurJyx
 nPFT5TTVS/K73BZ6Lh794UM7hsDYVPCk9Kus1jKf2uUwBtvWwg/gl0cl3
 KtRQ7pZ0cOHpXVB3g3dYEV3HsOmJQto/jtpJci+0UlonoFAHRF6D18dGj
 P2UIPqMTJL1vzFGFCl5vy0lAw7u5wYKA2k8/JDOm9ulOIcIsQpxpmfeX5
 6rxLsz9CU4iaiXHr96hevyK5wV2M7HiMWiXW2L2pYI6pWdGD2fZ57/Pct
 8+Kn+dRhVf+gUcoKV+Oz6KSeYTwgMGmtWl1838mCl2aes/QUPBA/kSZHV A==;
X-CSE-ConnectionGUID: o47qriSPQrCpkOfOUs6MHQ==
X-CSE-MsgGUID: l2Z6sPonTrWE8jichGCDyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17003136"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="17003136"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:00:24 -0700
X-CSE-ConnectionGUID: eWO0WNCOTqmSBL6r5QtyeQ==
X-CSE-MsgGUID: e235zjCPTFS6oZ++XCcIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="42205182"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 08:00:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 08:00:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 08:00:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 08:00:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 08:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2199kCQp/y5To5xYN+gM+vccnErH33RzCHg/mF+Ncka5g6zzp01l0zNYuH+rtuxBjUuMV15735BvEJiEBDYxCDaVjdNj1wTjXQNEYHXenwZG/f3hCevB7c2YJEM3lZ5YemQQG5j40aW6CCxRYM/Eo6D7y5zyOIEQ/J8PmLiL+Krti7nmAtRUqp3vkLoVWRfiPXJ38jBtAnglaH+E/p0ndDCtEU+dQrzARH6BxZrOmfKGJSC3JLpf5P6amofIb78ROkzQgxI2Om/RuGz7sQFCPnLhoW+SyAYoTo5pwSzbBA6/wAsjaeyuyiaNYNpkTyeGK0lcH0RxeNmHIuUpWsGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ze+pV/FF9c6MEpKzU6lfYOJlnPYHJesP+/tN5BT4nc=;
 b=TTiZfsArRCk8JzmAKVBksp9P8H21CKklyoTws0TTVU38C4S0+eNZ1Jry1B6NRtab7NgxtCd8KxZEtjc+pfPhqeqLO6poLL6k/f6pZhd5M3w1YfPxR0z03eokMubeTirFarRA5bkZLRMyPEAaEvQhSk8jV1sUqapSzB2pKtkQCWcqPLZwIyvy8dApZzxjAhIC77baP4Yadhi7bBitx6fNcbWUsFKtgh26eMMNqV8FEptzAi8+3KP7JtjEX0/U8R89wpVeZVs5MSBogcii0vQg0EF7FpbnWE4ncxswoTU0KPc6LPtW28luWdl6QPLQhAlNSJFvQZz+ZzSMS719w66a8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 15:00:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 15:00:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_submit: Declare reset if guc stopped
Thread-Topic: [PATCH] drm/xe/xe_guc_submit: Declare reset if guc stopped
Thread-Index: AQHatfwDBiCrPY1IjU+h62+nBndCeLG2ofGAgAD/qFA=
Date: Tue, 4 Jun 2024 15:00:19 +0000
Message-ID: <CH0PR11MB5444525016A893A1369102A2E5F82@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
 <Zl5GO9ETvpzwfwbs@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zl5GO9ETvpzwfwbs@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB8292:EE_
x-ms-office365-filtering-correlation-id: 04d184b4-8cce-41f2-84d5-08dc84a70d56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?3JVOJGogW6IgvnsaPguPucqoWvm5ya4DXtylB4X4GB1Bug84ME+eZuSHc5jU?=
 =?us-ascii?Q?P6EVwUye0KwE/FFdOBkMSMZbMnBxX6o5mTzGpYCblZUWlQh503oslq1iwan+?=
 =?us-ascii?Q?z+DbArW6DlHRihFOROm9EH8hu+lidMDt1dNVENHyY69UtNWC34ria2xthco3?=
 =?us-ascii?Q?wUJC3bx8MtgBMWA4T/+BatpO0bITOzXvtwDwdLQipHsWeXQ7aASkDjAjX7Dc?=
 =?us-ascii?Q?I+VCiTfUfMan6wu+1UtW7vXx0xzuX95D47fo/1vDLWb9Yngh49jgH3V+8u9B?=
 =?us-ascii?Q?rXQWduFsOeRPxBEPhUJyCC7sTB8m2jd33Vc1DJaxtZIyJCOT1cvfmLYmg3IY?=
 =?us-ascii?Q?96jy+qpQLQdTm2h6QWHPAwnSRAleTgm5UmY0pz+ahkZNFe7r5LUjN6I9Fr+y?=
 =?us-ascii?Q?K3MDV8UDN+dJS+fmspXWOyME/yZcdS6oeMfSB1zG3MlOmddMEl72gBRbnkHj?=
 =?us-ascii?Q?8txMbXALd3Z7BDwQnrEpq4yH1axEArUPihnXRC4UTPPQGzRbPxD2CFnXTLKa?=
 =?us-ascii?Q?XIQbzuaRBCCjBODbM9nTs7BTmg3+PsM25sUA3s2aUni41+PGPyUshOgtdruw?=
 =?us-ascii?Q?Q6dh+myEBap7lIs6os6d/dW+4uI67AXPaRpXypwBfMqTHaCyQP/fN66Ochum?=
 =?us-ascii?Q?Jd13NqYiMFhqqPJG/Xj1m0WcpCQ/ZBE8Fb3ZvOXuHr7iT6OCv1xQ3XSNr/5m?=
 =?us-ascii?Q?cKakDNM/slYSJwg5m615AZH6wrB7hQh2R6cHiLZtGCQzZLxBWvMlOfunUrsE?=
 =?us-ascii?Q?1UwXVfI0P4Ctuc8fSzkCgfefOfYprucM36CfmQc6HZPboCKnbojOBKu0HYjL?=
 =?us-ascii?Q?dJFllaehfP5a+nk+A2hXcr7CVWE7vAfi8ci6cqDtlivrMiTw1O4lsXC45GA1?=
 =?us-ascii?Q?ZpFoGY+eeupSjLvW9wPmMXIWrOqiXKwyp/9ok3S8BLGppn677qbZdsuNZzIC?=
 =?us-ascii?Q?O/Ub3EQ+ekObCHnGxpA3wa3LdmWqSygNjIXMI1RrKFiYnTOmKCQBNRdh+Fyr?=
 =?us-ascii?Q?zLVyIHxzTA1/BeyZQQlOKrF5silysC/m8OTMG6WpZu+IkEFIx7xYbbE6u7sy?=
 =?us-ascii?Q?A0LGUC9+smBiDyqAVxlchgN2weEjINteMzD062pb3g03gATNDInkpbsM1MiA?=
 =?us-ascii?Q?16HnPdiFduw1+3mP7AUGgdBJmwWqXY4X/zXRvYk4xne6d8MGYxb8lSOZ4cAZ?=
 =?us-ascii?Q?V+v6mCPReRwGg2Xj2MJEeYQZdhVQeCZ7zskKqoeZwtJETVDn6jdXIafCd+NS?=
 =?us-ascii?Q?q8AWOA17e6zkT5IUUd68BexCcLjSD9i48fnHGBtKgnXsiZGz/HaszlwUIUiW?=
 =?us-ascii?Q?4VzQS1lTcJrVRP4WAwzAU5amy5+rm62619J3Dt6WesthcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ejnwRcOJay4u/l1V/aspA1KiRlsTIdAWjGi9D1BxJSUND43RUBnOVSSbs+Br?=
 =?us-ascii?Q?dnpqFXcx3tgx1kVHZ6cQTaISqi38VyVbRakNQKpuIMmGE6Ws3pxk6JXpYvMj?=
 =?us-ascii?Q?0mM2x5QOKRqM8AVrro/Inu2o+KlcoyumJ8qtyg/zGSolWug/dp/XncGEG8UQ?=
 =?us-ascii?Q?5ptZtGTnELsfRTeZHtJVVUv0nMpyGABsQzvjtPs+/CJe7bALX0cF0VRsmDfi?=
 =?us-ascii?Q?dLeq15qRQh+T33Wwhh5IGxEC4+yVDLdZY2OtHrpXPtuXscJ9ZAW8vwBdwvm0?=
 =?us-ascii?Q?8JmMYlBUnyWvGiAWiNC1uYQhNdgfnW7pTDSOGYT7jqmF7SQoDGXO+sJC5g/z?=
 =?us-ascii?Q?llOliaqke6HoKuN7cKAhcuJvp4Ww7F9w2UNujR4Edj/+XLdDDAhirwojkzQe?=
 =?us-ascii?Q?iRs1n0T+9JGRzWw6O/hzLAo4NfLBuf+KvQvcdm2FAZz21woOJX+Liy8PPrEm?=
 =?us-ascii?Q?TU63URv6BhFr9pBZ8aU2aaTlwvWj275LbpJx1ZlLhUE7tRp4fD29OzxhJP2F?=
 =?us-ascii?Q?yqQnNd5F9murZbiY7s02qZWG16/QBQsh8mNHxvzs6SOaZhj2VxdMXRHxFvzR?=
 =?us-ascii?Q?wKlGvzJoNZ9uE0TUhpKjaPDILRzOGsEMURbMbxqShra/zpsOtenr5iFwNBoL?=
 =?us-ascii?Q?2lJk+KSUFgYijvhKbdjCwTZBYajpVYIYMEyGmd9D2In9t3ydoEthMMVFvxQE?=
 =?us-ascii?Q?+MKpbfXBZZL05Rk0k3vZUQhaLW3hgImTktXXYqOv5ZzNeIWYwO1+RZDoj5nx?=
 =?us-ascii?Q?Y6rtQAoZbbpyqDRAMnl8NsPUniSBv8eE7IYu8A9LzLSKBFeg8z2nbmzC254f?=
 =?us-ascii?Q?1oZkdTEoBziK4KaxfUBfUq9HM1goCm7tZcBx/DDxvfQVFlaPy16QtJiN+SUN?=
 =?us-ascii?Q?e4xSoKJWN4M5J34wmxaaRTMaGAgGDXQmvEfxXqPsF1gSFy2Y/LiSKh68T1xk?=
 =?us-ascii?Q?ZJw+zDLzF69uPfsF6Qj841EXadReXP2tgYo7OPUu4OqU6a4NIAckOg7DHBX+?=
 =?us-ascii?Q?iANarV52NpGLZhMsV9GUmjltKVpLuta4e/pI3KwV0JVCmzuM+wmt7JE2MEoB?=
 =?us-ascii?Q?/BuC9Dvjg9lmLQsqLMNF6KX6jlTVV0t9mZ7BATEPcqXk2wUhRetS+R3GITVw?=
 =?us-ascii?Q?innDMNJq/P1DWYhpeAK7MUhvcg3JSieeVDWkwgKw2ptzyvIQSh9qHGSV9Blk?=
 =?us-ascii?Q?dgJV7NvetuGcuQ1BzHv01dvjBwHeDuOs4k9Vxn4q3Oie5HvP/tg5JxCGxpn4?=
 =?us-ascii?Q?7j+piK2B9RvU0Vc3cte1LofNN0o1TejFsV2MW1JFxf/ay+q/MYbLUmoUhlsN?=
 =?us-ascii?Q?AkpWfa+NbjYpUwkHdQuEvTI2xBrANg4nfEoBON2QYDXpOTcNZP8ZYmU3Pjkz?=
 =?us-ascii?Q?MLJWNOeMnG2o31Uqx+n1/OhTK1GwOQ+5juqcIzRG8fRduFzoK78Vco73fnjh?=
 =?us-ascii?Q?0As0xk//C7ux/viL8cMdy+P3JWpP4wP6v9hM7hE/Z3v/LjZ1PyIy75cST0qF?=
 =?us-ascii?Q?L6DqSke9+QHgbp4Qnl/MevX65rJa5qNsLSk6Nqkd/7A4CbbjMb4ZxU03TVZb?=
 =?us-ascii?Q?/ENhnRK+ikHIoAa4yOrazuCZM9einGn34i1rLDQX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d184b4-8cce-41f2-84d5-08dc84a70d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 15:00:19.7711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+mR+K0giQfYHwQLHW8rv7dhTiycI7supiMw1nz2aNyy4wc3RvZGa0B//V1QwJI/3gt3SEd3n+WH+1sVuV3X5uqDWgSqp8ds1fHxKI0SGEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Monday, June 3, 2024 3:40 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.=
summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_submit: Declare reset if guc stopped
>=20
> On Mon, Jun 03, 2024 at 02:05:54PM -0700, Jonathan Cavitt wrote:
> > An exec queue should be considered reset if the guc it was running on
> > has had its submission state disabled, as this normally only occurs on
> > a reset.  So, add the condition to the reset_status guc_exec_queue_op.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: John Harrison <john.c.harrison@intel.com>
> > CC: Matthew Brost <matthew.brost@intel.com>
> > CC: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe=
_guc_submit.c
> > index d9c159e3c5320..8c0b0c70fa5ea 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1414,7 +1414,8 @@ static void guc_exec_queue_resume(struct xe_exec_=
queue *q)
> > =20
> >  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> >  {
> > -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q=
);
> > +	return guc_read_stopped(exec_queue_to_guc(q)) ||
>=20
> I haven't wrapped my head around this issue completely but will take an
> in depth look shortly but this patch is not correct. We only ban exec
> queues which have jobs started but not completed during GT reset whereas
> this patch will report all exec queues as reset during a period of time
> when GuC submission is stopped (e.g. during a GT reset all exec queues
> will being reset).


Is there a way to check the "started" status of an exec queue?  We could us=
e
that as an additional condition for the check, I.E.:

	if (guc_read_stopped(exec_queue_to_guc(q)) && exec_queue_started(q))
		return true;
	else if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q))
		return true;
	return false;

-Jonathan Cavitt


>=20
> Matt
>=20
> > +	       exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q=
);
> >  }
> > =20
> >  /*
> > --=20
> > 2.25.1
> >=20
>=20
