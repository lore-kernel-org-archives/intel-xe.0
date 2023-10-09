Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24458E95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DC110E24C;
	Mon,  9 Oct 2023 09:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7710E24C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696843179; x=1728379179;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zLs5LmOLBCTPoM/mR0vukPG3zfNCw/8D4eQgB4pHaX8=;
 b=K7NjBCueyJ78kvw/KUjf1Kfu1LwXMDkKUDb4mu67Nfmkxw8RpRRGbWK4
 lFNtym8bvdmKSGU62gB/4HpJizHgYLzmNGJPvpXX2llVWgLIQyNAlsjIc
 Fqmv5/8BO/hbb8aXpI5OSiDsApOPDgYjh325XMKISKh4QRltxZtMLLE2f
 RG0BE+sVLmXHPlz8qQqmoOvLsD25/QLNXiMAUsFbsB8l3zIQdIoiB6y6A
 p3sEEJshUeFao028MN4dbjy40OQi2Ma64SOavgm+at//h4ToRPm5sa322
 goae74NwCF1V0i2FdZEzJnWwCB9WBQ+vTJRuCDXT38oJrqO1haQJU1KBW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="387966629"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="387966629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="869169120"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="869169120"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 02:19:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 02:19:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 02:19:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 02:19:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 02:19:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j60XjtAHgrViDmKzNYymeNfGdGzFG7prRYzvQDIeNmBAieaRxbTfMRO12pC6tB50sD9HYWIdlX19+hD6wi2rJdt4oAX2QxiygCDB41fgY4ZWicskpbZxEDivhqTK26hmaZjIMa577sLkOEP/N1jNrWldsDW6788lD96wJng+ShKL8ebW9FD9l3ENjriP5D2NgdY783g8KzFNWCfeA5LwLVpmqt9cFkIunmp0+o41Uk4KTTy6EQKZOA/c6ao1WRbF3d/eVf4ed0TO9Ot+bOu5t0a27AmTau2kmucwYdfozqW+gNfyc7DpQV4Vnky5nuqABTm42lzPYEjfItAwU4BcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th2oA8RBbPpQjpgzdtdnhxdM2ifrH28r4+HH4tbPZ3Y=;
 b=jjkGmo6mU+u41EhWfWM4EIFyZAH8k7ongXGIW4o6msL3H9otY9UuDld49tvTDCl+YahpA1grwkzXG36Dl4WTAdPGtgK8PfhhQcabPTLkK6Sidt7zwIHlyzEe1db4hLVPXxn8Ca3L39YPup6WP3Uffi7hyXzG2XsOIw5olabIl08rJLMlmj35WRFuJ0crnqFsnCiiue8fToBT6+E38nBCCoOSPEWe1oSDbHRIbBbLAU9oTPVUNUiZ4QztbrxEQCgQvWDLaEBaslYX/6XjEad7gpldhkxeyTChuDIHQcYArTqrGcyPmrnVwkhlyq9nylCryu/uoYu/3SwB/N5hgsVUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Mon, 9 Oct 2023 09:19:36 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 09:19:36 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/3] drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
Thread-Index: AQHZ7S81Ki+GeB6bQEqKepU9KLnApLBBSGsA
Date: Mon, 9 Oct 2023 09:19:36 +0000
Message-ID: <DM4PR11MB63605B35DA9D77644EACA761F4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
 <20230922082909.334085-4-suraj.kandpal@intel.com>
In-Reply-To: <20230922082909.334085-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB5280:EE_
x-ms-office365-filtering-correlation-id: 3f7ac43f-13c9-49f2-dc70-08dbc8a8db4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OCgYoQLgCX3Mjx9HBUJBp2Jqwid3CkcOT/0wobeseyGlFfN4hw6ZlmBTI8KgS4GVEaMIADn6jrBJderO1xcabwoj+sI46RoPCx5Hmy4pUwAnNdO3VN5/hAIB60SOhGXRUnoMhuqJl4xJepyJaHLQ/UptqJpuhaOCrG0y3yY874L5l8ESBkAMJFs6x5DH2HakzBVU5LqsKK/JcoOA3KmwKsXfE8ecKttwsGlIQ+8WjhStrC/ug/4aV43xs48Nc/7rNaIeBg5lqtV85nMdadw01UbixLVxg2G0Xgavua6Lbwp7B7/NhREr3lqTIaYqysET8j7h4CWadaNYAln8WFZCvaHhF2yA6KMeX+iQITZjP/Wpxd7nyCeKysKUES8OTOdikdptahJbEQsGztTJRsO/YuspU15robkKuqex6fJXzysQsvrtqjQYmn5SL2Jjj7TVrA7RkLixTs/quXikr+WOzUAQASEU0mS/ta5c+6qgypSbZqbBAl+IjT0zv8pijlhx7gLMfNjqLfmn9yYaQlwa1aX5TLBGqUw0HinsEiRZITC9VU3G7hNHBVReTLmvilsi8f1jNz/rd82ybQw7ptZmlA8/lCUMYcqeKQ9+1C76UBjAAshNiv7QHLr6efvHu5DW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(122000001)(38100700002)(38070700005)(82960400001)(86362001)(33656002)(55016003)(2906002)(9686003)(478600001)(41300700001)(52536014)(8936002)(5660300002)(8676002)(71200400001)(53546011)(7696005)(6506007)(83380400001)(66946007)(66556008)(66476007)(316002)(64756008)(76116006)(66446008)(110136005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?25aH779nK2qDmGjDpEmd0ultqOBuSuyK+3aWQm0oGMnd9dUBsHzve8hY4po5?=
 =?us-ascii?Q?8ZOtKhnUBy6vogcYDdMRTFpS1iwe0dvoq5qxNqS0TAYbTXKVYraaOp6KSlKf?=
 =?us-ascii?Q?WPtZrEFyOttIxdTMJXSAMFiLRWVAVKTfXkCCSsM713/luMpSUfmgqVlbEA9d?=
 =?us-ascii?Q?EKAliS7a0/yKP3JfuM+7fgK9tXTKqxktdfvun8uNwb2KcZuXbhtIg51V6frT?=
 =?us-ascii?Q?2XV6AKfwN5x+3gkJwkxKfAhaSKpCQXiS4cTPEGpur6aY8cN/VE9Y8rRmIRnX?=
 =?us-ascii?Q?63/l5C+98o4HWbjlbwMUhsD7lEe1WhhZIv4vaEGz7ccYXiGP3h3vFOP8rLef?=
 =?us-ascii?Q?i1AnOJM9SbpocxnXAilOwyCi+ANcqX9ou4Kfh48jdtbELeSdb1XG3IultcuY?=
 =?us-ascii?Q?JBcaA7JUGyGgcQng4amIV35BSPiUBGD15IOJLaT3oCHFs3rTfXbMhCbz5so0?=
 =?us-ascii?Q?6qmfbJKR29CE5atKJWcTf0w75TX+eUnpH+aNwYCSKnhWJ7Xer/sLBLLyu+Oq?=
 =?us-ascii?Q?NQb5RKkaQuMGDKpftCvIe6SXgn3Fj+tF8K3O/D5amhG3efLvbX6rHNM+yxRP?=
 =?us-ascii?Q?CNcNAbghFPGIUmhEDlvJ8EWY9+F4B1PRXh5RHBw/KRyR6faswvyeRWklecEw?=
 =?us-ascii?Q?+AB3E3E3oI9rL3Oeq77fpbAY8vLYXrXSkhQiThW79DNEYptZXWcjJ35xnmM6?=
 =?us-ascii?Q?NOiQG9kjQaN0m3PTA4Qg+Q0ZGv/h6uuRqEQN4oa0CcRC092lYkLbaChx45ND?=
 =?us-ascii?Q?ELcCOjABF1UfuH7UxoJI9+vCGD2oONnmjuSQnZ8kLniKRpO3hZXSrxSbOLay?=
 =?us-ascii?Q?jKF0ZBWyVecuSW6ccQTLlIEnzT57D3o+2sYctHLut/7+TdyZtynQw8P8o8Xh?=
 =?us-ascii?Q?ugh1dM05DGnI0OiJTazT1BdFZ04+o/dwb+3F+4qGU2KbqxLbLtBtkJCA3e9M?=
 =?us-ascii?Q?hWYKR2+9Yhfe3Jz76msJ96HONbmiBhe5poZNkZYmEE7Etu7fs9WY8kj8oZ1F?=
 =?us-ascii?Q?lox5ke4gMU4vkFNaBKNOXp2KQiqiTdKvFY2q2TQ5yPaKoqUr4F1NO1vm1aLh?=
 =?us-ascii?Q?N9WpZucVRdTXTSPPeZCssRS3VAUVLK4ObzxtUxXmBGQtD3Tmg5+sloWje0tS?=
 =?us-ascii?Q?xP13TWwDKzYR/ahsWV0XJory9BMtnaPcPbD+Nk1qZ3f8JejnlOxlKNgN7t4A?=
 =?us-ascii?Q?Iz60qETIc45oz5/5aETZ+B0lZEaM9n/kWUp83Dv4T2xdFNHXOp1T3cJuriq9?=
 =?us-ascii?Q?vTQqrn2l8549xvaP2vVJF1nDTucSJPVkocesDE4odYqViIBo8r9z8MZIAJb9?=
 =?us-ascii?Q?ajYnk6pI/s12Gqzxa2qb9prkdWT6otLXuYgzHYmWWUvFVqAwt0PB8vDzjgPq?=
 =?us-ascii?Q?WKMkXkuXkkcKWStqkm7BidWQkOxo0tY8jHYzKfpoKqTvaWyxw1s2Qz5GOdAC?=
 =?us-ascii?Q?QimcVekxcqhVL/6PcQioucMx3zpS+oz1x6aQIzDj4s0BNM+dkUQN7NB77HvN?=
 =?us-ascii?Q?DfDBNzmkmfSERE3hpH4JPFW1ULhiWUWlpdAXj/nxRJY0P+wM2hOznj0EuHJh?=
 =?us-ascii?Q?1jvndvNKPT9hTyy+FwoMzbME0ocDAQ3y+CSM3uBs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7ac43f-13c9-49f2-dc70-08dbc8a8db4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 09:19:36.2489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUY+Xg6QIsDgmk9SofmQMP4Sohsupz7rn+5Bnxe0JbnlGbVxHGbfpR5IxGCAePh7iwQJZw3H6+9+Q9dpVB4aEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, September 22, 2023 1:59 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 3/3] drm/xe/hdcp: Define intel_hdcp_gsc_check_status in X=
e
>=20
> Define intel_hdcp_gsc_check_status in Xe to account for changes in i915 a=
nd Xe.

Elaborate more what is the being done here and why.=20

> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 5c02675bbb09..85f6f22ba4e2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -5,6 +5,11 @@
>=20
>  #include "intel_hdcp_gsc.h"
>=20
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> +	return false;

Add a ToDo here since this is just the current state, but will have to be f=
ixed
later.

> +}
> +
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)  {
>  	drm_info(&i915->drm, "HDCP support not yet implemented\n");
> --
> 2.25.1

