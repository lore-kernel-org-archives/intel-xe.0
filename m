Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BA5C001E0
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 02:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0172B10E573;
	Fri, 20 Oct 2023 02:38:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFC210E573
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 02:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697769497; x=1729305497;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PzvfUIWubuOaBxAm/YsnByz3E18ClrwOchfUtoLa4B4=;
 b=RHlU2YlSxvJn2Viwi9GJBd4nvtge52x1Yzqawow5eyX2BaIp/8jKTqrW
 EOAjSXVolx31EfUBv7JJ7MWNt4AzQcZtxFO+pqyRfWHcGjinhuGQuglgn
 47TrktbVUMoCOtWxqyNidXd88b/uwYwlNiUPcR2C9QqPTiWmqiTjPkbO3
 Ri9bXwEtJFlrH62UaYmCHSsWYKkTzOMu0kecHVPVYWi3nQiaKQJwykAAw
 CZgr4/cdjsez0W3wN5hS0DHgMedCP9SuLd44BgAyLhfh60SxHFrxWLZ4w
 h5WTsxSQVfa7c7iuxNgiqcuoVk0HicHeiPLj4de4bVuXE0PUDi/jd2u7l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389278258"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="389278258"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 19:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873744905"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="873744905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 19:38:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 19:38:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 19:38:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 19:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Miv39hwM5D6G0II4N8i2QO/jaAxIbLGB6jAIpfEEl+T92wpsFJQwAKC+vcxAxBZEEQPiRO0rN4YVMTk5C2WFgtRYZlpu7Uag29n7VRDHuSUhfFtpPZW0m0hDyPSAPJmiSTGTWxTfv4fAIBElqOllaoz2TE0q7i5GThWyB+Is+VFYGbgt7sc0GNibuVzgXIf4FJ7Sd4enV+RSVe9fkO7b25HobhMuJLDous+pJKIRBRxMapYOdlYe8kY8MsulbqZ5UVPxDUl+g6MzVNfOYNfvzS1JeOBubodK6DR2IyYt6HHNyNikOOrCRLLC/S7yAajbPTunGXXpTbSjMbNuof3MBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqu0ce76308NCgFe48shKDSOtK34rcvmYb7g8R7b4yc=;
 b=mqD+iTV8GlBraNNf03gSzfpWCUu0y+w6UOrgmGqfE87VMwDOOS4yaV/VpBDmwLYmZC9o5IUHDMAT7CqZJ3JTJ/ChnuOrllLP3b/UA6HBS/hcg+JrkYJbjRmxVCzABkCU8Stf8CQjf/1DRc7qdMQMvyeMJZlYCEsvyiYFECN74SYFep0978ehwqZNVnKMFj6QFBCVoksYUaW/qGVj9Sz9qYePO58q3R8KMVlcsUxUIy3xmwFAKPG0I5X+ngM8e0dvqxob5LH7L/mr5dxcJx0rgpaNUOyC8q3/DCVVfDlzSuaXalgyWyjZRPPpitXEBOeX+uwAWOvnnXwQlgsUa7d9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6709.namprd11.prod.outlook.com (2603:10b6:806:259::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 02:38:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 02:38:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar,
 Janga Rahul" <janga.rahul.kumar@intel.com>
Thread-Topic: [PATCH] drm/xe/xe_exec_queue: Add check for access counter
 granularity
Thread-Index: AQHaAvccyORkg3HXHkSpv3lWsJMeubBR9YOQ
Date: Fri, 20 Oct 2023 02:38:04 +0000
Message-ID: <SA1PR11MB69914FE89BA3148401AC19E092DBA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231020014126.2033504-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20231020014126.2033504-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6709:EE_
x-ms-office365-filtering-correlation-id: a09e8884-1a25-439e-8645-08dbd1159622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RkH0WpRgolPFNzXtvZd7qMAkQGwsW5OrMH6u8RfwAzkAVKY/dxrGENu48fLK8H9VMT136MtcpD2FybawPJaWX6zne0Y9wgaMrF29PNrsK1smGB8pm/y31Z0Xxk5BFvA0xq9uIy5Q3STAxfQu8Wm9HLStan9moqKlXRs2KblxVN9maxKd8UNECdHv3FK4sv7Fqm5wVHF0v99UlptHFBupxI80V7VnPJO70QFfpqfQ9pzfneLH7TapXy5PI3+4m5peWN918NzykWypGL9FWWB7GhSl6D5g05DUxmZvNExDS8U8f4/oolyEmQ/w872sLS06ihN2++9fUUFBBvYt16UJaLiZX3/xd0pZmDBmxJI4ck8N50Kc7WRVnocGiAGh7+XOvx5acrxAzLL+GQS2E4XCVAzjgtuukcnsW07etkcFrHZ4P4JoqcDpztXID9yqrzGpe/vb+1iL7FmPQAtrmNhqzcwHV3W9itlNE9c3EDCCsUy/YwN25L37E9E1FBm1QbJ+nr4sO4fKyNqeHV1k1JvvvEj+k0BS2e3FCAP14BJiZsLutCK9TbXvqxnR2sGZ6+vHVYPcH4Y9u5uP9cXjF59cf1oW9JJbqSixtOdzDC4MfII6o9AyOjRutmeG7JKeNN5d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700009)(86362001)(55016003)(2906002)(5660300002)(8676002)(66556008)(66946007)(66446008)(110136005)(66476007)(71200400001)(64756008)(316002)(6636002)(76116006)(478600001)(8936002)(33656002)(7696005)(52536014)(38100700002)(41300700001)(6506007)(53546011)(26005)(82960400001)(83380400001)(9686003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e22h158KRC1IO9taaf2aack5mcHDSGSkMC2/gAbP9WH8ZJEvhnNsy4oiNGFO?=
 =?us-ascii?Q?VRKKks5hP2BemwLqjwxK/OS2zqtmsDMY3czb1vzDqMFyHB9UoHcpOwmduJYa?=
 =?us-ascii?Q?Mfw6jDek/vgEuvzrVptMZA5riA/CJd4Kt3K+qDqOud8lery0ws+7PZ/NOFm5?=
 =?us-ascii?Q?t90RMYkhl6dOt956NaEljBbj5XtakDwTlcrvGOBWTY5Thnl9qZhed7Bbt4/j?=
 =?us-ascii?Q?WilvxI5bfJai+Wg1quirtApb+32kD7X74z0QPUyl143vuRfux/iVESZqRcHQ?=
 =?us-ascii?Q?oORCG1RXQfL71FMDxpsp6hB+WLOekCu8ksukWOIpxUATgGTBjsVFcZzmL8bc?=
 =?us-ascii?Q?fIDxeYPpnxNzlAji4YdKEFaGqLJCEUDN2Jz9QZLZApLd6JKxCFHUWQ3iNAJ4?=
 =?us-ascii?Q?6jrj3r+84zgnAWGaED+s+//LOUg3W+Yy6pmcz5eBFZI4A3L0i852b+wei7Nn?=
 =?us-ascii?Q?esbbFzxvnN/3aksKHkLuQrTN4J+WwAtrbHVsKLB4A0bBZ3giov063C8tesHZ?=
 =?us-ascii?Q?ulJE4y2g4kNQDFD4Yj8qjrDVbEA1YJKTPERwG9+c8DoqPAYRs8xqwJzJBenM?=
 =?us-ascii?Q?HgpHEVcsJCByuVZPpj5RSWBiSsATMnhqWV+HaoXfIM6Zug0xTUZRtwj9pvc0?=
 =?us-ascii?Q?swOU9Ac9rv1jCSsK/W12ufBcvZa/+LVHSB/lYNUycF72DOI5dC++FblWXOe6?=
 =?us-ascii?Q?ujgPA6PBBQuGAuNCglSbVZJgJUA+LLggZALs9EahYIYMFYvsOrEFGnWzsI+6?=
 =?us-ascii?Q?Iemmu6GzEprKQs/NCq5BQanJlNWhKYRWSsFcfsaWj7ZTYPu70iyFy20ozgX3?=
 =?us-ascii?Q?bR6IrqUs3jLxp0/EPK5WELW8xS1T02J2NSUoxrVB6jvCYK9rpPgr1n1llYri?=
 =?us-ascii?Q?rZl8aZOWhot5Fr/jeCPyBDfTIcXzQp/G5X5DbyZ4PbDplY2W5wt1KofWJyV7?=
 =?us-ascii?Q?Nk5r5HQZTxLGSQVTEJbyzgrNDAZXiThKUlaUiQ7ruJ5YgKsva3u2Tw57srLl?=
 =?us-ascii?Q?Lh7RZlKPTwwKonaxf7SaSC0lYRhhHYAb3KsAtTsYWckcL+hlfegX1NVoJ4MH?=
 =?us-ascii?Q?PPSvjXKZ0vavgyBwquN0G++CUwHGY2Bjg0qT9dOQm9CoeJOIybZX3VScT3yc?=
 =?us-ascii?Q?u/p44MzOjX7rczT3dRLuTtcedK6GmhDr+bgiKkW0B1Jpv7nRTQMqru2b/cXl?=
 =?us-ascii?Q?fJdNJbT1Dl0dkAtKxX68AOHP67DlHBmGVA9lO9an4UeVJuKqIyQ6/pDVXErf?=
 =?us-ascii?Q?BFMAkzrP4fS2I3J08KwKPg8vgaH6r9Qu2Q8UYcZsCNlhM0RJFSvBi9zGfLTc?=
 =?us-ascii?Q?QKNMBhs7JzAKez3FhwRXIAVOIh/9llkD+KsEkvrMtYJhTIACCICSAjAK0t12?=
 =?us-ascii?Q?lV8KAsicNUywJcOSNJFZxb365sLh1GJE0Ym/Wt2REK9TuvmcVp2CqRrR9hKA?=
 =?us-ascii?Q?JHCdsBQqkQp2RV+CqDHtsH4euP++aDsge7ojjO38HjGDl0XaVPB7U3jL6Yz1?=
 =?us-ascii?Q?aa0D1baqclLeHEBRNWRqUor2BxWoXE4xFdpBvdfE7iYVxGtZUIruiJM+nfCl?=
 =?us-ascii?Q?qQlhKGK3C2XzhI6IovA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e8884-1a25-439e-8645-08dbd1159622
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 02:38:04.5869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3MNDBJcASCHEWHShF/G9bRGuH0MRwnV2WLcXti8KURF/QTzfdeuLvr6xZZnuWn4CCTq966Eqwx1usM+t6GTQSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6709
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
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



Thanks,
Oak

> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Thursday, October 19, 2023 9:41 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [PATCH] drm/xe/xe_exec_queue: Add check for access counter
> granularity
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add conditional check for access counter granularity.
> This check will return -EINVAL if granularity is beyond 64M
> which is a hardware limitation.
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index dd61c4267e24..03dedcc39732 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -23,6 +23,8 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>=20
> +#define GRANULARITY_SZ_64M 3

Please define this in xe_drm.h so user can use it as part of uAPI:

#define XE_ACC_GRANULARITY_128K 0
#define XE_ACC_GRANULARITY_2M 1
#define XE_ACC_GRANULARITY_16M 2
#define XE_ACC_GRANULARITY_64M 3

With this addressed, patch is Reviewed-by: Oak Zeng <oak.zeng@intel.com>

Oak
> +
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT =3D 0,
>  	XE_EXEC_QUEUE_TIMESLICE =3D 1,
> @@ -393,6 +395,9 @@ static int exec_queue_set_acc_granularity(struct
> xe_device *xe, struct xe_exec_q
>  	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
>  		return -EINVAL;
>=20
> +	if (value > GRANULARITY_SZ_64M)
> +		return -EINVAL;
> +
>  	q->usm.acc_granularity =3D value;
>=20
>  	return 0;
> --
> 2.25.1

