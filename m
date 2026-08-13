Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A72CC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C110E3EB;
	Thu, 13 Aug 2026 12:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA0tqPZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F57310E3EB
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786623060; x=1818159060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r3OWvm25afbzB8rSEOFca6yUTXYONxqToFAiVJDkHtg=;
 b=ZA0tqPZpbOmFcVdLr77Hz6xq0/PgM0D/wdMc6QCDmEddkzlD6zvKdZUX
 E9AbJmSjowMwWJuldjL0XRl/7mH8GgyMR1LJgCwIl4CGqyb6R4LRmMeGz
 u1KNnsoevrcJKZMxrcNV3ErNZ/C0q3rYeIF/dSncouqw8+5QJlAYiI1Lz
 4Y9u3iQ2YdtumXU56lreNJKLvm3M5HUKlJ0snbxWAfQS49rRvXPBhLgTG
 5cBAwB3wbedUNHpcK4+LObBecpWIT6+o/TPvt57kOPbCxgZO/S/Z0p8gn
 OF8arPR9FUfswwvhdg6h8au0aJ0ySGx48NkprM+aJnW+SWZ9PTtPlWevb Q==;
X-CSE-ConnectionGUID: 15X4+sM3Q0GQjEfpkMyiXg==
X-CSE-MsgGUID: YoVT+zmRRN+lIcHgg4pcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98347732"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98347732"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:11:00 -0700
X-CSE-ConnectionGUID: RhxucZ5VTdGeI0JUgtDZ9A==
X-CSE-MsgGUID: MwJ3SLedTQ+pEhWhUrFd7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262170629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:10:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:10:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:10:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYtfAyKsSiUEbXYkIpEbk6iiVDVa0KXdP212cuofczgMHUEdkn7IAmPC5Yq1brSB6nMHXF1/mkg6zlMv37zrkBVtw992//A136/XkdBSXzJoxSOT7V8L/cmt3QnZyxXn/U79qr4gLwWQ56+pnjeicd1LlqNSCtU8o0Wz6H/1OBZiELWr5R+sU+jvyaO4CwigBUgvIsEVAbAh9epMgK2kRGex1DaKbvbzD4shP1TrYsV+Cp2sP8uPZbeievZybBV6/1bK2/qMFWm2WrZwl2NPlq+1wQbw3hXIgdFeKedVlZ2avn+LuI72DlPD52lCk7Ty+ggRYBkMCcTxfwuUMyrRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MUJ5tyzekwvQNI0vuKZuuR/5dvwARJQhqyQYdkUOjo=;
 b=VfUebeeH1cEiDX2hpwJxSKt158QeQMiNODA1IOj29+9tHHDeewD3MlamchA1nwRCaRTSwmsBZJWh4KLQ/OMio1gyKWMyEJtPIKlTNTST30pUnXTila2GEm3UYGGWgLdJMK4c9jcQQ5AmUbkQbvIiJM2Dha8mkfo1Jx+kGzOZuXH8aNiUedYxmX3htM1STKeKMEf/f9f/eWUvjSQwLMub+EQWA1jWRuCBNan9O50eJotGcIgmnx0egd5ojGTO9DwFtuscg1+2SwSV6MZI8FLyeZxOrfRemy6zODEKpHIbx6DCZLTwsZ/xa9vpFXMMlgQ3vwRCyZd05Fl2dRnM8GMjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5424.namprd11.prod.outlook.com (2603:10b6:5:39c::8) by
 PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Thu, 13 Aug 2026 12:10:49 +0000
Received: from DM4PR11MB5424.namprd11.prod.outlook.com
 ([fe80::1d0f:8d61:dd1f:158d]) by DM4PR11MB5424.namprd11.prod.outlook.com
 ([fe80::1d0f:8d61:dd1f:158d%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 12:10:45 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>
Subject: RE: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error
 using SIGID
Thread-Topic: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error
 using SIGID
Thread-Index: AQHdKo8OEvhHRGUJ6U+H4KUhSNVFEbab2mMw
Date: Thu, 13 Aug 2026 12:10:45 +0000
Message-ID: <DM4PR11MB542403C5B4FA880463ECB09CE2DB2@DM4PR11MB5424.namprd11.prod.outlook.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-26-michal.wajdeczko@intel.com>
In-Reply-To: <20260812191450.11690-26-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5424:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: 900ab4a7-c872-4053-337d-08def933e76c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Uspg0xcKLIm/hawigJqvpkVZhQfRMJchx0YH0EWlQrCwBly2z7YzxWIiV1k6YzH2qUKxx6KunZt12qSGmX0Fy0QlBz3qywPc2Py3NWKdhKjSN942rk6ce3qxSLgFsHv+FhXyXA9i44tJ1LZrDdzICpUdVKOLL5C+xlcwEYPxQdD0ulXsX2hk/aZRKlixqxA88hEJeuZCpHdVyxbGjeRruCE6FUwbT2P7vp3KcACWM2EkvPxe8k5Xnn/GRezBpi5codEtUdq8KWkKC3wzNLaYYhA5GJNJyYD88+oWkHEmIStzXNra/YWVfABPidWDMfPY7mudraHLX4f27J4DTWvfHJbzjvlneIKrIwl12Dv81IOU7vgi2jvHeqMEmNdUCye7qN/5OIZY+Wpn5C8GDjgq4bmYzLLwmWuFp7sPrxbghVp8L1rpQqZcbBzO9If32z1uHZvnq4kW1PTwp2SHko0TueBEUyfG2mCa1Eiw2652vQvmkAN0B6zmWeS+QqMEeLbNBc6DsNY1fNcu5FXiPhmjI2DQGcAKIr9G6NZsbB38oGQUHog7vVQxS8J7DwBcQM4Mp7lqpwIQ6kjzOzlidn9bj5VBjXPjAXUSWeXZ/9OitxXzFIS3cP1pF3r96br0NRzgRLWju7cFB06mDOLzELrSoRhOHFHHhld9rmqjkwpZVhneFnXLhSeUAqXO4uqlqfJBSZz00FAdNJWx/kYzLFThajveep50ilLLQqwHabk//AU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?izoBkRVYlpqSRqzl4MV/a3Wf8Huih7T305bP2FK9A1IarmZf4xzIv65jxb00?=
 =?us-ascii?Q?vT3tSMSPm2tTVUNQT/R59adS8EwdNDchfLW7uea1GRRJpQ1ZdRb4GVJ+MBjy?=
 =?us-ascii?Q?ZpCn8ypL4M2bgoMSDnDFXa1aAeaOhjRjvH4djVzPlcxHj/CzBzBRIyWS8mql?=
 =?us-ascii?Q?5vvyBpIHyZ00l1c0/MNVzsfKm7HQ+/7bJBQIqqgKlE1tT0R22JBgC9iYNoHs?=
 =?us-ascii?Q?b2sgqlkANw3cYu4b4px2ZicoP5AghY0Ft/Q+gNo4fdu8ofJwrnQMPNLNZtPh?=
 =?us-ascii?Q?eN7Qfml2NzbEBH3XU6LjO3RCZ9232p93ONM4rS7bwLhnRp2In1fa5iSs4x9o?=
 =?us-ascii?Q?HptcAFWfdjlEZsHp0FcuP4fO1JkGzmenkR7SHniqzObhDibhv6HgdDv5Gd7v?=
 =?us-ascii?Q?8cumHRneDam5qrZYHLLywe76iTuEvWLyI+V0ldH++3Cztw+EabpB2DgtvlpF?=
 =?us-ascii?Q?gRFQ4VpEWJOXLdCSdbRSdmrcQOFSGscS/VtQ9prgR0cNWUB3xQd1mq2SMx+l?=
 =?us-ascii?Q?KGYnDTdz9xKkJbyoyi3P8XoFQ740Mq145oguKNq0ctvvH0jhK5cN3wzYIFPJ?=
 =?us-ascii?Q?1xdjkvDo/iaITzQ+njtyR4GhpYqAldcA6FkiNNgKtpd22BLaMJnA7expIBbh?=
 =?us-ascii?Q?IGf3o5FAJtLLM2SBtsPo5KlVJAUGADEXskxTd/Hxrq90LMq+LnyfrinP4FjG?=
 =?us-ascii?Q?ovDXQzqdc4tRy7UWq1CMffF54o93B6P/wU//BWGxkXrqKSMZqVmGkxgNAyGV?=
 =?us-ascii?Q?8DeIpYwrHx9xjanlOx2tt0qdShFCodDrMO4pWzqH2gEiTyu5ykMcSMAdxSJy?=
 =?us-ascii?Q?gWJPzJx477eggRPCGOQrkBj+ksrHxiIFtpTWP+YZhhc3u0/sp2H3kMbVWAQl?=
 =?us-ascii?Q?797WY2MBCejJi25Eczw6HcuU9P7w4ip27WRCid+q1Me+tInZacof+ELZBwNm?=
 =?us-ascii?Q?P9+aSoSEax14RtDNSqBZIRcA3cyBiBN+VN8ejqK3fQZ/9MB8R5Fi2LPkt8Zu?=
 =?us-ascii?Q?JuBFqnIGqYlrNlTdOudhvORbtJ+ASECKaBTPlwA/OvW7MJ+ma2K4kZr/Znz/?=
 =?us-ascii?Q?j0iSmBMtn9BIUZy5figUQrsfRpAB2LJmnURg9BbYvviIqDlogMyY//byigaf?=
 =?us-ascii?Q?PEva9DBrx3zE2l3W/q3dOBX8ze/t6+vedKuBbd9+ZBApu92PM4MH9Drg0uoC?=
 =?us-ascii?Q?tT3LOt1Kc8JpK9rqub4K0nTGt48tx907Dj5HoXKZNPBVLYZT5cHIu/ctdOfM?=
 =?us-ascii?Q?wwpt1XCb7D+9boERq1ta9GK+QnwomfQ6jMxqGrtCaK8F8tBIP/1738Hnu9XW?=
 =?us-ascii?Q?C2arueouLRSc7JNfbRrgBZ1CoVgbSXgF/zuJZb/KFVyodv+kX1G9SteIAeLv?=
 =?us-ascii?Q?JstRz7iFGWfGb3lV0gx+ML/+IY3Jma/MAqbtXyI/msxV0WfQCvIkLjIBg2qb?=
 =?us-ascii?Q?jinhfBew2SKr+DzoI16BfAmzO3+1ek9I57sQ4xZy5R6WWh6yuBo/Jgomhtr7?=
 =?us-ascii?Q?//Zas9Y3D/YYOA1P/C3JpbHbeXg39V30LSom9/jEe2sCudi9Dp6xS9HH4kOK?=
 =?us-ascii?Q?gOVUu9IdUoXAKhunFI5PvJHHC/DuyOIVyKt5Fn0z+7VMdGLuhC5Ul3dHoAu1?=
 =?us-ascii?Q?Ut0EIrGSjmppFfyQ7rGJHILGsRDFIm5THCXCNKbkDv+8Lso0dVSNyqqjq6nJ?=
 =?us-ascii?Q?vGHG2PSN+zSLo96mzVW7wh+wj5lpDz+M6yrBzSWd1Py9jnjR9NGpVhyerRx4?=
 =?us-ascii?Q?/OP0thPFKreNU4PRWLc9S2yW92IUYQs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mZpvWajFarba8Y4sxt4KcQJ5iZrOuUfhH5Amdu2+o8s2rR+rpLqs8NBOP5jCNMtkUfMBG0ftRuR7udwW7cdXH/IsgDJVYF7wCYTFVRkyi0A5bvCdq3N48eQ7kKYPmt+Jh6nrnkByFwNrGFoThvK+bJz62EcxjHMkulOoPZ49sliue8diPGyPv+euSHbD9okVUj/qsCMNpv2DWO62/i/7WrOsH4NyzZqQQkGyXEMAtbqLcE2qs62xAilho8m23BAJYFUgyetV9EL/Icmvpqe9V06dkYUSnW4bZNiXcKne+qKAULq36fXScsAdqgwMvkqNDvu4/j8WoYPeY3bUndgL9w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900ab4a7-c872-4053-337d-08def933e76c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 12:10:45.4007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1e5aqKNPwuWlU3fyJyLluzGJBVMzx0lpiR9jiOmQXttmOyJohe+gRyz+fzKCefvlxW6mrVRjltp+/iLqva6Lru9KDSBF+DUsizKe4q43H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mich=
al
> Wajdeczko
> Sent: Thursday, August 13, 2026 12:45 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <michal.wajdeczko@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Iddamsett=
y,
> Aravind <aravind.iddamsetty@intel.com>; Koujalagi, Mallesh
> <mallesh.koujalagi@intel.com>
> Subject: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error usi=
ng
> SIGID
>=20
> Report 'Mailbox failed' error using xe_log_err() helper.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: say xe_log_err() in commit msg (Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.=
c
> index ccc3bdeed6bb..014632e11338 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_pmt.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
>  #include "xe_pm.h"
> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  	}
>=20
>  	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> -
> +		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n",
> err_str);
>  		return err_decode;
Hey,=20
Could you please merge patch number #25, #26 and #27 into single patch ?
Or is there any thought to kept as separate. ?=20

Regards,=20
Dnyaneshwar
>  	}
>=20
> --
> 2.47.1

