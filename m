Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E81C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B5F10EEDB;
	Fri,  8 Mar 2024 05:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vb5TfW1H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDE410EEDB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709875129; x=1741411129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/S8ITQh6Mftq5ibVdia/6E6AtYZp/19CzdQM04q/eZU=;
 b=Vb5TfW1Helmyo1QInKb6XbH1XKYzvKG/VQ42ZfFjXF9bufqZw7BKBi3o
 7cYrfuzz0azNjaCtYiMMg4kYF0E6t4HgE79fH8uAOiaiPbY/dljN3O006
 UPfnxwu5+DxG5FuidWqXqBObS7zGkUZfYwZmRE3R/PugBwEXlLglns1zE
 3Coxe7wZZbKcDuniAx0/fmbzagn1YPMg6NnFttMMIMoyprxb2VtMkkvh1
 dQETRz/8BYqSFAK0RqXFZqOLA3IheewLayvEW+5VN1dPpbuULEtB2tebC
 RonV2pfdoHBFW3IRPbrcy9cVJgYOdPP2cXlJvHoXBREhsB+EUg67YSxJP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8402209"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="8402209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10452971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 21:18:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 21:18:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 21:18:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 21:18:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 21:18:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDl7QUf0doEqEnvlk0aUlA29ktnKDp9Hc3L7VeJEJyzhTieS2RdTXeggCqER/kD6miZjFhBUlq4mQf1rYviREHNtbL9N2TTFII8yZx7i3OYPDeJ94/uAZZW9cE6AGWILdOoj4wxlX4owrgelWo+vCrbvG6h6VBupy+S/TWG5NS85iBxk6c1enGTF6WPmJ8gu32e4IZtR+cgML03roqxaa9Vl9AkrB07guCh4z9a25R8Zz26Wfc8uIwjtyhSkOHwO0UDRFu0J4wVCRHz8vjo66tcL6IYW3p70btIWyk5mWbK/UD0Z9bVXk47z4LYGkELZTuDzguK9jABEkDtq4bqHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh/i2R0hjlvyesUp4MSup+Ss0Iv7+fvPcLUg/KgQzT8=;
 b=BAswByIimqbaIGM9bsC3z8/8oGFxTSttQ+wzTuj60QwDezgYRzMtLKVFn/CWF0ao1Qwq4278s3QVkiaqsbxGR74117c30vBwZwZ7vljHskY6nwbesmMK+M5kMIb7qX3Xd202CBF3zd+RFLrfToJd0J0oW4l/lv6lwSuoKUSzqn2mzI/OuFDG0sHFFvY6LkIDvL4gts3kSZYOpLUhAvaFdYxmqXuGeaaU0/HA7Vg8vszIJL7qAuKVVmlfF6UpUggVm8MiJA+lWIs/b+Z5+n5aFSe5FnLVkDwTUcei70uJ7gfCYfwwtaULVrx4+1ru+a6/zQ+8rJMFPM8yKX0oPnNp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 05:18:44 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b%5]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 05:18:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Return if kobj creation is failed
Thread-Topic: [PATCH 1/3] drm/xe: Return if kobj creation is failed
Thread-Index: AQHacRBt6hZoDmcsi0mklHS6NSSLObEtTcMg
Date: Fri, 8 Mar 2024 05:18:43 +0000
Message-ID: <SJ1PR11MB6204355DEE8DCF521B14393981272@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308043651.2010165-2-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: 6492540a-d9c1-4a15-7a90-08dc3f2f3969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6VZQht9joviRf8re/U/igu5NaO4L8VIABEGRq0pos/RRueWqWY6oyxoiVt8tnsSpleNluB608vi2ZdYuzwnk6fOKqBGnhZoN2kh/RCCB+HwVEnOmjITDymEd9ZZqJUIAILmz/D+VjP1NiMwEcj/FdYDEek6yteY8sW3lnGFyxaMiehdgxIp8fi0aK2uw4rDlGZ+4e8m+toWM1Emyf1MnmTdZ5bU04X4exPXNNAtrTmY3D4TSSTAWBtIK89p25Hmtt5lEUBOpnwBCud6s1pz4nvunp7rk5lTSL8qZLNXNewLBuTUceQXe567OFd2scEj+m5aO4PXCoLwJqcI0KDVo4T9F4dE/hdbWXf/4SD7n3YAXkpRPj8gk6NhwbwaVvMLgbigzg3/4jmGZEyagwTxd7xhzYyB13LzZ/RiGDKa7xBq0MxRCNU8BsetQsSFqYISAY234GtEy3BKSweeOhVR8zH1IyDRmYF3znte7sGZsGbdzW4M6SpHA2/v/34fRkOXU95yHRPmoV6N/0FQYTcmSm+8wFA7V3XO+x7oCpOAE6UD39PD6fe1wUktT8RZW4D3E3n7HRQvsVsK9obeGFZvmHUqHRoApRZo8O59Nv43z7m04wgSqhu0gagOsQ7qq/zr/uW4NOPZy0jTfhmffZnGUrF97jNRAX7L2Z9CLAYXupO3BOvnOCa5bK+UZsxvynGFSkzHB8YOnKsRV0GhDp955DYU73S+Hx8wuKB9OpHPfhys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/htYwmgNZOsBxpotFuSQQHIqGiBEqwNtuFhoIYerUKNwvHRqaxnzwTYI+sEz?=
 =?us-ascii?Q?9kH4VDHwh/EOogmDHA/NCGJ00fF2mT+lX+FVXAa1zh6k8n2X2B499D2J7x3V?=
 =?us-ascii?Q?yh5m2BpGfQXs/7Hcu4sIpeOYdHN1tEfcJAdXqyn/iE1uQk67p07Wpqm1z/IJ?=
 =?us-ascii?Q?vIvIOMTlimqB4rr9ztDCIxBRtX7nAZpNnrx6xG8/e5te9Zu71Cr3V3C1GaHE?=
 =?us-ascii?Q?lE3cBOi4yNiBFq9sw1vuz2mlcj403C4uunpvVqSePjH+Y8wFyZcoU0ZbCr2u?=
 =?us-ascii?Q?agApZxdRES1G8IMoCxvep0e34TJmk+yUErBX/DzpM+wS/HfN4rsm7JeiePYy?=
 =?us-ascii?Q?DahorhFNX95n7yMoVNShSAwnLdFKZWlxpNFwXw3AsD92ixopCcd5Zlu1L0vL?=
 =?us-ascii?Q?0/L+qae8SfiXseMST8DAHNf4JtW2NZ4XyWPyGCsISPqbd7E4VIX2CEVh/gkH?=
 =?us-ascii?Q?9Tkhnb30w8QqDMB09RtyREMf3u45mT01MimEusri2S0Fz9wJvPHpGnv6tjzc?=
 =?us-ascii?Q?soLXVA/KoTL0+XiPgeH8m+HzxvlkxEhpG4ab8IbdXU3HRJiguHhluaYhTCC4?=
 =?us-ascii?Q?qf1Ucf+Z58OzPfnkh3gDDIvvOwoY7DQvaqlgVuP6RLa/dSUYmo1MuWtELYiT?=
 =?us-ascii?Q?mtzZtgXCKkM0PZU7jq4PzJ5eeHRfbji2h/o2IIJVQjSB+HreSH+a39Y+/fD6?=
 =?us-ascii?Q?dynzF8WtKz4F/zAx2Fu5S6EHhoIKxsXuLGgiDZWReIxweGMEFzYgKrGBs2iy?=
 =?us-ascii?Q?c2NK5tvD/HeiKl0qBuBifbstSy20kfvH6QSx15VoAa8bKs68eNaMUpZTqZ/l?=
 =?us-ascii?Q?x1PAcEbb0UEZmVpbd1RajFqsbzc80/ZuqIUq7IVqLpkeY8u8Al+m+thPHFMh?=
 =?us-ascii?Q?uOErwOseNAp5TLMaF1RwOshMl+85XX1KlTxFzBsMcvpvghuzhPjkt3DI8CXZ?=
 =?us-ascii?Q?lAMHf+1o4K1xpIWbvnxp+iEXh34m+QyIk8q86YJDjRDQlNeYXdzlehI/5t4J?=
 =?us-ascii?Q?A163uo34oP4OgHnl3VWf5B9+gRZZgz/p7vduxzVx/iyCdQufhnKq2vKWEM91?=
 =?us-ascii?Q?5NK7flulTBMRoxjJbNZOpWA4iG+Ik4yWfaopYPt57uVYI+HK6OtvNqtV3q3P?=
 =?us-ascii?Q?7MlrlWbMHoe2RVW9HpDKm2GHAzUe3r95fvM7qmkWEzbEmzG5cKfredu3OTJ+?=
 =?us-ascii?Q?uUIlYnP3uRznDV6m033m1bKRZTgdjtUdUPcfcI8D6J1pL9c74C7PMOF/Hfbv?=
 =?us-ascii?Q?YKefMjwON1S4YnJEvbllFJl34t73kDyMIDLM9M1DwMe6pDau25EcZ7iTCi2z?=
 =?us-ascii?Q?+fGaHUaIws2ZmPp8VXYsjQ//kkdq7/1PJDJCk1OuCsflaGXIzTrGGBBbq8em?=
 =?us-ascii?Q?yzgYlz/Rymuo61w9qcp/E74jl0eGWuwseAxDck32ouUzQpfNC1oTRN7k0v85?=
 =?us-ascii?Q?WJeqFj3Rj/PemDTFuGCQLHO2oC3J2ryQK4XYCka7cSYNLL+h64fW3A56V08g?=
 =?us-ascii?Q?2PrgDAOUZgHv7PsQ7UNgcrlIX6VkJ8Z+3WRA5bAxpLE26WAqsjP/6hqFso7M?=
 =?us-ascii?Q?qZJ79Hn/s3Gvd90Hrw3hnf5LTNMZrHJ+ibUyRDFmnHY+ExyNsIubfuD+Gbil?=
 =?us-ascii?Q?XJM5cplirucr+X1Hy1+mNQw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6492540a-d9c1-4a15-7a90-08dc3f2f3969
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 05:18:43.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FK9NmX7cCl3tqniZzG6om2VTFq+dprX+t82tUzGS/Tf9oLwJL35zzP0dADtWwQxjVHIW/NWekeRgCJZZjvejfOBACdnKnG5rlr7xWMBUzYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, March 8, 2024 10:07 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Sundaresan,
> Sujaritha <sujaritha.sundaresan@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>
> Subject: [PATCH 1/3] drm/xe: Return if kobj creation is failed
>=20
> Return after warning regarding kobj creation failure.
>=20
> Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vram_freq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c
> b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 079cc283a186..c5f6b5a5d117 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -111,8 +111,10 @@ void xe_vram_freq_sysfs_init(struct xe_tile *tile)
>  		return;
>=20
>  	kobj =3D kobject_create_and_add("memory", tile->sysfs);
> -	if (!kobj)
> +	if (!kobj) {
>  		drm_warn(&xe->drm, "failed to add memory directory, err:
> %d\n", -ENOMEM);
> +		return;
> +	}

LGTM, had kobj not created this would have thrown crash in next line of exe=
cution. Good catch.
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	err =3D sysfs_create_group(kobj, &freq_group_attrs);
>  	if (err) {
> --
> 2.25.1

