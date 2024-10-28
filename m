Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46381D5B845
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 22:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E0610E081;
	Mon, 28 Oct 2024 22:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx/2/WOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFD510E081
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 22:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730153843; x=1761689843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4DO68jUiKP8qER4ph2Dw1rE9XTGj7IhHiv8+plEMQNo=;
 b=cx/2/WOfcDdEww+M2Gk3aYyrXRWQzKMxzXHfQjoBivNwgVWfHthRJw8x
 1tp716q1RmXdYZW1I21ATNyHlhY1e1/vW49wiq5WZhUpfzvHQ6kKfiMqm
 QKRUJyGhwZJANZZNeEW1i1Ji+CfJ+yUZtLnRy10nHRihlQ+ft7KcNDJpQ
 juvazxAnvQ6l9UBB+aDyuCWJOQuYNYd2tjtqJKvmyJ/L1tTKR59hc4d56
 vxNxeEMN7mQqb4SlbvFIHP/oAk8qBTsXzHx6FwAmJ4o5H3z2Fuj02kG0x
 kbHUcwvn7mngnQSHHLhd7Ui/IsDgAsMwaqD0S2LsALw+VMJLgDQBQx0DU A==;
X-CSE-ConnectionGUID: ddMeuFb5RWCrC/Esf/Iv3Q==
X-CSE-MsgGUID: vDgSoeQeRG6pLG0NGLcA6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29673745"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="29673745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:17:22 -0700
X-CSE-ConnectionGUID: e48mK8IiQIKzN8Mfri4gag==
X-CSE-MsgGUID: +aZlHRw4SySPYp0n/QLsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="82569152"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 15:17:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 15:17:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 15:17:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 15:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfh/NyLNkiHkYnvEDprm2kxU/AhpMCLUnnPkcGZAwrO0ZEv1g+d5mSChd8F1iAjM5JPfY1mPC6+VEoJ7u5US3sqxfN2Rsquqe/uaf/nglII4icBJ7teAZo8C/KAclZWZ0u34hV18FZFj7eoDh+pZdqAt4Bl9cmopSYujACHOKxAWLWueejo119zFKiN+KUFfSTra654fERbG1vZZ9VmLyf6619bscyEU8GJNaplqMs0KHB7RQnpy/MZo+KgdF/PBeVCVlgD4ek94O2ThOD0ds9PK3fZmQphtracYlxL9bHNAtbu6xf5JUmes4c/TJrSAmlUuxXYuhrW5SpxRvlzJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=632QDOMBAyvQbPktaRdzOsJJC0OflkjR2UkfCMU6urk=;
 b=ConGpdA1XLILixhsFbb5p8HmwWfzDpu8VKPr67d1G9t/tLquk3hlmZT7JmWL3wlnuV8DkpyL7WSW429XgQnYgMUSPvA7QnK6dQ/biBV/UTx3Fd89MrSN55F1i7+pVISmH8PYu/Flgcuix4RTaNz5br0MyvHRT7s+5wEOx8SFv0DJv7e6ZVLcWZ9PcdGCfV6YV0r6kp79yhuw+9qOwoNCj8uQYMyFq1RHNyALaoeFyvVZCRh3OOere/XWqDzdGQYRpCsx3+e81xh0IOk1xubAO7BE9rUFSxkBIXmuaDGHtRJG3+QDuJ/jacYZdgui1R20VOVTpTX5aATDYp55zwYaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22; Mon, 28 Oct
 2024 22:17:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 22:17:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Thread-Topic: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Thread-Index: AQHbJ8nzf2j+65rNxE+UaE8Nuh7BULKcoZ+AgAAYEgCAAAERwA==
Date: Mon, 28 Oct 2024 22:17:17 +0000
Message-ID: <CH0PR11MB544450CE433CD0B13B7629F9E54A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001> <ZyAJNgDg6H4V7xAm@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZyAJNgDg6H4V7xAm@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: ed5eac82-cb8f-4151-88ec-08dcf79e48d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+cu1y6Qo1oZvnsVOMmmeDoFj8RNeaQrX4w9Sa12cuVknjTPHOlSIsbdp3KAk?=
 =?us-ascii?Q?fC6Z1LAJbq3LcEOQEDTt5pumfSeQdB/JTUEOXjuQPvkMg6DbGqY2CYlIkASN?=
 =?us-ascii?Q?PSc48gpdsTHeJF2B/1OiDoh8AtzrfpSkhjDS5r80SAi3vyFyqd0xj2GyYMH0?=
 =?us-ascii?Q?jRbm/mImom9R5vg2eNF3LobeRar3yL3F9xXIF5DJQp5Lb18HRqipLMUMw7YA?=
 =?us-ascii?Q?WHb5QltfmSpPMNqeP2EY0/RcJ6vOQz4+Jidy/4x7GS1F2Ue9U/qWJijyXZpx?=
 =?us-ascii?Q?xEgtZtOylruwXeGTKxgZw83ICUd6F8fRVXMZLBBgEdUQ38QgxBgH9nDvcnqA?=
 =?us-ascii?Q?MSWghRFKW2l1FYO0AJ6peb3Eer59fZOfS8Tgs9K/B82w8SYR39Y8XKAKfPzz?=
 =?us-ascii?Q?t0mz30e9420+QCNYh1XNrH1kuNhOkZdqBNVB70bMur+RFoxvBNNRWodPl5eW?=
 =?us-ascii?Q?PxElnRr+LblNjzJFa24wab8aCT5OHsX1T9nLlLpqn23PemKPxSqOFcXOOqhm?=
 =?us-ascii?Q?ITPV2+wnpLd0DZ4zb4Ej2mKyGGGR3MOybHPAcLRNwKEQRzdFndljS6YAGdWc?=
 =?us-ascii?Q?mf7KS9qB74nbjNY4S0pNyAPN+FNgQEAtU+shEtKqVPwgdGJSNXJ+UR8O1AJM?=
 =?us-ascii?Q?qmrY3rw/vE8resx8bX53q72VGcGevFiYSkujxHcPiz03wyG01rnkrl2Tjc7W?=
 =?us-ascii?Q?3bKWa3+Obf95bkuwZyn+Hw3JkJsmgCRvmHB3mxDUyuLtrE+kaEq9RHkpBS6f?=
 =?us-ascii?Q?Vyr7WGkqNAbaLrwSJlcYsBECnTiKSnZ7lFTqRuC/iEGsRbrTJehQC+6I6aJh?=
 =?us-ascii?Q?dg2uYysl8OJfae4ynyXcYIEh0k3NIB0NgdWpeHTSPKn9j9dHnKKAeZdcnJAX?=
 =?us-ascii?Q?LgXxo/M9+XCNsInmySmP5KqAVyRpAsjL/y1Zf00I7nlNYtrOhT8JD+P/e0De?=
 =?us-ascii?Q?luLnixr2kzVQakpL3E1VvT55/BJDv1Ho+0jsUhFd/wfTy4vwdIhd6inJ6lxq?=
 =?us-ascii?Q?cWkkDYTKpryAZg3f5Q7PBJT9J7ly58orgMT3pHdZARdn05BpIY+4F5tqa2vF?=
 =?us-ascii?Q?JMWzEe+rAZjYfxWbP10kfLio8ehl+1Uprwhytqt52eNrzS7ioaNfRQx09AvD?=
 =?us-ascii?Q?tq7+Jp5qzDrqUgREFiG95pBN8MxlfEB3xfmJ6WuCxCDjbrLTN7tuxGLkcwIb?=
 =?us-ascii?Q?F/ghJRoqcXmmxrybI8Gfl0MpOzc+K+FgWB7UbjQdNizZhR5XqGP2OmPrJz5e?=
 =?us-ascii?Q?wONHriaa5u173vq+lyZ1geUU8S8AnzvZTRlJydk5Cei0EpUtRneLSqmyBDMi?=
 =?us-ascii?Q?Bcc3uhjaZ/VCMnw80iDXBLCD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7ls2UUMpJDlPkzJzlnuyyNKooRHtHeyszpmtFQQCsT9qVF3V/1w/TJoX0Kln?=
 =?us-ascii?Q?sBC4iEcm0uMyjXljh5UDXK+kusEwggbrdlV5mJQTgPIqQukwZ6dDoOgA3cjU?=
 =?us-ascii?Q?GxKljoLIN2oekKt/DbdaCQlCMS3dB3TYZ+NCPkNRpX3/9IAEL6LQRFT67e2D?=
 =?us-ascii?Q?A1/4y2njPa6Iq4H6Z0e7bWzIoIrX3gO5RERh6lqk5cnzJTgfywjtQmHS4XKv?=
 =?us-ascii?Q?VpOPSGW1N7fw7dHY2kwK3APEUiOZMgGh3fkOGOYrszbi6YT+FwPEe+ZqKS3C?=
 =?us-ascii?Q?MCBSmbigvQXT21/vD9i+2ridpYEbOWZuvFk/xIXNU6YOhbA9Ke4woKvSScoy?=
 =?us-ascii?Q?6g6+e04uDLy5RbRJ+tZefzo/u//spstyRpsSZqmx1T+jMMPvtM1lQWumDUbr?=
 =?us-ascii?Q?IpZRNzbgemUA0a3pTb3A+C5CaJSHO0aJ48toZSVbFz8c51cEilA8pOPSmj1U?=
 =?us-ascii?Q?7k3AulUvxacVwnXZdQl3xvFwtSQwiW8KJmmBoQfVvRLrFHp0oBvoIaXAMYJX?=
 =?us-ascii?Q?pXsItPkDIQt90vGDflfZ+Q8biVOflM1yYIN1WZ6gPVNOeOcPXU0Jo4fBbkDX?=
 =?us-ascii?Q?kNq5bUIpAubu09vjGfU0dr0xB1JW2/1Jdyqlzqf9B78b/BFVO6k7Z6sVezkM?=
 =?us-ascii?Q?lhxE7I74D+yBBM+rHFC9rBKlnRi2upNeHpVZeqP2UnEhlNBNhZ9BpmtFUlaq?=
 =?us-ascii?Q?GaO0ZoUzFeJTqZhF+Nx8CYVhr8bHhaWqKr4f8fX5Uf3P0hfHsTcfDK8sGkLX?=
 =?us-ascii?Q?n6c0W6XthnFr2dvZLtI1Vt4s78Y2qBtsDhaNTcC9scVvMrc7+yc0OK+9P558?=
 =?us-ascii?Q?YsN7zUz+B+E0wiIQKXYaNvD3BWsXgfUzgfMpP85/S8YAEprvN1w4dlOj/RHh?=
 =?us-ascii?Q?20tVc+AY3BGs8MX3Gx+oEToVs9bOk2xNScX8bnd3GexCec4eR2q6G4DFdxjd?=
 =?us-ascii?Q?cdnbWpTJgpWvXf82kWTiNmv2kIRyyuoy6FivlOh7hK9a0Y/8NWO+CXdUjTcC?=
 =?us-ascii?Q?1ez2wg3Pi+H70mxQE7jEQ3Hi1w/dj6eh+NeTXy/yd4YHCReKeSIij/kyGTMx?=
 =?us-ascii?Q?Zj1LZbXzjIaOlDflzCoqkOvYPXiqF8Kd0u//UCiHut8D+CtwaYdWzf5hQazu?=
 =?us-ascii?Q?GK7tGA9uWXxB2OdeoxkEb/ZIiEtL6iGEt4zO+Vz3BiXYOkvdzKX8wa/3NpbI?=
 =?us-ascii?Q?06llT/KK8D/s0B7CHlBgm0Ucjv6IBSj1vhVm2rh/RtMFDKyqGuo9bh3uz9mM?=
 =?us-ascii?Q?ctfQi3P7JPwF5GGV0AEndFmFM5nstGvG0ZOYmRGluBpQqZdCfYlyo+t59FA4?=
 =?us-ascii?Q?PxC6iXLuvWvb/lSqExQQ4VzoDc+jVsWfgi3zS8zhT5bWVQikGkBq9Lwp2Xt1?=
 =?us-ascii?Q?IDp9PyNaK5lxEmOs9sV95iC+9MxXrcKvTi04pojs9R2F3wKdVjm3tiBiJl14?=
 =?us-ascii?Q?jwNzagkXEY9eXROJFYaoMpTP5vtXkZl/tqXOloWPl5xQYgrBoNX0BB0c2eRx?=
 =?us-ascii?Q?KQW4BSfxUfet4sV2xj1Vzldh8fK2C3OTOtq+DTOeJkbeJsmtWdNa+EBdsU2+?=
 =?us-ascii?Q?jNfRd+/lloWO1oTk2tBHU/HE3Y8filvpIS4i7/IC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5eac82-cb8f-4151-88ec-08dcf79e48d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 22:17:17.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLdLSKNM2UCB9iBuDjxEvEjzJgtBDWrPXIcvD/cCIZMRYDK2WSV3eLCqe9loXFZoXaC+e/pJ/zksX3lR9EvBdK0703QEBwnSW5tHrKnGWsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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
Sent: Monday, October 28, 2024 2:59 PM
To: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; intel-xe@lists.freedesktop=
.org; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
>=20
> On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
> > On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
> > > When the exec queue is destroyed, there's a race between a query to t=
he
> > > fdinfo and the exec queue value being updated: after the destroy ioct=
l,
> > > if the fdinfo is queried before a call to guc_exec_queue_free_job(),
> > > the wrong utilization is reported: it's not accumulated on the query
> > > since the queue was removed from the array, and the value wasn't upda=
ted
> > > yet by the free_job().
> > >=20
> > > Explicitly accumulate the engine utilization so the right value is
> > > visible after the ioctl return.
> > >=20
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
> > > 1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/=
xe_exec_queue.c
> > > index d098d2dd1b2d..b15ca84b2422 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_devic=
e *dev, void *data,
> > >=20
> > > 	xe_exec_queue_kill(q);
> > >=20
> > > +	/*
> > > +	 * After killing and destroying the exec queue, make sure userspace=
 has
> > > +	 * an updated view of the run ticks, regardless if this was the las=
t
> > > +	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
> > > +	 * query to fdinfo after this returns could not account for this lo=
ad.
> > > +	 */
> > > +	xe_exec_queue_update_run_ticks(q);
> > > +
> >=20
> > At this point we may/may-not have the updated LRC timestamp.
> >=20
> > fwiu, xe_exec_queue_kill() is an async call. It will queue a work that =
will
> > disable guc scheduling on the context. Once guc notifies KMD that sched=
uling
> > is disabled on this context, KMD knows for sure that the context has
> > switched out and the lrc timestamp is updated for this context. It may =
work
> > well for contexts that switch frequently and may not work for contexts =
that
> > seldom switch or never destroy their exec queue.
> >=20
> > I still believe calling it from job free is the right thing to do. As f=
or
> > the ~120 Hz updates, these are just memory updates, so not sure if it's=
 a
> > huge performance impact.
> >=20
>=20
> I agree with Umesh here - unsure why it is a big deal to update the
> busyness in free_job.

I might be misreading this, but I'm fairly certain Umesh is saying that we
*should* be updating the busyness in free_job, not that whether we do
so or not is of no consequence.

Not that I particularly agree with that sentiment, mind.  Actually, I think
you and I agree that we should only be updating the busyness here and
when querying the busyness as a part of the fdinfo query.

Please correct me if I'm misunderstanding.
-Jonathan Cavitt

>=20
> Also the timestamp counters can wrap and if they are sampled frequently
> enough a wrap will be missed.
>=20
> Matt
>=20
> > If the ftrace is getting filed up, we could throttle that.
> >=20
> > Thanks,
> > Umesh
> >=20
> > > 	trace_xe_exec_queue_close(q);
> > > 	xe_exec_queue_put(q);
> > >=20
> > > --=20
> > > 2.47.0
> > >=20
>=20
