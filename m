Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7B9C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D623F10E300;
	Mon,  5 Jun 2023 17:12:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37810E300
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985127; x=1717521127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4mvge/bFlOwW+f1SoBTNP3vwo21rMrBbThh+QDif0f8=;
 b=hRWyVETL+9p07dEMR8c9+Meq7hbQ1hZATrDZd2pk7lLAAjGQ90J3DfGp
 UG2ck52ksXEQIpXiIZXqZl6cC/5cqKyvKLEUnOY74gkDwkucXZa2L7xCq
 +SzuChUbSDSq71lN31ilaD4HhK5P7+iU4f4I4qfTmFPnxoBONcEPV6vh7
 mTJAwY+zrQT19XT+FZvTGDoJ1YINzC9K7sA07O3NlbveCIHlhKppaRvDL
 59z+0vtTdSUZ0mGX/I2xw8yNIDYmYT1k9jT7vO5sWEMRkdQHNbf1q1tLQ
 Bi8ZPNDBOeawkerxfxL5LTED5cBNGKB6I3lpdSbqPO0l9aMjPm/WE2q9f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336044212"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336044212"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="832884874"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="832884874"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 10:12:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:12:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:12:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:12:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPjkUgWUVrxx7LRhfw3Np6jFJ65KpndeAUvujSmsVeAUOGlvgfK1f/ApfXzBCCDB9dUizp7pUXJJqFJ1ShShloSsRU3IrUW9+ZMMJDfi5xdfFGfXoFGUDl+2NGIaOpn0LUqZ5KvVRM6SAlIfIbIG6cWKghiT7pIq/fuUkimUd1xOkjJPmSlMSI5MsDyNjjrx4XXIBQKVrIDt3cFCW1KAKwm5lZFyGaCxvB7zCt/fvhVxKA/t5qVVjc1qoYm0HJoQRvNfIzxyyY4fl1gmuZZ/ka14q29BZpv2XVJ1Q6VPwqRvngUV49L8jVIR+DSpDMUZ0Yi2vbg8B45iC/OzJC91zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW17fE0PT/2kdsW0KPnST6tmf1QGx6SnGX9N0dc8Th4=;
 b=D9VR7/XvvdnzQzLACNjL+/1jFQW6tqRXj6vN3LpUAO8MVIBFRoXsOlShjQI+5NvVuQ/vMdWP5uwWFQxadEgvYV4EbbQFVi0oT4+caKiTmD1DNw9FYF1kYNoN5cHUatzc+o0UbfRc7qAn/qknWYk/NPc3KseM9glumSXwThNtCmTId8a4AlQlZAnz8crn6cSa+iNMCaEmXscso/FyXrPNp2aBXhT5H9/MlVVNIWwoWcu3N2rWun7KKQUbi2aQr2zVAzwwXm5FIDL67/Uexa1XlIAlKfAJzZEyXKqKZMqin/UH99OZ0O8uwxv0N59vxiYWE2aKd++DX6KvmVZofkXbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:12:02 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:12:02 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [PATCH 1/1] drm/xe: REBAR resize should be best effort
Thread-Index: AQHZl8k7WDYoe0Y08EKajcinUsyL6q98aU2AgAAIqvA=
Date: Mon, 5 Jun 2023 17:12:02 +0000
Message-ID: <IA1PR11MB6418A92D6C0788C582BC0E7DC14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
 <20230605161705.3680031-2-michael.j.ruhl@intel.com>
 <jfljng2ueacz4z3ppupaiwoyyvad3klaqpigxsrjoswbzwfqfi@e2zur54udxtz>
In-Reply-To: <jfljng2ueacz4z3ppupaiwoyyvad3klaqpigxsrjoswbzwfqfi@e2zur54udxtz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB5831:EE_
x-ms-office365-filtering-correlation-id: 36113f34-7066-4939-c726-08db65e7fb05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5BRwyRrAKsOv36jZvh0nn3VSHsxsaLdIu78U0y5eUpXWkN3DEC5yeoVBYWRfOB8sYQV6TGwqpHOBgOjuwgyKhyt6CkfU6vANDxdOxWPTH6JA2vnYz3S35GstA2cDKtQp87F0+OebVwg60Qt4Dg+igez8xTZjqocPd7y85MXv2g+LLFfzxGsMoGakylhWA/OpGvOY8nzjE2IE5CjUOpY2lBYzAgaklIvuKhaKSJzz8aDCcciq7KEM1BMCUEaddUKku3wudxiJPrKdSsr1wCh2FnTICoSgJm7FXSG/3OYkY0CDUR5V2pMrDbAT8jIlwdC5xWda6Yg2LMP+CT0CkzMIL4N3ylXhCbBw9wWOyxz7QnmpvG6c+Ese7c0N7Q62xL8k2EMCIhsBIYzHhQJWcx6zJMHGXBAR8bJSc7zVlUJIsweQ4OSk9YMljHkrYY9C7JpUDmOz/1kCJZNgemUvNZVb24CwmWaRWZbXiMICFhLq9Se/U5iViawQK9153Z2O0bZeVzV2MeDJbmuY2KH03ANdS4iqpYLYlSTh4XQfOqkAsGBykP31krM2ibDT8BIkZYA5nGUrqbumtdB9OAgHLHZzdjv94s/SwR7C5+D2YawCgLSisQ4lkpblIcoJqNBLTp6R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(66476007)(76116006)(66946007)(2906002)(478600001)(66446008)(316002)(64756008)(4326008)(8936002)(8676002)(6636002)(6862004)(41300700001)(54906003)(66556008)(5660300002)(52536014)(7696005)(71200400001)(6506007)(26005)(9686003)(107886003)(38100700002)(82960400001)(55016003)(186003)(83380400001)(38070700005)(86362001)(33656002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VfVOevEHbRYG+CD/DyjX265X4k8A7UezajYA38SLXb5mvPxzJfCTAQCn5ZlW?=
 =?us-ascii?Q?18n9DrpZmqxVb02Q8sCwKCqClZdhNWN3e23wfciGjNKXT2kVZHCF9R2SJMyA?=
 =?us-ascii?Q?OVDnwdtz27II7hXztYWcFoqxJdrfJkko2SY/rdiRH6G/TNnBGV1lprkaknht?=
 =?us-ascii?Q?rVQrYKTNHXFfDhtlaMoCA++RpYyfefvQq7PIuGeuJTE3k49FpNlwA7gB2oNh?=
 =?us-ascii?Q?bvPmG6dJePocxrcbsaaPzSInj2SyJS63Z5R/tOEDQGjydCw5aiCnQa5WnrkH?=
 =?us-ascii?Q?J78QLxe8R7IqvikctUJieo4kOedTjY9BjCOWgJdv8PwycHd2oD8iqs2dXRNb?=
 =?us-ascii?Q?A9FquovhsTLkG2CY56NuhXuzyxVFV79WakYJ0PtB0VletiMqUZ+UiJs5isYX?=
 =?us-ascii?Q?B2VMewyXVuPyAj/Cv8lpelI5sHt5mWBtVXefY7vN733DlhXeI1xSARhejG22?=
 =?us-ascii?Q?pv6fvxOzjkofW13vwDO92AOTKiVbGOY2I5jjI4xYMMJqNUSnHSSv9CC3XKNn?=
 =?us-ascii?Q?Ew4H1xx2dHQmLUQSoMhT0HnuPdGZ88AeqvBDMho+OrIfno3zWnYPGi25fzxU?=
 =?us-ascii?Q?7vuc2eMeLb+jarSNsBZMBUqXpeBTYibPYzOnNWWFmmgVbuPWMLwedmYS45zM?=
 =?us-ascii?Q?XUEEDo6Maqu27qxyVExCdN2IzomCxBmBiy+Nv/vhI/6v7LywMPVHCAhKkak6?=
 =?us-ascii?Q?D/KniGpmSh/1iAAoMt+BamZsrs2kjb1FoQQwqbi6oMap0cKL6z+vxgfijy21?=
 =?us-ascii?Q?1k3ppypO5NZ7iP4cvi0BEA3Lt1qZVcM4bIT1Gw+5cyUAbS1tb6JB4ovnM4sd?=
 =?us-ascii?Q?3LULgEdPeixVIu0c3DR04DE3e3YjDHE9d8yaYCmgLWyCvo1JUkbhg9K2Pldk?=
 =?us-ascii?Q?GnAO9ssXiNn6D5y3/2jg7eNf/m77/csULmT2nSUaSdnXamPeMvfgZMPZCiQm?=
 =?us-ascii?Q?xoUJN1FNDFxw6cKcSCSWov4gfKUCydeRIE+Lg/S7xgYOHu8WusC1guPYX2zi?=
 =?us-ascii?Q?MvLYAgeC26xHrNv9r4vZ+bjhqk2P0JnhRVasamTaAnTYgT8Ai6Ed3q7HCSxv?=
 =?us-ascii?Q?+YBwp/mvvuTW2ptmAtijsJDboCK8mwCGS9LnPeZI86y9QI49bzqpGto2jIS7?=
 =?us-ascii?Q?zuu/Dsd2JSgDf+v7g0LXwOWNvZMHdbR5hs5E4tlDGkgd+f9rsHT7vrteqIsa?=
 =?us-ascii?Q?TmrxtDyEdzh8EQsqPBTgIUm+oZ4fQBK1jcJYYr+iQhpAuhQe3HxHFCIhwo9/?=
 =?us-ascii?Q?+hBPL/v2J9jnmegwNIqUCmaX0ANLdhj7DRKAZcE7Kop6UWSO9Ou8yt/QrMHW?=
 =?us-ascii?Q?NXGjaBKwBbULrdxhOWvuuI8zzIgXxn3sKHIkrKlR/NWERazkXEqG7WvcOEDK?=
 =?us-ascii?Q?6XaHpG+1jfw83GbuA6PnoZDR6H70FvSUPE8OyYYf1rAJRoAos0gKz45Rny4n?=
 =?us-ascii?Q?MIDyHa8kiocneFp6eHPmlTF+bjOexpwjK0pLMJn+LROEhYvz6QeTp8KsuMwT?=
 =?us-ascii?Q?Dmr/Hm139LBhLojhTRuBrWHzQANg1mxOhqe36fRuVIydvR1mGiUsvaDYpYVi?=
 =?us-ascii?Q?/TxQv4wm30WYgeTKq588Zln0/3heTcexm4mjDToh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36113f34-7066-4939-c726-08db65e7fb05
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 17:12:02.5814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVgADu5gvl9XBGPz3rho/Zd+AXRuCGz/EkXlfN2pTew4QZjwZgjur4XeDBNTrTEyz3da3fX5CdKUpMZkhGViME2f6mHGFmjeTGDxG9R3tvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: REBAR resize should be best
 effort
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Monday, June 5, 2023 12:40 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
><matthew.auld@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>Kershner, David <david.kershner@intel.com>
>Subject: Re: [PATCH 1/1] drm/xe: REBAR resize should be best effort
>
>On Mon, Jun 05, 2023 at 12:17:05PM -0400, Michael J. Ruhl wrote:
>>The resizing of the PCI BAR is a best effort feature.  If it is
>>not available, it should not fail the driver probe.
>>
>>Rework the resize to not exit on failure.
>>
>
>I think this deserves a
>
>Fixes: <commit that regressed this>

Makes sense.  I will update the commit.

>>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>
>with this patch, xe module load works again for me on one of my test
>systems, thanks.

Very good.

>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks!
m

>Lucas De Marchi
>
>>---
>> drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++-----------------
>> 1 file changed, 11 insertions(+), 17 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>b/drivers/gpu/drm/xe/xe_mmio.c
>>index 475b14fe4356..f7a7f996b37f 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -47,7 +47,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>> 	return err;
>> }
>>
>>-static int
>>+static void
>> _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>> {
>> 	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>>@@ -61,18 +61,17 @@ _resize_bar(struct xe_device *xe, int resno,
>resource_size_t size)
>> 	if (ret) {
>> 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe).
>Consider enabling 'Resizable BAR' support in your BIOS\n",
>> 			 resno, 1 << bar_size, ERR_PTR(ret));
>>-		return ret;
>>+		return;
>> 	}
>>
>> 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 <<
>bar_size);
>>-	return ret;
>> }
>>
>> /*
>>  * if force_vram_bar_size is set, attempt to set to the requested size
>>  * else set to maximum possible size
>>  */
>>-static int xe_resize_vram_bar(struct xe_device *xe)
>>+static void xe_resize_vram_bar(struct xe_device *xe)
>> {
>> 	u64 force_vram_bar_size =3D xe_force_vram_bar_size;
>> 	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>>@@ -83,14 +82,13 @@ static int xe_resize_vram_bar(struct xe_device *xe)
>> 	u32 bar_size_mask;
>> 	u32 pci_cmd;
>> 	int i;
>>-	int ret;
>>
>> 	/* gather some relevant info */
>> 	current_size =3D pci_resource_len(pdev, GEN12_LMEM_BAR);
>> 	bar_size_mask =3D pci_rebar_get_possible_sizes(pdev,
>GEN12_LMEM_BAR);
>>
>> 	if (!bar_size_mask)
>>-		return 0;
>>+		return;
>>
>> 	/* set to a specific size? */
>> 	if (force_vram_bar_size) {
>>@@ -104,22 +102,22 @@ static int xe_resize_vram_bar(struct xe_device
>*xe)
>> 			drm_info(&xe->drm,
>> 				 "Requested size: %lluMiB is not supported by
>rebar sizes: 0x%x. Leaving default: %lluMiB\n",
>> 				 (u64)rebar_size >> 20, bar_size_mask,
>(u64)current_size >> 20);
>>-			return 0;
>>+			return;
>> 		}
>>
>> 		rebar_size =3D 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
>>
>> 		if (rebar_size =3D=3D current_size)
>>-			return 0;
>>+			return;
>> 	} else {
>> 		rebar_size =3D 1ULL << (__fls(bar_size_mask) +
>BAR_SIZE_SHIFT);
>>
>> 		/* only resize if larger than current */
>> 		if (rebar_size <=3D current_size)
>>-			return 0;
>>+			return;
>> 	}
>>
>>-	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
>>+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB ->
>%lluMiB\n",
>> 		 (u64)current_size >> 20, (u64)rebar_size >> 20);
>>
>> 	while (root->parent)
>>@@ -133,17 +131,16 @@ static int xe_resize_vram_bar(struct xe_device
>*xe)
>>
>> 	if (!root_res) {
>> 		drm_info(&xe->drm, "Can't resize VRAM BAR - platform
>support is missing. Consider enabling 'Resizable BAR' support in your BIOS=
\n");
>>-		return -1;
>>+		return;
>> 	}
>>
>> 	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
>> 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd &
>~PCI_COMMAND_MEMORY);
>>
>>-	ret =3D _resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
>>+	_resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
>>
>> 	pci_assign_unassigned_bus_resources(pdev->bus);
>> 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
>>-	return ret;
>> }
>>
>> static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>>@@ -163,16 +160,13 @@ static bool xe_pci_resource_valid(struct pci_dev
>*pdev, int bar)
>> static int xe_determine_lmem_bar_size(struct xe_device *xe)
>> {
>> 	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>>-	int err;
>>
>> 	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
>> 		drm_err(&xe->drm, "pci resource is not valid\n");
>> 		return -ENXIO;
>> 	}
>>
>>-	err =3D xe_resize_vram_bar(xe);
>>-	if (err)
>>-		return err;
>>+	xe_resize_vram_bar(xe);
>>
>> 	xe->mem.vram.io_start =3D pci_resource_start(pdev,
>GEN12_LMEM_BAR);
>> 	xe->mem.vram.io_size =3D pci_resource_len(pdev,
>GEN12_LMEM_BAR);
>>--
>>2.39.2
>>
