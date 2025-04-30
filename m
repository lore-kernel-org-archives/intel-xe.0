Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE71C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 13:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB5610E7C2;
	Wed, 30 Apr 2025 13:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAeBRuh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2D210E7B4
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746018113; x=1777554113;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L+AQlS2x2O0BdjR4aM//mxsxOEMXI/GU95HtIDKEgsU=;
 b=iAeBRuh07s7zXS7d3lZ2t03OZPIDffp3sSoTbkS+JHowiBEw/SnBBcVY
 iiF5AiCeFVa219UKIu5KiUiH3fmFQW+O2jGvH71yAgHWrQFUlTY2cEPwE
 rmrgl61D2gf9kYrb9v9rsM8QOYFdAI6wF8TGdrQITEf9Haov+1QDDwm8Q
 U+UpzN9ufMJcPjese2BkwNtb4ffM/fchncBCgYMV3YknTujBg2u2juE24
 oMh1bKvu9p5Jlmj3OkK8h6jFv9UGEpRZ1BJGxMWqevZu8p/AQOJ2gkNrq
 LrAC2BIZXfg71b6ClC3NjwHf8ZxuKKfedsgthwhTo+W3TMQUHHGJR1ghp g==;
X-CSE-ConnectionGUID: VwqLnRi2SxiRfUFKQWUwcw==
X-CSE-MsgGUID: CLTzfBXOSvCbmk4Sp/ZMTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47764902"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47764902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 06:01:50 -0700
X-CSE-ConnectionGUID: YzyKascpQdiCbV47DVEMow==
X-CSE-MsgGUID: gsnrHBfESx6VzwmWwknghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133830863"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 06:01:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 06:01:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 06:01:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 06:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wazIrP6EOm10hjGVkrYhzYkfbEZwTKemtIWaVld2MPFt335MHOqvg6VIVngSztKIj+YKY5bx7rXD8MIy+pDcJTCKmlBse/97o6pmVmgcAKVUnU5ol9SZLad37fexSm5BOj2IpOh4E90jU3uGs+iDrnfpFS4sAi+W394hHVhVC0HxNrJHgA9Yq1fbd0NfG2n4UJiZV3xmFNrlvAcDbv7fKSZBjchsyf8/0vHetJVJ1IdqrcxBQjRNXKeFqN8BT6YffaZ3Gtlf4UJxfaY8ZjoGoymUV+kZqrGCa7HozTEahKtU1aO6Z7j5mkK2599vDde40wnIZ2QmUGkwGx6C/IQCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETqxr6+6RjYCx/B8U+K9RzsKGmsodo16+vQqe0YULu4=;
 b=x+rxCKO7oFiD72iNOqLpg/4bnFRZc68J5UCho//jSfpRhJ3LDDZoBzcB/5BdXf5FKJtGFf3sguleS2n23+oXIdAUmxxLXPj+NvyvbinzFELCImYBfx2P6diBXnfMsm7vXJP0FPw8S/0MeXH0RK/A6JxENEqpcVJVj67Bjhu3NdJuND9qmf+L94UKggnrQuCrTBB2bA+guohb1bFzJm4m0/DRIPiWS3EI3CrG6SDBW9zNPLT88g+r+NXcY19Tb4gJP4pBmttnhScifeDVeo0VYE+WTIawGmCFihy6u782TargSmY86pChcN2ueeCOaYaciEH+HDi1ue8r/+3YwTOCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 13:01:42 +0000
Received: from DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932]) by DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932%3]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:01:42 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Topic: [PATCH] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Index: AQHbuQrvgwVpuVlBQkm2NxmFM6zsS7O8HUIAgAAQinA=
Date: Wed, 30 Apr 2025 13:01:42 +0000
Message-ID: <DS0PR11MB8686D6C5D7DF55570ED8AAC1F9832@DS0PR11MB8686.namprd11.prod.outlook.com>
References: <20250429134649.4747-1-satyanarayana.k.v.p@intel.com>
 <87h625vow9.fsf@intel.com>
In-Reply-To: <87h625vow9.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8686:EE_|SN7PR11MB7591:EE_
x-ms-office365-filtering-correlation-id: 2e792501-b277-4f05-e399-08dd87e72744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pWDOZ807phv4FJhKsY7Nx9Fiqz5PmKA2BAKPmtrku3uSmk+DvFvJVrY5dtF+?=
 =?us-ascii?Q?VIyz7Sm9gF42DaCsHytcbgD7iR4u0HNScqbetKBdQMOdmmjCGASwDGwRz4Ib?=
 =?us-ascii?Q?2F6HPhWtXGDCbK1zp4C/ATCQ7mdxUMJ7/C+ZpzbAx0cKSjOFS9pMOdKaE0Ae?=
 =?us-ascii?Q?1xq9o0rnTgrusYnkAWDlifYNLY1DtPkBz2IrTCaQfG6jHcy333OQeyN11RjT?=
 =?us-ascii?Q?Nh3+I3ziN4C1lgvUvVYyHY3crstfy61jaoxhN+fpNOt9onhcJ0JNfRHe8v8E?=
 =?us-ascii?Q?lBw5PnJ7ofw35KsKBzIZEmt8KEkrQq0Ziu+S9wj1o1ESeF7/v9IbxtEFN2tg?=
 =?us-ascii?Q?YDWFvxZbGPdZym1w4FkP+2WuYfSiYxVVzLCduli+IkDLJNvwPPQ4fdKFkzRl?=
 =?us-ascii?Q?wGKfu4UAsn7zKR2Viow4okardzF3LPfldu986oKNHvUG73EiF5ifvaLDJS43?=
 =?us-ascii?Q?8nuvbO7WOuXxGoahk5jIiQHvVxuRNc5EbX9kDBrkIzQ9hLm/1UtFjDy3dklc?=
 =?us-ascii?Q?t0Fbd+/sM+P/5W5AlPHZPACilT5eabfUShdNi2cCHmHWxJdzgVeU3tRuO7Yy?=
 =?us-ascii?Q?2pqCyO3fL+fbvFKdS2jAJFZIiVJ1msrbPnC6FLQEnx3sd40IHn8p3wgXPSYS?=
 =?us-ascii?Q?kKU6DxFVTbPVWKp+HvYiNYF2pNJjpjMZkAWbsHhSvtb7Cx0gs70IKnJYTXAX?=
 =?us-ascii?Q?P94+YUtBqpb2BiF/Qv2BGV3bK9rh7PpljmEtNym57UaDzDFBBsAnnrN/2Hzk?=
 =?us-ascii?Q?gyaMXO46s09npfAXpCZfyCF7SO7X6N/7fScEk3EKpVvb8gmGKEC575zftSht?=
 =?us-ascii?Q?Zto3LpZfp1Oe3X1QkoIc3niSRK4NG/JVqFOLwy3iNNaEcwvm2uOMngCFZ0St?=
 =?us-ascii?Q?qq3+XwhlKnz2MGYupKVEgvcn85Wbkks8Jq0SDj+/LM62AwK8nLaWKugjhPZ0?=
 =?us-ascii?Q?1vshOqOvupExH/x/x1bmI4/WC2KdrvFzMuUV4iCA2k5RblWcRsARsJMfToqN?=
 =?us-ascii?Q?Odd00XMJRKzKhpirkRUUirM4qo2X29r9ltY5+orhNspvmceqdswwJi57IXVF?=
 =?us-ascii?Q?IWduTFyDGzCDURlE1ROLyLW5VPimJw7liPaeUJ1NdfJ2xeUDneJa0TKi/h+d?=
 =?us-ascii?Q?eAyJ0bxokwSUzUMJ1qTv0iEp7Cj02oRj02Ipmb+gT4lhZlRuFG6C1GPzXwNv?=
 =?us-ascii?Q?YZyeTZG75vkx/jB8D/vOzA5s4UjQWOKuLxm/miNNR5/XqmigCzxZuGUylhse?=
 =?us-ascii?Q?xWDJVrh8WxOGvSP5cyOpG5e/CsPquAbLbMJaBsOhFawY0wWb38q0oy9JhyGW?=
 =?us-ascii?Q?P3CbMSFXmKX2ffTY8grFCiq32T4td0XcQETSmryctyFENZbNjxqaTvds+2lY?=
 =?us-ascii?Q?JZ6zZTU8dhWKoA1ioyKhDX9W8AUf35PBtSkXJShd6hWC3Sh3sFMo0sRa1vtm?=
 =?us-ascii?Q?OoKRFdIcqvODwiVMX0X2QAqMnwmt8A5LulaV2qzkRflGWtld3h4xcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ngVFRcPW6lPDLZEyDUMG56opEaQpwt2P+uN3dj0n63nQTNZmxAAj/OY6fdCU?=
 =?us-ascii?Q?6v7RnMH93D5yMXZ1dfXYanRkhcYjxiZ31XC4LkxVxep+fDTTBjtJ8k+2dyyB?=
 =?us-ascii?Q?JbpRquDAab7V7Q6L7PrDe6o8s5HymwacdMDFvdgNZIjo3c34deEtL4lyFiov?=
 =?us-ascii?Q?0ktcoEHWwBjYZnvx3W2AdVMkrmbkctl6DxBdJpMcrMCVk7KXrB2jRr5fquaa?=
 =?us-ascii?Q?+56IucMoC5lxwchtH6HdkJocUaxil1A7DDf0nk+f75I+bs3YseLfdJ6EpKwI?=
 =?us-ascii?Q?AX5dMSSIHeuqjidMdIlASIlJR8knBfjR7hOwWEiDPMQDbEypLmAxbBOppSHi?=
 =?us-ascii?Q?4lYKERoWh3C8nMyXDYBnghw28lGDZR/AKKRSBSu5yfHDGKxewRlbS1oQ9vyf?=
 =?us-ascii?Q?S4El3ZCo4+ZBhECVsMqk5uCkMu1yxr6qd/ffiCeUzxTroDuJU3L0cU+VhB4W?=
 =?us-ascii?Q?9o4eEwmLkmb+lVl+PZNa0EJ7RpQ/WyaAMlG3dDgpYjbiCoOc4ZuG05UGEHBe?=
 =?us-ascii?Q?5LMnQehur59wlsG0yO3oZTJkT+dSGAuY7aoMQt1ZlVz7ROAwB8Y3sTO/fJt8?=
 =?us-ascii?Q?7w5TdZKximd6MQV1M6Yyf8/tDhuHcukoG7P9gLLw1KUmPbhHSxl2EAKrrrhc?=
 =?us-ascii?Q?4fX4pTy7IZqi9EOHmCj6MfN/KkXF4ldwfVd1SOTK01rsHQZ+UUws5D94xeFY?=
 =?us-ascii?Q?IT3Ap2FjmfVMNr6v/SkLPSsZHlBNfK3J5YKXEUT+ZK/egg8iKZSVD9qlmVQm?=
 =?us-ascii?Q?wOXJRdZj8Z57DOO/+MjSSrvb/PJip7KJucIAZiuXYieT5iniXciyw/+uniTW?=
 =?us-ascii?Q?yv0r3amcmCqQRXsifEE8MINZb9Kw7IdVebmIzu2Nca69Nk0DyGghCQnViGNe?=
 =?us-ascii?Q?tJkh+EZgbapXs4lNcyvSApiycW+sCbJDMVpX1WFJHzAMVbahlYFQW32HWIg5?=
 =?us-ascii?Q?TWgWFU8MRBQPzDCMr0vZL10vivtMxouCd/4DARQOBMxbTI5O30B8n8dFYsU/?=
 =?us-ascii?Q?0sjkQMsYDQwzthhPeLeUTO10Zf7xwAeS5DOiPUDHU6uvzNpGp0PPGLpd0UbR?=
 =?us-ascii?Q?5ZWgXupj/5yNUo2G7FOhtm1aos51WOhTV7+W0h0+x17ZZnml+ntIkA+gzDup?=
 =?us-ascii?Q?WbtraKrN6B0ZQdx9f3lLu5Mu3FGO9+pNUtxCjUqEUKHStJ46NNB6+aain/7p?=
 =?us-ascii?Q?u/7N02agxX+QhiN2+iR0Ns+Rf3aw03/pzorxsVZBZarsDNk4oin4zxY8F/Fy?=
 =?us-ascii?Q?B6NrPqbP8xjcicbsxwOibFujJ8MWUMhIjEmWScPJrOfArA5dqW600T4H6Ysk?=
 =?us-ascii?Q?Ejo71Qk07dISfVXv3ss2TI2vNE8NJAjbG9H1fcJhat9ZSsw4VJX+AssJMvhp?=
 =?us-ascii?Q?cMQqn+17q78nBzuSul7rekOoYJ4JOUIeW8ubzhf0VMbMGqjDWN97aAto05m+?=
 =?us-ascii?Q?3/ZZskVc4utXruilyXruNxNXoyX/uK/If12trviS6FB4NubFbto+UldgDjSS?=
 =?us-ascii?Q?Vua81v9ZTNZGpNfTh33zgFIhb48k+62adPNa837ZMIOXrBJPvwL0P5GVX1Sw?=
 =?us-ascii?Q?1Yj197UmTKF341W8zuhxQNDhBznDIJsPgMSbMxFrfWc85poF1jrbmx8IyfoC?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e792501-b277-4f05-e399-08dd87e72744
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 13:01:42.2199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2+PRVbWoAJqCsP6Scf6po+q2P3AHLYmH9lBxWUx9qjtStRQx3jOTxN1PQfV/nTp4UwAHDJjxwybSEbHlQIbhsoH+yaTwWzwpfN+CL/bxZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

Hi
> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, April 30, 2025 5:32 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John =
C
> <john.c.harrison@intel.com>; Chauhan, Aditya <aditya.chauhan@intel.com>
> Subject: Re: [PATCH] drm/xe: Add helper function to inject fault into
> ct_dead_capture()
>=20
> On Tue, 29 Apr 2025, Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> wrote:
> > When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> > functions, the CI test systems are going out of space and crashing. To
> > avoid this issue, a new helper function is created and when fault is in=
jected
> > into this xe_should_fail_ct_dead_capture() helper function, ct dead cap=
ture
> is
> > avoided which suppresses ct dumps in the log.
> >
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> > Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 2447de0ebedf..3a49e432f74a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1770,6 +1770,12 @@ void xe_guc_ct_print(struct xe_guc_ct *ct,
> struct drm_printer *p, bool want_ctb)
> >  }
> >
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +static noinline int xe_should_fail_ct_dead_capture(void)
>=20
> IMO noinline needs an explanation. I can guess, but let's not make
> everyone guess.
>=20
> BR,
> Jani.
>=20
Added explanation and sent new version.
-Satya.
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
> > +
> >  static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb,=
 u32
> reason_code)
> >  {
> >  	struct xe_guc_log_snapshot *snapshot_log;
> > @@ -1778,6 +1784,13 @@ static void ct_dead_capture(struct xe_guc_ct
> *ct, struct guc_ctb *ctb, u32 reaso
> >  	unsigned long flags;
> >  	bool have_capture;
> >
> > +	/*
> > +	 * Huge dump is getting generated when injecting error for guc
> CT/MMIO
> > +	 * functions. So, let us suppress the dump when fault is injected.
> > +	 */
> > +	if (xe_should_fail_ct_dead_capture())
> > +		return;
> > +
> >  	if (ctb)
> >  		ctb->info.broken =3D true;
>=20
> --
> Jani Nikula, Intel
