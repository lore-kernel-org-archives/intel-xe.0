Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6502C04FF5
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875210E54A;
	Wed, 20 Sep 2023 19:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76710E547
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238220; x=1726774220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qbi0zOuP/JYLRK2u8udJqPAwj8ZXHHpzaLw+CLUj7sc=;
 b=SXtl5H5Ne99NYMWXEr2bIgks1Xf4mXJhPh/ATj47b5/bUv3bTKb6wmi9
 XSviWpzVey6GwkYIKe1ho9yCOpePG+bHzVMvEc74SxP5iogFR+sbTJsKW
 LiCtMVPGxDkuw6tSWtvvQ7jrODpfmEVxwtAUJCJ+wO9BNnkUcJY16nLP1
 ESfqdIedClNIUq3nv6kMxGRT+2zNrUlVp2LtUgsHye+vFT8fHz9e8dLS4
 5TPyubc2+V2XEfZHPgIq/6mzucx9tud7o98+LJ+JDyuHhRgk64GVJE9MO
 Me2IJFGvRg35FNzdG8G//bgC8M7tE7uxIPQrrrbfSHhnpnx6wAmWM/8kY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377618947"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377618947"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993751603"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="993751603"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf6XMdARk5Ntze5aIHphREs7dJQvaOa4h/ELGXyMQNDONMlpMJ9PPaMna8Ts1NfU/HFebYMQ/A4QVvpfDc7pTWq12MNT1NNY6qde1bosKU5JMuHWJ41tsdeQn3TcK1bcVmo72KdTlOuVEfRzKtqbIwrMwyB41tZEYuHGQs1u7w2dxP1bp3EW5S4wa9lMHvF+3V/wSwcpWKqqltBM9PligAqzFCvA1pH2PEv8r2hjI8PVYjEL3Rxrgj7TsRQasVCRxMDVyZivUfobRHK3gM6jiUXPRbAgTYMmST7nZmBdihppEga8gXuBqbCvnHSF5HARE6BrqP3CQe5zZaNs3AB3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7emWFXtp7LYlUgigNz0/i016WSxYBSKQT6CDUymBVs=;
 b=OZ3Gp0a/btSLw9PJV4XsBf4igVxWnWEjHR+IsrGT+IC8dQWN78jzv0aX/EqSmwhKRLQrw8RavD+9DSQo1hMgtZ3oo+dBkw7HIYmuhmNtEpjCP0hUFQa9E9NsMZbgrSuLjr2JXODjbQCMPzs8DzMfa4wdyQdD+wo5R+NFXdP6ugTroKYE2HNF1dIMCUuoWXKUudzxDHlJV4O52LZ06AjL8Dsb92vBET8UI1j2lK9HsjWwacQnG6MFiIQH4p+UFwv1k+v7ixBWYA6r+nkb4P6wKgWL/xS1LcoCYsBGDgCLKdTA1em3Mc76Ij/wZFz4arIKvHuwVthvPNJKnViuKPibEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Wed, 20 Sep
 2023 19:30:16 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 19:30:16 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
Thread-Index: AQHZ6+qjjmxElHt+10WnoeXJnWqn97AkGF4AgAABajA=
Date: Wed, 20 Sep 2023 19:30:16 +0000
Message-ID: <PH0PR11MB578299A42F2A607E7758163182F9A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20230920175431.3381076-1-pallavi.mishra@intel.com>
 <e6pyrszsnm74ksejfflcea75qyy2canhvopit535lm5aftkykm@qa7ohu2v2syg>
In-Reply-To: <e6pyrszsnm74ksejfflcea75qyy2canhvopit535lm5aftkykm@qa7ohu2v2syg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|IA0PR11MB7378:EE_
x-ms-office365-filtering-correlation-id: d5a6162a-2ea7-459b-3328-08dbba1004e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CIiMjds63jdI7DMblaZiWoWvFQkmQfqUgRXEVHNs7gjwrM69UKajEVbn6hWxh/2YhHsqy/73nYFlMdS8gnWnvw4JC31UGRfhAEPsI/jVbxYV3jujhRBnDHuCzv4yUthoWOOQVzog+4QCoioPM2gEaGc7ynWFi68MbclML2oh2IhD78hbT01lE3Ua4RuIEEoo/aUnUef0uBxha24BoPsIcWuZG4AjuZR7O5xuQ/DWtWSxZAVVadR4F5DE8sIUzK8ERpOLAN4a2AuN1Ac48qxEMTlGc2X0pCL8+yXCM6el9CFpI5KVpEr9EqqZ/cveOUUhPyrKxlK3r2Dz9f5ItRcfK8E92dN4cD4pEMJaZwHZJYcecXGX6YiSXKWD9NaTg/EMaauAVwRLdrrcBsmgM+LNLpDwHiAyV/T59PGgTfaW+DrtO1yB7rqg22+gHEXQj3/bk1LwL35V2fwboTtJD6N9PQqmn49YeilxY6mQW+ixxCkSk2TrrSO/jPoI/hvygXd9oG0Ep+MhoFmweNrS1rsMHQTd5Yg9lPr1SrD3g9s+66hMJQVlyuctTk3ohnlphmcKSll1qCQzt3n0p3lW9M+PaNhvE/RK6nOS9zePvHjaO0OdoYngULkm3hN1Zdt2k3CI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(346002)(396003)(366004)(186009)(1800799009)(451199024)(66946007)(82960400001)(38100700002)(9686003)(53546011)(71200400001)(107886003)(7696005)(6506007)(122000001)(83380400001)(76116006)(66556008)(66476007)(26005)(478600001)(316002)(8676002)(54906003)(86362001)(64756008)(52536014)(55016003)(6636002)(5660300002)(66446008)(41300700001)(4326008)(6862004)(33656002)(2906002)(8936002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UdPOO57n6tQXpJIZk77KLlj8w3pWIdURKWuHEnpRWL4s2RKNDbpLzaARjOYD?=
 =?us-ascii?Q?JdqPnXRHQNd0rxfSety/SicByo1LBDffgUornkH8LER792btuWPo53yTUtBd?=
 =?us-ascii?Q?gmUX5DaVJNVTYSxdAkUGT8yoHdkNTn7caGAALsE7Q/0YfS8QzUteCkCnKG9D?=
 =?us-ascii?Q?Ni8rbGww2qbuptV9VnkRVL02g9jiYmnBHTYgiQSh5tMWwowB5gIGHrxi3LBu?=
 =?us-ascii?Q?l7b9A7TdGx7+68k3ivOO9Uc9O2mcQ+RV6H0I5XEmhZQImvxKlihnbXR+04xF?=
 =?us-ascii?Q?O5RfY3M7PsGgpHbz0jHzKxIuMjuLPOxHFmF3HGlbkPI/kfw41qqQ9FX3xOvw?=
 =?us-ascii?Q?ySbvlpoIyn62gZGTFch5TMonWnxyftderw0migItUpdoHsSE/NcQfVUVJmCa?=
 =?us-ascii?Q?SuM/wyBfU1epzwCIMTmCoLUrimpBqcsF90UvDRFgnzw7R8dvj+uzHWfrcquq?=
 =?us-ascii?Q?X19M6/SkhiADlMgtzSUdPtMWbzgiZfRul/K2CoMwyQ9LKi7IsPC4BMZOB4/G?=
 =?us-ascii?Q?LV43vVNr526UUxEW+kRmICGyjGcb86Nfn9wvA5pBT4MfQDvy2LNQ8vUuCi1g?=
 =?us-ascii?Q?ly1wZ7OGFeLbYaD8iETpL20M/cP641dL9olb3by6KdtDOYG1xMKjGs/LuaPl?=
 =?us-ascii?Q?4jKj7QzSqRMu+ai6zTcnUMoyDC4KAIughWsmsc2jUVn83FfuUHoo3zJQOhs4?=
 =?us-ascii?Q?JpVtON7Dm1LNP0vvYaJ7pLWOvPrhIqbIUEbWYs4YE80XIW5oVcnxsBZR0zGg?=
 =?us-ascii?Q?rVMoX8TyjV6ojmhhDXWlOvyvk7Af7QafQq6rYv34wnWJQZiJx4kcL224pmTO?=
 =?us-ascii?Q?x5bagMeIReRqPUaobtjftrQO3IFE6Pmk8zwrfd8vTDTQzls1dbmCAb7b2sdE?=
 =?us-ascii?Q?06iH9MxjysaTf3RvvNSHjhIBijoUgpjg/Q8zT6/lqlwDav1IP52gd9byP/ge?=
 =?us-ascii?Q?a1DrDfI2dmJZc3uroPL6SEFAzZbrQN0DlOu29Ok7jqYgotiHZckSfmHRTvck?=
 =?us-ascii?Q?7FhElmeQgJDQ46CPFohksWLDuP4rxNW4Nu2EQSj8oJGYo+Ks1jsKpB4Eb10h?=
 =?us-ascii?Q?GnV94wu5iJJ31B4t+5GTE/g6ng+JeJijNq5MawrmbkkQ7s1WUQgtrPA8i4Rk?=
 =?us-ascii?Q?YFmWDNqoDSQ/sOwKf2m7k5+xlX3N6GXJi6c5QCkt5rH9IXMcPbXtwxw79SkC?=
 =?us-ascii?Q?aAAFBxnzZ7feE1ssCPwHMZSHCI//AAPhL6bSShyEPSAa+mlJgiqDGwv2sJfx?=
 =?us-ascii?Q?Mow7GpezTD3hw7mIbcwHoIpxrM7YP0zpe4mdBgy7U2xnh2KhIV07jjJcFqWf?=
 =?us-ascii?Q?V53tVxPsU++K0ACu4Ky+iP4Dpz5IaUniwdGEdcDqFJBhWz63DHoXP8Vg66s1?=
 =?us-ascii?Q?z9Emoeu3XPD9zfozlrxOQ0GNruJpK0KwARbmCYl+mSxptiuFj8bpl+bvvn6x?=
 =?us-ascii?Q?i7jVamlU/Fru+51Up0C9R85sOeNnf/cifhG4DX8cCDSn6e6WzH8yJbshAtvj?=
 =?us-ascii?Q?MLnSebo1RrjKbRySENgDuM+2gwaXeX32SoF3DCBW4+KhJ8Oc2BSG1UXm0OFN?=
 =?us-ascii?Q?UTxstg0uvv7IXg0m4+Q8d0TStzjjyj9iNB6b1IX0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a6162a-2ea7-459b-3328-08dbba1004e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 19:30:16.6833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GZv3to8z4uJ4hDbHeTVNZoHKRU6gC7s6Nxa3fLFmTpPu6LYG0IK9c7UkpBILzztY0o6HE9qPtsIsJ4Ets2hL1pJchorlIzrVr0mqCn/QYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, September 20, 2023 12:25 PM
> To: Mishra, Pallavi <pallavi.mishra@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Summers, Stuart
> <stuart.summers@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
>=20
> On Wed, Sep 20, 2023 at 11:24:31PM +0530, Pallavi Mishra wrote:
> >Ensure alignment with PAGE_SIZE for the size parameter passed to
> >__xe_bo_create_locked()
> >
> >Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_bo.c | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >index 1ab682d61e3c..014d084632f2 100644
> >--- a/drivers/gpu/drm/xe/xe_bo.c
> >+++ b/drivers/gpu/drm/xe/xe_bo.c
> >@@ -1199,6 +1199,9 @@ struct xe_bo *__xe_bo_create_locked(struct
> xe_device *xe, struct xe_bo *bo,
> > 	/* Only kernel objects should set GT */
> > 	XE_WARN_ON(tile && type !=3D ttm_bo_type_kernel);
> >
> >+	if ((size & (PAGE_SIZE - 1)) !=3D 0)
>=20
> ALIGN()... but note that there is already a call to ALIGN() a few lines b=
elow
> this hunk. Probably missing the `size =3D ALIGN(size, PAGE_SIZE)` in the =
else
> condition?
>=20
Yes. Let me add that under else.

Thanks!=20
> Lucas De Marchi
>=20
> >+		size =3D (size + (PAGE_SIZE - 1)) & ~(PAGE_SIZE - 1);
> >+
> > 	if (XE_WARN_ON(!size)) {
> > 		xe_bo_free(bo);
> > 		return ERR_PTR(-EINVAL);
> >--
> >2.25.1
> >
