Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7C8C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 14:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E610E35E;
	Tue,  6 Jun 2023 14:12:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CCE10E35D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686060774; x=1717596774;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tERf2tndL2nRPHtsEcXG8neXc5KEsNCFJSNvLPuHlSw=;
 b=Y6paLkSIfiDnu5+0DXSJaCddeAJQTGW3rvhLl0i9hsQvztE7MxjN2xUP
 HdVSU7yLos/K/r4WjrGoUdu6Xn6LW+X7OFwLsgsHL0FDfAFqfTZfT2zeY
 ltWEuwqz6LMzmq2wvIH2sciaGUelX8RmGifr4ayN04wEby+1WKV8OCEva
 foYhYSpAa6hwBA6FMf8+25g05jDKKSrwbu/j1E3oJ2Kdd/8YHoAG7Gz1D
 Qhuh3aSIqrpkAZFm6EKpJ4P/8kYeDWlZfQ5gLdQo1dT74phmd0F3ntwg9
 /ED9R4gw6bOcoimSHQkprtJBge1iadC1e7GhG70ymxIQ62kk0xDBszzGR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355538092"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="355538092"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 07:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709085796"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709085796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 07:12:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 07:12:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 07:12:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 07:12:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 07:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ8nFc4Ou/WjDZR3hFTu3y5euHuG0BusLiKCYzt2uV4DY9XeueP39u/0zI/52Yhv3mH3s+b7LoT4h8bFxEkPqgF5meAnRS0w8QIpZtL2Zq+qOaert9kIOfeNspHTu1SGU18X1fLUoRRuzjkvFK8WT+/fc76AzwRkyXGSuWaQcnycHgJeHvQcyVwtmbCIitbhJQchq14lkQjUd8z969VKILBcfhLo/f2URxb5n5Uk7Id1RVv5XVOGzViGAXXPKak8fBCkxuUKA4Aa9Bp89hjzlRnjWeSxFabBaXJ8J+7jSJUSFMZF+Iv7NdmIyxFjdwDFXgOA9LM5ZHPNsihY4fTcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojj9RE2AxSMrBrr3wXpc0uF/AKpiQmciWcILM5nIeTI=;
 b=TmMQlP+8x4CmM+rmYTZnEKcrnKFzaK2mp1j1A1hyiafdAq1B4aBEMdHSqhTtvfHaVqlZ2HMUVO5vSlz2gmGjK0N38zJsEdSZFUt/ZAjGmoVgqfXaakhGn7/ET7aJNDNnQn9uJSBFjAVVEHM5KQLPb+OPXbrA4JKVg2PxGs8/sgBni3ce+YV2eQBYO9WacD76SCQKeK83qoXP8gu5rnW9t1BPoogvwmVOM/Ku50qvuLZIiGqGI7GRTTunYaTU+ma89xFxZBrPi9ueIwHqjA9ti93hpDaWUaz0ByOah8VXmLVzl1PVAXohggkd3bqM3aqgllSYrVqq9Ehp6aVVZvVDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM8PR11MB5623.namprd11.prod.outlook.com (2603:10b6:8:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Tue, 6 Jun
 2023 14:12:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 14:12:50 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQgAASFICAAAWnoIAAA9EAgAACb4CAAAyggA==
Date: Tue, 6 Jun 2023 14:12:49 +0000
Message-ID: <MW4PR11MB7056D6E33C19EA990A279F78B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB6204EBA18C8FBD283C2C3C8D8152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204EBA18C8FBD283C2C3C8D8152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM8PR11MB5623:EE_
x-ms-office365-filtering-correlation-id: b37a32c6-bca9-4b52-08b5-08db66981c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6J6MPzAxkWbOou299N7HA/A2QjUI4+Nmi+Goiofgvi+D0xQTm7udg/BUkTpSWLwKGej8TqfCIgph50KcMqZ7dQp9ELG9F82ESiIvXzKUT+bMeN3BvwaK9w4C1vO5qWrY5HaDvj8fA6Jc6zxZHb0uJwetgG9D4+ODjeGI4PtUesRcTHPDzu0OIrr70U13B14YeGPnuvZx+AhO+/KCaRaGCVhUauThYepK03r8RVjsegTgKoVYFoEcIKMu5gFxNqL0xassPmsSoF7JbrpCCIZV5PjxxNdjFG3Kc0p92nNEOYuNXfD0eGPujU/srGplTjcYEahCHBglYpOqWmhKyqKtRKuoDJ9O7Pi2mSB/Jxa7763yBgERfniG18D9lSnMm7hi+H1ZpH+kDgDJ69LccRu1otoaCHYWB9FuoBnu/TtXOCGx3dp3n1And5D+ZRlJEGWbuia7NocoCtg/37dgKO+gbSD2RPULUdHnTYBNW5D/RDglZXcjZwsEi8b92RACyUQfFUVHLcRcoQJYY9RgmsTzdpqMXxTu3Q2YXtZJYMJZ18Tlaa+8PPQeoeiy1Uwh3uvEMkBXKLOqNfP/R2FPXvRgXqfd+rNiPfup9CmIyeZdV3NpHXsRbrCzfLre9HzJ/McC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(8936002)(110136005)(71200400001)(478600001)(5660300002)(8676002)(52536014)(38070700005)(33656002)(86362001)(2906002)(66476007)(122000001)(66946007)(64756008)(66446008)(66556008)(82960400001)(55016003)(76116006)(316002)(38100700002)(83380400001)(186003)(41300700001)(9686003)(6506007)(26005)(53546011)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7R5sxwd7Yx+r5od+yUhnzdqf3z8vgmHdsoz7hM2xhUP3aCaNgPaBJP05tSqR?=
 =?us-ascii?Q?SPdmK3OBxnjPPXhtBPfOSkxzz/e9p0XX7kBpn7xHa6C7dNf+McO3Atm9z/z5?=
 =?us-ascii?Q?gP1rjcnF8u64iRBTS3EBA7/H9HRW7+P438rxt5vwPOfuCth9YTkLnfavy0N8?=
 =?us-ascii?Q?kVur0at7VdPXmHJqQ0/6gmCKtlzzHAxZ0UNnrJyY1Eerw9hZwvTxaXx6kRi6?=
 =?us-ascii?Q?qYd+kP+w9CAzIZlDc7hiwnZUhL5NN5S5luP6xUNthJv0Wu1tppuNGx4UEdSe?=
 =?us-ascii?Q?LuPR12xfcfAhw1d5E3a8wGqYJl25XEMd4+y0rMorJCHaG5o4qxyTAnOs/heh?=
 =?us-ascii?Q?fTJqHzqjA9ys64DKAJb2F3neGOVW5Gda1zCbZe+7aXaiV5pZX8Bv+iZfg1NN?=
 =?us-ascii?Q?BWunJ4zq3likuBSsM6qx4dW7RKp3KZfT/S0wepaZ9VLbr0D15660Aj6AQu6z?=
 =?us-ascii?Q?9dnsCgxXw9yJAoQz4MICJLQgoCGNsxIqgHIpcXYBa/2lYYTlmQKYbRspRMXg?=
 =?us-ascii?Q?3/MalTHh7ztLuPW9LjKtFfgqSyA3so1EABu3LUulALqs1AXNsuhyepYYu6OV?=
 =?us-ascii?Q?ZDnE54EC/ZfOSPNRVlXESozdrQI2REWsRopvVaMmRjEEiponITy3l7PkRoPR?=
 =?us-ascii?Q?3isvd6sLquIrOnC71RcnoYNM/i42LB0kbddu8hWQAOSdACh4WgDvOURSUW9G?=
 =?us-ascii?Q?R6yIHWTYkIs5LujlHQotfZyY52tKwbmI0BP1I4czsvQmTuFXX/Mc0p70X4TQ?=
 =?us-ascii?Q?AmRWQNSKWvWlvLfatIcpTw4I0SFjsdUqsJNYAGNTFVSE6pqmbejna2CLPYjC?=
 =?us-ascii?Q?zqJmEz8cyNXr7PAF+0iDp2M1b/MU4e8ELGAwR5WEqh/2EC2YNodRC68WbzZ4?=
 =?us-ascii?Q?yxEDEcd2Y+lpCZnR2Il6B/focVtn1VuOFmUB4wO7vVY5sD3jQjJRA1HzzSKl?=
 =?us-ascii?Q?N/2HFYe9hULDAPEFwtGXQR0O0rsAAR7Am+d8cZ96pazaLgQO6G72M9LpB4RV?=
 =?us-ascii?Q?xLZynbbfNQJFcjHphwK5H7itwhwFVdxCrhuDGu+uZ1IehhTsU/FFCarWrRTj?=
 =?us-ascii?Q?1ejG/7YcFGnvw5N7uOtAIaOZE8HqxeXslVek4aZJmLgffL7EBeTXquKv0wSX?=
 =?us-ascii?Q?9dW94CFpkv2KvygUGW5Tf/jcLUUD84jhdBBYasKJoM73qDdDaZKuWatsG7fA?=
 =?us-ascii?Q?H/xHrAj/PJ87R58EHQC3RZex7av06P62n5J6qGI7MJZXg6nD8DnuZFGyfs3X?=
 =?us-ascii?Q?siI2eTAjgYeQlntnUbAMudnsH1ygueuXwahih5E/E88Qi+I/s0wMveYjjJxS?=
 =?us-ascii?Q?NlsAvjGJP7agDK2BeIY0OT3ryMVY+VWSTgC0dM5d+Hds7KtHbvCug1sbo+VN?=
 =?us-ascii?Q?NELiHgps5z1Yweq96csk9vVBDqQT+NP4yuAAa0P4LQzlpUUwoDGREYhXnja6?=
 =?us-ascii?Q?UQJKCDchSDuyCGTvKYZ8hgnfAcUfe1WIvZMv3/TPqE2vP0NlhoIqMRFFp+ZN?=
 =?us-ascii?Q?uxmQtriwppFbSbr1u9WFsX/cusQ2Lmp3Ij5eIH1c19Lhqs0MjtKbO2enKckA?=
 =?us-ascii?Q?mObS19kBhf0+akFn5nODGf2/ahRV0l+ks1tIWvpQsjw0x+pBggrIk2JSmf1l?=
 =?us-ascii?Q?1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37a32c6-bca9-4b52-08b5-08db66981c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 14:12:49.9885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5H9VxpTK+PR9IGRDN9giTvk3FeOnFXD7KGGh5KjSU2KmbmLxVjguNJX9FunyHy0xQZlVP+dqGIKz2uVPgFncXvNDPdkCW4bGi9KGkTzyf1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5623
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 06 June 2023 18:49
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Sent: Tuesday, June 6, 2023 6:42 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Ghimiray, Himal Prasad
> > > Sent: 06 June 2023 18:28
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > Sent: 06 June 2023 18:06
> > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > intel- xe@lists.freedesktop.org
> > > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > report per tile memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > > xe@lists.freedesktop.org
> > > > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > > report per tile memory size
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of Tejas Upadhyay
> > > > > > Sent: 06 June 2023 16:43
> > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > > > report per tile memory size
> > > > > >
> > > > > > Add sysfs entry to read per tile physical memory including
> > > > > > stolen
> > > > memory.
> > > > > >
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > > > ++++++++++++++++++++++++++++
> > > > > >  3 files changed, 53 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > index db61da4d6212..7b5443aebd00 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > > > >
> > > > > >  	/** @mem: memory management info for tile */
> > > > > >  	struct {
> > > > > > +		/**
> > > > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > > > +		 * including stolen mem for tile
> > > > > > +		 */
> > > > > > +		resource_size_t actual_physical_mem;
> > > > > >  		/**
> > > > > >  		 * @vram: VRAM info for tile.
> > > > > >  		 *
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > b/drivers/gpu/drm/xe/xe_mmio.c index
> > > > > > 475b14fe4356..86a7c65c301f
> > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device
> > *xe)
> > > > > >  		if (err)
> > > > > >  			return err;
> > > > > >
> > > > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > > > tile_offset;
> > > > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size,
> io_size);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > > index 821bd49de277..d48c599e8cc1 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > > @@ -22,6 +22,43 @@ static struct kobj_type
> > > > > > xe_tile_sysfs_kobj_type
> > =3D {
> > > > > >  	.sysfs_ops =3D &kobj_sysfs_ops,  };
> > > > > >
> > > > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > > > +device_attribute *attr, char *buf);
> > > > > > +
> > > > > > +struct xe_ext_attr {
> > > > > > +	struct device_attribute attr;
> > > > > > +	show xe_show;
> > > > > > +};
> > > > > > +
> > > > > > +	static ssize_t
> > > > > > +xe_sysfs_show(struct device *dev, struct device_attribute
> > > > > > +*attr, char
> > > > > > +*buf) {
> > > > > > +	ssize_t value;
> > > > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct
> > > > > > +xe_ext_attr, attr);
> > > > > > +
> > > > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > > > +
> > > > > > +	return value;
> > > > > > +}
> > > > > > +
> > > > > > +	static ssize_t
> > > > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > > > +*attr, char *buf) {
> > > > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > > > +
> > > > > > +	return sysfs_emit(buf, "%pa\n",
> > > > > > +&tile->mem.actual_physical_mem);
> > > > > > }
> > > > > > +
> > > > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name,
> > 0444,
> > > > > > +xe_sysfs_show, NULL), _show}
> > > > > > +
> > > > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > > > +
> > > > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > > > +	&dev_attr_addr_range.attr.attr,
> > > > > > +	NULL
> > > > > > +};
> > > > > > +
> > > > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)=
  {
> > > > > >  	struct xe_tile *tile =3D arg;
> > > > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile
> > > > > > *tile)
> > > > > >
> > > > > >  	tile->sysfs =3D &kg->base;
> > > > > >
> > > > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > > > +			"Setting up sysfs to read total physical
> > memory per
> > > > > > tile failed\n");
> > > > > > +		goto err_object;
> > > > > Will do kobject_put and return 0. Which is wrong.
> > > > > Better to do kobject_put and return err here.
> > > >
> > > > I don't think I have any action to do based on error, clean up was
> > > > already done. Am I missing something here?
> > >
> > > In case of sysfs creation failure, you goto err_object do the
> > > cleanup and return 0.
> > > Should you be returning 0 incase of sysfs creation failure ?
> > > >
> > > > Thanks,
> > > > Tejas
> > > > > > +	}
> > > > > > +
> > > > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > > > tile_sysfs_fini, tile);
> > > > > >  	if (err)
> > > > > >  		return err;
> > > > > >
> > > > > > +	if (0) {
> > Doesn't make sense if disabled for default. Move to sysfs creation fail=
ure.
>=20
> This is for future sysfs entries, which can point to same goto err_object=
.

This is incorrect. Why should you do kobject_put for tile folder.
If one of the sysfs creation fail why should it lead to kobject_put. This w=
ill break other sysfs creation as well.

For example sysfs creation will fail on igpu and you will do kobject_put of=
 tile.=20
And in other patch you have moved gtx parent creation under tilex parent wh=
ich will fail too.
Failure code [err =3D kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.=
id);]

BR
Himal=20
>=20
> Thanks,
> Tejas
> > > > > > +err_object:
> > > > > > +		kobject_put(&kg->base);
> > > > > > +	}
> > > > > >  	return 0;
> > > > > >  }
> > > > > > --
> > > > > > 2.25.1

