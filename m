Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E1BC001E0
	for <intel-xe@archiver.kernel.org>; Sat, 21 Oct 2023 11:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9010E118;
	Sat, 21 Oct 2023 11:22:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51E910E118
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Oct 2023 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697887356; x=1729423356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=18jvNaH43SWd88yCQtdDHf/B7v7KHl5CPuqv6w6Kmt0=;
 b=QGTsMwioCi81iFe8hdl5p3v7qM5oEyEmmheveXFwbQ3lXnz4d8MQkrQb
 Hz2WS1+SerCl/xXtTFLPhaokP/K5bi8rygtuVzu8uodbk9/3RkbggdeV6
 8FwkkZStB2ayB6srS9t4KOihbGHE1vyf/5DPASzdnVGVahESQgNwVPlls
 DeK1UQWvR9G7tQ7JRhotyUa6sBhRaTRipMQSpt3KQbDxYfjqVD/8t8vS0
 moAlGwt8scMDcp0R/ziYYCURbNiglsjU0soAxbuHCNrKvXhbZcxj6kFug
 V7A2t4y3oicsyOsdjGbja1bpDKJAY0ejLdard6m7fIUj7A3kKpOT1Ynf/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389477089"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
 d="scan'208,217";a="389477089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2023 04:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; d="scan'208,217";a="5618164"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2023 04:22:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 21 Oct 2023 04:22:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 21 Oct 2023 04:22:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 21 Oct 2023 04:22:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 21 Oct 2023 04:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIC+ICgmDgU1qhgAWr5NNiVL+JuG9FlOIGWU9wGW/Ks93k+MongsGLWW6QJFcvIR/io8o2Q8O3ntw60tttQSoiord1lNQjtkJ8YT4LUoxsHbfB8JGj4nRZDHe2TV7TuO6sdX90ARW8SCyPwF9ilPc0+SELWwSf471r10D0QEHwAy/5NZJB46c4xazM8kyJ9iwLuDtlo8QleieAZ1AlkdF4a/QQ0waPbaGE+AQ3ckHAMalH9NyJY+J1Tv6Vu32pWbdBz1284Uud6mCQsdZVEqPDAF3rvqZ6ywyOTJnAsCAAW9gr/pbSVVjSuZOeIH2BT3AcPeJBpwZCPUtmaarIUwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVMla0RikHvQb1C2dijkuIqUBT4KUqTHHK339iDtqr4=;
 b=Rg5CbBhqzzbkFxbDPWkoki+HJet0JRMT9RPTsSBK5dQtXwq5QeVfz7lXzjJtWsDnY764SEUeA9vCgQP6VgU62s3UDnS6Itvxtw9gFqmFQwB8uJ9R0mQ0nYpW9LwzatJSWugrvl83HttMhj0yzvbKHaJ2QPwX1dyMTejCR9UB/zdukuiRYZMR/wOVKMwitG8MJd9zfNNpM9XQkPsuRVRQClED8o+F2U83c/26LarsqxE6t/e1JJFRdgAqNocR4YU0TAVccejJchEY6CopGq9SzdudGC6w1a/aQcPdylQqKr/o80eGDOqpuSjMjyYPB5A3mj+KChpvGqBy8d9DwI7E2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 11:22:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%7]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 11:22:31 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v1 06/12] drm/xe: Rename XE_RESET_FAILED_UEVENT to
 XE_RESET_REQUIRED_UEVENT.
Thread-Index: AQHaAxDAWcVT4oRiVkOO9EU4glKhjLBTBXmAgAEV3QU=
Date: Sat, 21 Oct 2023 11:22:31 +0000
Message-ID: <MW4PR11MB7056305C687566443052B8E2B3DAA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
 <20231020045533.1425375-7-himal.prasad.ghimiray@intel.com>
 <5361d832-4cd4-46aa-a7db-d79fefb484cd@intel.com>
In-Reply-To: <5361d832-4cd4-46aa-a7db-d79fefb484cd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CYYPR11MB8408:EE_
x-ms-office365-filtering-correlation-id: 2d1c5621-fd37-4f07-503d-08dbd228047a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXwQpHUvx4/A6fXgGMrbbtzU+UfZl73ffc0jvc6ejEj9JYD4gX8XoZH5TWgiUOK9c2thZALXZRpxBF5q0dGE86wK4V0DqfhP03H6sh+UI55e/HtgiwP7C80HXAEBZasu7N9oHVfOoXteFQXcgDODDjuSlvozlhToozzOAVIbY6ma7+kfbLDKXTqBXtsYQUTlJbIdKts5PDkZYNmIrDTCikrxgoMYXyfWhSlw7IwjkeztddpCqmCZu1ocMYW9zPckQi2EjYQF1nI6gom3fCOQjN9i1cZ0iEiif4CLy4NqZEXxQEV8KR9PrDOdocMOn3KLDUMaGAf1JZMmkqfyqUBbEu2wudvdvRmvUFwkQNiV4M8YNxtXxxWYpEeEOANQaCOTjsRpAf+8I8S3iKBI+VC6OjeBvw5D9kKBMAqM7/J9OpgnBCINgLU/cooXXCf7rIXLi23BvUWmxCKqZR7lj/eDxeuwb92Ndi0s5RRVIkTnRUFDl8cREusYkjtUT8BjaoRQ0FVjRvA/qg9AgpIStLipbLWl7PSYlCbPwFrIZH0SYlW9sz7Y8k7yLuU7eRKb9g64w7M7g1r5KyytozfL6Pa77TeClQv5VocdfM/NEb8hzFlmy3Vp+gPOv2WzeZuT04Nx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(83380400001)(82960400001)(9686003)(66476007)(66556008)(316002)(64756008)(66446008)(55236004)(6506007)(7696005)(2906002)(122000001)(53546011)(38100700002)(26005)(71200400001)(33656002)(86362001)(55016003)(478600001)(110136005)(76116006)(41300700001)(66946007)(5660300002)(38070700009)(8936002)(8676002)(4326008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v9IZYvd0RXYLPSziG+Ie/N0RUP1zJBZKbdjYV9QyE54ocslVigkmdAFRLWxp?=
 =?us-ascii?Q?q7KXaI3BS7pdUvHbDDiGTnEhynCb7q/Q9+kwx8WdByn905UN8I5kM8ql0E0/?=
 =?us-ascii?Q?CxCA/Nuk8t91wrOUkZBZDOJ3KYKCM8cEROuXtmjnED1IFSnsQdf3gUa0HC5y?=
 =?us-ascii?Q?UOQaLsVZP93HjfnhaVqiMfG6thaLnwPBAs3q+nTc7iFAGM/H6/+dOwDV7L3j?=
 =?us-ascii?Q?De6ZytIa8hwFhMdUb0dEXrCtzDtTf4MZF/n0J0lYFGb50Wxv4hBZtrSvhXyE?=
 =?us-ascii?Q?grDhiaGSOxRookcHUXvVFOAnN28Kad7j3HFwsqYoGfBi+1clXAZxyaiWn3MK?=
 =?us-ascii?Q?HmP+RNOtOy51M2fevs883Rmyw+ztAnz3S95cgaZ5lp/w3LNbngjhE0RurSGn?=
 =?us-ascii?Q?K3KAUcHNmV7gaXRmr6ry11RmRcKJCDHVgEBF5rREDz9lhYmnbBn83HpgEq8F?=
 =?us-ascii?Q?VUIFRYlJvbHnP9EZQBWG4JLgxCIYi+ndE+nyBSPzo16hoeZTUJKIfyPuN4eT?=
 =?us-ascii?Q?pcwA/7dLS/n5+ESMER77ylV+fNI9IYdkYbyjGWCpoS83LwYPgkgeqLwqq2pf?=
 =?us-ascii?Q?ABq5Wt13DFlYKCC3/Pzai1Qyx78Not8xn3zttK3jmrQHn3FX4dq/vFOdNCJF?=
 =?us-ascii?Q?VkN9AYsCQzNZZUEISbqfqnJki8NY0N48BEXI0jMw5bc5e6Pwjp4dsKR4JxbV?=
 =?us-ascii?Q?CeV1MAiduMfGVMeCZpZjIF2L3nAU02cvMmoOctxKmaUA0DmvWFmfwHYtJFvv?=
 =?us-ascii?Q?+1mNW5Vyi2Odz7nMQWufMRZGbvQ08h33leB6zsxJucSU6FT1b+/w76AdNJwC?=
 =?us-ascii?Q?NnowPF/hEChuGue9iJIZTh26bi6qQMdBHzqElQOMHhXL+i8zdfih7BXMvWK9?=
 =?us-ascii?Q?dxtjR8Ww4ru/JIrCNZBLaEgkBQ2o7Kxpn0IwsT6tpi5pD7mpYtWqlC8XCPP9?=
 =?us-ascii?Q?ucVBm48kaprLpVoHWrEPR48iQCV09ca1xP81R0tF/xots6MV7AeAmCRJNUv2?=
 =?us-ascii?Q?l7vYGugGjXhbG6ZYalBwNLWii6gooWWzXrT6skrutfQZ7aqNQenw+jI7BK0U?=
 =?us-ascii?Q?+8N90aoW65kutasT33TsAZHorP5wAKJSQcl9DUFWhJpXNhaCUREdllAab741?=
 =?us-ascii?Q?WLWTwE2RezIgsrgz79j/Ek1v/iGSiOG1wFNEHZJcS+TtOZ/ktK522/PTbB+X?=
 =?us-ascii?Q?VHYrD55VQTVe+dVlLfQBZvqDSzXsqQtkdRPA2Drnk0r3PE1g0llZK3SfR1jk?=
 =?us-ascii?Q?v9PvyP6hNQe9Ypm888GhZknFyiFJFrr7zzFjtFs3JTrFS1NAmdbOS4G2yXxV?=
 =?us-ascii?Q?CwEdewKBpj1moGwG8RwpsQ2GRpf7IK1NvCww9/YBD/e+t57Grtjp5X/PQyrT?=
 =?us-ascii?Q?CucuOnV+wuR7ztk4amZARbUOUCxvQZDOTeT2ZuB0JuDgHkJ7WwKTQB4ZEkPd?=
 =?us-ascii?Q?wCj//abSXypEMQDqHARzvx1xwK7ziejSYAFJ7O5XkPC/eZfVzNjzrZa6SZY6?=
 =?us-ascii?Q?1zzY3BnQ26VsMSNzrkJMgFHrLwxVi4riDFZGPCQd6Dc5U3ITwaEcXNeY0Lu7?=
 =?us-ascii?Q?C2rVodz///bYu3iwxN3+Zu7ORCaxrXWZRe2+x2uxDS8x2cWn9q9g8HF+di3o?=
 =?us-ascii?Q?Vl+yxXgwGTHR1heHjrwrxY/Ey57Uoi0bBWrZb+sJim26?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB7056305C687566443052B8E2B3DAAMW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1c5621-fd37-4f07-503d-08dbd228047a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2023 11:22:31.8259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlacWYZxtx9EzaQrTNfPNarWtlyfAZnB8Xka3tvBsiO1B9Oky87ogrROgxlrdBvWh5+E3E4rs+M1RluR3a1DxOtRhT9A2gCkD7SK6B53exg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 06/12] drm/xe: Rename
 XE_RESET_FAILED_UEVENT to XE_RESET_REQUIRED_UEVENT.
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

--_000_MW4PR11MB7056305C687566443052B8E2B3DAAMW4PR11MB7056namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Welty, Brian <brian.welty@intel.com>
Sent: Saturday, October 21, 2023 12:17:01 am
To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-xe@list=
s.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v1 06/12] drm/xe: Rename XE_RESET_FAILED_UEVENT to XE_R=
ESET_REQUIRED_UEVENT.



On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:
> DEVICE_STATUS=3DNEEDS_RESET will be used for other reasons apart from
> gt reset failure. Hence use more generic uevent name and provide reason
> for reset along with the uevent.

Looks good to me.
Reviewed-by: Brian Welty <brian.welty@intel.com>

But as I mention in other email, this looks unsafe if 2 GT resets are
happening (and fail) concurrently.  uevent will be overwritten/corrupted.
But can fix separate from this patch.

Hi Brian,

Thanks for the review and input.
Will work on the input in separate patch.

BR
Himal Ghimiray

>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 13 +++++++------
>   include/uapi/drm/xe_drm.h  | 17 ++++++++++++-----
>   2 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd401..91e0a9a7f1cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -545,16 +545,17 @@ static int do_gt_restart(struct xe_gt *gt)
>
>   static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id=
, u8 gt_id)
>   {
> -     char *reset_event[4];
> +     char *reset_event[5];
>
> -     reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3DNEEDS_RESET";
> -     reset_event[1] =3D kasprintf(GFP_KERNEL, "TILE_ID=3D%d", tile_id);
> -     reset_event[2] =3D kasprintf(GFP_KERNEL, "GT_ID=3D%d", gt_id);
> -     reset_event[3] =3D NULL;
> +     reset_event[0] =3D XE_RESET_REQUIRED_UEVENT;
> +     reset_event[1] =3D XE_RESET_REQUIRED_UEVENT_REASON_GT;
> +     reset_event[2] =3D kasprintf(GFP_KERNEL, "TILE_ID=3D%d", tile_id);
> +     reset_event[3] =3D kasprintf(GFP_KERNEL, "GT_ID=3D%d", gt_id);
> +     reset_event[4] =3D NULL;
>        kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
>
> -     kfree(reset_event[1]);
>        kfree(reset_event[2]);
> +     kfree(reset_event[3]);
>   }
>
>   static int gt_reset(struct xe_gt *gt)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..ae1b1c7528d5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -19,12 +19,19 @@ extern "C" {
>   /**
>    * DOC: uevent generated by xe on it's pci node.
>    *
> - * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
> - * fails. The value supplied with the event is always "NEEDS_RESET".
> - * Additional information supplied is tile id and gt id of the gt unit f=
or
> - * which reset has failed.
> + * XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset=
.
> + * The REASON is provided along with the event for which reset is requir=
ed.
> + * On the basis of REASONS, additional information might be supplied.
>    */
> -#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> +#define XE_RESET_REQUIRED_UEVENT        "DEVICE_STATUS=3DNEEDS_RESET"
> +
> +/**
> + * XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to XE_RESET_REQU=
IRED_UEVENT
> + * incase of gt reset failure. The additional information supplied is ti=
le id and
> + * gt id of the gt unit for which reset has failed.
> + */
> +#define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=3DGT_RESET_FAILED"
> +
>
>   /**
>    * struct xe_user_extension - Base class for defining a chain of extens=
ions


--_000_MW4PR11MB7056305C687566443052B8E2B3DAAMW4PR11MB7056namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div><br>
</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Welty, Brian &lt;brian.welty@intel.com&gt;<br>
<strong>Sent:</strong> Saturday, October 21, 2023 12:17:01 am<br>
<strong>To:</strong> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel=
.com&gt;; intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.org=
&gt;<br>
<strong>Cc:</strong> Aravind Iddamsetty &lt;aravind.iddamsetty@linux.intel.=
com&gt;<br>
<strong>Subject:</strong> Re: [PATCH v1 06/12] drm/xe: Rename XE_RESET_FAIL=
ED_UEVENT to XE_RESET_REQUIRED_UEVENT.<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText" dir=3D"auto"><br>
<br>
On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:<br>
&gt; DEVICE_STATUS=3DNEEDS_RESET will be used for other reasons apart from<=
br>
&gt; gt reset failure. Hence use more generic uevent name and provide reaso=
n<br>
&gt; for reset along with the uevent.<br>
<br>
Looks good to me.<br>
Reviewed-by: Brian Welty &lt;brian.welty@intel.com&gt;<br>
<br>
But as I mention in other email, this looks unsafe if 2 GT resets are<br>
happening (and fail) concurrently.&nbsp; uevent will be overwritten/corrupt=
ed.<br>
But can fix separate from this patch.</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">Hi Brian,</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">Thanks for the review and input.&nbsp=
;</div>
<div class=3D"PlainText" dir=3D"auto">Will work on the input in separate pa=
tch.</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">BR</div>
<div class=3D"PlainText" dir=3D"auto">Himal Ghimiray&nbsp;<br>
<br>
&gt; <br>
&gt; Cc: Aravind Iddamsetty &lt;aravind.iddamsetty@linux.intel.com&gt;<br>
&gt; Cc: Brian Welty &lt;brian.welty@intel.com&gt;<br>
&gt; Signed-off-by: Himal Prasad Ghimiray &lt;himal.prasad.ghimiray@intel.c=
om&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/xe/xe_gt.c | 13 +++++++------<br>
&gt;&nbsp;&nbsp; include/uapi/drm/xe_drm.h&nbsp; | 17 ++++++++++++-----<br>
&gt;&nbsp;&nbsp; 2 files changed, 19 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c<b=
r>
&gt; index 74e1f47bd401..91e0a9a7f1cd 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_gt.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_gt.c<br>
&gt; @@ -545,16 +545,17 @@ static int do_gt_restart(struct xe_gt *gt)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static void xe_uevent_gt_reset_failure(struct pci_dev *pde=
v, u8 tile_id, u8 gt_id)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; char *reset_event[4];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *reset_event[5];<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; reset_event[0] =3D XE_RESET_FAILED_UEVENT &q=
uot;=3DNEEDS_RESET&quot;;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; reset_event[1] =3D kasprintf(GFP_KERNEL, &qu=
ot;TILE_ID=3D%d&quot;, tile_id);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; reset_event[2] =3D kasprintf(GFP_KERNEL, &qu=
ot;GT_ID=3D%d&quot;, gt_id);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; reset_event[3] =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset_event[0] =3D XE_RESET_REQUIRED_UEVENT;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset_event[1] =3D XE_RESET_REQUIRED_UEVENT_=
REASON_GT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset_event[2] =3D kasprintf(GFP_KERNEL, &qu=
ot;TILE_ID=3D%d&quot;, tile_id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset_event[3] =3D kasprintf(GFP_KERNEL, &qu=
ot;GT_ID=3D%d&quot;, gt_id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset_event[4] =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kobject_uevent_env(&amp;pdev=
-&gt;dev.kobj, KOBJ_CHANGE, reset_event);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; kfree(reset_event[1]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(reset_event[2]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kfree(reset_event[3]);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static int gt_reset(struct xe_gt *gt)<br>
&gt; diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h<br>
&gt; index 24bf8f0f52e8..ae1b1c7528d5 100644<br>
&gt; --- a/include/uapi/drm/xe_drm.h<br>
&gt; +++ b/include/uapi/drm/xe_drm.h<br>
&gt; @@ -19,12 +19,19 @@ extern &quot;C&quot; {<br>
&gt;&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp; * DOC: uevent generated by xe on it's pci node.<br>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt; - * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset =
gt<br>
&gt; - * fails. The value supplied with the event is always &quot;NEEDS_RES=
ET&quot;.<br>
&gt; - * Additional information supplied is tile id and gt id of the gt uni=
t for<br>
&gt; - * which reset has failed.<br>
&gt; + * XE_RESET_REQUIRED_UEVENT - Event is generated when device needs re=
set.<br>
&gt; + * The REASON is provided along with the event for which reset is req=
uired.<br>
&gt; + * On the basis of REASONS, additional information might be supplied.=
<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt; -#define XE_RESET_FAILED_UEVENT &quot;DEVICE_STATUS&quot;<br>
&gt; +#define XE_RESET_REQUIRED_UEVENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;DEVICE_STATUS=3DNEEDS_RESET&quot;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to XE_RESET_R=
EQUIRED_UEVENT<br>
&gt; + * incase of gt reset failure. The additional information supplied is=
 tile id and<br>
&gt; + * gt id of the gt unit for which reset has failed.<br>
&gt; + */<br>
&gt; +#define XE_RESET_REQUIRED_UEVENT_REASON_GT&nbsp;&nbsp;&nbsp; &quot;RE=
ASON=3DGT_RESET_FAILED&quot;<br>
&gt; +<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp; * struct xe_user_extension - Base class for defining=
 a chain of extensions<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_MW4PR11MB7056305C687566443052B8E2B3DAAMW4PR11MB7056namp_--
