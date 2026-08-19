Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72691C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 09:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598710E0F5;
	Wed, 19 Aug 2026 09:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnwywD0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3277E10E0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787131442; x=1818667442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XEDbDyvfCC7xjWfTiqbwBkyCaIGbyVs/t6CZ5uErhkY=;
 b=HnwywD0J9QJrtcwbQCOhr9WO1abPGJ7Uqvd/ziqd3mEcTs/drra0QVYM
 WXfoF5UTtHkvMDneVOTSAYwGrzqFPZzbAHak9RJCIieNvtUjj4bHQ5XuC
 FELJ7dDg25ss7vX+hf/9++0PB/kW5KUUyNZCBOdWne4707rfK2MrsRfkn
 LTFJNXjWU0twYOkYqiK6AITFjdgVBO4wx41WUSG7ZIqDzGlFs1T+qgz1M
 HytLZ2nMlrjcWukoV07WwnCPrmC+dhjbRjnOpeBH8U2BSrwOjQA8nPemb
 gOx2wWkSi+5FlAvu9JdnouBGnD8gYgaSc4C1ypjl4y4W+3LRCSwtC1YPT Q==;
X-CSE-ConnectionGUID: YteG2XCCQRCYsPWiBwX1fA==
X-CSE-MsgGUID: 94oW43AOR2mhaYumPj03ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99000196"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="99000196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:24:02 -0700
X-CSE-ConnectionGUID: 8OZEmqyqSdWdDUMrmyJHyw==
X-CSE-MsgGUID: MSt3XgqyT1+9ZUATRIWQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266107650"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:24:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:24:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 02:24:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7Hd/Fw8IZ4p5I/dUgEGQoM+/0SAU4MDZKmM3FdRrdxOurqJLTV7zSc+S6iiB3Bt6FpX1IZiU5Jk9jxFGdGDnuoxgvTvbwbfZJe6ON2XuAOHiKcBEJ3i/45KvwlvdxLQnj0UoXHIJ5+NDdpedz45DIkXpqeNMMaJgwjHj3GUkh5IB/qGPjFD4ZmTEqdWiZ7qLQ1IrsyUiLOKydcmD4qhhH2jd0DRxFDiZqjQoPnqe5h5nXsTld+BH6LmkScItsQDT6+t9RSFlUMLKW7ygvZZPLeIcOOOPdzjqFVS/JIdso5bWVPDvMeO19rLW40JwYBfT/eQ6TF2WoXyLuDhxl4azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+134gKH5UX99SCVTTkrtxIduw1UmH3UimPXkke5duLQ=;
 b=DjvR3oxB4HS6mHk63zsE+P/Yg92xYRduYr/y2Fuc2sUaTMxBSd2oXoJWllmUTyhzs31KWX4VJLUAWBBkuJUaO2+Ek+ZtdSap9xA6pHi0nygF2wY5ZxUYzSL3VHcwnGkKoHUNS/kTFZjYL9yTiHuxwQOSblKB/Ocql7bydO4qcVNqPCv0Qj9cQvxTyt2gKQPp4SNSFDy9A68cKcyWCM0TIRSyvJUTGpLLDStFT+49X/Sf/9lHav9In/ge7sH2v0sr++9xCW6xa4A5gGUe0avBQgn4T4D+4l7inYhHg6jj4Tcp96IJoivd/6dUmnzhcj9/Xt9lNzgbmZrjsvB2JxJARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:23:58 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:23:58 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: don't WARN on kernel job timeout when device
 already wedged
Thread-Topic: [PATCH] drm/xe: don't WARN on kernel job timeout when device
 already wedged
Thread-Index: AQHdK7szTp3hmQXrVk+LA1u0xC3Ae7alIL1g
Date: Wed, 19 Aug 2026 09:23:58 +0000
Message-ID: <DS0PR11MB8718C53A21AD3A860573B5EE81A52@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260814074106.92670-2-nitin.r.gote@intel.com>
In-Reply-To: <20260814074106.92670-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LV8PR11MB8607:EE_
x-ms-office365-filtering-correlation-id: d7208dc3-fe8d-415d-e082-08defdd3994d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 0/WC1lGQKit0OnP3IdvuTFGY69vzMDFJvy7YBH2N6CUNXK+yyDVPXyOq33uvVFSckBO+3b0uNTGM0GxL3IdUWGnEGPUS2/Ar8io+4z52Fi3yX8IWrtPViNZt+WB2yCBVzH53RGu1B2ArGbNn9r3Glzb291DAvjbRFeM87e780WsqCLqCEhXGHMKdEmrLNv4X3HTUK/GQ5UYpnBCYYZEe6PKG6bEGdjkjJKbxHzsBr7GbvbdY7wJOMkT4aHSASJjhpFGDIc5g+N8XMG1ALMky3hMzqeiuJRlaiU2Jq/HwhmEMuJ/yn8e3E8kgHqEnk3CCSmJkR/L/cr0reIq7blY3xGF3TpdqS/zBmuiWigF2oeVoCLqxpLCGceMIise2Zqv+Bfs7JkeN8PUa82uo9IG0LS6W1TecmuK3KTMqk7Vp2JvNC+sRGTS8prLKysrQYzJYR+kZagRKD1CoZ9KwACh1VARvVNHQcxh86T+7agxxkRgWPkapi3YLZ4h2oxG7QSTBB9Nt8r2x70VYBOLDzXmMHxFaMwyUvMO7RYVsnHNhP3eJVrldiwmU8KbH0lm26luPewe7hVfV5uW8AoTxt/2MBydiGsRgC2CuZncnXayRvdKw06bpyzYdgZwc/XkVzgzl9+5uFkRrvn5cQIcCnarvRjHKp/pFfEHbeLDAt6Jrgo5ct39aPZvkoa2Sy+SDd3HOZPXuW+ihDhjjMG/iYOumGhrbEQNQ49MDO6FRRSvi4Wk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8iVA/WHgijunxGLm2o9T7XAVatShCYspmXblNT3w6J7CvGH455MFoT15OeWA?=
 =?us-ascii?Q?Td8+s4yZSgqU2+UR3OtXiaqG/rR5Y9/F2ngoVN2if4aydRSQL2dwm/2Huav+?=
 =?us-ascii?Q?PID41CRPvFvtZHaFufNur2ZQ8XTq0hfOMOyc6LAmOIBkDwWoo5ZkOsUluhgh?=
 =?us-ascii?Q?SwTcm1Qt8ATsxtlYIqD4/cDJf6BW4cvn/37s8cpiriTGvhXNyf6WgWQ5zYXB?=
 =?us-ascii?Q?lfAG9rQwZo9P8dkhuf1cb8R6Cpm0ugJ/G5MMOMJdwbqaOicEyjXmTFNuo+5c?=
 =?us-ascii?Q?BEqFQwbRVylUAX7XKP7PeUu2UnJ9AXe2bbEws5YrMepgUoK/0M0KrFhEf07k?=
 =?us-ascii?Q?UmXqYFj2e13XM+LPFQ5iJvgXF0OGbiMAWmP54ZBYVeN2DAiqch5f6ecoB2m9?=
 =?us-ascii?Q?SSyuRn26daT8SAQQU+Pu/PrCcnuWeJPWATbkhKm+g3MWsKZpcSJ1fPcJdL0e?=
 =?us-ascii?Q?UHOQ74s/kA9OuXw/KkWFZlS3zJW3c8RhJ1etAXyZcOlVSWaLZWauJ6no9k8H?=
 =?us-ascii?Q?yJFTCgUOGuytjJ3Q8q1UgKLaDpsvDMkh2ekWuH56/sIgodl9OZjrp4Z4pViv?=
 =?us-ascii?Q?VQcEZGSbE7FeHmKsLOctDsjsrRkh2eHjA9ZLyw6JjQ8cxglgxgzmpPG73/P6?=
 =?us-ascii?Q?Iil/vcsM9X6RwE7NKnw3dD42yUKRIZZuW/QHdyBNtGPlsird1EAUnsoFDGnT?=
 =?us-ascii?Q?wKqNPXiRcc6FGrnnmdyLmV7fneaFByhPhdimOLD0/SnSvWTx2HqpTNPwoS+v?=
 =?us-ascii?Q?GPpVRABI0g7yWUwDqhFb27GabxHZZIKcvaS5Sy4U3UdSGBgy9Ayv9zUufVsV?=
 =?us-ascii?Q?1nFI6+Frq9gQOpeDZgrIHUUN1IWSlfiZmimmEaUhS37l2ACD0lY9Bfc2fbVO?=
 =?us-ascii?Q?gj/oqXHyDNkJshNEtYWJt//yvVUVpGhz7pSJMadkZZWZr9J/iqOwC0Au9kzz?=
 =?us-ascii?Q?NzPuJtkZmkyLxhHFaoZ+vyjcehy45yPdMK2bdv9o8D3nvc4BLXKdu7OnIWlc?=
 =?us-ascii?Q?Oa2UIljdARGy8aIbPC8gkMFbLLL/KAUyRQVKNU0NmEkE3fVhEbAKEiOR5dQA?=
 =?us-ascii?Q?VaqOZlQTJHSPRXbQ/VAbiuzSYicKLdTvtHsBDlyEbe/FIDzPvDevJ8cuOROu?=
 =?us-ascii?Q?0vODDykkgd5+d9KqLo6fgEMDWLmaU0db3g/he+V/uYC9SOKnINXoXFV/TF1U?=
 =?us-ascii?Q?o1QB5mJRTODS98Zs51qtSZ+b2uwt4nEcIQsC85Tb4QhgD0XcNptBm4Yu5KmT?=
 =?us-ascii?Q?ZHcScE6MSlApVfcrbpxMat+4D8hTfKajNmWSFXMLNBf+folHEKrZ+nuEeo9E?=
 =?us-ascii?Q?epICThHFQK/65TMKl1tvOK+QVSd2fcdPph11VIngERR8RKWEscEkl5J8yZ7G?=
 =?us-ascii?Q?a85x6wjC9Pu79JyZ7ibR99DWkccje5RpDJsa+TdusG+19axll6LcRPB3Z3F2?=
 =?us-ascii?Q?Jlv5IRS999R1W6czeG/PH5LsTV4VzcPpoW+SzLk5TY4cZckgNmtD4MJ95R6F?=
 =?us-ascii?Q?PnRDFvkggnygNTyEmTS9LhLrsqaodhsZsFLtVShyCxMm9Yz/Mnjzag4FA5Us?=
 =?us-ascii?Q?58C+xOkrAn37hNRIO+WvxFXKFgCq/CsCo4ASeoYuSG6TsRQiaRZMjHxZJpvM?=
 =?us-ascii?Q?jbdyLPa6kWuQiAbB4eUrUeT/rqEdniQVLY5rQj6YcrT5kwQH2Zv33Jm9Px3D?=
 =?us-ascii?Q?PRGZjayfQs5zpYavzAO4MywAMjUNB6zeLNxXwJ5pzWplMAGHpniugiWo0jem?=
 =?us-ascii?Q?9w3JntV4oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l4ubjDmLjZ6CZU+Umf4YConW0PxTKJcGC2E3r9pidFDc90/cKwEgwJdaEMrZm8t/yGXsm04ZVNs7Kp7kddwvcTdrq5/FNdZPkA97swfEayt6dR/CcsZOt1OmUKfQlbG7EVlzzUd4r3kncx2vJgReRAYtKet1PyMFyi+BZWxMM6VHvL2ab3K2JTjInZg3J+5Pi60v0qTfT+IElUUefUxhtOYvG7DK2ABDNfP2OFsfUn7DY8W3V/SVBHHQMz7PzUL6Z8hEPQT+AXTnkiP00rqfKELPOkginBV0IcMd+xXwBrgQ2aJ2MPROSfSlM5dMRakU5JKIAlCa3D3DewFZGO7WJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7208dc3-fe8d-415d-e082-08defdd3994d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 09:23:58.4578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LkcdlSzAavuTw28GARcTquPT+VXKa0BYVGGy9bV6bSGkboU00SPLOw2kARNJmiJqAk9Fx9YQ+vLp242J7ATle1k8ZN/KnBAzZEobSrTPEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Niti=
n
> Gote
> Sent: 14 August 2026 13:11
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: don't WARN on kernel job timeout when device
> already wedged
>=20
> igt@xe_wedged@wedged-at-any-timeout wedges the device in mode 2
> (UPON_ANY_HANG_NO_RESET) and then rebinds the driver. During unbind, a
> GSC proxy kernel submission can still time out; with the device wedged an=
d the
> GuC CT stopped it can never complete, so its kernel job times out.
>=20
>   Tile0: GT1: Kernel-submitted job timed out
>   WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:...
> 	   at guc_exec_queue_timedout_job()
>   Workqueue: gt-ordered-wq drm_sched_job_timedout
>=20
> Killed queues skip guc_submit_hint_wedged(), leaving 'wedged' false even
> though the device is already wedged. The timeout handler then treats the
> kernel queue timeout as unexpected and taints the kernel.
>=20
> Honour an already-wedged device even for killed queues so the expected
> teardown timeout no longer trips the WARN.
>=20
> Fixes: 5a2f117a80c2 ("drm/xe: Do not wedge device on killed exec queues")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..4e5063d3f677 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1590,8 +1590,14 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
>  	if (!skip_timeout_check && !check_timeout(q, job))
>  		goto rearm;
>=20
> +	/*
> +	 * Killed queues must not newly wedge the device, but preserve an
> +	 * already-wedged state to avoid warning on teardown timeouts.
> +	 */
>  	if (!exec_queue_killed(q))
>  		wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
> +	else
> +		wedged =3D xe_device_wedged(xe);

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	set_exec_queue_banned(q);
>=20
> --
> 2.50.1

