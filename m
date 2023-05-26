Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923DC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 18:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975B110E1E8;
	Fri, 26 May 2023 18:17:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ACA10E1E8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685125053; x=1716661053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A0aR4kp9Moyq6CRF8seXfjxOTVnZFXn2CoWvWCWJyqE=;
 b=atGPf4hsItfczN4l8BGkn8GPAEKP+GU7gijChimF/52F9gd8DPdNLXzK
 jT2Ho4wE26C61ATzceoj1zcoOu+bU24byxUkp25nFhj0a+KyxH8Wpcm14
 5dAUuiJMr4LLQc5KYX4veYTFhsRu2wNAQDeBK2PUpZLlRCvOf2ZN/2Jia
 XukPIFfw94EUn+w/3YcbWQA53RYoELk7bxNHnoV8aMK5okaCJcTXsHfu7
 F+Pj/nlxmTn74QoKwrwRIJ850aMlVthJu754s+GxuHS5bJ+RsfumY/Mir
 8Gc1nYoAD5ryUZ1L004dgvYnQMQeyRiFtOcep9F3Ztk6QvrWfj1pMgxfl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354283490"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="354283490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 11:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="951974449"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="951974449"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 26 May 2023 11:17:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 11:17:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 11:17:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 11:17:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 11:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoRvZRllUxLLI0CVdR+AF0vdfcCtxNhpwfBxfc1PiVbgGJsqG0koNWJYcFWtQ6ByUNOU3o1BrVyhxwfV4T+u3yka2Dibqd2Ct1IiRvBsIDPeoPb5SMd1r+8QCyy6FZ4xtRbB/7PVz1/eEvsr+gz63iZzsF+SiXJpr45+YbRRrwV+wtRzZ2XpQ22hA0nR1abxb7O/5lLVjttn2/ZEF78aZeqvvX1oG1JfEBTwwqdxX77EZ5uXPJsqqxm980BZaAjoYPO79y78WkeAaphsc/JfQPhhbU7DB77MGd9x26Rdh/ZTmIO4nILQX1E2ceIHodhLoHK1cXYMuE9Q2SDV9VJVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7THQ6Q0L48rWYzmEOLXEYnATf7vEle5e7wqbLzLWhVw=;
 b=iAob8ywO9ZpEeUWaYp6+Zuipr/9dPSv43JqNh5tJijjX5TMmc9svyyQphi1klLw6Vj723IcVssHvyVz+dxDFsixnvkZyRI8fj7ssAeXlx5uZiv0ZQ9YuuZUQI0L5yEJCYFr4yjvqWFJ9vn3mgkumgYfZjpRkBpuv5wxpnOBVV8knv6Q/jc+FVfMEXkaD99lNB6C2H/zANzbFGpJYHqYjUUJWpmq/gQ0WjOwsfHJfWXwr7V58hQLejcNjIKGuYjq8/gTD69ImQWyJ9wyd9Yfo87zw81VqJgIi4Tw3negOrz0kzLCe0denDvPaNgqayBg3/V7hAVAn0rwwKubBuXDpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 18:17:28 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::dc02:fa20:2d25:dc]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::dc02:fa20:2d25:dc%6]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 18:17:28 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 6/6] drm/xe/rpl: Add missing RPLP and RPLS
 entry in xe_wa_test
Thread-Index: AQHZj/UHsDLpxiietUqfSQ9sgLG72q9s0T0AgAALbYA=
Date: Fri, 26 May 2023 18:17:28 +0000
Message-ID: <SJ2PR11MB7715BA02ADD08B31C14D0CCAF8479@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
 <20230526171204.2754550-7-anusha.srivatsa@intel.com>
 <jeslcvopyogxvwlrqj6g7zvl6g2h55umqxfhoz5gzk5r7bd5ko@en35xe3l5a6l>
In-Reply-To: <jeslcvopyogxvwlrqj6g7zvl6g2h55umqxfhoz5gzk5r7bd5ko@en35xe3l5a6l>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CY5PR11MB6235:EE_
x-ms-office365-filtering-correlation-id: f9fb46e8-777a-49ce-fe89-08db5e15770a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X+2e9uRELienBxNFx7kK/ivU6M+/kQv2cETmvzz+V6WjmsWwOA+9lfLlBv5gIhtT2JKutFMjhELFVqM63hcy+15cFa3qSnDT8r8qlhR2m6yDSj7/dUJHqWP3KxfvRJOaJvLiZAVG0Ml71FePW4Itjve6meMl1kjbxiAtCOeAcGOhupOe0OT/+HrIhkvfc2U4rWOgyb5gcuxbYmk4eDq/xOQkW/Z6CDryXHTCDNHrSC9baSbQvDXChUmhMfXwycwe2FZ1awYBTvVbeMowB8oo4ZxMvF4c/CKko8a7lUQ3SV4YUc8UwTRlVM9T9PbG+t+DpX6xk8f8O3E72kBI0JJ3poA2OQ6ZC5n0ujIpt4XzfmmnvRhlJiD1E61IA+cptKHMtle1YQ3Rb/NUF/8dr1Y2dU7ZHU9GeD2S9Q/LPZ3Uid+grE34kVglo7wevVmzHwPAbdBYtaWLkaeNbK9rzlvK8jUcsI6A08fGJSG2XBrxVrzU2o/Id21RJ+cKiTq+XxijAqNH0arsoKNYkpFkgYsSCn5tXP8zqlvphreugApraj7iRrP3uaWG+K7DdyzVgtmaPd9wTb61CU+6ZJd0eR53nfQJ1XWi+9u4aC91xDUCimCVj4DAnuYyTR89uK7HD7g/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(38070700005)(83380400001)(2906002)(33656002)(86362001)(82960400001)(38100700002)(53546011)(186003)(122000001)(55016003)(71200400001)(8936002)(316002)(8676002)(52536014)(41300700001)(5660300002)(6862004)(478600001)(7696005)(4326008)(6636002)(66446008)(64756008)(66556008)(26005)(66899021)(66946007)(6506007)(66476007)(76116006)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CqQ8E02+Y8xso19QkTOXQE9SRRTLO3Y1HCnuP0Vf/nSpec+PgEiepGqYyXv3?=
 =?us-ascii?Q?2BDFtle3UBHS9bnRPg1RmNnI7w6dnlaIYn6lhhRgelc/lN7cCb3BczQEkF/S?=
 =?us-ascii?Q?fjp5mlb5/5FqI6MvpRS26NfrZmJE+zPRklfZ0eCyH/8eCSCkOahPKnZaeXo9?=
 =?us-ascii?Q?ygZlYj6ng4zboUYLg7U8fnv4SI97RXA0e2mwNkJRRu/xs2kSkLmg4D89j4qn?=
 =?us-ascii?Q?CMDi5BunP/YRszWT34VFxQPZQstBZwHmSohClMMnQuOxjLWlTxpEGdHZB7+h?=
 =?us-ascii?Q?us22RuTC7oMDpaVdV5jwNo7JTijdcGXggcLgFbJq4y6a+qmTDc7XHwEj/6dS?=
 =?us-ascii?Q?NFwQXuP89V0l28bbp9hpQu0z7lrBPyTH1MOgh4j5R+UAUsekV6vQPVcgY+8Z?=
 =?us-ascii?Q?gfcs3sAz8rjDviMcrClh1pTwNRgBqcF1tZraJRt3kJsc70Ab4SElqh6PdG5W?=
 =?us-ascii?Q?jo7tE3jwEPnIvujPNBI3TMHSoduokTAYH0x8emVb5fCUOux2ZDRasd+QE4c2?=
 =?us-ascii?Q?BbzkONQ6Z87+zjwwhVqUBi3ZN4QTeRc0UcIfS9ZaDGli8r1ii6IkscfZeKgX?=
 =?us-ascii?Q?AylFJOw03+DbCy+qAR4HJrBhPrzPMPlyd7ZX/1hC0Hcl2AKjme9KE72wrz+I?=
 =?us-ascii?Q?dKJauD1MDawVcRURdF9oTguVxHR7OSke387wgEK4Yl6bdqIbMnCondybPHRE?=
 =?us-ascii?Q?MqfLSSnxYJ8K4SusfYPQ+9glI2WtKdHm/xQGyxE47NNKsIOSV+3C/3EZ5TcG?=
 =?us-ascii?Q?b1oVezG1SjemHw2fIgCiADNCq8YIOcq+fPRZ4b+1cULnOiM/m8biydUSb+Qt?=
 =?us-ascii?Q?gf1yXCG7rkKJ7LUa+hD0i3p1WI3+P3eIyy0CYHJKRaA9HYcUAbFCgSPWXA+w?=
 =?us-ascii?Q?w52Bz/pBk252AS61ixRxlCCKhX6tFt9paYmT3PIZdF1Sz0UyCHsZfXR3z2AQ?=
 =?us-ascii?Q?s2+7q+agyhCaLhX5CXdIC0wb1RzVkPp4hvu2uzfs3QWsP3RiKWV0hSRFNl6M?=
 =?us-ascii?Q?koM4Lq1tEeV6bQdHSCQ9QM41th11kr6rH5uA17tAy/2vure+p5mmk7velUzl?=
 =?us-ascii?Q?WLEiU3T3bTFcPO1df3U23/oKTYZ2k9xAduKKvP7SkcNUD147vWbd14aWC6j9?=
 =?us-ascii?Q?vpjDQvEzu3izqa+480N9ri7yH1ZGniCaUqxh8W5Z3aA+iBTt0JYwIfixLE8G?=
 =?us-ascii?Q?HTQYQC4qvwuf4BFV46qvo4vasVfWMqqIAE2r07pr1NAFLuxswsNEixC/oRwl?=
 =?us-ascii?Q?2HbhLw9Ye2NFT60BwiczhGkQPiFd2l8IDQOF86tTAB4RQjyoOs2migO/Yk09?=
 =?us-ascii?Q?5FOX4vr3xr8r6a3VWwXXCc1Fk2pKmXwLvpXOHhXpvzPtZm/DtsVxkTzuaz/Z?=
 =?us-ascii?Q?BWU0NXRZmQdtfjP/8ftM+7c2X/+8LDm6pdq2RmBSCLPvmUalEAR7qmLM7zL+?=
 =?us-ascii?Q?Pwu/AdUHU8Rk1FG20OKSrNgX1ETNmx313DGQVTrCu+HPpuz8fioy17pnggse?=
 =?us-ascii?Q?X9VYLWrdxXRZIMMpvaDAJZvql9T1cPRiKTqObyhKXYEjt7azHUdxcWAuqn/I?=
 =?us-ascii?Q?x+/17KNiq8gG84DQby5snpB7cnZKc536TgoAAnI3UMGUvoTPiFsmTx3juihR?=
 =?us-ascii?Q?Hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fb46e8-777a-49ce-fe89-08db5e15770a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 18:17:28.7216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6BphOsQnBOUjG+rrQ1Ggv4eVYnSfhAG+YPulo9fpDLtVd2fABxHewxdXCR9cEno0Cg6sIxrpvpF/3HEIWaGpSgpf4oYMXP9TCi3QNqJSGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/rpl: Add missing RPLP and RPLS
 entry in xe_wa_test
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, May 26, 2023 10:36 AM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/rpl: Add missing RPLP and RPLS=
 entry
> in xe_wa_test
>=20
> On Fri, May 26, 2023 at 10:12:04AM -0700, Anusha Srivatsa wrote:
> >Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> >---
> > drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> >b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> >index 16f7f157c875..f86fa0f2ce10 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> >@@ -58,6 +58,8 @@ static const struct platform_test_case cases[] =3D {
> > 	SUBPLATFORM_CASE(DG2, G11, B1),
> > 	SUBPLATFORM_CASE(DG2, G12, A0),
> > 	SUBPLATFORM_CASE(DG2, G12, A1),
> >+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
> >+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
>=20
> is the order correct here? RPL being a subplatform of ADL makes me think =
it
> should rather be grouped with the ADL ones above.
>=20
> Also, ideally when we add a new platform we already go ahead and add it i=
n the
> tests here. I'd either squash this commit with the addition of RPLS with =
a note
> that it's also adding the missing RPLU  or squash this into "drm/xe/adlp:=
 Add
> missing ADL-P entry in xw_test_wa" with a different commit message: "drm/=
xe:
> Add ADL entries to xe_wa_test" and move it to be the last patch. We also =
can't
> have commits with empty commit message body. Something like this would
> suffice: "Now that all known Alderlake subplatforms are added, add them t=
o the
> xe_wa_test kunit tests for checking their WAs".

Sure.

Anusha
> Lucas De Marchi
>=20
> > 	PLATFORM_CASE(PVC, B0),
> > 	PLATFORM_CASE(PVC, B1),
> > 	PLATFORM_CASE(PVC, C0),
> >--
> >2.25.1
> >
