Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8DCEB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 14:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF610E37A;
	Wed,  5 Jul 2023 14:27:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190FF10E37A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688567279; x=1720103279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ynToJiNa/tx8XXoxvPOrEPs98/tya1iM8eQiFHQa+nc=;
 b=bgJK6B5koUN0U7KAbejPUTmm4MjKqDLIx6pai/ZQ4OHvdLx7FmcnaJzF
 DFsZ7Kf3EVmHgltwCJ/LtTlsTBfWxnE1leRqHd/yfd6yxOt6/ncgVDcJJ
 GV/zHI7Cda2I3WtB6Wsver4Z5OPediehrADTRAxC28xa+nn9cDBYCb5Qh
 tZiKEiAxReLEqkF5SNCXgAZvX+ERuTNQ3aeb4NjCeTg5abQAHA5ql7c9A
 IAlg87ww2NJWnlYjFiDvKv+CEo3zBY9JvTX+lsY42EmxuE+kLdGAsuqeQ
 r+NwSypqEoAJ7TKGUSLIEop00Y63QcihSWm9p0OBGuFQ/faS6gCROj816 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353187025"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353187025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 07:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754376569"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="754376569"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 07:27:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 07:27:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 07:27:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 07:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsyMW1sYtOUlPyi8E/NW0M9ogZaWMglXFm0Tf2qRdoTytXBHx1xF3EpKnvMVXmEvvFYWLsOZCCebRRAYu2lK/3KGRtavhXRd9u0u9jayCirwV4gMDwsfEYPDR8fCIpBWl+PQn0+9FUFRHwHHUH07MKQmqonV6y7vpmOwO57jUAinrMyl8llt8gPKamZYh7DCH2BgMzaZCn1u7InHDNDf7TEZEaCrefnIE5SPyC1LCvNXBM8g7Sr491nV36YFw8tBEYw7Dp7XMHRR/Zqe5KDSnwX99q2FRFeB6V3EK1A6XKhWNQ/ev2J0OGGlsvuaz7TmcjbY6LfJxKlD8LlYvgkubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynToJiNa/tx8XXoxvPOrEPs98/tya1iM8eQiFHQa+nc=;
 b=THJ5LoV4G1y8zb288rxe00bTvEd1iLTEL6ItSC/HmNgtSe1iVrBqUZ5vQ44D/W1SNnxHm/JQB9S7PSCp6+NnVYIhXM9PFgHWjhQUaU/IAUkNm11bwZsORpaDHSFsWf5/3hgLTHHAVEOOCSJPNV3LKUtL99ZuXHqhH3del+hOrZdgSL6+BqWxXTNmKTEkVU9fU1QG7YeP+QVajp90nb6PKifKQWgfXYXu0qKF1k4nd4Dfa7IM22sJY5biB4o8c36ofGuuR+TxsrdaG+/ncxObqSh3fGM7TPJ3ay1DxznKW3GGeLkG18jNWLIJCsBlJRm4GjBjudcKgZL1PtaLN1PrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 14:27:47 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:27:47 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Thread-Topic: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
Thread-Index: AQHZrxv98uqiL+2qgECin4p+bvOyrq+rNYWAgAAFR9A=
Date: Wed, 5 Jul 2023 14:27:47 +0000
Message-ID: <SJ1PR11MB6204996C2924A6D15033C08F812FA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230705084403.3922130-1-tejas.upadhyay@intel.com>
 <87y1jucv1g.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87y1jucv1g.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4528:EE_
x-ms-office365-filtering-correlation-id: 771317a2-1254-4c7f-cb4c-08db7d64010b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u4hUIrEpGyi/S5iwUdi+MbB4VTWTJIfV2b54Z2woE3IHkxDJzvI6SBf/FNwyGQzSvK5agAIqyOlVQnILsEnt9gub6GHewqiLKtMkMymmYvJ/z5iq5dCKU8oKmpI8j2D+d3TO4LXJukpnaa8L7Gyl0CqzM0Xba9QP5H+2f+7rfifSB0FMcW5h/CzCm5f9a/o3zu4SwtSMNcYNpN2hwrJXo8OP/RRsoD+uA0vgXjuPBps7BD/QsyHSkGYOUMjAC03QkFZlcHduCu6GFapylw+ZA+DUPEJ/D2wIvVGWo/2aD0ycE6pdWcD2Z3k5+JZwJsaDdpDSLmjIAgbFUDgxUY1YELOUuNbPGB2am5yE1ELquMgrqtg5dAvc98FcW8ypzchPB35ozN8sgib+tDCDM5EMp9FNXUZpzqXNv1dW8Y8VrWgV+Tv4HFyIA6k/t5pa8BXvjJC/prMJfXiIAyMhP523igoBHuIsml4aGnK9C4Q3tFC+sfO2RAjdMWGWZ5ucyNPY+WjXlJuNG0PnxVXYFRmK1h/Pnuf1a/FaLNAGBAO9qmrfeeo/I/D9nR0HLopKq/0QSOLZ5jqIf0aaqzZavl3cHqxBohzQR47KxBtA5SWrSiOrPMdfazj1ENh/EvN+5yYl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(107886003)(478600001)(9686003)(82960400001)(6506007)(71200400001)(86362001)(186003)(38100700002)(53546011)(54906003)(6636002)(4326008)(66446008)(66946007)(66476007)(66556008)(83380400001)(64756008)(7696005)(76116006)(316002)(122000001)(8676002)(52536014)(6862004)(8936002)(38070700005)(41300700001)(2906002)(55016003)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qK5Njr2uY8s4LWde2SpLAnD2DNE6pI84GBTJstMr9Ehv25XR2DBvQI9CNumS?=
 =?us-ascii?Q?osOwNIJD3OoHc/u0tqOTKfIqFQiG3rMm/XJ2IMrn5JGb6lL0YIS5IXJ7h2EY?=
 =?us-ascii?Q?aK66XE3TkG4To0ULndNz62zTWUej0c++NlSRiM8MrD7R1Iw6gJDwRoyoeg6q?=
 =?us-ascii?Q?oociklPg8UuWtrB3r7VS4saqIWnvtyUt2bxo5wMwL4qeywfYRS20E3LG6KfS?=
 =?us-ascii?Q?gCF0bc0J1Pet2BpvotYZczqKb8zjPwHL6jh9eKo3FcJi+s14tJ2/09BxMJo+?=
 =?us-ascii?Q?Qb5MFwuS3nLG6cV8d9ZoW2U+CqsUfi9nSBewR/7BCDQOw63JjUS3gxeytRyP?=
 =?us-ascii?Q?z1CZCQAu267crgXHfjUyGOFZVWn4FE4C/jK2N/ClkqhoGU0mvY8s4SDQPJfp?=
 =?us-ascii?Q?zdeOvlPK3Tjcz2jsYZiNlnETIgPCguE/yjz65M21x0vbuDD+gUUOM0iLhy8x?=
 =?us-ascii?Q?Ns00yCYm1a1YaBvk38J55M9Ip+SSN2CfViPHGnTDsUMHkMzjvqJ81t5fGeWC?=
 =?us-ascii?Q?hKK8GhliK2pqbhRExYR37RG36ZGc3rJWlzI02mI4F3zP9ZdlmLdnXEQestJK?=
 =?us-ascii?Q?9axtfxFdmYZ/EPE9hrXyIDBP2LJ0PHLXMsJAHDhrhFpE+V43XI3n2Rr9AmAh?=
 =?us-ascii?Q?zq0nN60rtke8nKmAxliTsM84r2sexLSgjLRvtcltwgEEAijNCJvNjOHDgJ2a?=
 =?us-ascii?Q?b/YSwf69QxZMcJkA50p/EEjOwICHKwRIwdKLN7Q+wlGTxxui6GCmGzgCBFP4?=
 =?us-ascii?Q?rejVX50Z7l02kIf0mtlA+1X6x/kg/X/GgMwt71eyFTby+ZBYNxj09snNiqH2?=
 =?us-ascii?Q?gA9O6y57UfQ3kazRtmDFh7dF+P2eUT+5+rdlyzqtaEAxQoZfYj85ktBTqsM4?=
 =?us-ascii?Q?vRuyi2RKdRr2YXyNHkjUHG1vvfs+uS+E6dMeKZm3lxXRPmyP1hAsQ6+ruqz+?=
 =?us-ascii?Q?UTvI9LKD4bsW6RJAOB6eCpcFvuASnh+p1FfOTDPtHpYtd+XdXRb9tDSr3Mzh?=
 =?us-ascii?Q?WI/sfGbHAuKdCMuIRYz7s1jnTNCfoZXkuh1Zp88OZODrawxv0syDiZ/FJmR6?=
 =?us-ascii?Q?LDmbkbhzz3qxTEcQJqNywA6yRG5p7tSsPk1JrR/+spqt7WDkxTygvbQfHjCr?=
 =?us-ascii?Q?1wfue5B/axG5UOc6tgt5GlJ1gyBS6dwmfk4UhXnPR0tt+BgGTDkpauTtgAZJ?=
 =?us-ascii?Q?cFE9jfBIjf7e5KUvt6/E22ZNTDA20Ov0Fya5dnnAvvUjOpUliMHraPOQj0dI?=
 =?us-ascii?Q?xQ29BPyYstHQNPQU+lODcJ4+aMUZGQuQwKVYQ56YvE0zDDN/YYzdnGnPViuT?=
 =?us-ascii?Q?Jh+oFVY5vdUNFkoBckI0BC6DanWLc7b8PAFPZ84aK5VZRSPrSf7KBnFRJVI6?=
 =?us-ascii?Q?/xBbttI/oCK9ft9rtGoCh/alJv0Cige9iGxmWgaSaJcIwfMG3+hqD+Rp4IQy?=
 =?us-ascii?Q?624GTChFuSyYWW/Tg5ZOe1zO7mGelMAq7rP/LvK00EDjCdizJVyBhEeC4+9w?=
 =?us-ascii?Q?bRvQVtZ6aw3KRnsbl5rVP0UI5s63HeYII+EoVTwTCfd88T6xtKX51XVt3Kg1?=
 =?us-ascii?Q?5zJGhv4XpRdD7W4+ZssEs0o7KMqBknQNQlcU+b1QTieKazejf+u+zOKdBA4N?=
 =?us-ascii?Q?qKPFMiPGxf6PA+5nZgJiaTNulPvXjRwkXLTxumrBFA3B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771317a2-1254-4c7f-cb4c-08db7d64010b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 14:27:47.0590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFX5CTLOipjrEDeJi1pVmezG1kwNF+FXJ/Z2LYlUD88o0lORqHAvPVTzOgZukU/AY+byGvEVhi+mj3pfxLf545D4vTX+f/hul8n0euN2YhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
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
Cc: "Shyti, Andi" <andi.shyti@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Das, 
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Wednesday, July 5, 2023 7:36 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Das, Nirmoy <nirmoy.das@intel.com>;
> Shyti, Andi <andi.shyti@intel.com>
> Subject: Re: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
>=20
> On Wed, 05 Jul 2023 01:44:03 -0700, Tejas Upadhyay wrote:
> >
> > Currently return from xe_gt_sysfs_init() is ignored and also a failure
> > in xe_gt_sysfs_init() isn't fatal so make it return void.
>=20
> But why is the failure not fatal? I really don't understand the concept o=
f these
> non-fatal failures. Do we really want to say the device is up if sysfs
> initialization has failed for some reason and people are unable to see ca=
rd
> freq's e.g.? This was done in i915 but do we really want to repeat this f=
or xe?
> IMO the simplest thing to do would be to fail the probe unless ALL
> required/intended functionality is clearly up.
>=20
> Instead of ignoring the return, fail the probe?

In my opinion, not creating sysfs cant be driver probe failure. Driver stil=
l can work with its core functionality when one sysfs entry creation fails =
for some reason (example, sysfs dir already present or memory exhausted at =
the very moment etc.). Still other can comment.

Thanks,
Tejas

>=20
> Thanks.
> --
> Ashutosh
